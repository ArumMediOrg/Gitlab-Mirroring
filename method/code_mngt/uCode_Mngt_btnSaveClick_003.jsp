<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCode_Mngt_btnSaveClick_003.jsp"%>
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

		String STRLARGE = htMethod.get("STRLARGE");
		String STRSMALL = htMethod.get("STRSMALL");
		String EDCD_FULL_NM = htMethod.get("EDCD_FULL_NM");
		String EDCD_SHRT_NM = htMethod.get("EDCD_SHRT_NM");
		String EDCD_VALUE = htMethod.get("EDCD_VALUE");
		String EDCD_REL = htMethod.get("EDCD_REL");
		String EDCD_RMK = htMethod.get("EDCD_RMK");
		String STRUSE = htMethod.get("STRUSE");
		String GUSER1 = htMethod.get("GUSER1");
		String GUSER2 = htMethod.get("GUSER2");

		//
		if(STRLARGE == null) { STRLARGE = ""; }
		if(STRSMALL == null) { STRSMALL = ""; }
		if(EDCD_FULL_NM == null) { EDCD_FULL_NM = ""; }
		if(EDCD_SHRT_NM == null) { EDCD_SHRT_NM = ""; }
		if(EDCD_VALUE == null) { EDCD_VALUE = ""; }
		if(EDCD_REL == null) { EDCD_REL = ""; }
		if(EDCD_RMK == null) { EDCD_RMK = ""; }
		if(STRUSE == null) { STRUSE = ""; }
		if(GUSER1 == null) { GUSER1 = ""; }
		if(GUSER2 == null) { GUSER2 = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCode_Mngt_btnSaveClick_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCode_Mngt_btnSaveClick_003 \n";
			G_INFO += "설명 : 코드정보 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " STRLARGE : " + STRLARGE + " \n";
			G_INFO += " STRSMALL : " + STRSMALL + " \n";
			G_INFO += " EDCD_FULL_NM : " + EDCD_FULL_NM + " \n";
			G_INFO += " EDCD_SHRT_NM : " + EDCD_SHRT_NM + " \n";
			G_INFO += " EDCD_VALUE : " + EDCD_VALUE + " \n";
			G_INFO += " EDCD_REL : " + EDCD_REL + " \n";
			G_INFO += " EDCD_RMK : " + EDCD_RMK + " \n";
			G_INFO += " STRUSE : " + STRUSE + " \n";
			G_INFO += " GUSER1 : " + GUSER1 + " \n";
			G_INFO += " GUSER2 : " + GUSER2 + " \n";
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
