<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uShare_Memo_btnSaveClick_001.jsp"%>
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
		String PSNL_NM = htMethod.get("PSNL_NM");
		String COMP_CD = htMethod.get("COMP_CD");
		String LEAD_KD = htMethod.get("LEAD_KD");
		String MEMO_TX = htMethod.get("MEMO_TX");
		String RGST_ID = htMethod.get("RGST_ID");
		String RGST_DT = htMethod.get("RGST_DT");
		String RGST_SQ = htMethod.get("RGST_SQ");
		String TITLE_NM = htMethod.get("TITLE_NM");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(LEAD_KD == null) { LEAD_KD = ""; }
		if(MEMO_TX == null) { MEMO_TX = ""; }
		if(RGST_ID == null) { RGST_ID = ""; }
		if(RGST_DT == null) { RGST_DT = ""; }
		if(RGST_SQ == null) { RGST_SQ = ""; }
		if(TITLE_NM == null) { TITLE_NM = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uShare_Memo_btnSaveClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uShare_Memo_btnSaveClick_001 \n";
			G_INFO += "설명 : 공지사항 저장(신규/수정/삭제) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " LEAD_KD : " + LEAD_KD + " \n";
			G_INFO += " MEMO_TX : " + MEMO_TX + " \n";
			G_INFO += " RGST_ID : " + RGST_ID + " \n";
			G_INFO += " RGST_DT : " + RGST_DT + " \n";
			G_INFO += " RGST_SQ : " + RGST_SQ + " \n";
			G_INFO += " TITLE_NM : " + TITLE_NM + " \n";
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
