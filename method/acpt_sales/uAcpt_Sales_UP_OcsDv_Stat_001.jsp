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

SELECT EEA_OCS_DV DIVI_CD, MAX(NVL(OCS_NM, ' ')) DIVI_NM, 
       SUM(TOT_CNT)   EXAM_CNT, 
       SUM(TOT_PR)    EXAM_PR, 
       SUM(EXAM_MCNT) EXAM_MCNT, 
       SUM(PSNL_MPR)  PSNL_MPR, 
       SUM(COMP_MPR)  COMP_MPR, 
       SUM(HLTH_MPR)  HLTH_MPR, 
       SUM(SPCL_MPR)  SPCL_MPR, 
       SUM(EXAM_MPR)  EXAM_MPR, 
       SUM(EXAM_WCNT) EXAM_WCNT, 
       SUM(PSNL_WPR)  PSNL_WPR, 
       SUM(COMP_WPR)  COMP_WPR, 
       SUM(HLTH_WPR)  HLTH_WPR, 
       SUM(SPCL_WPR)  SPCL_WPR, 
       SUM(EXAM_WPR)  EXAM_WPR, 
       SUM(DISC_CNT)  DISC_CNT, 
       SUM(DISC_PR)   DISC_PR, 
       SUM(DISC_MCNT) DISC_MCNT, 
       SUM(DISC_MPR)  DISC_MPR, 
       SUM(DISC_WCNT) DISC_WCNT, 
       SUM(DISC_WPR)  DISC_WPR 
  FROM (SELECT  1 TOT_CNT, EEA_OCS_DV, 
                (SELECT CCN_FULL_NM FROM CT_COMMON 
                                      WHERE CCN_LARGE = '0501' 
                                        AND CCN_SMALL = EEA_OCS_DV 
                                        AND CCN_LEVEL = '5') AS OCS_NM, 
                EEA_PSNLR_PR, EEA_COMPR_PR, EEA_HLTHR_PR, EEA_SPCLR_PR, 
                CASE EEA_SEX_CD WHEN '1' THEN 1 ELSE 0 END EXAM_MCNT, 
                CASE EEA_SEX_CD WHEN '2' THEN 1 ELSE 0 END EXAM_WCNT, 
                CASE EEA_SEX_CD WHEN '1' THEN EEA_PSNLR_PR ELSE 0 END PSNL_MPR, 
                CASE EEA_SEX_CD WHEN '2' THEN EEA_PSNLR_PR ELSE 0 END PSNL_WPR, 
                CASE EEA_SEX_CD WHEN '1' THEN EEA_COMPR_PR ELSE 0 END COMP_MPR, 
                CASE EEA_SEX_CD WHEN '2' THEN EEA_COMPR_PR ELSE 0 END COMP_WPR, 
                CASE EEA_SEX_CD WHEN '1' THEN EEA_HLTHR_PR ELSE 0 END HLTH_MPR, 
                CASE EEA_SEX_CD WHEN '2' THEN EEA_HLTHR_PR ELSE 0 END HLTH_WPR, 
                CASE EEA_SEX_CD WHEN '1' THEN EEA_SPCLR_PR ELSE 0 END SPCL_MPR, 
                CASE EEA_SEX_CD WHEN '2' THEN EEA_SPCLR_PR ELSE 0 END SPCL_WPR, 
                CASE EEA_SEX_CD WHEN '1' THEN EEA_PSNLR_PR+EEA_COMPR_PR+EEA_HLTHR_PR+EEA_SPCLR_PR ELSE 0 END EXAM_MPR, 
                CASE EEA_SEX_CD WHEN '2' THEN EEA_PSNLR_PR+EEA_COMPR_PR+EEA_HLTHR_PR+EEA_SPCLR_PR ELSE 0 END EXAM_WPR, 
                EEA_PSNLR_PR+EEA_COMPR_PR+EEA_HLTHR_PR+EEA_SPCLR_PR TOT_PR, 
                CASE WHEN EEA_SEX_CD = '1' AND NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) > 0 THEN 1 ELSE 0 END DISC_MCNT, 
                CASE WHEN EEA_SEX_CD = '2' AND NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) > 0 THEN 1 ELSE 0 END DISC_WCNT, 
                CASE EEA_SEX_CD WHEN '1' THEN NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) ELSE 0 END DISC_MPR, 
                CASE EEA_SEX_CD WHEN '2' THEN NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) ELSE 0 END DISC_WPR, 
                CASE WHEN NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) > 0 THEN 1 ELSE 0 END DISC_CNT, 
                NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) DISC_PR 
           FROM ET_EXAM_ACPT 
          WHERE EEA_EXAM_DT BETWEEN  :EXAM_SDT AND :EXAM_EDT 
            AND EEA_ORDER_YN <> 'C' 
            AND NVL(EEA_OCS_DV,  ' ') <> ' ' 

