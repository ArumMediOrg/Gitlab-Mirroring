<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_omr_insertqtqurstion_001.jsp"%>
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
		String EXAM_NO = htMethod.get("EXAM_NO");
		String CUST_NO = htMethod.get("CUST_NO");
		String SCOLUMN = htMethod.get("SCOLUMN");
		String ANSR_CD = htMethod.get("ANSR_CD");
		String QQN_QSTN_CP = htMethod.get("QQN_QSTN_CP");
		String SRESULT = htMethod.get("SRESULT");
		String SCORE = htMethod.get("SCORE");
		String QQN_SCORE_YN = htMethod.get("QQN_SCORE_YN");

		//
		if(SDATE == null) { SDATE = ""; }
		if(EXAM_NO == null) { EXAM_NO = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }
		if(SCOLUMN == null) { SCOLUMN = ""; }
		if(ANSR_CD == null) { ANSR_CD = ""; }
		if(QQN_QSTN_CP == null) { QQN_QSTN_CP = ""; }
		if(SRESULT == null) { SRESULT = ""; }
		if(SCORE == null) { SCORE = ""; }
		if(QQN_SCORE_YN == null) { QQN_SCORE_YN = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_omr_insertqtqurstion_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : omr_insertqtqurstion_001 \n";
			G_INFO += "설명 : OMR 일검 문진 테이블 인서트 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SDATE : " + SDATE + " \n";
			G_INFO += " EXAM_NO : " + EXAM_NO + " \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " SCOLUMN : " + SCOLUMN + " \n";
			G_INFO += " ANSR_CD : " + ANSR_CD + " \n";
			G_INFO += " QQN_QSTN_CP : " + QQN_QSTN_CP + " \n";
			G_INFO += " SRESULT : " + SRESULT + " \n";
			G_INFO += " SCORE : " + SCORE + " \n";
			G_INFO += " QQN_SCORE_YN : " + QQN_SCORE_YN + " \n";
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
