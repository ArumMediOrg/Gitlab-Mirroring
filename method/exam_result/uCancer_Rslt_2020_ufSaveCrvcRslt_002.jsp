<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCancer_Rslt_2020_ufSaveCrvcRslt_002.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String ICOUNT = htMethod.get("ICOUNT");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String CVEX_DT = htMethod.get("CVEX_DT");
		String DBCV_KD = htMethod.get("DBCV_KD");
		String CVSP1_KD = htMethod.get("CVSP1_KD");
		String CELL1_KD = htMethod.get("CELL1_KD");
		String CVRT1_KD = htMethod.get("CVRT1_KD");
		String SQRT1_KD = htMethod.get("SQRT1_KD");
		String NHRT1_KD = htMethod.get("NHRT1_KD");
		String EPRT1_KD = htMethod.get("EPRT1_KD");
		String NHEP1_KD = htMethod.get("NHEP1_KD");
		String EPET1_EX = htMethod.get("EPET1_EX");
		String RTET1_EX = htMethod.get("RTET1_EX");
		String ETCRT1_KD = htMethod.get("ETCRT1_KD");
		String ETCEX1_EX = htMethod.get("ETCEX1_EX");
		String CVSP2_KD = htMethod.get("CVSP2_KD");
		String CELL2_KD = htMethod.get("CELL2_KD");
		String CVRT2_KD = htMethod.get("CVRT2_KD");
		String SQRT2_KD = htMethod.get("SQRT2_KD");
		String NHRT2_KD = htMethod.get("NHRT2_KD");
		String EPRT2_KD = htMethod.get("EPRT2_KD");
		String NHEP2_KD = htMethod.get("NHEP2_KD");
		String EPET2_EX = htMethod.get("EPET2_EX");
		String RTET2_EX = htMethod.get("RTET2_EX");
		String ETCRT2_KD = htMethod.get("ETCRT2_KD");
		String ETCEX2_EX = htMethod.get("ETCEX2_EX");
		String RSLT_KD = htMethod.get("RSLT_KD");
		String ETC_EX = htMethod.get("ETC_EX");
		String CVCN_YN = htMethod.get("CVCN_YN");
		String RSLT_EX = htMethod.get("RSLT_EX");
		String CFRM_DT = htMethod.get("CFRM_DT");
		String LICEN_CD = htMethod.get("LICEN_CD");
		String COLL_LICEN_CD = htMethod.get("COLL_LICEN_CD");
		String PATH_LICEN_CD = htMethod.get("PATH_LICEN_CD");
		String USER = htMethod.get("USER");

		//
		if(ICOUNT == null) { ICOUNT = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CVEX_DT == null) { CVEX_DT = ""; }
		if(DBCV_KD == null) { DBCV_KD = ""; }
		if(CVSP1_KD == null) { CVSP1_KD = ""; }
		if(CELL1_KD == null) { CELL1_KD = ""; }
		if(CVRT1_KD == null) { CVRT1_KD = ""; }
		if(SQRT1_KD == null) { SQRT1_KD = ""; }
		if(NHRT1_KD == null) { NHRT1_KD = ""; }
		if(EPRT1_KD == null) { EPRT1_KD = ""; }
		if(NHEP1_KD == null) { NHEP1_KD = ""; }
		if(EPET1_EX == null) { EPET1_EX = ""; }
		if(RTET1_EX == null) { RTET1_EX = ""; }
		if(ETCRT1_KD == null) { ETCRT1_KD = ""; }
		if(ETCEX1_EX == null) { ETCEX1_EX = ""; }
		if(CVSP2_KD == null) { CVSP2_KD = ""; }
		if(CELL2_KD == null) { CELL2_KD = ""; }
		if(CVRT2_KD == null) { CVRT2_KD = ""; }
		if(SQRT2_KD == null) { SQRT2_KD = ""; }
		if(NHRT2_KD == null) { NHRT2_KD = ""; }
		if(EPRT2_KD == null) { EPRT2_KD = ""; }
		if(NHEP2_KD == null) { NHEP2_KD = ""; }
		if(EPET2_EX == null) { EPET2_EX = ""; }
		if(RTET2_EX == null) { RTET2_EX = ""; }
		if(ETCRT2_KD == null) { ETCRT2_KD = ""; }
		if(ETCEX2_EX == null) { ETCEX2_EX = ""; }
		if(RSLT_KD == null) { RSLT_KD = ""; }
		if(ETC_EX == null) { ETC_EX = ""; }
		if(CVCN_YN == null) { CVCN_YN = ""; }
		if(RSLT_EX == null) { RSLT_EX = ""; }
		if(CFRM_DT == null) { CFRM_DT = ""; }
		if(LICEN_CD == null) { LICEN_CD = ""; }
		if(COLL_LICEN_CD == null) { COLL_LICEN_CD = ""; }
		if(PATH_LICEN_CD == null) { PATH_LICEN_CD = ""; }
		if(USER == null) { USER = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCancer_Rslt_2020_ufSaveCrvcRslt_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCancer_Rslt_2020_ufSaveCrvcRslt_002 \n";
			G_INFO += "설명 : 자궁경부암 결과판정 저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ICOUNT : " + ICOUNT + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " CVEX_DT : " + CVEX_DT + " \n";
			G_INFO += " DBCV_KD : " + DBCV_KD + " \n";
			G_INFO += " CVSP1_KD : " + CVSP1_KD + " \n";
			G_INFO += " CELL1_KD : " + CELL1_KD + " \n";
			G_INFO += " CVRT1_KD : " + CVRT1_KD + " \n";
			G_INFO += " SQRT1_KD : " + SQRT1_KD + " \n";
			G_INFO += " NHRT1_KD : " + NHRT1_KD + " \n";
			G_INFO += " EPRT1_KD : " + EPRT1_KD + " \n";
			G_INFO += " NHEP1_KD : " + NHEP1_KD + " \n";
			G_INFO += " EPET1_EX : " + EPET1_EX + " \n";
			G_INFO += " RTET1_EX : " + RTET1_EX + " \n";
			G_INFO += " ETCRT1_KD : " + ETCRT1_KD + " \n";
			G_INFO += " ETCEX1_EX : " + ETCEX1_EX + " \n";
			G_INFO += " CVSP2_KD : " + CVSP2_KD + " \n";
			G_INFO += " CELL2_KD : " + CELL2_KD + " \n";
			G_INFO += " CVRT2_KD : " + CVRT2_KD + " \n";
			G_INFO += " SQRT2_KD : " + SQRT2_KD + " \n";
			G_INFO += " NHRT2_KD : " + NHRT2_KD + " \n";
			G_INFO += " EPRT2_KD : " + EPRT2_KD + " \n";
			G_INFO += " NHEP2_KD : " + NHEP2_KD + " \n";
			G_INFO += " EPET2_EX : " + EPET2_EX + " \n";
			G_INFO += " RTET2_EX : " + RTET2_EX + " \n";
			G_INFO += " ETCRT2_KD : " + ETCRT2_KD + " \n";
			G_INFO += " ETCEX2_EX : " + ETCEX2_EX + " \n";
			G_INFO += " RSLT_KD : " + RSLT_KD + " \n";
			G_INFO += " ETC_EX : " + ETC_EX + " \n";
			G_INFO += " CVCN_YN : " + CVCN_YN + " \n";
			G_INFO += " RSLT_EX : " + RSLT_EX + " \n";
			G_INFO += " CFRM_DT : " + CFRM_DT + " \n";
			G_INFO += " LICEN_CD : " + LICEN_CD + " \n";
			G_INFO += " COLL_LICEN_CD : " + COLL_LICEN_CD + " \n";
			G_INFO += " PATH_LICEN_CD : " + PATH_LICEN_CD + " \n";
			G_INFO += " USER : " + USER + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		out.clear();		// include된 파일안의 공백 제거
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

		if(stmtExec != null) {
			stmtExec.close();
			stmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
