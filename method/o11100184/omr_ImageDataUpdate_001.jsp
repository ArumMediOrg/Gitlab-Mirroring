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
		String REQUEST_DATE = htMethod.get("REQUEST_DATE");
		String EXAM_NO = htMethod.get("EXAM_NO");


		//
		if(IMAGE_DATA == null) { IMAGE_DATA = ""; }
		if(FILENAME == null) { FILENAME = ""; }
		if(REQUEST_DATE == null) { REQUEST_DATE = ""; }
		if(EXAM_NO == null) { EXAM_NO = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		//sql = func_omr_ImageDataUpdate_001(stmtExec, htMethod);
		sql = " UPDATE ARUM_TOTAL ";
		//sql += "	SET IMAGE_DATA = " + IMAGE_DATA + " ";
		sql += " SET IMAGE_DATA = ? ";
		sql += "		WHERE FILENAME = '" + FILENAME + "' ";
		sql += "		AND REQUEST_DATE = '" + REQUEST_DATE + "' ";
		sql += "		AND EXAM_NO = '" + EXAM_NO + "' ";

		pstmt = connect.prepareStatement(sql);

		pstmt.setBytes(1, IMAGE_DATA.getBytes());

		pstmt.executeUpdate();
			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : omr_ImageDataUpdate_001 \n";
		G_INFO += "설명 : OMR 이미지 데이터 업데이트 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " IMAGE_DATA : " + IMAGE_DATA + " \n";
		G_INFO += " FILENAME : " + FILENAME + " \n";
		G_INFO += " REQUEST_DATE : " + REQUEST_DATE + " \n";
		G_INFO += " EXAM_NO : " + EXAM_NO + " \n";
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
