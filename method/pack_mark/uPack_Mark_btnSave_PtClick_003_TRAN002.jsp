<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uPack_Mark_btnSave_PtClick_003_TRAN002.jsp"%>
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

		String EDPRNT_TNM = htMethod.get("EDPRNT_TNM");
		String EDPRNT_HNM = htMethod.get("EDPRNT_HNM");
		String EDPRNT_SNM = htMethod.get("EDPRNT_SNM");
		String EDPRNT_ENM = htMethod.get("EDPRNT_ENM");
		String EDPRNT_CNM = htMethod.get("EDPRNT_CNM");
		String EDPRNT_JNM = htMethod.get("EDPRNT_JNM");
		String EDPRNT_RNM = htMethod.get("EDPRNT_RNM");
		String SHLTH_YN = htMethod.get("SHLTH_YN");
		String SSPCL_YN = htMethod.get("SSPCL_YN");
		String EDPRNT_PG = htMethod.get("EDPRNT_PG");
		String EDPRNT_SEQ = htMethod.get("EDPRNT_SEQ");
		String EDPRNT_FST = htMethod.get("EDPRNT_FST");
		String GUSER = htMethod.get("GUSER");
		String SPRNT_CD = htMethod.get("SPRNT_CD");
		String SMAX_SQ = htMethod.get("SMAX_SQ");

		//
		if(EDPRNT_TNM == null) { EDPRNT_TNM = ""; }
		if(EDPRNT_HNM == null) { EDPRNT_HNM = ""; }
		if(EDPRNT_SNM == null) { EDPRNT_SNM = ""; }
		if(EDPRNT_ENM == null) { EDPRNT_ENM = ""; }
		if(EDPRNT_CNM == null) { EDPRNT_CNM = ""; }
		if(EDPRNT_JNM == null) { EDPRNT_JNM = ""; }
		if(EDPRNT_RNM == null) { EDPRNT_RNM = ""; }
		if(SHLTH_YN == null) { SHLTH_YN = ""; }
		if(SSPCL_YN == null) { SSPCL_YN = ""; }
		if(EDPRNT_PG == null) { EDPRNT_PG = ""; }
		if(EDPRNT_SEQ == null) { EDPRNT_SEQ = ""; }
		if(EDPRNT_FST == null) { EDPRNT_FST = ""; }
		if(GUSER == null) { GUSER = ""; }
		if(SPRNT_CD == null) { SPRNT_CD = ""; }
		if(SMAX_SQ == null) { SMAX_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uPack_Mark_btnSave_PtClick_003_TRAN002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Mark_btnSave_PtClick_003_TRAN002 \n";
			G_INFO += "설명 : 표적묶음 정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EDPRNT_TNM : " + EDPRNT_TNM + " \n";
			G_INFO += " EDPRNT_HNM : " + EDPRNT_HNM + " \n";
			G_INFO += " EDPRNT_SNM : " + EDPRNT_SNM + " \n";
			G_INFO += " EDPRNT_ENM : " + EDPRNT_ENM + " \n";
			G_INFO += " EDPRNT_CNM : " + EDPRNT_CNM + " \n";
			G_INFO += " EDPRNT_JNM : " + EDPRNT_JNM + " \n";
			G_INFO += " EDPRNT_RNM : " + EDPRNT_RNM + " \n";
			G_INFO += " SHLTH_YN : " + SHLTH_YN + " \n";
			G_INFO += " SSPCL_YN : " + SSPCL_YN + " \n";
			G_INFO += " EDPRNT_PG : " + EDPRNT_PG + " \n";
			G_INFO += " EDPRNT_SEQ : " + EDPRNT_SEQ + " \n";
			G_INFO += " EDPRNT_FST : " + EDPRNT_FST + " \n";
			G_INFO += " GUSER : " + GUSER + " \n";
			G_INFO += " SPRNT_CD : " + SPRNT_CD + " \n";
			G_INFO += " SMAX_SQ : " + SMAX_SQ + " \n";
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
