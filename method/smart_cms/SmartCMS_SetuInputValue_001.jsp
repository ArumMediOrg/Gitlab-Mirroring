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

		String STBNM = htMethod.get("STBNM");

		//
		if(STBNM == null) { STBNM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select Sc.Column_name name From all_tab_columns Sc, all_col_comments So  
where Sc.table_name = So.table_name
and Sc.Column_name = So.Column_name
and Sc.Owner = So.Owner   
and So.table_Name = :STBNM            
order by Sc.Column_id       
		*/

		sql = " SELECT SC.COLUMN_NAME NAME";
		sql += " FROM ALL_TAB_COLUMNS SC, ALL_COL_COMMENTS SO";
		sql += " WHERE SC.TABLE_NAME = SO.TABLE_NAME";
		sql += " AND SC.COLUMN_NAME = SO.COLUMN_NAME";
		sql += " AND SC.OWNER = SO.OWNER";
		sql += " AND SO.TABLE_NAME = '" + STBNM + "'";
		sql += " ORDER BY SC.COLUMN_ID";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : SmartCMS_SetuInputValue_001 \n";
			G_INFO += "설명 : 컬럼정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " STBNM : " + STBNM + " \n";
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
		<s:AttributeType name='NAME' rs:number='1' rs:writeunknown='true' rs:basetable='ALL_TAB_COLUMNS' rs:basecolumn='COLUMN_NAME'>
			<s:datatype dt:type='string' dt:maxLength='30' rs:maybenull='false'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String NAME_T = cRsList.getString("NAME");
%>
			<z:row
<%
			if(! NAME_T.equals("")) {
%>
		 		NAME='<%= NAME_T%>'
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
