<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_EQuestionnaire_upSaveQuestionnaireLogData_001.jsp"%>
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

		String SHOSP = htMethod.get("SHOSP");
		String SPLCE = htMethod.get("SPLCE");
		String SPROC = htMethod.get("SPROC");
		String SMOBL = htMethod.get("SMOBL");
		String SRVNO = htMethod.get("SRVNO");
		String SDATE = htMethod.get("SDATE");
		String SEXNO = htMethod.get("SEXNO");
		String SPSNM = htMethod.get("SPSNM");
		String SURL = htMethod.get("SURL");
		String SRESP = htMethod.get("SRESP");
		String SUSER = htMethod.get("SUSER");

		//
		if(SHOSP == null) { SHOSP = ""; }
		if(SPLCE == null) { SPLCE = ""; }
		if(SPROC == null) { SPROC = ""; }
		if(SMOBL == null) { SMOBL = ""; }
		if(SRVNO == null) { SRVNO = ""; }
		if(SDATE == null) { SDATE = ""; }
		if(SEXNO == null) { SEXNO = ""; }
		if(SPSNM == null) { SPSNM = ""; }
		if(SURL == null) { SURL = ""; }
		if(SRESP == null) { SRESP = ""; }
		if(SUSER == null) { SUSER = ""; }


		// DB객체
		stmtExec = connect.createStatement();
		sql = func_EQuestionnaire_upSaveQuestionnaireLogData_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : EQuestionnaire_upSaveQuestionnaireLogData_001 \n";
			G_INFO += "설명 : 전자문진 API 로그 생성 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SHOSP : " + SHOSP + " \n";
			G_INFO += " SPLCE : " + SPLCE + " \n";
			G_INFO += " SPROC : " + SPROC + " \n";
			G_INFO += " SMOBL : " + SMOBL + " \n";
			G_INFO += " SRVNO : " + SRVNO + " \n";
			G_INFO += " SDATE : " + SDATE + " \n";
			G_INFO += " SEXNO : " + SEXNO + " \n";
			G_INFO += " SPSNM : " + SPSNM + " \n";

			if (! SURL.equals("")){
				G_INFO += " SURL : 데이터 들어왔는데 넘 길어서 생략";
			} else {
				G_INFO += " SURL : " + SURL + " \n";
			}

			if (! SRESP.equals("")){
				G_INFO += " SRESP : 데이터 들어왔는데 넘 길어서 생략";
			} else {
				G_INFO += " SRESP : " + SRESP + " \n";
			}

			G_INFO += " SUSER : " + SUSER + " \n";


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
