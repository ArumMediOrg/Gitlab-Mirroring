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

		//
		if(DTERCPTFR == null) { DTERCPTFR = ""; }
		if(DTERCPTTO == null) { DTERCPTTO = ""; }
		if(SRCPTSQL == null) { SRCPTSQL = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT DISTINCT
       A.ERI_ITEM_CD, B.IIM_SNME_NM, B.IIM_RSLT_KD, '0' AS SEQ
  FROM ET_RSLT_ITEM A
  JOIN IT_ITEM B
    ON IIM_ITEM_CD = ERI_ITEM_CD
   AND IIM_RSLT_KD <> '9'
 WHERE ERI_EXAM_DT BETWEEN :dteRcptFr AND :dteRcptTo
   AND EXISTS (:sRcptSQL
   AND A.ERI_EXAM_DT = EEA_EXAM_DT
   AND A.ERI_EXAM_SQ = EEA_EXAM_SQ
   AND NVL(A.ERI_CNCL_YN, 'N') <> 'Y'
)
UNION
SELECT 'TOTAL' ERI_ITEM_CD, '종합소견' IIM_SNME_NM, '7' IIM_RSLT_KD, '1' AS SEQ from dual
UNION
SELECT 'FIRPAN' ERI_ITEM_CD, '1차판정' IIM_SNME_NM, '7' IIM_RSLT_KD, '2' AS SEQ from dual
UNION
SELECT 'FIREX' ERI_ITEM_CD, '1차소견' IIM_SNME_NM,  '7' IIM_RSLT_KD, '2' AS SEQ from dual
UNION
SELECT 'SECEX' ERI_ITEM_CD, '2차소견' IIM_SNME_NM,  '7' IIM_RSLT_KD, '3' AS SEQ from dual
ORDER BY SEQ, ERI_ITEM_CD
		*/

		sql = " SELECT DISTINCT A.ERI_ITEM_CD, B.IIM_SNME_NM, B.IIM_RSLT_KD, '0' AS SEQ";
		sql += " FROM ET_RSLT_ITEM A JOIN IT_ITEM B";
		sql += " ON IIM_ITEM_CD = ERI_ITEM_CD";
		sql += " AND IIM_RSLT_KD <> '9'";
		sql += " WHERE ERI_EXAM_DT BETWEEN '" + DTERCPTFR + "'";
		sql += " AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND A.ERI_EXAM_DT = EEA_EXAM_DT";
		sql += " AND A.ERI_EXAM_SQ = EEA_EXAM_SQ";
		sql += " AND NVL(A.ERI_CNCL_YN, 'N') <> 'Y' )";
		sql += " UNION";
		sql += " SELECT 'TOTAL' ERI_ITEM_CD, '종합소견' IIM_SNME_NM, '7' IIM_RSLT_KD, '1' AS SEQ";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " SELECT 'FIRPAN' ERI_ITEM_CD, '1차판정' IIM_SNME_NM, '7' IIM_RSLT_KD, '2' AS SEQ";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " SELECT 'FIREX' ERI_ITEM_CD, '1차소견' IIM_SNME_NM, '7' IIM_RSLT_KD, '2' AS SEQ";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " SELECT 'SECEX' ERI_ITEM_CD, '2차소견' IIM_SNME_NM, '7' IIM_RSLT_KD, '3' AS SEQ";
		sql += " FROM DUAL";
		sql += " ORDER BY SEQ, ERI_ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMake_Excel_upSetGridColumn_001 \n";
			G_INFO += "설명 : 검진정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTERCPTFR : " + DTERCPTFR + " \n";
			G_INFO += " DTERCPTTO : " + DTERCPTTO + " \n";
			G_INFO += " SRCPTSQL : " + SRCPTSQL + " \n";
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
		<s:AttributeType name='ERI_ITEM_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SNME_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RSLT_KD' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SEQ' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String IIM_SNME_NM_T = cRsList.getString("IIM_SNME_NM");
			String IIM_RSLT_KD_T = cRsList.getString("IIM_RSLT_KD");
			String SEQ_T = cRsList.getString("SEQ");
%>
			<z:row
<%
			if(! ERI_ITEM_CD_T.equals("")) {
%>
		 		ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
<%
			}

			if(! IIM_SNME_NM_T.equals("")) {
%>
		 		IIM_SNME_NM='<%= IIM_SNME_NM_T%>'
<%
			}

			if(! IIM_RSLT_KD_T.equals("")) {
%>
		 		IIM_RSLT_KD='<%= IIM_RSLT_KD_T%>'
<%
			}

			if(! SEQ_T.equals("")) {
%>
		 		SEQ='<%= SEQ_T%>'
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
