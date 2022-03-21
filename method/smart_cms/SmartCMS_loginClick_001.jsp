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

		String EMP_NO = htMethod.get("EMP_NO");

		//
		if(EMP_NO == null) { EMP_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IAU_EMP_NO,IAU_PASS_WD,IAU_AUTH_GP,IAU_PENL_NM, IAU_ENCRYP_GB, IAU_ANOTHER_NO,
TO_CHAR(IAU_MODI_DTT, 'YYYY-MM-DD') IAU_MODI_DTT                                   
FROM IT_AUTH_USER                                                      
WHERE IAU_EMP_NO = :EMP_NO  AND IAU_USE_YN = 'Y'
		*/

		sql = " SELECT IAU_EMP_NO,IAU_PASS_WD,IAU_AUTH_GP,IAU_PENL_NM, IAU_ENCRYP_GB, IAU_ANOTHER_NO, TO_CHAR(IAU_MODI_DTT, 'YYYY-MM-DD') IAU_MODI_DTT";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO = '" + EMP_NO + "'";
		sql += " AND IAU_USE_YN = 'Y'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : SmartCMS_loginClick_001 \n";
			G_INFO += "설명 : 로그인정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EMP_NO : " + EMP_NO + " \n";
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
		<s:AttributeType name='IAU_EMP_NO' rs:number='1' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_EMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PASS_WD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PASS_WD'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_AUTH_GP' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_AUTH_GP'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='4' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ENCRYP_GB' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ENCRYP_GB'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ANOTHER_NO' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ANOTHER_NO'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_MODI_DTT' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String IAU_EMP_NO_T = cRsList.getString("IAU_EMP_NO");
			String IAU_PASS_WD_T = cRsList.getString("IAU_PASS_WD");
			String IAU_AUTH_GP_T = cRsList.getString("IAU_AUTH_GP");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_ENCRYP_GB_T = cRsList.getString("IAU_ENCRYP_GB");
			String IAU_ANOTHER_NO_T = cRsList.getString("IAU_ANOTHER_NO");
			String IAU_MODI_DTT_T = cRsList.getString("IAU_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IAU_EMP_NO_T.equals("")) {
%>
		 		IAU_EMP_NO='<%= IAU_EMP_NO_T%>'
<%
			}

			if(! IAU_PASS_WD_T.equals("")) {
%>
		 		IAU_PASS_WD='<%= IAU_PASS_WD_T%>'
<%
			}

			if(! IAU_AUTH_GP_T.equals("")) {
%>
		 		IAU_AUTH_GP='<%= IAU_AUTH_GP_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! IAU_ENCRYP_GB_T.equals("")) {
%>
		 		IAU_ENCRYP_GB='<%= IAU_ENCRYP_GB_T%>'
<%
			}

			if(! IAU_ANOTHER_NO_T.equals("")) {
%>
		 		IAU_ANOTHER_NO='<%= IAU_ANOTHER_NO_T%>'
<%
			}

			if(! IAU_MODI_DTT_T.equals("")) {
%>
		 		IAU_MODI_DTT='<%= IAU_MODI_DTT_T%>'
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
