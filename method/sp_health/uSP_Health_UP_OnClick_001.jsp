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

		String MATT_CD = htMethod.get("MATT_CD");

		//
		if(MATT_CD == null) { MATT_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT GetSP_COMMON_cdToNm('HM05H',A.CSM_JIB_CD) CSM_JIB_NM,
       GetSP_COMMON_cdToNm('HM06B',A.CSM_INJA_CD) CSM_INJA_NM,
       GetSP_COMMON_cdToNm('HM99B',A.CSM_PERIOD_TM) CSM_PERIOD_NM,
       GetSP_COMMON_cdToNm('HM99C',A.CSM_AFTER_TM) CSM_AFTER_NM,
       GetSP_COMMON_cdToNm('HM99A',A.CSM_COMM_CD) CSM_COMM_NM,
       A.*
  FROM CT_SP_MATTER A
 WHERE 0 = 0
   AND A.CSM_USE_YN = 'Y'
   And A.CSM_MATT_CD = :MATT_CD
		*/

		sql = " SELECT GETSP_COMMON_CDTONM('HM05H',A.CSM_JIB_CD) CSM_JIB_NM, GETSP_COMMON_CDTONM('HM06B',A.CSM_INJA_CD) CSM_INJA_NM, GETSP_COMMON_CDTONM('HM99B',A.CSM_PERIOD_TM) CSM_PERIOD_NM, GETSP_COMMON_CDTONM('HM99C',A.CSM_AFTER_TM) CSM_AFTER_NM, GETSP_COMMON_CDTONM('HM99A',A.CSM_COMM_CD) CSM_COMM_NM, A.*";
		sql += " FROM CT_SP_MATTER A";
		sql += " WHERE 0 = 0";
		sql += " AND A.CSM_USE_YN = 'Y'";
		sql += " AND A.CSM_MATT_CD = '" + MATT_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_UP_OnClick_001 \n";
			G_INFO += "설명 : 해당물질 질병코드,명 등 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MATT_CD : " + MATT_CD + " \n";
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
		<s:AttributeType name='CSM_JIB_NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_INJA_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_PERIOD_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_AFTER_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_COMM_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_LARGE' rs:number='6' rs:writeunknown='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_LARGE'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MATT_CD' rs:number='7' rs:writeunknown='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MATT_NM' rs:number='8' rs:writeunknown='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_MATT_NM'>
			<s:datatype dt:type='string' dt:maxLength='300' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_JIB_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_JIB_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_INJA_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_INJA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_PERIOD_TM' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_PERIOD_TM'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_AFTER_TM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_AFTER_TM'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_COMM_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_COMM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_STAT_YR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_STAT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_USE_YN' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_NUSE_ID' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_NUSE_DTT' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_INPT_ID' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_INPT_DTT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MODI_ID' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MODI_DTT' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='22' rs:rowid='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='ROWID'
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

			String CSM_JIB_NM_T = cRsList.getString("CSM_JIB_NM");
			String CSM_INJA_NM_T = cRsList.getString("CSM_INJA_NM");
			String CSM_PERIOD_NM_T = cRsList.getString("CSM_PERIOD_NM");
			String CSM_AFTER_NM_T = cRsList.getString("CSM_AFTER_NM");
			String CSM_COMM_NM_T = cRsList.getString("CSM_COMM_NM");
			String CSM_LARGE_T = cRsList.getString("CSM_LARGE");
			String CSM_MATT_CD_T = cRsList.getString("CSM_MATT_CD");
			String CSM_MATT_NM_T = cRsList.getString("CSM_MATT_NM");
			String CSM_JIB_CD_T = cRsList.getString("CSM_JIB_CD");
			String CSM_INJA_CD_T = cRsList.getString("CSM_INJA_CD");
			String CSM_PERIOD_TM_T = cRsList.getString("CSM_PERIOD_TM");
			String CSM_AFTER_TM_T = cRsList.getString("CSM_AFTER_TM");
			String CSM_COMM_CD_T = cRsList.getString("CSM_COMM_CD");
			String CSM_STAT_YR_T = cRsList.getString("CSM_STAT_YR");
			String CSM_USE_YN_T = cRsList.getString("CSM_USE_YN");
			String CSM_NUSE_ID_T = cRsList.getString("CSM_NUSE_ID");
			String CSM_NUSE_DTT_T = cRsList.getDate2("CSM_NUSE_DTT");
			String CSM_INPT_ID_T = cRsList.getString("CSM_INPT_ID");
			String CSM_INPT_DTT_T = cRsList.getDate2("CSM_INPT_DTT");
			String CSM_MODI_ID_T = cRsList.getString("CSM_MODI_ID");
			String CSM_MODI_DTT_T = cRsList.getDate2("CSM_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CSM_JIB_NM_T.equals("")) {
%>
		 		CSM_JIB_NM='<%= CSM_JIB_NM_T%>'
<%
			}

			if(! CSM_INJA_NM_T.equals("")) {
%>
		 		CSM_INJA_NM='<%= CSM_INJA_NM_T%>'
<%
			}

			if(! CSM_PERIOD_NM_T.equals("")) {
%>
		 		CSM_PERIOD_NM='<%= CSM_PERIOD_NM_T%>'
<%
			}

			if(! CSM_AFTER_NM_T.equals("")) {
%>
		 		CSM_AFTER_NM='<%= CSM_AFTER_NM_T%>'
<%
			}

			if(! CSM_COMM_NM_T.equals("")) {
%>
		 		CSM_COMM_NM='<%= CSM_COMM_NM_T%>'
<%
			}

			if(! CSM_LARGE_T.equals("")) {
%>
		 		CSM_LARGE='<%= CSM_LARGE_T%>'
<%
			}

			if(! CSM_MATT_CD_T.equals("")) {
%>
		 		CSM_MATT_CD='<%= CSM_MATT_CD_T%>'
<%
			}

			if(! CSM_MATT_NM_T.equals("")) {
%>
		 		CSM_MATT_NM='<%= CSM_MATT_NM_T%>'
<%
			}

			if(! CSM_JIB_CD_T.equals("")) {
%>
		 		CSM_JIB_CD='<%= CSM_JIB_CD_T%>'
<%
			}

			if(! CSM_INJA_CD_T.equals("")) {
%>
		 		CSM_INJA_CD='<%= CSM_INJA_CD_T%>'
<%
			}

			if(! CSM_PERIOD_TM_T.equals("")) {
%>
		 		CSM_PERIOD_TM='<%= CSM_PERIOD_TM_T%>'
<%
			}

			if(! CSM_AFTER_TM_T.equals("")) {
%>
		 		CSM_AFTER_TM='<%= CSM_AFTER_TM_T%>'
<%
			}

			if(! CSM_COMM_CD_T.equals("")) {
%>
		 		CSM_COMM_CD='<%= CSM_COMM_CD_T%>'
<%
			}

			if(! CSM_STAT_YR_T.equals("")) {
%>
		 		CSM_STAT_YR='<%= CSM_STAT_YR_T%>'
<%
			}

			if(! CSM_USE_YN_T.equals("")) {
%>
		 		CSM_USE_YN='<%= CSM_USE_YN_T%>'
<%
			}

			if(! CSM_NUSE_ID_T.equals("")) {
%>
		 		CSM_NUSE_ID='<%= CSM_NUSE_ID_T%>'
<%
			}

			if(! CSM_NUSE_DTT_T.equals("")) {
%>
		 		CSM_NUSE_DTT='<%= CSM_NUSE_DTT_T%>'
<%
			}

			if(! CSM_INPT_ID_T.equals("")) {
%>
		 		CSM_INPT_ID='<%= CSM_INPT_ID_T%>'
<%
			}

			if(! CSM_INPT_DTT_T.equals("")) {
%>
		 		CSM_INPT_DTT='<%= CSM_INPT_DTT_T%>'
<%
			}

			if(! CSM_MODI_ID_T.equals("")) {
%>
		 		CSM_MODI_ID='<%= CSM_MODI_ID_T%>'
<%
			}

			if(! CSM_MODI_DTT_T.equals("")) {
%>
		 		CSM_MODI_DTT='<%= CSM_MODI_DTT_T%>'
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
