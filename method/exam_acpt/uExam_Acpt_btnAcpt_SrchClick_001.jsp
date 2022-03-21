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

		String JUMIN_YN = htMethod.get("JUMIN_YN");
		String ENCRT_KD = htMethod.get("ENCRT_KD");
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String CHART_NO = htMethod.get("CHART_NO");
		String COMP_CD = htMethod.get("COMP_CD");
		String COMP_NM = htMethod.get("COMP_NM");
		String PLCE_CD = htMethod.get("PLCE_CD");
		String SPCL_CD = htMethod.get("SPCL_CD");
		String FAMY_CD = htMethod.get("FAMY_CD");
		String INPT_ID = htMethod.get("INPT_ID");
		String PSNL_ID = htMethod.get("PSNL_ID");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String SEX_CD = htMethod.get("SEX_CD");
		String DEPT_CD = htMethod.get("DEPT_CD");
		String DEPTA_NM = htMethod.get("DEPTA_NM");
		String DEPT_NM = htMethod.get("DEPT_NM");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");

		//
		if(JUMIN_YN == null) { JUMIN_YN = ""; }
		if(ENCRT_KD == null) { ENCRT_KD = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(CHART_NO == null) { CHART_NO = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(COMP_NM == null) { COMP_NM = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(SPCL_CD == null) { SPCL_CD = ""; }
		if(FAMY_CD == null) { FAMY_CD = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(PSNL_ID == null) { PSNL_ID = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }
		if(DEPTA_NM == null) { DEPTA_NM = ""; }
		if(DEPT_NM == null) { DEPT_NM = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

IF (:JUMIN_YN = 'Y') THEN
BEGIN
  IF (:ENCRT_KD = '1') THEN
    SELECT B.ICR_PID_EN  AS EEA_PSNL_ID,
  ELSE IF (:ENCRT_KD = '2') THEN
    SELECT ECHELONDB.ECL_DECRYPT(B.ICR_PID_EN) AS EEA_PSNL_ID,
  ELSE
    SELECT B.ICR_PENL_ID AS EEA_PSNL_ID,
END
ELSE
  SELECT F_PID(B.ICR_PENL_ID) EEA_PSNL_ID, 
        NVL((SELECT '1' FROM ET_PSNL_MEMO WHERE EPM_CUST_NO = A.EEA_CUST_NO AND ROWNUM = 1), '0') EPM_MEMO_SQ,

        (SELECT F_USER_FIND(EEP_INPT_ID) || '|' || TO_CHAR(EEP_INPT_DTT, 'YYYY-MM-DD AM HH:MI:SS')
          FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ, EEP_INPT_ID, EEP_INPT_DTT
                     FROM ET_EXAM_PRICE
                   WHERE EEP_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
                    ORDER BY EEP_EXAM_DT, EEP_EXAM_SQ, EEP_ORDER_SQ)
        WHERE EEP_EXAM_DT = A.EEA_EXAM_DT
          AND EEP_EXAM_SQ = A.EEA_EXAM_SQ
          AND ROWNUM = 1) EEP_MODI_NM,

        A.*,

        A.EEA_EXAM_LT || A.EEA_ORDER_LT EEA_ITEM_LT, F_TEL_FORMAT(A.EEA_MOBL_NO) EEA_MOBL_NO2, 

        CASE WHEN A.EEA_RSLT_CD = '0' THEN '대기'
             WHEN A.EEA_RSLT_CD = '1' THEN '입력중'
             ELSE '완료' END AS EEA_RSLT_NM,

        CASE WHEN A.EEA_PSNLR_PR > 0 THEN
              CASE WHEN A.EEA_RECE_KD = '0' THEN 'Ｘ'
                     WHEN A.EEA_RECE_KD = '1' THEN '◑' ELSE '○' END
             ELSE '' END AS EEA_RECE_NM,

        CASE WHEN SUBSTR(A.EEA_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(A.EEA_EXAM_LT, '')
             WHEN SUBSTR(A.EEA_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(A.EEA_EXAM_LT, A.EEA_COMP_CD)
             ELSE CASE WHEN A.EEA_RECE_NO = 'R' THEN '이관-'||F_CODE_FIND('0401', SUBSTR(A.EEA_EXAM_CD, 1, 2)||'000', '', '1')
                       ELSE F_CODE_FIND('0401', A.EEA_EXAM_CD, '', '1') END END AS EEA_EXAM_NM,

        CASE WHEN A.EEA_HTSB_YN = 'Y' THEN F_CODE_FIND('0401', A.EEA_HTSB_CD, '', '1') ELSE '' END EEA_HTSB_NM,
        CASE WHEN A.EEA_SPSB_YN = 'Y' THEN F_CODE_FIND('0401', A.EEA_SPSB_CD, '', '1') ELSE '' END EEA_SPCL_NM,
        CASE WHEN A.EEA_EMSB_YN = 'Y' THEN '채용검진' ELSE '' END EEA_EMSB_NM,
        CASE WHEN A.EEA_CVSB_YN = 'Y' THEN '뇌심혈관' ELSE '' END EEA_CVSB_NM,
        CASE WHEN A.EEA_ETSB_YN = 'Y' THEN '기타검진' ELSE '' END EEA_ETSB_NM,
        CASE WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) = '4' OR A.EEA_SPSB_YN = 'Y' THEN F_CODE_FIND('0910', A.EEA_SPCL_CD, '', '1') ELSE '' END EEA_BACH_NM,
        CASE WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) = '4' OR SUBSTR(A.EEA_SPSB_CD, 1, 1) = '4'
                  THEN F_CODE_FIND('0910', A.EEA_SPCL_CD, '', '1') || '/' || F_CODE_FIND('0911', A.EEA_SPHT_CD, '', '1') ELSE '' END AS SPCL_NM,

        F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, 

        F_USER_FIND(A.EEA_INPT_ID) EEA_INPT_NM, F_USER_FIND(A.EEA_MODI_ID) EEA_MODI_NM, 

        CASE WHEN NVL(RTRIM(A.EEA_RFID_NO), ' ') = ' ' THEN '' ELSE F_LPAD(RTRIM(A.EEA_RFID_NO), 4, '0') END EEA_RFID_NO2,
        CASE WHEN A.EEA_DIVI_CD = '9' THEN '' ELSE F_CODE_FIND('0810', A.EEA_DIVI_CD, '', '1') END AS EEA_DIVI_NM,

        CASE WHEN NVL(A.EEA_STOMA_CD, ' ') = ' ' OR NVL(A.EEA_STOMA_CD, '0') = '0' THEN '' ELSE '위-' || A.EEA_STOMA_CD || '/' END ||
        CASE WHEN NVL(A.EEA_COLON_CD, ' ') = ' ' OR NVL(A.EEA_COLON_CD, '0') = '0' THEN '' ELSE '대-' || A.EEA_COLON_CD || '/' END ||
        CASE WHEN NVL(A.EEA_LIVER_CD, ' ') = ' ' OR NVL(A.EEA_LIVER_CD, '0') = '0' THEN '' ELSE '간-' || A.EEA_LIVER_CD || '/' END ||
        CASE WHEN NVL(A.EEA_BAST_CD,  ' ') = ' ' OR NVL(A.EEA_BAST_CD,  '0') = '0' THEN '' ELSE '유-' || A.EEA_BAST_CD  || '/' END ||
        CASE WHEN NVL(A.EEA_UTER_CD,  ' ') = ' ' OR NVL(A.EEA_UTER_CD,  '0') = '0' THEN '' ELSE '자-' || A.EEA_UTER_CD  || '/' END ||
        CASE WHEN NVL(A.EEA_LUNG_CD,  ' ') = ' ' OR NVL(A.EEA_LUNG_CD,  '0') = '0' THEN '' ELSE '폐-' || A.EEA_LUNG_CD  || '/' END EEA_CAN_LT,

        C.PFP_TRANC_DATE, D.EDP_TOBO_DT, E.SBE_TOBO_DT

   FROM ET_EXAM_ACPT A
        LEFT OUTER JOIN IT_CUSTOMER B
          ON B.ICR_CUST_NO = A.EEA_CUST_NO

        LEFT OUTER JOIN PT_FIR_PANJUNG C
          ON C.PFP_EXAM_DT = A.EEA_EXAM_DT
         AND C.PFP_EXAM_SQ = A.EEA_EXAM_SQ

        LEFT OUTER JOIN ET_DENTAL_PANJ D
          ON D.EDP_EXAM_DT = A.EEA_EXAM_DT
         AND D.EDP_EXAM_SQ = A.EEA_EXAM_SQ

        LEFT OUTER JOIN ST_BASE E
          ON E.SBE_EXAM_DT  = A.EEA_EXAM_DT
         AND E.SBE_EXAM_SQ  = A.EEA_EXAM_SQ
         AND E.SBE_EXAM_CHA = CASE WHEN A.EEA_EXAM_CD = '42001' THEN '2' ELSE '1' END

 WHERE A.EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
   AND SUBSTR(A.EEA_EXAM_CD, 1, 2) <> '31'
   AND A.EEA_ORDER_YN <> 'C';

IF (:CHART_NO <> '') THEN
  AND A.EEA_CHART_NO LIKE '%'||:CHART_NO||'%';

IF (:COMP_CD <> '') THEN
  AND A.EEA_COMP_CD = :COMP_CD
ELSE IF (:COMP_NM <> '') THEN
  AND F_COMP_FIND(A.EEA_COMP_CD) LIKE '%'||:COMP_NM||'%';

IF (:PLCE_CD <> '') THEN
  AND A.EEA_PLCE_CD = :PLCE_CD;

IF (:SPCL_CD <> '') THEN
  AND A.EEA_SPCL_CD = :SPCL_CD;

IF (:FAMY_CD <> '') THEN
BEGIN
  IF (:FAMY_CD = '0O') THEN
    AND CASE WHEN NVL(A.EEA_FAMY_CD, ' ') = ' ' THEN '01' ELSE A.EEA_FAMY_CD END <> '01'
  ELSE
    AND CASE WHEN NVL(A.EEA_FAMY_CD, ' ') = ' ' THEN '01' ELSE A.EEA_FAMY_CD END = :FAMY_CD
END;

IF (:INPT_ID <> '') THEN
  AND A.EEA_INPT_ID = :INPT_ID;

IF (:PSNL_ID <> '') THEN
BEGIN
  IF (LENGTH(:PSNL_ID) >= 13) THEN
  BEGIN
    IF (:ENCRT_KD = '1') THEN
      AND B.ICR_PID_EN  = :PSNL_ID
    ELSE IF (:ENCRT_KD = '2') THEN
      AND B.ICR_PID_EN  = ECHELONDB.ECL_ENCRYPT(:PSNL_ID)
    ELSE
      AND B.ICR_PENL_ID = :PSNL_ID
  END
  ELSE
      AND B.ICR_PENL_ID LIKE :PSNL_ID||'%'
END;

IF (:PSNL_NM <> '') THEN
   AND A.EEA_PSNL_NM LIKE '%'||:PSNL_NM||'%';

IF (:SEX_CD <> '') THEN
   AND A.EEA_SEX_CD = :SEX_CD;

IF (:DEPT_CD <> '') THEN
   AND A.EEA_DEPT_CD = :DEPT_CD
ELSE IF (:DEPT_NM <> '') THEN  -- DEPTA_NM >> DEPT_NM 로 수정함 2020-05-28
   AND A.EEA_DEPT_NM LIKE '%'||:DEPT_NM||'%';

:PARAM_TX1                -- 해당 변수는 where이나 and등이 들어 있는 조건입니다.(복잡한)
:PARAM_TX2

-- 오라클에서 오류(A.EEA_EXAM_SQ invalid identifier) 발생으로 위 파란색 같이 수정...
        (SELECT F_USER_FIND(EEP_INPT_ID) || '|' || TO_CHAR(EEP_INPT_DTT, 'YYYY-MM-DD AM HH:MI:SS')
          FROM (SELECT EEP_INPT_ID, EEP_INPT_DTT
                     FROM ET_EXAM_PRICE
                   WHERE EEP_EXAM_DT = A.EEA_EXAM_DT
                       AND EEP_EXAM_SQ = A.EEA_EXAM_SQ
                    ORDER BY EEP_ORDER_SQ DESC)
        WHERE ROWNUM = 1) EEP_MODI_NM, 

                                                            

		*/

		if(JUMIN_YN.equals("Y")) {

			if(ENCRT_KD.equals("1")) {
				sql = " SELECT B.ICR_PID_EN AS EEA_PSNL_ID,";
			} else if(ENCRT_KD.equals("2")) {
				sql = " SELECT ECL_DECRYPT(B.ICR_PID_EN) AS EEA_PSNL_ID,";
			} else {
				sql = " SELECT B.ICR_PENL_ID AS EEA_PSNL_ID,";
			}
		} else {
			sql = " SELECT F_PID(B.ICR_PENL_ID) EEA_PSNL_ID,";
		}

		sql += " NVL((SELECT '1' FROM ET_PSNL_MEMO WHERE EPM_CUST_NO = A.EEA_CUST_NO AND ROWNUM = 1), '0') EPM_MEMO_SQ";

		sql += ", (SELECT F_USER_FIND(EEP_INPT_ID) || '|' || TO_CHAR(EEP_INPT_DTT, 'YYYY-MM-DD AM HH:MI:SS')";
		sql += " FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ, EEP_INPT_ID, EEP_INPT_DTT FROM ET_EXAM_PRICE WHERE EEP_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ORDER BY EEP_EXAM_DT, EEP_EXAM_SQ, EEP_ORDER_SQ)";
		sql += " WHERE EEP_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND EEP_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " AND ROWNUM = 1";
		sql += " ) EEP_MODI_NM";

		sql += ", A.*";
		sql += ", A.EEA_EXAM_LT || A.EEA_ORDER_LT EEA_ITEM_LT, F_TEL_FORMAT(A.EEA_MOBL_NO) EEA_MOBL_NO2";
		sql += ", CASE WHEN A.EEA_RSLT_CD = '0' THEN '대기' WHEN A.EEA_RSLT_CD = '1' THEN '입력중' ELSE '완료' END AS EEA_RSLT_NM";
		sql += ", CASE WHEN A.EEA_PSNLR_PR > 0 THEN CASE WHEN A.EEA_RECE_KD = '0' THEN 'Ｘ' WHEN A.EEA_RECE_KD = '1' THEN '◑' ELSE '○' END ELSE '' END AS EEA_RECE_NM";

		sql += ", CASE WHEN SUBSTR(A.EEA_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(A.EEA_EXAM_LT, '')";
		sql += "	WHEN SUBSTR(A.EEA_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(A.EEA_EXAM_LT, A.EEA_COMP_CD)";
		sql += "	ELSE CASE WHEN A.EEA_RECE_NO = 'R' THEN '이관-'||F_CODE_FIND('0401', SUBSTR(A.EEA_EXAM_CD, 1, 2)||'000', '', '1') ELSE F_CODE_FIND('0401', A.EEA_EXAM_CD, '', '1') END";
		sql += "  END AS EEA_EXAM_NM";
		
		sql += ", CASE WHEN A.EEA_HTSB_YN = 'Y' THEN F_CODE_FIND('0401', A.EEA_HTSB_CD, '', '1') ELSE '' END EEA_HTSB_NM";
		sql += ", CASE WHEN A.EEA_SPSB_YN = 'Y' THEN F_CODE_FIND('0401', A.EEA_SPSB_CD, '', '1') ELSE '' END EEA_SPCL_NM";
		sql += ", CASE WHEN A.EEA_EMSB_YN = 'Y' THEN '채용검진' ELSE '' END EEA_EMSB_NM";
		sql += ", CASE WHEN A.EEA_CVSB_YN = 'Y' THEN '뇌심혈관' ELSE '' END EEA_CVSB_NM";
		sql += ", CASE WHEN A.EEA_ETSB_YN = 'Y' THEN '기타검진' ELSE '' END EEA_ETSB_NM";
		sql += ", CASE WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) = '4' OR A.EEA_SPSB_YN = 'Y' THEN F_CODE_FIND('0910', A.EEA_SPCL_CD, '', '1') ELSE '' END EEA_BACH_NM";
		sql += ", CASE WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) = '4' OR SUBSTR(A.EEA_SPSB_CD, 1, 1) = '4' THEN F_CODE_FIND('0910', A.EEA_SPCL_CD, '', '1') || '/' || F_CODE_FIND('0911', A.EEA_SPHT_CD, '', '1') ELSE '' END AS SPCL_NM";
		sql += ", F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, F_USER_FIND(A.EEA_INPT_ID) EEA_INPT_NM, F_USER_FIND(A.EEA_MODI_ID) EEA_MODI_NM";
		sql += ", CASE WHEN NVL(RTRIM(A.EEA_RFID_NO), ' ') = ' ' THEN '' ELSE F_LPAD(RTRIM(A.EEA_RFID_NO), 4, '0') END EEA_RFID_NO2";
		sql += ", CASE WHEN A.EEA_DIVI_CD = '9' THEN '' ELSE F_CODE_FIND('0810', A.EEA_DIVI_CD, '', '1') END AS EEA_DIVI_NM";

		sql += ", CASE WHEN NVL(A.EEA_STOMA_CD, ' ') = ' ' OR NVL(A.EEA_STOMA_CD, '0') = '0' THEN '' ELSE '위-' || A.EEA_STOMA_CD || '/' END";
		sql += "	|| CASE WHEN NVL(A.EEA_COLON_CD, ' ') = ' ' OR NVL(A.EEA_COLON_CD, '0') = '0' THEN '' ELSE '대-' || A.EEA_COLON_CD || '/' END";
		sql += "	|| CASE WHEN NVL(A.EEA_LIVER_CD, ' ') = ' ' OR NVL(A.EEA_LIVER_CD, '0') = '0' THEN '' ELSE '간-' || A.EEA_LIVER_CD || '/' END";
		sql += "	|| CASE WHEN NVL(A.EEA_BAST_CD, ' ') = ' ' OR NVL(A.EEA_BAST_CD, '0') = '0' THEN '' ELSE '유-' || A.EEA_BAST_CD || '/' END";
		sql += "	|| CASE WHEN NVL(A.EEA_UTER_CD, ' ') = ' ' OR NVL(A.EEA_UTER_CD, '0') = '0' THEN '' ELSE '자-' || A.EEA_UTER_CD || '/' END";
		sql += "	|| CASE WHEN NVL(A.EEA_LUNG_CD, ' ') = ' ' OR NVL(A.EEA_LUNG_CD, '0') = '0' THEN '' ELSE '폐-' || A.EEA_LUNG_CD || '/' END";
		sql += " EEA_CAN_LT";
		
		sql += ", C.PFP_TRANC_DATE, D.EDP_TOBO_DT, E.SBE_TOBO_DT";

		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.EEA_CUST_NO";
		
		sql += " LEFT OUTER JOIN PT_FIR_PANJUNG C";
		sql += " ON C.PFP_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND C.PFP_EXAM_SQ = A.EEA_EXAM_SQ";
		
		sql += " LEFT OUTER JOIN ET_DENTAL_PANJ D";
		sql += " ON D.EDP_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND D.EDP_EXAM_SQ = A.EEA_EXAM_SQ";
		
		sql += " LEFT OUTER JOIN ST_BASE E";
		sql += " ON E.SBE_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND E.SBE_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " AND E.SBE_EXAM_CHA = CASE WHEN A.EEA_EXAM_CD = '42001' THEN '2' ELSE '1' END";

		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";
		sql += " AND SUBSTR(A.EEA_EXAM_CD, 1, 2) <> '31'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(! CHART_NO.equals("")) {
			sql += " AND A.EEA_CHART_NO LIKE '%" + CHART_NO + "%'";
		}

		if(! COMP_CD.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		} else if(! COMP_NM.equals("")) {
			sql += " AND F_COMP_FIND(A.EEA_COMP_CD) LIKE '%" + COMP_NM + "%'";
		}
		if(! PLCE_CD.equals("")) {
			sql += " AND A.EEA_PLCE_CD = '" + PLCE_CD + "'";
		}

		if(! SPCL_CD.equals("")) {
			sql += " AND A.EEA_SPCL_CD = '" + SPCL_CD + "'";
		}

		if(! FAMY_CD.equals("")) {

			if(FAMY_CD.equals("0O")) {
				sql += " AND CASE WHEN NVL(A.EEA_FAMY_CD, ' ') = ' ' THEN '01' ELSE A.EEA_FAMY_CD END <> '01'";
			} else {
				sql += " AND CASE WHEN NVL(A.EEA_FAMY_CD, ' ') = ' ' THEN '01' ELSE A.EEA_FAMY_CD END = '" + FAMY_CD + "'";
			}
		}

		if(! INPT_ID.equals("")) {
			sql += " AND A.EEA_INPT_ID = '" + INPT_ID + "'";
		}

		if(! PSNL_ID.equals("")) {

			if(PSNL_ID.length() >= 13) {
			
				if(ENCRT_KD.equals("1")) {
					sql += " AND B.ICR_PID_EN = '" + PSNL_ID + "'";
				} else if(ENCRT_KD.equals("2")) {
					sql += " AND B.ICR_PID_EN = ECL_ENCRYPT('" + PSNL_ID + "')";
				} else {
					sql += " AND B.ICR_PENL_ID = '" + PSNL_ID + "'";
				}
			} else {
				sql += " AND B.ICR_PENL_ID LIKE '" + PSNL_ID + "%'";
			}
		}

		if(! PSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%" + PSNL_NM + "%'";
		}

		if(! SEX_CD.equals("")) {
			sql += " AND A.EEA_SEX_CD = '" + SEX_CD + "'";
		}

		if(! DEPT_CD.equals("")) {
			sql += " AND A.EEA_DEPT_CD = '" + DEPT_CD + "'";
		} else if(! DEPT_NM.equals("")) {
			sql += " AND A.EEA_DEPT_NM LIKE '%" + DEPT_NM + "%'";
		}

		sql += PARAM_TX1;
		sql += PARAM_TX2;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_btnAcpt_SrchClick_001 \n";
			G_INFO += "설명 : 접수 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " JUMIN_YN : " + JUMIN_YN + " \n";
			G_INFO += " ENCRT_KD : " + ENCRT_KD + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " CHART_NO : " + CHART_NO + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " COMP_NM : " + COMP_NM + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
			G_INFO += " SPCL_CD : " + SPCL_CD + " \n";
			G_INFO += " FAMY_CD : " + FAMY_CD + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " PSNL_ID : " + PSNL_ID + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
			G_INFO += " DEPTA_NM : " + DEPTA_NM + " \n";
			G_INFO += " DEPT_NM : " + DEPT_NM + " \n";
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
		<s:AttributeType name='EEA_PSNL_ID' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MEMO_SQ' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_MODI_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='5' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_TM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_TM'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSVN_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RSVN_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_CD' rs:number='8' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_ACPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_KD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='10' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='11' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MMBR_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MMBR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='14' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_SQ' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_AR' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ROAD_AR' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BLDG_NO' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BLDG_NO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEL_NO' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMAIL_AR' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_CD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEND_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_DT' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEND_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SMS_YN' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SMS_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COTK_CD' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COTK_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_NOTE_YN' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_NOTE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_CD' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CD' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENTRY_DT' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENTRY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CS' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_CS'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CLSS_KD' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CLSS_KD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_CD' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FAMY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_NM' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FAMY_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RFID_NO' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RFID_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FOOD_YN' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FOOD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SALES_ID' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SALES_ID'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='43' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_CD' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_CD' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_CD' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_CD' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_CD' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_YN' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_YN' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_YN' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_YN' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_YN' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTPR_CD' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPPR_CD' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVPR_CD' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMPR_CD' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETPR_CD' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNCL_CD' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_YR' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_HTYR' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_HTYR'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_SPYM' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_SPYM'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_LT' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EXAM_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_LT' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_LT' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_LT' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_LT' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_LT' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADD_LT' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ADD_LT'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='70' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORDER_LT' rs:number='71' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORDER_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='72' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPHT_CD' rs:number='73' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPHT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_NO' rs:number='74' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INSU_NO'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_CD' rs:number='75' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INSU_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENTY_CD' rs:number='76' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENTY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ASSO_CD' rs:number='77' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ASSO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNTR_CD' rs:number='78' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNTR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ARMY_CD' rs:number='79' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ARMY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HEPA_YN' rs:number='80' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HEPA_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_YN' rs:number='81' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANAD_YN' rs:number='82' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANAD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HOLIDAY_YN' rs:number='83' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HOLIDAY_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_CD' rs:number='84' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_STOMA_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_CD' rs:number='85' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COLON_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_CD' rs:number='86' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIVER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_CD' rs:number='87' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BAST_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_CD' rs:number='88' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UTER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_DR' rs:number='89' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_STOMA_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_DR' rs:number='90' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COLON_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_DR' rs:number='91' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIVER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_DR' rs:number='92' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BAST_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_DR' rs:number='93' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UTER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNCR_DT' rs:number='94' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNCR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HDMD_YN' rs:number='95' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SDMD_YN' rs:number='96' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPRT_PR' rs:number='97' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPRT_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_PR' rs:number='98' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_PR' rs:number='99' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTH_PR' rs:number='100' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTH_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_PR' rs:number='101' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CAN_PR' rs:number='102' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CAN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_PR' rs:number='103' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORAL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMPR_PR' rs:number='104' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMPR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNLR_PR' rs:number='105' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNLR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTHR_PR' rs:number='106' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTHR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCLR_PR' rs:number='107' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCLR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANR_PR' rs:number='108' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORALR_PR' rs:number='109' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORALR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PYER_CD' rs:number='110' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PYER_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CMPY_CD' rs:number='111' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CMPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PRPY_CD' rs:number='112' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PRPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RECE_NO' rs:number='113' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RECE_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RECE_KD' rs:number='114' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RECE_KD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSLT_CD' rs:number='115' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_RSLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BLRT_CD' rs:number='116' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_BLRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEFER_KD' rs:number='117' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEFER_KD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORDER_YN' rs:number='118' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORDER_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_NHIC_TX' rs:number='119' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_NHIC_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_TX' rs:number='120' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INPT_ID' rs:number='121' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INPT_DTT' rs:number='122' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MODI_ID' rs:number='123' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MODI_DTT' rs:number='124' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANAD_KD' rs:number='125' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANAD_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_2ND_YN' rs:number='126' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_2ND_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD2' rs:number='127' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD2'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIFE_YN' rs:number='128' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIFE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TOTAL_YN' rs:number='129' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_TOTAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_OCS_DR' rs:number='130' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_OCS_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HCV_YN' rs:number='131' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HCV_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_OCS_DV' rs:number='132' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_OCS_DV'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_OCS_NO' rs:number='133' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_OCS_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LABEL_DT' rs:number='134' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LABEL_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXEC_ID' rs:number='135' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EXEC_ID'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SELF_KD' rs:number='136' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SELF_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANPR_KD' rs:number='137' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANPR_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTH_KD' rs:number='138' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SAFE_YN' rs:number='139' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SAFE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADD_DT' rs:number='140' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ADD_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENDO_DR' rs:number='141' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENDO_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PDF_KD' rs:number='142' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PDF_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_CD' rs:number='143' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LUNG_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_DR' rs:number='144' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LUNG_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_KD' rs:number='145' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LUNG_KD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UBEH_YN' rs:number='146' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UBEH_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DISC_RC' rs:number='147' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DISC_RC'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DISC_CD' rs:number='148' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DISC_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DISC_RT' rs:number='149' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DISC_RT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='2' rs:precision='5' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DISC_PR' rs:number='150' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DISC_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DISC_CPR' rs:number='151' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DISC_CPR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DISC_TX' rs:number='152' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DISC_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUPN_NO' rs:number='153' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CUPN_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ITEM_LT' rs:number='154' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO2' rs:number='155' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSLT_NM' rs:number='156' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RECE_NM' rs:number='157' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_NM' rs:number='158' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_NM' rs:number='159' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_NM' rs:number='160' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_NM' rs:number='161' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_NM' rs:number='162' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_NM' rs:number='163' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BACH_NM' rs:number='164' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPCL_NM' rs:number='165' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='166' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INPT_NM' rs:number='167' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MODI_NM' rs:number='168' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='EDP_TOBO_DT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RFID_NO2' rs:number='169' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_TOBO_DT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NM' rs:number='170' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CAN_LT' rs:number='171' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_TRANC_DATE' rs:number='172' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_TOBO_DT' rs:number='173' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_DENTAL_PANJ'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TOBO_DT' rs:number='174' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='175' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c175' rs:name='ROWID' rs:number='176' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c176' rs:name='ROWID' rs:number='177' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c177' rs:name='ROWID' rs:number='178' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c178' rs:name='ROWID' rs:number='179' rs:rowid='true' rs:hidden='true'>
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

			String EEA_PSNL_ID_T = cRsList.getString("EEA_PSNL_ID");
			String EPM_MEMO_SQ_T = cRsList.getString("EPM_MEMO_SQ");
			String EEP_MODI_NM_T = cRsList.getString("EEP_MODI_NM");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_ACPT_TM_T = cRsList.getString("EEA_ACPT_TM");
			String EEA_RSVN_NO_T = cRsList.getString("EEA_RSVN_NO");
			String EEA_ACPT_CD_T = cRsList.getString("EEA_ACPT_CD");
			String EEA_ACPT_KD_T = cRsList.getString("EEA_ACPT_KD");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_MMBR_CD_T = cRsList.getString("EEA_MMBR_CD");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_ZIP_CD_T = cRsList.getString("EEA_ZIP_CD");
			String EEA_ZIP_SQ_T = cRsList.getString("EEA_ZIP_SQ");
			String EEA_ZIP_AR_T = cRsList.getString("EEA_ZIP_AR");
			String EEA_ROAD_AR_T = cRsList.getString("EEA_ROAD_AR");
			String EEA_BLDG_NO_T = cRsList.getString("EEA_BLDG_NO");
			String EEA_TEL_NO_T = cRsList.getString("EEA_TEL_NO");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_EMAIL_AR_T = cRsList.getString("EEA_EMAIL_AR");
			String EEA_SEND_CD_T = cRsList.getString("EEA_SEND_CD");
			String EEA_SEND_DT_T = cRsList.getString("EEA_SEND_DT");
			String EEA_SMS_YN_T = cRsList.getString("EEA_SMS_YN");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_COTK_CD_T = cRsList.getString("EEA_COTK_CD");
			String EEA_NOTE_YN_T = cRsList.getString("EEA_NOTE_YN");
			String EEA_DEPT_CD_T = cRsList.getString("EEA_DEPT_CD");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_DIVI_CD_T = cRsList.getString("EEA_DIVI_CD");
			String EEA_ENTRY_DT_T = cRsList.getString("EEA_ENTRY_DT");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_DIVI_CS_T = cRsList.getString("EEA_DIVI_CS");
			String EEA_CLSS_KD_T = cRsList.getString("EEA_CLSS_KD");
			String EEA_FAMY_CD_T = cRsList.getString("EEA_FAMY_CD");
			String EEA_FAMY_NM_T = cRsList.getString("EEA_FAMY_NM");
			String EEA_RFID_NO_T = cRsList.getString("EEA_RFID_NO");
			String EEA_FOOD_YN_T = cRsList.getString("EEA_FOOD_YN");
			String EEA_SALES_ID_T = cRsList.getString("EEA_SALES_ID");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_HTSB_CD_T = cRsList.getString("EEA_HTSB_CD");
			String EEA_SPSB_CD_T = cRsList.getString("EEA_SPSB_CD");
			String EEA_CVSB_CD_T = cRsList.getString("EEA_CVSB_CD");
			String EEA_EMSB_CD_T = cRsList.getString("EEA_EMSB_CD");
			String EEA_ETSB_CD_T = cRsList.getString("EEA_ETSB_CD");
			String EEA_HTSB_YN_T = cRsList.getString("EEA_HTSB_YN");
			String EEA_SPSB_YN_T = cRsList.getString("EEA_SPSB_YN");
			String EEA_CVSB_YN_T = cRsList.getString("EEA_CVSB_YN");
			String EEA_EMSB_YN_T = cRsList.getString("EEA_EMSB_YN");
			String EEA_ETSB_YN_T = cRsList.getString("EEA_ETSB_YN");
			String EEA_HTPR_CD_T = cRsList.getString("EEA_HTPR_CD");
			String EEA_SPPR_CD_T = cRsList.getString("EEA_SPPR_CD");
			String EEA_CVPR_CD_T = cRsList.getString("EEA_CVPR_CD");
			String EEA_EMPR_CD_T = cRsList.getString("EEA_EMPR_CD");
			String EEA_ETPR_CD_T = cRsList.getString("EEA_ETPR_CD");
			String EEA_CNCL_CD_T = cRsList.getString("EEA_CNCL_CD");
			String EEA_MNGT_YR_T = cRsList.getString("EEA_MNGT_YR");
			String EEA_MNGT_HTYR_T = cRsList.getString("EEA_MNGT_HTYR");
			String EEA_MNGT_SPYM_T = cRsList.getString("EEA_MNGT_SPYM");
			String EEA_EXAM_LT_T = cRsList.getString("EEA_EXAM_LT");
			String EEA_HTSB_LT_T = cRsList.getString("EEA_HTSB_LT");
			String EEA_SPSB_LT_T = cRsList.getString("EEA_SPSB_LT");
			String EEA_CVSB_LT_T = cRsList.getString("EEA_CVSB_LT");
			String EEA_EMSB_LT_T = cRsList.getString("EEA_EMSB_LT");
			String EEA_ETSB_LT_T = cRsList.getString("EEA_ETSB_LT");
			String EEA_ADD_LT_T = cRsList.getString("EEA_ADD_LT");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String EEA_ORDER_LT_T = cRsList.getString("EEA_ORDER_LT");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_SPHT_CD_T = cRsList.getString("EEA_SPHT_CD");
			String EEA_INSU_NO_T = cRsList.getString("EEA_INSU_NO");
			String EEA_INSU_CD_T = cRsList.getString("EEA_INSU_CD");
			String EEA_ENTY_CD_T = cRsList.getString("EEA_ENTY_CD");
			String EEA_ASSO_CD_T = cRsList.getString("EEA_ASSO_CD");
			String EEA_CNTR_CD_T = cRsList.getString("EEA_CNTR_CD");
			String EEA_ARMY_CD_T = cRsList.getString("EEA_ARMY_CD");
			String EEA_HEPA_YN_T = cRsList.getString("EEA_HEPA_YN");
			String EEA_ORAL_YN_T = cRsList.getString("EEA_ORAL_YN");
			String EEA_CANAD_YN_T = cRsList.getString("EEA_CANAD_YN");
			String EEA_HOLIDAY_YN_T = cRsList.getString("EEA_HOLIDAY_YN");
			String EEA_STOMA_CD_T = cRsList.getString("EEA_STOMA_CD");
			String EEA_COLON_CD_T = cRsList.getString("EEA_COLON_CD");
			String EEA_LIVER_CD_T = cRsList.getString("EEA_LIVER_CD");
			String EEA_BAST_CD_T = cRsList.getString("EEA_BAST_CD");
			String EEA_UTER_CD_T = cRsList.getString("EEA_UTER_CD");
			String EEA_STOMA_DR_T = cRsList.getString("EEA_STOMA_DR");
			String EEA_COLON_DR_T = cRsList.getString("EEA_COLON_DR");
			String EEA_LIVER_DR_T = cRsList.getString("EEA_LIVER_DR");
			String EEA_BAST_DR_T = cRsList.getString("EEA_BAST_DR");
			String EEA_UTER_DR_T = cRsList.getString("EEA_UTER_DR");
			String EEA_CNCR_DT_T = cRsList.getString("EEA_CNCR_DT");
			String EEA_HDMD_YN_T = cRsList.getString("EEA_HDMD_YN");
			String EEA_SDMD_YN_T = cRsList.getString("EEA_SDMD_YN");
			String EEA_SPRT_PR_T = cRsList.getString("EEA_SPRT_PR");
			String EEA_COMP_PR_T = cRsList.getString("EEA_COMP_PR");
			String EEA_PSNL_PR_T = cRsList.getString("EEA_PSNL_PR");
			String EEA_HLTH_PR_T = cRsList.getString("EEA_HLTH_PR");
			String EEA_SPCL_PR_T = cRsList.getString("EEA_SPCL_PR");
			String EEA_CAN_PR_T = cRsList.getString("EEA_CAN_PR");
			String EEA_ORAL_PR_T = cRsList.getString("EEA_ORAL_PR");
			String EEA_COMPR_PR_T = cRsList.getString("EEA_COMPR_PR");
			String EEA_PSNLR_PR_T = cRsList.getString("EEA_PSNLR_PR");
			String EEA_HLTHR_PR_T = cRsList.getString("EEA_HLTHR_PR");
			String EEA_SPCLR_PR_T = cRsList.getString("EEA_SPCLR_PR");
			String EEA_CANR_PR_T = cRsList.getString("EEA_CANR_PR");
			String EEA_ORALR_PR_T = cRsList.getString("EEA_ORALR_PR");
			String EEA_PYER_CD_T = cRsList.getString("EEA_PYER_CD");
			String EEA_CMPY_CD_T = cRsList.getString("EEA_CMPY_CD");
			String EEA_PRPY_CD_T = cRsList.getString("EEA_PRPY_CD");
			String EEA_RECE_NO_T = cRsList.getString("EEA_RECE_NO");
			String EEA_RECE_KD_T = cRsList.getString("EEA_RECE_KD");
			String EEA_RSLT_CD_T = cRsList.getString("EEA_RSLT_CD");
			String EEA_BLRT_CD_T = cRsList.getString("EEA_BLRT_CD");
			String EEA_DEFER_KD_T = cRsList.getString("EEA_DEFER_KD");
			String EEA_ORDER_YN_T = cRsList.getString("EEA_ORDER_YN");
			String EEA_NHIC_TX_T = cRsList.getString("EEA_NHIC_TX");
			String EEA_ACPT_TX_T = cRsList.getString("EEA_ACPT_TX");
			String EEA_INPT_ID_T = cRsList.getString("EEA_INPT_ID");
			String EEA_INPT_DTT_T = cRsList.getDate2("EEA_INPT_DTT");
			String EEA_MODI_ID_T = cRsList.getString("EEA_MODI_ID");
			String EEA_MODI_DTT_T = cRsList.getDate2("EEA_MODI_DTT");
			String EEA_CANAD_KD_T = cRsList.getString("EEA_CANAD_KD");
			String EEA_2ND_YN_T = cRsList.getString("EEA_2ND_YN");
			String EEA_COMP_CD2_T = cRsList.getString("EEA_COMP_CD2");
			String EEA_LIFE_YN_T = cRsList.getString("EEA_LIFE_YN");
			String EEA_TOTAL_YN_T = cRsList.getString("EEA_TOTAL_YN");
			String EEA_OCS_DR_T = cRsList.getString("EEA_OCS_DR");
			String EEA_HCV_YN_T = cRsList.getString("EEA_HCV_YN");
			String EEA_OCS_DV_T = cRsList.getString("EEA_OCS_DV");
			String EEA_OCS_NO_T = cRsList.getString("EEA_OCS_NO");
			String EEA_LABEL_DT_T = cRsList.getString("EEA_LABEL_DT");
			String EEA_EXEC_ID_T = cRsList.getString("EEA_EXEC_ID");
			String EEA_SELF_KD_T = cRsList.getString("EEA_SELF_KD");
			String EEA_CANPR_KD_T = cRsList.getString("EEA_CANPR_KD");
			String EEA_HLTH_KD_T = cRsList.getString("EEA_HLTH_KD");
			String EEA_SAFE_YN_T = cRsList.getString("EEA_SAFE_YN");
			String EEA_ADD_DT_T = cRsList.getString("EEA_ADD_DT");
			String EEA_ENDO_DR_T = cRsList.getString("EEA_ENDO_DR");
			String EEA_PDF_KD_T = cRsList.getString("EEA_PDF_KD");
			String EEA_LUNG_CD_T = cRsList.getString("EEA_LUNG_CD");
			String EEA_LUNG_DR_T = cRsList.getString("EEA_LUNG_DR");
			String EEA_LUNG_KD_T = cRsList.getString("EEA_LUNG_KD");
			String EEA_UBEH_YN_T = cRsList.getString("EEA_UBEH_YN");
			String EEA_DISC_RC_T = cRsList.getString("EEA_DISC_RC");
			String EEA_DISC_CD_T = cRsList.getString("EEA_DISC_CD");
			String EEA_DISC_RT_T = cRsList.getString("EEA_DISC_RT");
			String EEA_DISC_PR_T = cRsList.getString("EEA_DISC_PR");
			String EEA_DISC_CPR_T = cRsList.getString("EEA_DISC_CPR");
			String EEA_DISC_TX_T = cRsList.getString("EEA_DISC_TX");
			String EEA_CUPN_NO_T = cRsList.getString("EEA_CUPN_NO");
			String EEA_ITEM_LT_T = cRsList.getString("EEA_ITEM_LT");
			String EEA_MOBL_NO2_T = cRsList.getString("EEA_MOBL_NO2");
			String EEA_RSLT_NM_T = cRsList.getString("EEA_RSLT_NM");
			String EEA_RECE_NM_T = cRsList.getString("EEA_RECE_NM");
			String EEA_EXAM_NM_T = cRsList.getString("EEA_EXAM_NM");
			String EEA_HTSB_NM_T = cRsList.getString("EEA_HTSB_NM");
			String EEA_SPCL_NM_T = cRsList.getString("EEA_SPCL_NM");
			String EEA_EMSB_NM_T = cRsList.getString("EEA_EMSB_NM");
			String EEA_CVSB_NM_T = cRsList.getString("EEA_CVSB_NM");
			String EEA_ETSB_NM_T = cRsList.getString("EEA_ETSB_NM");
			String EEA_BACH_NM_T = cRsList.getString("EEA_BACH_NM");
			String SPCL_NM_T = cRsList.getString("SPCL_NM");
			String EEA_COMP_NM_T = cRsList.getString("EEA_COMP_NM");
			String EEA_INPT_NM_T = cRsList.getString("EEA_INPT_NM");
			String EEA_MODI_NM_T = cRsList.getString("EEA_MODI_NM");
			String EEA_RFID_NO2_T = cRsList.getString("EEA_RFID_NO2");
			String EEA_DIVI_NM_T = cRsList.getString("EEA_DIVI_NM");
			String EEA_CAN_LT_T = cRsList.getString("EEA_CAN_LT");
			String PFP_TRANC_DATE_T = cRsList.getString("PFP_TRANC_DATE");
			String EDP_TOBO_DT_T = cRsList.getString("EDP_TOBO_DT");
			String SBE_TOBO_DT_T = cRsList.getString("SBE_TOBO_DT");
			String ROWID_T = cRsList.getString("ROWID");
			String c175_T = cRsList.getString("c175");
			String c176_T = cRsList.getString("c176");
			String c177_T = cRsList.getString("c177");
			String c178_T = cRsList.getString("c178");
%>
			<z:row
<%
			if(! EEA_PSNL_ID_T.equals("")) {
%>
		 		EEA_PSNL_ID='<%= EEA_PSNL_ID_T%>'
<%
			}

			if(! EPM_MEMO_SQ_T.equals("")) {
%>
		 		EPM_MEMO_SQ='<%= EPM_MEMO_SQ_T%>'
<%
			}

			if(! EEP_MODI_NM_T.equals("")) {
%>
		 		EEP_MODI_NM='<%= EEP_MODI_NM_T%>'
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

			if(! EEA_ACPT_TM_T.equals("")) {
%>
		 		EEA_ACPT_TM='<%= EEA_ACPT_TM_T%>'
<%
			}

			if(! EEA_RSVN_NO_T.equals("")) {
%>
		 		EEA_RSVN_NO='<%= EEA_RSVN_NO_T%>'
<%
			}

			if(! EEA_ACPT_CD_T.equals("")) {
%>
		 		EEA_ACPT_CD='<%= EEA_ACPT_CD_T%>'
<%
			}

			if(! EEA_ACPT_KD_T.equals("")) {
%>
		 		EEA_ACPT_KD='<%= EEA_ACPT_KD_T%>'
<%
			}

			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
<%
			}

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! EEA_MMBR_CD_T.equals("")) {
%>
		 		EEA_MMBR_CD='<%= EEA_MMBR_CD_T%>'
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

			if(! EEA_ZIP_CD_T.equals("")) {
%>
		 		EEA_ZIP_CD='<%= EEA_ZIP_CD_T%>'
<%
			}

			if(! EEA_ZIP_SQ_T.equals("")) {
%>
		 		EEA_ZIP_SQ='<%= EEA_ZIP_SQ_T%>'
<%
			}

			if(! EEA_ZIP_AR_T.equals("")) {
%>
		 		EEA_ZIP_AR='<%= EEA_ZIP_AR_T%>'
<%
			}

			if(! EEA_ROAD_AR_T.equals("")) {
%>
		 		EEA_ROAD_AR='<%= EEA_ROAD_AR_T%>'
<%
			}

			if(! EEA_BLDG_NO_T.equals("")) {
%>
		 		EEA_BLDG_NO='<%= EEA_BLDG_NO_T%>'
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

			if(! EEA_EMAIL_AR_T.equals("")) {
%>
		 		EEA_EMAIL_AR='<%= EEA_EMAIL_AR_T%>'
<%
			}

			if(! EEA_SEND_CD_T.equals("")) {
%>
		 		EEA_SEND_CD='<%= EEA_SEND_CD_T%>'
<%
			}

			if(! EEA_SEND_DT_T.equals("")) {
%>
		 		EEA_SEND_DT='<%= EEA_SEND_DT_T%>'
<%
			}

			if(! EEA_SMS_YN_T.equals("")) {
%>
		 		EEA_SMS_YN='<%= EEA_SMS_YN_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! EEA_COTK_CD_T.equals("")) {
%>
		 		EEA_COTK_CD='<%= EEA_COTK_CD_T%>'
<%
			}

			if(! EEA_NOTE_YN_T.equals("")) {
%>
		 		EEA_NOTE_YN='<%= EEA_NOTE_YN_T%>'
<%
			}

			if(! EEA_DEPT_CD_T.equals("")) {
%>
		 		EEA_DEPT_CD='<%= EEA_DEPT_CD_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! EEA_DIVI_CD_T.equals("")) {
%>
		 		EEA_DIVI_CD='<%= EEA_DIVI_CD_T%>'
<%
			}

			if(! EEA_ENTRY_DT_T.equals("")) {
%>
		 		EEA_ENTRY_DT='<%= EEA_ENTRY_DT_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! EEA_DIVI_CS_T.equals("")) {
%>
		 		EEA_DIVI_CS='<%= EEA_DIVI_CS_T%>'
<%
			}

			if(! EEA_CLSS_KD_T.equals("")) {
%>
		 		EEA_CLSS_KD='<%= EEA_CLSS_KD_T%>'
<%
			}

			if(! EEA_FAMY_CD_T.equals("")) {
%>
		 		EEA_FAMY_CD='<%= EEA_FAMY_CD_T%>'
<%
			}

			if(! EEA_FAMY_NM_T.equals("")) {
%>
		 		EEA_FAMY_NM='<%= EEA_FAMY_NM_T%>'
<%
			}

			if(! EEA_RFID_NO_T.equals("")) {
%>
		 		EEA_RFID_NO='<%= EEA_RFID_NO_T%>'
<%
			}

			if(! EEA_FOOD_YN_T.equals("")) {
%>
		 		EEA_FOOD_YN='<%= EEA_FOOD_YN_T%>'
<%
			}

			if(! EEA_SALES_ID_T.equals("")) {
%>
		 		EEA_SALES_ID='<%= EEA_SALES_ID_T%>'
<%
			}

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! EEA_HTSB_CD_T.equals("")) {
%>
		 		EEA_HTSB_CD='<%= EEA_HTSB_CD_T%>'
<%
			}

			if(! EEA_SPSB_CD_T.equals("")) {
%>
		 		EEA_SPSB_CD='<%= EEA_SPSB_CD_T%>'
<%
			}

			if(! EEA_CVSB_CD_T.equals("")) {
%>
		 		EEA_CVSB_CD='<%= EEA_CVSB_CD_T%>'
<%
			}

			if(! EEA_EMSB_CD_T.equals("")) {
%>
		 		EEA_EMSB_CD='<%= EEA_EMSB_CD_T%>'
<%
			}

			if(! EEA_ETSB_CD_T.equals("")) {
%>
		 		EEA_ETSB_CD='<%= EEA_ETSB_CD_T%>'
<%
			}

			if(! EEA_HTSB_YN_T.equals("")) {
%>
		 		EEA_HTSB_YN='<%= EEA_HTSB_YN_T%>'
<%
			}

			if(! EEA_SPSB_YN_T.equals("")) {
%>
		 		EEA_SPSB_YN='<%= EEA_SPSB_YN_T%>'
<%
			}

			if(! EEA_CVSB_YN_T.equals("")) {
%>
		 		EEA_CVSB_YN='<%= EEA_CVSB_YN_T%>'
<%
			}

			if(! EEA_EMSB_YN_T.equals("")) {
%>
		 		EEA_EMSB_YN='<%= EEA_EMSB_YN_T%>'
<%
			}

			if(! EEA_ETSB_YN_T.equals("")) {
%>
		 		EEA_ETSB_YN='<%= EEA_ETSB_YN_T%>'
<%
			}

			if(! EEA_HTPR_CD_T.equals("")) {
%>
		 		EEA_HTPR_CD='<%= EEA_HTPR_CD_T%>'
<%
			}

			if(! EEA_SPPR_CD_T.equals("")) {
%>
		 		EEA_SPPR_CD='<%= EEA_SPPR_CD_T%>'
<%
			}

			if(! EEA_CVPR_CD_T.equals("")) {
%>
		 		EEA_CVPR_CD='<%= EEA_CVPR_CD_T%>'
<%
			}

			if(! EEA_EMPR_CD_T.equals("")) {
%>
		 		EEA_EMPR_CD='<%= EEA_EMPR_CD_T%>'
<%
			}

			if(! EEA_ETPR_CD_T.equals("")) {
%>
		 		EEA_ETPR_CD='<%= EEA_ETPR_CD_T%>'
<%
			}

			if(! EEA_CNCL_CD_T.equals("")) {
%>
		 		EEA_CNCL_CD='<%= EEA_CNCL_CD_T%>'
<%
			}

			if(! EEA_MNGT_YR_T.equals("")) {
%>
		 		EEA_MNGT_YR='<%= EEA_MNGT_YR_T%>'
<%
			}

			if(! EEA_MNGT_HTYR_T.equals("")) {
%>
		 		EEA_MNGT_HTYR='<%= EEA_MNGT_HTYR_T%>'
<%
			}

			if(! EEA_MNGT_SPYM_T.equals("")) {
%>
		 		EEA_MNGT_SPYM='<%= EEA_MNGT_SPYM_T%>'
<%
			}

			if(! EEA_EXAM_LT_T.equals("")) {
%>
		 		EEA_EXAM_LT='<%= EEA_EXAM_LT_T%>'
<%
			}

			if(! EEA_HTSB_LT_T.equals("")) {
%>
		 		EEA_HTSB_LT='<%= EEA_HTSB_LT_T%>'
<%
			}

			if(! EEA_SPSB_LT_T.equals("")) {
%>
		 		EEA_SPSB_LT='<%= EEA_SPSB_LT_T%>'
<%
			}

			if(! EEA_CVSB_LT_T.equals("")) {
%>
		 		EEA_CVSB_LT='<%= EEA_CVSB_LT_T%>'
<%
			}

			if(! EEA_EMSB_LT_T.equals("")) {
%>
		 		EEA_EMSB_LT='<%= EEA_EMSB_LT_T%>'
<%
			}

			if(! EEA_ETSB_LT_T.equals("")) {
%>
		 		EEA_ETSB_LT='<%= EEA_ETSB_LT_T%>'
<%
			}

			if(! EEA_ADD_LT_T.equals("")) {
%>
		 		EEA_ADD_LT='<%= EEA_ADD_LT_T%>'
<%
			}

			if(! EEA_SPCL_LT_T.equals("")) {
%>
		 		EEA_SPCL_LT='<%= EEA_SPCL_LT_T%>'
<%
			}

			if(! EEA_ORDER_LT_T.equals("")) {
%>
		 		EEA_ORDER_LT='<%= EEA_ORDER_LT_T%>'
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

			if(! EEA_INSU_NO_T.equals("")) {
%>
		 		EEA_INSU_NO='<%= EEA_INSU_NO_T%>'
<%
			}

			if(! EEA_INSU_CD_T.equals("")) {
%>
		 		EEA_INSU_CD='<%= EEA_INSU_CD_T%>'
<%
			}

			if(! EEA_ENTY_CD_T.equals("")) {
%>
		 		EEA_ENTY_CD='<%= EEA_ENTY_CD_T%>'
<%
			}

			if(! EEA_ASSO_CD_T.equals("")) {
%>
		 		EEA_ASSO_CD='<%= EEA_ASSO_CD_T%>'
<%
			}

			if(! EEA_CNTR_CD_T.equals("")) {
%>
		 		EEA_CNTR_CD='<%= EEA_CNTR_CD_T%>'
<%
			}

			if(! EEA_ARMY_CD_T.equals("")) {
%>
		 		EEA_ARMY_CD='<%= EEA_ARMY_CD_T%>'
<%
			}

			if(! EEA_HEPA_YN_T.equals("")) {
%>
		 		EEA_HEPA_YN='<%= EEA_HEPA_YN_T%>'
<%
			}

			if(! EEA_ORAL_YN_T.equals("")) {
%>
		 		EEA_ORAL_YN='<%= EEA_ORAL_YN_T%>'
<%
			}

			if(! EEA_CANAD_YN_T.equals("")) {
%>
		 		EEA_CANAD_YN='<%= EEA_CANAD_YN_T%>'
<%
			}

			if(! EEA_HOLIDAY_YN_T.equals("")) {
%>
		 		EEA_HOLIDAY_YN='<%= EEA_HOLIDAY_YN_T%>'
<%
			}

			if(! EEA_STOMA_CD_T.equals("")) {
%>
		 		EEA_STOMA_CD='<%= EEA_STOMA_CD_T%>'
<%
			}

			if(! EEA_COLON_CD_T.equals("")) {
%>
		 		EEA_COLON_CD='<%= EEA_COLON_CD_T%>'
<%
			}

			if(! EEA_LIVER_CD_T.equals("")) {
%>
		 		EEA_LIVER_CD='<%= EEA_LIVER_CD_T%>'
<%
			}

			if(! EEA_BAST_CD_T.equals("")) {
%>
		 		EEA_BAST_CD='<%= EEA_BAST_CD_T%>'
<%
			}

			if(! EEA_UTER_CD_T.equals("")) {
%>
		 		EEA_UTER_CD='<%= EEA_UTER_CD_T%>'
<%
			}

			if(! EEA_STOMA_DR_T.equals("")) {
%>
		 		EEA_STOMA_DR='<%= EEA_STOMA_DR_T%>'
<%
			}

			if(! EEA_COLON_DR_T.equals("")) {
%>
		 		EEA_COLON_DR='<%= EEA_COLON_DR_T%>'
<%
			}

			if(! EEA_LIVER_DR_T.equals("")) {
%>
		 		EEA_LIVER_DR='<%= EEA_LIVER_DR_T%>'
<%
			}

			if(! EEA_BAST_DR_T.equals("")) {
%>
		 		EEA_BAST_DR='<%= EEA_BAST_DR_T%>'
<%
			}

			if(! EEA_UTER_DR_T.equals("")) {
%>
		 		EEA_UTER_DR='<%= EEA_UTER_DR_T%>'
<%
			}

			if(! EEA_CNCR_DT_T.equals("")) {
%>
		 		EEA_CNCR_DT='<%= EEA_CNCR_DT_T%>'
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

			if(! EEA_SPRT_PR_T.equals("")) {
%>
		 		EEA_SPRT_PR='<%= EEA_SPRT_PR_T%>'
<%
			}

			if(! EEA_COMP_PR_T.equals("")) {
%>
		 		EEA_COMP_PR='<%= EEA_COMP_PR_T%>'
<%
			}

			if(! EEA_PSNL_PR_T.equals("")) {
%>
		 		EEA_PSNL_PR='<%= EEA_PSNL_PR_T%>'
<%
			}

			if(! EEA_HLTH_PR_T.equals("")) {
%>
		 		EEA_HLTH_PR='<%= EEA_HLTH_PR_T%>'
<%
			}

			if(! EEA_SPCL_PR_T.equals("")) {
%>
		 		EEA_SPCL_PR='<%= EEA_SPCL_PR_T%>'
<%
			}

			if(! EEA_CAN_PR_T.equals("")) {
%>
		 		EEA_CAN_PR='<%= EEA_CAN_PR_T%>'
<%
			}

			if(! EEA_ORAL_PR_T.equals("")) {
%>
		 		EEA_ORAL_PR='<%= EEA_ORAL_PR_T%>'
<%
			}

			if(! EEA_COMPR_PR_T.equals("")) {
%>
		 		EEA_COMPR_PR='<%= EEA_COMPR_PR_T%>'
<%
			}

			if(! EEA_PSNLR_PR_T.equals("")) {
%>
		 		EEA_PSNLR_PR='<%= EEA_PSNLR_PR_T%>'
<%
			}

			if(! EEA_HLTHR_PR_T.equals("")) {
%>
		 		EEA_HLTHR_PR='<%= EEA_HLTHR_PR_T%>'
<%
			}

			if(! EEA_SPCLR_PR_T.equals("")) {
%>
		 		EEA_SPCLR_PR='<%= EEA_SPCLR_PR_T%>'
<%
			}

			if(! EEA_CANR_PR_T.equals("")) {
%>
		 		EEA_CANR_PR='<%= EEA_CANR_PR_T%>'
<%
			}

			if(! EEA_ORALR_PR_T.equals("")) {
%>
		 		EEA_ORALR_PR='<%= EEA_ORALR_PR_T%>'
<%
			}

			if(! EEA_PYER_CD_T.equals("")) {
%>
		 		EEA_PYER_CD='<%= EEA_PYER_CD_T%>'
<%
			}

			if(! EEA_CMPY_CD_T.equals("")) {
%>
		 		EEA_CMPY_CD='<%= EEA_CMPY_CD_T%>'
<%
			}

			if(! EEA_PRPY_CD_T.equals("")) {
%>
		 		EEA_PRPY_CD='<%= EEA_PRPY_CD_T%>'
<%
			}

			if(! EEA_RECE_NO_T.equals("")) {
%>
		 		EEA_RECE_NO='<%= EEA_RECE_NO_T%>'
<%
			}

			if(! EEA_RECE_KD_T.equals("")) {
%>
		 		EEA_RECE_KD='<%= EEA_RECE_KD_T%>'
<%
			}

			if(! EEA_RSLT_CD_T.equals("")) {
%>
		 		EEA_RSLT_CD='<%= EEA_RSLT_CD_T%>'
<%
			}

			if(! EEA_BLRT_CD_T.equals("")) {
%>
		 		EEA_BLRT_CD='<%= EEA_BLRT_CD_T%>'
<%
			}

			if(! EEA_DEFER_KD_T.equals("")) {
%>
		 		EEA_DEFER_KD='<%= EEA_DEFER_KD_T%>'
<%
			}

			if(! EEA_ORDER_YN_T.equals("")) {
%>
		 		EEA_ORDER_YN='<%= EEA_ORDER_YN_T%>'
<%
			}

			if(! EEA_NHIC_TX_T.equals("")) {
%>
		 		EEA_NHIC_TX='<%= EEA_NHIC_TX_T%>'
<%
			}

			if(! EEA_ACPT_TX_T.equals("")) {
%>
		 		EEA_ACPT_TX='<%= EEA_ACPT_TX_T%>'
<%
			}

			if(! EEA_INPT_ID_T.equals("")) {
%>
		 		EEA_INPT_ID='<%= EEA_INPT_ID_T%>'
<%
			}

			if(! EEA_INPT_DTT_T.equals("")) {
%>
		 		EEA_INPT_DTT='<%= EEA_INPT_DTT_T%>'
<%
			}

			if(! EEA_MODI_ID_T.equals("")) {
%>
		 		EEA_MODI_ID='<%= EEA_MODI_ID_T%>'
<%
			}

			if(! EEA_MODI_DTT_T.equals("")) {
%>
		 		EEA_MODI_DTT='<%= EEA_MODI_DTT_T%>'
<%
			}

			if(! EEA_CANAD_KD_T.equals("")) {
%>
		 		EEA_CANAD_KD='<%= EEA_CANAD_KD_T%>'
<%
			}

			if(! EEA_2ND_YN_T.equals("")) {
%>
		 		EEA_2ND_YN='<%= EEA_2ND_YN_T%>'
<%
			}

			if(! EEA_COMP_CD2_T.equals("")) {
%>
		 		EEA_COMP_CD2='<%= EEA_COMP_CD2_T%>'
<%
			}

			if(! EEA_LIFE_YN_T.equals("")) {
%>
		 		EEA_LIFE_YN='<%= EEA_LIFE_YN_T%>'
<%
			}

			if(! EEA_TOTAL_YN_T.equals("")) {
%>
		 		EEA_TOTAL_YN='<%= EEA_TOTAL_YN_T%>'
<%
			}

			if(! EEA_OCS_DR_T.equals("")) {
%>
		 		EEA_OCS_DR='<%= EEA_OCS_DR_T%>'
<%
			}

			if(! EEA_HCV_YN_T.equals("")) {
%>
		 		EEA_HCV_YN='<%= EEA_HCV_YN_T%>'
<%
			}

			if(! EEA_OCS_DV_T.equals("")) {
%>
		 		EEA_OCS_DV='<%= EEA_OCS_DV_T%>'
<%
			}

			if(! EEA_OCS_NO_T.equals("")) {
%>
		 		EEA_OCS_NO='<%= EEA_OCS_NO_T%>'
<%
			}

			if(! EEA_LABEL_DT_T.equals("")) {
%>
		 		EEA_LABEL_DT='<%= EEA_LABEL_DT_T%>'
<%
			}

			if(! EEA_EXEC_ID_T.equals("")) {
%>
		 		EEA_EXEC_ID='<%= EEA_EXEC_ID_T%>'
<%
			}

			if(! EEA_SELF_KD_T.equals("")) {
%>
		 		EEA_SELF_KD='<%= EEA_SELF_KD_T%>'
<%
			}

			if(! EEA_CANPR_KD_T.equals("")) {
%>
		 		EEA_CANPR_KD='<%= EEA_CANPR_KD_T%>'
<%
			}

			if(! EEA_HLTH_KD_T.equals("")) {
%>
		 		EEA_HLTH_KD='<%= EEA_HLTH_KD_T%>'
<%
			}

			if(! EEA_SAFE_YN_T.equals("")) {
%>
		 		EEA_SAFE_YN='<%= EEA_SAFE_YN_T%>'
<%
			}

			if(! EEA_ADD_DT_T.equals("")) {
%>
		 		EEA_ADD_DT='<%= EEA_ADD_DT_T%>'
<%
			}

			if(! EEA_ENDO_DR_T.equals("")) {
%>
		 		EEA_ENDO_DR='<%= EEA_ENDO_DR_T%>'
<%
			}

			if(! EEA_PDF_KD_T.equals("")) {
%>
		 		EEA_PDF_KD='<%= EEA_PDF_KD_T%>'
<%
			}

			if(! EEA_LUNG_CD_T.equals("")) {
%>
		 		EEA_LUNG_CD='<%= EEA_LUNG_CD_T%>'
<%
			}

			if(! EEA_LUNG_DR_T.equals("")) {
%>
		 		EEA_LUNG_DR='<%= EEA_LUNG_DR_T%>'
<%
			}

			if(! EEA_LUNG_KD_T.equals("")) {
%>
		 		EEA_LUNG_KD='<%= EEA_LUNG_KD_T%>'
<%
			}

			if(! EEA_UBEH_YN_T.equals("")) {
%>
		 		EEA_UBEH_YN='<%= EEA_UBEH_YN_T%>'
<%
			}

			if(! EEA_DISC_RC_T.equals("")) {
%>
		 		EEA_DISC_RC='<%= EEA_DISC_RC_T%>'
<%
			}

			if(! EEA_DISC_CD_T.equals("")) {
%>
		 		EEA_DISC_CD='<%= EEA_DISC_CD_T%>'
<%
			}

			if(! EEA_DISC_RT_T.equals("")) {
%>
		 		EEA_DISC_RT='<%= EEA_DISC_RT_T%>'
<%
			}

			if(! EEA_DISC_PR_T.equals("")) {
%>
		 		EEA_DISC_PR='<%= EEA_DISC_PR_T%>'
<%
			}

			if(! EEA_DISC_CPR_T.equals("")) {
%>
		 		EEA_DISC_CPR='<%= EEA_DISC_CPR_T%>'
<%
			}

			if(! EEA_DISC_TX_T.equals("")) {
%>
		 		EEA_DISC_TX='<%= EEA_DISC_TX_T%>'
<%
			}

			if(! EEA_CUPN_NO_T.equals("")) {
%>
		 		EEA_CUPN_NO='<%= EEA_CUPN_NO_T%>'
<%
			}

			if(! EEA_ITEM_LT_T.equals("")) {
%>
		 		EEA_ITEM_LT='<%= EEA_ITEM_LT_T%>'
<%
			}

			if(! EEA_MOBL_NO2_T.equals("")) {
%>
		 		EEA_MOBL_NO2='<%= EEA_MOBL_NO2_T%>'
<%
			}

			if(! EEA_RSLT_NM_T.equals("")) {
%>
		 		EEA_RSLT_NM='<%= EEA_RSLT_NM_T%>'
<%
			}

			if(! EEA_RECE_NM_T.equals("")) {
%>
		 		EEA_RECE_NM='<%= EEA_RECE_NM_T%>'
<%
			}

			if(! EEA_EXAM_NM_T.equals("")) {
%>
		 		EEA_EXAM_NM='<%= EEA_EXAM_NM_T%>'
<%
			}

			if(! EEA_HTSB_NM_T.equals("")) {
%>
		 		EEA_HTSB_NM='<%= EEA_HTSB_NM_T%>'
<%
			}

			if(! EEA_SPCL_NM_T.equals("")) {
%>
		 		EEA_SPCL_NM='<%= EEA_SPCL_NM_T%>'
<%
			}

			if(! EEA_EMSB_NM_T.equals("")) {
%>
		 		EEA_EMSB_NM='<%= EEA_EMSB_NM_T%>'
<%
			}

			if(! EEA_CVSB_NM_T.equals("")) {
%>
		 		EEA_CVSB_NM='<%= EEA_CVSB_NM_T%>'
<%
			}

			if(! EEA_ETSB_NM_T.equals("")) {
%>
		 		EEA_ETSB_NM='<%= EEA_ETSB_NM_T%>'
<%
			}

			if(! EEA_BACH_NM_T.equals("")) {
%>
		 		EEA_BACH_NM='<%= EEA_BACH_NM_T%>'
<%
			}

			if(! SPCL_NM_T.equals("")) {
%>
		 		SPCL_NM='<%= SPCL_NM_T%>'
<%
			}

			if(! EEA_COMP_NM_T.equals("")) {
%>
		 		EEA_COMP_NM='<%= EEA_COMP_NM_T%>'
<%
			}

			if(! EEA_INPT_NM_T.equals("")) {
%>
		 		EEA_INPT_NM='<%= EEA_INPT_NM_T%>'
<%
			}

			if(! EEA_MODI_NM_T.equals("")) {
%>
		 		EEA_MODI_NM='<%= EEA_MODI_NM_T%>'
<%
			}

			if(! EEA_RFID_NO2_T.equals("")) {
%>
		 		EEA_RFID_NO2='<%= EEA_RFID_NO2_T%>'
<%
			}

			if(! EEA_DIVI_NM_T.equals("")) {
%>
		 		EEA_DIVI_NM='<%= EEA_DIVI_NM_T%>'
<%
			}

			if(! EEA_CAN_LT_T.equals("")) {
%>
		 		EEA_CAN_LT='<%= EEA_CAN_LT_T%>'
<%
			}

			if(! PFP_TRANC_DATE_T.equals("")) {
%>
		 		PFP_TRANC_DATE='<%= PFP_TRANC_DATE_T%>'
<%
			}

			if(! EDP_TOBO_DT_T.equals("")) {
%>
		 		EDP_TOBO_DT='<%= EDP_TOBO_DT_T%>'
<%
			}

			if(! SBE_TOBO_DT_T.equals("")) {
%>
		 		SBE_TOBO_DT='<%= SBE_TOBO_DT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c175_T.equals("")) {
%>
		 		c175='<%= c175_T%>'
<%
			}

			if(! c176_T.equals("")) {
%>
		 		c176='<%= c176_T%>'
<%
			}

			if(! c177_T.equals("")) {
%>
		 		c177='<%= c177_T%>'
<%
			}

			if(! c178_T.equals("")) {
%>
		 		c178='<%= c178_T%>'
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
