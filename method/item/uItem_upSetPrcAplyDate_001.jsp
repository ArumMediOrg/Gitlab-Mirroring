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

		String IIP_ITEM_CD = htMethod.get("IIP_ITEM_CD");

		//
		if(IIP_ITEM_CD == null) { IIP_ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

			SELECT DISTINCT(IIP_APLY_DT)
			FROM IT_ITEM_PRICE
			WHERE IIP_ITEM_CD = :IIP_ITEM_CD
			ORDER BY IIP_APLY_DT DESC

		*/

		sql = " SELECT DISTINCT(IIP_APLY_DT)";
		sql += " FROM IT_ITEM_PRICE";
		sql += " WHERE IIP_ITEM_CD = '" + IIP_ITEM_CD + "'";
		sql += " ORDER BY IIP_APLY_DT DESC";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_upSetPrcAplyDate_001 \n";
			G_INFO += "설명 : 검사항목 수가 적용일 리스트 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IIP_ITEM_CD : " + IIP_ITEM_CD + " \n";
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
				<s:AttributeType name='IIP_APLY_DT' rs:number='1' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='IIP_APLY_DT'>
					<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
				</s:AttributeType>
				<s:extends type='rs:rowbase'/>
			</s:ElementType>
		</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String IIP_APLY_DT_T = cRsList.getString("IIP_APLY_DT");
%>
			<z:row
<%
			if(! IIP_APLY_DT_T.equals("")) {
%>
		 		IIP_APLY_DT='<%= IIP_APLY_DT_T%>'
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
