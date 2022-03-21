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

		String FIRST_DATE = htMethod.get("FIRST_DATE");
		String SECOND_DATE = htMethod.get("SECOND_DATE");
		String NAME_TEXT = htMethod.get("NAME_TEXT");

		//
		if(FIRST_DATE == null) { FIRST_DATE = ""; }
		if(SECOND_DATE == null) { SECOND_DATE = ""; }
		if(NAME_TEXT == null) { NAME_TEXT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT DISTINCT SCANDATE, CHART_NO AS EXAM_NO, SERIAL, REQUEST_DATE, EXAM_NAME
 FROM ARUM_TOTAL
 WHERE REQUEST_DATE BETWEEN :First_date  AND :Second_date
   AND SENDYN = 'Y'
   AND exam_name = :name_text
 ORDER BY REQUEST_DATE, SERIAL
		*/

		sql = " SELECT DISTINCT SCANDATE, CHART_NO AS EXAM_NO, SERIAL, REQUEST_DATE, EXAM_NAME";
		sql += " FROM ARUM_TOTAL";
		sql += " WHERE REQUEST_DATE BETWEEN '" + FIRST_DATE + "'";
		sql += " AND '" + SECOND_DATE + "'";
		sql += " AND SENDYN = 'Y'";
		sql += " AND EXAM_NAME = '" + NAME_TEXT + "'";
		sql += " ORDER BY REQUEST_DATE, SERIAL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : omr_selectsearch_004 \n";
			G_INFO += "설명 : OMR 검색버튼 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " FIRST_DATE : " + FIRST_DATE + " \n";
			G_INFO += " SECOND_DATE : " + SECOND_DATE + " \n";
			G_INFO += " NAME_TEXT : " + NAME_TEXT + " \n";
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
		<s:AttributeType name='SCANDATE' rs:number='1' rs:basetable='ARUM_TOTAL' rs:basecolumn='SCANDATE'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NO' rs:number='2' rs:nullable='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SERIAL' rs:number='3' rs:nullable='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='SERIAL'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='REQUEST_DATE' rs:number='4' rs:nullable='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='REQUEST_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NAME' rs:number='5' rs:nullable='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='EXAM_NAME'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String SCANDATE_T = cRsList.getString("SCANDATE");
			String EXAM_NO_T = cRsList.getString("EXAM_NO");
			String SERIAL_T = cRsList.getString("SERIAL");
			String REQUEST_DATE_T = cRsList.getString("REQUEST_DATE");
			String EXAM_NAME_T = cRsList.getString("EXAM_NAME");
%>
			<z:row
<%
			if(! SCANDATE_T.equals("")) {
%>
		 		SCANDATE='<%= SCANDATE_T%>'
<%
			}

			if(! EXAM_NO_T.equals("")) {
%>
		 		EXAM_NO='<%= EXAM_NO_T%>'
<%
			}

			if(! SERIAL_T.equals("")) {
%>
		 		SERIAL='<%= SERIAL_T%>'
<%
			}

			if(! REQUEST_DATE_T.equals("")) {
%>
		 		REQUEST_DATE='<%= REQUEST_DATE_T%>'
<%
			}

			if(! EXAM_NAME_T.equals("")) {
%>
		 		EXAM_NAME='<%= EXAM_NAME_T%>'
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
