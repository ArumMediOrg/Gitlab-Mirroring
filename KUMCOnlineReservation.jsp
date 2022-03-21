<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.StringReader"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="javax.xml.xpath.*"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="org.xml.sax.InputSource"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<%@ include file="/inc_prg/branch_kumc.jsp"%>
<%
	// 캐시방지
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
	response.setHeader("Expires", "0");

	request.setCharacterEncoding("UTF-8");

	String strNodeName = "";
	String strNodeValue = "";
	String strServiceID = "";

	NodeList nodeList = null;
	Node node = null;

	try {

		// 인자처리
		String strXml = request.getParameter("strXml");

		// 변수처리
		HashMap<String, String> htHeader = new HashMap<String, String>();
		HashMap<String, String> htBody = new HashMap<String, String>();
		HashMap<String, Object> htData = new HashMap<String, Object>(); //just declaration & hardcoding for common.jsp

		StringReader sr = new StringReader(strXml);
		InputSource is = new InputSource(sr);

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse(is);
		doc.getDocumentElement().normalize();		// xml정규화

		// Header
		nodeList = doc.getElementsByTagName("Header").item(0).getChildNodes();

		for(int i=0; i<nodeList.getLength(); i++) {

			node = nodeList.item(i);
			if(node.getNodeType() == Node.ELEMENT_NODE) {

				strNodeName = node.getNodeName();
				strNodeName = strNodeName.toUpperCase();

				strNodeValue = node.getTextContent();

				htHeader.put(strNodeName, strNodeValue);

				if(strNodeName.equals("SERVICEID")) {
					strServiceID = strNodeValue;
				}
			}
		}

		// Body
		nodeList = doc.getElementsByTagName("Body").item(0).getChildNodes();

		for(int i=0; i<nodeList.getLength(); i++) {

			node = nodeList.item(i);
			if(node.getNodeType() == Node.ELEMENT_NODE) {

				strNodeName = node.getNodeName();
				strNodeName = strNodeName.toUpperCase();

				strNodeValue = node.getTextContent();

				htBody.put(strNodeName, strNodeValue);
			}
		}


		String branch = (String)htBranch.get(strServiceID);
		if(branch == null) {

			out.clear();		// include된 파일안의 공백 제거
			response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<KUMC>
    <Header>
        <ServiceID><%= strServiceID%></ServiceID>
        <Result>
            <Code>99</Code>
            <Message>시스템오류</Message>
        </Result>
    </Header>
    <Body>
    </Body>
</KUMC>
<%
			return;
		}

		//
		request.setAttribute("htHeader", htHeader);
		request.setAttribute("htBody", htBody);

		htData.put("schemaCode", "1");
		request.setAttribute("htData", htData);  //for common.jsp

		RequestDispatcher rd = request.getRequestDispatcher(branch);
		rd.forward(request, response);
	} catch (Exception e) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<KUMC>
    <Header>
        <ServiceID><%= strServiceID%></ServiceID>
        <Result>
            <Code>99</Code>
            <Message><![CDATA[<%= e.toString()%>]]></Message>
        </Result>
    </Header>
    <Body>
    </Body>
</KUMC>
<%
	}
%>