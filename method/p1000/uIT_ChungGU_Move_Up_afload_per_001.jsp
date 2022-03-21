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

		String DP_FROMDT = htMethod.get("DP_FROMDT");
		String DP_TODT = htMethod.get("DP_TODT");
		String COMP_CD = htMethod.get("COMP_CD");
		String CMBBOXPLCE_CD1 = htMethod.get("CMBBOXPLCE_CD1");
		String CMBBOXPLCE_CD2 = htMethod.get("CMBBOXPLCE_CD2");
		String CMBSP_GUBN1 = htMethod.get("CMBSP_GUBN1");
		String CMBSP_GUBN2 = htMethod.get("CMBSP_GUBN2");
		String CMBSP_CHA = htMethod.get("CMBSP_CHA");
		String CMBHLTH_KD = htMethod.get("CMBHLTH_KD");
		String CK_CHUNG_CRT = htMethod.get("CK_CHUNG_CRT");
		String RZ_CHKD = htMethod.get("RZ_CHKD");
		String CHUNGB = htMethod.get("CHUNGB");
		String CMBBOXSORT = htMethod.get("CMBBOXSORT");

		//
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(CMBBOXPLCE_CD1 == null) { CMBBOXPLCE_CD1 = ""; }
		if(CMBBOXPLCE_CD2 == null) { CMBBOXPLCE_CD2 = ""; }
		if(CMBSP_GUBN1 == null) { CMBSP_GUBN1 = ""; }
		if(CMBSP_GUBN2 == null) { CMBSP_GUBN2 = ""; }
		if(CMBSP_CHA == null) { CMBSP_CHA = ""; }
		if(CMBHLTH_KD == null) { CMBHLTH_KD = ""; }
		if(CK_CHUNG_CRT == null) { CK_CHUNG_CRT = ""; }
		if(RZ_CHKD == null) { RZ_CHKD = ""; }
		if(CHUNGB == null) { CHUNGB = ""; }
		if(CMBBOXSORT == null) { CMBBOXSORT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT EEA_COMP_CD,  EEA_EXAM_CD,
       ICY_COMP_NM,  EEA_DEPT_NM, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_LT, EEA_SPCL_CD,
       EEA_CUST_NO,
       EEA_PSNL_NM,
       IAU_PENL_NM, EEA_EXAM_DT,EEA_EXAM_SQ, ICR_PENL_ID,
      (select CCN_FULL_NM from ct_common where ccn_large='0919' and CCN_SMALL='01') EEA_FAMY_CD,
      case when CHUNGGB ='특검' then
         case when EEA_SPHT_CD = '1' then '일특' else '특검' end ||
         case when EEA_EXAM_CD = '41001' then '1차'
              when EEA_EXAM_CD = '42001' then '2차'
              when EEA_SPSB_CD = '41001' then '1차'
              when EEA_SPSB_CD = '42001' then '2차'
         end
         else CHUNGGB
      end  CHUNGGB, SUM(EEA_DISC_CPR)   EEA_DISC_CPR,
       SUM(CHUNGAMT)  - SUM(EEA_DISC_CPR)  CHUNGAMT , sum(NVL(EEP_PSNL_PR, 0)) EEP_PSNL_PR
FROM (
      SELECT EEA_COMP_CD, EEA_EXAM_CD,
             ICY_COMP_NM, EEA_DEPT_NM, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_LT, EEA_SPCL_CD,  EEA_FAMY_CD,
             EEA_CUST_NO,
             EEA_PSNL_NM,
             IAU_PENL_NM ,  EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID,
             CASE
                 WHEN CHUNGGB in ('일반','학생')
                 THEN EEP_CDMD_DT
                 ELSE NULL
             END EEP_CDMD_DT,
             CASE
                 WHEN CHUNGGB='특검'
                 THEN EEP_CDMDS_DT
                 ELSE NULL
             END EEP_CDMDS_DT,
             CHUNGGB, EEA_DISC_CPR,
             CHUNGAMT,
             case when  CHUNGGB  in('일반','학생') then   EEP_PSNL_PR  end    EEP_PSNL_PR
      FROM (
            SELECT EEA_COMP_CD, EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID,  EEA_EXAM_CD,
                   ICY_COMP_NM, EEA_DEPT_NM, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_LT, EEA_SPCL_CD, EEA_FAMY_CD,
                   EEA_CUST_NO,
                   EEA_PSNL_NM,
                   IAU_PENL_NM,
                   EEP_CDMD_DT,
                   EEP_CDMDS_DT,  SUM(NVL(EEA_DISC_CPR,0))  EEA_DISC_CPR, 
                   SUM(EEP_COMP_PR) 일반,
                   SUM(EEP_COMPS_PR) 특검,
                   SUM(EEP_stud_PR) 학생,
                   case when sum( EEP_COMP_PR)> 0 then   sum(EEP_PSNL_PR) else sum(EEP_PSNL_PR) end    EEP_PSNL_PR
            FROM (
                  SELECT A.EEA_COMP_CD,  EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID,  EEA_EXAM_CD,
                         C.ICY_COMP_NM, EEA_DEPT_NM, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_LT, EEA_SPCL_CD, EEA_FAMY_CD,
                         A.EEA_CUST_NO,
                         A.EEA_PSNL_NM,
                         D.IAU_PENL_NM,
                         B.EEP_CDMD_DT,
                         B.EEP_CDMDS_DT,   EEA_DISC_CPR, 
                         case when  EEA_EXAM_CD  not like '31%' then (B.EEP_COMP_PR)  end EEP_COMP_PR,
                         case when  EEA_EXAM_CD  not like '31%' then (B.EEP_COMPS_PR) end EEP_COMPS_PR,
                         case when  EEA_EXAM_CD   like '31%' then (B.EEP_COMPS_PR||B.EEP_COMP_PR) end  EEP_stud_PR,
                          (B.EEP_PSNLP_PR) EEP_PSNLP_PR ,
                         CASE WHEN EEA_RECE_KD<>'2' THEN  EEP_PSNL_PR ELSE 0  END EEP_PSNL_PR
                  FROM ET_EXAM_ACPT A
                       LEFT OUTER JOIN ET_EXAM_PRICE B
                           ON A.EEA_EXAM_DT = B.EEP_EXAM_DT
                           AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ
                       LEFT OUTER JOIN IT_COMPANY C
                           ON A.EEA_COMP_CD = C.ICY_COMP_CD
                       LEFT OUTER JOIN IT_AUTH_USER D
                           ON C.ICY_SALE_ID = D.IAU_EMP_NO
                       LEFT OUTER JOIN IT_CUSTOMER E
                           ON A.EEA_CUST_NO=E.ICR_CUST_NO
                  WHERE NVL(A.EEA_COMP_CD, ' ') <> ' '
                        AND EEA_EXAM_DT >= :dp_fromdt AND EEA_EXAM_DT <= :dp_todt
                        AND EEA_COMP_CD = :COMP_CD
                        AND EEA_ORDER_YN <> 'C'

if :CmbBoxPLCE_CD1 <> '0' then        //검진장소
                        AND SUBSTR(EEA_PLCE_CD,1,1) = :CmbBoxPLCE_CD2

if :CmbSP_GUBN1 <> '0' then    //특검유형
                        AND EEA_SPCL_CD = :CmbSP_GUBN2

if :CmbSP_CHA = '1' then    //특검차수1차
                        AND ((EEA_EXAM_CD = '41001') or (EEA_SPSB_CD = '41001'))
else if :CmbSP_CHA = '2' then    //특검차수2차
                        AND ((EEA_EXAM_CD = '42001') or (EEA_SPSB_CD = '42001'))

if :cmbHlth_Kd = '1' then // 이상지질 대상여부
                        AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1)
                                                                                       ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END = '1'
else if :cmbHlth_Kd = '2' then // 이상지질 대상여부
                        AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1)
                                                                                       ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END <> '1'

                 ) LAST_G
            GROUP BY EEA_COMP_CD,  EEA_EXAM_CD,
                  ICY_COMP_NM, EEA_DEPT_NM, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_LT, EEA_SPCL_CD, EEA_FAMY_CD,
                  EEA_CUST_NO,
                  EEA_PSNL_NM,
                  IAU_PENL_NM,
                  EEP_CDMD_DT,
                  EEP_CDMDS_DT,EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID
           ) p UNPIVOT(CHUNGAMT for CHUNGGB IN (일반,특검,학생)) UNPVT
       WHERE 0=0
             AND
             CASE
                 WHEN CHUNGGB  in('일반','학생')
                 THEN EEP_CDMD_DT
                 ELSE NULL
             END IS NULL
             AND
             CASE
                 WHEN CHUNGGB='특검'
                 THEN EEP_CDMDS_DT
                 ELSE NULL
             END IS NULL

