<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uGen_Frst_Panj_upInsertJilPan_002.jsp"%>
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
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String JLPN_DSCD = htMethod.get("JLPN_DSCD");
		String JLPN_PNCD = htMethod.get("JLPN_PNCD");
		String JLPN_SH01 = htMethod.get("JLPN_SH01");
		String JLPN_SH02 = htMethod.get("JLPN_SH02");
		String JLPN_SH03 = htMethod.get("JLPN_SH03");
		String JLPN_SHDS = htMethod.get("JLPN_SHDS");
		String JLPN_DOCV = htMethod.get("JLPN_DOCV");
		String JLPN_TTPN = htMethod.get("JLPN_TTPN");
		String JLPN_WORK = htMethod.get("JLPN_WORK");
		String SYSDATE = htMethod.get("SYSDATE");
		String USER_ID = htMethod.get("USER_ID");
		String ETC_EX = htMethod.get("ETC_EX");

		//
		if(SMODE == null) { SMODE = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(JLPN_DSCD == null) { JLPN_DSCD = ""; }
		if(JLPN_PNCD == null) { JLPN_PNCD = ""; }
		if(JLPN_SH01 == null) { JLPN_SH01 = ""; }
		if(JLPN_SH02 == null) { JLPN_SH02 = ""; }
		if(JLPN_SH03 == null) { JLPN_SH03 = ""; }
		if(JLPN_SHDS == null) { JLPN_SHDS = ""; }
		if(JLPN_DOCV == null) { JLPN_DOCV = ""; }
		if(JLPN_TTPN == null) { JLPN_TTPN = ""; }
		if(JLPN_WORK == null) { JLPN_WORK = ""; }
		if(SYSDATE == null) { SYSDATE = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(ETC_EX == null) { ETC_EX = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uGen_Frst_Panj_upInsertJilPan_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGen_Frst_Panj_upInsertJilPan_002 \n";
			G_INFO += "설명 : 노통부판정 (자동판정) 저장 insert,update \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " JLPN_DSCD : " + JLPN_DSCD + " \n";
			G_INFO += " JLPN_PNCD : " + JLPN_PNCD + " \n";
			G_INFO += " JLPN_SH01 : " + JLPN_SH01 + " \n";
			G_INFO += " JLPN_SH02 : " + JLPN_SH02 + " \n";
			G_INFO += " JLPN_SH03 : " + JLPN_SH03 + " \n";
			G_INFO += " JLPN_SHDS : " + JLPN_SHDS + " \n";
			G_INFO += " JLPN_DOCV : " + JLPN_DOCV + " \n";
			G_INFO += " JLPN_TTPN : " + JLPN_TTPN + " \n";
			G_INFO += " JLPN_WORK : " + JLPN_WORK + " \n";
			G_INFO += " SYSDATE : " + SYSDATE + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " ETC_EX : " + ETC_EX + " \n";
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
