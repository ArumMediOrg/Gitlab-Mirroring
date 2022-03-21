<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uBT_ESTI_PROF_APPLY_UP_Save_002.jsp"%>
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

		String CHKBOXBEP_USE_YN = htMethod.get("CHKBOXBEP_USE_YN");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String PROF_NM = htMethod.get("PROF_NM");
		String PROF_TL = htMethod.get("PROF_TL");
		String SEX_CD = htMethod.get("SEX_CD");
		String HTSB_YN = htMethod.get("HTSB_YN");
		String SPSB_YN = htMethod.get("SPSB_YN");
		String CVSB_YN = htMethod.get("CVSB_YN");
		String ETSB_YN = htMethod.get("ETSB_YN");
		String EMSB_YN = htMethod.get("EMSB_YN");
		String HTPR_CD = htMethod.get("HTPR_CD");
		String SPPR_CD = htMethod.get("SPPR_CD");
		String CVPR_CD = htMethod.get("CVPR_CD");
		String ETPR_CD = htMethod.get("ETPR_CD");
		String EMPR_CD = htMethod.get("EMPR_CD");
		String CNCL_CD = htMethod.get("CNCL_CD");
		String PYER_CD = htMethod.get("PYER_CD");
		String COMP_PR = htMethod.get("COMP_PR");
		String PERS_PR = htMethod.get("PERS_PR");
		String CMPY_CD = htMethod.get("CMPY_CD");
		String PRPY_CD = htMethod.get("PRPY_CD");
		String OPTN_YN = htMethod.get("OPTN_YN");
		String OPTN_CNT = htMethod.get("OPTN_CNT");
		String TOTL_PR = htMethod.get("TOTL_PR");
		String PROF_PR = htMethod.get("PROF_PR");
		String BIND_PR = htMethod.get("BIND_PR");
		String OPTN_PR = htMethod.get("OPTN_PR");
		String PROF_RT = htMethod.get("PROF_RT");
		String CUST_CNT = htMethod.get("CUST_CNT");
		String SALE_PR = htMethod.get("SALE_PR");
		String PROF_TX = htMethod.get("PROF_TX");
		String MODI_ID = htMethod.get("MODI_ID");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String ESTI_CD = htMethod.get("ESTI_CD");
		String PROF_SQ = htMethod.get("PROF_SQ");
		String NUSE_ID = htMethod.get("NUSE_ID");

		//
		if(CHKBOXBEP_USE_YN == null) { CHKBOXBEP_USE_YN = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(PROF_NM == null) { PROF_NM = ""; }
		if(PROF_TL == null) { PROF_TL = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(HTSB_YN == null) { HTSB_YN = ""; }
		if(SPSB_YN == null) { SPSB_YN = ""; }
		if(CVSB_YN == null) { CVSB_YN = ""; }
		if(ETSB_YN == null) { ETSB_YN = ""; }
		if(EMSB_YN == null) { EMSB_YN = ""; }
		if(HTPR_CD == null) { HTPR_CD = ""; }
		if(SPPR_CD == null) { SPPR_CD = ""; }
		if(CVPR_CD == null) { CVPR_CD = ""; }
		if(ETPR_CD == null) { ETPR_CD = ""; }
		if(EMPR_CD == null) { EMPR_CD = ""; }
		if(CNCL_CD == null) { CNCL_CD = ""; }
		if(PYER_CD == null) { PYER_CD = ""; }
		if(COMP_PR == null) { COMP_PR = ""; }
		if(PERS_PR == null) { PERS_PR = ""; }
		if(CMPY_CD == null) { CMPY_CD = ""; }
		if(PRPY_CD == null) { PRPY_CD = ""; }
		if(OPTN_YN == null) { OPTN_YN = ""; }
		if(OPTN_CNT == null) { OPTN_CNT = ""; }
		if(TOTL_PR == null) { TOTL_PR = ""; }
		if(PROF_PR == null) { PROF_PR = ""; }
		if(BIND_PR == null) { BIND_PR = ""; }
		if(OPTN_PR == null) { OPTN_PR = ""; }
		if(PROF_RT == null) { PROF_RT = ""; }
		if(CUST_CNT == null) { CUST_CNT = ""; }
		if(SALE_PR == null) { SALE_PR = ""; }
		if(PROF_TX == null) { PROF_TX = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ESTI_CD == null) { ESTI_CD = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uBT_ESTI_PROF_APPLY_UP_Save_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTI_PROF_APPLY_UP_Save_002 \n";
			G_INFO += "설명 : 검진유형 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHKBOXBEP_USE_YN : " + CHKBOXBEP_USE_YN + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " PROF_NM : " + PROF_NM + " \n";
			G_INFO += " PROF_TL : " + PROF_TL + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " HTSB_YN : " + HTSB_YN + " \n";
			G_INFO += " SPSB_YN : " + SPSB_YN + " \n";
			G_INFO += " CVSB_YN : " + CVSB_YN + " \n";
			G_INFO += " ETSB_YN : " + ETSB_YN + " \n";
			G_INFO += " EMSB_YN : " + EMSB_YN + " \n";
			G_INFO += " HTPR_CD : " + HTPR_CD + " \n";
			G_INFO += " SPPR_CD : " + SPPR_CD + " \n";
			G_INFO += " CVPR_CD : " + CVPR_CD + " \n";
			G_INFO += " ETPR_CD : " + ETPR_CD + " \n";
			G_INFO += " EMPR_CD : " + EMPR_CD + " \n";
			G_INFO += " CNCL_CD : " + CNCL_CD + " \n";
			G_INFO += " PYER_CD : " + PYER_CD + " \n";
			G_INFO += " COMP_PR : " + COMP_PR + " \n";
			G_INFO += " PERS_PR : " + PERS_PR + " \n";
			G_INFO += " CMPY_CD : " + CMPY_CD + " \n";
			G_INFO += " PRPY_CD : " + PRPY_CD + " \n";
			G_INFO += " OPTN_YN : " + OPTN_YN + " \n";
			G_INFO += " OPTN_CNT : " + OPTN_CNT + " \n";
			G_INFO += " TOTL_PR : " + TOTL_PR + " \n";
			G_INFO += " PROF_PR : " + PROF_PR + " \n";
			G_INFO += " BIND_PR : " + BIND_PR + " \n";
			G_INFO += " OPTN_PR : " + OPTN_PR + " \n";
			G_INFO += " PROF_RT : " + PROF_RT + " \n";
			G_INFO += " CUST_CNT : " + CUST_CNT + " \n";
			G_INFO += " SALE_PR : " + SALE_PR + " \n";
			G_INFO += " PROF_TX : " + PROF_TX + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ESTI_CD : " + ESTI_CD + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
			G_INFO += " NUSE_ID : " + NUSE_ID + " \n";
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
