<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uKUMC_Point_Management_usePoint_001.jsp"%>
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

		String RECE_NO = htMethod.get("RECE_NO");
		String USE_YYYYMM = htMethod.get("USE_YYYYMM");
		String EMPL_NO = htMethod.get("EMPL_NO");
		String LOCAL_NM = htMethod.get("LOCAL_NM");
		String EMPL_NM = htMethod.get("EMPL_NM");
		String DEPT_NM = htMethod.get("DEPT_NM");

		if(RECE_NO == null) { RECE_NO = ""; }
		if(USE_YYYYMM == null) { USE_YYYYMM = ""; }
		if(EMPL_NO == null) { EMPL_NO = ""; }
		if(LOCAL_NM == null) { LOCAL_NM = ""; }
		if(EMPL_NM == null) { EMPL_NM = ""; }
		if(DEPT_NM == null) { DEPT_NM = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uKUMC_Point_Management_usePoint_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uKUMC_Point_Management_usePoint_001 \n";
			G_INFO += "설명 : SMS 로그 삭제 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RECE_NO : " + RECE_NO + " \n";
			G_INFO += " USE_YYYYMM : " + USE_YYYYMM + " \n";
			G_INFO += " EMPL_NO : " + EMPL_NO + " \n";
			G_INFO += " LOCAL_NM : " + LOCAL_NM + " \n";
			G_INFO += " EMPL_NM : " + EMPL_NM + " \n";
			G_INFO += " DEPT_NM : " + DEPT_NM + " \n";

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
