<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uHospital_Set_btn_save1Click_001.jsp"%>
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

		String HBSAG_KD = htMethod.get("HBSAG_KD");
		String HBS_KD = htMethod.get("HBS_KD");
		String XRAY_KD = htMethod.get("XRAY_KD");
		String EGRF_KD = htMethod.get("EGRF_KD");
		String BONE_KD = htMethod.get("BONE_KD");
		String UGI_KD = htMethod.get("UGI_KD");
		String BOENT_KD = htMethod.get("BOENT_KD");
		String ENEMA_KD = htMethod.get("ENEMA_KD");
		String EIA_KD = htMethod.get("EIA_KD");
		String SVP_KD = htMethod.get("SVP_KD");
		String HCVAB_KD = htMethod.get("HCVAB_KD");
		String AFTP_KD = htMethod.get("AFTP_KD");
		String MMGP_KD = htMethod.get("MMGP_KD");
		String STDAG_NO = htMethod.get("STDAG_NO");
		String STDAB_NO = htMethod.get("STDAB_NO");
		String ACPT_KD = htMethod.get("ACPT_KD");
		String ORAL_KD = htMethod.get("ORAL_KD");
		String ATCNR_KD = htMethod.get("ATCNR_KD");
		String HEPA_NO = htMethod.get("HEPA_NO");
		String SVP_NO = htMethod.get("SVP_NO");
		String HIV_NO = htMethod.get("HIV_NO");
		String PRCARE_EMAT = htMethod.get("PRCARE_EMAT");
		String BLOODCK_KD = htMethod.get("BLOODCK_KD");
		String FOCP_KD = htMethod.get("FOCP_KD");
		String CONT_KD = htMethod.get("CONT_KD");

		//
		if(HBSAG_KD == null) { HBSAG_KD = ""; }
		if(HBS_KD == null) { HBS_KD = ""; }
		if(XRAY_KD == null) { XRAY_KD = ""; }
		if(EGRF_KD == null) { EGRF_KD = ""; }
		if(BONE_KD == null) { BONE_KD = ""; }
		if(UGI_KD == null) { UGI_KD = ""; }
		if(BOENT_KD == null) { BOENT_KD = ""; }
		if(ENEMA_KD == null) { ENEMA_KD = ""; }
		if(EIA_KD == null) { EIA_KD = ""; }
		if(SVP_KD == null) { SVP_KD = ""; }
		if(HCVAB_KD == null) { HCVAB_KD = ""; }
		if(AFTP_KD == null) { AFTP_KD = ""; }
		if(MMGP_KD == null) { MMGP_KD = ""; }
		if(STDAG_NO == null) { STDAG_NO = ""; }
		if(STDAB_NO == null) { STDAB_NO = ""; }
		if(ACPT_KD == null) { ACPT_KD = ""; }
		if(ORAL_KD == null) { ORAL_KD = ""; }
		if(ATCNR_KD == null) { ATCNR_KD = ""; }
		if(HEPA_NO == null) { HEPA_NO = ""; }
		if(SVP_NO == null) { SVP_NO = ""; }
		if(HIV_NO == null) { HIV_NO = ""; }
		if(PRCARE_EMAT == null) { PRCARE_EMAT = ""; }
		if(BLOODCK_KD == null) { BLOODCK_KD = ""; }
		if(FOCP_KD == null) { FOCP_KD = ""; }
		if(CONT_KD == null) { CONT_KD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uHospital_Set_btn_save1Click_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHospital_Set_btn_save1Click_001 \n";
			G_INFO += "설명 : 병원정보 업데이트 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " HBSAG_KD : " + HBSAG_KD + " \n";
			G_INFO += " HBS_KD : " + HBS_KD + " \n";
			G_INFO += " XRAY_KD : " + XRAY_KD + " \n";
			G_INFO += " EGRF_KD : " + EGRF_KD + " \n";
			G_INFO += " BONE_KD : " + BONE_KD + " \n";
			G_INFO += " UGI_KD : " + UGI_KD + " \n";
			G_INFO += " BOENT_KD : " + BOENT_KD + " \n";
			G_INFO += " ENEMA_KD : " + ENEMA_KD + " \n";
			G_INFO += " EIA_KD : " + EIA_KD + " \n";
			G_INFO += " SVP_KD : " + SVP_KD + " \n";
			G_INFO += " HCVAB_KD : " + HCVAB_KD + " \n";
			G_INFO += " AFTP_KD : " + AFTP_KD + " \n";
			G_INFO += " MMGP_KD : " + MMGP_KD + " \n";
			G_INFO += " STDAG_NO : " + STDAG_NO + " \n";
			G_INFO += " STDAB_NO : " + STDAB_NO + " \n";
			G_INFO += " ACPT_KD : " + ACPT_KD + " \n";
			G_INFO += " ORAL_KD : " + ORAL_KD + " \n";
			G_INFO += " ATCNR_KD : " + ATCNR_KD + " \n";
			G_INFO += " HEPA_NO : " + HEPA_NO + " \n";
			G_INFO += " SVP_NO : " + SVP_NO + " \n";
			G_INFO += " HIV_NO : " + HIV_NO + " \n";
			G_INFO += " PRCARE_EMAT : " + PRCARE_EMAT + " \n";
			G_INFO += " BLOODCK_KD : " + BLOODCK_KD + " \n";
			G_INFO += " FOCP_KD : " + FOCP_KD + " \n";
			G_INFO += " CONT_KD : " + CONT_KD + " \n";
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
