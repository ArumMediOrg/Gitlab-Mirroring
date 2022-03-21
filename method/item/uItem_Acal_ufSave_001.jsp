<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uItem_Acal_ufSave_001.jsp"%>
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
		String APLY_DT = htMethod.get("APLY_DT");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String AGE_FR = htMethod.get("AGE_FR");
		String AGE_TO = htMethod.get("AGE_TO");
		String SEX_CD = htMethod.get("SEX_CD");
		String PRE_CD1 = htMethod.get("PRE_CD1");
		String PRE_CD2 = htMethod.get("PRE_CD2");
		String PRE_CD3 = htMethod.get("PRE_CD3");
		String PRE_CD4 = htMethod.get("PRE_CD4");
		String PRE_CD5 = htMethod.get("PRE_CD5");
		String PRE_CD6 = htMethod.get("PRE_CD6");
		String ACAL_NM = htMethod.get("ACAL_NM");
		String USE_YN = htMethod.get("USE_YN");
		String USER = htMethod.get("USER");
		String UAPLY_DT = htMethod.get("UAPLY_DT");

		//
		if(SMODE == null) { SMODE = ""; }
		if(APLY_DT == null) { APLY_DT = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(AGE_FR == null) { AGE_FR = ""; }
		if(AGE_TO == null) { AGE_TO = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PRE_CD1 == null) { PRE_CD1 = ""; }
		if(PRE_CD2 == null) { PRE_CD2 = ""; }
		if(PRE_CD3 == null) { PRE_CD3 = ""; }
		if(PRE_CD4 == null) { PRE_CD4 = ""; }
		if(PRE_CD5 == null) { PRE_CD5 = ""; }
		if(PRE_CD6 == null) { PRE_CD6 = ""; }
		if(ACAL_NM == null) { ACAL_NM = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(USER == null) { USER = ""; }
		if(UAPLY_DT == null) { UAPLY_DT = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uItem_Acal_ufSave_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Acal_ufSave_001 \n";
			G_INFO += "설명 : 검사항목 자동계산 수식 저장(inset,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " APLY_DT : " + APLY_DT + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " AGE_FR : " + AGE_FR + " \n";
			G_INFO += " AGE_TO : " + AGE_TO + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PRE_CD1 : " + PRE_CD1 + " \n";
			G_INFO += " PRE_CD2 : " + PRE_CD2 + " \n";
			G_INFO += " PRE_CD3 : " + PRE_CD3 + " \n";
			G_INFO += " PRE_CD4 : " + PRE_CD4 + " \n";
			G_INFO += " PRE_CD5 : " + PRE_CD5 + " \n";
			G_INFO += " PRE_CD6 : " + PRE_CD6 + " \n";
			G_INFO += " ACAL_NM : " + ACAL_NM + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " USER : " + USER + " \n";
			G_INFO += " UAPLY_DT : " + UAPLY_DT + " \n";
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
