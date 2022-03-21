<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uLife_Panj_upSavePtSedPanjung_002.jsp"%>
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

		String SSAVEMODE = htMethod.get("SSAVEMODE");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String CESD = htMethod.get("CESD");
		String SCORE_CESD = htMethod.get("SCORE_CESD");
		String CESD_INFO_YN = htMethod.get("CESD_INFO_YN");
		String GDS = htMethod.get("GDS");
		String SCORE_GDS = htMethod.get("SCORE_GDS");
		String KDSQC = htMethod.get("KDSQC");
		String SCORE_SQC = htMethod.get("SCORE_SQC");
		String FIR_VIEW = htMethod.get("FIR_VIEW");
		String RVIEW = htMethod.get("RVIEW");
		String BVIEW = htMethod.get("BVIEW");
		String EVALU_SM = htMethod.get("EVALU_SM");
		String NICO_SM = htMethod.get("NICO_SM");
		String PRSCR_SM = htMethod.get("PRSCR_SM");
		String PRSCR_SM_YN = htMethod.get("PRSCR_SM_YN");
		String SCORE_SM = htMethod.get("SCORE_SM");
		String EVALU_DRN = htMethod.get("EVALU_DRN");
		String PRSCR_DRN = htMethod.get("PRSCR_DRN");
		String PRSCR_DRN_YN = htMethod.get("PRSCR_DRN_YN");
		String SCORE_DRN = htMethod.get("SCORE_DRN");
		String EVALU_SPT = htMethod.get("EVALU_SPT");
		String PRSCR_SPT = htMethod.get("PRSCR_SPT");
		String PRSCR_SPT_TX = htMethod.get("PRSCR_SPT_TX");
		String PRSTM_SPT = htMethod.get("PRSTM_SPT");
		String PRSTM_SPT_TX = htMethod.get("PRSTM_SPT_TX");
		String PRSNUM_SPT = htMethod.get("PRSNUM_SPT");
		String PRSCR_SPT_YN = htMethod.get("PRSCR_SPT_YN");
		String SCORE_SPT = htMethod.get("SCORE_SPT");
		String EVALU_NUT = htMethod.get("EVALU_NUT");
		String RECOMDAI_NUT = htMethod.get("RECOMDAI_NUT");
		String RECOMPRO_NUT = htMethod.get("RECOMPRO_NUT");
		String RECOMVEG_NUT = htMethod.get("RECOMVEG_NUT");
		String RESTFAT_NUT = htMethod.get("RESTFAT_NUT");
		String RESTSGA_NUT = htMethod.get("RESTSGA_NUT");
		String RESTSALT_NUT = htMethod.get("RESTSALT_NUT");
		String BFAST_NUT = htMethod.get("BFAST_NUT");
		String ALLFOOD_NUT = htMethod.get("ALLFOOD_NUT");
		String PRSCR_NUT = htMethod.get("PRSCR_NUT");
		String PRSCR_NUT_YN = htMethod.get("PRSCR_NUT_YN");
		String SCORE_NUT = htMethod.get("SCORE_NUT");
		String BMI_PYC = htMethod.get("BMI_PYC");
		String WAIST_PYC = htMethod.get("WAIST_PYC");
		String REPAST_PYC = htMethod.get("REPAST_PYC");
		String SNACK_PYC = htMethod.get("SNACK_PYC");
		String DRINK_PYC = htMethod.get("DRINK_PYC");
		String FASTFD_PYC = htMethod.get("FASTFD_PYC");
		String SPORT_PYC = htMethod.get("SPORT_PYC");
		String CRINIC_PYC = htMethod.get("CRINIC_PYC");
		String ETC_PYC = htMethod.get("ETC_PYC");
		String ETC_PYC_TX = htMethod.get("ETC_PYC_TX");
		String PRSCR_PYC_YN = htMethod.get("PRSCR_PYC_YN");
		String METH_GLO = htMethod.get("METH_GLO");
		String RVAL_GLO = htMethod.get("RVAL_GLO");
		String RESULT_GLO = htMethod.get("RESULT_GLO");
		String HIBLOOD_VAL = htMethod.get("HIBLOOD_VAL");
		String LIBLOOD_VAL = htMethod.get("LIBLOOD_VAL");
		String RESULT_HIBL = htMethod.get("RESULT_HIBL");
		String RESULT_DATE = htMethod.get("RESULT_DATE");
		String TRANC_DATE = htMethod.get("TRANC_DATE");
		String DOCTORSED = htMethod.get("DOCTORSED");
		String LIFE_YN = htMethod.get("LIFE_YN");
		String FIX_YN = htMethod.get("FIX_YN");
		String USER_ID = htMethod.get("USER_ID");

		//
		if(SSAVEMODE == null) { SSAVEMODE = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CESD == null) { CESD = ""; }
		if(SCORE_CESD == null) { SCORE_CESD = ""; }
		if(CESD_INFO_YN == null) { CESD_INFO_YN = ""; }
		if(GDS == null) { GDS = ""; }
		if(SCORE_GDS == null) { SCORE_GDS = ""; }
		if(KDSQC == null) { KDSQC = ""; }
		if(SCORE_SQC == null) { SCORE_SQC = ""; }
		if(FIR_VIEW == null) { FIR_VIEW = ""; }
		if(RVIEW == null) { RVIEW = ""; }
		if(BVIEW == null) { BVIEW = ""; }
		if(EVALU_SM == null) { EVALU_SM = ""; }
		if(NICO_SM == null) { NICO_SM = ""; }
		if(PRSCR_SM == null) { PRSCR_SM = ""; }
		if(PRSCR_SM_YN == null) { PRSCR_SM_YN = ""; }
		if(SCORE_SM == null) { SCORE_SM = ""; }
		if(EVALU_DRN == null) { EVALU_DRN = ""; }
		if(PRSCR_DRN == null) { PRSCR_DRN = ""; }
		if(PRSCR_DRN_YN == null) { PRSCR_DRN_YN = ""; }
		if(SCORE_DRN == null) { SCORE_DRN = ""; }
		if(EVALU_SPT == null) { EVALU_SPT = ""; }
		if(PRSCR_SPT == null) { PRSCR_SPT = ""; }
		if(PRSCR_SPT_TX == null) { PRSCR_SPT_TX = ""; }
		if(PRSTM_SPT == null) { PRSTM_SPT = ""; }
		if(PRSTM_SPT_TX == null) { PRSTM_SPT_TX = ""; }
		if(PRSNUM_SPT == null) { PRSNUM_SPT = ""; }
		if(PRSCR_SPT_YN == null) { PRSCR_SPT_YN = ""; }
		if(SCORE_SPT == null) { SCORE_SPT = ""; }
		if(EVALU_NUT == null) { EVALU_NUT = ""; }
		if(RECOMDAI_NUT == null) { RECOMDAI_NUT = ""; }
		if(RECOMPRO_NUT == null) { RECOMPRO_NUT = ""; }
		if(RECOMVEG_NUT == null) { RECOMVEG_NUT = ""; }
		if(RESTFAT_NUT == null) { RESTFAT_NUT = ""; }
		if(RESTSGA_NUT == null) { RESTSGA_NUT = ""; }
		if(RESTSALT_NUT == null) { RESTSALT_NUT = ""; }
		if(BFAST_NUT == null) { BFAST_NUT = ""; }
		if(ALLFOOD_NUT == null) { ALLFOOD_NUT = ""; }
		if(PRSCR_NUT == null) { PRSCR_NUT = ""; }
		if(PRSCR_NUT_YN == null) { PRSCR_NUT_YN = ""; }
		if(SCORE_NUT == null) { SCORE_NUT = ""; }
		if(BMI_PYC == null) { BMI_PYC = ""; }
		if(WAIST_PYC == null) { WAIST_PYC = ""; }
		if(REPAST_PYC == null) { REPAST_PYC = ""; }
		if(SNACK_PYC == null) { SNACK_PYC = ""; }
		if(DRINK_PYC == null) { DRINK_PYC = ""; }
		if(FASTFD_PYC == null) { FASTFD_PYC = ""; }
		if(SPORT_PYC == null) { SPORT_PYC = ""; }
		if(CRINIC_PYC == null) { CRINIC_PYC = ""; }
		if(ETC_PYC == null) { ETC_PYC = ""; }
		if(ETC_PYC_TX == null) { ETC_PYC_TX = ""; }
		if(PRSCR_PYC_YN == null) { PRSCR_PYC_YN = ""; }
		if(METH_GLO == null) { METH_GLO = ""; }
		if(RVAL_GLO == null) { RVAL_GLO = ""; }
		if(RESULT_GLO == null) { RESULT_GLO = ""; }
		if(HIBLOOD_VAL == null) { HIBLOOD_VAL = ""; }
		if(LIBLOOD_VAL == null) { LIBLOOD_VAL = ""; }
		if(RESULT_HIBL == null) { RESULT_HIBL = ""; }
		if(RESULT_DATE == null) { RESULT_DATE = ""; }
		if(TRANC_DATE == null) { TRANC_DATE = ""; }
		if(DOCTORSED == null) { DOCTORSED = ""; }
		if(LIFE_YN == null) { LIFE_YN = ""; }
		if(FIX_YN == null) { FIX_YN = ""; }
		if(USER_ID == null) { USER_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uLife_Panj_upSavePtSedPanjung_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uLife_Panj_upSavePtSedPanjung_002 \n";
			G_INFO += "설명 : 생활습관판정 저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSAVEMODE : " + SSAVEMODE + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " CESD : " + CESD + " \n";
			G_INFO += " SCORE_CESD : " + SCORE_CESD + " \n";
			G_INFO += " CESD_INFO_YN : " + CESD_INFO_YN + " \n";
			G_INFO += " GDS : " + GDS + " \n";
			G_INFO += " SCORE_GDS : " + SCORE_GDS + " \n";
			G_INFO += " KDSQC : " + KDSQC + " \n";
			G_INFO += " SCORE_SQC : " + SCORE_SQC + " \n";
			G_INFO += " FIR_VIEW : " + FIR_VIEW + " \n";
			G_INFO += " RVIEW : " + RVIEW + " \n";
			G_INFO += " BVIEW : " + BVIEW + " \n";
			G_INFO += " EVALU_SM : " + EVALU_SM + " \n";
			G_INFO += " NICO_SM : " + NICO_SM + " \n";
			G_INFO += " PRSCR_SM : " + PRSCR_SM + " \n";
			G_INFO += " PRSCR_SM_YN : " + PRSCR_SM_YN + " \n";
			G_INFO += " SCORE_SM : " + SCORE_SM + " \n";
			G_INFO += " EVALU_DRN : " + EVALU_DRN + " \n";
			G_INFO += " PRSCR_DRN : " + PRSCR_DRN + " \n";
			G_INFO += " PRSCR_DRN_YN : " + PRSCR_DRN_YN + " \n";
			G_INFO += " SCORE_DRN : " + SCORE_DRN + " \n";
			G_INFO += " EVALU_SPT : " + EVALU_SPT + " \n";
			G_INFO += " PRSCR_SPT : " + PRSCR_SPT + " \n";
			G_INFO += " PRSCR_SPT_TX : " + PRSCR_SPT_TX + " \n";
			G_INFO += " PRSTM_SPT : " + PRSTM_SPT + " \n";
			G_INFO += " PRSTM_SPT_TX : " + PRSTM_SPT_TX + " \n";
			G_INFO += " PRSNUM_SPT : " + PRSNUM_SPT + " \n";
			G_INFO += " PRSCR_SPT_YN : " + PRSCR_SPT_YN + " \n";
			G_INFO += " SCORE_SPT : " + SCORE_SPT + " \n";
			G_INFO += " EVALU_NUT : " + EVALU_NUT + " \n";
			G_INFO += " RECOMDAI_NUT : " + RECOMDAI_NUT + " \n";
			G_INFO += " RECOMPRO_NUT : " + RECOMPRO_NUT + " \n";
			G_INFO += " RECOMVEG_NUT : " + RECOMVEG_NUT + " \n";
			G_INFO += " RESTFAT_NUT : " + RESTFAT_NUT + " \n";
			G_INFO += " RESTSGA_NUT : " + RESTSGA_NUT + " \n";
			G_INFO += " RESTSALT_NUT : " + RESTSALT_NUT + " \n";
			G_INFO += " BFAST_NUT : " + BFAST_NUT + " \n";
			G_INFO += " ALLFOOD_NUT : " + ALLFOOD_NUT + " \n";
			G_INFO += " PRSCR_NUT : " + PRSCR_NUT + " \n";
			G_INFO += " PRSCR_NUT_YN : " + PRSCR_NUT_YN + " \n";
			G_INFO += " SCORE_NUT : " + SCORE_NUT + " \n";
			G_INFO += " BMI_PYC : " + BMI_PYC + " \n";
			G_INFO += " WAIST_PYC : " + WAIST_PYC + " \n";
			G_INFO += " REPAST_PYC : " + REPAST_PYC + " \n";
			G_INFO += " SNACK_PYC : " + SNACK_PYC + " \n";
			G_INFO += " DRINK_PYC : " + DRINK_PYC + " \n";
			G_INFO += " FASTFD_PYC : " + FASTFD_PYC + " \n";
			G_INFO += " SPORT_PYC : " + SPORT_PYC + " \n";
			G_INFO += " CRINIC_PYC : " + CRINIC_PYC + " \n";
			G_INFO += " ETC_PYC : " + ETC_PYC + " \n";
			G_INFO += " ETC_PYC_TX : " + ETC_PYC_TX + " \n";
			G_INFO += " PRSCR_PYC_YN : " + PRSCR_PYC_YN + " \n";
			G_INFO += " METH_GLO : " + METH_GLO + " \n";
			G_INFO += " RVAL_GLO : " + RVAL_GLO + " \n";
			G_INFO += " RESULT_GLO : " + RESULT_GLO + " \n";
			G_INFO += " HIBLOOD_VAL : " + HIBLOOD_VAL + " \n";
			G_INFO += " LIBLOOD_VAL : " + LIBLOOD_VAL + " \n";
			G_INFO += " RESULT_HIBL : " + RESULT_HIBL + " \n";
			G_INFO += " RESULT_DATE : " + RESULT_DATE + " \n";
			G_INFO += " TRANC_DATE : " + TRANC_DATE + " \n";
			G_INFO += " DOCTORSED : " + DOCTORSED + " \n";
			G_INFO += " LIFE_YN : " + LIFE_YN + " \n";
			G_INFO += " FIX_YN : " + FIX_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
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
