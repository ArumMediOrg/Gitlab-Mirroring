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

		//
		if(COMP_CD == null) { COMP_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM IT_COMPANY_PERS
WHERE 0 = 0
  AND ICP_COMP_CD = :COMP_CD
		*/

		sql = " SELECT *";
		sql += " FROM IT_COMPANY_PERS";
		sql += " WHERE 0 = 0";
		sql += " AND ICP_COMP_CD = '" + COMP_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMPANY_DataSourceIT_COMPANYDataChange_001 \n";
			G_INFO += "설명 : 사업장 인원(년도별) 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
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
		<s:AttributeType name='ICP_COMP_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS' rs:basecolumn='ICP_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_MNGT_YR' rs:number='2' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS' rs:basecolumn='ICP_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_TOT_M' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS'
			 rs:basecolumn='ICP_TOT_M'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_TOT_F' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS'
			 rs:basecolumn='ICP_TOT_F'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_PROD_M' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS'
			 rs:basecolumn='ICP_PROD_M'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_PROD_F' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS'
			 rs:basecolumn='ICP_PROD_F'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_BUSI_M' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS'
			 rs:basecolumn='ICP_BUSI_M'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_BUSI_F' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS'
			 rs:basecolumn='ICP_BUSI_F'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_USE_YN' rs:number='9' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS' rs:basecolumn='ICP_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_USED_ID' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS'
			 rs:basecolumn='ICP_USED_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_USED_DTT' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS'
			 rs:basecolumn='ICP_USED_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_INPT_ID' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS'
			 rs:basecolumn='ICP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_INPT_DTT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS'
			 rs:basecolumn='ICP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_MODI_ID' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS'
			 rs:basecolumn='ICP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICP_MODI_DTT' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS'
			 rs:basecolumn='ICP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='16' rs:rowid='true' rs:writeunknown='true' rs:basetable='IT_COMPANY_PERS'
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

			String ICP_COMP_CD_T = cRsList.getString("ICP_COMP_CD");
			String ICP_MNGT_YR_T = cRsList.getString("ICP_MNGT_YR");
			String ICP_TOT_M_T = cRsList.getString("ICP_TOT_M");
			String ICP_TOT_F_T = cRsList.getString("ICP_TOT_F");
			String ICP_PROD_M_T = cRsList.getString("ICP_PROD_M");
			String ICP_PROD_F_T = cRsList.getString("ICP_PROD_F");
			String ICP_BUSI_M_T = cRsList.getString("ICP_BUSI_M");
			String ICP_BUSI_F_T = cRsList.getString("ICP_BUSI_F");
			String ICP_USE_YN_T = cRsList.getString("ICP_USE_YN");
			String ICP_USED_ID_T = cRsList.getString("ICP_USED_ID");
			String ICP_USED_DTT_T = cRsList.getDate2("ICP_USED_DTT");
			String ICP_INPT_ID_T = cRsList.getString("ICP_INPT_ID");
			String ICP_INPT_DTT_T = cRsList.getDate2("ICP_INPT_DTT");
			String ICP_MODI_ID_T = cRsList.getString("ICP_MODI_ID");
			String ICP_MODI_DTT_T = cRsList.getDate2("ICP_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ICP_COMP_CD_T.equals("")) {
%>
		 		ICP_COMP_CD='<%= ICP_COMP_CD_T%>'
<%
			}

			if(! ICP_MNGT_YR_T.equals("")) {
%>
		 		ICP_MNGT_YR='<%= ICP_MNGT_YR_T%>'
<%
			}

			if(! ICP_TOT_M_T.equals("")) {
%>
		 		ICP_TOT_M='<%= ICP_TOT_M_T%>'
<%
			}

			if(! ICP_TOT_F_T.equals("")) {
%>
		 		ICP_TOT_F='<%= ICP_TOT_F_T%>'
<%
			}

			if(! ICP_PROD_M_T.equals("")) {
%>
		 		ICP_PROD_M='<%= ICP_PROD_M_T%>'
<%
			}

			if(! ICP_PROD_F_T.equals("")) {
%>
		 		ICP_PROD_F='<%= ICP_PROD_F_T%>'
<%
			}

			if(! ICP_BUSI_M_T.equals("")) {
%>
		 		ICP_BUSI_M='<%= ICP_BUSI_M_T%>'
<%
			}

			if(! ICP_BUSI_F_T.equals("")) {
%>
		 		ICP_BUSI_F='<%= ICP_BUSI_F_T%>'
<%
			}

			if(! ICP_USE_YN_T.equals("")) {
%>
		 		ICP_USE_YN='<%= ICP_USE_YN_T%>'
<%
			}

			if(! ICP_USED_ID_T.equals("")) {
%>
		 		ICP_USED_ID='<%= ICP_USED_ID_T%>'
<%
			}

			if(! ICP_USED_DTT_T.equals("")) {
%>
		 		ICP_USED_DTT='<%= ICP_USED_DTT_T%>'
<%
			}

			if(! ICP_INPT_ID_T.equals("")) {
%>
		 		ICP_INPT_ID='<%= ICP_INPT_ID_T%>'
<%
			}

			if(! ICP_INPT_DTT_T.equals("")) {
%>
		 		ICP_INPT_DTT='<%= ICP_INPT_DTT_T%>'
<%
			}

			if(! ICP_MODI_ID_T.equals("")) {
%>
		 		ICP_MODI_ID='<%= ICP_MODI_ID_T%>'
<%
			}

			if(! ICP_MODI_DTT_T.equals("")) {
%>
		 		ICP_MODI_DTT='<%= ICP_MODI_DTT_T%>'
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
