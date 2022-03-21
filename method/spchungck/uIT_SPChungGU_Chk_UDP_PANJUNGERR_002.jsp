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

		String PARAM_SET = htMethod.get("PARAM_SET");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String MATT_CD = htMethod.get("MATT_CD");
		String MATT_SQ = htMethod.get("MATT_SQ");

		//
		if(PARAM_SET == null) { PARAM_SET = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(MATT_CD == null) { MATT_CD = ""; }
		if(MATT_SQ == null) { MATT_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		/*

UPDATE ST_PANJUNG
   SET :PARAM_SET
 WHERE SPG_EXAM_DT = :EXAM_DT 
   AND SPG_EXAM_SQ = :EXAM_SQ
   AND SPG_MATT_CD = :MATT_CD
   AND SPG_MATT_SQ = :MATT_SQ

		*/

		sql = "UPDATE ST_PANJUNG SET ";
		sql += PARAM_SET ;
		sql += " WHERE SPG_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND SPG_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SPG_MATT_CD = '" + MATT_CD + "'";
		sql += " AND SPG_MATT_SQ = '" + MATT_SQ + "'";

		stmtExec.executeUpdate(sql);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_SPChungGU_Chk_UDP_PANJUNGERR_002 \n";
			G_INFO += "설명 : 조건별 판정 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PARAM_SET : " + PARAM_SET + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " MATT_CD : " + MATT_CD + " \n";
			G_INFO += " MATT_SQ : " + MATT_SQ + " \n";
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
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
