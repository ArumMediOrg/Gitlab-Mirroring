<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uUserAuthManagement_setGroupProgramInfo_002.jsp"%>
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

		String USER_ID = htMethod.get("USER_ID");
		String PRGM_NM = htMethod.get("PRGM_NM");
		String MENU_ID = htMethod.get("MENU_ID");
		String LIBR_NM = htMethod.get("LIBR_NM");
		String PARE_ID = htMethod.get("PARE_ID");
		String MENU_LV = htMethod.get("MENU_LV");
		String PRGM_SQ = htMethod.get("PRGM_SQ");
		String MENU_RU = htMethod.get("MENU_RU");

		//
		if(USER_ID == null) { USER_ID = ""; }
		if(PRGM_NM == null) { PRGM_NM = ""; }
		if(MENU_ID == null) { MENU_ID = ""; }
		if(LIBR_NM == null) { LIBR_NM = ""; }
		if(PARE_ID == null) { PARE_ID = ""; }
		if(MENU_LV == null) { MENU_LV = ""; }
		if(PRGM_SQ == null) { PRGM_SQ = ""; }
		if(MENU_RU == null) { MENU_RU = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uUserAuthManagement_setGroupProgramInfo_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uUserAuthManagement_setGroupProgramInfo_002 \n";
			G_INFO += "설명 : 프로그램 정보 삽입 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " PRGM_NM : " + PRGM_NM + " \n";
			G_INFO += " MENU_ID : " + MENU_ID + " \n";
			G_INFO += " LIBR_NM : " + LIBR_NM + " \n";
			G_INFO += " PARE_ID : " + PARE_ID + " \n";
			G_INFO += " MENU_LV : " + MENU_LV + " \n";
			G_INFO += " PRGM_SQ : " + PRGM_SQ + " \n";
			G_INFO += " MENU_RU : " + MENU_RU + " \n";
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
