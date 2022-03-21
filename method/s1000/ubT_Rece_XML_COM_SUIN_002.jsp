<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_ubT_Rece_XML_COM_SUIN_002.jsp"%>
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

		String RECE_SEQ = htMethod.get("RECE_SEQ");
		String RECE_DT = htMethod.get("RECE_DT");
		String OCCU_KD = htMethod.get("OCCU_KD");
		String CARD_NO = htMethod.get("CARD_NO");
		String ALLOT_MM = htMethod.get("ALLOT_MM");
		String APPR_NO = htMethod.get("APPR_NO");
		String APPR_DT = htMethod.get("APPR_DT");
		String CARD_NM = htMethod.get("CARD_NM");
		String USER_ID = htMethod.get("USER_ID");
		String SRECE_NO = htMethod.get("SRECE_NO");
		String SRECE_SEQ = htMethod.get("SRECE_SEQ");

		//
		if(RECE_SEQ == null) { RECE_SEQ = ""; }
		if(RECE_DT == null) { RECE_DT = ""; }
		if(OCCU_KD == null) { OCCU_KD = ""; }
		if(CARD_NO == null) { CARD_NO = ""; }
		if(ALLOT_MM == null) { ALLOT_MM = ""; }
		if(APPR_NO == null) { APPR_NO = ""; }
		if(APPR_DT == null) { APPR_DT = ""; }
		if(CARD_NM == null) { CARD_NM = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(SRECE_NO == null) { SRECE_NO = ""; }
		if(SRECE_SEQ == null) { SRECE_SEQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_ubT_Rece_XML_COM_SUIN_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubT_Rece_XML_COM_SUIN_002 \n";
			G_INFO += "설명 : 환급저장(카드연동) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RECE_SEQ : " + RECE_SEQ + " \n";
			G_INFO += " RECE_DT : " + RECE_DT + " \n";
			G_INFO += " OCCU_KD : " + OCCU_KD + " \n";
			G_INFO += " CARD_NO : " + CARD_NO + " \n";
			G_INFO += " ALLOT_MM : " + ALLOT_MM + " \n";
			G_INFO += " APPR_NO : " + APPR_NO + " \n";
			G_INFO += " APPR_DT : " + APPR_DT + " \n";
			G_INFO += " CARD_NM : " + CARD_NM + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " SRECE_NO : " + SRECE_NO + " \n";
			G_INFO += " SRECE_SEQ : " + SRECE_SEQ + " \n";
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
