<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCancer_Rslt_2020_ufCancerLoadResult_008.jsp"%>
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

		String sRsltCd = htMethod.get("sRsltCd");
		String sRSLT_NM = htMethod.get("sRSLT_NM");
		String sExamKd = htMethod.get("sExamKd");
		String sRSLT1_VL = htMethod.get("sRSLT1_VL");
		String sRSLT2_VL = htMethod.get("sRSLT2_VL");
		String sRSLT3_VL = htMethod.get("sRSLT3_VL");
		String sRSLT4_VL = htMethod.get("sRSLT4_VL");

		//
		if(sRsltCd == null) { sRsltCd == ""; }
		if(sRSLT_NM == null) { sRSLT_NM == ""; }
		if(sExamKd == null) { sExamKd == ""; }
		if(sRSLT1_VL == null) { sRSLT1_VL == ""; }
		if(sRSLT2_VL == null) { sRSLT2_VL == ""; }
		if(sRSLT3_VL == null) { sRSLT3_VL == ""; }
		if(sRSLT4_VL == null) { sRSLT4_VL == ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCancer_Rslt_2020_ufCancerLoadResult_008(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCancer_Rslt_2020_ufCancerLoadResult_008 \n";
			G_INFO += "설명 : 암검진 결과자동등록 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " sRsltCd : " + sRsltCd + " \n";
			G_INFO += " sRSLT_NM : " + sRSLT_NM + " \n";
			G_INFO += " sExamKd : " + sExamKd + " \n";
			G_INFO += " sRSLT1_VL : " + sRSLT1_VL + " \n";
			G_INFO += " sRSLT2_VL : " + sRSLT2_VL + " \n";
			G_INFO += " sRSLT3_VL : " + sRSLT3_VL + " \n";
			G_INFO += " sRSLT4_VL : " + sRSLT4_VL + " \n";
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
