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

		String EXAM_YR = htMethod.get("EXAM_YR");
		String ITEM_CD = htMethod.get("ITEM_CD");

		//
		if(EXAM_YR == null) { EXAM_YR = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM IT_ITEM_CALL 
 WHERE IIC_EXAM_YR = :EXAM_YR
   AND IIC_ITEM_CD = :ITEM_CD 
		*/

		sql = " SELECT *";
		sql += " FROM IT_ITEM_CALL";
		sql += " WHERE IIC_EXAM_YR = '" + EXAM_YR + "'";
		sql += " AND IIC_ITEM_CD = '" + ITEM_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Call_ufSaveItem_Call_001 \n";
			G_INFO += "설명 : 항목정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_YR : " + EXAM_YR + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
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
		<s:AttributeType name='IIC_EXAM_YR' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL' rs:basecolumn='IIC_EXAM_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIC_ITEM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL' rs:basecolumn='IIC_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIC_HLTH_KD' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL' rs:basecolumn='IIC_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIC_CAN_KD' rs:number='4' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL' rs:basecolumn='IIC_CAN_KD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIC_STDT_KD' rs:number='5' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL' rs:basecolumn='IIC_STDT_KD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIC_STDTO_KD' rs:number='6' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL' rs:basecolumn='IIC_STDTO_KD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIC_GBHC_KD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL'
			 rs:basecolumn='IIC_GBHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='16'/>
		</s:AttributeType>
		<s:AttributeType name='IIC_STHC_KD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL'
			 rs:basecolumn='IIC_STHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='IIC_INPT_ID' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL'
			 rs:basecolumn='IIC_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIC_INPT_DTT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL'
			 rs:basecolumn='IIC_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIC_MODI_ID' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL'
			 rs:basecolumn='IIC_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIC_MODI_DTT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL'
			 rs:basecolumn='IIC_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='13' rs:rowid='true' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL'
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

			String IIC_EXAM_YR_T = cRsList.getString("IIC_EXAM_YR");
			String IIC_ITEM_CD_T = cRsList.getString("IIC_ITEM_CD");
			String IIC_HLTH_KD_T = cRsList.getString("IIC_HLTH_KD");
			String IIC_CAN_KD_T = cRsList.getString("IIC_CAN_KD");
			String IIC_STDT_KD_T = cRsList.getString("IIC_STDT_KD");
			String IIC_STDTO_KD_T = cRsList.getString("IIC_STDTO_KD");
			String IIC_GBHC_KD_T = cRsList.getString("IIC_GBHC_KD");
			String IIC_STHC_KD_T = cRsList.getString("IIC_STHC_KD");
			String IIC_INPT_ID_T = cRsList.getString("IIC_INPT_ID");
			String IIC_INPT_DTT_T = cRsList.getDate2("IIC_INPT_DTT");
			String IIC_MODI_ID_T = cRsList.getString("IIC_MODI_ID");
			String IIC_MODI_DTT_T = cRsList.getDate2("IIC_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IIC_EXAM_YR_T.equals("")) {
%>
		 		IIC_EXAM_YR='<%= IIC_EXAM_YR_T%>'
<%
			}

			if(! IIC_ITEM_CD_T.equals("")) {
%>
		 		IIC_ITEM_CD='<%= IIC_ITEM_CD_T%>'
<%
			}

			if(! IIC_HLTH_KD_T.equals("")) {
%>
		 		IIC_HLTH_KD='<%= IIC_HLTH_KD_T%>'
<%
			}

			if(! IIC_CAN_KD_T.equals("")) {
%>
		 		IIC_CAN_KD='<%= IIC_CAN_KD_T%>'
<%
			}

			if(! IIC_STDT_KD_T.equals("")) {
%>
		 		IIC_STDT_KD='<%= IIC_STDT_KD_T%>'
<%
			}

			if(! IIC_STDTO_KD_T.equals("")) {
%>
		 		IIC_STDTO_KD='<%= IIC_STDTO_KD_T%>'
<%
			}

			if(! IIC_GBHC_KD_T.equals("")) {
%>
		 		IIC_GBHC_KD='<%= IIC_GBHC_KD_T%>'
<%
			}

			if(! IIC_STHC_KD_T.equals("")) {
%>
		 		IIC_STHC_KD='<%= IIC_STHC_KD_T%>'
<%
			}

			if(! IIC_INPT_ID_T.equals("")) {
%>
		 		IIC_INPT_ID='<%= IIC_INPT_ID_T%>'
<%
			}

			if(! IIC_INPT_DTT_T.equals("")) {
%>
		 		IIC_INPT_DTT='<%= IIC_INPT_DTT_T%>'
<%
			}

			if(! IIC_MODI_ID_T.equals("")) {
%>
		 		IIC_MODI_ID='<%= IIC_MODI_ID_T%>'
<%
			}

			if(! IIC_MODI_DTT_T.equals("")) {
%>
		 		IIC_MODI_DTT='<%= IIC_MODI_DTT_T%>'
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
