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

		String USER_NO = htMethod.get("USER_NO");
		String CFG_CD = htMethod.get("CFG_CD");

		//
		if(USER_NO == null) { USER_NO = ""; }
		if(CFG_CD == null) { CFG_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM UT_USRCFG  WHERE UUC_USER_NO = :USER_NO and UUC_CFG_CD = :CFG_CD
		*/

		sql = " SELECT *";
		sql += " FROM UT_USRCFG";
		sql += " WHERE UUC_USER_NO = '" + USER_NO + "'";
		sql += " AND UUC_CFG_CD = '" + CFG_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UConfig_UP_GerSetting_001 \n";
			G_INFO += "설명 : 특정코드에 대한 사용자 설정정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " USER_NO : " + USER_NO + " \n";
			G_INFO += " CFG_CD : " + CFG_CD + " \n";
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
		<s:AttributeType name='UUC_USER_NO' rs:number='1' rs:writeunknown='true' rs:basetable='UT_USRCFG' rs:basecolumn='UUC_USER_NO'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='UUC_CFG_CD' rs:number='2' rs:writeunknown='true' rs:basetable='UT_USRCFG' rs:basecolumn='UUC_CFG_CD'>
			<s:datatype dt:type='string' dt:maxLength='30' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='UUC_CFG_NM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='UT_USRCFG'
			 rs:basecolumn='UUC_CFG_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='UUC_BIGO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='UT_USRCFG'
			 rs:basecolumn='UUC_BIGO'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='UUC_INPUT_ID' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='UT_USRCFG'
			 rs:basecolumn='UUC_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='UUC_INPUT_DTT' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='UT_USRCFG'
			 rs:basecolumn='UUC_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='UUC_MODI_ID' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='UT_USRCFG'
			 rs:basecolumn='UUC_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='UUC_MODI_DTT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='UT_USRCFG'
			 rs:basecolumn='UUC_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='9' rs:rowid='true' rs:writeunknown='true' rs:basetable='UT_USRCFG'
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

			String UUC_USER_NO_T = cRsList.getString("UUC_USER_NO");
			String UUC_CFG_CD_T = cRsList.getString("UUC_CFG_CD");
			String UUC_CFG_NM_T = cRsList.getString("UUC_CFG_NM");
			String UUC_BIGO_T = cRsList.getString("UUC_BIGO");
			String UUC_INPUT_ID_T = cRsList.getString("UUC_INPUT_ID");
			String UUC_INPUT_DTT_T = cRsList.getDate2("UUC_INPUT_DTT");
			String UUC_MODI_ID_T = cRsList.getString("UUC_MODI_ID");
			String UUC_MODI_DTT_T = cRsList.getDate2("UUC_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! UUC_USER_NO_T.equals("")) {
%>
		 		UUC_USER_NO='<%= UUC_USER_NO_T%>'
<%
			}

			if(! UUC_CFG_CD_T.equals("")) {
%>
		 		UUC_CFG_CD='<%= UUC_CFG_CD_T%>'
<%
			}

			if(! UUC_CFG_NM_T.equals("")) {
%>
		 		UUC_CFG_NM='<%= UUC_CFG_NM_T%>'
<%
			}

			if(! UUC_BIGO_T.equals("")) {
%>
		 		UUC_BIGO='<%= UUC_BIGO_T%>'
<%
			}

			if(! UUC_INPUT_ID_T.equals("")) {
%>
		 		UUC_INPUT_ID='<%= UUC_INPUT_ID_T%>'
<%
			}

			if(! UUC_INPUT_DTT_T.equals("")) {
%>
		 		UUC_INPUT_DTT='<%= UUC_INPUT_DTT_T%>'
<%
			}

			if(! UUC_MODI_ID_T.equals("")) {
%>
		 		UUC_MODI_ID='<%= UUC_MODI_ID_T%>'
<%
			}

			if(! UUC_MODI_DTT_T.equals("")) {
%>
		 		UUC_MODI_DTT='<%= UUC_MODI_DTT_T%>'
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
