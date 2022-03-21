<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSp_Health_Autopan_Set_Button2Click_001.jsp"%>
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

		String MRSLT_LOW = htMethod.get("MRSLT_LOW");
		String MRSLT_HIGH = htMethod.get("MRSLT_HIGH");
		String WRSLT_LOW = htMethod.get("WRSLT_LOW");
		String WRSLT_HIGH = htMethod.get("WRSLT_HIGH");
		String CHAR_VAL = htMethod.get("CHAR_VAL");
		String MODI_ID = htMethod.get("MODI_ID");
		String AUTO_CD = htMethod.get("AUTO_CD");
		String SBCD_CD = htMethod.get("SBCD_CD");

		//
		if(MRSLT_LOW == null) { MRSLT_LOW = ""; }
		if(MRSLT_HIGH == null) { MRSLT_HIGH = ""; }
		if(WRSLT_LOW == null) { WRSLT_LOW = ""; }
		if(WRSLT_HIGH == null) { WRSLT_HIGH = ""; }
		if(CHAR_VAL == null) { CHAR_VAL = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(AUTO_CD == null) { AUTO_CD = ""; }
		if(SBCD_CD == null) { SBCD_CD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSp_Health_Autopan_Set_Button2Click_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSp_Health_Autopan_Set_Button2Click_001 \n";
			G_INFO += "설명 : 특검 자동판정 검사항목 삭제 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MRSLT_LOW : " + MRSLT_LOW + " \n";
			G_INFO += " MRSLT_HIGH : " + MRSLT_HIGH + " \n";
			G_INFO += " WRSLT_LOW : " + WRSLT_LOW + " \n";
			G_INFO += " WRSLT_HIGH : " + WRSLT_HIGH + " \n";
			G_INFO += " CHAR_VAL : " + CHAR_VAL + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " AUTO_CD : " + AUTO_CD + " \n";
			G_INFO += " SBCD_CD : " + SBCD_CD + " \n";
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
