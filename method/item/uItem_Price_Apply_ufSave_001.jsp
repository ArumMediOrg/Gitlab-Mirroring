<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uItem_Price_Apply_ufSave_001.jsp"%>
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
		String IIP_APLY_DT = htMethod.get("IIP_APLY_DT");
		String IIP_ITEM_CD = htMethod.get("IIP_ITEM_CD");
		String IIP_JCSG_PR = htMethod.get("IIP_JCSG_PR");
		String IIP_HESG_PR = htMethod.get("IIP_HESG_PR");
		String IIP_GBSG_PR = htMethod.get("IIP_GBSG_PR");
		String IIP_SBSG_PR = htMethod.get("IIP_SBSG_PR");
		String IIP_TGSG_PR = htMethod.get("IIP_TGSG_PR");
		String IIP_STSG_PR = htMethod.get("IIP_STSG_PR");
		String IIP_GASN_PR = htMethod.get("IIP_GASN_PR");
		String IIP_PRSN_PR = htMethod.get("IIP_PRSN_PR");
		String IIP_SBGB_PR = htMethod.get("IIP_SBGB_PR");
		String IIP_USE_YN = htMethod.get("IIP_USE_YN");
		String USER = htMethod.get("USER");

		//
		if(SMODE == null) { SMODE = ""; }
		if(IIP_APLY_DT == null) { IIP_APLY_DT = ""; }
		if(IIP_ITEM_CD == null) { IIP_ITEM_CD = ""; }
		if(IIP_JCSG_PR == null) { IIP_JCSG_PR = ""; }
		if(IIP_HESG_PR == null) { IIP_HESG_PR = ""; }
		if(IIP_GBSG_PR == null) { IIP_GBSG_PR = ""; }
		if(IIP_SBSG_PR == null) { IIP_SBSG_PR = ""; }
		if(IIP_TGSG_PR == null) { IIP_TGSG_PR = ""; }
		if(IIP_STSG_PR == null) { IIP_STSG_PR = ""; }
		if(IIP_GASN_PR == null) { IIP_GASN_PR = ""; }
		if(IIP_PRSN_PR == null) { IIP_PRSN_PR = ""; }
		if(IIP_SBGB_PR == null) { IIP_SBGB_PR = ""; }
		if(IIP_USE_YN == null) { IIP_USE_YN = ""; }
		if(USER == null) { USER = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uItem_Price_Apply_ufSave_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Price_Apply_ufSave_001 \n";
			G_INFO += "설명 : 검사항목 수가 저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " IIP_APLY_DT : " + IIP_APLY_DT + " \n";
			G_INFO += " IIP_ITEM_CD : " + IIP_ITEM_CD + " \n";
			G_INFO += " IIP_JCSG_PR : " + IIP_JCSG_PR + " \n";
			G_INFO += " IIP_HESG_PR : " + IIP_HESG_PR + " \n";
			G_INFO += " IIP_GBSG_PR : " + IIP_GBSG_PR + " \n";
			G_INFO += " IIP_SBSG_PR : " + IIP_SBSG_PR + " \n";
			G_INFO += " IIP_TGSG_PR : " + IIP_TGSG_PR + " \n";
			G_INFO += " IIP_STSG_PR : " + IIP_STSG_PR + " \n";
			G_INFO += " IIP_GASN_PR : " + IIP_GASN_PR + " \n";
			G_INFO += " IIP_PRSN_PR : " + IIP_PRSN_PR + " \n";
			G_INFO += " IIP_SBGB_PR : " + IIP_SBGB_PR + " \n";
			G_INFO += " IIP_USE_YN : " + IIP_USE_YN + " \n";
			G_INFO += " USER : " + USER + " \n";
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
