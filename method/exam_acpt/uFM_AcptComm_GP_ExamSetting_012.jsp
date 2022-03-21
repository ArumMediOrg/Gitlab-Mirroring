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
		String SPHT_CD = htMethod.get("SPHT_CD");
		String SDMD_YN = htMethod.get("SDMD_YN");
		String COMP_CD = htMethod.get("COMP_CD");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(SPHT_CD == null) { SPHT_CD = ""; }
		if(SDMD_YN == null) { SDMD_YN = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.ICD_MNGT_YR EXAM_YR, B.ICD_MATT_LT EXAM_CD, B.ICD_HALF_CD || B.ICD_DEPT_CD EXAM_SQ, '' EXAM_YN,
       B.ICD_MNGT_YR ||'-'|| B.ICD_HALF_CD || B.ICD_DEPT_CD EXAM_DP,
       B.ICD_DEPT_NM ||'-'|| B.ICD_SUBD_NM ||'('|| F_CODE_FIND('0910', B.ICD_SPCL_CD, '', '1') || ')' EXAM_NM,
       :EXAM_DT PRCE_DT, B.ICD_MATT_LT ITEM_LT,
       CASE WHEN A.ICY_TBAS_CD = '1' THEN '4'
            WHEN A.ICY_TBAS_CD = '2' THEN '5'
            ELSE F_PRICE_KIND('4') END AS CALC_CD,
       CASE WHEN :SPHT_CD = '1' THEN 
                 CASE WHEN SUBSTR(:SDMD_YN, 1, 1) = 'Y' THEN 
                           CASE WHEN SUBSTR(:SDMD_YN, 2, 1) = 'Y' THEN B.ICD_JSBS_PR ELSE B.ICD_DSBS_PR END
                      ELSE CASE WHEN SUBSTR(:SDMD_YN, 2, 1) = 'Y' THEN B.ICD_JCAS_PR ELSE B.ICD_DCAS_PR END END
            ELSE CASE WHEN SUBSTR(:SDMD_YN, 1, 1) = 'Y' THEN B.ICD_BSBS_PR ELSE B.ICD_BCAS_PR END END AS EXAM_PR,
       NVL(B.ICD_JCAS_PR, 0) AS SALE_PR,
       NVL(B.ICD_JSBS_PR, 0) AS COUP_PR,
       NVL(B.ICD_DCAS_PR, 0) AS FAMY_PR,
       NVL(B.ICD_BCAS_PR, 0) AS GRUP_PR,
       NVL(B.ICD_BSBS_PR, 0) AS CUPN_PR,
       NVL(B.ICD_DSBS_PR, 0) AS MMBR_PR, 
       0 OPTN_PR, 0 JCSG_PR, 0 HESG_PR, 0 GBSG_PR, 0 SBSG_PR, 0 TGSG_PR,
       'N' HTSB_YN, 'N' SPSB_YN, 'N' CVSB_YN, 'N' ETSB_YN, 'N' EMSB_YN,
       ''  HTPR_CD, ''  SPPR_CD, ''  CVPR_CD, ''  ETPR_CD, ''  EMPR_CD, '' SALE_ID,
       '9' CNCL_CD, 'N' OPTN_YN, ''  EXAM_KD, ''  PACK_RMK,
       A.ICY_PYER_CD PYER_CD, A.ICY_CMPY_CD CMPY_CD, A.ICY_PRPY_CD PRPY_CD, A.ICY_TKCG_CD SDMD_CD,
       A.ICY_COMP_CD, A.ICY_COMP_NM, A.ICY_COTK_CD,  B.ICD_DEPT_CD DEPT_CD, B.ICD_DEPT_NM DEPT_NM,
       B.ICD_SPCL_CD SPCL_CD, A.ICY_COMP_TX, 'N' UBEH_YN
  FROM IT_COMPANY A, IT_COMP_DEPT B
 WHERE A.ICY_COMP_CD = :COMP_CD
   AND B.ICD_COMP_CD = A.ICY_COMP_CD
   AND B.ICD_MNGT_YR = SUBSTR(:EXAM_DT, 1, 4)
   AND UPPER(B.ICD_TCHK_YN) = 'Y'
   AND UPPER(B.ICD_USE_YN)  = 'Y'
  :PARAM_TX
		*/

		sql = " SELECT B.ICD_MNGT_YR EXAM_YR, B.ICD_MATT_LT EXAM_CD, B.ICD_HALF_CD || B.ICD_DEPT_CD EXAM_SQ, '' EXAM_YN, B.ICD_MNGT_YR ||'-'|| B.ICD_HALF_CD || B.ICD_DEPT_CD EXAM_DP, B.ICD_DEPT_NM ||'-'|| B.ICD_SUBD_NM ||'('|| F_CODE_FIND('0910', B.ICD_SPCL_CD, '', '1') || ')' EXAM_NM, '" + EXAM_DT + "' PRCE_DT, B.ICD_MATT_LT ITEM_LT, CASE WHEN A.ICY_TBAS_CD = '1' THEN '4' WHEN A.ICY_TBAS_CD = '2' THEN '5' ELSE F_PRICE_KIND('4') END AS CALC_CD, CASE WHEN '" + SPHT_CD + "' = '1' THEN CASE WHEN SUBSTR('" + SDMD_YN + "', 1, 1) = 'Y' THEN CASE WHEN SUBSTR('" + SDMD_YN + "', 2, 1) = 'Y' THEN B.ICD_JSBS_PR ELSE B.ICD_DSBS_PR END ELSE CASE WHEN SUBSTR('" + SDMD_YN + "', 2, 1) = 'Y' THEN B.ICD_JCAS_PR ELSE B.ICD_DCAS_PR END END ELSE CASE WHEN SUBSTR('" + SDMD_YN + "', 1, 1) = 'Y' THEN B.ICD_BSBS_PR ELSE B.ICD_BCAS_PR END END AS EXAM_PR, NVL(B.ICD_JCAS_PR, 0) AS SALE_PR, NVL(B.ICD_JSBS_PR, 0) AS COUP_PR, NVL(B.ICD_DCAS_PR, 0) AS FAMY_PR, NVL(B.ICD_BCAS_PR, 0) AS GRUP_PR, NVL(B.ICD_BSBS_PR, 0) AS CUPN_PR, NVL(B.ICD_DSBS_PR, 0) AS MMBR_PR, 0 OPTN_PR, 0 JCSG_PR, 0 HESG_PR, 0 GBSG_PR, 0 SBSG_PR, 0 TGSG_PR, 'N' HTSB_YN, 'N' SPSB_YN, 'N' CVSB_YN, 'N' ETSB_YN, 'N' EMSB_YN, '' HTPR_CD, '' SPPR_CD, '' CVPR_CD, '' ETPR_CD, '' EMPR_CD, '' SALE_ID, '9' CNCL_CD, 'N' OPTN_YN, '' EXAM_KD, '' PACK_RMK, A.ICY_PYER_CD PYER_CD, A.ICY_CMPY_CD CMPY_CD, A.ICY_PRPY_CD PRPY_CD, A.ICY_TKCG_CD SDMD_CD, A.ICY_COMP_CD, A.ICY_COMP_NM, A.ICY_COTK_CD, B.ICD_DEPT_CD DEPT_CD, B.ICD_DEPT_NM DEPT_NM, B.ICD_SPCL_CD SPCL_CD, A.ICY_COMP_TX, 'N' UBEH_YN";
		sql += " FROM IT_COMPANY A, IT_COMP_DEPT B";
		sql += " WHERE A.ICY_COMP_CD = '" + COMP_CD + "'";
		sql += " AND B.ICD_COMP_CD = A.ICY_COMP_CD";
		sql += " AND B.ICD_MNGT_YR = SUBSTR('" + EXAM_DT + "', 1, 4)";
		sql += " AND UPPER(B.ICD_TCHK_YN) = 'Y'";
		sql += " AND UPPER(B.ICD_USE_YN) = 'Y'";
		sql += PARAM_TX;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamSetting_012 \n";
			G_INFO += "설명 : 사업장 부서 유해물질 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " SPHT_CD : " + SPHT_CD + " \n";
			G_INFO += " SDMD_YN : " + SDMD_YN + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
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
		<s:AttributeType name='EXAM_YR' rs:number='1' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_MATT_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_SQ' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_YN' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_DP' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='PRCE_DT' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_LT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_MATT_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='CALC_CD' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_PR' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SALE_PR' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='COUP_PR' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='FAMY_PR' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='GRUP_PR' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CUPN_PR' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='MMBR_PR' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_PR' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='JCSG_PR' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HESG_PR' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='GBSG_PR' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SBSG_PR' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='TGSG_PR' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HTSB_YN' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPSB_YN' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CVSB_YN' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ETSB_YN' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EMSB_YN' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='HTPR_CD' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPPR_CD' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CVPR_CD' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ETPR_CD' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EMPR_CD' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SALE_ID' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CNCL_CD' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_YN' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_KD' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_PYER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PACK_RMK' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_CMPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PYER_CD' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_PRPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CMPY_CD' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TKCG_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PRPY_CD' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SDMD_CD' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_CD' rs:number='42' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COTK_CD'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='43' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='120' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COTK_CD' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='DEPT_CD' rs:number='45' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='DEPT_NM' rs:number='46' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_TX'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPCL_CD' rs:number='47' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_TX' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='UBEH_YN' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='50' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c50' rs:name='ROWID' rs:number='51' rs:rowid='true' rs:hidden='true'>
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

			String EXAM_YR_T = cRsList.getString("EXAM_YR");
			String EXAM_CD_T = cRsList.getString("EXAM_CD");
			String EXAM_SQ_T = cRsList.getString("EXAM_SQ");
			String EXAM_YN_T = cRsList.getString("EXAM_YN");
			String EXAM_DP_T = cRsList.getString("EXAM_DP");
			String EXAM_NM_T = cRsList.getString("EXAM_NM");
			String PRCE_DT_T = cRsList.getString("PRCE_DT");
			String ITEM_LT_T = cRsList.getString("ITEM_LT");
			String CALC_CD_T = cRsList.getString("CALC_CD");
			String EXAM_PR_T = cRsList.getString("EXAM_PR");
			String SALE_PR_T = cRsList.getString("SALE_PR");
			String COUP_PR_T = cRsList.getString("COUP_PR");
			String FAMY_PR_T = cRsList.getString("FAMY_PR");
			String GRUP_PR_T = cRsList.getString("GRUP_PR");
			String CUPN_PR_T = cRsList.getString("CUPN_PR");
			String MMBR_PR_T = cRsList.getString("MMBR_PR");
			String OPTN_PR_T = cRsList.getString("OPTN_PR");
			String JCSG_PR_T = cRsList.getString("JCSG_PR");
			String HESG_PR_T = cRsList.getString("HESG_PR");
			String GBSG_PR_T = cRsList.getString("GBSG_PR");
			String SBSG_PR_T = cRsList.getString("SBSG_PR");
			String TGSG_PR_T = cRsList.getString("TGSG_PR");
			String HTSB_YN_T = cRsList.getString("HTSB_YN");
			String SPSB_YN_T = cRsList.getString("SPSB_YN");
			String CVSB_YN_T = cRsList.getString("CVSB_YN");
			String ETSB_YN_T = cRsList.getString("ETSB_YN");
			String EMSB_YN_T = cRsList.getString("EMSB_YN");
			String HTPR_CD_T = cRsList.getString("HTPR_CD");
			String SPPR_CD_T = cRsList.getString("SPPR_CD");
			String CVPR_CD_T = cRsList.getString("CVPR_CD");
			String ETPR_CD_T = cRsList.getString("ETPR_CD");
			String EMPR_CD_T = cRsList.getString("EMPR_CD");
			String SALE_ID_T = cRsList.getString("SALE_ID");
			String CNCL_CD_T = cRsList.getString("CNCL_CD");
			String OPTN_YN_T = cRsList.getString("OPTN_YN");
			String EXAM_KD_T = cRsList.getString("EXAM_KD");
			String PACK_RMK_T = cRsList.getString("PACK_RMK");
			String PYER_CD_T = cRsList.getString("PYER_CD");
			String CMPY_CD_T = cRsList.getString("CMPY_CD");
			String PRPY_CD_T = cRsList.getString("PRPY_CD");
			String SDMD_CD_T = cRsList.getString("SDMD_CD");
			String ICY_COMP_CD_T = cRsList.getString("ICY_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ICY_COTK_CD_T = cRsList.getString("ICY_COTK_CD");
			String DEPT_CD_T = cRsList.getString("DEPT_CD");
			String DEPT_NM_T = cRsList.getString("DEPT_NM");
			String SPCL_CD_T = cRsList.getString("SPCL_CD");
			String ICY_COMP_TX_T = cRsList.getString("ICY_COMP_TX");
			String UBEH_YN_T = cRsList.getString("UBEH_YN");
			String ROWID_T = cRsList.getString("ROWID");
			String c50_T = cRsList.getString("c50");
%>
			<z:row
<%
			if(! EXAM_YR_T.equals("")) {
%>
		 		EXAM_YR='<%= EXAM_YR_T%>'
<%
			}

			if(! EXAM_CD_T.equals("")) {
%>
		 		EXAM_CD='<%= EXAM_CD_T%>'
<%
			}

			if(! EXAM_SQ_T.equals("")) {
%>
		 		EXAM_SQ='<%= EXAM_SQ_T%>'
<%
			}

			if(! EXAM_YN_T.equals("")) {
%>
		 		EXAM_YN='<%= EXAM_YN_T%>'
<%
			}

			if(! EXAM_DP_T.equals("")) {
%>
		 		EXAM_DP='<%= EXAM_DP_T%>'
<%
			}

			if(! EXAM_NM_T.equals("")) {
%>
		 		EXAM_NM='<%= EXAM_NM_T%>'
<%
			}

			if(! PRCE_DT_T.equals("")) {
%>
		 		PRCE_DT='<%= PRCE_DT_T%>'
<%
			}

			if(! ITEM_LT_T.equals("")) {
%>
		 		ITEM_LT='<%= ITEM_LT_T%>'
<%
			}

			if(! CALC_CD_T.equals("")) {
%>
		 		CALC_CD='<%= CALC_CD_T%>'
<%
			}

			if(! EXAM_PR_T.equals("")) {
%>
		 		EXAM_PR='<%= EXAM_PR_T%>'
<%
			}

			if(! SALE_PR_T.equals("")) {
%>
		 		SALE_PR='<%= SALE_PR_T%>'
<%
			}

			if(! COUP_PR_T.equals("")) {
%>
		 		COUP_PR='<%= COUP_PR_T%>'
<%
			}

			if(! FAMY_PR_T.equals("")) {
%>
		 		FAMY_PR='<%= FAMY_PR_T%>'
<%
			}

			if(! GRUP_PR_T.equals("")) {
%>
		 		GRUP_PR='<%= GRUP_PR_T%>'
<%
			}

			if(! CUPN_PR_T.equals("")) {
%>
		 		CUPN_PR='<%= CUPN_PR_T%>'
<%
			}

			if(! MMBR_PR_T.equals("")) {
%>
		 		MMBR_PR='<%= MMBR_PR_T%>'
<%
			}

			if(! OPTN_PR_T.equals("")) {
%>
		 		OPTN_PR='<%= OPTN_PR_T%>'
<%
			}

			if(! JCSG_PR_T.equals("")) {
%>
		 		JCSG_PR='<%= JCSG_PR_T%>'
<%
			}

			if(! HESG_PR_T.equals("")) {
%>
		 		HESG_PR='<%= HESG_PR_T%>'
<%
			}

			if(! GBSG_PR_T.equals("")) {
%>
		 		GBSG_PR='<%= GBSG_PR_T%>'
<%
			}

			if(! SBSG_PR_T.equals("")) {
%>
		 		SBSG_PR='<%= SBSG_PR_T%>'
<%
			}

			if(! TGSG_PR_T.equals("")) {
%>
		 		TGSG_PR='<%= TGSG_PR_T%>'
<%
			}

			if(! HTSB_YN_T.equals("")) {
%>
		 		HTSB_YN='<%= HTSB_YN_T%>'
<%
			}

			if(! SPSB_YN_T.equals("")) {
%>
		 		SPSB_YN='<%= SPSB_YN_T%>'
<%
			}

			if(! CVSB_YN_T.equals("")) {
%>
		 		CVSB_YN='<%= CVSB_YN_T%>'
<%
			}

			if(! ETSB_YN_T.equals("")) {
%>
		 		ETSB_YN='<%= ETSB_YN_T%>'
<%
			}

			if(! EMSB_YN_T.equals("")) {
%>
		 		EMSB_YN='<%= EMSB_YN_T%>'
<%
			}

			if(! HTPR_CD_T.equals("")) {
%>
		 		HTPR_CD='<%= HTPR_CD_T%>'
<%
			}

			if(! SPPR_CD_T.equals("")) {
%>
		 		SPPR_CD='<%= SPPR_CD_T%>'
<%
			}

			if(! CVPR_CD_T.equals("")) {
%>
		 		CVPR_CD='<%= CVPR_CD_T%>'
<%
			}

			if(! ETPR_CD_T.equals("")) {
%>
		 		ETPR_CD='<%= ETPR_CD_T%>'
<%
			}

			if(! EMPR_CD_T.equals("")) {
%>
		 		EMPR_CD='<%= EMPR_CD_T%>'
<%
			}

			if(! SALE_ID_T.equals("")) {
%>
		 		SALE_ID='<%= SALE_ID_T%>'
<%
			}

			if(! CNCL_CD_T.equals("")) {
%>
		 		CNCL_CD='<%= CNCL_CD_T%>'
<%
			}

			if(! OPTN_YN_T.equals("")) {
%>
		 		OPTN_YN='<%= OPTN_YN_T%>'
<%
			}

			if(! EXAM_KD_T.equals("")) {
%>
		 		EXAM_KD='<%= EXAM_KD_T%>'
<%
			}

			if(! PACK_RMK_T.equals("")) {
%>
		 		PACK_RMK='<%= PACK_RMK_T%>'
<%
			}

			if(! PYER_CD_T.equals("")) {
%>
		 		PYER_CD='<%= PYER_CD_T%>'
<%
			}

			if(! CMPY_CD_T.equals("")) {
%>
		 		CMPY_CD='<%= CMPY_CD_T%>'
<%
			}

			if(! PRPY_CD_T.equals("")) {
%>
		 		PRPY_CD='<%= PRPY_CD_T%>'
<%
			}

			if(! SDMD_CD_T.equals("")) {
%>
		 		SDMD_CD='<%= SDMD_CD_T%>'
<%
			}

			if(! ICY_COMP_CD_T.equals("")) {
%>
		 		ICY_COMP_CD='<%= ICY_COMP_CD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! ICY_COTK_CD_T.equals("")) {
%>
		 		ICY_COTK_CD='<%= ICY_COTK_CD_T%>'
<%
			}

			if(! DEPT_CD_T.equals("")) {
%>
		 		DEPT_CD='<%= DEPT_CD_T%>'
<%
			}

			if(! DEPT_NM_T.equals("")) {
%>
		 		DEPT_NM='<%= DEPT_NM_T%>'
<%
			}

			if(! SPCL_CD_T.equals("")) {
%>
		 		SPCL_CD='<%= SPCL_CD_T%>'
<%
			}

			if(! ICY_COMP_TX_T.equals("")) {
%>
		 		ICY_COMP_TX='<%= ICY_COMP_TX_T%>'
<%
			}

			if(! UBEH_YN_T.equals("")) {
%>
		 		UBEH_YN='<%= UBEH_YN_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c50_T.equals("")) {
%>
		 		c50='<%= c50_T%>'
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
