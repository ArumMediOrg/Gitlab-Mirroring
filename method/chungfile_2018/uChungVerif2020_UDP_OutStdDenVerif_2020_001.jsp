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

		String DTEFROMDT = htMethod.get("DTEFROMDT");
		String DTETODT = htMethod.get("DTETODT");
		String CMBCHUNGYYYY = htMethod.get("CMBCHUNGYYYY");
		String SSQL_ADD1 = htMethod.get("SSQL_ADD1");
		String SSQL_ADD2 = htMethod.get("SSQL_ADD2");

		//
		if(DTEFROMDT == null) { DTEFROMDT = ""; }
		if(DTETODT == null) { DTETODT = ""; }
		if(CMBCHUNGYYYY == null) { CMBCHUNGYYYY = ""; }
		if(SSQL_ADD1 == null) { SSQL_ADD1 = ""; }
		if(SSQL_ADD2 == null) { SSQL_ADD2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT EEA_EXAM_DT,EEA_EXAM_SQ, EEA_PSNL_NM, EEA_HLTHR_PR,EEA_CNTR_CD,EEA_MNGT_HTYR,ICR_PID_EN,ICR_PENL_ID,EEA_INSU_NO,J0001,J0001_1,J0001_2,
     J0004,J0004_1,J0004_2,J0003,J0003_1,J0003_2,J0022,J0009,J0021,J0021_1,
     J0012,J0012_1,J0002,J0002_1,J0002_2,J0005,J0005_1,J0011,J0008,
     ESO_PNJN_ORAL,
     ESO_ORAL_VIEW,
     ESO_ORAL_ACT,
     ESO_EXAM_DT,
     EEA_PLCE_CD,
     IAU_LICEN1_NO,
     IAU_PENL_NM,
     IAU_PENL_ID, ICR_INFO_YN,INFODT,ENDGBN
FROM
  (
  SELECT ERI_EXAM_DT, EEA_HLTHR_PR, F_RPAD(NVL(EEA_CNTR_CD,' '),11,' ') EEA_CNTR_CD,
      ERI_EXAM_SQ,
      EEA_MNGT_HTYR, ICR_PID_EN, ICR_PENL_ID,
      F_RPAD(NVL(EEA_INSU_NO,' '),11,' ') EEA_INSU_NO,
      MAX(J0001) J0001,
      MAX(J0001_1) J0001_1,
      MAX(J0001_2) J0001_2,
      MAX(J0004) J0004,
      MAX(J0004_1) J0004_1,
      MAX(J0004_2) J0004_2,
      MAX(J0003) J0003,
      MAX(J0003_1) J0003_1,
      MAX(J0003_2) J0003_2,
      MAX(J0022) J0022,
      MAX(J0009) J0009,
      MAX(J0021) J0021,
      MAX(J0021_1) J0021_1,
      MAX(J0012 ) J0012,
      MAX(J0012_1) J0012_1,
      MAX(J0002) J0002,
      MAX(J0002_1) J0002_1,
      MAX(J0002_2) J0002_2,
      MAX(J0005) J0005,
      MAX(J0005_1) J0005_1,
      MAX(J0011) J0011,
      MAX(J0008) J0008
  FROM (
    SELECT ERI_EXAM_DT, ERI_EXAM_SQ, EEA_MNGT_HTYR,
         ICR_PID_EN,  NVL(ICR_PENL_ID ,' ') ICR_PENL_ID,
         EEA_INSU_NO, NVL(EEA_ORALR_PR,0) EEA_HLTHR_PR, EEA_CNTR_CD,
         CASE WHEN ERI_ITEM_CD='J0001' THEN ERI_HERT_CD  END J0001,
         CASE WHEN ERI_ITEM_CD='J0001' THEN ERI_prch_VL  END J0001_1,
         CASE WHEN ERI_ITEM_CD='J0001' THEN ERI_prnm_vL  END J0001_2,
         CASE WHEN ERI_ITEM_CD='J0004' THEN ERI_HERT_CD  END J0004,
         CASE WHEN ERI_ITEM_CD='J0004' THEN ERI_prch_VL  END J0004_1,
         CASE WHEN ERI_ITEM_CD='J0004' THEN ERI_prnm_vL  END J0004_2,
         CASE WHEN ERI_ITEM_CD='J0003' THEN ERI_HERT_CD  END J0003,
         CASE WHEN ERI_ITEM_CD='J0003' THEN ERI_prch_VL  END J0003_1,
         CASE WHEN ERI_ITEM_CD='J0003' THEN ERI_prnm_vL  END J0003_2,
         CASE WHEN ERI_ITEM_CD='J0022' THEN ERI_HERT_CD  END J0022,
         CASE WHEN ERI_ITEM_CD='J0009' THEN ERI_HERT_CD  END J0009,
         CASE WHEN ERI_ITEM_CD='J0021' THEN ERI_HERT_CD  END J0021,
         CASE WHEN ERI_ITEM_CD='J0021' THEN ERI_RSLT_VL  END J0021_1,
         CASE WHEN ERI_ITEM_CD='J0012' THEN ERI_HERT_CD  END J0012,
         CASE WHEN ERI_ITEM_CD='J0012' THEN ERI_RSLT_VL  END J0012_1,
         CASE WHEN ERI_ITEM_CD='J0002' THEN SUBSTR(ERI_HERT_CD,1,1) END J0002,
         CASE WHEN ERI_ITEM_CD='J0002' THEN SUBSTR(ERI_HERT_CD,2,1) END J0002_1,
         CASE WHEN ERI_ITEM_CD='J0002' THEN ERI_RSLT_VL  END J0002_2,
         CASE WHEN ERI_ITEM_CD='J0005' THEN ERI_HERT_CD  END J0005,
         CASE WHEN ERI_ITEM_CD='J0005' THEN ERI_RSLT_VL  END J0005_1,
         CASE WHEN ERI_ITEM_CD='J0011' THEN ERI_HERT_CD  END J0011,
         CASE WHEN ERI_ITEM_CD='J0008' THEN ERI_HERT_CD  END J0008
    FROM ET_RSLT_ITEM A
                 LEFT OUTER JOIN ET_EXAM_ACPT B ON A.ERI_EXAM_DT=B.EEA_EXAM_DT AND A.ERI_EXAM_SQ=B.EEA_EXAM_SQ
                 LEFT OUTER JOIN IT_CUSTOMER  D ON B.EEA_CUST_NO=D.ICR_CUST_NO
                 LEFT OUTER JOIN BT_BILLHN_PR E ON B.EEA_EXAM_DT=E.BBP_EXAM_DT AND B.EEA_EXAM_SQ=E.BBP_EXAM_SQ  AND  BBP_CHUNG_KD='52'
    WHERE EEA_EXAM_DT>= :dteFromDt AND EEA_EXAM_DT<= :dteToDt AND NVL(EEA_RECE_NO, ' ') <> 'R'
       AND EEA_MNGT_HTYR= :cmbChungYyyy AND  EEA_EXAM_CD in('31006')  and EEA_HDMD_YN='Y'   AND EEA_ORDER_YN<>'C' and ERI_CNCL_YN <>'Y'

          || :sSQL_ADD1

    ) FFF
    GROUP BY ERI_EXAM_DT, ERI_EXAM_SQ,EEA_MNGT_HTYR,ICR_PID_EN,ICR_PENL_ID,EEA_INSU_NO,EEA_HLTHR_PR ,EEA_CNTR_CD
  ) AAA
    RIGHT OUTER JOIN (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM,
              ESO_PNJN_ORAL,
              F_RPAD(NVL(ESO_ORAL_VIEW,' '),500,' ') ESO_ORAL_VIEW,
              F_RPAD(NVL(ESO_ORAL_ACT, ' '),500,' ') ESO_ORAL_ACT,
              REPLACE(ESO_EXAM_DT,'-','') ESO_EXAM_DT,
              NVL(case when SUBSTR(EEA_PLCE_CD,1,1)='1' Then '2' else '1' end, ' ') EEA_PLCE_CD,
              NVL(REPLACE(ESO_EIFRM_DT,'-',''),' ') ESO_EIFRM_DT,
              NVL((IAU_LICEN1_NO),' ') IAU_LICEN1_NO,
              NVL((IAU_PENL_NM),' ') IAU_PENL_NM,
              NVL((IAU_PENL_ID),' ') IAU_PENL_ID,
              ICR_INFO_YN,
              NVL(REPLACE(EEA_EXAM_DT,'-',''),' ') INFODT,
              'E' ENDGBN
         FROM ET_STDT_PNJNO A
          LEFT OUTER JOIN ET_EXAM_ACPT B ON A.ESO_EXAM_DT=B.EEA_EXAM_DT AND A.ESO_EXAM_SQ=B.EEA_EXAM_SQ
          LEFT OUTER JOIN IT_CUSTOMER C  ON B.EEA_CUST_NO=C.ICR_CUST_NO
          LEFT OUTER JOIN IT_AUTH_USER D ON A.ESO_ORAL_DR =D.IAU_EMP_NO
          LEFT OUTER JOIN BT_BILLHN_PR E ON B.EEA_EXAM_DT=E.BBP_EXAM_DT AND B.EEA_EXAM_SQ=E.BBP_EXAM_SQ  and BBP_CHUNG_KD='52'
        WHERE  EEA_EXAM_DT>= :dteFromDt AND EEA_EXAM_DT<= :dteToDt AND NVL(EEA_RECE_NO, ' ') <> 'R'
          AND  EEA_ORAL_YN='Y'   AND EEA_HDMD_YN='Y'   AND eea_order_yn<>'C'  AND EEA_MNGT_HTYR= :cmbChungYyyy AND  ESO_OPNJN_YN='Y'

          || :sSQL_ADD2

  ) BBB ON AAA.ERI_EXAM_DT=BBB.EEA_EXAM_DT   AND AAA.ERI_EXAM_SQ =BBB.EEA_EXAM_SQ
		*/

		sql = " SELECT EEA_EXAM_DT,EEA_EXAM_SQ, EEA_PSNL_NM, EEA_HLTHR_PR,EEA_CNTR_CD,EEA_MNGT_HTYR,ICR_PID_EN,ICR_PENL_ID,EEA_INSU_NO,J0001,J0001_1,J0001_2, J0004,J0004_1,J0004_2,J0003,J0003_1,J0003_2,J0022,J0009,J0021,J0021_1, J0012,J0012_1,J0002,J0002_1,J0002_2,J0005,J0005_1,J0011,J0008, ESO_PNJN_ORAL, ESO_ORAL_VIEW, ESO_ORAL_ACT, ESO_EXAM_DT, EEA_PLCE_CD, IAU_LICEN1_NO, IAU_PENL_NM, IAU_PENL_ID, ICR_INFO_YN,INFODT,ENDGBN";
		sql += " FROM (";
		sql += "	SELECT ERI_EXAM_DT, EEA_HLTHR_PR, F_RPAD(NVL(EEA_CNTR_CD,' '),11,' ') EEA_CNTR_CD, ERI_EXAM_SQ, EEA_MNGT_HTYR, ICR_PID_EN, ICR_PENL_ID, F_RPAD(NVL(EEA_INSU_NO,' '),11,' ') EEA_INSU_NO, MAX(J0001) J0001, MAX(J0001_1) J0001_1, MAX(J0001_2) J0001_2, MAX(J0004) J0004, MAX(J0004_1) J0004_1, MAX(J0004_2) J0004_2, MAX(J0003) J0003, MAX(J0003_1) J0003_1, MAX(J0003_2) J0003_2, MAX(J0022) J0022, MAX(J0009) J0009, MAX(J0021) J0021, MAX(J0021_1) J0021_1, MAX(J0012 ) J0012, MAX(J0012_1) J0012_1, MAX(J0002) J0002, MAX(J0002_1) J0002_1, MAX(J0002_2) J0002_2, MAX(J0005) J0005, MAX(J0005_1) J0005_1, MAX(J0011) J0011, MAX(J0008) J0008";
		sql += " 	FROM (";
		sql += "		SELECT ERI_EXAM_DT, ERI_EXAM_SQ, EEA_MNGT_HTYR, ICR_PID_EN, NVL(ICR_PENL_ID ,' ') ICR_PENL_ID, EEA_INSU_NO, NVL(EEA_ORALR_PR,0) EEA_HLTHR_PR, EEA_CNTR_CD";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0001' THEN ERI_HERT_CD END J0001";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0001' THEN ERI_PRCH_VL END J0001_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0001' THEN ERI_PRNM_VL END J0001_2";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0004' THEN ERI_HERT_CD END J0004";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0004' THEN ERI_PRCH_VL END J0004_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0004' THEN ERI_PRNM_VL END J0004_2";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0003' THEN ERI_HERT_CD END J0003";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0003' THEN ERI_PRCH_VL END J0003_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0003' THEN ERI_PRNM_VL END J0003_2";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0022' THEN ERI_HERT_CD END J0022";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0009' THEN ERI_HERT_CD END J0009";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0021' THEN ERI_HERT_CD END J0021";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0021' THEN ERI_RSLT_VL END J0021_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0012' THEN ERI_HERT_CD END J0012";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0012' THEN ERI_RSLT_VL END J0012_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0002' THEN SUBSTR(ERI_HERT_CD,1,1) END J0002";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0002' THEN SUBSTR(ERI_HERT_CD,2,1) END J0002_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0002' THEN ERI_RSLT_VL END J0002_2";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0005' THEN ERI_HERT_CD END J0005";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0005' THEN ERI_RSLT_VL END J0005_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0011' THEN ERI_HERT_CD END J0011";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0008' THEN ERI_HERT_CD END J0008";
		sql += " 		FROM ET_RSLT_ITEM A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " 		ON A.ERI_EXAM_DT=B.EEA_EXAM_DT";
		sql += " 		AND A.ERI_EXAM_SQ=B.EEA_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER D";
		sql += " 		ON B.EEA_CUST_NO=D.ICR_CUST_NO LEFT OUTER JOIN BT_BILLHN_PR E";
		sql += " 		ON B.EEA_EXAM_DT=E.BBP_EXAM_DT";
		sql += " 		AND B.EEA_EXAM_SQ=E.BBP_EXAM_SQ";
		sql += " 		AND BBP_CHUNG_KD='52'";
		sql += " 		WHERE EEA_EXAM_DT>= '" + DTEFROMDT + "'";
		sql += " 		AND EEA_EXAM_DT<= '" + DTETODT + "'";
		sql += " 		AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " 		AND EEA_MNGT_HTYR= '" + CMBCHUNGYYYY + "'";
		sql += " 		AND EEA_EXAM_CD IN('31006')";
		sql += " 		AND EEA_HDMD_YN='Y'";
		sql += " 		AND EEA_ORDER_YN<>'C'";
		sql += " 		AND ERI_CNCL_YN <>'Y'";
		sql += SSQL_ADD1;
		sql += "	) FFF";
		sql += " 	GROUP BY ERI_EXAM_DT, ERI_EXAM_SQ,EEA_MNGT_HTYR,ICR_PID_EN,ICR_PENL_ID,EEA_INSU_NO,EEA_HLTHR_PR ,EEA_CNTR_CD";
		sql += " ) AAA RIGHT OUTER JOIN (";
		sql += "	SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM, ESO_PNJN_ORAL, F_RPAD(NVL(ESO_ORAL_VIEW,' '),500,' ') ESO_ORAL_VIEW, F_RPAD(NVL(ESO_ORAL_ACT, ' '),500,' ') ESO_ORAL_ACT, REPLACE(ESO_EXAM_DT,'-','') ESO_EXAM_DT, NVL(CASE WHEN SUBSTR(EEA_PLCE_CD,1,1)='1' THEN '2' ELSE '1' END, ' ') EEA_PLCE_CD, NVL(REPLACE(ESO_EIFRM_DT,'-',''),' ') ESO_EIFRM_DT, NVL((IAU_LICEN1_NO),' ') IAU_LICEN1_NO, NVL((IAU_PENL_NM),' ') IAU_PENL_NM, NVL((IAU_PENL_ID),' ') IAU_PENL_ID, ICR_INFO_YN, NVL(REPLACE(EEA_EXAM_DT,'-',''),' ') INFODT, 'E' ENDGBN";
		sql += " 	FROM ET_STDT_PNJNO A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " 	ON A.ESO_EXAM_DT=B.EEA_EXAM_DT";
		sql += " 	AND A.ESO_EXAM_SQ=B.EEA_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER C";
		sql += " 	ON B.EEA_CUST_NO=C.ICR_CUST_NO LEFT OUTER JOIN IT_AUTH_USER D";
		sql += " 	ON A.ESO_ORAL_DR =D.IAU_EMP_NO LEFT OUTER JOIN BT_BILLHN_PR E";
		sql += " 	ON B.EEA_EXAM_DT=E.BBP_EXAM_DT";
		sql += " 	AND B.EEA_EXAM_SQ=E.BBP_EXAM_SQ";
		sql += " 	AND BBP_CHUNG_KD='52'";
		sql += " 	WHERE EEA_EXAM_DT>= '" + DTEFROMDT + "'";
		sql += " 	AND EEA_EXAM_DT<= '" + DTETODT + "'";
		sql += " 	AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " 	AND EEA_ORAL_YN='Y'";
		sql += " 	AND EEA_HDMD_YN='Y'";
		sql += " 	AND EEA_ORDER_YN<>'C'";
		sql += " 	AND EEA_MNGT_HTYR= '" + CMBCHUNGYYYY + "'";
		sql += " 	AND ESO_OPNJN_YN='Y'";
		sql += SSQL_ADD2;
		sql += " ) BBB";
		sql += " ON AAA.ERI_EXAM_DT=BBB.EEA_EXAM_DT";
		sql += " AND AAA.ERI_EXAM_SQ =BBB.EEA_EXAM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChungVerif2020_UDP_OutStdDenVerif_2020_001 \n";
			G_INFO += "설명 : 학교밖(구강) 성적확인 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEFROMDT : " + DTEFROMDT + " \n";
			G_INFO += " DTETODT : " + DTETODT + " \n";
			G_INFO += " CMBCHUNGYYYY : " + CMBCHUNGYYYY + " \n";
			G_INFO += " SSQL_ADD1 : " + SSQL_ADD1 + " \n";
			G_INFO += " SSQL_ADD2 : " + SSQL_ADD2 + " \n";
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
		<s:AttributeType name='EEA_HLTHR_PR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNTR_CD' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_HTYR' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PID_EN' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_NO' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='J0001' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='J0001_1' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='J0001_2' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='J0004' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='J0004_1' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='J0004_2' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='J0003' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='J0003_1' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='J0003_2' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='J0022' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='J0009' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='J0021' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='J0021_1' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='J0012' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='J0012_1' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='J0002' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='J0002_1' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='J0002_2' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='J0005' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='J0005_1' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='J0011' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='J0008' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJN_ORAL' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_ORAL_VIEW' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_ORAL_ACT' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EXAM_DT' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='36' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='37' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='38' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_ID' rs:number='39' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INFO_YN' rs:number='40' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='INFODT' rs:number='41' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ENDGBN' rs:number='42' rs:nullable='true'>
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

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_HLTHR_PR_T = cRsList.getString("EEA_HLTHR_PR");
			String EEA_CNTR_CD_T = cRsList.getString("EEA_CNTR_CD");
			String EEA_MNGT_HTYR_T = cRsList.getString("EEA_MNGT_HTYR");
			String ICR_PID_EN_T = cRsList.getString("ICR_PID_EN");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String EEA_INSU_NO_T = cRsList.getString("EEA_INSU_NO");
			String J0001_T = cRsList.getString("J0001");
			String J0001_1_T = cRsList.getString("J0001_1");
			String J0001_2_T = cRsList.getString("J0001_2");
			String J0004_T = cRsList.getString("J0004");
			String J0004_1_T = cRsList.getString("J0004_1");
			String J0004_2_T = cRsList.getString("J0004_2");
			String J0003_T = cRsList.getString("J0003");
			String J0003_1_T = cRsList.getString("J0003_1");
			String J0003_2_T = cRsList.getString("J0003_2");
			String J0022_T = cRsList.getString("J0022");
			String J0009_T = cRsList.getString("J0009");
			String J0021_T = cRsList.getString("J0021");
			String J0021_1_T = cRsList.getString("J0021_1");
			String J0012_T = cRsList.getString("J0012");
			String J0012_1_T = cRsList.getString("J0012_1");
			String J0002_T = cRsList.getString("J0002");
			String J0002_1_T = cRsList.getString("J0002_1");
			String J0002_2_T = cRsList.getString("J0002_2");
			String J0005_T = cRsList.getString("J0005");
			String J0005_1_T = cRsList.getString("J0005_1");
			String J0011_T = cRsList.getString("J0011");
			String J0008_T = cRsList.getString("J0008");
			String ESO_PNJN_ORAL_T = cRsList.getString("ESO_PNJN_ORAL");
			String ESO_ORAL_VIEW_T = cRsList.getString("ESO_ORAL_VIEW");
			String ESO_ORAL_ACT_T = cRsList.getString("ESO_ORAL_ACT");
			String ESO_EXAM_DT_T = cRsList.getString("ESO_EXAM_DT");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_PENL_ID_T = cRsList.getString("IAU_PENL_ID");
			String ICR_INFO_YN_T = cRsList.getString("ICR_INFO_YN");
			String INFODT_T = cRsList.getString("INFODT");
			String ENDGBN_T = cRsList.getString("ENDGBN");
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

			if(! EEA_HLTHR_PR_T.equals("")) {
%>
		 		EEA_HLTHR_PR='<%= EEA_HLTHR_PR_T%>'
<%
			}

			if(! EEA_CNTR_CD_T.equals("")) {
%>
		 		EEA_CNTR_CD='<%= EEA_CNTR_CD_T%>'
<%
			}

			if(! EEA_MNGT_HTYR_T.equals("")) {
%>
		 		EEA_MNGT_HTYR='<%= EEA_MNGT_HTYR_T%>'
<%
			}

			if(! ICR_PID_EN_T.equals("")) {
%>
		 		ICR_PID_EN='<%= ICR_PID_EN_T%>'
<%
			}

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! EEA_INSU_NO_T.equals("")) {
%>
		 		EEA_INSU_NO='<%= EEA_INSU_NO_T%>'
<%
			}

			if(! J0001_T.equals("")) {
%>
		 		J0001='<%= J0001_T%>'
<%
			}

			if(! J0001_1_T.equals("")) {
%>
		 		J0001_1='<%= J0001_1_T%>'
<%
			}

			if(! J0001_2_T.equals("")) {
%>
		 		J0001_2='<%= J0001_2_T%>'
<%
			}

			if(! J0004_T.equals("")) {
%>
		 		J0004='<%= J0004_T%>'
<%
			}

			if(! J0004_1_T.equals("")) {
%>
		 		J0004_1='<%= J0004_1_T%>'
<%
			}

			if(! J0004_2_T.equals("")) {
%>
		 		J0004_2='<%= J0004_2_T%>'
<%
			}

			if(! J0003_T.equals("")) {
%>
		 		J0003='<%= J0003_T%>'
<%
			}

			if(! J0003_1_T.equals("")) {
%>
		 		J0003_1='<%= J0003_1_T%>'
<%
			}

			if(! J0003_2_T.equals("")) {
%>
		 		J0003_2='<%= J0003_2_T%>'
<%
			}

			if(! J0022_T.equals("")) {
%>
		 		J0022='<%= J0022_T%>'
<%
			}

			if(! J0009_T.equals("")) {
%>
		 		J0009='<%= J0009_T%>'
<%
			}

			if(! J0021_T.equals("")) {
%>
		 		J0021='<%= J0021_T%>'
<%
			}

			if(! J0021_1_T.equals("")) {
%>
		 		J0021_1='<%= J0021_1_T%>'
<%
			}

			if(! J0012_T.equals("")) {
%>
		 		J0012='<%= J0012_T%>'
<%
			}

			if(! J0012_1_T.equals("")) {
%>
		 		J0012_1='<%= J0012_1_T%>'
<%
			}

			if(! J0002_T.equals("")) {
%>
		 		J0002='<%= J0002_T%>'
<%
			}

			if(! J0002_1_T.equals("")) {
%>
		 		J0002_1='<%= J0002_1_T%>'
<%
			}

			if(! J0002_2_T.equals("")) {
%>
		 		J0002_2='<%= J0002_2_T%>'
<%
			}

			if(! J0005_T.equals("")) {
%>
		 		J0005='<%= J0005_T%>'
<%
			}

			if(! J0005_1_T.equals("")) {
%>
		 		J0005_1='<%= J0005_1_T%>'
<%
			}

			if(! J0011_T.equals("")) {
%>
		 		J0011='<%= J0011_T%>'
<%
			}

			if(! J0008_T.equals("")) {
%>
		 		J0008='<%= J0008_T%>'
<%
			}

			if(! ESO_PNJN_ORAL_T.equals("")) {
%>
		 		ESO_PNJN_ORAL='<%= ESO_PNJN_ORAL_T%>'
<%
			}

			if(! ESO_ORAL_VIEW_T.equals("")) {
%>
		 		ESO_ORAL_VIEW='<%= ESO_ORAL_VIEW_T%>'
<%
			}

			if(! ESO_ORAL_ACT_T.equals("")) {
%>
		 		ESO_ORAL_ACT='<%= ESO_ORAL_ACT_T%>'
<%
			}

			if(! ESO_EXAM_DT_T.equals("")) {
%>
		 		ESO_EXAM_DT='<%= ESO_EXAM_DT_T%>'
<%
			}

			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
<%
			}

			if(! IAU_LICEN1_NO_T.equals("")) {
%>
		 		IAU_LICEN1_NO='<%= IAU_LICEN1_NO_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! IAU_PENL_ID_T.equals("")) {
%>
		 		IAU_PENL_ID='<%= IAU_PENL_ID_T%>'
<%
			}

			if(! ICR_INFO_YN_T.equals("")) {
%>
		 		ICR_INFO_YN='<%= ICR_INFO_YN_T%>'
<%
			}

			if(! INFODT_T.equals("")) {
%>
		 		INFODT='<%= INFODT_T%>'
<%
			}

			if(! ENDGBN_T.equals("")) {
%>
		 		ENDGBN='<%= ENDGBN_T%>'
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
