<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uExam_Acpt_btnInjkSaveClick_001.jsp"%>
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

		String PSNL_NM = htMethod.get("PSNL_NM");
		String CHART_NO = htMethod.get("CHART_NO");
		String SEX_CD = htMethod.get("SEX_CD");
		String PSNL_AGE = htMethod.get("PSNL_AGE");
		String ZIP_CD = htMethod.get("ZIP_CD");
		String ZIP_SQ = htMethod.get("ZIP_SQ");
		String ZIP_AR = htMethod.get("ZIP_AR");
		String ROAD_AR = htMethod.get("ROAD_AR");
		String BLDG_NO = htMethod.get("BLDG_NO");
		String TEL_NO = htMethod.get("TEL_NO");
		String MOBL_NO = htMethod.get("MOBL_NO");
		String EMAIL_AR = htMethod.get("EMAIL_AR");
		String SEND_CD = htMethod.get("SEND_CD");
		String SMS_YN = htMethod.get("SMS_YN");
		String COMP_CD = htMethod.get("COMP_CD");
		String DEPT_CD = htMethod.get("DEPT_CD");
		String DEPT_NM = htMethod.get("DEPT_NM");
		String DIVI_CD = htMethod.get("DIVI_CD");
		String ENTRY_DT = htMethod.get("ENTRY_DT");
		String DIVI_NO = htMethod.get("DIVI_NO");
		String DIVI_CS = htMethod.get("DIVI_CS");
		String FAMY_CD = htMethod.get("FAMY_CD");
		String FAMY_NM = htMethod.get("FAMY_NM");
		String FOOD_YN = htMethod.get("FOOD_YN");
		String SALES_ID = htMethod.get("SALES_ID");
		String EXEC_ID = htMethod.get("EXEC_ID");
		String INSU_NO = htMethod.get("INSU_NO");
		String INSU_CD = htMethod.get("INSU_CD");
		String ENTY_CD = htMethod.get("ENTY_CD");
		String ASSO_CD = htMethod.get("ASSO_CD");
		String CNTR_CD = htMethod.get("CNTR_CD");
		String ARMY_CD = htMethod.get("ARMY_CD");
		String CANAD_YN = htMethod.get("CANAD_YN");
		String CANAD_KD = htMethod.get("CANAD_KD");
		String TOTAL_YN = htMethod.get("TOTAL_YN");
		String ACPT_TX = htMethod.get("ACPT_TX");
		String COMP_CD2 = htMethod.get("COMP_CD2");
		String MODI_ID = htMethod.get("MODI_ID");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(CHART_NO == null) { CHART_NO = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PSNL_AGE == null) { PSNL_AGE = ""; }
		if(ZIP_CD == null) { ZIP_CD = ""; }
		if(ZIP_SQ == null) { ZIP_SQ = ""; }
		if(ZIP_AR == null) { ZIP_AR = ""; }
		if(ROAD_AR == null) { ROAD_AR = ""; }
		if(BLDG_NO == null) { BLDG_NO = ""; }
		if(TEL_NO == null) { TEL_NO = ""; }
		if(MOBL_NO == null) { MOBL_NO = ""; }
		if(EMAIL_AR == null) { EMAIL_AR = ""; }
		if(SEND_CD == null) { SEND_CD = ""; }
		if(SMS_YN == null) { SMS_YN = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }
		if(DEPT_NM == null) { DEPT_NM = ""; }
		if(DIVI_CD == null) { DIVI_CD = ""; }
		if(ENTRY_DT == null) { ENTRY_DT = ""; }
		if(DIVI_NO == null) { DIVI_NO = ""; }
		if(DIVI_CS == null) { DIVI_CS = ""; }
		if(FAMY_CD == null) { FAMY_CD = ""; }
		if(FAMY_NM == null) { FAMY_NM = ""; }
		if(FOOD_YN == null) { FOOD_YN = ""; }
		if(SALES_ID == null) { SALES_ID = ""; }
		if(EXEC_ID == null) { EXEC_ID = ""; }
		if(INSU_NO == null) { INSU_NO = ""; }
		if(INSU_CD == null) { INSU_CD = ""; }
		if(ENTY_CD == null) { ENTY_CD = ""; }
		if(ASSO_CD == null) { ASSO_CD = ""; }
		if(CNTR_CD == null) { CNTR_CD = ""; }
		if(ARMY_CD == null) { ARMY_CD = ""; }
		if(CANAD_YN == null) { CANAD_YN = ""; }
		if(CANAD_KD == null) { CANAD_KD = ""; }
		if(TOTAL_YN == null) { TOTAL_YN = ""; }
		if(ACPT_TX == null) { ACPT_TX = ""; }
		if(COMP_CD2 == null) { COMP_CD2 = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uExam_Acpt_btnInjkSaveClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_btnInjkSaveClick_001 \n";
			G_INFO += "설명 : 접수인적 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " CHART_NO : " + CHART_NO + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PSNL_AGE : " + PSNL_AGE + " \n";
			G_INFO += " ZIP_CD : " + ZIP_CD + " \n";
			G_INFO += " ZIP_SQ : " + ZIP_SQ + " \n";
			G_INFO += " ZIP_AR : " + ZIP_AR + " \n";
			G_INFO += " ROAD_AR : " + ROAD_AR + " \n";
			G_INFO += " BLDG_NO : " + BLDG_NO + " \n";
			G_INFO += " TEL_NO : " + TEL_NO + " \n";
			G_INFO += " MOBL_NO : " + MOBL_NO + " \n";
			G_INFO += " EMAIL_AR : " + EMAIL_AR + " \n";
			G_INFO += " SEND_CD : " + SEND_CD + " \n";
			G_INFO += " SMS_YN : " + SMS_YN + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
			G_INFO += " DEPT_NM : " + DEPT_NM + " \n";
			G_INFO += " DIVI_CD : " + DIVI_CD + " \n";
			G_INFO += " ENTRY_DT : " + ENTRY_DT + " \n";
			G_INFO += " DIVI_NO : " + DIVI_NO + " \n";
			G_INFO += " DIVI_CS : " + DIVI_CS + " \n";
			G_INFO += " FAMY_CD : " + FAMY_CD + " \n";
			G_INFO += " FAMY_NM : " + FAMY_NM + " \n";
			G_INFO += " FOOD_YN : " + FOOD_YN + " \n";
			G_INFO += " SALES_ID : " + SALES_ID + " \n";
			G_INFO += " EXEC_ID : " + EXEC_ID + " \n";
			G_INFO += " INSU_NO : " + INSU_NO + " \n";
			G_INFO += " INSU_CD : " + INSU_CD + " \n";
			G_INFO += " ENTY_CD : " + ENTY_CD + " \n";
			G_INFO += " ASSO_CD : " + ASSO_CD + " \n";
			G_INFO += " CNTR_CD : " + CNTR_CD + " \n";
			G_INFO += " ARMY_CD : " + ARMY_CD + " \n";
			G_INFO += " CANAD_YN : " + CANAD_YN + " \n";
			G_INFO += " CANAD_KD : " + CANAD_KD + " \n";
			G_INFO += " TOTAL_YN : " + TOTAL_YN + " \n";
			G_INFO += " ACPT_TX : " + ACPT_TX + " \n";
			G_INFO += " COMP_CD2 : " + COMP_CD2 + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
