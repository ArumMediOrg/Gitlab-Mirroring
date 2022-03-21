<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uExam_Ticket_btnS3_SaveClick_001.jsp"%>
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

		String SMODE = htMethod.get("SMODE");
		String COMP_CD = htMethod.get("COMP_CD");
		String COMP_NM = htMethod.get("COMP_NM");
		String TYPE1_YN = htMethod.get("TYPE1_YN");
		String TYPE2_YN = htMethod.get("TYPE2_YN");
		String TYPE3_YN = htMethod.get("TYPE3_YN");
		String TYPE4_YN = htMethod.get("TYPE4_YN");
		String TYPE5_YN = htMethod.get("TYPE5_YN");
		String TYPE6_YN = htMethod.get("TYPE6_YN");
		String TYPE7_YN = htMethod.get("TYPE7_YN");
		String TYPE8_YN = htMethod.get("TYPE8_YN");
		String TYPE9_YN = htMethod.get("TYPE9_YN");
		String TYPE10_YN = htMethod.get("TYPE10_YN");
		String TYPE11_YN = htMethod.get("TYPE11_YN");
		String TYPE12_YN = htMethod.get("TYPE12_YN");
		String USER_ID = htMethod.get("USER_ID");

		//
		if(SMODE == null) { SMODE = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(COMP_NM == null) { COMP_NM = ""; }
		if(TYPE1_YN == null) { TYPE1_YN = ""; }
		if(TYPE2_YN == null) { TYPE2_YN = ""; }
		if(TYPE3_YN == null) { TYPE3_YN = ""; }
		if(TYPE4_YN == null) { TYPE4_YN = ""; }
		if(TYPE5_YN == null) { TYPE5_YN = ""; }
		if(TYPE6_YN == null) { TYPE6_YN = ""; }
		if(TYPE7_YN == null) { TYPE7_YN = ""; }
		if(TYPE8_YN == null) { TYPE8_YN = ""; }
		if(TYPE9_YN == null) { TYPE9_YN = ""; }
		if(TYPE10_YN == null) { TYPE10_YN = ""; }
		if(TYPE11_YN == null) { TYPE11_YN = ""; }
		if(TYPE12_YN == null) { TYPE12_YN = ""; }
		if(USER_ID == null) { USER_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uExam_Ticket_btnS3_SaveClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Ticket_btnS3_SaveClick_001 \n";
			G_INFO += "설명 : 검진권발급처저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " COMP_NM : " + COMP_NM + " \n";
			G_INFO += " TYPE1_YN : " + TYPE1_YN + " \n";
			G_INFO += " TYPE2_YN : " + TYPE2_YN + " \n";
			G_INFO += " TYPE3_YN : " + TYPE3_YN + " \n";
			G_INFO += " TYPE4_YN : " + TYPE4_YN + " \n";
			G_INFO += " TYPE5_YN : " + TYPE5_YN + " \n";
			G_INFO += " TYPE6_YN : " + TYPE6_YN + " \n";
			G_INFO += " TYPE7_YN : " + TYPE7_YN + " \n";
			G_INFO += " TYPE8_YN : " + TYPE8_YN + " \n";
			G_INFO += " TYPE9_YN : " + TYPE9_YN + " \n";
			G_INFO += " TYPE10_YN : " + TYPE10_YN + " \n";
			G_INFO += " TYPE11_YN : " + TYPE11_YN + " \n";
			G_INFO += " TYPE12_YN : " + TYPE12_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
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
