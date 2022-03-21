<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_UChungfile2020_JSON_UDP_UINT_CHUNGPER_002.jsp"%>
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
		String CHUNG_KD = htMethod.get("CHUNG_KD");
		String CHUNG_DT = htMethod.get("CHUNG_DT");
		String CHUNG_YY = htMethod.get("CHUNG_YY");
		String CHUNG_NO = htMethod.get("CHUNG_NO");
		String RETURN_KD = htMethod.get("RETURN_KD");
		String BILL_HC = htMethod.get("BILL_HC");
		String BILL_FL = htMethod.get("BILL_FL");
		String BILLOS_PR = htMethod.get("BILLOS_PR");
		String BILLOSC_PR = htMethod.get("BILLOSC_PR");
		String BILLOSD_PR = htMethod.get("BILLOSD_PR");
		String BILLFIR_PR = htMethod.get("BILLFIR_PR");
		String BILLSED_PR = htMethod.get("BILLSED_PR");
		String BILLCAN_PR = htMethod.get("BILLCAN_PR");
		String BILLCANFN_PR = htMethod.get("BILLCANFN_PR");
		String BILLORAL_PR = htMethod.get("BILLORAL_PR");
		String BILL_NO = htMethod.get("BILL_NO");
		String BIAD_KD = htMethod.get("BIAD_KD");
		String BILBE_NO = htMethod.get("BILBE_NO");
		String USER_ID = htMethod.get("USER_ID");
		String ADDSUB_RSN = htMethod.get("ADDSUB_RSN");


		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CHUNG_KD == null) { CHUNG_KD = ""; }
		if(CHUNG_DT == null) { CHUNG_DT = ""; }
		if(CHUNG_YY == null) { CHUNG_YY = ""; }
		if(CHUNG_NO == null) { CHUNG_NO = ""; }
		if(RETURN_KD == null) { RETURN_KD = ""; }
		if(BILL_HC == null) { BILL_HC = ""; }
		if(BILL_FL == null) { BILL_FL = ""; }
		if(BILLOS_PR == null) { BILLOS_PR = ""; }
		if(BILLOSC_PR == null) { BILLOSC_PR = ""; }
		if(BILLOSD_PR == null) { BILLOSD_PR = ""; }
		if(BILLFIR_PR == null) { BILLFIR_PR = ""; }
		if(BILLSED_PR == null) { BILLSED_PR = ""; }
		if(BILLCAN_PR == null) { BILLCAN_PR = ""; }
		if(BILLCANFN_PR == null) { BILLCANFN_PR = ""; }
		if(BILLORAL_PR == null) { BILLORAL_PR = ""; }
		if(BILL_NO == null) { BILL_NO = ""; }
		if(BIAD_KD == null) { BIAD_KD = ""; }
		if(BILBE_NO == null) { BILBE_NO = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(ADDSUB_RSN == null) { ADDSUB_RSN = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_UChungfile2020_JSON_UDP_UINT_CHUNGPER_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UChungfile2020_JSON_UDP_UINT_CHUNGPER_002 \n";
			G_INFO += "설명 : 개별청구 저장 insert \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " CHUNG_KD : " + CHUNG_KD + " \n";
			G_INFO += " CHUNG_DT : " + CHUNG_DT + " \n";
			G_INFO += " CHUNG_YY : " + CHUNG_YY + " \n";
			G_INFO += " CHUNG_NO : " + CHUNG_NO + " \n";
			G_INFO += " RETURN_KD : " + RETURN_KD + " \n";
			G_INFO += " BILL_HC : " + BILL_HC + " \n";
			G_INFO += " BILL_FL : " + BILL_FL + " \n";
			G_INFO += " BILLOS_PR : " + BILLOS_PR + " \n";
			G_INFO += " BILLOSC_PR : " + BILLOSC_PR + " \n";
			G_INFO += " BILLOSD_PR : " + BILLOSD_PR + " \n";
			G_INFO += " BILLFIR_PR : " + BILLFIR_PR + " \n";
			G_INFO += " BILLSED_PR : " + BILLSED_PR + " \n";
			G_INFO += " BILLCAN_PR : " + BILLCAN_PR + " \n";
			G_INFO += " BILLCANFN_PR : " + BILLCANFN_PR + " \n";
			G_INFO += " BILLORAL_PR : " + BILLORAL_PR + " \n";
			G_INFO += " BILL_NO : " + BILL_NO + " \n";
			G_INFO += " BIAD_KD : " + BIAD_KD + " \n";
			G_INFO += " BILBE_NO : " + BILBE_NO + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " ADDSUB_RSN : " + ADDSUB_RSN + " \n";
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
