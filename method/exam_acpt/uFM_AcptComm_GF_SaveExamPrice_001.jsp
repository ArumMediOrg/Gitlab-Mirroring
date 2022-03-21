<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uFM_AcptComm_GF_SaveExamPrice_001.jsp"%>
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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String ORDER_DT = htMethod.get("ORDER_DT");
		String ORDER_CD = htMethod.get("ORDER_CD");
		String CUST_NO = htMethod.get("CUST_NO");
		String COMP_CD = htMethod.get("COMP_CD");
		String FST_PR = htMethod.get("FST_PR");
		String ADD_PR = htMethod.get("ADD_PR");
		String PRGS_PR = htMethod.get("PRGS_PR");
		String HTSB_PR = htMethod.get("HTSB_PR");
		String CAN_PR = htMethod.get("CAN_PR");
		String SPSB_PR = htMethod.get("SPSB_PR");
		String CVSB_PR = htMethod.get("CVSB_PR");
		String EMSB_PR = htMethod.get("EMSB_PR");
		String ETSB_PR = htMethod.get("ETSB_PR");
		String EXAM_PR = htMethod.get("EXAM_PR");
		String HDMD_PR = htMethod.get("HDMD_PR");
		String SDMD_PR = htMethod.get("SDMD_PR");
		String COMP_PR = htMethod.get("COMP_PR");
		String COMPS_PR = htMethod.get("COMPS_PR");
		String PSNL_PR = htMethod.get("PSNL_PR");
		String PSNLP_PR = htMethod.get("PSNLP_PR");
		String DMD_PR = htMethod.get("DMD_PR");
		String INPT_ID = htMethod.get("INPT_ID");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ORDER_DT == null) { ORDER_DT = ""; }
		if(ORDER_CD == null) { ORDER_CD = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(FST_PR == null) { FST_PR = ""; }
		if(ADD_PR == null) { ADD_PR = ""; }
		if(PRGS_PR == null) { PRGS_PR = ""; }
		if(HTSB_PR == null) { HTSB_PR = ""; }
		if(CAN_PR == null) { CAN_PR = ""; }
		if(SPSB_PR == null) { SPSB_PR = ""; }
		if(CVSB_PR == null) { CVSB_PR = ""; }
		if(EMSB_PR == null) { EMSB_PR = ""; }
		if(ETSB_PR == null) { ETSB_PR = ""; }
		if(EXAM_PR == null) { EXAM_PR = ""; }
		if(HDMD_PR == null) { HDMD_PR = ""; }
		if(SDMD_PR == null) { SDMD_PR = ""; }
		if(COMP_PR == null) { COMP_PR = ""; }
		if(COMPS_PR == null) { COMPS_PR = ""; }
		if(PSNL_PR == null) { PSNL_PR = ""; }
		if(PSNLP_PR == null) { PSNLP_PR = ""; }
		if(DMD_PR == null) { DMD_PR = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uFM_AcptComm_GF_SaveExamPrice_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_SaveExamPrice_001 \n";
			G_INFO += "설명 : 수가 정보 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " ORDER_DT : " + ORDER_DT + " \n";
			G_INFO += " ORDER_CD : " + ORDER_CD + " \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " FST_PR : " + FST_PR + " \n";
			G_INFO += " ADD_PR : " + ADD_PR + " \n";
			G_INFO += " PRGS_PR : " + PRGS_PR + " \n";
			G_INFO += " HTSB_PR : " + HTSB_PR + " \n";
			G_INFO += " CAN_PR : " + CAN_PR + " \n";
			G_INFO += " SPSB_PR : " + SPSB_PR + " \n";
			G_INFO += " CVSB_PR : " + CVSB_PR + " \n";
			G_INFO += " EMSB_PR : " + EMSB_PR + " \n";
			G_INFO += " ETSB_PR : " + ETSB_PR + " \n";
			G_INFO += " EXAM_PR : " + EXAM_PR + " \n";
			G_INFO += " HDMD_PR : " + HDMD_PR + " \n";
			G_INFO += " SDMD_PR : " + SDMD_PR + " \n";
			G_INFO += " COMP_PR : " + COMP_PR + " \n";
			G_INFO += " COMPS_PR : " + COMPS_PR + " \n";
			G_INFO += " PSNL_PR : " + PSNL_PR + " \n";
			G_INFO += " PSNLP_PR : " + PSNLP_PR + " \n";
			G_INFO += " DMD_PR : " + DMD_PR + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
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
