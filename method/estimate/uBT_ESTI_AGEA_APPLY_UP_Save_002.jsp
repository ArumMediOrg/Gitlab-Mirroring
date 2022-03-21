<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uBT_ESTI_AGEA_APPLY_UP_Save_002.jsp"%>
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

		String MNGT_YR = htMethod.get("MNGT_YR");
		String ESTI_CD = htMethod.get("ESTI_CD");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String ITEM_PR = htMethod.get("ITEM_PR");
		String AGEA_PR = htMethod.get("AGEA_PR");
		String INPT_ID = htMethod.get("INPT_ID");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ESTI_CD == null) { ESTI_CD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(ITEM_PR == null) { ITEM_PR = ""; }
		if(AGEA_PR == null) { AGEA_PR = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uBT_ESTI_AGEA_APPLY_UP_Save_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTI_AGEA_APPLY_UP_Save_002 \n";
			G_INFO += "설명 : 견적용항목정보 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ESTI_CD : " + ESTI_CD + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " ITEM_PR : " + ITEM_PR + " \n";
			G_INFO += " AGEA_PR : " + AGEA_PR + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
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
