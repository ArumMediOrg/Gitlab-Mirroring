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

		String SEARCH_TEXT = htMethod.get("SEARCH_TEXT");
		String IIM_EXGN_CD = htMethod.get("IIM_EXGN_CD");
		String IIM_BLPT_CD = htMethod.get("IIM_BLPT_CD");
		String LIIM_USE_YN = htMethod.get("LIIM_USE_YN");
		String IIM_USE_YN = htMethod.get("IIM_USE_YN");
		String SP_CODE = htMethod.get("SP_CODE");
		String SPSORT_SQ = htMethod.get("SPSORT_SQ");

		//
		if(SEARCH_TEXT == null) { SEARCH_TEXT = ""; }
		if(IIM_EXGN_CD == null) { IIM_EXGN_CD = ""; }
		if(IIM_BLPT_CD == null) { IIM_BLPT_CD = ""; }
		if(LIIM_USE_YN == null) { LIIM_USE_YN = ""; }
		if(IIM_USE_YN == null) { IIM_USE_YN = ""; }
		if(SP_CODE == null) { SP_CODE = ""; }
		if(SPSORT_SQ == null) { SPSORT_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();



		sql = " SELECT *";
		sql += " FROM IT_ITEM A";
		sql += " WHERE 0 = 0";

		if(! SEARCH_TEXT.equals("")) {
			sql += " AND (";
			sql += "	UPPER(IIM_ITEM_CD) LIKE '%" + SEARCH_TEXT + "%'";
			sql += "	OR UPPER(IIM_SBCD_CD) LIKE '%" + SEARCH_TEXT + "%'";
			sql += "	OR UPPER(IIM_OSCD_CD) LIKE '%" + SEARCH_TEXT + "%'";
			sql += "	OR UPPER(IIM_NITEM_CD) LIKE '%" + SEARCH_TEXT + "%'";
			sql += "	OR UPPER(IIM_KNME_NM) LIKE '%" + SEARCH_TEXT + "%'";
			sql += "	OR UPPER(IIM_ENME_NM) LIKE '%" + SEARCH_TEXT + "%'";
			sql += "	OR UPPER(IIM_SNME_NM) LIKE '%" + SEARCH_TEXT + "%'";
			sql += "	OR UPPER(IIM_ETONME_NM) LIKE '%" + SEARCH_TEXT + "%'";
			sql += ")";
		}

		if(! IIM_EXGN_CD.equals("00")) {
			sql += " AND IIM_EXGN_CD = '" + IIM_EXGN_CD + "'";
		}

		if(! IIM_BLPT_CD.equals("")) {
			sql += " AND IIM_BLPT_CD = '" + IIM_BLPT_CD + "'";
		}

		if(! IIM_USE_YN.equals("A")) {
			sql += " AND IIM_USE_YN = '" + IIM_USE_YN + "'";
		}

		if(SP_CODE.equals("Y")) {
			sql += "AND (IIM_SBCD_CD <> ' ' AND IIM_SBCD_CD IS NOT NULL) ";
		}

		if(SPSORT_SQ.equals("0")) {
			sql += " ORDER BY IIM_ITEM_CD, IIM_SORT_SQ ";
		} else if(SPSORT_SQ.equals("1")){
			sql += " ORDER BY IIM_KNME_NM ";
		} else if(SPSORT_SQ.equals("2")){
			sql += " ORDER BY IIM_SPSORT_SQ, IIM_ITEM_CD ";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_upGetItem_001 \n";
			G_INFO += "설명 : 검사항목 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SEARCH_TEXT : " + SEARCH_TEXT + " \n";
			G_INFO += " IIM_EXGN_CD : " + IIM_EXGN_CD + " \n";
			G_INFO += " IIM_BLPT_CD : " + IIM_BLPT_CD + " \n";
			G_INFO += " LIIM_USE_YN : " + LIIM_USE_YN + " \n";
			G_INFO += " IIM_USE_YN : " + IIM_USE_YN + " \n";
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
