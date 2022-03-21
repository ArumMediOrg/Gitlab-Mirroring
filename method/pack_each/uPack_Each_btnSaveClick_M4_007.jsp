<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uPack_Each_btnSaveClick_M4_007.jsp"%>
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

		String SEX_CD = htMethod.get("SEX_CD");
		String PACK_NM = htMethod.get("PACK_NM");
		String PACK_SDT = htMethod.get("PACK_SDT");
		String PACK_EDT = htMethod.get("PACK_EDT");
		String CALC_CD = htMethod.get("CALC_CD");
		String CALC_PR = htMethod.get("CALC_PR");
		String SALE_PR = htMethod.get("SALE_PR");
		String GRUP_PR = htMethod.get("GRUP_PR");
		String COUP_PR = htMethod.get("COUP_PR");
		String FAMY_PR = htMethod.get("FAMY_PR");
		String CUPN_PR = htMethod.get("CUPN_PR");
		String MMBR_PR = htMethod.get("MMBR_PR");
		String OPTN_PR = htMethod.get("OPTN_PR");
		String CNCL_CD = htMethod.get("CNCL_CD");
		String OPTN_YN = htMethod.get("OPTN_YN");
		String ITEM_LT = htMethod.get("ITEM_LT");
		String PACK_TX = htMethod.get("PACK_TX");
		String MODI_ID = htMethod.get("MODI_ID");
		String TRNS_ID = htMethod.get("TRNS_ID");
		String ORGA_CD = htMethod.get("ORGA_CD");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String PACK_SQ = htMethod.get("PACK_SQ");
		String PACK_ENM = htMethod.get("PACK_ENM");
		String HOMEPAGE_YN = htMethod.get("HOMEPAGE_YN");

		//
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PACK_NM == null) { PACK_NM = ""; }
		if(PACK_SDT == null) { PACK_SDT = ""; }
		if(PACK_EDT == null) { PACK_EDT = ""; }
		if(CALC_CD == null) { CALC_CD = ""; }
		if(CALC_PR == null) { CALC_PR = ""; }
		if(SALE_PR == null) { SALE_PR = ""; }
		if(GRUP_PR == null) { GRUP_PR = ""; }
		if(COUP_PR == null) { COUP_PR = ""; }
		if(FAMY_PR == null) { FAMY_PR = ""; }
		if(CUPN_PR == null) { CUPN_PR = ""; }
		if(MMBR_PR == null) { MMBR_PR = ""; }
		if(OPTN_PR == null) { OPTN_PR = ""; }
		if(CNCL_CD == null) { CNCL_CD = ""; }
		if(OPTN_YN == null) { OPTN_YN = ""; }
		if(ITEM_LT == null) { ITEM_LT = ""; }
		if(PACK_TX == null) { PACK_TX = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(TRNS_ID == null) { TRNS_ID = ""; }
		if(ORGA_CD == null) { ORGA_CD = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(PACK_SQ == null) { PACK_SQ = ""; }
		if(PACK_ENM == null) { PACK_ENM = ""; }
		if(HOMEPAGE_YN == null) { HOMEPAGE_YN = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uPack_Each_btnSaveClick_M4_007(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPack_Each_btnSaveClick_M4_007 \n";
			G_INFO += "설명 : 묶음정보 갱신 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PACK_NM : " + PACK_NM + " \n";
			G_INFO += " PACK_SDT : " + PACK_SDT + " \n";
			G_INFO += " PACK_EDT : " + PACK_EDT + " \n";
			G_INFO += " CALC_CD : " + CALC_CD + " \n";
			G_INFO += " CALC_PR : " + CALC_PR + " \n";
			G_INFO += " SALE_PR : " + SALE_PR + " \n";
			G_INFO += " GRUP_PR : " + GRUP_PR + " \n";
			G_INFO += " COUP_PR : " + COUP_PR + " \n";
			G_INFO += " FAMY_PR : " + FAMY_PR + " \n";
			G_INFO += " CUPN_PR : " + CUPN_PR + " \n";
			G_INFO += " MMBR_PR : " + MMBR_PR + " \n";
			G_INFO += " OPTN_PR : " + OPTN_PR + " \n";
			G_INFO += " CNCL_CD : " + CNCL_CD + " \n";
			G_INFO += " OPTN_YN : " + OPTN_YN + " \n";
			G_INFO += " ITEM_LT : " + ITEM_LT + " \n";
			G_INFO += " PACK_TX : " + PACK_TX + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " TRNS_ID : " + TRNS_ID + " \n";
			G_INFO += " ORGA_CD : " + ORGA_CD + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " PACK_SQ : " + PACK_SQ + " \n";
			G_INFO += " PACK_ENM : " + PACK_ENM + " \n";
			G_INFO += " HOMEPAGE_YN : " + HOMEPAGE_YN + " \n";
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
