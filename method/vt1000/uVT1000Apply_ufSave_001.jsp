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

		String MARK_CLASS = htMethod.get("MARK_CLASS");
		String VIEW_CD1 = htMethod.get("VIEW_CD1");
		String VIEW_CD2 = htMethod.get("VIEW_CD2");
		String VIEW_CD3 = htMethod.get("VIEW_CD3");
		String VIEW_CD4 = htMethod.get("VIEW_CD4");
		String VIEW_CD5 = htMethod.get("VIEW_CD5");
		String VIEW_CD6 = htMethod.get("VIEW_CD6");

		//
		if(MARK_CLASS == null) { MARK_CLASS = ""; }
		if(VIEW_CD1 == null) { VIEW_CD1 = ""; }
		if(VIEW_CD2 == null) { VIEW_CD2 = ""; }
		if(VIEW_CD3 == null) { VIEW_CD3 = ""; }
		if(VIEW_CD4 == null) { VIEW_CD4 = ""; }
		if(VIEW_CD5 == null) { VIEW_CD5 = ""; }
		if(VIEW_CD6 == null) { VIEW_CD6 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT (NVL(MAX(VVM_VIEW_NO), 0) + 1) AS VVM_VIEW_NO                   
FROM VT_VIEW_MAGE                                        
WHERE VVM_MARK_CLASS = :MARK_CLASS 
AND VVM_VIEW_CD1 = :VIEW_CD1 AND VVM_VIEW_CD2 = :VIEW_CD2
AND VVM_VIEW_CD3 = :VIEW_CD3 AND VVM_VIEW_CD4 = :VIEW_CD4
AND VVM_VIEW_CD5 = :VIEW_CD5 AND VVM_VIEW_CD6 = :VIEW_CD6

		*/

		sql = " SELECT (NVL(MAX(VVM_VIEW_NO), 0) + 1) AS VVM_VIEW_NO";
		sql += " FROM VT_VIEW_MAGE";
		sql += " WHERE VVM_MARK_CLASS = '" + MARK_CLASS + "'";
		sql += " AND VVM_VIEW_CD1 = '" + VIEW_CD1 + "'";
		sql += " AND VVM_VIEW_CD2 = '" + VIEW_CD2 + "'";
		sql += " AND VVM_VIEW_CD3 = '" + VIEW_CD3 + "'";
		sql += " AND VVM_VIEW_CD4 = '" + VIEW_CD4 + "'";
		sql += " AND VVM_VIEW_CD5 = '" + VIEW_CD5 + "'";
		sql += " AND VVM_VIEW_CD6 = '" + VIEW_CD6 + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uVT1000Apply_ufSave_001 \n";
			G_INFO += "설명 : 코드값 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MARK_CLASS : " + MARK_CLASS + " \n";
			G_INFO += " VIEW_CD1 : " + VIEW_CD1 + " \n";
			G_INFO += " VIEW_CD2 : " + VIEW_CD2 + " \n";
			G_INFO += " VIEW_CD3 : " + VIEW_CD3 + " \n";
			G_INFO += " VIEW_CD4 : " + VIEW_CD4 + " \n";
			G_INFO += " VIEW_CD5 : " + VIEW_CD5 + " \n";
			G_INFO += " VIEW_CD6 : " + VIEW_CD6 + " \n";
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
		<s:AttributeType name='VVM_VIEW_NO' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String VVM_VIEW_NO_T = cRsList.getString("VVM_VIEW_NO");
%>
			<z:row
<%
			if(! VVM_VIEW_NO_T.equals("")) {
%>
		 		VVM_VIEW_NO='<%= VVM_VIEW_NO_T%>'
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
