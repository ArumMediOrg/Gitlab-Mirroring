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

		String SPARM1 = htMethod.get("SPARM1");
		String SPARM2 = htMethod.get("SPARM2");
		String SPARM3 = htMethod.get("SPARM3");
		String SPARM4 = htMethod.get("SPARM4");

		//
		if(SPARM1 == null) { SPARM1 = ""; }
		if(SPARM2 == null) { SPARM2 = ""; }
		if(SPARM3 == null) { SPARM3 = ""; }
		if(SPARM4 == null) { SPARM4 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT GetCOMMON_LvCdToNm(:sParm1,:sParm2,:sParm3,:sParm4)  SF_NAME from dual
		*/

		sql = " SELECT GETCOMMON_LVCDTONM('" + SPARM1 + "','" + SPARM2 + "','" + SPARM3 + "','" + SPARM4 + "') SF_NAME";
		sql += " FROM DUAL";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_CUST_APPLY_EdtECT_GOJU_CDChange_001 \n";
			G_INFO += "설명 : 공통코드 코드명 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SPARM1 : " + SPARM1 + " \n";
			G_INFO += " SPARM2 : " + SPARM2 + " \n";
			G_INFO += " SPARM3 : " + SPARM3 + " \n";
			G_INFO += " SPARM4 : " + SPARM4 + " \n";
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
		<s:AttributeType name='SF_NAME' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='2' rs:rowid='true' rs:basetable='DUAL' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
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

			String SF_NAME_T = cRsList.getString("SF_NAME");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! SF_NAME_T.equals("")) {
%>
		 		SF_NAME='<%= SF_NAME_T%>'
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
