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

		String AUTO_CD = htMethod.get("AUTO_CD");

		//
		if(AUTO_CD == null) { AUTO_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM SP_AUTO_PAN 
 WHERE SPA_AUTO_CD =  :AUTO_CD
                           

		*/

		sql = " SELECT *";
		sql += " FROM SP_AUTO_PAN";
		sql += " WHERE SPA_AUTO_CD = '" + AUTO_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSp_Health_Autopan_Set_BtnDeleteClick_001 \n";
			G_INFO += "설명 : 특검 자동판정 정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " AUTO_CD : " + AUTO_CD + " \n";
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
		<s:AttributeType name='SPA_AUTO_CD' rs:number='1' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN' rs:basecolumn='SPA_AUTO_CD'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_ORGA_CD' rs:number='2' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN' rs:basecolumn='SPA_ORGA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_SOKY_CD' rs:number='3' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN' rs:basecolumn='SPA_SOKY_CD'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_JOCH_CD' rs:number='4' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN' rs:basecolumn='SPA_JOCH_CD'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_SOKY_TX' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_SOKY_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_JOCH_TX' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_JOCH_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_PANJ_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_PANJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_ORSU_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_ORSU_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_SADD_TX' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_SADD_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_BUSI_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_BUSI_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_POSM1_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_POSM1_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_POSM2_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_POSM2_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_POSM3_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_POSM3_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_BIGO_TX' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_BIGO_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_SPCL_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_USE_YN' rs:number='16' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN' rs:basecolumn='SPA_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_INPT_ID' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_INPT_DTT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_MODI_ID' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_MODI_DTT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_SWING_CD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
			 rs:basecolumn='SPA_SWING_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='22' rs:rowid='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PAN'
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

			String SPA_AUTO_CD_T = cRsList.getString("SPA_AUTO_CD");
			String SPA_ORGA_CD_T = cRsList.getString("SPA_ORGA_CD");
			String SPA_SOKY_CD_T = cRsList.getString("SPA_SOKY_CD");
			String SPA_JOCH_CD_T = cRsList.getString("SPA_JOCH_CD");
			String SPA_SOKY_TX_T = cRsList.getString("SPA_SOKY_TX");
			String SPA_JOCH_TX_T = cRsList.getString("SPA_JOCH_TX");
			String SPA_PANJ_CD_T = cRsList.getString("SPA_PANJ_CD");
			String SPA_ORSU_CD_T = cRsList.getString("SPA_ORSU_CD");
			String SPA_SADD_TX_T = cRsList.getString("SPA_SADD_TX");
			String SPA_BUSI_CD_T = cRsList.getString("SPA_BUSI_CD");
			String SPA_POSM1_CD_T = cRsList.getString("SPA_POSM1_CD");
			String SPA_POSM2_CD_T = cRsList.getString("SPA_POSM2_CD");
			String SPA_POSM3_CD_T = cRsList.getString("SPA_POSM3_CD");
			String SPA_BIGO_TX_T = cRsList.getString("SPA_BIGO_TX");
			String SPA_SPCL_CD_T = cRsList.getString("SPA_SPCL_CD");
			String SPA_USE_YN_T = cRsList.getString("SPA_USE_YN");
			String SPA_INPT_ID_T = cRsList.getString("SPA_INPT_ID");
			String SPA_INPT_DTT_T = cRsList.getDate2("SPA_INPT_DTT");
			String SPA_MODI_ID_T = cRsList.getString("SPA_MODI_ID");
			String SPA_MODI_DTT_T = cRsList.getDate2("SPA_MODI_DTT");
			String SPA_SWING_CD_T = cRsList.getString("SPA_SWING_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! SPA_AUTO_CD_T.equals("")) {
%>
		 		SPA_AUTO_CD='<%= SPA_AUTO_CD_T%>'
<%
			}

			if(! SPA_ORGA_CD_T.equals("")) {
%>
		 		SPA_ORGA_CD='<%= SPA_ORGA_CD_T%>'
<%
			}

			if(! SPA_SOKY_CD_T.equals("")) {
%>
		 		SPA_SOKY_CD='<%= SPA_SOKY_CD_T%>'
<%
			}

			if(! SPA_JOCH_CD_T.equals("")) {
%>
		 		SPA_JOCH_CD='<%= SPA_JOCH_CD_T%>'
<%
			}

			if(! SPA_SOKY_TX_T.equals("")) {
%>
		 		SPA_SOKY_TX='<%= SPA_SOKY_TX_T%>'
<%
			}

			if(! SPA_JOCH_TX_T.equals("")) {
%>
		 		SPA_JOCH_TX='<%= SPA_JOCH_TX_T%>'
<%
			}

			if(! SPA_PANJ_CD_T.equals("")) {
%>
		 		SPA_PANJ_CD='<%= SPA_PANJ_CD_T%>'
<%
			}

			if(! SPA_ORSU_CD_T.equals("")) {
%>
		 		SPA_ORSU_CD='<%= SPA_ORSU_CD_T%>'
<%
			}

			if(! SPA_SADD_TX_T.equals("")) {
%>
		 		SPA_SADD_TX='<%= SPA_SADD_TX_T%>'
<%
			}

			if(! SPA_BUSI_CD_T.equals("")) {
%>
		 		SPA_BUSI_CD='<%= SPA_BUSI_CD_T%>'
<%
			}

			if(! SPA_POSM1_CD_T.equals("")) {
%>
		 		SPA_POSM1_CD='<%= SPA_POSM1_CD_T%>'
<%
			}

			if(! SPA_POSM2_CD_T.equals("")) {
%>
		 		SPA_POSM2_CD='<%= SPA_POSM2_CD_T%>'
<%
			}

			if(! SPA_POSM3_CD_T.equals("")) {
%>
		 		SPA_POSM3_CD='<%= SPA_POSM3_CD_T%>'
<%
			}

			if(! SPA_BIGO_TX_T.equals("")) {
%>
		 		SPA_BIGO_TX='<%= SPA_BIGO_TX_T%>'
<%
			}

			if(! SPA_SPCL_CD_T.equals("")) {
%>
		 		SPA_SPCL_CD='<%= SPA_SPCL_CD_T%>'
<%
			}

			if(! SPA_USE_YN_T.equals("")) {
%>
		 		SPA_USE_YN='<%= SPA_USE_YN_T%>'
<%
			}

			if(! SPA_INPT_ID_T.equals("")) {
%>
		 		SPA_INPT_ID='<%= SPA_INPT_ID_T%>'
<%
			}

			if(! SPA_INPT_DTT_T.equals("")) {
%>
		 		SPA_INPT_DTT='<%= SPA_INPT_DTT_T%>'
<%
			}

			if(! SPA_MODI_ID_T.equals("")) {
%>
		 		SPA_MODI_ID='<%= SPA_MODI_ID_T%>'
<%
			}

			if(! SPA_MODI_DTT_T.equals("")) {
%>
		 		SPA_MODI_DTT='<%= SPA_MODI_DTT_T%>'
<%
			}

			if(! SPA_SWING_CD_T.equals("")) {
%>
		 		SPA_SWING_CD='<%= SPA_SWING_CD_T%>'
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
