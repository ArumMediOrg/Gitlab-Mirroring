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
		String CNRT_SQ = htMethod.get("CNRT_SQ");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM ET_COMP_CNRT
WHERE ECC_COMP_CD = :COMP_CD
AND   ECC_MNGT_YR = :MNGT_YR
AND   ECC_CNRT_SQ = :CNRT_SQ
		*/

		sql = " SELECT *";
		sql += " FROM ET_COMP_CNRT";
		sql += " WHERE ECC_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ECC_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND ECC_CNRT_SQ = '" + CNRT_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_APPLY_FormShow_001 \n";
			G_INFO += "설명 : 사업장 계약 정보 조회(계약정보전체) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
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
		<s:AttributeType name='ECC_COMP_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_MNGT_YR' rs:number='2' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_CNRT_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_NM' rs:number='4' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_CNRT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_SDT' rs:number='5' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_CNRT_SDT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_EDT' rs:number='6' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_CNRT_EDT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_SALE_ID' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
			 rs:basecolumn='ECC_SALE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_TX' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
			 rs:basecolumn='ECC_CNRT_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_USE_YN' rs:number='9' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_NUSE_ID' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
			 rs:basecolumn='ECC_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_NUSE_DTT' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
			 rs:basecolumn='ECC_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_INPT_ID' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
			 rs:basecolumn='ECC_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_INPT_DTT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
			 rs:basecolumn='ECC_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_MODI_ID' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
			 rs:basecolumn='ECC_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_MODI_DTT' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
			 rs:basecolumn='ECC_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_TRNS_ID' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
			 rs:basecolumn='ECC_TRNS_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_TRNS_DTT' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
			 rs:basecolumn='ECC_TRNS_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='18' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT'
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

			String ECC_COMP_CD_T = cRsList.getString("ECC_COMP_CD");
			String ECC_MNGT_YR_T = cRsList.getString("ECC_MNGT_YR");
			String ECC_CNRT_SQ_T = cRsList.getString("ECC_CNRT_SQ");
			String ECC_CNRT_NM_T = cRsList.getString("ECC_CNRT_NM");
			String ECC_CNRT_SDT_T = cRsList.getString("ECC_CNRT_SDT");
			String ECC_CNRT_EDT_T = cRsList.getString("ECC_CNRT_EDT");
			String ECC_SALE_ID_T = cRsList.getString("ECC_SALE_ID");
			String ECC_CNRT_TX_T = cRsList.getString("ECC_CNRT_TX");
			String ECC_USE_YN_T = cRsList.getString("ECC_USE_YN");
			String ECC_NUSE_ID_T = cRsList.getString("ECC_NUSE_ID");
			String ECC_NUSE_DTT_T = cRsList.getDate2("ECC_NUSE_DTT");
			String ECC_INPT_ID_T = cRsList.getString("ECC_INPT_ID");
			String ECC_INPT_DTT_T = cRsList.getDate2("ECC_INPT_DTT");
			String ECC_MODI_ID_T = cRsList.getString("ECC_MODI_ID");
			String ECC_MODI_DTT_T = cRsList.getDate2("ECC_MODI_DTT");
			String ECC_TRNS_ID_T = cRsList.getString("ECC_TRNS_ID");
			String ECC_TRNS_DTT_T = cRsList.getDate2("ECC_TRNS_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECC_COMP_CD_T.equals("")) {
%>
		 		ECC_COMP_CD='<%= ECC_COMP_CD_T%>'
<%
			}

			if(! ECC_MNGT_YR_T.equals("")) {
%>
		 		ECC_MNGT_YR='<%= ECC_MNGT_YR_T%>'
<%
			}

			if(! ECC_CNRT_SQ_T.equals("")) {
%>
		 		ECC_CNRT_SQ='<%= ECC_CNRT_SQ_T%>'
<%
			}

			if(! ECC_CNRT_NM_T.equals("")) {
%>
		 		ECC_CNRT_NM='<%= ECC_CNRT_NM_T%>'
<%
			}

			if(! ECC_CNRT_SDT_T.equals("")) {
%>
		 		ECC_CNRT_SDT='<%= ECC_CNRT_SDT_T%>'
<%
			}

			if(! ECC_CNRT_EDT_T.equals("")) {
%>
		 		ECC_CNRT_EDT='<%= ECC_CNRT_EDT_T%>'
<%
			}

			if(! ECC_SALE_ID_T.equals("")) {
%>
		 		ECC_SALE_ID='<%= ECC_SALE_ID_T%>'
<%
			}

			if(! ECC_CNRT_TX_T.equals("")) {
%>
		 		ECC_CNRT_TX='<%= ECC_CNRT_TX_T%>'
<%
			}

			if(! ECC_USE_YN_T.equals("")) {
%>
		 		ECC_USE_YN='<%= ECC_USE_YN_T%>'
<%
			}

			if(! ECC_NUSE_ID_T.equals("")) {
%>
		 		ECC_NUSE_ID='<%= ECC_NUSE_ID_T%>'
<%
			}

			if(! ECC_NUSE_DTT_T.equals("")) {
%>
		 		ECC_NUSE_DTT='<%= ECC_NUSE_DTT_T%>'
<%
			}

			if(! ECC_INPT_ID_T.equals("")) {
%>
		 		ECC_INPT_ID='<%= ECC_INPT_ID_T%>'
<%
			}

			if(! ECC_INPT_DTT_T.equals("")) {
%>
		 		ECC_INPT_DTT='<%= ECC_INPT_DTT_T%>'
<%
			}

			if(! ECC_MODI_ID_T.equals("")) {
%>
		 		ECC_MODI_ID='<%= ECC_MODI_ID_T%>'
<%
			}

			if(! ECC_MODI_DTT_T.equals("")) {
%>
		 		ECC_MODI_DTT='<%= ECC_MODI_DTT_T%>'
<%
			}

			if(! ECC_TRNS_ID_T.equals("")) {
%>
		 		ECC_TRNS_ID='<%= ECC_TRNS_ID_T%>'
<%
			}

			if(! ECC_TRNS_DTT_T.equals("")) {
%>
		 		ECC_TRNS_DTT='<%= ECC_TRNS_DTT_T%>'
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
