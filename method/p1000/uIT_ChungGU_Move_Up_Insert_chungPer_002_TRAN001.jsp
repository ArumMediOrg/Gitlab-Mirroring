<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uIT_ChungGU_Move_Up_Insert_chungPer_002_TRAN001.jsp"%>
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
		String BILL_DT = htMethod.get("BILL_DT");
		String BILL_NO = htMethod.get("BILL_NO");
		String BILL_KD = htMethod.get("BILL_KD");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String BILL_CT = htMethod.get("BILL_CT");
		String BILL_PR = htMethod.get("BILL_PR");
		String CST_DT = htMethod.get("CST_DT");
		String CET_DT = htMethod.get("CET_DT");
		String INPUT_ID = htMethod.get("INPUT_ID");
		String MODI_ID = htMethod.get("MODI_ID");
		String ETC = htMethod.get("ETC");

		//
		if(BUSI_YR == null) { BUSI_YR = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(BILL_DT == null) { BILL_DT = ""; }
		if(BILL_NO == null) { BILL_NO = ""; }
		if(BILL_KD == null) { BILL_KD = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(BILL_CT == null) { BILL_CT = ""; }
		if(BILL_PR == null) { BILL_PR = ""; }
		if(CST_DT == null) { CST_DT = ""; }
		if(CET_DT == null) { CET_DT = ""; }
		if(INPUT_ID == null) { INPUT_ID = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(ETC == null) { ETC = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uIT_ChungGU_Move_Up_Insert_chungPer_002_TRAN001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ChungGU_Move_Up_Insert_chungPer_002_TRAN001 \n";
			G_INFO += "설명 : 사업장 청구정보 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " BUSI_YR : " + BUSI_YR + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " BILL_DT : " + BILL_DT + " \n";
			G_INFO += " BILL_NO : " + BILL_NO + " \n";
			G_INFO += " BILL_KD : " + BILL_KD + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " BILL_CT : " + BILL_CT + " \n";
			G_INFO += " BILL_PR : " + BILL_PR + " \n";
			G_INFO += " CST_DT : " + CST_DT + " \n";
			G_INFO += " CET_DT : " + CET_DT + " \n";
			G_INFO += " INPUT_ID : " + INPUT_ID + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " ETC : " + ETC + " \n";
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
