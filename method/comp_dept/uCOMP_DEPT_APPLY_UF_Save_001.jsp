<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCOMP_DEPT_APPLY_UF_Save_001.jsp"%>
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

		String SMODE = htMethod.get("SMODE");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String HALF_CD = htMethod.get("HALF_CD");
		String DEPT_CD = htMethod.get("DEPT_CD");
		String DEPT_NM = htMethod.get("DEPT_NM");
		String SUBD_NM = htMethod.get("SUBD_NM");
		String TCHK_YN = htMethod.get("TCHK_YN");
		String MATT_LT = htMethod.get("MATT_LT");
		String MTJG_LT = htMethod.get("MTJG_LT");
		String TBAS_CD = htMethod.get("TBAS_CD");
		String BSBS_PR = htMethod.get("BSBS_PR");
		String BTGS_PR = htMethod.get("BTGS_PR");
		String BCAS_PR = htMethod.get("BCAS_PR");
		String JSBS_PR = htMethod.get("JSBS_PR");
		String JTGS_PR = htMethod.get("JTGS_PR");
		String JCAS_PR = htMethod.get("JCAS_PR");
		String BSBS_RT = htMethod.get("BSBS_RT");
		String BTGS_RT = htMethod.get("BTGS_RT");
		String BCAS_RT = htMethod.get("BCAS_RT");
		String JSBS_RT = htMethod.get("JSBS_RT");
		String JTGS_RT = htMethod.get("JTGS_RT");
		String JCAS_RT = htMethod.get("JCAS_RT");
		String JBSBS_PR = htMethod.get("JBSBS_PR");
		String JBTGS_PR = htMethod.get("JBTGS_PR");
		String JBCAS_PR = htMethod.get("JBCAS_PR");
		String JJSBS_PR = htMethod.get("JJSBS_PR");
		String JJTGS_PR = htMethod.get("JJTGS_PR");
		String JJCAS_PR = htMethod.get("JJCAS_PR");
		String JSBS_PR_SEC = htMethod.get("JSBS_PR_SEC");
		String JTGS_PR_SEC = htMethod.get("JTGS_PR_SEC");
		String JCAS_PR_SEC = htMethod.get("JCAS_PR_SEC");
		String JSBS_RT_SEC = htMethod.get("JSBS_RT_SEC");
		String JTGS_RT_SEC = htMethod.get("JTGS_RT_SEC");
		String JCAS_RT_SEC = htMethod.get("JCAS_RT_SEC");
		String JJSBS_PR_SEC = htMethod.get("JJSBS_PR_SEC");
		String JJTGS_PR_SEC = htMethod.get("JJTGS_PR_SEC");
		String JJCAS_PR_SEC = htMethod.get("JJCAS_PR_SEC");
		String TAGR_TM = htMethod.get("TAGR_TM");
		String USE_YN = htMethod.get("USE_YN");
		String USER_ID = htMethod.get("USER_ID");
		String SPCL_CD = htMethod.get("SPCL_CD");

		//
		if(SMODE == null) { SMODE = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(HALF_CD == null) { HALF_CD = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }
		if(DEPT_NM == null) { DEPT_NM = ""; }
		if(SUBD_NM == null) { SUBD_NM = ""; }
		if(TCHK_YN == null) { TCHK_YN = ""; }
		if(MATT_LT == null) { MATT_LT = ""; }
		if(MTJG_LT == null) { MTJG_LT = ""; }
		if(TBAS_CD == null) { TBAS_CD = ""; }
		if(BSBS_PR == null) { BSBS_PR = ""; }
		if(BTGS_PR == null) { BTGS_PR = ""; }
		if(BCAS_PR == null) { BCAS_PR = ""; }
		if(JSBS_PR == null) { JSBS_PR = ""; }
		if(JTGS_PR == null) { JTGS_PR = ""; }
		if(JCAS_PR == null) { JCAS_PR = ""; }
		if(BSBS_RT == null) { BSBS_RT = ""; }
		if(BTGS_RT == null) { BTGS_RT = ""; }
		if(BCAS_RT == null) { BCAS_RT = ""; }
		if(JSBS_RT == null) { JSBS_RT = ""; }
		if(JTGS_RT == null) { JTGS_RT = ""; }
		if(JCAS_RT == null) { JCAS_RT = ""; }
		if(JBSBS_PR == null) { JBSBS_PR = ""; }
		if(JBTGS_PR == null) { JBTGS_PR = ""; }
		if(JBCAS_PR == null) { JBCAS_PR = ""; }
		if(JJSBS_PR == null) { JJSBS_PR = ""; }
		if(JJTGS_PR == null) { JJTGS_PR = ""; }
		if(JJCAS_PR == null) { JJCAS_PR = ""; }
		if(JSBS_PR_SEC == null) { JSBS_PR_SEC = ""; }
		if(JTGS_PR_SEC == null) { JTGS_PR_SEC = ""; }
		if(JCAS_PR_SEC == null) { JCAS_PR_SEC = ""; }
		if(JSBS_RT_SEC == null) { JSBS_RT_SEC = ""; }
		if(JTGS_RT_SEC == null) { JTGS_RT_SEC = ""; }
		if(JCAS_RT_SEC == null) { JCAS_RT_SEC = ""; }
		if(JJSBS_PR_SEC == null) { JJSBS_PR_SEC = ""; }
		if(JJTGS_PR_SEC == null) { JJTGS_PR_SEC = ""; }
		if(JJCAS_PR_SEC == null) { JJCAS_PR_SEC = ""; }
		if(TAGR_TM == null) { TAGR_TM = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(SPCL_CD == null) { SPCL_CD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCOMP_DEPT_APPLY_UF_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_DEPT_APPLY_UF_Save_001 \n";
			G_INFO += "설명 : 특수검진 사업장 부서 저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " HALF_CD : " + HALF_CD + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
			G_INFO += " DEPT_NM : " + DEPT_NM + " \n";
			G_INFO += " SUBD_NM : " + SUBD_NM + " \n";
			G_INFO += " TCHK_YN : " + TCHK_YN + " \n";
			G_INFO += " MATT_LT : " + MATT_LT + " \n";
			G_INFO += " MTJG_LT : " + MTJG_LT + " \n";
			G_INFO += " TBAS_CD : " + TBAS_CD + " \n";
			G_INFO += " BSBS_PR : " + BSBS_PR + " \n";
			G_INFO += " BTGS_PR : " + BTGS_PR + " \n";
			G_INFO += " BCAS_PR : " + BCAS_PR + " \n";
			G_INFO += " JSBS_PR : " + JSBS_PR + " \n";
			G_INFO += " JTGS_PR : " + JTGS_PR + " \n";
			G_INFO += " JCAS_PR : " + JCAS_PR + " \n";
			G_INFO += " BSBS_RT : " + BSBS_RT + " \n";
			G_INFO += " BTGS_RT : " + BTGS_RT + " \n";
			G_INFO += " BCAS_RT : " + BCAS_RT + " \n";
			G_INFO += " JSBS_RT : " + JSBS_RT + " \n";
			G_INFO += " JTGS_RT : " + JTGS_RT + " \n";
			G_INFO += " JCAS_RT : " + JCAS_RT + " \n";
			G_INFO += " JBSBS_PR : " + JBSBS_PR + " \n";
			G_INFO += " JBTGS_PR : " + JBTGS_PR + " \n";
			G_INFO += " JBCAS_PR : " + JBCAS_PR + " \n";
			G_INFO += " JJSBS_PR : " + JJSBS_PR + " \n";
			G_INFO += " JJTGS_PR : " + JJTGS_PR + " \n";
			G_INFO += " JJCAS_PR : " + JJCAS_PR + " \n";
			G_INFO += " JSBS_PR_SEC : " + JSBS_PR_SEC + " \n";
			G_INFO += " JTGS_PR_SEC : " + JTGS_PR_SEC + " \n";
			G_INFO += " JCAS_PR_SEC : " + JCAS_PR_SEC + " \n";
			G_INFO += " JSBS_RT_SEC : " + JSBS_RT_SEC + " \n";
			G_INFO += " JTGS_RT_SEC : " + JTGS_RT_SEC + " \n";
			G_INFO += " JCAS_RT_SEC : " + JCAS_RT_SEC + " \n";
			G_INFO += " JJSBS_PR_SEC : " + JJSBS_PR_SEC + " \n";
			G_INFO += " JJTGS_PR_SEC : " + JJTGS_PR_SEC + " \n";
			G_INFO += " JJCAS_PR_SEC : " + JJCAS_PR_SEC + " \n";
			G_INFO += " TAGR_TM : " + TAGR_TM + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " SPCL_CD : " + SPCL_CD + " \n";
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
