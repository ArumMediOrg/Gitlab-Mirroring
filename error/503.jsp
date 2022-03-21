<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	out.clear();		// include된 파일안의 공백 제거
	response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<nurionXml>
	<resultCode>503</resultCode>
	<resultXml></resultXml>
	<errorMsg>Service unavailable, 외부 서비스가 죽었거나 현재 멈춤 상태</errorMsg>
</nurionXml>
