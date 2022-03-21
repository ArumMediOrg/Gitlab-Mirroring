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

		String MARK_CD = htMethod.get("MARK_CD");
		String MARK_SQ = htMethod.get("MARK_SQ");

		//
		if(MARK_CD == null) { MARK_CD = ""; }
		if(MARK_SQ == null) { MARK_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select a.emi_item_cd item_cd,
       f_item_find('', a.emi_item_cd, 'K') item_nm,
       f_item_find('', a.emi_item_cd, 'S') prnt_nm,
       f_ocs_find(a.emi_item_cd) ocs_cd, a.emi_rslt_up item_up, a.emi_rslt_dn item_dn, a.emi_use_yn use_yn
  from et_pack_mark_item a
 where a.emi_mark_kd = '3'
   and a.emi_mark_cd = :mark_cd
   and a.emi_mark_sq = :mark_sq
 order by a.emi_sort_sq

		*/

		sql = " SELECT A.EMI_ITEM_CD ITEM_CD, F_ITEM_FIND('', A.EMI_ITEM_CD, 'K') ITEM_NM, F_ITEM_FIND('', A.EMI_ITEM_CD, 'S') PRNT_NM, F_OCS_FIND(A.EMI_ITEM_CD) OCS_CD, A.EMI_RSLT_UP ITEM_UP, A.EMI_RSLT_DN ITEM_DN, A.EMI_USE_YN USE_YN";
		sql += " FROM ET_PACK_MARK_ITEM A";
		sql += " WHERE A.EMI_MARK_KD = '3'";
		sql += " AND A.EMI_MARK_CD = '" + MARK_CD + "'";
		sql += " AND A.EMI_MARK_SQ = '" + MARK_SQ + "'";
		sql += " ORDER BY A.EMI_SORT_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Mark_AlvMarkSelectItem_002 \n";
			G_INFO += "설명 : 표적묶음 검사항목정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MARK_CD : " + MARK_CD + " \n";
			G_INFO += " MARK_SQ : " + MARK_SQ + " \n";
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
		<s:AttributeType name='ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_PACK_MARK_ITEM' rs:basecolumn='EMI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='PRNT_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='OCS_CD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_UP' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK_ITEM'
			 rs:basecolumn='EMI_RSLT_UP'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_DN' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK_ITEM'
			 rs:basecolumn='EMI_RSLT_DN'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='USE_YN' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK_MARK_ITEM'
			 rs:basecolumn='EMI_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='ET_PACK_MARK_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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
			String ITEM_NM_T = cRsList.getString("ITEM_NM");
			String PRNT_NM_T = cRsList.getString("PRNT_NM");
			String OCS_CD_T = cRsList.getString("OCS_CD");
			String ITEM_UP_T = cRsList.getString("ITEM_UP");
			String ITEM_DN_T = cRsList.getString("ITEM_DN");
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

			if(! ITEM_NM_T.equals("")) {
%>
		 		ITEM_NM='<%= ITEM_NM_T%>'
<%
			}

			if(! PRNT_NM_T.equals("")) {
%>
		 		PRNT_NM='<%= PRNT_NM_T%>'
<%
			}

			if(! OCS_CD_T.equals("")) {
%>
		 		OCS_CD='<%= OCS_CD_T%>'
<%
			}

			if(! ITEM_UP_T.equals("")) {
%>
		 		ITEM_UP='<%= ITEM_UP_T%>'
<%
			}

			if(! ITEM_DN_T.equals("")) {
%>
		 		ITEM_DN='<%= ITEM_DN_T%>'
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
