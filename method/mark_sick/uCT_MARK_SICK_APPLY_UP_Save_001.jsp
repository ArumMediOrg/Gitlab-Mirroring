<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCT_MARK_SICK_APPLY_UP_Save_001.jsp"%>
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

		String CHKBOXCMS_USE_YN = htMethod.get("CHKBOXCMS_USE_YN");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String HEIG_KD = htMethod.get("HEIG_KD");
		String KSCD_CD = htMethod.get("KSCD_CD");
		String INPT_ID = htMethod.get("INPT_ID");
		String NUSE_ID = htMethod.get("NUSE_ID");

		//
		if(CHKBOXCMS_USE_YN == null) { CHKBOXCMS_USE_YN = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(HEIG_KD == null) { HEIG_KD = ""; }
		if(KSCD_CD == null) { KSCD_CD = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCT_MARK_SICK_APPLY_UP_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCT_MARK_SICK_APPLY_UP_Save_001 \n";
			G_INFO += "설명 : 표적질환 정보 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHKBOXCMS_USE_YN : " + CHKBOXCMS_USE_YN + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " HEIG_KD : " + HEIG_KD + " \n";
			G_INFO += " KSCD_CD : " + KSCD_CD + " \n";
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
