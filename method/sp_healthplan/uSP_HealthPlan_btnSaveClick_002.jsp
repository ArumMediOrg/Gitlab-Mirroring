<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSP_HealthPlan_btnSaveClick_002.jsp"%>
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

		String SGUBN = htMethod.get("SGUBN");
		String COMP_CD = htMethod.get("COMP_CD");
		String SAVE_DT = htMethod.get("SAVE_DT");
		String SAVE_SQ = htMethod.get("SAVE_SQ");
		String DEPT_SQ = htMethod.get("DEPT_SQ");
		String PSNL_SQ = htMethod.get("PSNL_SQ");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String BIRT_DT = htMethod.get("BIRT_DT");
		String JOB_CD = htMethod.get("JOB_CD");
		String ENTR_DT = htMethod.get("ENTR_DT");
		String CHECKTO_DT = htMethod.get("CHECKTO_DT");
		String INPT_ID = htMethod.get("INPT_ID");

		//

		if(SGUBN == null) { SGUBN = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(SAVE_DT == null) { SAVE_DT = ""; }
		if(SAVE_SQ == null) { SAVE_SQ = ""; }
		if(DEPT_SQ == null) { DEPT_SQ = ""; }
		if(PSNL_SQ == null) { PSNL_SQ = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(BIRT_DT == null) { BIRT_DT = ""; }
		if(JOB_CD == null) { JOB_CD = ""; }
		if(ENTR_DT == null) { ENTR_DT = ""; }
		if(CHECKTO_DT == null) { CHECKTO_DT = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSP_HealthPlan_btnSaveClick_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HealthPlan_btnSaveClick_002 \n";
			G_INFO += "설명 : 데이터 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SGUBN : " + SGUBN + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " SAVE_DT : " + SAVE_DT + " \n";
			G_INFO += " SAVE_SQ : " + SAVE_SQ + " \n";
			G_INFO += " DEPT_SQ : " + DEPT_SQ + " \n";
			G_INFO += " PSNL_SQ : " + PSNL_SQ + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " BIRT_DT : " + BIRT_DT + " \n";
			G_INFO += " JOB_CD : " + JOB_CD + " \n";
			G_INFO += " ENTR_DT : " + ENTR_DT + " \n";
			G_INFO += " CHECKTO_DT : " + CHECKTO_DT + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
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
