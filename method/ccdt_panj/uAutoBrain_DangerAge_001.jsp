<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtList = null;

	ResultSet rsList = null;

	CRs cRsList = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String DANR_VL = htMethod.get("DANR_VL");
		String SEX_KD = htMethod.get("SEX_KD");

		//
		if(DANR_VL == null) { DANR_VL = ""; }
		if(SEX_KD == null) { SEX_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM (SELECT  CDR_DANR_AGE, ABS(CDR_DANR_VL-:DANR_VL) as DANGER,CDR_DANR_VL  
  FROM CT_DANGER                                                               
 WHERE CDR_DANR_KD = '2'                                                     
   AND CDR_SEX_KD = :SEX_KD
 Order by DANGER, CDR_DANR_AGE DESC) WHERE ROWNUM = 1 
		*/

		sql = " SELECT *";
		sql += " FROM (";
		sql += "	SELECT CDR_DANR_AGE, ABS(CDR_DANR_VL-'" + DANR_VL + "') AS DANGER,CDR_DANR_VL";
		sql += "	FROM CT_DANGER";
		sql += " 	WHERE CDR_DANR_KD = '2'";
		sql += " 	AND CDR_SEX_KD = '" + SEX_KD + "'";
		sql += " 	ORDER BY DANGER, CDR_DANR_AGE DESC";
		sql += ")";
		sql += " WHERE ROWNUM = 1";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAutoBrain_DangerAge_001 \n";
			G_INFO += "설명 : 교정 뇌심혈관 정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DANR_VL : " + DANR_VL + " \n";
			G_INFO += " SEX_KD : " + SEX_KD + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>200</resultCode>
	<resultXml>
		<xml xmlns:s='uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882'
			xmlns:dt='uuid:C2F41010-65B3-11d1-A29F-00AA00C14882'
			xmlns:rs='urn:schemas-microsoft-com:rowset'
			xmlns:z='#RowsetSchema'>
<s:Schema id='RowsetSchema'>
	<s:ElementType name='row' content='eltOnly' rs:updatable='true'>
		<s:AttributeType name='CDR_DANR_AGE' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='DANGER' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CDR_DANR_VL' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CDR_DANR_AGE_T = cRsList.getString("CDR_DANR_AGE");
			String DANGER_T = cRsList.getString("DANGER");
			String CDR_DANR_VL_T = cRsList.getString("CDR_DANR_VL");
%>
			<z:row
<%
			if(! CDR_DANR_AGE_T.equals("")) {
%>
		 		CDR_DANR_AGE='<%= CDR_DANR_AGE_T%>'
<%
			}

			if(! DANGER_T.equals("")) {
%>
		 		DANGER='<%= DANGER_T%>'
<%
			}

			if(! CDR_DANR_VL_T.equals("")) {
%>
		 		CDR_DANR_VL='<%= CDR_DANR_VL_T%>'
<%
			}
%>
			/>
<%
		}
%>
		</rs:data>
		</xml>
	</resultXml>
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

		if(rsList != null) {
			rsList.close();
			rsList = null;
		}

		if(stmtList != null) {
			stmtList.close();
			stmtList = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
