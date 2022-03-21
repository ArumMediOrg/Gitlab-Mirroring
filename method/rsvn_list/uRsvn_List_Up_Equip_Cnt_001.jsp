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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT RRL_EXAM_DT,
       SUM(CASE WHEN RRE_EQUI_CD = '00' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_00,  
       SUM(CASE WHEN RRE_EQUI_CD = '01' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_01,  
       SUM(CASE WHEN RRE_EQUI_CD = '02' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_02,  
       SUM(CASE WHEN RRE_EQUI_CD = '03' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_03,  
       SUM(CASE WHEN RRE_EQUI_CD = '04' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_04,  
       SUM(CASE WHEN RRE_EQUI_CD = '05' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_05,  
       SUM(CASE WHEN RRE_EQUI_CD = '06' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_06,  
       SUM(CASE WHEN RRE_EQUI_CD = '07' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_07,  
       SUM(CASE WHEN RRE_EQUI_CD = '08' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_08,  
       SUM(CASE WHEN RRE_EQUI_CD = '00' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_00, 
       SUM(CASE WHEN RRE_EQUI_CD = '01' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_01, 
       SUM(CASE WHEN RRE_EQUI_CD = '02' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_02, 
       SUM(CASE WHEN RRE_EQUI_CD = '03' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_03, 
       SUM(CASE WHEN RRE_EQUI_CD = '04' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_04, 
       SUM(CASE WHEN RRE_EQUI_CD = '05' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_05, 
       SUM(CASE WHEN RRE_EQUI_CD = '06' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_06, 
       SUM(CASE WHEN RRE_EQUI_CD = '07' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_07, 
       SUM(CASE WHEN RRE_EQUI_CD = '08' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_08, 
       SUM(CASE WHEN RRE_EQUI_CD = '00' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_00, 
       SUM(CASE WHEN RRE_EQUI_CD = '01' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_01, 
       SUM(CASE WHEN RRE_EQUI_CD = '02' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_02, 
       SUM(CASE WHEN RRE_EQUI_CD = '03' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_03, 
       SUM(CASE WHEN RRE_EQUI_CD = '04' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_04, 
       SUM(CASE WHEN RRE_EQUI_CD = '05' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_05, 
       SUM(CASE WHEN RRE_EQUI_CD = '06' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_06, 
       SUM(CASE WHEN RRE_EQUI_CD = '07' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_07, 
       SUM(CASE WHEN RRE_EQUI_CD = '08' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_08 
  FROM RT_RSVT_EQUIP A, RT_RSVT_EQUIP_LIMIT B 
 WHERE UPPER(A.RRE_USE_YN) = 'Y' 
   AND RRL_EQUI_CD = RRE_EQUI_CD 
   AND RRL_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 
   AND RRL_USE_YN = 'Y' 
 GROUP BY RRL_EXAM_DT 
 ORDER BY RRL_EXAM_DT 
		*/

		sql = " SELECT RRL_EXAM_DT, SUM(CASE WHEN RRE_EQUI_CD = '00' THEN RRL_TOT_CNT ELSE 0 END) TOT_CNT_00, SUM(CASE WHEN RRE_EQUI_CD = '01' THEN RRL_TOT_CNT ELSE 0 END) TOT_CNT_01, SUM(CASE WHEN RRE_EQUI_CD = '02' THEN RRL_TOT_CNT ELSE 0 END) TOT_CNT_02, SUM(CASE WHEN RRE_EQUI_CD = '03' THEN RRL_TOT_CNT ELSE 0 END) TOT_CNT_03, SUM(CASE WHEN RRE_EQUI_CD = '04' THEN RRL_TOT_CNT ELSE 0 END) TOT_CNT_04, SUM(CASE WHEN RRE_EQUI_CD = '05' THEN RRL_TOT_CNT ELSE 0 END) TOT_CNT_05, SUM(CASE WHEN RRE_EQUI_CD = '06' THEN RRL_TOT_CNT ELSE 0 END) TOT_CNT_06, SUM(CASE WHEN RRE_EQUI_CD = '07' THEN RRL_TOT_CNT ELSE 0 END) TOT_CNT_07, SUM(CASE WHEN RRE_EQUI_CD = '08' THEN RRL_TOT_CNT ELSE 0 END) TOT_CNT_08, SUM(CASE WHEN RRE_EQUI_CD = '00' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_00, SUM(CASE WHEN RRE_EQUI_CD = '01' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_01, SUM(CASE WHEN RRE_EQUI_CD = '02' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_02, SUM(CASE WHEN RRE_EQUI_CD = '03' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_03, SUM(CASE WHEN RRE_EQUI_CD = '04' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_04, SUM(CASE WHEN RRE_EQUI_CD = '05' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_05, SUM(CASE WHEN RRE_EQUI_CD = '06' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_06, SUM(CASE WHEN RRE_EQUI_CD = '07' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_07, SUM(CASE WHEN RRE_EQUI_CD = '08' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_08, SUM(CASE WHEN RRE_EQUI_CD = '00' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_00, SUM(CASE WHEN RRE_EQUI_CD = '01' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_01, SUM(CASE WHEN RRE_EQUI_CD = '02' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_02, SUM(CASE WHEN RRE_EQUI_CD = '03' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_03, SUM(CASE WHEN RRE_EQUI_CD = '04' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_04, SUM(CASE WHEN RRE_EQUI_CD = '05' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_05, SUM(CASE WHEN RRE_EQUI_CD = '06' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_06, SUM(CASE WHEN RRE_EQUI_CD = '07' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_07, SUM(CASE WHEN RRE_EQUI_CD = '08' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_08";
		sql += " FROM RT_RSVT_EQUIP A, RT_RSVT_EQUIP_LIMIT B";
		sql += " WHERE UPPER(A.RRE_USE_YN) = 'Y'";
		sql += " AND RRL_EQUI_CD = RRE_EQUI_CD";
		sql += " AND RRL_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND RRL_USE_YN = 'Y'";
		sql += " GROUP BY RRL_EXAM_DT";
		sql += " ORDER BY RRL_EXAM_DT";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_List_Up_Equip_Cnt_001 \n";
			G_INFO += "설명 : 예약장비별 설정 건수 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
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
		<s:AttributeType name='RRL_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP_LIMIT'
			 rs:basecolumn='RRL_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='TOT_CNT_00' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='TOT_CNT_01' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='TOT_CNT_02' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='TOT_CNT_03' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='TOT_CNT_04' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='TOT_CNT_05' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='TOT_CNT_06' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='TOT_CNT_07' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='TOT_CNT_08' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_CNT_00' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_CNT_01' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_CNT_02' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_CNT_03' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_CNT_04' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_CNT_05' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_CNT_06' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_CNT_07' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_CNT_08' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PROC_CNT_00' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PROC_CNT_01' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PROC_CNT_02' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PROC_CNT_03' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PROC_CNT_04' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PROC_CNT_05' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PROC_CNT_06' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PROC_CNT_07' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PROC_CNT_08' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String RRL_EXAM_DT_T = cRsList.getString("RRL_EXAM_DT");
			String TOT_CNT_00_T = cRsList.getString("TOT_CNT_00");
			String TOT_CNT_01_T = cRsList.getString("TOT_CNT_01");
			String TOT_CNT_02_T = cRsList.getString("TOT_CNT_02");
			String TOT_CNT_03_T = cRsList.getString("TOT_CNT_03");
			String TOT_CNT_04_T = cRsList.getString("TOT_CNT_04");
			String TOT_CNT_05_T = cRsList.getString("TOT_CNT_05");
			String TOT_CNT_06_T = cRsList.getString("TOT_CNT_06");
			String TOT_CNT_07_T = cRsList.getString("TOT_CNT_07");
			String TOT_CNT_08_T = cRsList.getString("TOT_CNT_08");
			String RSVN_CNT_00_T = cRsList.getString("RSVN_CNT_00");
			String RSVN_CNT_01_T = cRsList.getString("RSVN_CNT_01");
			String RSVN_CNT_02_T = cRsList.getString("RSVN_CNT_02");
			String RSVN_CNT_03_T = cRsList.getString("RSVN_CNT_03");
			String RSVN_CNT_04_T = cRsList.getString("RSVN_CNT_04");
			String RSVN_CNT_05_T = cRsList.getString("RSVN_CNT_05");
			String RSVN_CNT_06_T = cRsList.getString("RSVN_CNT_06");
			String RSVN_CNT_07_T = cRsList.getString("RSVN_CNT_07");
			String RSVN_CNT_08_T = cRsList.getString("RSVN_CNT_08");
			String PROC_CNT_00_T = cRsList.getString("PROC_CNT_00");
			String PROC_CNT_01_T = cRsList.getString("PROC_CNT_01");
			String PROC_CNT_02_T = cRsList.getString("PROC_CNT_02");
			String PROC_CNT_03_T = cRsList.getString("PROC_CNT_03");
			String PROC_CNT_04_T = cRsList.getString("PROC_CNT_04");
			String PROC_CNT_05_T = cRsList.getString("PROC_CNT_05");
			String PROC_CNT_06_T = cRsList.getString("PROC_CNT_06");
			String PROC_CNT_07_T = cRsList.getString("PROC_CNT_07");
			String PROC_CNT_08_T = cRsList.getString("PROC_CNT_08");
%>
			<z:row
<%
			if(! RRL_EXAM_DT_T.equals("")) {
%>
		 		RRL_EXAM_DT='<%= RRL_EXAM_DT_T%>'
<%
			}

			if(! TOT_CNT_00_T.equals("")) {
%>
		 		TOT_CNT_00='<%= TOT_CNT_00_T%>'
<%
			}

			if(! TOT_CNT_01_T.equals("")) {
%>
		 		TOT_CNT_01='<%= TOT_CNT_01_T%>'
<%
			}

			if(! TOT_CNT_02_T.equals("")) {
%>
		 		TOT_CNT_02='<%= TOT_CNT_02_T%>'
<%
			}

			if(! TOT_CNT_03_T.equals("")) {
%>
		 		TOT_CNT_03='<%= TOT_CNT_03_T%>'
<%
			}

			if(! TOT_CNT_04_T.equals("")) {
%>
		 		TOT_CNT_04='<%= TOT_CNT_04_T%>'
<%
			}

			if(! TOT_CNT_05_T.equals("")) {
%>
		 		TOT_CNT_05='<%= TOT_CNT_05_T%>'
<%
			}

			if(! TOT_CNT_06_T.equals("")) {
%>
		 		TOT_CNT_06='<%= TOT_CNT_06_T%>'
<%
			}

			if(! TOT_CNT_07_T.equals("")) {
%>
		 		TOT_CNT_07='<%= TOT_CNT_07_T%>'
<%
			}

			if(! TOT_CNT_08_T.equals("")) {
%>
		 		TOT_CNT_08='<%= TOT_CNT_08_T%>'
<%
			}

			if(! RSVN_CNT_00_T.equals("")) {
%>
		 		RSVN_CNT_00='<%= RSVN_CNT_00_T%>'
<%
			}

			if(! RSVN_CNT_01_T.equals("")) {
%>
		 		RSVN_CNT_01='<%= RSVN_CNT_01_T%>'
<%
			}

			if(! RSVN_CNT_02_T.equals("")) {
%>
		 		RSVN_CNT_02='<%= RSVN_CNT_02_T%>'
<%
			}

			if(! RSVN_CNT_03_T.equals("")) {
%>
		 		RSVN_CNT_03='<%= RSVN_CNT_03_T%>'
<%
			}

			if(! RSVN_CNT_04_T.equals("")) {
%>
		 		RSVN_CNT_04='<%= RSVN_CNT_04_T%>'
<%
			}

			if(! RSVN_CNT_05_T.equals("")) {
%>
		 		RSVN_CNT_05='<%= RSVN_CNT_05_T%>'
<%
			}

			if(! RSVN_CNT_06_T.equals("")) {
%>
		 		RSVN_CNT_06='<%= RSVN_CNT_06_T%>'
<%
			}

			if(! RSVN_CNT_07_T.equals("")) {
%>
		 		RSVN_CNT_07='<%= RSVN_CNT_07_T%>'
<%
			}

			if(! RSVN_CNT_08_T.equals("")) {
%>
		 		RSVN_CNT_08='<%= RSVN_CNT_08_T%>'
<%
			}

			if(! PROC_CNT_00_T.equals("")) {
%>
		 		PROC_CNT_00='<%= PROC_CNT_00_T%>'
<%
			}

			if(! PROC_CNT_01_T.equals("")) {
%>
		 		PROC_CNT_01='<%= PROC_CNT_01_T%>'
<%
			}

			if(! PROC_CNT_02_T.equals("")) {
%>
		 		PROC_CNT_02='<%= PROC_CNT_02_T%>'
<%
			}

			if(! PROC_CNT_03_T.equals("")) {
%>
		 		PROC_CNT_03='<%= PROC_CNT_03_T%>'
<%
			}

			if(! PROC_CNT_04_T.equals("")) {
%>
		 		PROC_CNT_04='<%= PROC_CNT_04_T%>'
<%
			}

			if(! PROC_CNT_05_T.equals("")) {
%>
		 		PROC_CNT_05='<%= PROC_CNT_05_T%>'
<%
			}

			if(! PROC_CNT_06_T.equals("")) {
%>
		 		PROC_CNT_06='<%= PROC_CNT_06_T%>'
<%
			}

			if(! PROC_CNT_07_T.equals("")) {
%>
		 		PROC_CNT_07='<%= PROC_CNT_07_T%>'
<%
			}

			if(! PROC_CNT_08_T.equals("")) {
%>
		 		PROC_CNT_08='<%= PROC_CNT_08_T%>'
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
