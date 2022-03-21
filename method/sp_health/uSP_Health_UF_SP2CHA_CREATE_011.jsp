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

Insert Into ET_RSLT_ITEM
(ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD, ERI_SPCL_KD,    ERI_ADD_KD,
 ERI_SORT_SQ, ERI_CFRM_YN, ERI_CNCL_YN, ERI_SPMiGUM_YN,
 ERI_INPT_ID, ERI_INPT_DTT)
Values
||:sSQL_ADD
		*/

		sql = "INSERT INTO ET_RSLT_ITEM (ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD, ERI_SPCL_KD, ERI_ADD_KD, ERI_SORT_SQ, ERI_CFRM_YN, ERI_CNCL_YN, ERI_SPMIGUM_YN, ERI_INPT_ID, ERI_INPT_DTT) VALUES ";
		sql += SSQL_ADD;

		stmtExec.executeUpdate(sql);
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_UF_SP2CHA_CREATE_011 \n";
			G_INFO += "설명 : 2차접수생성-검사결과테이블저장(insert) \n";
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
