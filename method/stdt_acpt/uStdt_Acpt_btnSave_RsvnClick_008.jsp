<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uStdt_Acpt_btnSave_RsvnClick_008.jsp"%>
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

		String PQRYTYPE = htMethod.get("PQRYTYPE");
		String PRSVN_DT = htMethod.get("PRSVN_DT");
		String PRSVN_SQ = htMethod.get("PRSVN_SQ");
		String PRSVN_NO = htMethod.get("PRSVN_NO");
		String PPSNL_NM = htMethod.get("PPSNL_NM");
		String PPSNL_ID = htMethod.get("PPSNL_ID");
		String PCOMP_CD = htMethod.get("PCOMP_CD");
		String PZIP_CD = htMethod.get("PZIP_CD");
		String PZIP_AR = htMethod.get("PZIP_AR");
		String PROAD_AR = htMethod.get("PROAD_AR");
		String PTEL_NO = htMethod.get("PTEL_NO");
		String PMOBL_NO = htMethod.get("PMOBL_NO");
		String PEMAI_AR = htMethod.get("PEMAI_AR");
		String PDIVI_KD = htMethod.get("PDIVI_KD");
		String PDIVI_CS = htMethod.get("PDIVI_CS");
		String PCLSS_KD = htMethod.get("PCLSS_KD");
		String PDIVI_NO = htMethod.get("PDIVI_NO");
		String PUSER = htMethod.get("PUSER");
		String PSEX_CD = htMethod.get("PSEX_CD");
		String PPID_EN = htMethod.get("PPID_EN");
		String PORAL_KD = htMethod.get("PORAL_KD");
		String PDEPT_NM = htMethod.get("PDEPT_NM");
		String PPRNT_NM = htMethod.get("PPRNT_NM");
		String PPRNT_NO = htMethod.get("PPRNT_NO");
		String PCUST_NO = htMethod.get("PCUST_NO");
		String PMEMO_TX = htMethod.get("PMEMO_TX");
		String PSEND_CD = htMethod.get("PSEND_CD");

		//
		if(PQRYTYPE == null) { PQRYTYPE = ""; }
		if(PRSVN_DT == null) { PRSVN_DT = ""; }
		if(PRSVN_SQ == null) { PRSVN_SQ = ""; }
		if(PRSVN_NO == null) { PRSVN_NO = ""; }
		if(PPSNL_NM == null) { PPSNL_NM = ""; }
		if(PPSNL_ID == null) { PPSNL_ID = ""; }
		if(PCOMP_CD == null) { PCOMP_CD = ""; }
		if(PZIP_CD == null) { PZIP_CD = ""; }
		if(PZIP_AR == null) { PZIP_AR = ""; }
		if(PROAD_AR == null) { PROAD_AR = ""; }
		if(PTEL_NO == null) { PTEL_NO = ""; }
		if(PMOBL_NO == null) { PMOBL_NO = ""; }
		if(PEMAI_AR == null) { PEMAI_AR = ""; }
		if(PDIVI_KD == null) { PDIVI_KD = ""; }
		if(PDIVI_CS == null) { PDIVI_CS = ""; }
		if(PCLSS_KD == null) { PCLSS_KD = ""; }
		if(PDIVI_NO == null) { PDIVI_NO = ""; }
		if(PUSER == null) { PUSER = ""; }
		if(PSEX_CD == null) { PSEX_CD = ""; }
		if(PPID_EN == null) { PPID_EN = ""; }
		if(PORAL_KD == null) { PORAL_KD = ""; }
		if(PDEPT_NM == null) { PDEPT_NM = ""; }
		if(PPRNT_NM == null) { PPRNT_NM = ""; }
		if(PPRNT_NO == null) { PPRNT_NO = ""; }
		if(PCUST_NO == null) { PCUST_NO = ""; }
		if(PMEMO_TX == null) { PMEMO_TX = ""; }
		if(PSEND_CD == null) { PSEND_CD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uStdt_Acpt_btnSave_RsvnClick_008(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Acpt_btnSave_RsvnClick_008 \n";
			G_INFO += "설명 : 예약정보 등록 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PQRYTYPE : " + PQRYTYPE + " \n";
			G_INFO += " PRSVN_DT : " + PRSVN_DT + " \n";
			G_INFO += " PRSVN_SQ : " + PRSVN_SQ + " \n";
			G_INFO += " PRSVN_NO : " + PRSVN_NO + " \n";
			G_INFO += " PPSNL_NM : " + PPSNL_NM + " \n";
			G_INFO += " PPSNL_ID : " + PPSNL_ID + " \n";
			G_INFO += " PCOMP_CD : " + PCOMP_CD + " \n";
			G_INFO += " PZIP_CD : " + PZIP_CD + " \n";
			G_INFO += " PZIP_AR : " + PZIP_AR + " \n";
			G_INFO += " PROAD_AR : " + PROAD_AR + " \n";
			G_INFO += " PTEL_NO : " + PTEL_NO + " \n";
			G_INFO += " PMOBL_NO : " + PMOBL_NO + " \n";
			G_INFO += " PEMAI_AR : " + PEMAI_AR + " \n";
			G_INFO += " PDIVI_KD : " + PDIVI_KD + " \n";
			G_INFO += " PDIVI_CS : " + PDIVI_CS + " \n";
			G_INFO += " PCLSS_KD : " + PCLSS_KD + " \n";
			G_INFO += " PDIVI_NO : " + PDIVI_NO + " \n";
			G_INFO += " PUSER : " + PUSER + " \n";
			G_INFO += " PSEX_CD : " + PSEX_CD + " \n";
			G_INFO += " PPID_EN : " + PPID_EN + " \n";
			G_INFO += " PORAL_KD : " + PORAL_KD + " \n";
			G_INFO += " PDEPT_NM : " + PDEPT_NM + " \n";
			G_INFO += " PPRNT_NM : " + PPRNT_NM + " \n";
			G_INFO += " PPRNT_NO : " + PPRNT_NO + " \n";
			G_INFO += " PCUST_NO : " + PCUST_NO + " \n";
			G_INFO += " PMEMO_TX : " + PMEMO_TX + " \n";
			G_INFO += " PSEND_CD : " + PSEND_CD + " \n";
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
