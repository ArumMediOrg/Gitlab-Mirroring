<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSp_Health_Autopan_Set_Button5Click_002.jsp"%>
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

		String AUTO_CD = htMethod.get("AUTO_CD");
		String ORGA_CD = htMethod.get("ORGA_CD");
		String SBCD_CD = htMethod.get("SBCD_CD");
		String MRSLT_LOW = htMethod.get("MRSLT_LOW");
		String MRSLT_HIGH = htMethod.get("MRSLT_HIGH");
		String WRSLT_LOW = htMethod.get("WRSLT_LOW");
		String WRSLT_HIGH = htMethod.get("WRSLT_HIGH");
		String CHAR_VAL = htMethod.get("CHAR_VAL");
		String USE_YN = htMethod.get("USE_YN");
		String INPT_ID = htMethod.get("INPT_ID");

		//
		if(AUTO_CD == null) { AUTO_CD = ""; }
		if(ORGA_CD == null) { ORGA_CD = ""; }
		if(SBCD_CD == null) { SBCD_CD = ""; }
		if(MRSLT_LOW == null) { MRSLT_LOW = ""; }
		if(MRSLT_HIGH == null) { MRSLT_HIGH = ""; }
		if(WRSLT_LOW == null) { WRSLT_LOW = ""; }
		if(WRSLT_HIGH == null) { WRSLT_HIGH = ""; }
		if(CHAR_VAL == null) { CHAR_VAL = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSp_Health_Autopan_Set_Button5Click_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSp_Health_Autopan_Set_Button5Click_002 \n";
			G_INFO += "설명 : 특검 자동판정 정보 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " AUTO_CD : " + AUTO_CD + " \n";
			G_INFO += " ORGA_CD : " + ORGA_CD + " \n";
			G_INFO += " SBCD_CD : " + SBCD_CD + " \n";
			G_INFO += " MRSLT_LOW : " + MRSLT_LOW + " \n";
			G_INFO += " MRSLT_HIGH : " + MRSLT_HIGH + " \n";
			G_INFO += " WRSLT_LOW : " + WRSLT_LOW + " \n";
			G_INFO += " WRSLT_HIGH : " + WRSLT_HIGH + " \n";
			G_INFO += " CHAR_VAL : " + CHAR_VAL + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
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
