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

		String DTEFROMDT = htMethod.get("DTEFROMDT");
		String DTETODT = htMethod.get("DTETODT");
		String CMBCHUNGYYYY = htMethod.get("CMBCHUNGYYYY");
		String SSQL_ADD1 = htMethod.get("SSQL_ADD1");
		String SSQL_ADD2 = htMethod.get("SSQL_ADD2");
		String SSQL_ADD3 = htMethod.get("SSQL_ADD3");

		//
		if(DTEFROMDT == null) { DTEFROMDT = ""; }
		if(DTETODT == null) { DTETODT = ""; }
		if(CMBCHUNGYYYY == null) { CMBCHUNGYYYY = ""; }
		if(SSQL_ADD1 == null) { SSQL_ADD1 = ""; }
		if(SSQL_ADD2 == null) { SSQL_ADD2 = ""; }
		if(SSQL_ADD3 == null) { SSQL_ADD3 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

    select * from
   (select EEA_EXAM_DT,
       EEA_EXAM_SQ,
       EEA_HTSB_CD,
       '2' FILEGBN,
                   EEA_HLTH_KD,
                   EEA_SAFE_YN,
                   SUBSTR(EEA_HLTH_KD,1,1) EEA_HLTH_KD1,
                   SUBSTR(EEA_HLTH_KD,2,1) EEA_HLTH_KD2,
                   SUBSTR(EEA_HLTH_KD,3,1) EEA_HLTH_KD3,
                   SUBSTR(EEA_HLTH_KD,4,1) EEA_HLTH_KD4,
                   SUBSTR(EEA_HLTH_KD,5,1) EEA_HLTH_KD5,
                   SUBSTR(EEA_HLTH_KD,6,1) EEA_HLTH_KD6,
                   SUBSTR(EEA_HLTH_KD,7,1) EEA_HLTH_KD7,
                   SUBSTR(EEA_HLTH_KD,8,1) EEA_HLTH_KD8,
                   SUBSTR(EEA_HLTH_KD,9,1) EEA_HLTH_KD9,
       EEA_MNGT_HTYR,
       ICR_BIRH_DT,
       ICR_ZIP_CD, ICR_ZIP_AR, ICR_ROAD_AR,
       EEA_INSU_NO, ICR_PENL_ID,ICR_PID_EN, EEA_HEPA_YN, EEA_SEND_CD, EEA_HCV_YN,
       (EEA_HLTHR_PR-(NVL(EEA_CANR_PR,0)+NVL(EEA_ORALR_PR,0))) EEA_HLTHR_PR ,
       EEA_CNTR_CD,
       EEA_PSNL_NM,
       EEA_FOOD_YN,
       EEA_CHART_NO,
       PFP_HISJIN,
       PFP_HISMED,
       PFP_LIVESMK,
       PFP_LIVEDRK,
       PFP_LIVESPT,
       PFP_LIVEWET,
       PFP_EXINJUR,
       PFP_DEPRESS,
       PFP_CNDTION,
       PFP_CGNTION,
       PFP_PANRETA,
       PFP_PANRETB,
       PFP_PANRETR1,
       PFP_PANRETR2,
       PFP_PANRETRD,
       PFP_RESULTB_1,
       PFP_RESULTB_2,
       PFP_RESULTB_3,
       PFP_RESULTB_4,
       PFP_RESULTB_5,
       PFP_RESULTB_6,
       PFP_RESULTB_7,
       PFP_RESULTB_8,
       PFP_RESULTB_9,
       PFP_RESULTB_11,
       PFP_RESULTB_10,
       PFP_RESULTR1_1,
       PFP_RESULTR1_2,
       PFP_RESULTR1_3,
       PFP_RESULTR1_4,
       PFP_RESULTR1_5,
       PFP_RESULTR1_6,
       PFP_RESULTR1_7,
       PFP_RESULTR1_8,
       PFP_RESULTR1_9,
       PFP_RESULTR1_10,
       PFP_RESULT8_ETC,
       PFP_RESULTR2_1,
       PFP_RESULTR2_2,
       PFP_RESULTRD_1,
       PFP_RESULTRD_2,
       PFP_RESULTRD_3,
       PFP_RESULTRD_4,
       PFP_DOCTORFIR,
       PFP_DOCTORQQN,
       PFP_FIX_YN,
       PFP_OPIN1,
       PFP_OPIN2,
       PFP_OPIN3,
       PFP_OPIN4,
       REPLACE(PFP_EXAM_DT,'-','') PFP_EXAM_DT,
       REPLACE(PFP_RESULT_DATE,'-','') PFP_RESULT_DATE,
       EEA_PLCE_CD ,
       '3' SENDGBN ,
       REPLACE(PFP_TRANC_DATE,'-','') PFP_TRANC_DATE,
       IAU_LICEN1_NO ,
       IAU_PENL_NM,
       IAU_PENL_ID,
       REPLACE(EEA_EXAM_DT,'-','') EEA_INFO_DT, ICR_INFO_YN ,
       SUBSTR(EEA_SELF_KD,4,1) EEA_SELF_KD_4_1 ,
       PSP_EVALU_SM,
       PSP_NICO_SM,
       PSP_PRSCR_SM,
       PSP_SCORE_SM,
       PSP_EVALU_DRN,
       PSP_PRSCR_DRN,
       PSP_SCORE_DRN,
       PSP_EVALU_SPT,
       PSP_PRSCR_SPT,
       PSP_PRSTM_SPT,
       PSP_PRSNUM_SPT,
       PSP_SCORE_SPT,
       PSP_EVALU_NUT,
       PSP_RECOMDAI_NUT,
       PSP_RECOMPRO_NUT,
       PSP_RECOMVEG_NUT,
       PSP_RESTFAT_NUT,
       PSP_RESTSGA_NUT,
       PSP_RESTSALT_NUT,
       PSP_BFAST_NUT,
       PSP_ALLFOOD_NUT,
       PSP_PRSCR_NUT,
       PSP_SCORE_NUT,
       PSP_BMI_PYC,
       PSP_REPAST_PYC,
       PSP_SNACK_PYC,
       PSP_DRINK_PYC,
       PSP_FASTFD_PYC,
       PSP_SPORT_PYC,
       PSP_CRINIC_PYC,
       PSP_ETC_PYC ,
       PSP_PRSCR_SM_YN,
       PSP_PRSCR_DRN_YN,
       PSP_PRSCR_SPT_YN,
       PSP_PRSCR_NUT_YN,
       PSP_PRSCR_PYC_YN,
       PSP_CESD,
       PSP_SCORE_CESD,
      (select QQN_RESULT from QT_QUESTION
        where QQN_EXAM_DT = EEA_EXAM_DT and QQN_EXAM_SQ = EEA_EXAM_SQ and QQN_QSTN_CD = '930') PSP_CESD_QEC9,
       PSP_CESD_INFO_YN,
       PSP_GDS,
       PSP_KDSQC,
       PSP_SCORE_SQC
  from ET_EXAM_ACPT A left outer join IT_CUSTOMER    B on A.EEA_CUST_NO = B.ICR_CUST_NO
                      left outer join PT_FIR_PANJUNG C on A.EEA_EXAM_DT = C.PFP_EXAM_DT and A.EEA_EXAM_SQ= C.PFP_EXAM_SQ
                      left outer join PT_SED_PANJUNG D on A.EEA_EXAM_DT = D.PSP_EXAM_DT and A.EEA_EXAM_SQ= D.PSP_EXAM_SQ
                      left outer join IT_AUTH_USER E ON C.PFP_DOCTORFIR = E.IAU_EMP_NO
 where EEA_EXAM_DT between  :dteFromDt  AND :dteToDt
  if (:CMBCHUNGYYYY == '2020') then
        AND (SUBSTR(EEA_HLTH_KD, 19, 1) = '1' OR EEA_MNGT_HTYR = :CMBCHUNGYYYY)
  else
        AND (SUBSTR(EEA_HLTH_KD, 19, 1) = '0' AND EEA_MNGT_HTYR = :CMBCHUNGYYYY)
   and EEA_MNGT_HTYR = :cmbChungYyyy
   and EEA_HTSB_CD in('11001','12003')
   and EEA_ORDER_YN <> 'C'
   and NVL(EEA_RECE_NO, ' ') <> 'R'

   || :sSQL_ADD1

   ) AAA
   left outer join
   (select ERI_EXAM_DT, ERI_EXAM_SQ,
          MAX(A0001) A0001,  MAX(A0002) A0002,  MAX(A0065) A0065,
          MAX(A0019) A0019,  MAX(A0020) A0020,  MAX(A0021) A0021,  MAX(A0022) A0022,
          MAX(A0066) A0066,  MAX(A0006) A0006,  MAX(A0009) A0009,
          MAX(A0014) A0014,  MAX(A0015) A0015,  MAX(BF007) BF007,
          MAX(BB005) BB005,  MAX(BA014) BA014,  MAX(BA009) BA009,
          MAX(BA013) BA013,  MAX(BA010) BA010,  MAX(BA011) BA011,
          MAX(BA012) BA012,  MAX(BA017) BA017,  MAX(BA008) BA008,
          MAX(S0253) S0253,  MAX(BD025) BD025,  MAX(BA005) BA005,
          MAX(BD027) BD027,  MAX(BA006) BA006,  MAX(BD035) BD035,
          MAX(BD026) BD026,  MAX(BD028) BD028,  MAX(BZ022) BZ022,
          MAX(S0252) S0252,  MAX(R0023) R0023,  MAX(R0026) R0026,
          MAX(R0024) R0024,  MAX(F0014) F0014,  MAX(S6) S6,MAX(BZ145) BZ145,
          MAX(N0042) N0042,  MAX(Z0043) Z0043,  MAX(Z0042) Z0042,MAX(Z0044) Z0044,MAX(BZ170) BZ170,
          MAX(SPACE1) SPACE1
     from (select ERI_EXAM_DT,
                  ERI_EXAM_SQ,
                 case when ERI_ITEM_CD='A0001' then ERI_RSLT_VL end A0001,
                 case when ERI_ITEM_CD='A0002' then ERI_RSLT_VL end A0002,
                 case when ERI_ITEM_CD='A0019' then ERI_RSLT_VL end A0019,
                 case when ERI_ITEM_CD='A0020' then ERI_RSLT_VL end A0020,
                 case when ERI_ITEM_CD='A0021' then ERI_RSLT_VL end A0021,
                 case when ERI_ITEM_CD='A0022' then ERI_RSLT_VL end A0022,
                 case when ERI_ITEM_CD='A0065' then ERI_HERT_CD end A0065,
                 case when ERI_ITEM_CD='A0066' then ERI_HERT_CD end A0066,
                 case when ERI_ITEM_CD='A0006' then ERI_RSLT_VL end A0006,
                 case when ERI_ITEM_CD='A0009' then ERI_RSLT_VL end A0009,
                 case when ERI_ITEM_CD='A0014' then ERI_RSLT_VL end A0014,
                 case when ERI_ITEM_CD='A0015' then ERI_RSLT_VL end A0015,
                 case when ERI_ITEM_CD='BF007' then ERI_HERT_CD end BF007,
                 case when ERI_ITEM_CD='BB005' then ERI_RSLT_VL end BB005,
                 case when ERI_ITEM_CD='BA014' then ERI_RSLT_VL end BA014,
                 case when ERI_ITEM_CD='BA009' then ERI_RSLT_VL end BA009,
                 case when ERI_ITEM_CD='BA013' then floor(ERI_RSLT_VL) end BA013,
                 case when ERI_ITEM_CD='BA010' then ERI_RSLT_VL end BA010,
                 case when ERI_ITEM_CD='BA011' then ERI_RSLT_VL end BA011,
                 case when ERI_ITEM_CD='BA012' then ERI_RSLT_VL end BA012,
                 case when ERI_ITEM_CD='BA017' then ERI_RSLT_VL end BA017,
                 case when ERI_ITEM_CD='BA005' then ERI_RSLT_VL end BA005,
                 case when ERI_ITEM_CD='BA006' then ERI_RSLT_VL end BA006,
                 case when ERI_ITEM_CD='BA008' then ERI_RSLT_VL end BA008,
                 case when ERI_ITEM_CD='S0253' then ERI_RSLT_VL end S0253,
                 case when ERI_ITEM_CD IN('BD025','BD003') then ERI_HERT_CD end BD025,
                 case when ERI_ITEM_CD='BD027' then ERI_RSLT_VL end BD027,
                 case when ERI_ITEM_CD IN('BD026','BD004') then ERI_HERT_CD end BD026,
                 case when ERI_ITEM_CD='BD028' then ERI_RSLT_VL end BD028,
                 case when ERI_ITEM_CD='BZ022' then ERI_HERT_CD end BZ022,
                 case when ERI_ITEM_CD IN('BD016','BD035') then ERI_HERT_CD end BD035,
                 case when ERI_ITEM_CD='BZ145' then ERI_RSLT_VL end BZ145,
                 case when ERI_ITEM_CD='BZ170' then ERI_RSLT_VL end BZ170,
                 case when ERI_ITEM_CD='S0252' then ERI_RSLT_VL end S0252,
                 case when ERI_ITEM_CD='R0023' then ERI_HERT_CD end R0023,
                 case when ERI_ITEM_CD='R0026' then ERI_HERT_CD end R0026,
                 case when ERI_ITEM_CD='R0024' then ERI_RSLT_VL end R0024,
                 case when ERI_ITEM_CD='F0001'  and NVL(ERI_RSLT_VL, ' ') <> ' ' and ERI_HERT_CD<>'11' then'1'
                      WHEN ERI_ITEM_CD='F0003'  and NVL(ERI_RSLT_VL, ' ') <> ' ' and ERI_HERT_CD<>'11' then'2'
                      WHEN ERI_ITEM_CD='F0007'  and NVL(ERI_RSLT_VL, ' ') <> ' ' and ERI_HERT_CD<>'11' then'3'
                      WHEN ERI_ITEM_CD='F0014'  and NVL(ERI_RSLT_VL, ' ') <> ' ' and ERI_HERT_CD<>'11' then'4'
                      WHEN ERI_ITEM_CD='F0001'  and NVL(ERI_RSLT_VL, ' ') <> ' ' and ERI_HERT_CD= '11' then'5'
                      WHEN ERI_ITEM_CD='F0003'  and NVL(ERI_RSLT_VL, ' ') <> ' ' and ERI_HERT_CD= '11' then'5'
                      WHEN ERI_ITEM_CD='F0007'  and NVL(ERI_RSLT_VL, ' ') <> ' ' and ERI_HERT_CD= '11' then'5'
                      WHEN ERI_ITEM_CD='F0014'  and NVL(ERI_RSLT_VL, ' ') <> ' ' and ERI_HERT_CD= '11' then'5'
                 ELSE '' end S6,
                 case when ERI_ITEM_CD='F0001' then ERI_HERT_CD
                      WHEN ERI_ITEM_CD='F0003' then ERI_HERT_CD
                      WHEN ERI_ITEM_CD='F0007' then ERI_HERT_CD
                      WHEN ERI_ITEM_CD='F0014' then ERI_HERT_CD
                 end F0014,
                 case when ERI_ITEM_CD='Z0043' then ERI_RSLT_VL end Z0043,
                 case when ERI_ITEM_CD='Z0042' then ERI_HERT_CD end Z0042,
                 case when ERI_ITEM_CD='Z0044' then ERI_HERT_CD end Z0044,
                 case when ERI_ITEM_CD='N0042' then ERI_HERT_CD end N0042,
                 F_RPAD(' ', 4, ' ') SPACE1
  from ET_EXAM_ACPT A left outer join IT_CUSTOMER    B on A.EEA_CUST_NO = B.ICR_CUST_NO
                      left outer join PT_FIR_PANJUNG C on A.EEA_EXAM_DT = C.PFP_EXAM_DT and A.EEA_EXAM_SQ= C.PFP_EXAM_SQ
                      left outer join ET_RSLT_ITEM   F on A.EEA_EXAM_DT = F.ERI_EXAM_DT and A.EEA_EXAM_SQ= F.ERI_EXAM_SQ
 where EEA_EXAM_DT between :dteFromDt  AND :dteToDt

  if (:CMBCHUNGYYYY == '2020') then
        AND (SUBSTR(EEA_HLTH_KD, 19, 1) = '1' OR EEA_MNGT_HTYR = :CMBCHUNGYYYY)
  else
        AND (SUBSTR(EEA_HLTH_KD, 19, 1) = '0' AND EEA_MNGT_HTYR = :CMBCHUNGYYYY)

   and EEA_HTSB_CD in('11001','12003')
   and EEA_ORDER_YN <> 'C'
   and NVL(EEA_RECE_NO, ' ') <> 'R'

   || :sSQL_ADD2

   ) DDD
     group by ERI_EXAM_DT, ERI_EXAM_SQ
   ) BBB
     on AAA.EEA_EXAM_DT = BBB.ERI_EXAM_DT and AAA.EEA_EXAM_SQ = BBB.ERI_EXAM_SQ
   left outer join
   (select QQN_EXAM_DT,
           QQN_EXAM_SQ,
           F_TEL_FORMAT_NUM(ICR_TEL_NO,'1') ICR_TEL_NO1,F_TEL_FORMAT_NUM(ICR_TEL_NO,'2') ICR_TEL_NO2,F_TEL_FORMAT_NUM(ICR_TEL_NO,'3') ICR_TEL_NO3,
           F_TEL_FORMAT_NUM(ICR_MOBL_NO,'1') ICR_MOBL_NO1,F_TEL_FORMAT_NUM(ICR_MOBL_NO,'2') ICR_MOBL_NO2,F_TEL_FORMAT_NUM(ICR_MOBL_NO,'3') ICR_MOBL_NO3 ,
           ICR_EMAI_AR,
           ICR_RECV_YN,MAX(M3) M3,MAX(M4) M4,MAX(M5) M5, MAX(M6) M6,MAX(M7) M7,
           MAX(M8) M8,MAX(M9) M9,MAX(M10) M10,MAX(M11) M11,MAX(M12) M12,MAX(M13) M13,
           MAX(M14) M14,MAX(M15) M15,MAX(M16) M16,MAX(M17) M17,MAX(M18) M18,MAX(M19) M19,
           MAX(M20) M20,MAX(M21) M21,MAX(M22) M22,MAX(M23) M23,MAX(M983) M983,MAX(M25) M25,
           MAX(M26) M26,MAX(M27) M27,MAX(M28) M28,MAX(M976) M976,
           MAX(M977) M977, MAX(M978) M978, MAX(M979) M979, MAX(M980) M980, MAX(M981) M981, MAX(M982) M982,
           MAX(M873) M873, MAX(M865) M865, MAX(M867) M867, MAX(M868) M868, MAX(M869) M869,
           MAX(M870) M870, MAX(M871) M871, MAX(M874) M874, MAX(M872) M872, MAX(M875) M875,
           MAX(M876) M876, MAX(M877) M877, MAX(M878) M878, MAX(M879) M879, MAX(M880) M880,
           MAX(M881) M881, MAX(M882) M882, MAX(M883) M883, MAX(M884) M884, MAX(M885) M885,
           MAX(M887) M887, MAX(M888) M888, MAX(M889) M889, MAX(M890) M890, MAX(M891) M891,
           MAX(M892) M892, MAX(M893) M893, MAX(M894) M894, MAX(M895) M895, MAX(M896) M896,
           MAX(M897) M897, MAX(M898) M898, MAX(M899) M899, MAX(M900) M900, MAX(M902) M902,
           MAX(M901) M901, MAX(M903) M903, MAX(M904) M904, MAX(M905) M905, MAX(M906) M906,
           MAX(M908) M908, MAX(M909) M909, MAX(M910) M910, MAX(M911) M911, MAX(M912) M912,
           MAX(M914) M914, MAX(M915) M915, MAX(M916) M916, MAX(M918) M918, MAX(M919) M919,
           MAX(M920) M920,
           MAX(M43) M43 , MAX(M921) M921, MAX(M44) M44 , MAX(M45) M45 , MAX(M46) M46 ,
           MAX(M47) M47 , MAX(M48) M48 , MAX(M49) M49 , MAX(M53) M53 , MAX(M54) M54 ,
           MAX(M922) M922, MAX(M923) M923, MAX(M924) M924, MAX(M925) M925,
           MAX(M927) M927, MAX(M926) M926, MAX(M928) M928, MAX(M929) M929, MAX(M930) M930,
           MAX(M429) M429, MAX(M430) M430, MAX(M431) M431, MAX(M432) M432, MAX(M433) M433,
           MAX(M434) M434, MAX(M435) M435, MAX(M436) M436, MAX(M437) M437, MAX(M438) M438,
           MAX(M439) M439, MAX(M440) M440, MAX(M441) M441, MAX(M442) M442, MAX(M443) M443
    from (select QQN_EXAM_DT,
                 QQN_EXAM_SQ,
                 EEA_SEND_CD,
                 ICR_PENL_ID,
                 icr_pid_en,
                 ICR_TEL_NO,
                 ICR_MOBL_NO,
                 ICR_EMAI_AR,
                 ICR_RECV_YN,
                 case when IIQ_QGTN_CD='3' then    QQN_RESULT end M3,
                 case when IIQ_QGTN_CD='4' then    QQN_RESULT end M4,
                 case when IIQ_QGTN_CD='5' then    QQN_RESULT end M5,
                 case when IIQ_QGTN_CD='6' then    QQN_RESULT end M6,
                 case when IIQ_QGTN_CD='7' then    QQN_RESULT end M7,
                 case when IIQ_QGTN_CD='8' then    QQN_RESULT end M8,
                 case when IIQ_QGTN_CD='9' then    QQN_RESULT end M9,
                 case when IIQ_QGTN_CD='10' then    QQN_RESULT end M10,
                 case when IIQ_QGTN_CD='11' then    QQN_RESULT end M11,
                 case when IIQ_QGTN_CD='12' then    QQN_RESULT end M12,
                 case when IIQ_QGTN_CD='13' then    QQN_RESULT end M13,
                 case when IIQ_QGTN_CD='14' then    QQN_RESULT end M14,
                 case when IIQ_QGTN_CD='15' then    QQN_RESULT end M15,
                 case when IIQ_QGTN_CD='16' then    QQN_RESULT end M16,
                 case when IIQ_QGTN_CD='17' then    QQN_RESULT end M17,
                 case when IIQ_QGTN_CD='18' then    QQN_RESULT end M18,
                 case when IIQ_QGTN_CD='19' then    QQN_RESULT end M19,
                 case when IIQ_QGTN_CD='20' then    QQN_RESULT end M20,
                 case when IIQ_QGTN_CD='21' then    QQN_RESULT end M21,
                 case when IIQ_QGTN_CD='22' then    QQN_RESULT end M22,
                 case when IIQ_QGTN_CD='23' then    QQN_RESULT end M23,
                 case when IIQ_QGTN_CD='983' then   QQN_RESULT end M983,
                 case when IIQ_QGTN_CD='25' then    QQN_RESULT end M25,
                 case when IIQ_QGTN_CD='26' then    QQN_RESULT end M26,
                 case when IIQ_QGTN_CD='27' then    QQN_RESULT end M27,
                 case when IIQ_QGTN_CD='28' then    QQN_RESULT end M28,
                 case when IIQ_QGTN_CD='976' then   QQN_RESULT end M976,
                 case when IIQ_QGTN_CD='977' then   QQN_RESULT end M977,
                 case when IIQ_QGTN_CD='978' then   QQN_RESULT end M978,
                 case when IIQ_QGTN_CD='979' then   QQN_RESULT end M979,
                 case when IIQ_QGTN_CD='981' then   QQN_RESULT end M981,
                 case when IIQ_QGTN_CD='982' then   QQN_RESULT end M982,
                 case when IIQ_QGTN_CD='980' then   QQN_RESULT end M980,
                 case when IIQ_QGTN_CD='873' then    QQN_RESULT end M873,
                 case when IIQ_QGTN_CD='865' then    QQN_RESULT end M865,
                 case when IIQ_QGTN_CD='867' then    QQN_RESULT end M867,
                 case when IIQ_QGTN_CD='868' then    QQN_RESULT end M868,
                 case when IIQ_QGTN_CD='869' then    QQN_RESULT end M869,
                 case when IIQ_QGTN_CD='870' then    QQN_RESULT end M870,
                 case when IIQ_QGTN_CD='871' then    QQN_RESULT end M871,
                 case when IIQ_QGTN_CD='874' then    QQN_RESULT end M874,
                 case when IIQ_QGTN_CD='872' then    QQN_RESULT end M872,
                 case when IIQ_QGTN_CD='875' then    QQN_RESULT end M875,
                 case when IIQ_QGTN_CD='876' then    QQN_RESULT end M876,
                 case when IIQ_QGTN_CD='877' then    QQN_RESULT end M877,
                 case when IIQ_QGTN_CD='878' then    QQN_RESULT end M878,
                 case when IIQ_QGTN_CD='879' then    QQN_RESULT end M879,
                 case when IIQ_QGTN_CD='880' then    QQN_RESULT end M880,
                 case when IIQ_QGTN_CD='881' then    QQN_RESULT end M881,
                 case when IIQ_QGTN_CD='882' then    QQN_RESULT end M882,
                 case when IIQ_QGTN_CD='883' then    QQN_RESULT end M883,
                 case when IIQ_QGTN_CD='884' then    QQN_RESULT end M884,
                 case when IIQ_QGTN_CD='885' then    QQN_RESULT end M885,
                 case when IIQ_QGTN_CD='887' then    QQN_RESULT end M887,
                 case when IIQ_QGTN_CD='888' then    QQN_RESULT end M888,
                 case when IIQ_QGTN_CD='889' then    QQN_RESULT end M889,
                 case when IIQ_QGTN_CD='890' then    QQN_RESULT end M890,
                 case when IIQ_QGTN_CD='891' then    QQN_RESULT end M891,
                 case when IIQ_QGTN_CD='892' then    QQN_RESULT end M892,
                 case when IIQ_QGTN_CD='893' then    QQN_RESULT end M893,
                 case when IIQ_QGTN_CD='894' then    QQN_RESULT end M894,
                 case when IIQ_QGTN_CD='895' then    QQN_RESULT end M895,
                 case when IIQ_QGTN_CD='896' then    QQN_RESULT end M896,
                 case when IIQ_QGTN_CD='897' then    QQN_RESULT end M897,
                 case when IIQ_QGTN_CD='898' then    QQN_RESULT end M898,
                 case when IIQ_QGTN_CD='899' then    QQN_RESULT end M899,
                 case when IIQ_QGTN_CD='900' then    QQN_RESULT end M900,
                 case when IIQ_QGTN_CD='902' then    QQN_RESULT end M902,
                 case when IIQ_QGTN_CD='901' then    QQN_RESULT end M901,
                 case when IIQ_QGTN_CD='903' then    QQN_RESULT end M903,
                 case when IIQ_QGTN_CD='904' then    QQN_RESULT end M904,
                 case when IIQ_QGTN_CD='905' then    QQN_RESULT end M905,
                 case when IIQ_QGTN_CD='906' then    QQN_RESULT end M906,
                 case when IIQ_QGTN_CD='908' then    QQN_RESULT end M908,
                 case when IIQ_QGTN_CD='909' then    QQN_RESULT end M909,
                 case when IIQ_QGTN_CD='910' then    QQN_RESULT end M910,
                 case when IIQ_QGTN_CD='911' then    QQN_RESULT end M911,
                 case when IIQ_QGTN_CD='912' then    QQN_RESULT end M912,
                 case when IIQ_QGTN_CD='914' then    QQN_RESULT end M914,
                 case when IIQ_QGTN_CD='915' then    QQN_RESULT end M915,
                 case when IIQ_QGTN_CD='916' then    QQN_RESULT end M916,
                 case when IIQ_QGTN_CD='918' then    QQN_RESULT end M918,
                 case when IIQ_QGTN_CD='919' then    QQN_RESULT end M919,
                 case when IIQ_QGTN_CD='920' then    QQN_RESULT end M920,
                 case when IIQ_QGTN_CD='43'  then    QQN_RESULT end M43 ,
                 case when IIQ_QGTN_CD='921' then    QQN_RESULT end M921,
                 case when IIQ_QGTN_CD='44'  then    QQN_RESULT end M44 ,
                 case when IIQ_QGTN_CD='45'  then    QQN_RESULT end M45 ,
                 case when IIQ_QGTN_CD='46'  then    QQN_RESULT end M46 ,
                 case when IIQ_QGTN_CD='47'  then    QQN_RESULT end M47 ,
                 case when IIQ_QGTN_CD='48'  then    QQN_RESULT end M48 ,
                 case when IIQ_QGTN_CD='49'  then    QQN_RESULT end M49 ,
                 case when IIQ_QGTN_CD='53'  then    QQN_RESULT end M53 ,
                 case when IIQ_QGTN_CD='54'  then    QQN_RESULT end M54 ,
                 case when IIQ_QGTN_CD='922'  then    QQN_RESULT end M922,
                 case when IIQ_QGTN_CD='923'  then    QQN_RESULT end M923,
                 case when IIQ_QGTN_CD='924'  then    QQN_RESULT end M924,
                 case when IIQ_QGTN_CD='925'  then    QQN_RESULT end M925,
                 case when IIQ_QGTN_CD='927'  then    QQN_RESULT end M927,
                 case when IIQ_QGTN_CD='926'  then    QQN_RESULT end M926,
                 case when IIQ_QGTN_CD='928'  then    QQN_RESULT end M928,
                 case when IIQ_QGTN_CD='929'  then    QQN_RESULT end M929,
                 case when IIQ_QGTN_CD='930'  then    QQN_RESULT end M930,
                 case when IIQ_QGTN_CD='429'  then    QQN_RESULT end M429,
                 case when IIQ_QGTN_CD='430'  then    QQN_RESULT end M430,
                 case when IIQ_QGTN_CD='431'  then    QQN_RESULT end M431,
                 case when IIQ_QGTN_CD='432'  then    QQN_RESULT end M432,
                 case when IIQ_QGTN_CD='433'  then    QQN_RESULT end M433,
                 case when IIQ_QGTN_CD='434'  then    QQN_RESULT end M434,
                 case when IIQ_QGTN_CD='435'  then    QQN_RESULT end M435,
                 case when IIQ_QGTN_CD='436'  then    QQN_RESULT end M436,
                 case when IIQ_QGTN_CD='437'  then    QQN_RESULT end M437,
                 case when IIQ_QGTN_CD='438'  then    QQN_RESULT end M438,
                 case when IIQ_QGTN_CD='439'  then    QQN_RESULT end M439,
                 case when IIQ_QGTN_CD='440'  then    QQN_RESULT end M440,
                 case when IIQ_QGTN_CD='441'  then    QQN_RESULT end M441,
                 case when IIQ_QGTN_CD='442'  then    QQN_RESULT end M442,
                 case when IIQ_QGTN_CD='443'  then    QQN_RESULT end M443
            from ET_EXAM_ACPT  A
                 left outer join QT_QUESTION B ON A.EEA_EXAM_DT=B.QQN_EXAM_DT and A.EEA_EXAM_SQ=B.QQN_EXAM_SQ
                 left outer join IT_CUSTOMER C ON A.EEA_CUST_NO=C.ICR_CUST_NO
                 left outer join IT_ITEM_QUESTION D
                            ON B.QQN_QSTN_CD=D.IIQ_QGTN_CD  and IIQ_APLY_DT= GetITEM_QUESTION_ApplyDate( IIQ_ITEM_CD,EEA_EXAM_DT)
                      left outer join PT_FIR_PANJUNG E on A.EEA_EXAM_DT = E.PFP_EXAM_DT and A.EEA_EXAM_SQ= E.PFP_EXAM_SQ
           where EEA_EXAM_DT between :dteFromDt  AND :dteToDt
             and IIQ_ITEM_CD IN('M0018','M0019','M0057','M0028')
             and EEA_HTSB_CD in('11001','12003')
   if (:CMBCHUNGYYYY == '2020') then
        AND (SUBSTR(EEA_HLTH_KD, 19, 1) = '1' OR EEA_MNGT_HTYR = :CMBCHUNGYYYY)
   else
        AND (SUBSTR(EEA_HLTH_KD, 19, 1) = '0' AND EEA_MNGT_HTYR = :CMBCHUNGYYYY)
   and EEA_ORDER_YN <> 'C'
   and NVL(EEA_RECE_NO, ' ') <> 'R'

   || :sSQL_ADD3

    ) TTT
    group by QQN_EXAM_DT, QQN_EXAM_SQ, ICR_TEL_NO, ICR_MOBL_NO, ICR_EMAI_AR, ICR_RECV_YN
  ) CCC
    ON AAA.EEA_EXAM_DT = CCC.QQN_EXAM_DT
   and AAA.EEA_EXAM_SQ = CCC.QQN_EXAM_SQ
 order by AAA.EEA_EXAM_DT, AAA.EEA_PSNL_NM


		*/

		sql = " SELECT *";
		sql += " FROM (";
		sql += "	SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_HTSB_CD, '2' FILEGBN, EEA_HLTH_KD, EEA_SAFE_YN, SUBSTR(EEA_HLTH_KD,1,1) EEA_HLTH_KD1, ";
		sql += " SUBSTR(EEA_HLTH_KD,2,1) EEA_HLTH_KD2, SUBSTR(EEA_HLTH_KD,3,1) EEA_HLTH_KD3, SUBSTR(EEA_HLTH_KD,4,1) EEA_HLTH_KD4, SUBSTR(EEA_HLTH_KD,5,1) EEA_HLTH_KD5, ";
		sql += " SUBSTR(EEA_HLTH_KD,6,1) EEA_HLTH_KD6, SUBSTR(EEA_HLTH_KD,7,1) EEA_HLTH_KD7, SUBSTR(EEA_HLTH_KD,8,1) EEA_HLTH_KD8, SUBSTR(EEA_HLTH_KD,9,1) EEA_HLTH_KD9, ";
		sql += " EEA_MNGT_HTYR, ICR_BIRH_DT, ICR_ZIP_CD, ICR_ZIP_AR, ICR_ROAD_AR, EEA_INSU_NO, ICR_PENL_ID,ICR_PID_EN, EEA_HEPA_YN, EEA_SEND_CD, EEA_HCV_YN, ";
		sql += " (EEA_HLTHR_PR-(NVL(EEA_CANR_PR,0)+NVL(EEA_ORALR_PR,0))) EEA_HLTHR_PR , EEA_CNTR_CD, EEA_PSNL_NM, EEA_FOOD_YN, EEA_CHART_NO, EEA_HOLIDAY_YN, PFP_HISJIN, PFP_HISMED, ";
		sql += " PFP_LIVESMK, PFP_LIVEDRK, PFP_LIVESPT, PFP_LIVEWET, PFP_EXINJUR, PFP_DEPRESS, PFP_CNDTION, PFP_CGNTION, PFP_PANRETA, PFP_PANRETB, PFP_PANRETR1, ";
		sql += " PFP_PANRETR2, PFP_PANRETRD, PFP_RESULTB_1, PFP_RESULTB_2, PFP_RESULTB_3, PFP_RESULTB_4, PFP_RESULTB_5, PFP_RESULTB_6, PFP_RESULTB_7, PFP_RESULTB_8, ";
		sql += " PFP_RESULTB_9, PFP_RESULTB_11, PFP_RESULTB_10, PFP_RESULTR1_1, PFP_RESULTR1_2, PFP_RESULTR1_3, PFP_RESULTR1_4, PFP_RESULTR1_5, PFP_RESULTR1_6, ";
		sql += " PFP_RESULTR1_7, PFP_RESULTR1_8, PFP_RESULTR1_9, PFP_RESULTR1_10, PFP_RESULT8_ETC, PFP_RESULTR2_1, PFP_RESULTR2_2, PFP_RESULTRD_1, PFP_RESULTRD_2, ";
		sql += " PFP_RESULTRD_3, PFP_RESULTRD_4, PFP_DOCTORFIR, PFP_DOCTORQQN, PFP_FIX_YN, PFP_OPIN1, PFP_OPIN2, PFP_OPIN3, PFP_OPIN4, REPLACE(PFP_EXAM_DT,'-','') PFP_EXAM_DT, ";
		sql += " REPLACE(PFP_RESULT_DATE,'-','') PFP_RESULT_DATE, EEA_PLCE_CD , '3' SENDGBN , REPLACE(PFP_TRANC_DATE,'-','') PFP_TRANC_DATE, IAU_LICEN1_NO , IAU_PENL_NM, ";
		sql += " IAU_PENL_ID, REPLACE(EEA_EXAM_DT,'-','') EEA_INFO_DT, ICR_INFO_YN , SUBSTR(EEA_SELF_KD,4,1) EEA_SELF_KD_4_1 , PSP_EVALU_SM, PSP_NICO_SM, PSP_PRSCR_SM, ";
		sql += " PSP_SCORE_SM, PSP_EVALU_DRN, PSP_PRSCR_DRN, PSP_SCORE_DRN, PSP_EVALU_SPT, PSP_PRSCR_SPT, PSP_PRSTM_SPT, PSP_PRSNUM_SPT, PSP_SCORE_SPT, PSP_EVALU_NUT, ";
		sql += " PSP_RECOMDAI_NUT, PSP_RECOMPRO_NUT, PSP_RECOMVEG_NUT, PSP_RESTFAT_NUT, PSP_RESTSGA_NUT, PSP_RESTSALT_NUT, PSP_BFAST_NUT, PSP_ALLFOOD_NUT, PSP_PRSCR_NUT, ";
		sql += " PSP_SCORE_NUT, PSP_BMI_PYC, PSP_REPAST_PYC, PSP_SNACK_PYC, PSP_DRINK_PYC, PSP_FASTFD_PYC, PSP_SPORT_PYC, PSP_CRINIC_PYC, PSP_ETC_PYC , PSP_PRSCR_SM_YN, ";
		sql += " PSP_PRSCR_DRN_YN, PSP_PRSCR_SPT_YN, PSP_PRSCR_NUT_YN, PSP_PRSCR_PYC_YN, PSP_CESD, PSP_SCORE_CESD";
		sql += "	, (SELECT QQN_RESULT FROM QT_QUESTION WHERE QQN_EXAM_DT = EEA_EXAM_DT AND QQN_EXAM_SQ = EEA_EXAM_SQ AND QQN_QSTN_CD = '930') PSP_CESD_QEC9";
		sql += "	, PSP_CESD_INFO_YN, PSP_GDS, PSP_KDSQC, PSP_SCORE_SQC";
		sql += " 	FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " 	ON A.EEA_CUST_NO = B.ICR_CUST_NO";

		sql += "	LEFT OUTER JOIN PT_FIR_PANJUNG C";
		sql += " 	ON A.EEA_EXAM_DT = C.PFP_EXAM_DT";
		sql += " 	AND A.EEA_EXAM_SQ= C.PFP_EXAM_SQ";

		sql += "	LEFT OUTER JOIN PT_SED_PANJUNG D";
		sql += " 	ON A.EEA_EXAM_DT = D.PSP_EXAM_DT";
		sql += " 	AND A.EEA_EXAM_SQ= D.PSP_EXAM_SQ";

		sql += "	LEFT OUTER JOIN IT_AUTH_USER E";
		sql += " 	ON C.PFP_DOCTORFIR = E.IAU_EMP_NO";

		sql += " 	WHERE EEA_EXAM_DT BETWEEN '" + DTEFROMDT + "'";
		sql += " 	AND '" + DTETODT + "'";

		if (CMBCHUNGYYYY.equals("2020")) {
			sql += " AND (SUBSTR(EEA_HLTH_KD, 19, 1) = '1' OR EEA_MNGT_HTYR = '" + CMBCHUNGYYYY + "') ";
		} else {
			sql += " AND (SUBSTR(EEA_HLTH_KD, 19, 1) = '0' AND EEA_MNGT_HTYR = '" + CMBCHUNGYYYY + "')";
		}

		sql += " 	AND EEA_HTSB_CD IN('11001','12003')";
		sql += " 	AND EEA_ORDER_YN <> 'C'";
		sql += " 	AND NVL(EEA_RECE_NO, ' ') <> 'R' ";

		sql += SSQL_ADD1;

		sql += " ) AAA LEFT OUTER JOIN (";

		sql += "	SELECT ERI_EXAM_DT, ERI_EXAM_SQ, MAX(A0001) A0001, MAX(A0002) A0002, MAX(A0065) A0065, MAX(A0019) A0019, MAX(A0020) A0020, MAX(A0021) A0021, MAX(A0022) A0022, MAX(A0066) A0066, MAX(A0006) A0006, MAX(A0009) A0009, MAX(A0014) A0014, MAX(A0015) A0015, MAX(BF007) BF007, MAX(BB005) BB005, MAX(BA014) BA014, MAX(BA009) BA009, MAX(BA013) BA013, MAX(BA010) BA010, MAX(BA011) BA011, MAX(BA012) BA012, MAX(BA017) BA017, MAX(BA008) BA008, MAX(S0253) S0253, MAX(BD025) BD025, MAX(BA005) BA005, MAX(BD027) BD027, MAX(BA006) BA006, MAX(BD035) BD035, MAX(BD026) BD026, MAX(BD028) BD028, MAX(BZ022) BZ022, MAX(S0252) S0252, MAX(R0023) R0023, MAX(R0026) R0026, MAX(R0024) R0024, MAX(F0014) F0014, MAX(S6) S6,MAX(BZ145) BZ145, MAX(N0042) N0042, MAX(Z0043) Z0043, MAX(Z0042) Z0042,MAX(Z0044) Z0044,MAX(BZ170) BZ170, MAX(SPACE1) SPACE1";
		sql += " 	FROM (";
		sql += "		SELECT ERI_EXAM_DT, ERI_EXAM_SQ";
		sql += "		, CASE WHEN ERI_ITEM_CD='A0001' THEN ERI_RSLT_VL END A0001";
		sql += "		, CASE WHEN ERI_ITEM_CD='A0002' THEN ERI_RSLT_VL END A0002";
		sql += "		, CASE WHEN ERI_ITEM_CD='A0019' THEN ERI_RSLT_VL END A0019";
		sql += "		, CASE WHEN ERI_ITEM_CD='A0020' THEN ERI_RSLT_VL END A0020";
		sql += "		, CASE WHEN ERI_ITEM_CD='A0021' THEN ERI_RSLT_VL END A0021";
		sql += "		, CASE WHEN ERI_ITEM_CD='A0022' THEN ERI_RSLT_VL END A0022";
		sql += "		, CASE WHEN ERI_ITEM_CD='A0065' THEN ERI_HERT_CD END A0065";
		sql += "		, CASE WHEN ERI_ITEM_CD='A0066' THEN ERI_HERT_CD END A0066";
		sql += "		, CASE WHEN ERI_ITEM_CD='A0006' THEN ERI_RSLT_VL END A0006";
		sql += "		, CASE WHEN ERI_ITEM_CD='A0009' THEN ERI_RSLT_VL END A0009";
		sql += "		, CASE WHEN ERI_ITEM_CD='A0014' THEN ERI_RSLT_VL END A0014";
		sql += "		, CASE WHEN ERI_ITEM_CD='A0015' THEN ERI_RSLT_VL END A0015";
		sql += "		, CASE WHEN ERI_ITEM_CD='BF007' THEN ERI_HERT_CD END BF007";
		sql += "		, CASE WHEN ERI_ITEM_CD='BB005' THEN ERI_RSLT_VL END BB005";
		sql += "		, CASE WHEN ERI_ITEM_CD='BA014' THEN ERI_RSLT_VL END BA014";
		sql += "		, CASE WHEN ERI_ITEM_CD='BA009' THEN ERI_RSLT_VL END BA009";
		sql += "		, CASE WHEN ERI_ITEM_CD='BA013' THEN FLOOR(ERI_RSLT_VL) END BA013";
		sql += "		, CASE WHEN ERI_ITEM_CD='BA010' THEN ERI_RSLT_VL END BA010";
		sql += "		, CASE WHEN ERI_ITEM_CD='BA011' THEN ERI_RSLT_VL END BA011";
		sql += "		, CASE WHEN ERI_ITEM_CD='BA012' THEN ERI_RSLT_VL END BA012";
		sql += "		, CASE WHEN ERI_ITEM_CD='BA017' THEN ERI_RSLT_VL END BA017";
		sql += "		, CASE WHEN ERI_ITEM_CD='BA005' THEN ERI_RSLT_VL END BA005";
		sql += "		, CASE WHEN ERI_ITEM_CD='BA006' THEN ERI_RSLT_VL END BA006";
		sql += "		, CASE WHEN ERI_ITEM_CD='BA008' THEN ERI_RSLT_VL END BA008";
		sql += "		, CASE WHEN ERI_ITEM_CD='S0253' THEN ERI_RSLT_VL END S0253";
		sql += "		, CASE WHEN ERI_ITEM_CD IN('BD025','BD003') THEN ERI_HERT_CD END BD025";
		sql += "		, CASE WHEN ERI_ITEM_CD='BD027' THEN ERI_RSLT_VL END BD027";
		sql += "		, CASE WHEN ERI_ITEM_CD IN('BD026','BD004') THEN ERI_HERT_CD END BD026";
		sql += "		, CASE WHEN ERI_ITEM_CD='BD028' THEN ERI_RSLT_VL END BD028";
		sql += "		, CASE WHEN ERI_ITEM_CD='BZ022' THEN ERI_HERT_CD END BZ022";
		sql += "		, CASE WHEN ERI_ITEM_CD IN('BD016','BD035') THEN ERI_HERT_CD END BD035";
		sql += "		, CASE WHEN ERI_ITEM_CD='BZ145' THEN ERI_RSLT_VL END BZ145";
		sql += "		, CASE WHEN ERI_ITEM_CD='BZ170' THEN ERI_RSLT_VL END BZ170";
		sql += "		, CASE WHEN ERI_ITEM_CD='S0252' THEN ERI_RSLT_VL END S0252";
		sql += "		, CASE WHEN ERI_ITEM_CD='R0023' THEN ERI_HERT_CD END R0023";
		sql += "		, CASE WHEN ERI_ITEM_CD='R0026' THEN ERI_HERT_CD END R0026";
		sql += "		, CASE WHEN ERI_ITEM_CD='R0024' THEN ERI_RSLT_VL END R0024";

		sql += "		, CASE WHEN ERI_ITEM_CD='F0001' AND NVL(ERI_RSLT_VL, ' ') <> ' ' AND ERI_HERT_CD<>'11' THEN '1'";
		sql += "			WHEN ERI_ITEM_CD='F0003' AND NVL(ERI_RSLT_VL, ' ') <> ' ' AND ERI_HERT_CD<>'11' THEN '2'";
		sql += "			WHEN ERI_ITEM_CD='F0007' AND NVL(ERI_RSLT_VL, ' ') <> ' ' AND ERI_HERT_CD<>'11' THEN '3'";
		sql += "			WHEN ERI_ITEM_CD='F0014' AND NVL(ERI_RSLT_VL, ' ') <> ' ' AND ERI_HERT_CD<>'11' THEN '4'";
		sql += "			WHEN ERI_ITEM_CD='F0001' AND NVL(ERI_RSLT_VL, ' ') <> ' ' AND ERI_HERT_CD= '11' THEN '5'";
		sql += "			WHEN ERI_ITEM_CD='F0003' AND NVL(ERI_RSLT_VL, ' ') <> ' ' AND ERI_HERT_CD= '11' THEN '5'";
		sql += "			WHEN ERI_ITEM_CD='F0007' AND NVL(ERI_RSLT_VL, ' ') <> ' ' AND ERI_HERT_CD= '11' THEN '5'";
		sql += "			WHEN ERI_ITEM_CD='F0014' AND NVL(ERI_RSLT_VL, ' ') <> ' ' AND ERI_HERT_CD= '11' THEN '5'";
		sql += "		ELSE '' END S6";

		sql += "		, CASE WHEN ERI_ITEM_CD='F0001' THEN ERI_HERT_CD WHEN ERI_ITEM_CD='F0003' THEN ERI_HERT_CD WHEN ERI_ITEM_CD='F0007' THEN ERI_HERT_CD WHEN ERI_ITEM_CD='F0014' THEN ERI_HERT_CD END F0014";
		sql += "		, CASE WHEN ERI_ITEM_CD='Z0043' THEN ERI_RSLT_VL END Z0043";
		sql += "		, CASE WHEN ERI_ITEM_CD='Z0042' THEN ERI_HERT_CD END Z0042";
		sql += "		, CASE WHEN ERI_ITEM_CD='Z0044' THEN ERI_HERT_CD END Z0044";
		sql += "		, CASE WHEN ERI_ITEM_CD='N0042' THEN ERI_HERT_CD END N0042";
		sql += "		, F_RPAD(' ', 4, ' ') SPACE1";

		sql += " 		FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " 		ON A.EEA_CUST_NO = B.ICR_CUST_NO";

		sql += "		LEFT OUTER JOIN PT_FIR_PANJUNG C";
		sql += " 		ON A.EEA_EXAM_DT = C.PFP_EXAM_DT";
		sql += " 		AND A.EEA_EXAM_SQ= C.PFP_EXAM_SQ";

		sql += "		LEFT OUTER JOIN ET_RSLT_ITEM F";
		sql += " 		ON A.EEA_EXAM_DT = F.ERI_EXAM_DT";
		sql += " 		AND A.EEA_EXAM_SQ= F.ERI_EXAM_SQ";

		sql += " 		WHERE EEA_EXAM_DT BETWEEN '" + DTEFROMDT + "'";
		sql += " 		AND '" + DTETODT + "'";
		if (CMBCHUNGYYYY.equals("2020")) {
			sql += " AND (SUBSTR(EEA_HLTH_KD, 19, 1) = '1' OR EEA_MNGT_HTYR = '" + CMBCHUNGYYYY + "') ";
		} else {
			sql += " AND (SUBSTR(EEA_HLTH_KD, 19, 1) = '0' AND EEA_MNGT_HTYR = '" + CMBCHUNGYYYY + "')";
		}
		sql += " 		AND EEA_HTSB_CD IN('11001','12003')";
		sql += " 		AND EEA_ORDER_YN <> 'C'";
		sql += " 		AND NVL(EEA_RECE_NO, ' ') <> 'R' ";

		sql += SSQL_ADD2;

		sql += " 	) DDD";
		sql += " 	GROUP BY ERI_EXAM_DT, ERI_EXAM_SQ";
		sql += " ) BBB";
		sql += " ON AAA.EEA_EXAM_DT = BBB.ERI_EXAM_DT";
		sql += " AND AAA.EEA_EXAM_SQ = BBB.ERI_EXAM_SQ";

		sql += " LEFT OUTER JOIN (";
		sql += "	SELECT QQN_EXAM_DT, QQN_EXAM_SQ, F_TEL_FORMAT_NUM(ICR_TEL_NO,'1') ICR_TEL_NO1,F_TEL_FORMAT_NUM(ICR_TEL_NO,'2') ICR_TEL_NO2,F_TEL_FORMAT_NUM(ICR_TEL_NO,'3') ICR_TEL_NO3, F_TEL_FORMAT_NUM(ICR_MOBL_NO,'1') ICR_MOBL_NO1,F_TEL_FORMAT_NUM(ICR_MOBL_NO,'2') ICR_MOBL_NO2,F_TEL_FORMAT_NUM(ICR_MOBL_NO,'3') ICR_MOBL_NO3 , ICR_EMAI_AR, ICR_RECV_YN,MAX(M3) M3,MAX(M4) M4,MAX(M5) M5, MAX(M6) M6,MAX(M7) M7, MAX(M8) M8,MAX(M9) M9,MAX(M10) M10,MAX(M11) M11,MAX(M12) M12,MAX(M13) M13, MAX(M14) M14,MAX(M15) M15,MAX(M16) M16,MAX(M17) M17,MAX(M18) M18,MAX(M19) M19, MAX(M20) M20,MAX(M21) M21,MAX(M22) M22,MAX(M23) M23,MAX(M983) M983,MAX(M25) M25, MAX(M26) M26,MAX(M27) M27,MAX(M28) M28,MAX(M976) M976, MAX(M977) M977, MAX(M978) M978, MAX(M979) M979, MAX(M980) M980, MAX(M981) M981, MAX(M982) M982, MAX(M873) M873, MAX(M865) M865, MAX(M867) M867, MAX(M868) M868, MAX(M869) M869, MAX(M870) M870, MAX(M871) M871, MAX(M874) M874, MAX(M872) M872, MAX(M875) M875, MAX(M876) M876, MAX(M877) M877, MAX(M878) M878, MAX(M879) M879, MAX(M880) M880, MAX(M881) M881, MAX(M882) M882, MAX(M883) M883, MAX(M884) M884, MAX(M885) M885, MAX(M887) M887, MAX(M888) M888, MAX(M889) M889, MAX(M890) M890, MAX(M891) M891, MAX(M892) M892, MAX(M893) M893, MAX(M894) M894, MAX(M895) M895, MAX(M896) M896, MAX(M897) M897, MAX(M898) M898, MAX(M899) M899, MAX(M900) M900, MAX(M902) M902, MAX(M901) M901, MAX(M903) M903, MAX(M904) M904, MAX(M905) M905, MAX(M906) M906, MAX(M908) M908, MAX(M909) M909, MAX(M910) M910, MAX(M911) M911, MAX(M912) M912, MAX(M914) M914, MAX(M915) M915, MAX(M916) M916, MAX(M918) M918, MAX(M919) M919, MAX(M920) M920, MAX(M43) M43 , MAX(M921) M921, MAX(M44) M44 , MAX(M45) M45 , MAX(M46) M46 , MAX(M47) M47 , MAX(M48) M48 , MAX(M49) M49 , MAX(M53) M53 , MAX(M54) M54 , MAX(M922) M922, MAX(M923) M923, MAX(M924) M924, MAX(M925) M925, MAX(M927) M927, MAX(M926) M926, MAX(M928) M928, MAX(M929) M929, MAX(M930) M930, MAX(M429) M429, MAX(M430) M430, MAX(M431) M431, MAX(M432) M432, MAX(M433) M433, MAX(M434) M434, MAX(M435) M435, MAX(M436) M436, MAX(M437) M437, MAX(M438) M438, MAX(M439) M439, MAX(M440) M440, MAX(M441) M441, MAX(M442) M442, MAX(M443) M443";
		sql += " 	FROM (";
		sql += "		SELECT QQN_EXAM_DT, QQN_EXAM_SQ, EEA_SEND_CD, ICR_PENL_ID, ICR_PID_EN, ICR_TEL_NO, ICR_MOBL_NO, ICR_EMAI_AR, ICR_RECV_YN";
		sql += "		, CASE WHEN IIQ_QGTN_CD='3' THEN QQN_RESULT END M3";
		sql += "		, CASE WHEN IIQ_QGTN_CD='4' THEN QQN_RESULT END M4";
		sql += "		, CASE WHEN IIQ_QGTN_CD='5' THEN QQN_RESULT END M5";
		sql += "		, CASE WHEN IIQ_QGTN_CD='6' THEN QQN_RESULT END M6";
		sql += "		, CASE WHEN IIQ_QGTN_CD='7' THEN QQN_RESULT END M7";
		sql += "		, CASE WHEN IIQ_QGTN_CD='8' THEN QQN_RESULT END M8";
		sql += "		, CASE WHEN IIQ_QGTN_CD='9' THEN QQN_RESULT END M9";
		sql += "		, CASE WHEN IIQ_QGTN_CD='10' THEN QQN_RESULT END M10";
		sql += "		, CASE WHEN IIQ_QGTN_CD='11' THEN QQN_RESULT END M11";
		sql += "		, CASE WHEN IIQ_QGTN_CD='12' THEN QQN_RESULT END M12";
		sql += "		, CASE WHEN IIQ_QGTN_CD='13' THEN QQN_RESULT END M13";
		sql += "		, CASE WHEN IIQ_QGTN_CD='14' THEN QQN_RESULT END M14";
		sql += "		, CASE WHEN IIQ_QGTN_CD='15' THEN QQN_RESULT END M15";
		sql += "		, CASE WHEN IIQ_QGTN_CD='16' THEN QQN_RESULT END M16";
		sql += "		, CASE WHEN IIQ_QGTN_CD='17' THEN QQN_RESULT END M17";
		sql += "		, CASE WHEN IIQ_QGTN_CD='18' THEN QQN_RESULT END M18";
		sql += "		, CASE WHEN IIQ_QGTN_CD='19' THEN QQN_RESULT END M19";
		sql += "		, CASE WHEN IIQ_QGTN_CD='20' THEN QQN_RESULT END M20";
		sql += "		, CASE WHEN IIQ_QGTN_CD='21' THEN QQN_RESULT END M21";
		sql += "		, CASE WHEN IIQ_QGTN_CD='22' THEN QQN_RESULT END M22";
		sql += "		, CASE WHEN IIQ_QGTN_CD='23' THEN QQN_RESULT END M23";
		sql += "		, CASE WHEN IIQ_QGTN_CD='983' THEN QQN_RESULT END M983";
		sql += "		, CASE WHEN IIQ_QGTN_CD='25' THEN QQN_RESULT END M25";
		sql += "		, CASE WHEN IIQ_QGTN_CD='26' THEN QQN_RESULT END M26";
		sql += "		, CASE WHEN IIQ_QGTN_CD='27' THEN QQN_RESULT END M27";
		sql += "		, CASE WHEN IIQ_QGTN_CD='28' THEN QQN_RESULT END M28";
		sql += "		, CASE WHEN IIQ_QGTN_CD='976' THEN QQN_RESULT END M976";
		sql += "		, CASE WHEN IIQ_QGTN_CD='977' THEN QQN_RESULT END M977";
		sql += "		, CASE WHEN IIQ_QGTN_CD='978' THEN QQN_RESULT END M978";
		sql += "		, CASE WHEN IIQ_QGTN_CD='979' THEN QQN_RESULT END M979";
		sql += "		, CASE WHEN IIQ_QGTN_CD='981' THEN QQN_RESULT END M981";
		sql += "		, CASE WHEN IIQ_QGTN_CD='982' THEN QQN_RESULT END M982";
		sql += "		, CASE WHEN IIQ_QGTN_CD='980' THEN QQN_RESULT END M980";
		sql += "		, CASE WHEN IIQ_QGTN_CD='873' THEN QQN_RESULT END M873";
		sql += "		, CASE WHEN IIQ_QGTN_CD='865' THEN QQN_RESULT END M865";
		sql += "		, CASE WHEN IIQ_QGTN_CD='867' THEN QQN_RESULT END M867";
		sql += "		, CASE WHEN IIQ_QGTN_CD='868' THEN QQN_RESULT END M868";
		sql += "		, CASE WHEN IIQ_QGTN_CD='869' THEN QQN_RESULT END M869";
		sql += "		, CASE WHEN IIQ_QGTN_CD='870' THEN QQN_RESULT END M870";
		sql += "		, CASE WHEN IIQ_QGTN_CD='871' THEN QQN_RESULT END M871";
		sql += "		, CASE WHEN IIQ_QGTN_CD='874' THEN QQN_RESULT END M874";
		sql += "		, CASE WHEN IIQ_QGTN_CD='872' THEN QQN_RESULT END M872";
		sql += "		, CASE WHEN IIQ_QGTN_CD='875' THEN QQN_RESULT END M875";
		sql += "		, CASE WHEN IIQ_QGTN_CD='876' THEN QQN_RESULT END M876";
		sql += "		, CASE WHEN IIQ_QGTN_CD='877' THEN QQN_RESULT END M877";
		sql += "		, CASE WHEN IIQ_QGTN_CD='878' THEN QQN_RESULT END M878";
		sql += "		, CASE WHEN IIQ_QGTN_CD='879' THEN QQN_RESULT END M879";
		sql += "		, CASE WHEN IIQ_QGTN_CD='880' THEN QQN_RESULT END M880";
		sql += "		, CASE WHEN IIQ_QGTN_CD='881' THEN QQN_RESULT END M881";
		sql += "		, CASE WHEN IIQ_QGTN_CD='882' THEN QQN_RESULT END M882";
		sql += "		, CASE WHEN IIQ_QGTN_CD='883' THEN QQN_RESULT END M883";
		sql += "		, CASE WHEN IIQ_QGTN_CD='884' THEN QQN_RESULT END M884";
		sql += "		, CASE WHEN IIQ_QGTN_CD='885' THEN QQN_RESULT END M885";
		sql += "		, CASE WHEN IIQ_QGTN_CD='887' THEN QQN_RESULT END M887";
		sql += "		, CASE WHEN IIQ_QGTN_CD='888' THEN QQN_RESULT END M888";
		sql += "		, CASE WHEN IIQ_QGTN_CD='889' THEN QQN_RESULT END M889";
		sql += "		, CASE WHEN IIQ_QGTN_CD='890' THEN QQN_RESULT END M890";
		sql += "		, CASE WHEN IIQ_QGTN_CD='891' THEN QQN_RESULT END M891";
		sql += "		, CASE WHEN IIQ_QGTN_CD='892' THEN QQN_RESULT END M892";
		sql += "		, CASE WHEN IIQ_QGTN_CD='893' THEN QQN_RESULT END M893";
		sql += "		, CASE WHEN IIQ_QGTN_CD='894' THEN QQN_RESULT END M894";
		sql += "		, CASE WHEN IIQ_QGTN_CD='895' THEN QQN_RESULT END M895";
		sql += "		, CASE WHEN IIQ_QGTN_CD='896' THEN QQN_RESULT END M896";
		sql += "		, CASE WHEN IIQ_QGTN_CD='897' THEN QQN_RESULT END M897";
		sql += "		, CASE WHEN IIQ_QGTN_CD='898' THEN QQN_RESULT END M898";
		sql += "		, CASE WHEN IIQ_QGTN_CD='899' THEN QQN_RESULT END M899";
		sql += "		, CASE WHEN IIQ_QGTN_CD='900' THEN QQN_RESULT END M900";
		sql += "		, CASE WHEN IIQ_QGTN_CD='902' THEN QQN_RESULT END M902";
		sql += "		, CASE WHEN IIQ_QGTN_CD='901' THEN QQN_RESULT END M901";
		sql += "		, CASE WHEN IIQ_QGTN_CD='903' THEN QQN_RESULT END M903";
		sql += "		, CASE WHEN IIQ_QGTN_CD='904' THEN QQN_RESULT END M904";
		sql += "		, CASE WHEN IIQ_QGTN_CD='905' THEN QQN_RESULT END M905";
		sql += "		, CASE WHEN IIQ_QGTN_CD='906' THEN QQN_RESULT END M906";
		sql += "		, CASE WHEN IIQ_QGTN_CD='908' THEN QQN_RESULT END M908";
		sql += "		, CASE WHEN IIQ_QGTN_CD='909' THEN QQN_RESULT END M909";
		sql += "		, CASE WHEN IIQ_QGTN_CD='910' THEN QQN_RESULT END M910";
		sql += "		, CASE WHEN IIQ_QGTN_CD='911' THEN QQN_RESULT END M911";
		sql += "		, CASE WHEN IIQ_QGTN_CD='912' THEN QQN_RESULT END M912";
		sql += "		, CASE WHEN IIQ_QGTN_CD='914' THEN QQN_RESULT END M914";
		sql += "		, CASE WHEN IIQ_QGTN_CD='915' THEN QQN_RESULT END M915";
		sql += "		, CASE WHEN IIQ_QGTN_CD='916' THEN QQN_RESULT END M916";
		sql += "		, CASE WHEN IIQ_QGTN_CD='918' THEN QQN_RESULT END M918";
		sql += "		, CASE WHEN IIQ_QGTN_CD='919' THEN QQN_RESULT END M919";
		sql += "		, CASE WHEN IIQ_QGTN_CD='920' THEN QQN_RESULT END M920";
		sql += "		, CASE WHEN IIQ_QGTN_CD='43' THEN QQN_RESULT END M43";
		sql += "		, CASE WHEN IIQ_QGTN_CD='921' THEN QQN_RESULT END M921";
		sql += "		, CASE WHEN IIQ_QGTN_CD='44' THEN QQN_RESULT END M44";
		sql += "		, CASE WHEN IIQ_QGTN_CD='45' THEN QQN_RESULT END M45";
		sql += "		, CASE WHEN IIQ_QGTN_CD='46' THEN QQN_RESULT END M46";
		sql += "		, CASE WHEN IIQ_QGTN_CD='47' THEN QQN_RESULT END M47";
		sql += "		, CASE WHEN IIQ_QGTN_CD='48' THEN QQN_RESULT END M48";
		sql += "		, CASE WHEN IIQ_QGTN_CD='49' THEN QQN_RESULT END M49";
		sql += "		, CASE WHEN IIQ_QGTN_CD='53' THEN QQN_RESULT END M53";
		sql += "		, CASE WHEN IIQ_QGTN_CD='54' THEN QQN_RESULT END M54";
		sql += "		, CASE WHEN IIQ_QGTN_CD='922' THEN QQN_RESULT END M922";
		sql += "		, CASE WHEN IIQ_QGTN_CD='923' THEN QQN_RESULT END M923";
		sql += "		, CASE WHEN IIQ_QGTN_CD='924' THEN QQN_RESULT END M924";
		sql += "		, CASE WHEN IIQ_QGTN_CD='925' THEN QQN_RESULT END M925";
		sql += "		, CASE WHEN IIQ_QGTN_CD='927' THEN QQN_RESULT END M927";
		sql += "		, CASE WHEN IIQ_QGTN_CD='926' THEN QQN_RESULT END M926";
		sql += "		, CASE WHEN IIQ_QGTN_CD='928' THEN QQN_RESULT END M928";
		sql += "		, CASE WHEN IIQ_QGTN_CD='929' THEN QQN_RESULT END M929";
		sql += "		, CASE WHEN IIQ_QGTN_CD='930' THEN QQN_RESULT END M930";
		sql += "		, CASE WHEN IIQ_QGTN_CD='429' THEN QQN_RESULT END M429";
		sql += "		, CASE WHEN IIQ_QGTN_CD='430' THEN QQN_RESULT END M430";
		sql += "		, CASE WHEN IIQ_QGTN_CD='431' THEN QQN_RESULT END M431";
		sql += "		, CASE WHEN IIQ_QGTN_CD='432' THEN QQN_RESULT END M432";
		sql += "		, CASE WHEN IIQ_QGTN_CD='433' THEN QQN_RESULT END M433";
		sql += "		, CASE WHEN IIQ_QGTN_CD='434' THEN QQN_RESULT END M434";
		sql += "		, CASE WHEN IIQ_QGTN_CD='435' THEN QQN_RESULT END M435";
		sql += "		, CASE WHEN IIQ_QGTN_CD='436' THEN QQN_RESULT END M436";
		sql += "		, CASE WHEN IIQ_QGTN_CD='437' THEN QQN_RESULT END M437";
		sql += "		, CASE WHEN IIQ_QGTN_CD='438' THEN QQN_RESULT END M438";
		sql += "		, CASE WHEN IIQ_QGTN_CD='439' THEN QQN_RESULT END M439";
		sql += "		, CASE WHEN IIQ_QGTN_CD='440' THEN QQN_RESULT END M440";
		sql += "		, CASE WHEN IIQ_QGTN_CD='441' THEN QQN_RESULT END M441";
		sql += "		, CASE WHEN IIQ_QGTN_CD='442' THEN QQN_RESULT END M442";
		sql += "		, CASE WHEN IIQ_QGTN_CD='443' THEN QQN_RESULT END M443";

		sql += " 		FROM ET_EXAM_ACPT A LEFT OUTER JOIN QT_QUESTION B";
		sql += " 		ON A.EEA_EXAM_DT=B.QQN_EXAM_DT";
		sql += " 		AND A.EEA_EXAM_SQ=B.QQN_EXAM_SQ";

		sql += "		LEFT OUTER JOIN IT_CUSTOMER C";
		sql += " 		ON A.EEA_CUST_NO=C.ICR_CUST_NO";

		sql += "		LEFT OUTER JOIN IT_ITEM_QUESTION D";
		sql += " 		ON B.QQN_QSTN_CD=D.IIQ_QGTN_CD";
		sql += " 		AND IIQ_APLY_DT= GETITEM_QUESTION_APPLYDATE( IIQ_ITEM_CD,EEA_EXAM_DT)";

		sql += "		LEFT OUTER JOIN PT_FIR_PANJUNG E";
		sql += " 		ON A.EEA_EXAM_DT = E.PFP_EXAM_DT";
		sql += " 		AND A.EEA_EXAM_SQ= E.PFP_EXAM_SQ";

		sql += " 		WHERE EEA_EXAM_DT BETWEEN '" + DTEFROMDT + "'";
		sql += " 		AND '" + DTETODT + "'";
		sql += " 		AND IIQ_ITEM_CD IN('M0018','M0019','M0057','M0028')";
		sql += " 		AND EEA_HTSB_CD IN('11001','12003')";

		if (CMBCHUNGYYYY.equals("2020")) {
			sql += " AND (SUBSTR(EEA_HLTH_KD, 19, 1) = '1' OR EEA_MNGT_HTYR = '" + CMBCHUNGYYYY + "') ";
		} else {
			sql += " AND (SUBSTR(EEA_HLTH_KD, 19, 1) = '0' AND EEA_MNGT_HTYR = '" + CMBCHUNGYYYY + "')";
		}

		sql += " 		AND EEA_ORDER_YN <> 'C'";
		sql += " 		AND NVL(EEA_RECE_NO, ' ') <> 'R' ";

		sql += SSQL_ADD3;

		sql += " 	) TTT";
		sql += " 	GROUP BY QQN_EXAM_DT, QQN_EXAM_SQ, ICR_TEL_NO, ICR_MOBL_NO, ICR_EMAI_AR, ICR_RECV_YN";
		sql += " ) CCC";
		sql += " ON AAA.EEA_EXAM_DT = CCC.QQN_EXAM_DT";
		sql += " AND AAA.EEA_EXAM_SQ = CCC.QQN_EXAM_SQ";
		sql += " ORDER BY AAA.EEA_EXAM_DT, AAA.EEA_PSNL_NM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChungVerif2020_uDP_FirstSelect_2020_001 \n";
			G_INFO += "설명 : 일반검진 성적확인 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEFROMDT : " + DTEFROMDT + " \n";
			G_INFO += " DTETODT : " + DTETODT + " \n";
			G_INFO += " CMBCHUNGYYYY : " + CMBCHUNGYYYY + " \n";
			G_INFO += " SSQL_ADD1 : " + SSQL_ADD1 + " \n";
			G_INFO += " SSQL_ADD2 : " + SSQL_ADD2 + " \n";
			G_INFO += " SSQL_ADD3 : " + SSQL_ADD3 + " \n";
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
