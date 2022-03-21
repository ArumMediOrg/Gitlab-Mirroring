<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCT_QUESTION_APPLY_UP_Save_003_TRAN003.jsp"%>
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

		String EXEM_CD1 = htMethod.get("EXEM_CD1");
		String QSKD_CD1 = htMethod.get("QSKD_CD1");
		String QSTN_SQ1 = htMethod.get("QSTN_SQ1");
		String MODI_ID = htMethod.get("MODI_ID");
		String EXEM_CD2 = htMethod.get("EXEM_CD2");
		String QSKD_CD2 = htMethod.get("QSKD_CD2");
		String QSTN_SQ2 = htMethod.get("QSTN_SQ2");

		//
		if(EXEM_CD1 == null) { EXEM_CD1 = ""; }
		if(QSKD_CD1 == null) { QSKD_CD1 = ""; }
		if(QSTN_SQ1 == null) { QSTN_SQ1 = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(EXEM_CD2 == null) { EXEM_CD2 = ""; }
		if(QSKD_CD2 == null) { QSKD_CD2 = ""; }
		if(QSTN_SQ2 == null) { QSTN_SQ2 = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCT_QUESTION_APPLY_UP_Save_003_TRAN003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCT_QUESTION_APPLY_UP_Save_003_TRAN003 \n";
			G_INFO += "설명 : 문진정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXEM_CD1 : " + EXEM_CD1 + " \n";
			G_INFO += " QSKD_CD1 : " + QSKD_CD1 + " \n";
			G_INFO += " QSTN_SQ1 : " + QSTN_SQ1 + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " EXEM_CD2 : " + EXEM_CD2 + " \n";
			G_INFO += " QSKD_CD2 : " + QSKD_CD2 + " \n";
			G_INFO += " QSTN_SQ2 : " + QSTN_SQ2 + " \n";
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
