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

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT ECP_PROF_SQ, ECP_PROF_NM, ECP_PROF_TL,
  CASE WHEN ECP_PROF_TL IS NULL OR ECP_PROF_TL = '' THEN ECP_PROF_SQ || '-' || ECP_PROF_NM  else ECP_PROF_SQ || '-' || '(' || ECP_PROF_TL || ')' || ECP_PROF_NM END PROF_NM
FROM ET_COMP_CNRT_PROF
WHERE ECP_COMP_CD = :COMP_CD
  AND ECP_MNGT_YR = :MNGT_YR
  AND ECP_CNRT_SQ = :CNRT_SQ
  AND ECP_USE_YN = 'Y'
		*/

		sql = " SELECT ECP_PROF_SQ, ECP_PROF_NM, ECP_PROF_TL";
		sql += ", CASE WHEN ECP_PROF_TL IS NULL OR ECP_PROF_TL = '' THEN ECP_PROF_SQ || '-' || ECP_PROF_NM ELSE ECP_PROF_SQ || '-' || '(' || ECP_PROF_TL || ')' || ECP_PROF_NM END PROF_NM";
		sql += " FROM ET_COMP_CNRT_PROF";
		sql += " WHERE ECP_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ECP_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND ECP_CNRT_SQ = '" + CNRT_SQ + "'";
		sql += " AND ECP_USE_YN = 'Y'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_CUST_APPLY_BtnEXCEL_ErrorChkClick_003 \n";
			G_INFO += "설명 : 엑셀오류체크-사업장 검진유형 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
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
		<s:AttributeType name='ECP_PROF_SQ' rs:number='1' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_PROF_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PROF_NM' rs:number='2' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_PROF_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PROF_TL' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_PROF_TL'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='PROF_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='PROF_NM'>
			<s:datatype dt:type='string' dt:maxLength='205'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ECP_PROF_SQ_T = cRsList.getString("ECP_PROF_SQ");
			String ECP_PROF_NM_T = cRsList.getString("ECP_PROF_NM");
			String ECP_PROF_TL_T = cRsList.getString("ECP_PROF_TL");
			String PROF_NM_T = cRsList.getString("PROF_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECP_PROF_SQ_T.equals("")) {
%>
		 		ECP_PROF_SQ='<%= ECP_PROF_SQ_T%>'
<%
			}

			if(! ECP_PROF_NM_T.equals("")) {
%>
		 		ECP_PROF_NM='<%= ECP_PROF_NM_T%>'
<%
			}

			if(! ECP_PROF_TL_T.equals("")) {
%>
		 		ECP_PROF_TL='<%= ECP_PROF_TL_T%>'
<%
			}

			if(! PROF_NM_T.equals("")) {
%>
		 		PROF_NM='<%= PROF_NM_T%>'
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
