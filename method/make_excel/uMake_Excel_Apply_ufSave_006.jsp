<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uMake_Excel_Apply_ufSave_006.jsp"%>
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

		String PACK_CD = htMethod.get("PACK_CD");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String ITEM_NM = htMethod.get("ITEM_NM");
		String ITEM_KD = htMethod.get("ITEM_KD");
		String ITEM_SQ = htMethod.get("ITEM_SQ");
		String COLM_DT = htMethod.get("COLM_DT");
		String COLM_SQ = htMethod.get("COLM_SQ");
		String TLBE_NM = htMethod.get("TLBE_NM");
		String COMM_SP = htMethod.get("COMM_SP");
		String INPT_ID = htMethod.get("INPT_ID");

		//
		if(PACK_CD == null) { PACK_CD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(ITEM_NM == null) { ITEM_NM = ""; }
		if(ITEM_KD == null) { ITEM_KD = ""; }
		if(ITEM_SQ == null) { ITEM_SQ = ""; }
		if(COLM_DT == null) { COLM_DT = ""; }
		if(COLM_SQ == null) { COLM_SQ = ""; }
		if(TLBE_NM == null) { TLBE_NM = ""; }
		if(COMM_SP == null) { COMM_SP = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uMake_Excel_Apply_ufSave_006(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMake_Excel_Apply_ufSave_006 \n";
			G_INFO += "설명 : 엑셀 검사정보 로그 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PACK_CD : " + PACK_CD + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " ITEM_NM : " + ITEM_NM + " \n";
			G_INFO += " ITEM_KD : " + ITEM_KD + " \n";
			G_INFO += " ITEM_SQ : " + ITEM_SQ + " \n";
			G_INFO += " COLM_DT : " + COLM_DT + " \n";
			G_INFO += " COLM_SQ : " + COLM_SQ + " \n";
			G_INFO += " TLBE_NM : " + TLBE_NM + " \n";
			G_INFO += " COMM_SP : " + COMM_SP + " \n";
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
