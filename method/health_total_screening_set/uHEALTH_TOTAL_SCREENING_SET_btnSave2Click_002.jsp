<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uHEALTH_TOTAL_SCREENING_SET_btnSave2Click_002.jsp"%>
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

		String AUTO_CD = htMethod.get("AUTO_CD");
		String APLT_DT = htMethod.get("APLT_DT");
		String KTITLE_NM = htMethod.get("KTITLE_NM");
		String ETITLE_NM = htMethod.get("ETITLE_NM");
		String CTITLE_NM = htMethod.get("CTITLE_NM");
		String JTITLE_NM = htMethod.get("JTITLE_NM");
		String KSOCK_TX = htMethod.get("KSOCK_TX");
		String ESOCK_TX = htMethod.get("ESOCK_TX");
		String CSOCK_TX = htMethod.get("CSOCK_TX");
		String JSOCK_TX = htMethod.get("JSOCK_TX");
		String USE_YN = htMethod.get("USE_YN");
		String ORGA_CD = htMethod.get("ORGA_CD");
		String RESULT = htMethod.get("RESULT");
		String SEX_KD = htMethod.get("SEX_KD");

		//
		if(AUTO_CD == null) { AUTO_CD = ""; }
		if(APLT_DT == null) { APLT_DT = ""; }
		if(KTITLE_NM == null) { KTITLE_NM = ""; }
		if(ETITLE_NM == null) { ETITLE_NM = ""; }
		if(CTITLE_NM == null) { CTITLE_NM = ""; }
		if(JTITLE_NM == null) { JTITLE_NM = ""; }
		if(KSOCK_TX == null) { KSOCK_TX = ""; }
		if(ESOCK_TX == null) { ESOCK_TX = ""; }
		if(CSOCK_TX == null) { CSOCK_TX = ""; }
		if(JSOCK_TX == null) { JSOCK_TX = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(ORGA_CD == null) { ORGA_CD = ""; }
		if(RESULT == null) { RESULT = ""; }
		if(SEX_KD == null) { SEX_KD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uHEALTH_TOTAL_SCREENING_SET_btnSave2Click_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHEALTH_TOTAL_SCREENING_SET_btnSave2Click_002 \n";
			G_INFO += "설명 : 자동판정저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " AUTO_CD : " + AUTO_CD + " \n";
			G_INFO += " APLT_DT : " + APLT_DT + " \n";
			G_INFO += " KTITLE_NM : " + KTITLE_NM + " \n";
			G_INFO += " ETITLE_NM : " + ETITLE_NM + " \n";
			G_INFO += " CTITLE_NM : " + CTITLE_NM + " \n";
			G_INFO += " JTITLE_NM : " + JTITLE_NM + " \n";
			G_INFO += " KSOCK_TX : " + KSOCK_TX + " \n";
			G_INFO += " ESOCK_TX : " + ESOCK_TX + " \n";
			G_INFO += " CSOCK_TX : " + CSOCK_TX + " \n";
			G_INFO += " JSOCK_TX : " + JSOCK_TX + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " ORGA_CD : " + ORGA_CD + " \n";
			G_INFO += " RESULT : " + RESULT + " \n";
			G_INFO += " SEX_KD : " + SEX_KD + " \n";
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
