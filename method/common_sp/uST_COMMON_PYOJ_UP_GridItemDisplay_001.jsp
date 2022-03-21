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

		String JJ_CD = htMethod.get("JJ_CD");

		//
		if(JJ_CD == null) { JJ_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.IIM_KNME_NM CSP_SBCD_NM, A.CSP_JJ_CD, A.CSP_JJ_NM, A.CSP_SBCD_CD, A.CSP_CHASU, A.CSP_CHOC_KD,  
        GetSP_COMMON_cdToNm('HM99E',A.CSP_CHOC_KD) CSP_CHOC_NM
FROM CT_SP_PROF A INNER JOIN IT_ITEM B ON A.CSP_SBCD_CD = B.IIM_SBCD_CD  
WHERE A.CSP_JJ_CD = :JJ_CD
        and A.CSP_USE_YN = 'Y'
ORDER BY A.CSP_CHASU, A.CSP_SBCD_CD 

		*/

		sql = " SELECT B.IIM_KNME_NM CSP_SBCD_NM, A.CSP_JJ_CD, A.CSP_JJ_NM, A.CSP_SBCD_CD, A.CSP_CHASU, A.CSP_CHOC_KD, GetSP_COMMON_cdToNm('HM99E',A.CSP_CHOC_KD) CSP_CHOC_NM";
		sql += " FROM CT_SP_PROF A INNER JOIN IT_ITEM B";
		sql += " ON A.CSP_SBCD_CD = B.IIM_SBCD_CD";
		sql += " WHERE A.CSP_JJ_CD = '" + JJ_CD + "'";
		sql += " AND A.CSP_USE_YN = 'Y'";
		sql += " ORDER BY A.CSP_CHASU, A.CSP_SBCD_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uST_COMMON_PYOJ_UP_GridItemDisplay_001 \n";
			G_INFO += "설명 : 특검 아이템 정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " JJ_CD : " + JJ_CD + " \n";
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
		<s:AttributeType name='CSP_SBCD_NM' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_JJ_CD' rs:number='2' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_JJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_JJ_NM' rs:number='3' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_JJ_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_SBCD_CD' rs:number='4' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_CHASU' rs:number='5' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_CHASU'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_CHOC_KD' rs:number='6' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_CHOC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_CHOC_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='CT_SP_PROF' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c8' rs:name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
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

			String CSP_SBCD_NM_T = cRsList.getString("CSP_SBCD_NM");
			String CSP_JJ_CD_T = cRsList.getString("CSP_JJ_CD");
			String CSP_JJ_NM_T = cRsList.getString("CSP_JJ_NM");
			String CSP_SBCD_CD_T = cRsList.getString("CSP_SBCD_CD");
			String CSP_CHASU_T = cRsList.getString("CSP_CHASU");
			String CSP_CHOC_KD_T = cRsList.getString("CSP_CHOC_KD");
			String CSP_CHOC_NM_T = cRsList.getString("CSP_CHOC_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c8_T = cRsList.getString("c8");
%>
			<z:row
<%
			if(! CSP_SBCD_NM_T.equals("")) {
%>
		 		CSP_SBCD_NM='<%= CSP_SBCD_NM_T%>'
<%
			}

			if(! CSP_JJ_CD_T.equals("")) {
%>
		 		CSP_JJ_CD='<%= CSP_JJ_CD_T%>'
<%
			}

			if(! CSP_JJ_NM_T.equals("")) {
%>
		 		CSP_JJ_NM='<%= CSP_JJ_NM_T%>'
<%
			}

			if(! CSP_SBCD_CD_T.equals("")) {
%>
		 		CSP_SBCD_CD='<%= CSP_SBCD_CD_T%>'
<%
			}

			if(! CSP_CHASU_T.equals("")) {
%>
		 		CSP_CHASU='<%= CSP_CHASU_T%>'
<%
			}

			if(! CSP_CHOC_KD_T.equals("")) {
%>
		 		CSP_CHOC_KD='<%= CSP_CHOC_KD_T%>'
<%
			}

			if(! CSP_CHOC_NM_T.equals("")) {
%>
		 		CSP_CHOC_NM='<%= CSP_CHOC_NM_T%>'
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
