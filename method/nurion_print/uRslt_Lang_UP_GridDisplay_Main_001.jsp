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

		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 SELECT * FROM CT_RSLT_LANG
 Where 1 = 1
|| :sSQL_ADD
		*/

		sql = " SELECT *";
		sql += " FROM CT_RSLT_LANG";
		sql += " WHERE 1 = 1";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRslt_Lang_UP_GridDisplay_Main_001 \n";
			G_INFO += "설명 : 다국어 셋팅 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
		<s:AttributeType name='CRL_SEQ' rs:number='1' rs:writeunknown='true' rs:basetable='CT_RSLT_LANG' rs:basecolumn='CRL_SEQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CRL_KNME' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_RSLT_LANG'
			 rs:basecolumn='CRL_KNME'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CRL_ENME' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_RSLT_LANG'
			 rs:basecolumn='CRL_ENME'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CRL_CNME' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_RSLT_LANG'
			 rs:basecolumn='CRL_CNME'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CRL_JNME' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_RSLT_LANG'
			 rs:basecolumn='CRL_JNME'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CRL_INPT_ID' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_RSLT_LANG'
			 rs:basecolumn='CRL_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='CRL_INPT_DTT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_RSLT_LANG'
			 rs:basecolumn='CRL_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CRL_MODI_ID' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_RSLT_LANG'
			 rs:basecolumn='CRL_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='CRL_MODI_DTT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_RSLT_LANG'
			 rs:basecolumn='CRL_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CRL_RNME' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_RSLT_LANG'
			 rs:basecolumn='CRL_RNME'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='11' rs:rowid='true' rs:writeunknown='true' rs:basetable='CT_RSLT_LANG'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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

			String CRL_SEQ_T = cRsList.getString("CRL_SEQ");
			String CRL_KNME_T = cRsList.getString("CRL_KNME");
			String CRL_ENME_T = cRsList.getString("CRL_ENME");
			String CRL_CNME_T = cRsList.getString("CRL_CNME");
			String CRL_JNME_T = cRsList.getString("CRL_JNME");
			String CRL_INPT_ID_T = cRsList.getString("CRL_INPT_ID");
			String CRL_INPT_DTT_T = cRsList.getDate2("CRL_INPT_DTT");
			String CRL_MODI_ID_T = cRsList.getString("CRL_MODI_ID");
			String CRL_MODI_DTT_T = cRsList.getDate2("CRL_MODI_DTT");
			String CRL_RNME_T = cRsList.getString("CRL_RNME");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CRL_SEQ_T.equals("")) {
%>
		 		CRL_SEQ='<%= CRL_SEQ_T%>'
<%
			}

			if(! CRL_KNME_T.equals("")) {
%>
		 		CRL_KNME='<%= CRL_KNME_T%>'
<%
			}

			if(! CRL_ENME_T.equals("")) {
%>
		 		CRL_ENME='<%= CRL_ENME_T%>'
<%
			}

			if(! CRL_CNME_T.equals("")) {
%>
		 		CRL_CNME='<%= CRL_CNME_T%>'
<%
			}

			if(! CRL_JNME_T.equals("")) {
%>
		 		CRL_JNME='<%= CRL_JNME_T%>'
<%
			}

			if(! CRL_INPT_ID_T.equals("")) {
%>
		 		CRL_INPT_ID='<%= CRL_INPT_ID_T%>'
<%
			}

			if(! CRL_INPT_DTT_T.equals("")) {
%>
		 		CRL_INPT_DTT='<%= CRL_INPT_DTT_T%>'
<%
			}

			if(! CRL_MODI_ID_T.equals("")) {
%>
		 		CRL_MODI_ID='<%= CRL_MODI_ID_T%>'
<%
			}

			if(! CRL_MODI_DTT_T.equals("")) {
%>
		 		CRL_MODI_DTT='<%= CRL_MODI_DTT_T%>'
<%
			}

			if(! CRL_RNME_T.equals("")) {
%>
		 		CRL_RNME='<%= CRL_RNME_T%>'
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