IF (:RECE_NO = 'R') THEN
            AND NVL(EEA_RECE_NO, ' ') <> 'R'                   
        ) A 
 GROUP BY EEA_OCS_DV 
 ORDER BY MAX(NVL(OCS_NM, ' ')) 

		*/

		sql = " SELECT EEA_OCS_DV DIVI_CD, MAX(NVL(OCS_NM, ' ')) DIVI_NM, SUM(TOT_CNT) EXAM_CNT, SUM(TOT_PR) EXAM_PR, SUM(EXAM_MCNT) EXAM_MCNT, SUM(PSNL_MPR) PSNL_MPR, SUM(COMP_MPR) COMP_MPR, SUM(HLTH_MPR) HLTH_MPR, SUM(SPCL_MPR) SPCL_MPR, SUM(EXAM_MPR) EXAM_MPR, SUM(EXAM_WCNT) EXAM_WCNT, SUM(PSNL_WPR) PSNL_WPR, SUM(COMP_WPR) COMP_WPR, SUM(HLTH_WPR) HLTH_WPR, SUM(SPCL_WPR) SPCL_WPR, SUM(EXAM_WPR) EXAM_WPR, SUM(DISC_CNT) DISC_CNT, SUM(DISC_PR) DISC_PR, SUM(DISC_MCNT) DISC_MCNT, SUM(DISC_MPR) DISC_MPR, SUM(DISC_WCNT) DISC_WCNT, SUM(DISC_WPR) DISC_WPR";
		sql += " FROM (SELECT 1 TOT_CNT, EEA_OCS_DV, (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0501'";
		sql += " AND CCN_SMALL = EEA_OCS_DV";
		sql += " AND CCN_LEVEL = '5') AS OCS_NM, EEA_PSNLR_PR, EEA_COMPR_PR, EEA_HLTHR_PR, EEA_SPCLR_PR, CASE EEA_SEX_CD WHEN '1' THEN 1 ELSE 0 END EXAM_MCNT, CASE EEA_SEX_CD WHEN '2' THEN 1 ELSE 0 END EXAM_WCNT, CASE EEA_SEX_CD WHEN '1' THEN EEA_PSNLR_PR ELSE 0 END PSNL_MPR, CASE EEA_SEX_CD WHEN '2' THEN EEA_PSNLR_PR ELSE 0 END PSNL_WPR, CASE EEA_SEX_CD WHEN '1' THEN EEA_COMPR_PR ELSE 0 END COMP_MPR, CASE EEA_SEX_CD WHEN '2' THEN EEA_COMPR_PR ELSE 0 END COMP_WPR, CASE EEA_SEX_CD WHEN '1' THEN EEA_HLTHR_PR ELSE 0 END HLTH_MPR, CASE EEA_SEX_CD WHEN '2' THEN EEA_HLTHR_PR ELSE 0 END HLTH_WPR, CASE EEA_SEX_CD WHEN '1' THEN EEA_SPCLR_PR ELSE 0 END SPCL_MPR, CASE EEA_SEX_CD WHEN '2' THEN EEA_SPCLR_PR ELSE 0 END SPCL_WPR, CASE EEA_SEX_CD WHEN '1' THEN EEA_PSNLR_PR+EEA_COMPR_PR+EEA_HLTHR_PR+EEA_SPCLR_PR ELSE 0 END EXAM_MPR, CASE EEA_SEX_CD WHEN '2' THEN EEA_PSNLR_PR+EEA_COMPR_PR+EEA_HLTHR_PR+EEA_SPCLR_PR ELSE 0 END EXAM_WPR, EEA_PSNLR_PR+EEA_COMPR_PR+EEA_HLTHR_PR+EEA_SPCLR_PR TOT_PR, CASE WHEN EEA_SEX_CD = '1'";
		sql += " AND NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) > 0 THEN 1 ELSE 0 END DISC_MCNT, CASE WHEN EEA_SEX_CD = '2'";
		sql += " AND NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) > 0 THEN 1 ELSE 0 END DISC_WCNT, CASE EEA_SEX_CD WHEN '1' THEN NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) ELSE 0 END DISC_MPR, CASE EEA_SEX_CD WHEN '2' THEN NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) ELSE 0 END DISC_WPR, CASE WHEN NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) > 0 THEN 1 ELSE 0 END DISC_CNT, NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) DISC_PR";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_OCS_DV, ' ') <> ' '";

		if(RECE_NO.equals("R")) {
			sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		}

		sql += " ) A";
		sql += " GROUP BY EEA_OCS_DV";
		sql += " ORDER BY MAX(NVL(OCS_NM, ' '))";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_Sales_UP_OcsDv_Stat_001 \n";
			G_INFO += "설명 : 의뢰과 현황 \n";
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
		<s:AttributeType name='DIVI_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='DIVI_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_CNT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_PR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_MCNT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_MPR' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='COMP_MPR' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HLTH_MPR' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SPCL_MPR' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_MPR' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_WCNT' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_WPR' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='COMP_WPR' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HLTH_WPR' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SPCL_WPR' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_WPR' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DISC_CNT' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DISC_PR' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DISC_MCNT' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DISC_MPR' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DISC_WCNT' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DISC_WPR' rs:number='22' rs:nullable='true'>
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

			String DIVI_CD_T = cRsList.getString("DIVI_CD");
			String DIVI_NM_T = cRsList.getString("DIVI_NM");
			String EXAM_CNT_T = cRsList.getString("EXAM_CNT");
			String EXAM_PR_T = cRsList.getString("EXAM_PR");
			String EXAM_MCNT_T = cRsList.getString("EXAM_MCNT");
			String PSNL_MPR_T = cRsList.getString("PSNL_MPR");
			String COMP_MPR_T = cRsList.getString("COMP_MPR");
			String HLTH_MPR_T = cRsList.getString("HLTH_MPR");
			String SPCL_MPR_T = cRsList.getString("SPCL_MPR");
			String EXAM_MPR_T = cRsList.getString("EXAM_MPR");
			String EXAM_WCNT_T = cRsList.getString("EXAM_WCNT");
			String PSNL_WPR_T = cRsList.getString("PSNL_WPR");
			String COMP_WPR_T = cRsList.getString("COMP_WPR");
			String HLTH_WPR_T = cRsList.getString("HLTH_WPR");
			String SPCL_WPR_T = cRsList.getString("SPCL_WPR");
			String EXAM_WPR_T = cRsList.getString("EXAM_WPR");
			String DISC_CNT_T = cRsList.getString("DISC_CNT");
			String DISC_PR_T = cRsList.getString("DISC_PR");
			String DISC_MCNT_T = cRsList.getString("DISC_MCNT");
			String DISC_MPR_T = cRsList.getString("DISC_MPR");
			String DISC_WCNT_T = cRsList.getString("DISC_WCNT");
			String DISC_WPR_T = cRsList.getString("DISC_WPR");
