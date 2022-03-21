<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCancer_Rslt_2020_ufSaveStmcRslt_002.jsp"%>
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
		String GIEX_KD = htMethod.get("GIEX_KD");
		String GIEX_DT = htMethod.get("GIEX_DT");
		String GICM_KD = htMethod.get("GICM_KD");
		String GIRT1_KD = htMethod.get("GIRT1_KD");
		String GIRT1S_KD = htMethod.get("GIRT1S_KD");
		String GIRT2_KD = htMethod.get("GIRT2_KD");
		String GIRT2S_KD = htMethod.get("GIRT2S_KD");
		String GIRT3_KD = htMethod.get("GIRT3_KD");
		String GIRT3S_KD = htMethod.get("GIRT3S_KD");
		String GIETC_KD = htMethod.get("GIETC_KD");
		String GIRT_EX = htMethod.get("GIRT_EX");
		String ENEX_DT = htMethod.get("ENEX_DT");
		String ENRT1_KD = htMethod.get("ENRT1_KD");
		String ENRT1S_KD = htMethod.get("ENRT1S_KD");
		String ENRT2_KD = htMethod.get("ENRT2_KD");
		String ENRT2S_KD = htMethod.get("ENRT2S_KD");
		String ENRT3_KD = htMethod.get("ENRT3_KD");
		String ENRT3S_KD = htMethod.get("ENRT3S_KD");
		String ENETC_KD = htMethod.get("ENETC_KD");
		String ENRT_EX = htMethod.get("ENRT_EX");
		String BIEX_YN = htMethod.get("BIEX_YN");
		String FOCP_KD = htMethod.get("FOCP_KD");
		String BICT_KD = htMethod.get("BICT_KD");
		String BIRT_KD = htMethod.get("BIRT_KD");
		String BICNCR_KD = htMethod.get("BICNCR_KD");
		String BIETC_KD = htMethod.get("BIETC_KD");
		String BICNCR_EX = htMethod.get("BICNCR_EX");
		String BIETC_EX = htMethod.get("BIETC_EX");
		String RSLT_KD = htMethod.get("RSLT_KD");
		String ETC_EX = htMethod.get("ETC_EX");
		String STCN_YN = htMethod.get("STCN_YN");
		String RSLT_EX = htMethod.get("RSLT_EX");
		String CFRM_DT = htMethod.get("CFRM_DT");
		String LICEN_CD = htMethod.get("LICEN_CD");
		String DECI_LICEN_CD = htMethod.get("DECI_LICEN_CD");
		String CKUP_LICEN_CD = htMethod.get("CKUP_LICEN_CD");
		String PATH_LICEN_CD = htMethod.get("PATH_LICEN_CD");
		String USER = htMethod.get("USER");

		//
		if(ICOUNT == null) { ICOUNT = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(GIEX_KD == null) { GIEX_KD = ""; }
		if(GIEX_DT == null) { GIEX_DT = ""; }
		if(GICM_KD == null) { GICM_KD = ""; }
		if(GIRT1_KD == null) { GIRT1_KD = ""; }
		if(GIRT1S_KD == null) { GIRT1S_KD = ""; }
		if(GIRT2_KD == null) { GIRT2_KD = ""; }
		if(GIRT2S_KD == null) { GIRT2S_KD = ""; }
		if(GIRT3_KD == null) { GIRT3_KD = ""; }
		if(GIRT3S_KD == null) { GIRT3S_KD = ""; }
		if(GIETC_KD == null) { GIETC_KD = ""; }
		if(GIRT_EX == null) { GIRT_EX = ""; }
		if(ENEX_DT == null) { ENEX_DT = ""; }
		if(ENRT1_KD == null) { ENRT1_KD = ""; }
		if(ENRT1S_KD == null) { ENRT1S_KD = ""; }
		if(ENRT2_KD == null) { ENRT2_KD = ""; }
		if(ENRT2S_KD == null) { ENRT2S_KD = ""; }
		if(ENRT3_KD == null) { ENRT3_KD = ""; }
		if(ENRT3S_KD == null) { ENRT3S_KD = ""; }
		if(ENETC_KD == null) { ENETC_KD = ""; }
		if(ENRT_EX == null) { ENRT_EX = ""; }
		if(BIEX_YN == null) { BIEX_YN = ""; }
		if(FOCP_KD == null) { FOCP_KD = ""; }
		if(BICT_KD == null) { BICT_KD = ""; }
		if(BIRT_KD == null) { BIRT_KD = ""; }
		if(BICNCR_KD == null) { BICNCR_KD = ""; }
		if(BIETC_KD == null) { BIETC_KD = ""; }
		if(BICNCR_EX == null) { BICNCR_EX = ""; }
		if(BIETC_EX == null) { BIETC_EX = ""; }
		if(RSLT_KD == null) { RSLT_KD = ""; }
		if(ETC_EX == null) { ETC_EX = ""; }
		if(STCN_YN == null) { STCN_YN = ""; }
		if(RSLT_EX == null) { RSLT_EX = ""; }
		if(CFRM_DT == null) { CFRM_DT = ""; }
		if(LICEN_CD == null) { LICEN_CD = ""; }
		if(DECI_LICEN_CD == null) { DECI_LICEN_CD = ""; }
		if(CKUP_LICEN_CD == null) { CKUP_LICEN_CD = ""; }
		if(PATH_LICEN_CD == null) { PATH_LICEN_CD = ""; }
		if(USER == null) { USER = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCancer_Rslt_2020_ufSaveStmcRslt_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCancer_Rslt_2020_ufSaveStmcRslt_002 \n";
			G_INFO += "설명 : 위암 결과판정 저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ICOUNT : " + ICOUNT + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " GIEX_KD : " + GIEX_KD + " \n";
			G_INFO += " GIEX_DT : " + GIEX_DT + " \n";
			G_INFO += " GICM_KD : " + GICM_KD + " \n";
			G_INFO += " GIRT1_KD : " + GIRT1_KD + " \n";
			G_INFO += " GIRT1S_KD : " + GIRT1S_KD + " \n";
			G_INFO += " GIRT2_KD : " + GIRT2_KD + " \n";
			G_INFO += " GIRT2S_KD : " + GIRT2S_KD + " \n";
			G_INFO += " GIRT3_KD : " + GIRT3_KD + " \n";
			G_INFO += " GIRT3S_KD : " + GIRT3S_KD + " \n";
			G_INFO += " GIETC_KD : " + GIETC_KD + " \n";
			G_INFO += " GIRT_EX : " + GIRT_EX + " \n";
			G_INFO += " ENEX_DT : " + ENEX_DT + " \n";
			G_INFO += " ENRT1_KD : " + ENRT1_KD + " \n";
			G_INFO += " ENRT1S_KD : " + ENRT1S_KD + " \n";
			G_INFO += " ENRT2_KD : " + ENRT2_KD + " \n";
			G_INFO += " ENRT2S_KD : " + ENRT2S_KD + " \n";
			G_INFO += " ENRT3_KD : " + ENRT3_KD + " \n";
			G_INFO += " ENRT3S_KD : " + ENRT3S_KD + " \n";
			G_INFO += " ENETC_KD : " + ENETC_KD + " \n";
			G_INFO += " ENRT_EX : " + ENRT_EX + " \n";
			G_INFO += " BIEX_YN : " + BIEX_YN + " \n";
			G_INFO += " FOCP_KD : " + FOCP_KD + " \n";
			G_INFO += " BICT_KD : " + BICT_KD + " \n";
			G_INFO += " BIRT_KD : " + BIRT_KD + " \n";
			G_INFO += " BICNCR_KD : " + BICNCR_KD + " \n";
			G_INFO += " BIETC_KD : " + BIETC_KD + " \n";
			G_INFO += " BICNCR_EX : " + BICNCR_EX + " \n";
			G_INFO += " BIETC_EX : " + BIETC_EX + " \n";
			G_INFO += " RSLT_KD : " + RSLT_KD + " \n";
			G_INFO += " ETC_EX : " + ETC_EX + " \n";
			G_INFO += " STCN_YN : " + STCN_YN + " \n";
			G_INFO += " RSLT_EX : " + RSLT_EX + " \n";
			G_INFO += " CFRM_DT : " + CFRM_DT + " \n";
			G_INFO += " LICEN_CD : " + LICEN_CD + " \n";
			G_INFO += " DECI_LICEN_CD : " + DECI_LICEN_CD + " \n";
			G_INFO += " CKUP_LICEN_CD : " + CKUP_LICEN_CD + " \n";
			G_INFO += " PATH_LICEN_CD : " + PATH_LICEN_CD + " \n";
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
