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

		sql = " SELECT NVL(LICEN_CD, ' ') LICEN_CD, MAX(CASE WHEN DR_NM = ' ' THEN LICEN_CD ELSE DR_NM END) DR_NM, SUM(HLTH_CNT) HLTH_CNT, SUM(HLTH_PR) HLTH_PR, SUM(HLTHS_CNT) HLTHS_CNT, SUM(HLTHS_PR) HLTHS_PR, SUM(STOMA_CNT) STOMA_CNT, SUM(STOMA_PR) STOMA_PR, SUM(COLON_CNT) COLON_CNT, SUM(COLON_PR) COLON_PR, SUM(LIVER_CNT) LIVER_CNT, SUM(LIVER_PR) LIVER_PR, SUM(BAST_CNT) BAST_CNT, SUM(BAST_PR) BAST_PR, SUM(UTER_CNT) UTER_CNT, SUM(UTER_PR) UTER_PR, SUM(LUNG_CNT) LUNG_CNT, SUM(LUNG_PR) LUNG_PR, SUM(ORAL_CNT) ORAL_CNT, SUM(ORAL_PR) ORAL_PR, SUM(STDT_CNT) STDT_CNT, SUM(STDT_PR) STDT_PR, SUM(STDTO_CNT) STDTO_CNT, SUM(STDTO_PR) STDTO_PR, SUM(STDT_CNTO) STDT_CNTO, SUM(STDT_PRO) STDT_PRO, SUM(STDTO_CNTO) STDTO_CNTO, SUM(STDTO_PRO) STDTO_PRO, SUM(SPCL_CNT) SPCL_CNT, SUM(SPCL_PR) SPCL_PR, SUM(SPCLS_CNT) SPCLS_CNT, SUM(SPCLS_PR) SPCLS_PR, SUM(QSTN_CNT) QSTN_CNT";
		sql += " FROM (SELECT EEI_CAN_KD EXAM_CD, LICEN_CD, CASE WHEN NVL(LICEN_CD, ' ') = ' ' THEN '>미판정<' ELSE F_USER_FIND(LICEN_CD) END AS DR_NM, 0 HLTH_PR, 0 HLTHS_PR, 0 ORAL_PR, 0 STDT_PR, 0 STDTO_PR, 0 STDT_PRO, 0 STDTO_PRO, 0 SPCL_PR, 0 SPCLS_PR, CASE WHEN EEI_CAN_KD = '1' THEN EXAM_PR ELSE 0 END AS STOMA_PR, CASE WHEN EEI_CAN_KD = '2' THEN EXAM_PR ELSE 0 END AS COLON_PR, CASE WHEN EEI_CAN_KD = '3' THEN EXAM_PR ELSE 0 END AS LIVER_PR, CASE WHEN EEI_CAN_KD = '4' THEN EXAM_PR ELSE 0 END AS BAST_PR, CASE WHEN EEI_CAN_KD = '5' THEN EXAM_PR ELSE 0 END AS UTER_PR, CASE WHEN EEI_CAN_KD = '6' THEN EXAM_PR ELSE 0 END AS LUNG_PR, CASE WHEN EEI_CAN_KD = '1' THEN CNT ELSE 0 END AS STOMA_CNT, CASE WHEN EEI_CAN_KD = '2' THEN CNT ELSE 0 END AS COLON_CNT, CASE WHEN EEI_CAN_KD = '3' THEN CNT ELSE 0 END AS LIVER_CNT, CASE WHEN EEI_CAN_KD = '4' THEN CNT ELSE 0 END AS BAST_CNT, CASE WHEN EEI_CAN_KD = '5' THEN CNT ELSE 0 END AS UTER_CNT, CASE WHEN EEI_CAN_KD = '6' THEN CNT ELSE 0 END AS LUNG_CNT, 0 HLTH_CNT, 0 HLTHS_CNT, 0 ORAL_CNT, 0 STDT_CNT, 0 STDTO_CNT, 0 STDT_CNTO, 0 STDTO_CNTO, 0 SPCL_CNT, 0 SPCLS_CNT, 0 QSTN_CNT";
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
		sql += " ALL SELECT EXAM_CD, LICEN_CD, CASE WHEN NVL(LICEN_CD, ' ') = ' ' THEN '>미판정<' ELSE F_USER_FIND(LICEN_CD) END AS DR_NM, CASE WHEN EXAM_CD = '11001' THEN EXAM_PR ELSE 0 END AS HLTH_PR, CASE WHEN EXAM_CD = '11002' THEN EXAM_PR ELSE 0 END AS HLTHS_PR, CASE WHEN EXAM_CD = '14001' THEN EXAM_PR ELSE 0 END AS ORAL_PR, CASE WHEN EXAM_CD = '31001' THEN EXAM_PR ELSE 0 END AS STDT_PR, CASE WHEN EXAM_CD = '31002' THEN EXAM_PR ELSE 0 END AS STDTO_PR, CASE WHEN EXAM_CD = '31006' THEN EXAM_PR ELSE 0 END AS STDT_PRO, CASE WHEN EXAM_CD = '31007' THEN EXAM_PR ELSE 0 END AS STDTO_PRO, CASE WHEN EXAM_CD = '41001' THEN EXAM_PR ELSE 0 END AS SPCL_PR, CASE WHEN EXAM_CD = '42001' THEN EXAM_PR ELSE 0 END AS SPCLS_PR, 0 STOMA_PR, 0 COLON_PR, 0 LIVER_PR, 0 BAST_PR, 0 UTER_PR, 0 LUNG_PR, 0 STOMA_CNT, 0 COLON_CNT, 0 LIVER_CNT, 0 BAST_CNT, 0 UTER_CNT, 0 LUNG_CNT, CASE WHEN EXAM_CD = '11001' THEN CNT ELSE 0 END AS HLTH_CNT, CASE WHEN EXAM_CD = '11002' THEN CNT ELSE 0 END AS HLTHS_CNT, CASE WHEN EXAM_CD = '14001' THEN CNT ELSE 0 END AS ORAL_CNT, CASE WHEN EXAM_CD = '31001' THEN CNT ELSE 0 END AS STDT_CNT, CASE WHEN EXAM_CD = '31002' THEN CNT ELSE 0 END AS STDTO_CNT, CASE WHEN EXAM_CD = '31006' THEN CNT ELSE 0 END AS STDT_CNTO, CASE WHEN EXAM_CD = '31007' THEN CNT ELSE 0 END AS STDTO_CNTO, CASE WHEN EXAM_CD = '41001' THEN CNT ELSE 0 END AS SPCL_CNT, CASE WHEN EXAM_CD = '42001' THEN CNT ELSE 0 END AS SPCLS_CNT, CASE WHEN EXAM_CD = '11009' THEN CNT ELSE 0 END AS QSTN_CNT";
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
		sql += " AND EEP_EXAM_SQ = EEA_EXAM_SQ ) C";
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
		<s:AttributeType name='LICEN_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='DR_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HLTH_CNT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HLTH_PR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HLTHS_CNT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HLTHS_PR' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='STOMA_CNT' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='STOMA_PR' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='COLON_CNT' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='COLON_PR' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='LIVER_CNT' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='LIVER_PR' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BAST_CNT' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BAST_PR' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='UTER_CNT' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='UTER_PR' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='LUNG_CNT' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='LUNG_PR' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ORAL_CNT' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ORAL_PR' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='STDT_CNT' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='STDT_PR' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='STDTO_CNT' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='STDTO_PR' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='STDT_CNTO' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='STDT_PRO' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='STDTO_CNTO' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='STDTO_PRO' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SPCL_CNT' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SPCL_PR' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SPCLS_CNT' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SPCLS_PR' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='QSTN_CNT' rs:number='33' rs:nullable='true'>
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

			String LICEN_CD_T = cRsList.getString("LICEN_CD");
			String DR_NM_T = cRsList.getString("DR_NM");
			String HLTH_CNT_T = cRsList.getString("HLTH_CNT");
			String HLTH_PR_T = cRsList.getString("HLTH_PR");
			String HLTHS_CNT_T = cRsList.getString("HLTHS_CNT");
			String HLTHS_PR_T = cRsList.getString("HLTHS_PR");
			String STOMA_CNT_T = cRsList.getString("STOMA_CNT");
			String STOMA_PR_T = cRsList.getString("STOMA_PR");
			String COLON_CNT_T = cRsList.getString("COLON_CNT");
			String COLON_PR_T = cRsList.getString("COLON_PR");
			String LIVER_CNT_T = cRsList.getString("LIVER_CNT");
			String LIVER_PR_T = cRsList.getString("LIVER_PR");
			String BAST_CNT_T = cRsList.getString("BAST_CNT");
			String BAST_PR_T = cRsList.getString("BAST_PR");
			String UTER_CNT_T = cRsList.getString("UTER_CNT");
			String UTER_PR_T = cRsList.getString("UTER_PR");
			String LUNG_CNT_T = cRsList.getString("LUNG_CNT");
			String LUNG_PR_T = cRsList.getString("LUNG_PR");
			String ORAL_CNT_T = cRsList.getString("ORAL_CNT");
			String ORAL_PR_T = cRsList.getString("ORAL_PR");
			String STDT_CNT_T = cRsList.getString("STDT_CNT");
			String STDT_PR_T = cRsList.getString("STDT_PR");
			String STDTO_CNT_T = cRsList.getString("STDTO_CNT");
			String STDTO_PR_T = cRsList.getString("STDTO_PR");
			String STDT_CNTO_T = cRsList.getString("STDT_CNTO");
			String STDT_PRO_T = cRsList.getString("STDT_PRO");
			String STDTO_CNTO_T = cRsList.getString("STDTO_CNTO");
			String STDTO_PRO_T = cRsList.getString("STDTO_PRO");
			String SPCL_CNT_T = cRsList.getString("SPCL_CNT");
			String SPCL_PR_T = cRsList.getString("SPCL_PR");
			String SPCLS_CNT_T = cRsList.getString("SPCLS_CNT");
			String SPCLS_PR_T = cRsList.getString("SPCLS_PR");
			String QSTN_CNT_T = cRsList.getString("QSTN_CNT");
