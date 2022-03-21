<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCancer_Rslt_2020_ufSaveBrstRslt_002.jsp"%>
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

		String ICOUNT = htMethod.get("ICOUNT");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String MGEX_DT = htMethod.get("MGEX_DT");
		String MGDS_KD = htMethod.get("MGDS_KD");
		String MGEX_KD = htMethod.get("MGEX_KD");
		String MGPT_KD = htMethod.get("MGPT_KD");
		String MGRT1_KD = htMethod.get("MGRT1_KD");
		String MGRT1SR_KD = htMethod.get("MGRT1SR_KD");
		String MGRT1R_EX = htMethod.get("MGRT1R_EX");
		String MGRT1SL_KD = htMethod.get("MGRT1SL_KD");
		String MGRT1L_EX = htMethod.get("MGRT1L_EX");
		String MGRT2SL_KD = htMethod.get("MGRT2SL_KD");
		String MGRT2L_EX = htMethod.get("MGRT2L_EX");
		String MGRT2_KD = htMethod.get("MGRT2_KD");
		String MGRT2SR_KD = htMethod.get("MGRT2SR_KD");
		String MGRT2R_EX = htMethod.get("MGRT2R_EX");
		String MGRT3_KD = htMethod.get("MGRT3_KD");
		String MGRT3SR_KD = htMethod.get("MGRT3SR_KD");
		String MGRT3R_EX = htMethod.get("MGRT3R_EX");
		String MGRT3SL_KD = htMethod.get("MGRT3SL_KD");
		String MGRT3L_EX = htMethod.get("MGRT3L_EX");
		String MGRT_EX = htMethod.get("MGRT_EX");
		String RSLT_KD = htMethod.get("RSLT_KD");
		String BRCN_YN = htMethod.get("BRCN_YN");
		String RSLT_EX = htMethod.get("RSLT_EX");
		String CFRM_DT = htMethod.get("CFRM_DT");
		String LICEN_CD = htMethod.get("LICEN_CD");
		String DECI_LICEN_CD = htMethod.get("DECI_LICEN_CD");
		String USER = htMethod.get("USER");

		//
		if(ICOUNT == null) { ICOUNT = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(MGEX_DT == null) { MGEX_DT = ""; }
		if(MGDS_KD == null) { MGDS_KD = ""; }
		if(MGEX_KD == null) { MGEX_KD = ""; }
		if(MGPT_KD == null) { MGPT_KD = ""; }
		if(MGRT1_KD == null) { MGRT1_KD = ""; }
		if(MGRT1SR_KD == null) { MGRT1SR_KD = ""; }
		if(MGRT1R_EX == null) { MGRT1R_EX = ""; }
		if(MGRT1SL_KD == null) { MGRT1SL_KD = ""; }
		if(MGRT1L_EX == null) { MGRT1L_EX = ""; }
		if(MGRT2SL_KD == null) { MGRT2SL_KD = ""; }
		if(MGRT2L_EX == null) { MGRT2L_EX = ""; }
		if(MGRT2_KD == null) { MGRT2_KD = ""; }
		if(MGRT2SR_KD == null) { MGRT2SR_KD = ""; }
		if(MGRT2R_EX == null) { MGRT2R_EX = ""; }
		if(MGRT3_KD == null) { MGRT3_KD = ""; }
		if(MGRT3SR_KD == null) { MGRT3SR_KD = ""; }
		if(MGRT3R_EX == null) { MGRT3R_EX = ""; }
		if(MGRT3SL_KD == null) { MGRT3SL_KD = ""; }
		if(MGRT3L_EX == null) { MGRT3L_EX = ""; }
		if(MGRT_EX == null) { MGRT_EX = ""; }
		if(RSLT_KD == null) { RSLT_KD = ""; }
		if(BRCN_YN == null) { BRCN_YN = ""; }
		if(RSLT_EX == null) { RSLT_EX = ""; }
		if(CFRM_DT == null) { CFRM_DT = ""; }
		if(LICEN_CD == null) { LICEN_CD = ""; }
		if(DECI_LICEN_CD == null) { DECI_LICEN_CD = ""; }
		if(USER == null) { USER = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCancer_Rslt_2020_ufSaveBrstRslt_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCancer_Rslt_2020_ufSaveBrstRslt_002 \n";
			G_INFO += "설명 : 유방암 결과판정 저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ICOUNT : " + ICOUNT + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " MGEX_DT : " + MGEX_DT + " \n";
			G_INFO += " MGDS_KD : " + MGDS_KD + " \n";
			G_INFO += " MGEX_KD : " + MGEX_KD + " \n";
			G_INFO += " MGPT_KD : " + MGPT_KD + " \n";
			G_INFO += " MGRT1_KD : " + MGRT1_KD + " \n";
			G_INFO += " MGRT1SR_KD : " + MGRT1SR_KD + " \n";
			G_INFO += " MGRT1R_EX : " + MGRT1R_EX + " \n";
			G_INFO += " MGRT1SL_KD : " + MGRT1SL_KD + " \n";
			G_INFO += " MGRT1L_EX : " + MGRT1L_EX + " \n";
			G_INFO += " MGRT2SL_KD : " + MGRT2SL_KD + " \n";
			G_INFO += " MGRT2L_EX : " + MGRT2L_EX + " \n";
			G_INFO += " MGRT2_KD : " + MGRT2_KD + " \n";
			G_INFO += " MGRT2SR_KD : " + MGRT2SR_KD + " \n";
			G_INFO += " MGRT2R_EX : " + MGRT2R_EX + " \n";
			G_INFO += " MGRT3_KD : " + MGRT3_KD + " \n";
			G_INFO += " MGRT3SR_KD : " + MGRT3SR_KD + " \n";
			G_INFO += " MGRT3R_EX : " + MGRT3R_EX + " \n";
			G_INFO += " MGRT3SL_KD : " + MGRT3SL_KD + " \n";
			G_INFO += " MGRT3L_EX : " + MGRT3L_EX + " \n";
			G_INFO += " MGRT_EX : " + MGRT_EX + " \n";
			G_INFO += " RSLT_KD : " + RSLT_KD + " \n";
			G_INFO += " BRCN_YN : " + BRCN_YN + " \n";
			G_INFO += " RSLT_EX : " + RSLT_EX + " \n";
			G_INFO += " CFRM_DT : " + CFRM_DT + " \n";
			G_INFO += " LICEN_CD : " + LICEN_CD + " \n";
			G_INFO += " DECI_LICEN_CD : " + DECI_LICEN_CD + " \n";
			G_INFO += " USER : " + USER + " \n";
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
