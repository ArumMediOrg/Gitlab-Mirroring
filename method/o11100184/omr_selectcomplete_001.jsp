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

		String SCANDATE = htMethod.get("SCANDATE");
		String SERIAL = htMethod.get("SERIAL");
		String FORMNAME = htMethod.get("FORMNAME");

		//
		if(SCANDATE == null) { SCANDATE = ""; }
		if(SERIAL == null) { SERIAL = ""; }
		if(FORMNAME == null) { FORMNAME = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT VALUE1, VALUE2, FILENAME
FROM ARUM_TOTAL
WHERE SCANDATE = :Scandate
AND SERIAL = :Serial
AND VALUYN = 'Y'
AND FORMNAME = :FORMNAME
		*/

		sql = " SELECT VALUE1, VALUE2, FILENAME";
		sql += " FROM ARUM_TOTAL";
		sql += " WHERE SCANDATE = '" + SCANDATE + "'";
		sql += " AND SERIAL = '" + SERIAL + "'";
		sql += " AND VALUYN = 'Y'";
		sql += " AND FORMNAME = '" + FORMNAME + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : omr_selectcomplete_001 \n";
			G_INFO += "설명 : OMR 검증완료 결과값 및 이미지 파일 이름 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SCANDATE : " + SCANDATE + " \n";
			G_INFO += " SERIAL : " + SERIAL + " \n";
			G_INFO += " FORMNAME : " + FORMNAME + " \n";
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
		<s:AttributeType name='VALUE2' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='VALUE2'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='FILENAME' rs:number='3' rs:writeunknown='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='FILENAME'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='ROWID'
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
			String VALUE2_T = cRsList.getString("VALUE2");
			String FILENAME_T = cRsList.getString("FILENAME");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! VALUE1_T.equals("")) {
%>
		 		VALUE1='<%= VALUE1_T%>'
<%
			}

			if(! VALUE2_T.equals("")) {
%>
		 		VALUE2='<%= VALUE2_T%>'
<%
			}

			if(! FILENAME_T.equals("")) {
%>
		 		FILENAME='<%= FILENAME_T%>'
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
