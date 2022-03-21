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

		//String sSQL_ADD = htMethod.get("sSQL_ADD");
		String SQL_ADD = htMethod.get("SQL_ADD");
		
		//
		if(SQL_ADD == null) { SQL_ADD = ""; }
		
		// DB객체
		stmtList = connect.createStatement();
		/*
				SELECT A.CSM_LARGE, A.CSM_MATT_CD, A.CSM_MATT_NM, B.CSC_ETC1_NM, B.CSC_ETC1_CD,
			B.CSC_ETC2_NM, B.CSC_ETC2_CD,      
				(SELECT CSC_FULL_NM FROM CT_SP_COMMON WHERE CSC_LARGE = 'HM06B' AND CSC_SMALL = A.CSM_INJA_CD) CSM_INJA_NM                         
		FROM CT_SP_MATTER A 
		INNER JOIN CT_SP_COMMON B ON A.CSM_COMM_CD = B.CSC_SMALL   
		WHERE   B.CSC_LARGE   = 'HM99A'                                              
		AND  ( || :sSQL_ADD || ) 
		*/
	

		sql = " SELECT A.CSM_LARGE, A.CSM_MATT_CD, A.CSM_MATT_NM, B.CSC_ETC1_NM, B.CSC_ETC1_CD, ";
		sql += " B.CSC_ETC2_NM, B.CSC_ETC2_CD, ";
		sql += " (SELECT CSC_FULL_NM FROM CT_SP_COMMON WHERE CSC_LARGE = 'HM06B' AND CSC_SMALL = A.CSM_INJA_CD) CSM_INJA_NM ";
		sql += " FROM CT_SP_MATTER A ";
		sql += "INNER JOIN CT_SP_COMMON B ON A.CSM_COMM_CD = B.CSC_SMALL ";
		sql += "WHERE   B.CSC_LARGE   = 'HM99A' ";
		sql += "AND ( " + SQL_ADD + " ) ";

		//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : sp_Select_Common_001 \n";
		G_INFO += "설명 : 취급물질명 조회 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " sSQL_ADD : " + SQL_ADD + " \n";
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
		<s:AttributeType name='CSM_LARGE' rs:number='1' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_LARGE' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MATT_CD' rs:number='2' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MATT_NM' rs:number='3' rs:nullable='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_MATT_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC1_NM' rs:number='4' rs:basetable='CT_SP_COMMON' rs:basecolumn='CSC_ETC1_NM' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC1_CD' rs:number='5' rs:basetable='CT_SP_COMMON' rs:basecolumn='CSC_ETC1_CD'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC2_NM' rs:number='6' rs:nullable='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='CSC_ETC2_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC2_CD' rs:number='7' rs:basetable='CT_SP_COMMON' rs:basecolumn='CSC_ETC2_CD' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_INJA_NM' rs:number='8' rs:basetable='CT_SP_COMMON' rs:basecolumn='CSM_INJA_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		
		<s:AttributeType name='ROWID' rs:number='9' rs:rowid='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
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
			/*
				SELECT A.CSM_LARGE, A.CSM_MATT_CD, A.CSM_MATT_NM, B.CSC_ETC1_NM, B.CSC_ETC1_CD,
			B.CSC_ETC2_NM, B.CSC_ETC2_CD,      
				(SELECT CSC_FULL_NM FROM CT_SP_COMMON WHERE CSC_LARGE = 'HM06B' AND CSC_SMALL = A.CSM_INJA_CD) CSM_INJA_NM                         
		FROM CT_SP_MATTER A 
		INNER JOIN CT_SP_COMMON B ON A.CSM_COMM_CD = B.CSC_SMALL   
		WHERE   B.CSC_LARGE   = 'HM99A'                                              
		AND  ( || :sSQL_ADD || ) 
		*/

			String CSM_LARGE = cRsList.getString("CSM_LARGE");
			String CSM_MATT_CD = cRsList.getString("CSM_MATT_CD");
			String CSM_MATT_NM = cRsList.getString("CSM_MATT_NM");
			String CSC_ETC1_NM = cRsList.getString("CSC_ETC1_NM");
			String CSC_ETC1_CD = cRsList.getString("CSC_ETC1_CD");
			String CSC_ETC2_NM = cRsList.getString("CSC_ETC2_NM");
			String CSC_ETC2_CD = cRsList.getString("CSC_ETC2_CD");
			String CSM_INJA_NM = cRsList.getString("CSM_INJA_NM");
			
%>
			<z:row
<%
			if(! CSM_LARGE.equals("")) {
%>
		 		CSM_LARGE='<%= CSM_LARGE%>'
<%
			}

			if(! CSM_MATT_CD.equals("")) {
%>
		 		CSM_MATT_CD='<%= CSM_MATT_CD%>'
<%
			}

			if(! CSM_MATT_NM.equals("")) {
%>
		 		CSM_MATT_NM='<%= CSM_MATT_NM%>'
<%
			}

			if(! CSC_ETC1_NM.equals("")) {
%>
				CSC_ETC1_NM='<%= CSC_ETC1_NM%>'
<%
			}

			if(! CSC_ETC1_CD.equals("")) {
%>
				CSC_ETC1_CD='<%= CSC_ETC1_CD%>'
<%
			}

			if(! CSC_ETC2_NM.equals("")) {
%>
				CSC_ETC2_NM='<%= CSC_ETC2_NM%>'
<%
			}

			if(! CSC_ETC2_CD.equals("")) {
%>
				CSC_ETC2_CD='<%= CSC_ETC2_CD%>'
<%
			}

			if(! CSM_INJA_NM.equals("")) {
%>		
				CSM_INJA_NM='<%= CSM_INJA_NM%>'
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
