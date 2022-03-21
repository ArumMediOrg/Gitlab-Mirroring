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

SELECT RRT_EXAM_DT, COUNT(*) RSVN_CNT
  FROM RT_RSVT 
 WHERE RRT_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
   AND SUBSTR(RRT_EXAM_CD, 1, 2) <> '31'
   AND NVL(RRT_CNCL_YN, 'N') <> 'Y' 
 GROUP BY RRT_EXAM_DT 

		*/

		sql = " SELECT RRT_EXAM_DT, COUNT(*) RSVN_CNT";
		sql += " FROM RT_RSVT";
		sql += " WHERE RRT_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND SUBSTR(RRT_EXAM_CD, 1, 2) <> '31'";
		sql += " AND NVL(RRT_CNCL_YN, 'N') <> 'Y'";
		sql += " GROUP BY RRT_EXAM_DT";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_List_Up_Equip_Cnt_002 \n";
			G_INFO += "설명 : 일별 예약 건수 \n";
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
		<s:AttributeType name='RRT_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_CNT' rs:number='2' rs:nullable='true'>
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

			String RRT_EXAM_DT_T = cRsList.getString("RRT_EXAM_DT");
			String RSVN_CNT_T = cRsList.getString("RSVN_CNT");
%>
			<z:row
<%
			if(! RRT_EXAM_DT_T.equals("")) {
%>
		 		RRT_EXAM_DT='<%= RRT_EXAM_DT_T%>'
<%
			}

			if(! RSVN_CNT_T.equals("")) {
%>
		 		RSVN_CNT='<%= RSVN_CNT_T%>'
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
