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

		String GUID_KD = htMethod.get("GUID_KD");

		//
		if(GUID_KD == null) { GUID_KD = ""; }
		

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT * FROM CR_SMS_AUTO_SET ";
		sql += " WHERE CSA_SEND_KD = '7' ";
		sql += " And CSA_GUID_KD = '" + GUID_KD + "'";

		//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uCRM_BASIC_SMSMain_GridDisplay_003 \n";
		G_INFO += "설명 : SMS문구 Key 사용여부 조회 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " GUID_KD : " + GUID_KD + " \n";
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
		<s:AttributeType name='CSA_GUID_KD' rs:number='1' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_GUID_KD'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		
		<s:AttributeType name='CSA_GUID_NM' rs:number='2' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_GUID_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CSA_SEND_KD' rs:number='3' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_SEND_KD'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CSA_STAND_HH' rs:number='4' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_STAND_HH'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CSA_STAND_MM' rs:number='5' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_STAND_MM'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CSA_BEFOR_DT' rs:number='6' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_BEFOR_DT'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CSA_BEFOR_HH' rs:number='7' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_BEFOR_HH'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CSA_SEND_MSG' rs:number='8' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_SEND_MSG'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CSA_SEND_TEL' rs:number='9' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_SEND_TEL'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CSA_USE_YN' rs:number='10' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CSA_INPUT_ID' rs:number='11' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CSA_INPUT_DTT' rs:number='12' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_INPUT_DTT'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CSA_MODI_ID' rs:number='13' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CSA_MODI_DTT' rs:number='14' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_MODI_DTT'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CSA_TMPL_CD' rs:number='15' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_TMPL_CD'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		
		
		<s:AttributeType name='ROWID' rs:number='16' rs:rowid='true' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CSA_GUID_KD = cRsList.getString("CSA_GUID_KD");
			String CSA_GUID_NM = cRsList.getString("CSA_GUID_NM");
			String CSA_SEND_KD = cRsList.getString("CSA_SEND_KD");
			String CSA_STAND_HH = cRsList.getString("CSA_STAND_HH");
			String CSA_STAND_MM = cRsList.getString("CSA_STAND_MM");

			String CSA_BEFOR_DT = cRsList.getString("CSA_BEFOR_DT");
			String CSA_BEFOR_HH = cRsList.getString("CSA_BEFOR_HH");
			String CSA_SEND_MSG = cRsList.getString("CSA_SEND_MSG");
			String CSA_SEND_TEL = cRsList.getString("CSA_SEND_TEL");
			String CSA_USE_YN = cRsList.getString("CSA_USE_YN");

			String CSA_INPUT_ID = cRsList.getString("CSA_INPUT_ID");
			String CSA_INPUT_DTT = cRsList.getString("CSA_INPUT_DTT");
			String CSA_MODI_ID = cRsList.getString("CSA_MODI_ID");
			String CSA_MODI_DTT = cRsList.getString("CSA_MODI_DTT");
			String CSA_TMPL_CD = cRsList.getString("CSA_TMPL_CD");
			
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CSA_GUID_KD.equals("")) {
%>
		 		CSA_GUID_KD='<%= CSA_GUID_KD%>'
<%
			}

			if(! CSA_GUID_NM.equals("")) {
%>
		 		CSA_GUID_NM='<%= CSA_GUID_NM%>'
<%
			}

			if(! CSA_SEND_KD.equals("")) {
%>
		 		CSA_SEND_KD='<%= CSA_SEND_KD%>'
<%
			}

			if(! CSA_STAND_HH.equals("")) {
%>
				CSA_STAND_HH='<%= CSA_STAND_HH%>'
<%
			}
			
			if(! CSA_STAND_MM.equals("")) {
%>
				CSA_STAND_MM='<%= CSA_STAND_MM%>'
<%
			}
			
			if(! CSA_BEFOR_DT.equals("")) {
%>
				CSA_BEFOR_DT='<%= CSA_BEFOR_DT%>'
<%
			}

			
			if(! CSA_BEFOR_HH.equals("")) {
%>
				CSA_BEFOR_HH='<%= CSA_BEFOR_HH%>'
<%
			}

			
			if(! CSA_SEND_MSG.equals("")) {
%>
				CSA_SEND_MSG='<%= CSA_SEND_MSG%>'
<%
			}

			
			if(! CSA_SEND_TEL.equals("")) {
%>
				CSA_SEND_TEL='<%= CSA_SEND_TEL%>'
<%
			}

			
			if(! CSA_USE_YN.equals("")) {
%>
				CSA_USE_YN='<%= CSA_USE_YN%>'
<%
			}

			
			if(! CSA_INPUT_ID.equals("")) {
%>
				CSA_INPUT_ID='<%= CSA_INPUT_ID%>'
<%
			}

			
			if(! CSA_INPUT_DTT.equals("")) {
%>
				CSA_INPUT_DTT='<%= CSA_INPUT_DTT%>'
<%
			}

			
			if(! CSA_MODI_ID.equals("")) {
%>
				CSA_MODI_ID='<%= CSA_MODI_ID%>'
<%
			}

			
			if(! CSA_MODI_DTT.equals("")) {
%>
				CSA_MODI_DTT='<%= CSA_MODI_DTT%>'
<%
			}

			
			if(! CSA_TMPL_CD.equals("")) {
%>
				CSA_TMPL_CD='<%= CSA_TMPL_CD%>'
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
