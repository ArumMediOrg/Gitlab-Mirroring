<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uExam_Memo_UP_btnSaveClick_002.jsp"%>
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

		String ZIP_CD = htMethod.get("ZIP_CD");
		String ZIP_SQ = htMethod.get("ZIP_SQ");
		String ZIP_AR = htMethod.get("ZIP_AR");
		String ROAD_AR = htMethod.get("ROAD_AR");
		String BLDG_NO = htMethod.get("BLDG_NO");
		String TEL_NO = htMethod.get("TEL_NO");
		String MOBL_NO = htMethod.get("MOBL_NO");
		String EMAIL_AR = htMethod.get("EMAIL_AR");
		String SEND_CD = htMethod.get("SEND_CD");
		String ACPT_TX = htMethod.get("ACPT_TX");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(ZIP_CD == null) { ZIP_CD = ""; }
		if(ZIP_SQ == null) { ZIP_SQ = ""; }
		if(ZIP_AR == null) { ZIP_AR = ""; }
		if(ROAD_AR == null) { ROAD_AR = ""; }
		if(BLDG_NO == null) { BLDG_NO = ""; }
		if(TEL_NO == null) { TEL_NO = ""; }
		if(MOBL_NO == null) { MOBL_NO = ""; }
		if(EMAIL_AR == null) { EMAIL_AR = ""; }
		if(SEND_CD == null) { SEND_CD = ""; }
		if(ACPT_TX == null) { ACPT_TX = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uExam_Memo_UP_btnSaveClick_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Memo_UP_btnSaveClick_002 \n";
			G_INFO += "설명 : 접수메모(접수정보 update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ZIP_CD : " + ZIP_CD + " \n";
			G_INFO += " ZIP_SQ : " + ZIP_SQ + " \n";
			G_INFO += " ZIP_AR : " + ZIP_AR + " \n";
			G_INFO += " ROAD_AR : " + ROAD_AR + " \n";
			G_INFO += " BLDG_NO : " + BLDG_NO + " \n";
			G_INFO += " TEL_NO : " + TEL_NO + " \n";
			G_INFO += " MOBL_NO : " + MOBL_NO + " \n";
			G_INFO += " EMAIL_AR : " + EMAIL_AR + " \n";
			G_INFO += " SEND_CD : " + SEND_CD + " \n";
			G_INFO += " ACPT_TX : " + ACPT_TX + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
