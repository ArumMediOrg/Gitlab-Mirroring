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

DROP TABLE JLPN_TEMP;
CREATE TABLE JLPN_TEMP (CODE varchar2(1), JLPN_NAME varchar2(100));
INSERT INTO JLPN_TEMP VALUES ('1', '건강상담');
INSERT INTO JLPN_TEMP VALUES ('2', '보호구 착용 및 지도');
INSERT INTO JLPN_TEMP VALUES ('3', '추적검사');
INSERT INTO JLPN_TEMP VALUES ('4', '근무중 치료');
INSERT INTO JLPN_TEMP VALUES ('5', '근로시간 단축');
INSERT INTO JLPN_TEMP VALUES ('6', '작업전환');
INSERT INTO JLPN_TEMP VALUES ('7', '근로제한 및 금지');
INSERT INTO JLPN_TEMP VALUES ('8', '직업병 확진 의뢰안내');
INSERT INTO JLPN_TEMP VALUES ('9', '기타');
		*/

		sql = " DROP TABLE JLPN_TEMP";
		stmtExec.executeUpdate(sql);

		sql = " CREATE TABLE JLPN_TEMP (CODE varchar2(1), JLPN_NAME varchar2(100))";
		stmtExec.executeUpdate(sql);

		sql = " INSERT INTO JLPN_TEMP VALUES ('1', '건강상담')";
		stmtExec.executeUpdate(sql);

		sql = " INSERT INTO JLPN_TEMP VALUES ('2', '보호구 착용 및 지도')";
		stmtExec.executeUpdate(sql);

		sql = " INSERT INTO JLPN_TEMP VALUES ('3', '추적검사')";
		stmtExec.executeUpdate(sql);

		sql = " INSERT INTO JLPN_TEMP VALUES ('4', '근무중 치료')";
		stmtExec.executeUpdate(sql);

		sql = " INSERT INTO JLPN_TEMP VALUES ('5', '근로시간 단축')";
		stmtExec.executeUpdate(sql);

		sql = " INSERT INTO JLPN_TEMP VALUES ('6', '작업전환')";
		stmtExec.executeUpdate(sql);

		sql = " INSERT INTO JLPN_TEMP VALUES ('7', '근로제한 및 금지')";
		stmtExec.executeUpdate(sql);

		sql = " INSERT INTO JLPN_TEMP VALUES ('8', '직업병 확진 의뢰안내')";
		stmtExec.executeUpdate(sql);

		sql = " INSERT INTO JLPN_TEMP VALUES ('9', '기타')";
		stmtExec.executeUpdate(sql);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHEPOSTMANPRT_up_GetData_002 \n";
			G_INFO += "설명 : 테이블 삭제및 정보 입력 \n";
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
