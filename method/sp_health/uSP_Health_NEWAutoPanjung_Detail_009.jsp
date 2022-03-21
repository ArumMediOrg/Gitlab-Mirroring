<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
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

		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		/*

INSERT INTO ST_PANJUNG
(SPG_EXAM_DT  ,SPG_EXAM_SQ  ,SPG_EXAM_CHA ,SPG_MATT_CD  ,SPG_MATT_SQ,
 SPG_ORGA_CD  ,SPG_SWING_CD ,SPG_SLNS_KD  ,SPG_SOKY_CD  ,SPG_SOKY_NM,
 SPG_PANJ_CD  ,SPG_JOCHI_CD ,SPG_JOCHI_NM ,SPG_JILH_CD  ,SPG_POSM1_CD,
 SPG_POSM2_CD ,SPG_POSM3_CD ,SPG_POSM1_TX ,SPG_POSM2_TX ,SPG_POSM3_TX,
 SPG_POSM1_DT ,SPG_POSM2_DT ,SPG_POSM3_DT ,SPG_BUSI_CD  ,SPG_REMARK,
 SPG_ETC_TX   ,SPG_ORSU_CD  ,SPG_CYCLE_CD ,SPG_CYCLE_TX ,SPG_CYCLE_DT,
 SPG_PANJ_DT  ,SPG_DOCT_CD  ,SPG_INPT_ID  ,SPG_INPT_DTT ,SPG_SOKY_TX,
 SPG_ORGA_ETC)
VALUES
||:sSQL_ADD
		*/

		sql = "INSERT INTO ST_PANJUNG (SPG_EXAM_DT ,SPG_EXAM_SQ ,SPG_EXAM_CHA ,SPG_MATT_CD ,SPG_MATT_SQ, SPG_ORGA_CD ,SPG_SWING_CD ,SPG_SLNS_KD ,SPG_SOKY_CD ,SPG_SOKY_NM, SPG_PANJ_CD ,SPG_JOCHI_CD ,SPG_JOCHI_NM ,SPG_JILH_CD ,SPG_POSM1_CD, SPG_POSM2_CD ,SPG_POSM3_CD ,SPG_POSM1_TX ,SPG_POSM2_TX ,SPG_POSM3_TX, SPG_POSM1_DT ,SPG_POSM2_DT ,SPG_POSM3_DT ,SPG_BUSI_CD ,SPG_REMARK, SPG_ETC_TX ,SPG_ORSU_CD ,SPG_CYCLE_CD ,SPG_CYCLE_TX ,SPG_CYCLE_DT, SPG_PANJ_DT ,SPG_DOCT_CD ,SPG_INPT_ID ,SPG_INPT_DTT ,SPG_SOKY_TX, SPG_ORGA_ETC) VALUES ";
		sql += SSQL_ADD;

		stmtExec.executeUpdate(sql);
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_NEWAutoPanjung_Detail_009 \n";
			G_INFO += "설명 : 특검자동판정-특검판정 저장(insert) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
	} catch (Exception e) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= e.toString()%>]]></errorMsg>
	<sql><![CDATA[<%= sql%>]]></sql>
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
