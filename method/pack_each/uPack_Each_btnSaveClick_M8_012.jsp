<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uPack_Each_btnSaveClick_M8_012.jsp"%>
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

		String SEXAM_CD = htMethod.get("SEXAM_CD");
		String SMAX_SQ = htMethod.get("SMAX_SQ");
		String SOPTN_CD = htMethod.get("SOPTN_CD");
		String SOPTN_NM = htMethod.get("SOPTN_NM");
		String IOPTN_PR = htMethod.get("IOPTN_PR");
		String IOPTN_CNT = htMethod.get("IOPTN_CNT");
		String SOPTN_LT = htMethod.get("SOPTN_LT");
		String SCALC_CD = htMethod.get("SCALC_CD");
		String SOPTN_USE = htMethod.get("SOPTN_USE");
		String GUSER1 = htMethod.get("GUSER1");
		String GUSER2 = htMethod.get("GUSER2");

		//
		if(SEXAM_CD == null) { SEXAM_CD = ""; }
		if(SMAX_SQ == null) { SMAX_SQ = ""; }
		if(SOPTN_CD == null) { SOPTN_CD = ""; }
		if(SOPTN_NM == null) { SOPTN_NM = ""; }
		if(IOPTN_PR == null) { IOPTN_PR = ""; }
		if(IOPTN_CNT == null) { IOPTN_CNT = ""; }
		if(SOPTN_LT == null) { SOPTN_LT = ""; }
		if(SCALC_CD == null) { SCALC_CD = ""; }
		if(SOPTN_USE == null) { SOPTN_USE = ""; }
		if(GUSER1 == null) { GUSER1 = ""; }
		if(GUSER2 == null) { GUSER2 = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uPack_Each_btnSaveClick_M8_012(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Each_btnSaveClick_M8_012 \n";
			G_INFO += "설명 : 묶음옵션 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SEXAM_CD : " + SEXAM_CD + " \n";
			G_INFO += " SMAX_SQ : " + SMAX_SQ + " \n";
			G_INFO += " SOPTN_CD : " + SOPTN_CD + " \n";
			G_INFO += " SOPTN_NM : " + SOPTN_NM + " \n";
			G_INFO += " IOPTN_PR : " + IOPTN_PR + " \n";
			G_INFO += " IOPTN_CNT : " + IOPTN_CNT + " \n";
			G_INFO += " SOPTN_LT : " + SOPTN_LT + " \n";
			G_INFO += " SCALC_CD : " + SCALC_CD + " \n";
			G_INFO += " SOPTN_USE : " + SOPTN_USE + " \n";
			G_INFO += " GUSER1 : " + GUSER1 + " \n";
			G_INFO += " GUSER2 : " + GUSER2 + " \n";
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
