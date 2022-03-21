<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtList = null;

	ResultSet rsList = null;

	CRs cRsList = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String SOPTN_CD = htMethod.get("SOPTN_CD");

		//
		if(SOPTN_CD == null) { SOPTN_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select iim_item_cd item_cd, iim_oscd_cd oscd_cd, iim_knme_nm item_nm, 'Y' use_yn 
  from it_item 
 where iim_item_cd in (:sOptn_Cd) 
   and upper(iim_use_yn) = 'Y'
 union all 
select epk_exam_cd||epk_pack_sq item_cd, '''' oscd_cd, epk_pack_nm item_nm, epk_use_yn use_yn
  from et_pack 
 where epk_exam_cd||epk_pack_sq in (:sOptn_Cd)
 order by item_cd 

		*/

		sql = " SELECT IIM_ITEM_CD ITEM_CD, IIM_OSCD_CD OSCD_CD, IIM_KNME_NM ITEM_NM, 'Y' USE_YN";
		sql += " FROM IT_ITEM";
		sql += " WHERE IIM_ITEM_CD IN ('" + SOPTN_CD + "')";
		sql += " AND UPPER(IIM_USE_YN) = 'Y'";
		sql += " UNION";
		sql += " ALL SELECT EPK_EXAM_CD||EPK_PACK_SQ ITEM_CD, '' OSCD_CD, EPK_PACK_NM ITEM_NM, EPK_USE_YN USE_YN";
		sql += " FROM ET_PACK";
		sql += " WHERE EPK_EXAM_CD||EPK_PACK_SQ IN ('" + SOPTN_CD + "')";
		sql += " ORDER BY ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Each_AlvPackSelectItem_004 \n";
			G_INFO += "설명 : 묶음옵션 항목정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SOPTN_CD : " + SOPTN_CD + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>200</resultCode>
	<resultXml>
		<xml xmlns:s='uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882'
			xmlns:dt='uuid:C2F41010-65B3-11d1-A29F-00AA00C14882'
			xmlns:rs='urn:schemas-microsoft-com:rowset'
			xmlns:z='#RowsetSchema'>

<s:Schema id='RowsetSchema'>
	<s:ElementType name='row' content='eltOnly' rs:updatable='true'>
		<s:AttributeType name='ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='OSCD_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_NM' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='USE_YN' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String OSCD_CD_T = cRsList.getString("OSCD_CD");
			String ITEM_NM_T = cRsList.getString("ITEM_NM");
			String USE_YN_T = cRsList.getString("USE_YN");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ITEM_CD_T.equals("")) {
%>
		 		ITEM_CD='<%= ITEM_CD_T%>'
<%
			}

			if(! OSCD_CD_T.equals("")) {
%>
		 		OSCD_CD='<%= OSCD_CD_T%>'
<%
			}

			if(! ITEM_NM_T.equals("")) {
%>
		 		ITEM_NM='<%= ITEM_NM_T%>'
<%
			}

			if(! USE_YN_T.equals("")) {
%>
		 		USE_YN='<%= USE_YN_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
			/>
<%
		}
%>
		</rs:data>
		</xml>
	</resultXml>
	<errorMsg></errorMsg>
</nurionXml>

<%
	} catch (Exception e) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= e.toString()%>]]></errorMsg>
	<sql><![CDATA[<%= sql%>]]></sql>
</nurionXml>

<%
	} finally {

		if(rsList != null) {
			rsList.close();
			rsList = null;
		}

		if(stmtList != null) {
			stmtList.close();
			stmtList = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
