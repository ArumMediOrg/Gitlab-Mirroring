<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uDental_Panj_ufDntlSave_002.jsp"%>
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

		String ICNT = htMethod.get("ICNT");
		String MJ01_KD = htMethod.get("MJ01_KD");
		String MJ02_KD = htMethod.get("MJ02_KD");
		String MJ03_KD = htMethod.get("MJ03_KD");
		String MJ04_KD = htMethod.get("MJ04_KD");
		String MJ05_KD = htMethod.get("MJ05_KD");
		String MJ06_KD = htMethod.get("MJ06_KD");
		String DT01_KD = htMethod.get("DT01_KD");
		String DT02_KD = htMethod.get("DT02_KD");
		String DT03_KD = htMethod.get("DT03_KD");
		String DT04_KD = htMethod.get("DT04_KD");
		String DJ01_KD = htMethod.get("DJ01_KD");
		String DJ02_KD = htMethod.get("DJ02_KD");
		String ETAL_EX = htMethod.get("ETAL_EX");
		String D401_VAL = htMethod.get("D401_VAL");
		String D402_VAL = htMethod.get("D402_VAL");
		String D403_VAL = htMethod.get("D403_VAL");
		String D404_VAL = htMethod.get("D404_VAL");
		String D405_VAL = htMethod.get("D405_VAL");
		String D406_VAL = htMethod.get("D406_VAL");
		String DTOT_VAL = htMethod.get("DTOT_VAL");
		String PANJ_CD = htMethod.get("PANJ_CD");
		String IMME_EX = htMethod.get("IMME_EX");
		String ACTI_EX = htMethod.get("ACTI_EX");
		String DOCT_CD = htMethod.get("DOCT_CD");
		String TOBO_DT = htMethod.get("TOBO_DT");
		String PANJ_DT = htMethod.get("PANJ_DT");
		String PANJ_YN = htMethod.get("PANJ_YN");
		String USER_ID = htMethod.get("USER_ID");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(ICNT == null) { ICNT = ""; }
		if(MJ01_KD == null) { MJ01_KD = ""; }
		if(MJ02_KD == null) { MJ02_KD = ""; }
		if(MJ03_KD == null) { MJ03_KD = ""; }
		if(MJ04_KD == null) { MJ04_KD = ""; }
		if(MJ05_KD == null) { MJ05_KD = ""; }
		if(MJ06_KD == null) { MJ06_KD = ""; }
		if(DT01_KD == null) { DT01_KD = ""; }
		if(DT02_KD == null) { DT02_KD = ""; }
		if(DT03_KD == null) { DT03_KD = ""; }
		if(DT04_KD == null) { DT04_KD = ""; }
		if(DJ01_KD == null) { DJ01_KD = ""; }
		if(DJ02_KD == null) { DJ02_KD = ""; }
		if(ETAL_EX == null) { ETAL_EX = ""; }
		if(D401_VAL == null) { D401_VAL = ""; }
		if(D402_VAL == null) { D402_VAL = ""; }
		if(D403_VAL == null) { D403_VAL = ""; }
		if(D404_VAL == null) { D404_VAL = ""; }
		if(D405_VAL == null) { D405_VAL = ""; }
		if(D406_VAL == null) { D406_VAL = ""; }
		if(DTOT_VAL == null) { DTOT_VAL = ""; }
		if(PANJ_CD == null) { PANJ_CD = ""; }
		if(IMME_EX == null) { IMME_EX = ""; }
		if(ACTI_EX == null) { ACTI_EX = ""; }
		if(DOCT_CD == null) { DOCT_CD = ""; }
		if(TOBO_DT == null) { TOBO_DT = ""; }
		if(PANJ_DT == null) { PANJ_DT = ""; }
		if(PANJ_YN == null) { PANJ_YN = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uDental_Panj_ufDntlSave_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDental_Panj_ufDntlSave_002 \n";
			G_INFO += "설명 : 구강판정저장(inert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ICNT : " + ICNT + " \n";
			G_INFO += " MJ01_KD : " + MJ01_KD + " \n";
			G_INFO += " MJ02_KD : " + MJ02_KD + " \n";
			G_INFO += " MJ03_KD : " + MJ03_KD + " \n";
			G_INFO += " MJ04_KD : " + MJ04_KD + " \n";
			G_INFO += " MJ05_KD : " + MJ05_KD + " \n";
			G_INFO += " MJ06_KD : " + MJ06_KD + " \n";
			G_INFO += " DT01_KD : " + DT01_KD + " \n";
			G_INFO += " DT02_KD : " + DT02_KD + " \n";
			G_INFO += " DT03_KD : " + DT03_KD + " \n";
			G_INFO += " DT04_KD : " + DT04_KD + " \n";
			G_INFO += " DJ01_KD : " + DJ01_KD + " \n";
			G_INFO += " DJ02_KD : " + DJ02_KD + " \n";
			G_INFO += " ETAL_EX : " + ETAL_EX + " \n";
			G_INFO += " D401_VAL : " + D401_VAL + " \n";
			G_INFO += " D402_VAL : " + D402_VAL + " \n";
			G_INFO += " D403_VAL : " + D403_VAL + " \n";
			G_INFO += " D404_VAL : " + D404_VAL + " \n";
			G_INFO += " D405_VAL : " + D405_VAL + " \n";
			G_INFO += " D406_VAL : " + D406_VAL + " \n";
			G_INFO += " DTOT_VAL : " + DTOT_VAL + " \n";
			G_INFO += " PANJ_CD : " + PANJ_CD + " \n";
			G_INFO += " IMME_EX : " + IMME_EX + " \n";
			G_INFO += " ACTI_EX : " + ACTI_EX + " \n";
			G_INFO += " DOCT_CD : " + DOCT_CD + " \n";
			G_INFO += " TOBO_DT : " + TOBO_DT + " \n";
			G_INFO += " PANJ_DT : " + PANJ_DT + " \n";
			G_INFO += " PANJ_YN : " + PANJ_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
