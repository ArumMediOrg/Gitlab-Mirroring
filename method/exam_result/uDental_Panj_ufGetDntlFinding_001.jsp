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

		String MACH_CD = htMethod.get("MACH_CD");
		String MACH_SQ = htMethod.get("MACH_SQ");

		//
		if(MACH_CD == null) { MACH_CD = ""; }
		if(MACH_SQ == null) { MACH_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CCP_MACH_CD, CCP_MACH_SQ, CCP_MACH_NM, CCP_SOKUN_TX
  FROM CT_COMM_PANJ
 WHERE CCP_GUBN_CD = '400'
   AND CCP_MACH_CD = :MACH_CD
   AND CCP_MACH_SQ = :MACH_SQ
		*/

		sql = " SELECT CCP_MACH_CD, CCP_MACH_SQ, CCP_MACH_NM, CCP_SOKUN_TX";
		sql += " FROM CT_COMM_PANJ";
		sql += " WHERE CCP_GUBN_CD = '400'";
		sql += " AND CCP_MACH_CD = '" + MACH_CD + "'";
		sql += " AND CCP_MACH_SQ = '" + MACH_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDental_Panj_ufGetDntlFinding_001 \n";
			G_INFO += "설명 : 구강판정(소견조회) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MACH_CD : " + MACH_CD + " \n";
			G_INFO += " MACH_SQ : " + MACH_SQ + " \n";
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
		<s:AttributeType name='CCP_MACH_CD' rs:number='1' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ' rs:basecolumn='CCP_MACH_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_MACH_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ' rs:basecolumn='CCP_MACH_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_MACH_NM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_MACH_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_SOKUN_TX' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_SOKUN_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='CT_COMM_PANJ' rs:basecolumn='ROWID'
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

			String CCP_MACH_CD_T = cRsList.getString("CCP_MACH_CD");
			String CCP_MACH_SQ_T = cRsList.getString("CCP_MACH_SQ");
			String CCP_MACH_NM_T = cRsList.getString("CCP_MACH_NM");
			String CCP_SOKUN_TX_T = cRsList.getString("CCP_SOKUN_TX");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CCP_MACH_CD_T.equals("")) {
%>
		 		CCP_MACH_CD='<%= CCP_MACH_CD_T%>'
<%
			}

			if(! CCP_MACH_SQ_T.equals("")) {
%>
		 		CCP_MACH_SQ='<%= CCP_MACH_SQ_T%>'
<%
			}

			if(! CCP_MACH_NM_T.equals("")) {
%>
		 		CCP_MACH_NM='<%= CCP_MACH_NM_T%>'
<%
			}

			if(! CCP_SOKUN_TX_T.equals("")) {
%>
		 		CCP_SOKUN_TX='<%= CCP_SOKUN_TX_T%>'
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
