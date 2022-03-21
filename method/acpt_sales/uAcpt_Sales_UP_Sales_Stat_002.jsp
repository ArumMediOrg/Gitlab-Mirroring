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

SELECT EXAM_YM, 
       SUM(EXAM_PR1)  PSNL_PR,  
       SUM(EXAM_PR2)  COMP_PR, 
       SUM(EXAM_PR4)  FRGN_PR,
       SUM(EXAM_PR1 + EXAM_PR2 + EXAM_PR4)  EXAM_PR
  FROM (SELECT A.RRM_RECE_NO, SUBSTR(A.RRM_RECE_DT, 1, 7) EXAM_YM, 
               CASE WHEN B.EEA_ACPT_CD = '1' THEN A.RRM_RECE_PR - A.RRM_RETURN_PR ELSE 0 END EXAM_PR1, 
               CASE WHEN B.EEA_ACPT_CD = '2' THEN A.RRM_RECE_PR - A.RRM_RETURN_PR ELSE 0 END EXAM_PR2,
               CASE WHEN B.EEA_ACPT_CD = '3' OR B.EEA_ACPT_CD = '4' THEN A.RRM_RECE_PR - A.RRM_RETURN_PR ELSE 0 END EXAM_PR4 
          FROM RT_RECE_MEDICHK A, ET_EXAM_ACPT B
         WHERE A.RRM_RECE_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
           AND NOT RRM_OCCU_KD LIKE '3%'
           AND (REPLACE(B.EEA_EXAM_DT, '-', '')||B.EEA_EXAM_SQ = A.RRM_RECE_NO
            OR B.EEA_RECE_NO = A.RRM_RECE_NO)
           AND B.EEA_ORDER_YN <> 'C'
IF (:RECE_NO = 'R') THEN
           AND NVL(B.EEA_RECE_NO, 'A') <> 'R' 

        UNION ALL
        SELECT A.RRM_RECE_NO, SUBSTR(A.RRM_RECE_DT, 1, 7) EXAM_YM, 
               0 EXAM_PR1, 
               A.RRM_RECE_PR - A.RRM_RETURN_PR EXAM_PR2, 
               0 EXAM_PR4 
          FROM RT_RECE_MEDICHK A
         WHERE A.RRM_RECE_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
           AND A.RRM_OCCU_KD LIKE '3%'
       ) C
 GROUP BY EXAM_YM
 ORDER BY EXAM_YM
		*/

		sql = " SELECT EXAM_YM, SUM(EXAM_PR1) PSNL_PR, SUM(EXAM_PR2) COMP_PR, SUM(EXAM_PR4) FRGN_PR, SUM(EXAM_PR1 + EXAM_PR2 + EXAM_PR4) EXAM_PR";
		sql += " FROM (SELECT A.RRM_RECE_NO, SUBSTR(A.RRM_RECE_DT, 1, 7) EXAM_YM, CASE WHEN B.EEA_ACPT_CD = '1' THEN A.RRM_RECE_PR - A.RRM_RETURN_PR ELSE 0 END EXAM_PR1, CASE WHEN B.EEA_ACPT_CD = '2' THEN A.RRM_RECE_PR - A.RRM_RETURN_PR ELSE 0 END EXAM_PR2, CASE WHEN B.EEA_ACPT_CD = '3'";
		sql += " OR B.EEA_ACPT_CD = '4' THEN A.RRM_RECE_PR - A.RRM_RETURN_PR ELSE 0 END EXAM_PR4";
		sql += " FROM RT_RECE_MEDICHK A, ET_EXAM_ACPT B";
		sql += " WHERE A.RRM_RECE_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND NOT RRM_OCCU_KD LIKE '3%'";
		sql += " AND (REPLACE(B.EEA_EXAM_DT, '-', '')||B.EEA_EXAM_SQ = A.RRM_RECE_NO";
		sql += " OR B.EEA_RECE_NO = A.RRM_RECE_NO)";
		sql += " AND B.EEA_ORDER_YN <> 'C'";

		if(RECE_NO.equals("R")) {
			sql += " AND NVL(B.EEA_RECE_NO, 'A') <> 'R'";
		}

		sql += " UNION";
		sql += " ALL SELECT A.RRM_RECE_NO, SUBSTR(A.RRM_RECE_DT, 1, 7) EXAM_YM, 0 EXAM_PR1, A.RRM_RECE_PR - A.RRM_RETURN_PR EXAM_PR2, 0 EXAM_PR4";
		sql += " FROM RT_RECE_MEDICHK A";
		sql += " WHERE A.RRM_RECE_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND A.RRM_OCCU_KD LIKE '3%' ) C";
		sql += " GROUP BY EXAM_YM";
		sql += " ORDER BY EXAM_YM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_Sales_UP_Sales_Stat_002 \n";
			G_INFO += "설명 : 연도별 매출 현황(수납일자, 수납액 기준) \n";
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
		<s:AttributeType name='EXAM_YM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_PR' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='COMP_PR' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='FRGN_PR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_PR' rs:number='5' rs:nullable='true'>
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

			String EXAM_YM_T = cRsList.getString("EXAM_YM");
			String PSNL_PR_T = cRsList.getString("PSNL_PR");
			String COMP_PR_T = cRsList.getString("COMP_PR");
			String FRGN_PR_T = cRsList.getString("FRGN_PR");
			String EXAM_PR_T = cRsList.getString("EXAM_PR");
%>
			<z:row
<%
			if(! EXAM_YM_T.equals("")) {
%>
		 		EXAM_YM='<%= EXAM_YM_T%>'
<%
			}

			if(! PSNL_PR_T.equals("")) {
%>
		 		PSNL_PR='<%= PSNL_PR_T%>'
<%
			}

			if(! COMP_PR_T.equals("")) {
%>
		 		COMP_PR='<%= COMP_PR_T%>'
<%
			}

			if(! FRGN_PR_T.equals("")) {
%>
		 		FRGN_PR='<%= FRGN_PR_T%>'
<%
			}

			if(! EXAM_PR_T.equals("")) {
%>
		 		EXAM_PR='<%= EXAM_PR_T%>'
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
