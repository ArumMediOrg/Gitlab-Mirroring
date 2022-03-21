<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uRsvn_Acpt_UF_EquipUpdate_002.jsp"%>
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

		String RSVN_CNT = htMethod.get("RSVN_CNT");
		String PROC_CNT = htMethod.get("PROC_CNT");
		String CUST_LT = htMethod.get("CUST_LT");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EQUI_CD = htMethod.get("EQUI_CD");
		String TIME_SQ = htMethod.get("TIME_SQ");

		//
		if(RSVN_CNT == null) { RSVN_CNT = ""; }
		if(PROC_CNT == null) { PROC_CNT = ""; }
		if(CUST_LT == null) { CUST_LT = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EQUI_CD == null) { EQUI_CD = ""; }
		if(TIME_SQ == null) { TIME_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uRsvn_Acpt_UF_EquipUpdate_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_UF_EquipUpdate_002 \n";
			G_INFO += "설명 : 장비 예약건수 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSVN_CNT : " + RSVN_CNT + " \n";
			G_INFO += " PROC_CNT : " + PROC_CNT + " \n";
			G_INFO += " CUST_LT : " + CUST_LT + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EQUI_CD : " + EQUI_CD + " \n";
			G_INFO += " TIME_SQ : " + TIME_SQ + " \n";
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
