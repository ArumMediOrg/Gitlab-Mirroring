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

SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, A.EEA_CHART_NO, 
       SUM(CASE WHEN B.ITEM_CD = 'E0001' THEN 1 ELSE 0 END) AS EEA_STOMA_CNT, 
       MAX(CASE WHEN B.ITEM_CD = 'E0001' THEN C.ECS_CFRM_DT ELSE NULL END) AS EEA_STOMA_DT, 
       MAX(CASE WHEN B.ITEM_CD = 'E0001' THEN F_USER_FIND(C.ECS_LICEN_CD) ELSE '' END) AS EEA_STOMA_DR, 
       SUM(CASE WHEN B.ITEM_CD = 'E0007' THEN 1 ELSE 0 END) AS EEA_COLON_CNT, 
       MAX(CASE WHEN B.ITEM_CD = 'E0007' THEN D.ECC_CFRM_DT ELSE NULL END) AS EEA_COLON_DT, 
       MAX(CASE WHEN B.ITEM_CD = 'E0007' THEN F_USER_FIND(D.ECC_LICEN_CD) ELSE '' END) AS EEA_COLON_DR 
  FROM (SELECT ERI_EXAM_DT, ERI_EXAM_SQ, 
               CASE WHEN ERI_ITEM_CD = 'E0002' THEN 'E0001' 
                    WHEN ERI_ITEM_CD = 'E0008' THEN 'E0007' ELSE ERI_ITEM_CD END AS ITEM_CD 
          FROM ET_RSLT_ITEM 
         WHERE ERI_EXAM_DT = :EXAM_DT 
           AND ERI_ITEM_CD IN ('E0001', 'E0002', 'E0007', 'E0008') 
           AND ERI_CNCL_YN <> 'Y' 
         GROUP BY ERI_EXAM_DT, ERI_EXAM_SQ, CASE WHEN ERI_ITEM_CD = 'E0002' THEN 'E0001' 
                                                 WHEN ERI_ITEM_CD = 'E0008' THEN 'E0007' ELSE ERI_ITEM_CD END 
       ) B, ET_EXAM_ACPT A LEFT OUTER JOIN ET_CANCER_STMC C 
                             ON C.ECS_EXAM_DT = A.EEA_EXAM_DT 
                            AND C.ECS_EXAM_SQ = A.EEA_EXAM_SQ 
                           LEFT OUTER JOIN ET_CANCER_COLO D 
                           ON D.ECC_EXAM_DT = A.EEA_EXAM_DT 
                        AND D.ECC_EXAM_SQ = A.EEA_EXAM_SQ 
 WHERE A.EEA_EXAM_DT = B.ERI_EXAM_DT
   AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ
   AND A.EEA_ORDER_YN <> 'C'
 GROUP BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, A.EEA_CHART_NO 
 ORDER BY A.EEA_PSNL_NM
 

		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, A.EEA_CHART_NO";
		sql += ", SUM(CASE WHEN B.ITEM_CD = 'E0001' THEN 1 ELSE 0 END) AS EEA_STOMA_CNT";
		sql += ", MAX(CASE WHEN B.ITEM_CD = 'E0001' THEN C.ECS_CFRM_DT ELSE NULL END) AS EEA_STOMA_DT";
		sql += ", MAX(CASE WHEN B.ITEM_CD = 'E0001' THEN F_USER_FIND(C.ECS_LICEN_CD) ELSE '' END) AS EEA_STOMA_DR";
		sql += ", SUM(CASE WHEN B.ITEM_CD = 'E0007' THEN 1 ELSE 0 END) AS EEA_COLON_CNT";
		sql += ", MAX(CASE WHEN B.ITEM_CD = 'E0007' THEN D.ECC_CFRM_DT ELSE NULL END) AS EEA_COLON_DT";
		sql += ", MAX(CASE WHEN B.ITEM_CD = 'E0007' THEN F_USER_FIND(D.ECC_LICEN_CD) ELSE '' END) AS EEA_COLON_DR";
		sql += " FROM (";
		sql += "	SELECT ERI_EXAM_DT, ERI_EXAM_SQ";
		sql += "	, CASE WHEN ERI_ITEM_CD = 'E0002' THEN 'E0001' WHEN ERI_ITEM_CD = 'E0008' THEN 'E0007' ELSE ERI_ITEM_CD END AS ITEM_CD";
		sql += " 	FROM ET_RSLT_ITEM";
		sql += " 	WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND ERI_ITEM_CD IN ('E0001', 'E0002', 'E0007', 'E0008')";
		sql += " 	AND ERI_CNCL_YN <> 'Y'";
		sql += " 	GROUP BY ERI_EXAM_DT, ERI_EXAM_SQ";
		sql += "	, CASE WHEN ERI_ITEM_CD = 'E0002' THEN 'E0001' WHEN ERI_ITEM_CD = 'E0008' THEN 'E0007' ELSE ERI_ITEM_CD END";
		sql += ") B, ET_EXAM_ACPT A LEFT OUTER JOIN ET_CANCER_STMC C";
		sql += " ON C.ECS_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND C.ECS_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_COLO D";
		sql += " ON D.ECC_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND D.ECC_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT = B.ERI_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " GROUP BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, A.EEA_CHART_NO";
		sql += " ORDER BY A.EEA_PSNL_NM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_List_AlvScopeTSelectItem_001 \n";
			G_INFO += "설명 : 내시경 검사 현황 \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='3'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_CNT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_DT' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_DR' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_CNT' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_DT' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_DR' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_STOMA_CNT_T = cRsList.getString("EEA_STOMA_CNT");
			String EEA_STOMA_DT_T = cRsList.getString("EEA_STOMA_DT");
			String EEA_STOMA_DR_T = cRsList.getString("EEA_STOMA_DR");
			String EEA_COLON_CNT_T = cRsList.getString("EEA_COLON_CNT");
			String EEA_COLON_DT_T = cRsList.getString("EEA_COLON_DT");
			String EEA_COLON_DR_T = cRsList.getString("EEA_COLON_DR");
%>
			<z:row
<%
			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_STOMA_CNT_T.equals("")) {
%>
		 		EEA_STOMA_CNT='<%= EEA_STOMA_CNT_T%>'
<%
			}

			if(! EEA_STOMA_DT_T.equals("")) {
%>
		 		EEA_STOMA_DT='<%= EEA_STOMA_DT_T%>'
<%
			}

			if(! EEA_STOMA_DR_T.equals("")) {
%>
		 		EEA_STOMA_DR='<%= EEA_STOMA_DR_T%>'
<%
			}

			if(! EEA_COLON_CNT_T.equals("")) {
%>
		 		EEA_COLON_CNT='<%= EEA_COLON_CNT_T%>'
<%
			}

			if(! EEA_COLON_DT_T.equals("")) {
%>
		 		EEA_COLON_DT='<%= EEA_COLON_DT_T%>'
<%
			}

			if(! EEA_COLON_DR_T.equals("")) {
%>
		 		EEA_COLON_DR='<%= EEA_COLON_DR_T%>'
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
