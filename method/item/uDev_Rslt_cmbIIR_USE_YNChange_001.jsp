<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uDev_Rslt_cmbIIR_USE_YNChange_001.jsp"%>
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

		String IIR_USE_YN = htMethod.get("IIR_USE_YN");
		String IIR_MODI_ID = htMethod.get("IIR_MODI_ID");
		String IIR_ITEM_CD = htMethod.get("IIR_ITEM_CD");
		String IIR_RSLT_CD = htMethod.get("IIR_RSLT_CD");

		//
		if(IIR_USE_YN == null) { IIR_USE_YN = ""; }
		if(IIR_MODI_ID == null) { IIR_MODI_ID = ""; }
		if(IIR_ITEM_CD == null) { IIR_ITEM_CD = ""; }
		if(IIR_RSLT_CD == null) { IIR_RSLT_CD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uDev_Rslt_cmbIIR_USE_YNChange_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDev_Rslt_cmbIIR_USE_YNChange_001 \n";
			G_INFO += "설명 : 검사결과코드 사용유무 처리 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IIR_USE_YN : " + IIR_USE_YN + " \n";
			G_INFO += " IIR_MODI_ID : " + IIR_MODI_ID + " \n";
			G_INFO += " IIR_ITEM_CD : " + IIR_ITEM_CD + " \n";
			G_INFO += " IIR_RSLT_CD : " + IIR_RSLT_CD + " \n";
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
