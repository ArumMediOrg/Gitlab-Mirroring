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

SELECT IAU_EMP_NO, IAU_PENL_NM FROM IT_AUTH_USER
 WHERE IAU_DEPT_CD = '0205'
  AND (IAU_LICEN1_CD = '11' OR IAU_LICEN1_CD = '12')
   And IAU_EMP_NO  = :EMP_NO'
 ORDER BY IAU_EMP_NO

		*/

		sql = " SELECT IAU_EMP_NO, IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		//sql += " WHERE IAU_DEPT_CD = '0205'";
		sql += " WHERE 1=1 ";
		sql += " AND (";
		sql += "	IAU_LICEN1_CD = '11'";
		sql += " OR IAU_LICEN1_CD = '12'";
		sql += ")";
		sql += " AND IAU_EMP_NO = '" + EMP_NO + "'";
		sql += " ORDER BY IAU_EMP_NO";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : nurimain_TreeViewClick_002 \n";
			G_INFO += "설명 : 마이메뉴 항목을 불러옴 \n";
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
		<s:AttributeType name='IAU_PENL_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IAU_EMP_NO_T.equals("")) {
%>
		 		IAU_EMP_NO='<%= IAU_EMP_NO_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
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
