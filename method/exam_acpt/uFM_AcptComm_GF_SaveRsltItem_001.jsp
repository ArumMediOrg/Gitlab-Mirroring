<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uFM_AcptComm_GF_SaveRsltItem_001.jsp"%>
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
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String HLTH_KD = htMethod.get("HLTH_KD");
		String TOTAL_KD = htMethod.get("TOTAL_KD");
		String STDT_KD = htMethod.get("STDT_KD");
		String EMPY_KD = htMethod.get("EMPY_KD");
		String SPCL_KD = htMethod.get("SPCL_KD");
		String DETL_KD = htMethod.get("DETL_KD");
		String BLOOD_KD = htMethod.get("BLOOD_KD");
		String EACH_KD = htMethod.get("EACH_KD");
		String CVCL_KD = htMethod.get("CVCL_KD");
		String ETC_KD = htMethod.get("ETC_KD");
		String ADD_KD = htMethod.get("ADD_KD");
		String SORT_SQ = htMethod.get("SORT_SQ");
		String CFRM_YN = htMethod.get("CFRM_YN");
		String CNCL_YN = htMethod.get("CNCL_YN");
		String OCS_CD = htMethod.get("OCS_CD");
		String OSSB_CD = htMethod.get("OSSB_CD");
		String OSRL_CD = htMethod.get("OSRL_CD");
		String SPMIGUM_YN = htMethod.get("SPMIGUM_YN");
		String INPT_ID = htMethod.get("INPT_ID");
		String MODI_ID = htMethod.get("MODI_ID");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(HLTH_KD == null) { HLTH_KD = ""; }
		if(TOTAL_KD == null) { TOTAL_KD = ""; }
		if(STDT_KD == null) { STDT_KD = ""; }
		if(EMPY_KD == null) { EMPY_KD = ""; }
		if(SPCL_KD == null) { SPCL_KD = ""; }
		if(DETL_KD == null) { DETL_KD = ""; }
		if(BLOOD_KD == null) { BLOOD_KD = ""; }
		if(EACH_KD == null) { EACH_KD = ""; }
		if(CVCL_KD == null) { CVCL_KD = ""; }
		if(ETC_KD == null) { ETC_KD = ""; }
		if(ADD_KD == null) { ADD_KD = ""; }
		if(SORT_SQ == null) { SORT_SQ = ""; }
		if(CFRM_YN == null) { CFRM_YN = ""; }
		if(CNCL_YN == null) { CNCL_YN = ""; }
		if(OCS_CD == null) { OCS_CD = ""; }
		if(OSSB_CD == null) { OSSB_CD = ""; }
		if(OSRL_CD == null) { OSRL_CD = ""; }
		if(SPMIGUM_YN == null) { SPMIGUM_YN = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uFM_AcptComm_GF_SaveRsltItem_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_SaveRsltItem_001 \n";
			G_INFO += "설명 : 검사항목별 결과 기초정보 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " HLTH_KD : " + HLTH_KD + " \n";
			G_INFO += " TOTAL_KD : " + TOTAL_KD + " \n";
			G_INFO += " STDT_KD : " + STDT_KD + " \n";
			G_INFO += " EMPY_KD : " + EMPY_KD + " \n";
			G_INFO += " SPCL_KD : " + SPCL_KD + " \n";
			G_INFO += " DETL_KD : " + DETL_KD + " \n";
			G_INFO += " BLOOD_KD : " + BLOOD_KD + " \n";
			G_INFO += " EACH_KD : " + EACH_KD + " \n";
			G_INFO += " CVCL_KD : " + CVCL_KD + " \n";
			G_INFO += " ETC_KD : " + ETC_KD + " \n";
			G_INFO += " ADD_KD : " + ADD_KD + " \n";
			G_INFO += " SORT_SQ : " + SORT_SQ + " \n";
			G_INFO += " CFRM_YN : " + CFRM_YN + " \n";
			G_INFO += " CNCL_YN : " + CNCL_YN + " \n";
			G_INFO += " OCS_CD : " + OCS_CD + " \n";
			G_INFO += " OSSB_CD : " + OSSB_CD + " \n";
			G_INFO += " OSRL_CD : " + OSRL_CD + " \n";
			G_INFO += " SPMIGUM_YN : " + SPMIGUM_YN + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
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
