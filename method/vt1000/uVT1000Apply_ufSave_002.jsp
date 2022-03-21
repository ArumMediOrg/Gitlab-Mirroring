<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uVT1000Apply_ufSave_002.jsp"%>
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

		String MARK_CLASS = htMethod.get("MARK_CLASS");
		String VIEW_TY = htMethod.get("VIEW_TY");
		String VIEW_MEMO_KR = htMethod.get("VIEW_MEMO_KR");
		String VIEW_SQ = htMethod.get("VIEW_SQ");
		String VIEW_NO = htMethod.get("VIEW_NO");
		String VIEW_CD1 = htMethod.get("VIEW_CD1");
		String VIEW_CD2 = htMethod.get("VIEW_CD2");
		String VIEW_CD3 = htMethod.get("VIEW_CD3");
		String VIEW_CD4 = htMethod.get("VIEW_CD4");
		String VIEW_CD5 = htMethod.get("VIEW_CD5");
		String VIEW_CD6 = htMethod.get("VIEW_CD6");
		String ITEM_CNT = htMethod.get("ITEM_CNT");
		String USE_YN = htMethod.get("USE_YN");
		String FOR_KD = htMethod.get("FOR_KD");
		String FOR_RATE = htMethod.get("FOR_RATE");
		String AFTE_MON = htMethod.get("AFTE_MON");
		String AFTE_CD = htMethod.get("AFTE_CD");
		String CLIC_CD = htMethod.get("CLIC_CD");
		String MARK_ADD_TX = htMethod.get("MARK_ADD_TX");
		String DEV_ADD_TX = htMethod.get("DEV_ADD_TX");
		String AUTO_YN = htMethod.get("AUTO_YN");
		String INPT_ID = htMethod.get("INPT_ID");
		String RGVVM_USE_YN = htMethod.get("RGVVM_USE_YN");
		String GUSER = htMethod.get("GUSER");

		//
		if(MARK_CLASS == null) { MARK_CLASS = ""; }
		if(VIEW_TY == null) { VIEW_TY = ""; }
		if(VIEW_MEMO_KR == null) { VIEW_MEMO_KR = ""; }
		if(VIEW_SQ == null) { VIEW_SQ = ""; }
		if(VIEW_NO == null) { VIEW_NO = ""; }
		if(VIEW_CD1 == null) { VIEW_CD1 = ""; }
		if(VIEW_CD2 == null) { VIEW_CD2 = ""; }
		if(VIEW_CD3 == null) { VIEW_CD3 = ""; }
		if(VIEW_CD4 == null) { VIEW_CD4 = ""; }
		if(VIEW_CD5 == null) { VIEW_CD5 = ""; }
		if(VIEW_CD6 == null) { VIEW_CD6 = ""; }
		if(ITEM_CNT == null) { ITEM_CNT = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(FOR_KD == null) { FOR_KD = ""; }
		if(FOR_RATE == null) { FOR_RATE = ""; }
		if(AFTE_MON == null) { AFTE_MON = ""; }
		if(AFTE_CD == null) { AFTE_CD = ""; }
		if(CLIC_CD == null) { CLIC_CD = ""; }
		if(MARK_ADD_TX == null) { MARK_ADD_TX = ""; }
		if(DEV_ADD_TX == null) { DEV_ADD_TX = ""; }
		if(AUTO_YN == null) { AUTO_YN = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(RGVVM_USE_YN == null) { RGVVM_USE_YN = ""; }
		if(GUSER == null) { GUSER = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uVT1000Apply_ufSave_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uVT1000Apply_ufSave_002 \n";
			G_INFO += "설명 : 검사정보 신규추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MARK_CLASS : " + MARK_CLASS + " \n";
			G_INFO += " VIEW_TY : " + VIEW_TY + " \n";
			G_INFO += " VIEW_MEMO_KR : " + VIEW_MEMO_KR + " \n";
			G_INFO += " VIEW_SQ : " + VIEW_SQ + " \n";
			G_INFO += " VIEW_NO : " + VIEW_NO + " \n";
			G_INFO += " VIEW_CD1 : " + VIEW_CD1 + " \n";
			G_INFO += " VIEW_CD2 : " + VIEW_CD2 + " \n";
			G_INFO += " VIEW_CD3 : " + VIEW_CD3 + " \n";
			G_INFO += " VIEW_CD4 : " + VIEW_CD4 + " \n";
			G_INFO += " VIEW_CD5 : " + VIEW_CD5 + " \n";
			G_INFO += " VIEW_CD6 : " + VIEW_CD6 + " \n";
			G_INFO += " ITEM_CNT : " + ITEM_CNT + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " FOR_KD : " + FOR_KD + " \n";
			G_INFO += " FOR_RATE : " + FOR_RATE + " \n";
			G_INFO += " AFTE_MON : " + AFTE_MON + " \n";
			G_INFO += " AFTE_CD : " + AFTE_CD + " \n";
			G_INFO += " CLIC_CD : " + CLIC_CD + " \n";
			G_INFO += " MARK_ADD_TX : " + MARK_ADD_TX + " \n";
			G_INFO += " DEV_ADD_TX : " + DEV_ADD_TX + " \n";
			G_INFO += " AUTO_YN : " + AUTO_YN + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " RGVVM_USE_YN : " + RGVVM_USE_YN + " \n";
			G_INFO += " GUSER : " + GUSER + " \n";
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
