<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uJobStress_Simple_UF_Save_003.jsp"%>
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

		String QST1_1VL = htMethod.get("QST1_1VL");
		String QST1_2VL = htMethod.get("QST1_2VL");
		String QST1_3VL = htMethod.get("QST1_3VL");
		String QST1_4VL = htMethod.get("QST1_4VL");
		String QST2_5VL = htMethod.get("QST2_5VL");
		String QST2_6VL = htMethod.get("QST2_6VL");
		String QST2_7VL = htMethod.get("QST2_7VL");
		String QST2_8VL = htMethod.get("QST2_8VL");
		String QST3_9VL = htMethod.get("QST3_9VL");
		String QST3_10VL = htMethod.get("QST3_10VL");
		String QST3_11VL = htMethod.get("QST3_11VL");
		String QST4_12VL = htMethod.get("QST4_12VL");
		String QST4_13VL = htMethod.get("QST4_13VL");
		String QST5_14VL = htMethod.get("QST5_14VL");
		String QST5_15VL = htMethod.get("QST5_15VL");
		String QST5_16VL = htMethod.get("QST5_16VL");
		String QST5_17VL = htMethod.get("QST5_17VL");
		String QST6_18VL = htMethod.get("QST6_18VL");
		String QST6_19VL = htMethod.get("QST6_19VL");
		String QST6_20VL = htMethod.get("QST6_20VL");
		String QST7_21VL = htMethod.get("QST7_21VL");
		String QST7_22VL = htMethod.get("QST7_22VL");
		String QST7_23VL = htMethod.get("QST7_23VL");
		String QST7_24VL = htMethod.get("QST7_24VL");
		String RST1_VL = htMethod.get("RST1_VL");
		String RST2_VL = htMethod.get("RST2_VL");
		String RST3_VL = htMethod.get("RST3_VL");
		String RST4_VL = htMethod.get("RST4_VL");
		String RST5_VL = htMethod.get("RST5_VL");
		String RST6_VL = htMethod.get("RST6_VL");
		String RST7_VL = htMethod.get("RST7_VL");
		String RSTT_VL = htMethod.get("RSTT_VL");
		String RSLT_TX = htMethod.get("RSLT_TX");
		String PANJ_DT = htMethod.get("PANJ_DT");
		String DOCT_CD = htMethod.get("DOCT_CD");
		String PANJ_YN = htMethod.get("PANJ_YN");
		String ID = htMethod.get("ID");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(QST1_1VL == null) { QST1_1VL = ""; }
		if(QST1_2VL == null) { QST1_2VL = ""; }
		if(QST1_3VL == null) { QST1_3VL = ""; }
		if(QST1_4VL == null) { QST1_4VL = ""; }
		if(QST2_5VL == null) { QST2_5VL = ""; }
		if(QST2_6VL == null) { QST2_6VL = ""; }
		if(QST2_7VL == null) { QST2_7VL = ""; }
		if(QST2_8VL == null) { QST2_8VL = ""; }
		if(QST3_9VL == null) { QST3_9VL = ""; }
		if(QST3_10VL == null) { QST3_10VL = ""; }
		if(QST3_11VL == null) { QST3_11VL = ""; }
		if(QST4_12VL == null) { QST4_12VL = ""; }
		if(QST4_13VL == null) { QST4_13VL = ""; }
		if(QST5_14VL == null) { QST5_14VL = ""; }
		if(QST5_15VL == null) { QST5_15VL = ""; }
		if(QST5_16VL == null) { QST5_16VL = ""; }
		if(QST5_17VL == null) { QST5_17VL = ""; }
		if(QST6_18VL == null) { QST6_18VL = ""; }
		if(QST6_19VL == null) { QST6_19VL = ""; }
		if(QST6_20VL == null) { QST6_20VL = ""; }
		if(QST7_21VL == null) { QST7_21VL = ""; }
		if(QST7_22VL == null) { QST7_22VL = ""; }
		if(QST7_23VL == null) { QST7_23VL = ""; }
		if(QST7_24VL == null) { QST7_24VL = ""; }
		if(RST1_VL == null) { RST1_VL = ""; }
		if(RST2_VL == null) { RST2_VL = ""; }
		if(RST3_VL == null) { RST3_VL = ""; }
		if(RST4_VL == null) { RST4_VL = ""; }
		if(RST5_VL == null) { RST5_VL = ""; }
		if(RST6_VL == null) { RST6_VL = ""; }
		if(RST7_VL == null) { RST7_VL = ""; }
		if(RSTT_VL == null) { RSTT_VL = ""; }
		if(RSLT_TX == null) { RSLT_TX = ""; }
		if(PANJ_DT == null) { PANJ_DT = ""; }
		if(DOCT_CD == null) { DOCT_CD = ""; }
		if(PANJ_YN == null) { PANJ_YN = ""; }
		if(ID == null) { ID = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uJobStress_Simple_UF_Save_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uJobStress_Simple_UF_Save_003 \n";
			G_INFO += "설명 : 직무스트레스(단축) 검사정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " QST1_1VL : " + QST1_1VL + " \n";
			G_INFO += " QST1_2VL : " + QST1_2VL + " \n";
			G_INFO += " QST1_3VL : " + QST1_3VL + " \n";
			G_INFO += " QST1_4VL : " + QST1_4VL + " \n";
			G_INFO += " QST2_5VL : " + QST2_5VL + " \n";
			G_INFO += " QST2_6VL : " + QST2_6VL + " \n";
			G_INFO += " QST2_7VL : " + QST2_7VL + " \n";
			G_INFO += " QST2_8VL : " + QST2_8VL + " \n";
			G_INFO += " QST3_9VL : " + QST3_9VL + " \n";
			G_INFO += " QST3_10VL : " + QST3_10VL + " \n";
			G_INFO += " QST3_11VL : " + QST3_11VL + " \n";
			G_INFO += " QST4_12VL : " + QST4_12VL + " \n";
			G_INFO += " QST4_13VL : " + QST4_13VL + " \n";
			G_INFO += " QST5_14VL : " + QST5_14VL + " \n";
			G_INFO += " QST5_15VL : " + QST5_15VL + " \n";
			G_INFO += " QST5_16VL : " + QST5_16VL + " \n";
			G_INFO += " QST5_17VL : " + QST5_17VL + " \n";
			G_INFO += " QST6_18VL : " + QST6_18VL + " \n";
			G_INFO += " QST6_19VL : " + QST6_19VL + " \n";
			G_INFO += " QST6_20VL : " + QST6_20VL + " \n";
			G_INFO += " QST7_21VL : " + QST7_21VL + " \n";
			G_INFO += " QST7_22VL : " + QST7_22VL + " \n";
			G_INFO += " QST7_23VL : " + QST7_23VL + " \n";
			G_INFO += " QST7_24VL : " + QST7_24VL + " \n";
			G_INFO += " RST1_VL : " + RST1_VL + " \n";
			G_INFO += " RST2_VL : " + RST2_VL + " \n";
			G_INFO += " RST3_VL : " + RST3_VL + " \n";
			G_INFO += " RST4_VL : " + RST4_VL + " \n";
			G_INFO += " RST5_VL : " + RST5_VL + " \n";
			G_INFO += " RST6_VL : " + RST6_VL + " \n";
			G_INFO += " RST7_VL : " + RST7_VL + " \n";
			G_INFO += " RSTT_VL : " + RSTT_VL + " \n";
			G_INFO += " RSLT_TX : " + RSLT_TX + " \n";
			G_INFO += " PANJ_DT : " + PANJ_DT + " \n";
			G_INFO += " DOCT_CD : " + DOCT_CD + " \n";
			G_INFO += " PANJ_YN : " + PANJ_YN + " \n";
			G_INFO += " ID : " + ID + " \n";
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
