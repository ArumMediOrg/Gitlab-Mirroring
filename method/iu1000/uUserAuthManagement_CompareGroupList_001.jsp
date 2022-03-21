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

select A.iap_libr_nm, B.iap_libr_nm, A.iap_prgm_nm from         
(Select A.iap_libr_nm, A.iap_prgm_nm From IT_AUTH_PRGM A        
Where A.IAP_USE_YN = 'Y' and nvl(A.iap_libr_nm,' ') != ' '             
) A left outer join                                             
(Select B.iap_libr_nm From IT_AUTH_PRGM_ID B where              
B.IAP_USER_ID = :USER_ID  and nvl(B.IAP_LIBR_NM,' ') != ' '
) B On A.iap_libr_nm = B.iap_libr_nm                            
where B.IAP_LIBR_NM is null                                     

		*/

		sql = " SELECT A.IAP_LIBR_NM, B.IAP_LIBR_NM, A.IAP_PRGM_NM";
		sql += " FROM (SELECT A.IAP_LIBR_NM, A.IAP_PRGM_NM";
		sql += " FROM IT_AUTH_PRGM A";
		sql += " WHERE A.IAP_USE_YN = 'Y'";
		sql += " AND NVL(A.IAP_LIBR_NM,' ') != ' ' ) A LEFT OUTER JOIN (SELECT B.IAP_LIBR_NM";
		sql += " FROM IT_AUTH_PRGM_ID B";
		sql += " WHERE B.IAP_USER_ID = '" + USER_ID + "'";
		sql += " AND NVL(B.IAP_LIBR_NM,' ') != ' ' ) B";
		sql += " ON A.IAP_LIBR_NM = B.IAP_LIBR_NM";
		sql += " WHERE B.IAP_LIBR_NM IS NULL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uUserAuthManagement_CompareGroupList_001 \n";
			G_INFO += "설명 : 목록비교 \n";
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
		<s:AttributeType name='IAP_LIBR_NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='c1' rs:name='IAP_LIBR_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_PRGM_NM' rs:number='3'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
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
			String c1_T = cRsList.getString("c1");
			String IAP_PRGM_NM_T = cRsList.getString("IAP_PRGM_NM");
%>
			<z:row
<%
			if(! IAP_LIBR_NM_T.equals("")) {
%>
		 		IAP_LIBR_NM='<%= IAP_LIBR_NM_T%>'
<%
			}

			if(! c1_T.equals("")) {
%>
		 		c1='<%= c1_T%>'
<%
			}

			if(! IAP_PRGM_NM_T.equals("")) {
%>
		 		IAP_PRGM_NM='<%= IAP_PRGM_NM_T%>'
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
