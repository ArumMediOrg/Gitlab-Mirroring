<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uHEALTH_TOTAL_SCREENING_Apply_ufSave_002.jsp"%>
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
		String APLT_DT = htMethod.get("APLT_DT");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String SOCK_SQ = htMethod.get("SOCK_SQ");
		String SEX_CD = htMethod.get("SEX_CD");
		String PROF_CD = htMethod.get("PROF_CD");
		String SOCK_CD = htMethod.get("SOCK_CD");
		String SOCK_TX = htMethod.get("SOCK_TX");
		String ESOCK_TX = htMethod.get("ESOCK_TX");
		String CSOCK_TX = htMethod.get("CSOCK_TX");
		String RSOCK_TX = htMethod.get("RSOCK_TX");
		String JSOCK_TX = htMethod.get("JSOCK_TX");
		String TITLE_NM = htMethod.get("TITLE_NM");
		String ETITLE_NM = htMethod.get("ETITLE_NM");
		String CTITLE_NM = htMethod.get("CTITLE_NM");
		String RTITLE_NM = htMethod.get("RTITLE_NM");
		String JTITLE_NM = htMethod.get("JTITLE_NM");
		String RSLT_LOW = htMethod.get("RSLT_LOW");
		String RSLT_HIGH = htMethod.get("RSLT_HIGH");
		String CHAR_VAL = htMethod.get("CHAR_VAL");
		String PANJ_CD = htMethod.get("PANJ_CD");
		String USE_YN = htMethod.get("USE_YN");
		String USER_ID = htMethod.get("USER_ID");

		//
		if(SMODE == null) { SMODE = ""; }
		if(APLT_DT == null) { APLT_DT = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(SOCK_SQ == null) { SOCK_SQ = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PROF_CD == null) { PROF_CD = ""; }
		if(SOCK_CD == null) { SOCK_CD = ""; }
		if(SOCK_TX == null) { SOCK_TX = ""; }
		if(ESOCK_TX == null) { ESOCK_TX = ""; }
		if(CSOCK_TX == null) { CSOCK_TX = ""; }
		if(RSOCK_TX == null) { RSOCK_TX = ""; }
		if(JSOCK_TX == null) { JSOCK_TX = ""; }
		if(TITLE_NM == null) { TITLE_NM = ""; }
		if(ETITLE_NM == null) { ETITLE_NM = ""; }
		if(CTITLE_NM == null) { CTITLE_NM = ""; }
		if(RTITLE_NM == null) { RTITLE_NM = ""; }
		if(JTITLE_NM == null) { JTITLE_NM = ""; }
		if(RSLT_LOW == null) { RSLT_LOW = ""; }
		if(RSLT_HIGH == null) { RSLT_HIGH = ""; }
		if(CHAR_VAL == null) { CHAR_VAL = ""; }
		if(PANJ_CD == null) { PANJ_CD = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(USER_ID == null) { USER_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uHEALTH_TOTAL_SCREENING_Apply_ufSave_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHEALTH_TOTAL_SCREENING_Apply_ufSave_002 \n";
			G_INFO += "설명 : 종합검진소견 저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " APLT_DT : " + APLT_DT + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " SOCK_SQ : " + SOCK_SQ + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PROF_CD : " + PROF_CD + " \n";
			G_INFO += " SOCK_CD : " + SOCK_CD + " \n";
			G_INFO += " SOCK_TX : " + SOCK_TX + " \n";
			G_INFO += " ESOCK_TX : " + ESOCK_TX + " \n";
			G_INFO += " CSOCK_TX : " + CSOCK_TX + " \n";
			G_INFO += " RSOCK_TX : " + RSOCK_TX + " \n";
			G_INFO += " JSOCK_TX : " + JSOCK_TX + " \n";
			G_INFO += " TITLE_NM : " + TITLE_NM + " \n";
			G_INFO += " ETITLE_NM : " + ETITLE_NM + " \n";
			G_INFO += " CTITLE_NM : " + CTITLE_NM + " \n";
			G_INFO += " RTITLE_NM : " + RTITLE_NM + " \n";
			G_INFO += " JTITLE_NM : " + JTITLE_NM + " \n";
			G_INFO += " RSLT_LOW : " + RSLT_LOW + " \n";
			G_INFO += " RSLT_HIGH : " + RSLT_HIGH + " \n";
			G_INFO += " CHAR_VAL : " + CHAR_VAL + " \n";
			G_INFO += " PANJ_CD : " + PANJ_CD + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
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
