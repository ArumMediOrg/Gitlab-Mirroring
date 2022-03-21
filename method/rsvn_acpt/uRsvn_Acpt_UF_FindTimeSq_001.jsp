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
		String EQUI_CD = htMethod.get("EQUI_CD");
		String TIME_TM = htMethod.get("TIME_TM");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EQUI_CD == null) { EQUI_CD = ""; }
		if(TIME_TM == null) { TIME_TM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT RRL_TIME_SQ 
  FROM RT_RSVT_EQUIP_LIMIT A, 
      (SELECT MAX(RRL_TIME_STM) MAX_STM 
         FROM RT_RSVT_EQUIP_LIMIT 
        WHERE RRL_EXAM_DT = :EXAM_DT
          AND RRL_EQUI_CD = :EQUI_CD
          AND RRL_TIME_STM <= :TIME_TM
          AND RRL_TIME_ETM >= :TIME_TM) B 
 WHERE A.RRL_EXAM_DT = :EXAM_DT
   AND A.RRL_EQUI_CD = :EQUI_CD
   AND A.RRL_TIME_STM = B.MAX_STM
		*/

		sql = " SELECT RRL_TIME_SQ";
		sql += " FROM RT_RSVT_EQUIP_LIMIT A";
		sql += " , (";
		sql += " 	SELECT MAX(RRL_TIME_STM) MAX_STM";
		sql += " 	FROM RT_RSVT_EQUIP_LIMIT";
		sql += " 	WHERE RRL_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND RRL_EQUI_CD = '" + EQUI_CD + "'";
		sql += " 	AND RRL_TIME_STM <= '" + TIME_TM + "'";
		sql += " 	AND RRL_TIME_ETM >= '" + TIME_TM + "'";
		sql += " ) B";
		sql += " WHERE A.RRL_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.RRL_EQUI_CD = '" + EQUI_CD + "'";
		sql += " AND A.RRL_TIME_STM = B.MAX_STM";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_UF_FindTimeSq_001 \n";
			G_INFO += "설명 : 예약장비 시간 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EQUI_CD : " + EQUI_CD + " \n";
			G_INFO += " TIME_TM : " + TIME_TM + " \n";
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
		<s:AttributeType name='RRL_TIME_SQ' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String RRL_TIME_SQ_T = cRsList.getString("RRL_TIME_SQ");
%>
			<z:row
<%
			if(! RRL_TIME_SQ_T.equals("")) {
%>
		 		RRL_TIME_SQ='<%= RRL_TIME_SQ_T%>'
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
