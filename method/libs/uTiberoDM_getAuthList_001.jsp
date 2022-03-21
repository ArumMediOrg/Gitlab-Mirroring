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

		String USER_ID = htMethod.get("USER_ID");

		//
		if(USER_ID == null) { USER_ID = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select IAP_LIBR_NM, IAP_SELECT, IAP_SAVE, IAP_PRINT, IAP_DELETE From IT_AUTH_PRGM_ID
where NVL(LTrim(RTrim(IAP_LIBR_NM)), ' ') <> ' '
and IAP_USER_ID = :USER_ID
		*/

		sql = " SELECT IAP_LIBR_NM, IAP_SELECT, IAP_SAVE, IAP_PRINT, IAP_DELETE";
		sql += " FROM IT_AUTH_PRGM_ID";
		sql += " WHERE NVL(LTRIM(RTRIM(IAP_LIBR_NM)), ' ') <> ' '";
		sql += " AND IAP_USER_ID = '" + USER_ID + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uTiberoDM_getAuthList_001 \n";
			G_INFO += "설명 : 권한정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " USER_ID : " + USER_ID + " \n";
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
		<s:AttributeType name='IAP_LIBR_NM' rs:number='1' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_LIBR_NM'>
			<s:datatype dt:type='string' dt:maxLength='50' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_SELECT' rs:number='2' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_SELECT'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_SAVE' rs:number='3' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_SAVE'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_PRINT' rs:number='4' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_PRINT'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_DELETE' rs:number='5' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_DELETE'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='ROWID'
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

			String IAP_LIBR_NM_T = cRsList.getString("IAP_LIBR_NM");
			String IAP_SELECT_T = cRsList.getString("IAP_SELECT");
			String IAP_SAVE_T = cRsList.getString("IAP_SAVE");
			String IAP_PRINT_T = cRsList.getString("IAP_PRINT");
			String IAP_DELETE_T = cRsList.getString("IAP_DELETE");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IAP_LIBR_NM_T.equals("")) {
%>
		 		IAP_LIBR_NM='<%= IAP_LIBR_NM_T%>'
<%
			}

			if(! IAP_SELECT_T.equals("")) {
%>
		 		IAP_SELECT='<%= IAP_SELECT_T%>'
<%
			}

			if(! IAP_SAVE_T.equals("")) {
%>
		 		IAP_SAVE='<%= IAP_SAVE_T%>'
<%
			}

			if(! IAP_PRINT_T.equals("")) {
%>
		 		IAP_PRINT='<%= IAP_PRINT_T%>'
<%
			}

			if(! IAP_DELETE_T.equals("")) {
%>
		 		IAP_DELETE='<%= IAP_DELETE_T%>'
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
