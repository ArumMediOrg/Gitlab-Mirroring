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

		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT MIN(SIR_EXAM_DT2) AS SIR_MIN_DT, MAX(SIR_EXAM_DT2) AS SIR_MAX_DT
  FROM ET_EXAM_ACPT A                                                   
       INNER JOIN ST_ITEM_RECHECK B 
               ON A.EEA_EXAM_DT  = B.SIR_EXAM_DT   
              AND A.EEA_EXAM_SQ  = B.SIR_EXAM_SQ         
              AND B.SIR_EXAM_CHA = '1' 
:PARAM_TX
		*/

		sql = " SELECT MIN(SIR_EXAM_DT2) AS SIR_MIN_DT, MAX(SIR_EXAM_DT2) AS SIR_MAX_DT";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN ST_ITEM_RECHECK B";
		sql += " ON A.EEA_EXAM_DT = B.SIR_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.SIR_EXAM_SQ";
		sql += " AND B.SIR_EXAM_CHA = '1'";
		sql += PARAM_TX;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_STATS_2020_UF_SqlSet_002 \n";
			G_INFO += "설명 : 특검2차 검진기간 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
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
		<s:AttributeType name='SIR_MIN_DT' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_MAX_DT' rs:number='2' rs:nullable='true'>
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

			String SIR_MIN_DT_T = cRsList.getString("SIR_MIN_DT");
			String SIR_MAX_DT_T = cRsList.getString("SIR_MAX_DT");
%>
			<z:row
<%
			if(! SIR_MIN_DT_T.equals("")) {
%>
		 		SIR_MIN_DT='<%= SIR_MIN_DT_T%>'
<%
			}

			if(! SIR_MAX_DT_T.equals("")) {
%>
		 		SIR_MAX_DT='<%= SIR_MAX_DT_T%>'
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
