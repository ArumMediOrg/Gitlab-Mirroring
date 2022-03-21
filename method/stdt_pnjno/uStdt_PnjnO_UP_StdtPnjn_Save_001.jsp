<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uStdt_PnjnO_UP_StdtPnjn_Save_001.jsp"%>
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
		String QST_DIAG = htMethod.get("QST_DIAG");
		String QST_DRUG = htMethod.get("QST_DRUG");
		String QST_STAT = htMethod.get("QST_STAT");
		String QST_HABIT = htMethod.get("QST_HABIT");
		String QST_INJURE = htMethod.get("QST_INJURE");
		String QST_DRUNK = htMethod.get("QST_DRUNK");
		String QST_SMOKE = htMethod.get("QST_SMOKE");
		String QST_SPORT = htMethod.get("QST_SPORT");
		String QST_WEIGHT = htMethod.get("QST_WEIGHT");
		String PNJNB_1 = htMethod.get("PNJNB_1");
		String PNJNB_2 = htMethod.get("PNJNB_2");
		String PNJNB_3 = htMethod.get("PNJNB_3");
		String PNJNB_4 = htMethod.get("PNJNB_4");
		String PNJNB_5 = htMethod.get("PNJNB_5");
		String PNJNB_6 = htMethod.get("PNJNB_6");
		String PNJNB_7 = htMethod.get("PNJNB_7");
		String PNJNB_ETC = htMethod.get("PNJNB_ETC");
		String PNJNB_ETC2 = htMethod.get("PNJNB_ETC2");
		String PNJNR_1 = htMethod.get("PNJNR_1");
		String PNJNR_2 = htMethod.get("PNJNR_2");
		String PNJNR_3 = htMethod.get("PNJNR_3");
		String PNJNR_4 = htMethod.get("PNJNR_4");
		String PNJNR_5 = htMethod.get("PNJNR_5");
		String PNJNR_6 = htMethod.get("PNJNR_6");
		String PNJNR_7 = htMethod.get("PNJNR_7");
		String PNJNR_8 = htMethod.get("PNJNR_8");
		String PNJNR_ETC = htMethod.get("PNJNR_ETC");
		String PNJNR_ETC2 = htMethod.get("PNJNR_ETC2");
		String PNJNRD_1 = htMethod.get("PNJNRD_1");
		String PNJNRD_2 = htMethod.get("PNJNRD_2");
		String PNJNRD_3 = htMethod.get("PNJNRD_3");
		String PNJNRD_4 = htMethod.get("PNJNRD_4");
		String PNJN_A = htMethod.get("PNJN_A");
		String PNJN_B = htMethod.get("PNJN_B");
		String PNJN_R = htMethod.get("PNJN_R");
		String PNJN_RD = htMethod.get("PNJN_RD");
		String PNJN_ORAL = htMethod.get("PNJN_ORAL");
		String EXAM_VIEW = htMethod.get("EXAM_VIEW");
		String EXAM_ACT = htMethod.get("EXAM_ACT");
		String ORAL_VIEW = htMethod.get("ORAL_VIEW");
		String ORAL_ACT = htMethod.get("ORAL_ACT");
		String EPNJN_DT = htMethod.get("EPNJN_DT");
		String OPNJN_DT = htMethod.get("OPNJN_DT");
		String EIFRM_DT = htMethod.get("EIFRM_DT");
		String OIFRM_DT = htMethod.get("OIFRM_DT");
		String EXAM_DR = htMethod.get("EXAM_DR");
		String ORAL_DR = htMethod.get("ORAL_DR");
		String EPNJN_YN = htMethod.get("EPNJN_YN");
		String OPNJN_YN = htMethod.get("OPNJN_YN");
		String CHUNG_YN = htMethod.get("CHUNG_YN");
		String USER_ID = htMethod.get("USER_ID");
		String PNJNB_8 = htMethod.get("PNJNB_8");
		String PNJNR_9 = htMethod.get("PNJNR_9");
		String ADD_VIEW = htMethod.get("ADD_VIEW");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(QST_DIAG == null) { QST_DIAG = ""; }
		if(QST_DRUG == null) { QST_DRUG = ""; }
		if(QST_STAT == null) { QST_STAT = ""; }
		if(QST_HABIT == null) { QST_HABIT = ""; }
		if(QST_INJURE == null) { QST_INJURE = ""; }
		if(QST_DRUNK == null) { QST_DRUNK = ""; }
		if(QST_SMOKE == null) { QST_SMOKE = ""; }
		if(QST_SPORT == null) { QST_SPORT = ""; }
		if(QST_WEIGHT == null) { QST_WEIGHT = ""; }
		if(PNJNB_1 == null) { PNJNB_1 = ""; }
		if(PNJNB_2 == null) { PNJNB_2 = ""; }
		if(PNJNB_3 == null) { PNJNB_3 = ""; }
		if(PNJNB_4 == null) { PNJNB_4 = ""; }
		if(PNJNB_5 == null) { PNJNB_5 = ""; }
		if(PNJNB_6 == null) { PNJNB_6 = ""; }
		if(PNJNB_7 == null) { PNJNB_7 = ""; }
		if(PNJNB_ETC == null) { PNJNB_ETC = ""; }
		if(PNJNB_ETC2 == null) { PNJNB_ETC2 = ""; }
		if(PNJNR_1 == null) { PNJNR_1 = ""; }
		if(PNJNR_2 == null) { PNJNR_2 = ""; }
		if(PNJNR_3 == null) { PNJNR_3 = ""; }
		if(PNJNR_4 == null) { PNJNR_4 = ""; }
		if(PNJNR_5 == null) { PNJNR_5 = ""; }
		if(PNJNR_6 == null) { PNJNR_6 = ""; }
		if(PNJNR_7 == null) { PNJNR_7 = ""; }
		if(PNJNR_8 == null) { PNJNR_8 = ""; }
		if(PNJNR_ETC == null) { PNJNR_ETC = ""; }
		if(PNJNR_ETC2 == null) { PNJNR_ETC2 = ""; }
		if(PNJNRD_1 == null) { PNJNRD_1 = ""; }
		if(PNJNRD_2 == null) { PNJNRD_2 = ""; }
		if(PNJNRD_3 == null) { PNJNRD_3 = ""; }
		if(PNJNRD_4 == null) { PNJNRD_4 = ""; }
		if(PNJN_A == null) { PNJN_A = ""; }
		if(PNJN_B == null) { PNJN_B = ""; }
		if(PNJN_R == null) { PNJN_R = ""; }
		if(PNJN_RD == null) { PNJN_RD = ""; }
		if(PNJN_ORAL == null) { PNJN_ORAL = ""; }
		if(EXAM_VIEW == null) { EXAM_VIEW = ""; }
		if(EXAM_ACT == null) { EXAM_ACT = ""; }
		if(ORAL_VIEW == null) { ORAL_VIEW = ""; }
		if(ORAL_ACT == null) { ORAL_ACT = ""; }
		if(EPNJN_DT == null) { EPNJN_DT = ""; }
		if(OPNJN_DT == null) { OPNJN_DT = ""; }
		if(EIFRM_DT == null) { EIFRM_DT = ""; }
		if(OIFRM_DT == null) { OIFRM_DT = ""; }
		if(EXAM_DR == null) { EXAM_DR = ""; }
		if(ORAL_DR == null) { ORAL_DR = ""; }
		if(EPNJN_YN == null) { EPNJN_YN = ""; }
		if(OPNJN_YN == null) { OPNJN_YN = ""; }
		if(CHUNG_YN == null) { CHUNG_YN = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(PNJNB_8 == null) { PNJNB_8 = ""; }
		if(PNJNR_9 == null) { PNJNR_9 = ""; }
		if(ADD_VIEW == null) { ADD_VIEW = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uStdt_PnjnO_UP_StdtPnjn_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_PnjnO_UP_StdtPnjn_Save_001 \n";
			G_INFO += "설명 : 학교밖청소년 판정 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " QST_DIAG : " + QST_DIAG + " \n";
			G_INFO += " QST_DRUG : " + QST_DRUG + " \n";
			G_INFO += " QST_STAT : " + QST_STAT + " \n";
			G_INFO += " QST_HABIT : " + QST_HABIT + " \n";
			G_INFO += " QST_INJURE : " + QST_INJURE + " \n";
			G_INFO += " QST_DRUNK : " + QST_DRUNK + " \n";
			G_INFO += " QST_SMOKE : " + QST_SMOKE + " \n";
			G_INFO += " QST_SPORT : " + QST_SPORT + " \n";
			G_INFO += " QST_WEIGHT : " + QST_WEIGHT + " \n";
			G_INFO += " PNJNB_1 : " + PNJNB_1 + " \n";
			G_INFO += " PNJNB_2 : " + PNJNB_2 + " \n";
			G_INFO += " PNJNB_3 : " + PNJNB_3 + " \n";
			G_INFO += " PNJNB_4 : " + PNJNB_4 + " \n";
			G_INFO += " PNJNB_5 : " + PNJNB_5 + " \n";
			G_INFO += " PNJNB_6 : " + PNJNB_6 + " \n";
			G_INFO += " PNJNB_7 : " + PNJNB_7 + " \n";
			G_INFO += " PNJNB_ETC : " + PNJNB_ETC + " \n";
			G_INFO += " PNJNB_ETC2 : " + PNJNB_ETC2 + " \n";
			G_INFO += " PNJNR_1 : " + PNJNR_1 + " \n";
			G_INFO += " PNJNR_2 : " + PNJNR_2 + " \n";
			G_INFO += " PNJNR_3 : " + PNJNR_3 + " \n";
			G_INFO += " PNJNR_4 : " + PNJNR_4 + " \n";
			G_INFO += " PNJNR_5 : " + PNJNR_5 + " \n";
			G_INFO += " PNJNR_6 : " + PNJNR_6 + " \n";
			G_INFO += " PNJNR_7 : " + PNJNR_7 + " \n";
			G_INFO += " PNJNR_8 : " + PNJNR_8 + " \n";
			G_INFO += " PNJNR_ETC : " + PNJNR_ETC + " \n";
			G_INFO += " PNJNR_ETC2 : " + PNJNR_ETC2 + " \n";
			G_INFO += " PNJNRD_1 : " + PNJNRD_1 + " \n";
			G_INFO += " PNJNRD_2 : " + PNJNRD_2 + " \n";
			G_INFO += " PNJNRD_3 : " + PNJNRD_3 + " \n";
			G_INFO += " PNJNRD_4 : " + PNJNRD_4 + " \n";
			G_INFO += " PNJN_A : " + PNJN_A + " \n";
			G_INFO += " PNJN_B : " + PNJN_B + " \n";
			G_INFO += " PNJN_R : " + PNJN_R + " \n";
			G_INFO += " PNJN_RD : " + PNJN_RD + " \n";
			G_INFO += " PNJN_ORAL : " + PNJN_ORAL + " \n";
			G_INFO += " EXAM_VIEW : " + EXAM_VIEW + " \n";
			G_INFO += " EXAM_ACT : " + EXAM_ACT + " \n";
			G_INFO += " ORAL_VIEW : " + ORAL_VIEW + " \n";
			G_INFO += " ORAL_ACT : " + ORAL_ACT + " \n";
			G_INFO += " EPNJN_DT : " + EPNJN_DT + " \n";
			G_INFO += " OPNJN_DT : " + OPNJN_DT + " \n";
			G_INFO += " EIFRM_DT : " + EIFRM_DT + " \n";
			G_INFO += " OIFRM_DT : " + OIFRM_DT + " \n";
			G_INFO += " EXAM_DR : " + EXAM_DR + " \n";
			G_INFO += " ORAL_DR : " + ORAL_DR + " \n";
			G_INFO += " EPNJN_YN : " + EPNJN_YN + " \n";
			G_INFO += " OPNJN_YN : " + OPNJN_YN + " \n";
			G_INFO += " CHUNG_YN : " + CHUNG_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " PNJNB_8 : " + PNJNB_8 + " \n";
			G_INFO += " PNJNR_9 : " + PNJNR_9 + " \n";
			G_INFO += " ADD_VIEW : " + ADD_VIEW + " \n";
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
