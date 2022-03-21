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

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT DISTINCT ICD_HALF_CD, CSC_FULL_NM ICD_HALF_NM    
FROM IT_COMP_DEPT A                                     
INNER JOIN CT_SP_COMMON B ON B.CSC_LARGE = 'HM99F'    
                         AND A.ICD_HALF_CD = B.CSC_SMALL
WHERE ICD_COMP_CD = :COMP_CD
 AND ICD_MNGT_YR = :MNGT_YR
		*/

		sql = " SELECT DISTINCT ICD_HALF_CD, CSC_FULL_NM ICD_HALF_NM";
		sql += " FROM IT_COMP_DEPT A INNER JOIN CT_SP_COMMON B";
		sql += " ON B.CSC_LARGE = 'HM99F'";
		sql += " AND A.ICD_HALF_CD = B.CSC_SMALL";
		sql += " WHERE ICD_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ICD_MNGT_YR = '" + MNGT_YR + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_DEPT_TRNS_UP_Setting_002 \n";
			G_INFO += "설명 : 사업장부서관리 이월 사업장 정보 조회2 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
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
		<s:AttributeType name='ICD_HALF_CD' rs:number='1' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_HALF_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_HALF_NM' rs:number='2' rs:nullable='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='CSC_FULL_NM'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ICD_HALF_CD_T = cRsList.getString("ICD_HALF_CD");
			String ICD_HALF_NM_T = cRsList.getString("ICD_HALF_NM");
%>
			<z:row
<%
			if(! ICD_HALF_CD_T.equals("")) {
%>
		 		ICD_HALF_CD='<%= ICD_HALF_CD_T%>'
<%
			}

			if(! ICD_HALF_NM_T.equals("")) {
%>
		 		ICD_HALF_NM='<%= ICD_HALF_NM_T%>'
<%
			}
%>
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
