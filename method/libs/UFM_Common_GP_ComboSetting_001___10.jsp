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

		String SLARGE = htMethod.get("SLARGE");

		//
		if(SLARGE == null) { SLARGE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

      SELECT IIQ_APLY_DT FROM IT_ITEM_QUESTION 
                  WHERE IIQ_ITEM_CD = :sLarge
                    AND IIQ_USE_YN = 'Y'
                  GROUP BY IIQ_APLY_DT 
                  ORDER BY IIQ_APLY_DT DESC

		*/

		sql = " SELECT IIQ_APLY_DT";
		sql += " FROM IT_ITEM_QUESTION";
		sql += " WHERE IIQ_ITEM_CD = '" + SLARGE + "'";
		sql += " AND IIQ_USE_YN = 'Y'";
		sql += " GROUP BY IIQ_APLY_DT";
		sql += " ORDER BY IIQ_APLY_DT DESC";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UFM_Common_GP_ComboSetting_001___10 \n";
			G_INFO += "설명 : 구분값에 따른 콤보박스 정보 로딩___10 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SLARGE : " + SLARGE + " \n";
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
		<s:AttributeType name='IIQ_APLY_DT' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_APLY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='2' rs:rowid='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='ROWID'
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

			String IIQ_APLY_DT_T = cRsList.getString("IIQ_APLY_DT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IIQ_APLY_DT_T.equals("")) {
%>
		 		IIQ_APLY_DT='<%= IIQ_APLY_DT_T%>'
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
