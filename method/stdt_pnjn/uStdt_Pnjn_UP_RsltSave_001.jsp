<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uStdt_Pnjn_UP_RsltSave_001.jsp"%>
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
		String ITEM_CD = htMethod.get("ITEM_CD");
		String HERT_CD = htMethod.get("HERT_CD");
		String RSLT_CD = htMethod.get("RSLT_CD");
		String RSLT_VL = htMethod.get("RSLT_VL");
		String RSLT_KD = htMethod.get("RSLT_KD");
		String VLDT_LH = htMethod.get("VLDT_LH");
		String STSB_PJ = htMethod.get("STSB_PJ");
		String USER_ID = htMethod.get("USER_ID");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(HERT_CD == null) { HERT_CD = ""; }
		if(RSLT_CD == null) { RSLT_CD = ""; }
		if(RSLT_VL == null) { RSLT_VL = ""; }
		if(RSLT_KD == null) { RSLT_KD = ""; }
		if(VLDT_LH == null) { VLDT_LH = ""; }
		if(STSB_PJ == null) { STSB_PJ = ""; }
		if(USER_ID == null) { USER_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uStdt_Pnjn_UP_RsltSave_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Pnjn_UP_RsltSave_001 \n";
			G_INFO += "설명 : 학생/학교밖청소년 결과 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " HERT_CD : " + HERT_CD + " \n";
			G_INFO += " RSLT_CD : " + RSLT_CD + " \n";
			G_INFO += " RSLT_VL : " + RSLT_VL + " \n";
			G_INFO += " RSLT_KD : " + RSLT_KD + " \n";
			G_INFO += " VLDT_LH : " + VLDT_LH + " \n";
			G_INFO += " STSB_PJ : " + STSB_PJ + " \n";
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
