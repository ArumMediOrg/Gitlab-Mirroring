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

CREATE TABLE ARUME.IT_AUTH_PRGM_ID(                                               
        IAP_USER_ID  VARCHAR2(10)  NOT NULL,                                             
        IAP_PRGM_NM  VARCHAR2(100) NOT NULL,                                             
        IAP_MENU_ID  VARCHAR2(50)  NULL,                                                 
        IAP_LIBR_NM  VARCHAR2(50)  NOT NULL,                                             
        IAP_PARE_ID  NUMBER(4,0)   NOT NULL,                                             
        IAP_MENU_LV  NUMBER(2,0)   NOT NULL,                                             
        IAP_PRGM_SQ  NUMBER(3,0)   NOT NULL,                                             
        IAP_MENU_RU  VARCHAR2(50)  NULL,                                                 
        IAP_SELECT   VARCHAR2(1)   NOT NULL,                                             
        IAP_SAVE     VARCHAR2(1)   NOT NULL,                                             
        IAP_PRINT    VARCHAR2(1)   NOT NULL,                                             
        IAP_DELETE   VARCHAR2(1)   NOT NULL,                                             
        IAP_INPT_ID  VARCHAR2(10)  NULL,                                                 
        IAP_INPT_DTT DATE          NULL,                                                 
        IAP_MODI_ID  VARCHAR2(10)  NULL,                                                 
        IAP_MODI_DTT DATE          NULL,                                                 
 CONSTRAINT PK_IT_AUTH_PRGM_ID PRIMARY KEY (IAP_USER_ID, IAP_PRGM_NM, IAP_LIBR_NM)
            USING INDEX TABLESPACE TBS_ARUMNURI_IDX                               
) TABLESPACE TBS_ARUMNURI_DAT                                                     

		*/

		sql = " CREATE TABLE ARUME.IT_AUTH_PRGM_ID(";
		sql += " IAP_USER_ID  VARCHAR2(10)  NOT NULL,";
		sql += " IAP_PRGM_NM  VARCHAR2(100) NOT NULL,";
		sql += " IAP_MENU_ID  VARCHAR2(50)  NULL,";
		sql += " IAP_LIBR_NM  VARCHAR2(50)  NOT NULL,";
		sql += " IAP_PARE_ID  NUMBER(4,0)   NOT NULL,";
		sql += " IAP_MENU_LV  NUMBER(2,0)   NOT NULL,";
		sql += " IAP_PRGM_SQ  NUMBER(3,0)   NOT NULL,";
		sql += " IAP_MENU_RU  VARCHAR2(50)  NULL,";
		sql += " IAP_SELECT   VARCHAR2(1)   NOT NULL,";
		sql += " IAP_SAVE     VARCHAR2(1)   NOT NULL,";
		sql += " IAP_PRINT    VARCHAR2(1)   NOT NULL,";
		sql += " IAP_DELETE   VARCHAR2(1)   NOT NULL,";
		sql += " IAP_INPT_ID  VARCHAR2(10)  NULL,";
		sql += " IAP_INPT_DTT DATE          NULL,";
		sql += " IAP_MODI_ID  VARCHAR2(10)  NULL,";
		sql += " IAP_MODI_DTT DATE          NULL,";
		sql += " CONSTRAINT PK_IT_AUTH_PRGM_ID PRIMARY KEY (IAP_USER_ID, IAP_PRGM_NM, IAP_LIBR_NM)";
		sql += " USING INDEX TABLESPACE TBS_ARUMNURI_IDX";
		sql += " ) TABLESPACE TBS_ARUMNURI_DAT";

		stmtExec.executeUpdate(sql);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHospital_Set_Cr_Table_001 \n";
			G_INFO += "설명 : 노출프로그램 정보 테이블 생성 \n";
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
