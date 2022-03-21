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

		String USERID = htMethod.get("USERID");

		//
		if(USERID == null) { USERID = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT SCANDATE, CHART_NO AS EXAM_NO, FORMNAME AS DOCUMENT, FILENAME, SERIAL, EXAM_NAME, REQUEST_DATE
 FROM ARUM_TOTAL 
 WHERE SENDYN = 'N'  
   AND VALUYN = 'N'  
   AND LOGINID = :userid  
 ORDER BY FILENAME, SCANDATE, SERIAL, FORMNAME
		*/

		sql = " SELECT SCANDATE, CHART_NO AS EXAM_NO, FORMNAME AS DOCUMENT, FILENAME, SERIAL, EXAM_NAME, REQUEST_DATE";
		sql += " FROM ARUM_TOTAL";
		sql += " WHERE SENDYN = 'N'";
		sql += " AND VALUYN = 'N'";
		sql += " AND LOGINID = '" + USERID + "'";
		sql += " ORDER BY FILENAME, SCANDATE, SERIAL, FORMNAME";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : omr_selecrefresh_001 \n";
			G_INFO += "설명 : OMR 새로고침 버튼 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " USERID : " + USERID + " \n";
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
		<s:AttributeType name='SCANDATE' rs:number='1' rs:writeunknown='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='SCANDATE'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NO' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='DOCUMENT' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='FORMNAME'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='FILENAME' rs:number='4' rs:writeunknown='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='FILENAME'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SERIAL' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='SERIAL'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NAME' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='EXAM_NAME'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='REQUEST_DATE' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='REQUEST_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
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
			String DOCUMENT_T = cRsList.getString("DOCUMENT");
			String FILENAME_T = cRsList.getString("FILENAME");
			String SERIAL_T = cRsList.getString("SERIAL");
			String EXAM_NAME_T = cRsList.getString("EXAM_NAME");
			String REQUEST_DATE_T = cRsList.getString("REQUEST_DATE");
			String ROWID_T = cRsList.getString("ROWID");
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

			if(! DOCUMENT_T.equals("")) {
%>
		 		DOCUMENT='<%= DOCUMENT_T%>'
<%
			}

			if(! FILENAME_T.equals("")) {
%>
		 		FILENAME='<%= FILENAME_T%>'
<%
			}

			if(! SERIAL_T.equals("")) {
%>
		 		SERIAL='<%= SERIAL_T%>'
<%
			}

			if(! EXAM_NAME_T.equals("")) {
%>
		 		EXAM_NAME='<%= EXAM_NAME_T%>'
<%
			}

			if(! REQUEST_DATE_T.equals("")) {
%>
		 		REQUEST_DATE='<%= REQUEST_DATE_T%>'
<%
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
