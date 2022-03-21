<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uIT_ChungGU_Move_Up_Insert_chungCmd_003_TRAN002.jsp"%>
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

		String BUSI_YR = htMethod.get("BUSI_YR");
		String COMP_CD = htMethod.get("COMP_CD");
		String BILL_NO = htMethod.get("BILL_NO");
		String BILL_DT = htMethod.get("BILL_DT");
		String BILL_SQ = htMethod.get("BILL_SQ");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String BILL_KD = htMethod.get("BILL_KD");
		String BILLCOM_PR = htMethod.get("BILLCOM_PR");
		String INPUT_ID = htMethod.get("INPUT_ID");
		String BILL_ETC = htMethod.get("BILL_ETC");
		String BILL_ETC_NM = htMethod.get("BILL_ETC_NM");

		//
		if(BUSI_YR == null) { BUSI_YR = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(BILL_NO == null) { BILL_NO = ""; }
		if(BILL_DT == null) { BILL_DT = ""; }
		if(BILL_SQ == null) { BILL_SQ = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(BILL_KD == null) { BILL_KD = ""; }
		if(BILLCOM_PR == null) { BILLCOM_PR = ""; }
		if(INPUT_ID == null) { INPUT_ID = ""; }
		if(BILL_ETC == null) { BILL_ETC = ""; }
		if(BILL_ETC_NM == null) { BILL_ETC_NM = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uIT_ChungGU_Move_Up_Insert_chungCmd_003_TRAN002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ChungGU_Move_Up_Insert_chungCmd_003_TRAN002 \n";
			G_INFO += "설명 : 사업장 청구정보 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " BUSI_YR : " + BUSI_YR + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " BILL_NO : " + BILL_NO + " \n";
			G_INFO += " BILL_DT : " + BILL_DT + " \n";
			G_INFO += " BILL_SQ : " + BILL_SQ + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " BILL_KD : " + BILL_KD + " \n";
			G_INFO += " BILLCOM_PR : " + BILLCOM_PR + " \n";
			G_INFO += " INPUT_ID : " + INPUT_ID + " \n";
			G_INFO += " BILL_ETC : " + BILL_ETC + " \n";
			G_INFO += " BILL_ETC_NM : " + BILL_ETC_NM + " \n";
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
