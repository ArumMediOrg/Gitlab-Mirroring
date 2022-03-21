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
		String SBCD_CD = htMethod.get("SBCD_CD");

		//
		if(JJ_CD == null) { JJ_CD = ""; }
		if(SBCD_CD == null) { SBCD_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM CT_SP_PROF 
 WHERE CSP_JJ_CD   = :JJ_CD 
   AND CSP_SBCD_CD = :SBCD_CD

		*/

		sql = " SELECT *";
		sql += " FROM CT_SP_PROF";
		sql += " WHERE CSP_JJ_CD = '" + JJ_CD + "'";
		sql += " AND CSP_SBCD_CD = '" + SBCD_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_PROF_APPLY_FormShow_001 \n";
			G_INFO += "설명 : 특검유형정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " JJ_CD : " + JJ_CD + " \n";
			G_INFO += " SBCD_CD : " + SBCD_CD + " \n";
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
		<s:AttributeType name='CSP_JJ_CD' rs:number='1' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_JJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_SBCD_CD' rs:number='2' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_CHOC_KD' rs:number='3' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_CHOC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_JJ_NM' rs:number='4' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_JJ_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_JANGGI_CD' rs:number='5' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_JANGGI_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_CHASU' rs:number='6' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_CHASU'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_USE_YN' rs:number='7' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_NUSE_ID' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_PROF'
			 rs:basecolumn='CSP_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_NUSE_DTT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_PROF'
			 rs:basecolumn='CSP_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_INPT_ID' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_PROF'
			 rs:basecolumn='CSP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_INPT_DTT' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_PROF'
			 rs:basecolumn='CSP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_MODI_ID' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_PROF'
			 rs:basecolumn='CSP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_MODI_DTT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_PROF'
			 rs:basecolumn='CSP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_SBCD_SQ' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_PROF'
			 rs:basecolumn='CSP_SBCD_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='15' rs:rowid='true' rs:writeunknown='true' rs:basetable='CT_SP_PROF'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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

			String CSP_JJ_CD_T = cRsList.getString("CSP_JJ_CD");
			String CSP_SBCD_CD_T = cRsList.getString("CSP_SBCD_CD");
			String CSP_CHOC_KD_T = cRsList.getString("CSP_CHOC_KD");
			String CSP_JJ_NM_T = cRsList.getString("CSP_JJ_NM");
			String CSP_JANGGI_CD_T = cRsList.getString("CSP_JANGGI_CD");
			String CSP_CHASU_T = cRsList.getString("CSP_CHASU");
			String CSP_USE_YN_T = cRsList.getString("CSP_USE_YN");
			String CSP_NUSE_ID_T = cRsList.getString("CSP_NUSE_ID");
			String CSP_NUSE_DTT_T = cRsList.getDate2("CSP_NUSE_DTT");
			String CSP_INPT_ID_T = cRsList.getString("CSP_INPT_ID");
			String CSP_INPT_DTT_T = cRsList.getDate2("CSP_INPT_DTT");
			String CSP_MODI_ID_T = cRsList.getString("CSP_MODI_ID");
			String CSP_MODI_DTT_T = cRsList.getDate2("CSP_MODI_DTT");
			String CSP_SBCD_SQ_T = cRsList.getString("CSP_SBCD_SQ");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CSP_JJ_CD_T.equals("")) {
%>
		 		CSP_JJ_CD='<%= CSP_JJ_CD_T%>'
<%
			}

			if(! CSP_SBCD_CD_T.equals("")) {
%>
		 		CSP_SBCD_CD='<%= CSP_SBCD_CD_T%>'
<%
			}

			if(! CSP_CHOC_KD_T.equals("")) {
%>
		 		CSP_CHOC_KD='<%= CSP_CHOC_KD_T%>'
<%
			}

			if(! CSP_JJ_NM_T.equals("")) {
%>
		 		CSP_JJ_NM='<%= CSP_JJ_NM_T%>'
<%
			}

			if(! CSP_JANGGI_CD_T.equals("")) {
%>
		 		CSP_JANGGI_CD='<%= CSP_JANGGI_CD_T%>'
<%
			}

			if(! CSP_CHASU_T.equals("")) {
%>
		 		CSP_CHASU='<%= CSP_CHASU_T%>'
<%
			}

			if(! CSP_USE_YN_T.equals("")) {
%>
		 		CSP_USE_YN='<%= CSP_USE_YN_T%>'
<%
			}

			if(! CSP_NUSE_ID_T.equals("")) {
%>
		 		CSP_NUSE_ID='<%= CSP_NUSE_ID_T%>'
<%
			}

			if(! CSP_NUSE_DTT_T.equals("")) {
%>
		 		CSP_NUSE_DTT='<%= CSP_NUSE_DTT_T%>'
<%
			}

			if(! CSP_INPT_ID_T.equals("")) {
%>
		 		CSP_INPT_ID='<%= CSP_INPT_ID_T%>'
<%
			}

			if(! CSP_INPT_DTT_T.equals("")) {
%>
		 		CSP_INPT_DTT='<%= CSP_INPT_DTT_T%>'
<%
			}

			if(! CSP_MODI_ID_T.equals("")) {
%>
		 		CSP_MODI_ID='<%= CSP_MODI_ID_T%>'
<%
			}

			if(! CSP_MODI_DTT_T.equals("")) {
%>
		 		CSP_MODI_DTT='<%= CSP_MODI_DTT_T%>'
<%
			}

			if(! CSP_SBCD_SQ_T.equals("")) {
%>
		 		CSP_SBCD_SQ='<%= CSP_SBCD_SQ_T%>'
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
