<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCOMP_DEPT_APPLY_UF_Save_002.jsp"%>
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

		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String HALF_CD = htMethod.get("HALF_CD");
		String DEPT_CD = htMethod.get("DEPT_CD");
		String SBCD_CD = htMethod.get("SBCD_CD");
		String ITKD_CD = htMethod.get("ITKD_CD");
		String BSBS_PR = htMethod.get("BSBS_PR");
		String BTGS_PR = htMethod.get("BTGS_PR");
		String BCAS_PR = htMethod.get("BCAS_PR");
		String JSBS_PR = htMethod.get("JSBS_PR");
		String JTGS_PR = htMethod.get("JTGS_PR");
		String JCAS_PR = htMethod.get("JCAS_PR");
		String USE_YN = htMethod.get("USE_YN");
		String USER_ID = htMethod.get("USER_ID");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(HALF_CD == null) { HALF_CD = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }
		if(SBCD_CD == null) { SBCD_CD = ""; }
		if(ITKD_CD == null) { ITKD_CD = ""; }
		if(BSBS_PR == null) { BSBS_PR = ""; }
		if(BTGS_PR == null) { BTGS_PR = ""; }
		if(BCAS_PR == null) { BCAS_PR = ""; }
		if(JSBS_PR == null) { JSBS_PR = ""; }
		if(JTGS_PR == null) { JTGS_PR = ""; }
		if(JCAS_PR == null) { JCAS_PR = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(USER_ID == null) { USER_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCOMP_DEPT_APPLY_UF_Save_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_DEPT_APPLY_UF_Save_002 \n";
			G_INFO += "설명 : 특수검진 사업장 부서 검사항목 저장(insert) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " HALF_CD : " + HALF_CD + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
			G_INFO += " SBCD_CD : " + SBCD_CD + " \n";
			G_INFO += " ITKD_CD : " + ITKD_CD + " \n";
			G_INFO += " BSBS_PR : " + BSBS_PR + " \n";
			G_INFO += " BTGS_PR : " + BTGS_PR + " \n";
			G_INFO += " BCAS_PR : " + BCAS_PR + " \n";
			G_INFO += " JSBS_PR : " + JSBS_PR + " \n";
			G_INFO += " JTGS_PR : " + JTGS_PR + " \n";
			G_INFO += " JCAS_PR : " + JCAS_PR + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
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
