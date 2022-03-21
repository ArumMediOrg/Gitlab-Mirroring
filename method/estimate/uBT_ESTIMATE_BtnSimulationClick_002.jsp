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
		String PROF_SQ = htMethod.get("PROF_SQ");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ESTI_CD == null) { ESTI_CD = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.BEM_OPTN_SQ, A.BEM_ITEM_CD, A.BEM_ITEM_PR, A.BEM_ITEM_PR, B.BEO_OPTN_CNT AS BEM_OPTN_CNT, B.BEO_OPTN_PR AS BEM_OPTN_PR, 
       (SELECT IIM_KNME_NM FROM IT_ITEM WHERE IIM_ITEM_CD = BEM_ITEM_CD) AS BEM_ITEM_NM 
  FROM BT_ESTI_OPTN_ITEM A INNER JOIN BT_ESTI_OPTN B ON A.BEM_MNGT_YR = B.BEO_MNGT_YR AND A.BEM_ESTI_CD = B.BEO_ESTI_CD AND A.BEM_PROF_SQ = B.BEO_PROF_SQ 
 WHERE A.BEM_MNGT_YR = :MNGT_YR
   AND A.BEM_ESTI_CD = :ESTI_CD
   AND A.BEM_PROF_SQ = :PROF_SQ
 ORDER BY A.BEM_OPTN_SQ 

		*/

		sql = " SELECT A.BEM_OPTN_SQ, A.BEM_ITEM_CD, A.BEM_ITEM_PR, A.BEM_ITEM_PR, B.BEO_OPTN_CNT AS BEM_OPTN_CNT, B.BEO_OPTN_PR AS BEM_OPTN_PR";
		sql += ", (";
		sql += "	SELECT IIM_KNME_NM";
		sql += " 	FROM IT_ITEM";
		sql += " 	WHERE IIM_ITEM_CD = BEM_ITEM_CD";
		sql += ") AS BEM_ITEM_NM";
		sql += " FROM BT_ESTI_OPTN_ITEM A INNER JOIN BT_ESTI_OPTN B";
		sql += " ON A.BEM_MNGT_YR = B.BEO_MNGT_YR";
		sql += " AND A.BEM_ESTI_CD = B.BEO_ESTI_CD";
		sql += " AND A.BEM_PROF_SQ = B.BEO_PROF_SQ";
		sql += " WHERE A.BEM_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND A.BEM_ESTI_CD = '" + ESTI_CD + "'";
		sql += " AND A.BEM_PROF_SQ = '" + PROF_SQ + "'";
		sql += " ORDER BY A.BEM_OPTN_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTIMATE_BtnSimulationClick_002 \n";
			G_INFO += "설명 : 옵션항목정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ESTI_CD : " + ESTI_CD + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
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
		<s:AttributeType name='BEM_OPTN_SQ' rs:number='1' rs:writeunknown='true' rs:basetable='BT_ESTI_OPTN_ITEM' rs:basecolumn='BEM_OPTN_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEM_ITEM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='BT_ESTI_OPTN_ITEM' rs:basecolumn='BEM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEM_ITEM_PR' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_OPTN_ITEM'
			 rs:basecolumn='BEM_ITEM_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='c3' rs:name='BEM_ITEM_PR' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_OPTN_ITEM'
			 rs:basecolumn='BEM_ITEM_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEM_OPTN_CNT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_OPTN'
			 rs:basecolumn='BEO_OPTN_CNT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEM_OPTN_PR' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_OPTN'
			 rs:basecolumn='BEO_OPTN_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEM_ITEM_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='BT_ESTI_OPTN_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c8' rs:name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='BT_ESTI_OPTN' rs:basecolumn='ROWID'
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

			String BEM_OPTN_SQ_T = cRsList.getString("BEM_OPTN_SQ");
			String BEM_ITEM_CD_T = cRsList.getString("BEM_ITEM_CD");
			String BEM_ITEM_PR_T = cRsList.getString("BEM_ITEM_PR");
			String c3_T = cRsList.getString("c3");
			String BEM_OPTN_CNT_T = cRsList.getString("BEM_OPTN_CNT");
			String BEM_OPTN_PR_T = cRsList.getString("BEM_OPTN_PR");
			String BEM_ITEM_NM_T = cRsList.getString("BEM_ITEM_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c8_T = cRsList.getString("c8");
%>
			<z:row
<%
			if(! BEM_OPTN_SQ_T.equals("")) {
%>
		 		BEM_OPTN_SQ='<%= BEM_OPTN_SQ_T%>'
<%
			}

			if(! BEM_ITEM_CD_T.equals("")) {
%>
		 		BEM_ITEM_CD='<%= BEM_ITEM_CD_T%>'
<%
			}

			if(! BEM_ITEM_PR_T.equals("")) {
%>
		 		BEM_ITEM_PR='<%= BEM_ITEM_PR_T%>'
<%
			}

			if(! c3_T.equals("")) {
%>
		 		c3='<%= c3_T%>'
<%
			}

			if(! BEM_OPTN_CNT_T.equals("")) {
%>
		 		BEM_OPTN_CNT='<%= BEM_OPTN_CNT_T%>'
<%
			}

			if(! BEM_OPTN_PR_T.equals("")) {
%>
		 		BEM_OPTN_PR='<%= BEM_OPTN_PR_T%>'
<%
			}

			if(! BEM_ITEM_NM_T.equals("")) {
%>
		 		BEM_ITEM_NM='<%= BEM_ITEM_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c8='<%= cnt%>'
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
