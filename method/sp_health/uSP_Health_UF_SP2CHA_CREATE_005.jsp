<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
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

		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = "INSERT INTO ET_EXAM_ACPT (EEA_EXAM_DT, EEA_EXAM_SQ, EEA_ACPT_TM, EEA_ACPT_CD, EEA_ACPT_KD, EEA_PLCE_CD, EEA_CUST_NO, EEA_MMBR_CD, EEA_PSNL_NM, EEA_SEX_CD, EEA_PSNL_AGE, EEA_ZIP_CD, EEA_ZIP_SQ, EEA_ZIP_AR, EEA_ROAD_AR, EEA_BLDG_NO, EEA_TEL_NO, EEA_MOBL_NO, EEA_EMAIL_AR, EEA_SEND_CD, EEA_SMS_YN, EEA_COMP_CD, EEA_COTK_CD, EEA_NOTE_YN, EEA_DEPT_CD, EEA_DEPT_NM, EEA_DIVI_CD, EEA_ENTRY_DT, EEA_FAMY_CD, EEA_FAMY_NM, EEA_FOOD_YN, EEA_EXAM_CD, EEA_SPSB_CD, EEA_HTSB_YN, EEA_SPSB_YN, EEA_CVSB_YN, EEA_EMSB_YN, EEA_ETSB_YN, EEA_CNCL_CD, EEA_MNGT_SPYM, EEA_EXAM_LT, EEA_SPCL_LT, EEA_SPCL_CD, EEA_SPHT_CD, EEA_INSU_CD, EEA_ENTY_CD, EEA_HEPA_YN, EEA_ORAL_YN, EEA_CANAD_YN, EEA_STOMA_CD, EEA_COLON_CD, EEA_LIVER_CD, EEA_BAST_CD, EEA_UTER_CD, EEA_HDMD_YN, EEA_SDMD_YN, EEA_SPRT_PR, EEA_COMP_PR, EEA_PSNL_PR, EEA_HLTH_PR, EEA_SPCL_PR, EEA_CAN_PR, EEA_ORAL_PR, EEA_COMPR_PR, EEA_PSNLR_PR, EEA_HLTHR_PR, EEA_SPCLR_PR, EEA_CANR_PR, EEA_ORALR_PR, EEA_PYER_CD, EEA_CMPY_CD, EEA_PRPY_CD, EEA_RECE_KD, EEA_RSLT_CD, EEA_BLRT_CD, EEA_ORDER_YN, EEA_CANAD_KD, EEA_2ND_YN, EEA_COMP_CD2, EEA_LIFE_YN, EEA_TOTAL_YN, EEA_HCV_YN, EEA_SELF_KD, EEA_CANPR_KD, EEA_HLTH_KD, EEA_SAFE_YN, EEA_PDF_KD, EEA_HOLIDAY_YN,EEA_INPT_ID, EEA_INPT_DTT, EEA_DISC_PR, EEA_DISC_RT, EEA_DISC_CPR) VALUES ";
		sql += SSQL_ADD;

		stmtExec.executeUpdate(sql);
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_UF_SP2CHA_CREATE_005 \n";
			G_INFO += "설명 : 2차접수생성-접수저장(insert) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
	} catch (Exception e) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= e.toString()%>]]></errorMsg>
	<sql><![CDATA[<%= sql%>]]></sql>
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
