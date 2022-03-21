<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="../../CallNCF.jsp"%>
<%
    // 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;
    String ReturnXml = "";

    NcfSelRedinfVO selRedinfVO_Sender = null;

    // 전달자료
    try {
        htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

        String FMLY_NAME = htMethod.get("FMLY_NAME");
        String FMLY_RRNF = htMethod.get("FMLY_RRNF");
        String FMLY_RRNS = htMethod.get("FMLY_RRNS");
        
        if(FMLY_NAME == null) { FMLY_NAME = ""; }
        if(FMLY_RRNF == null) { FMLY_RRNF = ""; }
        if(FMLY_RRNS == null) { FMLY_RRNS = ""; }
		
        selRedinfVO_Sender = new NcfSelRedinfVO();

		selRedinfVO_Sender.setFMLY_NAME(FMLY_NAME);
        selRedinfVO_Sender.setFMLY_RRNF(FMLY_RRNF);
        selRedinfVO_Sender.setFMLY_RRNS(FMLY_RRNS);
        
        ReturnXml = func_SelRedinf(selRedinfVO_Sender, "selRedinf");

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