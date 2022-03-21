<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCOMP_AGEA_APPLY_UP_Save_001.jsp"%>
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
		String AGEA_PR = htMethod.get("AGEA_PR");
		String ITEM_PR = htMethod.get("ITEM_PR");
		String REF1_NM = htMethod.get("REF1_NM");
		String REF1_TX = htMethod.get("REF1_TX");
		String USE_YN = htMethod.get("USE_YN");
		String USER_ID = htMethod.get("USER_ID");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String SORT_SQ = htMethod.get("SORT_SQ");

		//
		if(SMODE == null) { SMODE = ""; }
		if(AGEA_PR == null) { AGEA_PR = ""; }
		if(ITEM_PR == null) { ITEM_PR = ""; }
		if(REF1_NM == null) { REF1_NM = ""; }
		if(REF1_TX == null) { REF1_TX = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(SORT_SQ == null) { SORT_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCOMP_AGEA_APPLY_UP_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_AGEA_APPLY_UP_Save_001 \n";
			G_INFO += "설명 : 검사항목별 계약단가 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " AGEA_PR : " + AGEA_PR + " \n";
			G_INFO += " ITEM_PR : " + ITEM_PR + " \n";
			G_INFO += " REF1_NM : " + REF1_NM + " \n";
			G_INFO += " REF1_TX : " + REF1_TX + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " SORT_SQ : " + SORT_SQ + " \n";
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
