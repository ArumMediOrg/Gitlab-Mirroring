<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uStdt_Acpt_btnInjkSaveClick_001.jsp"%>
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
		String PLCE_CD = htMethod.get("PLCE_CD");
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
		String COMP_CD = htMethod.get("COMP_CD");
		String COTK_CD = htMethod.get("COTK_CD");
		String DEPT_NM = htMethod.get("DEPT_NM");
		String DIVI_CD = htMethod.get("DIVI_CD");
		String DIVI_NO = htMethod.get("DIVI_NO");
		String DIVI_CS = htMethod.get("DIVI_CS");
		String CLSS_KD = htMethod.get("CLSS_KD");
		String FOOD_YN = htMethod.get("FOOD_YN");
		String SALES_ID = htMethod.get("SALES_ID");
		String ORAL_YN = htMethod.get("ORAL_YN");
		String FAMY_NM = htMethod.get("FAMY_NM");
		String ARMY_CD = htMethod.get("ARMY_CD");
		String ACPT_TX = htMethod.get("ACPT_TX");
		String MODI_ID = htMethod.get("MODI_ID");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
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
		if(COMP_CD == null) { COMP_CD = ""; }
		if(COTK_CD == null) { COTK_CD = ""; }
		if(DEPT_NM == null) { DEPT_NM = ""; }
		if(DIVI_CD == null) { DIVI_CD = ""; }
		if(DIVI_NO == null) { DIVI_NO = ""; }
		if(DIVI_CS == null) { DIVI_CS = ""; }
		if(CLSS_KD == null) { CLSS_KD = ""; }
		if(FOOD_YN == null) { FOOD_YN = ""; }
		if(SALES_ID == null) { SALES_ID = ""; }
		if(ORAL_YN == null) { ORAL_YN = ""; }
		if(FAMY_NM == null) { FAMY_NM = ""; }
		if(ARMY_CD == null) { ARMY_CD = ""; }
		if(ACPT_TX == null) { ACPT_TX = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uStdt_Acpt_btnInjkSaveClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Acpt_btnInjkSaveClick_001 \n";
			G_INFO += "설명 : 학생 접수 인적 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
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
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " COTK_CD : " + COTK_CD + " \n";
			G_INFO += " DEPT_NM : " + DEPT_NM + " \n";
			G_INFO += " DIVI_CD : " + DIVI_CD + " \n";
			G_INFO += " DIVI_NO : " + DIVI_NO + " \n";
			G_INFO += " DIVI_CS : " + DIVI_CS + " \n";
			G_INFO += " CLSS_KD : " + CLSS_KD + " \n";
			G_INFO += " FOOD_YN : " + FOOD_YN + " \n";
			G_INFO += " SALES_ID : " + SALES_ID + " \n";
			G_INFO += " ORAL_YN : " + ORAL_YN + " \n";
			G_INFO += " FAMY_NM : " + FAMY_NM + " \n";
			G_INFO += " ARMY_CD : " + ARMY_CD + " \n";
			G_INFO += " ACPT_TX : " + ACPT_TX + " \n";
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
