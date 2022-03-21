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

		String SLARGE = htMethod.get("SLARGE");
		String SSMALL = htMethod.get("SSMALL");

		//
		if(SLARGE == null) { SLARGE = ""; }
		if(SSMALL == null) { SSMALL = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

      SELECT DISTINCT ICD_HALF_CD CSC_SMALL,  dbo.GetSP_COMMON_cdToNm('HM99F',ICD_HALF_CD) CSC_FULL_NM FROM IT_COMP_DEPT 
                  WHERE ICD_COMP_CD = :sLarge AND ICD_MNGT_YR = :sSmall
                    AND ICD_USE_YN = 'Y'
                  ORDER BY ICD_HALF_CD

		*/

		sql = " SELECT DISTINCT ICD_HALF_CD CSC_SMALL, GETSP_COMMON_CDTONM('HM99F',ICD_HALF_CD) CSC_FULL_NM";
		sql += " FROM IT_COMP_DEPT";
		sql += " WHERE ICD_COMP_CD = '" + SLARGE + "'";
		sql += " AND ICD_MNGT_YR = '" + SSMALL + "'";
		sql += " AND ICD_USE_YN = 'Y'";
		sql += " ORDER BY ICD_HALF_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UFM_Common_GP_ComboSetting_001___8 \n";
			G_INFO += "설명 : 구분값에 따른 콤보박스 정보 로딩___8 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SLARGE : " + SLARGE + " \n";
			G_INFO += " SSMALL : " + SSMALL + " \n";
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
		<s:AttributeType name='CSC_SMALL' rs:number='1' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_HALF_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_FULL_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CSC_SMALL_T = cRsList.getString("CSC_SMALL");
			String CSC_FULL_NM_T = cRsList.getString("CSC_FULL_NM");
%>
			<z:row
<%
			if(! CSC_SMALL_T.equals("")) {
%>
		 		CSC_SMALL='<%= CSC_SMALL_T%>'
<%
			}

			if(! CSC_FULL_NM_T.equals("")) {
%>
		 		CSC_FULL_NM='<%= CSC_FULL_NM_T%>'
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
