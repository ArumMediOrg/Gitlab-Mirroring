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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT DISTINCT REQUEST_DATE, SERIAL, SCANDATE 
FROM ARUM_TOTAL 
WHERE OMRYN = 'Y' 
AND VALUYN = 'N'  
ORDER BY REQUEST_DATE, SERIAL
		*/

		sql = " SELECT DISTINCT REQUEST_DATE, SERIAL, SCANDATE";
		sql += " FROM ARUM_TOTAL";
		sql += " WHERE OMRYN = 'Y'";
		sql += " AND VALUYN = 'N'";
		sql += " ORDER BY REQUEST_DATE, SERIAL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : omr_selectincomplete_001 \n";
			G_INFO += "설명 : OMR 미검증된 시리얼 번호 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='REQUEST_DATE' rs:number='1' rs:nullable='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='REQUEST_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SERIAL' rs:number='2' rs:nullable='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='SERIAL'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SCANDATE' rs:number='3' rs:basetable='ARUM_TOTAL' rs:basecolumn='SCANDATE'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String REQUEST_DATE_T = cRsList.getString("REQUEST_DATE");
			String SERIAL_T = cRsList.getString("SERIAL");
			String SCANDATE_T = cRsList.getString("SCANDATE");
%>
			<z:row
<%
			if(! REQUEST_DATE_T.equals("")) {
%>
		 		REQUEST_DATE='<%= REQUEST_DATE_T%>'
<%
			}

			if(! SERIAL_T.equals("")) {
%>
		 		SERIAL='<%= SERIAL_T%>'
<%
			}

			if(! SCANDATE_T.equals("")) {
%>
		 		SCANDATE='<%= SCANDATE_T%>'
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
