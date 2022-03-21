<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uDT_CCDT_PANJ_UP_Save_001.jsp"%>
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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String SMOK_YN = htMethod.get("SMOK_YN");
		String DRINK_YN = htMethod.get("DRINK_YN");
		String SPORT_KD = htMethod.get("SPORT_KD");
		String PAST_LT = htMethod.get("PAST_LT");
		String FMGN_KD = htMethod.get("FMGN_KD");
		String FMAG_INT = htMethod.get("FMAG_INT");
		String FMSC_KD = htMethod.get("FMSC_KD");
		String TARG_KD = htMethod.get("TARG_KD");
		String SICK_KD = htMethod.get("SICK_KD");
		String PAN_KD = htMethod.get("PAN_KD");
		String WORK_KD = htMethod.get("WORK_KD");
		String SOKUN_LT = htMethod.get("SOKUN_LT");
		String INJA_CNT = htMethod.get("INJA_CNT");
		String INJA_LT = htMethod.get("INJA_LT");
		String BD_LT = htMethod.get("BD_LT");
		String PAN_DT = htMethod.get("PAN_DT");
		String DOCT_CD = htMethod.get("DOCT_CD");
		String COMP_YN = htMethod.get("COMP_YN");
		String INPT_ID = htMethod.get("INPT_ID");
		String FMSEX_CD = htMethod.get("FMSEX_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(SMOK_YN == null) { SMOK_YN = ""; }
		if(DRINK_YN == null) { DRINK_YN = ""; }
		if(SPORT_KD == null) { SPORT_KD = ""; }
		if(PAST_LT == null) { PAST_LT = ""; }
		if(FMGN_KD == null) { FMGN_KD = ""; }
		if(FMAG_INT == null) { FMAG_INT = ""; }
		if(FMSC_KD == null) { FMSC_KD = ""; }
		if(TARG_KD == null) { TARG_KD = ""; }
		if(SICK_KD == null) { SICK_KD = ""; }
		if(PAN_KD == null) { PAN_KD = ""; }
		if(WORK_KD == null) { WORK_KD = ""; }
		if(SOKUN_LT == null) { SOKUN_LT = ""; }
		if(INJA_CNT == null) { INJA_CNT = ""; }
		if(INJA_LT == null) { INJA_LT = ""; }
		if(BD_LT == null) { BD_LT = ""; }
		if(PAN_DT == null) { PAN_DT = ""; }
		if(DOCT_CD == null) { DOCT_CD = ""; }
		if(COMP_YN == null) { COMP_YN = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(FMSEX_CD == null) { FMSEX_CD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uDT_CCDT_PANJ_UP_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDT_CCDT_PANJ_UP_Save_001 \n";
			G_INFO += "설명 : 판정정보 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " SMOK_YN : " + SMOK_YN + " \n";
			G_INFO += " DRINK_YN : " + DRINK_YN + " \n";
			G_INFO += " SPORT_KD : " + SPORT_KD + " \n";
			G_INFO += " PAST_LT : " + PAST_LT + " \n";
			G_INFO += " FMGN_KD : " + FMGN_KD + " \n";
			G_INFO += " FMAG_INT : " + FMAG_INT + " \n";
			G_INFO += " FMSC_KD : " + FMSC_KD + " \n";
			G_INFO += " TARG_KD : " + TARG_KD + " \n";
			G_INFO += " SICK_KD : " + SICK_KD + " \n";
			G_INFO += " PAN_KD : " + PAN_KD + " \n";
			G_INFO += " WORK_KD : " + WORK_KD + " \n";
			G_INFO += " SOKUN_LT : " + SOKUN_LT + " \n";
			G_INFO += " INJA_CNT : " + INJA_CNT + " \n";
			G_INFO += " INJA_LT : " + INJA_LT + " \n";
			G_INFO += " BD_LT : " + BD_LT + " \n";
			G_INFO += " PAN_DT : " + PAN_DT + " \n";
			G_INFO += " DOCT_CD : " + DOCT_CD + " \n";
			G_INFO += " COMP_YN : " + COMP_YN + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " FMSEX_CD : " + FMSEX_CD + " \n";
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
