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

SELECT ICY_COMP_NO, ICY_COMP_NM, F_TEL_FORMAT(ICY_TEL_NO) ICY_TEL_NO, ICY_ZIP_AR, ICY_ROAD_AR
from IT_COMPANY
Where ICY_COMP_CD = :COMP_CD

		*/

		sql = " SELECT ICY_COMP_NO, ICY_COMP_NM, F_TEL_FORMAT(ICY_TEL_NO) ICY_TEL_NO, ICY_ZIP_AR, ICY_ROAD_AR";
		sql += " FROM IT_COMPANY";
		sql += " WHERE ICY_COMP_CD = '" + COMP_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_SedList_QRBandPageHeader3BeforePrint_001 \n";
			G_INFO += "설명 : 사업장 정보 로딩 \n";
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
		<s:AttributeType name='ICY_COMP_NO' rs:number='1' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TEL_NO' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_ZIP_AR' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_ROAD_AR' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
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

			String ICY_COMP_NO_T = cRsList.getString("ICY_COMP_NO");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ICY_TEL_NO_T = cRsList.getString("ICY_TEL_NO");
			String ICY_ZIP_AR_T = cRsList.getString("ICY_ZIP_AR");
			String ICY_ROAD_AR_T = cRsList.getString("ICY_ROAD_AR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ICY_COMP_NO_T.equals("")) {
%>
		 		ICY_COMP_NO='<%= ICY_COMP_NO_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! ICY_TEL_NO_T.equals("")) {
%>
		 		ICY_TEL_NO='<%= ICY_TEL_NO_T%>'
<%
			}

			if(! ICY_ZIP_AR_T.equals("")) {
%>
		 		ICY_ZIP_AR='<%= ICY_ZIP_AR_T%>'
<%
			}

			if(! ICY_ROAD_AR_T.equals("")) {
%>
		 		ICY_ROAD_AR='<%= ICY_ROAD_AR_T%>'
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
