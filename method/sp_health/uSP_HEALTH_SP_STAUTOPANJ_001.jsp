<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;
	CallableStatement CallStmtExec = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String HOST_NO = htMethod.get("HOST_NO");
		String ILLNESS_TX = htMethod.get("ILLNESS_TX");
		String PANJ_DT = htMethod.get("PANJ_DT");
		String DOCT_CD = htMethod.get("DOCT_CD");
		String USER_ID = htMethod.get("USER_ID");
		String RSV_STR1 = htMethod.get("RSV_STR1");
		String RSV_STR2 = htMethod.get("RSV_STR2");
		String RSV_STR3 = htMethod.get("RSV_STR3");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(HOST_NO == null) { HOST_NO = ""; }
		if(ILLNESS_TX == null) { ILLNESS_TX = ""; }
		if(PANJ_DT == null) { PANJ_DT = ""; }
		if(DOCT_CD == null) { DOCT_CD = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(RSV_STR1 == null) { RSV_STR1 = ""; }
		if(RSV_STR2 == null) { RSV_STR2 = ""; }
		if(RSV_STR3 == null) { RSV_STR3 = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		// SP사용
		sql = " {call SP_STAUTOPANJ( ?   ,?   ,?   ,?  ,?  ,?  ,?  ,?  ,?  ,? )}";
		CallStmtExec = connect.prepareCall(sql);


		CallStmtExec.setString(1,  EXAM_DT);
		CallStmtExec.setString(2,  EXAM_SQ);
		CallStmtExec.setString(3,  HOST_NO);
		CallStmtExec.setString(4,  ILLNESS_TX);
		CallStmtExec.setString(5,  PANJ_DT);
		CallStmtExec.setString(6,  DOCT_CD);
		CallStmtExec.setString(7,  USER_ID);
		CallStmtExec.setString(8,  RSV_STR1);
		CallStmtExec.setString(9,  RSV_STR2);
		CallStmtExec.setString(10, RSV_STR3);

		CallStmtExec.executeUpdate();

		//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uSP_HEALTH_SP_STAUTOPANJ_001 \n";
		G_INFO += "설명 : 특검 자동판정 처리(DB 프로시저) \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
		G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
		G_INFO += " HOST_NO : " + HOST_NO + " \n";
		G_INFO += " ILLNESS_TX : " + ILLNESS_TX + " \n";
		G_INFO += " PANJ_DT : " + PANJ_DT + " \n";
		G_INFO += " DOCT_CD : " + DOCT_CD + " \n";
		G_INFO += " USER_ID : " + USER_ID + " \n";
		G_INFO += " RSV_STR1 : " + RSV_STR1 + " \n";
		G_INFO += " RSV_STR2 : " + RSV_STR2 + " \n";
		G_INFO += " RSV_STR3 : " + RSV_STR3 + " \n";
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

		if(CallStmtExec != null) {
			CallStmtExec.close();
			CallStmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
