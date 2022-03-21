<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSp_Health_Autopan_Set_BtnSaveClick_002.jsp"%>
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

		String SMODE = htMethod.get("SMODE");
		String AUTO_CD = htMethod.get("AUTO_CD");
		String ORGA_CD = htMethod.get("ORGA_CD");
		String SOKY_CD = htMethod.get("SOKY_CD");
		String JOCH_CD = htMethod.get("JOCH_CD");
		String SOKY_TX = htMethod.get("SOKY_TX");
		String JOCH_TX = htMethod.get("JOCH_TX");
		String PANJ_CD = htMethod.get("PANJ_CD");
		String ORSU_CD = htMethod.get("ORSU_CD");
		String SADD_TX = htMethod.get("SADD_TX");
		String BUSI_CD = htMethod.get("BUSI_CD");
		String POSM1_CD = htMethod.get("POSM1_CD");
		String POSM2_CD = htMethod.get("POSM2_CD");
		String POSM3_CD = htMethod.get("POSM3_CD");
		String BIGO_TX = htMethod.get("BIGO_TX");
		String SPCL_CD = htMethod.get("SPCL_CD");
		String USE_YN = htMethod.get("USE_YN");
		String INPT_ID = htMethod.get("INPT_ID");
		String SWING_CD = htMethod.get("SWING_CD");
		String MODI_ID = htMethod.get("MODI_ID");

		//
		if(SMODE == null) { SMODE = ""; }
		if(AUTO_CD == null) { AUTO_CD = ""; }
		if(ORGA_CD == null) { ORGA_CD = ""; }
		if(SOKY_CD == null) { SOKY_CD = ""; }
		if(JOCH_CD == null) { JOCH_CD = ""; }
		if(SOKY_TX == null) { SOKY_TX = ""; }
		if(JOCH_TX == null) { JOCH_TX = ""; }
		if(PANJ_CD == null) { PANJ_CD = ""; }
		if(ORSU_CD == null) { ORSU_CD = ""; }
		if(SADD_TX == null) { SADD_TX = ""; }
		if(BUSI_CD == null) { BUSI_CD = ""; }
		if(POSM1_CD == null) { POSM1_CD = ""; }
		if(POSM2_CD == null) { POSM2_CD = ""; }
		if(POSM3_CD == null) { POSM3_CD = ""; }
		if(BIGO_TX == null) { BIGO_TX = ""; }
		if(SPCL_CD == null) { SPCL_CD = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(SWING_CD == null) { SWING_CD = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSp_Health_Autopan_Set_BtnSaveClick_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSp_Health_Autopan_Set_BtnSaveClick_002 \n";
			G_INFO += "설명 : 특검 판정정보 추가/수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " AUTO_CD : " + AUTO_CD + " \n";
			G_INFO += " ORGA_CD : " + ORGA_CD + " \n";
			G_INFO += " SOKY_CD : " + SOKY_CD + " \n";
			G_INFO += " JOCH_CD : " + JOCH_CD + " \n";
			G_INFO += " SOKY_TX : " + SOKY_TX + " \n";
			G_INFO += " JOCH_TX : " + JOCH_TX + " \n";
			G_INFO += " PANJ_CD : " + PANJ_CD + " \n";
			G_INFO += " ORSU_CD : " + ORSU_CD + " \n";
			G_INFO += " SADD_TX : " + SADD_TX + " \n";
			G_INFO += " BUSI_CD : " + BUSI_CD + " \n";
			G_INFO += " POSM1_CD : " + POSM1_CD + " \n";
			G_INFO += " POSM2_CD : " + POSM2_CD + " \n";
			G_INFO += " POSM3_CD : " + POSM3_CD + " \n";
			G_INFO += " BIGO_TX : " + BIGO_TX + " \n";
			G_INFO += " SPCL_CD : " + SPCL_CD + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " SWING_CD : " + SWING_CD + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
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
