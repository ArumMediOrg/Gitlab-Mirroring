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

		String IIR_ITEM_CD = htMethod.get("IIR_ITEM_CD");

		//
		if(IIR_ITEM_CD == null) { IIR_ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

			SELECT *
			FROM IT_ITEM_RESULT
			WHERE IIR_ITEM_CD = :IIR_ITEM_CD 
			AND IIR_RSLT_KD = ''2''
			ORDER BY LENGTH(IIR_RSLT_CD) ASC, IIR_RSLT_CD ASC

		*/

		sql = " SELECT *";
		sql += " FROM IT_ITEM_RESULT";
		sql += " WHERE IIR_ITEM_CD = '" + IIR_ITEM_CD + "'";
		sql += " AND IIR_RSLT_KD = '2'";
		sql += " ORDER BY LENGTH(IIR_RSLT_CD) ASC, IIR_RSLT_CD ASC";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_upGetItemResult_002 \n";
			G_INFO += "설명 : 검사결과코드 내역 조회(단문) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IIR_ITEM_CD : " + IIR_ITEM_CD + " \n";
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
				<s:AttributeType name='IIR_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT' rs:basecolumn='IIR_ITEM_CD'>
					<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_RSLT_CD' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT' rs:basecolumn='IIR_RSLT_CD'>
					<s:datatype dt:type='string' dt:maxLength='50' rs:maybenull='false'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_RSLT_KD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_RSLT_KD'>
					<s:datatype dt:type='string' dt:maxLength='1'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_RSLT_VL' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_RSLT_VL'>
					<s:datatype dt:type='string' dt:maxLength='100'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_HEEX_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_HEEX_CD'>
					<s:datatype dt:type='string' dt:maxLength='3'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_SPEX_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_SPEX_CD'>
					<s:datatype dt:type='string' dt:maxLength='3'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_PRNT_VL' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_PRNT_VL'>
					<s:datatype dt:type='string' dt:maxLength='100'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_RSLT_NM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_RSLT_NM'>
					<s:datatype dt:type='string' dt:maxLength='200'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_RSLT_EX' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_RSLT_EX'>
					<s:datatype dt:type='string' dt:maxLength='4000'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_HOT_KEY' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_HOT_KEY'>
					<s:datatype dt:type='string' dt:maxLength='10'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_USE_YN' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_USE_YN'>
					<s:datatype dt:type='string' dt:maxLength='1'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_NUSE_ID' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_NUSE_ID'>
					<s:datatype dt:type='string' dt:maxLength='20'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_NUSE_DTT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_NUSE_DTT'>
					<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_INPT_ID' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_INPT_ID'>
					<s:datatype dt:type='string' dt:maxLength='20'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_INPT_DTT' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_INPT_DTT'>
					<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_MODI_ID' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_MODI_ID'>
					<s:datatype dt:type='string' dt:maxLength='20'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_MODI_DTT' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_MODI_DTT'>
					<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
				</s:AttributeType>
				<s:AttributeType name='ROWID' rs:number='18' rs:rowid='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
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

			String IIR_ITEM_CD_T = cRsList.getString("IIR_ITEM_CD");
			String IIR_RSLT_CD_T = cRsList.getString("IIR_RSLT_CD");
			String IIR_RSLT_KD_T = cRsList.getString("IIR_RSLT_KD");
			String IIR_RSLT_VL_T = cRsList.getString("IIR_RSLT_VL");
			String IIR_HEEX_CD_T = cRsList.getString("IIR_HEEX_CD");
			String IIR_SPEX_CD_T = cRsList.getString("IIR_SPEX_CD");
			String IIR_PRNT_VL_T = cRsList.getString("IIR_PRNT_VL");
			String IIR_RSLT_NM_T = cRsList.getString("IIR_RSLT_NM");
			String IIR_RSLT_EX_T = cRsList.getString("IIR_RSLT_EX");
			String IIR_HOT_KEY_T = cRsList.getString("IIR_HOT_KEY");
			String IIR_USE_YN_T = cRsList.getString("IIR_USE_YN");
			String IIR_NUSE_ID_T = cRsList.getString("IIR_NUSE_ID");
			String IIR_NUSE_DTT_T = cRsList.getDate2("IIR_NUSE_DTT");
			String IIR_INPT_ID_T = cRsList.getString("IIR_INPT_ID");
			String IIR_INPT_DTT_T = cRsList.getDate2("IIR_INPT_DTT");
			String IIR_MODI_ID_T = cRsList.getString("IIR_MODI_ID");
			String IIR_MODI_DTT_T = cRsList.getDate2("IIR_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IIR_ITEM_CD_T.equals("")) {
%>
		 		IIR_ITEM_CD='<%= IIR_ITEM_CD_T%>'
<%
			}

			if(! IIR_RSLT_CD_T.equals("")) {
%>
		 		IIR_RSLT_CD='<%= IIR_RSLT_CD_T%>'
<%
			}

			if(! IIR_RSLT_KD_T.equals("")) {
%>
		 		IIR_RSLT_KD='<%= IIR_RSLT_KD_T%>'
<%
			}

			if(! IIR_RSLT_VL_T.equals("")) {
%>
		 		IIR_RSLT_VL='<%= IIR_RSLT_VL_T%>'
<%
			}

			if(! IIR_HEEX_CD_T.equals("")) {
%>
		 		IIR_HEEX_CD='<%= IIR_HEEX_CD_T%>'
<%
			}

			if(! IIR_SPEX_CD_T.equals("")) {
%>
		 		IIR_SPEX_CD='<%= IIR_SPEX_CD_T%>'
<%
			}

			if(! IIR_PRNT_VL_T.equals("")) {
%>
		 		IIR_PRNT_VL='<%= IIR_PRNT_VL_T%>'
<%
			}

			if(! IIR_RSLT_NM_T.equals("")) {
%>
		 		IIR_RSLT_NM='<%= IIR_RSLT_NM_T%>'
<%
			}

			if(! IIR_RSLT_EX_T.equals("")) {
%>
		 		IIR_RSLT_EX='<%= IIR_RSLT_EX_T%>'
<%
			}

			if(! IIR_HOT_KEY_T.equals("")) {
%>
		 		IIR_HOT_KEY='<%= IIR_HOT_KEY_T%>'
<%
			}

			if(! IIR_USE_YN_T.equals("")) {
%>
		 		IIR_USE_YN='<%= IIR_USE_YN_T%>'
<%
			}

			if(! IIR_NUSE_ID_T.equals("")) {
%>
		 		IIR_NUSE_ID='<%= IIR_NUSE_ID_T%>'
<%
			}

			if(! IIR_NUSE_DTT_T.equals("")) {
%>
		 		IIR_NUSE_DTT='<%= IIR_NUSE_DTT_T%>'
<%
			}

			if(! IIR_INPT_ID_T.equals("")) {
%>
		 		IIR_INPT_ID='<%= IIR_INPT_ID_T%>'
<%
			}

			if(! IIR_INPT_DTT_T.equals("")) {
%>
		 		IIR_INPT_DTT='<%= IIR_INPT_DTT_T%>'
<%
			}

			if(! IIR_MODI_ID_T.equals("")) {
%>
		 		IIR_MODI_ID='<%= IIR_MODI_ID_T%>'
<%
			}

			if(! IIR_MODI_DTT_T.equals("")) {
%>
		 		IIR_MODI_DTT='<%= IIR_MODI_DTT_T%>'
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
