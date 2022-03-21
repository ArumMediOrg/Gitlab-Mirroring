<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCOMPANY_CD_CHANGE_BtnSaveClick_001.jsp"%>
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

		String SNEW_COMP = htMethod.get("SNEW_COMP");
		String SUSE_YN = htMethod.get("SUSE_YN");
		String USER_ID = htMethod.get("USER_ID");
		String EDCOMP_CDB = htMethod.get("EDCOMP_CDB");

		//
		if(SNEW_COMP == null) { SNEW_COMP = ""; }
		if(SUSE_YN == null) { SUSE_YN = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(EDCOMP_CDB == null) { EDCOMP_CDB = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCOMPANY_CD_CHANGE_BtnSaveClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMPANY_CD_CHANGE_BtnSaveClick_001 \n";
			G_INFO += "설명 : 사업자번호변경(선택변경이면) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SNEW_COMP : " + SNEW_COMP + " \n";
			G_INFO += " SUSE_YN : " + SUSE_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " EDCOMP_CDB : " + EDCOMP_CDB + " \n";
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
