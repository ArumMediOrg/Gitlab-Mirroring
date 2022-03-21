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
		String COMP_CD = htMethod.get("COMP_CD");
		String PLCE_CD = htMethod.get("PLCE_CD");
		String ACPT_CD = htMethod.get("ACPT_CD");
		String CAN_KD = htMethod.get("CAN_KD");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(ACPT_CD == null) { ACPT_CD = ""; }
		if(CAN_KD == null) { CAN_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_EXAM_DT, 
       SUM(CASE WHEN B.ITEM_CD = 'E0001' THEN 1 ELSE 0 END) AS EEA_STOMA_CNT, 
       SUM(CASE WHEN B.ITEM_CD = 'E0007' THEN 1 ELSE 0 END) AS EEA_COLON_CNT 
  FROM (SELECT ERI_EXAM_DT, ERI_EXAM_SQ, 
               CASE WHEN ERI_ITEM_CD = 'E0002' THEN 'E0001' 
                    WHEN ERI_ITEM_CD = 'E0008' THEN 'E0007' ELSE ERI_ITEM_CD END AS ITEM_CD 
          FROM ET_RSLT_ITEM 
         WHERE ERI_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 
           AND ERI_ITEM_CD IN ('E0001', 'E0002', 'E0007', 'E0008') 
           AND ERI_CNCL_YN <> 'Y' 
         GROUP BY ERI_EXAM_DT, ERI_EXAM_SQ, 
                  CASE WHEN ERI_ITEM_CD = 'E0002' THEN 'E0001' 
                       WHEN ERI_ITEM_CD = 'E0008' THEN 'E0007' ELSE ERI_ITEM_CD END 
       ) B, ET_EXAM_ACPT A 
 WHERE A.EEA_EXAM_DT = B.ERI_EXAM_DT 
   AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ
   AND A.EEA_ORDER_YN <> 'C'

IF (:COMP_CD <> '') THEN 
   AND A.EEA_COMP_CD = :COMP_CD
   
IF (:PLCE_CD <> '') THEN 
   AND A.EEA_PLCE_CD = :PLCE_CD
   
IF (:ACPT_CD <> '') THEN 
   AND A.EEA_ACPT_CD = :ACPT_CD
   
IF (:CAN_KD <> '') THEN 
   AND (A.EEA_STOMA_CD NOT IN ('0', '6', '9') 
    OR  A.EEA_COLON_CD NOT IN ('0', '6', '9'))
    
 GROUP BY A.EEA_EXAM_DT 
 ORDER BY A.EEA_EXAM_DT
 
		*/

		sql = " SELECT A.EEA_EXAM_DT";
		sql += ", SUM(CASE WHEN B.ITEM_CD = 'E0001' THEN 1 ELSE 0 END) AS EEA_STOMA_CNT";
		sql += ", SUM(CASE WHEN B.ITEM_CD = 'E0007' THEN 1 ELSE 0 END) AS EEA_COLON_CNT";
		sql += " FROM (";
		sql += "	SELECT ERI_EXAM_DT, ERI_EXAM_SQ";
		sql += "	, CASE WHEN ERI_ITEM_CD = 'E0002' THEN 'E0001' WHEN ERI_ITEM_CD = 'E0008' THEN 'E0007' ELSE ERI_ITEM_CD END AS ITEM_CD";
		sql += " 	FROM ET_RSLT_ITEM";
		sql += " 	WHERE ERI_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " 	AND '" + EXAM_EDT + "'";
		sql += " 	AND ERI_ITEM_CD IN ('E0001', 'E0002', 'E0007', 'E0008')";
		sql += " 	AND ERI_CNCL_YN <> 'Y'";
		sql += " 	GROUP BY ERI_EXAM_DT, ERI_EXAM_SQ, CASE WHEN ERI_ITEM_CD = 'E0002' THEN 'E0001' WHEN ERI_ITEM_CD = 'E0008' THEN 'E0007' ELSE ERI_ITEM_CD END";
		sql += ") B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.ERI_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(!COMP_CD.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		}
		if(!PLCE_CD.equals("")) {
			sql += " AND A.EEA_PLCE_CD = '" + PLCE_CD + "'";
		}
		if(!ACPT_CD.equals("")) {
			sql += " AND A.EEA_ACPT_CD = '" + ACPT_CD + "'";
		}
		if(!CAN_KD.equals("")) {
			sql += " AND (A.EEA_STOMA_CD NOT IN ('0', '6', '9')";
			sql += " OR A.EEA_COLON_CD NOT IN ('0', '6', '9'))";
		}
		sql += " GROUP BY A.EEA_EXAM_DT";
		sql += " ORDER BY A.EEA_EXAM_DT";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_List_btnAcpt_SrchClick_003 \n";
			G_INFO += "설명 : 검진일자별 내시경 검사 현황 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
			G_INFO += " ACPT_CD : " + ACPT_CD + " \n";
			G_INFO += " CAN_KD : " + CAN_KD + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_CNT' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_CNT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_STOMA_CNT_T = cRsList.getString("EEA_STOMA_CNT");
			String EEA_COLON_CNT_T = cRsList.getString("EEA_COLON_CNT");
%>
			<z:row
<%
			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_STOMA_CNT_T.equals("")) {
%>
		 		EEA_STOMA_CNT='<%= EEA_STOMA_CNT_T%>'
<%
			}

			if(! EEA_COLON_CNT_T.equals("")) {
%>
		 		EEA_COLON_CNT='<%= EEA_COLON_CNT_T%>'
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
