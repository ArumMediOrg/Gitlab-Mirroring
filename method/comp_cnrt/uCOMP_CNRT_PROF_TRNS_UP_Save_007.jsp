<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCOMP_CNRT_PROF_TRNS_UP_Save_007.jsp"%>
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

		String MNGT_YR = htMethod.get("MNGT_YR");
		String CNRT_SQ = htMethod.get("CNRT_SQ");
		String PROF_SQ = htMethod.get("PROF_SQ");
		String USER_ID = htMethod.get("USER_ID");
		String SCOMP_CD = htMethod.get("SCOMP_CD");
		String SMNGT_YR = htMethod.get("SMNGT_YR");
		String SCNRT_SQ = htMethod.get("SCNRT_SQ");
		String SPROF_SQ = htMethod.get("SPROF_SQ");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(SCOMP_CD == null) { SCOMP_CD = ""; }
		if(SMNGT_YR == null) { SMNGT_YR = ""; }
		if(SCNRT_SQ == null) { SCNRT_SQ = ""; }
		if(SPROF_SQ == null) { SPROF_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCOMP_CNRT_PROF_TRNS_UP_Save_007(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_PROF_TRNS_UP_Save_007 \n";
			G_INFO += "설명 : 최신금액 자료이관(옵션항목inset)    :작업시 uCOMP_CNRT_PROF_TRNS_UP_Save_003 참조(똑같음) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " SCOMP_CD : " + SCOMP_CD + " \n";
			G_INFO += " SMNGT_YR : " + SMNGT_YR + " \n";
			G_INFO += " SCNRT_SQ : " + SCNRT_SQ + " \n";
			G_INFO += " SPROF_SQ : " + SPROF_SQ + " \n";
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
