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

	ResultSetMetaData rsmd = null;
	int colCnt = 0;

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String SSQL_ADD = htMethod.get("SSQL_ADD");
		String SCODE1 = htMethod.get("SCODE1");
		String SRSLT1 = htMethod.get("SRSLT1");
		String SCODE2 = htMethod.get("SCODE2");
		String SRSLT2 = htMethod.get("SRSLT2");
		String SCODE3 = htMethod.get("SCODE3");
		String SRSLT3 = htMethod.get("SRSLT3");
		String SCODE4 = htMethod.get("SCODE4");
		String SRSLT4 = htMethod.get("SRSLT4");
		String SADD_CODE = htMethod.get("SADD_CODE");

		if(SSQL_ADD == null) { SSQL_ADD = ""; }
		if(SCODE1 == null) { SCODE1 = ""; }
		if(SRSLT1 == null) { SRSLT1 = ""; }
		if(SCODE2 == null) { SCODE2 = ""; }
		if(SRSLT2 == null) { SRSLT2 = ""; }
		if(SCODE3 == null) { SCODE3 = ""; }
		if(SRSLT3 == null) { SRSLT3 = ""; }
		if(SCODE4 == null) { SCODE4 = ""; }
		if(SRSLT4 == null) { SRSLT4 = ""; }
		if(SADD_CODE == null) { SADD_CODE = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT * FROM CT_DANR_ITEM ";
		sql += " WHERE 1 = 1 ";
		sql += " AND CDI_DANR_KD = '2' ";
		sql += " AND (TO_NUMBER(CDI_RSLT_LOW) <= '" + SRSLT1 + "' and ";
		sql += " 		TO_NUMBER(CDI_RSLT_HIGH) >= '" + SRSLT1 + "') ";
		sql += " AND CDI_ITEM_CD = '" + SCODE1 + "' ";
		sql += " AND CDI_MEDI_KD = '0' ";
		sql += " UNION ";
		sql += " SELECT * FROM CT_DANR_ITEM ";
		sql += " WHERE 1 = 1 ";
		sql += " AND CDI_DANR_KD = '2' ";
		sql += " AND (TO_NUMBER(CDI_RSLT_LOW) <= '" + SRSLT2 + "' and ";
		sql += " 		TO_NUMBER(CDI_RSLT_HIGH) >= '" + SRSLT2 + "') ";
		sql += " AND CDI_ITEM_CD ='" + SCODE2 + "' ";
		sql += " AND CDI_MEDI_KD = '0' ";
		sql += " UNION ";
		sql += " SELECT * FROM CT_DANR_ITEM ";
		sql += " WHERE 1 = 1 ";
		sql += " AND CDI_DANR_KD = '2' ";
		sql += " AND (TO_NUMBER(CDI_RSLT_LOW) <= '" + SRSLT3 + "' and ";
		sql += " 		TO_NUMBER(CDI_RSLT_HIGH) >= '" + SRSLT3 + "') ";
		sql += " AND CDI_ITEM_CD = '" + SCODE3 + "' ";
		sql += " AND CDI_MEDI_KD = '0' ";

		if (! SADD_CODE.equals("")) {
			sql += " UNION ";
			sql += " SELECT * FROM CT_DANR_ITEM ";
			sql += " WHERE 1 = 1 ";
			sql += " AND CDI_DANR_KD = '2' ";
			sql += " AND (TO_NUMBER(CDI_RSLT_LOW) <= '" + SRSLT4 + "' and ";
			sql += " 		TO_NUMBER(CDI_RSLT_HIGH) >= '" + SRSLT4 + "') ";
			sql += " AND CDI_ITEM_CD = '" + SCODE4 + "' ";

			sql += SSQL_ADD;
		}

			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uGen_Frst_Panj_uAutoPanBrain_014 \n";
		G_INFO += "설명 : 뇌심혈관판정(위험도평가CT_DANR_ITEM 조회 6) \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";

		G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
		G_INFO += " SCODE1 : " + SCODE1 + " \n";
		G_INFO += " SRSLT1 : " + SRSLT1 + " \n";
		G_INFO += " SCODE2 : " + SCODE2 + " \n";
		G_INFO += " SRSLT2 : " + SRSLT2 + " \n";
		G_INFO += " SCODE3 : " + SCODE3 + " \n";
		G_INFO += " SRSLT3 : " + SRSLT3 + " \n";
		G_INFO += " SCODE4 : " + SCODE4 + " \n";
		G_INFO += " SRSLT4 : " + SRSLT4 + " \n";
		G_INFO += " SADD_CODE : " + SADD_CODE + " \n";

		G_INFO += "\n\n";

		G_INFO += "질의문 : " + sql + " \n";

		G_INFO += "-->";
		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		rsmd = rsList.getMetaData();  //Select 결과의 Metadata 가져오기.

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
<%
		for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
			String dataType = "string";
			String maxLength = "4000";

			if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
				dataType = "bin.hex";
				maxLength = "2147483647";
				//<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
			} else if (rsmd.getColumnTypeName(colCnt).equals("CLOB")){
				maxLength = "1073741823";
				//<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
			}
%>
		<s:AttributeType name='<%= rsmd.getColumnName(colCnt)%>' rs:number='<%= Integer.toString(colCnt)%>' rs:writeunknown='true' rs:basetable='DUAL' rs:basecolumn='<%= rsmd.getColumnName(colCnt)%>'>
			<s:datatype dt:type='<%= dataType%>' dt:maxLength='<%= maxLength%>' <% if (! maxLength.equals("4000")) { %> rs:long='true' <% } %>/>
		</s:AttributeType>
<%
		}
%>
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:writeunknown='true' rs:basetable='DUAL'
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

			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
				String tempData = cRsList.getString(rsmd.getColumnName(colCnt));
				if(! tempData.equals("")) {
%>
		 			<%= rsmd.getColumnName(colCnt)%>='<%= tempData%>'
<%
				}
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
