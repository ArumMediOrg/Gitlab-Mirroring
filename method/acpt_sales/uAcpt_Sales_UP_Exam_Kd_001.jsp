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

		String DETAIL_YN = htMethod.get("DETAIL_YN");
		String HDMD_YN = htMethod.get("HDMD_YN");
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");

		//
		if(DETAIL_YN == null) { DETAIL_YN = ""; }
		if(HDMD_YN == null) { HDMD_YN = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT C.EXAM_CD, 
       CASE WHEN C.EXAM_CD = '14001' THEN '구강검진' 
            WHEN C.EXAM_CD = '31001' THEN '학생검진' 
            WHEN C.EXAM_CD = '31005' THEN '학생구강' 
            WHEN C.EXAM_CD = '31007' THEN '학교밖-구강' 
            WHEN C.EXAM_CD = '99999' THEN '추가검사' 
            ELSE F_CODE_FIND('0401', C.EXAM_CD, '5', '1') END || 
       CASE WHEN C.ENTY_CD = '9' THEN CASE WHEN SUBSTR(C.EXAM_CD, 1, 2) = '11' OR SUBSTR(C.EXAM_CD, 1, 2) = '12' THEN 
                                                CASE WHEN :DETAIL_YN = 'Y' THEN '(비대상)' ELSE '' END ELSE '' END           
            ELSE '(' || CASE WHEN C.INSU_CD = '-' THEN CASE WHEN C.ENTY_CD = '3' THEN '의료-' ELSE '직장-' END ELSE C.INSU_CD END || 
                 F_CODE_FIND('0916', C.ENTY_CD, '5', '1') || ')' END || 
       CASE WHEN C.SPCL_CD = '99' THEN '' ELSE '(' || F_CODE_FIND('0910', CASE WHEN C.SPCL_CD = '00' THEN '07' ELSE C.SPCL_CD END, '5', '1') || ')' END ||
       C.PLCE_CD EXAM_NM,
       SUM(C.INSU) INSU, SUM(C.CNT) CNT, SUM(C.EXAM_PR) EXAM_PR
  FROM (SELECT CASE WHEN A.EEA_EXAM_CD = '14002' THEN '14001' 
                    WHEN A.EEA_EXAM_CD = '31001' THEN  CASE WHEN A.EEA_ORAL_YN = '3' THEN '31005' 
                                                            WHEN A.EEA_DIVI_CD = '1' AND A.EEA_DIVI_CS = '1' THEN '31001' 
                                                            WHEN A.EEA_DIVI_CD = '1' AND A.EEA_DIVI_CS = '4' THEN '31001' 
                                                            WHEN A.EEA_DIVI_CD = '2' THEN '31001' 
                                                            WHEN A.EEA_DIVI_CD = '3' THEN '31001' 
                                                            ELSE '31005' END
                    ELSE A.EEA_EXAM_CD END AS EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD,
               CASE WHEN :DETAIL_YN = 'Y' THEN              
                         CASE WHEN (SUBSTR(A.EEA_EXAM_CD, 1, 2) = '11' OR SUBSTR(A.EEA_EXAM_CD, 1, 2) = '12') AND A.EEA_HDMD_YN = 'Y' THEN 
                                    SUBSTR(A.EEA_NHIC_TX, INSTR(NVL(A.EEA_NHIC_TX, ' '), '직역')+5, 2) || '-' ELSE '' END 
                    ELSE '' END INSU_CD, 
               CASE WHEN :DETAIL_YN = 'Y' THEN
                         CASE WHEN (SUBSTR(A.EEA_EXAM_CD, 1, 2) = '11' OR SUBSTR(A.EEA_EXAM_CD, 1, 2) = '12') AND A.EEA_HDMD_YN = 'Y' THEN A.EEA_ENTY_CD ELSE '9' END 
                    ELSE '9' END ENTY_CD, 
               CASE WHEN :DETAIL_YN = 'Y' THEN
                         CASE WHEN (SUBSTR(A.EEA_EXAM_CD, 1, 2) = '11' OR SUBSTR(A.EEA_EXAM_CD, 1, 2) = '12') AND SUBSTR(A.EEA_PLCE_CD, 1, 1) = '2' THEN '-출장' ELSE '' END 
                    ELSE '' END PLCE_CD,
               CASE WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) = '4'  THEN CASE WHEN A.EEA_SPCL_CD = '07' THEN '00' ELSE A.EEA_SPCL_CD END ELSE '99' END SPCL_CD, 
               1 INSU, 1 CNT, 
               CASE WHEN A.EEA_EXAM_CD IN ('11001', '11002', '12001', '12002', '12003', '12004') THEN 
                         CASE WHEN :HDMD_YN = 'N' AND A.EEA_HDMD_YN = 'N' THEN 0 ELSE B.FST_PR - A.EEA_CANR_PR - A.EEA_ORALR_PR END 
                    WHEN A.EEA_EXAM_CD = '13001' THEN B.FST_PR+B.CAN_PR - A.EEA_ORALR_PR 
                    WHEN A.EEA_EXAM_CD IN ('14001', '14002') THEN 
                         CASE WHEN :HDMD_YN = 'N' AND A.EEA_HDMD_YN = 'N' THEN 0 ELSE B.FST_PR - A.EEA_CANR_PR END 
                    WHEN A.EEA_EXAM_CD = '31001' THEN CASE WHEN A.EEA_ORAL_YN = '3' THEN A.EEA_ORALR_PR ELSE A.EEA_COMPR_PR - A.EEA_ORALR_PR END 
                    WHEN A.EEA_EXAM_CD = '31006' THEN A.EEA_HLTHR_PR - A.EEA_ORALR_PR  
                    ELSE B.FST_PR END AS EXAM_PR, 
               EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM 
          FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, 
                       SUM(EEP_FST_PR) FST_PR, SUM(EEP_ADD_PR+EEP_PRGS_PR) ADD_PR, 
                       SUM(CASE WHEN :HDMD_YN = 'N' THEN 0 ELSE EEP_CAN_PR END) CAN_PR 
                  FROM ET_EXAM_PRICE 
                 WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                 GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ 
               ) B, ET_EXAM_ACPT A 
         WHERE A.EEA_EXAM_DT = B.EXAM_DT 
           AND A.EEA_EXAM_SQ = B.EXAM_SQ 
           AND A.EEA_ORDER_YN <> 'C' 
           AND NVL(A.EEA_RECE_NO, ' ') <> 'R' 

        UNION ALL 
        SELECT CASE WHEN A.EEA_HTSB_CD = '14002' THEN '14001' ELSE A.EEA_HTSB_CD END AS EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD,
               CASE WHEN :DETAIL_YN = 'Y' THEN              
                         CASE WHEN (SUBSTR(A.EEA_EXAM_CD, 1, 2) = '11' OR SUBSTR(A.EEA_EXAM_CD, 1, 2) = '12') AND A.EEA_HDMD_YN = 'Y' THEN 
                                    SUBSTR(A.EEA_NHIC_TX, INSTR(NVL(A.EEA_NHIC_TX, ' '), '직역')+5, 2) || '-' ELSE '' END 
                    ELSE '' END INSU_CD, 
               CASE WHEN :DETAIL_YN = 'Y' THEN
                         CASE WHEN (SUBSTR(A.EEA_EXAM_CD, 1, 2) = '11' OR SUBSTR(A.EEA_EXAM_CD, 1, 2) = '12') AND A.EEA_HDMD_YN = 'Y' THEN A.EEA_ENTY_CD ELSE '9' END 
                    ELSE '9' END ENTY_CD, 
               CASE WHEN :DETAIL_YN = 'Y' THEN
                         CASE WHEN (SUBSTR(A.EEA_EXAM_CD, 1, 2) = '11' OR SUBSTR(A.EEA_EXAM_CD, 1, 2) = '12') AND SUBSTR(A.EEA_PLCE_CD, 1, 1) = '2' THEN '-출장' ELSE '' END 
                    ELSE '' END PLCE_CD,                                          
               '99' SPCL_CD, 0 INSU, 1 CNT, 
               CASE WHEN A.EEA_HTSB_CD IN ('11001', '11002', '12001', '12002', '12003', '12004') THEN  
                         CASE WHEN :HDMD_YN = 'N' AND A.EEA_HDMD_YN = 'N' THEN 0 ELSE B.HTSB_PR - A.EEA_CANR_PR - A.EEA_ORALR_PR END 
                    WHEN A.EEA_HTSB_CD = '13001' THEN B.HTSB_PR+B.CAN_PR - A.EEA_ORALR_PR 
                    WHEN A.EEA_HTSB_CD IN ('14001', '14002') THEN 
                         CASE WHEN :HDMD_YN = 'N' AND A.EEA_HDMD_YN = 'N' THEN 0 ELSE B.HTSB_PR - A.EEA_CANR_PR END 
                    ELSE B.HTSB_PR END AS EXAM_PR, 
               EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM 
          FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, 
                       SUM(EEP_HTSB_PR) HTSB_PR, 
                       SUM(CASE WHEN :HDMD_YN = 'N' THEN 0 ELSE EEP_CAN_PR END) CAN_PR 
                  FROM ET_EXAM_PRICE 
                 WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 
                 GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ 
               ) B, ET_EXAM_ACPT A 
         WHERE A.EEA_EXAM_DT = B.EXAM_DT 
           AND A.EEA_EXAM_SQ = B.EXAM_SQ 
           AND A.EEA_HTSB_YN = 'Y' 
           AND A.EEA_ORDER_YN <> 'C' 
           AND NVL(A.EEA_RECE_NO, ' ') <> 'R' 

        UNION ALL
        SELECT '13001' EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD,  
                0 INSU, 1 CNT, A.EEA_CANR_PR+B.CAN_PR EXAM_PR, 
               EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM 
          FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, 
                       SUM(EEP_HTSB_PR) HTSB_PR, 
                       SUM(CASE WHEN :HDMD_YN = 'N' THEN 0 ELSE EEP_CAN_PR END) CAN_PR 
                  FROM ET_EXAM_PRICE 
                 WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 
                 GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ 
               ) B, ET_EXAM_ACPT A 
         WHERE A.EEA_EXAM_DT = B.EXAM_DT 
           AND A.EEA_EXAM_SQ = B.EXAM_SQ 
           AND A.EEA_HTSB_CD LIKE '1%' 
           AND A.EEA_HTSB_CD NOT IN ('13001') 
           AND A.EEA_STOMA_CD || A.EEA_COLON_CD || A.EEA_LIVER_CD || A.EEA_BAST_CD || A.EEA_UTER_CD || NVL(A.EEA_LUNG_CD, '0') <> '000000' 
           AND A.EEA_ORDER_YN <> 'C' 
           AND NVL(A.EEA_RECE_NO, ' ') <> 'R'
            
        UNION ALL
        SELECT '14001' EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD,  
               0 INSU, 1 CNT, CASE WHEN :HDMD_YN = 'N' AND A.EEA_HDMD_YN = 'N' THEN 0 ELSE EEA_ORALR_PR END EXAM_PR, 
               EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM 
          FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, 
                       SUM(EEP_HTSB_PR) HTSB_PR, SUM(EEP_CAN_PR) CAN_PR 
                  FROM ET_EXAM_PRICE 
                 WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 
                 GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ 
               ) B, ET_EXAM_ACPT A 
         WHERE A.EEA_EXAM_DT = B.EXAM_DT 
           AND A.EEA_EXAM_SQ = B.EXAM_SQ 
           AND A.EEA_HTSB_CD LIKE '1%' 
           AND A.EEA_HTSB_CD NOT IN ('14001', '14002') 
           AND A.EEA_ORAL_YN = 'Y' 
           AND A.EEA_ORALR_PR > 0 
           AND A.EEA_ORDER_YN <> 'C' 
           AND NVL(A.EEA_RECE_NO, ' ') <> 'R'
            
        UNION ALL
        SELECT '31005' EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD, 
               0 INSU, 1 CNT, EEA_ORALR_PR EXAM_PR, 
               EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM 
          FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, 
                       SUM(EEP_HTSB_PR) HTSB_PR, SUM(EEP_CAN_PR) CAN_PR 
                  FROM ET_EXAM_PRICE 
                 WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 
                 GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ 
               ) B, ET_EXAM_ACPT A 
         WHERE A.EEA_EXAM_DT = B.EXAM_DT 
           AND A.EEA_EXAM_SQ = B.EXAM_SQ 
           AND A.EEA_EXAM_CD = '31001' 
           AND A.EEA_ORAL_YN = '1'
           AND A.EEA_ORALR_PR > 0 
           AND A.EEA_ORDER_YN <> 'C' 
           AND NVL(A.EEA_RECE_NO, ' ') <> 'R'
            
        UNION ALL
        SELECT '31007' EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD, 
               0 INSU, 1 CNT, EEA_ORALR_PR EXAM_PR, 
               EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM 
          FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, 
                       SUM(EEP_HTSB_PR) HTSB_PR, SUM(EEP_CAN_PR) CAN_PR 
                  FROM ET_EXAM_PRICE 
                 WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 
                 GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ 
               ) B, ET_EXAM_ACPT A 
         WHERE A.EEA_EXAM_DT = B.EXAM_DT 
           AND A.EEA_EXAM_SQ = B.EXAM_SQ 
           AND A.EEA_EXAM_CD = '31006' 
           AND A.EEA_ORAL_YN = 'Y' 
           AND A.EEA_ORALR_PR > 0 
           AND A.EEA_ORDER_YN <> 'C' 
           AND NVL(A.EEA_RECE_NO, ' ') <> 'R' 
           
        UNION ALL 
        SELECT A.EEA_SPSB_CD EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, 
               CASE WHEN A.EEA_SPCL_CD = '07' THEN '00' ELSE A.EEA_SPCL_CD END SPCL_CD, 
               0 INSU, 1 CNT, B.SPSB_PR EXAM_PR, 
               EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM 
          FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_SPSB_PR) SPSB_PR 
                  FROM ET_EXAM_PRICE 
                 WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 
                 GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ 
               ) B, ET_EXAM_ACPT A 
         WHERE A.EEA_EXAM_DT = B.EXAM_DT 
           AND A.EEA_EXAM_SQ = B.EXAM_SQ 
           AND A.EEA_SPSB_YN = 'Y' 
           AND A.EEA_ORDER_YN <> 'C' 
           AND NVL(A.EEA_RECE_NO, ' ') <> 'R'
            
        UNION ALL
        SELECT A.EEA_CVSB_CD EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD,  
               0 INSU, 1 CNT, B.CVSB_PR EXAM_PR, 
               EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM 
          FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_CVSB_PR) CVSB_PR 
                  FROM ET_EXAM_PRICE 
                 WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 
                 GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ 
               ) B, ET_EXAM_ACPT A 
         WHERE A.EEA_EXAM_DT = B.EXAM_DT 
           AND A.EEA_EXAM_SQ = B.EXAM_SQ 
           AND A.EEA_CVSB_YN = 'Y' 
           AND A.EEA_ORDER_YN <> 'C' 
           AND NVL(A.EEA_RECE_NO, ' ') <> 'R'
            
        UNION ALL 
        SELECT A.EEA_EMSB_CD EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD, 
               0 INSU, 1 CNT, B.EMSB_PR EXAM_PR, 
               EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM 
          FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_EMSB_PR) EMSB_PR 
                  FROM ET_EXAM_PRICE 
                 WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 
                 GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ 
               ) B, ET_EXAM_ACPT A 
         WHERE A.EEA_EXAM_DT = B.EXAM_DT 
           AND A.EEA_EXAM_SQ = B.EXAM_SQ 
           AND A.EEA_EMSB_YN = 'Y' 
           AND A.EEA_ORDER_YN <> 'C' 
           AND NVL(A.EEA_RECE_NO, ' ') <> 'R'
            
        UNION ALL 
        SELECT A.EEA_ETSB_CD EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD,  
               0 INSU, 1 CNT, B.ETSB_PR EXAM_PR, 
               EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM 
            FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_ETSB_PR) ETSB_PR 
                    FROM ET_EXAM_PRICE 
                   WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 
                   GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ 
                 ) B, ET_EXAM_ACPT A 
           WHERE A.EEA_EXAM_DT = B.EXAM_DT 
             AND A.EEA_EXAM_SQ = B.EXAM_SQ 
             AND A.EEA_ETSB_YN = 'Y' 
             AND A.EEA_ORDER_YN <> 'C' 
             AND NVL(A.EEA_RECE_NO, ' ') <> 'R'
              
          UNION ALL
          SELECT '99999' EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD, 
                 0 INSU, 1 CNT, B.ADD_PR EXAM_PR, 
                 EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM 
            FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_ADD_PR+EEP_PRGS_PR) ADD_PR 
                    FROM ET_EXAM_PRICE 
                   WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 
                     AND EEP_ADD_PR+EEP_PRGS_PR <> 0 
                   GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ 
                 ) B, ET_EXAM_ACPT A 
           WHERE A.EEA_EXAM_DT = B.EXAM_DT 
             AND A.EEA_EXAM_SQ = B.EXAM_SQ 
             AND A.EEA_EXAM_CD <> '31006' 
             AND A.EEA_ORDER_YN <> 'C' 
             AND NVL(A.EEA_RECE_NO, ' ') <> 'R' 
             AND B.ADD_PR > 0 
       ) C 
 WHERE 1 = 1

 :PARAM_TX1
 :PARAM_TX2

 GROUP BY C.EXAM_CD, C.PLCE_CD, C.ENTY_CD, C.SPCL_CD, CASE WHEN C.INSU_CD = '-' THEN CASE WHEN C.ENTY_CD = '3' THEN '의료-' ELSE '직장-' END ELSE C.INSU_CD END 
 ORDER BY C.EXAM_CD, C.PLCE_CD, C.ENTY_CD, C.SPCL_CD, CASE WHEN C.INSU_CD = '-' THEN CASE WHEN C.ENTY_CD = '3' THEN '의료-' ELSE '직장-' END ELSE C.INSU_CD END 


		*/

		sql = " SELECT C.EXAM_CD, CASE WHEN C.EXAM_CD = '14001' THEN '구강검진' WHEN C.EXAM_CD = '31001' THEN '학생검진' WHEN C.EXAM_CD = '31005' THEN '학생구강' WHEN C.EXAM_CD = '31007' THEN '학교밖-구강' WHEN C.EXAM_CD = '99999' THEN '추가검사' ELSE F_CODE_FIND('0401', C.EXAM_CD, '5', '1') END || CASE WHEN C.ENTY_CD = '9' THEN CASE WHEN SUBSTR(C.EXAM_CD, 1, 2) = '11'";
		sql += " OR SUBSTR(C.EXAM_CD, 1, 2) = '12' THEN CASE WHEN '" + DETAIL_YN + "' = 'Y' THEN '(비대상)' ELSE '' END ELSE '' END ELSE '(' || CASE WHEN C.INSU_CD = '-' THEN CASE WHEN C.ENTY_CD = '3' THEN '의료-' ELSE '직장-' END ELSE C.INSU_CD END || F_CODE_FIND('0916', C.ENTY_CD, '5', '1') || ')' END || CASE WHEN C.SPCL_CD = '99' THEN '' ELSE '(' || F_CODE_FIND('0910', CASE WHEN C.SPCL_CD = '00' THEN '07' ELSE C.SPCL_CD END, '5', '1') || ')' END || C.PLCE_CD EXAM_NM, SUM(C.INSU) INSU, SUM(C.CNT) CNT, SUM(C.EXAM_PR) EXAM_PR";
		sql += " FROM (SELECT CASE WHEN A.EEA_EXAM_CD = '14002' THEN '14001' WHEN A.EEA_EXAM_CD = '31001' THEN CASE WHEN A.EEA_ORAL_YN = '3' THEN '31005' WHEN A.EEA_DIVI_CD = '1'";
		sql += " AND A.EEA_DIVI_CS = '1' THEN '31001' WHEN A.EEA_DIVI_CD = '1'";
		sql += " AND A.EEA_DIVI_CS = '4' THEN '31001' WHEN A.EEA_DIVI_CD = '2' THEN '31001' WHEN A.EEA_DIVI_CD = '3' THEN '31001' ELSE '31005' END ELSE A.EEA_EXAM_CD END AS EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, CASE WHEN '" + DETAIL_YN + "' = 'Y' THEN CASE WHEN (SUBSTR(A.EEA_EXAM_CD, 1, 2) = '11'";
		sql += " OR SUBSTR(A.EEA_EXAM_CD, 1, 2) = '12')";
		sql += " AND A.EEA_HDMD_YN = 'Y' THEN SUBSTR(A.EEA_NHIC_TX, INSTR(NVL(A.EEA_NHIC_TX, ' '), '직역')+5, 2) || '-' ELSE '' END ELSE '' END INSU_CD, CASE WHEN '" + DETAIL_YN + "' = 'Y' THEN CASE WHEN (SUBSTR(A.EEA_EXAM_CD, 1, 2) = '11'";
		sql += " OR SUBSTR(A.EEA_EXAM_CD, 1, 2) = '12')";
		sql += " AND A.EEA_HDMD_YN = 'Y' THEN A.EEA_ENTY_CD ELSE '9' END ELSE '9' END ENTY_CD, CASE WHEN '" + DETAIL_YN + "' = 'Y' THEN CASE WHEN (SUBSTR(A.EEA_EXAM_CD, 1, 2) = '11'";
		sql += " OR SUBSTR(A.EEA_EXAM_CD, 1, 2) = '12')";
		sql += " AND SUBSTR(A.EEA_PLCE_CD, 1, 1) = '2' THEN '-출장' ELSE '' END ELSE '' END PLCE_CD, CASE WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) = '4' THEN CASE WHEN A.EEA_SPCL_CD = '07' THEN '00' ELSE A.EEA_SPCL_CD END ELSE '99' END SPCL_CD, 1 INSU, 1 CNT, CASE WHEN A.EEA_EXAM_CD IN ('11001', '11002', '12001', '12002', '12003', '12004') THEN CASE WHEN '" + HDMD_YN + "' = 'N'";
		sql += " AND A.EEA_HDMD_YN = 'N' THEN 0 ELSE B.FST_PR - A.EEA_CANR_PR - A.EEA_ORALR_PR END WHEN A.EEA_EXAM_CD = '13001' THEN B.FST_PR+B.CAN_PR - A.EEA_ORALR_PR WHEN A.EEA_EXAM_CD IN ('14001', '14002') THEN CASE WHEN '" + HDMD_YN + "' = 'N'";
		sql += " AND A.EEA_HDMD_YN = 'N' THEN 0 ELSE B.FST_PR - A.EEA_CANR_PR END WHEN A.EEA_EXAM_CD = '31001' THEN CASE WHEN A.EEA_ORAL_YN = '3' THEN A.EEA_ORALR_PR ELSE A.EEA_COMPR_PR - A.EEA_ORALR_PR END WHEN A.EEA_EXAM_CD = '31006' THEN A.EEA_HLTHR_PR - A.EEA_ORALR_PR ELSE B.FST_PR END AS EXAM_PR, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_FST_PR) FST_PR, SUM(EEP_ADD_PR+EEP_PRGS_PR) ADD_PR, SUM(CASE WHEN '" + HDMD_YN + "' = 'N' THEN 0 ELSE EEP_CAN_PR END) CAN_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT CASE WHEN A.EEA_HTSB_CD = '14002' THEN '14001' ELSE A.EEA_HTSB_CD END AS EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, CASE WHEN '" + DETAIL_YN + "' = 'Y' THEN CASE WHEN (SUBSTR(A.EEA_EXAM_CD, 1, 2) = '11'";
		sql += " OR SUBSTR(A.EEA_EXAM_CD, 1, 2) = '12')";
		sql += " AND A.EEA_HDMD_YN = 'Y' THEN SUBSTR(A.EEA_NHIC_TX, INSTR(NVL(A.EEA_NHIC_TX, ' '), '직역')+5, 2) || '-' ELSE '' END ELSE '' END INSU_CD, CASE WHEN '" + DETAIL_YN + "' = 'Y' THEN CASE WHEN (SUBSTR(A.EEA_EXAM_CD, 1, 2) = '11'";
		sql += " OR SUBSTR(A.EEA_EXAM_CD, 1, 2) = '12')";
		sql += " AND A.EEA_HDMD_YN = 'Y' THEN A.EEA_ENTY_CD ELSE '9' END ELSE '9' END ENTY_CD, CASE WHEN '" + DETAIL_YN + "' = 'Y' THEN CASE WHEN (SUBSTR(A.EEA_EXAM_CD, 1, 2) = '11'";
		sql += " OR SUBSTR(A.EEA_EXAM_CD, 1, 2) = '12')";
		sql += " AND SUBSTR(A.EEA_PLCE_CD, 1, 1) = '2' THEN '-출장' ELSE '' END ELSE '' END PLCE_CD, '99' SPCL_CD, 0 INSU, 1 CNT, CASE WHEN A.EEA_HTSB_CD IN ('11001', '11002', '12001', '12002', '12003', '12004') THEN CASE WHEN '" + HDMD_YN + "' = 'N'";
		sql += " AND A.EEA_HDMD_YN = 'N' THEN 0 ELSE B.HTSB_PR - A.EEA_CANR_PR - A.EEA_ORALR_PR END WHEN A.EEA_HTSB_CD = '13001' THEN B.HTSB_PR+B.CAN_PR - A.EEA_ORALR_PR WHEN A.EEA_HTSB_CD IN ('14001', '14002') THEN CASE WHEN '" + HDMD_YN + "' = 'N'";
		sql += " AND A.EEA_HDMD_YN = 'N' THEN 0 ELSE B.HTSB_PR - A.EEA_CANR_PR END ELSE B.HTSB_PR END AS EXAM_PR, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_HTSB_PR) HTSB_PR, SUM(CASE WHEN '" + HDMD_YN + "' = 'N' THEN 0 ELSE EEP_CAN_PR END) CAN_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_HTSB_YN = 'Y'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT '13001' EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD, 0 INSU, 1 CNT, A.EEA_CANR_PR+B.CAN_PR EXAM_PR, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_HTSB_PR) HTSB_PR, SUM(CASE WHEN '" + HDMD_YN + "' = 'N' THEN 0 ELSE EEP_CAN_PR END) CAN_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_HTSB_CD LIKE '1%'";
		sql += " AND A.EEA_HTSB_CD NOT IN ('13001')";
		sql += " AND A.EEA_STOMA_CD || A.EEA_COLON_CD || A.EEA_LIVER_CD || A.EEA_BAST_CD || A.EEA_UTER_CD || NVL(A.EEA_LUNG_CD, '0') <> '000000'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT '14001' EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD, 0 INSU, 1 CNT, CASE WHEN '" + HDMD_YN + "' = 'N'";
		sql += " AND A.EEA_HDMD_YN = 'N' THEN 0 ELSE EEA_ORALR_PR END EXAM_PR, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_HTSB_PR) HTSB_PR, SUM(EEP_CAN_PR) CAN_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_HTSB_CD LIKE '1%'";
		sql += " AND A.EEA_HTSB_CD NOT IN ('14001', '14002')";
		sql += " AND A.EEA_ORAL_YN = 'Y'";
		sql += " AND A.EEA_ORALR_PR > 0";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT '31005' EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD, 0 INSU, 1 CNT, EEA_ORALR_PR EXAM_PR, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_HTSB_PR) HTSB_PR, SUM(EEP_CAN_PR) CAN_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_EXAM_CD = '31001'";
		sql += " AND A.EEA_ORAL_YN = '1'";
		sql += " AND A.EEA_ORALR_PR > 0";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT '31007' EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD, 0 INSU, 1 CNT, EEA_ORALR_PR EXAM_PR, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_HTSB_PR) HTSB_PR, SUM(EEP_CAN_PR) CAN_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_EXAM_CD = '31006'";
		sql += " AND A.EEA_ORAL_YN = 'Y'";
		sql += " AND A.EEA_ORALR_PR > 0";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT A.EEA_SPSB_CD EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, CASE WHEN A.EEA_SPCL_CD = '07' THEN '00' ELSE A.EEA_SPCL_CD END SPCL_CD, 0 INSU, 1 CNT, B.SPSB_PR EXAM_PR, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_SPSB_PR) SPSB_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_SPSB_YN = 'Y'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT A.EEA_CVSB_CD EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD, 0 INSU, 1 CNT, B.CVSB_PR EXAM_PR, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_CVSB_PR) CVSB_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_CVSB_YN = 'Y'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT A.EEA_EMSB_CD EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD, 0 INSU, 1 CNT, B.EMSB_PR EXAM_PR, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_EMSB_PR) EMSB_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_EMSB_YN = 'Y'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT A.EEA_ETSB_CD EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD, 0 INSU, 1 CNT, B.ETSB_PR EXAM_PR, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_ETSB_PR) ETSB_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_ETSB_YN = 'Y'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R'";
		sql += " UNION";
		sql += " ALL SELECT '99999' EXAM_CD, A.EEA_PLCE_CD, A.EEA_COMP_CD, '' INSU_CD, '9' ENTY_CD, '' PLCE_CD, '99' SPCL_CD, 0 INSU, 1 CNT, B.ADD_PR EXAM_PR, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, SUM(EEP_ADD_PR+EEP_PRGS_PR) ADD_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEP_ADD_PR+EEP_PRGS_PR <> 0";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_EXAM_CD <> '31006'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R'";
		sql += " AND B.ADD_PR > 0 ) C";
		sql += " WHERE 1 = 1";
		sql += PARAM_TX1;
		sql += PARAM_TX2;
		sql += " GROUP BY C.EXAM_CD, C.PLCE_CD, C.ENTY_CD, C.SPCL_CD, CASE WHEN C.INSU_CD = '-' THEN CASE WHEN C.ENTY_CD = '3' THEN '의료-' ELSE '직장-' END ELSE C.INSU_CD END";
		sql += " ORDER BY C.EXAM_CD, C.PLCE_CD, C.ENTY_CD, C.SPCL_CD, CASE WHEN C.INSU_CD = '-' THEN CASE WHEN C.ENTY_CD = '3' THEN '의료-' ELSE '직장-' END ELSE C.INSU_CD END";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_Sales_UP_Exam_Kd_001 \n";
			G_INFO += "설명 : 검진유형별 현황 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DETAIL_YN : " + DETAIL_YN + " \n";
			G_INFO += " HDMD_YN : " + HDMD_YN + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
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
		<s:AttributeType name='EXAM_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='INSU' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CNT' rs:number='4' rs:nullable='true'>
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

			String EXAM_CD_T = cRsList.getString("EXAM_CD");
			String EXAM_NM_T = cRsList.getString("EXAM_NM");
			String INSU_T = cRsList.getString("INSU");
			String CNT_T = cRsList.getString("CNT");
			String EXAM_PR_T = cRsList.getString("EXAM_PR");
%>
			<z:row
<%
			if(! EXAM_CD_T.equals("")) {
%>
		 		EXAM_CD='<%= EXAM_CD_T%>'
<%
			}

			if(! EXAM_NM_T.equals("")) {
%>
		 		EXAM_NM='<%= EXAM_NM_T%>'
<%
			}

			if(! INSU_T.equals("")) {
%>
		 		INSU='<%= INSU_T%>'
<%
			}

			if(! CNT_T.equals("")) {
%>
		 		CNT='<%= CNT_T%>'
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
