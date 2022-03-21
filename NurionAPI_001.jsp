<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.StringReader"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="javax.xml.xpath.*"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="org.xml.sax.InputSource"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<%@ include file="/inc_prg/branch.jsp"%>
<%
	// 캐시방지
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
	response.setHeader("Expires", "0");
	
	request.setCharacterEncoding("UTF-8"); 

	try {
	
		// 인자처리
		String strXml = request.getParameter("strXml");
		
		// 변수처리
		HashMap<String, Object> htData = new HashMap<String, Object>();
		HashMap<String, String> htMethod = null;

		StringReader sr = new StringReader(strXml);
		InputSource is = new InputSource(sr);

		DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		Document doc = docBuilder.parse(is);
		doc.getDocumentElement().normalize();		// xml정규화
		XPath xpath = XPathFactory.newInstance().newXPath();

		Element root = doc.getDocumentElement();
		String dataType = doc.getElementsByTagName("dataType").item(0).getTextContent();

		String count = doc.getElementsByTagName("count").item(0).getTextContent();
		int cnt = Integer.parseInt(count);

		//고려대학교 schemaCode 관련 start
		String schemaCode = "";
		NodeList childSchema = root.getChildNodes();
		for (int i = 0; i < childSchema.getLength(); i++){
			Node nodeSchema = childSchema.item(i);

			if (nodeSchema.getNodeType() == Node.ELEMENT_NODE){
				Element elementSchema = (Element)nodeSchema;

				if (elementSchema.getNodeName().equals("schemaCode")){
					schemaCode = doc.getElementsByTagName("schemaCode").item(0).getTextContent();
					break;
				}
			}
		}
		//고려대학교 schemaCode 관련 end

		String tagName = "";
		Node nodeData = null;
		NodeList nodeList = null;
		Node node = null;

		String strNodeName = "";
		String strNodeValue = "";
		String strMethodName = "";
		
		//
		htData.put("dataType", dataType);
		htData.put("count", count);
		htData.put("schemaCode", schemaCode);
		

		int no = 0;
		for(int i=0; i<cnt; i++) {
		
			no = i + 1;
		
			nodeData = doc.getElementsByTagName("data_" + no).item(0);
			nodeList = nodeData.getChildNodes();

			htMethod = new HashMap<String, String>();

			for(int j=0; j < nodeList.getLength(); j++) {
				
				node = nodeList.item(j);
				if(node.getNodeType() == Node.ELEMENT_NODE) {
				
					strNodeName = node.getNodeName();
					strNodeName = strNodeName.toUpperCase();
					
					strNodeValue = node.getTextContent();
					htMethod.put(strNodeName, strNodeValue);
				
					if(strNodeName.equals("METHODNAME")) {
						strMethodName = strNodeValue;
					}
				}
			}
			
			request.setAttribute("htMethod_" + no, htMethod);
		}
		
		//
		// String branch = "/method/item/" + strMethodName + ".jsp";

		String branch = "";

		if(dataType.equals("multi")) {

			branch = "/multi.jsp";
		} else {
		
			branch = (String)htBranch.get(strMethodName);
			if(branch == null) {

				out.clear();		// include된 파일안의 공백 제거
				response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<nurionXml>
	<resultCode>410</resultCode>
	<resultXml></resultXml>
	<errorMsg>존재하지 않는 API정보입니다.</errorMsg>
</nurionXml>
<%
				return;
			}
		}

		if(! branch.equals("")) {
		
			request.setAttribute("htData", htData);
			RequestDispatcher rd = request.getRequestDispatcher(branch);
			rd.forward(request, response);
		}

	} catch (Exception e) {
	
		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= e.toString()%>]]></errorMsg>
</nurionXml>

<%
	}
%>
