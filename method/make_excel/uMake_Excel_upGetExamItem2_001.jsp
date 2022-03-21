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

		String DTERCPTFR = htMethod.get("DTERCPTFR");
		String DTERCPTTO = htMethod.get("DTERCPTTO");
		String SRCPTSQL = htMethod.get("SRCPTSQL");
		String STRADDQUERY = htMethod.get("STRADDQUERY");

		//
		if(DTERCPTFR == null) { DTERCPTFR = ""; }
		if(DTERCPTTO == null) { DTERCPTTO = ""; }
		if(SRCPTSQL == null) { SRCPTSQL = ""; }
		if(STRADDQUERY == null) { STRADDQUERY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.ERI_EXAM_DT, A.ERI_EXAM_SQ, A.ERI_ITEM_CD, A.ERI_RSLT_VL, A.ERI_RSLT_EX
              , '' ERI_RSLT_EX2, '' ERI_RSLT_EX3, '' ERI_RSLT_EX4, '' ERI_RSLT_EX5
FROM ET_RSLT_ITEM A
     JOIN IT_ITEM B
     ON IIM_ITEM_CD = ERI_ITEM_CD
        AND IIM_RSLT_KD <> '9'
WHERE ERI_EXAM_DT BETWEEN :dteRcptFr AND :dteRcptTo
   AND EXISTS (:sRcptSQL
   AND A.ERI_EXAM_DT = EEA_EXAM_DT
   AND A.ERI_EXAM_SQ = EEA_EXAM_SQ)
   AND ISNULL(A.ERI_CNCL_YN, 'N') <> 'Y'
UNION
SELECT SSV_EXAM_DT AS ERI_EXAM_DT, SSV_EXAM_SQ AS ERI_EXAM_SQ, 'TOTAL' AS ERI_ITEM_CD, '' ERI_RSLT_VL
     , DBMS_LOB.SUBSTR(SSV_VIEW_EX,1500,1) ERI_RSLT_EX
     , DBMS_LOB.SUBSTR(SSV_VIEW_EX,1500,1501) ERI_RSLT_EX2
     , DBMS_LOB.SUBSTR(SSV_VIEW_EX,1500,3001) ERI_RSLT_EX3
     , DBMS_LOB.SUBSTR(SSV_VIEW_EX,1500,4501) ERI_RSLT_EX4
     , DBMS_LOB.SUBSTR(SSV_VIEW_EX,1500,6001) ERI_RSLT_EX5
FROM ST_SYTH_VIEW
WHERE SSV_EXAM_DT BETWEEN :dteRcptFr AND :dteRcptTo
   AND EXISTS (:sRcptSQL
   AND SSV_EXAM_DT = EEA_EXAM_DT
   AND SSV_EXAM_SQ = EEA_EXAM_SQ)

:strAddQuery
ORDER BY ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD
		*/

		sql = " SELECT A.ERI_EXAM_DT, A.ERI_EXAM_SQ, A.ERI_ITEM_CD, A.ERI_RSLT_VL, A.ERI_RSLT_EX , '' ERI_RSLT_EX2, '' ERI_RSLT_EX3, '' ERI_RSLT_EX4, '' ERI_RSLT_EX5";
		sql += " FROM ET_RSLT_ITEM A JOIN IT_ITEM B";
		sql += " ON IIM_ITEM_CD = ERI_ITEM_CD";
		sql += " AND IIM_RSLT_KD <> '9'";
		sql += " WHERE ERI_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (";
		sql +=		SRCPTSQL;
		sql += " 	AND A.ERI_EXAM_DT = EEA_EXAM_DT";
		sql += " 	AND A.ERI_EXAM_SQ = EEA_EXAM_SQ";
		sql += " )";
		sql += " AND NVL(A.ERI_CNCL_YN, 'N') <> 'Y'";

		sql += " UNION";

		sql += " SELECT SSV_EXAM_DT AS ERI_EXAM_DT, SSV_EXAM_SQ AS ERI_EXAM_SQ, 'TOTAL' AS ERI_ITEM_CD, '' ERI_RSLT_VL , DBMS_LOB.SUBSTR(SSV_VIEW_EX,1500,1) ERI_RSLT_EX , DBMS_LOB.SUBSTR(SSV_VIEW_EX,1500,1501) ERI_RSLT_EX2 , DBMS_LOB.SUBSTR(SSV_VIEW_EX,1500,3001) ERI_RSLT_EX3 , DBMS_LOB.SUBSTR(SSV_VIEW_EX,1500,4501) ERI_RSLT_EX4 , DBMS_LOB.SUBSTR(SSV_VIEW_EX,1500,6001) ERI_RSLT_EX5";
		sql += " FROM ST_SYTH_VIEW";
		sql += " WHERE SSV_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (";
		sql += 		SRCPTSQL;
		sql += " 	AND SSV_EXAM_DT = EEA_EXAM_DT";
		sql += " 	AND SSV_EXAM_SQ = EEA_EXAM_SQ";
		sql += " )";
		sql += STRADDQUERY;
		sql += " ORDER BY ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMake_Excel_upGetExamItem2_001 \n";
			G_INFO += "설명 : 검사결과정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTERCPTFR : " + DTERCPTFR + " \n";
			G_INFO += " DTERCPTTO : " + DTERCPTTO + " \n";
			G_INFO += " SRCPTSQL : " + SRCPTSQL + " \n";
			G_INFO += " STRADDQUERY : " + STRADDQUERY + " \n";
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
		<s:AttributeType name='ERI_EXAM_DT' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EXAM_SQ' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ITEM_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_EX' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_EX2' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_EX3' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_EX4' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_EX5' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ERI_EXAM_DT_T = cRsList.getString("ERI_EXAM_DT");
			String ERI_EXAM_SQ_T = cRsList.getString("ERI_EXAM_SQ");
			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String ERI_RSLT_EX_T = cRsList.getString("ERI_RSLT_EX");
			String ERI_RSLT_EX2_T = cRsList.getString("ERI_RSLT_EX2");
			String ERI_RSLT_EX3_T = cRsList.getString("ERI_RSLT_EX3");
			String ERI_RSLT_EX4_T = cRsList.getString("ERI_RSLT_EX4");
			String ERI_RSLT_EX5_T = cRsList.getString("ERI_RSLT_EX5");
%>
			<z:row
<%
			if(! ERI_EXAM_DT_T.equals("")) {
%>
		 		ERI_EXAM_DT='<%= ERI_EXAM_DT_T%>'
<%
			}

			if(! ERI_EXAM_SQ_T.equals("")) {
%>
		 		ERI_EXAM_SQ='<%= ERI_EXAM_SQ_T%>'
<%
			}

			if(! ERI_ITEM_CD_T.equals("")) {
%>
		 		ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! ERI_RSLT_EX_T.equals("")) {
%>
		 		ERI_RSLT_EX='<%= ERI_RSLT_EX_T%>'
<%
			}

			if(! ERI_RSLT_EX2_T.equals("")) {
%>
		 		ERI_RSLT_EX2='<%= ERI_RSLT_EX2_T%>'
<%
			}

			if(! ERI_RSLT_EX3_T.equals("")) {
%>
		 		ERI_RSLT_EX3='<%= ERI_RSLT_EX3_T%>'
<%
			}

			if(! ERI_RSLT_EX4_T.equals("")) {
%>
		 		ERI_RSLT_EX4='<%= ERI_RSLT_EX4_T%>'
<%
			}

			if(! ERI_RSLT_EX5_T.equals("")) {
%>
		 		ERI_RSLT_EX5='<%= ERI_RSLT_EX5_T%>'
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
