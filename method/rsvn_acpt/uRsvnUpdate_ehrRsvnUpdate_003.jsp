<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uRsvnUpdate_ehrRsvnUpdate_003.jsp"%>
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

		String OCS_CD = htMethod.get("OCS_CD");
		String OCSC_SNO = htMethod.get("OCSC_SNO");
		String EXAM_TM = htMethod.get("EXAM_TM");
		String RSVN_NO  = htMethod.get("RSVN_NO");
		String RSVN_DT = htMethod.get("RSVN_DT");
		String EHR_DT = htMethod.get("EHR_DT");
		//

		if(OCS_CD == null) { OCS_CD = ""; }
		if(OCSC_SNO == null) { OCSC_SNO = ""; }
		if(EXAM_TM == null) { EXAM_TM = ""; }
		if(RSVN_NO == null) { RSVN_NO = ""; }
		if(RSVN_DT == null) { RSVN_DT = ""; }
		if(EHR_DT == null) { EHR_DT = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uRsvnUpdate_ehrRsvnUpdate_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvnUpdate_ehrRsvnUpdate_003 \n";
			G_INFO += "설명 : EHR 처방 Key 업데이트 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";

			G_INFO += " OCS_CD : " + OCS_CD + " \n";
			G_INFO += " OCSC_SNO : " + OCSC_SNO + " \n";
			G_INFO += " EXAM_TM : " + EXAM_TM + " \n";
			G_INFO += " RSVN_NO : " + RSVN_NO  + " \n";
			G_INFO += " RSVN_DT : " + RSVN_DT + " \n";
			G_INFO += " EHR_DT : " + EHR_DT + " \n";
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
