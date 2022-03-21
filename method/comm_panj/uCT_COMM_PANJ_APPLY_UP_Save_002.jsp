<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uCT_COMM_PANJ_APPLY_UP_Save_002.jsp"%>
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
		String CCP_MACH_NM = htMethod.get("CCP_MACH_NM");
		String CCP_CMPR_KD = htMethod.get("CCP_CMPR_KD");
		String CCP_ITEM_CD = htMethod.get("CCP_ITEM_CD");
		String CCP_MAN_LOW = htMethod.get("CCP_MAN_LOW");
		String CCP_MAN_HIGH = htMethod.get("CCP_MAN_HIGH");
		String CCP_WOMAN_LOW = htMethod.get("CCP_WOMAN_LOW");
		String CCP_WOMAN_HIGH = htMethod.get("CCP_WOMAN_HIGH");
		String CCP_CHAR_VAL1 = htMethod.get("CCP_CHAR_VAL1");
		String CCP_CHAR_VAL2 = htMethod.get("CCP_CHAR_VAL2");
		String CCP_CHAR_VAL3 = htMethod.get("CCP_CHAR_VAL3");
		String CCP_CHAR_VAL4 = htMethod.get("CCP_CHAR_VAL4");
		String CCP_CHAR_VAL5 = htMethod.get("CCP_CHAR_VAL5");
		String CCP_CHAR_VAL6 = htMethod.get("CCP_CHAR_VAL6");
		String CCP_CHAR_VAL7 = htMethod.get("CCP_CHAR_VAL7");
		String CCP_SOKUN_TX = htMethod.get("CCP_SOKUN_TX");
		String CCP_RMK_TX = htMethod.get("CCP_RMK_TX");
		String CCP_NORM_YN = htMethod.get("CCP_NORM_YN");
		String CCP_MODI_ID = htMethod.get("CCP_MODI_ID");
		String CCP_GUBN_CD = htMethod.get("CCP_GUBN_CD");
		String CCP_MACH_CD = htMethod.get("CCP_MACH_CD");
		String CCP_MACH_SQ = htMethod.get("CCP_MACH_SQ");
		String CCP_NUSE_ID = htMethod.get("CCP_NUSE_ID");

		//
		if(CHKBOXCCP_USE_YN == null) { CHKBOXCCP_USE_YN = ""; }
		if(CCP_MACH_NM == null) { CCP_MACH_NM = ""; }
		if(CCP_CMPR_KD == null) { CCP_CMPR_KD = ""; }
		if(CCP_ITEM_CD == null) { CCP_ITEM_CD = ""; }
		if(CCP_MAN_LOW == null) { CCP_MAN_LOW = ""; }
		if(CCP_MAN_HIGH == null) { CCP_MAN_HIGH = ""; }
		if(CCP_WOMAN_LOW == null) { CCP_WOMAN_LOW = ""; }
		if(CCP_WOMAN_HIGH == null) { CCP_WOMAN_HIGH = ""; }
		if(CCP_CHAR_VAL1 == null) { CCP_CHAR_VAL1 = ""; }
		if(CCP_CHAR_VAL2 == null) { CCP_CHAR_VAL2 = ""; }
		if(CCP_CHAR_VAL3 == null) { CCP_CHAR_VAL3 = ""; }
		if(CCP_CHAR_VAL4 == null) { CCP_CHAR_VAL4 = ""; }
		if(CCP_CHAR_VAL5 == null) { CCP_CHAR_VAL5 = ""; }
		if(CCP_CHAR_VAL6 == null) { CCP_CHAR_VAL6 = ""; }
		if(CCP_CHAR_VAL7 == null) { CCP_CHAR_VAL7 = ""; }
		if(CCP_SOKUN_TX == null) { CCP_SOKUN_TX = ""; }
		if(CCP_RMK_TX == null) { CCP_RMK_TX = ""; }
		if(CCP_NORM_YN == null) { CCP_NORM_YN = ""; }
		if(CCP_MODI_ID == null) { CCP_MODI_ID = ""; }
		if(CCP_GUBN_CD == null) { CCP_GUBN_CD = ""; }
		if(CCP_MACH_CD == null) { CCP_MACH_CD = ""; }
		if(CCP_MACH_SQ == null) { CCP_MACH_SQ = ""; }
		if(CCP_NUSE_ID == null) { CCP_NUSE_ID = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uCT_COMM_PANJ_APPLY_UP_Save_002(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCT_COMM_PANJ_APPLY_UP_Save_002 \n";
			G_INFO += "설명 : 특화검진 판정정보 수정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHKBOXCCP_USE_YN : " + CHKBOXCCP_USE_YN + " \n";
			G_INFO += " CCP_MACH_NM : " + CCP_MACH_NM + " \n";
			G_INFO += " CCP_CMPR_KD : " + CCP_CMPR_KD + " \n";
			G_INFO += " CCP_ITEM_CD : " + CCP_ITEM_CD + " \n";
			G_INFO += " CCP_MAN_LOW : " + CCP_MAN_LOW + " \n";
			G_INFO += " CCP_MAN_HIGH : " + CCP_MAN_HIGH + " \n";
			G_INFO += " CCP_WOMAN_LOW : " + CCP_WOMAN_LOW + " \n";
			G_INFO += " CCP_WOMAN_HIGH : " + CCP_WOMAN_HIGH + " \n";
			G_INFO += " CCP_CHAR_VAL1 : " + CCP_CHAR_VAL1 + " \n";
			G_INFO += " CCP_CHAR_VAL2 : " + CCP_CHAR_VAL2 + " \n";
			G_INFO += " CCP_CHAR_VAL3 : " + CCP_CHAR_VAL3 + " \n";
			G_INFO += " CCP_CHAR_VAL4 : " + CCP_CHAR_VAL4 + " \n";
			G_INFO += " CCP_CHAR_VAL5 : " + CCP_CHAR_VAL5 + " \n";
			G_INFO += " CCP_CHAR_VAL6 : " + CCP_CHAR_VAL6 + " \n";
			G_INFO += " CCP_CHAR_VAL7 : " + CCP_CHAR_VAL7 + " \n";
			G_INFO += " CCP_SOKUN_TX : " + CCP_SOKUN_TX + " \n";
			G_INFO += " CCP_RMK_TX : " + CCP_RMK_TX + " \n";
			G_INFO += " CCP_NORM_YN : " + CCP_NORM_YN + " \n";
			G_INFO += " CCP_MODI_ID : " + CCP_MODI_ID + " \n";
			G_INFO += " CCP_GUBN_CD : " + CCP_GUBN_CD + " \n";
			G_INFO += " CCP_MACH_CD : " + CCP_MACH_CD + " \n";
			G_INFO += " CCP_MACH_SQ : " + CCP_MACH_SQ + " \n";
			G_INFO += " CCP_NUSE_ID : " + CCP_NUSE_ID + " \n";
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
