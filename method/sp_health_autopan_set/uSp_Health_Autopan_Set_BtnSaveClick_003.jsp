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
		String SBCD_CD = htMethod.get("SBCD_CD");

		//
		if(AUTO_CD == null) { AUTO_CD = ""; }
		if(SBCD_CD == null) { SBCD_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select * From SP_AUTO_PANITEM                                                   
 Where SPA_AUTO_CD = :AUTO_CD
   And SPA_SBCD_CD = :SBCD_CD

		*/

		sql = " SELECT *";
		sql += " FROM SP_AUTO_PANITEM";
		sql += " WHERE SPA_AUTO_CD = '" + AUTO_CD + "'";
		sql += " AND SPA_SBCD_CD = '" + SBCD_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSp_Health_Autopan_Set_BtnSaveClick_003 \n";
			G_INFO += "설명 : 특검 자동판정 검사항목로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " AUTO_CD : " + AUTO_CD + " \n";
			G_INFO += " SBCD_CD : " + SBCD_CD + " \n";
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
		<s:AttributeType name='SPA_AUTO_CD' rs:number='1' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM' rs:basecolumn='SPA_AUTO_CD'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_ORGA_CD' rs:number='2' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM' rs:basecolumn='SPA_ORGA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_SBCD_CD' rs:number='3' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM' rs:basecolumn='SPA_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_MRSLT_LOW' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM'
			 rs:basecolumn='SPA_MRSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_MRSLT_HIGH' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM'
			 rs:basecolumn='SPA_MRSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_WRSLT_LOW' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM'
			 rs:basecolumn='SPA_WRSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_WRSLT_HIGH' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM'
			 rs:basecolumn='SPA_WRSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_CHAR_VAL' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM'
			 rs:basecolumn='SPA_CHAR_VAL'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_USE_YN' rs:number='9' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM' rs:basecolumn='SPA_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_INPT_ID' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM'
			 rs:basecolumn='SPA_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_INPT_DTT' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM'
			 rs:basecolumn='SPA_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_MODI_ID' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM'
			 rs:basecolumn='SPA_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_MODI_DTT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM'
			 rs:basecolumn='SPA_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='14' rs:rowid='true' rs:writeunknown='true' rs:basetable='SP_AUTO_PANITEM'
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
			String SPA_SBCD_CD_T = cRsList.getString("SPA_SBCD_CD");
			String SPA_MRSLT_LOW_T = cRsList.getString("SPA_MRSLT_LOW");
			String SPA_MRSLT_HIGH_T = cRsList.getString("SPA_MRSLT_HIGH");
			String SPA_WRSLT_LOW_T = cRsList.getString("SPA_WRSLT_LOW");
			String SPA_WRSLT_HIGH_T = cRsList.getString("SPA_WRSLT_HIGH");
			String SPA_CHAR_VAL_T = cRsList.getString("SPA_CHAR_VAL");
			String SPA_USE_YN_T = cRsList.getString("SPA_USE_YN");
			String SPA_INPT_ID_T = cRsList.getString("SPA_INPT_ID");
			String SPA_INPT_DTT_T = cRsList.getDate2("SPA_INPT_DTT");
			String SPA_MODI_ID_T = cRsList.getString("SPA_MODI_ID");
			String SPA_MODI_DTT_T = cRsList.getDate2("SPA_MODI_DTT");
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

			if(! SPA_SBCD_CD_T.equals("")) {
%>
		 		SPA_SBCD_CD='<%= SPA_SBCD_CD_T%>'
<%
			}

			if(! SPA_MRSLT_LOW_T.equals("")) {
%>
		 		SPA_MRSLT_LOW='<%= SPA_MRSLT_LOW_T%>'
<%
			}

			if(! SPA_MRSLT_HIGH_T.equals("")) {
%>
		 		SPA_MRSLT_HIGH='<%= SPA_MRSLT_HIGH_T%>'
<%
			}

			if(! SPA_WRSLT_LOW_T.equals("")) {
%>
		 		SPA_WRSLT_LOW='<%= SPA_WRSLT_LOW_T%>'
<%
			}

			if(! SPA_WRSLT_HIGH_T.equals("")) {
%>
		 		SPA_WRSLT_HIGH='<%= SPA_WRSLT_HIGH_T%>'
<%
			}

			if(! SPA_CHAR_VAL_T.equals("")) {
%>
		 		SPA_CHAR_VAL='<%= SPA_CHAR_VAL_T%>'
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
