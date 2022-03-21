<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uItem_Vldt_Apply_ufSaveCommonInfo_001.jsp"%>
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

		String IIV_TREF_CD = htMethod.get("IIV_TREF_CD");
		String IIV_RSLT_UNIT = htMethod.get("IIV_RSLT_UNIT");
		String IIV_RSPT_CNT = htMethod.get("IIV_RSPT_CNT");
		String IIV_RSZR_KD = htMethod.get("IIV_RSZR_KD");
		String IIV_ITEM_CD = htMethod.get("IIV_ITEM_CD");
		String IIV_APLY_DT = htMethod.get("IIV_APLY_DT");
		String IIV_EXAM_CD = htMethod.get("IIV_EXAM_CD");

		//
		if(IIV_TREF_CD == null) { IIV_TREF_CD = ""; }
		if(IIV_RSLT_UNIT == null) { IIV_RSLT_UNIT = ""; }
		if(IIV_RSPT_CNT == null) { IIV_RSPT_CNT = ""; }
		if(IIV_RSZR_KD == null) { IIV_RSZR_KD = ""; }
		if(IIV_ITEM_CD == null) { IIV_ITEM_CD = ""; }
		if(IIV_APLY_DT == null) { IIV_APLY_DT = ""; }
		if(IIV_EXAM_CD == null) { IIV_EXAM_CD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uItem_Vldt_Apply_ufSaveCommonInfo_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Vldt_Apply_ufSaveCommonInfo_001 \n";
			G_INFO += "설명 : 참고치 update(일부 정보) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IIV_TREF_CD : " + IIV_TREF_CD + " \n";
			G_INFO += " IIV_RSLT_UNIT : " + IIV_RSLT_UNIT + " \n";
			G_INFO += " IIV_RSPT_CNT : " + IIV_RSPT_CNT + " \n";
			G_INFO += " IIV_RSZR_KD : " + IIV_RSZR_KD + " \n";
			G_INFO += " IIV_ITEM_CD : " + IIV_ITEM_CD + " \n";
			G_INFO += " IIV_APLY_DT : " + IIV_APLY_DT + " \n";
			G_INFO += " IIV_EXAM_CD : " + IIV_EXAM_CD + " \n";
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
