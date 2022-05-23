<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uItem_Apply_ufSave_001.jsp"%>
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

	String SMODE = htMethod.get("SMODE");
	String IIM_ITEM_CD = htMethod.get("IIM_ITEM_CD");
	String IIM_NITEM_CD = htMethod.get("IIM_NITEM_CD");
	String IIM_KNME_NM = htMethod.get("IIM_KNME_NM");
	String IIM_ENME_NM = htMethod.get("IIM_ENME_NM");
	String IIM_CNME_NM = htMethod.get("IIM_CNME_NM");
	String IIM_RNME_NM = htMethod.get("IIM_RNME_NM");
	String IIM_JNME_NM = htMethod.get("IIM_JNME_NM");
	String IIM_SNME_NM = htMethod.get("IIM_SNME_NM");
	String IIM_OSCD_CD = htMethod.get("IIM_OSCD_CD");
	String IIM_GBCD_CD = htMethod.get("IIM_GBCD_CD");
	String IIM_SBCD_CD = htMethod.get("IIM_SBCD_CD");
	String IIM_EXGN_CD = htMethod.get("IIM_EXGN_CD");
	String IIM_RSLT_KD = htMethod.get("IIM_RSLT_KD");
	String IIM_SORT_SQ = htMethod.get("IIM_SORT_SQ");
	String IIM_BLPT_CD = htMethod.get("IIM_BLPT_CD");
	String IIM_REJH_EX = htMethod.get("IIM_REJH_EX");
	String IIM_OSSB_CD = htMethod.get("IIM_OSSB_CD");
	String IIM_OSRL_CD = htMethod.get("IIM_OSRL_CD");
	String IIM_ACAL_YN = htMethod.get("IIM_ACAL_YN");
	String IIM_SAMP_CD = htMethod.get("IIM_SAMP_CD");
	String IIM_CANCER_CD = htMethod.get("IIM_CANCER_CD");
	String IIM_CNIT_CD = htMethod.get("IIM_CNIT_CD");
	String IIM_SUTK_YN = htMethod.get("IIM_SUTK_YN");
	String IIM_SUTK_CD = htMethod.get("IIM_SUTK_CD");
	String IIM_PNUM_CD = htMethod.get("IIM_PNUM_CD");
	String IIM_TUSE_YN = htMethod.get("IIM_TUSE_YN");
	String IIM_TPRT_CD = htMethod.get("IIM_TPRT_CD");
	String IIM_TRTP_CD = htMethod.get("IIM_TRTP_CD");
	String IIM_TRLT_CD = htMethod.get("IIM_TRLT_CD");
	String IIM_TRNM_CD = htMethod.get("IIM_TRNM_CD");
	String IIM_TXRAY_YN = htMethod.get("IIM_TXRAY_YN");
	String IIM_TBIO_YN = htMethod.get("IIM_TBIO_YN");
	String IIM_TSND_YN = htMethod.get("IIM_TSND_YN");
	String IIM_TETC_YN = htMethod.get("IIM_TETC_YN");
	String IIM_THPR_YN = htMethod.get("IIM_THPR_YN");
	String IIM_THPR1_CD = htMethod.get("IIM_THPR1_CD");
	String IIM_THPR2_CD = htMethod.get("IIM_THPR2_CD");
	String IIM_TEDT_YR = htMethod.get("IIM_TEDT_YR");
	String IIM_MIN_VL = htMethod.get("IIM_MIN_VL");
	String IIM_MAX_VL = htMethod.get("IIM_MAX_VL");
	String IIM_DFLT_VL = htMethod.get("IIM_DFLT_VL");
	String IIM_SANBO_KD = htMethod.get("IIM_SANBO_KD");
	String IIM_SANBO_CD = htMethod.get("IIM_SANBO_CD");
	String IIM_SANBO_CAL = htMethod.get("IIM_SANBO_CAL");
	String IIM_USE_YN = htMethod.get("IIM_USE_YN");
	String IIM_INPT_ID = htMethod.get("IIM_INPT_ID");
	String IIM_MODI_ID = htMethod.get("IIM_MODI_ID");
	String IIM_ETONME_NM = htMethod.get("IIM_ETONME_NM");

	//
	if(SMODE == null) { SMODE = ""; }
	if(IIM_ITEM_CD == null) { IIM_ITEM_CD = ""; }
	if(IIM_NITEM_CD == null) { IIM_NITEM_CD = ""; }
	if(IIM_KNME_NM == null) { IIM_KNME_NM = ""; }
	if(IIM_ENME_NM == null) { IIM_ENME_NM = ""; }
	if(IIM_CNME_NM == null) { IIM_CNME_NM = ""; }
	if(IIM_RNME_NM == null) { IIM_RNME_NM = ""; }
	if(IIM_JNME_NM == null) { IIM_JNME_NM = ""; }
	if(IIM_SNME_NM == null) { IIM_SNME_NM = ""; }
	if(IIM_OSCD_CD == null) { IIM_OSCD_CD = ""; }
	if(IIM_GBCD_CD == null) { IIM_GBCD_CD = ""; }
	if(IIM_SBCD_CD == null) { IIM_SBCD_CD = ""; }
	if(IIM_EXGN_CD == null) { IIM_EXGN_CD = ""; }
	if(IIM_RSLT_KD == null) { IIM_RSLT_KD = ""; }
	if(IIM_SORT_SQ == null) { IIM_SORT_SQ = ""; }
	if(IIM_BLPT_CD == null) { IIM_BLPT_CD = ""; }
	if(IIM_REJH_EX == null) { IIM_REJH_EX = ""; }
	if(IIM_OSSB_CD == null) { IIM_OSSB_CD = ""; }
	if(IIM_OSRL_CD == null) { IIM_OSRL_CD = ""; }
	if(IIM_ACAL_YN == null) { IIM_ACAL_YN = ""; }
	if(IIM_SAMP_CD == null) { IIM_SAMP_CD = ""; }
	if(IIM_CANCER_CD == null) { IIM_CANCER_CD = ""; }
	if(IIM_CNIT_CD == null) { IIM_CNIT_CD = ""; }
	if(IIM_SUTK_YN == null) { IIM_SUTK_YN = ""; }
	if(IIM_SUTK_CD == null) { IIM_SUTK_CD = ""; }
	if(IIM_PNUM_CD == null) { IIM_PNUM_CD = ""; }
	if(IIM_TUSE_YN == null) { IIM_TUSE_YN = ""; }
	if(IIM_TPRT_CD == null) { IIM_TPRT_CD = ""; }
	if(IIM_TRTP_CD == null) { IIM_TRTP_CD = ""; }
	if(IIM_TRLT_CD == null) { IIM_TRLT_CD = ""; }
	if(IIM_TRNM_CD == null) { IIM_TRNM_CD = ""; }
	if(IIM_TXRAY_YN == null) { IIM_TXRAY_YN = ""; }
	if(IIM_TBIO_YN == null) { IIM_TBIO_YN = ""; }
	if(IIM_TSND_YN == null) { IIM_TSND_YN = ""; }
	if(IIM_TETC_YN == null) { IIM_TETC_YN = ""; }
	if(IIM_THPR_YN == null) { IIM_THPR_YN = ""; }
	if(IIM_THPR1_CD == null) { IIM_THPR1_CD = ""; }
	if(IIM_THPR2_CD == null) { IIM_THPR2_CD = ""; }
	if(IIM_TEDT_YR == null) { IIM_TEDT_YR = ""; }
	if(IIM_MIN_VL == null) { IIM_MIN_VL = ""; }
	if(IIM_MAX_VL == null) { IIM_MAX_VL = ""; }
	if(IIM_DFLT_VL == null) { IIM_DFLT_VL = ""; }
	if(IIM_SANBO_KD == null) { IIM_SANBO_KD = ""; }
	if(IIM_SANBO_CD == null) { IIM_SANBO_CD = ""; }
	if(IIM_SANBO_CAL == null) { IIM_SANBO_CAL = ""; }
	if(IIM_USE_YN == null) { IIM_USE_YN = ""; }
	if(IIM_INPT_ID == null) { IIM_INPT_ID = ""; }
	if(IIM_MODI_ID == null) { IIM_MODI_ID = ""; }
	if(IIM_ETONME_NM == null) { IIM_ETONME_NM = ""; }

	// DB객체
	stmtExec = connect.createStatement();

	sql = func_uItem_Apply_ufSave_001(stmtExec, htMethod);

	//
	G_INFO += "<!-- \n";
	G_INFO += "서비스명 : uItem_Apply_ufSave_001 \n";
	G_INFO += "설명 : 검사항목 저장(inset,update) \n";
	G_INFO += "\n\n";

	G_INFO += "전달인자 : \n";
	G_INFO += " SMODE : " + SMODE + " \n";
	G_INFO += " IIM_ITEM_CD : " + IIM_ITEM_CD + " \n";
	G_INFO += " IIM_NITEM_CD : " + IIM_NITEM_CD + " \n";
	G_INFO += " IIM_KNME_NM : " + IIM_KNME_NM + " \n";
	G_INFO += " IIM_ENME_NM : " + IIM_ENME_NM + " \n";
	G_INFO += " IIM_CNME_NM : " + IIM_CNME_NM + " \n";
	G_INFO += " IIM_RNME_NM : " + IIM_RNME_NM + " \n";
	G_INFO += " IIM_JNME_NM : " + IIM_JNME_NM + " \n";
	G_INFO += " IIM_SNME_NM : " + IIM_SNME_NM + " \n";
	G_INFO += " IIM_OSCD_CD : " + IIM_OSCD_CD + " \n";
	G_INFO += " IIM_GBCD_CD : " + IIM_GBCD_CD + " \n";
	G_INFO += " IIM_SBCD_CD : " + IIM_SBCD_CD + " \n";
	G_INFO += " IIM_EXGN_CD : " + IIM_EXGN_CD + " \n";
	G_INFO += " IIM_RSLT_KD : " + IIM_RSLT_KD + " \n";
	G_INFO += " IIM_SORT_SQ : " + IIM_SORT_SQ + " \n";
	G_INFO += " IIM_BLPT_CD : " + IIM_BLPT_CD + " \n";
	G_INFO += " IIM_REJH_EX : " + IIM_REJH_EX + " \n";
	G_INFO += " IIM_OSSB_CD : " + IIM_OSSB_CD + " \n";
	G_INFO += " IIM_OSRL_CD : " + IIM_OSRL_CD + " \n";
	G_INFO += " IIM_ACAL_YN : " + IIM_ACAL_YN + " \n";
	G_INFO += " IIM_SAMP_CD : " + IIM_SAMP_CD + " \n";
	G_INFO += " IIM_CANCER_CD : " + IIM_CANCER_CD + " \n";
	G_INFO += " IIM_CNIT_CD : " + IIM_CNIT_CD + " \n";
	G_INFO += " IIM_SUTK_YN : " + IIM_SUTK_YN + " \n";
	G_INFO += " IIM_SUTK_CD : " + IIM_SUTK_CD + " \n";
	G_INFO += " IIM_PNUM_CD : " + IIM_PNUM_CD + " \n";
	G_INFO += " IIM_TUSE_YN : " + IIM_TUSE_YN + " \n";
	G_INFO += " IIM_TPRT_CD : " + IIM_TPRT_CD + " \n";
	G_INFO += " IIM_TRTP_CD : " + IIM_TRTP_CD + " \n";
	G_INFO += " IIM_TRLT_CD : " + IIM_TRLT_CD + " \n";
	G_INFO += " IIM_TRNM_CD : " + IIM_TRNM_CD + " \n";
	G_INFO += " IIM_TXRAY_YN : " + IIM_TXRAY_YN + " \n";
	G_INFO += " IIM_TBIO_YN : " + IIM_TBIO_YN + " \n";
	G_INFO += " IIM_TSND_YN : " + IIM_TSND_YN + " \n";
	G_INFO += " IIM_TETC_YN : " + IIM_TETC_YN + " \n";
	G_INFO += " IIM_THPR_YN : " + IIM_THPR_YN + " \n";
	G_INFO += " IIM_THPR1_CD : " + IIM_THPR1_CD + " \n";
	G_INFO += " IIM_THPR2_CD : " + IIM_THPR2_CD + " \n";
	G_INFO += " IIM_TEDT_YR : " + IIM_TEDT_YR + " \n";
	G_INFO += " IIM_MIN_VL : " + IIM_MIN_VL + " \n";
	G_INFO += " IIM_MAX_VL : " + IIM_MAX_VL + " \n";
	G_INFO += " IIM_DFLT_VL : " + IIM_DFLT_VL + " \n";
	G_INFO += " IIM_SANBO_KD : " + IIM_SANBO_KD + " \n";
	G_INFO += " IIM_SANBO_CD : " + IIM_SANBO_CD + " \n";
	G_INFO += " IIM_SANBO_CAL : " + IIM_SANBO_CAL + " \n";
	G_INFO += " IIM_USE_YN : " + IIM_USE_YN + " \n";
	G_INFO += " IIM_MODI_ID : " + IIM_MODI_ID + " \n";
	G_INFO += " IIM_INPT_ID : " + IIM_INPT_ID + " \n";
	G_INFO += " IIM_ETONME_NM : " + IIM_ETONME_NM + " \n";
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
