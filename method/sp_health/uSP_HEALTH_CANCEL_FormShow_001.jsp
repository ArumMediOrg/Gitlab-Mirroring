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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String EXAM_CHA = htMethod.get("EXAM_CHA");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(EXAM_CHA == null) { EXAM_CHA = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM ST_ITEM_CANCEL
 WHERE SIC_EXAM_DT  = :EXAM_DT
   AND SIC_EXAM_SQ  = :EXAM_SQ
   AND SIC_EXAM_CHA = :EXAM_CHA
		*/

		sql = " SELECT *";
		sql += " FROM ST_ITEM_CANCEL";
		sql += " WHERE SIC_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND SIC_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SIC_EXAM_CHA = '" + EXAM_CHA + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_CANCEL_FormShow_001 \n";
			G_INFO += "설명 : 미실시사유 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " EXAM_CHA : " + EXAM_CHA + " \n";
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
		<s:AttributeType name='SIC_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL' rs:basecolumn='SIC_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIC_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL' rs:basecolumn='SIC_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIC_EXAM_CHA' rs:number='3' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL' rs:basecolumn='SIC_EXAM_CHA'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIC_ITEM_CD' rs:number='4' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL' rs:basecolumn='SIC_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIC_SBCD_CD' rs:number='5' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL' rs:basecolumn='SIC_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIC_CANC_LT' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL'
			 rs:basecolumn='SIC_CANC_LT'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SIC_INPT_ID' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL'
			 rs:basecolumn='SIC_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SIC_INPT_DTT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL'
			 rs:basecolumn='SIC_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SIC_MODI_ID' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL'
			 rs:basecolumn='SIC_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SIC_MODI_DTT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL'
			 rs:basecolumn='SIC_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='11' rs:rowid='true' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL'
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

			String SIC_EXAM_DT_T = cRsList.getString("SIC_EXAM_DT");
			String SIC_EXAM_SQ_T = cRsList.getString("SIC_EXAM_SQ");
			String SIC_EXAM_CHA_T = cRsList.getString("SIC_EXAM_CHA");
			String SIC_ITEM_CD_T = cRsList.getString("SIC_ITEM_CD");
			String SIC_SBCD_CD_T = cRsList.getString("SIC_SBCD_CD");
			String SIC_CANC_LT_T = cRsList.getString("SIC_CANC_LT");
			String SIC_INPT_ID_T = cRsList.getString("SIC_INPT_ID");
			String SIC_INPT_DTT_T = cRsList.getDate2("SIC_INPT_DTT");
			String SIC_MODI_ID_T = cRsList.getString("SIC_MODI_ID");
			String SIC_MODI_DTT_T = cRsList.getDate2("SIC_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! SIC_EXAM_DT_T.equals("")) {
%>
		 		SIC_EXAM_DT='<%= SIC_EXAM_DT_T%>'
<%
			}

			if(! SIC_EXAM_SQ_T.equals("")) {
%>
		 		SIC_EXAM_SQ='<%= SIC_EXAM_SQ_T%>'
<%
			}

			if(! SIC_EXAM_CHA_T.equals("")) {
%>
		 		SIC_EXAM_CHA='<%= SIC_EXAM_CHA_T%>'
<%
			}

			if(! SIC_ITEM_CD_T.equals("")) {
%>
		 		SIC_ITEM_CD='<%= SIC_ITEM_CD_T%>'
<%
			}

			if(! SIC_SBCD_CD_T.equals("")) {
%>
		 		SIC_SBCD_CD='<%= SIC_SBCD_CD_T%>'
<%
			}

			if(! SIC_CANC_LT_T.equals("")) {
%>
		 		SIC_CANC_LT='<%= SIC_CANC_LT_T%>'
<%
			}

			if(! SIC_INPT_ID_T.equals("")) {
%>
		 		SIC_INPT_ID='<%= SIC_INPT_ID_T%>'
<%
			}

			if(! SIC_INPT_DTT_T.equals("")) {
%>
		 		SIC_INPT_DTT='<%= SIC_INPT_DTT_T%>'
<%
			}

			if(! SIC_MODI_ID_T.equals("")) {
%>
		 		SIC_MODI_ID='<%= SIC_MODI_ID_T%>'
<%
			}

			if(! SIC_MODI_DTT_T.equals("")) {
%>
		 		SIC_MODI_DTT='<%= SIC_MODI_DTT_T%>'
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
