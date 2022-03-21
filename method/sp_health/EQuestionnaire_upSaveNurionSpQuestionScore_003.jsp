<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_EQuestionnaire_upSaveNurionSpQuestionScore_003.jsp"%>
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

		String SDATE = htMethod.get("SDATE");
		String SEXNO = htMethod.get("SEXNO");
		String SCODE = htMethod.get("SCODE");
		String SRE = htMethod.get("SRE");
		String SCHAR = htMethod.get("SCHAR");
		String SUSER = htMethod.get("SUSER");

		//

		if(SDATE == null) { SDATE = ""; }
		if(SEXNO == null) { SEXNO = ""; }
		if(SCODE == null) { SCODE = ""; }
		if(SRE == null) { SRE = ""; }
		if(SCHAR == null) { SCHAR = ""; }
		if(SUSER == null) { SUSER = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_EQuestionnaire_upSaveNurionSpQuestionScore_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : EQuestionnaire_upSaveNurionSpQuestionScore_003 \n";
			G_INFO += "설명 : 문진결과 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SDATE : " + SDATE + " \n";
			G_INFO += " SEXNO : " + SEXNO + " \n";
			G_INFO += " SCODE : " + SCODE + " \n";
			G_INFO += " SRE : " + SRE + " \n";
			G_INFO += " SCHAR : " + SCHAR + " \n";
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
