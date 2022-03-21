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

		String CUST_NO = htMethod.get("CUST_NO");
		String REQUEST_DATE = htMethod.get("REQUEST_DATE");
		String PATH_GBN = htMethod.get("PATH_GBN");

		//
		if(CUST_NO == null) { CUST_NO = ""; }
		if(REQUEST_DATE == null) { REQUEST_DATE = ""; }
		if(PATH_GBN == null) { PATH_GBN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 SELECT SERIAL, REQUEST_DATE, EXAM_NAME, LOGINID, EXAM_NO, CUST_NO, FORMNAME
   FROM ARUM_TOTAL
     WHERE CUST_NO = :CUST_NO
       AND REQUEST_DATE =  :REQUEST_DATE
       AND EXAM_NAME IS NOT NULL
       AND FILENAME IS NOT NULL
         ORDER BY REQUEST_DATE DESC, SERIAL
		*/

		sql = " SELECT SERIAL, REQUEST_DATE, EXAM_NAME, LOGINID, EXAM_NO, CUST_NO, FORMNAME";
		sql += " FROM ARUM_TOTAL";
		sql += " WHERE CUST_NO = '" + CUST_NO + "'";
		sql += " AND REQUEST_DATE = '" + REQUEST_DATE + "'";
		sql += " AND EXAM_NAME IS NOT NULL";
		sql += " AND FILENAME IS NOT NULL";

		if (PATH_GBN.equals("2")) {
			sql += " AND IMAGE_DATA IS NOT NULL ";
		}

		sql += " ORDER BY REQUEST_DATE DESC, SERIAL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : MunJin_Viewselect_004 \n";
			G_INFO += "설명 : 각 날짜별로 해당 이미지 파일 이름 가져오기 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " REQUEST_DATE : " + REQUEST_DATE + " \n";
			G_INFO += " PATH_GBN : " + PATH_GBN + " \n";
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
		<s:AttributeType name='SERIAL' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='SERIAL'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='REQUEST_DATE' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='REQUEST_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NAME' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='EXAM_NAME'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='LOGINID' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='LOGINID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='EXAM_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CUST_NO' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='FORMNAME' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='FORMNAME'>
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

			String SERIAL_T = cRsList.getString("SERIAL");
			String REQUEST_DATE_T = cRsList.getString("REQUEST_DATE");
			String EXAM_NAME_T = cRsList.getString("EXAM_NAME");
			String LOGINID_T = cRsList.getString("LOGINID");
			String EXAM_NO_T = cRsList.getString("EXAM_NO");
			String CUST_NO_T = cRsList.getString("CUST_NO");
			String FORMNAME_T = cRsList.getString("FORMNAME");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
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

			if(! LOGINID_T.equals("")) {
%>
		 		LOGINID='<%= LOGINID_T%>'
<%
			}

			if(! EXAM_NO_T.equals("")) {
%>
		 		EXAM_NO='<%= EXAM_NO_T%>'
<%
			}

			if(! CUST_NO_T.equals("")) {
%>
		 		CUST_NO='<%= CUST_NO_T%>'
<%
			}

			if(! FORMNAME_T.equals("")) {
%>
		 		FORMNAME='<%= FORMNAME_T%>'
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
