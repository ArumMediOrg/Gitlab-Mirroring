<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_upGetDietitian_003.jsp"%>
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

		String ADVI_DT = htMethod.get("ADVI_DT");
		String BMI_NM = htMethod.get("BMI_NM");
		String KCAL_VL = htMethod.get("KCAL_VL");
		String SOCK_TX1 = htMethod.get("SOCK_TX1");
		String SOCK_TX2 = htMethod.get("SOCK_TX2");
		String SOCK_TX3 = htMethod.get("SOCK_TX3");
		String SOCK_TX4 = htMethod.get("SOCK_TX4");
		String SOCK_TX5 = htMethod.get("SOCK_TX5");
		String SOCK_TX6 = htMethod.get("SOCK_TX6");
		String SOCK_TX7 = htMethod.get("SOCK_TX7");
		String SOCK_TX8 = htMethod.get("SOCK_TX8");
		String TRANC_DT = htMethod.get("TRANC_DT");
		String USER = htMethod.get("USER");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(ADVI_DT == null) { ADVI_DT = ""; }
		if(BMI_NM == null) { BMI_NM = ""; }
		if(KCAL_VL == null) { KCAL_VL = ""; }
		if(SOCK_TX1 == null) { SOCK_TX1 = ""; }
		if(SOCK_TX2 == null) { SOCK_TX2 = ""; }
		if(SOCK_TX3 == null) { SOCK_TX3 = ""; }
		if(SOCK_TX4 == null) { SOCK_TX4 = ""; }
		if(SOCK_TX5 == null) { SOCK_TX5 = ""; }
		if(SOCK_TX6 == null) { SOCK_TX6 = ""; }
		if(SOCK_TX7 == null) { SOCK_TX7 = ""; }
		if(SOCK_TX8 == null) { SOCK_TX8 = ""; }
		if(TRANC_DT == null) { TRANC_DT = ""; }
		if(USER == null) { USER = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_upGetDietitian_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : upGetDietitian_003 \n";
			G_INFO += "설명 : 영양평가 저장(Update)(고대) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ADVI_DT : " + ADVI_DT + " \n";
			G_INFO += " BMI_NM : " + BMI_NM + " \n";
			G_INFO += " KCAL_VL : " + KCAL_VL + " \n";
			G_INFO += " SOCK_TX1 : " + SOCK_TX1 + " \n";
			G_INFO += " SOCK_TX2 : " + SOCK_TX2 + " \n";
			G_INFO += " SOCK_TX3 : " + SOCK_TX3 + " \n";
			G_INFO += " SOCK_TX4 : " + SOCK_TX4 + " \n";
			G_INFO += " SOCK_TX5 : " + SOCK_TX5 + " \n";
			G_INFO += " SOCK_TX6 : " + SOCK_TX6 + " \n";
			G_INFO += " SOCK_TX7 : " + SOCK_TX7 + " \n";
			G_INFO += " SOCK_TX8 : " + SOCK_TX8 + " \n";
			G_INFO += " TRANC_DT : " + TRANC_DT + " \n";
			G_INFO += " USER : " + USER + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
