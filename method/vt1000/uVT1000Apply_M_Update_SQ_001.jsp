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

		String DEV_CD = htMethod.get("DEV_CD");
		String FIND_CD = htMethod.get("FIND_CD");
		String DISE_CD = htMethod.get("DISE_CD");

		//
		if(DEV_CD == null) { DEV_CD = ""; }
		if(FIND_CD == null) { FIND_CD = ""; }
		if(DISE_CD == null) { DISE_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IDR_RSLT_CD, IDR_DEV_CD, IDR_FIND_CD, IDR_DISE_CD, IDR_ORDR_SQ, IDR_TITL_NM 
FROM IT_DEV_RSLT                                                                   
WHERE IDR_DEV_CD = :DEV_CD 
AND IDR_FIND_CD = :FIND_CD
AND IDR_DISE_CD = :DISE_CD

		*/

		sql = " SELECT IDR_RSLT_CD, IDR_DEV_CD, IDR_FIND_CD, IDR_DISE_CD, IDR_ORDR_SQ, IDR_TITL_NM";
		sql += " FROM IT_DEV_RSLT";
		sql += " WHERE IDR_DEV_CD = '" + DEV_CD + "'";
		sql += " AND IDR_FIND_CD = '" + FIND_CD + "'";
		sql += " AND IDR_DISE_CD = '" + DISE_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uVT1000Apply_M_Update_SQ_001 \n";
			G_INFO += "설명 : 결과 소견코드정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DEV_CD : " + DEV_CD + " \n";
			G_INFO += " FIND_CD : " + FIND_CD + " \n";
			G_INFO += " DISE_CD : " + DISE_CD + " \n";
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
		<s:AttributeType name='IDR_RSLT_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT' rs:basecolumn='IDR_RSLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_DEV_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_DEV_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_FIND_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_FIND_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_DISE_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_DISE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_ORDR_SQ' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_ORDR_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_TITL_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_TITL_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='IT_DEV_RSLT' rs:basecolumn='ROWID'
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

			String IDR_RSLT_CD_T = cRsList.getString("IDR_RSLT_CD");
			String IDR_DEV_CD_T = cRsList.getString("IDR_DEV_CD");
			String IDR_FIND_CD_T = cRsList.getString("IDR_FIND_CD");
			String IDR_DISE_CD_T = cRsList.getString("IDR_DISE_CD");
			String IDR_ORDR_SQ_T = cRsList.getString("IDR_ORDR_SQ");
			String IDR_TITL_NM_T = cRsList.getString("IDR_TITL_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IDR_RSLT_CD_T.equals("")) {
%>
		 		IDR_RSLT_CD='<%= IDR_RSLT_CD_T%>'
<%
			}

			if(! IDR_DEV_CD_T.equals("")) {
%>
		 		IDR_DEV_CD='<%= IDR_DEV_CD_T%>'
<%
			}

			if(! IDR_FIND_CD_T.equals("")) {
%>
		 		IDR_FIND_CD='<%= IDR_FIND_CD_T%>'
<%
			}

			if(! IDR_DISE_CD_T.equals("")) {
%>
		 		IDR_DISE_CD='<%= IDR_DISE_CD_T%>'
<%
			}

			if(! IDR_ORDR_SQ_T.equals("")) {
%>
		 		IDR_ORDR_SQ='<%= IDR_ORDR_SQ_T%>'
<%
			}

			if(! IDR_TITL_NM_T.equals("")) {
%>
		 		IDR_TITL_NM='<%= IDR_TITL_NM_T%>'
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
