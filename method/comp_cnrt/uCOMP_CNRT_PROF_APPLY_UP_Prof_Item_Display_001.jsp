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

		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String CNRT_SQ = htMethod.get("CNRT_SQ");
		String PROF_SQ = htMethod.get("PROF_SQ");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.ECI_ITEM_CD, IIM_KNME_NM AS ECI_ITEM_NM, IIM_OSCD_CD AS ECI_OSCD_CD, A.ECI_ITEM_PR, A.ECI_CNRT_PR, A.ECI_SORT_SQ
FROM ET_COMP_CNRT_PROF_ITEM A LEFT OUTER JOIN IT_ITEM B ON A.ECI_ITEM_CD = B.IIM_ITEM_CD
WHERE A.ECI_COMP_CD = :COMP_CD
  AND A.ECI_MNGT_YR = :MNGT_YR
  AND A.ECI_CNRT_SQ = :CNRT_SQ
  AND A.ECI_PROF_SQ = :PROF_SQ
  ORDER BY A.ECI_SORT_SQ
		*/

		sql = " SELECT A.ECI_ITEM_CD, IIM_KNME_NM AS ECI_ITEM_NM, IIM_OSCD_CD AS ECI_OSCD_CD, A.ECI_ITEM_PR, A.ECI_CNRT_PR, A.ECI_SORT_SQ";
		sql += " FROM ET_COMP_CNRT_PROF_ITEM A LEFT OUTER JOIN IT_ITEM B";
		sql += " ON A.ECI_ITEM_CD = B.IIM_ITEM_CD";
		sql += " WHERE A.ECI_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.ECI_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND A.ECI_CNRT_SQ = '" + CNRT_SQ + "'";
		sql += " AND A.ECI_PROF_SQ = '" + PROF_SQ + "'";
		sql += " ORDER BY A.ECI_SORT_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_PROF_APPLY_UP_Prof_Item_Display_001 \n";
			G_INFO += "설명 : 사업장묶음 검사항목 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
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
		<s:AttributeType name='ECI_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_ITEM_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_OSCD_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_ITEM_PR' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_ITEM_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_CNRT_PR' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_CNRT_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_SORT_SQ' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c7' rs:name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
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

			String ECI_ITEM_CD_T = cRsList.getString("ECI_ITEM_CD");
			String ECI_ITEM_NM_T = cRsList.getString("ECI_ITEM_NM");
			String ECI_OSCD_CD_T = cRsList.getString("ECI_OSCD_CD");
			String ECI_ITEM_PR_T = cRsList.getString("ECI_ITEM_PR");
			String ECI_CNRT_PR_T = cRsList.getString("ECI_CNRT_PR");
			String ECI_SORT_SQ_T = cRsList.getString("ECI_SORT_SQ");
			String ROWID_T = cRsList.getString("ROWID");
			String c7_T = cRsList.getString("c7");
%>
			<z:row
<%
			if(! ECI_ITEM_CD_T.equals("")) {
%>
		 		ECI_ITEM_CD='<%= ECI_ITEM_CD_T%>'
<%
			}

			if(! ECI_ITEM_NM_T.equals("")) {
%>
		 		ECI_ITEM_NM='<%= ECI_ITEM_NM_T%>'
<%
			}

			if(! ECI_OSCD_CD_T.equals("")) {
%>
		 		ECI_OSCD_CD='<%= ECI_OSCD_CD_T%>'
<%
			}

			if(! ECI_ITEM_PR_T.equals("")) {
%>
		 		ECI_ITEM_PR='<%= ECI_ITEM_PR_T%>'
<%
			}

			if(! ECI_CNRT_PR_T.equals("")) {
%>
		 		ECI_CNRT_PR='<%= ECI_CNRT_PR_T%>'
<%
			}

			if(! ECI_SORT_SQ_T.equals("")) {
%>
		 		ECI_SORT_SQ='<%= ECI_SORT_SQ_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c7='<%= cnt%>'
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
