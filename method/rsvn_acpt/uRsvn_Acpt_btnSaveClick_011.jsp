<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uRsvn_Acpt_btnSaveClick_011.jsp"%>
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
		String RSVN_NO = htMethod.get("RSVN_NO");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String OCS_YN = htMethod.get("OCS_YN");
		String OCS_CD = htMethod.get("OCS_CD");

		String OSSB_CD = htMethod.get("OSSB_CD");
		String OSRL_CD = htMethod.get("OSRL_CD");
		String RSVN_DT = htMethod.get("RSVN_DT");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String CNCL_YN = htMethod.get("CNCL_YN");
		String EXAM_TM = htMethod.get("EXAM_TM");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(RSVN_NO == null) { RSVN_NO = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(OCS_YN == null) { OCS_YN = ""; }
		if(OCS_CD == null) { OCS_CD = ""; }

		if(OSSB_CD == null) { OSSB_CD = ""; }
		if(OSRL_CD == null) { OSRL_CD = ""; }
		if(RSVN_DT == null) { RSVN_DT = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(CNCL_YN == null) { CNCL_YN = ""; }
		if(EXAM_TM == null) { EXAM_TM = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uRsvn_Acpt_btnSaveClick_011(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_btnSaveClick_011 \n";
			G_INFO += "설명 : 예약항목 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " OCS_YN : " + OCS_YN + " \n";
			G_INFO += " OCS_CD : " + OCS_CD + " \n";
			G_INFO += " OSSB_CD : " + OSSB_CD + " \n";
			G_INFO += " OSRL_CD : " + OSRL_CD + " \n";
			G_INFO += " RSVN_DT : " + RSVN_DT + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " CNCL_YN : " + CNCL_YN + " \n";
			G_INFO += " EXAM_TM : " + EXAM_TM + " \n";

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
