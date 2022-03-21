<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSP_DOCT_PJ_APPLY_UF_Save_001.jsp"%>
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

		String GSMODE = htMethod.get("GSMODE");
		String BKMK_CD = htMethod.get("BKMK_CD");
		String BKMK_NM = htMethod.get("BKMK_NM");
		String MATT_CD = htMethod.get("MATT_CD");
		String ORGA_CD = htMethod.get("ORGA_CD");
		String ORSU_CD = htMethod.get("ORSU_CD");
		String PANJ_CD = htMethod.get("PANJ_CD");
		String SOKY_CD = htMethod.get("SOKY_CD");
		String SOKY_NM = htMethod.get("SOKY_NM");
		String SOKY_TX = htMethod.get("SOKY_TX");
		String JOCHI_CD = htMethod.get("JOCHI_CD");
		String JOCHI_NM = htMethod.get("JOCHI_NM");
		String JILH_CD = htMethod.get("JILH_CD");
		String POSM1_CD = htMethod.get("POSM1_CD");
		String POSM2_CD = htMethod.get("POSM2_CD");
		String POSM3_CD = htMethod.get("POSM3_CD");
		String POSM1_TX = htMethod.get("POSM1_TX");
		String POSM2_TX = htMethod.get("POSM2_TX");
		String POSM3_TX = htMethod.get("POSM3_TX");
		String POSM1_DT = htMethod.get("POSM1_DT");
		String POSM2_DT = htMethod.get("POSM2_DT");
		String POSM3_DT = htMethod.get("POSM3_DT");
		String BUSI_CD = htMethod.get("BUSI_CD");
		String USER_ID = htMethod.get("USER_ID");
		String USE_YN = htMethod.get("USE_YN");

		//
		if(GSMODE == null) { GSMODE = ""; }
		if(BKMK_CD == null) { BKMK_CD = ""; }
		if(BKMK_NM == null) { BKMK_NM = ""; }
		if(MATT_CD == null) { MATT_CD = ""; }
		if(ORGA_CD == null) { ORGA_CD = ""; }
		if(ORSU_CD == null) { ORSU_CD = ""; }
		if(PANJ_CD == null) { PANJ_CD = ""; }
		if(SOKY_CD == null) { SOKY_CD = ""; }
		if(SOKY_NM == null) { SOKY_NM = ""; }
		if(SOKY_TX == null) { SOKY_TX = ""; }
		if(JOCHI_CD == null) { JOCHI_CD = ""; }
		if(JOCHI_NM == null) { JOCHI_NM = ""; }
		if(JILH_CD == null) { JILH_CD = ""; }
		if(POSM1_CD == null) { POSM1_CD = ""; }
		if(POSM2_CD == null) { POSM2_CD = ""; }
		if(POSM3_CD == null) { POSM3_CD = ""; }
		if(POSM1_TX == null) { POSM1_TX = ""; }
		if(POSM2_TX == null) { POSM2_TX = ""; }
		if(POSM3_TX == null) { POSM3_TX = ""; }
		if(POSM1_DT == null) { POSM1_DT = ""; }
		if(POSM2_DT == null) { POSM2_DT = ""; }
		if(POSM3_DT == null) { POSM3_DT = ""; }
		if(BUSI_CD == null) { BUSI_CD = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(USE_YN == null) { USE_YN = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSP_DOCT_PJ_APPLY_UF_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_DOCT_PJ_APPLY_UF_Save_001 \n";
			G_INFO += "설명 : 자주쓰는판정 저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " GSMODE : " + GSMODE + " \n";
			G_INFO += " BKMK_CD : " + BKMK_CD + " \n";
			G_INFO += " BKMK_NM : " + BKMK_NM + " \n";
			G_INFO += " MATT_CD : " + MATT_CD + " \n";
			G_INFO += " ORGA_CD : " + ORGA_CD + " \n";
			G_INFO += " ORSU_CD : " + ORSU_CD + " \n";
			G_INFO += " PANJ_CD : " + PANJ_CD + " \n";
			G_INFO += " SOKY_CD : " + SOKY_CD + " \n";
			G_INFO += " SOKY_NM : " + SOKY_NM + " \n";
			G_INFO += " SOKY_TX : " + SOKY_TX + " \n";
			G_INFO += " JOCHI_CD : " + JOCHI_CD + " \n";
			G_INFO += " JOCHI_NM : " + JOCHI_NM + " \n";
			G_INFO += " JILH_CD : " + JILH_CD + " \n";
			G_INFO += " POSM1_CD : " + POSM1_CD + " \n";
			G_INFO += " POSM2_CD : " + POSM2_CD + " \n";
			G_INFO += " POSM3_CD : " + POSM3_CD + " \n";
			G_INFO += " POSM1_TX : " + POSM1_TX + " \n";
			G_INFO += " POSM2_TX : " + POSM2_TX + " \n";
			G_INFO += " POSM3_TX : " + POSM3_TX + " \n";
			G_INFO += " POSM1_DT : " + POSM1_DT + " \n";
			G_INFO += " POSM2_DT : " + POSM2_DT + " \n";
			G_INFO += " POSM3_DT : " + POSM3_DT + " \n";
			G_INFO += " BUSI_CD : " + BUSI_CD + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
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
