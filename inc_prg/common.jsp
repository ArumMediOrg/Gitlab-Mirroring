<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 캐시방지
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
	response.setHeader("Expires", "0");
	
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.regex.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<%@ include file="/inc_prg/ctr.jsp"%>
<%@ include file="/inc_prg/crs.jsp"%>
<%@ include file="/inc_prg/custom_exception.jsp"%>
<%@ include file="/inc_prg/func_exception.jsp"%>
<%
	//
	Connection connect = null;

	// DB관련 변수정의
	String sql = "";
	String sql2 = "";
	String addSql = "";
	String addSql2 = "";
	String addSql3 = "";
	String sql_disp = "";
	
	// 첨부파일관련 변수정의
	String path = "";
	String fileName = "";
	
	// 기타
	String disp = "";
	String action = "";

	String schemaCode = "";

	HashMap<String, Object> htDataSchema = (HashMap<String, Object>)request.getAttribute("htData");

	schemaCode = (String) htDataSchema.get("schemaCode");

%>