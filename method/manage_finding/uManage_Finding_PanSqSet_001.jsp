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

		String LCODE = htMethod.get("LCODE");
		String CODE = htMethod.get("CODE");
		String PAN_CD = htMethod.get("PAN_CD");

		//
		if(LCODE == null) { LCODE = ""; }
		if(CODE == null) { CODE = ""; }
		if(PAN_CD == null) { PAN_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT Max(CCF_PAN_SQ) MAX_PAN_SQ
  FROM CT_COMM_FIRVIEW
 WHERE CCF_LCODE  = :LCODE 
   AND CCF_CODE   = :CODE  
   AND CCF_PAN_CD = :PAN_CD
		*/

		sql = " SELECT MAX(CCF_PAN_SQ) MAX_PAN_SQ";
		sql += " FROM CT_COMM_FIRVIEW";
		sql += " WHERE CCF_LCODE = '" + LCODE + "'";
		sql += " AND CCF_CODE = '" + CODE + "'";
		sql += " AND CCF_PAN_CD = '" + PAN_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uManage_Finding_PanSqSet_001 \n";
			G_INFO += "설명 : 1차판정 키값 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " LCODE : " + LCODE + " \n";
			G_INFO += " CODE : " + CODE + " \n";
			G_INFO += " PAN_CD : " + PAN_CD + " \n";
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
		<s:AttributeType name='MAX_PAN_SQ' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String MAX_PAN_SQ_T = cRsList.getString("MAX_PAN_SQ");
%>
			<z:row
<%
			if(! MAX_PAN_SQ_T.equals("")) {
%>
		 		MAX_PAN_SQ='<%= MAX_PAN_SQ_T%>'
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
