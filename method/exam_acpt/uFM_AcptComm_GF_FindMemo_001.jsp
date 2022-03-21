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

		String MEMO_DT = htMethod.get("MEMO_DT");

		//
		if(MEMO_DT == null) { MEMO_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT ECM_MEMO_TX, ECM_ACPT_TX, ECM_RSVT_TX, ECM_INPT_ID, ECM_INPT_DTT, ECM_MODI_ID, ECM_MODI_DTT
  FROM ET_CLDR_MEMO
 WHERE ECM_MEMO_DT = :MEMO_DT
   AND ECM_MEMO_SQ  = 0                                                                                                    
		*/

		sql = " SELECT ECM_MEMO_TX, ECM_ACPT_TX, ECM_RSVT_TX, ECM_INPT_ID, ECM_INPT_DTT, ECM_MODI_ID, ECM_MODI_DTT";
		sql += " FROM ET_CLDR_MEMO";
		sql += " WHERE ECM_MEMO_DT = '" + MEMO_DT + "'";
		sql += " AND ECM_MEMO_SQ = 0";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_FindMemo_001 \n";
			G_INFO += "설명 : 메모조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MEMO_DT : " + MEMO_DT + " \n";
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
		<s:AttributeType name='ECM_MEMO_TX' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_MEMO_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_ACPT_TX' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_ACPT_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_RSVT_TX' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_RSVT_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_INPT_ID' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_INPT_DTT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_MODI_ID' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_MODI_DTT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='ET_CLDR_MEMO' rs:basecolumn='ROWID'
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

			String ECM_MEMO_TX_T = cRsList.getString("ECM_MEMO_TX");
			String ECM_ACPT_TX_T = cRsList.getString("ECM_ACPT_TX");
			String ECM_RSVT_TX_T = cRsList.getString("ECM_RSVT_TX");
			String ECM_INPT_ID_T = cRsList.getString("ECM_INPT_ID");
			String ECM_INPT_DTT_T = cRsList.getDate2("ECM_INPT_DTT");
			String ECM_MODI_ID_T = cRsList.getString("ECM_MODI_ID");
			String ECM_MODI_DTT_T = cRsList.getDate2("ECM_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECM_MEMO_TX_T.equals("")) {
%>
		 		ECM_MEMO_TX='<%= ECM_MEMO_TX_T%>'
<%
			}

			if(! ECM_ACPT_TX_T.equals("")) {
%>
		 		ECM_ACPT_TX='<%= ECM_ACPT_TX_T%>'
<%
			}

			if(! ECM_RSVT_TX_T.equals("")) {
%>
		 		ECM_RSVT_TX='<%= ECM_RSVT_TX_T%>'
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
