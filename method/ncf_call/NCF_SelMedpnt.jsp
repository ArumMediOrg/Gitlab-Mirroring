<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="../../CallNCF.jsp"%>
<%
    // 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;
    String ReturnXml = "";

    NcfSelMedpntVO selMedPntVO_Sender = null;

    // 전달자료
    try {
        htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

        String EMPL_NUMB = htMethod.get("EMPL_NUMB");
        
        if(EMPL_NUMB == null) { EMPL_NUMB = ""; }
		
        selMedPntVO_Sender = new NcfSelMedpntVO();

		selMedPntVO_Sender.setEmpNumber(EMPL_NUMB);
        
        ReturnXml = func_SelMedpnt(selMedPntVO_Sender, "selMedpnt");

        response.addHeader("Content-type", "text/xml");
%>
<%= ReturnXml%>
<%
    } catch (Exception e) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= ReturnXml%>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= e.toString()%>]]></errorMsg>
	
</nurionXml>

<%
	} finally {

		
    }
%>