<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_frameSetCustomExamResult_targetItemSave_003.jsp"%>
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

		String EMP_NO = htMethod.get("EMP_NO");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String GROUP_NM = htMethod.get("GROUP_NM");
		String GROUP_KEY = htMethod.get("GROUP_KEY");
		String GROUP_PKEY = htMethod.get("GROUP_PKEY");
		String ORDERBY = htMethod.get("ORDERBY");

		//
		if(EMP_NO == null) { EMP_NO = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(GROUP_NM == null) { GROUP_NM = ""; }
		if(GROUP_KEY == null) { GROUP_KEY = ""; }
		if(GROUP_PKEY == null) { GROUP_PKEY = ""; }
		if(ORDERBY == null) { ORDERBY = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_frameSetCustomExamResult_targetItemSave_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : frameSetCustomExamResult_targetItemSave_003 \n";
			G_INFO += "설명 : 그룹 사용정보 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EMP_NO : " + EMP_NO + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " GROUP_NM : " + GROUP_NM + " \n";
			G_INFO += " GROUP_KEY : " + GROUP_KEY + " \n";
			G_INFO += " GROUP_PKEY : " + GROUP_PKEY + " \n";
			G_INFO += " ORDERBY : " + ORDERBY + " \n";
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
