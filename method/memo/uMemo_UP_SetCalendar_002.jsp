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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String MEMO_SQ = htMethod.get("MEMO_SQ");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(MEMO_SQ == null) { MEMO_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM ET_CLDR_MEMO
 WHERE ECM_MEMO_DT >= :EXAM_SDT
   AND ECM_MEMO_DT <= :EXAM_EDT
   AND ECM_MEMO_SQ <> 0

IF (:MEMO_SQ > 0) THEN
   AND ECM_MEMO_SQ  = :MEMO_SQ

		*/

		sql = " SELECT *";
		sql += " FROM ET_CLDR_MEMO";
		sql += " WHERE ECM_MEMO_DT >= '" + EXAM_SDT + "'";
		sql += " AND ECM_MEMO_DT <= '" + EXAM_EDT + "'";
		sql += " AND ECM_MEMO_SQ <> 0";

		if(!MEMO_SQ.equals("") && Integer.parseInt(MEMO_SQ) > 0) {
			sql += " AND ECM_MEMO_SQ = '" + MEMO_SQ + "'";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMemo_UP_SetCalendar_002 \n";
			G_INFO += "설명 : 메모 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " MEMO_SQ : " + MEMO_SQ + " \n";
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
		<s:AttributeType name='ECM_MEMO_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO' rs:basecolumn='ECM_MEMO_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_MEMO_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO' rs:basecolumn='ECM_MEMO_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_MEMO_LT' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_MEMO_LT'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_MEMO_TX' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_MEMO_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_INPT_ID' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_INPT_DTT' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_MODI_ID' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_MODI_DTT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_RSVT_TX' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_RSVT_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_ACPT_TX' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_ACPT_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_FONT_ST' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_FONT_ST'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='12' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
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

			String ECM_MEMO_DT_T = cRsList.getString("ECM_MEMO_DT");
			String ECM_MEMO_SQ_T = cRsList.getString("ECM_MEMO_SQ");
			String ECM_MEMO_LT_T = cRsList.getString("ECM_MEMO_LT");
			String ECM_MEMO_TX_T = cRsList.getString("ECM_MEMO_TX");
			String ECM_INPT_ID_T = cRsList.getString("ECM_INPT_ID");
			String ECM_INPT_DTT_T = cRsList.getDate2("ECM_INPT_DTT");
			String ECM_MODI_ID_T = cRsList.getString("ECM_MODI_ID");
			String ECM_MODI_DTT_T = cRsList.getDate2("ECM_MODI_DTT");
			String ECM_RSVT_TX_T = cRsList.getString("ECM_RSVT_TX");
			String ECM_ACPT_TX_T = cRsList.getString("ECM_ACPT_TX");
			String ECM_FONT_ST_T = cRsList.getString("ECM_FONT_ST");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECM_MEMO_DT_T.equals("")) {
%>
		 		ECM_MEMO_DT='<%= ECM_MEMO_DT_T%>'
<%
			}

			if(! ECM_MEMO_SQ_T.equals("")) {
%>
		 		ECM_MEMO_SQ='<%= ECM_MEMO_SQ_T%>'
<%
			}

			if(! ECM_MEMO_LT_T.equals("")) {
%>
		 		ECM_MEMO_LT='<%= ECM_MEMO_LT_T%>'
<%
			}

			if(! ECM_MEMO_TX_T.equals("")) {
%>
		 		ECM_MEMO_TX='<%= ECM_MEMO_TX_T%>'
<%
			}

			if(! ECM_INPT_ID_T.equals("")) {
%>
		 		ECM_INPT_ID='<%= ECM_INPT_ID_T%>'
<%
			}

			if(! ECM_INPT_DTT_T.equals("")) {
%>
		 		ECM_INPT_DTT='<%= ECM_INPT_DTT_T%>'
<%
			}

			if(! ECM_MODI_ID_T.equals("")) {
%>
		 		ECM_MODI_ID='<%= ECM_MODI_ID_T%>'
<%
			}

			if(! ECM_MODI_DTT_T.equals("")) {
%>
		 		ECM_MODI_DTT='<%= ECM_MODI_DTT_T%>'
<%
			}

			if(! ECM_RSVT_TX_T.equals("")) {
%>
		 		ECM_RSVT_TX='<%= ECM_RSVT_TX_T%>'
<%
			}

			if(! ECM_ACPT_TX_T.equals("")) {
%>
		 		ECM_ACPT_TX='<%= ECM_ACPT_TX_T%>'
<%
			}

			if(! ECM_FONT_ST_T.equals("")) {
%>
		 		ECM_FONT_ST='<%= ECM_FONT_ST_T%>'
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
