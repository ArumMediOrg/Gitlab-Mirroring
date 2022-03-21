<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uLife_Panj_upSavePtLifePrescr_002.jsp"%>
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

		String SSAVEMODE = htMethod.get("SSAVEMODE");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String SMK_1 = htMethod.get("SMK_1");
		String SMK_2 = htMethod.get("SMK_2");
		String SMK_3 = htMethod.get("SMK_3");
		String SMK_4 = htMethod.get("SMK_4");
		String SMK_4_TX = htMethod.get("SMK_4_TX");
		String SMK_5 = htMethod.get("SMK_5");
		String SMK_6 = htMethod.get("SMK_6");
		String SMK_6_TX = htMethod.get("SMK_6_TX");
		String DRK_PR1 = htMethod.get("DRK_PR1");
		String DRK_PR1_YN = htMethod.get("DRK_PR1_YN");
		String DRK_PR2 = htMethod.get("DRK_PR2");
		String DRK_PR2_TX = htMethod.get("DRK_PR2_TX");
		String DRK_1 = htMethod.get("DRK_1");
		String DRK_2 = htMethod.get("DRK_2");
		String DRK_3 = htMethod.get("DRK_3");
		String DRK_3_TX = htMethod.get("DRK_3_TX");
		String EXCS_1 = htMethod.get("EXCS_1");
		String EXCS_2_1 = htMethod.get("EXCS_2_1");
		String EXCS_2_1_TX = htMethod.get("EXCS_2_1_TX");
		String EXCS_2_2 = htMethod.get("EXCS_2_2");
		String EXCS_2_2_TX = htMethod.get("EXCS_2_2_TX");
		String EXCS_2_3 = htMethod.get("EXCS_2_3");
		String EXCS_3 = htMethod.get("EXCS_3");
		String EXCS_3_TX = htMethod.get("EXCS_3_TX");
		String EXCS_4 = htMethod.get("EXCS_4");
		String EXCS_4_TX = htMethod.get("EXCS_4_TX");
		String NUTR_1 = htMethod.get("NUTR_1");
		String NUTR_2 = htMethod.get("NUTR_2");
		String NUTR_3 = htMethod.get("NUTR_3");
		String NUTR_3_TX = htMethod.get("NUTR_3_TX");
		String NUTR_4 = htMethod.get("NUTR_4");
		String NUTR_4_TX = htMethod.get("NUTR_4_TX");
		String FAT_1 = htMethod.get("FAT_1");
		String FAT_2 = htMethod.get("FAT_2");
		String FAT_3 = htMethod.get("FAT_3");
		String FAT_4 = htMethod.get("FAT_4");
		String FAT_4_1 = htMethod.get("FAT_4_1");
		String FAT_4_2 = htMethod.get("FAT_4_2");
		String FAT_4_3 = htMethod.get("FAT_4_3");
		String FAT_4_4 = htMethod.get("FAT_4_4");
		String FAT_5 = htMethod.get("FAT_5");
		String FAT_5_TX = htMethod.get("FAT_5_TX");
		String FAT_6 = htMethod.get("FAT_6");
		String FAT_6_TX = htMethod.get("FAT_6_TX");
		String FAT_7 = htMethod.get("FAT_7");
		String FAT_7_TX = htMethod.get("FAT_7_TX");
		String USER_ID = htMethod.get("USER_ID");

		//
		if(SSAVEMODE == null) { SSAVEMODE = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(SMK_1 == null) { SMK_1 = ""; }
		if(SMK_2 == null) { SMK_2 = ""; }
		if(SMK_3 == null) { SMK_3 = ""; }
		if(SMK_4 == null) { SMK_4 = ""; }
		if(SMK_4_TX == null) { SMK_4_TX = ""; }
		if(SMK_5 == null) { SMK_5 = ""; }
		if(SMK_6 == null) { SMK_6 = ""; }
		if(SMK_6_TX == null) { SMK_6_TX = ""; }
		if(DRK_PR1 == null) { DRK_PR1 = ""; }
		if(DRK_PR1_YN == null) { DRK_PR1_YN = ""; }
		if(DRK_PR2 == null) { DRK_PR2 = ""; }
		if(DRK_PR2_TX == null) { DRK_PR2_TX = ""; }
		if(DRK_1 == null) { DRK_1 = ""; }
		if(DRK_2 == null) { DRK_2 = ""; }
		if(DRK_3 == null) { DRK_3 = ""; }
		if(DRK_3_TX == null) { DRK_3_TX = ""; }
		if(EXCS_1 == null) { EXCS_1 = ""; }
		if(EXCS_2_1 == null) { EXCS_2_1 = ""; }
		if(EXCS_2_1_TX == null) { EXCS_2_1_TX = ""; }
		if(EXCS_2_2 == null) { EXCS_2_2 = ""; }
		if(EXCS_2_2_TX == null) { EXCS_2_2_TX = ""; }
		if(EXCS_2_3 == null) { EXCS_2_3 = ""; }
		if(EXCS_3 == null) { EXCS_3 = ""; }
		if(EXCS_3_TX == null) { EXCS_3_TX = ""; }
		if(EXCS_4 == null) { EXCS_4 = ""; }
		if(EXCS_4_TX == null) { EXCS_4_TX = ""; }
		if(NUTR_1 == null) { NUTR_1 = ""; }
		if(NUTR_2 == null) { NUTR_2 = ""; }
		if(NUTR_3 == null) { NUTR_3 = ""; }
		if(NUTR_3_TX == null) { NUTR_3_TX = ""; }
		if(NUTR_4 == null) { NUTR_4 = ""; }
		if(NUTR_4_TX == null) { NUTR_4_TX = ""; }
		if(FAT_1 == null) { FAT_1 = ""; }
		if(FAT_2 == null) { FAT_2 = ""; }
		if(FAT_3 == null) { FAT_3 = ""; }
		if(FAT_4 == null) { FAT_4 = ""; }
		if(FAT_4_1 == null) { FAT_4_1 = ""; }
		if(FAT_4_2 == null) { FAT_4_2 = ""; }
		if(FAT_4_3 == null) { FAT_4_3 = ""; }
		if(FAT_4_4 == null) { FAT_4_4 = ""; }
		if(FAT_5 == null) { FAT_5 = ""; }
		if(FAT_5_TX == null) { FAT_5_TX = ""; }
		if(FAT_6 == null) { FAT_6 = ""; }
		if(FAT_6_TX == null) { FAT_6_TX = ""; }
		if(FAT_7 == null) { FAT_7 = ""; }
		if(FAT_7_TX == null) { FAT_7_TX = ""; }
		if(USER_ID == null) { USER_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uLife_Panj_upSavePtLifePrescr_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uLife_Panj_upSavePtLifePrescr_002 \n";
			G_INFO += "설명 : 생활습관처방 저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSAVEMODE : " + SSAVEMODE + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " SMK_1 : " + SMK_1 + " \n";
			G_INFO += " SMK_2 : " + SMK_2 + " \n";
			G_INFO += " SMK_3 : " + SMK_3 + " \n";
			G_INFO += " SMK_4 : " + SMK_4 + " \n";
			G_INFO += " SMK_4_TX : " + SMK_4_TX + " \n";
			G_INFO += " SMK_5 : " + SMK_5 + " \n";
			G_INFO += " SMK_6 : " + SMK_6 + " \n";
			G_INFO += " SMK_6_TX : " + SMK_6_TX + " \n";
			G_INFO += " DRK_PR1 : " + DRK_PR1 + " \n";
			G_INFO += " DRK_PR1_YN : " + DRK_PR1_YN + " \n";
			G_INFO += " DRK_PR2 : " + DRK_PR2 + " \n";
			G_INFO += " DRK_PR2_TX : " + DRK_PR2_TX + " \n";
			G_INFO += " DRK_1 : " + DRK_1 + " \n";
			G_INFO += " DRK_2 : " + DRK_2 + " \n";
			G_INFO += " DRK_3 : " + DRK_3 + " \n";
			G_INFO += " DRK_3_TX : " + DRK_3_TX + " \n";
			G_INFO += " EXCS_1 : " + EXCS_1 + " \n";
			G_INFO += " EXCS_2_1 : " + EXCS_2_1 + " \n";
			G_INFO += " EXCS_2_1_TX : " + EXCS_2_1_TX + " \n";
			G_INFO += " EXCS_2_2 : " + EXCS_2_2 + " \n";
			G_INFO += " EXCS_2_2_TX : " + EXCS_2_2_TX + " \n";
			G_INFO += " EXCS_2_3 : " + EXCS_2_3 + " \n";
			G_INFO += " EXCS_3 : " + EXCS_3 + " \n";
			G_INFO += " EXCS_3_TX : " + EXCS_3_TX + " \n";
			G_INFO += " EXCS_4 : " + EXCS_4 + " \n";
			G_INFO += " EXCS_4_TX : " + EXCS_4_TX + " \n";
			G_INFO += " NUTR_1 : " + NUTR_1 + " \n";
			G_INFO += " NUTR_2 : " + NUTR_2 + " \n";
			G_INFO += " NUTR_3 : " + NUTR_3 + " \n";
			G_INFO += " NUTR_3_TX : " + NUTR_3_TX + " \n";
			G_INFO += " NUTR_4 : " + NUTR_4 + " \n";
			G_INFO += " NUTR_4_TX : " + NUTR_4_TX + " \n";
			G_INFO += " FAT_1 : " + FAT_1 + " \n";
			G_INFO += " FAT_2 : " + FAT_2 + " \n";
			G_INFO += " FAT_3 : " + FAT_3 + " \n";
			G_INFO += " FAT_4 : " + FAT_4 + " \n";
			G_INFO += " FAT_4_1 : " + FAT_4_1 + " \n";
			G_INFO += " FAT_4_2 : " + FAT_4_2 + " \n";
			G_INFO += " FAT_4_3 : " + FAT_4_3 + " \n";
			G_INFO += " FAT_4_4 : " + FAT_4_4 + " \n";
			G_INFO += " FAT_5 : " + FAT_5 + " \n";
			G_INFO += " FAT_5_TX : " + FAT_5_TX + " \n";
			G_INFO += " FAT_6 : " + FAT_6 + " \n";
			G_INFO += " FAT_6_TX : " + FAT_6_TX + " \n";
			G_INFO += " FAT_7 : " + FAT_7 + " \n";
			G_INFO += " FAT_7_TX : " + FAT_7_TX + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
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
