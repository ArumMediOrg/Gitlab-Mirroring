<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCOMP_CNRT_PROF_APPLY_UP_Save_001.jsp"%>
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
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String CNRT_SQ = htMethod.get("CNRT_SQ");
		String PROF_SQ = htMethod.get("PROF_SQ");
		String SORT_SQ = htMethod.get("SORT_SQ");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String PROF_NM = htMethod.get("PROF_NM");
		String PROF_TL = htMethod.get("PROF_TL");
		String SEX_CD = htMethod.get("SEX_CD");
		String ITEM_LT = htMethod.get("ITEM_LT");
		String CALC_CD = htMethod.get("CALC_CD");
		String ITKD_CD = htMethod.get("ITKD_CD");
		String CNRT_PR = htMethod.get("CNRT_PR");
		String BIND_PR = htMethod.get("BIND_PR");
		String OPTN_PR = htMethod.get("OPTN_PR");
		String CALC_PR = htMethod.get("CALC_PR");
		String CALC_RT = htMethod.get("CALC_RT");
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
		String SPRT_PR = htMethod.get("SPRT_PR");
		String COMP_PR = htMethod.get("COMP_PR");
		String PERS_PR = htMethod.get("PERS_PR");
		String CMPY_CD = htMethod.get("CMPY_CD");
		String PRPY_CD = htMethod.get("PRPY_CD");
		String OPTN_YN = htMethod.get("OPTN_YN");
		String OPTN_CNT = htMethod.get("OPTN_CNT");
		String PROF_TX = htMethod.get("PROF_TX");
		String USE_YN = htMethod.get("USE_YN");
		String USER_ID = htMethod.get("USER_ID");
		String PROF_ENM = htMethod.get("PROF_ENM");

		//
		if(SMODE == null) { SMODE = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }
		if(SORT_SQ == null) { SORT_SQ = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(PROF_NM == null) { PROF_NM = ""; }
		if(PROF_TL == null) { PROF_TL = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(ITEM_LT == null) { ITEM_LT = ""; }
		if(CALC_CD == null) { CALC_CD = ""; }
		if(ITKD_CD == null) { ITKD_CD = ""; }
		if(CNRT_PR == null) { CNRT_PR = ""; }
		if(BIND_PR == null) { BIND_PR = ""; }
		if(OPTN_PR == null) { OPTN_PR = ""; }
		if(CALC_PR == null) { CALC_PR = ""; }
		if(CALC_RT == null) { CALC_RT = ""; }
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
		if(SPRT_PR == null) { SPRT_PR = ""; }
		if(COMP_PR == null) { COMP_PR = ""; }
		if(PERS_PR == null) { PERS_PR = ""; }
		if(CMPY_CD == null) { CMPY_CD = ""; }
		if(PRPY_CD == null) { PRPY_CD = ""; }
		if(OPTN_YN == null) { OPTN_YN = ""; }
		if(OPTN_CNT == null) { OPTN_CNT = ""; }
		if(PROF_TX == null) { PROF_TX = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(PROF_ENM == null) { PROF_ENM = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCOMP_CNRT_PROF_APPLY_UP_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_PROF_APPLY_UP_Save_001 \n";
			G_INFO += "설명 : 사업장 검진유형 저장(검진유형 inset,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
			G_INFO += " SORT_SQ : " + SORT_SQ + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " PROF_NM : " + PROF_NM + " \n";
			G_INFO += " PROF_TL : " + PROF_TL + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " ITEM_LT : " + ITEM_LT + " \n";
			G_INFO += " CALC_CD : " + CALC_CD + " \n";
			G_INFO += " ITKD_CD : " + ITKD_CD + " \n";
			G_INFO += " CNRT_PR : " + CNRT_PR + " \n";
			G_INFO += " BIND_PR : " + BIND_PR + " \n";
			G_INFO += " OPTN_PR : " + OPTN_PR + " \n";
			G_INFO += " CALC_PR : " + CALC_PR + " \n";
			G_INFO += " CALC_RT : " + CALC_RT + " \n";
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
			G_INFO += " SPRT_PR : " + SPRT_PR + " \n";
			G_INFO += " COMP_PR : " + COMP_PR + " \n";
			G_INFO += " PERS_PR : " + PERS_PR + " \n";
			G_INFO += " CMPY_CD : " + CMPY_CD + " \n";
			G_INFO += " PRPY_CD : " + PRPY_CD + " \n";
			G_INFO += " OPTN_YN : " + OPTN_YN + " \n";
			G_INFO += " OPTN_CNT : " + OPTN_CNT + " \n";
			G_INFO += " PROF_TX : " + PROF_TX + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " PROF_ENM : " + PROF_ENM + " \n";
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
