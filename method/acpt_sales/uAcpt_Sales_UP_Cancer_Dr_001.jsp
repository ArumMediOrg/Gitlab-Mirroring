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

	ResultSetMetaData rsmd = null;
	int colCnt = 0;

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String BATCH_YN = htMethod.get("BATCH_YN");
		String PARAM_TX = htMethod.get("PARAM_TX");
		String PNJN_YN = htMethod.get("PNJN_YN");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(BATCH_YN == null) { BATCH_YN = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }
		if(PNJN_YN == null) { PNJN_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT NVL(LICEN_CD, ' ') LICEN_CD, MAX(CASE WHEN DR_NM = ' ' THEN LICEN_CD ELSE DR_NM END) DR_NM,
       SUM(HLTH_CNT)   HLTH_CNT,   SUM(HLTH_PR)   HLTH_PR,
       SUM(HLTHS_CNT)  HLTHS_CNT,  SUM(HLTHS_PR)  HLTHS_PR,
       SUM(STOMA_CNT)  STOMA_CNT,  SUM(STOMA_PR)  STOMA_PR,
       SUM(COLON_CNT)  COLON_CNT,  SUM(COLON_PR)  COLON_PR,
       SUM(LIVER_CNT)  LIVER_CNT,  SUM(LIVER_PR)  LIVER_PR,
       SUM(BAST_CNT)   BAST_CNT,   SUM(BAST_PR)   BAST_PR,
       SUM(UTER_CNT)   UTER_CNT,   SUM(UTER_PR)   UTER_PR,
       SUM(LUNG_CNT)   LUNG_CNT,   SUM(LUNG_PR)   LUNG_PR,
       SUM(ORAL_CNT)   ORAL_CNT,   SUM(ORAL_PR)   ORAL_PR,
       SUM(STDT_CNT)   STDT_CNT,   SUM(STDT_PR)   STDT_PR,
       SUM(STDTO_CNT)  STDTO_CNT,  SUM(STDTO_PR)  STDTO_PR,
       SUM(STDT_CNTO)  STDT_CNTO,  SUM(STDT_PRO)  STDT_PRO,
       SUM(STDTO_CNTO) STDTO_CNTO, SUM(STDTO_PRO) STDTO_PRO,
       SUM(SPCL_CNT)   SPCL_CNT,   SUM(SPCL_PR)   SPCL_PR,
       SUM(SPCLS_CNT)  SPCLS_CNT,  SUM(SPCLS_PR)  SPCLS_PR,
       SUM(QSTN_CNT)   QSTN_CNT
  FROM (SELECT EEI_CAN_KD EXAM_CD, LICEN_CD,
               CASE WHEN NVL(LICEN_CD, ' ') = ' ' THEN '>미판정<' ELSE F_USER_FIND(LICEN_CD) END AS DR_NM,
               0 HLTH_PR, 0 HLTHS_PR, 0 ORAL_PR, 0 STDT_PR, 0 STDTO_PR, 0 STDT_PRO, 0 STDTO_PRO, 0 SPCL_PR, 0 SPCLS_PR,
               CASE WHEN EEI_CAN_KD = '1' THEN EXAM_PR ELSE 0 END AS STOMA_PR,
               CASE WHEN EEI_CAN_KD = '2' THEN EXAM_PR ELSE 0 END AS COLON_PR,
               CASE WHEN EEI_CAN_KD = '3' THEN EXAM_PR ELSE 0 END AS LIVER_PR,
               CASE WHEN EEI_CAN_KD = '4' THEN EXAM_PR ELSE 0 END AS BAST_PR,
               CASE WHEN EEI_CAN_KD = '5' THEN EXAM_PR ELSE 0 END AS UTER_PR,
               CASE WHEN EEI_CAN_KD = '6' THEN EXAM_PR ELSE 0 END AS LUNG_PR,
               CASE WHEN EEI_CAN_KD = '1' THEN CNT ELSE 0 END AS STOMA_CNT,
               CASE WHEN EEI_CAN_KD = '2' THEN CNT ELSE 0 END AS COLON_CNT,
               CASE WHEN EEI_CAN_KD = '3' THEN CNT ELSE 0 END AS LIVER_CNT,
               CASE WHEN EEI_CAN_KD = '4' THEN CNT ELSE 0 END AS BAST_CNT,
               CASE WHEN EEI_CAN_KD = '5' THEN CNT ELSE 0 END AS UTER_CNT,
               CASE WHEN EEI_CAN_KD = '6' THEN CNT ELSE 0 END AS LUNG_CNT,
               0 HLTH_CNT, 0 HLTHS_CNT, 0 ORAL_CNT, 0 STDT_CNT, 0 STDTO_CNT, 0 STDT_CNTO, 0 STDTO_CNTO, 0 SPCL_CNT, 0 SPCLS_CNT, 0 QSTN_CNT
          FROM (SELECT EEI_CAN_KD, COUNT(*) CNT,
                       CASE WHEN NVL(EEA_STOMA_CD, '0') <> '0' AND EEI_CAN_KD = '1' THEN ECS_LICEN_CD
                            WHEN NVL(EEA_COLON_CD, '0') <> '0' AND EEI_CAN_KD = '2' THEN ECC_LICEN_CD
                            WHEN NVL(EEA_LIVER_CD, '0') <> '0' AND EEI_CAN_KD = '3' THEN ECL_LICEN_CD
                            WHEN NVL(EEA_BAST_CD,  '0') <> '0' AND EEI_CAN_KD = '4' THEN ECB_LICEN_CD
                            WHEN NVL(EEA_UTER_CD,  '0') <> '0' AND EEI_CAN_KD = '5' THEN ECV_LICEN_CD
                            WHEN NVL(EEA_LUNG_CD,  '0') <> '0' AND EEI_CAN_KD = '6' THEN ECG_LICEN_CD END LICEN_CD,
                       SUM(CAN_PR+CASE WHEN EEA_HTSB_YN = 'Y' THEN HTSB_PR ELSE FST_PR END) EXAM_PR
                  FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, EEA_HTSB_YN, EEA_ORAL_YN,
                               EEA_STOMA_CD, EEA_COLON_CD, EEA_LIVER_CD, EEA_BAST_CD, EEA_UTER_CD, EEA_LUNG_CD,
                               B.ECS_LICEN_CD, C.ECC_LICEN_CD, D.ECL_LICEN_CD, E.ECB_LICEN_CD, F.ECV_LICEN_CD, G.ECG_LICEN_CD
                          FROM ET_EXAM_ACPT A
                               LEFT OUTER JOIN ET_CANCER_STMC  B ON ECS_EXAM_DT = EEA_EXAM_DT
                                                                AND ECS_EXAM_SQ = EEA_EXAM_SQ
                               LEFT OUTER JOIN ET_CANCER_COLO  C ON ECC_EXAM_DT = EEA_EXAM_DT
                                                                AND ECC_EXAM_SQ = EEA_EXAM_SQ
                               LEFT OUTER JOIN ET_CANCER_LIVER D ON ECL_EXAM_DT = EEA_EXAM_DT
                                                                AND ECL_EXAM_SQ = EEA_EXAM_SQ
                               LEFT OUTER JOIN ET_CANCER_BRST  E ON ECB_EXAM_DT = EEA_EXAM_DT
                                                                AND ECB_EXAM_SQ = EEA_EXAM_SQ
                               LEFT OUTER JOIN ET_CANCER_CRVC  F ON ECV_EXAM_DT = EEA_EXAM_DT
                                                                AND ECV_EXAM_SQ = EEA_EXAM_SQ
                               LEFT OUTER JOIN ET_CANCER_LUNG  G ON ECG_EXAM_DT = EEA_EXAM_DT
                                                                AND ECG_EXAM_SQ = EEA_EXAM_SQ
                         WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                           AND NVL(EEA_HTSB_CD, ' ') <> ' '
                           AND EEA_ORDER_YN <> 'C'
                           AND NVL(EEA_RECE_NO, ' ') <> 'R'

                           :PARAM_TX1

                       ) G,
                       (SELECT EEI_EXAM_DT, EEI_EXAM_SQ, EEI_CAN_KD,
                               SUM(EEI_FST_PR) FST_PR, SUM(EEI_HTSB_PR) HTSB_PR, SUM(EEI_CAN_PR) CAN_PR
                          FROM ET_EXAM_ITEM
                         WHERE EEI_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                           AND EEI_CAN_KD <> '0'
                         GROUP BY EEI_EXAM_DT, EEI_EXAM_SQ, EEI_CAN_KD
                       ) H
                 WHERE H.EEI_EXAM_DT = EEA_EXAM_DT
                   AND H.EEI_EXAM_SQ = EEA_EXAM_SQ
                 GROUP BY EEI_CAN_KD,
                          CASE WHEN NVL(EEA_STOMA_CD, '0') <> '0' AND EEI_CAN_KD = '1' THEN ECS_LICEN_CD
                               WHEN NVL(EEA_COLON_CD, '0') <> '0' AND EEI_CAN_KD = '2' THEN ECC_LICEN_CD
                               WHEN NVL(EEA_LIVER_CD, '0') <> '0' AND EEI_CAN_KD = '3' THEN ECL_LICEN_CD
                               WHEN NVL(EEA_BAST_CD,  '0') <> '0' AND EEI_CAN_KD = '4' THEN ECB_LICEN_CD
                               WHEN NVL(EEA_UTER_CD,  '0') <> '0' AND EEI_CAN_KD = '5' THEN ECV_LICEN_CD
                               WHEN NVL(EEA_LUNG_CD,  '0') <> '0' AND EEI_CAN_KD = '6' THEN ECG_LICEN_CD END
               ) I
        UNION ALL
        SELECT EXAM_CD, LICEN_CD,
               CASE WHEN NVL(LICEN_CD, ' ') = ' ' THEN '>미판정<' ELSE F_USER_FIND(LICEN_CD) END AS DR_NM,
               CASE WHEN EXAM_CD = '11001' THEN EXAM_PR ELSE 0 END AS HLTH_PR,
               CASE WHEN EXAM_CD = '11002' THEN EXAM_PR ELSE 0 END AS HLTHS_PR,
               CASE WHEN EXAM_CD = '14001' THEN EXAM_PR ELSE 0 END AS ORAL_PR,
               CASE WHEN EXAM_CD = '31001' THEN EXAM_PR ELSE 0 END AS STDT_PR,
               CASE WHEN EXAM_CD = '31002' THEN EXAM_PR ELSE 0 END AS STDTO_PR,
               CASE WHEN EXAM_CD = '31006' THEN EXAM_PR ELSE 0 END AS STDT_PRO,
               CASE WHEN EXAM_CD = '31007' THEN EXAM_PR ELSE 0 END AS STDTO_PRO,
               CASE WHEN EXAM_CD = '41001' THEN EXAM_PR ELSE 0 END AS SPCL_PR,
               CASE WHEN EXAM_CD = '42001' THEN EXAM_PR ELSE 0 END AS SPCLS_PR,
               0 STOMA_PR,  0 COLON_PR,  0 LIVER_PR,  0 BAST_PR,  0 UTER_PR,  0 LUNG_PR,
               0 STOMA_CNT, 0 COLON_CNT, 0 LIVER_CNT, 0 BAST_CNT, 0 UTER_CNT, 0 LUNG_CNT,
               CASE WHEN EXAM_CD = '11001' THEN CNT ELSE 0 END AS HLTH_CNT,
               CASE WHEN EXAM_CD = '11002' THEN CNT ELSE 0 END AS HLTHS_CNT,
               CASE WHEN EXAM_CD = '14001' THEN CNT ELSE 0 END AS ORAL_CNT,
               CASE WHEN EXAM_CD = '31001' THEN CNT ELSE 0 END AS STDT_CNT,
               CASE WHEN EXAM_CD = '31002' THEN CNT ELSE 0 END AS STDTO_CNT,
               CASE WHEN EXAM_CD = '31006' THEN CNT ELSE 0 END AS STDT_CNTO,
               CASE WHEN EXAM_CD = '31007' THEN CNT ELSE 0 END AS STDTO_CNTO,
               CASE WHEN EXAM_CD = '41001' THEN CNT ELSE 0 END AS SPCL_CNT,
               CASE WHEN EXAM_CD = '42001' THEN CNT ELSE 0 END AS SPCLS_CNT,
               CASE WHEN EXAM_CD = '11009' THEN CNT ELSE 0 END AS QSTN_CNT
          FROM (SELECT EXAM_CD, LICEN_CD, COUNT(*) CNT, SUM(EXAM_PR) EXAM_PR
                  FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '11001'  EXAM_CD, EEA_PLCE_CD,
                               CASE WHEN EEA_HTSB_YN = 'Y' THEN HTSB_PR ELSE FST_PR END  - EEA_CANR_PR - EEA_ORALR_PR EXAM_PR, B.PFP_DOCTORFIR LICEN_CD
                          FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ,
                                       SUM(EEP_FST_PR) FST_PR, SUM(EEP_HTSB_PR) HTSB_PR, SUM(EEP_CAN_PR) CAN_PR
                                  FROM ET_EXAM_PRICE
                                 WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                                 GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ
                               ) C, ET_EXAM_ACPT A
                                 LEFT OUTER JOIN PT_FIR_PANJUNG  B ON PFP_EXAM_DT = EEA_EXAM_DT
                                                                  AND PFP_EXAM_SQ = EEA_EXAM_SQ
                         WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                           AND EEA_HTSB_CD IN ('11001', '12001', '12003')
                           AND EEA_ORDER_YN <> 'C'
                           AND NVL(EEA_RECE_NO, ' ') <> 'R'
                           AND EEP_EXAM_DT = EEA_EXAM_DT
                           AND EEP_EXAM_SQ = EEA_EXAM_SQ
                        UNION ALL
                        SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '11009'  EXAM_CD, EEA_PLCE_CD,
                               1 EXAM_PR, B.PFP_DOCTORQQN LICEN_CD
                          FROM ET_EXAM_ACPT A
                               LEFT OUTER JOIN PT_FIR_PANJUNG  B ON PFP_EXAM_DT = EEA_EXAM_DT
                                                                AND PFP_EXAM_SQ = EEA_EXAM_SQ
                         WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                           AND EEA_HTSB_CD IN ('11001', '12001', '12003')
                           AND EEA_ORDER_YN <> 'C'
                           AND NVL(EEA_RECE_NO, ' ') <> 'R'
                        UNION ALL
                        SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '11002' EXAM_CD, EEA_PLCE_CD,
                               CASE WHEN EEA_HTSB_YN = 'Y' THEN HTSB_PR ELSE FST_PR END  - EEA_CANR_PR - EEA_ORALR_PR EXAM_PR, B.PSP_DOCTORSED LICEN_CD
                          FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ,
                                       SUM(EEP_FST_PR) FST_PR, SUM(EEP_HTSB_PR) HTSB_PR, SUM(EEP_CAN_PR) CAN_PR
                                  FROM ET_EXAM_PRICE
                                 WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                                 GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ
                               ) C, ET_EXAM_ACPT A
                                 LEFT OUTER JOIN PT_SED_PANJUNG  B ON PSP_EXAM_DT = EEA_EXAM_DT
                                                                        AND PSP_EXAM_SQ = EEA_EXAM_SQ
                         WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                           AND EEA_HTSB_CD IN ('11002', '12002', '12004')
                           AND EEA_ORDER_YN <> 'C'
                           AND NVL(EEA_RECE_NO, ' ') <> 'R'
                           AND EEP_EXAM_DT = EEA_EXAM_DT
                           AND EEP_EXAM_SQ = EEA_EXAM_SQ
                        UNION ALL
                        SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '14001' EXAM_CD, EEA_PLCE_CD,
                               EEA_ORALR_PR EXAM_PR, B.EDP_DOCT_CD LICEN_CD
                          FROM ET_EXAM_ACPT A
                               LEFT OUTER JOIN ET_DENTAL_PANJ  B ON EDP_EXAM_DT = EEA_EXAM_DT
                                                                AND EDP_EXAM_SQ = EEA_EXAM_SQ
                         WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                           AND EEA_HTSB_CD LIKE '1%'
                           AND EEA_ORAL_YN = 'Y'
                           AND EEA_ORALR_PR > 0
                           AND EEA_ORDER_YN <> 'C'
                           AND NVL(EEA_RECE_NO, ' ') <> 'R'
                        UNION ALL
                        SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '31001' EXAM_CD, EEA_PLCE_CD,
                               EEA_COMPR_PR - EEA_ORALR_PR EXAM_PR, B.ESP_EXAM_DR LICEN_CD
                          FROM ET_EXAM_ACPT A
                               LEFT OUTER JOIN ET_STDT_PNJN B ON ESP_EXAM_DT = EEA_EXAM_DT
                                                             AND ESP_EXAM_SQ = EEA_EXAM_SQ
                         WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                           AND EEA_EXAM_CD = '31001'
                           AND EEA_ORDER_YN <> 'C'
                           AND NVL(EEA_RECE_NO, ' ') <> 'R'
                        UNION ALL
                        SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '31002' EXAM_CD, EEA_PLCE_CD,
                               EEA_ORALR_PR EXAM_PR, B.ESP_ORAL_DR LICEN_CD
                          FROM ET_EXAM_ACPT A
                               LEFT OUTER JOIN ET_STDT_PNJN B ON ESP_EXAM_DT = EEA_EXAM_DT
                                                             AND ESP_EXAM_SQ = EEA_EXAM_SQ
                         WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                           AND EEA_EXAM_CD = '31001'
                           AND EEA_ORDER_YN <> 'C'
                           AND NVL(EEA_RECE_NO, ' ') <> 'R'
                        UNION ALL
                        SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '31006' EXAM_CD, EEA_PLCE_CD,
                               EEA_HLTHR_PR - EEA_ORALR_PR EXAM_PR, B.ESO_EXAM_DR LICEN_CD
                          FROM ET_EXAM_ACPT A
                               LEFT OUTER JOIN ET_STDT_PNJNO B ON ESO_EXAM_DT = EEA_EXAM_DT
                                                              AND ESO_EXAM_SQ = EEA_EXAM_SQ
                         WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                           AND EEA_EXAM_CD = '31006'
                           AND EEA_ORDER_YN <> 'C'
                           AND NVL(EEA_RECE_NO, ' ') <> 'R'
                        UNION ALL
                        SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '31007' EXAM_CD, EEA_PLCE_CD,
                               EEA_ORALR_PR EXAM_PR, B.ESO_ORAL_DR LICEN_CD
                          FROM ET_EXAM_ACPT A
                               LEFT OUTER JOIN ET_STDT_PNJNO B ON ESO_EXAM_DT = EEA_EXAM_DT
                                                              AND ESO_EXAM_SQ = EEA_EXAM_SQ
                         WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                           AND EEA_EXAM_CD = '31006'
                           AND EEA_ORDER_YN <> 'C'
                           AND NVL(EEA_RECE_NO, ' ') <> 'R'
                        UNION ALL
                        SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '41001'  EXAM_CD, EEA_PLCE_CD,
                               CASE WHEN EEA_SPSB_YN = 'Y' THEN SPSB_PR ELSE FST_PR END EXAM_PR, B.SPG_DOCT_CD LICEN_CD
                          FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ,
                                       SUM(EEP_FST_PR) FST_PR, SUM(EEP_SPSB_PR) SPSB_PR
                                  FROM ET_EXAM_PRICE
                                 WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                                 GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ
                               ) C, ET_EXAM_ACPT A
                                 LEFT OUTER JOIN (SELECT SPG_EXAM_DT, SPG_EXAM_SQ, MAX(NVL(SPG_DOCT_CD, ' ')) SPG_DOCT_CD
                                                    FROM ST_PANJUNG
                                                   WHERE SPG_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                                                   GROUP BY SPG_EXAM_DT, SPG_EXAM_SQ) B
                                              ON SPG_EXAM_DT = EEA_EXAM_DT
                                             AND SPG_EXAM_SQ = EEA_EXAM_SQ
                         WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                           AND (EEA_EXAM_CD = '41001' OR EEA_SPSB_CD = '41001')
                           AND EEA_ORDER_YN <> 'C'
                           AND NVL(EEA_RECE_NO, ' ') <> 'R'

