<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSP_PostManagement_CustList_APPLY_UP_Save_001.jsp"%>
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
		String ADVI_DT = htMethod.get("ADVI_DT");
		String CUST_NO = htMethod.get("CUST_NO");
		String ADVI_SQ = htMethod.get("ADVI_SQ");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String EXAM_CHA = htMethod.get("EXAM_CHA");
		String NEXT_DT = htMethod.get("NEXT_DT");
		String ADVI_CD = htMethod.get("ADVI_CD");
		String ADVI_TX = htMethod.get("ADVI_TX");
		String NURSE_ID = htMethod.get("NURSE_ID");
		String DOCT_ID = htMethod.get("DOCT_ID");
		String USER_ID = htMethod.get("USER_ID");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(ADVI_DT == null) { ADVI_DT = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }
		if(ADVI_SQ == null) { ADVI_SQ = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(EXAM_CHA == null) { EXAM_CHA = ""; }
		if(NEXT_DT == null) { NEXT_DT = ""; }
		if(ADVI_CD == null) { ADVI_CD = ""; }
		if(ADVI_TX == null) { ADVI_TX = ""; }
		if(NURSE_ID == null) { NURSE_ID = ""; }
		if(DOCT_ID == null) { DOCT_ID = ""; }
		if(USER_ID == null) { USER_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSP_PostManagement_CustList_APPLY_UP_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_PostManagement_CustList_APPLY_UP_Save_001 \n";
			G_INFO += "설명 : 상담 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " ADVI_DT : " + ADVI_DT + " \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " ADVI_SQ : " + ADVI_SQ + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " EXAM_CHA : " + EXAM_CHA + " \n";
			G_INFO += " NEXT_DT : " + NEXT_DT + " \n";
			G_INFO += " ADVI_CD : " + ADVI_CD + " \n";
			G_INFO += " ADVI_TX : " + ADVI_TX + " \n";
			G_INFO += " NURSE_ID : " + NURSE_ID + " \n";
			G_INFO += " DOCT_ID : " + DOCT_ID + " \n";
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
