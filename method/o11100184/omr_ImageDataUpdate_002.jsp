<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;
	PreparedStatement pstmt = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String IMAGE_DATA = htMethod.get("IMAGE_DATA");
		String FILENAME = htMethod.get("FILENAME");
		String SCANDATE = htMethod.get("SCANDATE");


		//
		if(IMAGE_DATA == null) { IMAGE_DATA = ""; }
		if(FILENAME == null) { FILENAME = ""; }
		if(SCANDATE == null) { SCANDATE = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = " UPDATE ARUM_TOTAL ";
		sql += " SET IMAGE_DATA = ? ";
		sql += "   , OMRYN = 'Y' ";
		sql += "   , VALUYN = 'Y' ";
		sql += "   , SENDYN = 'Y' ";
		sql += "   , IndexYN = 'N' ";
		sql += " 	WHERE FILENAME = '" + FILENAME + "' ";
		sql += " 	AND SCANDATE = '" + SCANDATE + "' ";

		pstmt = connect.prepareStatement(sql);

		pstmt.setBytes(1, IMAGE_DATA.getBytes());

		pstmt.executeUpdate();
			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : omr_ImageDataUpdate_002 \n";
		G_INFO += "설명 : OMR 이미지 데이터 업데이트 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " IMAGE_DATA : " + IMAGE_DATA + " \n";
		G_INFO += " FILENAME : " + FILENAME + " \n";
		G_INFO += " SCANDATE : " + SCANDATE + " \n";
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

		if(pstmt != null) {
			pstmt.close();
			pstmt = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