IF (:BATCH_YN = 'N') THEN
                           AND EEA_SPCL_CD <> '07'

                           AND EEP_EXAM_DT = EEA_EXAM_DT
                           AND EEP_EXAM_SQ = EEA_EXAM_SQ
                        UNION ALL
                        SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '42001'  EXAM_CD, EEA_PLCE_CD,
                               CASE WHEN EEA_SPSB_YN = 'Y' THEN SPSB_PR ELSE FST_PR END EXAM_PR, B.SPG_DOCT_CD LICEN_CD
                          FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ,
                                       SUM(EEP_FST_PR) FST_PR, SUM(EEP_SPSB_PR) SPSB_PR
                                  FROM ET_EXAM_PRICE
                                 WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                                 GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ
                               ) C, ET_EXAM_ACPT A
                                 LEFT OUTER JOIN (SELECT SPG_EXAM_DT, SPG_EXAM_SQ, MAX(NVL(SPG_DOCT_CD, ' ')) SPG_DOCT_CD
                                                    FROM ST_PANJUNG
                                                   WHERE SPG_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                                                   GROUP BY SPG_EXAM_DT, SPG_EXAM_SQ) B
                                              ON SPG_EXAM_DT = EEA_EXAM_DT
                                             AND SPG_EXAM_SQ = EEA_EXAM_SQ
                         WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                           AND (EEA_EXAM_CD = '42001' OR EEA_SPSB_CD = '42001')
                           AND EEA_ORDER_YN <> 'C'
                           AND NVL(EEA_RECE_NO, ' ') <> 'R'

