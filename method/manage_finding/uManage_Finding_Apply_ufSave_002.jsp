<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uManage_Finding_Apply_ufSave_002.jsp"%>
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

		String TITLE_NM = htMethod.get("TITLE_NM");
		String RSLT_EX = htMethod.get("RSLT_EX");
		String ERSLT_EX = htMethod.get("ERSLT_EX");
		String CRSLT_EX = htMethod.get("CRSLT_EX");
		String RRSLT_EX = htMethod.get("RRSLT_EX");
		String JRSLT_EX = htMethod.get("JRSLT_EX");
		String ITEM_CD1 = htMethod.get("ITEM_CD1");
		String ITEM_CD2 = htMethod.get("ITEM_CD2");
		String ITEM_CD3 = htMethod.get("ITEM_CD3");
		String ITEM_CD4 = htMethod.get("ITEM_CD4");
		String PART_CD = htMethod.get("PART_CD");
		String SUB_CD = htMethod.get("SUB_CD");
		String USE_YN = htMethod.get("USE_YN");
		String COMM_YN = htMethod.get("COMM_YN");
		String SUB2_CD = htMethod.get("SUB2_CD");
		String RSLT_PANJ = htMethod.get("RSLT_PANJ");
		String MODI_ID = htMethod.get("MODI_ID");
		String RGPIFG_USE_YN = htMethod.get("RGPIFG_USE_YN");
		String NUSE_ID = htMethod.get("NUSE_ID");
		String RSLT_CD = htMethod.get("RSLT_CD");

		//
		if(TITLE_NM == null) { TITLE_NM = ""; }
		if(RSLT_EX == null) { RSLT_EX = ""; }
		if(ERSLT_EX == null) { ERSLT_EX = ""; }
		if(CRSLT_EX == null) { CRSLT_EX = ""; }
		if(RRSLT_EX == null) { RRSLT_EX = ""; }
		if(JRSLT_EX == null) { JRSLT_EX = ""; }
		if(ITEM_CD1 == null) { ITEM_CD1 = ""; }
		if(ITEM_CD2 == null) { ITEM_CD2 = ""; }
		if(ITEM_CD3 == null) { ITEM_CD3 = ""; }
		if(ITEM_CD4 == null) { ITEM_CD4 = ""; }
		if(PART_CD == null) { PART_CD = ""; }
		if(SUB_CD == null) { SUB_CD = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(COMM_YN == null) { COMM_YN = ""; }
		if(SUB2_CD == null) { SUB2_CD = ""; }
		if(RSLT_PANJ == null) { RSLT_PANJ = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(RGPIFG_USE_YN == null) { RGPIFG_USE_YN = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }
		if(RSLT_CD == null) { RSLT_CD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uManage_Finding_Apply_ufSave_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uManage_Finding_Apply_ufSave_002 \n";
			G_INFO += "설명 : 소견정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " TITLE_NM : " + TITLE_NM + " \n";
			G_INFO += " RSLT_EX : " + RSLT_EX + " \n";
			G_INFO += " ERSLT_EX : " + ERSLT_EX + " \n";
			G_INFO += " CRSLT_EX : " + CRSLT_EX + " \n";
			G_INFO += " RRSLT_EX : " + RRSLT_EX + " \n";
			G_INFO += " JRSLT_EX : " + JRSLT_EX + " \n";
			G_INFO += " ITEM_CD1 : " + ITEM_CD1 + " \n";
			G_INFO += " ITEM_CD2 : " + ITEM_CD2 + " \n";
			G_INFO += " ITEM_CD3 : " + ITEM_CD3 + " \n";
			G_INFO += " ITEM_CD4 : " + ITEM_CD4 + " \n";
			G_INFO += " PART_CD : " + PART_CD + " \n";
			G_INFO += " SUB_CD : " + SUB_CD + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " COMM_YN : " + COMM_YN + " \n";
			G_INFO += " SUB2_CD : " + SUB2_CD + " \n";
			G_INFO += " RSLT_PANJ : " + RSLT_PANJ + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " RGPIFG_USE_YN : " + RGPIFG_USE_YN + " \n";
			G_INFO += " NUSE_ID : " + NUSE_ID + " \n";
			G_INFO += " RSLT_CD : " + RSLT_CD + " \n";
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
