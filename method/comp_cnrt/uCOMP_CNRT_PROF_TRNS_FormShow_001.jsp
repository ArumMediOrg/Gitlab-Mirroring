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
		String CNRT_SQ = htMethod.get("CNRT_SQ");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT E.ECC_COMP_CD, E.ECC_MNGT_YR, E.ECC_CNRT_SQ, E.ECC_CNRT_NM, E.ECC_CNRT_SDT, E.ECC_CNRT_EDT, I.ICY_COMP_NM
FROM ET_COMP_CNRT E INNER JOIN IT_COMPANY I ON E.ECC_COMP_CD = I.ICY_COMP_CD
WHERE E.ECC_COMP_CD = :COMP_CD
AND   E.ECC_MNGT_YR = :MNGT_YR
AND   E.ECC_CNRT_SQ = :CNRT_SQ
		*/

		sql = " SELECT E.ECC_COMP_CD, E.ECC_MNGT_YR, E.ECC_CNRT_SQ, E.ECC_CNRT_NM, E.ECC_CNRT_SDT, E.ECC_CNRT_EDT, I.ICY_COMP_NM";
		sql += " FROM ET_COMP_CNRT E INNER JOIN IT_COMPANY I";
		sql += " ON E.ECC_COMP_CD = I.ICY_COMP_CD";
		sql += " WHERE E.ECC_COMP_CD = '" + COMP_CD + "'";
		sql += " AND E.ECC_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND E.ECC_CNRT_SQ = '" + CNRT_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_PROF_TRNS_FormShow_001 \n";
			G_INFO += "설명 : 사업장 계약정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
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
		<s:AttributeType name='ECC_COMP_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_MNGT_YR' rs:number='2' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_CNRT_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_NM' rs:number='4' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_CNRT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_SDT' rs:number='5' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_CNRT_SDT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CNRT_EDT' rs:number='6' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ECC_CNRT_EDT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='7' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c8' rs:name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
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

			String ECC_COMP_CD_T = cRsList.getString("ECC_COMP_CD");
			String ECC_MNGT_YR_T = cRsList.getString("ECC_MNGT_YR");
			String ECC_CNRT_SQ_T = cRsList.getString("ECC_CNRT_SQ");
			String ECC_CNRT_NM_T = cRsList.getString("ECC_CNRT_NM");
			String ECC_CNRT_SDT_T = cRsList.getString("ECC_CNRT_SDT");
			String ECC_CNRT_EDT_T = cRsList.getString("ECC_CNRT_EDT");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c8_T = cRsList.getString("c8");
%>
			<z:row
<%
			if(! ECC_COMP_CD_T.equals("")) {
%>
		 		ECC_COMP_CD='<%= ECC_COMP_CD_T%>'
<%
			}

			if(! ECC_MNGT_YR_T.equals("")) {
%>
		 		ECC_MNGT_YR='<%= ECC_MNGT_YR_T%>'
<%
			}

			if(! ECC_CNRT_SQ_T.equals("")) {
%>
		 		ECC_CNRT_SQ='<%= ECC_CNRT_SQ_T%>'
<%
			}

			if(! ECC_CNRT_NM_T.equals("")) {
%>
		 		ECC_CNRT_NM='<%= ECC_CNRT_NM_T%>'
<%
			}

			if(! ECC_CNRT_SDT_T.equals("")) {
%>
		 		ECC_CNRT_SDT='<%= ECC_CNRT_SDT_T%>'
<%
			}

			if(! ECC_CNRT_EDT_T.equals("")) {
%>
		 		ECC_CNRT_EDT='<%= ECC_CNRT_EDT_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
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
