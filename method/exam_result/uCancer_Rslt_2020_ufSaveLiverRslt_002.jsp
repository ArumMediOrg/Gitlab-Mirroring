<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCancer_Rslt_2020_ufSaveLiverRslt_002.jsp"%>
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
		String ALT_VL = htMethod.get("ALT_VL");
		String HBTP_KD = htMethod.get("HBTP_KD");
		String HBRT_CD = htMethod.get("HBRT_CD");
		String HBRT_VL = htMethod.get("HBRT_VL");
		String HBVL_VL = htMethod.get("HBVL_VL");
		String HBPJ_KD = htMethod.get("HBPJ_KD");
		String HCTP_KD = htMethod.get("HCTP_KD");
		String HCRT_CD = htMethod.get("HCRT_CD");
		String HCRT_VL = htMethod.get("HCRT_VL");
		String HCVL_VL = htMethod.get("HCVL_VL");
		String HCPJ_KD = htMethod.get("HCPJ_KD");
		String LVEX_DT = htMethod.get("LVEX_DT");
		String USRL1_KD = htMethod.get("USRL1_KD");
		String USRL2_KD = htMethod.get("USRL2_KD");
		String USRL3_KD = htMethod.get("USRL3_KD");
		String USRL4_KD = htMethod.get("USRL4_KD");
		String USRL5_KD = htMethod.get("USRL5_KD");
		String USRL6_KD = htMethod.get("USRL6_KD");
		String USRL7_KD = htMethod.get("USRL7_KD");
		String USCN1_KD = htMethod.get("USCN1_KD");
		String USCN2_1_KD = htMethod.get("USCN2_1_KD");
		String USCN2_KD = htMethod.get("USCN2_KD");
		String USCN2_VL1 = htMethod.get("USCN2_VL1");
		String USCN2_VL2 = htMethod.get("USCN2_VL2");
		String USCN2_VL3 = htMethod.get("USCN2_VL3");
		String USETC_KD = htMethod.get("USETC_KD");
		String USETC_EX2 = htMethod.get("USETC_EX2");
		String USETC_EX = htMethod.get("USETC_EX");
		String AFPTP_KD = htMethod.get("AFPTP_KD");
		String AFPRT_CD = htMethod.get("AFPRT_CD");
		String AFPRT_VL = htMethod.get("AFPRT_VL");
		String AFPRT_UNIT = htMethod.get("AFPRT_UNIT");
		String AFPVL_VL = htMethod.get("AFPVL_VL");
		String RSLT_KD = htMethod.get("RSLT_KD");
		String ETC_EX = htMethod.get("ETC_EX");
		String LICN_YN = htMethod.get("LICN_YN");
		String RSLT_EX = htMethod.get("RSLT_EX");
		String CFRM_DT = htMethod.get("CFRM_DT");
		String LICEN_CD = htMethod.get("LICEN_CD");
		String CKUP_LICEN_CD = htMethod.get("CKUP_LICEN_CD");
		String USER = htMethod.get("USER");

		//
		if(ICOUNT == null) { ICOUNT = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ALT_VL == null) { ALT_VL = ""; }
		if(HBTP_KD == null) { HBTP_KD = ""; }
		if(HBRT_CD == null) { HBRT_CD = ""; }
		if(HBRT_VL == null) { HBRT_VL = ""; }
		if(HBVL_VL == null) { HBVL_VL = ""; }
		if(HBPJ_KD == null) { HBPJ_KD = ""; }
		if(HCTP_KD == null) { HCTP_KD = ""; }
		if(HCRT_CD == null) { HCRT_CD = ""; }
		if(HCRT_VL == null) { HCRT_VL = ""; }
		if(HCVL_VL == null) { HCVL_VL = ""; }
		if(HCPJ_KD == null) { HCPJ_KD = ""; }
		if(LVEX_DT == null) { LVEX_DT = ""; }
		if(USRL1_KD == null) { USRL1_KD = ""; }
		if(USRL2_KD == null) { USRL2_KD = ""; }
		if(USRL3_KD == null) { USRL3_KD = ""; }
		if(USRL4_KD == null) { USRL4_KD = ""; }
		if(USRL5_KD == null) { USRL5_KD = ""; }
		if(USRL6_KD == null) { USRL6_KD = ""; }
		if(USRL7_KD == null) { USRL7_KD = ""; }
		if(USCN1_KD == null) { USCN1_KD = ""; }
		if(USCN2_1_KD == null) { USCN2_1_KD = ""; }
		if(USCN2_KD == null) { USCN2_KD = ""; }
		if(USCN2_VL1 == null) { USCN2_VL1 = ""; }
		if(USCN2_VL2 == null) { USCN2_VL2 = ""; }
		if(USCN2_VL3 == null) { USCN2_VL3 = ""; }
		if(USETC_KD == null) { USETC_KD = ""; }
		if(USETC_EX2 == null) { USETC_EX2 = ""; }
		if(USETC_EX == null) { USETC_EX = ""; }
		if(AFPTP_KD == null) { AFPTP_KD = ""; }
		if(AFPRT_CD == null) { AFPRT_CD = ""; }
		if(AFPRT_VL == null) { AFPRT_VL = ""; }
		if(AFPRT_UNIT == null) { AFPRT_UNIT = ""; }
		if(AFPVL_VL == null) { AFPVL_VL = ""; }
		if(RSLT_KD == null) { RSLT_KD = ""; }
		if(ETC_EX == null) { ETC_EX = ""; }
		if(LICN_YN == null) { LICN_YN = ""; }
		if(RSLT_EX == null) { RSLT_EX = ""; }
		if(CFRM_DT == null) { CFRM_DT = ""; }
		if(LICEN_CD == null) { LICEN_CD = ""; }
		if(CKUP_LICEN_CD == null) { CKUP_LICEN_CD = ""; }
		if(USER == null) { USER = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCancer_Rslt_2020_ufSaveLiverRslt_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCancer_Rslt_2020_ufSaveLiverRslt_002 \n";
			G_INFO += "설명 : 간암 결과판정 저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ICOUNT : " + ICOUNT + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " ALT_VL : " + ALT_VL + " \n";
			G_INFO += " HBTP_KD : " + HBTP_KD + " \n";
			G_INFO += " HBRT_CD : " + HBRT_CD + " \n";
			G_INFO += " HBRT_VL : " + HBRT_VL + " \n";
			G_INFO += " HBVL_VL : " + HBVL_VL + " \n";
			G_INFO += " HBPJ_KD : " + HBPJ_KD + " \n";
			G_INFO += " HCTP_KD : " + HCTP_KD + " \n";
			G_INFO += " HCRT_CD : " + HCRT_CD + " \n";
			G_INFO += " HCRT_VL : " + HCRT_VL + " \n";
			G_INFO += " HCVL_VL : " + HCVL_VL + " \n";
			G_INFO += " HCPJ_KD : " + HCPJ_KD + " \n";
			G_INFO += " LVEX_DT : " + LVEX_DT + " \n";
			G_INFO += " USRL1_KD : " + USRL1_KD + " \n";
			G_INFO += " USRL2_KD : " + USRL2_KD + " \n";
			G_INFO += " USRL3_KD : " + USRL3_KD + " \n";
			G_INFO += " USRL4_KD : " + USRL4_KD + " \n";
			G_INFO += " USRL5_KD : " + USRL5_KD + " \n";
			G_INFO += " USRL6_KD : " + USRL6_KD + " \n";
			G_INFO += " USRL7_KD : " + USRL7_KD + " \n";
			G_INFO += " USCN1_KD : " + USCN1_KD + " \n";
			G_INFO += " USCN2_1_KD : " + USCN2_1_KD + " \n";
			G_INFO += " USCN2_KD : " + USCN2_KD + " \n";
			G_INFO += " USCN2_VL1 : " + USCN2_VL1 + " \n";
			G_INFO += " USCN2_VL2 : " + USCN2_VL2 + " \n";
			G_INFO += " USCN2_VL3 : " + USCN2_VL3 + " \n";
			G_INFO += " USETC_KD : " + USETC_KD + " \n";
			G_INFO += " USETC_EX2 : " + USETC_EX2 + " \n";
			G_INFO += " USETC_EX : " + USETC_EX + " \n";
			G_INFO += " AFPTP_KD : " + AFPTP_KD + " \n";
			G_INFO += " AFPRT_CD : " + AFPRT_CD + " \n";
			G_INFO += " AFPRT_VL : " + AFPRT_VL + " \n";
			G_INFO += " AFPRT_UNIT : " + AFPRT_UNIT + " \n";
			G_INFO += " AFPVL_VL : " + AFPVL_VL + " \n";
			G_INFO += " RSLT_KD : " + RSLT_KD + " \n";
			G_INFO += " ETC_EX : " + ETC_EX + " \n";
			G_INFO += " LICN_YN : " + LICN_YN + " \n";
			G_INFO += " RSLT_EX : " + RSLT_EX + " \n";
			G_INFO += " CFRM_DT : " + CFRM_DT + " \n";
			G_INFO += " LICEN_CD : " + LICEN_CD + " \n";
			G_INFO += " CKUP_LICEN_CD : " + CKUP_LICEN_CD + " \n";
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
