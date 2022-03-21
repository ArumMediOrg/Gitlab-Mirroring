<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSP_Health_BtnSave_BaseClick_008.jsp"%>
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

		String NOTE_YN = htMethod.get("NOTE_YN");
		String DIVI_NO = htMethod.get("DIVI_NO");
		String NTNA_CD = htMethod.get("NTNA_CD");
		String USER_ID = htMethod.get("USER_ID");
		String CUST_NO = htMethod.get("CUST_NO");

		//
		if(NOTE_YN == null) { NOTE_YN = ""; }
		if(DIVI_NO == null) { DIVI_NO = ""; }
		if(NTNA_CD == null) { NTNA_CD = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSP_Health_BtnSave_BaseClick_008(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_BtnSave_BaseClick_008 \n";
			G_INFO += "설명 : 고객정보update(특검관련) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " NOTE_YN : " + NOTE_YN + " \n";
			G_INFO += " DIVI_NO : " + DIVI_NO + " \n";
			G_INFO += " NTNA_CD : " + NTNA_CD + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
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
