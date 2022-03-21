<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uStdt_PnjnO_btnView_SaveClick_002.jsp"%>
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

		String SAVE_KD = htMethod.get("SAVE_KD");
		String MARK_CD = htMethod.get("MARK_CD");
		String PNJN_KD = htMethod.get("PNJN_KD");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String CHAR_REF1 = htMethod.get("CHAR_REF1");
		String CHAR_REF = htMethod.get("CHAR_REF");
		String CHAR_REF3 = htMethod.get("CHAR_REF3");
		String CHAR_REF4 = htMethod.get("CHAR_REF4");
		String CHAR_REF5 = htMethod.get("CHAR_REF5");
		String CHAR_REF6 = htMethod.get("CHAR_REF6");
		String CHAR_REF7 = htMethod.get("CHAR_REF7");
		String CHAR_REF8 = htMethod.get("CHAR_REF8");
		String CHAR_REF9 = htMethod.get("CHAR_REF9");
		String CHAR_REF10 = htMethod.get("CHAR_REF10");
		String APLY_KD = htMethod.get("APLY_KD");
		String RSLT_KD = htMethod.get("RSLT_KD");
		String VIEW_TXT = htMethod.get("VIEW_TXT");
		String ACT_TXT = htMethod.get("ACT_TXT");
		String USER_ID = htMethod.get("USER_ID");
		String CHAR_REF2 = htMethod.get("CHAR_REF2");
		String USE_YN = htMethod.get("USE_YN");
		String MARK_SQ = htMethod.get("MARK_SQ");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(MARK_CD == null) { MARK_CD = ""; }
		if(PNJN_KD == null) { PNJN_KD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(CHAR_REF1 == null) { CHAR_REF1 = ""; }
		if(CHAR_REF == null) { CHAR_REF = ""; }
		if(CHAR_REF3 == null) { CHAR_REF3 = ""; }
		if(CHAR_REF4 == null) { CHAR_REF4 = ""; }
		if(CHAR_REF5 == null) { CHAR_REF5 = ""; }
		if(CHAR_REF6 == null) { CHAR_REF6 = ""; }
		if(CHAR_REF7 == null) { CHAR_REF7 = ""; }
		if(CHAR_REF8 == null) { CHAR_REF8 = ""; }
		if(CHAR_REF9 == null) { CHAR_REF9 = ""; }
		if(CHAR_REF10 == null) { CHAR_REF10 = ""; }
		if(APLY_KD == null) { APLY_KD = ""; }
		if(RSLT_KD == null) { RSLT_KD = ""; }
		if(VIEW_TXT == null) { VIEW_TXT = ""; }
		if(ACT_TXT == null) { ACT_TXT = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(CHAR_REF2 == null) { CHAR_REF2 = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(MARK_SQ == null) { MARK_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uStdt_PnjnO_btnView_SaveClick_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_PnjnO_btnView_SaveClick_002 \n";
			G_INFO += "설명 : 학교밖청소년 검진 소견 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " MARK_CD : " + MARK_CD + " \n";
			G_INFO += " PNJN_KD : " + PNJN_KD + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " CHAR_REF1 : " + CHAR_REF1 + " \n";
			G_INFO += " CHAR_REF : " + CHAR_REF + " \n";
			G_INFO += " CHAR_REF3 : " + CHAR_REF3 + " \n";
			G_INFO += " CHAR_REF4 : " + CHAR_REF4 + " \n";
			G_INFO += " CHAR_REF5 : " + CHAR_REF5 + " \n";
			G_INFO += " CHAR_REF6 : " + CHAR_REF6 + " \n";
			G_INFO += " CHAR_REF7 : " + CHAR_REF7 + " \n";
			G_INFO += " CHAR_REF8 : " + CHAR_REF8 + " \n";
			G_INFO += " CHAR_REF9 : " + CHAR_REF9 + " \n";
			G_INFO += " CHAR_REF10 : " + CHAR_REF10 + " \n";
			G_INFO += " APLY_KD : " + APLY_KD + " \n";
			G_INFO += " RSLT_KD : " + RSLT_KD + " \n";
			G_INFO += " VIEW_TXT : " + VIEW_TXT + " \n";
			G_INFO += " ACT_TXT : " + ACT_TXT + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " CHAR_REF2 : " + CHAR_REF2 + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " MARK_SQ : " + MARK_SQ + " \n";
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
