<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;
	CallableStatement CallStmtExec = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String ASRCPTDT = htMethod.get("ASRCPTDT");
		String ASRCPTSQ = htMethod.get("ASRCPTSQ");
		String ASITEMCD = htMethod.get("ASITEMCD");

		//
		if(ASRCPTDT == null) { ASRCPTDT = ""; }
		if(ASRCPTSQ == null) { ASRCPTSQ = ""; }
		if(ASITEMCD == null) { ASITEMCD = ""; }

		// SP사용
		sql = "{call SP_GETPANJUNG_ITEM(?, ?, ?)}";
		CallStmtExec = connect.prepareCall(sql);

		CallStmtExec.setString(1,  ASRCPTDT);
		CallStmtExec.setString(2,  ASRCPTSQ);
		CallStmtExec.setString(3,  ASITEMCD);

		CallStmtExec.executeUpdate();

		//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uSP_Health_ufGetPanJungItem_001 \n";
		G_INFO += "설명 : 검사항목(해당검사항목)자동판정 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " ASRCPTDT : " + ASRCPTDT + " \n";
		G_INFO += " ASRCPTSQ : " + ASRCPTSQ + " \n";
		G_INFO += " ASITEMCD : " + ASITEMCD + " \n";
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

		if(CallStmtExec != null) {
			CallStmtExec.close();
			CallStmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
