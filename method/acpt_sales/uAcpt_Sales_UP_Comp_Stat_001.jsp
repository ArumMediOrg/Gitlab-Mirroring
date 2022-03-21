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
		String RECE_NO = htMethod.get("RECE_NO");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(RECE_NO == null) { RECE_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT COMP_CD, F_COMP_FIND(COMP_CD) COMP_NM
  FROM (SELECT EEA_COMP_CD COMP_CD
          FROM ET_EXAM_ACPT  
         WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
           AND EEA_ACPT_CD = '2'
           AND EEA_ORDER_YN <> 'C' 
IF (:RECE_NO = 'R') THEN
           AND NVL(EEA_RECE_NO, ' ') <> 'R'

        UNION ALL
        SELECT RRM_CUST_NO COMP_CD
          FROM RT_RECE_MEDICHK
         WHERE RRM_RECE_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
           AND RRM_OCCU_KD LIKE '3%'
      ) A 
 GROUP BY COMP_CD
 ORDER BY NVL(F_COMP_FIND(COMP_CD), ' '), NVL(COMP_CD, ' ')
		*/

		sql = " SELECT COMP_CD, F_COMP_FIND(COMP_CD) COMP_NM";
		sql += " FROM (SELECT EEA_COMP_CD COMP_CD";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEA_ACPT_CD = '2'";
		sql += " AND EEA_ORDER_YN <> 'C'";

		if(RECE_NO.equals("R")) {
			sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		}

		sql += " UNION";
		sql += " ALL SELECT RRM_CUST_NO COMP_CD";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND RRM_OCCU_KD LIKE '3%' ) A";
		sql += " GROUP BY COMP_CD";
		sql += " ORDER BY NVL(F_COMP_FIND(COMP_CD), ' '), NVL(COMP_CD, ' ')";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_Sales_UP_Comp_Stat_001 \n";
			G_INFO += "설명 : 연도별 기업체 검진 현황 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " RECE_NO : " + RECE_NO + " \n";
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
		<s:AttributeType name='COMP_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='COMP_NM' rs:number='2' rs:nullable='true'>
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

			String COMP_CD_T = cRsList.getString("COMP_CD");
			String COMP_NM_T = cRsList.getString("COMP_NM");
%>
			<z:row
<%
			if(! COMP_CD_T.equals("")) {
%>
		 		COMP_CD='<%= COMP_CD_T%>'
<%
			}

			if(! COMP_NM_T.equals("")) {
%>
		 		COMP_NM='<%= COMP_NM_T%>'
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
