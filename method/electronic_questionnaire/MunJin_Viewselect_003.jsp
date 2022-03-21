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
		String PATH_GBN = htMethod.get("PATH_GBN");

		//
		if(CUST_NO == null) { CUST_NO = ""; }
		if(PATH_GBN == null) { PATH_GBN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 SELECT DISTINCT SERIAL, REQUEST_DATE
   FROM ARUM_TOTAL
     WHERE CUST_NO = :CUST_NO
       AND EXAM_NAME IS NOT NULL
       AND FILENAME IS NOT NULL
         ORDER BY REQUEST_DATE DESC, SERIAL
		*/

		sql = " SELECT DISTINCT SERIAL, REQUEST_DATE";
		sql += " FROM ARUM_TOTAL";
		sql += " WHERE CUST_NO = '" + CUST_NO + "'";
		sql += " AND EXAM_NAME IS NOT NULL";
		sql += " AND FILENAME IS NOT NULL";

		if (PATH_GBN.equals("2")) {
			sql += " AND IMAGE_DATA IS NOT NULL ";
		}

		sql += " ORDER BY REQUEST_DATE DESC, SERIAL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : MunJin_Viewselect_003 \n";
			G_INFO += "설명 : 전자문진 테이블에서 고객번호로 모든 날짜 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
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
		<s:AttributeType name='SERIAL' rs:number='1' rs:nullable='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='SERIAL'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='REQUEST_DATE' rs:number='2' rs:nullable='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='REQUEST_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
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
