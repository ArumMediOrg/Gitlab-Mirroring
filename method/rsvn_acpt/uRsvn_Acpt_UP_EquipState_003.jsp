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

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT '0' RRT_EXAM_TM, COUNT(*) RRT_EXAM_CNT
  FROM RT_RSVT 
 WHERE RRT_EXAM_DT = :EXAM_DT
   AND SUBSTR(RRT_EXAM_CD, 1, 2) <> '31'
   AND NVL(RRT_CNCL_YN, 'N') <> 'Y' 
   AND RRT_EXAM_TM < '12:30'
 UNION ALL 
SELECT '00' RRT_EXAM_TM, COUNT(*) RRT_EXAM_CNT 
  FROM RT_RSVT 
 WHERE RRT_EXAM_DT = :EXAM_DT
   AND SUBSTR(RRT_EXAM_CD, 1, 2) <> '31'
   AND NVL(RRT_CNCL_YN, 'N') <> 'Y' 
   AND RRT_EXAM_TM >= '12:30'
 UNION ALL 
SELECT RRT_EXAM_TM, COUNT(*) RRT_EXAM_CNT 
  FROM RT_RSVT 
 WHERE RRT_EXAM_DT = :EXAM_DT
   AND SUBSTR(RRT_EXAM_CD, 1, 2) <> '31'
   AND NVL(RRT_CNCL_YN, 'N') <> 'Y' 
 GROUP BY RRT_EXAM_TM 
 ORDER BY RRT_EXAM_TM 
		*/

		sql = " SELECT '0' RRT_EXAM_TM, COUNT(*) RRT_EXAM_CNT";
		sql += " FROM RT_RSVT";
		sql += " WHERE RRT_EXAM_DT = '" + EXAM_DT + "'";
   		sql += " AND SUBSTR(RRT_EXAM_CD, 1, 2) <> '31'";
		sql += " AND NVL(RRT_CNCL_YN, 'N') <> 'Y'";
		sql += " AND RRT_EXAM_TM < '12:30'";

		sql += " UNION ALL";

		sql += " SELECT '00' RRT_EXAM_TM, COUNT(*) RRT_EXAM_CNT";
		sql += " FROM RT_RSVT";
		sql += " WHERE RRT_EXAM_DT = '" + EXAM_DT + "'";
   		sql += " AND SUBSTR(RRT_EXAM_CD, 1, 2) <> '31'";
		sql += " AND NVL(RRT_CNCL_YN, 'N') <> 'Y'";
		sql += " AND RRT_EXAM_TM >= '12:30'";

		sql += " UNION ALL";

		sql += " SELECT RRT_EXAM_TM, COUNT(*) RRT_EXAM_CNT";
		sql += " FROM RT_RSVT";
		sql += " WHERE RRT_EXAM_DT = '" + EXAM_DT + "'";
   		sql += " AND SUBSTR(RRT_EXAM_CD, 1, 2) <> '31'";
		sql += " AND NVL(RRT_CNCL_YN, 'N') <> 'Y'";
		sql += " GROUP BY RRT_EXAM_TM";
		sql += " ORDER BY RRT_EXAM_TM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_UP_EquipState_003 \n";
			G_INFO += "설명 : 예약일자별 오전오후 예약 현황 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
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
		<s:AttributeType name='RRT_EXAM_TM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_CNT' rs:number='2' rs:nullable='true'>
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

			String RRT_EXAM_TM_T = cRsList.getString("RRT_EXAM_TM");
			String RRT_EXAM_CNT_T = cRsList.getString("RRT_EXAM_CNT");
%>
			<z:row
<%
			if(! RRT_EXAM_TM_T.equals("")) {
%>
		 		RRT_EXAM_TM='<%= RRT_EXAM_TM_T%>'
<%
			}

			if(! RRT_EXAM_CNT_T.equals("")) {
%>
		 		RRT_EXAM_CNT='<%= RRT_EXAM_CNT_T%>'
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
