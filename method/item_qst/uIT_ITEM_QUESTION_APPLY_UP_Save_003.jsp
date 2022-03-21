<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uIT_ITEM_QUESTION_APPLY_UP_Save_003.jsp"%>
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

		String CHKBOXIIQ_USE_YN = htMethod.get("CHKBOXIIQ_USE_YN");
		String APLY_DT = htMethod.get("APLY_DT");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String SORT_NO = htMethod.get("SORT_NO");
		String QGTN_CD = htMethod.get("QGTN_CD");
		String ITQU_LV1 = htMethod.get("ITQU_LV1");
		String ITQU_LV2 = htMethod.get("ITQU_LV2");
		String ITQU_SQ = htMethod.get("ITQU_SQ");
		String ITQU_TX = htMethod.get("ITQU_TX");
		String INPT_ID = htMethod.get("INPT_ID");
		String ITQU_MC = htMethod.get("ITQU_MC");

		//
		if(CHKBOXIIQ_USE_YN == null) { CHKBOXIIQ_USE_YN = ""; }
		if(APLY_DT == null) { APLY_DT = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(SORT_NO == null) { SORT_NO = ""; }
		if(QGTN_CD == null) { QGTN_CD = ""; }
		if(ITQU_LV1 == null) { ITQU_LV1 = ""; }
		if(ITQU_LV2 == null) { ITQU_LV2 = ""; }
		if(ITQU_SQ == null) { ITQU_SQ = ""; }
		if(ITQU_TX == null) { ITQU_TX = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(ITQU_MC == null) { ITQU_MC = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uIT_ITEM_QUESTION_APPLY_UP_Save_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ITEM_QUESTION_APPLY_UP_Save_003 \n";
			G_INFO += "설명 : 문항정보 삭제 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHKBOXIIQ_USE_YN : " + CHKBOXIIQ_USE_YN + " \n";
			G_INFO += " APLY_DT : " + APLY_DT + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " SORT_NO : " + SORT_NO + " \n";
			G_INFO += " QGTN_CD : " + QGTN_CD + " \n";
			G_INFO += " ITQU_LV1 : " + ITQU_LV1 + " \n";
			G_INFO += " ITQU_LV2 : " + ITQU_LV2 + " \n";
			G_INFO += " ITQU_SQ : " + ITQU_SQ + " \n";
			G_INFO += " ITQU_TX : " + ITQU_TX + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " ITQU_MC : " + ITQU_MC + " \n";
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
