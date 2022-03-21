<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCOMPANY_APPLY_UF_Save_001.jsp"%>
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
		String APLY_DT = htMethod.get("APLY_DT");
		String COMP_NO = htMethod.get("COMP_NO");
		String COMP_SQ = htMethod.get("COMP_SQ");
		String COKD_CD = htMethod.get("COKD_CD");
		String COMP_NM = htMethod.get("COMP_NM");
		String INDO_NO = htMethod.get("INDO_NO");
		String INDD_NO = htMethod.get("INDD_NO");
		String INDD_SQ = htMethod.get("INDD_SQ");
		String CORE_NO = htMethod.get("CORE_NO");
		String COTK_CD = htMethod.get("COTK_CD");
		String SUTK_YN = htMethod.get("SUTK_YN");
		String DEPT_CD = htMethod.get("DEPT_CD");
		String TKGJ_CD = htMethod.get("TKGJ_CD");
		String TKJJ_CD = htMethod.get("TKJJ_CD");
		String PRES_NM = htMethod.get("PRES_NM");
		String LABO_CD = htMethod.get("LABO_CD");
		String JIDO_CD = htMethod.get("JIDO_CD");
		String ZIPKD_CD = htMethod.get("ZIPKD_CD");
		String ZIP_CD = htMethod.get("ZIP_CD");
		String ZIP_SQ = htMethod.get("ZIP_SQ");
		String ZIP_AR = htMethod.get("ZIP_AR");
		String ROAD_AR = htMethod.get("ROAD_AR");
		String BLDG_NO = htMethod.get("BLDG_NO");
		String TEL_NO = htMethod.get("TEL_NO");
		String FAX_NO = htMethod.get("FAX_NO");
		String JMOB_NO = htMethod.get("JMOB_NO");
		String JEMAIL = htMethod.get("JEMAIL");
		String JTEL_NO = htMethod.get("JTEL_NO");
		String J_NM = htMethod.get("J_NM");
		String TMOB_NO = htMethod.get("TMOB_NO");
		String TEMAIL = htMethod.get("TEMAIL");
		String TTEL_NO = htMethod.get("TTEL_NO");
		String T_NM = htMethod.get("T_NM");
		String CBIR_DT = htMethod.get("CBIR_DT");
		String LUNR_KD = htMethod.get("LUNR_KD");
		String SALE_ID = htMethod.get("SALE_ID");
		String SSUB_ID = htMethod.get("SSUB_ID");
		String PYER_CD = htMethod.get("PYER_CD");
		String SPRT_PR = htMethod.get("SPRT_PR");
		String CMPY_CD = htMethod.get("CMPY_CD");
		String PRPY_CD = htMethod.get("PRPY_CD");
		String TKCG_CD = htMethod.get("TKCG_CD");
		String TKDE_CD = htMethod.get("TKDE_CD");
		String TBAS_CD = htMethod.get("TBAS_CD");
		String DISC_RT = htMethod.get("DISC_RT");
		String CLAS_CD = htMethod.get("CLAS_CD");
		String FAMI_CD = htMethod.get("FAMI_CD");
		String COMP_TX = htMethod.get("COMP_TX");
		String PAST_CD = htMethod.get("PAST_CD");
		String OCS_CD = htMethod.get("OCS_CD");
		String STRT_YR = htMethod.get("STRT_YR");
		String PROD_NM = htMethod.get("PROD_NM");
		String SMPL_YN = htMethod.get("SMPL_YN");
		String USE_YN = htMethod.get("USE_YN");
		String NUSER_ID = htMethod.get("NUSER_ID");
		String NUSE_TX = htMethod.get("NUSE_TX");
		String USER_ID = htMethod.get("USER_ID");
		String TKGJ_YR = htMethod.get("TKGJ_YR");
		String SLNS_DELAY = htMethod.get("SLNS_DELAY");
		String PRNT_ZIP_CD = htMethod.get("PRNT_ZIP_CD");
		String PRNT_ZIP_AR = htMethod.get("PRNT_ZIP_AR");
		String PRNT_ROAD_AR = htMethod.get("PRNT_ROAD_AR");

		//
		if(SMODE == null) { SMODE = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(APLY_DT == null) { APLY_DT = ""; }
		if(COMP_NO == null) { COMP_NO = ""; }
		if(COMP_SQ == null) { COMP_SQ = ""; }
		if(COKD_CD == null) { COKD_CD = ""; }
		if(COMP_NM == null) { COMP_NM = ""; }
		if(INDO_NO == null) { INDO_NO = ""; }
		if(INDD_NO == null) { INDD_NO = ""; }
		if(INDD_SQ == null) { INDD_SQ = ""; }
		if(CORE_NO == null) { CORE_NO = ""; }
		if(COTK_CD == null) { COTK_CD = ""; }
		if(SUTK_YN == null) { SUTK_YN = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }
		if(TKGJ_CD == null) { TKGJ_CD = ""; }
		if(TKJJ_CD == null) { TKJJ_CD = ""; }
		if(PRES_NM == null) { PRES_NM = ""; }
		if(LABO_CD == null) { LABO_CD = ""; }
		if(JIDO_CD == null) { JIDO_CD = ""; }
		if(ZIPKD_CD == null) { ZIPKD_CD = ""; }
		if(ZIP_CD == null) { ZIP_CD = ""; }
		if(ZIP_SQ == null) { ZIP_SQ = ""; }
		if(ZIP_AR == null) { ZIP_AR = ""; }
		if(ROAD_AR == null) { ROAD_AR = ""; }
		if(BLDG_NO == null) { BLDG_NO = ""; }
		if(TEL_NO == null) { TEL_NO = ""; }
		if(FAX_NO == null) { FAX_NO = ""; }
		if(JMOB_NO == null) { JMOB_NO = ""; }
		if(JEMAIL == null) { JEMAIL = ""; }
		if(JTEL_NO == null) { JTEL_NO = ""; }
		if(J_NM == null) { J_NM = ""; }
		if(TMOB_NO == null) { TMOB_NO = ""; }
		if(TEMAIL == null) { TEMAIL = ""; }
		if(TTEL_NO == null) { TTEL_NO = ""; }
		if(T_NM == null) { T_NM = ""; }
		if(CBIR_DT == null) { CBIR_DT = ""; }
		if(LUNR_KD == null) { LUNR_KD = ""; }
		if(SALE_ID == null) { SALE_ID = ""; }
		if(SSUB_ID == null) { SSUB_ID = ""; }
		if(PYER_CD == null) { PYER_CD = ""; }
		if(SPRT_PR == null) { SPRT_PR = ""; }
		if(CMPY_CD == null) { CMPY_CD = ""; }
		if(PRPY_CD == null) { PRPY_CD = ""; }
		if(TKCG_CD == null) { TKCG_CD = ""; }
		if(TKDE_CD == null) { TKDE_CD = ""; }
		if(TBAS_CD == null) { TBAS_CD = ""; }
		if(DISC_RT == null) { DISC_RT = ""; }
		if(CLAS_CD == null) { CLAS_CD = ""; }
		if(FAMI_CD == null) { FAMI_CD = ""; }
		if(COMP_TX == null) { COMP_TX = ""; }
		if(PAST_CD == null) { PAST_CD = ""; }
		if(OCS_CD == null) { OCS_CD = ""; }
		if(STRT_YR == null) { STRT_YR = ""; }
		if(PROD_NM == null) { PROD_NM = ""; }
		if(SMPL_YN == null) { SMPL_YN = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(NUSER_ID == null) { NUSER_ID = ""; }
		if(NUSE_TX == null) { NUSE_TX = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(TKGJ_YR == null) { TKGJ_YR = ""; }
		if(SLNS_DELAY == null) { SLNS_DELAY = ""; }
		if(PRNT_ZIP_CD == null) { PRNT_ZIP_CD = ""; }
		if(PRNT_ZIP_AR == null) { PRNT_ZIP_AR = ""; }
		if(PRNT_ROAD_AR == null) { PRNT_ROAD_AR = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCOMPANY_APPLY_UF_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMPANY_APPLY_UF_Save_001 \n";
			G_INFO += "설명 : 사업장정보저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " APLY_DT : " + APLY_DT + " \n";
			G_INFO += " COMP_NO : " + COMP_NO + " \n";
			G_INFO += " COMP_SQ : " + COMP_SQ + " \n";
			G_INFO += " COKD_CD : " + COKD_CD + " \n";
			G_INFO += " COMP_NM : " + COMP_NM + " \n";
			G_INFO += " INDO_NO : " + INDO_NO + " \n";
			G_INFO += " INDD_NO : " + INDD_NO + " \n";
			G_INFO += " INDD_SQ : " + INDD_SQ + " \n";
			G_INFO += " CORE_NO : " + CORE_NO + " \n";
			G_INFO += " COTK_CD : " + COTK_CD + " \n";
			G_INFO += " SUTK_YN : " + SUTK_YN + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
			G_INFO += " TKGJ_CD : " + TKGJ_CD + " \n";
			G_INFO += " TKJJ_CD : " + TKJJ_CD + " \n";
			G_INFO += " PRES_NM : " + PRES_NM + " \n";
			G_INFO += " LABO_CD : " + LABO_CD + " \n";
			G_INFO += " JIDO_CD : " + JIDO_CD + " \n";
			G_INFO += " ZIPKD_CD : " + ZIPKD_CD + " \n";
			G_INFO += " ZIP_CD : " + ZIP_CD + " \n";
			G_INFO += " ZIP_SQ : " + ZIP_SQ + " \n";
			G_INFO += " ZIP_AR : " + ZIP_AR + " \n";
			G_INFO += " ROAD_AR : " + ROAD_AR + " \n";
			G_INFO += " BLDG_NO : " + BLDG_NO + " \n";
			G_INFO += " TEL_NO : " + TEL_NO + " \n";
			G_INFO += " FAX_NO : " + FAX_NO + " \n";
			G_INFO += " JMOB_NO : " + JMOB_NO + " \n";
			G_INFO += " JEMAIL : " + JEMAIL + " \n";
			G_INFO += " JTEL_NO : " + JTEL_NO + " \n";
			G_INFO += " J_NM : " + J_NM + " \n";
			G_INFO += " TMOB_NO : " + TMOB_NO + " \n";
			G_INFO += " TEMAIL : " + TEMAIL + " \n";
			G_INFO += " TTEL_NO : " + TTEL_NO + " \n";
			G_INFO += " T_NM : " + T_NM + " \n";
			G_INFO += " CBIR_DT : " + CBIR_DT + " \n";
			G_INFO += " LUNR_KD : " + LUNR_KD + " \n";
			G_INFO += " SALE_ID : " + SALE_ID + " \n";
			G_INFO += " SSUB_ID : " + SSUB_ID + " \n";
			G_INFO += " PYER_CD : " + PYER_CD + " \n";
			G_INFO += " SPRT_PR : " + SPRT_PR + " \n";
			G_INFO += " CMPY_CD : " + CMPY_CD + " \n";
			G_INFO += " PRPY_CD : " + PRPY_CD + " \n";
			G_INFO += " TKCG_CD : " + TKCG_CD + " \n";
			G_INFO += " TKDE_CD : " + TKDE_CD + " \n";
			G_INFO += " TBAS_CD : " + TBAS_CD + " \n";
			G_INFO += " DISC_RT : " + DISC_RT + " \n";
			G_INFO += " CLAS_CD : " + CLAS_CD + " \n";
			G_INFO += " FAMI_CD : " + FAMI_CD + " \n";
			G_INFO += " COMP_TX : " + COMP_TX + " \n";
			G_INFO += " PAST_CD : " + PAST_CD + " \n";
			G_INFO += " OCS_CD : " + OCS_CD + " \n";
			G_INFO += " STRT_YR : " + STRT_YR + " \n";
			G_INFO += " PROD_NM : " + PROD_NM + " \n";
			G_INFO += " SMPL_YN : " + SMPL_YN + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " NUSER_ID : " + NUSER_ID + " \n";
			G_INFO += " NUSE_TX : " + NUSE_TX + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " TKGJ_YR : " + TKGJ_YR + " \n";
			G_INFO += " SLNS_DELAY : " + SLNS_DELAY + " \n";
			G_INFO += " PRNT_ZIP_CD : " + PRNT_ZIP_CD + " \n";
			G_INFO += " PRNT_ZIP_AR : " + PRNT_ZIP_AR + " \n";
			G_INFO += " PRNT_ROAD_AR : " + PRNT_ROAD_AR + " \n";
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
