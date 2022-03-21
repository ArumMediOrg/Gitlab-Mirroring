<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_ubT_Rece_XML_COM_SUIN_003.jsp"%>
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

		String RECE_SEQ = htMethod.get("RECE_SEQ");
		String RECE_DT = htMethod.get("RECE_DT");
		String OCCU_KD = htMethod.get("OCCU_KD");
		String RETURN_PR = htMethod.get("RETURN_PR");
		String SRECE_SEQ = htMethod.get("SRECE_SEQ");
		String USER_ID = htMethod.get("USER_ID");
		String SRECE_NO = htMethod.get("SRECE_NO");

		//
		if(RECE_SEQ == null) { RECE_SEQ = ""; }
		if(RECE_DT == null) { RECE_DT = ""; }
		if(OCCU_KD == null) { OCCU_KD = ""; }
		if(RETURN_PR == null) { RETURN_PR = ""; }
		if(SRECE_SEQ == null) { SRECE_SEQ = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(SRECE_NO == null) { SRECE_NO = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_ubT_Rece_XML_COM_SUIN_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubT_Rece_XML_COM_SUIN_003 \n";
			G_INFO += "설명 : 환급저장(수기) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RECE_SEQ : " + RECE_SEQ + " \n";
			G_INFO += " RECE_DT : " + RECE_DT + " \n";
			G_INFO += " OCCU_KD : " + OCCU_KD + " \n";
			G_INFO += " RETURN_PR : " + RETURN_PR + " \n";
			G_INFO += " SRECE_SEQ : " + SRECE_SEQ + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " SRECE_NO : " + SRECE_NO + " \n";
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
