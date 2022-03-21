<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCRM_BASIC_btnS83_TimeSaveClick_001.jsp"%>
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

		String PLAN_DT = htMethod.get("PLAN_DT");
		String EMP_NO = htMethod.get("EMP_NO");
		String PLAN_TM = htMethod.get("PLAN_TM");
		String PLAN_CNT = htMethod.get("PLAN_CNT");
		String PLAN_TX = htMethod.get("PLAN_TX");
		String USER_ID = htMethod.get("USER_ID");

		//
		if(PLAN_DT == null) { PLAN_DT = ""; }
		if(EMP_NO == null) { EMP_NO = ""; }
		if(PLAN_TM == null) { PLAN_TM = ""; }
		if(PLAN_CNT == null) { PLAN_CNT = ""; }
		if(PLAN_TX == null) { PLAN_TX = ""; }
		if(USER_ID == null) { USER_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCRM_BASIC_btnS83_TimeSaveClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_btnS83_TimeSaveClick_001 \n";
			G_INFO += "설명 : 상담예약 케파 등록(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PLAN_DT : " + PLAN_DT + " \n";
			G_INFO += " EMP_NO : " + EMP_NO + " \n";
			G_INFO += " PLAN_TM : " + PLAN_TM + " \n";
			G_INFO += " PLAN_CNT : " + PLAN_CNT + " \n";
			G_INFO += " PLAN_TX : " + PLAN_TX + " \n";
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
