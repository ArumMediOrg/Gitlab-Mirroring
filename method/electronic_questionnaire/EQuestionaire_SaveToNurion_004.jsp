<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_EQuestionaire_SaveToNurion_004.jsp"%>
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

		String SDATE = htMethod.get("SDATE");
		String SEXNO = htMethod.get("SEXNO");
		String SCTNO = htMethod.get("SCTNO");
		String SQTCD = htMethod.get("SQTCD");
		String SASCD = htMethod.get("SASCD");
		String SQTCP = htMethod.get("SQTCP");
		String SRSLT = htMethod.get("SRSLT");
		String SSCOR = htMethod.get("SSCOR");
		String SSCYN = htMethod.get("SSCYN");
		String ICNT = htMethod.get("ICNT");

		//
		if(SDATE == null) { SDATE = ""; }
		if(SEXNO == null) { SEXNO = ""; }
		if(SCTNO == null) { SCTNO = ""; }
		if(SQTCD == null) { SQTCD = ""; }
		if(SASCD == null) { SASCD = ""; }
		if(SQTCP == null) { SQTCP = ""; }
		if(SRSLT == null) { SRSLT = ""; }
		if(SSCOR == null) { SSCOR = ""; }
		if(SSCYN == null) { SSCYN = ""; }
		if(ICNT == null) { ICNT = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_EQuestionaire_SaveToNurion_004(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : EQuestionaire_SaveToNurion_004 \n";
			G_INFO += "설명 : 전자문진 데이터 입력 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SDATE : " + SDATE + " \n";
			G_INFO += " SEXNO : " + SEXNO + " \n";
			G_INFO += " SCTNO : " + SCTNO + " \n";
			G_INFO += " SQTCD : " + SQTCD + " \n";
			G_INFO += " SASCD : " + SASCD + " \n";
			G_INFO += " SQTCP : " + SQTCP + " \n";
			G_INFO += " SRSLT : " + SRSLT + " \n";
			G_INFO += " SSCOR : " + SSCOR + " \n";
			G_INFO += " SSCYN : " + SSCYN + " \n";
			G_INFO += " ICNT : " + ICNT + " \n";
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
