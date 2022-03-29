<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSP_Health_BtnSave_BaseClick_007.jsp"%>
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
		String ISSU_NO = htMethod.get("ISSU_NO");
		String JIJO_CD = htMethod.get("JIJO_CD");
		String GOJU_CD = htMethod.get("GOJU_CD");
		String NCPN_LT = htMethod.get("NCPN_LT");
		String NCHR_HH = htMethod.get("NCHR_HH");
		String WORK_LT = htMethod.get("WORK_LT");
		String JUIP_DT = htMethod.get("JUIP_DT");
		String SAHU_YN = htMethod.get("SAHU_YN");
		String XRAY_CD = htMethod.get("XRAY_CD");
		String XRAY_NO = htMethod.get("XRAY_NO");
		String XRFM_CD = htMethod.get("XRFM_CD");
		String XDOC_CD = htMethod.get("XDOC_CD");
		String MEDI_YN = htMethod.get("MEDI_YN");
		String MEDI_CNT = htMethod.get("MEDI_CNT");
		String PANJ_YN = htMethod.get("PANJ_YN");
		String DDOC_CD = htMethod.get("DDOC_CD");
		String TPAN_NM = htMethod.get("TPAN_NM");
		String TBUS_NM = htMethod.get("TBUS_NM");
		String TOBO_DT = htMethod.get("TOBO_DT");
		String RECHK_DT = htMethod.get("RECHK_DT");
		String USER_ID = htMethod.get("USER_ID");
		String SMTM_CD = htMethod.get("SMTM_CD");
		String BUILD_CD = htMethod.get("BUILD_CD");
		String NOT_REG = htMethod.get("NOT_REG");
		String SLNS_DELAY = htMethod.get("SLNS_DELAY");
		String KOSHA_PROVD_YN = htMethod.get("KOSHA_PROVD_YN");
		String INFO_PROVD_YN = htMethod.get("INFO_PROVD_YN");
		String NIGHT_OPERT_CD = htMethod.get("NIGHT_OPERT_CD");

		//
		if(SSAVEMODE == null) { SSAVEMODE = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(EXAM_CHA == null) { EXAM_CHA = ""; }
		if(ISSU_NO == null) { ISSU_NO = ""; }
		if(JIJO_CD == null) { JIJO_CD = ""; }
		if(GOJU_CD == null) { GOJU_CD = ""; }
		if(NCPN_LT == null) { NCPN_LT = ""; }
		if(NCHR_HH == null) { NCHR_HH = ""; }
		if(WORK_LT == null) { WORK_LT = ""; }
		if(JUIP_DT == null) { JUIP_DT = ""; }
		if(SAHU_YN == null) { SAHU_YN = ""; }
		if(XRAY_CD == null) { XRAY_CD = ""; }
		if(XRAY_NO == null) { XRAY_NO = ""; }
		if(XRFM_CD == null) { XRFM_CD = ""; }
		if(XDOC_CD == null) { XDOC_CD = ""; }
		if(MEDI_YN == null) { MEDI_YN = ""; }
		if(MEDI_CNT == null) { MEDI_CNT = ""; }
		if(PANJ_YN == null) { PANJ_YN = ""; }
		if(DDOC_CD == null) { DDOC_CD = ""; }
		if(TPAN_NM == null) { TPAN_NM = ""; }
		if(TBUS_NM == null) { TBUS_NM = ""; }
		if(TOBO_DT == null) { TOBO_DT = ""; }
		if(RECHK_DT == null) { RECHK_DT = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(SMTM_CD == null) { SMTM_CD = ""; }
		if(BUILD_CD == null) { BUILD_CD = ""; }
		if(NOT_REG == null) { NOT_REG = ""; }
		if(SLNS_DELAY == null) { SLNS_DELAY = ""; }
		if(KOSHA_PROVD_YN == null) { KOSHA_PROVD_YN = ""; }
		if(INFO_PROVD_YN == null) { INFO_PROVD_YN = ""; }
		if(NIGHT_OPERT_CD == null) { NIGHT_OPERT_CD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSP_Health_BtnSave_BaseClick_007(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_BtnSave_BaseClick_007 \n";
			G_INFO += "설명 : 특수검진 기본정보 저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSAVEMODE : " + SSAVEMODE + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " EXAM_CHA : " + EXAM_CHA + " \n";
			G_INFO += " ISSU_NO : " + ISSU_NO + " \n";
			G_INFO += " JIJO_CD : " + JIJO_CD + " \n";
			G_INFO += " GOJU_CD : " + GOJU_CD + " \n";
			G_INFO += " NCPN_LT : " + NCPN_LT + " \n";
			G_INFO += " NCHR_HH : " + NCHR_HH + " \n";
			G_INFO += " WORK_LT : " + WORK_LT + " \n";
			G_INFO += " JUIP_DT : " + JUIP_DT + " \n";
			G_INFO += " SAHU_YN : " + SAHU_YN + " \n";
			G_INFO += " XRAY_CD : " + XRAY_CD + " \n";
			G_INFO += " XRAY_NO : " + XRAY_NO + " \n";
			G_INFO += " XRFM_CD : " + XRFM_CD + " \n";
			G_INFO += " XDOC_CD : " + XDOC_CD + " \n";
			G_INFO += " MEDI_YN : " + MEDI_YN + " \n";
			G_INFO += " MEDI_CNT : " + MEDI_CNT + " \n";
			G_INFO += " PANJ_YN : " + PANJ_YN + " \n";
			G_INFO += " DDOC_CD : " + DDOC_CD + " \n";
			G_INFO += " TPAN_NM : " + TPAN_NM + " \n";
			G_INFO += " TBUS_NM : " + TBUS_NM + " \n";
			G_INFO += " TOBO_DT : " + TOBO_DT + " \n";
			G_INFO += " RECHK_DT : " + RECHK_DT + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " SMTM_CD : " + SMTM_CD + " \n";
			G_INFO += " BUILD_CD : " + BUILD_CD + " \n";
			G_INFO += " NOT_REG : " + NOT_REG + " \n";
			G_INFO += " SLNS_DELAY : " + SLNS_DELAY + " \n";
			G_INFO += " KOSHA_PROVD_YN : " + KOSHA_PROVD_YN + " \n";
			G_INFO += " INFO_PROVD_YN : " + INFO_PROVD_YN + " \n";
			G_INFO += " NIGHT_OPERT_CD : " + NIGHT_OPERT_CD + " \n";
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
