<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uIT_ChungGU_2018_UDP_BILL_HNINSERT_003.jsp"%>
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

		String BUSI_YR = htMethod.get("BUSI_YR");
		String BILL_DT = htMethod.get("BILL_DT");
		String BILL_NO = htMethod.get("BILL_NO");
		String BILL_FL = htMethod.get("BILL_FL");
		String BILL_HC = htMethod.get("BILL_HC");
		String FBILL_CT = htMethod.get("FBILL_CT");
		String FBILL_PR = htMethod.get("FBILL_PR");
		String INPUT_ID = htMethod.get("INPUT_ID");
		String MODI_ID = htMethod.get("MODI_ID");

		//
		if(BUSI_YR == null) { BUSI_YR = ""; }
		if(BILL_DT == null) { BILL_DT = ""; }
		if(BILL_NO == null) { BILL_NO = ""; }
		if(BILL_FL == null) { BILL_FL = ""; }
		if(BILL_HC == null) { BILL_HC = ""; }
		if(FBILL_CT == null) { FBILL_CT = ""; }
		if(FBILL_PR == null) { FBILL_PR = ""; }
		if(INPUT_ID == null) { INPUT_ID = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uIT_ChungGU_2018_UDP_BILL_HNINSERT_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ChungGU_2018_UDP_BILL_HNINSERT_003 \n";
			G_INFO += "설명 : 건보청구상세정보 입력 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " BUSI_YR : " + BUSI_YR + " \n";
			G_INFO += " BILL_DT : " + BILL_DT + " \n";
			G_INFO += " BILL_NO : " + BILL_NO + " \n";
			G_INFO += " BILL_FL : " + BILL_FL + " \n";
			G_INFO += " BILL_HC : " + BILL_HC + " \n";
			G_INFO += " FBILL_CT : " + FBILL_CT + " \n";
			G_INFO += " FBILL_PR : " + FBILL_PR + " \n";
			G_INFO += " INPUT_ID : " + INPUT_ID + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
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