%>
			<z:row
<%
			if(! LICEN_CD_T.equals("")) {
%>
		 		LICEN_CD='<%= LICEN_CD_T%>'
<%
			}

			if(! DR_NM_T.equals("")) {
%>
		 		DR_NM='<%= DR_NM_T%>'
<%
			}

			if(! HLTH_CNT_T.equals("")) {
%>
		 		HLTH_CNT='<%= HLTH_CNT_T%>'
<%
			}

			if(! HLTH_PR_T.equals("")) {
%>
		 		HLTH_PR='<%= HLTH_PR_T%>'
<%
			}

			if(! HLTHS_CNT_T.equals("")) {
%>
		 		HLTHS_CNT='<%= HLTHS_CNT_T%>'
<%
			}

			if(! HLTHS_PR_T.equals("")) {
%>
		 		HLTHS_PR='<%= HLTHS_PR_T%>'
<%
			}

			if(! STOMA_CNT_T.equals("")) {
%>
		 		STOMA_CNT='<%= STOMA_CNT_T%>'
<%
			}

			if(! STOMA_PR_T.equals("")) {
%>
		 		STOMA_PR='<%= STOMA_PR_T%>'
<%
			}

			if(! COLON_CNT_T.equals("")) {
%>
		 		COLON_CNT='<%= COLON_CNT_T%>'
<%
			}

			if(! COLON_PR_T.equals("")) {
%>
		 		COLON_PR='<%= COLON_PR_T%>'
<%
			}

			if(! LIVER_CNT_T.equals("")) {
%>
		 		LIVER_CNT='<%= LIVER_CNT_T%>'
<%
			}

			if(! LIVER_PR_T.equals("")) {
%>
		 		LIVER_PR='<%= LIVER_PR_T%>'
<%
			}

			if(! BAST_CNT_T.equals("")) {
%>
		 		BAST_CNT='<%= BAST_CNT_T%>'
<%
			}

			if(! BAST_PR_T.equals("")) {
%>
		 		BAST_PR='<%= BAST_PR_T%>'
<%
			}

			if(! UTER_CNT_T.equals("")) {
%>
		 		UTER_CNT='<%= UTER_CNT_T%>'
<%
			}

			if(! UTER_PR_T.equals("")) {
%>
		 		UTER_PR='<%= UTER_PR_T%>'
<%
			}

			if(! LUNG_CNT_T.equals("")) {
%>
		 		LUNG_CNT='<%= LUNG_CNT_T%>'
<%
			}

			if(! LUNG_PR_T.equals("")) {
%>
		 		LUNG_PR='<%= LUNG_PR_T%>'
<%
			}

			if(! ORAL_CNT_T.equals("")) {
%>
		 		ORAL_CNT='<%= ORAL_CNT_T%>'
<%
			}

			if(! ORAL_PR_T.equals("")) {
%>
		 		ORAL_PR='<%= ORAL_PR_T%>'
<%
			}

			if(! STDT_CNT_T.equals("")) {
%>
		 		STDT_CNT='<%= STDT_CNT_T%>'
<%
			}

			if(! STDT_PR_T.equals("")) {
%>
		 		STDT_PR='<%= STDT_PR_T%>'
<%
			}

			if(! STDTO_CNT_T.equals("")) {
%>
		 		STDTO_CNT='<%= STDTO_CNT_T%>'
<%
			}

			if(! STDTO_PR_T.equals("")) {
%>
		 		STDTO_PR='<%= STDTO_PR_T%>'
<%
			}

			if(! STDT_CNTO_T.equals("")) {
%>
		 		STDT_CNTO='<%= STDT_CNTO_T%>'
<%
			}

			if(! STDT_PRO_T.equals("")) {
%>
		 		STDT_PRO='<%= STDT_PRO_T%>'
<%
			}

			if(! STDTO_CNTO_T.equals("")) {
%>
		 		STDTO_CNTO='<%= STDTO_CNTO_T%>'
<%
			}

			if(! STDTO_PRO_T.equals("")) {
%>
		 		STDTO_PRO='<%= STDTO_PRO_T%>'
<%
			}

			if(! SPCL_CNT_T.equals("")) {
%>
		 		SPCL_CNT='<%= SPCL_CNT_T%>'
<%
			}

			if(! SPCL_PR_T.equals("")) {
%>
		 		SPCL_PR='<%= SPCL_PR_T%>'
<%
			}

			if(! SPCLS_CNT_T.equals("")) {
%>
		 		SPCLS_CNT='<%= SPCLS_CNT_T%>'
<%
			}

			if(! SPCLS_PR_T.equals("")) {
%>
		 		SPCLS_PR='<%= SPCLS_PR_T%>'
<%
			}

			if(! QSTN_CNT_T.equals("")) {
%>
		 		QSTN_CNT='<%= QSTN_CNT_T%>'
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
