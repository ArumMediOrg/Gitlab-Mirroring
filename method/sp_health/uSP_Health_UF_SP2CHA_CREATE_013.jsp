<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
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

		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		/*

Insert Into ET_EXAM_PRICE
(EEP_EXAM_DT, EEP_EXAM_SQ, EEP_ORDER_SQ, EEP_ORDER_DT, EEP_ORDER_CD,
 EEP_CUST_NO, EEP_COMP_CD, EEP_FST_PR,   EEP_EXAM_PR,  EEP_COMPS_PR,
 EEP_SDMD_PR, EEP_PSNL_PR, EEP_DMD_PR,   EEP_INPT_ID,  EEP_INPT_DTT)
Values
||:sSQL_ADD
		*/

		sql = "INSERT INTO ET_EXAM_PRICE (EEP_EXAM_DT, EEP_EXAM_SQ, EEP_ORDER_SQ, EEP_ORDER_DT, EEP_ORDER_CD, EEP_CUST_NO, EEP_COMP_CD, EEP_FST_PR, EEP_EXAM_PR, EEP_COMPS_PR, EEP_SDMD_PR, EEP_PSNL_PR, EEP_DMD_PR, EEP_INPT_ID, EEP_INPT_DTT) VALUES ";
		sql += SSQL_ADD;

		stmtExec.executeUpdate(sql);
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_UF_SP2CHA_CREATE_013 \n";
			G_INFO += "설명 : 2차접수생성-수가항목저장(insert) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
	} catch (Exception e) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= e.toString()%>]]></errorMsg>
	<sql><![CDATA[<%= sql%>]]></sql>
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