IF (:BATCH_YN = 'N') THEN
                           AND EEA_SPCL_CD <> '07'

                           AND EEP_EXAM_DT = EEA_EXAM_DT
                           AND EEP_EXAM_SQ = EEA_EXAM_SQ
                       ) C
                 WHERE EXAM_PR > 0

                   :PARAM_TX

                 GROUP BY EXAM_CD, LICEN_CD
               ) I
       ) J

IF (:PNJN_YN = 'Y') THEN
 WHERE NVL(LICEN_CD, ' ') <> ' '

 GROUP BY NVL(LICEN_CD, ' ')
 ORDER BY DR_NM
		*/

		sql = " SELECT NVL(LICEN_CD, ' ') LICEN_CD, MAX(CASE WHEN DR_NM = ' ' THEN LICEN_CD ELSE DR_NM END) DR_NM, SUM(HLTH_CNT) HLTH_CNT, SUM(HLTH_PR) HLTH_PR, SUM(HLTHS_CNT) HLTHS_CNT, SUM(HLTHS_PR) HLTHS_PR, SUM(STOMA_CNT) STOMA_CNT, SUM(STOMA_PR) STOMA_PR, SUM(COLON_CNT) COLON_CNT, SUM(COLON_PR) COLON_PR, SUM(LIVER_CNT) LIVER_CNT, SUM(LIVER_PR) LIVER_PR, SUM(BAST_CNT) BAST_CNT, SUM(BAST_PR) BAST_PR, SUM(UTER_CNT) UTER_CNT, SUM(UTER_PR) UTER_PR, SUM(LUNG_CNT) LUNG_CNT, SUM(LUNG_PR) LUNG_PR, SUM(ORAL_CNT) ORAL_CNT, SUM(ORAL_PR) ORAL_PR, SUM(STDT_CNT) STDT_CNT, SUM(STDT_PR) STDT_PR, SUM(STDTO_CNT) STDTO_CNT, SUM(STDTO_PR) STDTO_PR, SUM(STDT_CNTO) STDT_CNTO, SUM(STDT_PRO) STDT_PRO, SUM(STDTO_CNTO) STDTO_CNTO, SUM(STDTO_PRO) STDTO_PRO, SUM(SPCL_CNT) SPCL_CNT, SUM(SPCL_PR) SPCL_PR, SUM(SPCLS_CNT) SPCLS_CNT, SUM(SPCLS_PR) SPCLS_PR, SUM(QSTN_CNT) QSTN_CNT, SUM(JONG_CNT) JONG_CNT, SUM(JONG_PR) JONG_PR";
		sql += " FROM (SELECT EEI_CAN_KD EXAM_CD, LICEN_CD, CASE WHEN NVL(LICEN_CD, ' ') = ' ' THEN '>미판정<' ELSE F_USER_FIND(LICEN_CD) END AS DR_NM, 0 HLTH_PR, 0 HLTHS_PR, 0 ORAL_PR, 0 STDT_PR, 0 STDTO_PR, 0 STDT_PRO, 0 STDTO_PRO, 0 SPCL_PR, 0 SPCLS_PR, 0 JONG_PR, CASE WHEN EEI_CAN_KD = '1' THEN EXAM_PR ELSE 0 END AS STOMA_PR, CASE WHEN EEI_CAN_KD = '2' THEN EXAM_PR ELSE 0 END AS COLON_PR, CASE WHEN EEI_CAN_KD = '3' THEN EXAM_PR ELSE 0 END AS LIVER_PR, CASE WHEN EEI_CAN_KD = '4' THEN EXAM_PR ELSE 0 END AS BAST_PR, CASE WHEN EEI_CAN_KD = '5' THEN EXAM_PR ELSE 0 END AS UTER_PR, CASE WHEN EEI_CAN_KD = '6' THEN EXAM_PR ELSE 0 END AS LUNG_PR, CASE WHEN EEI_CAN_KD = '1' THEN CNT ELSE 0 END AS STOMA_CNT, CASE WHEN EEI_CAN_KD = '2' THEN CNT ELSE 0 END AS COLON_CNT, CASE WHEN EEI_CAN_KD = '3' THEN CNT ELSE 0 END AS LIVER_CNT, CASE WHEN EEI_CAN_KD = '4' THEN CNT ELSE 0 END AS BAST_CNT, CASE WHEN EEI_CAN_KD = '5' THEN CNT ELSE 0 END AS UTER_CNT, CASE WHEN EEI_CAN_KD = '6' THEN CNT ELSE 0 END AS LUNG_CNT, 0 HLTH_CNT, 0 HLTHS_CNT, 0 ORAL_CNT, 0 STDT_CNT, 0 STDTO_CNT, 0 STDT_CNTO, 0 STDTO_CNTO, 0 SPCL_CNT, 0 SPCLS_CNT, 0 QSTN_CNT, 0 JONG_CNT";
		sql += " FROM (SELECT EEI_CAN_KD, COUNT(*) CNT, CASE WHEN NVL(EEA_STOMA_CD, '0') <> '0'";
		sql += " AND EEI_CAN_KD = '1' THEN ECS_LICEN_CD WHEN NVL(EEA_COLON_CD, '0') <> '0'";
		sql += " AND EEI_CAN_KD = '2' THEN ECC_LICEN_CD WHEN NVL(EEA_LIVER_CD, '0') <> '0'";
		sql += " AND EEI_CAN_KD = '3' THEN ECL_LICEN_CD WHEN NVL(EEA_BAST_CD, '0') <> '0'";
		sql += " AND EEI_CAN_KD = '4' THEN ECB_LICEN_CD WHEN NVL(EEA_UTER_CD, '0') <> '0'";
		sql += " AND EEI_CAN_KD = '5' THEN ECV_LICEN_CD WHEN NVL(EEA_LUNG_CD, '0') <> '0'";
		sql += " AND EEI_CAN_KD = '6' THEN ECG_LICEN_CD END LICEN_CD, SUM(CAN_PR+CASE WHEN EEA_HTSB_YN = 'Y' THEN HTSB_PR ELSE FST_PR END) EXAM_PR";
		sql += " FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, EEA_HTSB_YN, EEA_ORAL_YN, EEA_STOMA_CD, EEA_COLON_CD, EEA_LIVER_CD, EEA_BAST_CD, EEA_UTER_CD, EEA_LUNG_CD, B.ECS_LICEN_CD, C.ECC_LICEN_CD, D.ECL_LICEN_CD, E.ECB_LICEN_CD, F.ECV_LICEN_CD, G.ECG_LICEN_CD";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_CANCER_STMC B";
		sql += " ON ECS_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECS_EXAM_SQ = EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_COLO C";
		sql += " ON ECC_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECC_EXAM_SQ = EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LIVER D";
		sql += " ON ECL_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECL_EXAM_SQ = EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_BRST E";
		sql += " ON ECB_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECB_EXAM_SQ = EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_CRVC F";
		sql += " ON ECV_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECV_EXAM_SQ = EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LUNG G";
		sql += " ON ECG_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECG_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND NVL(EEA_HTSB_CD, ' ') <> ' '";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += PARAM_TX1;
		sql += " ) G, (SELECT EEI_EXAM_DT, EEI_EXAM_SQ, EEI_CAN_KD, SUM(EEI_FST_PR) FST_PR, SUM(EEI_HTSB_PR) HTSB_PR, SUM(EEI_CAN_PR) CAN_PR";
		sql += " FROM ET_EXAM_ITEM";
		sql += " WHERE EEI_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEI_CAN_KD <> '0'";
		sql += " GROUP BY EEI_EXAM_DT, EEI_EXAM_SQ, EEI_CAN_KD ) H";
		sql += " WHERE H.EEI_EXAM_DT = EEA_EXAM_DT";
		sql += " AND H.EEI_EXAM_SQ = EEA_EXAM_SQ";
		sql += " GROUP BY EEI_CAN_KD, CASE WHEN NVL(EEA_STOMA_CD, '0') <> '0'";
		sql += " AND EEI_CAN_KD = '1' THEN ECS_LICEN_CD WHEN NVL(EEA_COLON_CD, '0') <> '0'";
		sql += " AND EEI_CAN_KD = '2' THEN ECC_LICEN_CD WHEN NVL(EEA_LIVER_CD, '0') <> '0'";
		sql += " AND EEI_CAN_KD = '3' THEN ECL_LICEN_CD WHEN NVL(EEA_BAST_CD, '0') <> '0'";
		sql += " AND EEI_CAN_KD = '4' THEN ECB_LICEN_CD WHEN NVL(EEA_UTER_CD, '0') <> '0'";
		sql += " AND EEI_CAN_KD = '5' THEN ECV_LICEN_CD WHEN NVL(EEA_LUNG_CD, '0') <> '0'";
		sql += " AND EEI_CAN_KD = '6' THEN ECG_LICEN_CD END ) I";
		sql += " UNION";
		sql += " ALL SELECT EXAM_CD, LICEN_CD, CASE WHEN NVL(LICEN_CD, ' ') = ' ' THEN '>미판정<' ELSE F_USER_FIND(LICEN_CD) END AS DR_NM, CASE WHEN EXAM_CD = '11001' THEN EXAM_PR ELSE 0 END AS HLTH_PR, CASE WHEN EXAM_CD = '11002' THEN EXAM_PR ELSE 0 END AS HLTHS_PR, CASE WHEN EXAM_CD = '14001' THEN EXAM_PR ELSE 0 END AS ORAL_PR, CASE WHEN EXAM_CD = '31001' THEN EXAM_PR ELSE 0 END AS STDT_PR, CASE WHEN EXAM_CD = '31002' THEN EXAM_PR ELSE 0 END AS STDTO_PR, CASE WHEN EXAM_CD = '31006' THEN EXAM_PR ELSE 0 END AS STDT_PRO, CASE WHEN EXAM_CD = '31007' THEN EXAM_PR ELSE 0 END AS STDTO_PRO, CASE WHEN EXAM_CD = '41001' THEN EXAM_PR ELSE 0 END AS SPCL_PR, CASE WHEN EXAM_CD = '42001' THEN EXAM_PR ELSE 0 END AS SPCLS_PR, CASE WHEN EXAM_CD = '21001' THEN EXAM_PR ELSE 0 END AS JONG_PR, 0 STOMA_PR, 0 COLON_PR, 0 LIVER_PR, 0 BAST_PR, 0 UTER_PR, 0 LUNG_PR, 0 STOMA_CNT, 0 COLON_CNT, 0 LIVER_CNT, 0 BAST_CNT, 0 UTER_CNT, 0 LUNG_CNT, CASE WHEN EXAM_CD = '11001' THEN CNT ELSE 0 END AS HLTH_CNT, CASE WHEN EXAM_CD = '11002' THEN CNT ELSE 0 END AS HLTHS_CNT, CASE WHEN EXAM_CD = '14001' THEN CNT ELSE 0 END AS ORAL_CNT, CASE WHEN EXAM_CD = '31001' THEN CNT ELSE 0 END AS STDT_CNT, CASE WHEN EXAM_CD = '31002' THEN CNT ELSE 0 END AS STDTO_CNT, CASE WHEN EXAM_CD = '31006' THEN CNT ELSE 0 END AS STDT_CNTO, CASE WHEN EXAM_CD = '31007' THEN CNT ELSE 0 END AS STDTO_CNTO, CASE WHEN EXAM_CD = '41001' THEN CNT ELSE 0 END AS SPCL_CNT, CASE WHEN EXAM_CD = '42001' THEN CNT ELSE 0 END AS SPCLS_CNT, CASE WHEN EXAM_CD = '11009' THEN CNT ELSE 0 END AS QSTN_CNT, CASE WHEN EXAM_CD = '21001' THEN CNT ELSE 0 END AS JONG_CNT";
		sql += " FROM (SELECT EXAM_CD, LICEN_CD, COUNT(*) CNT, SUM(EXAM_PR) EXAM_PR";
		sql += " FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '11001' EXAM_CD, EEA_PLCE_CD, CASE WHEN EEA_HTSB_YN = 'Y' THEN HTSB_PR ELSE FST_PR END - EEA_CANR_PR - EEA_ORALR_PR EXAM_PR, B.PFP_DOCTORFIR LICEN_CD";
		sql += " FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ, SUM(EEP_FST_PR) FST_PR, SUM(EEP_HTSB_PR) HTSB_PR, SUM(EEP_CAN_PR) CAN_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) C, ET_EXAM_ACPT A LEFT OUTER JOIN PT_FIR_PANJUNG B";
		sql += " ON PFP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND PFP_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEA_HTSB_CD IN ('11001', '12001', '12003')";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " AND EEP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND EEP_EXAM_SQ = EEA_EXAM_SQ";
		sql += " UNION";
		sql += " ALL SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '11009' EXAM_CD, EEA_PLCE_CD, 1 EXAM_PR, B.PFP_DOCTORQQN LICEN_CD";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN PT_FIR_PANJUNG B";
		sql += " ON PFP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND PFP_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEA_HTSB_CD IN ('11001', '12001', '12003')";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '11002' EXAM_CD, EEA_PLCE_CD, CASE WHEN EEA_HTSB_YN = 'Y' THEN HTSB_PR ELSE FST_PR END - EEA_CANR_PR - EEA_ORALR_PR EXAM_PR, B.PSP_DOCTORSED LICEN_CD";
		sql += " FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ, SUM(EEP_FST_PR) FST_PR, SUM(EEP_HTSB_PR) HTSB_PR, SUM(EEP_CAN_PR) CAN_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) C, ET_EXAM_ACPT A LEFT OUTER JOIN PT_SED_PANJUNG B";
		sql += " ON PSP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND PSP_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEA_HTSB_CD IN ('11002', '12002', '12004')";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " AND EEP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND EEP_EXAM_SQ = EEA_EXAM_SQ";
		sql += " UNION";
		sql += " ALL SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '14001' EXAM_CD, EEA_PLCE_CD, EEA_ORALR_PR EXAM_PR, B.EDP_DOCT_CD LICEN_CD";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_DENTAL_PANJ B";
		sql += " ON EDP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND EDP_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEA_HTSB_CD LIKE '1%'";
		sql += " AND EEA_ORAL_YN = 'Y'";
		sql += " AND EEA_ORALR_PR > 0";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '31001' EXAM_CD, EEA_PLCE_CD, EEA_COMPR_PR - EEA_ORALR_PR EXAM_PR, B.ESP_EXAM_DR LICEN_CD";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_STDT_PNJN B";
		sql += " ON ESP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ESP_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEA_EXAM_CD = '31001'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '31002' EXAM_CD, EEA_PLCE_CD, EEA_ORALR_PR EXAM_PR, B.ESP_ORAL_DR LICEN_CD";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_STDT_PNJN B";
		sql += " ON ESP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ESP_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEA_EXAM_CD = '31001'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '31006' EXAM_CD, EEA_PLCE_CD, EEA_HLTHR_PR - EEA_ORALR_PR EXAM_PR, B.ESO_EXAM_DR LICEN_CD";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_STDT_PNJNO B";
		sql += " ON ESO_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ESO_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEA_EXAM_CD = '31006'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '31007' EXAM_CD, EEA_PLCE_CD, EEA_ORALR_PR EXAM_PR, B.ESO_ORAL_DR LICEN_CD";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_STDT_PNJNO B";
		sql += " ON ESO_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ESO_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEA_EXAM_CD = '31006'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '41001' EXAM_CD, EEA_PLCE_CD, CASE WHEN EEA_SPSB_YN = 'Y' THEN SPSB_PR ELSE FST_PR END EXAM_PR, B.SPG_DOCT_CD LICEN_CD";
		sql += " FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ, SUM(EEP_FST_PR) FST_PR, SUM(EEP_SPSB_PR) SPSB_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) C, ET_EXAM_ACPT A LEFT OUTER JOIN (SELECT SPG_EXAM_DT, SPG_EXAM_SQ, MAX(NVL(SPG_DOCT_CD, ' ')) SPG_DOCT_CD";
		sql += " FROM ST_PANJUNG";
		sql += " WHERE SPG_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY SPG_EXAM_DT, SPG_EXAM_SQ) B";
		sql += " ON SPG_EXAM_DT = EEA_EXAM_DT";
		sql += " AND SPG_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND (EEA_EXAM_CD = '41001'";
		sql += " OR EEA_SPSB_CD = '41001')";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";

		if(BATCH_YN.equals("N")) {
			sql += " AND EEA_SPCL_CD <> '07'";
		}

		sql += " AND EEP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND EEP_EXAM_SQ = EEA_EXAM_SQ";
		sql += " UNION";
		sql += " ALL SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '42001' EXAM_CD, EEA_PLCE_CD, CASE WHEN EEA_SPSB_YN = 'Y' THEN SPSB_PR ELSE FST_PR END EXAM_PR, B.SPG_DOCT_CD LICEN_CD";
		sql += " FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ, SUM(EEP_FST_PR) FST_PR, SUM(EEP_SPSB_PR) SPSB_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) C, ET_EXAM_ACPT A LEFT OUTER JOIN (SELECT SPG_EXAM_DT, SPG_EXAM_SQ, MAX(NVL(SPG_DOCT_CD, ' ')) SPG_DOCT_CD";
		sql += " FROM ST_PANJUNG";
		sql += " WHERE SPG_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY SPG_EXAM_DT, SPG_EXAM_SQ) B";
		sql += " ON SPG_EXAM_DT = EEA_EXAM_DT";
		sql += " AND SPG_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND (EEA_EXAM_CD = '42001'";
		sql += " OR EEA_SPSB_CD = '42001')";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";

		if(BATCH_YN.equals("N")) {
			sql += " AND EEA_SPCL_CD <> '07'";
		}

		sql += " AND EEP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND EEP_EXAM_SQ = EEA_EXAM_SQ";

		sql += " UNION ALL";
		sql += " SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_EXAM_CD, '21001' EXAM_CD, EEA_PLCE_CD,";
		sql += " FST_PR EXAM_PR, B.SSV_DOCTOR_CD LICEN_CD";
		sql += " FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ,";
		sql += " SUM(EEP_FST_PR) FST_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ";
		sql += " ) C, ET_EXAM_ACPT A";
		sql += " LEFT OUTER JOIN (SELECT SSV_EXAM_DT, SSV_EXAM_SQ, MAX(NVL(SSV_DOCTOR_CD, ' ')) SSV_DOCTOR_CD";
		sql += " FROM ST_SYTH_VIEW";
		sql += " WHERE SSV_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";
		sql += " GROUP BY SSV_EXAM_DT, SSV_EXAM_SQ) B";
		sql += " ON SSV_EXAM_DT = EEA_EXAM_DT";
		sql += " AND SSV_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";
		sql += " AND EEA_EXAM_CD = '21001'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " AND EEP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND EEP_EXAM_SQ = EEA_EXAM_SQ";
		sql += " ) C";
		sql += " WHERE EXAM_PR > 0";
		sql += PARAM_TX;
		sql += " GROUP BY EXAM_CD, LICEN_CD ) I ) J";

		if(PNJN_YN.equals("Y")) {
			sql += " WHERE NVL(LICEN_CD, ' ') <> ' '";
		}

		sql += " GROUP BY NVL(LICEN_CD, ' ')";
		sql += " ORDER BY DR_NM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_Sales_UP_Cancer_Dr_001 \n";
			G_INFO += "설명 : 판정의사별 현황 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " BATCH_YN : " + BATCH_YN + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
			G_INFO += " PNJN_YN : " + PNJN_YN + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		rsmd = rsList.getMetaData();  //Select 결과의 Metadata 가져오기.

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
<%
		for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
			String dataType = "string";
			String maxLength = "4000";

			if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
				dataType = "bin.hex";
				maxLength = "2147483647";
				//<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
			} else if (rsmd.getColumnTypeName(colCnt).equals("CLOB")){
				maxLength = "1073741823";
				//<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
			}
%>
		<s:AttributeType name='<%= rsmd.getColumnName(colCnt)%>' rs:number='<%= Integer.toString(colCnt)%>' rs:writeunknown='true' rs:basetable='DUAL' rs:basecolumn='<%= rsmd.getColumnName(colCnt)%>'>
			<s:datatype dt:type='<%= dataType%>' dt:maxLength='<%= maxLength%>' <% if (! maxLength.equals("4000")) { %> rs:long='true' <% } %>/>
		</s:AttributeType>
<%
		}
%>
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
				String tempData = cRsList.getString(rsmd.getColumnName(colCnt));
				if(! tempData.equals("")) {
%>
		 			<%= rsmd.getColumnName(colCnt)%>='<%= tempData%>'
<%
				}
			}
%>
				ROWID='<%= cnt%>'
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
