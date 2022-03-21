<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uItem_Call_ufSaveItem_Call_003.jsp"%>
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

		String EXAM_YR = htMethod.get("EXAM_YR");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String HLTH_KD = htMethod.get("HLTH_KD");
		String CAN_KD = htMethod.get("CAN_KD");
		String STDT_KD = htMethod.get("STDT_KD");
		String STDTO_KD = htMethod.get("STDTO_KD");
		String INPT_ID = htMethod.get("INPT_ID");
		String MODI_ID = htMethod.get("MODI_ID");

		//
		if(EXAM_YR == null) { EXAM_YR = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(HLTH_KD == null) { HLTH_KD = ""; }
		if(CAN_KD == null) { CAN_KD = ""; }
		if(STDT_KD == null) { STDT_KD = ""; }
		if(STDTO_KD == null) { STDTO_KD = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uItem_Call_ufSaveItem_Call_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Call_ufSaveItem_Call_003 \n";
			G_INFO += "설명 : 특정 항목값 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_YR : " + EXAM_YR + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " HLTH_KD : " + HLTH_KD + " \n";
			G_INFO += " CAN_KD : " + CAN_KD + " \n";
			G_INFO += " STDT_KD : " + STDT_KD + " \n";
			G_INFO += " STDTO_KD : " + STDTO_KD + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
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
