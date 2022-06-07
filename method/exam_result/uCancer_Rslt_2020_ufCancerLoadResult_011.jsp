<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCancer_Rslt_2020_ufCancerLoadResult_011.jsp"%>
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

		String SRSLTCD = htMethod.get("SRSLTCD");
		String SRSLT_NM = htMethod.get("SRSLT_NM");
		String SEXAMKD = htMethod.get("SEXAMKD");
		String SRSLT1_VL = htMethod.get("SRSLT1_VL");
		String SRSLT2_VL = htMethod.get("SRSLT2_VL");
		String SRSLT3_VL = htMethod.get("SRSLT3_VL");
		String SRSLT4_VL = htMethod.get("SRSLT4_VL");

		//
		if(SRSLTCD == null) { SRSLTCD = ""; }
		if(SRSLT_NM == null) { SRSLT_NM = ""; }
		if(SEXAMKD == null) { SEXAMKD = ""; }
		if(SRSLT1_VL == null) { SRSLT1_VL = ""; }
		if(SRSLT2_VL == null) { SRSLT2_VL = ""; }
		if(SRSLT3_VL == null) { SRSLT3_VL = ""; }
		if(SRSLT4_VL == null) { SRSLT4_VL = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCancer_Rslt_2020_ufCancerLoadResult_011(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCancer_Rslt_2020_ufCancerLoadResult_011 \n";
			G_INFO += "설명 : 암검진 등록결과 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += "SRSLTCD " + SRSLTCD + " \n";
			G_INFO += "SRSLT_NM " + SRSLT_NM + " \n";
			G_INFO += "SEXAMKD " + SEXAMKD + " \n";
			G_INFO += "SRSLT1_VL " + SRSLT1_VL + " \n";
			G_INFO += "SRSLT2_VL " + SRSLT2_VL + " \n";
			G_INFO += "SRSLT3_VL " + SRSLT3_VL + " \n";
			G_INFO += "SRSLT4_VL " + SRSLT4_VL + " \n";
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
