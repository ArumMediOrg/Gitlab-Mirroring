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

Select * From IT_AUTH_PRGM_ID               
 Where IAP_USER_ID  = :USER_ID  
ORDER BY IAP_PARE_ID, IAP_PRGM_SQ           

		*/

		sql = " SELECT *";
		sql += " FROM IT_AUTH_PRGM_ID";
		sql += " WHERE IAP_USER_ID = '" + USER_ID + "'";
		sql += " ORDER BY IAP_PARE_ID, IAP_PRGM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uUserAuthManagement_selectCboGroupList_001 \n";
			G_INFO += "설명 : 그룹에 대한 프로그램 목록로딩 \n";
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
		<s:AttributeType name='IAP_USER_ID' rs:number='1' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_USER_ID'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_PRGM_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_PRGM_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_MENU_ID' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID'
			 rs:basecolumn='IAP_MENU_ID'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_LIBR_NM' rs:number='4' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_LIBR_NM'>
			<s:datatype dt:type='string' dt:maxLength='50' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_PARE_ID' rs:number='5' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_PARE_ID'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='4' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_MENU_LV' rs:number='6' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_MENU_LV'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='2' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_PRGM_SQ' rs:number='7' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_PRGM_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='3' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_MENU_RU' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID'
			 rs:basecolumn='IAP_MENU_RU'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_SELECT' rs:number='9' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_SELECT'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_SAVE' rs:number='10' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_SAVE'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_PRINT' rs:number='11' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_PRINT'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_DELETE' rs:number='12' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID' rs:basecolumn='IAP_DELETE'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_INPT_ID' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID'
			 rs:basecolumn='IAP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_INPT_DTT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID'
			 rs:basecolumn='IAP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_MODI_ID' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID'
			 rs:basecolumn='IAP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_MODI_DTT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID'
			 rs:basecolumn='IAP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='17' rs:rowid='true' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM_ID'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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

			String IAP_USER_ID_T = cRsList.getString("IAP_USER_ID");
			String IAP_PRGM_NM_T = cRsList.getString("IAP_PRGM_NM");
			String IAP_MENU_ID_T = cRsList.getString("IAP_MENU_ID");
			String IAP_LIBR_NM_T = cRsList.getString("IAP_LIBR_NM");
			String IAP_PARE_ID_T = cRsList.getString("IAP_PARE_ID");
			String IAP_MENU_LV_T = cRsList.getString("IAP_MENU_LV");
			String IAP_PRGM_SQ_T = cRsList.getString("IAP_PRGM_SQ");
			String IAP_MENU_RU_T = cRsList.getString("IAP_MENU_RU");
			String IAP_SELECT_T = cRsList.getString("IAP_SELECT");
			String IAP_SAVE_T = cRsList.getString("IAP_SAVE");
			String IAP_PRINT_T = cRsList.getString("IAP_PRINT");
			String IAP_DELETE_T = cRsList.getString("IAP_DELETE");
			String IAP_INPT_ID_T = cRsList.getString("IAP_INPT_ID");
			String IAP_INPT_DTT_T = cRsList.getDate2("IAP_INPT_DTT");
			String IAP_MODI_ID_T = cRsList.getString("IAP_MODI_ID");
			String IAP_MODI_DTT_T = cRsList.getDate2("IAP_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IAP_USER_ID_T.equals("")) {
%>
		 		IAP_USER_ID='<%= IAP_USER_ID_T%>'
<%
			}

			if(! IAP_PRGM_NM_T.equals("")) {
%>
		 		IAP_PRGM_NM='<%= IAP_PRGM_NM_T%>'
<%
			}

			if(! IAP_MENU_ID_T.equals("")) {
%>
		 		IAP_MENU_ID='<%= IAP_MENU_ID_T%>'
<%
			}

			if(! IAP_LIBR_NM_T.equals("")) {
%>
		 		IAP_LIBR_NM='<%= IAP_LIBR_NM_T%>'
<%
			}

			if(! IAP_PARE_ID_T.equals("")) {
%>
		 		IAP_PARE_ID='<%= IAP_PARE_ID_T%>'
<%
			}

			if(! IAP_MENU_LV_T.equals("")) {
%>
		 		IAP_MENU_LV='<%= IAP_MENU_LV_T%>'
<%
			}

			if(! IAP_PRGM_SQ_T.equals("")) {
%>
		 		IAP_PRGM_SQ='<%= IAP_PRGM_SQ_T%>'
<%
			}

			if(! IAP_MENU_RU_T.equals("")) {
%>
		 		IAP_MENU_RU='<%= IAP_MENU_RU_T%>'
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

			if(! IAP_INPT_ID_T.equals("")) {
%>
		 		IAP_INPT_ID='<%= IAP_INPT_ID_T%>'
<%
			}

			if(! IAP_INPT_DTT_T.equals("")) {
%>
		 		IAP_INPT_DTT='<%= IAP_INPT_DTT_T%>'
<%
			}

			if(! IAP_MODI_ID_T.equals("")) {
%>
		 		IAP_MODI_ID='<%= IAP_MODI_ID_T%>'
<%
			}

			if(! IAP_MODI_DTT_T.equals("")) {
%>
		 		IAP_MODI_DTT='<%= IAP_MODI_DTT_T%>'
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
