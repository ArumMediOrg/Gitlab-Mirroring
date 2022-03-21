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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM IT_ITEM_QUESTION

		*/

		sql = " SELECT *";
		sql += " FROM IT_ITEM_QUESTION";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uEmotional_Labor_Stats_FormShow_002 \n";
			G_INFO += "설명 : 문진데이터 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='IIQ_APLY_DT' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_APLY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITEM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_SORT_NO' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_SORT_NO'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_QGTN_CD' rs:number='4' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_QGTN_CD'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_LV1' rs:number='5' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_LV1'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_LV2' rs:number='6' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_LV2'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_SQ' rs:number='7' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_TX' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='IIQ_ITQU_TX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_USE_YN' rs:number='9' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_NUSE_ID' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='IIQ_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_NUSE_DTT' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='IIQ_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_INPT_ID' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='IIQ_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_INPT_DTT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='IIQ_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_MC' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='IIQ_ITQU_MC'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='15' rs:rowid='true' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION'
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

			String IIQ_APLY_DT_T = cRsList.getString("IIQ_APLY_DT");
			String IIQ_ITEM_CD_T = cRsList.getString("IIQ_ITEM_CD");
			String IIQ_SORT_NO_T = cRsList.getString("IIQ_SORT_NO");
			String IIQ_QGTN_CD_T = cRsList.getString("IIQ_QGTN_CD");
			String IIQ_ITQU_LV1_T = cRsList.getString("IIQ_ITQU_LV1");
			String IIQ_ITQU_LV2_T = cRsList.getString("IIQ_ITQU_LV2");
			String IIQ_ITQU_SQ_T = cRsList.getString("IIQ_ITQU_SQ");
			String IIQ_ITQU_TX_T = cRsList.getString("IIQ_ITQU_TX");
			String IIQ_USE_YN_T = cRsList.getString("IIQ_USE_YN");
			String IIQ_NUSE_ID_T = cRsList.getString("IIQ_NUSE_ID");
			String IIQ_NUSE_DTT_T = cRsList.getDate2("IIQ_NUSE_DTT");
			String IIQ_INPT_ID_T = cRsList.getString("IIQ_INPT_ID");
			String IIQ_INPT_DTT_T = cRsList.getDate2("IIQ_INPT_DTT");
			String IIQ_ITQU_MC_T = cRsList.getString("IIQ_ITQU_MC");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IIQ_APLY_DT_T.equals("")) {
%>
		 		IIQ_APLY_DT='<%= IIQ_APLY_DT_T%>'
<%
			}

			if(! IIQ_ITEM_CD_T.equals("")) {
%>
		 		IIQ_ITEM_CD='<%= IIQ_ITEM_CD_T%>'
<%
			}

			if(! IIQ_SORT_NO_T.equals("")) {
%>
		 		IIQ_SORT_NO='<%= IIQ_SORT_NO_T%>'
<%
			}

			if(! IIQ_QGTN_CD_T.equals("")) {
%>
		 		IIQ_QGTN_CD='<%= IIQ_QGTN_CD_T%>'
<%
			}

			if(! IIQ_ITQU_LV1_T.equals("")) {
%>
		 		IIQ_ITQU_LV1='<%= IIQ_ITQU_LV1_T%>'
<%
			}

			if(! IIQ_ITQU_LV2_T.equals("")) {
%>
		 		IIQ_ITQU_LV2='<%= IIQ_ITQU_LV2_T%>'
<%
			}

			if(! IIQ_ITQU_SQ_T.equals("")) {
%>
		 		IIQ_ITQU_SQ='<%= IIQ_ITQU_SQ_T%>'
<%
			}

			if(! IIQ_ITQU_TX_T.equals("")) {
%>
		 		IIQ_ITQU_TX='<%= IIQ_ITQU_TX_T%>'
<%
			}

			if(! IIQ_USE_YN_T.equals("")) {
%>
		 		IIQ_USE_YN='<%= IIQ_USE_YN_T%>'
<%
			}

			if(! IIQ_NUSE_ID_T.equals("")) {
%>
		 		IIQ_NUSE_ID='<%= IIQ_NUSE_ID_T%>'
<%
			}

			if(! IIQ_NUSE_DTT_T.equals("")) {
%>
		 		IIQ_NUSE_DTT='<%= IIQ_NUSE_DTT_T%>'
<%
			}

			if(! IIQ_INPT_ID_T.equals("")) {
%>
		 		IIQ_INPT_ID='<%= IIQ_INPT_ID_T%>'
<%
			}

			if(! IIQ_INPT_DTT_T.equals("")) {
%>
		 		IIQ_INPT_DTT='<%= IIQ_INPT_DTT_T%>'
<%
			}

			if(! IIQ_ITQU_MC_T.equals("")) {
%>
		 		IIQ_ITQU_MC='<%= IIQ_ITQU_MC_T%>'
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
