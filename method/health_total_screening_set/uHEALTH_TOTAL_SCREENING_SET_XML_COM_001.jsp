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

SELECT * FROM HT_AUTO_PAN
WHERE 0 = 0
:sSQL_ADD
		*/

		sql = " SELECT *";
		sql += " FROM HT_AUTO_PAN";
		sql += " WHERE 0 = 0";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHEALTH_TOTAL_SCREENING_SET_XML_COM_001 \n";
			G_INFO += "설명 : 자동판정조회 (메뉴공통) \n";
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
		<s:AttributeType name='HAP_AUTO_CD' rs:number='1' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN' rs:basecolumn='HAP_AUTO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HAP_ORGA_CD' rs:number='2' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN' rs:basecolumn='HAP_ORGA_CD'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HAP_SEX_KD' rs:number='3' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN' rs:basecolumn='HAP_SEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HAP_RESULT' rs:number='4' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN' rs:basecolumn='HAP_RESULT'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HAP_APLT_DT' rs:number='5' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN' rs:basecolumn='HAP_APLT_DT'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HAP_KTITLE_NM' rs:number='6' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN' rs:basecolumn='HAP_KTITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HAP_ETITLE_NM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN'
			 rs:basecolumn='HAP_ETITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='HAP_CTITLE_NM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN'
			 rs:basecolumn='HAP_CTITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='HAP_JTITLE_NM' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN'
			 rs:basecolumn='HAP_JTITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='HAP_KSOCK_TX' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN'
			 rs:basecolumn='HAP_KSOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HAP_ESOCK_TX' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN'
			 rs:basecolumn='HAP_ESOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HAP_CSOCK_TX' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN'
			 rs:basecolumn='HAP_CSOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HAP_JSOCK_TX' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN'
			 rs:basecolumn='HAP_JSOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HAP_USE_YN' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN'
			 rs:basecolumn='HAP_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='15' rs:rowid='true' rs:writeunknown='true' rs:basetable='HT_AUTO_PAN'
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

			String HAP_AUTO_CD_T = cRsList.getString("HAP_AUTO_CD");
			String HAP_ORGA_CD_T = cRsList.getString("HAP_ORGA_CD");
			String HAP_SEX_KD_T = cRsList.getString("HAP_SEX_KD");
			String HAP_RESULT_T = cRsList.getString("HAP_RESULT");
			String HAP_APLT_DT_T = cRsList.getString("HAP_APLT_DT");
			String HAP_KTITLE_NM_T = cRsList.getString("HAP_KTITLE_NM");
			String HAP_ETITLE_NM_T = cRsList.getString("HAP_ETITLE_NM");
			String HAP_CTITLE_NM_T = cRsList.getString("HAP_CTITLE_NM");
			String HAP_JTITLE_NM_T = cRsList.getString("HAP_JTITLE_NM");
			String HAP_KSOCK_TX_T = cRsList.getString("HAP_KSOCK_TX");
			String HAP_ESOCK_TX_T = cRsList.getString("HAP_ESOCK_TX");
			String HAP_CSOCK_TX_T = cRsList.getString("HAP_CSOCK_TX");
			String HAP_JSOCK_TX_T = cRsList.getString("HAP_JSOCK_TX");
			String HAP_USE_YN_T = cRsList.getString("HAP_USE_YN");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! HAP_AUTO_CD_T.equals("")) {
%>
		 		HAP_AUTO_CD='<%= HAP_AUTO_CD_T%>'
<%
			}

			if(! HAP_ORGA_CD_T.equals("")) {
%>
		 		HAP_ORGA_CD='<%= HAP_ORGA_CD_T%>'
<%
			}

			if(! HAP_SEX_KD_T.equals("")) {
%>
		 		HAP_SEX_KD='<%= HAP_SEX_KD_T%>'
<%
			}

			if(! HAP_RESULT_T.equals("")) {
%>
		 		HAP_RESULT='<%= HAP_RESULT_T%>'
<%
			}

			if(! HAP_APLT_DT_T.equals("")) {
%>
		 		HAP_APLT_DT='<%= HAP_APLT_DT_T%>'
<%
			}

			if(! HAP_KTITLE_NM_T.equals("")) {
%>
		 		HAP_KTITLE_NM='<%= HAP_KTITLE_NM_T%>'
<%
			}

			if(! HAP_ETITLE_NM_T.equals("")) {
%>
		 		HAP_ETITLE_NM='<%= HAP_ETITLE_NM_T%>'
<%
			}

			if(! HAP_CTITLE_NM_T.equals("")) {
%>
		 		HAP_CTITLE_NM='<%= HAP_CTITLE_NM_T%>'
<%
			}

			if(! HAP_JTITLE_NM_T.equals("")) {
%>
		 		HAP_JTITLE_NM='<%= HAP_JTITLE_NM_T%>'
<%
			}

			if(! HAP_KSOCK_TX_T.equals("")) {
%>
		 		HAP_KSOCK_TX='<%= HAP_KSOCK_TX_T%>'
<%
			}

			if(! HAP_ESOCK_TX_T.equals("")) {
%>
		 		HAP_ESOCK_TX='<%= HAP_ESOCK_TX_T%>'
<%
			}

			if(! HAP_CSOCK_TX_T.equals("")) {
%>
		 		HAP_CSOCK_TX='<%= HAP_CSOCK_TX_T%>'
<%
			}

			if(! HAP_JSOCK_TX_T.equals("")) {
%>
		 		HAP_JSOCK_TX='<%= HAP_JSOCK_TX_T%>'
<%
			}

			if(! HAP_USE_YN_T.equals("")) {
%>
		 		HAP_USE_YN='<%= HAP_USE_YN_T%>'
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
