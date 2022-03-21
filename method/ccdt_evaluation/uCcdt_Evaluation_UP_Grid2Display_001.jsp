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

		String SDATE = htMethod.get("SDATE");
		String EDATE = htMethod.get("EDATE");
		String COMP_CD = htMethod.get("COMP_CD");

		//
		if(SDATE == null) { SDATE = ""; }
		if(EDATE == null) { EDATE = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT MAX(A.EEA_EXAM_DT) EEA_MAX_DT, MIN(A.EEA_EXAM_DT) EEA_MIN_DT";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN DT_CCDT_PANJ D";
		sql += " ON A.EEA_EXAM_DT = D.DCP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.DCP_EXAM_SQ";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.EEA_EXAM_DT >= '" + SDATE + "' ";
		sql += " AND A.EEA_EXAM_DT <= '" + EDATE + "' ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCcdt_Evaluation_UP_Grid2Display_001 \n";
			G_INFO += "설명 : 판정정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SDATE : " + SDATE + " \n";
			G_INFO += " EDATE : " + EDATE + " \n";
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
		<s:AttributeType name='EEA_MAX_DT' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MIN_DT' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_MAX_DT_T = cRsList.getString("EEA_MAX_DT");
			String EEA_MIN_DT_T = cRsList.getString("EEA_MIN_DT");
%>
			<z:row
<%
			if(! EEA_MAX_DT_T.equals("")) {
%>
		 		EEA_MAX_DT='<%= EEA_MAX_DT_T%>'
<%
			}

			if(! EEA_MIN_DT_T.equals("")) {
%>
		 		EEA_MIN_DT='<%= EEA_MIN_DT_T%>'
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
