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

		String CSC_LARGE = htMethod.get("CSC_LARGE");

		//
		if(CSC_LARGE == null) { CSC_LARGE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT DISTINCT(CSC_ETC1_CD) AS CSC_ETC1_CD, CSC_ETC2_NM
  FROM CT_SP_COMMON
 WHERE CSC_LARGE = :CSC_LARGE 
   AND CSC_LEVEL = ''5''
		*/

		sql = " SELECT DISTINCT(CSC_ETC1_CD) AS CSC_ETC1_CD, CSC_ETC2_NM";
		sql += " FROM CT_SP_COMMON";
		sql += " WHERE CSC_LARGE = '" + CSC_LARGE + "'";
		sql += " AND CSC_LEVEL = '5'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Apply_upSpComboSetting_001 \n";
			G_INFO += "설명 : 특검 공통코드 조회(콤보박스 셋팅용) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CSC_LARGE : " + CSC_LARGE + " \n";
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
		<s:AttributeType name='CSC_ETC1_CD' rs:number='1' rs:nullable='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='CSC_ETC1_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC2_NM' rs:number='2' rs:nullable='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='CSC_ETC2_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CSC_ETC1_CD_T = cRsList.getString("CSC_ETC1_CD");
			String CSC_ETC2_NM_T = cRsList.getString("CSC_ETC2_NM");
%>
			<z:row
<%
			if(! CSC_ETC1_CD_T.equals("")) {
%>
		 		CSC_ETC1_CD='<%= CSC_ETC1_CD_T%>'
<%
			}

			if(! CSC_ETC2_NM_T.equals("")) {
%>
		 		CSC_ETC2_NM='<%= CSC_ETC2_NM_T%>'
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
