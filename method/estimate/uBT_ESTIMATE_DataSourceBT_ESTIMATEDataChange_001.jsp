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

		String MNGT_YR = htMethod.get("MNGT_YR");
		String ESTI_CD = htMethod.get("ESTI_CD");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ESTI_CD == null) { ESTI_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT BEI_ITEM_CD, BEI_ITEM_PR, (SELECT IIM_KNME_NM FROM IT_ITEM WHERE IIM_ITEM_CD = BEI_ITEM_CD) AS BEI_ITEM_NM
FROM BT_ESTI_PROF_ITEM 
WHERE BEI_MNGT_YR = :MNGT_YR
   AND BEI_ESTI_CD = :ESTI_CD
GROUP BY BEI_ITEM_CD, BEI_ITEM_PR 
		*/

		sql = " SELECT BEI_ITEM_CD, BEI_ITEM_PR";
		sql += ", (";
		sql += "	SELECT IIM_KNME_NM";
		sql += " 	FROM IT_ITEM";
		sql += " 	WHERE IIM_ITEM_CD = BEI_ITEM_CD";
		sql += ") AS BEI_ITEM_NM";
		sql += " FROM BT_ESTI_PROF_ITEM";
		sql += " WHERE BEI_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND BEI_ESTI_CD = '" + ESTI_CD + "'";
		sql += " GROUP BY BEI_ITEM_CD, BEI_ITEM_PR";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTIMATE_DataSourceBT_ESTIMATEDataChange_001 \n";
			G_INFO += "설명 : 유형항목정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ESTI_CD : " + ESTI_CD + " \n";
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
		<s:AttributeType name='BEI_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF_ITEM' rs:basecolumn='BEI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEI_ITEM_PR' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF_ITEM'
			 rs:basecolumn='BEI_ITEM_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEI_ITEM_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='BT_ESTI_PROF_ITEM' rs:basecolumn='ROWID'
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

			String BEI_ITEM_CD_T = cRsList.getString("BEI_ITEM_CD");
			String BEI_ITEM_PR_T = cRsList.getString("BEI_ITEM_PR");
			String BEI_ITEM_NM_T = cRsList.getString("BEI_ITEM_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! BEI_ITEM_CD_T.equals("")) {
%>
		 		BEI_ITEM_CD='<%= BEI_ITEM_CD_T%>'
<%
			}

			if(! BEI_ITEM_PR_T.equals("")) {
%>
		 		BEI_ITEM_PR='<%= BEI_ITEM_PR_T%>'
<%
			}

			if(! BEI_ITEM_NM_T.equals("")) {
%>
		 		BEI_ITEM_NM='<%= BEI_ITEM_NM_T%>'
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
