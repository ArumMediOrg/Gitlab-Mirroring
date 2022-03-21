<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.logging.FileHandler"%>
<%@ page import="java.util.logging.Level"%>
<%@ page import="java.util.logging.Logger"%>

<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/inc_prg/func.jsp"%>
<%!
	// private static final Logger logger = Logger.getLogger(this.getClass());
	private static final Logger logger = Logger.getLogger("multi");
%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;

	//
	String G_INFO = "";
	String strMethodName = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");

		int cnt = Integer.parseInt((String)htData.get("count"));

		// DB객체
		stmtExec = connect.createStatement();
		
		// Transaction	
		System.out.println("1) connect.setAutoCommit(false)");
		connect.setAutoCommit(false);

		System.out.println("Loop Start : " + cnt);
		for(int i=1; i<=cnt; i++) {
		
			htMethod = (HashMap<String, String>)request.getAttribute("htMethod_" + i);
			strMethodName = (String) htMethod.get("METHODNAME");
			
			sql = func_choice(strMethodName, stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "[" + i + "] 서비스명 : " + strMethodName + " \n";
			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "--> \n\n";

			logger.info(i + " : " + sql);
		}
		System.out.println("Loop End : " + cnt);

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
		// Transaction
		if(connect == null) {
			
			System.out.println("오류 2) DB Connection is null");
		} else {
			
			try {
				System.out.println("2) connect.commit()");
				connect.commit();
			} catch (Exception e2) {
				System.out.println("오류 2) connect.commit()");
				System.out.println(e2.toString());
			}
		}
	} catch (FuncException fe) {

		// Transaction	
		if(connect == null) {
			
			System.out.println("오류 3) DB Connection is null");
		} else {
			
			try {
				System.out.println("3) connect.rollback()");
				connect.rollback();
			} catch (Exception e2) {
				System.out.println("오류 3) connect.rollback()");
				System.out.println(e2.toString());
			}
		}
		
		try {

			out.clear();		// include된 파일안의 공백 제거
			response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><%= strMethodName%> : <%= fe.toString()%></errorMsg>
	<sql><![CDATA[<%= fe.getSql()%>]]></sql>
</nurionXml>

<%
		} catch (Exception e2) { }
	} catch (Exception e) {

		// Transaction	
		if(connect == null) {
			
			System.out.println("오류 4) DB Connection is null");
		} else {
			
			try {
				System.out.println("4) connect.rollback()");
				connect.rollback();
			} catch (Exception e2) {
				System.out.println("오류 4) connect.rollback()");
				System.out.println(e2.toString());
			}
		}

		try {

			out.clear();		// include된 파일안의 공백 제거
			response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><%= strMethodName%> : <%= e.toString()%></errorMsg>
</nurionXml>

<%
		} catch (Exception e2) { }
	} finally {
	
		// Transaction	
		if(connect == null) {
		
			System.out.println("오류 5) DB Connection is null");
		} else {
			
			try {
				System.out.println("5) connect.setAutoCommit(true)");
				connect.setAutoCommit(true);
			} catch (Exception e2) {
				System.out.println("오류 5) connect.setAutoCommit(true)");
				System.out.println(e2.toString());
			}
		}

		if(stmtExec != null) {
			stmtExec.close();
			stmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