if :CK_Chung_Crt = '1' then
begin
             AND
             CASE
               WHEN  CHUNGGB in('일반') THEN  (select MAX(BCL_BILL_KD) BCL_BILL_KD  from BT_BILL_COMP_LIST T  where EEA_EXAM_DT=T.BCL_EXAM_DT and EEA_EXAM_SQ=T.BCL_EXAM_SQ  and T.BCL_BILL_KD = '31')                           '
               WHEN  CHUNGGB in('특검') THEN  (select MAX(BCL_BILL_KD) BCL_BILL_KD from BT_BILL_COMP_LIST T  where EEA_EXAM_DT=T.BCL_EXAM_DT and EEA_EXAM_SQ=T.BCL_EXAM_SQ  and T.BCL_BILL_KD = '32')                           '
               ELSE  (select MAX(BCL_BILL_KD) BCL_BILL_KD from BT_BILL_COMP_LIST T  where EEA_EXAM_DT=T.BCL_EXAM_DT and EEA_EXAM_SQ=T.BCL_EXAM_SQ)                           '
             END IS NULL
end;

if :rz_chkd <> '0' then
begin
             AND CHUNGGB = :Chungb
end;

if :COMP_CD <> '' then
begin
             AND EEA_COMP_CD = :COMP_CD
