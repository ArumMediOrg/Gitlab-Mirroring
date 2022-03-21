<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="org.xml.sax.InputSource"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="com.google.gson.JsonArray"%>
<%@ page import="java.net.*"%>
<%@ page import="javax.xml.xpath.*"%>

<%@ include file="/NCF/NcfSelMedpntVO.jsp"%>
<%@ include file="/NCF/NcfSelMastxmVO.jsp"%>
<%@ include file="/NCF/NcfSelRedinfVO.jsp"%>
<%@ include file="/NCF/NcfSelRedinfEmpNumVO.jsp"%>
<%@ include file="/NCF/NcfInsMedpntVO.jsp"%>
<%@ include file="/NCF/NcfMedpntVO.jsp"%>
<%@ include file="/NCF/JsonToXmlReturnConv.jsp"%>

<%!
	public String getSendUrl(String apiType) throws Exception {
		String rtnVal = null;
		if (apiType.equals("selMedpnt")){
			rtnVal = "https://vxn87x74p3.apigw.ntruss.com/ehr-cf-api/v1/nur-cf-sel-medpnt?blocking=true&result=true";
		} else if (apiType.equals("insMedpnt")){
			rtnVal = "https://vxn87x74p3.apigw.ntruss.com/ehr-cf-api/v1/nur-cf-ins-medpnt?blocking=true&result=true";
		} else if (apiType.equals("execMedpnt")){
			rtnVal = "https://vxn87x74p3.apigw.ntruss.com/ehr-cf-api/v1/nur-cf-exec-medpnt?blocking=true&result=true";
		} else if (apiType.equals("selMastxm")){
			rtnVal = "https://vxn87x74p3.apigw.ntruss.com/ehr-cf-api/v1/nur-cf-sel-mastxm?blocking=true&result=true";
		} else if (apiType.equals("selRedinf")){
			rtnVal = "https://vxn87x74p3.apigw.ntruss.com/ehr-cf-api/v1/nur-cf-sel-redinf?blocking=true&result=true";
		} else if (apiType.equals("selRedinfEmpNum")){
			rtnVal = "https://vxn87x74p3.apigw.ntruss.com/ehr-cf-api/v1/nur-cf-sel-redinfempnum?blocking=true&result=true";
		} else if (apiType.equals("selMedpntList")){
			rtnVal = "https://vxn87x74p3.apigw.ntruss.com/ehr-cf-api/v1/nur-cf-sel-medpntlist?blocking=true&result=true";
		}
		return rtnVal;
	}

	public String func_SelMastxm(NcfSelMastxmVO selMastxmVO, String actionName) throws Exception {
		//receive XML String from Client
		String strXml = null;
		XPathFactory xpathFactory = XPathFactory.newInstance();
		XPath xpath = xpathFactory.newXPath();
		XPathExpression expr = null;
		NodeList nodeList = null;
		String ReturnXml = null;

		//JSON Parser
		Gson gson = null;
		JsonObject jsonobject = null;
		String strJson = null;

		//CF API 호출 관련
		URL sendUrl = null;
		HttpURLConnection httpConn = null;
		OutputStream os = null;
		BufferedReader in = null;
		String inputLine = null;
		StringBuffer outResult = new StringBuffer();

		jsonobject = new JsonObject();
		jsonobject.addProperty("op_mode", selMastxmVO.getOp_mode());
		jsonobject.addProperty("inf_key", selMastxmVO.getInf_key());
		jsonobject.addProperty("conf_url", selMastxmVO.getConf_url());
		jsonobject.addProperty("conf_apikey", selMastxmVO.getConf_apikey());
		if (!selMastxmVO.getEMPL_NAME().equals("")){
			jsonobject.addProperty("EMPL_NAME", selMastxmVO.getEMPL_NAME());
		} else if (!selMastxmVO.getEMPL_NUMB().equals("")){
			jsonobject.addProperty("EMPL_NUMB", selMastxmVO.getEMPL_NUMB());
		}

		gson = new Gson();
		strJson = gson.toJson(jsonobject);  //selMedPntVO 객체를 JSON 형식으로 변환

		sendUrl = new URL(getSendUrl(actionName));  //url 가져오기
		if (sendUrl != null){
			httpConn = (HttpURLConnection) sendUrl.openConnection();
			httpConn.setDoOutput(true);
			httpConn.setRequestMethod("POST");
			httpConn.setRequestProperty("Content-Type", "application/json");
			httpConn.setRequestProperty("Accept-Charset", "UTF-8");
			httpConn.setRequestProperty("x-ncp-apigw-api-key", "xknULzLrGwHLJHnHS68PveU8FL43dDUivfRMsWbU");
			httpConn.setConnectTimeout(120000);
			httpConn.setReadTimeout(120000);

			os = httpConn.getOutputStream();
			os.write(strJson.getBytes("UTF-8"));
			os.flush();

			in = new BufferedReader(new InputStreamReader(httpConn.getInputStream(), "UTF-8"));
			while ((inputLine = in.readLine()) != null) {
				outResult.append(inputLine);
			}

			httpConn.disconnect();
		}

		//End CF Call.

		//JSON to XML convert start
		ReturnXml = JsonToXmlConv(outResult.toString(), actionName);
		//ReturnXml = JsonToXmlConv("asdf", actionName);

		if(gson != null) {
			//gson.close();
			gson = null;
		}

		return ReturnXml;

	}

	public String func_SelRedinfEmpNum(NcfSelRedinfEmpNumVO selRedinfEmpNumVO, String actionName) throws Exception {
		//receive XML String from Client
		String strXml = null;
		XPathFactory xpathFactory = XPathFactory.newInstance();
		XPath xpath = xpathFactory.newXPath();
		XPathExpression expr = null;
		NodeList nodeList = null;
		String ReturnXml = null;

		//JSON Parser
		Gson gson = null;
		JsonObject jsonobject = null;
		String strJson = null;

		//CF API 호출 관련
		URL sendUrl = null;
		HttpURLConnection httpConn = null;
		OutputStream os = null;
		BufferedReader in = null;
		String inputLine = null;
		StringBuffer outResult = new StringBuffer();

		jsonobject = new JsonObject();
		jsonobject.addProperty("op_mode", selRedinfEmpNumVO.getOp_mode());
		jsonobject.addProperty("inf_key", selRedinfEmpNumVO.getInf_key());
		jsonobject.addProperty("conf_url", selRedinfEmpNumVO.getConf_url());
		jsonobject.addProperty("conf_apikey", selRedinfEmpNumVO.getConf_apikey());
		jsonobject.addProperty("EMPL_NUMB", selRedinfEmpNumVO.getEMPL_NUMB());


		gson = new Gson();
		strJson = gson.toJson(jsonobject);  //selMedPntVO 객체를 JSON 형식으로 변환

		sendUrl = new URL(getSendUrl(actionName));  //url 가져오기
		if (sendUrl != null){
			httpConn = (HttpURLConnection) sendUrl.openConnection();
			httpConn.setDoOutput(true);
			httpConn.setRequestMethod("POST");
			httpConn.setRequestProperty("Content-Type", "application/json");
			httpConn.setRequestProperty("Accept-Charset", "UTF-8");
			httpConn.setRequestProperty("x-ncp-apigw-api-key", "xknULzLrGwHLJHnHS68PveU8FL43dDUivfRMsWbU");
			httpConn.setConnectTimeout(120000);
			httpConn.setReadTimeout(120000);

			os = httpConn.getOutputStream();
			os.write(strJson.getBytes("UTF-8"));
			os.flush();

			in = new BufferedReader(new InputStreamReader(httpConn.getInputStream(), "UTF-8"));
			while ((inputLine = in.readLine()) != null) {
				outResult.append(inputLine);
			}

			httpConn.disconnect();
		}

		//End CF Call.

		//JSON to XML convert start
		ReturnXml = JsonToXmlConv(outResult.toString(), actionName);
		//ReturnXml = outResult.toString();

		if(gson != null) {
			//gson.close();
			gson = null;
		}

		return ReturnXml;

	}

	public String func_SelRedinf(NcfSelRedinfVO selRedinfVO, String actionName) throws Exception {
		//receive XML String from Client
		String strXml = null;
		XPathFactory xpathFactory = XPathFactory.newInstance();
		XPath xpath = xpathFactory.newXPath();
		XPathExpression expr = null;
		NodeList nodeList = null;
		String ReturnXml = null;

		//JSON Parser
		Gson gson = null;
		JsonObject jsonobject = null;
		String strJson = null;

		//CF API 호출 관련
		URL sendUrl = null;
		HttpURLConnection httpConn = null;
		OutputStream os = null;
		BufferedReader in = null;
		String inputLine = null;
		StringBuffer outResult = new StringBuffer();

		jsonobject = new JsonObject();
		jsonobject.addProperty("op_mode", selRedinfVO.getOp_mode());
		jsonobject.addProperty("inf_key", selRedinfVO.getInf_key());
		jsonobject.addProperty("conf_url", selRedinfVO.getConf_url());
		jsonobject.addProperty("conf_apikey", selRedinfVO.getConf_apikey());
		jsonobject.addProperty("FMLY_NAME", selRedinfVO.getFMLY_NAME());
		jsonobject.addProperty("FMLY_RRNF", selRedinfVO.getFMLY_RRNF());
		jsonobject.addProperty("FMLY_RRNS", selRedinfVO.getFMLY_RRNS());

		gson = new Gson();
		strJson = gson.toJson(jsonobject);  //selMedPntVO 객체를 JSON 형식으로 변환

		sendUrl = new URL(getSendUrl(actionName));  //url 가져오기
		if (sendUrl != null){
			httpConn = (HttpURLConnection) sendUrl.openConnection();
			httpConn.setDoOutput(true);
			httpConn.setRequestMethod("POST");
			httpConn.setRequestProperty("Content-Type", "application/json");
			httpConn.setRequestProperty("Accept-Charset", "UTF-8");
			httpConn.setRequestProperty("x-ncp-apigw-api-key", "xknULzLrGwHLJHnHS68PveU8FL43dDUivfRMsWbU");
			httpConn.setConnectTimeout(120000);
			httpConn.setReadTimeout(120000);

			os = httpConn.getOutputStream();
			os.write(strJson.getBytes("UTF-8"));
			os.flush();

			in = new BufferedReader(new InputStreamReader(httpConn.getInputStream(), "UTF-8"));
			while ((inputLine = in.readLine()) != null) {
				outResult.append(inputLine);
			}

			httpConn.disconnect();
		}

		//End CF Call.

		//JSON to XML convert start
		ReturnXml = JsonToXmlConv(outResult.toString(), actionName);
		//ReturnXml = outResult.toString();

		if(gson != null) {
			//gson.close();
			gson = null;
		}

		return ReturnXml;

	}

	public String func_InsMedpnt(NcfInsMedpntVO insMedPntVO) throws Exception {
		//receive XML String from Client
		String strXml = null;
		XPathFactory xpathFactory = XPathFactory.newInstance();
		XPath xpath = xpathFactory.newXPath();
		XPathExpression expr = null;
		NodeList nodeList = null;
		String ReturnXml = null;

		//JSON Parser
		Gson gson = null;
		JsonObject jsonobject = null;
		String strJson = null;

		//CF API 호출 관련
		URL sendUrl = null;
		HttpURLConnection httpConn = null;
		OutputStream os = null;
		BufferedReader in = null;
		String inputLine = null;
		StringBuffer outResult = new StringBuffer();

		jsonobject = new JsonObject();
		jsonobject.addProperty("op_mode", insMedPntVO.getOp_mode());
		jsonobject.addProperty("inf_key", insMedPntVO.getInf_key());
		jsonobject.addProperty("conf_url", insMedPntVO.getConf_url());
		jsonobject.addProperty("conf_apikey", insMedPntVO.getConf_apikey());

		JsonObject medpntInfo = new JsonObject();
		medpntInfo.addProperty("empl_numb", insMedPntVO.getEmpl_numb());
		medpntInfo.addProperty("mepn_date", insMedPntVO.getMepn_date());
		medpntInfo.addProperty("medi_pntx", insMedPntVO.getMedi_pntx());
		medpntInfo.addProperty("fmly_name", insMedPntVO.getFmly_name());
		medpntInfo.addProperty("used_wecd", insMedPntVO.getUsed_wecd());
		medpntInfo.addProperty("inst_usid", insMedPntVO.getInst_usid());
		medpntInfo.addProperty("mepn_remk", insMedPntVO.getMepn_remk());
		medpntInfo.addProperty("wage_encd", insMedPntVO.getWage_encd());
		medpntInfo.addProperty("frel_code", insMedPntVO.getFrel_code());

		jsonobject.add("medpntInfo", medpntInfo);
		gson = new Gson();
		strJson = gson.toJson(jsonobject);  //selMedPntVO 객체를 JSON 형식으로 변환

		sendUrl = new URL(getSendUrl("insMedpnt"));  //url 가져오기
		if (sendUrl != null){
			httpConn = (HttpURLConnection) sendUrl.openConnection();
			httpConn.setDoOutput(true);
			httpConn.setRequestMethod("POST");
			httpConn.setRequestProperty("Content-Type", "application/json");
			httpConn.setRequestProperty("Accept-Charset", "UTF-8");
			httpConn.setRequestProperty("x-ncp-apigw-api-key", "xknULzLrGwHLJHnHS68PveU8FL43dDUivfRMsWbU");
			httpConn.setConnectTimeout(120000);
			httpConn.setReadTimeout(120000);

			os = httpConn.getOutputStream();
			os.write(strJson.getBytes("UTF-8"));
			os.flush();

			in = new BufferedReader(new InputStreamReader(httpConn.getInputStream(), "UTF-8"));
			while ((inputLine = in.readLine()) != null) {
				outResult.append(inputLine);
			}

			httpConn.disconnect();
		}

		//End CF Call.

		//JSON to XML convert start
		ReturnXml = JsonToXmlConv(outResult.toString(), "insMedpnt");

		if(gson != null) {
			//gson.close();
			gson = null;
		}

		return ReturnXml;
	}

	public String func_SelMedpnt(NcfSelMedpntVO selMedPntVO, String actionName) throws Exception {
		//receive XML String from Client
		String strXml = null;
		XPathFactory xpathFactory = XPathFactory.newInstance();
		XPath xpath = xpathFactory.newXPath();
		XPathExpression expr = null;
		NodeList nodeList = null;
		String ReturnXml = null;

		//JSON Parser
		Gson gson = null;
		JsonObject jsonobject = null;
		String strJson = null;

		//CF API 호출 관련
		URL sendUrl = null;
		HttpURLConnection httpConn = null;
		OutputStream os = null;
		BufferedReader in = null;
		String inputLine = null;
		StringBuffer outResult = new StringBuffer();

		jsonobject = new JsonObject();
		jsonobject.addProperty("op_mode", selMedPntVO.getOp_mode());
		jsonobject.addProperty("inf_key", selMedPntVO.getInf_key());
		jsonobject.addProperty("conf_url", selMedPntVO.getConf_url());
		jsonobject.addProperty("conf_apikey", selMedPntVO.getConf_apikey());
		jsonobject.addProperty("empNumber", selMedPntVO.getEmpNumber());

		gson = new Gson();
		strJson = gson.toJson(jsonobject);  //selMedPntVO 객체를 JSON 형식으로 변환

		sendUrl = new URL(getSendUrl(actionName));  //url 가져오기
		if (sendUrl != null){
			httpConn = (HttpURLConnection) sendUrl.openConnection();
			httpConn.setDoOutput(true);
			httpConn.setRequestMethod("POST");
			httpConn.setRequestProperty("Content-Type", "application/json");
			httpConn.setRequestProperty("Accept-Charset", "UTF-8");
			httpConn.setRequestProperty("x-ncp-apigw-api-key", "xknULzLrGwHLJHnHS68PveU8FL43dDUivfRMsWbU");
			httpConn.setConnectTimeout(120000);
			httpConn.setReadTimeout(120000);

			os = httpConn.getOutputStream();
			os.write(strJson.getBytes("UTF-8"));
			os.flush();

			in = new BufferedReader(new InputStreamReader(httpConn.getInputStream(), "UTF-8"));
			while ((inputLine = in.readLine()) != null) {
				outResult.append(inputLine);
			}

			httpConn.disconnect();
		}

		//End CF Call.

		//JSON to XML convert start
		ReturnXml = JsonToXmlConv(outResult.toString(), actionName);
		//ReturnXml = JsonToXmlConv("asdf", actionName);

		if(gson != null) {
			//gson.close();
			gson = null;
		}

		return ReturnXml;

	}
%>

