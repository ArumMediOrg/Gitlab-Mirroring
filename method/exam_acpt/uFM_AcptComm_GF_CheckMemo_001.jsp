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

		String MEMO_SDT = htMethod.get("MEMO_SDT");
		String MEMO_EDT = htMethod.get("MEMO_EDT");

		//
		if(MEMO_SDT == null) { MEMO_SDT = ""; }
		if(MEMO_EDT == null) { MEMO_EDT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT ECM_MEMO_DT, 
       CASE WHEN ECM_ACPT_TX = '' OR ECM_ACPT_TX IS NULL THEN 'X' ELSE '★메모' END ECM_ACPT_TX,
       CASE WHEN ECM_RSVT_TX = '' OR ECM_RSVT_TX IS NULL THEN 'X' ELSE '★메모' END ECM_RSVT_TX
  FROM ET_CLDR_MEMO
 WHERE ECM_MEMO_DT >= :MEMO_SDT
   AND ECM_MEMO_DT <= :MEMO_EDT
   AND ECM_MEMO_SQ  = 0                                                                                                    
		*/

		sql = " SELECT ECM_MEMO_DT";
		sql += ", CASE WHEN ECM_ACPT_TX = '' OR ECM_ACPT_TX IS NULL THEN 'X' ELSE '★메모' END ECM_ACPT_TX";
		sql += ", CASE WHEN ECM_RSVT_TX = '' OR ECM_RSVT_TX IS NULL THEN 'X' ELSE '★메모' END ECM_RSVT_TX";
		sql += " FROM ET_CLDR_MEMO";
		sql += " WHERE ECM_MEMO_DT >= '" + MEMO_SDT + "'";
		sql += " AND ECM_MEMO_DT <= '" + MEMO_EDT + "'";
		sql += " AND ECM_MEMO_SQ = 0";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_CheckMemo_001 \n";
			G_INFO += "설명 : 메모조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MEMO_SDT : " + MEMO_SDT + " \n";
			G_INFO += " MEMO_EDT : " + MEMO_EDT + " \n";
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
		<s:AttributeType name='ECM_ACPT_TX' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_ACPT_TX'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_RSVT_TX' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CLDR_MEMO'
			 rs:basecolumn='ECM_RSVT_TX'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='ET_CLDR_MEMO' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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
			String ECM_ACPT_TX_T = cRsList.getString("ECM_ACPT_TX");
			String ECM_RSVT_TX_T = cRsList.getString("ECM_RSVT_TX");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECM_MEMO_DT_T.equals("")) {
%>
		 		ECM_MEMO_DT='<%= ECM_MEMO_DT_T%>'
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
