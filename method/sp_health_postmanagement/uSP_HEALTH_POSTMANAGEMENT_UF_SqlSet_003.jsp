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

		String PENCRT_KD = htMethod.get("PENCRT_KD");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");
		String HLTH_YN = htMethod.get("HLTH_YN");
		String PARAM_TX3 = htMethod.get("PARAM_TX3");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(PENCRT_KD == null) { PENCRT_KD = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }
		if(HLTH_YN == null) { HLTH_YN = ""; }
		if(PARAM_TX3 == null) { PARAM_TX3 = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

IF (PENCRT_KD = '1') THEN
  SELECT DISTINCT B.ICR_PID_EN  ICR_PENL_DE,
ELSE IF (PENCRT_KD = '2') THEN 
  SELECT DISTINCT ECHELONDB.ECL_DECRYPT(B.ICR_PID_EN) ICR_PENL_DE,
ELSE                            
  SELECT DISTINCT B.ICR_PENL_ID ICR_PENL_DE,

       CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END ICR_SPCH_KD, 
       CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD
            ELSE GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END ICR_SPCL_NM,
       CASE WHEN B.ICR_SEX_KD  IS NULL OR B.ICR_SEX_KD  = '' THEN B.ICR_SEX_KD
            ELSE GETCOMMON_LVCDTONM('0411',B.ICR_SEX_KD, '5',1) END ICR_SEX_NM,
       CASE WHEN D.SBE_GOJU_CD IS NULL OR D.SBE_GOJU_CD = '' THEN D.SBE_GOJU_CD
            ELSE GETCOMMON_LVCDTONM('0808',D.SBE_GOJU_CD,'5',5) END SBE_GOJU_NM,
       A.EEA_EXAM_CD, A.EEA_HDMD_YN,  A.EEA_SDMD_YN,  A.EEA_SPCL_LT,  A.EEA_SPCL_CD,   
       A.EEA_SPHT_CD, A.EEA_CHART_NO, A.EEA_PSNL_AGE, A.EEA_2ND_YN,  
       A.EEA_TEL_NO,  A.EEA_MOBL_NO,  A.EEA_DIVI_NO,  A.EEA_DEPT_NM, 
       A.EEA_EXAM_DT, A.EEA_EXAM_SQ,  A.EEA_CUST_NO,  A.EEA_PSNL_NM,  
       B.ICR_BIRH_KD, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT,
       B.ICR_TEL_NO,  B.ICR_MOBL_NO,  B.ICR_SEX_KD,   B.ICR_BIRH_DT,
       D.SBE_NCPN_LT, D.SBE_TPAN_NM,  D.SBE_TBUS_NM               
  FROM ET_EXAM_ACPT A
       INNER JOIN IT_CUSTOMER B ON A.EEA_CUST_NO = B.ICR_CUST_NO
       INNER JOIN ST_BASE D     ON A.EEA_EXAM_DT = D.SBE_EXAM_DT
                               AND A.EEA_EXAM_SQ = D.SBE_EXAM_SQ
                               AND D.SBE_PANJ_YN = 'Y'
       LEFT OUTER JOIN IT_COMPANY  E ON A.EEA_COMP_CD = E.ICY_COMP_CD 
       
:PARAM_TX1       
:PARAM_TX2  
     
IF (:HLTH_YN = 'Y') THEN
BEGIN                               
  UNION                               
  IF (PENCRT_KD = '1') THEN
    SELECT B.ICR_PID_EN  ICR_PENL_DE,
  ELSE IF (PENCRT_KD = '2') THEN 
    SELECT ECHELONDB.ECL_DECRYPT(B.ICR_PID_EN) ICR_PENL_DE,
  ELSE                            
    SELECT B.ICR_PENL_ID ICR_PENL_DE,

         '3' AS ICR_SPCH_KD, '일검' AS ICR_SPCL_NM,
         CASE WHEN B.ICR_SEX_KD  IS NULL OR B.ICR_SEX_KD  = '' THEN B.ICR_SEX_KD
              ELSE GETCOMMON_LVCDTONM('0411',B.ICR_SEX_KD, '5',1) END ICR_SEX_NM,
         '' AS SBE_GOJU_NM, 
         A.EEA_EXAM_CD, A.EEA_HDMD_YN,  A.EEA_SDMD_YN, '' AS EEA_SPCL_LT, '' AS EEA_SPCL_CD,
         A.EEA_SPHT_CD, A.EEA_CHART_NO, A.EEA_PSNL_AGE, A.EEA_2ND_YN,
         A.EEA_TEL_NO,  A.EEA_MOBL_NO,  A.EEA_DIVI_NO,  A.EEA_DEPT_NM,
         A.EEA_EXAM_DT, A.EEA_EXAM_SQ,  A.EEA_CUST_NO,  A.EEA_PSNL_NM,
         B.ICR_BIRH_KD, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT,
         B.ICR_TEL_NO,  B.ICR_MOBL_NO,  B.ICR_SEX_KD,   B.ICR_BIRH_DT,
         '' AS SBE_NCPN_LT,  '' AS SBE_TPAN_NM, '' AS SBE_TBUS_NM
    FROM ET_EXAM_ACPT A
         INNER JOIN IT_CUSTOMER      B ON B.ICR_CUST_NO = A.EEA_CUST_NO
         INNER JOIN PT_LABOR_PANJUNG C ON A.EEA_EXAM_DT = C.PLP_EXAM_DT
                                      AND A.EEA_EXAM_SQ = C.PLP_EXAM_SQ
         LEFT OUTER JOIN IT_COMPANY  E ON A.EEA_COMP_CD = E.ICY_COMP_CD
         
  :PARAM_TX1       
  :PARAM_TX3
END;

:ORDER_BY  
		*/

		if(PENCRT_KD.equals("1")) {
			sql = " SELECT DISTINCT B.ICR_PID_EN ICR_PENL_DE,";
		} else if(PENCRT_KD.equals("1")) {
			sql = " SELECT DISTINCT ECL_DECRYPT(B.ICR_PID_EN) ICR_PENL_DE,";
		} else {
			sql = " SELECT DISTINCT B.ICR_PENL_ID ICR_PENL_DE";
		}

		sql += ", CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END ICR_SPCH_KD";
		sql += ", CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END ICR_SPCL_NM";
		sql += ", CASE WHEN B.ICR_SEX_KD IS NULL OR B.ICR_SEX_KD = '' THEN B.ICR_SEX_KD ELSE GETCOMMON_LVCDTONM('0411',B.ICR_SEX_KD, '5',1) END ICR_SEX_NM";
		sql += ", CASE WHEN D.SBE_GOJU_CD IS NULL OR D.SBE_GOJU_CD = '' THEN D.SBE_GOJU_CD ELSE GETCOMMON_LVCDTONM('0808',D.SBE_GOJU_CD,'5',5) END SBE_GOJU_NM";
		sql += ", A.EEA_EXAM_CD, A.EEA_HDMD_YN, A.EEA_SDMD_YN, A.EEA_SPCL_LT, A.EEA_SPCL_CD, A.EEA_SPHT_CD, A.EEA_CHART_NO, A.EEA_PSNL_AGE, A.EEA_2ND_YN, A.EEA_TEL_NO, A.EEA_MOBL_NO, A.EEA_DIVI_NO, A.EEA_DEPT_NM, A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CUST_NO, A.EEA_PSNL_NM, B.ICR_BIRH_KD, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, B.ICR_TEL_NO, B.ICR_MOBL_NO, B.ICR_SEX_KD, B.ICR_BIRH_DT, D.SBE_NCPN_LT, D.SBE_TPAN_NM, D.SBE_TBUS_NM";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO INNER JOIN ST_BASE D";
		sql += " ON A.EEA_EXAM_DT = D.SBE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.SBE_EXAM_SQ";
		sql += " AND D.SBE_PANJ_YN = 'Y' LEFT OUTER JOIN IT_COMPANY E";
		sql += " ON A.EEA_COMP_CD = E.ICY_COMP_CD";
		
		sql += PARAM_TX1;
		sql += PARAM_TX2;


		if(HLTH_YN.equals("Y")) {


  			sql += " UNION";

			if(PENCRT_KD.equals("1")) {
				sql += " SELECT B.ICR_PID_EN ICR_PENL_DE,";
			} else if(PENCRT_KD.equals("1")) {
				sql += " SELECT ECL_DECRYPT(B.ICR_PID_EN) ICR_PENL_DE,";
			} else {
				sql += " SELECT B.ICR_PENL_ID ICR_PENL_DE,";
			}

			sql += " '3' AS ICR_SPCH_KD, '일검' AS ICR_SPCL_NM";
			sql += ", CASE WHEN B.ICR_SEX_KD IS NULL OR B.ICR_SEX_KD = '' THEN B.ICR_SEX_KD ELSE GETCOMMON_LVCDTONM('0411',B.ICR_SEX_KD, '5',1) END ICR_SEX_NM";
			sql += ", '' AS SBE_GOJU_NM, A.EEA_EXAM_CD, A.EEA_HDMD_YN, A.EEA_SDMD_YN, '' AS EEA_SPCL_LT, '' AS EEA_SPCL_CD, A.EEA_SPHT_CD, A.EEA_CHART_NO, A.EEA_PSNL_AGE, A.EEA_2ND_YN, A.EEA_TEL_NO, A.EEA_MOBL_NO, A.EEA_DIVI_NO, A.EEA_DEPT_NM, A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CUST_NO, A.EEA_PSNL_NM, B.ICR_BIRH_KD, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, B.ICR_TEL_NO, B.ICR_MOBL_NO, B.ICR_SEX_KD, B.ICR_BIRH_DT, '' AS SBE_NCPN_LT, '' AS SBE_TPAN_NM, '' AS SBE_TBUS_NM";
			sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
			sql += " ON B.ICR_CUST_NO = A.EEA_CUST_NO INNER JOIN PT_LABOR_PANJUNG C";
			sql += " ON A.EEA_EXAM_DT = C.PLP_EXAM_DT";
			sql += " AND A.EEA_EXAM_SQ = C.PLP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY E";
			sql += " ON A.EEA_COMP_CD = E.ICY_COMP_CD";
			
			sql += PARAM_TX1;
			sql += PARAM_TX3;
         
		}
		
		sql += ORDER_BY;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_POSTMANAGEMENT_UF_SqlSet_003 \n";
			G_INFO += "설명 : 검진정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PENCRT_KD : " + PENCRT_KD + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
			G_INFO += " HLTH_YN : " + HLTH_YN + " \n";
			G_INFO += " PARAM_TX3 : " + PARAM_TX3 + " \n";
			G_INFO += " ORDER_BY : " + ORDER_BY + " \n";
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
		<s:AttributeType name='ICR_PENL_DE' rs:number='1' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SPCH_KD' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SPCL_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_GOJU_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='6' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HDMD_YN' rs:number='7' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_HDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SDMD_YN' rs:number='8' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_SDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='9' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='10' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPHT_CD' rs:number='11' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_SPHT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='12' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='13' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_2ND_YN' rs:number='14' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_2ND_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEL_NO' rs:number='15' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='16' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='17' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='18' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='19' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='20' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='21' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='22' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_KD' rs:number='23' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_BIRH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BIRTH_DT' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_TEL_NO' rs:number='25' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO' rs:number='26' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_KD' rs:number='27' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_SEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='28' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_NCPN_LT' rs:number='29' rs:nullable='true' rs:basetable='ST_BASE' rs:basecolumn='SBE_NCPN_LT'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TPAN_NM' rs:number='30' rs:nullable='true' rs:basetable='ST_BASE' rs:basecolumn='SBE_TPAN_NM'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TBUS_NM' rs:number='31' rs:nullable='true' rs:basetable='ST_BASE' rs:basecolumn='SBE_TBUS_NM'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ICR_PENL_DE_T = cRsList.getString("ICR_PENL_DE");
			String ICR_SPCH_KD_T = cRsList.getString("ICR_SPCH_KD");
			String ICR_SPCL_NM_T = cRsList.getString("ICR_SPCL_NM");
			String ICR_SEX_NM_T = cRsList.getString("ICR_SEX_NM");
			String SBE_GOJU_NM_T = cRsList.getString("SBE_GOJU_NM");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_HDMD_YN_T = cRsList.getString("EEA_HDMD_YN");
			String EEA_SDMD_YN_T = cRsList.getString("EEA_SDMD_YN");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_SPHT_CD_T = cRsList.getString("EEA_SPHT_CD");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_2ND_YN_T = cRsList.getString("EEA_2ND_YN");
			String EEA_TEL_NO_T = cRsList.getString("EEA_TEL_NO");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String ICR_BIRH_KD_T = cRsList.getString("ICR_BIRH_KD");
			String EEA_BIRTH_DT_T = cRsList.getString("EEA_BIRTH_DT");
			String ICR_TEL_NO_T = cRsList.getString("ICR_TEL_NO");
			String ICR_MOBL_NO_T = cRsList.getString("ICR_MOBL_NO");
			String ICR_SEX_KD_T = cRsList.getString("ICR_SEX_KD");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String SBE_NCPN_LT_T = cRsList.getString("SBE_NCPN_LT");
			String SBE_TPAN_NM_T = cRsList.getString("SBE_TPAN_NM");
			String SBE_TBUS_NM_T = cRsList.getString("SBE_TBUS_NM");
%>
			<z:row
<%
			if(! ICR_PENL_DE_T.equals("")) {
%>
		 		ICR_PENL_DE='<%= ICR_PENL_DE_T%>'
<%
			}

			if(! ICR_SPCH_KD_T.equals("")) {
%>
		 		ICR_SPCH_KD='<%= ICR_SPCH_KD_T%>'
<%
			}

			if(! ICR_SPCL_NM_T.equals("")) {
%>
		 		ICR_SPCL_NM='<%= ICR_SPCL_NM_T%>'
<%
			}

			if(! ICR_SEX_NM_T.equals("")) {
%>
		 		ICR_SEX_NM='<%= ICR_SEX_NM_T%>'
<%
			}

			if(! SBE_GOJU_NM_T.equals("")) {
%>
		 		SBE_GOJU_NM='<%= SBE_GOJU_NM_T%>'
<%
			}

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! EEA_HDMD_YN_T.equals("")) {
%>
		 		EEA_HDMD_YN='<%= EEA_HDMD_YN_T%>'
<%
			}

			if(! EEA_SDMD_YN_T.equals("")) {
%>
		 		EEA_SDMD_YN='<%= EEA_SDMD_YN_T%>'
<%
			}

			if(! EEA_SPCL_LT_T.equals("")) {
%>
		 		EEA_SPCL_LT='<%= EEA_SPCL_LT_T%>'
<%
			}

			if(! EEA_SPCL_CD_T.equals("")) {
%>
		 		EEA_SPCL_CD='<%= EEA_SPCL_CD_T%>'
<%
			}

			if(! EEA_SPHT_CD_T.equals("")) {
%>
		 		EEA_SPHT_CD='<%= EEA_SPHT_CD_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! EEA_2ND_YN_T.equals("")) {
%>
		 		EEA_2ND_YN='<%= EEA_2ND_YN_T%>'
<%
			}

			if(! EEA_TEL_NO_T.equals("")) {
%>
		 		EEA_TEL_NO='<%= EEA_TEL_NO_T%>'
<%
			}

			if(! EEA_MOBL_NO_T.equals("")) {
%>
		 		EEA_MOBL_NO='<%= EEA_MOBL_NO_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

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

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! ICR_BIRH_KD_T.equals("")) {
%>
		 		ICR_BIRH_KD='<%= ICR_BIRH_KD_T%>'
<%
			}

			if(! EEA_BIRTH_DT_T.equals("")) {
%>
		 		EEA_BIRTH_DT='<%= EEA_BIRTH_DT_T%>'
<%
			}

			if(! ICR_TEL_NO_T.equals("")) {
%>
		 		ICR_TEL_NO='<%= ICR_TEL_NO_T%>'
<%
			}

			if(! ICR_MOBL_NO_T.equals("")) {
%>
		 		ICR_MOBL_NO='<%= ICR_MOBL_NO_T%>'
<%
			}

			if(! ICR_SEX_KD_T.equals("")) {
%>
		 		ICR_SEX_KD='<%= ICR_SEX_KD_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! SBE_NCPN_LT_T.equals("")) {
%>
		 		SBE_NCPN_LT='<%= SBE_NCPN_LT_T%>'
<%
			}

			if(! SBE_TPAN_NM_T.equals("")) {
%>
		 		SBE_TPAN_NM='<%= SBE_TPAN_NM_T%>'
<%
			}

			if(! SBE_TBUS_NM_T.equals("")) {
%>
		 		SBE_TBUS_NM='<%= SBE_TBUS_NM_T%>'
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
