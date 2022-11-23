<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uMain_rsltNoramlUpdateKUMC_002.jsp"%>
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

		String RSLT_VL = htMethod.get("RSLT_VL");
		String CHAR_CD = htMethod.get("CHAR_CD");
		String PACS_RSLT  = htMethod.get("PACS_RSLT");
		String PRCH_VL = htMethod.get("PRCH_VL");
		String PRNM_VL = htMethod.get("PRNM_VL");
		String RSLT_KD = htMethod.get("RSLT_KD");
		String MODI_ID = htMethod.get("MODI_ID");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String OSRL_CD = htMethod.get("OSRL_CD");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String OSSB_CD = htMethod.get("OSSB_CD");
		String REMK_EX = htMethod.get("REMK_EX");
		String OLD_PACS_RSLT = htMethod.get("OLD_PACS_RSLT");
		String PACS_FLAG = htMethod.get("PACS_FLAG");
		String OCS_VL = htMethod.get("OCS_VL");
		String CODE_GBN = htMethod.get("CODE_GBN");
		String RSLT_EX = htMethod.get("RSLT_EX");
		String RSLT_VL2 = htMethod.get("RSLT_VL2");

		//
		if(RSLT_VL == null) { RSLT_VL = ""; }
		if(CHAR_CD == null) { CHAR_CD = ""; }
		if(PACS_RSLT == null) { PACS_RSLT = ""; }
		if(PRCH_VL == null) { PRCH_VL = ""; }
		if(PRNM_VL == null) { PRNM_VL = ""; }
		if(RSLT_KD == null) { RSLT_KD = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(OSRL_CD == null) { OSRL_CD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(OSSB_CD == null) { OSSB_CD = ""; }
		if(REMK_EX == null) { REMK_EX = ""; }
		if(OLD_PACS_RSLT == null) { OLD_PACS_RSLT = ""; }
		if(PACS_FLAG == null) { PACS_FLAG = ""; }
		if(OCS_VL == null) { OCS_VL = ""; }
		if(CODE_GBN == null) { CODE_GBN = ""; }
		if(RSLT_EX == null) { RSLT_EX = ""; }
		if(RSLT_VL2 == null) { RSLT_VL2 = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uMain_rsltNoramlUpdateKUMC_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMain_rsltNoramlUpdateKUMC_002 \n";
			G_INFO += "설명 : 결과정보 업데이트 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSLT_VL : " + RSLT_VL + " \n";
			G_INFO += " CHAR_CD : " + CHAR_CD + " \n";
			G_INFO += " PACS_RSLT : " + PACS_RSLT + " \n";
			G_INFO += " PRCH_VL : " + PRCH_VL + " \n";
			G_INFO += " PRNM_VL : " + PRNM_VL + " \n";
			G_INFO += " RSLT_KD : " + RSLT_KD + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " OSRL_CD : " + OSRL_CD + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " OSSB_CD : " + OSSB_CD + " \n";
			G_INFO += " REMK_EX : " + REMK_EX + " \n";
			G_INFO += " OLD_PACS_RSLT : " + OLD_PACS_RSLT + " \n";
			G_INFO += " PACS_FLAG : " + PACS_FLAG + " \n";
			G_INFO += " OCS_VL : " + OCS_VL + " \n";
			G_INFO += " CODE_GBN : " + CODE_GBN + " \n";
			G_INFO += " RSLT_EX : " + RSLT_EX + " \n";
			G_INFO += " RSLT_VL2 : " + RSLT_VL2 + " \n";
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
