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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT SSV_VIEW_EX, SSV_VIEW_EX2, SSV_VIEW_RTF, SSV_DOCTOR, SSV_RPT_DT, SSV_PRNT_DT, SSV_RSLT_INPUT 
  FROM ST_SYTH_VIEW
 WHERE SSV_EXAM_DT = :EXAM_DT
   AND SSV_EXAM_SQ = :EXAM_SQ
   AND SSV_PACK_CD = '00'
		*/

		sql = " SELECT SSV_VIEW_EX, SSV_VIEW_EX2, SSV_VIEW_RTF, SSV_DOCTOR, SSV_RPT_DT, SSV_PRNT_DT, SSV_RSLT_INPUT";
		sql += " FROM ST_SYTH_VIEW";
		sql += " WHERE SSV_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND SSV_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SSV_PACK_CD = '00'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uTotal_Finding_upGetFinding_001 \n";
			G_INFO += "설명 : 소견 불러옴 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='SSV_VIEW_EX' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_VIEW_EX'>
			<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_VIEW_EX2' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_VIEW_EX2'>
			<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_VIEW_RTF' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_VIEW_RTF'>
			<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_DOCTOR' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_DOCTOR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_RPT_DT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_PRNT_DT' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_PRNT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_RSLT_INPUT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_RSLT_INPUT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='ST_SYTH_VIEW' rs:basecolumn='ROWID'
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

			String SSV_VIEW_EX_T = cRsList.getString("SSV_VIEW_EX");
			String SSV_VIEW_EX2_T = cRsList.getString("SSV_VIEW_EX2");
			String SSV_VIEW_RTF_T = cRsList.getString("SSV_VIEW_RTF");
			String SSV_DOCTOR_T = cRsList.getString("SSV_DOCTOR");
			String SSV_RPT_DT_T = cRsList.getString("SSV_RPT_DT");
			String SSV_PRNT_DT_T = cRsList.getString("SSV_PRNT_DT");
			String SSV_RSLT_INPUT_T = cRsList.getString("SSV_RSLT_INPUT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! SSV_VIEW_EX_T.equals("")) {
%>
		 		SSV_VIEW_EX='<%= SSV_VIEW_EX_T%>'
<%
			}

			if(! SSV_VIEW_EX2_T.equals("")) {
%>
		 		SSV_VIEW_EX2='<%= SSV_VIEW_EX2_T%>'
<%
			}

			if(! SSV_VIEW_RTF_T.equals("")) {
%>
		 		SSV_VIEW_RTF='<%= SSV_VIEW_RTF_T%>'
<%
			}

			if(! SSV_DOCTOR_T.equals("")) {
%>
		 		SSV_DOCTOR='<%= SSV_DOCTOR_T%>'
<%
			}

			if(! SSV_RPT_DT_T.equals("")) {
%>
		 		SSV_RPT_DT='<%= SSV_RPT_DT_T%>'
<%
			}

			if(! SSV_PRNT_DT_T.equals("")) {
%>
		 		SSV_PRNT_DT='<%= SSV_PRNT_DT_T%>'
<%
			}

			if(! SSV_RSLT_INPUT_T.equals("")) {
%>
		 		SSV_RSLT_INPUT='<%= SSV_RSLT_INPUT_T%>'
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
