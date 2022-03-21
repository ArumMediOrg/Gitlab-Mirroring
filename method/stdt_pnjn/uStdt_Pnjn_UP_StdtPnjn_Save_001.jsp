<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uStdt_Pnjn_UP_StdtPnjn_Save_001.jsp"%>
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
		String PNJN_TT = htMethod.get("PNJN_TT");
		String PNJN_01 = htMethod.get("PNJN_01");
		String PNJN_02 = htMethod.get("PNJN_02");
		String PNJN_03 = htMethod.get("PNJN_03");
		String PNJN_04 = htMethod.get("PNJN_04");
		String PNJN_05 = htMethod.get("PNJN_05");
		String PNJN_06 = htMethod.get("PNJN_06");
		String PNJN_07 = htMethod.get("PNJN_07");
		String PNJN_08 = htMethod.get("PNJN_08");
		String PNJN_09 = htMethod.get("PNJN_09");
		String PNJN_10 = htMethod.get("PNJN_10");
		String PNJN_11 = htMethod.get("PNJN_11");
		String PNJN_12 = htMethod.get("PNJN_12");
		String PNJN_13 = htMethod.get("PNJN_13");
		String PNJN_14 = htMethod.get("PNJN_14");
		String QST_01 = htMethod.get("QST_01");
		String QST_02 = htMethod.get("QST_02");
		String QST_03 = htMethod.get("QST_03");
		String QST_04 = htMethod.get("QST_04");
		String EXAM_VIEW = htMethod.get("EXAM_VIEW");
		String EXAM_ACT = htMethod.get("EXAM_ACT");
		String ORAL_VIEW = htMethod.get("ORAL_VIEW");
		String ORAL_ACT = htMethod.get("ORAL_ACT");
		String EIFRM_DT = htMethod.get("EIFRM_DT");
		String OIFRM_DT = htMethod.get("OIFRM_DT");
		String EXAM_DR = htMethod.get("EXAM_DR");
		String ORAL_DR = htMethod.get("ORAL_DR");
		String EPNJN_YN = htMethod.get("EPNJN_YN");
		String OPNJN_YN = htMethod.get("OPNJN_YN");
		String USER_ID = htMethod.get("USER_ID");
		String ORAL_YN = htMethod.get("ORAL_YN");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(PNJN_TT == null) { PNJN_TT = ""; }
		if(PNJN_01 == null) { PNJN_01 = ""; }
		if(PNJN_02 == null) { PNJN_02 = ""; }
		if(PNJN_03 == null) { PNJN_03 = ""; }
		if(PNJN_04 == null) { PNJN_04 = ""; }
		if(PNJN_05 == null) { PNJN_05 = ""; }
		if(PNJN_06 == null) { PNJN_06 = ""; }
		if(PNJN_07 == null) { PNJN_07 = ""; }
		if(PNJN_08 == null) { PNJN_08 = ""; }
		if(PNJN_09 == null) { PNJN_09 = ""; }
		if(PNJN_10 == null) { PNJN_10 = ""; }
		if(PNJN_11 == null) { PNJN_11 = ""; }
		if(PNJN_12 == null) { PNJN_12 = ""; }
		if(PNJN_13 == null) { PNJN_13 = ""; }
		if(PNJN_14 == null) { PNJN_14 = ""; }
		if(QST_01 == null) { QST_01 = ""; }
		if(QST_02 == null) { QST_02 = ""; }
		if(QST_03 == null) { QST_03 = ""; }
		if(QST_04 == null) { QST_04 = ""; }
		if(EXAM_VIEW == null) { EXAM_VIEW = ""; }
		if(EXAM_ACT == null) { EXAM_ACT = ""; }
		if(ORAL_VIEW == null) { ORAL_VIEW = ""; }
		if(ORAL_ACT == null) { ORAL_ACT = ""; }
		if(EIFRM_DT == null) { EIFRM_DT = ""; }
		if(OIFRM_DT == null) { OIFRM_DT = ""; }
		if(EXAM_DR == null) { EXAM_DR = ""; }
		if(ORAL_DR == null) { ORAL_DR = ""; }
		if(EPNJN_YN == null) { EPNJN_YN = ""; }
		if(OPNJN_YN == null) { OPNJN_YN = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(ORAL_YN == null) { ORAL_YN = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uStdt_Pnjn_UP_StdtPnjn_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Pnjn_UP_StdtPnjn_Save_001 \n";
			G_INFO += "설명 : 학생 검진 판정 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " PNJN_TT : " + PNJN_TT + " \n";
			G_INFO += " PNJN_01 : " + PNJN_01 + " \n";
			G_INFO += " PNJN_02 : " + PNJN_02 + " \n";
			G_INFO += " PNJN_03 : " + PNJN_03 + " \n";
			G_INFO += " PNJN_04 : " + PNJN_04 + " \n";
			G_INFO += " PNJN_05 : " + PNJN_05 + " \n";
			G_INFO += " PNJN_06 : " + PNJN_06 + " \n";
			G_INFO += " PNJN_07 : " + PNJN_07 + " \n";
			G_INFO += " PNJN_08 : " + PNJN_08 + " \n";
			G_INFO += " PNJN_09 : " + PNJN_09 + " \n";
			G_INFO += " PNJN_10 : " + PNJN_10 + " \n";
			G_INFO += " PNJN_11 : " + PNJN_11 + " \n";
			G_INFO += " PNJN_12 : " + PNJN_12 + " \n";
			G_INFO += " PNJN_13 : " + PNJN_13 + " \n";
			G_INFO += " PNJN_14 : " + PNJN_14 + " \n";
			G_INFO += " QST_01 : " + QST_01 + " \n";
			G_INFO += " QST_02 : " + QST_02 + " \n";
			G_INFO += " QST_03 : " + QST_03 + " \n";
			G_INFO += " QST_04 : " + QST_04 + " \n";
			G_INFO += " EXAM_VIEW : " + EXAM_VIEW + " \n";
			G_INFO += " EXAM_ACT : " + EXAM_ACT + " \n";
			G_INFO += " ORAL_VIEW : " + ORAL_VIEW + " \n";
			G_INFO += " ORAL_ACT : " + ORAL_ACT + " \n";
			G_INFO += " EIFRM_DT : " + EIFRM_DT + " \n";
			G_INFO += " OIFRM_DT : " + OIFRM_DT + " \n";
			G_INFO += " EXAM_DR : " + EXAM_DR + " \n";
			G_INFO += " ORAL_DR : " + ORAL_DR + " \n";
			G_INFO += " EPNJN_YN : " + EPNJN_YN + " \n";
			G_INFO += " OPNJN_YN : " + OPNJN_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " ORAL_YN : " + ORAL_YN + " \n";
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
