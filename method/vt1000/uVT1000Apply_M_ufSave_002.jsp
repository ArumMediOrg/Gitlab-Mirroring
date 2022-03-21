<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uVT1000Apply_M_ufSave_002.jsp"%>
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

		String RSLT_CD = htMethod.get("RSLT_CD");
		String DEV_CD = htMethod.get("DEV_CD");
		String FIND_CD = htMethod.get("FIND_CD");
		String DISE_CD = htMethod.get("DISE_CD");
		String ORDR_SQ = htMethod.get("ORDR_SQ");
		String TITL_NM = htMethod.get("TITL_NM");
		String CONT_EX = htMethod.get("CONT_EX");
		String POST_CD = htMethod.get("POST_CD");
		String ACTN_CD = htMethod.get("ACTN_CD");
		String USE_YN = htMethod.get("USE_YN");
		String INPT_ID = htMethod.get("INPT_ID");
		String MARK_ADD_TX = htMethod.get("MARK_ADD_TX");
		String DEV_ADD_TX = htMethod.get("DEV_ADD_TX");
		String AFTE_MON = htMethod.get("AFTE_MON");

		//
		if(RSLT_CD == null) { RSLT_CD = ""; }
		if(DEV_CD == null) { DEV_CD = ""; }
		if(FIND_CD == null) { FIND_CD = ""; }
		if(DISE_CD == null) { DISE_CD = ""; }
		if(ORDR_SQ == null) { ORDR_SQ = ""; }
		if(TITL_NM == null) { TITL_NM = ""; }
		if(CONT_EX == null) { CONT_EX = ""; }
		if(POST_CD == null) { POST_CD = ""; }
		if(ACTN_CD == null) { ACTN_CD = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(MARK_ADD_TX == null) { MARK_ADD_TX = ""; }
		if(DEV_ADD_TX == null) { DEV_ADD_TX = ""; }
		if(AFTE_MON == null) { AFTE_MON = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uVT1000Apply_M_ufSave_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uVT1000Apply_M_ufSave_002 \n";
			G_INFO += "설명 : 소견 결과 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSLT_CD : " + RSLT_CD + " \n";
			G_INFO += " DEV_CD : " + DEV_CD + " \n";
			G_INFO += " FIND_CD : " + FIND_CD + " \n";
			G_INFO += " DISE_CD : " + DISE_CD + " \n";
			G_INFO += " ORDR_SQ : " + ORDR_SQ + " \n";
			G_INFO += " TITL_NM : " + TITL_NM + " \n";
			G_INFO += " CONT_EX : " + CONT_EX + " \n";
			G_INFO += " POST_CD : " + POST_CD + " \n";
			G_INFO += " ACTN_CD : " + ACTN_CD + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " MARK_ADD_TX : " + MARK_ADD_TX + " \n";
			G_INFO += " DEV_ADD_TX : " + DEV_ADD_TX + " \n";
			G_INFO += " AFTE_MON : " + AFTE_MON + " \n";
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
