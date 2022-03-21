<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uBusinessTrip_btnUpLoadClick_005_TRAN001.jsp"%>
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

		String CUST_NO = htMethod.get("CUST_NO");
		String PENL_ID = htMethod.get("PENL_ID");
		String PENL_NM = htMethod.get("PENL_NM");
		String SEX_KD = htMethod.get("SEX_KD");
		String MANA_KD = htMethod.get("MANA_KD");
		String CUST_KD = htMethod.get("CUST_KD");
		String NTNA_CD = htMethod.get("NTNA_CD");
		String COMP_CD = htMethod.get("COMP_CD");
		String ENTR_DT = htMethod.get("ENTR_DT");
		String BIRH_KD = htMethod.get("BIRH_KD");
		String BIRH_DT = htMethod.get("BIRH_DT");
		String MARY_KD = htMethod.get("MARY_KD");
		String MARY_DT = htMethod.get("MARY_DT");
		String TEL_NO = htMethod.get("TEL_NO");
		String MOBL_NO = htMethod.get("MOBL_NO");
		String ADDR_KD = htMethod.get("ADDR_KD");
		String ZIP_CD = htMethod.get("ZIP_CD");
		String ZIP_SQ = htMethod.get("ZIP_SQ");
		String ZIP_AR = htMethod.get("ZIP_AR");
		String ROAD_AR = htMethod.get("ROAD_AR");
		String BLDG_NO = htMethod.get("BLDG_NO");
		String DIVI_NM = htMethod.get("DIVI_NM");
		String DIVI_CS = htMethod.get("DIVI_CS");
		String DIVI_KD = htMethod.get("DIVI_KD");
		String INFO_YN = htMethod.get("INFO_YN");
		String INFORE_YN = htMethod.get("INFORE_YN");
		String DIVI_NO = htMethod.get("DIVI_NO");
		String NOTE_YN = htMethod.get("NOTE_YN");
		String EMAI_AR = htMethod.get("EMAI_AR");
		String PID_EN = htMethod.get("PID_EN");
		String USE_YN = htMethod.get("USE_YN");
		String MODI_ID = htMethod.get("MODI_ID");
		String INPT_DTT = htMethod.get("INPT_DTT");
		String MODI_DTT = htMethod.get("MODI_DTT");

		//
		if(CUST_NO == null) { CUST_NO = ""; }
		if(PENL_ID == null) { PENL_ID = ""; }
		if(PENL_NM == null) { PENL_NM = ""; }
		if(SEX_KD == null) { SEX_KD = ""; }
		if(MANA_KD == null) { MANA_KD = ""; }
		if(CUST_KD == null) { CUST_KD = ""; }
		if(NTNA_CD == null) { NTNA_CD = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(ENTR_DT == null) { ENTR_DT = ""; }
		if(BIRH_KD == null) { BIRH_KD = ""; }
		if(BIRH_DT == null) { BIRH_DT = ""; }
		if(MARY_KD == null) { MARY_KD = ""; }
		if(MARY_DT == null) { MARY_DT = ""; }
		if(TEL_NO == null) { TEL_NO = ""; }
		if(MOBL_NO == null) { MOBL_NO = ""; }
		if(ADDR_KD == null) { ADDR_KD = ""; }
		if(ZIP_CD == null) { ZIP_CD = ""; }
		if(ZIP_SQ == null) { ZIP_SQ = ""; }
		if(ZIP_AR == null) { ZIP_AR = ""; }
		if(ROAD_AR == null) { ROAD_AR = ""; }
		if(BLDG_NO == null) { BLDG_NO = ""; }
		if(DIVI_NM == null) { DIVI_NM = ""; }
		if(DIVI_CS == null) { DIVI_CS = ""; }
		if(DIVI_KD == null) { DIVI_KD = ""; }
		if(INFO_YN == null) { INFO_YN = ""; }
		if(INFORE_YN == null) { INFORE_YN = ""; }
		if(DIVI_NO == null) { DIVI_NO = ""; }
		if(NOTE_YN == null) { NOTE_YN = ""; }
		if(EMAI_AR == null) { EMAI_AR = ""; }
		if(PID_EN == null) { PID_EN = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(INPT_DTT == null) { INPT_DTT = ""; }
		if(MODI_DTT == null) { MODI_DTT = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uBusinessTrip_btnUpLoadClick_005_TRAN001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBusinessTrip_btnUpLoadClick_005_TRAN001 \n";
			G_INFO += "설명 : 고객정보 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " PENL_ID : " + PENL_ID + " \n";
			G_INFO += " PENL_NM : " + PENL_NM + " \n";
			G_INFO += " SEX_KD : " + SEX_KD + " \n";
			G_INFO += " MANA_KD : " + MANA_KD + " \n";
			G_INFO += " CUST_KD : " + CUST_KD + " \n";
			G_INFO += " NTNA_CD : " + NTNA_CD + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " ENTR_DT : " + ENTR_DT + " \n";
			G_INFO += " BIRH_KD : " + BIRH_KD + " \n";
			G_INFO += " BIRH_DT : " + BIRH_DT + " \n";
			G_INFO += " MARY_KD : " + MARY_KD + " \n";
			G_INFO += " MARY_DT : " + MARY_DT + " \n";
			G_INFO += " TEL_NO : " + TEL_NO + " \n";
			G_INFO += " MOBL_NO : " + MOBL_NO + " \n";
			G_INFO += " ADDR_KD : " + ADDR_KD + " \n";
			G_INFO += " ZIP_CD : " + ZIP_CD + " \n";
			G_INFO += " ZIP_SQ : " + ZIP_SQ + " \n";
			G_INFO += " ZIP_AR : " + ZIP_AR + " \n";
			G_INFO += " ROAD_AR : " + ROAD_AR + " \n";
			G_INFO += " BLDG_NO : " + BLDG_NO + " \n";
			G_INFO += " DIVI_NM : " + DIVI_NM + " \n";
			G_INFO += " DIVI_CS : " + DIVI_CS + " \n";
			G_INFO += " DIVI_KD : " + DIVI_KD + " \n";
			G_INFO += " INFO_YN : " + INFO_YN + " \n";
			G_INFO += " INFORE_YN : " + INFORE_YN + " \n";
			G_INFO += " DIVI_NO : " + DIVI_NO + " \n";
			G_INFO += " NOTE_YN : " + NOTE_YN + " \n";
			G_INFO += " EMAI_AR : " + EMAI_AR + " \n";
			G_INFO += " PID_EN : " + PID_EN + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " INPT_DTT : " + INPT_DTT + " \n";
			G_INFO += " MODI_DTT : " + MODI_DTT + " \n";
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
