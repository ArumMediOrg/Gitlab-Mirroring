<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSP_HealthPlan_btnSaveClick_001.jsp"%>
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

		String SGUBN = htMethod.get("SGUBN");
		String COMP_CD = htMethod.get("COMP_CD");
		String SAVE_DT = htMethod.get("SAVE_DT");
		String SAVE_SQ = htMethod.get("SAVE_SQ");
		String DEPT_SQ = htMethod.get("DEPT_SQ");
		String SAVE_NM = htMethod.get("SAVE_NM");
		String MANA_KD = htMethod.get("MANA_KD");
		String TOTAL_RMK = htMethod.get("TOTAL_RMK");
		String EXAMFR_DT = htMethod.get("EXAMFR_DT");
		String EXAMTO_DT = htMethod.get("EXAMTO_DT");
		String CHECKFR_DT = htMethod.get("CHECKFR_DT");
		String CHECKTO_DT = htMethod.get("CHECKTO_DT");
		String CHECK_NM = htMethod.get("CHECK_NM");
		String NOTI_DT = htMethod.get("NOTI_DT");
		String DOCT_ID = htMethod.get("DOCT_ID");
		String DOCT_NM = htMethod.get("DOCT_NM");
		String NUSE_ID = htMethod.get("NUSE_ID");
		String NUSE_NM = htMethod.get("NUSE_NM");
		String INPT_ID = htMethod.get("INPT_ID");
		String DEPT_NM = htMethod.get("DEPT_NM");
		String DANG_FAC = htMethod.get("DANG_FAC");
		String DEPT_RMK = htMethod.get("DEPT_RMK");
		String MODI_ID = htMethod.get("MODI_ID");

		//

		if(SGUBN == null) { SGUBN = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(SAVE_DT == null) { SAVE_DT = ""; }
		if(SAVE_SQ == null) { SAVE_SQ = ""; }
		if(DEPT_SQ == null) { DEPT_SQ = ""; }
		if(SAVE_NM == null) { SAVE_NM = ""; }
		if(MANA_KD == null) { MANA_KD = ""; }
		if(TOTAL_RMK == null) { TOTAL_RMK = ""; }
		if(EXAMFR_DT == null) { EXAMFR_DT = ""; }
		if(EXAMTO_DT == null) { EXAMTO_DT = ""; }
		if(CHECKFR_DT == null) { CHECKFR_DT = ""; }
		if(CHECKTO_DT == null) { CHECKTO_DT = ""; }
		if(CHECK_NM == null) { CHECK_NM = ""; }
		if(NOTI_DT == null) { NOTI_DT = ""; }
		if(DOCT_ID == null) { DOCT_ID = ""; }
		if(DOCT_NM == null) { DOCT_NM = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }
		if(NUSE_NM == null) { NUSE_NM = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(DEPT_NM == null) { DEPT_NM = ""; }
		if(DANG_FAC == null) { DANG_FAC = ""; }
		if(DEPT_RMK == null) { DEPT_RMK = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSP_HealthPlan_btnSaveClick_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HealthPlan_btnSaveClick_001 \n";
			G_INFO += "설명 : 데이터 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SGUBN : " + SGUBN + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " SAVE_DT : " + SAVE_DT + " \n";
			G_INFO += " SAVE_SQ : " + SAVE_SQ + " \n";
			G_INFO += " DEPT_SQ : " + DEPT_SQ + " \n";
			G_INFO += " SAVE_NM : " + SAVE_NM + " \n";
			G_INFO += " MANA_KD : " + MANA_KD + " \n";
			G_INFO += " TOTAL_RMK : " + TOTAL_RMK + " \n";
			G_INFO += " EXAMFR_DT : " + EXAMFR_DT + " \n";
			G_INFO += " EXAMTO_DT : " + EXAMTO_DT + " \n";
			G_INFO += " CHECKFR_DT : " + CHECKFR_DT + " \n";
			G_INFO += " CHECKTO_DT : " + CHECKTO_DT + " \n";
			G_INFO += " CHECK_NM : " + CHECK_NM + " \n";
			G_INFO += " NOTI_DT : " + NOTI_DT + " \n";
			G_INFO += " DOCT_ID : " + DOCT_ID + " \n";
			G_INFO += " DOCT_NM : " + DOCT_NM + " \n";
			G_INFO += " NUSE_ID : " + NUSE_ID + " \n";
			G_INFO += " NUSE_NM : " + NUSE_NM + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " DEPT_NM : " + DEPT_NM + " \n";
			G_INFO += " DANG_FAC : " + DANG_FAC + " \n";
			G_INFO += " DEPT_RMK : " + DEPT_RMK + " \n";
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
