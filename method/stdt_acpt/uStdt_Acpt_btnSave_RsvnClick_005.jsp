<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uStdt_Acpt_btnSave_RsvnClick_005.jsp"%>
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
		String PCUST_NO = htMethod.get("PCUST_NO");
		String PPID = htMethod.get("PPID");
		String PPSNL_NM = htMethod.get("PPSNL_NM");
		String PSEX_CD = htMethod.get("PSEX_CD");
		String PCOMP_CD = htMethod.get("PCOMP_CD");
		String PBIRH_DT = htMethod.get("PBIRH_DT");
		String PTEL_NO = htMethod.get("PTEL_NO");
		String PMOBL_NO = htMethod.get("PMOBL_NO");
		String PEMAI_AR = htMethod.get("PEMAI_AR");
		String PZIP_CD = htMethod.get("PZIP_CD");
		String PZIP_AR = htMethod.get("PZIP_AR");
		String PROAD_AR = htMethod.get("PROAD_AR");
		String PDIVI_KD = htMethod.get("PDIVI_KD");
		String PDIVI_CS = htMethod.get("PDIVI_CS");
		String PCLSS_KD = htMethod.get("PCLSS_KD");
		String PDIVI_NO = htMethod.get("PDIVI_NO");
		String PPID_EN = htMethod.get("PPID_EN");
		String PUSER = htMethod.get("PUSER");

		//
		if(PQRYTYPE == null) { PQRYTYPE = ""; }
		if(PCUST_NO == null) { PCUST_NO = ""; }
		if(PPID == null) { PPID = ""; }
		if(PPSNL_NM == null) { PPSNL_NM = ""; }
		if(PSEX_CD == null) { PSEX_CD = ""; }
		if(PCOMP_CD == null) { PCOMP_CD = ""; }
		if(PBIRH_DT == null) { PBIRH_DT = ""; }
		if(PTEL_NO == null) { PTEL_NO = ""; }
		if(PMOBL_NO == null) { PMOBL_NO = ""; }
		if(PEMAI_AR == null) { PEMAI_AR = ""; }
		if(PZIP_CD == null) { PZIP_CD = ""; }
		if(PZIP_AR == null) { PZIP_AR = ""; }
		if(PROAD_AR == null) { PROAD_AR = ""; }
		if(PDIVI_KD == null) { PDIVI_KD = ""; }
		if(PDIVI_CS == null) { PDIVI_CS = ""; }
		if(PCLSS_KD == null) { PCLSS_KD = ""; }
		if(PDIVI_NO == null) { PDIVI_NO = ""; }
		if(PPID_EN == null) { PPID_EN = ""; }
		if(PUSER == null) { PUSER = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uStdt_Acpt_btnSave_RsvnClick_005(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Acpt_btnSave_RsvnClick_005 \n";
			G_INFO += "설명 : 고객정보 등록 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PQRYTYPE : " + PQRYTYPE + " \n";
			G_INFO += " PCUST_NO : " + PCUST_NO + " \n";
			G_INFO += " PPID : " + PPID + " \n";
			G_INFO += " PPSNL_NM : " + PPSNL_NM + " \n";
			G_INFO += " PSEX_CD : " + PSEX_CD + " \n";
			G_INFO += " PCOMP_CD : " + PCOMP_CD + " \n";
			G_INFO += " PBIRH_DT : " + PBIRH_DT + " \n";
			G_INFO += " PTEL_NO : " + PTEL_NO + " \n";
			G_INFO += " PMOBL_NO : " + PMOBL_NO + " \n";
			G_INFO += " PEMAI_AR : " + PEMAI_AR + " \n";
			G_INFO += " PZIP_CD : " + PZIP_CD + " \n";
			G_INFO += " PZIP_AR : " + PZIP_AR + " \n";
			G_INFO += " PROAD_AR : " + PROAD_AR + " \n";
			G_INFO += " PDIVI_KD : " + PDIVI_KD + " \n";
			G_INFO += " PDIVI_CS : " + PDIVI_CS + " \n";
			G_INFO += " PCLSS_KD : " + PCLSS_KD + " \n";
			G_INFO += " PDIVI_NO : " + PDIVI_NO + " \n";
			G_INFO += " PPID_EN : " + PPID_EN + " \n";
			G_INFO += " PUSER : " + PUSER + " \n";
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
