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

		String BILL_FL_1_20 = htMethod.get("BILL_FL_1_20");
		String CHUNG_KD = htMethod.get("CHUNG_KD");
		String BILL_NO_F = htMethod.get("BILL_NO_F");

		//
		if(BILL_FL_1_20 == null) { BILL_FL_1_20 = ""; }
		if(CHUNG_KD == null) { CHUNG_KD = ""; }
		if(BILL_NO_F == null) { BILL_NO_F = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT COUNT(*) CNT, SUM(SBP_BILL_PR) SUMPR , SBP_BILL_FL, SBP_CHUNG_KD FROM ST_BILLHN_PR
WHERE  SUBSTR(SBP_BILL_FL,1,20) = :BILL_FL_1_20  AND SBP_CHUNG_KD = :CHUNG_KD and SBP_BILL_NO >= :BILL_NO_F
group by SBP_BILL_FL, SBP_CHUNG_KD

		*/

		sql = " SELECT COUNT(*) CNT, SUM(SBP_BILL_PR) SUMPR , SBP_BILL_FL, SBP_CHUNG_KD";
		sql += " FROM ST_BILLHN_PR";
		sql += " WHERE SUBSTR(SBP_BILL_FL,1,20) = '" + BILL_FL_1_20 + "'";
		sql += " AND SBP_CHUNG_KD = '" + CHUNG_KD + "'";
		sql += " AND SBP_BILL_NO >= '" + BILL_NO_F + "'";
		sql += " GROUP BY SBP_BILL_FL, SBP_CHUNG_KD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : Uspchungfile2020_Uspchungfile_2020_002 \n";
			G_INFO += "설명 : 청구생성내역 집계 조회(생성후 확인) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " BILL_FL_1_20 : " + BILL_FL_1_20 + " \n";
			G_INFO += " CHUNG_KD : " + CHUNG_KD + " \n";
			G_INFO += " BILL_NO_F : " + BILL_NO_F + " \n";
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
		<s:AttributeType name='CNT' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SUMPR' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_BILL_FL' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_BILL_FL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_CHUNG_KD' rs:number='4' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR' rs:basecolumn='SBP_CHUNG_KD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CNT_T = cRsList.getString("CNT");
			String SUMPR_T = cRsList.getString("SUMPR");
			String SBP_BILL_FL_T = cRsList.getString("SBP_BILL_FL");
			String SBP_CHUNG_KD_T = cRsList.getString("SBP_CHUNG_KD");
%>
			<z:row
<%
			if(! CNT_T.equals("")) {
%>
		 		CNT='<%= CNT_T%>'
<%
			}

			if(! SUMPR_T.equals("")) {
%>
		 		SUMPR='<%= SUMPR_T%>'
<%
			}

			if(! SBP_BILL_FL_T.equals("")) {
%>
		 		SBP_BILL_FL='<%= SBP_BILL_FL_T%>'
<%
			}

			if(! SBP_CHUNG_KD_T.equals("")) {
%>
		 		SBP_CHUNG_KD='<%= SBP_CHUNG_KD_T%>'
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
