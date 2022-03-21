<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	out.clear();		// include된 파일안의 공백 제거
	response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<nurionXml>
	<resultCode>414</resultCode>
	<resultXml></resultXml>
	<errorMsg>Request-URI too long, URL이 너무 김</errorMsg>
</nurionXml>
