<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_omr_updaterequestdateedit_002.jsp"%>
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

		String CUST_NO = htMethod.get("CUST_NO");
		String CHART_NO = htMethod.get("CHART_NO");
		String EXAM_NAME = htMethod.get("EXAM_NAME");
		String EXAM_NO = htMethod.get("EXAM_NO");
		String AGE = htMethod.get("AGE");
		String GENDER = htMethod.get("GENDER");
		String JUMIN1 = htMethod.get("JUMIN1");
		String JUMIN2 = htMethod.get("JUMIN2");
		String BEFORE_SCANDATE = htMethod.get("BEFORE_SCANDATE");
		String SERIAL = htMethod.get("SERIAL");

		//
		if(CUST_NO == null) { CUST_NO = ""; }
		if(CHART_NO == null) { CHART_NO = ""; }
		if(EXAM_NAME == null) { EXAM_NAME = ""; }
		if(EXAM_NO == null) { EXAM_NO = ""; }
		if(AGE == null) { AGE = ""; }
		if(GENDER == null) { GENDER = ""; }
		if(JUMIN1 == null) { JUMIN1 = ""; }
		if(JUMIN2 == null) { JUMIN2 = ""; }
		if(BEFORE_SCANDATE == null) { BEFORE_SCANDATE = ""; }
		if(SERIAL == null) { SERIAL = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_omr_updaterequestdateedit_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : omr_updaterequestdateedit_002 \n";
			G_INFO += "설명 : OMR request_date 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " CHART_NO : " + CHART_NO + " \n";
			G_INFO += " EXAM_NAME : " + EXAM_NAME + " \n";
			G_INFO += " EXAM_NO : " + EXAM_NO + " \n";
			G_INFO += " AGE : " + AGE + " \n";
			G_INFO += " GENDER : " + GENDER + " \n";
			G_INFO += " JUMIN1 : " + JUMIN1 + " \n";
			G_INFO += " JUMIN2 : " + JUMIN2 + " \n";
			G_INFO += " BEFORE_SCANDATE : " + BEFORE_SCANDATE + " \n";
			G_INFO += " SERIAL : " + SERIAL + " \n";
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
