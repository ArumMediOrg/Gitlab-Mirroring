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

SELECT CCN_LARGE, CCN_SMALL, CCN_LEVEL, CCN_FULL_NM              
FROM CT_COMMON WHERE CCN_LARGE = '0216' AND LENGTH(CCN_SMALL) = 2 

		*/

		sql = " SELECT CCN_LARGE, CCN_SMALL, CCN_LEVEL, CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0216'";
		sql += " AND LENGTH(CCN_SMALL) = 2";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uVT1000Apply_SetInsertMode_002 \n";
			G_INFO += "설명 : 판정결과코드 로딩 \n";
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
		<s:AttributeType name='CCN_LARGE' rs:number='1' rs:writeunknown='true' rs:basetable='CT_COMMON' rs:basecolumn='CCN_LARGE'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_SMALL' rs:number='2' rs:writeunknown='true' rs:basetable='CT_COMMON' rs:basecolumn='CCN_SMALL'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_LEVEL' rs:number='3' rs:writeunknown='true' rs:basetable='CT_COMMON' rs:basecolumn='CCN_LEVEL'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_FULL_NM' rs:number='4' rs:writeunknown='true' rs:basetable='CT_COMMON' rs:basecolumn='CCN_FULL_NM'>
			<s:datatype dt:type='string' dt:maxLength='300' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='CT_COMMON' rs:basecolumn='ROWID'
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

			String CCN_LARGE_T = cRsList.getString("CCN_LARGE");
			String CCN_SMALL_T = cRsList.getString("CCN_SMALL");
			String CCN_LEVEL_T = cRsList.getString("CCN_LEVEL");
			String CCN_FULL_NM_T = cRsList.getString("CCN_FULL_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CCN_LARGE_T.equals("")) {
%>
		 		CCN_LARGE='<%= CCN_LARGE_T%>'
<%
			}

			if(! CCN_SMALL_T.equals("")) {
%>
		 		CCN_SMALL='<%= CCN_SMALL_T%>'
<%
			}

			if(! CCN_LEVEL_T.equals("")) {
%>
		 		CCN_LEVEL='<%= CCN_LEVEL_T%>'
<%
			}

			if(! CCN_FULL_NM_T.equals("")) {
%>
		 		CCN_FULL_NM='<%= CCN_FULL_NM_T%>'
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
