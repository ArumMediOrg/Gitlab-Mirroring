<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_omr_insertetcarumtotal_001.jsp"%>
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

		String REQUEST_DATE = htMethod.get("REQUEST_DATE");
		String SCANDATE = htMethod.get("SCANDATE");
		String FILENAME = htMethod.get("FILENAME");
		String EXAM_NAME = htMethod.get("EXAM_NAME");
		String BARCODENUMBER = htMethod.get("BARCODENUMBER");
		String EXAM_NO = htMethod.get("EXAM_NO");
		String JUMIN1 = htMethod.get("JUMIN1");
		String JUMIN2 = htMethod.get("JUMIN2");
		String SERIAL = htMethod.get("SERIAL");
		String USERID = htMethod.get("USERID");

		//
		if(REQUEST_DATE == null) { REQUEST_DATE = ""; }
		if(SCANDATE == null) { SCANDATE = ""; }
		if(FILENAME == null) { FILENAME = ""; }
		if(EXAM_NAME == null) { EXAM_NAME = ""; }
		if(BARCODENUMBER == null) { BARCODENUMBER = ""; }
		if(EXAM_NO == null) { EXAM_NO = ""; }
		if(JUMIN1 == null) { JUMIN1 = ""; }
		if(JUMIN2 == null) { JUMIN2 = ""; }
		if(SERIAL == null) { SERIAL = ""; }
		if(USERID == null) { USERID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_omr_insertetcarumtotal_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : omr_insertetcarumtotal_001 \n";
			G_INFO += "설명 : OMR 스캔 후 기타서식 이미지 파일 이름 및 날짜 인서트 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " REQUEST_DATE : " + REQUEST_DATE + " \n";
			G_INFO += " SCANDATE : " + SCANDATE + " \n";
			G_INFO += " FILENAME : " + FILENAME + " \n";
			G_INFO += " EXAM_NAME : " + EXAM_NAME + " \n";
			G_INFO += " BARCODENUMBER : " + BARCODENUMBER + " \n";
			G_INFO += " EXAM_NO : " + EXAM_NO + " \n";
			G_INFO += " JUMIN1 : " + JUMIN1 + " \n";
			G_INFO += " JUMIN2 : " + JUMIN2 + " \n";
			G_INFO += " SERIAL : " + SERIAL + " \n";
			G_INFO += " USERID : " + USERID + " \n";
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
