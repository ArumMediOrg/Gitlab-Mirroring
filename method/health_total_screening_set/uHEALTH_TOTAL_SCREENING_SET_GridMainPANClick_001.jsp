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

		String PANJ_CD = htMethod.get("PANJ_CD");

		//
		if(PANJ_CD == null) { PANJ_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT DISTINCT A.*, B.IIM_SNME_NM, B.IIM_ITEM_CD, B.IIM_TRTP_CD
From HT_AUTO_PANITEM A
Inner Join IT_ITEM B On B.IIM_ITEM_CD = A.HAI_ITEM_CD
 Where A.HAI_PANJ_CD = :PANJ_CD
 Order By B.IIM_ITEM_CD
		*/

		sql = " SELECT DISTINCT A.*, B.IIM_SNME_NM, B.IIM_ITEM_CD, B.IIM_TRTP_CD";
		sql += " FROM HT_AUTO_PANITEM A INNER JOIN IT_ITEM B";
		sql += " ON B.IIM_ITEM_CD = A.HAI_ITEM_CD";
		sql += " WHERE A.HAI_PANJ_CD = '" + PANJ_CD + "'";
		sql += " ORDER BY B.IIM_ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHEALTH_TOTAL_SCREENING_SET_GridMainPANClick_001 \n";
			G_INFO += "설명 : 자동판정아이템조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PANJ_CD : " + PANJ_CD + " \n";
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
		<s:AttributeType name='HAI_PANJ_CD' rs:number='1' rs:basetable='HT_AUTO_PANITEM' rs:basecolumn='HAI_PANJ_CD'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HAI_ITEM_CD' rs:number='2' rs:basetable='HT_AUTO_PANITEM' rs:basecolumn='HAI_ITEM_CD'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HAI_MRSLT_LOW' rs:number='3' rs:basetable='HT_AUTO_PANITEM' rs:basecolumn='HAI_MRSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HAI_MRSLT_HIGH' rs:number='4' rs:basetable='HT_AUTO_PANITEM' rs:basecolumn='HAI_MRSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HAI_WRSLT_LOW' rs:number='5' rs:basetable='HT_AUTO_PANITEM' rs:basecolumn='HAI_WRSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HAI_WRSLT_HIGH' rs:number='6' rs:basetable='HT_AUTO_PANITEM' rs:basecolumn='HAI_WRSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HAI_CHAR_VAL' rs:number='7' rs:nullable='true' rs:basetable='HT_AUTO_PANITEM' rs:basecolumn='HAI_CHAR_VAL'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SNME_NM' rs:number='8' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_SNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ITEM_CD' rs:number='9' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='10' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_TRTP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String HAI_PANJ_CD_T = cRsList.getString("HAI_PANJ_CD");
			String HAI_ITEM_CD_T = cRsList.getString("HAI_ITEM_CD");
			String HAI_MRSLT_LOW_T = cRsList.getString("HAI_MRSLT_LOW");
			String HAI_MRSLT_HIGH_T = cRsList.getString("HAI_MRSLT_HIGH");
			String HAI_WRSLT_LOW_T = cRsList.getString("HAI_WRSLT_LOW");
			String HAI_WRSLT_HIGH_T = cRsList.getString("HAI_WRSLT_HIGH");
			String HAI_CHAR_VAL_T = cRsList.getString("HAI_CHAR_VAL");
			String IIM_SNME_NM_T = cRsList.getString("IIM_SNME_NM");
			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String IIM_TRTP_CD_T = cRsList.getString("IIM_TRTP_CD");
%>
			<z:row
<%
			if(! HAI_PANJ_CD_T.equals("")) {
%>
		 		HAI_PANJ_CD='<%= HAI_PANJ_CD_T%>'
<%
			}

			if(! HAI_ITEM_CD_T.equals("")) {
%>
		 		HAI_ITEM_CD='<%= HAI_ITEM_CD_T%>'
<%
			}

			if(! HAI_MRSLT_LOW_T.equals("")) {
%>
		 		HAI_MRSLT_LOW='<%= HAI_MRSLT_LOW_T%>'
<%
			}

			if(! HAI_MRSLT_HIGH_T.equals("")) {
%>
		 		HAI_MRSLT_HIGH='<%= HAI_MRSLT_HIGH_T%>'
<%
			}

			if(! HAI_WRSLT_LOW_T.equals("")) {
%>
		 		HAI_WRSLT_LOW='<%= HAI_WRSLT_LOW_T%>'
<%
			}

			if(! HAI_WRSLT_HIGH_T.equals("")) {
%>
		 		HAI_WRSLT_HIGH='<%= HAI_WRSLT_HIGH_T%>'
<%
			}

			if(! HAI_CHAR_VAL_T.equals("")) {
%>
		 		HAI_CHAR_VAL='<%= HAI_CHAR_VAL_T%>'
<%
			}

			if(! IIM_SNME_NM_T.equals("")) {
%>
		 		IIM_SNME_NM='<%= IIM_SNME_NM_T%>'
<%
			}

			if(! IIM_ITEM_CD_T.equals("")) {
%>
		 		IIM_ITEM_CD='<%= IIM_ITEM_CD_T%>'
<%
			}

			if(! IIM_TRTP_CD_T.equals("")) {
%>
		 		IIM_TRTP_CD='<%= IIM_TRTP_CD_T%>'
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
