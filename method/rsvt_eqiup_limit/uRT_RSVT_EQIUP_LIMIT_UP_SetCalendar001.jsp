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
		String EQUI_CD = htMethod.get("EQUI_CD");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(EQUI_CD == null) { EQUI_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT RRL_EXAM_DT, RRL_HOLI_CD, RRL_HOLI_NM, 
       SUM(RRL_TOT_CNT)  TOT_CNT,
       SUM(RRL_RSVN_CNT) RSVN_CNT, 
       SUM(RRL_PROC_CNT) PROC_CNT
  FROM RT_RSVT_EQUIP_LIMIT 
 WHERE RRL_EXAM_DT >= :EXAM_SDT
   AND RRL_EXAM_DT <= :EXAM_EDT
   AND RRL_EQUI_CD  = :EQUI_CD
 GROUP BY RRL_EXAM_DT, RRL_HOLI_CD, RRL_HOLI_NM
		*/

		sql = " SELECT RRL_EXAM_DT, RRL_HOLI_CD, RRL_HOLI_NM, SUM(RRL_TOT_CNT) TOT_CNT, SUM(RRL_RSVN_CNT) RSVN_CNT, SUM(RRL_PROC_CNT) PROC_CNT";
		sql += " FROM RT_RSVT_EQUIP_LIMIT";
		sql += " WHERE RRL_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND RRL_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += " AND RRL_EQUI_CD = '" + EQUI_CD + "'";
		sql += " GROUP BY RRL_EXAM_DT, RRL_HOLI_CD, RRL_HOLI_NM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_RSVT_EQIUP_LIMIT_UP_SetCalendar001 \n";
			G_INFO += "설명 : 예약장비별 휴일/잔여건수 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " EQUI_CD : " + EQUI_CD + " \n";
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
		<s:AttributeType name='RRL_HOLI_CD' rs:number='2' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP_LIMIT'
			 rs:basecolumn='RRL_HOLI_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRL_HOLI_NM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP_LIMIT'
			 rs:basecolumn='RRL_HOLI_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='TOT_CNT' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_CNT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PROC_CNT' rs:number='6' rs:nullable='true'>
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
			String RRL_HOLI_CD_T = cRsList.getString("RRL_HOLI_CD");
			String RRL_HOLI_NM_T = cRsList.getString("RRL_HOLI_NM");
			String TOT_CNT_T = cRsList.getString("TOT_CNT");
			String RSVN_CNT_T = cRsList.getString("RSVN_CNT");
			String PROC_CNT_T = cRsList.getString("PROC_CNT");
%>
			<z:row
<%
			if(! RRL_EXAM_DT_T.equals("")) {
%>
		 		RRL_EXAM_DT='<%= RRL_EXAM_DT_T%>'
<%
			}

			if(! RRL_HOLI_CD_T.equals("")) {
%>
		 		RRL_HOLI_CD='<%= RRL_HOLI_CD_T%>'
<%
			}

			if(! RRL_HOLI_NM_T.equals("")) {
%>
		 		RRL_HOLI_NM='<%= RRL_HOLI_NM_T%>'
<%
			}

			if(! TOT_CNT_T.equals("")) {
%>
		 		TOT_CNT='<%= TOT_CNT_T%>'
<%
			}

			if(! RSVN_CNT_T.equals("")) {
%>
		 		RSVN_CNT='<%= RSVN_CNT_T%>'
<%
			}

			if(! PROC_CNT_T.equals("")) {
%>
		 		PROC_CNT='<%= PROC_CNT_T%>'
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
