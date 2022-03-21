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

		String IAU_USE_YN = htMethod.get("IAU_USE_YN");

		//
		if(IAU_USE_YN == null) { IAU_USE_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IAU_LICEN1_NO, IAU_PENL_NM, IAU_EMP_NO, IAU_USE_YN
  FROM IT_AUTH_USER
 WHERE ( (IAU_LICEN1_CD IN(''11'', ''12'')) OR (IAU_LICEN2_CD IN (''11'', ''12'')))
if :IAU_USE_YN  <> '' then
begin
  AND  ISNULL(IAU_USE_YN, ''N'') = :IAU_USE_YN
end

		*/

		sql = " SELECT IAU_LICEN1_NO, IAU_PENL_NM, IAU_EMP_NO, IAU_USE_YN";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE (";
		sql += "	IAU_LICEN1_CD IN ('11', '12')";
		sql += " OR IAU_LICEN2_CD IN ('11', '12')";
		sql += ")";
		if(IAU_USE_YN != null && ! IAU_USE_YN.equals("")) {
			sql += " AND NVL(IAU_USE_YN, 'N') = '" + IAU_USE_YN + "'";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCommon_XML_IAU_003 \n";
			G_INFO += "설명 : 사용자조회(의사리스트) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IAU_USE_YN : " + IAU_USE_YN + " \n";
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
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_EMP_NO' rs:number='3' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_EMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_USE_YN' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_EMP_NO_T = cRsList.getString("IAU_EMP_NO");
			String IAU_USE_YN_T = cRsList.getString("IAU_USE_YN");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IAU_LICEN1_NO_T.equals("")) {
%>
		 		IAU_LICEN1_NO='<%= IAU_LICEN1_NO_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! IAU_EMP_NO_T.equals("")) {
%>
		 		IAU_EMP_NO='<%= IAU_EMP_NO_T%>'
<%
			}

			if(! IAU_USE_YN_T.equals("")) {
%>
		 		IAU_USE_YN='<%= IAU_USE_YN_T%>'
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
