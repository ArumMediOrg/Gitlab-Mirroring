<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uExam_Ticket_btnS1_SAVEClick_001.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String SMODE = htMethod.get("SMODE");
		String PUB_CD = htMethod.get("PUB_CD");
		String PUB_COMP_CD = htMethod.get("PUB_COMP_CD");
		String CUST_NM = htMethod.get("CUST_NM");
		String CUST_BIRTH = htMethod.get("CUST_BIRTH");
		String CUST_SEX = htMethod.get("CUST_SEX");
		String PUB_COMP_NM = htMethod.get("PUB_COMP_NM");
		String PUB_NM = htMethod.get("PUB_NM");
		String S_DT = htMethod.get("S_DT");
		String E_DT = htMethod.get("E_DT");
		String USE_YN = htMethod.get("USE_YN");
		String USER_ID = htMethod.get("USER_ID");
		String ETC = htMethod.get("ETC");

		//
		if(SMODE == null) { SMODE = ""; }
		if(PUB_CD == null) { PUB_CD = ""; }
		if(PUB_COMP_CD == null) { PUB_COMP_CD = ""; }
		if(CUST_NM == null) { CUST_NM = ""; }
		if(CUST_BIRTH == null) { CUST_BIRTH = ""; }
		if(CUST_SEX == null) { CUST_SEX = ""; }
		if(PUB_COMP_NM == null) { PUB_COMP_NM = ""; }
		if(PUB_NM == null) { PUB_NM = ""; }
		if(S_DT == null) { S_DT = ""; }
		if(E_DT == null) { E_DT = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(ETC == null) { ETC = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uExam_Ticket_btnS1_SAVEClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Ticket_btnS1_SAVEClick_001 \n";
			G_INFO += "설명 : 검진권저장(insert, update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " PUB_CD : " + PUB_CD + " \n";
			G_INFO += " PUB_COMP_CD : " + PUB_COMP_CD + " \n";
			G_INFO += " CUST_NM : " + CUST_NM + " \n";
			G_INFO += " CUST_BIRTH : " + CUST_BIRTH + " \n";
			G_INFO += " CUST_SEX : " + CUST_SEX + " \n";
			G_INFO += " PUB_COMP_NM : " + PUB_COMP_NM + " \n";
			G_INFO += " PUB_NM : " + PUB_NM + " \n";
			G_INFO += " S_DT : " + S_DT + " \n";
			G_INFO += " E_DT : " + E_DT + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " ETC : " + ETC + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>200</resultCode>
	<resultXml></resultXml>
	<errorMsg></errorMsg>
</nurionXml>

<%
	} catch (FuncException fe) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= fe.toString()%>]]></errorMsg>
	<sql><![CDATA[<%= fe.getSql()%>]]></sql>
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

		if(stmtExec != null) {
			stmtExec.close();
			stmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
