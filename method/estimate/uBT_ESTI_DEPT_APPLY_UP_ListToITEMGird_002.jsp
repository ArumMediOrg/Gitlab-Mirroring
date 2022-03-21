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
		String CMBBOXBED_SPCL_CD = htMethod.get("CMBBOXBED_SPCL_CD");

		//
		if(JJ_CD == null) { JJ_CD = ""; }
		if(CMBBOXBED_SPCL_CD == null) { CMBBOXBED_SPCL_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT DISTINCT CSP_SBCD_CD";
		sql += " FROM CT_SP_PROF";
		sql += " WHERE CSP_JJ_CD IN (" + JJ_CD + ")";
		sql += " AND CSP_USE_YN = 'Y'";

		if(CMBBOXBED_SPCL_CD.equals("07")) {
			sql += " AND CSP_JANGGI_CD <> '13'";
			sql += " AND CSP_CHOC_KD IN ('1','2','3')";
		} else {
			sql += " AND CSP_CHOC_KD IN ('1','2')";
		}
		sql += " ORDER BY CSP_SBCD_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTI_DEPT_APPLY_UP_ListToITEMGird_002 \n";
			G_INFO += "설명 : 특검코드 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " JJ_CD : " + JJ_CD + " \n";
			G_INFO += " CMBBOXBED_SPCL_CD : " + CMBBOXBED_SPCL_CD + " \n";
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
		<s:AttributeType name='CSP_SBCD_CD' rs:number='1' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CSP_SBCD_CD_T = cRsList.getString("CSP_SBCD_CD");
%>
			<z:row
<%
			if(! CSP_SBCD_CD_T.equals("")) {
%>
		 		CSP_SBCD_CD='<%= CSP_SBCD_CD_T%>'
<%
			}
%>
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