%>
			<z:row
<%
			if(! DIVI_CD_T.equals("")) {
%>
		 		DIVI_CD='<%= DIVI_CD_T%>'
<%
			}

			if(! DIVI_NM_T.equals("")) {
%>
		 		DIVI_NM='<%= DIVI_NM_T%>'
<%
			}

			if(! EXAM_CNT_T.equals("")) {
%>
		 		EXAM_CNT='<%= EXAM_CNT_T%>'
<%
			}

			if(! EXAM_PR_T.equals("")) {
%>
		 		EXAM_PR='<%= EXAM_PR_T%>'
<%
			}

			if(! EXAM_MCNT_T.equals("")) {
%>
		 		EXAM_MCNT='<%= EXAM_MCNT_T%>'
<%
			}

			if(! PSNL_MPR_T.equals("")) {
%>
		 		PSNL_MPR='<%= PSNL_MPR_T%>'
<%
			}

			if(! COMP_MPR_T.equals("")) {
%>
		 		COMP_MPR='<%= COMP_MPR_T%>'
<%
			}

			if(! HLTH_MPR_T.equals("")) {
%>
		 		HLTH_MPR='<%= HLTH_MPR_T%>'
<%
			}

			if(! SPCL_MPR_T.equals("")) {
%>
		 		SPCL_MPR='<%= SPCL_MPR_T%>'
<%
			}

			if(! EXAM_MPR_T.equals("")) {
%>
		 		EXAM_MPR='<%= EXAM_MPR_T%>'
<%
			}

			if(! EXAM_WCNT_T.equals("")) {
%>
		 		EXAM_WCNT='<%= EXAM_WCNT_T%>'
<%
			}

			if(! PSNL_WPR_T.equals("")) {
%>
		 		PSNL_WPR='<%= PSNL_WPR_T%>'
<%
			}

			if(! COMP_WPR_T.equals("")) {
%>
		 		COMP_WPR='<%= COMP_WPR_T%>'
<%
			}

			if(! HLTH_WPR_T.equals("")) {
%>
		 		HLTH_WPR='<%= HLTH_WPR_T%>'
<%
			}

			if(! SPCL_WPR_T.equals("")) {
%>
		 		SPCL_WPR='<%= SPCL_WPR_T%>'
<%
			}

			if(! EXAM_WPR_T.equals("")) {
%>
		 		EXAM_WPR='<%= EXAM_WPR_T%>'
<%
			}

			if(! DISC_CNT_T.equals("")) {
%>
		 		DISC_CNT='<%= DISC_CNT_T%>'
<%
			}

			if(! DISC_PR_T.equals("")) {
%>
		 		DISC_PR='<%= DISC_PR_T%>'
<%
			}

			if(! DISC_MCNT_T.equals("")) {
%>
		 		DISC_MCNT='<%= DISC_MCNT_T%>'
<%
			}

			if(! DISC_MPR_T.equals("")) {
%>
		 		DISC_MPR='<%= DISC_MPR_T%>'
<%
			}

			if(! DISC_WCNT_T.equals("")) {
%>
		 		DISC_WCNT='<%= DISC_WCNT_T%>'
<%
			}

			if(! DISC_WPR_T.equals("")) {
%>
		 		DISC_WPR='<%= DISC_WPR_T%>'
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
