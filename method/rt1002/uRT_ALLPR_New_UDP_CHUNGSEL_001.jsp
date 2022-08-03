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

		String AREXAMNM1 = htMethod.get("AREXAMNM1");
		String AREXAMNM2 = htMethod.get("AREXAMNM2");
		String AREXAMNM3 = htMethod.get("AREXAMNM3");
		String AREXAMNM4 = htMethod.get("AREXAMNM4");
		String AREXAMNM5 = htMethod.get("AREXAMNM5");
		String AREXAMNM6 = htMethod.get("AREXAMNM6");
		String AREXAMNM7 = htMethod.get("AREXAMNM7");
		String AREXAMNM8 = htMethod.get("AREXAMNM8");
		String AREXAMNM9 = htMethod.get("AREXAMNM9");
		String AREXAMNM10 = htMethod.get("AREXAMNM10");
		String AREXAMNM11 = htMethod.get("AREXAMNM11");
		String AREXAMNM12 = htMethod.get("AREXAMNM12");
		String AREXAMNM13 = htMethod.get("AREXAMNM13");
		String AREXAMNM14 = htMethod.get("AREXAMNM14");
		String AREXAMNM15 = htMethod.get("AREXAMNM15");
		String AREXAMNM16 = htMethod.get("AREXAMNM16");
		String AREXAMNM17 = htMethod.get("AREXAMNM17");
		String AREXAMNM18 = htMethod.get("AREXAMNM18");
		String AREXAMNM19 = htMethod.get("AREXAMNM19");
		String AREXAMNM20 = htMethod.get("AREXAMNM20");
		String AREXAMNM21 = htMethod.get("AREXAMNM21");
		String RZ_SELECT_KD = htMethod.get("RZ_SELECT_KD");
		String ALLFROMDT = htMethod.get("ALLFROMDT");
		String ALLTODT = htMethod.get("ALLTODT");
		String ADD_AFPR_YN = htMethod.get("ADD_AFPR_YN");
		String RZ_CMBPLE1 = htMethod.get("RZ_CMBPLE1");
		String RZ_CMBPLE2 = htMethod.get("RZ_CMBPLE2");
		String DISC_KD = htMethod.get("DISC_KD");

		//
		if(AREXAMNM1 == null) { AREXAMNM1 = ""; }
		if(AREXAMNM2 == null) { AREXAMNM2 = ""; }
		if(AREXAMNM3 == null) { AREXAMNM3 = ""; }
		if(AREXAMNM4 == null) { AREXAMNM4 = ""; }
		if(AREXAMNM5 == null) { AREXAMNM5 = ""; }
		if(AREXAMNM6 == null) { AREXAMNM6 = ""; }
		if(AREXAMNM7 == null) { AREXAMNM7 = ""; }
		if(AREXAMNM8 == null) { AREXAMNM8 = ""; }
		if(AREXAMNM9 == null) { AREXAMNM9 = ""; }
		if(AREXAMNM10 == null) { AREXAMNM10 = ""; }
		if(AREXAMNM11 == null) { AREXAMNM11 = ""; }
		if(AREXAMNM12 == null) { AREXAMNM12 = ""; }
		if(AREXAMNM13 == null) { AREXAMNM13 = ""; }
		if(AREXAMNM14 == null) { AREXAMNM14 = ""; }
		if(AREXAMNM15 == null) { AREXAMNM15 = ""; }
		if(AREXAMNM16 == null) { AREXAMNM16 = ""; }
		if(AREXAMNM17 == null) { AREXAMNM17 = ""; }
		if(AREXAMNM18 == null) { AREXAMNM18 = ""; }
		if(AREXAMNM19 == null) { AREXAMNM19 = ""; }
		if(AREXAMNM20 == null) { AREXAMNM20 = ""; }
		if(AREXAMNM21 == null) { AREXAMNM21 = ""; }
		if(RZ_SELECT_KD == null) { RZ_SELECT_KD = ""; }
		if(ALLFROMDT == null) { ALLFROMDT = ""; }
		if(ALLTODT == null) { ALLTODT = ""; }
		if(ADD_AFPR_YN == null) { ADD_AFPR_YN = ""; }
		if(RZ_CMBPLE1 == null) { RZ_CMBPLE1 = ""; }
		if(RZ_CMBPLE2 == null) { RZ_CMBPLE2 = ""; }
		if(DISC_KD == null) { DISC_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

  select mm.OCCUR_DT, mm.EEA_EXAM_DT, mm.EEA_EXAM_SQ, EEA_PSNL_NM, EEA_CUST_NO
      ,F_COMP_FIND(EEA_COMP_CD) COMP_NM
      ,case
         when EEA_EXAM_CD in ('11001','12001','12003') then :arExamNm1
         when EEA_EXAM_CD in ('11002','12002','12004') then :arExamNm2
         when EEA_EXAM_CD in ('13001') then :arExamNm3
         when EEA_EXAM_CD in ('15001') then :arExamNm4
         when EEA_EXAM_CD in ('14001','14002') then :arExamNm5
         when EEA_EXAM_CD in ('21001') then :arExamNm6
         when EEA_EXAM_CD in ('51001') then :arExamNm7
         when EEA_EXAM_CD in ('61001') then :arExamNm8
         when EEA_EXAM_CD in ('32001') then :arExamNm9
         when EEA_EXAM_CD in ('31001') then :arExamNm10
         when EEA_EXAM_CD in ('31006') then :arExamNm11
         when EEA_EXAM_CD in ('91002') then :arExamNm12
         when EEA_EXAM_CD in ('91005') then :arExamNm13
         when EEA_EXAM_CD in ('91003') then :arExamNm14
         when EEA_EXAM_CD in ('91004') then :arExamNm15
         when EEA_EXAM_CD in ('91099' ,'91006','91001','81001') then :arExamNm16
         when EEA_EXAM_CD in ('41001') then :arExamNm17
         when EEA_EXAM_CD in ('42001') then :arExamNm18
         when EEA_EXAM_CD in ('71001') then :arExamNm19
         when EEA_EXAM_CD in ('91007') then :arExamNm20
         else :arExamNm21
      end  EXAM_NM
     ,EEP_HDMD_PR+EEP_SDMD_PR+EEP_COMPS_PR+EEP_COMP_PR+EEP_PSNL_PR+EEP_PSNLP_PR TOT_PR
     ,EEP_HDMD_PR,EEP_SDMD_PR,(EEP_COMPS_PR+EEP_COMP_PR) EEP_COMP_PR
     ,EEP_PSNL_PR ,EEP_PSNLP_PR
     ,RRM_SALE_TD_PR,RRM_TRUNC_TD_PR,RRM_RESEREPL_PR
     ,RRM_OVERPAY_PR,RRM_RECE_TD_PR,RRM_RETURN_PR_71,RRM_RETURN_PR_72, DIMISU_PR
     ,RRM_RECE_CARD_PR ,RRM_RECE_CASH_PR
from (
      select  OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ
            , sum(NVL(EEP_HDMD_PR,0)) EEP_HDMD_PR, sum(NVL(EEP_SDMD_PR,0)) EEP_SDMD_PR, sum(NVL(EEP_COMPS_PR,0)) EEP_COMPS_PR
                   , sum(NVL(EEP_COMP_PR,0)) EEP_COMP_PR, sum(NVL(EEP_PSNL_PR,0)) EEP_PSNL_PR , sum(NVL(EEP_PSNLP_PR,0)) EEP_PSNLP_PR
                   , sum(NVL(RRM_SALE_TD_PR,0)) RRM_SALE_TD_PR, sum(NVL(RRM_TRUNC_TD_PR,0)) RRM_TRUNC_TD_PR, sum(NVL(RRM_RESEREPL_PR,0)) RRM_RESEREPL_PR
                   , sum(NVL(RRM_OVERPAY_PR,0)) RRM_OVERPAY_PR, sum(NVL(RRM_RECE_TD_PR,0)) RRM_RECE_TD_PR
                   , sum(NVL(RRM_RECE_CARD_PR,0)) RRM_RECE_CARD_PR, sum(NVL(RRM_RECE_CASH_PR,0)) RRM_RECE_CASH_PR
                   , sum(NVL(RRM_RETURN_PR_71,0)) RRM_RETURN_PR_71, sum(NVL(RRM_RETURN_PR_72,0)) RRM_RETURN_PR_72
                   , (sum(NVL(EEP_PSNL_PR,0)) - ( sum(NVL(RRM_SALE_TD_PR,0)) + sum(NVL(RRM_TRUNC_TD_PR,0)) + sum(NVL(RRM_RECE_TD_PR,0)) ) +  sum(NVL(RRM_RETURN_PR_71,0)) ) DIMISU_PR
      from (
            select EEP_ORDER_DT OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ
if :Rz_Select_Kd = '5' then
                 , EEA_EXAM_CD  EXAM_CD

                 ,EEP_HDMD_PR,  EEP_SDMD_PR, EEP_COMPS_PR ,EEP_COMP_PR, EEP_PSNL_PR ,EEP_PSNLP_PR

                 if :Disc_Kd = '1' then
                     , NVL(EEP_DISC_PR,0)  RRM_SALE_TD_PR
                else
                     , NVL(EEP_DISC_PR,0) + NVL(EEP_DISC_CPR ,0)  RRM_SALE_TD_PR

                 , 0 RRM_TRUNC_TD_PR, 0 RRM_RESEREPL_PR, 0 RRM_OVERPAY_PR, 0 RRM_RECE_TD_PR
                 ,0 RRM_RECE_CARD_PR, 0 RRM_RECE_CASH_PR
                 ,0 RRM_RETURN_PR_71, 0 RRM_RETURN_PR_72
            from ET_EXAM_PRICE left outer join  ET_EXAM_ACPT on EEP_EXAM_DT = EEA_EXAM_DT and EEP_EXAM_SQ = EEA_EXAM_SQ
            where EEP_ORDER_DT between :allFromdt AND :allTodt
              and EEA_ORDER_YN <> 'C'
              and EEA_INPT_ID <> '자료변환'
            union all
            select RRM_RECE_DT OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ
if :Rz_Select_Kd = '5' then
                  ,RRM_EXAM_CD  EXAM_CD

                  ,0 EEP_HDMD_PR, 0 EEP_SDMD_PR, 0 EEP_COMPS_PR , 0 EEP_COMP_PR, 0 EEP_PSNL_PR ,0 EEP_PSNLP_PR
                  ,case when RRM_OCCU_KD in ('20') then RRM_SALE_TD_PR  else 0 end RRM_SALE_TD_PR
                  ,case when RRM_OCCU_KD in ('20') then RRM_TRUNC_TD_PR else 0 end RRM_TRUNC_TD_PR
                  ,RRM_RESEREPL_PR
                  ,RRM_OVERPAY_PR

if :Add_Afpr_YN = 'Y' then
begin
                  ,case when RRM_OCCU_KD in ('20') then  (RRM_RECE_TD_PR + RRM_RECE_AF_PR)  else 0 end RRM_RECE_TD_PR
                  ,case when RRM_OCCU_KD in ('20') then
                        case when RRM_PAY_KD = '01' then  (RRM_RECE_TD_PR + RRM_RECE_AF_PR)  else 0 end
                   else 0 end RRM_RECE_CARD_PR
                  ,case when RRM_OCCU_KD in ('20') then
                        case when RRM_PAY_KD = '01' then 0 else  (RRM_RECE_TD_PR + RRM_RECE_AF_PR)  end
                   else 0 end RRM_RECE_CASH_PR
end
else
begin
                  ,case when RRM_OCCU_KD in ('20') then RRM_RECE_TD_PR else 0 end RRM_RECE_TD_PR
                  ,case when RRM_OCCU_KD in ('20') then
                        case when RRM_PAY_KD = '01' then RRM_RECE_TD_PR else 0 end
                   else 0 end RRM_RECE_CARD_PR
                  ,case when RRM_OCCU_KD in ('20') then
                        case when RRM_PAY_KD = '01' then 0 else RRM_RECE_TD_PR end
                   else 0 end RRM_RECE_CASH_PR
end;

                  ,case when RRM_OCCU_KD in ('70','71') then RRM_RETURN_PR else 0 end RRM_RETURN_PR_71
                  ,case when RRM_OCCU_KD in ('72') then RRM_RETURN_PR else 0 end RRM_RETURN_PR_72
            from RT_RECE_MEDICHK aa left outer join ET_EXAM_ACPT bb on aa.RRM_RECE_NO = bb.EEA_RECE_NO
            where RRM_RECE_DT between :allFromdt AND :allTodt
                  and aa.RRM_RECE_NO = bb.EEA_RECE_NO
                  and bb.EEA_ORDER_YN <> 'C'
                  and bb.EEA_INPT_ID <> '자료변환'
           ) a
      group by OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ
if :Rz_Select_Kd = '5' then
              ,EXAM_CD

     ) mm left outer join ET_EXAM_ACPT ee on mm.EEA_EXAM_DT = ee.EEA_EXAM_DT and mm.EEA_EXAM_SQ = ee.EEA_EXAM_SQ
where 1 = 1

if :Rz_cmbple1 <> '0' then
begin
  if :Rz_cmbple2 = '00' then
      AND SUBSTR(EEA_PLCE_CD,1,1) = :Rz_cmbple1
  else
      AND EEA_PLCE_CD = :Rz_cmbple2
end;

if :Rz_Select_Kd = '1' then
      and EEP_HDMD_PR <> 0
else if :Rz_Select_Kd = '2' then
      and EEP_SDMD_PR <> 0
else if :Rz_Select_Kd = '3' then
      and EEP_COMPS_PR+EEP_COMP_PR <> 0
else if :Rz_Select_Kd = '4' then
      and EEP_PSNL_PR <> 0
else if :Rz_Select_Kd = '5' then
      and DIMISU_PR <> 0
else if :Rz_Select_Kd = '6' then
      and RRM_OVERPAY_PR <> 0
else if :Rz_Select_Kd = '7' then
      and RRM_RETURN_PR_71+RRM_RETURN_PR_72 <> 0
else if :Rz_Select_Kd = '8' then
      and RRM_RECE_TD_PR <> 0

order by mm.OCCUR_DT, mm.EEA_EXAM_DT, mm.EEA_EXAM_SQ

* 20201021 : Add_Afpr_YN 조건 추가
		*/

		sql = " SELECT MM.OCCUR_DT, MM.EEA_EXAM_DT, MM.EEA_EXAM_SQ, EEA_PSNL_NM, EEA_CUST_NO ,F_COMP_FIND(EEA_COMP_CD) COMP_NM ,CASE WHEN EEA_EXAM_CD IN ('11001','12001','12003') THEN '" + AREXAMNM1 + "' WHEN EEA_EXAM_CD IN ('11002','12002','12004') THEN '" + AREXAMNM2 + "' WHEN EEA_EXAM_CD IN ('13001') THEN '" + AREXAMNM3 + "' WHEN EEA_EXAM_CD IN ('15001') THEN '" + AREXAMNM4 + "' WHEN EEA_EXAM_CD IN ('14001','14002') THEN '" + AREXAMNM5 + "' WHEN EEA_EXAM_CD IN ('21001') THEN '" + AREXAMNM6 + "' WHEN EEA_EXAM_CD IN ('51001') THEN '" + AREXAMNM7 + "' WHEN EEA_EXAM_CD IN ('61001') THEN '" + AREXAMNM8 + "' WHEN EEA_EXAM_CD IN ('32001') THEN '" + AREXAMNM9 + "' WHEN EEA_EXAM_CD IN ('31001') THEN '" + AREXAMNM10 + "' WHEN EEA_EXAM_CD IN ('31006') THEN '" + AREXAMNM11 + "' WHEN EEA_EXAM_CD IN ('91002') THEN '" + AREXAMNM12 + "' WHEN EEA_EXAM_CD IN ('91005') THEN '" + AREXAMNM13 + "' WHEN EEA_EXAM_CD IN ('91003') THEN '" + AREXAMNM14 + "' WHEN EEA_EXAM_CD IN ('91004') THEN '" + AREXAMNM15 + "' WHEN EEA_EXAM_CD IN ('91099' ,'91006','91001','81001') THEN '" + AREXAMNM16 + "' WHEN EEA_EXAM_CD IN ('41001') THEN '" + AREXAMNM17 + "' WHEN EEA_EXAM_CD IN ('42001') THEN '" + AREXAMNM18 + "' WHEN EEA_EXAM_CD IN ('71001') THEN '" + AREXAMNM19 + "' WHEN EEA_EXAM_CD IN ('91007') THEN '" + AREXAMNM20 + "' ELSE '" + AREXAMNM21 + "' END EXAM_NM ,EEP_HDMD_PR+EEP_SDMD_PR+EEP_COMPS_PR+EEP_COMP_PR+EEP_PSNL_PR+EEP_PSNLP_PR TOT_PR ,EEP_HDMD_PR,EEP_SDMD_PR,(EEP_COMPS_PR+EEP_COMP_PR) EEP_COMP_PR ,EEP_PSNL_PR ,EEP_PSNLP_PR ,RRM_SALE_TD_PR,RRM_TRUNC_TD_PR,RRM_RESEREPL_PR ,RRM_OVERPAY_PR,RRM_RECE_TD_PR,RRM_RETURN_PR_71,RRM_RETURN_PR_72, DIMISU_PR ,RRM_RECE_CARD_PR ,RRM_RECE_CASH_PR";
		sql += " FROM ( SELECT OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ , SUM(NVL(EEP_HDMD_PR,0)) EEP_HDMD_PR, SUM(NVL(EEP_SDMD_PR,0)) EEP_SDMD_PR, SUM(NVL(EEP_COMPS_PR,0)) EEP_COMPS_PR , SUM(NVL(EEP_COMP_PR,0)) EEP_COMP_PR, SUM(NVL(EEP_PSNL_PR,0)) EEP_PSNL_PR , SUM(NVL(EEP_PSNLP_PR,0)) EEP_PSNLP_PR , SUM(NVL(RRM_SALE_TD_PR,0)) RRM_SALE_TD_PR, SUM(NVL(RRM_TRUNC_TD_PR,0)) RRM_TRUNC_TD_PR, SUM(NVL(RRM_RESEREPL_PR,0)) RRM_RESEREPL_PR , SUM(NVL(RRM_OVERPAY_PR,0)) RRM_OVERPAY_PR, SUM(NVL(RRM_RECE_TD_PR,0)) RRM_RECE_TD_PR , SUM(NVL(RRM_RECE_CARD_PR,0)) RRM_RECE_CARD_PR, SUM(NVL(RRM_RECE_CASH_PR,0)) RRM_RECE_CASH_PR , SUM(NVL(RRM_RETURN_PR_71,0)) RRM_RETURN_PR_71, SUM(NVL(RRM_RETURN_PR_72,0)) RRM_RETURN_PR_72 , (SUM(NVL(EEP_PSNL_PR,0)) - ( SUM(NVL(RRM_SALE_TD_PR,0)) + SUM(NVL(RRM_TRUNC_TD_PR,0)) + SUM(NVL(RRM_RECE_TD_PR,0)) ) + SUM(NVL(RRM_RETURN_PR_71,0)) ) DIMISU_PR";
		sql += " FROM ( SELECT EEP_ORDER_DT OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ";

		if(RZ_SELECT_KD.equals("5")) {
			sql += " , EEA_EXAM_CD EXAM_CD";
		}

		sql += " ,EEP_HDMD_PR, EEP_SDMD_PR, EEP_COMPS_PR ,EEP_COMP_PR, EEP_PSNL_PR ,EEP_PSNLP_PR ";

		if(DISC_KD.equals("1")) {
			sql += ", NVL(EEP_DISC_PR,0) RRM_SALE_TD_PR";
		} else {
			sql += ", NVL(EEP_DISC_PR,0) + NVL(EEP_DISC_CPR ,0) RRM_SALE_TD_PR ";
		}
		sql += ", 0 RRM_TRUNC_TD_PR, 0 RRM_RESEREPL_PR, 0 RRM_OVERPAY_PR, 0 RRM_RECE_TD_PR ,0 RRM_RECE_CARD_PR, 0 RRM_RECE_CASH_PR ,0 RRM_RETURN_PR_71, 0 RRM_RETURN_PR_72 ";
		sql += " FROM ET_EXAM_PRICE LEFT OUTER JOIN ET_EXAM_ACPT";
		sql += " ON EEP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND EEP_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE EEP_ORDER_DT BETWEEN '" + ALLFROMDT + "'";
		sql += " AND '" + ALLTODT + "'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND EEA_INPT_ID <> '자료변환'";
		sql += " UNION";
		sql += " ALL SELECT RRM_RECE_DT OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ";

		if(RZ_SELECT_KD.equals("5")) {
			sql += " ,RRM_EXAM_CD EXAM_CD";
		}

		sql += " ,0 EEP_HDMD_PR, 0 EEP_SDMD_PR, 0 EEP_COMPS_PR , 0 EEP_COMP_PR, 0 EEP_PSNL_PR ,0 EEP_PSNLP_PR ,CASE WHEN RRM_OCCU_KD IN ('20') THEN RRM_SALE_TD_PR ELSE 0 END RRM_SALE_TD_PR ,CASE WHEN RRM_OCCU_KD IN ('20') THEN RRM_TRUNC_TD_PR ELSE 0 END RRM_TRUNC_TD_PR ,RRM_RESEREPL_PR ,RRM_OVERPAY_PR";

		if(ADD_AFPR_YN.equals("Y")) {
			sql += " ,CASE WHEN RRM_OCCU_KD IN ('20') THEN (RRM_RECE_TD_PR + RRM_RECE_AF_PR) ELSE 0 END RRM_RECE_TD_PR ,CASE WHEN RRM_OCCU_KD IN ('20') THEN CASE WHEN RRM_PAY_KD = '01' THEN (RRM_RECE_TD_PR + RRM_RECE_AF_PR) ELSE 0 END ELSE 0 END RRM_RECE_CARD_PR ,CASE WHEN RRM_OCCU_KD IN ('20') THEN CASE WHEN RRM_PAY_KD = '01' THEN 0 ELSE (RRM_RECE_TD_PR + RRM_RECE_AF_PR) END ELSE 0 END RRM_RECE_CASH_PR";
		} else {
			sql += " ,CASE WHEN RRM_OCCU_KD IN ('20') THEN RRM_RECE_TD_PR ELSE 0 END RRM_RECE_TD_PR ,CASE WHEN RRM_OCCU_KD IN ('20') THEN CASE WHEN RRM_PAY_KD = '01' THEN RRM_RECE_TD_PR ELSE 0 END ELSE 0 END RRM_RECE_CARD_PR ,CASE WHEN RRM_OCCU_KD IN ('20') THEN CASE WHEN RRM_PAY_KD = '01' THEN 0 ELSE RRM_RECE_TD_PR END ELSE 0 END RRM_RECE_CASH_PR";
		}

		sql += " ,CASE WHEN RRM_OCCU_KD IN ('70','71') THEN RRM_RETURN_PR ELSE 0 END RRM_RETURN_PR_71 ,CASE WHEN RRM_OCCU_KD IN ('72') THEN RRM_RETURN_PR ELSE 0 END RRM_RETURN_PR_72";
		sql += " FROM RT_RECE_MEDICHK AA LEFT OUTER JOIN ET_EXAM_ACPT BB";
		sql += " ON AA.RRM_RECE_NO = BB.EEA_RECE_NO";
		sql += " WHERE RRM_RECE_DT BETWEEN '" + ALLFROMDT + "'";
		sql += " AND '" + ALLTODT + "'";
		sql += " AND AA.RRM_RECE_NO = BB.EEA_RECE_NO";
		sql += " AND BB.EEA_ORDER_YN <> 'C'";
		sql += " AND BB.EEA_INPT_ID <> '자료변환' ) A";
		sql += " GROUP BY OCCUR_DT, EEA_EXAM_DT, EEA_EXAM_SQ";

		if(RZ_SELECT_KD.equals("5")) {
			sql += " ,EXAM_CD";
		}
		sql += " ) MM LEFT OUTER JOIN ET_EXAM_ACPT EE";
		sql += " ON MM.EEA_EXAM_DT = EE.EEA_EXAM_DT";
		sql += " AND MM.EEA_EXAM_SQ = EE.EEA_EXAM_SQ";
		sql += " WHERE 1 = 1";

		if(! RZ_CMBPLE1.equals("0")) {
			if(RZ_CMBPLE2.equals("00")) {
				sql += " AND SUBSTR(EEA_PLCE_CD,1,1) = '" + RZ_CMBPLE1 + "'";
			} else {
				sql += " AND EEA_PLCE_CD = '" + RZ_CMBPLE2 + "'";
			}
		}

		if(RZ_SELECT_KD.equals("1")) {
			sql += " AND EEP_HDMD_PR <> 0";
		}
		else if(RZ_SELECT_KD.equals("2")) {
			sql += " AND EEP_SDMD_PR <> 0";
		}
		else if(RZ_SELECT_KD.equals("3")) {
			sql += " AND EEP_COMPS_PR+EEP_COMP_PR <> 0";
		}
		else if(RZ_SELECT_KD.equals("4")) {
			sql += " AND EEP_PSNL_PR <> 0";
		}
		else if(RZ_SELECT_KD.equals("5")) {
			sql += " AND DIMISU_PR <> 0";
		}
		else if(RZ_SELECT_KD.equals("6")) {
			sql += " AND RRM_OVERPAY_PR <> 0";
		}
		else if(RZ_SELECT_KD.equals("7")) {
			sql += " AND RRM_RETURN_PR_71+RRM_RETURN_PR_72 <> 0";
		}
		else if(RZ_SELECT_KD.equals("8")) {
			sql += " AND RRM_RECE_TD_PR <> 0";
		}

		sql += " ORDER BY MM.OCCUR_DT, MM.EEA_EXAM_DT, MM.EEA_EXAM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_ALLPR_New_UDP_CHUNGSEL_001 \n";
			G_INFO += "설명 : 상세내역정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " AREXAMNM1 : " + AREXAMNM1 + " \n";
			G_INFO += " AREXAMNM2 : " + AREXAMNM2 + " \n";
			G_INFO += " AREXAMNM3 : " + AREXAMNM3 + " \n";
			G_INFO += " AREXAMNM4 : " + AREXAMNM4 + " \n";
			G_INFO += " AREXAMNM5 : " + AREXAMNM5 + " \n";
			G_INFO += " AREXAMNM6 : " + AREXAMNM6 + " \n";
			G_INFO += " AREXAMNM7 : " + AREXAMNM7 + " \n";
			G_INFO += " AREXAMNM8 : " + AREXAMNM8 + " \n";
			G_INFO += " AREXAMNM9 : " + AREXAMNM9 + " \n";
			G_INFO += " AREXAMNM10 : " + AREXAMNM10 + " \n";
			G_INFO += " AREXAMNM11 : " + AREXAMNM11 + " \n";
			G_INFO += " AREXAMNM12 : " + AREXAMNM12 + " \n";
			G_INFO += " AREXAMNM13 : " + AREXAMNM13 + " \n";
			G_INFO += " AREXAMNM14 : " + AREXAMNM14 + " \n";
			G_INFO += " AREXAMNM15 : " + AREXAMNM15 + " \n";
			G_INFO += " AREXAMNM16 : " + AREXAMNM16 + " \n";
			G_INFO += " AREXAMNM17 : " + AREXAMNM17 + " \n";
			G_INFO += " AREXAMNM18 : " + AREXAMNM18 + " \n";
			G_INFO += " AREXAMNM19 : " + AREXAMNM19 + " \n";
			G_INFO += " AREXAMNM20 : " + AREXAMNM20 + " \n";
			G_INFO += " AREXAMNM21 : " + AREXAMNM21 + " \n";
			G_INFO += " RZ_SELECT_KD : " + RZ_SELECT_KD + " \n";
			G_INFO += " ALLFROMDT : " + ALLFROMDT + " \n";
			G_INFO += " ALLTODT : " + ALLTODT + " \n";
			G_INFO += " ADD_AFPR_YN : " + ADD_AFPR_YN + " \n";
			G_INFO += " RZ_CMBPLE1 : " + RZ_CMBPLE1 + " \n";
			G_INFO += " RZ_CMBPLE2 : " + RZ_CMBPLE2 + " \n";
			G_INFO += " DISC_KD : " + DISC_KD + " \n";
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

					if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
						byte[] buf_BLOB = rsList.getBytes(rsmd.getColumnName(colCnt));
						if(buf_BLOB != null) {
							tempData = new String(buf_BLOB);
						}
					}

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
