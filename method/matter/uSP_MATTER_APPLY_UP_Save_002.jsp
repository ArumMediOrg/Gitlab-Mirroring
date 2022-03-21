<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSP_MATTER_APPLY_UP_Save_002.jsp"%>
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

		String CHKBOXCSM_USE_YN = htMethod.get("CHKBOXCSM_USE_YN");
		String LARGE = htMethod.get("LARGE");
		String MATT_NM = htMethod.get("MATT_NM");
		String JIB_CD = htMethod.get("JIB_CD");
		String INJA_CD = htMethod.get("INJA_CD");
		String PERIOD_TM = htMethod.get("PERIOD_TM");
		String AFTER_TM = htMethod.get("AFTER_TM");
		String COMM_CD = htMethod.get("COMM_CD");
		String STAT_YR = htMethod.get("STAT_YR");
		String MODI_ID = htMethod.get("MODI_ID");
		String MATT_CD = htMethod.get("MATT_CD");
		String NUSE_ID = htMethod.get("NUSE_ID");

		//
		if(CHKBOXCSM_USE_YN == null) { CHKBOXCSM_USE_YN = ""; }
		if(LARGE == null) { LARGE = ""; }
		if(MATT_NM == null) { MATT_NM = ""; }
		if(JIB_CD == null) { JIB_CD = ""; }
		if(INJA_CD == null) { INJA_CD = ""; }
		if(PERIOD_TM == null) { PERIOD_TM = ""; }
		if(AFTER_TM == null) { AFTER_TM = ""; }
		if(COMM_CD == null) { COMM_CD = ""; }
		if(STAT_YR == null) { STAT_YR = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(MATT_CD == null) { MATT_CD = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSP_MATTER_APPLY_UP_Save_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_MATTER_APPLY_UP_Save_002 \n";
			G_INFO += "설명 : 특검문진정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHKBOXCSM_USE_YN : " + CHKBOXCSM_USE_YN + " \n";
			G_INFO += " LARGE : " + LARGE + " \n";
			G_INFO += " MATT_NM : " + MATT_NM + " \n";
			G_INFO += " JIB_CD : " + JIB_CD + " \n";
			G_INFO += " INJA_CD : " + INJA_CD + " \n";
			G_INFO += " PERIOD_TM : " + PERIOD_TM + " \n";
			G_INFO += " AFTER_TM : " + AFTER_TM + " \n";
			G_INFO += " COMM_CD : " + COMM_CD + " \n";
			G_INFO += " STAT_YR : " + STAT_YR + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " MATT_CD : " + MATT_CD + " \n";
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
