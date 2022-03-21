<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uFM_AcptComm_GF_UdtOneColumn_001.jsp"%>
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

		String CON_NAME_1 = htMethod.get("CON_NAME_1");
		String CON_NAME_2 = htMethod.get("CON_NAME_2");
		String CON_NAME_3 = htMethod.get("CON_NAME_3");
		String CON_COLUMN_S = htMethod.get("CON_COLUMN_S");
		String CON_COLUMN_1 = htMethod.get("CON_COLUMN_1");
		String CON_COLUMN_2 = htMethod.get("CON_COLUMN_2");
		String CON_COLUMN_3 = htMethod.get("CON_COLUMN_3");
		String CON_COLUMN_4 = htMethod.get("CON_COLUMN_4");
		String CON_COLUMN_5 = htMethod.get("CON_COLUMN_5");
		String CON_VALUE_S = htMethod.get("CON_VALUE_S");
		String CON_VALUE_1 = htMethod.get("CON_VALUE_1");
		String CON_VALUE_2 = htMethod.get("CON_VALUE_2");
		String CON_VALUE_3 = htMethod.get("CON_VALUE_3");
		String CON_VALUE_4 = htMethod.get("CON_VALUE_4");
		String CON_VALUE_5 = htMethod.get("CON_VALUE_5");

		//
		if(CON_NAME_1 == null) { CON_NAME_1 = ""; }
		if(CON_NAME_2 == null) { CON_NAME_2 = ""; }
		if(CON_NAME_3 == null) { CON_NAME_3 = ""; }
		if(CON_COLUMN_S == null) { CON_COLUMN_S = ""; }
		if(CON_COLUMN_1 == null) { CON_COLUMN_1 = ""; }
		if(CON_COLUMN_2 == null) { CON_COLUMN_2 = ""; }
		if(CON_COLUMN_3 == null) { CON_COLUMN_3 = ""; }
		if(CON_COLUMN_4 == null) { CON_COLUMN_4 = ""; }
		if(CON_COLUMN_5 == null) { CON_COLUMN_5 = ""; }
		if(CON_VALUE_S == null) { CON_VALUE_S = ""; }
		if(CON_VALUE_1 == null) { CON_VALUE_1 = ""; }
		if(CON_VALUE_2 == null) { CON_VALUE_2 = ""; }
		if(CON_VALUE_3 == null) { CON_VALUE_3 = ""; }
		if(CON_VALUE_4 == null) { CON_VALUE_4 = ""; }
		if(CON_VALUE_5 == null) { CON_VALUE_5 = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uFM_AcptComm_GF_UdtOneColumn_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_UdtOneColumn_001 \n";
			G_INFO += "설명 : 한개 컬럼 변경 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CON_NAME_1 : " + CON_NAME_1 + " \n";
			G_INFO += " CON_NAME_2 : " + CON_NAME_2 + " \n";
			G_INFO += " CON_NAME_3 : " + CON_NAME_3 + " \n";
			G_INFO += " CON_COLUMN_S : " + CON_COLUMN_S + " \n";
			G_INFO += " CON_COLUMN_1 : " + CON_COLUMN_1 + " \n";
			G_INFO += " CON_COLUMN_2 : " + CON_COLUMN_2 + " \n";
			G_INFO += " CON_COLUMN_3 : " + CON_COLUMN_3 + " \n";
			G_INFO += " CON_COLUMN_4 : " + CON_COLUMN_4 + " \n";
			G_INFO += " CON_COLUMN_5 : " + CON_COLUMN_5 + " \n";
			G_INFO += " CON_VALUE_S : " + CON_VALUE_S + " \n";
			G_INFO += " CON_VALUE_1 : " + CON_VALUE_1 + " \n";
			G_INFO += " CON_VALUE_2 : " + CON_VALUE_2 + " \n";
			G_INFO += " CON_VALUE_3 : " + CON_VALUE_3 + " \n";
			G_INFO += " CON_VALUE_4 : " + CON_VALUE_4 + " \n";
			G_INFO += " CON_VALUE_5 : " + CON_VALUE_5 + " \n";
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
