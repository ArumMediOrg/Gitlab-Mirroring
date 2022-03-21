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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CSM_MATT_CD, CSM_MATT_NM, CSM_PERIOD_TM,                                   
       dbo.GetSP_COMMON_cdToNm('HM99B',CSM_PERIOD_TM) CSM_PERIOD_NM, CSM_COMM_CD
 FROM CT_SP_MATTER                                                               

		*/

		sql = " SELECT CSM_MATT_CD, CSM_MATT_NM, CSM_PERIOD_TM, GetSP_COMMON_cdToNm('HM99B',CSM_PERIOD_TM) CSM_PERIOD_NM, CSM_COMM_CD";
		sql += " FROM CT_SP_MATTER";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTIMATE_FormInit_001 \n";
			G_INFO += "설명 : 특검물질정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='CSM_MATT_CD' rs:number='1' rs:writeunknown='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MATT_NM' rs:number='2' rs:writeunknown='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_MATT_NM'>
			<s:datatype dt:type='string' dt:maxLength='300' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_PERIOD_TM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_PERIOD_TM'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_PERIOD_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_COMM_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_COMM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='ROWID'
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

			String CSM_MATT_CD_T = cRsList.getString("CSM_MATT_CD");
			String CSM_MATT_NM_T = cRsList.getString("CSM_MATT_NM");
			String CSM_PERIOD_TM_T = cRsList.getString("CSM_PERIOD_TM");
			String CSM_PERIOD_NM_T = cRsList.getString("CSM_PERIOD_NM");
			String CSM_COMM_CD_T = cRsList.getString("CSM_COMM_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
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

			if(! CSM_PERIOD_TM_T.equals("")) {
%>
		 		CSM_PERIOD_TM='<%= CSM_PERIOD_TM_T%>'
<%
			}

			if(! CSM_PERIOD_NM_T.equals("")) {
%>
		 		CSM_PERIOD_NM='<%= CSM_PERIOD_NM_T%>'
<%
			}

			if(! CSM_COMM_CD_T.equals("")) {
%>
		 		CSM_COMM_CD='<%= CSM_COMM_CD_T%>'
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
