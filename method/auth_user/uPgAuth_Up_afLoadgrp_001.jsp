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

select * from IT_AUTH_GRUP WHERE IAG_USE_YN = 'Y'
		*/

		sql = " SELECT *";
		sql += " FROM IT_AUTH_GRUP";
		sql += " WHERE IAG_USE_YN = 'Y'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPgAuth_Up_afLoadgrp_001 \n";
			G_INFO += "설명 : 그룹정보 로딩 \n";
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
		<s:AttributeType name='IAG_AUTH_GP' rs:number='1' rs:writeunknown='true' rs:basetable='IT_AUTH_GRUP' rs:basecolumn='IAG_AUTH_GP'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAG_AUTH_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_GRUP'
			 rs:basecolumn='IAG_AUTH_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAG_USE_YN' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_GRUP'
			 rs:basecolumn='IAG_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAG_NUSE_ID' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_GRUP'
			 rs:basecolumn='IAG_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAG_NUSE_DTT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_GRUP'
			 rs:basecolumn='IAG_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IAG_INPT_ID' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_GRUP'
			 rs:basecolumn='IAG_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAG_INPT_DTT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_GRUP'
			 rs:basecolumn='IAG_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IAG_MODI_ID' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_GRUP'
			 rs:basecolumn='IAG_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAG_MODI_DTT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_GRUP'
			 rs:basecolumn='IAG_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:writeunknown='true' rs:basetable='IT_AUTH_GRUP'
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

			String IAG_AUTH_GP_T = cRsList.getString("IAG_AUTH_GP");
			String IAG_AUTH_NM_T = cRsList.getString("IAG_AUTH_NM");
			String IAG_USE_YN_T = cRsList.getString("IAG_USE_YN");
			String IAG_NUSE_ID_T = cRsList.getString("IAG_NUSE_ID");
			String IAG_NUSE_DTT_T = cRsList.getDate2("IAG_NUSE_DTT");
			String IAG_INPT_ID_T = cRsList.getString("IAG_INPT_ID");
			String IAG_INPT_DTT_T = cRsList.getDate2("IAG_INPT_DTT");
			String IAG_MODI_ID_T = cRsList.getString("IAG_MODI_ID");
			String IAG_MODI_DTT_T = cRsList.getDate2("IAG_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IAG_AUTH_GP_T.equals("")) {
%>
		 		IAG_AUTH_GP='<%= IAG_AUTH_GP_T%>'
<%
			}

			if(! IAG_AUTH_NM_T.equals("")) {
%>
		 		IAG_AUTH_NM='<%= IAG_AUTH_NM_T%>'
<%
			}

			if(! IAG_USE_YN_T.equals("")) {
%>
		 		IAG_USE_YN='<%= IAG_USE_YN_T%>'
<%
			}

			if(! IAG_NUSE_ID_T.equals("")) {
%>
		 		IAG_NUSE_ID='<%= IAG_NUSE_ID_T%>'
<%
			}

			if(! IAG_NUSE_DTT_T.equals("")) {
%>
		 		IAG_NUSE_DTT='<%= IAG_NUSE_DTT_T%>'
<%
			}

			if(! IAG_INPT_ID_T.equals("")) {
%>
		 		IAG_INPT_ID='<%= IAG_INPT_ID_T%>'
<%
			}

			if(! IAG_INPT_DTT_T.equals("")) {
%>
		 		IAG_INPT_DTT='<%= IAG_INPT_DTT_T%>'
<%
			}

			if(! IAG_MODI_ID_T.equals("")) {
%>
		 		IAG_MODI_ID='<%= IAG_MODI_ID_T%>'
<%
			}

			if(! IAG_MODI_DTT_T.equals("")) {
%>
		 		IAG_MODI_DTT='<%= IAG_MODI_DTT_T%>'
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
