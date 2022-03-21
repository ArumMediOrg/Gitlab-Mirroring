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
		String USER_KD = htMethod.get("USER_KD");
		String SALES_ID = htMethod.get("SALES_ID");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(USER_KD == null) { USER_KD = ""; }
		if(SALES_ID == null) { SALES_ID = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_CHART_NO, EEA_PSNL_NM, EEA_ACPT_CD, EEA_PLCE_CD, EEA_SEX_CD, EEA_PSNL_AGE, 
       CASE WHEN SUBSTR(EEA_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(EEA_EXAM_LT, '')
            WHEN SUBSTR(EEA_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(EEA_EXAM_LT, EEA_COMP_CD) 
            ELSE CASE WHEN EEA_RECE_NO = 'R' THEN F_CODE_FIND('0401', SUBSTR(EEA_EXAM_CD, 1, 2) || '000', '', '1') || '-자료이관' 
                      ELSE F_CODE_FIND('0401', EEA_EXAM_CD, '', '1') END END ||        
       CASE WHEN EEA_EXAM_CD = '31001' THEN CASE WHEN EEA_DIVI_CD = '1' THEN '-초-' || EEA_DIVI_CS         
                                                   WHEN EEA_DIVI_CD = '2' THEN '-중'         
                                                   WHEN EEA_DIVI_CD = '3' THEN '-고' END     
            WHEN SUBSTR(EEA_EXAM_CD, 1, 1) = '4'  THEN '('||F_CODE_FIND('0910', EEA_SPCL_CD, '', '1')||')'       
                                                  ELSE '' END AS EEA_EXAM_NM,                 
       CASE WHEN UPPER(EEA_HTSB_YN) = 'Y' THEN                                                 
            CASE WHEN SUBSTR(EEA_HTSB_CD, 1, 2) = '11' THEN CASE WHEN SUBSTR(EEA_HTSB_CD, 5, 1) = '1' THEN '일검' 
                                                                      WHEN SUBSTR(EEA_HTSB_CD, 5, 1) = '3' THEN '일검' 
                                                                      ELSE '일검2' END 
                 WHEN SUBSTR(EEA_HTSB_CD, 1, 2) = '12' THEN CASE WHEN SUBSTR(EEA_HTSB_CD, 5, 1) = '1' THEN '생애' 
                                                                      WHEN SUBSTR(EEA_HTSB_CD, 5, 1) = '3' THEN '생애' 
                                                                      ELSE '생애2' END 
                 WHEN SUBSTR(EEA_HTSB_CD, 1, 2) = '13' THEN '암' 
                 WHEN SUBSTR(EEA_HTSB_CD, 1, 2) = '14' THEN '구강' END ELSE '' END AS EEA_HTSB_OX, 
       EEA_STOMA_CD||EEA_COLON_CD||EEA_LIVER_CD||EEA_BAST_CD||EEA_UTER_CD||NVL(EEA_LUNG_CD, '0') EEA_CAN_CD, 
       CASE WHEN NVL(EEA_STOMA_CD, ' ') = ' ' OR NVL(EEA_STOMA_CD, '0') = '0' THEN '' ELSE '위' END EEA_STOMA_CT, 
       CASE WHEN NVL(EEA_COLON_CD, ' ') = ' ' OR NVL(EEA_COLON_CD, '0') = '0' THEN '' ELSE '대' END EEA_COLON_CT, 
       CASE WHEN NVL(EEA_LIVER_CD, ' ') = ' ' OR NVL(EEA_LIVER_CD, '0') = '0' THEN '' ELSE '간' END EEA_LIVER_CT, 
       CASE WHEN NVL(EEA_BAST_CD,  ' ') = ' ' OR NVL(EEA_BAST_CD,  '0') = '0' THEN '' ELSE '유' END EEA_BAST_CT, 
       CASE WHEN NVL(EEA_UTER_CD,  ' ') = ' ' OR NVL(EEA_UTER_CD,  '0') = '0' THEN '' ELSE '자' END EEA_UTER_CT, 
       CASE WHEN NVL(EEA_LUNG_CD,  ' ') = ' ' OR NVL(EEA_LUNG_CD,  '0') = '0' THEN '' ELSE '폐' END EEA_LUNG_CT, 
       CASE WHEN UPPER(EEA_ORAL_YN) = 'Y' AND UPPER(EEA_HDMD_YN) = 'Y' THEN '구강' WHEN EEA_ORAL_YN  = '1' THEN '구강'  
            WHEN       EEA_ORAL_YN  = '3' THEN '구강' ELSE '' END AS EEA_ORAL_OX, 
       CASE WHEN UPPER(EEA_SPSB_YN) = 'Y' THEN F_CODE_FIND('0910', EEA_SPCL_CD, '', '1') ELSE '' END AS EEA_SPSB_OX,
       CASE WHEN UPPER(EEA_CVSB_YN) = 'Y' THEN '뇌심' ELSE '' END AS EEA_CVSB_OX, 
       CASE WHEN UPPER(EEA_EMSB_YN) = 'Y' THEN '채용' ELSE '' END AS EEA_EMSB_OX, 
       CASE WHEN UPPER(EEA_ETSB_YN) = 'Y' THEN '기타' ELSE '' END AS EEA_ETSB_OX, 
       F_COMP_FIND(EEA_COMP_CD) EEA_COMP_NM, 
       F_CODE_FIND('0902', A.EEA_PLCE_CD,   '', '1') EEA_PLCE_NM,
       F_CODE_FIND('0703', B.ICR_NTNA_CD,   '', '1') EEA_NTNA_NM,
       F_CODE_FIND('0723', B.ICR_REGION_CD, '', '1') EEA_REGN_NM,
       F_CODE_FIND('0989', A.EEA_DISC_RC,   '', '1') EEA_DISC_NM, EEA_DISC_RT, EEA_DISC_CD,
       EEA_PSNLR_PR+EEA_COMPR_PR+EEA_HLTHR_PR+EEA_SPCLR_PR EXAM_PR, 
       CASE WHEN EEA_EXAM_CD = '31001' THEN 0 ELSE EEA_PSNLR_PR END AS PSNL_PR, 
       CASE WHEN EEA_EXAM_CD = '31001' THEN EEA_COMPR_PR+EEA_PSNLR_PR ELSE EEA_COMPR_PR END AS COMP_PR, 
       EEA_HLTHR_PR HLTH_PR, EEA_SPCLR_PR SPCL_PR, EEA_DISC_PR DISC_PR,  EEA_DISC_CPR DISC_CPR 
  FROM ET_EXAM_ACPT A 
   LEFT OUTER JOIN IT_CUSTOMER B
    ON B.ICR_CUST_NO = A.EEA_CUST_NO
 WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
   AND EEA_ORDER_YN <> 'C'
   AND NVL(EEA_RECE_NO, ' ') <> 'R'

if (:USER_KD <> '') then
   AND NVL(CASE WHEN :USER_KD = '1' THEN EEA_SALES_ID ELSE EEA_EXEC_ID END, ' ') = NVL(:SALES_ID, ' ')

 :PARAM_TX

 ORDER BY EEA_EXAM_DT, EEA_EXAM_SQ


		*/

		sql = " SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_CHART_NO, EEA_PSNL_NM, EEA_ACPT_CD, EEA_PLCE_CD, EEA_SEX_CD, EEA_PSNL_AGE, CASE WHEN SUBSTR(EEA_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(EEA_EXAM_LT, '') WHEN SUBSTR(EEA_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(EEA_EXAM_LT, EEA_COMP_CD) ELSE CASE WHEN EEA_RECE_NO = 'R' THEN F_CODE_FIND('0401', SUBSTR(EEA_EXAM_CD, 1, 2) || '000', '', '1') || '-자료이관' ELSE F_CODE_FIND('0401', EEA_EXAM_CD, '', '1') END END || CASE WHEN EEA_EXAM_CD = '31001' THEN CASE WHEN EEA_DIVI_CD = '1' THEN '-초-' || EEA_DIVI_CS WHEN EEA_DIVI_CD = '2' THEN '-중' WHEN EEA_DIVI_CD = '3' THEN '-고' END WHEN SUBSTR(EEA_EXAM_CD, 1, 1) = '4' THEN '('||F_CODE_FIND('0910', EEA_SPCL_CD, '', '1')||')' ELSE '' END AS EEA_EXAM_NM, CASE WHEN UPPER(EEA_HTSB_YN) = 'Y' THEN CASE WHEN SUBSTR(EEA_HTSB_CD, 1, 2) = '11' THEN CASE WHEN SUBSTR(EEA_HTSB_CD, 5, 1) = '1' THEN '일검' WHEN SUBSTR(EEA_HTSB_CD, 5, 1) = '3' THEN '일검' ELSE '일검2' END WHEN SUBSTR(EEA_HTSB_CD, 1, 2) = '12' THEN CASE WHEN SUBSTR(EEA_HTSB_CD, 5, 1) = '1' THEN '생애' WHEN SUBSTR(EEA_HTSB_CD, 5, 1) = '3' THEN '생애' ELSE '생애2' END WHEN SUBSTR(EEA_HTSB_CD, 1, 2) = '13' THEN '암' WHEN SUBSTR(EEA_HTSB_CD, 1, 2) = '14' THEN '구강' END ELSE '' END AS EEA_HTSB_OX, EEA_STOMA_CD||EEA_COLON_CD||EEA_LIVER_CD||EEA_BAST_CD||EEA_UTER_CD||NVL(EEA_LUNG_CD, '0') EEA_CAN_CD, CASE WHEN NVL(EEA_STOMA_CD, ' ') = ' '";
		sql += " OR NVL(EEA_STOMA_CD, '0') = '0' THEN '' ELSE '위' END EEA_STOMA_CT, CASE WHEN NVL(EEA_COLON_CD, ' ') = ' '";
		sql += " OR NVL(EEA_COLON_CD, '0') = '0' THEN '' ELSE '대' END EEA_COLON_CT, CASE WHEN NVL(EEA_LIVER_CD, ' ') = ' '";
		sql += " OR NVL(EEA_LIVER_CD, '0') = '0' THEN '' ELSE '간' END EEA_LIVER_CT, CASE WHEN NVL(EEA_BAST_CD, ' ') = ' '";
		sql += " OR NVL(EEA_BAST_CD, '0') = '0' THEN '' ELSE '유' END EEA_BAST_CT, CASE WHEN NVL(EEA_UTER_CD, ' ') = ' '";
		sql += " OR NVL(EEA_UTER_CD, '0') = '0' THEN '' ELSE '자' END EEA_UTER_CT, CASE WHEN NVL(EEA_LUNG_CD, ' ') = ' '";
		sql += " OR NVL(EEA_LUNG_CD, '0') = '0' THEN '' ELSE '폐' END EEA_LUNG_CT, CASE WHEN UPPER(EEA_ORAL_YN) = 'Y'";
		sql += " AND UPPER(EEA_HDMD_YN) = 'Y' THEN '구강' WHEN EEA_ORAL_YN = '1' THEN '구강' WHEN EEA_ORAL_YN = '3' THEN '구강' ELSE '' END AS EEA_ORAL_OX, CASE WHEN UPPER(EEA_SPSB_YN) = 'Y' THEN F_CODE_FIND('0910', EEA_SPCL_CD, '', '1') ELSE '' END AS EEA_SPSB_OX, CASE WHEN UPPER(EEA_CVSB_YN) = 'Y' THEN '뇌심' ELSE '' END AS EEA_CVSB_OX, CASE WHEN UPPER(EEA_EMSB_YN) = 'Y' THEN '채용' ELSE '' END AS EEA_EMSB_OX, CASE WHEN UPPER(EEA_ETSB_YN) = 'Y' THEN '기타' ELSE '' END AS EEA_ETSB_OX, F_COMP_FIND(EEA_COMP_CD) EEA_COMP_NM, F_CODE_FIND('0902', A.EEA_PLCE_CD, '', '1') EEA_PLCE_NM, F_CODE_FIND('0703', B.ICR_NTNA_CD, '', '1') EEA_NTNA_NM, F_CODE_FIND('0723', B.ICR_REGION_CD, '', '1') EEA_REGN_NM, F_CODE_FIND('0989', A.EEA_DISC_RC, '', '1') EEA_DISC_NM, EEA_DISC_RT, EEA_DISC_CD, EEA_PSNLR_PR+EEA_COMPR_PR+EEA_HLTHR_PR+EEA_SPCLR_PR EXAM_PR, CASE WHEN EEA_EXAM_CD = '31001' THEN 0 ELSE EEA_PSNLR_PR END AS PSNL_PR, CASE WHEN EEA_EXAM_CD = '31001' THEN EEA_COMPR_PR+EEA_PSNLR_PR ELSE EEA_COMPR_PR END AS COMP_PR, EEA_HLTHR_PR HLTH_PR, EEA_SPCLR_PR SPCL_PR, EEA_DISC_PR DISC_PR, EEA_DISC_CPR DISC_CPR";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.EEA_CUST_NO";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";

		if(! USER_KD.equals("")) {
			sql += " AND NVL(CASE WHEN '" + USER_KD + "' = '1' THEN EEA_SALES_ID ELSE EEA_EXEC_ID END, ' ') = NVL('" + SALES_ID + "', ' ')";
		}
		
		sql += PARAM_TX;
		sql += " ORDER BY EEA_EXAM_DT, EEA_EXAM_SQ";


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_Sales_UP_Sales_Rep_002 \n";
			G_INFO += "설명 : 영업/수행 담당자별 상세 현황 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " USER_KD : " + USER_KD + " \n";
			G_INFO += " SALES_ID : " + SALES_ID + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_CD' rs:number='5' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_ACPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='6' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_NM' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_OX' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CAN_CD' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_CT' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_CT' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_CT' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_CT' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_CT' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_CT' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_OX' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_OX' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_OX' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_OX' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DISC_RT'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_OX' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DISC_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_NM' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTHR_PR'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_NTNA_NM' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCLR_PR'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_REGN_NM' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DISC_PR'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DISC_NM' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DISC_CPR'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DISC_RT' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='2' rs:precision='5' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DISC_CD' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_PR' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_PR' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='COMP_PR' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HLTH_PR' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPCL_PR' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='DISC_PR' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='DISC_CPR' rs:number='36' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='37' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c37' rs:name='ROWID' rs:number='38' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_ACPT_CD_T = cRsList.getString("EEA_ACPT_CD");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_EXAM_NM_T = cRsList.getString("EEA_EXAM_NM");
			String EEA_HTSB_OX_T = cRsList.getString("EEA_HTSB_OX");
			String EEA_CAN_CD_T = cRsList.getString("EEA_CAN_CD");
			String EEA_STOMA_CT_T = cRsList.getString("EEA_STOMA_CT");
			String EEA_COLON_CT_T = cRsList.getString("EEA_COLON_CT");
			String EEA_LIVER_CT_T = cRsList.getString("EEA_LIVER_CT");
			String EEA_BAST_CT_T = cRsList.getString("EEA_BAST_CT");
			String EEA_UTER_CT_T = cRsList.getString("EEA_UTER_CT");
			String EEA_LUNG_CT_T = cRsList.getString("EEA_LUNG_CT");
			String EEA_ORAL_OX_T = cRsList.getString("EEA_ORAL_OX");
			String EEA_SPSB_OX_T = cRsList.getString("EEA_SPSB_OX");
			String EEA_CVSB_OX_T = cRsList.getString("EEA_CVSB_OX");
			String EEA_EMSB_OX_T = cRsList.getString("EEA_EMSB_OX");
			String EEA_ETSB_OX_T = cRsList.getString("EEA_ETSB_OX");
			String EEA_COMP_NM_T = cRsList.getString("EEA_COMP_NM");
			String EEA_PLCE_NM_T = cRsList.getString("EEA_PLCE_NM");
			String EEA_NTNA_NM_T = cRsList.getString("EEA_NTNA_NM");
			String EEA_REGN_NM_T = cRsList.getString("EEA_REGN_NM");
			String EEA_DISC_NM_T = cRsList.getString("EEA_DISC_NM");
			String EEA_DISC_RT_T = cRsList.getString("EEA_DISC_RT");
			String EEA_DISC_CD_T = cRsList.getString("EEA_DISC_CD");
			String EXAM_PR_T = cRsList.getString("EXAM_PR");
			String PSNL_PR_T = cRsList.getString("PSNL_PR");
			String COMP_PR_T = cRsList.getString("COMP_PR");
			String HLTH_PR_T = cRsList.getString("HLTH_PR");
			String SPCL_PR_T = cRsList.getString("SPCL_PR");
			String DISC_PR_T = cRsList.getString("DISC_PR");
			String DISC_CPR_T = cRsList.getString("DISC_CPR");
			String ROWID_T = cRsList.getString("ROWID");
			String c37_T = cRsList.getString("c37");
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

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_ACPT_CD_T.equals("")) {
%>
		 		EEA_ACPT_CD='<%= EEA_ACPT_CD_T%>'
<%
			}

			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
<%
			}

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! EEA_EXAM_NM_T.equals("")) {
%>
		 		EEA_EXAM_NM='<%= EEA_EXAM_NM_T%>'
<%
			}

			if(! EEA_HTSB_OX_T.equals("")) {
%>
		 		EEA_HTSB_OX='<%= EEA_HTSB_OX_T%>'
<%
			}

			if(! EEA_CAN_CD_T.equals("")) {
%>
		 		EEA_CAN_CD='<%= EEA_CAN_CD_T%>'
<%
			}

			if(! EEA_STOMA_CT_T.equals("")) {
%>
		 		EEA_STOMA_CT='<%= EEA_STOMA_CT_T%>'
<%
			}

			if(! EEA_COLON_CT_T.equals("")) {
%>
		 		EEA_COLON_CT='<%= EEA_COLON_CT_T%>'
<%
			}

			if(! EEA_LIVER_CT_T.equals("")) {
%>
		 		EEA_LIVER_CT='<%= EEA_LIVER_CT_T%>'
<%
			}

			if(! EEA_BAST_CT_T.equals("")) {
%>
		 		EEA_BAST_CT='<%= EEA_BAST_CT_T%>'
<%
			}

			if(! EEA_UTER_CT_T.equals("")) {
%>
		 		EEA_UTER_CT='<%= EEA_UTER_CT_T%>'
<%
			}

			if(! EEA_LUNG_CT_T.equals("")) {
%>
		 		EEA_LUNG_CT='<%= EEA_LUNG_CT_T%>'
<%
			}

			if(! EEA_ORAL_OX_T.equals("")) {
%>
		 		EEA_ORAL_OX='<%= EEA_ORAL_OX_T%>'
<%
			}

			if(! EEA_SPSB_OX_T.equals("")) {
%>
		 		EEA_SPSB_OX='<%= EEA_SPSB_OX_T%>'
<%
			}

			if(! EEA_CVSB_OX_T.equals("")) {
%>
		 		EEA_CVSB_OX='<%= EEA_CVSB_OX_T%>'
<%
			}

			if(! EEA_EMSB_OX_T.equals("")) {
%>
		 		EEA_EMSB_OX='<%= EEA_EMSB_OX_T%>'
<%
			}

			if(! EEA_ETSB_OX_T.equals("")) {
%>
		 		EEA_ETSB_OX='<%= EEA_ETSB_OX_T%>'
<%
			}

			if(! EEA_COMP_NM_T.equals("")) {
%>
		 		EEA_COMP_NM='<%= EEA_COMP_NM_T%>'
<%
			}

			if(! EEA_PLCE_NM_T.equals("")) {
%>
		 		EEA_PLCE_NM='<%= EEA_PLCE_NM_T%>'
<%
			}

			if(! EEA_NTNA_NM_T.equals("")) {
%>
		 		EEA_NTNA_NM='<%= EEA_NTNA_NM_T%>'
<%
			}

			if(! EEA_REGN_NM_T.equals("")) {
%>
		 		EEA_REGN_NM='<%= EEA_REGN_NM_T%>'
<%
			}

			if(! EEA_DISC_NM_T.equals("")) {
%>
		 		EEA_DISC_NM='<%= EEA_DISC_NM_T%>'
<%
			}

			if(! EEA_DISC_RT_T.equals("")) {
%>
		 		EEA_DISC_RT='<%= EEA_DISC_RT_T%>'
<%
			}

			if(! EEA_DISC_CD_T.equals("")) {
%>
		 		EEA_DISC_CD='<%= EEA_DISC_CD_T%>'
<%
			}

			if(! EXAM_PR_T.equals("")) {
%>
		 		EXAM_PR='<%= EXAM_PR_T%>'
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

			if(! HLTH_PR_T.equals("")) {
%>
		 		HLTH_PR='<%= HLTH_PR_T%>'
<%
			}

			if(! SPCL_PR_T.equals("")) {
%>
		 		SPCL_PR='<%= SPCL_PR_T%>'
<%
			}

			if(! DISC_PR_T.equals("")) {
%>
		 		DISC_PR='<%= DISC_PR_T%>'
<%
			}

			if(! DISC_CPR_T.equals("")) {
%>
		 		DISC_CPR='<%= DISC_CPR_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c37_T.equals("")) {
%>
		 		c37='<%= c37_T%>'
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
