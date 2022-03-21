<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCRM_BASIC_btnS9_PostSaveClick_001.jsp"%>
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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String RSVN_NO = htMethod.get("RSVN_NO");
		String PREG_ID = htMethod.get("PREG_ID");
		String PREG_DT = htMethod.get("PREG_DT");
		String PSND_ID = htMethod.get("PSND_ID");
		String PSND_DT = htMethod.get("PSND_DT");
		String EMAIL_ID = htMethod.get("EMAIL_ID");
		String EMAIL_DT = htMethod.get("EMAIL_DT");
		String PCHK_ID = htMethod.get("PCHK_ID");
		String PCHK_DT = htMethod.get("PCHK_DT");
		String RMRK_TX = htMethod.get("RMRK_TX");
		String POST_KD = htMethod.get("POST_KD");
		String USER_ID = htMethod.get("USER_ID");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(RSVN_NO == null) { RSVN_NO = ""; }
		if(PREG_ID == null) { PREG_ID = ""; }
		if(PREG_DT == null) { PREG_DT = ""; }
		if(PSND_ID == null) { PSND_ID = ""; }
		if(PSND_DT == null) { PSND_DT = ""; }
		if(EMAIL_ID == null) { EMAIL_ID = ""; }
		if(EMAIL_DT == null) { EMAIL_DT = ""; }
		if(PCHK_ID == null) { PCHK_ID = ""; }
		if(PCHK_DT == null) { PCHK_DT = ""; }
		if(RMRK_TX == null) { RMRK_TX = ""; }
		if(POST_KD == null) { POST_KD = ""; }
		if(USER_ID == null) { USER_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCRM_BASIC_btnS9_PostSaveClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_btnS9_PostSaveClick_001 \n";
			G_INFO += "설명 : SMS 문구 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
			G_INFO += " PREG_ID : " + PREG_ID + " \n";
			G_INFO += " PREG_DT : " + PREG_DT + " \n";
			G_INFO += " PSND_ID : " + PSND_ID + " \n";
			G_INFO += " PSND_DT : " + PSND_DT + " \n";
			G_INFO += " EMAIL_ID : " + EMAIL_ID + " \n";
			G_INFO += " EMAIL_DT : " + EMAIL_DT + " \n";
			G_INFO += " PCHK_ID : " + PCHK_ID + " \n";
			G_INFO += " PCHK_DT : " + PCHK_DT + " \n";
			G_INFO += " RMRK_TX : " + RMRK_TX + " \n";
			G_INFO += " POST_KD : " + POST_KD + " \n";
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
