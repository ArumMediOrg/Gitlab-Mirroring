<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uManage_Finding_Apply_ufSave_001.jsp"%>
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

		String SMODE = htMethod.get("SMODE");
		String RSLT_CD = htMethod.get("RSLT_CD");
		String TITLE_NM = htMethod.get("TITLE_NM");
		String RSLT_EX = htMethod.get("RSLT_EX");
		String ITEM_CD1 = htMethod.get("ITEM_CD1");
		String ITEM_CD2 = htMethod.get("ITEM_CD2");
		String ITEM_CD3 = htMethod.get("ITEM_CD3");
		String ITEM_CD4 = htMethod.get("ITEM_CD4");
		String PART_CD = htMethod.get("PART_CD");
		String SUB_CD = htMethod.get("SUB_CD");
		String USE_YN = htMethod.get("USE_YN");
		String NUSE_ID = htMethod.get("NUSE_ID");
		String USER_ID = htMethod.get("USER_ID");

		//
		if(SMODE == null) { SMODE = ""; }
		if(RSLT_CD == null) { RSLT_CD = ""; }
		if(TITLE_NM == null) { TITLE_NM = ""; }
		if(RSLT_EX == null) { RSLT_EX = ""; }
		if(ITEM_CD1 == null) { ITEM_CD1 = ""; }
		if(ITEM_CD2 == null) { ITEM_CD2 = ""; }
		if(ITEM_CD3 == null) { ITEM_CD3 = ""; }
		if(ITEM_CD4 == null) { ITEM_CD4 = ""; }
		if(PART_CD == null) { PART_CD = ""; }
		if(SUB_CD == null) { SUB_CD = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }
		if(USER_ID == null) { USER_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uManage_Finding_Apply_ufSave_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uManage_Finding_Apply_ufSave_001 \n";
			G_INFO += "설명 : 소견코드 저장(inert,updaet) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " RSLT_CD : " + RSLT_CD + " \n";
			G_INFO += " TITLE_NM : " + TITLE_NM + " \n";
			G_INFO += " RSLT_EX : " + RSLT_EX + " \n";
			G_INFO += " ITEM_CD1 : " + ITEM_CD1 + " \n";
			G_INFO += " ITEM_CD2 : " + ITEM_CD2 + " \n";
			G_INFO += " ITEM_CD3 : " + ITEM_CD3 + " \n";
			G_INFO += " ITEM_CD4 : " + ITEM_CD4 + " \n";
			G_INFO += " PART_CD : " + PART_CD + " \n";
			G_INFO += " SUB_CD : " + SUB_CD + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " NUSE_ID : " + NUSE_ID + " \n";
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
