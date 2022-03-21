<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uItem_Vldt_mniDelClick_001.jsp"%>
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

		String IIV_APLY_DT = htMethod.get("IIV_APLY_DT");
		String IIV_ITEM_CD = htMethod.get("IIV_ITEM_CD");
		String IIV_EXAM_CD = htMethod.get("IIV_EXAM_CD");
		String IIV_SEX_CD = htMethod.get("IIV_SEX_CD");
		String IIV_AGE_FR = htMethod.get("IIV_AGE_FR");
		String IIV_AGE_TO = htMethod.get("IIV_AGE_TO");
		String IIV_PANJ_CD = htMethod.get("IIV_PANJ_CD");

		//
		if(IIV_APLY_DT == null) { IIV_APLY_DT = ""; }
		if(IIV_ITEM_CD == null) { IIV_ITEM_CD = ""; }
		if(IIV_EXAM_CD == null) { IIV_EXAM_CD = ""; }
		if(IIV_SEX_CD == null) { IIV_SEX_CD = ""; }
		if(IIV_AGE_FR == null) { IIV_AGE_FR = ""; }
		if(IIV_AGE_TO == null) { IIV_AGE_TO = ""; }
		if(IIV_PANJ_CD == null) { IIV_PANJ_CD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uItem_Vldt_mniDelClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Vldt_mniDelClick_001 \n";
			G_INFO += "설명 : 참고치 정보 삭제 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IIV_APLY_DT : " + IIV_APLY_DT + " \n";
			G_INFO += " IIV_ITEM_CD : " + IIV_ITEM_CD + " \n";
			G_INFO += " IIV_EXAM_CD : " + IIV_EXAM_CD + " \n";
			G_INFO += " IIV_SEX_CD : " + IIV_SEX_CD + " \n";
			G_INFO += " IIV_AGE_FR : " + IIV_AGE_FR + " \n";
			G_INFO += " IIV_AGE_TO : " + IIV_AGE_TO + " \n";
			G_INFO += " IIV_PANJ_CD : " + IIV_PANJ_CD + " \n";
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
