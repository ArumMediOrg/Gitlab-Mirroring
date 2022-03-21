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



		//

		// DB객체
		stmtExec = connect.createStatement();

		/*

CREATE TABLE CR_SMS_AUTO_SET
    (
    CSA_GUID_KD                     VARCHAR2(2 BYTE) NOT NULL,
    CSA_GUID_NM                     VARCHAR2(100 BYTE),
    CSA_SEND_KD                     VARCHAR2(1 BYTE),
    CSA_STAND_HH                    VARCHAR2(2 BYTE),
    CSA_STAND_MM                    VARCHAR2(2 BYTE),
    CSA_BEFOR_DT                    VARCHAR2(2 BYTE),
    CSA_BEFOR_HH                    VARCHAR2(2 BYTE),
    CSA_SEND_MSG                    VARCHAR2(4000 BYTE),
    CSA_SEND_TEL                    VARCHAR2(20 BYTE),
    CSA_USE_YN                      VARCHAR2(1 BYTE) NOT NULL,
    CSA_INPUT_ID                    VARCHAR2(20 BYTE),
    CSA_INPUT_DTT                   DATE,
    CSA_MODI_ID                     VARCHAR2(20 BYTE),
    CSA_MODI_DTT                    DATE,
    CSA_TMPL_CD                     VARCHAR2(20 BYTE),
	CSA_PLCE_CD                     VARCHAR2(2 BYTE),
    CSA_ITEM_CD                     VARCHAR2(5 BYTE),
    CSA_PRIOR_SQ                    VARCHAR2(2 BYTE)
    )

ALTER TABLE CR_SMS_AUTO_SET ADD ( 
    CONSTRAINT PK_CR_SMS_AUTO_SET
    PRIMARY KEY ( CSA_GUID_KD ));
		*/

		sql = " CREATE TABLE CR_SMS_AUTO_SET";
		sql += " (";
		sql += " CSA_GUID_KD                     VARCHAR2(2 BYTE) NOT NULL, ";
		sql += " CSA_GUID_NM                     VARCHAR2(100 BYTE), ";
		sql += " CSA_SEND_KD                     VARCHAR2(1 BYTE), ";
		sql += " CSA_STAND_HH                    VARCHAR2(2 BYTE), ";
		sql += " CSA_STAND_MM                    VARCHAR2(2 BYTE), ";
		sql += " CSA_BEFOR_DT                    VARCHAR2(2 BYTE), ";
		sql += " CSA_BEFOR_HH                    VARCHAR2(2 BYTE), ";
		sql += " CSA_SEND_MSG                    VARCHAR2(4000 BYTE), ";
		sql += " CSA_SEND_TEL                    VARCHAR2(20 BYTE), ";
		sql += " CSA_USE_YN                      VARCHAR2(1 BYTE) NOT NULL, ";
		sql += " CSA_INPUT_ID                    VARCHAR2(20 BYTE), ";
		sql += " CSA_INPUT_DTT                   DATE, ";
		sql += " CSA_MODI_ID                     VARCHAR2(20 BYTE), ";
		sql += " CSA_MODI_DTT                    DATE, ";
		sql += " CSA_TMPL_CD                     VARCHAR2(20 BYTE), ";
		sql += " CSA_PLCE_CD                     VARCHAR2(2 BYTE), ";
		sql += " CSA_ITEM_CD                     VARCHAR2(5 BYTE), ";
		sql += " CSA_PRIOR_SQ                    VARCHAR2(2 BYTE) ";
		sql += " )";

		stmtExec.executeUpdate(sql);

		sql += " ALTER TABLE CR_SMS_AUTO_SET ADD (";
		sql += " CONSTRAINT PK_CR_SMS_AUTO_SET";
		sql += " PRIMARY KEY ( CSA_GUID_KD ));";

		stmtExec.executeUpdate(sql);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 :  \n";
			G_INFO += "설명 : 테이블 생성 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
