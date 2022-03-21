<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uPack_Each_btnSaveClick_M7_011.jsp"%>
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

		String OPTN_NM = htMethod.get("OPTN_NM");
		String OPTN_PR = htMethod.get("OPTN_PR");
		String OPTN_CNT = htMethod.get("OPTN_CNT");
		String OPTN_LT = htMethod.get("OPTN_LT");
		String CALC_CD = htMethod.get("CALC_CD");
		String USE_YN = htMethod.get("USE_YN");
		String MODI_ID = htMethod.get("MODI_ID");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String PACK_SQ = htMethod.get("PACK_SQ");
		String OPTN_SQ = htMethod.get("OPTN_SQ");
		String SOPTN_NM = htMethod.get("SOPTN_NM");

		//
		if(OPTN_NM == null) { OPTN_NM = ""; }
		if(OPTN_PR == null) { OPTN_PR = ""; }
		if(OPTN_CNT == null) { OPTN_CNT = ""; }
		if(OPTN_LT == null) { OPTN_LT = ""; }
		if(CALC_CD == null) { CALC_CD = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(PACK_SQ == null) { PACK_SQ = ""; }
		if(OPTN_SQ == null) { OPTN_SQ = ""; }
		if(SOPTN_NM == null) { SOPTN_NM = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uPack_Each_btnSaveClick_M7_011(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Each_btnSaveClick_M7_011 \n";
			G_INFO += "설명 : 묶음옵션 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " OPTN_NM : " + OPTN_NM + " \n";
			G_INFO += " OPTN_PR : " + OPTN_PR + " \n";
			G_INFO += " OPTN_CNT : " + OPTN_CNT + " \n";
			G_INFO += " OPTN_LT : " + OPTN_LT + " \n";
			G_INFO += " CALC_CD : " + CALC_CD + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " PACK_SQ : " + PACK_SQ + " \n";
			G_INFO += " OPTN_SQ : " + OPTN_SQ + " \n";
			G_INFO += " SOPTN_NM : " + SOPTN_NM + " \n";
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
