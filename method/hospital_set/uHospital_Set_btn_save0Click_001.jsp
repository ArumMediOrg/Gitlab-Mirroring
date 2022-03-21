<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uHospital_Set_btn_save0Click_001.jsp"%>
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

		String HCAR_CD = htMethod.get("HCAR_CD");
		String ACPT_KD = htMethod.get("ACPT_KD");
		String ATCNR_KD = htMethod.get("ATCNR_KD");
		String ORAL_KD = htMethod.get("ORAL_KD");
		String OCSAUTO_KD = htMethod.get("OCSAUTO_KD");
		String DIS1_PO = htMethod.get("DIS1_PO");
		String DRUG_KD = htMethod.get("DRUG_KD");
		String RECE_KD = htMethod.get("RECE_KD");
		String AUTO_CD = htMethod.get("AUTO_CD");
		String CXRY_CD = htMethod.get("CXRY_CD");
		String NXRY_CD = htMethod.get("NXRY_CD");
		String OCS_KD = htMethod.get("OCS_KD");
		String SPNIGHT_LDL1 = htMethod.get("SPNIGHT_LDL1");
		String SPNIGHT_LDL = htMethod.get("SPNIGHT_LDL");
		String DOCT_KD = htMethod.get("DOCT_KD");
		String HABIT_KD = htMethod.get("HABIT_KD");
		String AUTH_KD = htMethod.get("AUTH_KD");
		String OPTION_CD = htMethod.get("OPTION_CD");
		String ATCF_YN = htMethod.get("ATCF_YN");
		String MGPR_KD = htMethod.get("MGPR_KD");

		//
		if(HCAR_CD == null) { HCAR_CD = ""; }
		if(ACPT_KD == null) { ACPT_KD = ""; }
		if(ATCNR_KD == null) { ATCNR_KD = ""; }
		if(ORAL_KD == null) { ORAL_KD = ""; }
		if(OCSAUTO_KD == null) { OCSAUTO_KD = ""; }
		if(DIS1_PO == null) { DIS1_PO = ""; }
		if(DRUG_KD == null) { DRUG_KD = ""; }
		if(RECE_KD == null) { RECE_KD = ""; }
		if(AUTO_CD == null) { AUTO_CD = ""; }
		if(CXRY_CD == null) { CXRY_CD = ""; }
		if(NXRY_CD == null) { NXRY_CD = ""; }
		if(OCS_KD == null) { OCS_KD = ""; }
		if(SPNIGHT_LDL1 == null) { SPNIGHT_LDL1 = ""; }
		if(SPNIGHT_LDL == null) { SPNIGHT_LDL = ""; }
		if(DOCT_KD == null) { DOCT_KD = ""; }
		if(HABIT_KD == null) { HABIT_KD = ""; }
		if(AUTH_KD == null) { AUTH_KD = ""; }
		if(OPTION_CD == null) { OPTION_CD = ""; }
		if(ATCF_YN == null) { ATCF_YN = ""; }
		if(MGPR_KD == null) { MGPR_KD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uHospital_Set_btn_save0Click_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHospital_Set_btn_save0Click_001 \n";
			G_INFO += "설명 : 병원정보 업데이트 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " HCAR_CD : " + HCAR_CD + " \n";
			G_INFO += " ACPT_KD : " + ACPT_KD + " \n";
			G_INFO += " ATCNR_KD : " + ATCNR_KD + " \n";
			G_INFO += " ORAL_KD : " + ORAL_KD + " \n";
			G_INFO += " OCSAUTO_KD : " + OCSAUTO_KD + " \n";
			G_INFO += " DIS1_PO : " + DIS1_PO + " \n";
			G_INFO += " DRUG_KD : " + DRUG_KD + " \n";
			G_INFO += " RECE_KD : " + RECE_KD + " \n";
			G_INFO += " AUTO_CD : " + AUTO_CD + " \n";
			G_INFO += " CXRY_CD : " + CXRY_CD + " \n";
			G_INFO += " NXRY_CD : " + NXRY_CD + " \n";
			G_INFO += " OCS_KD : " + OCS_KD + " \n";
			G_INFO += " SPNIGHT_LDL1 : " + SPNIGHT_LDL1 + " \n";
			G_INFO += " SPNIGHT_LDL : " + SPNIGHT_LDL + " \n";
			G_INFO += " DOCT_KD : " + DOCT_KD + " \n";
			G_INFO += " HABIT_KD : " + HABIT_KD + " \n";
			G_INFO += " AUTH_KD : " + AUTH_KD + " \n";
			G_INFO += " OPTION_CD : " + OPTION_CD + " \n";
			G_INFO += " ATCF_YN : " + ATCF_YN + " \n";
			G_INFO += " MGPR_KD : " + MGPR_KD + " \n";
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
