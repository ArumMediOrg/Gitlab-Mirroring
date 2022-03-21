<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSP_Health_BtnSave_DentalClick_002.jsp"%>
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
		String EXAM_CHA = htMethod.get("EXAM_CHA");
		String GUL7_YN = htMethod.get("GUL7_YN");
		String GUL6_YN = htMethod.get("GUL6_YN");
		String GUL5_YN = htMethod.get("GUL5_YN");
		String GUL4_YN = htMethod.get("GUL4_YN");
		String GUL3_YN = htMethod.get("GUL3_YN");
		String GUL2_YN = htMethod.get("GUL2_YN");
		String GUL1_YN = htMethod.get("GUL1_YN");
		String GUR1_YN = htMethod.get("GUR1_YN");
		String GUR2_YN = htMethod.get("GUR2_YN");
		String GUR3_YN = htMethod.get("GUR3_YN");
		String GUR4_YN = htMethod.get("GUR4_YN");
		String GUR5_YN = htMethod.get("GUR5_YN");
		String GUR6_YN = htMethod.get("GUR6_YN");
		String GUR7_YN = htMethod.get("GUR7_YN");
		String GUR8_YN = htMethod.get("GUR8_YN");
		String GDL7_YN = htMethod.get("GDL7_YN");
		String GDL6_YN = htMethod.get("GDL6_YN");
		String GDL5_YN = htMethod.get("GDL5_YN");
		String GDL4_YN = htMethod.get("GDL4_YN");
		String GDL3_YN = htMethod.get("GDL3_YN");
		String GDL2_YN = htMethod.get("GDL2_YN");
		String GDL1_YN = htMethod.get("GDL1_YN");
		String GDR1_YN = htMethod.get("GDR1_YN");
		String GDR2_YN = htMethod.get("GDR2_YN");
		String GDR3_YN = htMethod.get("GDR3_YN");
		String GDR4_YN = htMethod.get("GDR4_YN");
		String GDR5_YN = htMethod.get("GDR5_YN");
		String GDR6_YN = htMethod.get("GDR6_YN");
		String GDR7_YN = htMethod.get("GDR7_YN");
		String GDR8_YN = htMethod.get("GDR8_YN");
		String BUL_YN = htMethod.get("BUL_YN");
		String BUF_YN = htMethod.get("BUF_YN");
		String BUR_YN = htMethod.get("BUR_YN");
		String BDL_YN = htMethod.get("BDL_YN");
		String BDF_YN = htMethod.get("BDF_YN");
		String BDR_YN = htMethod.get("BDR_YN");
		String BRSLT_TX = htMethod.get("BRSLT_TX");
		String DE0_YN = htMethod.get("DE0_YN");
		String DE1_YN = htMethod.get("DE1_YN");
		String DE2_YN = htMethod.get("DE2_YN");
		String DE3_YN = htMethod.get("DE3_YN");
		String DE4_YN = htMethod.get("DE4_YN");
		String DE5_YN = htMethod.get("DE5_YN");
		String PT0_YN = htMethod.get("PT0_YN");
		String PT1_YN = htMethod.get("PT1_YN");
		String PT2_YN = htMethod.get("PT2_YN");
		String PT3_YN = htMethod.get("PT3_YN");
		String PT4_YN = htMethod.get("PT4_YN");
		String P0_YN = htMethod.get("P0_YN");
		String P1_YN = htMethod.get("P1_YN");
		String P2_YN = htMethod.get("P2_YN");
		String P3_YN = htMethod.get("P3_YN");
		String P4_YN = htMethod.get("P4_YN");
		String P5_YN = htMethod.get("P5_YN");
		String P5_ETC = htMethod.get("P5_ETC");
		String DENT_DT = htMethod.get("DENT_DT");
		String HOSP_CD = htMethod.get("HOSP_CD");
		String USER_ID = htMethod.get("USER_ID");

		//
		if(SSAVEMODE == null) { SSAVEMODE = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(EXAM_CHA == null) { EXAM_CHA = ""; }
		if(GUL7_YN == null) { GUL7_YN = ""; }
		if(GUL6_YN == null) { GUL6_YN = ""; }
		if(GUL5_YN == null) { GUL5_YN = ""; }
		if(GUL4_YN == null) { GUL4_YN = ""; }
		if(GUL3_YN == null) { GUL3_YN = ""; }
		if(GUL2_YN == null) { GUL2_YN = ""; }
		if(GUL1_YN == null) { GUL1_YN = ""; }
		if(GUR1_YN == null) { GUR1_YN = ""; }
		if(GUR2_YN == null) { GUR2_YN = ""; }
		if(GUR3_YN == null) { GUR3_YN = ""; }
		if(GUR4_YN == null) { GUR4_YN = ""; }
		if(GUR5_YN == null) { GUR5_YN = ""; }
		if(GUR6_YN == null) { GUR6_YN = ""; }
		if(GUR7_YN == null) { GUR7_YN = ""; }
		if(GUR8_YN == null) { GUR8_YN = ""; }
		if(GDL7_YN == null) { GDL7_YN = ""; }
		if(GDL6_YN == null) { GDL6_YN = ""; }
		if(GDL5_YN == null) { GDL5_YN = ""; }
		if(GDL4_YN == null) { GDL4_YN = ""; }
		if(GDL3_YN == null) { GDL3_YN = ""; }
		if(GDL2_YN == null) { GDL2_YN = ""; }
		if(GDL1_YN == null) { GDL1_YN = ""; }
		if(GDR1_YN == null) { GDR1_YN = ""; }
		if(GDR2_YN == null) { GDR2_YN = ""; }
		if(GDR3_YN == null) { GDR3_YN = ""; }
		if(GDR4_YN == null) { GDR4_YN = ""; }
		if(GDR5_YN == null) { GDR5_YN = ""; }
		if(GDR6_YN == null) { GDR6_YN = ""; }
		if(GDR7_YN == null) { GDR7_YN = ""; }
		if(GDR8_YN == null) { GDR8_YN = ""; }
		if(BUL_YN == null) { BUL_YN = ""; }
		if(BUF_YN == null) { BUF_YN = ""; }
		if(BUR_YN == null) { BUR_YN = ""; }
		if(BDL_YN == null) { BDL_YN = ""; }
		if(BDF_YN == null) { BDF_YN = ""; }
		if(BDR_YN == null) { BDR_YN = ""; }
		if(BRSLT_TX == null) { BRSLT_TX = ""; }
		if(DE0_YN == null) { DE0_YN = ""; }
		if(DE1_YN == null) { DE1_YN = ""; }
		if(DE2_YN == null) { DE2_YN = ""; }
		if(DE3_YN == null) { DE3_YN = ""; }
		if(DE4_YN == null) { DE4_YN = ""; }
		if(DE5_YN == null) { DE5_YN = ""; }
		if(PT0_YN == null) { PT0_YN = ""; }
		if(PT1_YN == null) { PT1_YN = ""; }
		if(PT2_YN == null) { PT2_YN = ""; }
		if(PT3_YN == null) { PT3_YN = ""; }
		if(PT4_YN == null) { PT4_YN = ""; }
		if(P0_YN == null) { P0_YN = ""; }
		if(P1_YN == null) { P1_YN = ""; }
		if(P2_YN == null) { P2_YN = ""; }
		if(P3_YN == null) { P3_YN = ""; }
		if(P4_YN == null) { P4_YN = ""; }
		if(P5_YN == null) { P5_YN = ""; }
		if(P5_ETC == null) { P5_ETC = ""; }
		if(DENT_DT == null) { DENT_DT = ""; }
		if(HOSP_CD == null) { HOSP_CD = ""; }
		if(USER_ID == null) { USER_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSP_Health_BtnSave_DentalClick_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_BtnSave_DentalClick_002 \n";
			G_INFO += "설명 : 특검 치아판정 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSAVEMODE : " + SSAVEMODE + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " EXAM_CHA : " + EXAM_CHA + " \n";
			G_INFO += " GUL7_YN : " + GUL7_YN + " \n";
			G_INFO += " GUL6_YN : " + GUL6_YN + " \n";
			G_INFO += " GUL5_YN : " + GUL5_YN + " \n";
			G_INFO += " GUL4_YN : " + GUL4_YN + " \n";
			G_INFO += " GUL3_YN : " + GUL3_YN + " \n";
			G_INFO += " GUL2_YN : " + GUL2_YN + " \n";
			G_INFO += " GUL1_YN : " + GUL1_YN + " \n";
			G_INFO += " GUR1_YN : " + GUR1_YN + " \n";
			G_INFO += " GUR2_YN : " + GUR2_YN + " \n";
			G_INFO += " GUR3_YN : " + GUR3_YN + " \n";
			G_INFO += " GUR4_YN : " + GUR4_YN + " \n";
			G_INFO += " GUR5_YN : " + GUR5_YN + " \n";
			G_INFO += " GUR6_YN : " + GUR6_YN + " \n";
			G_INFO += " GUR7_YN : " + GUR7_YN + " \n";
			G_INFO += " GUR8_YN : " + GUR8_YN + " \n";
			G_INFO += " GDL7_YN : " + GDL7_YN + " \n";
			G_INFO += " GDL6_YN : " + GDL6_YN + " \n";
			G_INFO += " GDL5_YN : " + GDL5_YN + " \n";
			G_INFO += " GDL4_YN : " + GDL4_YN + " \n";
			G_INFO += " GDL3_YN : " + GDL3_YN + " \n";
			G_INFO += " GDL2_YN : " + GDL2_YN + " \n";
			G_INFO += " GDL1_YN : " + GDL1_YN + " \n";
			G_INFO += " GDR1_YN : " + GDR1_YN + " \n";
			G_INFO += " GDR2_YN : " + GDR2_YN + " \n";
			G_INFO += " GDR3_YN : " + GDR3_YN + " \n";
			G_INFO += " GDR4_YN : " + GDR4_YN + " \n";
			G_INFO += " GDR5_YN : " + GDR5_YN + " \n";
			G_INFO += " GDR6_YN : " + GDR6_YN + " \n";
			G_INFO += " GDR7_YN : " + GDR7_YN + " \n";
			G_INFO += " GDR8_YN : " + GDR8_YN + " \n";
			G_INFO += " BUL_YN : " + BUL_YN + " \n";
			G_INFO += " BUF_YN : " + BUF_YN + " \n";
			G_INFO += " BUR_YN : " + BUR_YN + " \n";
			G_INFO += " BDL_YN : " + BDL_YN + " \n";
			G_INFO += " BDF_YN : " + BDF_YN + " \n";
			G_INFO += " BDR_YN : " + BDR_YN + " \n";
			G_INFO += " BRSLT_TX : " + BRSLT_TX + " \n";
			G_INFO += " DE0_YN : " + DE0_YN + " \n";
			G_INFO += " DE1_YN : " + DE1_YN + " \n";
			G_INFO += " DE2_YN : " + DE2_YN + " \n";
			G_INFO += " DE3_YN : " + DE3_YN + " \n";
			G_INFO += " DE4_YN : " + DE4_YN + " \n";
			G_INFO += " DE5_YN : " + DE5_YN + " \n";
			G_INFO += " PT0_YN : " + PT0_YN + " \n";
			G_INFO += " PT1_YN : " + PT1_YN + " \n";
			G_INFO += " PT2_YN : " + PT2_YN + " \n";
			G_INFO += " PT3_YN : " + PT3_YN + " \n";
			G_INFO += " PT4_YN : " + PT4_YN + " \n";
			G_INFO += " P0_YN : " + P0_YN + " \n";
			G_INFO += " P1_YN : " + P1_YN + " \n";
			G_INFO += " P2_YN : " + P2_YN + " \n";
			G_INFO += " P3_YN : " + P3_YN + " \n";
			G_INFO += " P4_YN : " + P4_YN + " \n";
			G_INFO += " P5_YN : " + P5_YN + " \n";
			G_INFO += " P5_ETC : " + P5_ETC + " \n";
			G_INFO += " DENT_DT : " + DENT_DT + " \n";
			G_INFO += " HOSP_CD : " + HOSP_CD + " \n";
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
