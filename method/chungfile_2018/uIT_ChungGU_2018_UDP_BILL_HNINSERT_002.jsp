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

	ResultSetMetaData rsmd = null;
	int colCnt = 0;

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String A_CHGBN = htMethod.get("A_CHGBN");
		String BILL_FL = htMethod.get("BILL_FL");

		//
		if(A_CHGBN == null) { A_CHGBN = ""; }
		if(BILL_FL == null) { BILL_FL = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select BBP_CHUNG_YY,BBP_CHUNG_DT,BBP_CHUNG_NO,BBP_BILL_HC,BBP_BILL_FL, count(*) cnt,

IF :A_chgbn = '11' Then
  sum(BBP_BILLFIR_PR) AMT
IF :A_chgbn = '12' Then
  sum(BBP_BILLFIR_PR) AMT
IF :A_chgbn = '61' Then
  sum(BBP_BILLFIR_PR) AMT
IF :A_chgbn = '62' Then
  sum(BBP_BILLFIR_PR) AMT
IF :A_chgbn = '21' Then
  sum(BBP_BILLSED_PR) AMT
IF :A_chgbn = '22' Then
  sum(BBP_BILLSED_PR) AMT
IF :A_chgbn = '23' Then
  0 AMT
IF :A_chgbn = '31' Then
  sum(BBP_BILLCAN_PR) AMT
IF :A_chgbn = '33' Then
  sum(BBP_BILLCAN_PR) AMT
IF :A_chgbn = '32' Then
  sum(BBP_BILLCANFN_PR) AMT
IF :A_chgbn = '34' Then
  sum(BBP_BILLCANFN_PR) AMT
IF :A_chgbn = '41' Then
  sum(BBP_BILLORAL_PR)  AMT
IF :A_chgbn = '42' Then
  sum(BBP_BILLORAL_PR)  AMT
IF :A_chgbn = '51' Then
  sum(BBP_BILLOS_PR)   AMT
IF :A_chgbn = '52' Then
  sum(BBP_BILLOSC_PR)  AMT
IF :A_chgbn = '53' Then
  sum(BBP_BILLOSD_PR)  AMT

 from BT_BILLHN_PR
where BBP_CHUNG_KD = :A_chgbn
  And BBP_BILL_FL  = :BILL_FL
group by BBP_CHUNG_YY,BBP_CHUNG_DT,BBP_CHUNG_NO,BBP_BILL_HC,BBP_BILL_FL
		*/

		sql = " SELECT BBP_CHUNG_YY,BBP_CHUNG_DT,BBP_CHUNG_NO,BBP_BILL_HC,BBP_BILL_FL, COUNT(*) CNT, ";

		if(A_CHGBN.equals("11")) {
			sql += " SUM(BBP_BILLFIR_PR) AMT";
		}
		if(A_CHGBN.equals("12")) {
			sql += " SUM(BBP_BILLFIR_PR) AMT";
		}
		if(A_CHGBN.equals("61")) {
			sql += " SUM(BBP_BILLFIR_PR) AMT";
		}
		if(A_CHGBN.equals("62")) {
			sql += " SUM(BBP_BILLFIR_PR) AMT";
		}
		if(A_CHGBN.equals("21")) {
			sql += " SUM(BBP_BILLSED_PR) AMT";
		}
		if(A_CHGBN.equals("22")) {
			sql += " SUM(BBP_BILLSED_PR) AMT";
		}
		if(A_CHGBN.equals("23")) {
			sql += " 0 AMT";
		}
		if(A_CHGBN.equals("31")) {
			sql += " SUM(BBP_BILLCAN_PR) AMT";
		}
		if(A_CHGBN.equals("33")) {
			sql += " SUM(BBP_BILLCAN_PR) AMT";
		}
		if(A_CHGBN.equals("32")) {
			sql += " SUM(BBP_BILLCANFN_PR) AMT";
		}
		if(A_CHGBN.equals("34")) {
			sql += " SUM(BBP_BILLCANFN_PR) AMT";
		}
		if(A_CHGBN.equals("41")) {
			sql += " SUM(BBP_BILLORAL_PR) AMT";
		}
		if(A_CHGBN.equals("42")) {
			sql += " SUM(BBP_BILLORAL_PR) AMT";
		}
		if(A_CHGBN.equals("51")) {
			sql += " SUM(BBP_BILLOS_PR) AMT";
		}
		if(A_CHGBN.equals("52")) {
			sql += " SUM(BBP_BILLOSC_PR) AMT";
		}
		if(A_CHGBN.equals("53")) {
			sql += ", SUM(BBP_BILLOSD_PR) AMT";
		}

		sql += " FROM BT_BILLHN_PR";
		sql += " WHERE BBP_CHUNG_KD = '" + A_CHGBN + "'";
		sql += " AND BBP_BILL_FL = '" + BILL_FL + "'";
		sql += " GROUP BY BBP_CHUNG_YY,BBP_CHUNG_DT,BBP_CHUNG_NO,BBP_BILL_HC,BBP_BILL_FL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ChungGU_2018_UDP_BILL_HNINSERT_002 \n";
			G_INFO += "설명 : 건보청구집계  정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " A_CHGBN : " + A_CHGBN + " \n";
			G_INFO += " BILL_FL : " + BILL_FL + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		rsmd = rsList.getMetaData();  //Select 결과의 Metadata 가져오기.

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
<%
		for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
			String dataType = "string";
			String maxLength = "4000";

			if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
				dataType = "bin.hex";
				maxLength = "2147483647";
				//<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
			} else if (rsmd.getColumnTypeName(colCnt).equals("CLOB")){
				maxLength = "1073741823";
				//<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
			}
%>
		<s:AttributeType name='<%= rsmd.getColumnName(colCnt)%>' rs:number='<%= Integer.toString(colCnt)%>' rs:writeunknown='true' rs:basetable='DUAL' rs:basecolumn='<%= rsmd.getColumnName(colCnt)%>'>
			<s:datatype dt:type='<%= dataType%>' dt:maxLength='<%= maxLength%>' <% if (! maxLength.equals("4000")) { %> rs:long='true' <% } %>/>
		</s:AttributeType>
<%
		}
%>
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
				String tempData = cRsList.getString(rsmd.getColumnName(colCnt));
				if(! tempData.equals("")) {
%>
		 			<%= rsmd.getColumnName(colCnt)%>='<%= tempData%>'
<%
				}
			}
%>
				ROWID='<%= cnt%>'
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
