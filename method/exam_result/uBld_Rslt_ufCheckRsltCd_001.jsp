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

		String ITEM_CD = htMethod.get("ITEM_CD");
		String RSLT_VL = htMethod.get("RSLT_VL");

		//
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(RSLT_VL == null) { RSLT_VL = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IIR_HEEX_CD, IIR_SPEX_CD
  FROM IT_ITEM_RESULT
 WHERE IIR_ITEM_CD = :ITEM_CD
   AND UPPER(IIR_RSLT_VL) = :RSLT_VL
   AND IIR_RSLT_KD = '2'    
		*/

		sql = " SELECT IIR_HEEX_CD, IIR_SPEX_CD";
		sql += " FROM IT_ITEM_RESULT";
		sql += " WHERE IIR_ITEM_CD = '" + ITEM_CD + "'";
		sql += " AND UPPER(IIR_RSLT_VL) = '" + RSLT_VL + "'";
		sql += " AND IIR_RSLT_KD = '2'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBld_Rslt_ufCheckRsltCd_001 \n";
			G_INFO += "설명 : 검진결과 코드조회(일검,특검) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " RSLT_VL : " + RSLT_VL + " \n";
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
		<s:AttributeType name='IIR_HEEX_CD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
			 rs:basecolumn='IIR_HEEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIR_SPEX_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
			 rs:basecolumn='IIR_SPEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='IT_ITEM_RESULT' rs:basecolumn='ROWID'
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

			String IIR_HEEX_CD_T = cRsList.getString("IIR_HEEX_CD");
			String IIR_SPEX_CD_T = cRsList.getString("IIR_SPEX_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IIR_HEEX_CD_T.equals("")) {
%>
		 		IIR_HEEX_CD='<%= IIR_HEEX_CD_T%>'
<%
			}

			if(! IIR_SPEX_CD_T.equals("")) {
%>
		 		IIR_SPEX_CD='<%= IIR_SPEX_CD_T%>'
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
