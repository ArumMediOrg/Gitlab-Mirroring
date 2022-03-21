<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSP_COMMON_APPLY_UP_Save_001.jsp"%>
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

		String CHKBOXCSC_USE_YN = htMethod.get("CHKBOXCSC_USE_YN");
		String LARGE = htMethod.get("LARGE");
		String SMALL = htMethod.get("SMALL");
		String LEVEL = htMethod.get("LEVEL");
		String FULL_NM = htMethod.get("FULL_NM");
		String CODE_EX = htMethod.get("CODE_EX");
		String ETC1_NM = htMethod.get("ETC1_NM");
		String ETC1_CD = htMethod.get("ETC1_CD");
		String ETC2_NM = htMethod.get("ETC2_NM");
		String ETC2_CD = htMethod.get("ETC2_CD");
		String ETC3_NM = htMethod.get("ETC3_NM");
		String ETC3_CD = htMethod.get("ETC3_CD");
		String ETC4_NM = htMethod.get("ETC4_NM");
		String ETC4_CD = htMethod.get("ETC4_CD");
		String ETC5_NM = htMethod.get("ETC5_NM");
		String ETC5_CD = htMethod.get("ETC5_CD");
		String CODE_ST = htMethod.get("CODE_ST");
		String CODE_GR = htMethod.get("CODE_GR");
		String INPT_ID = htMethod.get("INPT_ID");
		String NUSE_ID = htMethod.get("NUSE_ID");

		//
		if(CHKBOXCSC_USE_YN == null) { CHKBOXCSC_USE_YN = ""; }
		if(LARGE == null) { LARGE = ""; }
		if(SMALL == null) { SMALL = ""; }
		if(LEVEL == null) { LEVEL = ""; }
		if(FULL_NM == null) { FULL_NM = ""; }
		if(CODE_EX == null) { CODE_EX = ""; }
		if(ETC1_NM == null) { ETC1_NM = ""; }
		if(ETC1_CD == null) { ETC1_CD = ""; }
		if(ETC2_NM == null) { ETC2_NM = ""; }
		if(ETC2_CD == null) { ETC2_CD = ""; }
		if(ETC3_NM == null) { ETC3_NM = ""; }
		if(ETC3_CD == null) { ETC3_CD = ""; }
		if(ETC4_NM == null) { ETC4_NM = ""; }
		if(ETC4_CD == null) { ETC4_CD = ""; }
		if(ETC5_NM == null) { ETC5_NM = ""; }
		if(ETC5_CD == null) { ETC5_CD = ""; }
		if(CODE_ST == null) { CODE_ST = ""; }
		if(CODE_GR == null) { CODE_GR = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSP_COMMON_APPLY_UP_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_COMMON_APPLY_UP_Save_001 \n";
			G_INFO += "설명 : 특검코드 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHKBOXCSC_USE_YN : " + CHKBOXCSC_USE_YN + " \n";
			G_INFO += " LARGE : " + LARGE + " \n";
			G_INFO += " SMALL : " + SMALL + " \n";
			G_INFO += " LEVEL : " + LEVEL + " \n";
			G_INFO += " FULL_NM : " + FULL_NM + " \n";
			G_INFO += " CODE_EX : " + CODE_EX + " \n";
			G_INFO += " ETC1_NM : " + ETC1_NM + " \n";
			G_INFO += " ETC1_CD : " + ETC1_CD + " \n";
			G_INFO += " ETC2_NM : " + ETC2_NM + " \n";
			G_INFO += " ETC2_CD : " + ETC2_CD + " \n";
			G_INFO += " ETC3_NM : " + ETC3_NM + " \n";
			G_INFO += " ETC3_CD : " + ETC3_CD + " \n";
			G_INFO += " ETC4_NM : " + ETC4_NM + " \n";
			G_INFO += " ETC4_CD : " + ETC4_CD + " \n";
			G_INFO += " ETC5_NM : " + ETC5_NM + " \n";
			G_INFO += " ETC5_CD : " + ETC5_CD + " \n";
			G_INFO += " CODE_ST : " + CODE_ST + " \n";
			G_INFO += " CODE_GR : " + CODE_GR + " \n";
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
