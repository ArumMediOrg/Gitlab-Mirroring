<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uStdt_Pnjn_UP_OralPnjn_Save_001.jsp"%>
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

		String SAVE_KD = htMethod.get("SAVE_KD");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String PNJN_05 = htMethod.get("PNJN_05");
		String ORAL_VIEW = htMethod.get("ORAL_VIEW");
		String ORAL_ACT = htMethod.get("ORAL_ACT");
		String ORAL_DR = htMethod.get("ORAL_DR");
		String OPNJN_YN = htMethod.get("OPNJN_YN");
		String USER_ID = htMethod.get("USER_ID");
		String PERI_DIS = htMethod.get("PERI_DIS");
		String PERI_TXT = htMethod.get("PERI_TXT");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(PNJN_05 == null) { PNJN_05 = ""; }
		if(ORAL_VIEW == null) { ORAL_VIEW = ""; }
		if(ORAL_ACT == null) { ORAL_ACT = ""; }
		if(ORAL_DR == null) { ORAL_DR = ""; }
		if(OPNJN_YN == null) { OPNJN_YN = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(PERI_DIS == null) { PERI_DIS = ""; }
		if(PERI_TXT == null) { PERI_TXT = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uStdt_Pnjn_UP_OralPnjn_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Pnjn_UP_OralPnjn_Save_001 \n";
			G_INFO += "설명 : 학생 구강 판정 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " PNJN_05 : " + PNJN_05 + " \n";
			G_INFO += " ORAL_VIEW : " + ORAL_VIEW + " \n";
			G_INFO += " ORAL_ACT : " + ORAL_ACT + " \n";
			G_INFO += " ORAL_DR : " + ORAL_DR + " \n";
			G_INFO += " OPNJN_YN : " + OPNJN_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " PERI_DIS : " + PERI_DIS + " \n";
			G_INFO += " PERI_TXT : " + PERI_TXT + " \n";
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
