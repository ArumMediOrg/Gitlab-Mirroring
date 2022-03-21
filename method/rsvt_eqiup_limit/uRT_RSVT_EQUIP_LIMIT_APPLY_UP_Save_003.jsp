<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uRT_RSVT_EQUIP_LIMIT_APPLY_UP_Save_003.jsp"%>
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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String WEEK_CD = htMethod.get("WEEK_CD");
		String TOT_CNT = htMethod.get("TOT_CNT");
		String PROC_CNT = htMethod.get("PROC_CNT");
		String INPT_ID = htMethod.get("INPT_ID");
		String SEXAM_DT = htMethod.get("SEXAM_DT");
		String SEQUI_CD = htMethod.get("SEQUI_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(WEEK_CD == null) { WEEK_CD = ""; }
		if(TOT_CNT == null) { TOT_CNT = ""; }
		if(PROC_CNT == null) { PROC_CNT = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(SEXAM_DT == null) { SEXAM_DT = ""; }
		if(SEQUI_CD == null) { SEQUI_CD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uRT_RSVT_EQUIP_LIMIT_APPLY_UP_Save_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_RSVT_EQUIP_LIMIT_APPLY_UP_Save_003 \n";
			G_INFO += "설명 : 예약장비 제한 개별 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " WEEK_CD : " + WEEK_CD + " \n";
			G_INFO += " TOT_CNT : " + TOT_CNT + " \n";
			G_INFO += " PROC_CNT : " + PROC_CNT + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " SEXAM_DT : " + SEXAM_DT + " \n";
			G_INFO += " SEQUI_CD : " + SEQUI_CD + " \n";
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
