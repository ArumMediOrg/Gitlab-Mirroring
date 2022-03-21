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

		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.IIM_KNME_NM AS ECA_ITEM_NM, A.*
  FROM ET_COMP_AGEA A INNER JOIN IT_ITEM B ON A.ECA_ITEM_CD = B.IIM_ITEM_CD
 WHERE A.ECA_COMP_CD = :COMP_CD
   AND A.ECA_MNGT_YR = :MNGT_YR
		*/

		sql = " SELECT B.IIM_KNME_NM AS ECA_ITEM_NM, A.*";
		sql += " FROM ET_COMP_AGEA A INNER JOIN IT_ITEM B";
		sql += " ON A.ECA_ITEM_CD = B.IIM_ITEM_CD";
		sql += " WHERE A.ECA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.ECA_MNGT_YR = '" + MNGT_YR + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_AGEA_dsET_COMP_AGEADataChange_001 \n";
			G_INFO += "설명 : 계약단가 내역 조회(특정항목) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
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
		<s:AttributeType name='ECA_ITEM_NM' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_COMP_CD' rs:number='2' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA' rs:basecolumn='ECA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_MNGT_YR' rs:number='3' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA' rs:basecolumn='ECA_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_AGEA_KD' rs:number='4' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA' rs:basecolumn='ECA_AGEA_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_ITEM_CD' rs:number='5' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA' rs:basecolumn='ECA_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_AGEA_PR' rs:number='6' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA' rs:basecolumn='ECA_AGEA_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_ITEM_PR' rs:number='7' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA' rs:basecolumn='ECA_ITEM_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_REF1_NM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA'
			 rs:basecolumn='ECA_REF1_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_REF1_TX' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA'
			 rs:basecolumn='ECA_REF1_TX'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_USE_YN' rs:number='10' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA' rs:basecolumn='ECA_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_NUSE_ID' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA'
			 rs:basecolumn='ECA_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_NUSE_DTT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA'
			 rs:basecolumn='ECA_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_INPT_ID' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA'
			 rs:basecolumn='ECA_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_INPT_DTT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA'
			 rs:basecolumn='ECA_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_MODI_ID' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA'
			 rs:basecolumn='ECA_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_MODI_DTT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA'
			 rs:basecolumn='ECA_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_TRNS_ID' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA'
			 rs:basecolumn='ECA_TRNS_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_TRNS_DTT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_AGEA'
			 rs:basecolumn='ECA_TRNS_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='19' rs:rowid='true' rs:basetable='ET_COMP_AGEA' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c19' rs:name='ROWID' rs:number='20' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
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

			String ECA_ITEM_NM_T = cRsList.getString("ECA_ITEM_NM");
			String ECA_COMP_CD_T = cRsList.getString("ECA_COMP_CD");
			String ECA_MNGT_YR_T = cRsList.getString("ECA_MNGT_YR");
			String ECA_AGEA_KD_T = cRsList.getString("ECA_AGEA_KD");
			String ECA_ITEM_CD_T = cRsList.getString("ECA_ITEM_CD");
			String ECA_AGEA_PR_T = cRsList.getString("ECA_AGEA_PR");
			String ECA_ITEM_PR_T = cRsList.getString("ECA_ITEM_PR");
			String ECA_REF1_NM_T = cRsList.getString("ECA_REF1_NM");
			String ECA_REF1_TX_T = cRsList.getString("ECA_REF1_TX");
			String ECA_USE_YN_T = cRsList.getString("ECA_USE_YN");
			String ECA_NUSE_ID_T = cRsList.getString("ECA_NUSE_ID");
			String ECA_NUSE_DTT_T = cRsList.getDate2("ECA_NUSE_DTT");
			String ECA_INPT_ID_T = cRsList.getString("ECA_INPT_ID");
			String ECA_INPT_DTT_T = cRsList.getDate2("ECA_INPT_DTT");
			String ECA_MODI_ID_T = cRsList.getString("ECA_MODI_ID");
			String ECA_MODI_DTT_T = cRsList.getDate2("ECA_MODI_DTT");
			String ECA_TRNS_ID_T = cRsList.getString("ECA_TRNS_ID");
			String ECA_TRNS_DTT_T = cRsList.getDate2("ECA_TRNS_DTT");
			String ROWID_T = cRsList.getString("ROWID");
			String c19_T = cRsList.getString("c19");
%>
			<z:row
<%
			if(! ECA_ITEM_NM_T.equals("")) {
%>
		 		ECA_ITEM_NM='<%= ECA_ITEM_NM_T%>'
<%
			}

			if(! ECA_COMP_CD_T.equals("")) {
%>
		 		ECA_COMP_CD='<%= ECA_COMP_CD_T%>'
<%
			}

			if(! ECA_MNGT_YR_T.equals("")) {
%>
		 		ECA_MNGT_YR='<%= ECA_MNGT_YR_T%>'
<%
			}

			if(! ECA_AGEA_KD_T.equals("")) {
%>
		 		ECA_AGEA_KD='<%= ECA_AGEA_KD_T%>'
<%
			}

			if(! ECA_ITEM_CD_T.equals("")) {
%>
		 		ECA_ITEM_CD='<%= ECA_ITEM_CD_T%>'
<%
			}

			if(! ECA_AGEA_PR_T.equals("")) {
%>
		 		ECA_AGEA_PR='<%= ECA_AGEA_PR_T%>'
<%
			}

			if(! ECA_ITEM_PR_T.equals("")) {
%>
		 		ECA_ITEM_PR='<%= ECA_ITEM_PR_T%>'
<%
			}

			if(! ECA_REF1_NM_T.equals("")) {
%>
		 		ECA_REF1_NM='<%= ECA_REF1_NM_T%>'
<%
			}

			if(! ECA_REF1_TX_T.equals("")) {
%>
		 		ECA_REF1_TX='<%= ECA_REF1_TX_T%>'
<%
			}

			if(! ECA_USE_YN_T.equals("")) {
%>
		 		ECA_USE_YN='<%= ECA_USE_YN_T%>'
<%
			}

			if(! ECA_NUSE_ID_T.equals("")) {
%>
		 		ECA_NUSE_ID='<%= ECA_NUSE_ID_T%>'
<%
			}

			if(! ECA_NUSE_DTT_T.equals("")) {
%>
		 		ECA_NUSE_DTT='<%= ECA_NUSE_DTT_T%>'
<%
			}

			if(! ECA_INPT_ID_T.equals("")) {
%>
		 		ECA_INPT_ID='<%= ECA_INPT_ID_T%>'
<%
			}

			if(! ECA_INPT_DTT_T.equals("")) {
%>
		 		ECA_INPT_DTT='<%= ECA_INPT_DTT_T%>'
<%
			}

			if(! ECA_MODI_ID_T.equals("")) {
%>
		 		ECA_MODI_ID='<%= ECA_MODI_ID_T%>'
<%
			}

			if(! ECA_MODI_DTT_T.equals("")) {
%>
		 		ECA_MODI_DTT='<%= ECA_MODI_DTT_T%>'
<%
			}

			if(! ECA_TRNS_ID_T.equals("")) {
%>
		 		ECA_TRNS_ID='<%= ECA_TRNS_ID_T%>'
<%
			}

			if(! ECA_TRNS_DTT_T.equals("")) {
%>
		 		ECA_TRNS_DTT='<%= ECA_TRNS_DTT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c19='<%= cnt%>'
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
