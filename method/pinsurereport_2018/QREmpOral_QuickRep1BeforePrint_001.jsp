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

select IHL_HOSP_NO, IHL_HOSP_NO2, IHL_HOSP_NM, IHL_HOSP_NM2, IHL_HOSP_IMG, IHL_HOSP_IMG2
from IT_HOSPITAL
		*/

		sql = " SELECT IHL_HOSP_NO, IHL_HOSP_NO2, IHL_HOSP_NM, IHL_HOSP_NM2, IHL_HOSP_IMG, IHL_HOSP_IMG2";
		sql += " FROM IT_HOSPITAL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : QREmpOral_QuickRep1BeforePrint_001 \n";
			G_INFO += "설명 : 병원정보조회(구강검진기관정보 이미지포함) \n";
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
		<s:AttributeType name='IHL_HOSP_NO' rs:number='1' rs:writeunknown='true' rs:basetable='IT_HOSPITAL' rs:basecolumn='IHL_HOSP_NO'>
			<s:datatype dt:type='string' dt:maxLength='8' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HOSP_NO2' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HOSP_NO2'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HOSP_NM' rs:number='3' rs:writeunknown='true' rs:basetable='IT_HOSPITAL' rs:basecolumn='IHL_HOSP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HOSP_NM2' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HOSP_NM2'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HOSP_IMG' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HOSP_IMG'>
			<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HOSP_IMG2' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HOSP_IMG2'>
			<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='IT_HOSPITAL' rs:basecolumn='ROWID'
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

			String IHL_HOSP_NO_T = cRsList.getString("IHL_HOSP_NO");
			String IHL_HOSP_NO2_T = cRsList.getString("IHL_HOSP_NO2");
			String IHL_HOSP_NM_T = cRsList.getString("IHL_HOSP_NM");
			String IHL_HOSP_NM2_T = cRsList.getString("IHL_HOSP_NM2");
			String IHL_HOSP_IMG_T = cRsList.getString("IHL_HOSP_IMG");
			String IHL_HOSP_IMG2_T = cRsList.getString("IHL_HOSP_IMG2");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IHL_HOSP_NO_T.equals("")) {
%>
		 		IHL_HOSP_NO='<%= IHL_HOSP_NO_T%>'
<%
			}

			if(! IHL_HOSP_NO2_T.equals("")) {
%>
		 		IHL_HOSP_NO2='<%= IHL_HOSP_NO2_T%>'
<%
			}

			if(! IHL_HOSP_NM_T.equals("")) {
%>
		 		IHL_HOSP_NM='<%= IHL_HOSP_NM_T%>'
<%
			}

			if(! IHL_HOSP_NM2_T.equals("")) {
%>
		 		IHL_HOSP_NM2='<%= IHL_HOSP_NM2_T%>'
<%
			}

			if(! IHL_HOSP_IMG_T.equals("")) {
%>
		 		IHL_HOSP_IMG='<%= IHL_HOSP_IMG_T%>'
<%
			}

			if(! IHL_HOSP_IMG2_T.equals("")) {
%>
		 		IHL_HOSP_IMG2='<%= IHL_HOSP_IMG2_T%>'
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
