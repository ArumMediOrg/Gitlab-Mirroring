<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="org.xml.sax.InputSource"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="com.google.gson.JsonArray"%>
<%@ page import="com.google.gson.JsonParser"%>
<%@ page import="java.net.*"%>
<%@ page import="javax.xml.xpath.*"%>
<%@ page import="javax.xml.transform.*"%>
<%@ page import="javax.xml.transform.dom.DOMSource"%>
<%@ page import="javax.xml.transform.stream.*"%>

<%@ include file="NcfMedpntResVO.jsp"%>
<%@ include file="NcfMastxmResVO.jsp"%>
<%@ include file="NcfRedinfResVO.jsp"%>
<%@ include file="NcfRedinfEmpNumResVO.jsp"%>
<%@ include file="NcfMedpntResListVO.jsp"%>
<%!
	// Json 리턴 값을 최종 xml 형식으로 만들어주기
	public String JsonToXmlConv(String JsonStr, String actionName) throws Exception {
		//select return 형식
		//String str = "{\"medpntList\":[{\"empl_numb\":\"20310\",\"medi_pntx_sum\":\"40000\"}],\"rescode\":\"0\",\"resmsg\":\"\"}";

		//insert, exec 리턴 형식
		//String str = "{\"rescode\":\"0\",\"resmsg\":\"\"}";
		JsonParser Parser = new JsonParser();

		JsonObject jsonObj = (JsonObject) Parser.parse(JsonStr);

		List<NcfMedpntResVO> resList = null;
		List<NcfMastxmResVO> mastxmResList = null;
		List<NcfRedinfResVO> redinfResList = null;
		List<NcfRedinfEmpNumResVO> redinfEmpNumResList = null;
		List<NcfMedpntResListVO> medRecordList = null;

		//select 요청일때 / ins,exec 일 때 구분
		if (actionName.equals("selMedpnt")) {
			resList = new ArrayList<NcfMedpntResVO>();
			JsonArray memberArray = (JsonArray) jsonObj.get("medpntList");
			for (int i = 0; i < memberArray.size(); i++) {
				JsonObject object = (JsonObject) memberArray.get(i);

				NcfMedpntResVO ResVO = new NcfMedpntResVO();
				if(object.has("empl_numb")){ ResVO.setEmpl_numb(object.get("empl_numb").getAsString()); }
				if(object.has("medi_pntx_sum")){ ResVO.setMedi_pntx_sum(object.get("medi_pntx_sum").getAsString()); }
				if(object.has("wage_encd")){ ResVO.setWage_encd(object.get("wage_encd").getAsString()); }

				ResVO.setRescode(jsonObj.get("rescode").getAsString());
				ResVO.setResmsg(jsonObj.get("resmsg").getAsString());

				resList.add(ResVO);
			}
		} else if (actionName.equals("selMastxm")) {
			mastxmResList = new ArrayList<NcfMastxmResVO>();
			JsonArray memberArray = (JsonArray) jsonObj.get("mastxmList");
			for (int i = 0; i < memberArray.size(); i++) {
				JsonObject object = (JsonObject) memberArray.get(i);

				NcfMastxmResVO ResVO = new NcfMastxmResVO();
				if(object.has("EMPL_NUMB")){ ResVO.setEMPL_NUMB(object.get("EMPL_NUMB").getAsString().trim()); }
				if(object.has("EMPL_NAME")){ ResVO.setEMPL_NAME(object.get("EMPL_NAME").getAsString().trim()); }
				if(object.has("CPOS_CODE")){ ResVO.setCPOS_CODE(object.get("CPOS_CODE").getAsString().trim()); }
				if(object.has("CPOS_NAME")){ ResVO.setCPOS_NAME(object.get("CPOS_NAME").getAsString().trim()); }
				if(object.has("OPOS_CODE")){ ResVO.setOPOS_CODE(object.get("OPOS_CODE").getAsString().trim()); }
				if(object.has("OPOS_NAME")){ ResVO.setOPOS_NAME(object.get("OPOS_NAME").getAsString().trim()); }
				if(object.has("ORIG_DTNM")){ ResVO.setORIG_DTNM(object.get("ORIG_DTNM").getAsString().trim()); }
				if(object.has("RERN_NUMB")){ ResVO.setRERN_NUMB(object.get("RERN_NUMB").getAsString().trim()); }
				if(object.has("EMPL_POINT")){ ResVO.setEMPL_POINT(object.get("EMPL_POINT").getAsString().trim()); }
				if(object.has("ENCO_DATE")){ ResVO.setENCO_DATE(object.get("ENCO_DATE").getAsString().trim()); }
				if(object.has("RETR_DATE")){ ResVO.setRETR_DATE(object.get("RETR_DATE").getAsString().trim()); }
				if(object.has("WODN_CODE")){ ResVO.setWODN_CODE(object.get("WODN_CODE").getAsString().trim()); }
				if(object.has("WODN_NAME")){ ResVO.setWODN_NAME(object.get("WODN_NAME").getAsString().trim()); }
				if(object.has("LOCA_ENCD")){ ResVO.setLOCA_ENCD(object.get("LOCA_ENCD").getAsString().trim()); }
				if(object.has("LOCA_NAME")){ ResVO.setLOCA_NAME(object.get("LOCA_NAME").getAsString().trim()); }
				if(object.has("WAGE_ENCD")){ ResVO.setWAGE_ENCD(object.get("WAGE_ENCD").getAsString().trim()); }
				if(object.has("WAGE_NAME")){ ResVO.setWAGE_NAME(object.get("WAGE_NAME").getAsString().trim()); }

				ResVO.setRescode(jsonObj.get("rescode").getAsString());
				ResVO.setResmsg(jsonObj.get("resmsg").getAsString());

				mastxmResList.add(ResVO);
			}
		} else if (actionName.equals("selRedinf")) {
			redinfResList = new ArrayList<NcfRedinfResVO>();
			JsonArray memberArray = (JsonArray) jsonObj.get("redinfList");

			for (int i = 0; i < memberArray.size(); i++) {
				JsonObject object = (JsonObject) memberArray.get(i);

				NcfRedinfResVO ResVO = new NcfRedinfResVO();
				if(object.has("EMPL_NUMB")){ ResVO.setEMPL_NUMB(object.get("EMPL_NUMB").getAsString().trim()); }
				if(object.has("EMPL_NAME")){ ResVO.setEMPL_NAME(object.get("EMPL_NAME").getAsString().trim()); }
				if(object.has("CPOS_CODE")){ ResVO.setCPOS_CODE(object.get("CPOS_CODE").getAsString().trim()); }
				if(object.has("CPOS_NAME")){ ResVO.setCPOS_NAME(object.get("CPOS_NAME").getAsString().trim()); }
				if(object.has("OPOS_CODE")){ ResVO.setOPOS_CODE(object.get("OPOS_CODE").getAsString().trim()); }
				if(object.has("OPOS_NAME")){ ResVO.setOPOS_NAME(object.get("OPOS_NAME").getAsString().trim()); }
				if(object.has("ORIG_DTNM")){ ResVO.setORIG_DTNM(object.get("ORIG_DTNM").getAsString().trim()); }
				if(object.has("FMLY_NAME")){ ResVO.setFMLY_NAME(object.get("FMLY_NAME").getAsString().trim()); }
				if(object.has("FMLY_SSEC")){ ResVO.setFMLY_SSEC(object.get("FMLY_SSEC").getAsString().trim()); }
				if(object.has("FREL_CODE")){ ResVO.setFREL_CODE(object.get("FREL_CODE").getAsString().trim()); }
				if(object.has("FREL_NAME")){ ResVO.setFREL_NAME(object.get("FREL_NAME").getAsString().trim()); }
				if(object.has("WODN_CODE")){ ResVO.setWODN_CODE(object.get("WODN_CODE").getAsString().trim()); }
				if(object.has("WODN_NAME")){ ResVO.setWODN_NAME(object.get("WODN_NAME").getAsString().trim()); }

				ResVO.setRescode(jsonObj.get("rescode").getAsString());
				ResVO.setResmsg(jsonObj.get("resmsg").getAsString());

				redinfResList.add(ResVO);
			}
		} else if (actionName.equals("selRedinfEmpNum")) {
			redinfEmpNumResList = new ArrayList<NcfRedinfEmpNumResVO>();
			JsonArray memberArray = (JsonArray) jsonObj.get("redinfList");
			for (int i = 0; i < memberArray.size(); i++) {
				JsonObject object = (JsonObject) memberArray.get(i);

				NcfRedinfEmpNumResVO ResVO = new NcfRedinfEmpNumResVO();
				if(object.has("EMPL_NUMB")){ ResVO.setEMPL_NUMB(object.get("EMPL_NUMB").getAsString().trim()); }
				if(object.has("EMPL_NAME")){ ResVO.setEMPL_NAME(object.get("EMPL_NAME").getAsString().trim()); }
				if(object.has("FMLY_NAME")){ ResVO.setFMLY_NAME(object.get("FMLY_NAME").getAsString().trim()); }
				if(object.has("FMLY_SSEC")){ ResVO.setFMLY_SSEC(object.get("FMLY_SSEC").getAsString().trim()); }
				if(object.has("FREL_CODE")){ ResVO.setFREL_CODE(object.get("FREL_CODE").getAsString().trim()); }
				if(object.has("FREL_NAME")){ ResVO.setFREL_NAME(object.get("FREL_NAME").getAsString().trim()); }

				ResVO.setRescode(jsonObj.get("rescode").getAsString());
				ResVO.setResmsg(jsonObj.get("resmsg").getAsString());

				redinfEmpNumResList.add(ResVO);
			}
		} else if (actionName.equals("selMedpntList")) {
			medRecordList = new ArrayList<NcfMedpntResListVO>();
			JsonArray memberArray = (JsonArray) jsonObj.get("medpntList");
			for (int i = 0; i < memberArray.size(); i++) {
				JsonObject object = (JsonObject) memberArray.get(i);
				NcfMedpntResListVO ResVO = new NcfMedpntResListVO();
				if(object.has("empl_numb")){ ResVO.setEmpl_numb(object.get("empl_numb").getAsString().trim()); }
				if(object.has("mepn_uscd")){ ResVO.setMepn_uscd(object.get("mepn_uscd").getAsString().trim()); }
				if(object.has("sral_numb")){ ResVO.setSral_numb(object.get("sral_numb").getAsString().trim()); }
				if(object.has("mepn_date")){ ResVO.setMepn_date(object.get("mepn_date").getAsString().trim()); }
				if(object.has("wage_encd")){ ResVO.setWage_encd(object.get("wage_encd").getAsString().trim()); }
				if(object.has("medi_pntx")){ ResVO.setMedi_pntx(object.get("medi_pntx").getAsString().trim()); }
				if(object.has("untl_date")){ ResVO.setUntl_date(object.get("untl_date").getAsString().trim()); }
				if(object.has("frel_code")){ ResVO.setFrel_code(object.get("frel_code").getAsString().trim()); }
				if(object.has("fmly_name")){ ResVO.setFmly_name(object.get("fmly_name").getAsString().trim()); }
				if(object.has("used_wecd")){ ResVO.setUsed_wecd(object.get("used_wecd").getAsString().trim()); }
				if(object.has("expt_ysno_yn")){ ResVO.setExpt_ysno_yn(object.get("expt_ysno_yn").getAsString().trim()); }
				if(object.has("expt_ysno")){ ResVO.setExpt_ysno(object.get("expt_ysno").getAsString().trim()); }
				if(object.has("mepn_excd")){ ResVO.setMepn_excd(object.get("mepn_excd").getAsString().trim()); }
				if(object.has("cnfm_ysno_yn")){ ResVO.setCnfm_ysno_yn(object.get("cnfm_ysno_yn").getAsString().trim()); }
				if(object.has("cnfm_ysno")){ ResVO.setCnfm_ysno(object.get("cnfm_ysno").getAsString().trim()); }
				if(object.has("remk_200x")){ ResVO.setRemk_200x(object.get("remk_200x").getAsString().trim()); }
				if(object.has("inst_usid")){ ResVO.setInst_usid(object.get("inst_usid").getAsString().trim()); }
				if(object.has("inst_date")){ ResVO.setInst_date(object.get("inst_date").getAsString().trim()); }
				if(object.has("updt_usid")){ ResVO.setUpdt_usid(object.get("updt_usid").getAsString().trim()); }
				if(object.has("updt_date")){ ResVO.setUpdt_date(object.get("updt_date").getAsString().trim()); }
				if(object.has("mepn_remk")){ ResVO.setMepn_remk(object.get("mepn_remk").getAsString().trim()); }
				if(object.has("usex_pntx")){ ResVO.setUsex_pntx(object.get("usex_pntx").getAsString().trim()); }

				ResVO.setRescode(jsonObj.get("rescode").getAsString());
				ResVO.setResmsg(jsonObj.get("resmsg").getAsString());

				medRecordList.add(ResVO);
			}
		} else {
			resList = new ArrayList<NcfMedpntResVO>();
			NcfMedpntResVO ResVO = new NcfMedpntResVO();
			ResVO.setRescode(jsonObj.get("rescode").getAsString());
			ResVO.setResmsg(jsonObj.get("resmsg").getAsString());

			resList.add(ResVO);
		}
		// XML 문서 파싱
	    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	    DocumentBuilder documentBuilder = factory.newDocumentBuilder();

	    // 새로운 XML 생성! //
	    // 새로운 Document 객체 생성
	    Document document = documentBuilder.newDocument();

	    // root 생성
	    Element root = document.createElement("nurionXml");

	    // 자식 노드 생성
	    Element resultCode = document.createElement("resultCode");

	    // 텍스트 설정
	    resultCode.setTextContent("200");

	    Element resultXml = document.createElement("resultXml");

	    Element xmlMain = document.createElement("xml");

	    xmlMain.setAttributeNS("http://www.w3.org/2000/xmlns/","xmlns:s","uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882");
	    xmlMain.setAttributeNS("http://www.w3.org/2000/xmlns/","xmlns:dt","uuid:C2F41010-65B3-11d1-A29F-00AA00C14882");
	    xmlMain.setAttributeNS("http://www.w3.org/2000/xmlns/","xmlns:rs","urn:schemas-microsoft-com:rowset");
	    xmlMain.setAttributeNS("http://www.w3.org/2000/xmlns/","xmlns:z","#RowsetSchema");

	    Element sSchema = document.createElement("s:Schema");
	    sSchema.setAttribute("id", "RowsetSchema");

	    Element sElementType = document.createElement("s:ElementType");
	    sElementType.setAttribute("name", "row");
	    sElementType.setAttribute("content", "eltOnly");
	    sElementType.setAttribute("rs:updatable", "true");

		//return xml 공통 형식 세팅
	    document.appendChild(root);
	    root.appendChild(resultCode);
	    root.appendChild(resultXml);
	    resultXml.appendChild(xmlMain);

	    xmlMain.appendChild(sSchema);
	    sSchema.appendChild(sElementType);


	    //반복 스타트
		List<String> fieldList = null;

		if (actionName.equals("selMedpnt")) {
			fieldList = Arrays.asList("empl_numb", "medi_pntx_sum", "wage_encd", "rescode", "resmsg");
		} else if (actionName.equals("selMastxm")) {
			fieldList = Arrays.asList("EMPL_NUMB", "EMPL_NAME", "CPOS_CODE", "CPOS_NAME", "OPOS_CODE", "OPOS_NAME", "ORIG_DTNM", "RERN_NUMB", "EMPL_POINT", "ENCO_DATE", "RETR_DATE", "WODN_CODE", "WODN_NAME", "LOCA_ENCD", "LOCA_NAME", "WAGE_ENCD", "WAGE_NAME", "rescode", "resmsg");
		} else if (actionName.equals("selRedinf")) {
			fieldList = Arrays.asList("EMPL_NUMB", "EMPL_NAME", "CPOS_CODE", "CPOS_NAME", "OPOS_CODE", "OPOS_NAME", "ORIG_DTNM", "FMLY_NAME", "FMLY_SSEC", "FREL_CODE", "FREL_NAME", "WODN_CODE", "WODN_NAME", "rescode", "resmsg");
		} else if (actionName.equals("selRedinfEmpNum")) {
			fieldList = Arrays.asList("EMPL_NUMB", "EMPL_NAME", "FMLY_NAME", "FMLY_SSEC", "FREL_CODE", "FREL_NAME", "rescode", "resmsg");
		} else if (actionName.equals("selMedpntList")) {
			fieldList = Arrays.asList("EMPL_NUMB", "MEPN_USCD", "SRAL_NUMB", "MEPN_DATE", "WAGE_ENCD", "MEDI_PNTX", "UNTL_DATE", "FREL_CODE", "FMLY_NAME", "USED_WECD", "EXPT_YSNO_YN", "EXPT_YSNO", "MEPN_EXCD", "CNFM_YSNO_YN", "CNFM_YSNO", "REMK_200X", "INST_USID", "INST_DATE", "UPDT_USID", "UPDT_DATE", "MEPN_REMK", "USEX_PNTX", "rescode", "resmsg");
		} else {
			fieldList = Arrays.asList("rescode", "resmsg");
		}

		//s:AttributeType, s:datatype 반복 (column명, type등)
	    for (String FieldValue : fieldList) {
	    	Element sAttributeType = document.createElement("s:AttributeType");
		    sAttributeType.setAttribute("name", FieldValue);
		    sAttributeType.setAttribute("rs:number", String.valueOf(fieldList.indexOf(FieldValue)+1));
		    sAttributeType.setAttribute("rs:nullable", "true");
		    sAttributeType.setAttribute("rs:basetable", "DUAL");
		    sAttributeType.setAttribute("rs:basecolumn", FieldValue);
		    sAttributeType.setAttribute("rs:keycolumn", "true");

		    Element sDataType = document.createElement("s:dataType");
		    sDataType.setAttribute("dt:type", "string");
		    sDataType.setAttribute("rs:dbtype", "str");
		    sDataType.setAttribute("dt:maxLength", "500");
		    sDataType.setAttribute("rs:scale", "0");
		    sDataType.setAttribute("rs:fixedlength", "true");


		    sElementType.appendChild(sAttributeType);
		    sAttributeType.appendChild(sDataType);
	    }
	    Element sExtends = document.createElement("s:extends");
	    sExtends.setAttribute("type", "rs:rowbase");
	    sElementType.appendChild(sExtends);


		//z:row 반복 (결과값)
		if (actionName.equals("selMedpnt")) {
			for (NcfMedpntResVO rtnVO : resList) {
				Element rsData = document.createElement("rs:data");

				Element zRow = document.createElement("z:row");
				if (rtnVO.getEmpl_numb() != null) {
					zRow.setAttribute("empl_numb", rtnVO.getEmpl_numb());
				}
				if (rtnVO.getWage_encd() != null) {
					zRow.setAttribute("wage_encd", rtnVO.getWage_encd());
				}
				if (rtnVO.getMedi_pntx_sum() != null) {
					zRow.setAttribute("medi_pntx_sum", rtnVO.getMedi_pntx_sum());
				}
				if (rtnVO.getRescode() != null) {
					zRow.setAttribute("rescode", rtnVO.getRescode());
				}
				if (rtnVO.getResmsg() != null) {
					zRow.setAttribute("resmsg", rtnVO.getResmsg());
				}

				xmlMain.appendChild(rsData);
				rsData.appendChild(zRow);
	    	}
		} else if (actionName.equals("selMastxm")) {
			for (NcfMastxmResVO rtnVO : mastxmResList) {
				Element rsData = document.createElement("rs:data");

				Element zRow = document.createElement("z:row");

				if (rtnVO.getEMPL_NUMB() != null) {
					zRow.setAttribute("EMPL_NUMB", rtnVO.getEMPL_NUMB());
				}
				if (rtnVO.getEMPL_NAME() != null) {
					zRow.setAttribute("EMPL_NAME", rtnVO.getEMPL_NAME());
				}
				if (rtnVO.getCPOS_CODE() != null) {
					zRow.setAttribute("CPOS_CODE", rtnVO.getCPOS_CODE());
				}
				if (rtnVO.getCPOS_NAME() != null) {
					zRow.setAttribute("CPOS_NAME", rtnVO.getCPOS_NAME());
				}
				if (rtnVO.getOPOS_CODE() != null) {
					zRow.setAttribute("OPOS_CODE", rtnVO.getOPOS_CODE());
				}
				if (rtnVO.getOPOS_NAME() != null) {
					zRow.setAttribute("OPOS_NAME", rtnVO.getOPOS_NAME());
				}
				if (rtnVO.getORIG_DTNM() != null) {
					zRow.setAttribute("ORIG_DTNM", rtnVO.getORIG_DTNM());
				}
				if (rtnVO.getRERN_NUMB() != null) {
					zRow.setAttribute("RERN_NUMB", rtnVO.getRERN_NUMB());
				}
				if (rtnVO.getEMPL_POINT() != null) {
					zRow.setAttribute("EMPL_POINT", rtnVO.getEMPL_POINT());
				}
				if (rtnVO.getENCO_DATE() != null) {
					zRow.setAttribute("ENCO_DATE", rtnVO.getENCO_DATE());
				}
				if (rtnVO.getRETR_DATE() != null) {
					zRow.setAttribute("RETR_DATE", rtnVO.getRETR_DATE());
				}
				if (rtnVO.getWODN_CODE() != null) {
					zRow.setAttribute("WODN_CODE", rtnVO.getWODN_CODE());
				}
				if (rtnVO.getWODN_NAME() != null) {
					zRow.setAttribute("WODN_NAME", rtnVO.getWODN_NAME());
				}

				if (rtnVO.getLOCA_ENCD() != null) {
					zRow.setAttribute("LOCA_ENCD", rtnVO.getLOCA_ENCD());
				}
				if (rtnVO.getLOCA_NAME() != null) {
					zRow.setAttribute("LOCA_NAME", rtnVO.getLOCA_NAME());
				}

				if (rtnVO.getWAGE_ENCD() != null) {
					zRow.setAttribute("WAGE_ENCD", rtnVO.getWAGE_ENCD());
				}
				if (rtnVO.getWAGE_NAME() != null) {
					zRow.setAttribute("WAGE_NAME", rtnVO.getWAGE_NAME());
				}

				if (rtnVO.getRescode() != null) {
					zRow.setAttribute("rescode", rtnVO.getRescode());
				}
				if (rtnVO.getResmsg() != null) {
					zRow.setAttribute("resmsg", rtnVO.getResmsg());
				}

				xmlMain.appendChild(rsData);
				rsData.appendChild(zRow);
	    	}
		}  else if (actionName.equals("selRedinf")) {
			for (NcfRedinfResVO rtnVO : redinfResList) {
				Element rsData = document.createElement("rs:data");

				Element zRow = document.createElement("z:row");

				if (rtnVO.getEMPL_NUMB() != null) {
					zRow.setAttribute("EMPL_NUMB", rtnVO.getEMPL_NUMB());
				}
				if (rtnVO.getEMPL_NAME() != null) {
					zRow.setAttribute("EMPL_NAME", rtnVO.getEMPL_NAME());
				}
				if (rtnVO.getCPOS_CODE() != null) {
					zRow.setAttribute("CPOS_CODE", rtnVO.getCPOS_CODE());
				}
				if (rtnVO.getCPOS_NAME() != null) {
					zRow.setAttribute("CPOS_NAME", rtnVO.getCPOS_NAME());
				}
				if (rtnVO.getOPOS_CODE() != null) {
					zRow.setAttribute("OPOS_CODE", rtnVO.getOPOS_CODE());
				}
				if (rtnVO.getOPOS_NAME() != null) {
					zRow.setAttribute("OPOS_NAME", rtnVO.getOPOS_NAME());
				}
				if (rtnVO.getORIG_DTNM() != null) {
					zRow.setAttribute("ORIG_DTNM", rtnVO.getORIG_DTNM());
				}
				if (rtnVO.getFMLY_NAME() != null) {
					zRow.setAttribute("FMLY_NAME", rtnVO.getFMLY_NAME());
				}
				if (rtnVO.getFMLY_SSEC() != null) {
					zRow.setAttribute("FMLY_SSEC", rtnVO.getFMLY_SSEC());
				}
				if (rtnVO.getFREL_CODE() != null) {
					zRow.setAttribute("FREL_CODE", rtnVO.getFREL_CODE());
				}
				if (rtnVO.getFREL_NAME() != null) {
					zRow.setAttribute("FREL_NAME", rtnVO.getFREL_NAME());
				}
				if (rtnVO.getWODN_CODE() != null) {
					zRow.setAttribute("WODN_CODE", rtnVO.getWODN_CODE());
				}
				if (rtnVO.getWODN_NAME() != null) {
					zRow.setAttribute("WODN_NAME", rtnVO.getWODN_NAME());
				}

				if (rtnVO.getRescode() != null) {
					zRow.setAttribute("rescode", rtnVO.getRescode());
				}
				if (rtnVO.getResmsg() != null) {
					zRow.setAttribute("resmsg", rtnVO.getResmsg());
				}

				xmlMain.appendChild(rsData);
				rsData.appendChild(zRow);
	    	}
		} else if (actionName.equals("selRedinfEmpNum")) {
			for (NcfRedinfEmpNumResVO rtnVO : redinfEmpNumResList) {
				Element rsData = document.createElement("rs:data");

				Element zRow = document.createElement("z:row");

				if (rtnVO.getEMPL_NUMB() != null) {
					zRow.setAttribute("EMPL_NUMB", rtnVO.getEMPL_NUMB());
				}
				if (rtnVO.getEMPL_NAME() != null) {
					zRow.setAttribute("EMPL_NAME", rtnVO.getEMPL_NAME());
				}
				if (rtnVO.getFMLY_NAME() != null) {
					zRow.setAttribute("FMLY_NAME", rtnVO.getFMLY_NAME());
				}
				if (rtnVO.getFMLY_SSEC() != null) {
					zRow.setAttribute("FMLY_SSEC", rtnVO.getFMLY_SSEC());
				}
				if (rtnVO.getFREL_CODE() != null) {
					zRow.setAttribute("FREL_CODE", rtnVO.getFREL_CODE());
				}
				if (rtnVO.getFREL_NAME() != null) {
					zRow.setAttribute("FREL_NAME", rtnVO.getFREL_NAME());
				}

				if (rtnVO.getRescode() != null) {
					zRow.setAttribute("rescode", rtnVO.getRescode());
				}
				if (rtnVO.getResmsg() != null) {
					zRow.setAttribute("resmsg", rtnVO.getResmsg());
				}

				xmlMain.appendChild(rsData);
				rsData.appendChild(zRow);
	    	}
		} else if (actionName.equals("selMedpntList")) {
			for (NcfMedpntResListVO rtnVO : medRecordList) {
				Element rsData = document.createElement("rs:data");

				Element zRow = document.createElement("z:row");


				if (rtnVO.getEmpl_numb() != null) {
					zRow.setAttribute("EMPL_NUMB", rtnVO.getEmpl_numb());
				}
				if (rtnVO.getMepn_uscd() != null) {
					zRow.setAttribute("MEPN_USCD", rtnVO.getMepn_uscd());
				}
				if (rtnVO.getSral_numb() != null) {
					zRow.setAttribute("SRAL_NUMB", rtnVO.getSral_numb());
				}
				if (rtnVO.getMepn_date() != null) {
					zRow.setAttribute("MEPN_DATE", rtnVO.getMepn_date());
				}
				if (rtnVO.getWage_encd() != null) {
					zRow.setAttribute("WAGE_ENCD", rtnVO.getWage_encd());
				}
				if (rtnVO.getMedi_pntx() != null) {
					zRow.setAttribute("MEDI_PNTX", rtnVO.getMedi_pntx());
				}
				if (rtnVO.getUntl_date() != null) {
					zRow.setAttribute("UNTL_DATE", rtnVO.getUntl_date());
				}
				if (rtnVO.getFrel_code() != null) {
					zRow.setAttribute("FREL_CODE", rtnVO.getFrel_code());
				}
				if (rtnVO.getFmly_name() != null) {
					zRow.setAttribute("FMLY_NAME", rtnVO.getFmly_name());
				}
				if (rtnVO.getUsed_wecd() != null) {
					zRow.setAttribute("USED_WECD", rtnVO.getUsed_wecd());
				}
				if (rtnVO.getExpt_ysno_yn() != null) {
					zRow.setAttribute("EXPT_YSNO_YN", rtnVO.getExpt_ysno_yn());
				}
				if (rtnVO.getExpt_ysno() != null) {
					zRow.setAttribute("EXPT_YSNO", rtnVO.getExpt_ysno());
				}
				if (rtnVO.getMepn_excd() != null) {
					zRow.setAttribute("MEPN_EXCD", rtnVO.getMepn_excd());
				}
				if (rtnVO.getCnfm_ysno_yn() != null) {
					zRow.setAttribute("CNFM_YSNO_YN", rtnVO.getCnfm_ysno_yn());
				}
				if (rtnVO.getCnfm_ysno() != null) {
					zRow.setAttribute("CNFM_YSNO", rtnVO.getCnfm_ysno());
				}
				if (rtnVO.getRemk_200x() != null) {
					zRow.setAttribute("REMK_200X", rtnVO.getRemk_200x());
				}
				if (rtnVO.getInst_usid() != null) {
					zRow.setAttribute("INST_USID", rtnVO.getInst_usid());
				}
				if (rtnVO.getInst_date() != null) {
					zRow.setAttribute("INST_DATE", rtnVO.getInst_date());
				}
				if (rtnVO.getUpdt_usid() != null) {
					zRow.setAttribute("UPDT_USID", rtnVO.getUpdt_usid());
				}
				if (rtnVO.getUpdt_date() != null) {
					zRow.setAttribute("UPDT_DATE", rtnVO.getUpdt_date());
				}
				if (rtnVO.getMepn_remk() != null) {
					zRow.setAttribute("MEPN_REMK", rtnVO.getMepn_remk());
				}
				if (rtnVO.getUsex_pntx() != null) {
					zRow.setAttribute("USEX_PNTX", rtnVO.getUsex_pntx());
				}


				if (rtnVO.getRescode() != null) {
					zRow.setAttribute("rescode", rtnVO.getRescode());
				}
				if (rtnVO.getResmsg() != null) {
					zRow.setAttribute("resmsg", rtnVO.getResmsg());
				}

				xmlMain.appendChild(rsData);
				rsData.appendChild(zRow);
	    	}
		} else {
			for (NcfMedpntResVO rtnVO : resList) {
				Element rsData = document.createElement("rs:data");

				Element zRow = document.createElement("z:row");

				if (rtnVO.getRescode() != null) {
					zRow.setAttribute("rescode", rtnVO.getRescode());
				}
				if (rtnVO.getResmsg() != null) {
					zRow.setAttribute("resmsg", rtnVO.getResmsg());
				}

				xmlMain.appendChild(rsData);
				rsData.appendChild(zRow);
	    	}
		}


	    //반복엔드

	    // XML 문자열로 변환하기! //
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();

	    DOMSource domsrc = new DOMSource(document);
	    StreamResult result = new StreamResult(baos);

	    TransformerFactory transFactory = TransformerFactory.newInstance();
	    Transformer transformer = transFactory.newTransformer();

	    // 출력 시 문자코드: UTF-8
	    transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
	    // 들여 쓰기 있음
	    transformer.setOutputProperty(OutputKeys.INDENT, "yes");
	    transformer.transform(domsrc, result);

	    String strXml = new String(baos.toByteArray(), StandardCharsets.UTF_8);

        return strXml;

    }
%>