end;

      ) LAST_T   WHERE  CHUNGAMT > 0
GROUP BY EEA_COMP_CD, EEA_EXAM_CD,
      ICY_COMP_NM, EEA_DEPT_NM, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_LT, EEA_SPCL_CD, EEA_FAMY_CD,
      EEA_CUST_NO,
      EEA_PSNL_NM,
      IAU_PENL_NM,
      CHUNGGB  ,EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID

if :CmbBoxSort = '0' then               //성명
  order by  EEA_PSNL_NM
else if :CmbBoxSort = '1' then
  order by  EEA_DEPT_NM, EEA_PSNL_NM
else if :CmbBoxSort = '2' then
  order by  EEA_EXAM_DT, EEA_PSNL_NM
		*/

		sql = " SELECT EEA_COMP_CD, EEA_EXAM_CD, ICY_COMP_NM, EEA_DEPT_NM, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_LT, EEA_SPCL_CD, EEA_CUST_NO, EEA_PSNL_NM, IAU_PENL_NM, EEA_EXAM_DT,EEA_EXAM_SQ, ICR_PENL_ID, (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE='0919'";
		sql += " AND CCN_SMALL='01') EEA_FAMY_CD, CASE WHEN CHUNGGB ='특검' THEN CASE WHEN EEA_SPHT_CD = '1' THEN '일특' ELSE '특검' END || CASE WHEN EEA_EXAM_CD = '41001' THEN '1차' WHEN EEA_EXAM_CD = '42001' THEN '2차' WHEN EEA_SPSB_CD = '41001' THEN '1차' WHEN EEA_SPSB_CD = '42001' THEN '2차' END ELSE CHUNGGB END CHUNGGB, SUM(EEA_DISC_CPR) EEA_DISC_CPR, SUM(CHUNGAMT) - SUM(EEA_DISC_CPR) CHUNGAMT , SUM(NVL(EEP_PSNL_PR, 0)) EEP_PSNL_PR";
		sql += " FROM ( SELECT EEA_COMP_CD, EEA_EXAM_CD, ICY_COMP_NM, EEA_DEPT_NM, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_LT, EEA_SPCL_CD, EEA_FAMY_CD, EEA_CUST_NO, EEA_PSNL_NM, IAU_PENL_NM , EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID, CASE WHEN CHUNGGB IN ('일반','학생') THEN EEP_CDMD_DT ELSE NULL END EEP_CDMD_DT, CASE WHEN CHUNGGB='특검' THEN EEP_CDMDS_DT ELSE NULL END EEP_CDMDS_DT, CHUNGGB, EEA_DISC_CPR, CHUNGAMT, CASE WHEN CHUNGGB IN('일반','학생') THEN EEP_PSNL_PR END EEP_PSNL_PR";
		sql += " FROM ( SELECT EEA_COMP_CD, EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID, EEA_EXAM_CD, ICY_COMP_NM, EEA_DEPT_NM, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_LT, EEA_SPCL_CD, EEA_FAMY_CD, EEA_CUST_NO, EEA_PSNL_NM, IAU_PENL_NM, EEP_CDMD_DT, EEP_CDMDS_DT, MAX(NVL(EEA_DISC_CPR,0)) EEA_DISC_CPR, SUM(EEP_COMP_PR) 일반, SUM(EEP_COMPS_PR) 특검, SUM(EEP_STUD_PR) 학생, CASE WHEN SUM( EEP_COMP_PR)> 0 THEN SUM(EEP_PSNL_PR) ELSE SUM(EEP_PSNL_PR) END EEP_PSNL_PR";
		sql += " FROM ( SELECT A.EEA_COMP_CD, EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID, EEA_EXAM_CD, C.ICY_COMP_NM, EEA_DEPT_NM, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_LT, EEA_SPCL_CD, EEA_FAMY_CD, A.EEA_CUST_NO, A.EEA_PSNL_NM, D.IAU_PENL_NM, B.EEP_CDMD_DT, B.EEP_CDMDS_DT, EEA_DISC_CPR, CASE WHEN EEA_EXAM_CD NOT LIKE '31%' THEN (B.EEP_COMP_PR) END EEP_COMP_PR, CASE WHEN EEA_EXAM_CD NOT LIKE '31%' THEN (B.EEP_COMPS_PR) END EEP_COMPS_PR, CASE WHEN EEA_EXAM_CD LIKE '31%' THEN (B.EEP_COMPS_PR||B.EEP_COMP_PR) END EEP_STUD_PR, (B.EEP_PSNLP_PR) EEP_PSNLP_PR , CASE WHEN EEA_RECE_KD<>'2' THEN EEP_PSNL_PR ELSE 0 END EEP_PSNL_PR";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_EXAM_PRICE B";
		sql += " ON A.EEA_EXAM_DT = B.EEP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN IT_AUTH_USER D";
		sql += " ON C.ICY_SALE_ID = D.IAU_EMP_NO LEFT OUTER JOIN IT_CUSTOMER E";
		sql += " ON A.EEA_CUST_NO=E.ICR_CUST_NO";
		sql += " WHERE NVL(A.EEA_COMP_CD, ' ') <> ' '";
		sql += " AND EEA_EXAM_DT >= '" + DP_FROMDT + "'";
		sql += " AND EEA_EXAM_DT <= '" + DP_TODT + "'";
		sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND EEA_ORDER_YN <> 'C'";

		if(!CMBBOXPLCE_CD1.equals("0")) {
			sql += " AND SUBSTR(EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD2 + "'";
		}
		
		if(!CMBSP_GUBN1.equals("0")) {
			sql += " AND EEA_SPCL_CD = '" + CMBSP_GUBN2 + "'";
		}
		
		if(CMBSP_CHA.equals("1")) {
			sql += " AND ((EEA_EXAM_CD = '41001')";
			sql += " OR (EEA_SPSB_CD = '41001'))";
		}
		else if(CMBSP_CHA.equals("2")) {
			sql += " AND ((EEA_EXAM_CD = '42001')";
			sql += " OR (EEA_SPSB_CD = '42001'))";
		}
		
		if(CMBHLTH_KD.equals("1")) {
			sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END = '1'";
		}
		else if(CMBHLTH_KD.equals("2")) {
			sql += " AND CASE WHEN EEA_HTSB_CD IN ('11001', '12001', '12003') THEN SUBSTR(NVL(EEA_HLTH_KD, '1'), 1, 1) ELSE SUBSTR(NVL(EEA_HLTH_KD, '0'), 1, 1) END <> '1'";
		}

		sql += " ) LAST_G";
		sql += " GROUP BY EEA_COMP_CD, EEA_EXAM_CD, ICY_COMP_NM, EEA_DEPT_NM, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_LT, EEA_SPCL_CD, EEA_FAMY_CD, EEA_CUST_NO, EEA_PSNL_NM, IAU_PENL_NM, EEP_CDMD_DT, EEP_CDMDS_DT,EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID ) P UNPIVOT(CHUNGAMT FOR CHUNGGB IN (일반,특검,학생)) UNPVT";
		sql += " WHERE 0=0";
		sql += " AND CASE WHEN CHUNGGB IN('일반','학생') THEN EEP_CDMD_DT ELSE NULL END IS NULL";
		sql += " AND CASE WHEN CHUNGGB='특검' THEN EEP_CDMDS_DT ELSE NULL END IS NULL";

		if(CK_CHUNG_CRT.equals("1")) {
			sql += " AND CASE WHEN CHUNGGB IN('일반') THEN (SELECT MAX(BCL_BILL_KD) BCL_BILL_KD";
			sql += " FROM BT_BILL_COMP_LIST T";
			sql += " WHERE EEA_EXAM_DT=T.BCL_EXAM_DT";
			sql += " AND EEA_EXAM_SQ=T.BCL_EXAM_SQ";
			sql += " AND T.BCL_BILL_KD = '31') WHEN CHUNGGB IN('특검') THEN (SELECT MAX(BCL_BILL_KD) BCL_BILL_KD";
			sql += " FROM BT_BILL_COMP_LIST T";
			sql += " WHERE EEA_EXAM_DT=T.BCL_EXAM_DT";
			sql += " AND EEA_EXAM_SQ=T.BCL_EXAM_SQ";
			sql += " AND T.BCL_BILL_KD = '32') ELSE (SELECT MAX(BCL_BILL_KD) BCL_BILL_KD";
			sql += " FROM BT_BILL_COMP_LIST T";
			sql += " WHERE EEA_EXAM_DT=T.BCL_EXAM_DT";
			sql += " AND EEA_EXAM_SQ=T.BCL_EXAM_SQ) END IS NULL";
		}
		
		if(!RZ_CHKD.equals("0")) {
			sql += " AND CHUNGGB = '" + CHUNGB + "'";
		}
		
		if(!COMP_CD.equals("")) {
			sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
		}

		sql += " ) LAST_T";
		sql += " WHERE CHUNGAMT > 0";
		sql += " GROUP BY EEA_COMP_CD, EEA_EXAM_CD, ICY_COMP_NM, EEA_DEPT_NM, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_LT, EEA_SPCL_CD, EEA_FAMY_CD, EEA_CUST_NO, EEA_PSNL_NM, IAU_PENL_NM, CHUNGGB ,EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID";

		if(CMBBOXSORT.equals("0")) {
			sql += " ORDER BY EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("1")) {
			sql += " ORDER BY EEA_DEPT_NM, EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("2")) {
			sql += " ORDER BY EEA_EXAM_DT, EEA_PSNL_NM";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ChungGU_Move_Up_afload_per_001 \n";
			G_INFO += "설명 : 취급물질 추가정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " CMBBOXPLCE_CD1 : " + CMBBOXPLCE_CD1 + " \n";
			G_INFO += " CMBBOXPLCE_CD2 : " + CMBBOXPLCE_CD2 + " \n";
			G_INFO += " CMBSP_GUBN1 : " + CMBSP_GUBN1 + " \n";
			G_INFO += " CMBSP_GUBN2 : " + CMBSP_GUBN2 + " \n";
			G_INFO += " CMBSP_CHA : " + CMBSP_CHA + " \n";
			G_INFO += " CMBHLTH_KD : " + CMBHLTH_KD + " \n";
			G_INFO += " CK_CHUNG_CRT : " + CK_CHUNG_CRT + " \n";
			G_INFO += " RZ_CHKD : " + RZ_CHKD + " \n";
			G_INFO += " CHUNGB : " + CHUNGB + " \n";
			G_INFO += " CMBBOXSORT : " + CMBBOXSORT + " \n";
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
		<s:AttributeType name='EEA_COMP_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='120'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPHT_CD' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_CD' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_CD' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='CHUNGGB' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DISC_CPR' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CHUNGAMT' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_PSNL_PR' rs:number='19' rs:nullable='true'>
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

			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_SPHT_CD_T = cRsList.getString("EEA_SPHT_CD");
			String EEA_SPSB_CD_T = cRsList.getString("EEA_SPSB_CD");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String EEA_FAMY_CD_T = cRsList.getString("EEA_FAMY_CD");
			String CHUNGGB_T = cRsList.getString("CHUNGGB");
			String EEA_DISC_CPR_T = cRsList.getString("EEA_DISC_CPR");
			String CHUNGAMT_T = cRsList.getString("CHUNGAMT");
			String EEP_PSNL_PR_T = cRsList.getString("EEP_PSNL_PR");
%>
			<z:row
<%
			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! EEA_SPHT_CD_T.equals("")) {
%>
		 		EEA_SPHT_CD='<%= EEA_SPHT_CD_T%>'
<%
			}

			if(! EEA_SPSB_CD_T.equals("")) {
%>
		 		EEA_SPSB_CD='<%= EEA_SPSB_CD_T%>'
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

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
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

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! EEA_FAMY_CD_T.equals("")) {
%>
		 		EEA_FAMY_CD='<%= EEA_FAMY_CD_T%>'
<%
			}

			if(! CHUNGGB_T.equals("")) {
%>
		 		CHUNGGB='<%= CHUNGGB_T%>'
<%
			}

			if(! EEA_DISC_CPR_T.equals("")) {
%>
		 		EEA_DISC_CPR='<%= EEA_DISC_CPR_T%>'
<%
			}

			if(! CHUNGAMT_T.equals("")) {
%>
		 		CHUNGAMT='<%= CHUNGAMT_T%>'
<%
			}

			if(! EEP_PSNL_PR_T.equals("")) {
%>
		 		EEP_PSNL_PR='<%= EEP_PSNL_PR_T%>'
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
