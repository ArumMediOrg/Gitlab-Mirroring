<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uBT_ESTI_PROF_APPLY_UP_OPTION_DML_001.jsp"%>
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

		String SUSE_YN = htMethod.get("SUSE_YN");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String ESTI_CD = htMethod.get("ESTI_CD");
		String PROF_SQ = htMethod.get("PROF_SQ");
		String OPTN_SQ = htMethod.get("OPTN_SQ");
		String OPTN_NM = htMethod.get("OPTN_NM");
		String OPTN_CNT = htMethod.get("OPTN_CNT");
		String OPTN_PR = htMethod.get("OPTN_PR");
		String USE_YN = htMethod.get("USE_YN");
		String NUSE_ID = htMethod.get("NUSE_ID");
		String INPT_ID = htMethod.get("INPT_ID");

		//
		if(SUSE_YN == null) { SUSE_YN = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ESTI_CD == null) { ESTI_CD = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }
		if(OPTN_SQ == null) { OPTN_SQ = ""; }
		if(OPTN_NM == null) { OPTN_NM = ""; }
		if(OPTN_CNT == null) { OPTN_CNT = ""; }
		if(OPTN_PR == null) { OPTN_PR = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uBT_ESTI_PROF_APPLY_UP_OPTION_DML_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTI_PROF_APPLY_UP_OPTION_DML_001 \n";
			G_INFO += "설명 : 검진유형 옵션값 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SUSE_YN : " + SUSE_YN + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ESTI_CD : " + ESTI_CD + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
			G_INFO += " OPTN_SQ : " + OPTN_SQ + " \n";
			G_INFO += " OPTN_NM : " + OPTN_NM + " \n";
			G_INFO += " OPTN_CNT : " + OPTN_CNT + " \n";
			G_INFO += " OPTN_PR : " + OPTN_PR + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " NUSE_ID : " + NUSE_ID + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
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
