<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uPack_Each_btnSaveClick_M11_015.jsp"%>
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

		String EXAM_CD = htMethod.get("EXAM_CD");
		String PACK_SQ = htMethod.get("PACK_SQ");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String SORT_SQ = htMethod.get("SORT_SQ");
		String ITEM_PR = htMethod.get("ITEM_PR");
		String SALE_PR = htMethod.get("SALE_PR");
		String GRUP_PR = htMethod.get("GRUP_PR");
		String COUP_PR = htMethod.get("COUP_PR");
		String FAMY_PR = htMethod.get("FAMY_PR");
		String CUPN_PR = htMethod.get("CUPN_PR");
		String MMBR_PR = htMethod.get("MMBR_PR");
		String INPT_ID = htMethod.get("INPT_ID");
		String MODI_ID = htMethod.get("MODI_ID");

		//
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(PACK_SQ == null) { PACK_SQ = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(SORT_SQ == null) { SORT_SQ = ""; }
		if(ITEM_PR == null) { ITEM_PR = ""; }
		if(SALE_PR == null) { SALE_PR = ""; }
		if(GRUP_PR == null) { GRUP_PR = ""; }
		if(COUP_PR == null) { COUP_PR = ""; }
		if(FAMY_PR == null) { FAMY_PR = ""; }
		if(CUPN_PR == null) { CUPN_PR = ""; }
		if(MMBR_PR == null) { MMBR_PR = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uPack_Each_btnSaveClick_M11_015(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Each_btnSaveClick_M11_015 \n";
			G_INFO += "설명 : 묶음 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " PACK_SQ : " + PACK_SQ + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " SORT_SQ : " + SORT_SQ + " \n";
			G_INFO += " ITEM_PR : " + ITEM_PR + " \n";
			G_INFO += " SALE_PR : " + SALE_PR + " \n";
			G_INFO += " GRUP_PR : " + GRUP_PR + " \n";
			G_INFO += " COUP_PR : " + COUP_PR + " \n";
			G_INFO += " FAMY_PR : " + FAMY_PR + " \n";
			G_INFO += " CUPN_PR : " + CUPN_PR + " \n";
			G_INFO += " MMBR_PR : " + MMBR_PR + " \n";
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
