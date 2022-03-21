<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uEmotional_Labor_UF_Save_002.jsp"%>
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

		String ISEMPTY = htMethod.get("ISEMPTY");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String QST1_1VL = htMethod.get("QST1_1VL");
		String QST1_2VL = htMethod.get("QST1_2VL");
		String QST1_3VL = htMethod.get("QST1_3VL");
		String QST1_4VL = htMethod.get("QST1_4VL");
		String QST1_5VL = htMethod.get("QST1_5VL");
		String QST1_6VL = htMethod.get("QST1_6VL");
		String QST1_7VL = htMethod.get("QST1_7VL");
		String QST1_8VL = htMethod.get("QST1_8VL");
		String QST1_9VL = htMethod.get("QST1_9VL");
		String QST1_10VL = htMethod.get("QST1_10VL");
		String QST1_11VL = htMethod.get("QST1_11VL");
		String QST1_12VL = htMethod.get("QST1_12VL");
		String QST1_13VL = htMethod.get("QST1_13VL");
		String QST1_14VL = htMethod.get("QST1_14VL");
		String QST1_15VL = htMethod.get("QST1_15VL");
		String QST1_16VL = htMethod.get("QST1_16VL");
		String QST1_17VL = htMethod.get("QST1_17VL");
		String QST1_18VL = htMethod.get("QST1_18VL");
		String QST1_19VL = htMethod.get("QST1_19VL");
		String QST1_20VL = htMethod.get("QST1_20VL");
		String QST1_21VL = htMethod.get("QST1_21VL");
		String QST1_22VL = htMethod.get("QST1_22VL");
		String QST1_23VL = htMethod.get("QST1_23VL");
		String QST1_24VL = htMethod.get("QST1_24VL");
		String PANJ_DT = htMethod.get("PANJ_DT");
		String RST1_VL = htMethod.get("RST1_VL");
		String RST2_VL = htMethod.get("RST2_VL");
		String RST3_VL = htMethod.get("RST3_VL");
		String RST4_VL = htMethod.get("RST4_VL");
		String RST5_VL = htMethod.get("RST5_VL");
		String RSLT_TX = htMethod.get("RSLT_TX");
		String DOCT_CD = htMethod.get("DOCT_CD");
		String PANJ_YN = htMethod.get("PANJ_YN");
		String INPUT_ID = htMethod.get("INPUT_ID");

		//
		if(ISEMPTY == null) { ISEMPTY = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(QST1_1VL == null) { QST1_1VL = ""; }
		if(QST1_2VL == null) { QST1_2VL = ""; }
		if(QST1_3VL == null) { QST1_3VL = ""; }
		if(QST1_4VL == null) { QST1_4VL = ""; }
		if(QST1_5VL == null) { QST1_5VL = ""; }
		if(QST1_6VL == null) { QST1_6VL = ""; }
		if(QST1_7VL == null) { QST1_7VL = ""; }
		if(QST1_8VL == null) { QST1_8VL = ""; }
		if(QST1_9VL == null) { QST1_9VL = ""; }
		if(QST1_10VL == null) { QST1_10VL = ""; }
		if(QST1_11VL == null) { QST1_11VL = ""; }
		if(QST1_12VL == null) { QST1_12VL = ""; }
		if(QST1_13VL == null) { QST1_13VL = ""; }
		if(QST1_14VL == null) { QST1_14VL = ""; }
		if(QST1_15VL == null) { QST1_15VL = ""; }
		if(QST1_16VL == null) { QST1_16VL = ""; }
		if(QST1_17VL == null) { QST1_17VL = ""; }
		if(QST1_18VL == null) { QST1_18VL = ""; }
		if(QST1_19VL == null) { QST1_19VL = ""; }
		if(QST1_20VL == null) { QST1_20VL = ""; }
		if(QST1_21VL == null) { QST1_21VL = ""; }
		if(QST1_22VL == null) { QST1_22VL = ""; }
		if(QST1_23VL == null) { QST1_23VL = ""; }
		if(QST1_24VL == null) { QST1_24VL = ""; }
		if(PANJ_DT == null) { PANJ_DT = ""; }
		if(RST1_VL == null) { RST1_VL = ""; }
		if(RST2_VL == null) { RST2_VL = ""; }
		if(RST3_VL == null) { RST3_VL = ""; }
		if(RST4_VL == null) { RST4_VL = ""; }
		if(RST5_VL == null) { RST5_VL = ""; }
		if(RSLT_TX == null) { RSLT_TX = ""; }
		if(DOCT_CD == null) { DOCT_CD = ""; }
		if(PANJ_YN == null) { PANJ_YN = ""; }
		if(INPUT_ID == null) { INPUT_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uEmotional_Labor_UF_Save_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uEmotional_Labor_UF_Save_002 \n";
			G_INFO += "설명 : 평가 상세정보 추가/수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ISEMPTY : " + ISEMPTY + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " QST1_1VL : " + QST1_1VL + " \n";
			G_INFO += " QST1_2VL : " + QST1_2VL + " \n";
			G_INFO += " QST1_3VL : " + QST1_3VL + " \n";
			G_INFO += " QST1_4VL : " + QST1_4VL + " \n";
			G_INFO += " QST1_5VL : " + QST1_5VL + " \n";
			G_INFO += " QST1_6VL : " + QST1_6VL + " \n";
			G_INFO += " QST1_7VL : " + QST1_7VL + " \n";
			G_INFO += " QST1_8VL : " + QST1_8VL + " \n";
			G_INFO += " QST1_9VL : " + QST1_9VL + " \n";
			G_INFO += " QST1_10VL : " + QST1_10VL + " \n";
			G_INFO += " QST1_11VL : " + QST1_11VL + " \n";
			G_INFO += " QST1_12VL : " + QST1_12VL + " \n";
			G_INFO += " QST1_13VL : " + QST1_13VL + " \n";
			G_INFO += " QST1_14VL : " + QST1_14VL + " \n";
			G_INFO += " QST1_15VL : " + QST1_15VL + " \n";
			G_INFO += " QST1_16VL : " + QST1_16VL + " \n";
			G_INFO += " QST1_17VL : " + QST1_17VL + " \n";
			G_INFO += " QST1_18VL : " + QST1_18VL + " \n";
			G_INFO += " QST1_19VL : " + QST1_19VL + " \n";
			G_INFO += " QST1_20VL : " + QST1_20VL + " \n";
			G_INFO += " QST1_21VL : " + QST1_21VL + " \n";
			G_INFO += " QST1_22VL : " + QST1_22VL + " \n";
			G_INFO += " QST1_23VL : " + QST1_23VL + " \n";
			G_INFO += " QST1_24VL : " + QST1_24VL + " \n";
			G_INFO += " PANJ_DT : " + PANJ_DT + " \n";
			G_INFO += " RST1_VL : " + RST1_VL + " \n";
			G_INFO += " RST2_VL : " + RST2_VL + " \n";
			G_INFO += " RST3_VL : " + RST3_VL + " \n";
			G_INFO += " RST4_VL : " + RST4_VL + " \n";
			G_INFO += " RST5_VL : " + RST5_VL + " \n";
			G_INFO += " RSLT_TX : " + RSLT_TX + " \n";
			G_INFO += " DOCT_CD : " + DOCT_CD + " \n";
			G_INFO += " PANJ_YN : " + PANJ_YN + " \n";
			G_INFO += " INPUT_ID : " + INPUT_ID + " \n";
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
