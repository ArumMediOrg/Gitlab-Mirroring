<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	out.clear();		// include된 파일안의 공백 제거
	response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<nurionXml>
	<resultCode>408</resultCode>
	<resultXml></resultXml>
	<errorMsg>Request timeout, 요청시간이 지남</errorMsg>
</nurionXml>
