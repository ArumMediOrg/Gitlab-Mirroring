<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uFM_AcptComm_GF_SaveExamItem_002.jsp"%>
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
		String ORDER_DTT = htMethod.get("ORDER_DTT");
		String ORDER_CD = htMethod.get("ORDER_CD");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String LINK_NO = htMethod.get("LINK_NO");
		String FST_KD = htMethod.get("FST_KD");
		String OPTN_KD = htMethod.get("OPTN_KD");
		String ADD_KD = htMethod.get("ADD_KD");
		String PRGS_KD = htMethod.get("PRGS_KD");
		String HTSB_KD = htMethod.get("HTSB_KD");
		String CAN_KD = htMethod.get("CAN_KD");
		String SPSB_KD = htMethod.get("SPSB_KD");
		String CVSB_KD = htMethod.get("CVSB_KD");
		String EMSB_KD = htMethod.get("EMSB_KD");
		String ETSB_KD = htMethod.get("ETSB_KD");
		String ORG_PR = htMethod.get("ORG_PR");
		String FST_PR = htMethod.get("FST_PR");
		String ADD_PR = htMethod.get("ADD_PR");
		String PRGS_PR = htMethod.get("PRGS_PR");
		String HTSB_PR = htMethod.get("HTSB_PR");
		String CAN_PR = htMethod.get("CAN_PR");
		String SPSB_PR = htMethod.get("SPSB_PR");
		String SPHT_PR = htMethod.get("SPHT_PR");
		String SPFS_PR = htMethod.get("SPFS_PR");
		String CVSB_PR = htMethod.get("CVSB_PR");
		String CVFS_PR = htMethod.get("CVFS_PR");
		String EMSB_PR = htMethod.get("EMSB_PR");
		String EMFS_PR = htMethod.get("EMFS_PR");
		String ETSB_PR = htMethod.get("ETSB_PR");
		String ETFS_PR = htMethod.get("ETFS_PR");
		String INPT_ID = htMethod.get("INPT_ID");
		String MODI_ID = htMethod.get("MODI_ID");
		String DISC_RT = htMethod.get("DISC_RT");
		String DISC_PR = htMethod.get("DISC_PR");



		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ORDER_DTT == null) { ORDER_DTT = ""; }
		if(ORDER_CD == null) { ORDER_CD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(LINK_NO == null) { LINK_NO = ""; }
		if(FST_KD == null) { FST_KD = ""; }
		if(OPTN_KD == null) { OPTN_KD = ""; }
		if(ADD_KD == null) { ADD_KD = ""; }
		if(PRGS_KD == null) { PRGS_KD = ""; }
		if(HTSB_KD == null) { HTSB_KD = ""; }
		if(CAN_KD == null) { CAN_KD = ""; }
		if(SPSB_KD == null) { SPSB_KD = ""; }
		if(CVSB_KD == null) { CVSB_KD = ""; }
		if(EMSB_KD == null) { EMSB_KD = ""; }
		if(ETSB_KD == null) { ETSB_KD = ""; }
		if(ORG_PR == null) { ORG_PR = ""; }
		if(FST_PR == null) { FST_PR = ""; }
		if(ADD_PR == null) { ADD_PR = ""; }
		if(PRGS_PR == null) { PRGS_PR = ""; }
		if(HTSB_PR == null) { HTSB_PR = ""; }
		if(CAN_PR == null) { CAN_PR = ""; }
		if(SPSB_PR == null) { SPSB_PR = ""; }
		if(SPHT_PR == null) { SPHT_PR = ""; }
		if(SPFS_PR == null) { SPFS_PR = ""; }
		if(CVSB_PR == null) { CVSB_PR = ""; }
		if(CVFS_PR == null) { CVFS_PR = ""; }
		if(EMSB_PR == null) { EMSB_PR = ""; }
		if(EMFS_PR == null) { EMFS_PR = ""; }
		if(ETSB_PR == null) { ETSB_PR = ""; }
		if(ETFS_PR == null) { ETFS_PR = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(DISC_RT == null) { DISC_RT = ""; }
		if(DISC_PR == null) { DISC_PR = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uFM_AcptComm_GF_SaveExamItem_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_SaveExamItem_002 \n";
			G_INFO += "설명 : 검사항목별 수가정보 저장-2 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " ORDER_DTT : " + ORDER_DTT + " \n";
			G_INFO += " ORDER_CD : " + ORDER_CD + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " LINK_NO : " + LINK_NO + " \n";
			G_INFO += " FST_KD : " + FST_KD + " \n";
			G_INFO += " OPTN_KD : " + OPTN_KD + " \n";
			G_INFO += " ADD_KD : " + ADD_KD + " \n";
			G_INFO += " PRGS_KD : " + PRGS_KD + " \n";
			G_INFO += " HTSB_KD : " + HTSB_KD + " \n";
			G_INFO += " CAN_KD : " + CAN_KD + " \n";
			G_INFO += " SPSB_KD : " + SPSB_KD + " \n";
			G_INFO += " CVSB_KD : " + CVSB_KD + " \n";
			G_INFO += " EMSB_KD : " + EMSB_KD + " \n";
			G_INFO += " ETSB_KD : " + ETSB_KD + " \n";
			G_INFO += " ORG_PR : " + ORG_PR + " \n";
			G_INFO += " FST_PR : " + FST_PR + " \n";
			G_INFO += " ADD_PR : " + ADD_PR + " \n";
			G_INFO += " PRGS_PR : " + PRGS_PR + " \n";
			G_INFO += " HTSB_PR : " + HTSB_PR + " \n";
			G_INFO += " CAN_PR : " + CAN_PR + " \n";
			G_INFO += " SPSB_PR : " + SPSB_PR + " \n";
			G_INFO += " SPHT_PR : " + SPHT_PR + " \n";
			G_INFO += " SPFS_PR : " + SPFS_PR + " \n";
			G_INFO += " CVSB_PR : " + CVSB_PR + " \n";
			G_INFO += " CVFS_PR : " + CVFS_PR + " \n";
			G_INFO += " EMSB_PR : " + EMSB_PR + " \n";
			G_INFO += " EMFS_PR : " + EMFS_PR + " \n";
			G_INFO += " ETSB_PR : " + ETSB_PR + " \n";
			G_INFO += " ETFS_PR : " + ETFS_PR + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " DISC_RT : " + DISC_RT + " \n";
			G_INFO += " DISC_PR : " + DISC_PR + " \n";
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
