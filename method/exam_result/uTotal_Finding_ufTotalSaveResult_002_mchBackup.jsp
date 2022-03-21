<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uTotal_Finding_ufTotalSaveResult_002.jsp"%>
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

		String ICNT = htMethod.get("ICNT");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String PACK_CD = htMethod.get("PACK_CD");
		String VIEW_EX = htMethod.get("VIEW_EX");
		String DOCTOR = htMethod.get("DOCTOR");
		String RPT_DT = htMethod.get("RPT_DT");
		String USER = htMethod.get("USER");
		String VIEW_RTF = htMethod.get("VIEW_RTF");
		String PRNT_DT = htMethod.get("PRNT_DT");

		//
		if(ICNT == null) { ICNT = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(PACK_CD == null) { PACK_CD = ""; }
		if(VIEW_EX == null) { VIEW_EX = ""; }
		if(DOCTOR == null) { DOCTOR = ""; }
		if(RPT_DT == null) { RPT_DT = ""; }
		if(USER == null) { USER = ""; }
		if(VIEW_RTF == null) { VIEW_RTF = ""; }
		if(PRNT_DT == null) { PRNT_DT = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uTotal_Finding_ufTotalSaveResult_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uTotal_Finding_ufTotalSaveResult_002 \n";
			G_INFO += "설명 : 소견저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ICNT : " + CTr.Replace(ICNT, "--", "__") + " \n";
			G_INFO += " EXAM_DT : " + CTr.Replace(EXAM_DT, "--", "__") + " \n";
			G_INFO += " EXAM_SQ : " + CTr.Replace(EXAM_SQ, "--", "__") + " \n";
			G_INFO += " PACK_CD : " + CTr.Replace(PACK_CD, "--", "__") + " \n";
			G_INFO += " VIEW_EX : " + CTr.Replace(VIEW_EX, "--", "__") + " \n";
			G_INFO += " DOCTOR : " + CTr.Replace(DOCTOR, "--", "__") + " \n";
			G_INFO += " RPT_DT : " + CTr.Replace(RPT_DT, "--", "__") + " \n";
			G_INFO += " USER : " + CTr.Replace(USER, "--", "__") + " \n";
			G_INFO += " VIEW_RTF : " + CTr.Replace(VIEW_RTF, "--", "__") + " \n";
			G_INFO += " PRNT_DT : " + CTr.Replace(PRNT_DT, "--", "__") + " \n";
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
