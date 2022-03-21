<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCOMP_CNRT_CUST_APPLY_BtnExcel_SaveClick_001.jsp"%>
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

		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String CNRT_SQ = htMethod.get("CNRT_SQ");
		String CUST_SQ = htMethod.get("CUST_SQ");
		String CUST_NM = htMethod.get("CUST_NM");
		String SEX_CD = htMethod.get("SEX_CD");
		String BITH_DT = htMethod.get("BITH_DT");
		String PENL_ID = htMethod.get("PENL_ID");
		String MOBL_NO = htMethod.get("MOBL_NO");
		String TEL_NO = htMethod.get("TEL_NO");
		String EMAIL_AR = htMethod.get("EMAIL_AR");
		String ZIP_CD = htMethod.get("ZIP_CD");
		String ZIP_SQ = htMethod.get("ZIP_SQ");
		String ZIP_AR = htMethod.get("ZIP_AR");
		String ROAD_AR = htMethod.get("ROAD_AR");
		String NHIS_YN = htMethod.get("NHIS_YN");
		String NHIC_TX = htMethod.get("NHIC_TX");
		String DEPT_NM = htMethod.get("DEPT_NM");
		String HALF_CD = htMethod.get("HALF_CD");
		String DEPT_CD = htMethod.get("DEPT_CD");
		String ADD_YN = htMethod.get("ADD_YN");
		String BLDG_NO = htMethod.get("BLDG_NO");
		String EMPL_CD = htMethod.get("EMPL_CD");
		String PROF_SQ = htMethod.get("PROF_SQ");
		String COTK_YN = htMethod.get("COTK_YN");
		String USE_YN = htMethod.get("USE_YN");
		String ENTRY_DT = htMethod.get("ENTRY_DT");
		String JUIP_DT = htMethod.get("JUIP_DT");
		String NCHR_HH = htMethod.get("NCHR_HH");
		String DIVI_CD = htMethod.get("DIVI_CD");
		String WORK_LT = htMethod.get("WORK_LT");
		String GOJU_CD = htMethod.get("GOJU_CD");
		String JIJO_CD = htMethod.get("JIJO_CD");
		String GOJU1_CD = htMethod.get("GOJU1_CD");
		String FROM1_DT = htMethod.get("FROM1_DT");
		String TO1_DT = htMethod.get("TO1_DT");
		String GOJU2_CD = htMethod.get("GOJU2_CD");
		String FROM2_DT = htMethod.get("FROM2_DT");
		String TO2_DT = htMethod.get("TO2_DT");
		String MEMO_TX = htMethod.get("MEMO_TX");
		String RSVT_DT = htMethod.get("RSVT_DT");
		String G_ENCRT_KD = htMethod.get("G_ENCRT_KD");
		String PID_EN = htMethod.get("PID_EN");
		String USER_ID = htMethod.get("USER_ID");
		String HLTH_KD = htMethod.get("HLTH_KD");
		String QSTN_NO = htMethod.get("QSTN_NO");
		String HTSB_YN = htMethod.get("HTSB_YN");
		String CANCER_YN = htMethod.get("CANCER_YN");
		String ORAL_YN = htMethod.get("ORAL_YN");
		String TOTAL_YN = htMethod.get("TOTAL_YN");
		String SMS_YN = htMethod.get("SMS_YN");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }
		if(CUST_SQ == null) { CUST_SQ = ""; }
		if(CUST_NM == null) { CUST_NM = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(BITH_DT == null) { BITH_DT = ""; }
		if(PENL_ID == null) { PENL_ID = ""; }
		if(MOBL_NO == null) { MOBL_NO = ""; }
		if(TEL_NO == null) { TEL_NO = ""; }
		if(EMAIL_AR == null) { EMAIL_AR = ""; }
		if(ZIP_CD == null) { ZIP_CD = ""; }
		if(ZIP_SQ == null) { ZIP_SQ = ""; }
		if(ZIP_AR == null) { ZIP_AR = ""; }
		if(ROAD_AR == null) { ROAD_AR = ""; }
		if(NHIS_YN == null) { NHIS_YN = ""; }
		if(NHIC_TX == null) { NHIC_TX = ""; }
		if(DEPT_NM == null) { DEPT_NM = ""; }
		if(HALF_CD == null) { HALF_CD = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }
		if(ADD_YN == null) { ADD_YN = ""; }
		if(BLDG_NO == null) { BLDG_NO = ""; }
		if(EMPL_CD == null) { EMPL_CD = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }
		if(COTK_YN == null) { COTK_YN = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(ENTRY_DT == null) { ENTRY_DT = ""; }
		if(JUIP_DT == null) { JUIP_DT = ""; }
		if(NCHR_HH == null) { NCHR_HH = ""; }
		if(DIVI_CD == null) { DIVI_CD = ""; }
		if(WORK_LT == null) { WORK_LT = ""; }
		if(GOJU_CD == null) { GOJU_CD = ""; }
		if(JIJO_CD == null) { JIJO_CD = ""; }
		if(GOJU1_CD == null) { GOJU1_CD = ""; }
		if(FROM1_DT == null) { FROM1_DT = ""; }
		if(TO1_DT == null) { TO1_DT = ""; }
		if(GOJU2_CD == null) { GOJU2_CD = ""; }
		if(FROM2_DT == null) { FROM2_DT = ""; }
		if(TO2_DT == null) { TO2_DT = ""; }
		if(MEMO_TX == null) { MEMO_TX = ""; }
		if(RSVT_DT == null) { RSVT_DT = ""; }
		if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
		if(PID_EN == null) { PID_EN = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(HLTH_KD == null) { HLTH_KD = ""; }
		if(QSTN_NO == null) { QSTN_NO = ""; }
		if(HTSB_YN == null) { HTSB_YN = ""; }
		if(CANCER_YN == null) { CANCER_YN = ""; }
		if(ORAL_YN == null) { ORAL_YN = ""; }
		if(TOTAL_YN == null) { TOTAL_YN = ""; }
		if(SMS_YN == null) { SMS_YN = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCOMP_CNRT_CUST_APPLY_BtnExcel_SaveClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_CUST_APPLY_BtnExcel_SaveClick_001 \n";
			G_INFO += "설명 : 명단관리 저장(insert) - 엑셀일괄등록 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
			G_INFO += " CUST_SQ : " + CUST_SQ + " \n";
			G_INFO += " CUST_NM : " + CUST_NM + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " BITH_DT : " + BITH_DT + " \n";
			G_INFO += " PENL_ID : " + PENL_ID + " \n";
			G_INFO += " MOBL_NO : " + MOBL_NO + " \n";
			G_INFO += " TEL_NO : " + TEL_NO + " \n";
			G_INFO += " EMAIL_AR : " + EMAIL_AR + " \n";
			G_INFO += " ZIP_CD : " + ZIP_CD + " \n";
			G_INFO += " ZIP_SQ : " + ZIP_SQ + " \n";
			G_INFO += " ZIP_AR : " + ZIP_AR + " \n";
			G_INFO += " ROAD_AR : " + ROAD_AR + " \n";
			G_INFO += " NHIS_YN : " + NHIS_YN + " \n";
			G_INFO += " NHIC_TX : " + NHIC_TX + " \n";
			G_INFO += " DEPT_NM : " + DEPT_NM + " \n";
			G_INFO += " HALF_CD : " + HALF_CD + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
			G_INFO += " ADD_YN : " + ADD_YN + " \n";
			G_INFO += " BLDG_NO : " + BLDG_NO + " \n";
			G_INFO += " EMPL_CD : " + EMPL_CD + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
			G_INFO += " COTK_YN : " + COTK_YN + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " ENTRY_DT : " + ENTRY_DT + " \n";
			G_INFO += " JUIP_DT : " + JUIP_DT + " \n";
			G_INFO += " NCHR_HH : " + NCHR_HH + " \n";
			G_INFO += " DIVI_CD : " + DIVI_CD + " \n";
			G_INFO += " WORK_LT : " + WORK_LT + " \n";
			G_INFO += " GOJU_CD : " + GOJU_CD + " \n";
			G_INFO += " JIJO_CD : " + JIJO_CD + " \n";
			G_INFO += " GOJU1_CD : " + GOJU1_CD + " \n";
			G_INFO += " FROM1_DT : " + FROM1_DT + " \n";
			G_INFO += " TO1_DT : " + TO1_DT + " \n";
			G_INFO += " GOJU2_CD : " + GOJU2_CD + " \n";
			G_INFO += " FROM2_DT : " + FROM2_DT + " \n";
			G_INFO += " TO2_DT : " + TO2_DT + " \n";
			G_INFO += " MEMO_TX : " + MEMO_TX + " \n";
			G_INFO += " RSVT_DT : " + RSVT_DT + " \n";
			G_INFO += " G_ENCRT_KD : " + G_ENCRT_KD + " \n";
			G_INFO += " PID_EN : " + PID_EN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " HLTH_KD : " + HLTH_KD + " \n";
			G_INFO += " QSTN_NO : " + QSTN_NO + " \n";
			G_INFO += " HTSB_YN : " + HTSB_YN + " \n";
			G_INFO += " CANCER_YN : " + CANCER_YN + " \n";
			G_INFO += " ORAL_YN : " + ORAL_YN + " \n";
			G_INFO += " TOTAL_YN : " + TOTAL_YN + " \n";
			G_INFO += " SMS_YN : " + SMS_YN + " \n";
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
