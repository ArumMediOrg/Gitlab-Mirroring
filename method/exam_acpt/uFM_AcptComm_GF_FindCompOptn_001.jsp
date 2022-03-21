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

		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String PROF_SQ = htMethod.get("PROF_SQ");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT ECO_OPTN_SQ OPTN_SQ, ECO_OPTN_NM, ECO_OPTN_LT, 
       ECO_OPTN_NM OPTN_NM, ECO_OPTN_CNT OPTN_CNT, ECO_OPTN_PR OPTN_PR 
  FROM ET_COMP_CNRT_OPTN 
 WHERE ECO_COMP_CD = :COMP_CD
   AND ECO_MNGT_YR = :MNGT_YR
   AND ECO_CNRT_SQ || ECO_PROF_SQ = :PROF_SQ
   AND UPPER(ECO_USE_YN) = 'Y'
 ORDER BY ECO_OPTN_SQ

		*/

		sql = " SELECT ECO_OPTN_SQ OPTN_SQ, ECO_OPTN_NM, ECO_OPTN_LT, ECO_OPTN_NM OPTN_NM, ECO_OPTN_CNT OPTN_CNT, ECO_OPTN_PR OPTN_PR";
		sql += " FROM ET_COMP_CNRT_OPTN";
		sql += " WHERE ECO_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ECO_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND ECO_CNRT_SQ || ECO_PROF_SQ = '" + PROF_SQ + "'";
		sql += " AND UPPER(ECO_USE_YN) = 'Y'";
		sql += " ORDER BY ECO_OPTN_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_FindCompOptn_001 \n";
			G_INFO += "설명 : 사업장묶음 종검옵션 세팅 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
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
		<s:AttributeType name='OPTN_SQ' rs:number='1' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_OPTN_NM' rs:number='2' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_OPTN_LT' rs:number='3' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_LT'>
			<s:datatype dt:type='string' dt:maxLength='400' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_NM' rs:number='4' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_CNT' rs:number='5' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_CNT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_PR' rs:number='6' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ROWID'
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

			String OPTN_SQ_T = cRsList.getString("OPTN_SQ");
			String ECO_OPTN_NM_T = cRsList.getString("ECO_OPTN_NM");
			String ECO_OPTN_LT_T = cRsList.getString("ECO_OPTN_LT");
			String OPTN_NM_T = cRsList.getString("OPTN_NM");
			String OPTN_CNT_T = cRsList.getString("OPTN_CNT");
			String OPTN_PR_T = cRsList.getString("OPTN_PR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! OPTN_SQ_T.equals("")) {
%>
		 		OPTN_SQ='<%= OPTN_SQ_T%>'
<%
			}

			if(! ECO_OPTN_NM_T.equals("")) {
%>
		 		ECO_OPTN_NM='<%= ECO_OPTN_NM_T%>'
<%
			}

			if(! ECO_OPTN_LT_T.equals("")) {
%>
		 		ECO_OPTN_LT='<%= ECO_OPTN_LT_T%>'
<%
			}

			if(! OPTN_NM_T.equals("")) {
%>
		 		OPTN_NM='<%= OPTN_NM_T%>'
<%
			}

			if(! OPTN_CNT_T.equals("")) {
%>
		 		OPTN_CNT='<%= OPTN_CNT_T%>'
<%
			}

			if(! OPTN_PR_T.equals("")) {
%>
		 		OPTN_PR='<%= OPTN_PR_T%>'
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
