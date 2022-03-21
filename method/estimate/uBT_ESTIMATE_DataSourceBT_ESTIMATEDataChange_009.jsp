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

SELECT (SELECT IIM_KNME_NM FROM IT_ITEM WHERE IIM_ITEM_CD = BEA_ITEM_CD) AS BEA_ITEM_NM, A.*
FROM BT_ESTI_AGEA A 
WHERE BEA_MNGT_YR = :MNGT_YR
   AND BEA_ESTI_CD = :ESTI_CD

		*/

		sql = " SELECT (";
		sql += "	SELECT IIM_KNME_NM";
		sql += " 	FROM IT_ITEM";
		sql += " 	WHERE IIM_ITEM_CD = BEA_ITEM_CD";
		sql += ") AS BEA_ITEM_NM, A.*";
		sql += " FROM BT_ESTI_AGEA A";
		sql += " WHERE BEA_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND BEA_ESTI_CD = '" + ESTI_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTIMATE_DataSourceBT_ESTIMATEDataChange_009 \n";
			G_INFO += "설명 : 추가검사항목 단가 로딩 \n";
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
		<s:AttributeType name='BEA_ITEM_NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='BEA_MNGT_YR' rs:number='2' rs:writeunknown='true' rs:basetable='BT_ESTI_AGEA' rs:basecolumn='BEA_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEA_ESTI_CD' rs:number='3' rs:writeunknown='true' rs:basetable='BT_ESTI_AGEA' rs:basecolumn='BEA_ESTI_CD'>
			<s:datatype dt:type='string' dt:maxLength='8' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEA_ITEM_CD' rs:number='4' rs:writeunknown='true' rs:basetable='BT_ESTI_AGEA' rs:basecolumn='BEA_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEA_ITEM_PR' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_AGEA'
			 rs:basecolumn='BEA_ITEM_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEA_AGEA_PR' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_AGEA'
			 rs:basecolumn='BEA_AGEA_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEA_INPT_ID' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_AGEA'
			 rs:basecolumn='BEA_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BEA_INPT_DTT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_AGEA'
			 rs:basecolumn='BEA_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='BT_ESTI_AGEA' rs:basecolumn='ROWID'
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

			String BEA_ITEM_NM_T = cRsList.getString("BEA_ITEM_NM");
			String BEA_MNGT_YR_T = cRsList.getString("BEA_MNGT_YR");
			String BEA_ESTI_CD_T = cRsList.getString("BEA_ESTI_CD");
			String BEA_ITEM_CD_T = cRsList.getString("BEA_ITEM_CD");
			String BEA_ITEM_PR_T = cRsList.getString("BEA_ITEM_PR");
			String BEA_AGEA_PR_T = cRsList.getString("BEA_AGEA_PR");
			String BEA_INPT_ID_T = cRsList.getString("BEA_INPT_ID");
			String BEA_INPT_DTT_T = cRsList.getDate2("BEA_INPT_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! BEA_ITEM_NM_T.equals("")) {
%>
		 		BEA_ITEM_NM='<%= BEA_ITEM_NM_T%>'
<%
			}

			if(! BEA_MNGT_YR_T.equals("")) {
%>
		 		BEA_MNGT_YR='<%= BEA_MNGT_YR_T%>'
<%
			}

			if(! BEA_ESTI_CD_T.equals("")) {
%>
		 		BEA_ESTI_CD='<%= BEA_ESTI_CD_T%>'
<%
			}

			if(! BEA_ITEM_CD_T.equals("")) {
%>
		 		BEA_ITEM_CD='<%= BEA_ITEM_CD_T%>'
<%
			}

			if(! BEA_ITEM_PR_T.equals("")) {
%>
		 		BEA_ITEM_PR='<%= BEA_ITEM_PR_T%>'
<%
			}

			if(! BEA_AGEA_PR_T.equals("")) {
%>
		 		BEA_AGEA_PR='<%= BEA_AGEA_PR_T%>'
<%
			}

			if(! BEA_INPT_ID_T.equals("")) {
%>
		 		BEA_INPT_ID='<%= BEA_INPT_ID_T%>'
<%
			}

			if(! BEA_INPT_DTT_T.equals("")) {
%>
		 		BEA_INPT_DTT='<%= BEA_INPT_DTT_T%>'
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
