<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSP_PROF_APPLY_UF_Save_001.jsp"%>
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

		String CHKBOXCSP_USE_YN = htMethod.get("CHKBOXCSP_USE_YN");
		String JJ_CD = htMethod.get("JJ_CD");
		String SBCD_CD = htMethod.get("SBCD_CD");
		String JJ_NM = htMethod.get("JJ_NM");
		String JANGGI_CD = htMethod.get("JANGGI_CD");
		String CHASU = htMethod.get("CHASU");
		String CHOC_KD = htMethod.get("CHOC_KD");
		String INPT_ID = htMethod.get("INPT_ID");
		String NUSE_ID = htMethod.get("NUSE_ID");

		//
		if(CHKBOXCSP_USE_YN == null) { CHKBOXCSP_USE_YN = ""; }
		if(JJ_CD == null) { JJ_CD = ""; }
		if(SBCD_CD == null) { SBCD_CD = ""; }
		if(JJ_NM == null) { JJ_NM = ""; }
		if(JANGGI_CD == null) { JANGGI_CD = ""; }
		if(CHASU == null) { CHASU = ""; }
		if(CHOC_KD == null) { CHOC_KD = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSP_PROF_APPLY_UF_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_PROF_APPLY_UF_Save_001 \n";
			G_INFO += "설명 : 특검유형정보 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHKBOXCSP_USE_YN : " + CHKBOXCSP_USE_YN + " \n";
			G_INFO += " JJ_CD : " + JJ_CD + " \n";
			G_INFO += " SBCD_CD : " + SBCD_CD + " \n";
			G_INFO += " JJ_NM : " + JJ_NM + " \n";
			G_INFO += " JANGGI_CD : " + JANGGI_CD + " \n";
			G_INFO += " CHASU : " + CHASU + " \n";
			G_INFO += " CHOC_KD : " + CHOC_KD + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " NUSE_ID : " + NUSE_ID + " \n";
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
