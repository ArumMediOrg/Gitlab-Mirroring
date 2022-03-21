<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_UConfig_UP_GerSetting_010.jsp"%>
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

		String COMPORT = htMethod.get("COMPORT");
		String TELSPD = htMethod.get("TELSPD");
		String VAN_NM = htMethod.get("VAN_NM");
		String DANNO = htMethod.get("DANNO");
		String HOSP_NO = htMethod.get("HOSP_NO");

		//
		if(COMPORT == null) { COMPORT = ""; }
		if(TELSPD == null) { TELSPD = ""; }
		if(VAN_NM == null) { VAN_NM = ""; }
		if(DANNO == null) { DANNO = ""; }
		if(HOSP_NO == null) { HOSP_NO = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_UConfig_UP_GerSetting_010(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UConfig_UP_GerSetting_010 \n";
			G_INFO += "설명 : 병원정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMPORT : " + COMPORT + " \n";
			G_INFO += " TELSPD : " + TELSPD + " \n";
			G_INFO += " VAN_NM : " + VAN_NM + " \n";
			G_INFO += " DANNO : " + DANNO + " \n";
			G_INFO += " HOSP_NO : " + HOSP_NO + " \n";
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
