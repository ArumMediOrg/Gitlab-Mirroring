<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uVT1000Apply_ufSave_005.jsp"%>
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

		String MARK_CLASS = htMethod.get("MARK_CLASS");
		String VIEW_NO = htMethod.get("VIEW_NO");
		String VIEW_CD1 = htMethod.get("VIEW_CD1");
		String VIEW_CD2 = htMethod.get("VIEW_CD2");
		String VIEW_CD3 = htMethod.get("VIEW_CD3");
		String VIEW_CD4 = htMethod.get("VIEW_CD4");
		String VIEW_CD5 = htMethod.get("VIEW_CD5");
		String VIEW_CD6 = htMethod.get("VIEW_CD6");

		//
		if(MARK_CLASS == null) { MARK_CLASS = ""; }
		if(VIEW_NO == null) { VIEW_NO = ""; }
		if(VIEW_CD1 == null) { VIEW_CD1 = ""; }
		if(VIEW_CD2 == null) { VIEW_CD2 = ""; }
		if(VIEW_CD3 == null) { VIEW_CD3 = ""; }
		if(VIEW_CD4 == null) { VIEW_CD4 = ""; }
		if(VIEW_CD5 == null) { VIEW_CD5 = ""; }
		if(VIEW_CD6 == null) { VIEW_CD6 = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uVT1000Apply_ufSave_005(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uVT1000Apply_ufSave_005 \n";
			G_INFO += "설명 : 검사정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MARK_CLASS : " + MARK_CLASS + " \n";
			G_INFO += " VIEW_NO : " + VIEW_NO + " \n";
			G_INFO += " VIEW_CD1 : " + VIEW_CD1 + " \n";
			G_INFO += " VIEW_CD2 : " + VIEW_CD2 + " \n";
			G_INFO += " VIEW_CD3 : " + VIEW_CD3 + " \n";
			G_INFO += " VIEW_CD4 : " + VIEW_CD4 + " \n";
			G_INFO += " VIEW_CD5 : " + VIEW_CD5 + " \n";
			G_INFO += " VIEW_CD6 : " + VIEW_CD6 + " \n";
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
