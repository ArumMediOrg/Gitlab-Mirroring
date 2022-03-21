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

  SELECT LLY_CHECK_YR,LLY_FRCHK_YR,LLY_SECHK_YR,LLY_THCHK_YR,LLY_FOCHK_YR
  FROM LT_LIFECK_YY
  WHERE LLY_CHECK_YR=TO_CHAR(SYSDATE, ‘YYYY’)
		*/

		sql = " SELECT LLY_CHECK_YR,LLY_FRCHK_YR,LLY_SECHK_YR,LLY_THCHK_YR,LLY_FOCHK_YR";
		sql += " FROM LT_LIFECK_YY";
		sql += " WHERE LLY_CHECK_YR=TO_CHAR(SYSDATE, 'YYYY')";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : login_btOkClick_002 \n";
			G_INFO += "설명 : 로그인 정보를 가져옴 \n";
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
		<s:AttributeType name='LLY_CHECK_YR' rs:number='1' rs:writeunknown='true' rs:basetable='LT_LIFECK_YY' rs:basecolumn='LLY_CHECK_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='LLY_FRCHK_YR' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='LT_LIFECK_YY'
			 rs:basecolumn='LLY_FRCHK_YR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='LLY_SECHK_YR' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='LT_LIFECK_YY'
			 rs:basecolumn='LLY_SECHK_YR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='LLY_THCHK_YR' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='LT_LIFECK_YY'
			 rs:basecolumn='LLY_THCHK_YR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='LLY_FOCHK_YR' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='LT_LIFECK_YY'
			 rs:basecolumn='LLY_FOCHK_YR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='LT_LIFECK_YY' rs:basecolumn='ROWID'
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

			String LLY_CHECK_YR_T = cRsList.getString("LLY_CHECK_YR");
			String LLY_FRCHK_YR_T = cRsList.getString("LLY_FRCHK_YR");
			String LLY_SECHK_YR_T = cRsList.getString("LLY_SECHK_YR");
			String LLY_THCHK_YR_T = cRsList.getString("LLY_THCHK_YR");
			String LLY_FOCHK_YR_T = cRsList.getString("LLY_FOCHK_YR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! LLY_CHECK_YR_T.equals("")) {
%>
		 		LLY_CHECK_YR='<%= LLY_CHECK_YR_T%>'
<%
			}

			if(! LLY_FRCHK_YR_T.equals("")) {
%>
		 		LLY_FRCHK_YR='<%= LLY_FRCHK_YR_T%>'
<%
			}

			if(! LLY_SECHK_YR_T.equals("")) {
%>
		 		LLY_SECHK_YR='<%= LLY_SECHK_YR_T%>'
<%
			}

			if(! LLY_THCHK_YR_T.equals("")) {
%>
		 		LLY_THCHK_YR='<%= LLY_THCHK_YR_T%>'
<%
			}

			if(! LLY_FOCHK_YR_T.equals("")) {
%>
		 		LLY_FOCHK_YR='<%= LLY_FOCHK_YR_T%>'
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
