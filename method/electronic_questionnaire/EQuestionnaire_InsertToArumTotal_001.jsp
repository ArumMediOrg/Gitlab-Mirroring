<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_EQuestionnaire_InsertToArumTotal_001.jsp"%>
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

		String SDATE = htMethod.get("SDATE");
		String SEXNO = htMethod.get("SEXNO");
		String SCTNO = htMethod.get("SCTNO");
		String SPTNO = htMethod.get("SPTNO");
		String SPTNM = htMethod.get("SPTNM");
		String SAGE = htMethod.get("SAGE");
		String SSEX = htMethod.get("SSEX");
		String SFILENM = htMethod.get("SFILENM");
		String SFORMNM = htMethod.get("SFORMNM");
		String IMAGE = htMethod.get("IMAGE");
		//
		if(SDATE == null) { SDATE = ""; }
		if(SEXNO == null) { SEXNO = ""; }
		if(SCTNO == null) { SCTNO = ""; }
		if(SPTNO == null) { SPTNO = ""; }
		if(SPTNM == null) { SPTNM = ""; }
		if(SAGE == null) { SAGE = ""; }
		if(SSEX == null) { SSEX = ""; }
		if(SFILENM == null) { SFILENM = ""; }
		if(SFORMNM == null) { SFORMNM = ""; }
		if(IMAGE == null) { IMAGE = ""; }


		// DB객체
		stmtExec = connect.createStatement();
		sql = func_EQuestionnaire_InsertToArumTotal_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : EQuestionnaire_InsertToArumTotal_001 \n";
			G_INFO += "설명 : 기존 문진 삭제 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SDATE : " + SDATE + " \n";
			G_INFO += " SEXNO : " + SEXNO + " \n";
			G_INFO += " SCTNO : " + SCTNO + " \n";
			G_INFO += " SPTNO : " + SPTNO + " \n";
			G_INFO += " SPTNM : " + SPTNM + " \n";
			G_INFO += " SAGE : " + SAGE + " \n";
			G_INFO += " SSEX : " + SSEX + " \n";
			G_INFO += " SFILENM : " + SFILENM + " \n";
			G_INFO += " SFORMNM : " + SFORMNM + " \n";
			if (! IMAGE.equals("")){
				G_INFO += " IMAGE : 이미지 데이터 들어왔는데 넘 길어서 생략";
			} else {
				G_INFO += " IMAGE : " + IMAGE + " \n";
			}
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
