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

		String CODE = htMethod.get("CODE");
		String PAN_CD = htMethod.get("PAN_CD");
		String PAN_SQ = htMethod.get("PAN_SQ");

		//
		if(CODE == null) { CODE = ""; }
		if(PAN_CD == null) { PAN_CD = ""; }
		if(PAN_SQ == null) { PAN_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CCF_PANVIEW
  FROM CT_COMM_FIRVIEW
 WHERE CCF_CODE = :CODE
   AND CCF_PAN_CD = :PAN_CD
   AND CCF_PAN_SQ = :PAN_SQ
 ORDER BY f_lpad(NVL(CCF_PAN_SQ, '0'), 5, '0')
		*/

		sql = " SELECT CCF_PANVIEW";
		sql += " FROM CT_COMM_FIRVIEW";
		sql += " WHERE CCF_CODE = '" + CODE + "'";
		sql += " AND CCF_PAN_CD = '" + PAN_CD + "'";
		sql += " AND CCF_PAN_SQ = '" + PAN_SQ + "'";
		sql += " ORDER BY F_LPAD(NVL(CCF_PAN_SQ, '0'), 5, '0')";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGen_Frst_Panj_udfselfirview_001 \n";
			G_INFO += "설명 : 노동부판정 소견 조회1 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CODE : " + CODE + " \n";
			G_INFO += " PAN_CD : " + PAN_CD + " \n";
			G_INFO += " PAN_SQ : " + PAN_SQ + " \n";
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
		<s:AttributeType name='CCF_PANVIEW' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_FIRVIEW'
			 rs:basecolumn='CCF_PANVIEW'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='2' rs:rowid='true' rs:basetable='CT_COMM_FIRVIEW' rs:basecolumn='ROWID'
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

			String CCF_PANVIEW_T = cRsList.getString("CCF_PANVIEW");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CCF_PANVIEW_T.equals("")) {
%>
		 		CCF_PANVIEW='<%= CCF_PANVIEW_T%>'
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
