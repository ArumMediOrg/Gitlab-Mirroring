<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%@ include file="/func/func_uSMS_Set_btnS44_SaveClick_003.jsp"%>
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

		String CMBXS44_STANDHH = htMethod.get("CMBXS44_STANDHH");
		String CMBXS44_STANDMM = htMethod.get("CMBXS44_STANDMM");
		String CMBXS44_BEFORDT = htMethod.get("CMBXS44_BEFORDT");
		String CMBXS44_BEFORHH = htMethod.get("CMBXS44_BEFORHH");
		String TMPL_CD = htMethod.get("TMPL_CD");
		String MMS44_MSG = htMethod.get("MMS44_MSG");
		String COMBOBOX1 = htMethod.get("COMBOBOX1");
		String GUSER = htMethod.get("GUSER");
		String GUID_KD = htMethod.get("GUID_KD");
		String PLCE_CD = htMethod.get("PLCE_CD");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String PRIOR_SQ = htMethod.get("PRIOR_SQ");
		String GUID_NM = htMethod.get("GUID_NM");

		//
		
		if(CMBXS44_STANDHH == null) { CMBXS44_STANDHH = ""; }
		if(CMBXS44_STANDMM == null) { CMBXS44_STANDMM = ""; }
		if(CMBXS44_BEFORDT == null) { CMBXS44_BEFORDT = ""; }
		if(CMBXS44_BEFORHH == null) { CMBXS44_BEFORHH = ""; }
		if(TMPL_CD == null) { TMPL_CD = ""; }
		if(MMS44_MSG == null) { MMS44_MSG = ""; }
		if(COMBOBOX1 == null) { COMBOBOX1 = ""; }
		if(GUSER == null) { GUSER = ""; }
		if(GUID_KD == null) { GUID_KD = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(PRIOR_SQ == null) { PRIOR_SQ = ""; }
		if(GUID_NM == null) { GUID_NM = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = func_uSMS_Set_btnS44_SaveClick_003(stmtExec, htMethod);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSMS_Set_btnS44_SaveClick_003 \n";
			G_INFO += "설명 : 신규 SMS 문구 등록 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
	
			G_INFO += " CMBXS44_STANDHH : " + CMBXS44_STANDHH + " \n";
			G_INFO += " CMBXS44_STANDMM : " + CMBXS44_STANDMM + " \n";
			G_INFO += " CMBXS44_BEFORDT : " + CMBXS44_BEFORDT + " \n";
			G_INFO += " CMBXS44_BEFORHH : " + CMBXS44_BEFORHH + " \n";
			G_INFO += " TMPL_CD : " + TMPL_CD + " \n";
			G_INFO += " MMS44_MSG : " + MMS44_MSG + " \n";
			G_INFO += " COMBOBOX1 : " + COMBOBOX1 + " \n";
			G_INFO += " GUSER : " + GUSER + " \n";
			G_INFO += " GUID_KD : " + GUID_KD + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " PRIOR_SQ : " + PRIOR_SQ + " \n";
			G_INFO += " GUID_NM : " + GUID_NM + " \n";
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
