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

Select * From IT_EXCEL_PAN          
 Where IEI_TBLE_NM = 'ST_SYMPTOM' 
  And IEI_ITEM_SQ < '290'         
Order bY IEI_ITEM_SQ                

		*/

		sql = " SELECT *";
		sql += " FROM IT_EXCEL_PAN";
		sql += " WHERE IEI_TBLE_NM = 'ST_SYMPTOM'";
		sql += " AND IEI_ITEM_SQ < '290'";
		sql += " ORDER BY IEI_ITEM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMake_Excel_upGetSpBase1_001 \n";
			G_INFO += "설명 : 엑셀용 판정정보 로딩 \n";
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
		<s:AttributeType name='IEI_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_EXCEL_PAN' rs:basecolumn='IEI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='50' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IEI_ITEM_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_EXCEL_PAN'
			 rs:basecolumn='IEI_ITEM_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IEI_TBLE_NM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_EXCEL_PAN'
			 rs:basecolumn='IEI_TBLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='IEI_ITEM_SQ' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_EXCEL_PAN'
			 rs:basecolumn='IEI_ITEM_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IEI_COLM_DT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_EXCEL_PAN'
			 rs:basecolumn='IEI_COLM_DT'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='IEI_COLM_SQ' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_EXCEL_PAN'
			 rs:basecolumn='IEI_COLM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='IEI_COMM_SP' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_EXCEL_PAN'
			 rs:basecolumn='IEI_COMM_SP'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='IEI_INPT_ID' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_EXCEL_PAN'
			 rs:basecolumn='IEI_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IEI_INPT_DTT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_EXCEL_PAN'
			 rs:basecolumn='IEI_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IEI_MODI_ID' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_EXCEL_PAN'
			 rs:basecolumn='IEI_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IEI_MODI_DTT' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_EXCEL_PAN'
			 rs:basecolumn='IEI_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='12' rs:rowid='true' rs:writeunknown='true' rs:basetable='IT_EXCEL_PAN'
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

			String IEI_ITEM_CD_T = cRsList.getString("IEI_ITEM_CD");
			String IEI_ITEM_NM_T = cRsList.getString("IEI_ITEM_NM");
			String IEI_TBLE_NM_T = cRsList.getString("IEI_TBLE_NM");
			String IEI_ITEM_SQ_T = cRsList.getString("IEI_ITEM_SQ");
			String IEI_COLM_DT_T = cRsList.getString("IEI_COLM_DT");
			String IEI_COLM_SQ_T = cRsList.getString("IEI_COLM_SQ");
			String IEI_COMM_SP_T = cRsList.getString("IEI_COMM_SP");
			String IEI_INPT_ID_T = cRsList.getString("IEI_INPT_ID");
			String IEI_INPT_DTT_T = cRsList.getDate2("IEI_INPT_DTT");
			String IEI_MODI_ID_T = cRsList.getString("IEI_MODI_ID");
			String IEI_MODI_DTT_T = cRsList.getDate2("IEI_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IEI_ITEM_CD_T.equals("")) {
%>
		 		IEI_ITEM_CD='<%= IEI_ITEM_CD_T%>'
<%
			}

			if(! IEI_ITEM_NM_T.equals("")) {
%>
		 		IEI_ITEM_NM='<%= IEI_ITEM_NM_T%>'
<%
			}

			if(! IEI_TBLE_NM_T.equals("")) {
%>
		 		IEI_TBLE_NM='<%= IEI_TBLE_NM_T%>'
<%
			}

			if(! IEI_ITEM_SQ_T.equals("")) {
%>
		 		IEI_ITEM_SQ='<%= IEI_ITEM_SQ_T%>'
<%
			}

			if(! IEI_COLM_DT_T.equals("")) {
%>
		 		IEI_COLM_DT='<%= IEI_COLM_DT_T%>'
<%
			}

			if(! IEI_COLM_SQ_T.equals("")) {
%>
		 		IEI_COLM_SQ='<%= IEI_COLM_SQ_T%>'
<%
			}

			if(! IEI_COMM_SP_T.equals("")) {
%>
		 		IEI_COMM_SP='<%= IEI_COMM_SP_T%>'
<%
			}

			if(! IEI_INPT_ID_T.equals("")) {
%>
		 		IEI_INPT_ID='<%= IEI_INPT_ID_T%>'
<%
			}

			if(! IEI_INPT_DTT_T.equals("")) {
%>
		 		IEI_INPT_DTT='<%= IEI_INPT_DTT_T%>'
<%
			}

			if(! IEI_MODI_ID_T.equals("")) {
%>
		 		IEI_MODI_ID='<%= IEI_MODI_ID_T%>'
<%
			}

			if(! IEI_MODI_DTT_T.equals("")) {
%>
		 		IEI_MODI_DTT='<%= IEI_MODI_DTT_T%>'
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
