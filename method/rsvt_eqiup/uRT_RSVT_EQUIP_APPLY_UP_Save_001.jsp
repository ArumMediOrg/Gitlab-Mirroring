<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uRT_RSVT_EQUIP_APPLY_UP_Save_001.jsp"%>
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

		String SAVE_KD = htMethod.get("SAVE_KD");
		String EQUI_CD = htMethod.get("EQUI_CD");
		String EQUI_NM = htMethod.get("EQUI_NM");
		String ITEM_LT = htMethod.get("ITEM_LT");
		String PART_CD = htMethod.get("PART_CD");
		String WKSU_YN = htMethod.get("WKSU_YN");
		String WKMO_YN = htMethod.get("WKMO_YN");
		String WKTU_YN = htMethod.get("WKTU_YN");
		String WKWE_YN = htMethod.get("WKWE_YN");
		String WKTH_YN = htMethod.get("WKTH_YN");
		String WKFR_YN = htMethod.get("WKFR_YN");
		String WKSA_YN = htMethod.get("WKSA_YN");
		String TIME_CD = htMethod.get("TIME_CD");
		String WDAM_STM = htMethod.get("WDAM_STM");
		String WDAM_ETM = htMethod.get("WDAM_ETM");
		String WDPM_STM = htMethod.get("WDPM_STM");
		String WDPM_ETM = htMethod.get("WDPM_ETM");
		String WKAM_STM = htMethod.get("WKAM_STM");
		String WKAM_ETM = htMethod.get("WKAM_ETM");
		String SCHE_CD = htMethod.get("SCHE_CD");
		String SCHE_MM = htMethod.get("SCHE_MM");
		String SCHE_CNT = htMethod.get("SCHE_CNT");
		String WORK_CD = htMethod.get("WORK_CD");
		String USE_YN = htMethod.get("USE_YN");
		String INPT_ID = htMethod.get("INPT_ID");
		String NUSE_ID = htMethod.get("NUSE_ID");
		String MODI_ID = htMethod.get("MODI_ID");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(EQUI_CD == null) { EQUI_CD = ""; }
		if(EQUI_NM == null) { EQUI_NM = ""; }
		if(ITEM_LT == null) { ITEM_LT = ""; }
		if(PART_CD == null) { PART_CD = ""; }
		if(WKSU_YN == null) { WKSU_YN = ""; }
		if(WKMO_YN == null) { WKMO_YN = ""; }
		if(WKTU_YN == null) { WKTU_YN = ""; }
		if(WKWE_YN == null) { WKWE_YN = ""; }
		if(WKTH_YN == null) { WKTH_YN = ""; }
		if(WKFR_YN == null) { WKFR_YN = ""; }
		if(WKSA_YN == null) { WKSA_YN = ""; }
		if(TIME_CD == null) { TIME_CD = ""; }
		if(WDAM_STM == null) { WDAM_STM = ""; }
		if(WDAM_ETM == null) { WDAM_ETM = ""; }
		if(WDPM_STM == null) { WDPM_STM = ""; }
		if(WDPM_ETM == null) { WDPM_ETM = ""; }
		if(WKAM_STM == null) { WKAM_STM = ""; }
		if(WKAM_ETM == null) { WKAM_ETM = ""; }
		if(SCHE_CD == null) { SCHE_CD = ""; }
		if(SCHE_MM == null) { SCHE_MM = ""; }
		if(SCHE_CNT == null) { SCHE_CNT = ""; }
		if(WORK_CD == null) { WORK_CD = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uRT_RSVT_EQUIP_APPLY_UP_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_RSVT_EQUIP_APPLY_UP_Save_001 \n";
			G_INFO += "설명 : 예약 장비 설정 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " EQUI_CD : " + EQUI_CD + " \n";
			G_INFO += " EQUI_NM : " + EQUI_NM + " \n";
			G_INFO += " ITEM_LT : " + ITEM_LT + " \n";
			G_INFO += " PART_CD : " + PART_CD + " \n";
			G_INFO += " WKSU_YN : " + WKSU_YN + " \n";
			G_INFO += " WKMO_YN : " + WKMO_YN + " \n";
			G_INFO += " WKTU_YN : " + WKTU_YN + " \n";
			G_INFO += " WKWE_YN : " + WKWE_YN + " \n";
			G_INFO += " WKTH_YN : " + WKTH_YN + " \n";
			G_INFO += " WKFR_YN : " + WKFR_YN + " \n";
			G_INFO += " WKSA_YN : " + WKSA_YN + " \n";
			G_INFO += " TIME_CD : " + TIME_CD + " \n";
			G_INFO += " WDAM_STM : " + WDAM_STM + " \n";
			G_INFO += " WDAM_ETM : " + WDAM_ETM + " \n";
			G_INFO += " WDPM_STM : " + WDPM_STM + " \n";
			G_INFO += " WDPM_ETM : " + WDPM_ETM + " \n";
			G_INFO += " WKAM_STM : " + WKAM_STM + " \n";
			G_INFO += " WKAM_ETM : " + WKAM_ETM + " \n";
			G_INFO += " SCHE_CD : " + SCHE_CD + " \n";
			G_INFO += " SCHE_MM : " + SCHE_MM + " \n";
			G_INFO += " SCHE_CNT : " + SCHE_CNT + " \n";
			G_INFO += " WORK_CD : " + WORK_CD + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " NUSE_ID : " + NUSE_ID + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
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
