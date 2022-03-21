<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uPack_Mark_btnSave_VwClick_003_TRAN002.jsp"%>
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

		String EDMARK_TNM = htMethod.get("EDMARK_TNM");
		String EDMARK_HNM = htMethod.get("EDMARK_HNM");
		String EDMARK_SNM = htMethod.get("EDMARK_SNM");
		String EDMARK_ENM = htMethod.get("EDMARK_ENM");
		String EDMARK_CNM = htMethod.get("EDMARK_CNM");
		String EDMARK_JNM = htMethod.get("EDMARK_JNM");
		String EDMARK_RNM = htMethod.get("EDMARK_RNM");
		String SHLTH_YN = htMethod.get("SHLTH_YN");
		String SSPCL_YN = htMethod.get("SSPCL_YN");
		String GUSER = htMethod.get("GUSER");
		String SVIEW_CD = htMethod.get("SVIEW_CD");
		String SMAX_SQ = htMethod.get("SMAX_SQ");

		//
		if(EDMARK_TNM == null) { EDMARK_TNM = ""; }
		if(EDMARK_HNM == null) { EDMARK_HNM = ""; }
		if(EDMARK_SNM == null) { EDMARK_SNM = ""; }
		if(EDMARK_ENM == null) { EDMARK_ENM = ""; }
		if(EDMARK_CNM == null) { EDMARK_CNM = ""; }
		if(EDMARK_JNM == null) { EDMARK_JNM = ""; }
		if(EDMARK_RNM == null) { EDMARK_RNM = ""; }
		if(SHLTH_YN == null) { SHLTH_YN = ""; }
		if(SSPCL_YN == null) { SSPCL_YN = ""; }
		if(GUSER == null) { GUSER = ""; }
		if(SVIEW_CD == null) { SVIEW_CD = ""; }
		if(SMAX_SQ == null) { SMAX_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uPack_Mark_btnSave_VwClick_003_TRAN002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Mark_btnSave_VwClick_003_TRAN002 \n";
			G_INFO += "설명 : 표적묶음 정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EDMARK_TNM : " + EDMARK_TNM + " \n";
			G_INFO += " EDMARK_HNM : " + EDMARK_HNM + " \n";
			G_INFO += " EDMARK_SNM : " + EDMARK_SNM + " \n";
			G_INFO += " EDMARK_ENM : " + EDMARK_ENM + " \n";
			G_INFO += " EDMARK_CNM : " + EDMARK_CNM + " \n";
			G_INFO += " EDMARK_JNM : " + EDMARK_JNM + " \n";
			G_INFO += " EDMARK_RNM : " + EDMARK_RNM + " \n";
			G_INFO += " SHLTH_YN : " + SHLTH_YN + " \n";
			G_INFO += " SSPCL_YN : " + SSPCL_YN + " \n";
			G_INFO += " GUSER : " + GUSER + " \n";
			G_INFO += " SVIEW_CD : " + SVIEW_CD + " \n";
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
