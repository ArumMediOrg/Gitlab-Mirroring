<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_ubT_Rece_XML_COM_SUIN_001.jsp"%>
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

		String RECE_NO = htMethod.get("RECE_NO");
		String RECE_SEQ = htMethod.get("RECE_SEQ");
		String RECE_DT = htMethod.get("RECE_DT");
		String OCCU_KD = htMethod.get("OCCU_KD");
		String PER_CNT = htMethod.get("PER_CNT");
		String CUST_NO = htMethod.get("CUST_NO");
		String CUST_NM = htMethod.get("CUST_NM");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String CHARGE_PR = htMethod.get("CHARGE_PR");
		String PAY_KD = htMethod.get("PAY_KD");
		String PAYEND_KD = htMethod.get("PAYEND_KD");
		String SALE_KD = htMethod.get("SALE_KD");
		String SALE_PR = htMethod.get("SALE_PR");
		String TRUNC_KD = htMethod.get("TRUNC_KD");
		String TRUNC_PR = htMethod.get("TRUNC_PR");
		String RECE_PR = htMethod.get("RECE_PR");
		String RESER_PR = htMethod.get("RESER_PR");
		String RESEREPL_PR = htMethod.get("RESEREPL_PR");
		String OVERPAY_PR = htMethod.get("OVERPAY_PR");
		String MEMO = htMethod.get("MEMO");
		String CARD_NO = htMethod.get("CARD_NO");
		String ISSUE_CD = htMethod.get("ISSUE_CD");
		String ALLOT_MM = htMethod.get("ALLOT_MM");
		String APPR_NO = htMethod.get("APPR_NO");
		String APPR_DT = htMethod.get("APPR_DT");
		String CARD_NM = htMethod.get("CARD_NM");
		String INPUT_ID = htMethod.get("INPUT_ID");
		String MODI_ID = htMethod.get("MODI_ID");
		String RECE_TD_PR = htMethod.get("RECE_TD_PR");
		String SALE_TD_PR = htMethod.get("SALE_TD_PR");
		String TRUNC_TD_PR = htMethod.get("TRUNC_TD_PR");
		String RECE_AF_PR = htMethod.get("RECE_AF_PR");
		String SALE_AF_PR = htMethod.get("SALE_AF_PR");
		String TRUNC_AF_PR = htMethod.get("TRUNC_AF_PR");
		String ETC_NM = htMethod.get("ETC_NM");

		//
		if(RECE_NO == null) { RECE_NO = ""; }
		if(RECE_SEQ == null) { RECE_SEQ = ""; }
		if(RECE_DT == null) { RECE_DT = ""; }
		if(OCCU_KD == null) { OCCU_KD = ""; }
		if(PER_CNT == null) { PER_CNT = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }
		if(CUST_NM == null) { CUST_NM = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(CHARGE_PR == null) { CHARGE_PR = ""; }
		if(PAY_KD == null) { PAY_KD = ""; }
		if(PAYEND_KD == null) { PAYEND_KD = ""; }
		if(SALE_KD == null) { SALE_KD = ""; }
		if(SALE_PR == null) { SALE_PR = ""; }
		if(TRUNC_KD == null) { TRUNC_KD = ""; }
		if(TRUNC_PR == null) { TRUNC_PR = ""; }
		if(RECE_PR == null) { RECE_PR = ""; }
		if(RESER_PR == null) { RESER_PR = ""; }
		if(RESEREPL_PR == null) { RESEREPL_PR = ""; }
		if(OVERPAY_PR == null) { OVERPAY_PR = ""; }
		if(MEMO == null) { MEMO = ""; }
		if(CARD_NO == null) { CARD_NO = ""; }
		if(ISSUE_CD == null) { ISSUE_CD = ""; }
		if(ALLOT_MM == null) { ALLOT_MM = ""; }
		if(APPR_NO == null) { APPR_NO = ""; }
		if(APPR_DT == null) { APPR_DT = ""; }
		if(CARD_NM == null) { CARD_NM = ""; }
		if(INPUT_ID == null) { INPUT_ID = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(RECE_TD_PR == null) { RECE_TD_PR = ""; }
		if(SALE_TD_PR == null) { SALE_TD_PR = ""; }
		if(TRUNC_TD_PR == null) { TRUNC_TD_PR = ""; }
		if(RECE_AF_PR == null) { RECE_AF_PR = ""; }
		if(SALE_AF_PR == null) { SALE_AF_PR = ""; }
		if(TRUNC_AF_PR == null) { TRUNC_AF_PR = ""; }
		if(ETC_NM == null) { ETC_NM = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_ubT_Rece_XML_COM_SUIN_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubT_Rece_XML_COM_SUIN_001 \n";
			G_INFO += "설명 : 수납저장(수기, 카드연동) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RECE_NO : " + RECE_NO + " \n";
			G_INFO += " RECE_SEQ : " + RECE_SEQ + " \n";
			G_INFO += " RECE_DT : " + RECE_DT + " \n";
			G_INFO += " OCCU_KD : " + OCCU_KD + " \n";
			G_INFO += " PER_CNT : " + PER_CNT + " \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " CUST_NM : " + CUST_NM + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " CHARGE_PR : " + CHARGE_PR + " \n";
			G_INFO += " PAY_KD : " + PAY_KD + " \n";
			G_INFO += " PAYEND_KD : " + PAYEND_KD + " \n";
			G_INFO += " SALE_KD : " + SALE_KD + " \n";
			G_INFO += " SALE_PR : " + SALE_PR + " \n";
			G_INFO += " TRUNC_KD : " + TRUNC_KD + " \n";
			G_INFO += " TRUNC_PR : " + TRUNC_PR + " \n";
			G_INFO += " RECE_PR : " + RECE_PR + " \n";
			G_INFO += " RESER_PR : " + RESER_PR + " \n";
			G_INFO += " RESEREPL_PR : " + RESEREPL_PR + " \n";
			G_INFO += " OVERPAY_PR : " + OVERPAY_PR + " \n";
			G_INFO += " MEMO : " + MEMO + " \n";
			G_INFO += " CARD_NO : " + CARD_NO + " \n";
			G_INFO += " ISSUE_CD : " + ISSUE_CD + " \n";
			G_INFO += " ALLOT_MM : " + ALLOT_MM + " \n";
			G_INFO += " APPR_NO : " + APPR_NO + " \n";
			G_INFO += " APPR_DT : " + APPR_DT + " \n";
			G_INFO += " CARD_NM : " + CARD_NM + " \n";
			G_INFO += " INPUT_ID : " + INPUT_ID + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " RECE_TD_PR : " + RECE_TD_PR + " \n";
			G_INFO += " SALE_TD_PR : " + SALE_TD_PR + " \n";
			G_INFO += " TRUNC_TD_PR : " + TRUNC_TD_PR + " \n";
			G_INFO += " RECE_AF_PR : " + RECE_AF_PR + " \n";
			G_INFO += " SALE_AF_PR : " + SALE_AF_PR + " \n";
			G_INFO += " TRUNC_AF_PR : " + TRUNC_AF_PR + " \n";
			G_INFO += " ETC_NM : " + ETC_NM + " \n";
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
