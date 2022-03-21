<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_NCF_InsMedpnt.jsp"%>
<%
    // 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;
    String ReturnXml = "";
    String G_INFO = "";
    NcfInsMedpntVO InsMedPntVO_Sender = null;

    // 전달자료
    try {

        htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

        sql = func_NCF_InsMedpnt(htMethod);
        
        /*String EMPL_NUMB = htMethod.get("EMPL_NUMB");
        String MEPN_DATE = htMethod.get("MEPN_DATE");
        String MEDI_PNTX = htMethod.get("MEDI_PNTX");
        String FMLY_NAME = htMethod.get("FMLY_NAME");
        String USED_WECD = htMethod.get("USED_WECD");
        String INST_USID = htMethod.get("INST_USID");
        String MEPN_REMK = htMethod.get("MEPN_REMK");
        String WAGE_ENCD = htMethod.get("WAGE_ENCD");
        String FREL_CODE = htMethod.get("FREL_CODE");
    
        if(EMPL_NUMB == null) { EMPL_NUMB = ""; }
        if(MEPN_DATE == null) { MEPN_DATE = ""; }
        if(MEDI_PNTX == null) { MEDI_PNTX = ""; }
        if(FMLY_NAME == null) { FMLY_NAME = ""; }
        if(USED_WECD == null) { USED_WECD = ""; }
        if(INST_USID == null) { INST_USID = ""; }
        if(MEPN_REMK == null) { MEPN_REMK = ""; }
        if(WAGE_ENCD == null) { WAGE_ENCD = ""; }
        if(FREL_CODE == null) { FREL_CODE = ""; }

        InsMedPntVO_Sender = new NcfInsMedpntVO();

		InsMedPntVO_Sender.setEmpl_numb(EMPL_NUMB);
        InsMedPntVO_Sender.setMepn_date(MEPN_DATE);
        InsMedPntVO_Sender.setMedi_pntx(MEDI_PNTX);
        InsMedPntVO_Sender.setFmly_name(FMLY_NAME);
        InsMedPntVO_Sender.setUsed_wecd(USED_WECD);
        InsMedPntVO_Sender.setInst_usid(INST_USID);
        InsMedPntVO_Sender.setMepn_remk(MEPN_REMK);
        InsMedPntVO_Sender.setWage_encd(WAGE_ENCD);
        InsMedPntVO_Sender.setFrel_code(FREL_CODE);
        
        ReturnXml = func_InsMedpnt(InsMedPntVO_Sender);
        */
        

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

	}
%>