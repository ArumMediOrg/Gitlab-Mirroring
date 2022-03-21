<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCT_KSCD_APPLY_UP_Save_002.jsp"%>
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

		String CHKBOXCCP_USE_YN = htMethod.get("CHKBOXCCP_USE_YN");
		String KNME_NM = htMethod.get("KNME_NM");
		String ENME_NM = htMethod.get("ENME_NM");
		String SNME_NM = htMethod.get("SNME_NM");
		String KCD_CD = htMethod.get("KCD_CD");
		String SUKN_CD = htMethod.get("SUKN_CD");
		String LEVL_KD = htMethod.get("LEVL_KD");
		String MODI_ID = htMethod.get("MODI_ID");
		String KSCD_CD = htMethod.get("KSCD_CD");
		String NUSE_ID = htMethod.get("NUSE_ID");

		//
		if(CHKBOXCCP_USE_YN == null) { CHKBOXCCP_USE_YN = ""; }
		if(KNME_NM == null) { KNME_NM = ""; }
		if(ENME_NM == null) { ENME_NM = ""; }
		if(SNME_NM == null) { SNME_NM = ""; }
		if(KCD_CD == null) { KCD_CD = ""; }
		if(SUKN_CD == null) { SUKN_CD = ""; }
		if(LEVL_KD == null) { LEVL_KD = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(KSCD_CD == null) { KSCD_CD = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCT_KSCD_APPLY_UP_Save_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCT_KSCD_APPLY_UP_Save_002 \n";
			G_INFO += "설명 : 질병분류정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHKBOXCCP_USE_YN : " + CHKBOXCCP_USE_YN + " \n";
			G_INFO += " KNME_NM : " + KNME_NM + " \n";
			G_INFO += " ENME_NM : " + ENME_NM + " \n";
			G_INFO += " SNME_NM : " + SNME_NM + " \n";
			G_INFO += " KCD_CD : " + KCD_CD + " \n";
			G_INFO += " SUKN_CD : " + SUKN_CD + " \n";
			G_INFO += " LEVL_KD : " + LEVL_KD + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " KSCD_CD : " + KSCD_CD + " \n";
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
