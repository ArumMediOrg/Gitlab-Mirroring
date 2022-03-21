<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	out.clear();		// include된 파일안의 공백 제거
	response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<nurionXml>
	<resultCode>410</resultCode>
	<resultXml></resultXml>
	<errorMsg>Gone, 영구적으로 사용할 수 없음</errorMsg>
</nurionXml>
