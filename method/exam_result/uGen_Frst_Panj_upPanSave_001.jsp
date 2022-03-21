<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uGen_Frst_Panj_upPanSave_001.jsp"%>
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

		String SMODE = htMethod.get("SMODE");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String HISJIN = htMethod.get("HISJIN");
		String HISMED = htMethod.get("HISMED");
		String LIVEGBN = htMethod.get("LIVEGBN");
		String LIVESMK = htMethod.get("LIVESMK");
		String LIVEDRK = htMethod.get("LIVEDRK");
		String LIVESPT = htMethod.get("LIVESPT");
		String LIVEWET = htMethod.get("LIVEWET");
		String SEDPLIST = htMethod.get("SEDPLIST");
		String RVIEW = htMethod.get("RVIEW");
		String BVIEW = htMethod.get("BVIEW");
		String EXINJUR = htMethod.get("EXINJUR");
		String DEPRESS = htMethod.get("DEPRESS");
		String CNDTION = htMethod.get("CNDTION");
		String OPIN1 = htMethod.get("OPIN1");
		String OPIN2 = htMethod.get("OPIN2");
		String OPIN3 = htMethod.get("OPIN3");
		String OPIN4 = htMethod.get("OPIN4");
		String CGNTION = htMethod.get("CGNTION");
		String RESULTB_1 = htMethod.get("RESULTB_1");
		String RESULTB_2 = htMethod.get("RESULTB_2");
		String RESULTB_3 = htMethod.get("RESULTB_3");
		String RESULTB_4 = htMethod.get("RESULTB_4");
		String RESULTB_5 = htMethod.get("RESULTB_5");
		String RESULTB_6 = htMethod.get("RESULTB_6");
		String RESULTB_7 = htMethod.get("RESULTB_7");
		String RESULTB_8 = htMethod.get("RESULTB_8");
		String RESULTB_9 = htMethod.get("RESULTB_9");
		String RESULTB_10 = htMethod.get("RESULTB_10");
		String RESULTB_11 = htMethod.get("RESULTB_11");
		String RESULTR1_1 = htMethod.get("RESULTR1_1");
		String RESULTR1_2 = htMethod.get("RESULTR1_2");
		String RESULTR1_3 = htMethod.get("RESULTR1_3");
		String RESULTR1_4 = htMethod.get("RESULTR1_4");
		String RESULTR1_5 = htMethod.get("RESULTR1_5");
		String RESULTR1_6 = htMethod.get("RESULTR1_6");
		String RESULTR1_7 = htMethod.get("RESULTR1_7");
		String RESULTR1_8 = htMethod.get("RESULTR1_8");
		String RESULTR1_9 = htMethod.get("RESULTR1_9");
		String RESULTR1_10 = htMethod.get("RESULTR1_10");
		String RESULTR2_1 = htMethod.get("RESULTR2_1");
		String RESULTR2_2 = htMethod.get("RESULTR2_2");
		String RESULTRD_1 = htMethod.get("RESULTRD_1");
		String RESULTRD_2 = htMethod.get("RESULTRD_2");
		String RESULTRD_3 = htMethod.get("RESULTRD_3");
		String RESULTRD_4 = htMethod.get("RESULTRD_4");
		String RESULTRD_5 = htMethod.get("RESULTRD_5");
		String RESULTRD_ETC = htMethod.get("RESULTRD_ETC");
		String TRANC_DATE = htMethod.get("TRANC_DATE");
		String RESULT_DATE = htMethod.get("RESULT_DATE");
		String RESULT8_ETC = htMethod.get("RESULT8_ETC");
		String DOCTORFIR = htMethod.get("DOCTORFIR");
		String DOCTORQQN = htMethod.get("DOCTORQQN");
		String PANRETA = htMethod.get("PANRETA");
		String PANRETB = htMethod.get("PANRETB");
		String PANRETR1 = htMethod.get("PANRETR1");
		String PANRETR2 = htMethod.get("PANRETR2");
		String PANRETRD = htMethod.get("PANRETRD");
		String FIX_YN = htMethod.get("FIX_YN");
		String USER_ID = htMethod.get("USER_ID");

		//
		if(SMODE == null) { SMODE = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(HISJIN == null) { HISJIN = ""; }
		if(HISMED == null) { HISMED = ""; }
		if(LIVEGBN == null) { LIVEGBN = ""; }
		if(LIVESMK == null) { LIVESMK = ""; }
		if(LIVEDRK == null) { LIVEDRK = ""; }
		if(LIVESPT == null) { LIVESPT = ""; }
		if(LIVEWET == null) { LIVEWET = ""; }
		if(SEDPLIST == null) { SEDPLIST = ""; }
		if(RVIEW == null) { RVIEW = ""; }
		if(BVIEW == null) { BVIEW = ""; }
		if(EXINJUR == null) { EXINJUR = ""; }
		if(DEPRESS == null) { DEPRESS = ""; }
		if(CNDTION == null) { CNDTION = ""; }
		if(OPIN1 == null) { OPIN1 = ""; }
		if(OPIN2 == null) { OPIN2 = ""; }
		if(OPIN3 == null) { OPIN3 = ""; }
		if(OPIN4 == null) { OPIN4 = ""; }
		if(CGNTION == null) { CGNTION = ""; }
		if(RESULTB_1 == null) { RESULTB_1 = ""; }
		if(RESULTB_2 == null) { RESULTB_2 = ""; }
		if(RESULTB_3 == null) { RESULTB_3 = ""; }
		if(RESULTB_4 == null) { RESULTB_4 = ""; }
		if(RESULTB_5 == null) { RESULTB_5 = ""; }
		if(RESULTB_6 == null) { RESULTB_6 = ""; }
		if(RESULTB_7 == null) { RESULTB_7 = ""; }
		if(RESULTB_8 == null) { RESULTB_8 = ""; }
		if(RESULTB_9 == null) { RESULTB_9 = ""; }
		if(RESULTB_10 == null) { RESULTB_10 = ""; }
		if(RESULTB_11 == null) { RESULTB_11 = ""; }
		if(RESULTR1_1 == null) { RESULTR1_1 = ""; }
		if(RESULTR1_2 == null) { RESULTR1_2 = ""; }
		if(RESULTR1_3 == null) { RESULTR1_3 = ""; }
		if(RESULTR1_4 == null) { RESULTR1_4 = ""; }
		if(RESULTR1_5 == null) { RESULTR1_5 = ""; }
		if(RESULTR1_6 == null) { RESULTR1_6 = ""; }
		if(RESULTR1_7 == null) { RESULTR1_7 = ""; }
		if(RESULTR1_8 == null) { RESULTR1_8 = ""; }
		if(RESULTR1_9 == null) { RESULTR1_9 = ""; }
		if(RESULTR1_10 == null) { RESULTR1_10 = ""; }
		if(RESULTR2_1 == null) { RESULTR2_1 = ""; }
		if(RESULTR2_2 == null) { RESULTR2_2 = ""; }
		if(RESULTRD_1 == null) { RESULTRD_1 = ""; }
		if(RESULTRD_2 == null) { RESULTRD_2 = ""; }
		if(RESULTRD_3 == null) { RESULTRD_3 = ""; }
		if(RESULTRD_4 == null) { RESULTRD_4 = ""; }
		if(RESULTRD_5 == null) { RESULTRD_5 = ""; }
		if(RESULTRD_ETC == null) { RESULTRD_ETC = ""; }
		if(TRANC_DATE == null) { TRANC_DATE = ""; }
		if(RESULT_DATE == null) { RESULT_DATE = ""; }
		if(RESULT8_ETC == null) { RESULT8_ETC = ""; }
		if(DOCTORFIR == null) { DOCTORFIR = ""; }
		if(DOCTORQQN == null) { DOCTORQQN = ""; }
		if(PANRETA == null) { PANRETA = ""; }
		if(PANRETB == null) { PANRETB = ""; }
		if(PANRETR1 == null) { PANRETR1 = ""; }
		if(PANRETR2 == null) { PANRETR2 = ""; }
		if(PANRETRD == null) { PANRETRD = ""; }
		if(FIX_YN == null) { FIX_YN = ""; }
		if(USER_ID == null) { USER_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uGen_Frst_Panj_upPanSave_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGen_Frst_Panj_upPanSave_001 \n";
			G_INFO += "설명 : 일검1차 자동판정 Insert,update \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " HISJIN : " + HISJIN + " \n";
			G_INFO += " HISMED : " + HISMED + " \n";
			G_INFO += " LIVEGBN : " + LIVEGBN + " \n";
			G_INFO += " LIVESMK : " + LIVESMK + " \n";
			G_INFO += " LIVEDRK : " + LIVEDRK + " \n";
			G_INFO += " LIVESPT : " + LIVESPT + " \n";
			G_INFO += " LIVEWET : " + LIVEWET + " \n";
			G_INFO += " SEDPLIST : " + SEDPLIST + " \n";
			G_INFO += " RVIEW : " + RVIEW + " \n";
			G_INFO += " BVIEW : " + BVIEW + " \n";
			G_INFO += " EXINJUR : " + EXINJUR + " \n";
			G_INFO += " DEPRESS : " + DEPRESS + " \n";
			G_INFO += " CNDTION : " + CNDTION + " \n";
			G_INFO += " OPIN1 : " + OPIN1 + " \n";
			G_INFO += " OPIN2 : " + OPIN2 + " \n";
			G_INFO += " OPIN3 : " + OPIN3 + " \n";
			G_INFO += " OPIN4 : " + OPIN4 + " \n";
			G_INFO += " CGNTION : " + CGNTION + " \n";
			G_INFO += " RESULTB_1 : " + RESULTB_1 + " \n";
			G_INFO += " RESULTB_2 : " + RESULTB_2 + " \n";
			G_INFO += " RESULTB_3 : " + RESULTB_3 + " \n";
			G_INFO += " RESULTB_4 : " + RESULTB_4 + " \n";
			G_INFO += " RESULTB_5 : " + RESULTB_5 + " \n";
			G_INFO += " RESULTB_6 : " + RESULTB_6 + " \n";
			G_INFO += " RESULTB_7 : " + RESULTB_7 + " \n";
			G_INFO += " RESULTB_8 : " + RESULTB_8 + " \n";
			G_INFO += " RESULTB_9 : " + RESULTB_9 + " \n";
			G_INFO += " RESULTB_10 : " + RESULTB_10 + " \n";
			G_INFO += " RESULTB_11 : " + RESULTB_11 + " \n";
			G_INFO += " RESULTR1_1 : " + RESULTR1_1 + " \n";
			G_INFO += " RESULTR1_2 : " + RESULTR1_2 + " \n";
			G_INFO += " RESULTR1_3 : " + RESULTR1_3 + " \n";
			G_INFO += " RESULTR1_4 : " + RESULTR1_4 + " \n";
			G_INFO += " RESULTR1_5 : " + RESULTR1_5 + " \n";
			G_INFO += " RESULTR1_6 : " + RESULTR1_6 + " \n";
			G_INFO += " RESULTR1_7 : " + RESULTR1_7 + " \n";
			G_INFO += " RESULTR1_8 : " + RESULTR1_8 + " \n";
			G_INFO += " RESULTR1_9 : " + RESULTR1_9 + " \n";
			G_INFO += " RESULTR1_10 : " + RESULTR1_10 + " \n";
			G_INFO += " RESULTR2_1 : " + RESULTR2_1 + " \n";
			G_INFO += " RESULTR2_2 : " + RESULTR2_2 + " \n";
			G_INFO += " RESULTRD_1 : " + RESULTRD_1 + " \n";
			G_INFO += " RESULTRD_2 : " + RESULTRD_2 + " \n";
			G_INFO += " RESULTRD_3 : " + RESULTRD_3 + " \n";
			G_INFO += " RESULTRD_4 : " + RESULTRD_4 + " \n";
			G_INFO += " RESULTRD_5 : " + RESULTRD_5 + " \n";
			G_INFO += " RESULTRD_ETC : " + RESULTRD_ETC + " \n";
			G_INFO += " TRANC_DATE : " + TRANC_DATE + " \n";
			G_INFO += " RESULT_DATE : " + RESULT_DATE + " \n";
			G_INFO += " RESULT8_ETC : " + RESULT8_ETC + " \n";
			G_INFO += " DOCTORFIR : " + DOCTORFIR + " \n";
			G_INFO += " DOCTORQQN : " + DOCTORQQN + " \n";
			G_INFO += " PANRETA : " + PANRETA + " \n";
			G_INFO += " PANRETB : " + PANRETB + " \n";
			G_INFO += " PANRETR1 : " + PANRETR1 + " \n";
			G_INFO += " PANRETR2 : " + PANRETR2 + " \n";
			G_INFO += " PANRETRD : " + PANRETRD + " \n";
			G_INFO += " FIX_YN : " + FIX_YN + " \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
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
