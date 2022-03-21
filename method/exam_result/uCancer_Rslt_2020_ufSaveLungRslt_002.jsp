<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCancer_Rslt_2020_ufSaveLungRslt_002.jsp"%>
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
		String LUEX_DT = htMethod.get("LUEX_DT");
		String LUEX_KD = htMethod.get("LUEX_KD");
		String CTDI_VL = htMethod.get("CTDI_VL");
		String BEFO_YN = htMethod.get("BEFO_YN");
		String BEFO_YY = htMethod.get("BEFO_YY");
		String BEFO_MM = htMethod.get("BEFO_MM");
		String PNRT_YN = htMethod.get("PNRT_YN");
		String PNRT1_YN = htMethod.get("PNRT1_YN");
		String PNRT1IC_KD = htMethod.get("PNRT1IC_KD");
		String PNRT1SL_KD = htMethod.get("PNRT1SL_KD");
		String PNRT1SZ1_VL = htMethod.get("PNRT1SZ1_VL");
		String PNRT1SZ2_VL = htMethod.get("PNRT1SZ2_VL");
		String PNRT1FT_KD = htMethod.get("PNRT1FT_KD");
		String PNRT1TR1_KD = htMethod.get("PNRT1TR1_KD");
		String PNRT1TR2_KD = htMethod.get("PNRT1TR2_KD");
		String PNRT2_YN = htMethod.get("PNRT2_YN");
		String PNRT2IC_KD = htMethod.get("PNRT2IC_KD");
		String PNRT2SL_KD = htMethod.get("PNRT2SL_KD");
		String PNRT2SZ1_VL = htMethod.get("PNRT2SZ1_VL");
		String PNRT2SZ2_VL = htMethod.get("PNRT2SZ2_VL");
		String PNRT2FT_KD = htMethod.get("PNRT2FT_KD");
		String PNRT2TR1_KD = htMethod.get("PNRT2TR1_KD");
		String PNRT2TR2_KD = htMethod.get("PNRT2TR2_KD");
		String PNRT3_YN = htMethod.get("PNRT3_YN");
		String PNRT3IC_KD = htMethod.get("PNRT3IC_KD");
		String PNRT3SL_KD = htMethod.get("PNRT3SL_KD");
		String PNRT3SZ1_VL = htMethod.get("PNRT3SZ1_VL");
		String PNRT3SZ2_VL = htMethod.get("PNRT3SZ2_VL");
		String PNRT3FT_KD = htMethod.get("PNRT3FT_KD");
		String PNRT3TR1_KD = htMethod.get("PNRT3TR1_KD");
		String PNRT3TR2_KD = htMethod.get("PNRT3TR2_KD");
		String PNRT4_YN = htMethod.get("PNRT4_YN");
		String PNRT4IC_KD = htMethod.get("PNRT4IC_KD");
		String PNRT4SL_KD = htMethod.get("PNRT4SL_KD");
		String PNRT4SZ1_VL = htMethod.get("PNRT4SZ1_VL");
		String PNRT4SZ2_VL = htMethod.get("PNRT4SZ2_VL");
		String PNRT4FT_KD = htMethod.get("PNRT4FT_KD");
		String PNRT4TR1_KD = htMethod.get("PNRT4TR1_KD");
		String PNRT4TR2_KD = htMethod.get("PNRT4TR2_KD");
		String PNRT5_YN = htMethod.get("PNRT5_YN");
		String PNRT5IC_KD = htMethod.get("PNRT5IC_KD");
		String PNRT5SL_KD = htMethod.get("PNRT5SL_KD");
		String PNRT5SZ1_VL = htMethod.get("PNRT5SZ1_VL");
		String PNRT5SZ2_VL = htMethod.get("PNRT5SZ2_VL");
		String PNRT5FT_KD = htMethod.get("PNRT5FT_KD");
		String PNRT5TR1_KD = htMethod.get("PNRT5TR1_KD");
		String PNRT5TR2_KD = htMethod.get("PNRT5TR2_KD");
		String PNRT6_YN = htMethod.get("PNRT6_YN");
		String PNRT6IC_KD = htMethod.get("PNRT6IC_KD");
		String PNRT6SL_KD = htMethod.get("PNRT6SL_KD");
		String PNRT6SZ1_VL = htMethod.get("PNRT6SZ1_VL");
		String PNRT6SZ2_VL = htMethod.get("PNRT6SZ2_VL");
		String PNRT6FT_KD = htMethod.get("PNRT6FT_KD");
		String PNRT6TR1_KD = htMethod.get("PNRT6TR1_KD");
		String PNRT6TR2_KD = htMethod.get("PNRT6TR2_KD");
		String BRLE_YN = htMethod.get("BRLE_YN");
		String BRLE_EX = htMethod.get("BRLE_EX");
		String LUCN_KD = htMethod.get("LUCN_KD");
		String LUCN_EX = htMethod.get("LUCN_EX");
		String SCRT_CD = htMethod.get("SCRT_CD");
		String SCRT_EX = htMethod.get("SCRT_EX");
		String INPT_YN = htMethod.get("INPT_YN");
		String RSLT_KD = htMethod.get("RSLT_KD");
		String RSLT2_KD = htMethod.get("RSLT2_KD");
		String ETC_KD = htMethod.get("ETC_KD");
		String ETC_EX = htMethod.get("ETC_EX");
		String RSLT_EX = htMethod.get("RSLT_EX");
		String RSLT_ETC_EX = htMethod.get("RSLT_ETC_EX");
		String CFRM_DT = htMethod.get("CFRM_DT");
		String LICEN_CD = htMethod.get("LICEN_CD");
		String DECI_LICEN_CD = htMethod.get("DECI_LICEN_CD");
		String LUCN_YN = htMethod.get("LUCN_YN");
		String AFRL_EX = htMethod.get("AFRL_EX");
		String AFSM_EX = htMethod.get("AFSM_EX");
		String AFDT_DT = htMethod.get("AFDT_DT");
		String AFPL_CD = htMethod.get("AFPL_CD");
		String AFTE_LICEN_CD = htMethod.get("AFTE_LICEN_CD");
		String USER = htMethod.get("USER");

		//
		if(ICOUNT == null) { ICOUNT = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(LUEX_DT == null) { LUEX_DT = ""; }
		if(LUEX_KD == null) { LUEX_KD = ""; }
		if(CTDI_VL == null) { CTDI_VL = ""; }
		if(BEFO_YN == null) { BEFO_YN = ""; }
		if(BEFO_YY == null) { BEFO_YY = ""; }
		if(BEFO_MM == null) { BEFO_MM = ""; }
		if(PNRT_YN == null) { PNRT_YN = ""; }
		if(PNRT1_YN == null) { PNRT1_YN = ""; }
		if(PNRT1IC_KD == null) { PNRT1IC_KD = ""; }
		if(PNRT1SL_KD == null) { PNRT1SL_KD = ""; }
		if(PNRT1SZ1_VL == null) { PNRT1SZ1_VL = ""; }
		if(PNRT1SZ2_VL == null) { PNRT1SZ2_VL = ""; }
		if(PNRT1FT_KD == null) { PNRT1FT_KD = ""; }
		if(PNRT1TR1_KD == null) { PNRT1TR1_KD = ""; }
		if(PNRT1TR2_KD == null) { PNRT1TR2_KD = ""; }
		if(PNRT2_YN == null) { PNRT2_YN = ""; }
		if(PNRT2IC_KD == null) { PNRT2IC_KD = ""; }
		if(PNRT2SL_KD == null) { PNRT2SL_KD = ""; }
		if(PNRT2SZ1_VL == null) { PNRT2SZ1_VL = ""; }
		if(PNRT2SZ2_VL == null) { PNRT2SZ2_VL = ""; }
		if(PNRT2FT_KD == null) { PNRT2FT_KD = ""; }
		if(PNRT2TR1_KD == null) { PNRT2TR1_KD = ""; }
		if(PNRT2TR2_KD == null) { PNRT2TR2_KD = ""; }
		if(PNRT3_YN == null) { PNRT3_YN = ""; }
		if(PNRT3IC_KD == null) { PNRT3IC_KD = ""; }
		if(PNRT3SL_KD == null) { PNRT3SL_KD = ""; }
		if(PNRT3SZ1_VL == null) { PNRT3SZ1_VL = ""; }
		if(PNRT3SZ2_VL == null) { PNRT3SZ2_VL = ""; }
		if(PNRT3FT_KD == null) { PNRT3FT_KD = ""; }
		if(PNRT3TR1_KD == null) { PNRT3TR1_KD = ""; }
		if(PNRT3TR2_KD == null) { PNRT3TR2_KD = ""; }
		if(PNRT4_YN == null) { PNRT4_YN = ""; }
		if(PNRT4IC_KD == null) { PNRT4IC_KD = ""; }
		if(PNRT4SL_KD == null) { PNRT4SL_KD = ""; }
		if(PNRT4SZ1_VL == null) { PNRT4SZ1_VL = ""; }
		if(PNRT4SZ2_VL == null) { PNRT4SZ2_VL = ""; }
		if(PNRT4FT_KD == null) { PNRT4FT_KD = ""; }
		if(PNRT4TR1_KD == null) { PNRT4TR1_KD = ""; }
		if(PNRT4TR2_KD == null) { PNRT4TR2_KD = ""; }
		if(PNRT5_YN == null) { PNRT5_YN = ""; }
		if(PNRT5IC_KD == null) { PNRT5IC_KD = ""; }
		if(PNRT5SL_KD == null) { PNRT5SL_KD = ""; }
		if(PNRT5SZ1_VL == null) { PNRT5SZ1_VL = ""; }
		if(PNRT5SZ2_VL == null) { PNRT5SZ2_VL = ""; }
		if(PNRT5FT_KD == null) { PNRT5FT_KD = ""; }
		if(PNRT5TR1_KD == null) { PNRT5TR1_KD = ""; }
		if(PNRT5TR2_KD == null) { PNRT5TR2_KD = ""; }
		if(PNRT6_YN == null) { PNRT6_YN = ""; }
		if(PNRT6IC_KD == null) { PNRT6IC_KD = ""; }
		if(PNRT6SL_KD == null) { PNRT6SL_KD = ""; }
		if(PNRT6SZ1_VL == null) { PNRT6SZ1_VL = ""; }
		if(PNRT6SZ2_VL == null) { PNRT6SZ2_VL = ""; }
		if(PNRT6FT_KD == null) { PNRT6FT_KD = ""; }
		if(PNRT6TR1_KD == null) { PNRT6TR1_KD = ""; }
		if(PNRT6TR2_KD == null) { PNRT6TR2_KD = ""; }
		if(BRLE_YN == null) { BRLE_YN = ""; }
		if(BRLE_EX == null) { BRLE_EX = ""; }
		if(LUCN_KD == null) { LUCN_KD = ""; }
		if(LUCN_EX == null) { LUCN_EX = ""; }
		if(SCRT_CD == null) { SCRT_CD = ""; }
		if(SCRT_EX == null) { SCRT_EX = ""; }
		if(INPT_YN == null) { INPT_YN = ""; }
		if(RSLT_KD == null) { RSLT_KD = ""; }
		if(RSLT2_KD == null) { RSLT2_KD = ""; }
		if(ETC_KD == null) { ETC_KD = ""; }
		if(ETC_EX == null) { ETC_EX = ""; }
		if(RSLT_EX == null) { RSLT_EX = ""; }
		if(RSLT_ETC_EX == null) { RSLT_ETC_EX = ""; }
		if(CFRM_DT == null) { CFRM_DT = ""; }
		if(LICEN_CD == null) { LICEN_CD = ""; }
		if(DECI_LICEN_CD == null) { DECI_LICEN_CD = ""; }
		if(LUCN_YN == null) { LUCN_YN = ""; }
		if(AFRL_EX == null) { AFRL_EX = ""; }
		if(AFSM_EX == null) { AFSM_EX = ""; }
		if(AFDT_DT == null) { AFDT_DT = ""; }
		if(AFPL_CD == null) { AFPL_CD = ""; }
		if(AFTE_LICEN_CD == null) { AFTE_LICEN_CD = ""; }
		if(USER == null) { USER = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCancer_Rslt_2020_ufSaveLungRslt_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCancer_Rslt_2020_ufSaveLungRslt_002 \n";
			G_INFO += "설명 : 폐암 결과판정 저장(insert,update) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ICOUNT : " + ICOUNT + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " LUEX_DT : " + LUEX_DT + " \n";
			G_INFO += " LUEX_KD : " + LUEX_KD + " \n";
			G_INFO += " CTDI_VL : " + CTDI_VL + " \n";
			G_INFO += " BEFO_YN : " + BEFO_YN + " \n";
			G_INFO += " BEFO_YY : " + BEFO_YY + " \n";
			G_INFO += " BEFO_MM : " + BEFO_MM + " \n";
			G_INFO += " PNRT_YN : " + PNRT_YN + " \n";
			G_INFO += " PNRT1_YN : " + PNRT1_YN + " \n";
			G_INFO += " PNRT1IC_KD : " + PNRT1IC_KD + " \n";
			G_INFO += " PNRT1SL_KD : " + PNRT1SL_KD + " \n";
			G_INFO += " PNRT1SZ1_VL : " + PNRT1SZ1_VL + " \n";
			G_INFO += " PNRT1SZ2_VL : " + PNRT1SZ2_VL + " \n";
			G_INFO += " PNRT1FT_KD : " + PNRT1FT_KD + " \n";
			G_INFO += " PNRT1TR1_KD : " + PNRT1TR1_KD + " \n";
			G_INFO += " PNRT1TR2_KD : " + PNRT1TR2_KD + " \n";
			G_INFO += " PNRT2_YN : " + PNRT2_YN + " \n";
			G_INFO += " PNRT2IC_KD : " + PNRT2IC_KD + " \n";
			G_INFO += " PNRT2SL_KD : " + PNRT2SL_KD + " \n";
			G_INFO += " PNRT2SZ1_VL : " + PNRT2SZ1_VL + " \n";
			G_INFO += " PNRT2SZ2_VL : " + PNRT2SZ2_VL + " \n";
			G_INFO += " PNRT2FT_KD : " + PNRT2FT_KD + " \n";
			G_INFO += " PNRT2TR1_KD : " + PNRT2TR1_KD + " \n";
			G_INFO += " PNRT2TR2_KD : " + PNRT2TR2_KD + " \n";
			G_INFO += " PNRT3_YN : " + PNRT3_YN + " \n";
			G_INFO += " PNRT3IC_KD : " + PNRT3IC_KD + " \n";
			G_INFO += " PNRT3SL_KD : " + PNRT3SL_KD + " \n";
			G_INFO += " PNRT3SZ1_VL : " + PNRT3SZ1_VL + " \n";
			G_INFO += " PNRT3SZ2_VL : " + PNRT3SZ2_VL + " \n";
			G_INFO += " PNRT3FT_KD : " + PNRT3FT_KD + " \n";
			G_INFO += " PNRT3TR1_KD : " + PNRT3TR1_KD + " \n";
			G_INFO += " PNRT3TR2_KD : " + PNRT3TR2_KD + " \n";
			G_INFO += " PNRT4_YN : " + PNRT4_YN + " \n";
			G_INFO += " PNRT4IC_KD : " + PNRT4IC_KD + " \n";
			G_INFO += " PNRT4SL_KD : " + PNRT4SL_KD + " \n";
			G_INFO += " PNRT4SZ1_VL : " + PNRT4SZ1_VL + " \n";
			G_INFO += " PNRT4SZ2_VL : " + PNRT4SZ2_VL + " \n";
			G_INFO += " PNRT4FT_KD : " + PNRT4FT_KD + " \n";
			G_INFO += " PNRT4TR1_KD : " + PNRT4TR1_KD + " \n";
			G_INFO += " PNRT4TR2_KD : " + PNRT4TR2_KD + " \n";
			G_INFO += " PNRT5_YN : " + PNRT5_YN + " \n";
			G_INFO += " PNRT5IC_KD : " + PNRT5IC_KD + " \n";
			G_INFO += " PNRT5SL_KD : " + PNRT5SL_KD + " \n";
			G_INFO += " PNRT5SZ1_VL : " + PNRT5SZ1_VL + " \n";
			G_INFO += " PNRT5SZ2_VL : " + PNRT5SZ2_VL + " \n";
			G_INFO += " PNRT5FT_KD : " + PNRT5FT_KD + " \n";
			G_INFO += " PNRT5TR1_KD : " + PNRT5TR1_KD + " \n";
			G_INFO += " PNRT5TR2_KD : " + PNRT5TR2_KD + " \n";
			G_INFO += " PNRT6_YN : " + PNRT6_YN + " \n";
			G_INFO += " PNRT6IC_KD : " + PNRT6IC_KD + " \n";
			G_INFO += " PNRT6SL_KD : " + PNRT6SL_KD + " \n";
			G_INFO += " PNRT6SZ1_VL : " + PNRT6SZ1_VL + " \n";
			G_INFO += " PNRT6SZ2_VL : " + PNRT6SZ2_VL + " \n";
			G_INFO += " PNRT6FT_KD : " + PNRT6FT_KD + " \n";
			G_INFO += " PNRT6TR1_KD : " + PNRT6TR1_KD + " \n";
			G_INFO += " PNRT6TR2_KD : " + PNRT6TR2_KD + " \n";
			G_INFO += " BRLE_YN : " + BRLE_YN + " \n";
			G_INFO += " BRLE_EX : " + BRLE_EX + " \n";
			G_INFO += " LUCN_KD : " + LUCN_KD + " \n";
			G_INFO += " LUCN_EX : " + LUCN_EX + " \n";
			G_INFO += " SCRT_CD : " + SCRT_CD + " \n";
			G_INFO += " SCRT_EX : " + SCRT_EX + " \n";
			G_INFO += " INPT_YN : " + INPT_YN + " \n";
			G_INFO += " RSLT_KD : " + RSLT_KD + " \n";
			G_INFO += " RSLT2_KD : " + RSLT2_KD + " \n";
			G_INFO += " ETC_KD : " + ETC_KD + " \n";
			G_INFO += " ETC_EX : " + ETC_EX + " \n";
			G_INFO += " RSLT_EX : " + RSLT_EX + " \n";
			G_INFO += " RSLT_ETC_EX : " + RSLT_ETC_EX + " \n";
			G_INFO += " CFRM_DT : " + CFRM_DT + " \n";
			G_INFO += " LICEN_CD : " + LICEN_CD + " \n";
			G_INFO += " DECI_LICEN_CD : " + DECI_LICEN_CD + " \n";
			G_INFO += " LUCN_YN : " + LUCN_YN + " \n";
			G_INFO += " AFRL_EX : " + AFRL_EX + " \n";
			G_INFO += " AFSM_EX : " + AFSM_EX + " \n";
			G_INFO += " AFDT_DT : " + AFDT_DT + " \n";
			G_INFO += " AFPL_CD : " + AFPL_CD + " \n";
			G_INFO += " AFTE_LICEN_CD : " + AFTE_LICEN_CD + " \n";
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
