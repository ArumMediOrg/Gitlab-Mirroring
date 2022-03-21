<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCT_COMM_PANJ_APPLY_UP_Save_001.jsp"%>
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

		String CHKBOXCCP_USE_YN = htMethod.get("CHKBOXCCP_USE_YN");
		String GUBN_CD = htMethod.get("GUBN_CD");
		String MACH_CD = htMethod.get("MACH_CD");
		String MACH_SQ = htMethod.get("MACH_SQ");
		String MACH_NM = htMethod.get("MACH_NM");
		String CMPR_KD = htMethod.get("CMPR_KD");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String MAN_LOW = htMethod.get("MAN_LOW");
		String MAN_HIGH = htMethod.get("MAN_HIGH");
		String WOMAN_LOW = htMethod.get("WOMAN_LOW");
		String WOMAN_HIGH = htMethod.get("WOMAN_HIGH");
		String CHAR_VAL1 = htMethod.get("CHAR_VAL1");
		String CHAR_VAL2 = htMethod.get("CHAR_VAL2");
		String CHAR_VAL3 = htMethod.get("CHAR_VAL3");
		String CHAR_VAL4 = htMethod.get("CHAR_VAL4");
		String CHAR_VAL5 = htMethod.get("CHAR_VAL5");
		String CHAR_VAL6 = htMethod.get("CHAR_VAL6");
		String CHAR_VAL7 = htMethod.get("CHAR_VAL7");
		String SOKUN_TX = htMethod.get("SOKUN_TX");
		String RMK_TX = htMethod.get("RMK_TX");
		String NORM_YN = htMethod.get("NORM_YN");
		String INPT_ID = htMethod.get("INPT_ID");
		String NUSE_ID = htMethod.get("NUSE_ID");

		//
		if(CHKBOXCCP_USE_YN == null) { CHKBOXCCP_USE_YN = ""; }
		if(GUBN_CD == null) { GUBN_CD = ""; }
		if(MACH_CD == null) { MACH_CD = ""; }
		if(MACH_SQ == null) { MACH_SQ = ""; }
		if(MACH_NM == null) { MACH_NM = ""; }
		if(CMPR_KD == null) { CMPR_KD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(MAN_LOW == null) { MAN_LOW = ""; }
		if(MAN_HIGH == null) { MAN_HIGH = ""; }
		if(WOMAN_LOW == null) { WOMAN_LOW = ""; }
		if(WOMAN_HIGH == null) { WOMAN_HIGH = ""; }
		if(CHAR_VAL1 == null) { CHAR_VAL1 = ""; }
		if(CHAR_VAL2 == null) { CHAR_VAL2 = ""; }
		if(CHAR_VAL3 == null) { CHAR_VAL3 = ""; }
		if(CHAR_VAL4 == null) { CHAR_VAL4 = ""; }
		if(CHAR_VAL5 == null) { CHAR_VAL5 = ""; }
		if(CHAR_VAL6 == null) { CHAR_VAL6 = ""; }
		if(CHAR_VAL7 == null) { CHAR_VAL7 = ""; }
		if(SOKUN_TX == null) { SOKUN_TX = ""; }
		if(RMK_TX == null) { RMK_TX = ""; }
		if(NORM_YN == null) { NORM_YN = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(NUSE_ID == null) { NUSE_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCT_COMM_PANJ_APPLY_UP_Save_001(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCT_COMM_PANJ_APPLY_UP_Save_001 \n";
			G_INFO += "설명 : 특화검진 판정정보 추가 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHKBOXCCP_USE_YN : " + CHKBOXCCP_USE_YN + " \n";
			G_INFO += " GUBN_CD : " + GUBN_CD + " \n";
			G_INFO += " MACH_CD : " + MACH_CD + " \n";
			G_INFO += " MACH_SQ : " + MACH_SQ + " \n";
			G_INFO += " MACH_NM : " + MACH_NM + " \n";
			G_INFO += " CMPR_KD : " + CMPR_KD + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " MAN_LOW : " + MAN_LOW + " \n";
			G_INFO += " MAN_HIGH : " + MAN_HIGH + " \n";
			G_INFO += " WOMAN_LOW : " + WOMAN_LOW + " \n";
			G_INFO += " WOMAN_HIGH : " + WOMAN_HIGH + " \n";
			G_INFO += " CHAR_VAL1 : " + CHAR_VAL1 + " \n";
			G_INFO += " CHAR_VAL2 : " + CHAR_VAL2 + " \n";
			G_INFO += " CHAR_VAL3 : " + CHAR_VAL3 + " \n";
			G_INFO += " CHAR_VAL4 : " + CHAR_VAL4 + " \n";
			G_INFO += " CHAR_VAL5 : " + CHAR_VAL5 + " \n";
			G_INFO += " CHAR_VAL6 : " + CHAR_VAL6 + " \n";
			G_INFO += " CHAR_VAL7 : " + CHAR_VAL7 + " \n";
			G_INFO += " SOKUN_TX : " + SOKUN_TX + " \n";
			G_INFO += " RMK_TX : " + RMK_TX + " \n";
			G_INFO += " NORM_YN : " + NORM_YN + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " NUSE_ID : " + NUSE_ID + " \n";
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
