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

SELECT UUC_USER_NO,UUC_CFG_CD,UUC_CFG_NM,IAP_PRGM_NM                         
  FROM UT_USRCFG A left outer join IT_AUTH_PRGM b on a.UUC_CFG_NM=IAP_MENU_ID
 WHERE UUC_USER_NO= :USER_NO AND UUC_CFG_CD=:CFG_CD

		*/

		sql = " SELECT UUC_USER_NO,UUC_CFG_CD,UUC_CFG_NM,IAP_PRGM_NM";
		sql += " FROM UT_USRCFG A LEFT OUTER JOIN IT_AUTH_PRGM B";
		sql += " ON A.UUC_CFG_NM=IAP_MENU_ID";
		sql += " WHERE UUC_USER_NO= '" + USER_NO + "'";
		sql += " AND UUC_CFG_CD='" + CFG_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UConfig_UP_STARTMENU_001 \n";
			G_INFO += "설명 : 코드에 맞는 설정정보 로딩 \n";
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
		<s:AttributeType name='IAP_PRGM_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM'
			 rs:basecolumn='IAP_PRGM_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='UT_USRCFG' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c5' rs:name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='IT_AUTH_PRGM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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
			String IAP_PRGM_NM_T = cRsList.getString("IAP_PRGM_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c5_T = cRsList.getString("c5");
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

			if(! IAP_PRGM_NM_T.equals("")) {
%>
		 		IAP_PRGM_NM='<%= IAP_PRGM_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c5='<%= cnt%>'
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
