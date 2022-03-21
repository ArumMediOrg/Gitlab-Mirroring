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

SELECT * FROM IT_TICKET_COMP
WHERE 1 = 1
  :sSQL_ADD

		*/

		sql = " SELECT *";
		sql += " FROM IT_TICKET_COMP";
		sql += " WHERE 1 = 1";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Ticket_XML_COM_002 \n";
			G_INFO += "설명 : 검진권발급처조회 \n";
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
		<s:AttributeType name='ITC_COMP_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP' rs:basecolumn='ITC_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_COMP_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_TYPE1_YN' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_TYPE1_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_TYPE2_YN' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_TYPE2_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_TYPE3_YN' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_TYPE3_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_TYPE4_YN' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_TYPE4_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_TYPE5_YN' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_TYPE5_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_TYPE6_YN' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_TYPE6_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_TYPE7_YN' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_TYPE7_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_TYPE8_YN' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_TYPE8_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_TYPE9_YN' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_TYPE9_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_TYPE10_YN' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_TYPE10_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_TYPE11_YN' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_TYPE11_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_TYPE12_YN' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_TYPE12_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_INPT_ID' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_INPT_DTT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_MODI_ID' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_MODI_DTT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
			 rs:basecolumn='ITC_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='19' rs:rowid='true' rs:writeunknown='true' rs:basetable='IT_TICKET_COMP'
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

			String ITC_COMP_CD_T = cRsList.getString("ITC_COMP_CD");
			String ITC_COMP_NM_T = cRsList.getString("ITC_COMP_NM");
			String ITC_TYPE1_YN_T = cRsList.getString("ITC_TYPE1_YN");
			String ITC_TYPE2_YN_T = cRsList.getString("ITC_TYPE2_YN");
			String ITC_TYPE3_YN_T = cRsList.getString("ITC_TYPE3_YN");
			String ITC_TYPE4_YN_T = cRsList.getString("ITC_TYPE4_YN");
			String ITC_TYPE5_YN_T = cRsList.getString("ITC_TYPE5_YN");
			String ITC_TYPE6_YN_T = cRsList.getString("ITC_TYPE6_YN");
			String ITC_TYPE7_YN_T = cRsList.getString("ITC_TYPE7_YN");
			String ITC_TYPE8_YN_T = cRsList.getString("ITC_TYPE8_YN");
			String ITC_TYPE9_YN_T = cRsList.getString("ITC_TYPE9_YN");
			String ITC_TYPE10_YN_T = cRsList.getString("ITC_TYPE10_YN");
			String ITC_TYPE11_YN_T = cRsList.getString("ITC_TYPE11_YN");
			String ITC_TYPE12_YN_T = cRsList.getString("ITC_TYPE12_YN");
			String ITC_INPT_ID_T = cRsList.getString("ITC_INPT_ID");
			String ITC_INPT_DTT_T = cRsList.getDate2("ITC_INPT_DTT");
			String ITC_MODI_ID_T = cRsList.getString("ITC_MODI_ID");
			String ITC_MODI_DTT_T = cRsList.getDate2("ITC_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ITC_COMP_CD_T.equals("")) {
%>
		 		ITC_COMP_CD='<%= ITC_COMP_CD_T%>'
<%
			}

			if(! ITC_COMP_NM_T.equals("")) {
%>
		 		ITC_COMP_NM='<%= ITC_COMP_NM_T%>'
<%
			}

			if(! ITC_TYPE1_YN_T.equals("")) {
%>
		 		ITC_TYPE1_YN='<%= ITC_TYPE1_YN_T%>'
<%
			}

			if(! ITC_TYPE2_YN_T.equals("")) {
%>
		 		ITC_TYPE2_YN='<%= ITC_TYPE2_YN_T%>'
<%
			}

			if(! ITC_TYPE3_YN_T.equals("")) {
%>
		 		ITC_TYPE3_YN='<%= ITC_TYPE3_YN_T%>'
<%
			}

			if(! ITC_TYPE4_YN_T.equals("")) {
%>
		 		ITC_TYPE4_YN='<%= ITC_TYPE4_YN_T%>'
<%
			}

			if(! ITC_TYPE5_YN_T.equals("")) {
%>
		 		ITC_TYPE5_YN='<%= ITC_TYPE5_YN_T%>'
<%
			}

			if(! ITC_TYPE6_YN_T.equals("")) {
%>
		 		ITC_TYPE6_YN='<%= ITC_TYPE6_YN_T%>'
<%
			}

			if(! ITC_TYPE7_YN_T.equals("")) {
%>
		 		ITC_TYPE7_YN='<%= ITC_TYPE7_YN_T%>'
<%
			}

			if(! ITC_TYPE8_YN_T.equals("")) {
%>
		 		ITC_TYPE8_YN='<%= ITC_TYPE8_YN_T%>'
<%
			}

			if(! ITC_TYPE9_YN_T.equals("")) {
%>
		 		ITC_TYPE9_YN='<%= ITC_TYPE9_YN_T%>'
<%
			}

			if(! ITC_TYPE10_YN_T.equals("")) {
%>
		 		ITC_TYPE10_YN='<%= ITC_TYPE10_YN_T%>'
<%
			}

			if(! ITC_TYPE11_YN_T.equals("")) {
%>
		 		ITC_TYPE11_YN='<%= ITC_TYPE11_YN_T%>'
<%
			}

			if(! ITC_TYPE12_YN_T.equals("")) {
%>
		 		ITC_TYPE12_YN='<%= ITC_TYPE12_YN_T%>'
<%
			}

			if(! ITC_INPT_ID_T.equals("")) {
%>
		 		ITC_INPT_ID='<%= ITC_INPT_ID_T%>'
<%
			}

			if(! ITC_INPT_DTT_T.equals("")) {
%>
		 		ITC_INPT_DTT='<%= ITC_INPT_DTT_T%>'
<%
			}

			if(! ITC_MODI_ID_T.equals("")) {
%>
		 		ITC_MODI_ID='<%= ITC_MODI_ID_T%>'
<%
			}

			if(! ITC_MODI_DTT_T.equals("")) {
%>
		 		ITC_MODI_DTT='<%= ITC_MODI_DTT_T%>'
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
