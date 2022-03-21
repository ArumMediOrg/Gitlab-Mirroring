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

		String SERIAL = htMethod.get("SERIAL");
		String SCANDATE = htMethod.get("SCANDATE");

		//
		if(SERIAL == null) { SERIAL = ""; }
		if(SCANDATE == null) { SCANDATE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT VALUE1, SERIAL, FILENAME, EXAM_NO, FORMNAME, CUST_NO, EXAM_NAME, AGE, GENDER, CHART_NO";
		sql += " FROM ARUM_TOTAL";
		sql += " WHERE SERIAL = '" + SERIAL + "'";
		sql += " AND SCANDATE = '" + SCANDATE + "'";
		sql += " AND OMRYN = 'Y'";
		sql += " AND VALUYN = 'N'";
		sql += " AND FORMNAME <> '777'";
		sql += " ORDER BY SERIAL, FILENAME";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : omr_selectincomplete_002 \n";
			G_INFO += "설명 : OMR 시리얼 번호로 미검증자 정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SERIAL : " + SERIAL + " \n";
			G_INFO += " SCANDATE : " + SCANDATE + " \n";
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
		<s:AttributeType name='VALUE1' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='VALUE1'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='SERIAL' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='SERIAL'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='FILENAME' rs:number='3' rs:writeunknown='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='FILENAME'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='EXAM_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='FORMNAME' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='FORMNAME'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CUST_NO' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NAME' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='EXAM_NAME'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='AGE' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='AGE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='GENDER' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='GENDER'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CHART_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='ROWID'
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

			String VALUE1_T = cRsList.getString("VALUE1");
			String SERIAL_T = cRsList.getString("SERIAL");
			String FILENAME_T = cRsList.getString("FILENAME");
			String EXAM_NO_T = cRsList.getString("EXAM_NO");
			String FORMNAME_T = cRsList.getString("FORMNAME");
			String CUST_NO_T = cRsList.getString("CUST_NO");
			String EXAM_NAME_T = cRsList.getString("EXAM_NAME");
			String AGE_T = cRsList.getString("AGE");
			String GENDER_T = cRsList.getString("GENDER");
			String CHART_NO_T = cRsList.getString("CHART_NO");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! VALUE1_T.equals("")) {
%>
		 		VALUE1='<%= VALUE1_T%>'
<%
			}

			if(! SERIAL_T.equals("")) {
%>
		 		SERIAL='<%= SERIAL_T%>'
<%
			}

			if(! FILENAME_T.equals("")) {
%>
		 		FILENAME='<%= FILENAME_T%>'
<%
			}

			if(! EXAM_NO_T.equals("")) {
%>
		 		EXAM_NO='<%= EXAM_NO_T%>'
<%
			}

			if(! FORMNAME_T.equals("")) {
%>
		 		FORMNAME='<%= FORMNAME_T%>'
<%
			}

			if(! CUST_NO_T.equals("")) {
%>
		 		CUST_NO='<%= CUST_NO_T%>'
<%
			}

			if(! EXAM_NAME_T.equals("")) {
%>
		 		EXAM_NAME='<%= EXAM_NAME_T%>'
<%
			}

			if(! AGE_T.equals("")) {
%>
		 		AGE='<%= AGE_T%>'
<%
			}

			if(! GENDER_T.equals("")) {
%>
		 		GENDER='<%= GENDER_T%>'
<%
			}

			if(! CHART_NO_T.equals("")) {
%>
		 		CHART_NO='<%= CHART_NO_T%>'
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
