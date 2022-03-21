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

		String SAVE_KD = htMethod.get("SAVE_KD");
		String MEMO_DT = htMethod.get("MEMO_DT");
		String MEMO_SQ = htMethod.get("MEMO_SQ");
		String MEMO_LT = htMethod.get("MEMO_LT");
		String MEMO_TX = htMethod.get("MEMO_TX");
		String USER_ID = htMethod.get("USER_ID");
		String FONT_ST = htMethod.get("FONT_ST");

		//
		if(SAVE_KD == null) { SAVE_KD = ""; }
		if(MEMO_DT == null) { MEMO_DT = ""; }
		if(MEMO_SQ == null) { MEMO_SQ = ""; }
		if(MEMO_LT == null) { MEMO_LT = ""; }
		if(MEMO_TX == null) { MEMO_TX = ""; }
		if(USER_ID == null) { USER_ID = ""; }
		if(FONT_ST == null) { FONT_ST = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		/*

IF (:SAVE_KD = 'I') THEN
  INSERT INTO ET_CLDR_MEMO 
        (ECM_MEMO_DT, ECM_MEMO_SQ, ECM_MEMO_LT, ECM_MEMO_TX, ECM_INPT_ID, ECM_INPT_DTT, ECM_FONT_ST) 
  VALUES
        (:MEMO_DT,    :MEMO_SQ,    :MEMO_LT,    :MEMO_TX,    :USER_ID,    SYSDATE,      :FONT_ST)
ELSE IF (:SAVE_KD = 'U') THEN
  UPDATE ET_CLDR_MEMO 
     SET ECM_MEMO_LT  = :MEMO_LT,
         ECM_MEMO_TX  = :MEMO_TX,
         ECM_MODI_ID  = :USER_ID,
         ECM_MODI_DTT = SYSDATE,
         ECM_FONT_ST  = :FONT_ST
   WHERE ECM_MEMO_DT  = :MEMO_DT
     AND ECM_MEMO_SQ  = :MEMO_SQ
ELSE IF (:SAVE_KD = 'D') THEN
  DELETE ET_CLDR_MEMO 
   WHERE ECM_MEMO_DT  = :MEMO_DT
     AND ECM_MEMO_SQ  = :MEMO_SQ
		*/

		if(SAVE_KD.equals("I")) {
			sql = "INSERT INTO ET_CLDR_MEMO (ECM_MEMO_DT, ECM_MEMO_SQ, ECM_MEMO_LT, ECM_MEMO_TX, ECM_INPT_ID, ECM_INPT_DTT, ECM_FONT_ST) VALUES (";
			sql += "  '" + MEMO_DT + "'";
			sql += ", '" + MEMO_SQ + "'";
			sql += ", '" + MEMO_LT + "'";
			sql += ", '" + MEMO_TX + "'";
			sql += ", '" + USER_ID + "'";
			sql += ", SYSDATE";
			sql += ", '" + FONT_ST + "'";
			sql += ")";

			stmtExec.executeUpdate(sql);
		}
		else if(SAVE_KD.equals("U")) {
			sql = "UPDATE ET_CLDR_MEMO SET ";
			sql += "  ECM_MEMO_LT = '" + MEMO_LT + "'";
			sql += ", ECM_MEMO_TX = '" + MEMO_TX + "'";
			sql += ", ECM_MODI_ID = '" + USER_ID + "'";
			sql += ", ECM_MODI_DTT = SYSDATE";
			sql += ", ECM_FONT_ST = '" + FONT_ST + "'";
			sql += " WHERE ECM_MEMO_DT = '" + MEMO_DT + "'";
			sql += " AND ECM_MEMO_SQ = '" + MEMO_SQ + "'";

			stmtExec.executeUpdate(sql);
		}
		else if(SAVE_KD.equals("D")) {
			sql = "DELETE ET_CLDR_MEMO";
			sql += " WHERE ECM_MEMO_DT = '" + MEMO_DT + "'";
			sql += " AND ECM_MEMO_SQ = '" + MEMO_SQ + "'";

			stmtExec.executeUpdate(sql);
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : Memo_Apply_UP_Save_001 \n";
			G_INFO += "설명 : 메모 저장 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAVE_KD : " + SAVE_KD + " \n";
			G_INFO += " MEMO_DT : " + MEMO_DT + " \n";
			G_INFO += " MEMO_SQ : " + MEMO_SQ + " \n";
			G_INFO += " MEMO_LT : " + MEMO_LT + " \n";
			G_INFO += " MEMO_TX : " + MEMO_TX + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
			G_INFO += " FONT_ST : " + FONT_ST + " \n";
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
