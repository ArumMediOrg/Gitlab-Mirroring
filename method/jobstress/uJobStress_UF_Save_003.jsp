<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uJobStress_UF_Save_003.jsp"%>
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
		String QST2_4VL = htMethod.get("QST2_4VL");
		String QST2_5VL = htMethod.get("QST2_5VL");
		String QST2_6VL = htMethod.get("QST2_6VL");
		String QST2_7VL = htMethod.get("QST2_7VL");
		String QST2_8VL = htMethod.get("QST2_8VL");
		String QST2_9VL = htMethod.get("QST2_9VL");
		String QST2_10VL = htMethod.get("QST2_10VL");
		String QST2_11VL = htMethod.get("QST2_11VL");
		String QST3_12VL = htMethod.get("QST3_12VL");
		String QST3_13VL = htMethod.get("QST3_13VL");
		String QST3_14VL = htMethod.get("QST3_14VL");
		String QST3_15VL = htMethod.get("QST3_15VL");
		String QST3_16VL = htMethod.get("QST3_16VL");
		String QST4_17VL = htMethod.get("QST4_17VL");
		String QST4_18VL = htMethod.get("QST4_18VL");
		String QST4_19VL = htMethod.get("QST4_19VL");
		String QST4_20VL = htMethod.get("QST4_20VL");
		String QST5_21VL = htMethod.get("QST5_21VL");
		String QST5_22VL = htMethod.get("QST5_22VL");
		String QST5_23VL = htMethod.get("QST5_23VL");
		String QST5_24VL = htMethod.get("QST5_24VL");
		String QST5_25VL = htMethod.get("QST5_25VL");
		String QST5_26VL = htMethod.get("QST5_26VL");
		String QST6_27VL = htMethod.get("QST6_27VL");
		String QST6_28VL = htMethod.get("QST6_28VL");
		String QST6_29VL = htMethod.get("QST6_29VL");
		String QST6_30VL = htMethod.get("QST6_30VL");
		String QST6_31VL = htMethod.get("QST6_31VL");
		String QST6_32VL = htMethod.get("QST6_32VL");
		String QST6_33VL = htMethod.get("QST6_33VL");
		String QST7_34VL = htMethod.get("QST7_34VL");
		String QST7_35VL = htMethod.get("QST7_35VL");
		String QST7_36VL = htMethod.get("QST7_36VL");
		String QST7_37VL = htMethod.get("QST7_37VL");
		String QST7_38VL = htMethod.get("QST7_38VL");
		String QST7_39VL = htMethod.get("QST7_39VL");
		String QST8_40VL = htMethod.get("QST8_40VL");
		String QST8_41VL = htMethod.get("QST8_41VL");
		String QST8_42VL = htMethod.get("QST8_42VL");
		String QST8_43VL = htMethod.get("QST8_43VL");
		String RST1_VL = htMethod.get("RST1_VL");
		String RST2_VL = htMethod.get("RST2_VL");
		String RST3_VL = htMethod.get("RST3_VL");
		String RST4_VL = htMethod.get("RST4_VL");
		String RST5_VL = htMethod.get("RST5_VL");
		String RST6_VL = htMethod.get("RST6_VL");
		String RST7_VL = htMethod.get("RST7_VL");
		String RST8_VL = htMethod.get("RST8_VL");
		String RSTT_VL = htMethod.get("RSTT_VL");
		String RSLT_TX = htMethod.get("RSLT_TX");
		String PANJ_DT = htMethod.get("PANJ_DT");
		String DOCT_CD = htMethod.get("DOCT_CD");
		String PANJ_YN = htMethod.get("PANJ_YN");
		String MODI_ID = htMethod.get("MODI_ID");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(QST1_1VL == null) { QST1_1VL = ""; }
		if(QST1_2VL == null) { QST1_2VL = ""; }
		if(QST1_3VL == null) { QST1_3VL = ""; }
		if(QST2_4VL == null) { QST2_4VL = ""; }
		if(QST2_5VL == null) { QST2_5VL = ""; }
		if(QST2_6VL == null) { QST2_6VL = ""; }
		if(QST2_7VL == null) { QST2_7VL = ""; }
		if(QST2_8VL == null) { QST2_8VL = ""; }
		if(QST2_9VL == null) { QST2_9VL = ""; }
		if(QST2_10VL == null) { QST2_10VL = ""; }
		if(QST2_11VL == null) { QST2_11VL = ""; }
		if(QST3_12VL == null) { QST3_12VL = ""; }
		if(QST3_13VL == null) { QST3_13VL = ""; }
		if(QST3_14VL == null) { QST3_14VL = ""; }
		if(QST3_15VL == null) { QST3_15VL = ""; }
		if(QST3_16VL == null) { QST3_16VL = ""; }
		if(QST4_17VL == null) { QST4_17VL = ""; }
		if(QST4_18VL == null) { QST4_18VL = ""; }
		if(QST4_19VL == null) { QST4_19VL = ""; }
		if(QST4_20VL == null) { QST4_20VL = ""; }
		if(QST5_21VL == null) { QST5_21VL = ""; }
		if(QST5_22VL == null) { QST5_22VL = ""; }
		if(QST5_23VL == null) { QST5_23VL = ""; }
		if(QST5_24VL == null) { QST5_24VL = ""; }
		if(QST5_25VL == null) { QST5_25VL = ""; }
		if(QST5_26VL == null) { QST5_26VL = ""; }
		if(QST6_27VL == null) { QST6_27VL = ""; }
		if(QST6_28VL == null) { QST6_28VL = ""; }
		if(QST6_29VL == null) { QST6_29VL = ""; }
		if(QST6_30VL == null) { QST6_30VL = ""; }
		if(QST6_31VL == null) { QST6_31VL = ""; }
		if(QST6_32VL == null) { QST6_32VL = ""; }
		if(QST6_33VL == null) { QST6_33VL = ""; }
		if(QST7_34VL == null) { QST7_34VL = ""; }
		if(QST7_35VL == null) { QST7_35VL = ""; }
		if(QST7_36VL == null) { QST7_36VL = ""; }
		if(QST7_37VL == null) { QST7_37VL = ""; }
		if(QST7_38VL == null) { QST7_38VL = ""; }
		if(QST7_39VL == null) { QST7_39VL = ""; }
		if(QST8_40VL == null) { QST8_40VL = ""; }
		if(QST8_41VL == null) { QST8_41VL = ""; }
		if(QST8_42VL == null) { QST8_42VL = ""; }
		if(QST8_43VL == null) { QST8_43VL = ""; }
		if(RST1_VL == null) { RST1_VL = ""; }
		if(RST2_VL == null) { RST2_VL = ""; }
		if(RST3_VL == null) { RST3_VL = ""; }
		if(RST4_VL == null) { RST4_VL = ""; }
		if(RST5_VL == null) { RST5_VL = ""; }
		if(RST6_VL == null) { RST6_VL = ""; }
		if(RST7_VL == null) { RST7_VL = ""; }
		if(RST8_VL == null) { RST8_VL = ""; }
		if(RSTT_VL == null) { RSTT_VL = ""; }
		if(RSLT_TX == null) { RSLT_TX = ""; }
		if(PANJ_DT == null) { PANJ_DT = ""; }
		if(DOCT_CD == null) { DOCT_CD = ""; }
		if(PANJ_YN == null) { PANJ_YN = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uJobStress_UF_Save_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uJobStress_UF_Save_003 \n";
			G_INFO += "설명 : 직무스트레스 정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " QST1_1VL : " + QST1_1VL + " \n";
			G_INFO += " QST1_2VL : " + QST1_2VL + " \n";
			G_INFO += " QST1_3VL : " + QST1_3VL + " \n";
			G_INFO += " QST2_4VL : " + QST2_4VL + " \n";
			G_INFO += " QST2_5VL : " + QST2_5VL + " \n";
			G_INFO += " QST2_6VL : " + QST2_6VL + " \n";
			G_INFO += " QST2_7VL : " + QST2_7VL + " \n";
			G_INFO += " QST2_8VL : " + QST2_8VL + " \n";
			G_INFO += " QST2_9VL : " + QST2_9VL + " \n";
			G_INFO += " QST2_10VL : " + QST2_10VL + " \n";
			G_INFO += " QST2_11VL : " + QST2_11VL + " \n";
			G_INFO += " QST3_12VL : " + QST3_12VL + " \n";
			G_INFO += " QST3_13VL : " + QST3_13VL + " \n";
			G_INFO += " QST3_14VL : " + QST3_14VL + " \n";
			G_INFO += " QST3_15VL : " + QST3_15VL + " \n";
			G_INFO += " QST3_16VL : " + QST3_16VL + " \n";
			G_INFO += " QST4_17VL : " + QST4_17VL + " \n";
			G_INFO += " QST4_18VL : " + QST4_18VL + " \n";
			G_INFO += " QST4_19VL : " + QST4_19VL + " \n";
			G_INFO += " QST4_20VL : " + QST4_20VL + " \n";
			G_INFO += " QST5_21VL : " + QST5_21VL + " \n";
			G_INFO += " QST5_22VL : " + QST5_22VL + " \n";
			G_INFO += " QST5_23VL : " + QST5_23VL + " \n";
			G_INFO += " QST5_24VL : " + QST5_24VL + " \n";
			G_INFO += " QST5_25VL : " + QST5_25VL + " \n";
			G_INFO += " QST5_26VL : " + QST5_26VL + " \n";
			G_INFO += " QST6_27VL : " + QST6_27VL + " \n";
			G_INFO += " QST6_28VL : " + QST6_28VL + " \n";
			G_INFO += " QST6_29VL : " + QST6_29VL + " \n";
			G_INFO += " QST6_30VL : " + QST6_30VL + " \n";
			G_INFO += " QST6_31VL : " + QST6_31VL + " \n";
			G_INFO += " QST6_32VL : " + QST6_32VL + " \n";
			G_INFO += " QST6_33VL : " + QST6_33VL + " \n";
			G_INFO += " QST7_34VL : " + QST7_34VL + " \n";
			G_INFO += " QST7_35VL : " + QST7_35VL + " \n";
			G_INFO += " QST7_36VL : " + QST7_36VL + " \n";
			G_INFO += " QST7_37VL : " + QST7_37VL + " \n";
			G_INFO += " QST7_38VL : " + QST7_38VL + " \n";
			G_INFO += " QST7_39VL : " + QST7_39VL + " \n";
			G_INFO += " QST8_40VL : " + QST8_40VL + " \n";
			G_INFO += " QST8_41VL : " + QST8_41VL + " \n";
			G_INFO += " QST8_42VL : " + QST8_42VL + " \n";
			G_INFO += " QST8_43VL : " + QST8_43VL + " \n";
			G_INFO += " RST1_VL : " + RST1_VL + " \n";
			G_INFO += " RST2_VL : " + RST2_VL + " \n";
			G_INFO += " RST3_VL : " + RST3_VL + " \n";
			G_INFO += " RST4_VL : " + RST4_VL + " \n";
			G_INFO += " RST5_VL : " + RST5_VL + " \n";
			G_INFO += " RST6_VL : " + RST6_VL + " \n";
			G_INFO += " RST7_VL : " + RST7_VL + " \n";
			G_INFO += " RST8_VL : " + RST8_VL + " \n";
			G_INFO += " RSTT_VL : " + RSTT_VL + " \n";
			G_INFO += " RSLT_TX : " + RSLT_TX + " \n";
			G_INFO += " PANJ_DT : " + PANJ_DT + " \n";
			G_INFO += " DOCT_CD : " + DOCT_CD + " \n";
			G_INFO += " PANJ_YN : " + PANJ_YN + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
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
