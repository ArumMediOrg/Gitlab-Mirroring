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

		String IIM_TRLT_CD = htMethod.get("IIM_TRLT_CD");

		//
		if(IIM_TRLT_CD == null) { IIM_TRLT_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

			SELECT CSC_FULL_NM, CSC_ETC1_CD
			FROM CT_SP_COMMON
			WHERE CSC_LARGE = ''HM06D''
			AND CSC_LEVEL = ''5''
			AND SUBSTRING(CSC_SMALL,1,3) = :IIM_TRLT_CD

		*/

		sql = " SELECT CSC_FULL_NM, CSC_ETC1_CD";
		sql += " FROM CT_SP_COMMON";
		sql += " WHERE CSC_LARGE = 'HM06D'";
		sql += " AND CSC_LEVEL = '5'";
		sql += " AND SUBSTR(CSC_SMALL,1,3) = '" + IIM_TRLT_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_dsItemListDataChange_001 \n";
			G_INFO += "설명 : 특검 검사항목 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IIM_TRLT_CD : " + IIM_TRLT_CD + " \n";
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
				<s:AttributeType name='CSC_FULL_NM' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
					 rs:basecolumn='CSC_FULL_NM'>
					<s:datatype dt:type='string' dt:maxLength='500'/>
				</s:AttributeType>
				<s:AttributeType name='CSC_ETC1_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
					 rs:basecolumn='CSC_ETC1_CD'>
					<s:datatype dt:type='string' dt:maxLength='200'/>
				</s:AttributeType>
				<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='ROWID'
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

			String CSC_FULL_NM_T = cRsList.getString("CSC_FULL_NM");
			String CSC_ETC1_CD_T = cRsList.getString("CSC_ETC1_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CSC_FULL_NM_T.equals("")) {
%>
		 		CSC_FULL_NM='<%= CSC_FULL_NM_T%>'
<%
			}

			if(! CSC_ETC1_CD_T.equals("")) {
%>
		 		CSC_ETC1_CD='<%= CSC_ETC1_CD_T%>'
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
