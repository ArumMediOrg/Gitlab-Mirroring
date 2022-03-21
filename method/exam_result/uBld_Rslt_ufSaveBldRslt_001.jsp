<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;
	CallableStatement CallStmtExec = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String RSLT_VL = htMethod.get("RSLT_VL");
		String VLDT_LH = htMethod.get("VLDT_LH");
		String PRCH_VL = htMethod.get("PRCH_VL");
		String PRNM_VL = htMethod.get("PRNM_VL");
		String CHAR_CD = htMethod.get("CHAR_CD");
		String HERT_CD = htMethod.get("HERT_CD");
		String SPRT_CD = htMethod.get("SPRT_CD");
		String MODI_ID = htMethod.get("MODI_ID");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String ITEM_CD = htMethod.get("ITEM_CD");

		//
		if(RSLT_VL == null) { RSLT_VL = ""; }
		if(VLDT_LH == null) { VLDT_LH = ""; }
		if(PRCH_VL == null) { PRCH_VL = ""; }
		if(PRNM_VL == null) { PRNM_VL = ""; }
		if(CHAR_CD == null) { CHAR_CD = ""; }
		if(HERT_CD == null) { HERT_CD = ""; }
		if(SPRT_CD == null) { SPRT_CD = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		// SP사용
		sql = "{call SP_GETPANJUNG_ITEM(?, ?, ?)}";
		CallStmtExec = connect.prepareCall(sql);


		/*

//검진결과 기본정보 UPDATE
UPDATE ET_RSLT_ITEM
   SET ERI_RSLT_VL = :RSLT_VL
     , ERI_VLDT_LH = :VLDT_LH
     , ERI_STEP_CD = '2'
     , ERI_PRCH_VL = :PRCH_VL
     , ERI_PRNM_VL = :PRNM_VL
     , ERI_CHAR_CD = :CHAR_CD
     , ERI_HERT_CD = :HERT_CD
     , ERI_SPRT_CD = :SPRT_CD
     , ERI_CFRM_YN = 'Y'
     , ERI_MODI_DTT = SYSDATE
     , ERI_MODI_ID = :MODI_ID
 WHERE ERI_EXAM_DT = :EXAM_DT
   AND ERI_EXAM_SQ = :EXAM_SQ
   AND ERI_ITEM_CD = :ITEM_CD

//해당 검사항목 판정 처리
ufGetPanJungItemSP(:EXAM_DT
                 , :EXAM_SQ
                 , :ITEM_CD)

//결과입력 진행상태 UPDATE
UPDATE ET_EXAM_ACPT
   SET EEA_BLRT_CD = '1'
 WHERE EEA_EXAM_DT = :EXAM_DT
   AND EEA_EXAM_SQ = :EXAM_DT

		*/

		sql = "UPDATE ET_RSLT_ITEM SET ";
		sql += "  ERI_RSLT_VL = '" + RSLT_VL + "'";
		sql += ", ERI_VLDT_LH = '" + VLDT_LH + "'";
		sql += ", ERI_STEP_CD = '2'";
		sql += ", ERI_PRCH_VL = '" + PRCH_VL + "'";
		sql += ", ERI_PRNM_VL = '" + PRNM_VL + "'";
		sql += ", ERI_CHAR_CD = '" + CHAR_CD + "'";
		sql += ", ERI_HERT_CD = '" + HERT_CD + "'";
		sql += ", ERI_SPRT_CD = '" + SPRT_CD + "'";
		sql += ", ERI_CFRM_YN = 'Y'";
		sql += ", ERI_MODI_DTT = SYSDATE";
		sql += ", ERI_MODI_ID = '" + MODI_ID + "'";
		sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND ERI_ITEM_CD = '" + ITEM_CD + "'";

		stmtExec.executeUpdate(sql);

				CallStmtExec.setString(1,  EXAM_DT);
				CallStmtExec.setString(2,  EXAM_SQ);
				CallStmtExec.setString(3,  ITEM_CD);

				CallStmtExec.executeUpdate();

		sql = "UPDATE ET_EXAM_ACPT SET ";
		sql += "  EEA_BLRT_CD = '1'";
		sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEA_EXAM_SQ = '" + EXAM_DT + "'";

		stmtExec.executeUpdate(sql);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBld_Rslt_ufSaveBldRslt_001 \n";
			G_INFO += "설명 : 검진결과판정(혈액결과 저장) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSLT_VL : " + RSLT_VL + " \n";
			G_INFO += " VLDT_LH : " + VLDT_LH + " \n";
			G_INFO += " PRCH_VL : " + PRCH_VL + " \n";
			G_INFO += " PRNM_VL : " + PRNM_VL + " \n";
			G_INFO += " CHAR_CD : " + CHAR_CD + " \n";
			G_INFO += " HERT_CD : " + HERT_CD + " \n";
			G_INFO += " SPRT_CD : " + SPRT_CD + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
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
</nurionXml>

<%
	} finally {

		if(stmtExec != null) {
			stmtExec.close();
			stmtExec = null;
		}

		if(CallStmtExec != null) {
			CallStmtExec.close();
			CallStmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
