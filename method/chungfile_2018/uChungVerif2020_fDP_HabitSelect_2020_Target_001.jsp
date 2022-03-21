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
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select * from (
   select EEA_EXAM_DT
      ,EEA_EXAM_SQ
      ,EEA_PSNL_NM
      ,EEA_MNGT_HTYR
      ,EEA_INSU_NO
      ,EEA_SEND_CD
      ,SUBSTR(EEA_HLTH_KD,7,1) EEA_HLTH_KD7
      ,REPLACE(PSP_RESULT_DATE,'-','') PSP_RESULT_DATE
      ,EEA_PLCE_CD
      ,'3' SENDGBN
      ,REPLACE(PSP_TRANC_DATE,'-','') PSP_TRANC_DATE
      ,IAU_LICEN1_NO
      ,IAU_PENL_NM
      ,IAU_PENL_ID
      ,REPLACE(EEA_EXAM_DT,'-','') EEA_INFO_DT  ,ICR_INFO_YN
      ,PSP_EXAM_DT
      ,PSP_FIX_YN
      ,PSP_EVALU_SM
      ,PSP_NICO_SM
      ,PSP_PRSCR_SM
      ,PSP_SCORE_SM
      ,PSP_EVALU_DRN
      ,PSP_PRSCR_DRN
      ,PSP_SCORE_DRN
      ,PSP_EVALU_SPT
      ,PSP_PRSCR_SPT
      ,PSP_PRSTM_SPT
      ,PSP_PRSNUM_SPT
      ,PSP_SCORE_SPT
      ,PSP_EVALU_NUT
      ,PSP_RECOMDAI_NUT
      ,PSP_RECOMPRO_NUT
      ,PSP_RECOMVEG_NUT
      ,PSP_RESTFAT_NUT
      ,PSP_RESTSGA_NUT
      ,PSP_RESTSALT_NUT
      ,PSP_BFAST_NUT
      ,PSP_ALLFOOD_NUT
      ,PSP_PRSCR_NUT
      ,PSP_SCORE_NUT
      ,PSP_BMI_PYC
      ,PSP_REPAST_PYC
      ,PSP_SNACK_PYC
      ,PSP_DRINK_PYC
      ,PSP_FASTFD_PYC
      ,PSP_SPORT_PYC
      ,PSP_CRINIC_PYC
      ,PSP_ETC_PYC
      ,PSP_PRSCR_SM_YN
      ,PSP_PRSCR_DRN_YN
      ,PSP_PRSCR_SPT_YN
      ,PSP_PRSCR_NUT_YN
      ,PSP_PRSCR_PYC_YN
      ,PLR_SMK_1
      ,PLR_SMK_2
      ,PLR_SMK_3
      ,PLR_SMK_4
      ,PLR_SMK_4_TX
      ,PLR_SMK_5
      ,PLR_SMK_6
      ,PLR_SMK_6_TX
      ,PLR_DRK_PR1
      ,PLR_DRK_PR1_YN
      ,PLR_DRK_PR2
      ,PLR_DRK_PR2_TX
      ,PLR_DRK_1
      ,PLR_DRK_2
      ,PLR_DRK_3
      ,PLR_DRK_3_TX
      ,PLR_EXCS_1
      ,PLR_EXCS_2_1
      ,PLR_EXCS_2_1_TX
      ,PLR_EXCS_2_2
      ,PLR_EXCS_2_2_TX
      ,PLR_EXCS_2_3
      ,PLR_EXCS_3
      ,PLR_EXCS_3_TX
      ,PLR_EXCS_4
      ,PLR_EXCS_4_TX
      ,PLR_NUTR_1
      ,SUBSTR(PLR_NUTR_2, 1, 3)||SUBSTR(PLR_NUTR_2, 5, 7) PLR_NUTR_2
      ,PLR_NUTR_3
      ,PLR_NUTR_3_TX
      ,PLR_NUTR_4
      ,PLR_NUTR_4_TX
      ,PLR_FAT_1
      ,PLR_FAT_2
      ,PLR_FAT_3
      ,PLR_FAT_4
      ,PLR_FAT_4_1
      ,PLR_FAT_4_2
      ,PLR_FAT_4_3
      ,PLR_FAT_4_4
      ,PLR_FAT_5
      ,PLR_FAT_5_TX
      ,PLR_FAT_6
      ,PLR_FAT_6_TX
      ,PLR_FAT_7
      ,PLR_FAT_7_TX
  from ET_EXAM_ACPT A left outer join IT_CUSTOMER B on A.EEA_CUST_NO =B.ICR_CUST_NO
                      left outer join PT_LIFE_PRESCR C on  A.EEA_EXAM_DT= C.PLR_EXAM_DT and A.EEA_EXAM_SQ= C.PLR_EXAM_SQ
                      left outer join PT_SED_PANJUNG D on  A.EEA_EXAM_DT= D.PSP_EXAM_DT and A.EEA_EXAM_SQ= D.PSP_EXAM_SQ
                      left outer join IT_AUTH_USER E ON D.PSP_DOCTORSED  =E.IAU_EMP_NO
  where EEA_EXAM_DT = :EXAM_DT  AND EEA_EXAM_SQ = :EXAM_SQ
  ) AAA
    left outer join
   (select QQN_EXAM_DT
          ,QQN_EXAM_SQ
          ,MAX(M464) M464,MAX(M465) M465,MAX(M466) M466,MAX(M467) M467,MAX(M468) M468
          ,MAX(M469) M469,MAX(M470) M470,MAX(M471) M471
          ,MAX(M984) M984,MAX(M933) M933,MAX(M934) M934,MAX(M935) M935,MAX(M496) M496
          ,MAX(M497) M497,MAX(M498) M498,MAX(M499) M499,MAX(M500) M500,MAX(M501) M501,MAX(M502) M502
          ,MAX(M937) M937,MAX(M938) M938,MAX(M940) M940,MAX(M941) M941
          ,MAX(M942) M942,MAX(M943) M943,MAX(M945) M945,MAX(M946) M946
          ,MAX(M948) M948,MAX(M949) M949,MAX(M951) M951,MAX(M952) M952
          ,MAX(M954) M954,MAX(M955) M955,MAX(M957) M957,MAX(M958) M958
          ,MAX(M959) M959,MAX(M960) M960,MAX(M962) M962,MAX(M963) M963
          ,MAX(M966) M966,MAX(M967) M967,MAX(M968) M968,MAX(M969) M969,MAX(M970) M970
          ,MAX(M971) M971,MAX(M972) M972,MAX(M973) M973,MAX(M974) M974,MAX(M975) M975
          ,MAX(M482) M482,MAX(M483) M483,MAX(M484) M484,MAX(M485) M485,MAX(M486) M486
          ,MAX(M487) M487,MAX(M488) M488,MAX(M489) M489,MAX(M490) M490,MAX(M491) M491,MAX(M492) M492
          ,MAX(M700) M700,MAX(M701) M701,MAX(M702) M702
    from (
          select  QQN_EXAM_DT, QQN_EXAM_SQ
                 ,case when IIQ_QGTN_CD='464' then    QQN_RESULT end M464
                 ,case when IIQ_QGTN_CD='465' then    QQN_RESULT end M465
                 ,case when IIQ_QGTN_CD='466' then    QQN_RESULT end M466
                 ,case when IIQ_QGTN_CD='467' then    QQN_RESULT end M467
                 ,case when IIQ_QGTN_CD='468' then    QQN_RESULT end M468
                 ,case when IIQ_QGTN_CD='469' then    QQN_RESULT end M469
                 ,case when IIQ_QGTN_CD='470' then    QQN_RESULT end M470
                 ,case when IIQ_QGTN_CD='471' then    QQN_RESULT end M471
                 ,case when IIQ_QGTN_CD='984' then    QQN_RESULT end M984
                 ,case when IIQ_QGTN_CD='933' then    QQN_RESULT end M933
                 ,case when IIQ_QGTN_CD='934' then    QQN_RESULT end M934
                 ,case when IIQ_QGTN_CD='935' then    QQN_RESULT end M935
                 ,case when IIQ_QGTN_CD='496' then    QQN_RESULT end M496
                 ,case when IIQ_QGTN_CD='497' then    QQN_RESULT end M497
                 ,case when IIQ_QGTN_CD='498' then    QQN_RESULT end M498
                 ,case when IIQ_QGTN_CD='499' then    QQN_RESULT end M499
                 ,case when IIQ_QGTN_CD='500' then    QQN_RESULT end M500
                 ,case when IIQ_QGTN_CD='501' then    QQN_RESULT end M501
                 ,case when IIQ_QGTN_CD='502' then    QQN_RESULT end M502
                 ,case when IIQ_QGTN_CD='937' then    QQN_RESULT end M937
                 ,case when IIQ_QGTN_CD='938' then    QQN_RESULT end M938
                 ,case when IIQ_QGTN_CD='940' then    QQN_RESULT end M940
                 ,case when IIQ_QGTN_CD='941' then    QQN_RESULT end M941
                 ,case when IIQ_QGTN_CD='942' then    QQN_RESULT end M942
                 ,case when IIQ_QGTN_CD='943' then    QQN_RESULT end M943
                 ,case when IIQ_QGTN_CD='945' then    QQN_RESULT end M945
                 ,case when IIQ_QGTN_CD='946' then    QQN_RESULT end M946
                 ,case when IIQ_QGTN_CD='948' then    QQN_RESULT end M948
                 ,case when IIQ_QGTN_CD='949' then    QQN_RESULT end M949
                 ,case when IIQ_QGTN_CD='951' then    QQN_RESULT end M951
                 ,case when IIQ_QGTN_CD='952' then    QQN_RESULT end M952
                 ,case when IIQ_QGTN_CD='954' then    QQN_RESULT end M954
                 ,case when IIQ_QGTN_CD='955' then    QQN_RESULT end M955
                 ,case when IIQ_QGTN_CD='957' then    QQN_RESULT end M957
                 ,case when IIQ_QGTN_CD='958' then    QQN_RESULT end M958
                 ,case when IIQ_QGTN_CD='959' then    QQN_RESULT end M959
                 ,case when IIQ_QGTN_CD='960' then    QQN_RESULT end M960
                 ,case when IIQ_QGTN_CD='962' then    QQN_RESULT end M962
                 ,case when IIQ_QGTN_CD='963' then    QQN_RESULT end M963
                 ,case when IIQ_QGTN_CD='966' then    QQN_RESULT end M966
                 ,case when IIQ_QGTN_CD='967' then    QQN_RESULT end M967
                 ,case when IIQ_QGTN_CD='968' then    QQN_RESULT end M968
                 ,case when IIQ_QGTN_CD='969' then    QQN_RESULT end M969
                 ,case when IIQ_QGTN_CD='970' then    QQN_RESULT end M970
                 ,case when IIQ_QGTN_CD='971' then    QQN_RESULT end M971
                 ,case when IIQ_QGTN_CD='972' then    QQN_RESULT end M972
                 ,case when IIQ_QGTN_CD='973' then    QQN_RESULT end M973
                 ,case when IIQ_QGTN_CD='974' then    QQN_RESULT end M974
                 ,case when IIQ_QGTN_CD='975' then    QQN_RESULT end M975
                 ,case when IIQ_QGTN_CD='482' then    QQN_RESULT end M482
                 ,case when IIQ_QGTN_CD='483' then    QQN_RESULT end M483
                 ,case when IIQ_QGTN_CD='484' then    QQN_RESULT end M484
                 ,case when IIQ_QGTN_CD='485' then    QQN_RESULT end M485
                 ,case when IIQ_QGTN_CD='486' then    QQN_RESULT end M486
                 ,case when IIQ_QGTN_CD='487' then    QQN_RESULT end M487
                 ,case when IIQ_QGTN_CD='488' then    QQN_RESULT end M488
                 ,case when IIQ_QGTN_CD='489' then    QQN_RESULT end M489
                 ,case when IIQ_QGTN_CD='490' then    QQN_RESULT end M490
                 ,case when IIQ_QGTN_CD='491' then    QQN_RESULT end M491
                 ,case when IIQ_QGTN_CD='492' then    QQN_RESULT end M492
                 ,case when IIQ_QGTN_CD='700' then    QQN_RESULT end M700
                 ,case when IIQ_QGTN_CD='701' then    QQN_RESULT end M701
                 ,case when IIQ_QGTN_CD='702' then    QQN_RESULT end M702
          from QT_QUESTION  A
               left outer join ET_EXAM_ACPT B ON A.QQN_EXAM_DT=B.EEA_EXAM_DT and A.QQN_EXAM_SQ=B.EEA_EXAM_SQ
               left outer join IT_CUSTOMER  C ON B.EEA_CUST_NO=C.ICR_CUST_NO
               left outer join  IT_ITEM_QUESTION D ON A.QQN_QSTN_CD=D.IIQ_QGTN_CD
                                                  and IIQ_APLY_DT= GetITEM_QUESTION_ApplyDate(IIQ_ITEM_CD,EEA_EXAM_DT)
         where EEA_EXAM_DT = :EXAM_DT  AND EEA_EXAM_SQ = :EXAM_SQ
           and IIQ_ITEM_CD IN ('M0021','M0022','M0023','M0024','M0025')
           and EEA_HTSB_CD in ('11001','12003')
         ) TTT
    group by QQN_EXAM_DT, QQN_EXAM_SQ
   ) BBB ON AAA.EEA_EXAM_DT = BBB.QQN_EXAM_DT
       and AAA.EEA_EXAM_SQ = BBB.QQN_EXAM_SQ
   order by  AAA.EEA_EXAM_DT, AAA.EEA_PSNL_NM
		*/

		sql = " SELECT *";
		sql += " FROM (";
		sql += "	SELECT EEA_EXAM_DT ,EEA_EXAM_SQ ,EEA_PSNL_NM ,EEA_MNGT_HTYR ,EEA_INSU_NO ,EEA_SEND_CD ,SUBSTR(EEA_HLTH_KD,7,1) EEA_HLTH_KD7 ,REPLACE(PSP_RESULT_DATE,'-','') PSP_RESULT_DATE ,EEA_PLCE_CD ,'3' SENDGBN ,REPLACE(PSP_TRANC_DATE,'-','') PSP_TRANC_DATE ,IAU_LICEN1_NO ,IAU_PENL_NM ,IAU_PENL_ID ,REPLACE(EEA_EXAM_DT,'-','') EEA_INFO_DT ,ICR_INFO_YN ,PSP_EXAM_DT ,PSP_FIX_YN ,PSP_EVALU_SM ,PSP_NICO_SM ,PSP_PRSCR_SM ,PSP_SCORE_SM ,PSP_EVALU_DRN ,PSP_PRSCR_DRN ,PSP_SCORE_DRN ,PSP_EVALU_SPT ,PSP_PRSCR_SPT ,PSP_PRSTM_SPT ,PSP_PRSNUM_SPT ,PSP_SCORE_SPT ,PSP_EVALU_NUT ,PSP_RECOMDAI_NUT ,PSP_RECOMPRO_NUT ,PSP_RECOMVEG_NUT ,PSP_RESTFAT_NUT ,PSP_RESTSGA_NUT ,PSP_RESTSALT_NUT ,PSP_BFAST_NUT ,PSP_ALLFOOD_NUT ,PSP_PRSCR_NUT ,PSP_SCORE_NUT ,PSP_BMI_PYC ,PSP_REPAST_PYC ,PSP_SNACK_PYC ,PSP_DRINK_PYC ,PSP_FASTFD_PYC ,PSP_SPORT_PYC ,PSP_CRINIC_PYC ,PSP_ETC_PYC ,PSP_PRSCR_SM_YN ,PSP_PRSCR_DRN_YN ,PSP_PRSCR_SPT_YN ,PSP_PRSCR_NUT_YN ,PSP_PRSCR_PYC_YN ,PLR_SMK_1 ,PLR_SMK_2 ,PLR_SMK_3 ,PLR_SMK_4 ,PLR_SMK_4_TX ,PLR_SMK_5 ,PLR_SMK_6 ,PLR_SMK_6_TX ,PLR_DRK_PR1 ,PLR_DRK_PR1_YN ,PLR_DRK_PR2 ,PLR_DRK_PR2_TX ,PLR_DRK_1 ,PLR_DRK_2 ,PLR_DRK_3 ,PLR_DRK_3_TX ,PLR_EXCS_1 ,PLR_EXCS_2_1 ,PLR_EXCS_2_1_TX ,PLR_EXCS_2_2 ,PLR_EXCS_2_2_TX ,PLR_EXCS_2_3 ,PLR_EXCS_3 ,PLR_EXCS_3_TX ,PLR_EXCS_4 ,PLR_EXCS_4_TX ,PLR_NUTR_1 ,SUBSTR(PLR_NUTR_2, 1, 3)||SUBSTR(PLR_NUTR_2, 5, 7) PLR_NUTR_2 ,PLR_NUTR_3 ,PLR_NUTR_3_TX ,PLR_NUTR_4 ,PLR_NUTR_4_TX ,PLR_FAT_1 ,PLR_FAT_2 ,PLR_FAT_3 ,PLR_FAT_4 ,PLR_FAT_4_1 ,PLR_FAT_4_2 ,PLR_FAT_4_3 ,PLR_FAT_4_4 ,PLR_FAT_5 ,PLR_FAT_5_TX ,PLR_FAT_6 ,PLR_FAT_6_TX ,PLR_FAT_7 ,PLR_FAT_7_TX";
		sql += " 	FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " 	ON A.EEA_CUST_NO =B.ICR_CUST_NO LEFT OUTER JOIN PT_LIFE_PRESCR C";
		sql += " 	ON A.EEA_EXAM_DT= C.PLR_EXAM_DT";
		sql += " 	AND A.EEA_EXAM_SQ= C.PLR_EXAM_SQ LEFT OUTER JOIN PT_SED_PANJUNG D";
		sql += " 	ON A.EEA_EXAM_DT= D.PSP_EXAM_DT";
		sql += " 	AND A.EEA_EXAM_SQ= D.PSP_EXAM_SQ LEFT OUTER JOIN IT_AUTH_USER E";
		sql += " 	ON D.PSP_DOCTORSED =E.IAU_EMP_NO";
		sql += " 	WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " ) AAA LEFT OUTER JOIN (";
		sql += "	SELECT QQN_EXAM_DT ,QQN_EXAM_SQ ,MAX(M464) M464,MAX(M465) M465,MAX(M466) M466,MAX(M467) M467,MAX(M468) M468 ,MAX(M469) M469,MAX(M470) M470,MAX(M471) M471 ,MAX(M984) M984,MAX(M933) M933,MAX(M934) M934,MAX(M935) M935,MAX(M496) M496 ,MAX(M497) M497,MAX(M498) M498,MAX(M499) M499,MAX(M500) M500,MAX(M501) M501,MAX(M502) M502 ,MAX(M937) M937,MAX(M938) M938,MAX(M940) M940,MAX(M941) M941 ,MAX(M942) M942,MAX(M943) M943,MAX(M945) M945,MAX(M946) M946 ,MAX(M948) M948,MAX(M949) M949,MAX(M951) M951,MAX(M952) M952 ,MAX(M954) M954,MAX(M955) M955,MAX(M957) M957,MAX(M958) M958 ,MAX(M959) M959,MAX(M960) M960,MAX(M962) M962,MAX(M963) M963 ,MAX(M966) M966,MAX(M967) M967,MAX(M968) M968,MAX(M969) M969,MAX(M970) M970 ,MAX(M971) M971,MAX(M972) M972,MAX(M973) M973,MAX(M974) M974,MAX(M975) M975 ,MAX(M482) M482,MAX(M483) M483,MAX(M484) M484,MAX(M485) M485,MAX(M486) M486 ,MAX(M487) M487,MAX(M488) M488,MAX(M489) M489,MAX(M490) M490,MAX(M491) M491,MAX(M492) M492 ,MAX(M700) M700,MAX(M701) M701,MAX(M702) M702";
		sql += " 	FROM (";
		sql += "		SELECT QQN_EXAM_DT, QQN_EXAM_SQ";
		sql += "		, CASE WHEN IIQ_QGTN_CD='464' THEN QQN_RESULT END M464";
		sql += "		, CASE WHEN IIQ_QGTN_CD='465' THEN QQN_RESULT END M465";
		sql += "		, CASE WHEN IIQ_QGTN_CD='466' THEN QQN_RESULT END M466";
		sql += "		, CASE WHEN IIQ_QGTN_CD='467' THEN QQN_RESULT END M467";
		sql += "		, CASE WHEN IIQ_QGTN_CD='468' THEN QQN_RESULT END M468";
		sql += "		, CASE WHEN IIQ_QGTN_CD='469' THEN QQN_RESULT END M469";
		sql += "		, CASE WHEN IIQ_QGTN_CD='470' THEN QQN_RESULT END M470";
		sql += "		, CASE WHEN IIQ_QGTN_CD='471' THEN QQN_RESULT END M471";
		sql += "		, CASE WHEN IIQ_QGTN_CD='984' THEN QQN_RESULT END M984";
		sql += "		, CASE WHEN IIQ_QGTN_CD='933' THEN QQN_RESULT END M933";
		sql += "		, CASE WHEN IIQ_QGTN_CD='934' THEN QQN_RESULT END M934";
		sql += "		, CASE WHEN IIQ_QGTN_CD='935' THEN QQN_RESULT END M935";
		sql += "		, CASE WHEN IIQ_QGTN_CD='496' THEN QQN_RESULT END M496";
		sql += "		, CASE WHEN IIQ_QGTN_CD='497' THEN QQN_RESULT END M497";
		sql += "		, CASE WHEN IIQ_QGTN_CD='498' THEN QQN_RESULT END M498";
		sql += "		, CASE WHEN IIQ_QGTN_CD='499' THEN QQN_RESULT END M499";
		sql += "		, CASE WHEN IIQ_QGTN_CD='500' THEN QQN_RESULT END M500";
		sql += "		, CASE WHEN IIQ_QGTN_CD='501' THEN QQN_RESULT END M501";
		sql += "		, CASE WHEN IIQ_QGTN_CD='502' THEN QQN_RESULT END M502";
		sql += "		, CASE WHEN IIQ_QGTN_CD='937' THEN QQN_RESULT END M937";
		sql += "		, CASE WHEN IIQ_QGTN_CD='938' THEN QQN_RESULT END M938";
		sql += "		, CASE WHEN IIQ_QGTN_CD='940' THEN QQN_RESULT END M940";
		sql += "		, CASE WHEN IIQ_QGTN_CD='941' THEN QQN_RESULT END M941";
		sql += "		, CASE WHEN IIQ_QGTN_CD='942' THEN QQN_RESULT END M942";
		sql += "		, CASE WHEN IIQ_QGTN_CD='943' THEN QQN_RESULT END M943";
		sql += "		, CASE WHEN IIQ_QGTN_CD='945' THEN QQN_RESULT END M945";
		sql += "		, CASE WHEN IIQ_QGTN_CD='946' THEN QQN_RESULT END M946";
		sql += "		, CASE WHEN IIQ_QGTN_CD='948' THEN QQN_RESULT END M948";
		sql += "		, CASE WHEN IIQ_QGTN_CD='949' THEN QQN_RESULT END M949";
		sql += "		, CASE WHEN IIQ_QGTN_CD='951' THEN QQN_RESULT END M951";
		sql += "		, CASE WHEN IIQ_QGTN_CD='952' THEN QQN_RESULT END M952";
		sql += "		, CASE WHEN IIQ_QGTN_CD='954' THEN QQN_RESULT END M954";
		sql += "		, CASE WHEN IIQ_QGTN_CD='955' THEN QQN_RESULT END M955";
		sql += "		, CASE WHEN IIQ_QGTN_CD='957' THEN QQN_RESULT END M957";
		sql += "		, CASE WHEN IIQ_QGTN_CD='958' THEN QQN_RESULT END M958";
		sql += "		, CASE WHEN IIQ_QGTN_CD='959' THEN QQN_RESULT END M959";
		sql += "		, CASE WHEN IIQ_QGTN_CD='960' THEN QQN_RESULT END M960";
		sql += "		, CASE WHEN IIQ_QGTN_CD='962' THEN QQN_RESULT END M962";
		sql += "		, CASE WHEN IIQ_QGTN_CD='963' THEN QQN_RESULT END M963";
		sql += "		, CASE WHEN IIQ_QGTN_CD='966' THEN QQN_RESULT END M966";
		sql += "		, CASE WHEN IIQ_QGTN_CD='967' THEN QQN_RESULT END M967";
		sql += "		, CASE WHEN IIQ_QGTN_CD='968' THEN QQN_RESULT END M968";
		sql += "		, CASE WHEN IIQ_QGTN_CD='969' THEN QQN_RESULT END M969";
		sql += "		, CASE WHEN IIQ_QGTN_CD='970' THEN QQN_RESULT END M970";
		sql += "		, CASE WHEN IIQ_QGTN_CD='971' THEN QQN_RESULT END M971";
		sql += "		, CASE WHEN IIQ_QGTN_CD='972' THEN QQN_RESULT END M972";
		sql += "		, CASE WHEN IIQ_QGTN_CD='973' THEN QQN_RESULT END M973";
		sql += "		, CASE WHEN IIQ_QGTN_CD='974' THEN QQN_RESULT END M974";
		sql += "		, CASE WHEN IIQ_QGTN_CD='975' THEN QQN_RESULT END M975";
		sql += "		, CASE WHEN IIQ_QGTN_CD='482' THEN QQN_RESULT END M482";
		sql += "		, CASE WHEN IIQ_QGTN_CD='483' THEN QQN_RESULT END M483";
		sql += "		, CASE WHEN IIQ_QGTN_CD='484' THEN QQN_RESULT END M484";
		sql += "		, CASE WHEN IIQ_QGTN_CD='485' THEN QQN_RESULT END M485";
		sql += "		, CASE WHEN IIQ_QGTN_CD='486' THEN QQN_RESULT END M486";
		sql += "		, CASE WHEN IIQ_QGTN_CD='487' THEN QQN_RESULT END M487";
		sql += "		, CASE WHEN IIQ_QGTN_CD='488' THEN QQN_RESULT END M488";
		sql += "		, CASE WHEN IIQ_QGTN_CD='489' THEN QQN_RESULT END M489";
		sql += "		, CASE WHEN IIQ_QGTN_CD='490' THEN QQN_RESULT END M490";
		sql += "		, CASE WHEN IIQ_QGTN_CD='491' THEN QQN_RESULT END M491";
		sql += "		, CASE WHEN IIQ_QGTN_CD='492' THEN QQN_RESULT END M492";
		sql += "		, CASE WHEN IIQ_QGTN_CD='700' THEN QQN_RESULT END M700";
		sql += "		, CASE WHEN IIQ_QGTN_CD='701' THEN QQN_RESULT END M701";
		sql += "		, CASE WHEN IIQ_QGTN_CD='702' THEN QQN_RESULT END M702";
		sql += " 		FROM QT_QUESTION A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " 		ON A.QQN_EXAM_DT=B.EEA_EXAM_DT";
		sql += " 		AND A.QQN_EXAM_SQ=B.EEA_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER C";
		sql += " 		ON B.EEA_CUST_NO=C.ICR_CUST_NO LEFT OUTER JOIN IT_ITEM_QUESTION D";
		sql += " 		ON A.QQN_QSTN_CD=D.IIQ_QGTN_CD";
		sql += " 		AND IIQ_APLY_DT= GETITEM_QUESTION_APPLYDATE(IIQ_ITEM_CD,EEA_EXAM_DT)";
		sql += " 		WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 		AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " 		AND IIQ_ITEM_CD IN ('M0021','M0022','M0023','M0024','M0025')";
		sql += " 		AND EEA_HTSB_CD IN ('11001','12003')";
		sql += "	) TTT";
		sql += " 	GROUP BY QQN_EXAM_DT, QQN_EXAM_SQ";
		sql += " ) BBB";
		sql += " ON AAA.EEA_EXAM_DT = BBB.QQN_EXAM_DT";
		sql += " AND AAA.EEA_EXAM_SQ = BBB.QQN_EXAM_SQ";
		sql += " ORDER BY AAA.EEA_EXAM_DT, AAA.EEA_PSNL_NM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChungVerif2020_fDP_HabitSelect_2020_Target_001 \n";
			G_INFO += "설명 : 생활습관 성적확인 정보조회(대상건) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='EEA_MNGT_HTYR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_NO' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_CD' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTH_KD7' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RESULT_DATE' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='9'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SENDGBN' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_TRANC_DATE' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_ID' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INFO_DT' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INFO_YN' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_EXAM_DT' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_FIX_YN' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_EVALU_SM' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_NICO_SM' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_SM' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SCORE_SM' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_EVALU_DRN' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_DRN' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SCORE_DRN' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_EVALU_SPT' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_SPT' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSTM_SPT' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSNUM_SPT' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SCORE_SPT' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_EVALU_NUT' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RECOMDAI_NUT' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RECOMPRO_NUT' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RECOMVEG_NUT' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RESTFAT_NUT' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RESTSGA_NUT' rs:number='36' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RESTSALT_NUT' rs:number='37' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_BFAST_NUT' rs:number='38' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_ALLFOOD_NUT' rs:number='39' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_NUT' rs:number='40' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SCORE_NUT' rs:number='41' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_BMI_PYC' rs:number='42' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_REPAST_PYC' rs:number='43' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SNACK_PYC' rs:number='44' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_DRINK_PYC' rs:number='45' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_FASTFD_PYC' rs:number='46' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SPORT_PYC' rs:number='47' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_CRINIC_PYC' rs:number='48' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_ETC_PYC' rs:number='49' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_SM_YN' rs:number='50' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_DRN_YN' rs:number='51' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_SPT_YN' rs:number='52' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_NUT_YN' rs:number='53' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_PYC_YN' rs:number='54' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_1' rs:number='55' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_2' rs:number='56' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_3' rs:number='57' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_4' rs:number='58' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_4_TX' rs:number='59' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_5' rs:number='60' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_6' rs:number='61' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_6_TX' rs:number='62' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_PR1' rs:number='63' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_PR1_YN' rs:number='64' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_PR2' rs:number='65' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_PR2_TX' rs:number='66' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_1' rs:number='67' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_2' rs:number='68' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_3' rs:number='69' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_3_TX' rs:number='70' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_1' rs:number='71' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_2_1' rs:number='72' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_2_1_TX' rs:number='73' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_2_2' rs:number='74' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_2_2_TX' rs:number='75' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_2_3' rs:number='76' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_3' rs:number='77' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_3_TX' rs:number='78' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_4' rs:number='79' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_4_TX' rs:number='80' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_NUTR_1' rs:number='81' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_NUTR_2' rs:number='82' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_NUTR_3' rs:number='83' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_NUTR_3_TX' rs:number='84' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_NUTR_4' rs:number='85' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_NUTR_4_TX' rs:number='86' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_1' rs:number='87' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_2' rs:number='88' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_3' rs:number='89' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_4' rs:number='90' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_4_1' rs:number='91' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_4_2' rs:number='92' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_4_3' rs:number='93' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_4_4' rs:number='94' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_5' rs:number='95' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_5_TX' rs:number='96' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_6' rs:number='97' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_6_TX' rs:number='98' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_7' rs:number='99' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_7_TX' rs:number='100' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_EXAM_DT' rs:number='101' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_EXAM_SQ' rs:number='102' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='M464' rs:number='103' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M465' rs:number='104' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M466' rs:number='105' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M467' rs:number='106' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M468' rs:number='107' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M469' rs:number='108' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M470' rs:number='109' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M471' rs:number='110' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M984' rs:number='111' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M933' rs:number='112' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M934' rs:number='113' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M935' rs:number='114' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M496' rs:number='115' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M497' rs:number='116' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M498' rs:number='117' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M499' rs:number='118' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M500' rs:number='119' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M501' rs:number='120' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M502' rs:number='121' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M937' rs:number='122' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M938' rs:number='123' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M940' rs:number='124' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M941' rs:number='125' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M942' rs:number='126' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M943' rs:number='127' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M945' rs:number='128' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M946' rs:number='129' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M948' rs:number='130' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M949' rs:number='131' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M951' rs:number='132' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M952' rs:number='133' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M954' rs:number='134' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M955' rs:number='135' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M957' rs:number='136' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M958' rs:number='137' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M959' rs:number='138' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M960' rs:number='139' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M962' rs:number='140' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M963' rs:number='141' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M966' rs:number='142' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M967' rs:number='143' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M968' rs:number='144' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M969' rs:number='145' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M970' rs:number='146' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M971' rs:number='147' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M972' rs:number='148' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M973' rs:number='149' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M974' rs:number='150' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M975' rs:number='151' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M482' rs:number='152' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M483' rs:number='153' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M484' rs:number='154' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M485' rs:number='155' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M486' rs:number='156' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M487' rs:number='157' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M488' rs:number='158' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M489' rs:number='159' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M490' rs:number='160' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M491' rs:number='161' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M492' rs:number='162' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M700' rs:number='163' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M701' rs:number='164' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M702' rs:number='165' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_MNGT_HTYR_T = cRsList.getString("EEA_MNGT_HTYR");
			String EEA_INSU_NO_T = cRsList.getString("EEA_INSU_NO");
			String EEA_SEND_CD_T = cRsList.getString("EEA_SEND_CD");
			String EEA_HLTH_KD7_T = cRsList.getString("EEA_HLTH_KD7");
			String PSP_RESULT_DATE_T = cRsList.getString("PSP_RESULT_DATE");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String SENDGBN_T = cRsList.getString("SENDGBN");
			String PSP_TRANC_DATE_T = cRsList.getString("PSP_TRANC_DATE");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_PENL_ID_T = cRsList.getString("IAU_PENL_ID");
			String EEA_INFO_DT_T = cRsList.getString("EEA_INFO_DT");
			String ICR_INFO_YN_T = cRsList.getString("ICR_INFO_YN");
			String PSP_EXAM_DT_T = cRsList.getString("PSP_EXAM_DT");
			String PSP_FIX_YN_T = cRsList.getString("PSP_FIX_YN");
			String PSP_EVALU_SM_T = cRsList.getString("PSP_EVALU_SM");
			String PSP_NICO_SM_T = cRsList.getString("PSP_NICO_SM");
			String PSP_PRSCR_SM_T = cRsList.getString("PSP_PRSCR_SM");
			String PSP_SCORE_SM_T = cRsList.getString("PSP_SCORE_SM");
			String PSP_EVALU_DRN_T = cRsList.getString("PSP_EVALU_DRN");
			String PSP_PRSCR_DRN_T = cRsList.getString("PSP_PRSCR_DRN");
			String PSP_SCORE_DRN_T = cRsList.getString("PSP_SCORE_DRN");
			String PSP_EVALU_SPT_T = cRsList.getString("PSP_EVALU_SPT");
			String PSP_PRSCR_SPT_T = cRsList.getString("PSP_PRSCR_SPT");
			String PSP_PRSTM_SPT_T = cRsList.getString("PSP_PRSTM_SPT");
			String PSP_PRSNUM_SPT_T = cRsList.getString("PSP_PRSNUM_SPT");
			String PSP_SCORE_SPT_T = cRsList.getString("PSP_SCORE_SPT");
			String PSP_EVALU_NUT_T = cRsList.getString("PSP_EVALU_NUT");
			String PSP_RECOMDAI_NUT_T = cRsList.getString("PSP_RECOMDAI_NUT");
			String PSP_RECOMPRO_NUT_T = cRsList.getString("PSP_RECOMPRO_NUT");
			String PSP_RECOMVEG_NUT_T = cRsList.getString("PSP_RECOMVEG_NUT");
			String PSP_RESTFAT_NUT_T = cRsList.getString("PSP_RESTFAT_NUT");
			String PSP_RESTSGA_NUT_T = cRsList.getString("PSP_RESTSGA_NUT");
			String PSP_RESTSALT_NUT_T = cRsList.getString("PSP_RESTSALT_NUT");
			String PSP_BFAST_NUT_T = cRsList.getString("PSP_BFAST_NUT");
			String PSP_ALLFOOD_NUT_T = cRsList.getString("PSP_ALLFOOD_NUT");
			String PSP_PRSCR_NUT_T = cRsList.getString("PSP_PRSCR_NUT");
			String PSP_SCORE_NUT_T = cRsList.getString("PSP_SCORE_NUT");
			String PSP_BMI_PYC_T = cRsList.getString("PSP_BMI_PYC");
			String PSP_REPAST_PYC_T = cRsList.getString("PSP_REPAST_PYC");
			String PSP_SNACK_PYC_T = cRsList.getString("PSP_SNACK_PYC");
			String PSP_DRINK_PYC_T = cRsList.getString("PSP_DRINK_PYC");
			String PSP_FASTFD_PYC_T = cRsList.getString("PSP_FASTFD_PYC");
			String PSP_SPORT_PYC_T = cRsList.getString("PSP_SPORT_PYC");
			String PSP_CRINIC_PYC_T = cRsList.getString("PSP_CRINIC_PYC");
			String PSP_ETC_PYC_T = cRsList.getString("PSP_ETC_PYC");
			String PSP_PRSCR_SM_YN_T = cRsList.getString("PSP_PRSCR_SM_YN");
			String PSP_PRSCR_DRN_YN_T = cRsList.getString("PSP_PRSCR_DRN_YN");
			String PSP_PRSCR_SPT_YN_T = cRsList.getString("PSP_PRSCR_SPT_YN");
			String PSP_PRSCR_NUT_YN_T = cRsList.getString("PSP_PRSCR_NUT_YN");
			String PSP_PRSCR_PYC_YN_T = cRsList.getString("PSP_PRSCR_PYC_YN");
			String PLR_SMK_1_T = cRsList.getString("PLR_SMK_1");
			String PLR_SMK_2_T = cRsList.getString("PLR_SMK_2");
			String PLR_SMK_3_T = cRsList.getString("PLR_SMK_3");
			String PLR_SMK_4_T = cRsList.getString("PLR_SMK_4");
			String PLR_SMK_4_TX_T = cRsList.getString("PLR_SMK_4_TX");
			String PLR_SMK_5_T = cRsList.getString("PLR_SMK_5");
			String PLR_SMK_6_T = cRsList.getString("PLR_SMK_6");
			String PLR_SMK_6_TX_T = cRsList.getString("PLR_SMK_6_TX");
			String PLR_DRK_PR1_T = cRsList.getString("PLR_DRK_PR1");
			String PLR_DRK_PR1_YN_T = cRsList.getString("PLR_DRK_PR1_YN");
			String PLR_DRK_PR2_T = cRsList.getString("PLR_DRK_PR2");
			String PLR_DRK_PR2_TX_T = cRsList.getString("PLR_DRK_PR2_TX");
			String PLR_DRK_1_T = cRsList.getString("PLR_DRK_1");
			String PLR_DRK_2_T = cRsList.getString("PLR_DRK_2");
			String PLR_DRK_3_T = cRsList.getString("PLR_DRK_3");
			String PLR_DRK_3_TX_T = cRsList.getString("PLR_DRK_3_TX");
			String PLR_EXCS_1_T = cRsList.getString("PLR_EXCS_1");
			String PLR_EXCS_2_1_T = cRsList.getString("PLR_EXCS_2_1");
			String PLR_EXCS_2_1_TX_T = cRsList.getString("PLR_EXCS_2_1_TX");
			String PLR_EXCS_2_2_T = cRsList.getString("PLR_EXCS_2_2");
			String PLR_EXCS_2_2_TX_T = cRsList.getString("PLR_EXCS_2_2_TX");
			String PLR_EXCS_2_3_T = cRsList.getString("PLR_EXCS_2_3");
			String PLR_EXCS_3_T = cRsList.getString("PLR_EXCS_3");
			String PLR_EXCS_3_TX_T = cRsList.getString("PLR_EXCS_3_TX");
			String PLR_EXCS_4_T = cRsList.getString("PLR_EXCS_4");
			String PLR_EXCS_4_TX_T = cRsList.getString("PLR_EXCS_4_TX");
			String PLR_NUTR_1_T = cRsList.getString("PLR_NUTR_1");
			String PLR_NUTR_2_T = cRsList.getString("PLR_NUTR_2");
			String PLR_NUTR_3_T = cRsList.getString("PLR_NUTR_3");
			String PLR_NUTR_3_TX_T = cRsList.getString("PLR_NUTR_3_TX");
			String PLR_NUTR_4_T = cRsList.getString("PLR_NUTR_4");
			String PLR_NUTR_4_TX_T = cRsList.getString("PLR_NUTR_4_TX");
			String PLR_FAT_1_T = cRsList.getString("PLR_FAT_1");
			String PLR_FAT_2_T = cRsList.getString("PLR_FAT_2");
			String PLR_FAT_3_T = cRsList.getString("PLR_FAT_3");
			String PLR_FAT_4_T = cRsList.getString("PLR_FAT_4");
			String PLR_FAT_4_1_T = cRsList.getString("PLR_FAT_4_1");
			String PLR_FAT_4_2_T = cRsList.getString("PLR_FAT_4_2");
			String PLR_FAT_4_3_T = cRsList.getString("PLR_FAT_4_3");
			String PLR_FAT_4_4_T = cRsList.getString("PLR_FAT_4_4");
			String PLR_FAT_5_T = cRsList.getString("PLR_FAT_5");
			String PLR_FAT_5_TX_T = cRsList.getString("PLR_FAT_5_TX");
			String PLR_FAT_6_T = cRsList.getString("PLR_FAT_6");
			String PLR_FAT_6_TX_T = cRsList.getString("PLR_FAT_6_TX");
			String PLR_FAT_7_T = cRsList.getString("PLR_FAT_7");
			String PLR_FAT_7_TX_T = cRsList.getString("PLR_FAT_7_TX");
			String QQN_EXAM_DT_T = cRsList.getString("QQN_EXAM_DT");
			String QQN_EXAM_SQ_T = cRsList.getString("QQN_EXAM_SQ");
			String M464_T = cRsList.getString("M464");
			String M465_T = cRsList.getString("M465");
			String M466_T = cRsList.getString("M466");
			String M467_T = cRsList.getString("M467");
			String M468_T = cRsList.getString("M468");
			String M469_T = cRsList.getString("M469");
			String M470_T = cRsList.getString("M470");
			String M471_T = cRsList.getString("M471");
			String M984_T = cRsList.getString("M984");
			String M933_T = cRsList.getString("M933");
			String M934_T = cRsList.getString("M934");
			String M935_T = cRsList.getString("M935");
			String M496_T = cRsList.getString("M496");
			String M497_T = cRsList.getString("M497");
			String M498_T = cRsList.getString("M498");
			String M499_T = cRsList.getString("M499");
			String M500_T = cRsList.getString("M500");
			String M501_T = cRsList.getString("M501");
			String M502_T = cRsList.getString("M502");
			String M937_T = cRsList.getString("M937");
			String M938_T = cRsList.getString("M938");
			String M940_T = cRsList.getString("M940");
			String M941_T = cRsList.getString("M941");
			String M942_T = cRsList.getString("M942");
			String M943_T = cRsList.getString("M943");
			String M945_T = cRsList.getString("M945");
			String M946_T = cRsList.getString("M946");
			String M948_T = cRsList.getString("M948");
			String M949_T = cRsList.getString("M949");
			String M951_T = cRsList.getString("M951");
			String M952_T = cRsList.getString("M952");
			String M954_T = cRsList.getString("M954");
			String M955_T = cRsList.getString("M955");
			String M957_T = cRsList.getString("M957");
			String M958_T = cRsList.getString("M958");
			String M959_T = cRsList.getString("M959");
			String M960_T = cRsList.getString("M960");
			String M962_T = cRsList.getString("M962");
			String M963_T = cRsList.getString("M963");
			String M966_T = cRsList.getString("M966");
			String M967_T = cRsList.getString("M967");
			String M968_T = cRsList.getString("M968");
			String M969_T = cRsList.getString("M969");
			String M970_T = cRsList.getString("M970");
			String M971_T = cRsList.getString("M971");
			String M972_T = cRsList.getString("M972");
			String M973_T = cRsList.getString("M973");
			String M974_T = cRsList.getString("M974");
			String M975_T = cRsList.getString("M975");
			String M482_T = cRsList.getString("M482");
			String M483_T = cRsList.getString("M483");
			String M484_T = cRsList.getString("M484");
			String M485_T = cRsList.getString("M485");
			String M486_T = cRsList.getString("M486");
			String M487_T = cRsList.getString("M487");
			String M488_T = cRsList.getString("M488");
			String M489_T = cRsList.getString("M489");
			String M490_T = cRsList.getString("M490");
			String M491_T = cRsList.getString("M491");
			String M492_T = cRsList.getString("M492");
			String M700_T = cRsList.getString("M700");
			String M701_T = cRsList.getString("M701");
			String M702_T = cRsList.getString("M702");
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

			if(! EEA_MNGT_HTYR_T.equals("")) {
%>
		 		EEA_MNGT_HTYR='<%= EEA_MNGT_HTYR_T%>'
<%
			}

			if(! EEA_INSU_NO_T.equals("")) {
%>
		 		EEA_INSU_NO='<%= EEA_INSU_NO_T%>'
<%
			}

			if(! EEA_SEND_CD_T.equals("")) {
%>
		 		EEA_SEND_CD='<%= EEA_SEND_CD_T%>'
<%
			}

			if(! EEA_HLTH_KD7_T.equals("")) {
%>
		 		EEA_HLTH_KD7='<%= EEA_HLTH_KD7_T%>'
<%
			}

			if(! PSP_RESULT_DATE_T.equals("")) {
%>
		 		PSP_RESULT_DATE='<%= PSP_RESULT_DATE_T%>'
<%
			}

			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
<%
			}

			if(! SENDGBN_T.equals("")) {
%>
		 		SENDGBN='<%= SENDGBN_T%>'
<%
			}

			if(! PSP_TRANC_DATE_T.equals("")) {
%>
		 		PSP_TRANC_DATE='<%= PSP_TRANC_DATE_T%>'
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

			if(! EEA_INFO_DT_T.equals("")) {
%>
		 		EEA_INFO_DT='<%= EEA_INFO_DT_T%>'
<%
			}

			if(! ICR_INFO_YN_T.equals("")) {
%>
		 		ICR_INFO_YN='<%= ICR_INFO_YN_T%>'
<%
			}

			if(! PSP_EXAM_DT_T.equals("")) {
%>
		 		PSP_EXAM_DT='<%= PSP_EXAM_DT_T%>'
<%
			}

			if(! PSP_FIX_YN_T.equals("")) {
%>
		 		PSP_FIX_YN='<%= PSP_FIX_YN_T%>'
<%
			}

			if(! PSP_EVALU_SM_T.equals("")) {
%>
		 		PSP_EVALU_SM='<%= PSP_EVALU_SM_T%>'
<%
			}

			if(! PSP_NICO_SM_T.equals("")) {
%>
		 		PSP_NICO_SM='<%= PSP_NICO_SM_T%>'
<%
			}

			if(! PSP_PRSCR_SM_T.equals("")) {
%>
		 		PSP_PRSCR_SM='<%= PSP_PRSCR_SM_T%>'
<%
			}

			if(! PSP_SCORE_SM_T.equals("")) {
%>
		 		PSP_SCORE_SM='<%= PSP_SCORE_SM_T%>'
<%
			}

			if(! PSP_EVALU_DRN_T.equals("")) {
%>
		 		PSP_EVALU_DRN='<%= PSP_EVALU_DRN_T%>'
<%
			}

			if(! PSP_PRSCR_DRN_T.equals("")) {
%>
		 		PSP_PRSCR_DRN='<%= PSP_PRSCR_DRN_T%>'
<%
			}

			if(! PSP_SCORE_DRN_T.equals("")) {
%>
		 		PSP_SCORE_DRN='<%= PSP_SCORE_DRN_T%>'
<%
			}

			if(! PSP_EVALU_SPT_T.equals("")) {
%>
		 		PSP_EVALU_SPT='<%= PSP_EVALU_SPT_T%>'
<%
			}

			if(! PSP_PRSCR_SPT_T.equals("")) {
%>
		 		PSP_PRSCR_SPT='<%= PSP_PRSCR_SPT_T%>'
<%
			}

			if(! PSP_PRSTM_SPT_T.equals("")) {
%>
		 		PSP_PRSTM_SPT='<%= PSP_PRSTM_SPT_T%>'
<%
			}

			if(! PSP_PRSNUM_SPT_T.equals("")) {
%>
		 		PSP_PRSNUM_SPT='<%= PSP_PRSNUM_SPT_T%>'
<%
			}

			if(! PSP_SCORE_SPT_T.equals("")) {
%>
		 		PSP_SCORE_SPT='<%= PSP_SCORE_SPT_T%>'
<%
			}

			if(! PSP_EVALU_NUT_T.equals("")) {
%>
		 		PSP_EVALU_NUT='<%= PSP_EVALU_NUT_T%>'
<%
			}

			if(! PSP_RECOMDAI_NUT_T.equals("")) {
%>
		 		PSP_RECOMDAI_NUT='<%= PSP_RECOMDAI_NUT_T%>'
<%
			}

			if(! PSP_RECOMPRO_NUT_T.equals("")) {
%>
		 		PSP_RECOMPRO_NUT='<%= PSP_RECOMPRO_NUT_T%>'
<%
			}

			if(! PSP_RECOMVEG_NUT_T.equals("")) {
%>
		 		PSP_RECOMVEG_NUT='<%= PSP_RECOMVEG_NUT_T%>'
<%
			}

			if(! PSP_RESTFAT_NUT_T.equals("")) {
%>
		 		PSP_RESTFAT_NUT='<%= PSP_RESTFAT_NUT_T%>'
<%
			}

			if(! PSP_RESTSGA_NUT_T.equals("")) {
%>
		 		PSP_RESTSGA_NUT='<%= PSP_RESTSGA_NUT_T%>'
<%
			}

			if(! PSP_RESTSALT_NUT_T.equals("")) {
%>
		 		PSP_RESTSALT_NUT='<%= PSP_RESTSALT_NUT_T%>'
<%
			}

			if(! PSP_BFAST_NUT_T.equals("")) {
%>
		 		PSP_BFAST_NUT='<%= PSP_BFAST_NUT_T%>'
<%
			}

			if(! PSP_ALLFOOD_NUT_T.equals("")) {
%>
		 		PSP_ALLFOOD_NUT='<%= PSP_ALLFOOD_NUT_T%>'
<%
			}

			if(! PSP_PRSCR_NUT_T.equals("")) {
%>
		 		PSP_PRSCR_NUT='<%= PSP_PRSCR_NUT_T%>'
<%
			}

			if(! PSP_SCORE_NUT_T.equals("")) {
%>
		 		PSP_SCORE_NUT='<%= PSP_SCORE_NUT_T%>'
<%
			}

			if(! PSP_BMI_PYC_T.equals("")) {
%>
		 		PSP_BMI_PYC='<%= PSP_BMI_PYC_T%>'
<%
			}

			if(! PSP_REPAST_PYC_T.equals("")) {
%>
		 		PSP_REPAST_PYC='<%= PSP_REPAST_PYC_T%>'
<%
			}

			if(! PSP_SNACK_PYC_T.equals("")) {
%>
		 		PSP_SNACK_PYC='<%= PSP_SNACK_PYC_T%>'
<%
			}

			if(! PSP_DRINK_PYC_T.equals("")) {
%>
		 		PSP_DRINK_PYC='<%= PSP_DRINK_PYC_T%>'
<%
			}

			if(! PSP_FASTFD_PYC_T.equals("")) {
%>
		 		PSP_FASTFD_PYC='<%= PSP_FASTFD_PYC_T%>'
<%
			}

			if(! PSP_SPORT_PYC_T.equals("")) {
%>
		 		PSP_SPORT_PYC='<%= PSP_SPORT_PYC_T%>'
<%
			}

			if(! PSP_CRINIC_PYC_T.equals("")) {
%>
		 		PSP_CRINIC_PYC='<%= PSP_CRINIC_PYC_T%>'
<%
			}

			if(! PSP_ETC_PYC_T.equals("")) {
%>
		 		PSP_ETC_PYC='<%= PSP_ETC_PYC_T%>'
<%
			}

			if(! PSP_PRSCR_SM_YN_T.equals("")) {
%>
		 		PSP_PRSCR_SM_YN='<%= PSP_PRSCR_SM_YN_T%>'
<%
			}

			if(! PSP_PRSCR_DRN_YN_T.equals("")) {
%>
		 		PSP_PRSCR_DRN_YN='<%= PSP_PRSCR_DRN_YN_T%>'
<%
			}

			if(! PSP_PRSCR_SPT_YN_T.equals("")) {
%>
		 		PSP_PRSCR_SPT_YN='<%= PSP_PRSCR_SPT_YN_T%>'
<%
			}

			if(! PSP_PRSCR_NUT_YN_T.equals("")) {
%>
		 		PSP_PRSCR_NUT_YN='<%= PSP_PRSCR_NUT_YN_T%>'
<%
			}

			if(! PSP_PRSCR_PYC_YN_T.equals("")) {
%>
		 		PSP_PRSCR_PYC_YN='<%= PSP_PRSCR_PYC_YN_T%>'
<%
			}

			if(! PLR_SMK_1_T.equals("")) {
%>
		 		PLR_SMK_1='<%= PLR_SMK_1_T%>'
<%
			}

			if(! PLR_SMK_2_T.equals("")) {
%>
		 		PLR_SMK_2='<%= PLR_SMK_2_T%>'
<%
			}

			if(! PLR_SMK_3_T.equals("")) {
%>
		 		PLR_SMK_3='<%= PLR_SMK_3_T%>'
<%
			}

			if(! PLR_SMK_4_T.equals("")) {
%>
		 		PLR_SMK_4='<%= PLR_SMK_4_T%>'
<%
			}

			if(! PLR_SMK_4_TX_T.equals("")) {
%>
		 		PLR_SMK_4_TX='<%= PLR_SMK_4_TX_T%>'
<%
			}

			if(! PLR_SMK_5_T.equals("")) {
%>
		 		PLR_SMK_5='<%= PLR_SMK_5_T%>'
<%
			}

			if(! PLR_SMK_6_T.equals("")) {
%>
		 		PLR_SMK_6='<%= PLR_SMK_6_T%>'
<%
			}

			if(! PLR_SMK_6_TX_T.equals("")) {
%>
		 		PLR_SMK_6_TX='<%= PLR_SMK_6_TX_T%>'
<%
			}

			if(! PLR_DRK_PR1_T.equals("")) {
%>
		 		PLR_DRK_PR1='<%= PLR_DRK_PR1_T%>'
<%
			}

			if(! PLR_DRK_PR1_YN_T.equals("")) {
%>
		 		PLR_DRK_PR1_YN='<%= PLR_DRK_PR1_YN_T%>'
<%
			}

			if(! PLR_DRK_PR2_T.equals("")) {
%>
		 		PLR_DRK_PR2='<%= PLR_DRK_PR2_T%>'
<%
			}

			if(! PLR_DRK_PR2_TX_T.equals("")) {
%>
		 		PLR_DRK_PR2_TX='<%= PLR_DRK_PR2_TX_T%>'
<%
			}

			if(! PLR_DRK_1_T.equals("")) {
%>
		 		PLR_DRK_1='<%= PLR_DRK_1_T%>'
<%
			}

			if(! PLR_DRK_2_T.equals("")) {
%>
		 		PLR_DRK_2='<%= PLR_DRK_2_T%>'
<%
			}

			if(! PLR_DRK_3_T.equals("")) {
%>
		 		PLR_DRK_3='<%= PLR_DRK_3_T%>'
<%
			}

			if(! PLR_DRK_3_TX_T.equals("")) {
%>
		 		PLR_DRK_3_TX='<%= PLR_DRK_3_TX_T%>'
<%
			}

			if(! PLR_EXCS_1_T.equals("")) {
%>
		 		PLR_EXCS_1='<%= PLR_EXCS_1_T%>'
<%
			}

			if(! PLR_EXCS_2_1_T.equals("")) {
%>
		 		PLR_EXCS_2_1='<%= PLR_EXCS_2_1_T%>'
<%
			}

			if(! PLR_EXCS_2_1_TX_T.equals("")) {
%>
		 		PLR_EXCS_2_1_TX='<%= PLR_EXCS_2_1_TX_T%>'
<%
			}

			if(! PLR_EXCS_2_2_T.equals("")) {
%>
		 		PLR_EXCS_2_2='<%= PLR_EXCS_2_2_T%>'
<%
			}

			if(! PLR_EXCS_2_2_TX_T.equals("")) {
%>
		 		PLR_EXCS_2_2_TX='<%= PLR_EXCS_2_2_TX_T%>'
<%
			}

			if(! PLR_EXCS_2_3_T.equals("")) {
%>
		 		PLR_EXCS_2_3='<%= PLR_EXCS_2_3_T%>'
<%
			}

			if(! PLR_EXCS_3_T.equals("")) {
%>
		 		PLR_EXCS_3='<%= PLR_EXCS_3_T%>'
<%
			}

			if(! PLR_EXCS_3_TX_T.equals("")) {
%>
		 		PLR_EXCS_3_TX='<%= PLR_EXCS_3_TX_T%>'
<%
			}

			if(! PLR_EXCS_4_T.equals("")) {
%>
		 		PLR_EXCS_4='<%= PLR_EXCS_4_T%>'
<%
			}

			if(! PLR_EXCS_4_TX_T.equals("")) {
%>
		 		PLR_EXCS_4_TX='<%= PLR_EXCS_4_TX_T%>'
<%
			}

			if(! PLR_NUTR_1_T.equals("")) {
%>
		 		PLR_NUTR_1='<%= PLR_NUTR_1_T%>'
<%
			}

			if(! PLR_NUTR_2_T.equals("")) {
%>
		 		PLR_NUTR_2='<%= PLR_NUTR_2_T%>'
<%
			}

			if(! PLR_NUTR_3_T.equals("")) {
%>
		 		PLR_NUTR_3='<%= PLR_NUTR_3_T%>'
<%
			}

			if(! PLR_NUTR_3_TX_T.equals("")) {
%>
		 		PLR_NUTR_3_TX='<%= PLR_NUTR_3_TX_T%>'
<%
			}

			if(! PLR_NUTR_4_T.equals("")) {
%>
		 		PLR_NUTR_4='<%= PLR_NUTR_4_T%>'
<%
			}

			if(! PLR_NUTR_4_TX_T.equals("")) {
%>
		 		PLR_NUTR_4_TX='<%= PLR_NUTR_4_TX_T%>'
<%
			}

			if(! PLR_FAT_1_T.equals("")) {
%>
		 		PLR_FAT_1='<%= PLR_FAT_1_T%>'
<%
			}

			if(! PLR_FAT_2_T.equals("")) {
%>
		 		PLR_FAT_2='<%= PLR_FAT_2_T%>'
<%
			}

			if(! PLR_FAT_3_T.equals("")) {
%>
		 		PLR_FAT_3='<%= PLR_FAT_3_T%>'
<%
			}

			if(! PLR_FAT_4_T.equals("")) {
%>
		 		PLR_FAT_4='<%= PLR_FAT_4_T%>'
<%
			}

			if(! PLR_FAT_4_1_T.equals("")) {
%>
		 		PLR_FAT_4_1='<%= PLR_FAT_4_1_T%>'
<%
			}

			if(! PLR_FAT_4_2_T.equals("")) {
%>
		 		PLR_FAT_4_2='<%= PLR_FAT_4_2_T%>'
<%
			}

			if(! PLR_FAT_4_3_T.equals("")) {
%>
		 		PLR_FAT_4_3='<%= PLR_FAT_4_3_T%>'
<%
			}

			if(! PLR_FAT_4_4_T.equals("")) {
%>
		 		PLR_FAT_4_4='<%= PLR_FAT_4_4_T%>'
<%
			}

			if(! PLR_FAT_5_T.equals("")) {
%>
		 		PLR_FAT_5='<%= PLR_FAT_5_T%>'
<%
			}

			if(! PLR_FAT_5_TX_T.equals("")) {
%>
		 		PLR_FAT_5_TX='<%= PLR_FAT_5_TX_T%>'
<%
			}

			if(! PLR_FAT_6_T.equals("")) {
%>
		 		PLR_FAT_6='<%= PLR_FAT_6_T%>'
<%
			}

			if(! PLR_FAT_6_TX_T.equals("")) {
%>
		 		PLR_FAT_6_TX='<%= PLR_FAT_6_TX_T%>'
<%
			}

			if(! PLR_FAT_7_T.equals("")) {
%>
		 		PLR_FAT_7='<%= PLR_FAT_7_T%>'
<%
			}

			if(! PLR_FAT_7_TX_T.equals("")) {
%>
		 		PLR_FAT_7_TX='<%= PLR_FAT_7_TX_T%>'
<%
			}

			if(! QQN_EXAM_DT_T.equals("")) {
%>
		 		QQN_EXAM_DT='<%= QQN_EXAM_DT_T%>'
<%
			}

			if(! QQN_EXAM_SQ_T.equals("")) {
%>
		 		QQN_EXAM_SQ='<%= QQN_EXAM_SQ_T%>'
<%
			}

			if(! M464_T.equals("")) {
%>
		 		M464='<%= M464_T%>'
<%
			}

			if(! M465_T.equals("")) {
%>
		 		M465='<%= M465_T%>'
<%
			}

			if(! M466_T.equals("")) {
%>
		 		M466='<%= M466_T%>'
<%
			}

			if(! M467_T.equals("")) {
%>
		 		M467='<%= M467_T%>'
<%
			}

			if(! M468_T.equals("")) {
%>
		 		M468='<%= M468_T%>'
<%
			}

			if(! M469_T.equals("")) {
%>
		 		M469='<%= M469_T%>'
<%
			}

			if(! M470_T.equals("")) {
%>
		 		M470='<%= M470_T%>'
<%
			}

			if(! M471_T.equals("")) {
%>
		 		M471='<%= M471_T%>'
<%
			}

			if(! M984_T.equals("")) {
%>
		 		M984='<%= M984_T%>'
<%
			}

			if(! M933_T.equals("")) {
%>
		 		M933='<%= M933_T%>'
<%
			}

			if(! M934_T.equals("")) {
%>
		 		M934='<%= M934_T%>'
<%
			}

			if(! M935_T.equals("")) {
%>
		 		M935='<%= M935_T%>'
<%
			}

			if(! M496_T.equals("")) {
%>
		 		M496='<%= M496_T%>'
<%
			}

			if(! M497_T.equals("")) {
%>
		 		M497='<%= M497_T%>'
<%
			}

			if(! M498_T.equals("")) {
%>
		 		M498='<%= M498_T%>'
<%
			}

			if(! M499_T.equals("")) {
%>
		 		M499='<%= M499_T%>'
<%
			}

			if(! M500_T.equals("")) {
%>
		 		M500='<%= M500_T%>'
<%
			}

			if(! M501_T.equals("")) {
%>
		 		M501='<%= M501_T%>'
<%
			}

			if(! M502_T.equals("")) {
%>
		 		M502='<%= M502_T%>'
<%
			}

			if(! M937_T.equals("")) {
%>
		 		M937='<%= M937_T%>'
<%
			}

			if(! M938_T.equals("")) {
%>
		 		M938='<%= M938_T%>'
<%
			}

			if(! M940_T.equals("")) {
%>
		 		M940='<%= M940_T%>'
<%
			}

			if(! M941_T.equals("")) {
%>
		 		M941='<%= M941_T%>'
<%
			}

			if(! M942_T.equals("")) {
%>
		 		M942='<%= M942_T%>'
<%
			}

			if(! M943_T.equals("")) {
%>
		 		M943='<%= M943_T%>'
<%
			}

			if(! M945_T.equals("")) {
%>
		 		M945='<%= M945_T%>'
<%
			}

			if(! M946_T.equals("")) {
%>
		 		M946='<%= M946_T%>'
<%
			}

			if(! M948_T.equals("")) {
%>
		 		M948='<%= M948_T%>'
<%
			}

			if(! M949_T.equals("")) {
%>
		 		M949='<%= M949_T%>'
<%
			}

			if(! M951_T.equals("")) {
%>
		 		M951='<%= M951_T%>'
<%
			}

			if(! M952_T.equals("")) {
%>
		 		M952='<%= M952_T%>'
<%
			}

			if(! M954_T.equals("")) {
%>
		 		M954='<%= M954_T%>'
<%
			}

			if(! M955_T.equals("")) {
%>
		 		M955='<%= M955_T%>'
<%
			}

			if(! M957_T.equals("")) {
%>
		 		M957='<%= M957_T%>'
<%
			}

			if(! M958_T.equals("")) {
%>
		 		M958='<%= M958_T%>'
<%
			}

			if(! M959_T.equals("")) {
%>
		 		M959='<%= M959_T%>'
<%
			}

			if(! M960_T.equals("")) {
%>
		 		M960='<%= M960_T%>'
<%
			}

			if(! M962_T.equals("")) {
%>
		 		M962='<%= M962_T%>'
<%
			}

			if(! M963_T.equals("")) {
%>
		 		M963='<%= M963_T%>'
<%
			}

			if(! M966_T.equals("")) {
%>
		 		M966='<%= M966_T%>'
<%
			}

			if(! M967_T.equals("")) {
%>
		 		M967='<%= M967_T%>'
<%
			}

			if(! M968_T.equals("")) {
%>
		 		M968='<%= M968_T%>'
<%
			}

			if(! M969_T.equals("")) {
%>
		 		M969='<%= M969_T%>'
<%
			}

			if(! M970_T.equals("")) {
%>
		 		M970='<%= M970_T%>'
<%
			}

			if(! M971_T.equals("")) {
%>
		 		M971='<%= M971_T%>'
<%
			}

			if(! M972_T.equals("")) {
%>
		 		M972='<%= M972_T%>'
<%
			}

			if(! M973_T.equals("")) {
%>
		 		M973='<%= M973_T%>'
<%
			}

			if(! M974_T.equals("")) {
%>
		 		M974='<%= M974_T%>'
<%
			}

			if(! M975_T.equals("")) {
%>
		 		M975='<%= M975_T%>'
<%
			}

			if(! M482_T.equals("")) {
%>
		 		M482='<%= M482_T%>'
<%
			}

			if(! M483_T.equals("")) {
%>
		 		M483='<%= M483_T%>'
<%
			}

			if(! M484_T.equals("")) {
%>
		 		M484='<%= M484_T%>'
<%
			}

			if(! M485_T.equals("")) {
%>
		 		M485='<%= M485_T%>'
<%
			}

			if(! M486_T.equals("")) {
%>
		 		M486='<%= M486_T%>'
<%
			}

			if(! M487_T.equals("")) {
%>
		 		M487='<%= M487_T%>'
<%
			}

			if(! M488_T.equals("")) {
%>
		 		M488='<%= M488_T%>'
<%
			}

			if(! M489_T.equals("")) {
%>
		 		M489='<%= M489_T%>'
<%
			}

			if(! M490_T.equals("")) {
%>
		 		M490='<%= M490_T%>'
<%
			}

			if(! M491_T.equals("")) {
%>
		 		M491='<%= M491_T%>'
<%
			}

			if(! M492_T.equals("")) {
%>
		 		M492='<%= M492_T%>'
<%
			}

			if(! M700_T.equals("")) {
%>
		 		M700='<%= M700_T%>'
<%
			}

			if(! M701_T.equals("")) {
%>
		 		M701='<%= M701_T%>'
<%
			}

			if(! M702_T.equals("")) {
%>
		 		M702='<%= M702_T%>'
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
