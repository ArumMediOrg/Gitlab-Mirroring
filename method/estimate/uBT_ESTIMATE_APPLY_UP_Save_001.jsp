<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uBT_ESTIMATE_APPLY_UP_Save_001.jsp"%>
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

		String CHKBOXBEE_USE_YN = htMethod.get("CHKBOXBEE_USE_YN");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String ESTI_CD = htMethod.get("ESTI_CD");
		String ESTI_NM = htMethod.get("ESTI_NM");
		String COMP_CD = htMethod.get("COMP_CD");
		String SALE_CD = htMethod.get("SALE_CD");
		String ESTI_SDT = htMethod.get("ESTI_SDT");
		String ESTI_EDT = htMethod.get("ESTI_EDT");
		String PRES_DT = htMethod.get("PRES_DT");
		String CALC_CD = htMethod.get("CALC_CD");
		String ITKD_CD = htMethod.get("ITKD_CD");
		String TBAS_CD = htMethod.get("TBAS_CD");
		String ESTI_TX = htMethod.get("ESTI_TX");
		String INPT_ID = htMethod.get("INPT_ID");
		String NUSE_ID = htMethod.get("NUSE_ID");

		//
		if(CHKBOXBEE_USE_YN == null) { CHKBOXBEE_USE_YN = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ESTI_CD == null) { ESTI_CD = ""; }
		if(ESTI_NM == null) { ESTI_NM = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(SALE_CD == null) { SALE_CD = ""; }
		if(ESTI_SDT == null) { ESTI_SDT = ""; }
		if(ESTI_EDT == null) { ESTI_EDT = ""; }
		if(PRES_DT == null) { PRES_DT = ""; }
		if(CALC_CD == null) { CALC_CD = ""; }
		if(ITKD_CD == null) { ITKD_CD = ""; }
		if(TBAS_CD == null) { TBAS_CD = ""; }
		if(ESTI_TX == null) { ESTI_TX = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uBT_ESTIMATE_APPLY_UP_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTIMATE_APPLY_UP_Save_001 \n";
			G_INFO += "설명 : 견적정보 등록 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHKBOXBEE_USE_YN : " + CHKBOXBEE_USE_YN + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ESTI_CD : " + ESTI_CD + " \n";
			G_INFO += " ESTI_NM : " + ESTI_NM + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " SALE_CD : " + SALE_CD + " \n";
			G_INFO += " ESTI_SDT : " + ESTI_SDT + " \n";
			G_INFO += " ESTI_EDT : " + ESTI_EDT + " \n";
			G_INFO += " PRES_DT : " + PRES_DT + " \n";
			G_INFO += " CALC_CD : " + CALC_CD + " \n";
			G_INFO += " ITKD_CD : " + ITKD_CD + " \n";
			G_INFO += " TBAS_CD : " + TBAS_CD + " \n";
			G_INFO += " ESTI_TX : " + ESTI_TX + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " NUSE_ID : " + NUSE_ID + " \n";
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
