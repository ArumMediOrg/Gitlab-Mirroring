<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uItem_Vldt_Apply_ufSave_001.jsp"%>
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
		String IIV_APLY_DT = htMethod.get("IIV_APLY_DT");
		String IIV_ITEM_CD = htMethod.get("IIV_ITEM_CD");
		String IIV_SEX_CD = htMethod.get("IIV_SEX_CD");
		String IIV_AGE_FR = htMethod.get("IIV_AGE_FR");
		String IIV_AGE_TO = htMethod.get("IIV_AGE_TO");
		String IIV_EXAM_CD = htMethod.get("IIV_EXAM_CD");
		String IIV_DOCT_ID = htMethod.get("IIV_DOCT_ID");
		String IIV_LOW_KD = htMethod.get("IIV_LOW_KD");
		String IIV_RSLT_LOW = htMethod.get("IIV_RSLT_LOW");
		String IIV_HIGH_KD = htMethod.get("IIV_HIGH_KD");
		String IIV_RSLT_HIGH = htMethod.get("IIV_RSLT_HIGH");
		String IIV_TREF_CD = htMethod.get("IIV_TREF_CD");
		String IIV_RSLT_UNIT = htMethod.get("IIV_RSLT_UNIT");
		String IIV_RSPT_CNT = htMethod.get("IIV_RSPT_CNT");
		String IIV_RSZR_KD = htMethod.get("IIV_RSZR_KD");
		String IIV_PANJ_CD = htMethod.get("IIV_PANJ_CD");
		String IIV_CHAR_VAL = htMethod.get("IIV_CHAR_VAL");
		String IIV_SPCV_CD = htMethod.get("IIV_SPCV_CD");
		String IIV_USE_YN = htMethod.get("IIV_USE_YN");
		String IIV_INPT_ID = htMethod.get("IIV_INPT_ID");

		//
		if(SMODE == null) { SMODE = ""; }
		if(IIV_APLY_DT == null) { IIV_APLY_DT = ""; }
		if(IIV_ITEM_CD == null) { IIV_ITEM_CD = ""; }
		if(IIV_SEX_CD == null) { IIV_SEX_CD = ""; }
		if(IIV_AGE_FR == null) { IIV_AGE_FR = ""; }
		if(IIV_AGE_TO == null) { IIV_AGE_TO = ""; }
		if(IIV_EXAM_CD == null) { IIV_EXAM_CD = ""; }
		if(IIV_DOCT_ID == null) { IIV_DOCT_ID = ""; }
		if(IIV_LOW_KD == null) { IIV_LOW_KD = ""; }
		if(IIV_RSLT_LOW == null) { IIV_RSLT_LOW = ""; }
		if(IIV_HIGH_KD == null) { IIV_HIGH_KD = ""; }
		if(IIV_RSLT_HIGH == null) { IIV_RSLT_HIGH = ""; }
		if(IIV_TREF_CD == null) { IIV_TREF_CD = ""; }
		if(IIV_RSLT_UNIT == null) { IIV_RSLT_UNIT = ""; }
		if(IIV_RSPT_CNT == null) { IIV_RSPT_CNT = ""; }
		if(IIV_RSZR_KD == null) { IIV_RSZR_KD = ""; }
		if(IIV_PANJ_CD == null) { IIV_PANJ_CD = ""; }
		if(IIV_CHAR_VAL == null) { IIV_CHAR_VAL = ""; }
		if(IIV_SPCV_CD == null) { IIV_SPCV_CD = ""; }
		if(IIV_USE_YN == null) { IIV_USE_YN = ""; }
		if(IIV_INPT_ID == null) { IIV_INPT_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uItem_Vldt_Apply_ufSave_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Vldt_Apply_ufSave_001 \n";
			G_INFO += "설명 : 참고치 저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " IIV_APLY_DT : " + IIV_APLY_DT + " \n";
			G_INFO += " IIV_ITEM_CD : " + IIV_ITEM_CD + " \n";
			G_INFO += " IIV_SEX_CD : " + IIV_SEX_CD + " \n";
			G_INFO += " IIV_AGE_FR : " + IIV_AGE_FR + " \n";
			G_INFO += " IIV_AGE_TO : " + IIV_AGE_TO + " \n";
			G_INFO += " IIV_EXAM_CD : " + IIV_EXAM_CD + " \n";
			G_INFO += " IIV_DOCT_ID : " + IIV_DOCT_ID + " \n";
			G_INFO += " IIV_LOW_KD : " + IIV_LOW_KD + " \n";
			G_INFO += " IIV_RSLT_LOW : " + IIV_RSLT_LOW + " \n";
			G_INFO += " IIV_HIGH_KD : " + IIV_HIGH_KD + " \n";
			G_INFO += " IIV_RSLT_HIGH : " + IIV_RSLT_HIGH + " \n";
			G_INFO += " IIV_TREF_CD : " + IIV_TREF_CD + " \n";
			G_INFO += " IIV_RSLT_UNIT : " + IIV_RSLT_UNIT + " \n";
			G_INFO += " IIV_RSPT_CNT : " + IIV_RSPT_CNT + " \n";
			G_INFO += " IIV_RSZR_KD : " + IIV_RSZR_KD + " \n";
			G_INFO += " IIV_PANJ_CD : " + IIV_PANJ_CD + " \n";
			G_INFO += " IIV_CHAR_VAL : " + IIV_CHAR_VAL + " \n";
			G_INFO += " IIV_SPCV_CD : " + IIV_SPCV_CD + " \n";
			G_INFO += " IIV_USE_YN : " + IIV_USE_YN + " \n";
			G_INFO += " IIV_INPT_ID : " + IIV_INPT_ID + " \n";
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
