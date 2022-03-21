<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSP_Health_UF_Save_004.jsp"%>
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

		String SSAVEMODE = htMethod.get("SSAVEMODE");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String EXAM_CHA = htMethod.get("EXAM_CHA");
		String MATT_CD = htMethod.get("MATT_CD");
		String MATT_SQ = htMethod.get("MATT_SQ");
		String ORGA_CD = htMethod.get("ORGA_CD");
		String SWING_CD = htMethod.get("SWING_CD");
		String SLNS_KD = htMethod.get("SLNS_KD");
		String SOKY_CD = htMethod.get("SOKY_CD");
		String SOKY_NM = htMethod.get("SOKY_NM");
		String PANJ_CD = htMethod.get("PANJ_CD");
		String JOCHI_CD = htMethod.get("JOCHI_CD");
		String JOCHI_NM = htMethod.get("JOCHI_NM");
		String JILH_CD = htMethod.get("JILH_CD");
		String POSM1_CD = htMethod.get("POSM1_CD");
		String POSM2_CD = htMethod.get("POSM2_CD");
		String POSM3_CD = htMethod.get("POSM3_CD");
		String POSM1_TX = htMethod.get("POSM1_TX");
		String POSM2_TX = htMethod.get("POSM2_TX");
		String POSM3_TX = htMethod.get("POSM3_TX");
		String POSM1_DT = htMethod.get("POSM1_DT");
		String POSM2_DT = htMethod.get("POSM2_DT");
		String POSM3_DT = htMethod.get("POSM3_DT");
		String BUSI_CD = htMethod.get("BUSI_CD");
		String REMARK = htMethod.get("REMARK");
		String ETC_TX = htMethod.get("ETC_TX");
		String ORSU_CD = htMethod.get("ORSU_CD");
		String CYCLE_CD = htMethod.get("CYCLE_CD");
		String CYCLE_TX = htMethod.get("CYCLE_TX");
		String CYCLE_DT = htMethod.get("CYCLE_DT");
		String PANJ_DT = htMethod.get("PANJ_DT");
		String DOCT_CD = htMethod.get("DOCT_CD");
		String USER_ID = htMethod.get("USER_ID");
		String SOKY_TX = htMethod.get("SOKY_TX");

		//
		if(SSAVEMODE == null) { SSAVEMODE = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(EXAM_CHA == null) { EXAM_CHA = ""; }
		if(MATT_CD == null) { MATT_CD = ""; }
		if(MATT_SQ == null) { MATT_SQ = ""; }
		if(ORGA_CD == null) { ORGA_CD = ""; }
		if(SWING_CD == null) { SWING_CD = ""; }
		if(SLNS_KD == null) { SLNS_KD = ""; }
		if(SOKY_CD == null) { SOKY_CD = ""; }
		if(SOKY_NM == null) { SOKY_NM = ""; }
		if(PANJ_CD == null) { PANJ_CD = ""; }
		if(JOCHI_CD == null) { JOCHI_CD = ""; }
		if(JOCHI_NM == null) { JOCHI_NM = ""; }
		if(JILH_CD == null) { JILH_CD = ""; }
		if(POSM1_CD == null) { POSM1_CD = ""; }
		if(POSM2_CD == null) { POSM2_CD = ""; }
		if(POSM3_CD == null) { POSM3_CD = ""; }
		if(POSM1_TX == null) { POSM1_TX = ""; }
		if(POSM2_TX == null) { POSM2_TX = ""; }
		if(POSM3_TX == null) { POSM3_TX = ""; }
		if(POSM1_DT == null) { POSM1_DT = ""; }
		if(POSM2_DT == null) { POSM2_DT = ""; }
		if(POSM3_DT == null) { POSM3_DT = ""; }
		if(BUSI_CD == null) { BUSI_CD = ""; }
		if(REMARK == null) { REMARK = ""; }
		if(ETC_TX == null) { ETC_TX = ""; }
		if(ORSU_CD == null) { ORSU_CD = ""; }
		if(CYCLE_CD == null) { CYCLE_CD = ""; }
		if(CYCLE_TX == null) { CYCLE_TX = ""; }
		if(CYCLE_DT == null) { CYCLE_DT = ""; }
		if(PANJ_DT == null) { PANJ_DT = ""; }
		if(DOCT_CD == null) { DOCT_CD = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(SOKY_TX == null) { SOKY_TX = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSP_Health_UF_Save_004(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_UF_Save_004 \n";
			G_INFO += "설명 : 특검판정저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSAVEMODE : " + SSAVEMODE + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " EXAM_CHA : " + EXAM_CHA + " \n";
			G_INFO += " MATT_CD : " + MATT_CD + " \n";
			G_INFO += " MATT_SQ : " + MATT_SQ + " \n";
			G_INFO += " ORGA_CD : " + ORGA_CD + " \n";
			G_INFO += " SWING_CD : " + SWING_CD + " \n";
			G_INFO += " SLNS_KD : " + SLNS_KD + " \n";
			G_INFO += " SOKY_CD : " + SOKY_CD + " \n";
			G_INFO += " SOKY_NM : " + SOKY_NM + " \n";
			G_INFO += " PANJ_CD : " + PANJ_CD + " \n";
			G_INFO += " JOCHI_CD : " + JOCHI_CD + " \n";
			G_INFO += " JOCHI_NM : " + JOCHI_NM + " \n";
			G_INFO += " JILH_CD : " + JILH_CD + " \n";
			G_INFO += " POSM1_CD : " + POSM1_CD + " \n";
			G_INFO += " POSM2_CD : " + POSM2_CD + " \n";
			G_INFO += " POSM3_CD : " + POSM3_CD + " \n";
			G_INFO += " POSM1_TX : " + POSM1_TX + " \n";
			G_INFO += " POSM2_TX : " + POSM2_TX + " \n";
			G_INFO += " POSM3_TX : " + POSM3_TX + " \n";
			G_INFO += " POSM1_DT : " + POSM1_DT + " \n";
			G_INFO += " POSM2_DT : " + POSM2_DT + " \n";
			G_INFO += " POSM3_DT : " + POSM3_DT + " \n";
			G_INFO += " BUSI_CD : " + BUSI_CD + " \n";
			G_INFO += " REMARK : " + REMARK + " \n";
			G_INFO += " ETC_TX : " + ETC_TX + " \n";
			G_INFO += " ORSU_CD : " + ORSU_CD + " \n";
			G_INFO += " CYCLE_CD : " + CYCLE_CD + " \n";
			G_INFO += " CYCLE_TX : " + CYCLE_TX + " \n";
			G_INFO += " CYCLE_DT : " + CYCLE_DT + " \n";
			G_INFO += " PANJ_DT : " + PANJ_DT + " \n";
			G_INFO += " DOCT_CD : " + DOCT_CD + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " SOKY_TX : " + SOKY_TX + " \n";
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
