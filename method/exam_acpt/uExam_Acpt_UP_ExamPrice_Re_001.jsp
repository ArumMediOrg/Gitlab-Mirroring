<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uExam_Acpt_UP_ExamPrice_Re_001.jsp"%>
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

		String COMPR_PR = htMethod.get("COMPR_PR");
		String PSNLR_PR = htMethod.get("PSNLR_PR");
		String HLTHR_PR = htMethod.get("HLTHR_PR");
		String SPCLR_PR = htMethod.get("SPCLR_PR");
		String CANR_PR = htMethod.get("CANR_PR");
		String ORALR_PR = htMethod.get("ORALR_PR");
		String SPRT_PR = htMethod.get("SPRT_PR");
		String MODI_ID = htMethod.get("MODI_ID");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(COMPR_PR == null) { COMPR_PR = ""; }
		if(PSNLR_PR == null) { PSNLR_PR = ""; }
		if(HLTHR_PR == null) { HLTHR_PR = ""; }
		if(SPCLR_PR == null) { SPCLR_PR = ""; }
		if(CANR_PR == null) { CANR_PR = ""; }
		if(ORALR_PR == null) { ORALR_PR = ""; }
		if(SPRT_PR == null) { SPRT_PR = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uExam_Acpt_UP_ExamPrice_Re_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_UP_ExamPrice_Re_001 \n";
			G_INFO += "설명 : 수가 재계산 접수 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMPR_PR : " + COMPR_PR + " \n";
			G_INFO += " PSNLR_PR : " + PSNLR_PR + " \n";
			G_INFO += " HLTHR_PR : " + HLTHR_PR + " \n";
			G_INFO += " SPCLR_PR : " + SPCLR_PR + " \n";
			G_INFO += " CANR_PR : " + CANR_PR + " \n";
			G_INFO += " ORALR_PR : " + ORALR_PR + " \n";
			G_INFO += " SPRT_PR : " + SPRT_PR + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
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
