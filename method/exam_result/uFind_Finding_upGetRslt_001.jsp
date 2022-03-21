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

		String SPART_CD_SLT = htMethod.get("SPART_CD_SLT");
		String SSUB_SLT = htMethod.get("SSUB_SLT");
		String SSUB2_SLT = htMethod.get("SSUB2_SLT");
		String SITEM_CD_SLT = htMethod.get("SITEM_CD_SLT");
		String EDTSEARCH = htMethod.get("EDTSEARCH");
		String SPART_CD = htMethod.get("SPART_CD");

		//
		if(SPART_CD_SLT == null) { SPART_CD_SLT = ""; }
		if(SSUB_SLT == null) { SSUB_SLT = ""; }
		if(SSUB2_SLT == null) { SSUB2_SLT = ""; }
		if(SITEM_CD_SLT == null) { SITEM_CD_SLT = ""; }
		if(EDTSEARCH == null) { EDTSEARCH = ""; }
		if(SPART_CD == null) { SPART_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT * FROM (";
		sql += " SELECT '2' AS NUM, A.*";
		sql += " FROM IT_FINDING A";
		sql += " WHERE IFG_USE_YN = 'Y'";

		if(!SPART_CD_SLT.equals("")) {
			sql += " AND IFG_PART_CD = '" + SPART_CD_SLT + "'";
		}

		if(!SSUB_SLT.equals("")) {
			sql += " AND IFG_SUB_CD LIKE '%" + SSUB_SLT + "%'";
		}

		if(!SSUB2_SLT.equals("")) {
			sql += " AND (IFG_SUB2_CD = '" + SSUB2_SLT + "'";
			sql += " OR NVL(IFG_SUB2_CD,' ') = ' ')";
		}

		if(!SITEM_CD_SLT.equals("")) {
			sql += " AND (IFG_ITEM_CD1 = '" + SITEM_CD_SLT + "'";
			sql += " OR IFG_ITEM_CD2 = '" + SITEM_CD_SLT + "'";
			sql += " OR IFG_ITEM_CD3 = '" + SITEM_CD_SLT + "'";
			sql += " OR IFG_ITEM_CD4 = '" + SITEM_CD_SLT + "' )";
		}

		if(!EDTSEARCH.equals("")) {
			sql += " AND (IFG_TITLE_NM LIKE '%" + EDTSEARCH + "%'";
			sql += " OR IFG_RSLT_EX LIKE '%" + EDTSEARCH + "%')";
		}

		if(!SPART_CD.equals("")) {
			sql += " UNION";
			sql += " SELECT '1' AS NUM, B.*";
			sql += " FROM IT_FINDING B";
			sql += " WHERE IFG_USE_YN = 'Y'";
			sql += " AND IFG_COMM_YN = 'Y'";
		}
		sql += " ) G1";
		sql += " ORDER BY NUM, IFG_RSLT_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFind_Finding_upGetRslt_001 \n";
			G_INFO += "설명 : 장문소견조회(소견내역 조회) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SPART_CD_SLT : " + SPART_CD_SLT + " \n";
			G_INFO += " SSUB_SLT : " + SSUB_SLT + " \n";
			G_INFO += " SSUB2_SLT : " + SSUB2_SLT + " \n";
			G_INFO += " SITEM_CD_SLT : " + SITEM_CD_SLT + " \n";
			G_INFO += " EDTSEARCH : " + EDTSEARCH + " \n";
			G_INFO += " SPART_CD : " + SPART_CD + " \n";
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
