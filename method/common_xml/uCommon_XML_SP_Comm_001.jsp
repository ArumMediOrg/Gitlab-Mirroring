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

SELECT A.CSM_LARGE,   A.CSM_MATT_CD, A.CSM_MATT_NM, A.CSM_INJA_CD, C.CSC_FULL_NM AS CSM_INJA_NM, 
       B.CSC_ETC1_NM, B.CSC_ETC1_CD, B.CSC_ETC2_NM, B.CSC_ETC2_CD
  FROM CT_SP_MATTER A 
       LEFT OUTER JOIN CT_SP_COMMON B ON A.CSM_COMM_CD = B.CSC_SMALL AND B.CSC_LARGE = 'HM99A'
       LEFT OUTER JOIN CT_SP_COMMON C ON A.CSM_INJA_CD = C.CSC_SMALL AND C.CSC_LARGE = 'HM06B'

IF (:MATT_CD <> '') THEN
  WHERE A.CSM_MATT_CD =  :MATT_CD
		*/

		sql = " SELECT A.CSM_LARGE, A.CSM_MATT_CD, A.CSM_MATT_NM, A.CSM_INJA_CD, C.CSC_FULL_NM AS CSM_INJA_NM, B.CSC_ETC1_NM, B.CSC_ETC1_CD, B.CSC_ETC2_NM, B.CSC_ETC2_CD";
		sql += " FROM CT_SP_MATTER A LEFT OUTER JOIN CT_SP_COMMON B";
		sql += " ON A.CSM_COMM_CD = B.CSC_SMALL";
		sql += " AND B.CSC_LARGE = 'HM99A' LEFT OUTER JOIN CT_SP_COMMON C";
		sql += " ON A.CSM_INJA_CD = C.CSC_SMALL";
		sql += " AND C.CSC_LARGE = 'HM06B'";

		if(! MATT_CD.equals("")) {
			sql += " WHERE A.CSM_MATT_CD = '" + MATT_CD + "'";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCommon_XML_SP_Comm_001 \n";
			G_INFO += "설명 : 유해물질 조회 \n";
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
		<s:AttributeType name='CSM_LARGE' rs:number='1' rs:writeunknown='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_LARGE'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MATT_CD' rs:number='2' rs:writeunknown='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MATT_NM' rs:number='3' rs:writeunknown='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_MATT_NM'>
			<s:datatype dt:type='string' dt:maxLength='300' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_INJA_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_INJA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_INJA_NM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_FULL_NM'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC1_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC1_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC1_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC1_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC2_NM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC2_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC2_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_ETC2_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c10' rs:name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c11' rs:name='ROWID' rs:number='12' rs:rowid='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='ROWID'
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

			String CSM_LARGE_T = cRsList.getString("CSM_LARGE");
			String CSM_MATT_CD_T = cRsList.getString("CSM_MATT_CD");
			String CSM_MATT_NM_T = cRsList.getString("CSM_MATT_NM");
			String CSM_INJA_CD_T = cRsList.getString("CSM_INJA_CD");
			String CSM_INJA_NM_T = cRsList.getString("CSM_INJA_NM");
			String CSC_ETC1_NM_T = cRsList.getString("CSC_ETC1_NM");
			String CSC_ETC1_CD_T = cRsList.getString("CSC_ETC1_CD");
			String CSC_ETC2_NM_T = cRsList.getString("CSC_ETC2_NM");
			String CSC_ETC2_CD_T = cRsList.getString("CSC_ETC2_CD");
			String ROWID_T = cRsList.getString("ROWID");
			String c10_T = cRsList.getString("c10");
			String c11_T = cRsList.getString("c11");
%>
			<z:row
<%
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

			if(! CSM_INJA_CD_T.equals("")) {
%>
		 		CSM_INJA_CD='<%= CSM_INJA_CD_T%>'
<%
			}

			if(! CSM_INJA_NM_T.equals("")) {
%>
		 		CSM_INJA_NM='<%= CSM_INJA_NM_T%>'
<%
			}

			if(! CSC_ETC1_NM_T.equals("")) {
%>
		 		CSC_ETC1_NM='<%= CSC_ETC1_NM_T%>'
<%
			}

			if(! CSC_ETC1_CD_T.equals("")) {
%>
		 		CSC_ETC1_CD='<%= CSC_ETC1_CD_T%>'
<%
			}

			if(! CSC_ETC2_NM_T.equals("")) {
%>
		 		CSC_ETC2_NM='<%= CSC_ETC2_NM_T%>'
<%
			}

			if(! CSC_ETC2_CD_T.equals("")) {
%>
		 		CSC_ETC2_CD='<%= CSC_ETC2_CD_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c10='<%= cnt%>'
				c11='<%= cnt%>'
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
