<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCT_QUESTION_APPLY_UP_Save_002_TRAN002.jsp"%>
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

		String USE_YN = htMethod.get("USE_YN");
		String EXEM_CD = htMethod.get("EXEM_CD");
		String QSKD_CD = htMethod.get("QSKD_CD");
		String QSTN_SQ = htMethod.get("QSTN_SQ");
		String QSTN_LV = htMethod.get("QSTN_LV");
		String QSTN_NM = htMethod.get("QSTN_NM");
		String ANSR_CD = htMethod.get("ANSR_CD");
		String ANSE_EX = htMethod.get("ANSE_EX");
		String QSTN_CP = htMethod.get("QSTN_CP");
		String DEFULT = htMethod.get("DEFULT");
		String SCOR_YN = htMethod.get("SCOR_YN");
		String SCOR_CNT = htMethod.get("SCOR_CNT");
		String SCOR_NO = htMethod.get("SCOR_NO");
		String SCOR_SCR = htMethod.get("SCOR_SCR");
		String MODI_ID = htMethod.get("MODI_ID");
		String QSTN_CD = htMethod.get("QSTN_CD");
		String NUSE_ID = htMethod.get("NUSE_ID");
		String SEX_CD = htMethod.get("SEX_CD");

		//
		if(USE_YN == null) { USE_YN = ""; }
		if(EXEM_CD == null) { EXEM_CD = ""; }
		if(QSKD_CD == null) { QSKD_CD = ""; }
		if(QSTN_SQ == null) { QSTN_SQ = ""; }
		if(QSTN_LV == null) { QSTN_LV = ""; }
		if(QSTN_NM == null) { QSTN_NM = ""; }
		if(ANSR_CD == null) { ANSR_CD = ""; }
		if(ANSE_EX == null) { ANSE_EX = ""; }
		if(QSTN_CP == null) { QSTN_CP = ""; }
		if(DEFULT == null) { DEFULT = ""; }
		if(SCOR_YN == null) { SCOR_YN = ""; }
		if(SCOR_CNT == null) { SCOR_CNT = ""; }
		if(SCOR_NO == null) { SCOR_NO = ""; }
		if(SCOR_SCR == null) { SCOR_SCR = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(QSTN_CD == null) { QSTN_CD = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCT_QUESTION_APPLY_UP_Save_002_TRAN002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCT_QUESTION_APPLY_UP_Save_002_TRAN002 \n";
			G_INFO += "설명 : 문진정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " EXEM_CD : " + EXEM_CD + " \n";
			G_INFO += " QSKD_CD : " + QSKD_CD + " \n";
			G_INFO += " QSTN_SQ : " + QSTN_SQ + " \n";
			G_INFO += " QSTN_LV : " + QSTN_LV + " \n";
			G_INFO += " QSTN_NM : " + QSTN_NM + " \n";
			G_INFO += " ANSR_CD : " + ANSR_CD + " \n";
			G_INFO += " ANSE_EX : " + ANSE_EX + " \n";
			G_INFO += " QSTN_CP : " + QSTN_CP + " \n";
			G_INFO += " DEFULT : " + DEFULT + " \n";
			G_INFO += " SCOR_YN : " + SCOR_YN + " \n";
			G_INFO += " SCOR_CNT : " + SCOR_CNT + " \n";
			G_INFO += " SCOR_NO : " + SCOR_NO + " \n";
			G_INFO += " SCOR_SCR : " + SCOR_SCR + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " QSTN_CD : " + QSTN_CD + " \n";
			G_INFO += " NUSE_ID : " + NUSE_ID + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
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
