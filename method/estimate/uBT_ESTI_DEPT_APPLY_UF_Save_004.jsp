<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uBT_ESTI_DEPT_APPLY_UF_Save_004.jsp"%>
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

		String MNGT_YR = htMethod.get("MNGT_YR");
		String ESTI_CD = htMethod.get("ESTI_CD");
		String DEPT_SQ = htMethod.get("DEPT_SQ");
		String SBCD_CD = htMethod.get("SBCD_CD");
		String ITKD_CD = htMethod.get("ITKD_CD");
		String BSBS_PR = htMethod.get("BSBS_PR");
		String BTGS_PR = htMethod.get("BTGS_PR");
		String BCAS_PR = htMethod.get("BCAS_PR");
		String JSBS_PR = htMethod.get("JSBS_PR");
		String JTGS_PR = htMethod.get("JTGS_PR");
		String JCAS_PR = htMethod.get("JCAS_PR");
		String INPT_ID = htMethod.get("INPT_ID");
		String MCAS_PR = htMethod.get("MCAS_PR");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ESTI_CD == null) { ESTI_CD = ""; }
		if(DEPT_SQ == null) { DEPT_SQ = ""; }
		if(SBCD_CD == null) { SBCD_CD = ""; }
		if(ITKD_CD == null) { ITKD_CD = ""; }
		if(BSBS_PR == null) { BSBS_PR = ""; }
		if(BTGS_PR == null) { BTGS_PR = ""; }
		if(BCAS_PR == null) { BCAS_PR = ""; }
		if(JSBS_PR == null) { JSBS_PR = ""; }
		if(JTGS_PR == null) { JTGS_PR = ""; }
		if(JCAS_PR == null) { JCAS_PR = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(MCAS_PR == null) { MCAS_PR = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uBT_ESTI_DEPT_APPLY_UF_Save_004(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTI_DEPT_APPLY_UF_Save_004 \n";
			G_INFO += "설명 : 검사항목 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ESTI_CD : " + ESTI_CD + " \n";
			G_INFO += " DEPT_SQ : " + DEPT_SQ + " \n";
			G_INFO += " SBCD_CD : " + SBCD_CD + " \n";
			G_INFO += " ITKD_CD : " + ITKD_CD + " \n";
			G_INFO += " BSBS_PR : " + BSBS_PR + " \n";
			G_INFO += " BTGS_PR : " + BTGS_PR + " \n";
			G_INFO += " BCAS_PR : " + BCAS_PR + " \n";
			G_INFO += " JSBS_PR : " + JSBS_PR + " \n";
			G_INFO += " JTGS_PR : " + JTGS_PR + " \n";
			G_INFO += " JCAS_PR : " + JCAS_PR + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " MCAS_PR : " + MCAS_PR + " \n";
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
