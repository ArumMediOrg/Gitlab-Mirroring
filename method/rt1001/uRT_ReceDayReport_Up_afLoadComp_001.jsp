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
		String DP_FROMDT = htMethod.get("DP_FROMDT");
		String DP_TODT = htMethod.get("DP_TODT");

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
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select NM, NM2, sort,
   SUM(cardpr)     cardpr,
   SUM(cashpr)     cashpr,
   SUM(bkbookpr)   bkbookpr,
   SUM(otherpr)    otherpr,
   SUM(micardpr)   micardpr,
   SUM(micashpr)   micashpr,
   SUM(mibkbookpr) mibkbookpr,
   SUM(miotherpr)  miotherpr,
   SUM(secardpr)   secardpr,
   SUM(secashpr)   secashpr,
   SUM(sebkbookpr) sebkbookpr,
   SUM(seotherpr)  seotherpr,
   SUM(recardpr)   recardpr,
   SUM(recashpr)   recashpr,
   SUM(rebkbookpr) rebkbookpr,
   SUM(reotherpr)  reotherpr
from (
    select   '건강검진' NM, :arExamNm1 NM2, 1 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '건강검진' NM, :arExamNm2 NM2, 2 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr frin dual
    union all
    select   '건강검진' NM, :arExamNm3 NM2, 3 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '건강검진' NM, :arExamNm4 NM2, 4 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '건강검진' NM, :arExamNm5 NM2, 5 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '종합검진' NM, :arExamNm6 NM2, 6 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '종합검진' NM, :arExamNm7 NM2, 7 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '종합검진' NM, :arExamNm8 NM2, 8 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '의무검진' NM, :arExamNm9 NM2, 9 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '의무검진' NM, :arExamNm10 NM2, 10 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '의무검진' NM, :arExamNm11 NM2, 11 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '의무검진' NM, :arExamNm12 NM2, 12 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '의무검진' NM, :arExamNm13 NM2, 13 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '의무검진' NM, :arExamNm14 NM2, 14 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '의무검진' NM, :arExamNm15 NM2, 15 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '의무검진' NM, :arExamNm16 NM2, 16 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '특수검진' NM, :arExamNm17 NM2, 17 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '특수검진' NM, :arExamNm18 NM2, 18 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '기타검진' NM, :arExamNm19 NM2, 19 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '기타검진' NM, :arExamNm20 NM2, 20 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select   '기타검진' NM, :arExamNm21 NM2, 21 sort, 0 cardpr ,0 cashpr,0 bkbookpr,0 otherpr,
                      0 micardpr ,0 micashpr,0 mibkbookpr,0 miotherpr,
                      0 secardpr ,0 secashpr,0 sebkbookpr,0 seotherpr,
                      0 recardpr ,0 recashpr,0 rebkbookpr,0 reotherpr from dual
    union all
    select
        case
                 when RRM_EXAM_CD in ('11001','12001','12003') then '건강검진'
                 when RRM_EXAM_CD in ('11002','12002','12004') then '건강검진'
                 when RRM_EXAM_CD in ('13001') then '건강검진'
                 when RRM_EXAM_CD in ('15001') then '건강검진'
                 when RRM_EXAM_CD in ('14001','14002') then '건강검진'
                 when RRM_EXAM_CD in ('21001') then '종합검진'
                 when RRM_EXAM_CD in ('51001') then '종합검진'
                 when RRM_EXAM_CD in ('61001') then '종합검진'
                 when RRM_EXAM_CD in ('32001') then '의무검진'
                 when RRM_EXAM_CD in ('31001') then '의무검진'
                 when RRM_EXAM_CD in ('31006') then '의무검진'
                 when RRM_EXAM_CD in ('91002') then '의무검진'
                 when RRM_EXAM_CD in ('91005') then '의무검진'
                 when RRM_EXAM_CD in ('91003') then '의무검진'
                 when RRM_EXAM_CD in ('91004') then '의무검진'
                 when RRM_EXAM_CD in ('91099' ,'91006','61001','91001','81001') then '의무검진'
                 when RRM_EXAM_CD in ('41001') then '특수검진'
                 when RRM_EXAM_CD in ('42001') then '특수검진'
                 when RRM_EXAM_CD in ('71001') then '기타검진'
                 when RRM_EXAM_CD in ('91007') then '기타검진'
                 else '기타검진'
              end  NM,
        case
                 when RRM_EXAM_CD in ('11001','12001','12003') then :arExamNm1
                 when RRM_EXAM_CD in ('11002','12002','12004') then :arExamNm2
                 when RRM_EXAM_CD in ('13001') then :arExamNm3
                 when RRM_EXAM_CD in ('15001') then :arExamNm4
                 when RRM_EXAM_CD in ('14001','14002') then :arExamNm5
                 when RRM_EXAM_CD in ('21001') then :arExamNm6
                 when RRM_EXAM_CD in ('51001') then :arExamNm7
                 when RRM_EXAM_CD in ('61001') then :arExamNm8
                 when RRM_EXAM_CD in ('32001') then :arExamNm9
                 when RRM_EXAM_CD in ('31001') then :arExamNm10
                 when RRM_EXAM_CD in ('31006') then :arExamNm11
                 when RRM_EXAM_CD in ('91002') then :arExamNm12
                 when RRM_EXAM_CD in ('91005') then :arExamNm13
                 when RRM_EXAM_CD in ('91003') then :arExamNm14
                 when RRM_EXAM_CD in ('91004') then :arExamNm15
                 when RRM_EXAM_CD in ('91099' ,'91006','61001','91001','81001') then :arExamNm16
                 when RRM_EXAM_CD in ('41001') then :arExamNm17
                 when RRM_EXAM_CD in ('42001') then :arExamNm18
                 when RRM_EXAM_CD in ('71001') then :arExamNm19
                 when RRM_EXAM_CD in ('91007') then :arExamNm20
                 else :arExamNm21
              end  NM2,
        case
                 when RRM_EXAM_CD in ('11001','12001','12003') then 1
                 when RRM_EXAM_CD in ('11002','12002','12004') then 2
                 when RRM_EXAM_CD in ('13001') then 3
                 when RRM_EXAM_CD in ('15001') then 4
                 when RRM_EXAM_CD in ('14001','14002') then 5
                 when RRM_EXAM_CD in ('21001') then 6
                 when RRM_EXAM_CD in ('51001') then 7
                 when RRM_EXAM_CD in ('61001') then 8
                 when RRM_EXAM_CD in ('32001') then 9
                 when RRM_EXAM_CD in ('31001') then 10
                 when RRM_EXAM_CD in ('31006') then 11
                 when RRM_EXAM_CD in ('91002') then 12
                 when RRM_EXAM_CD in ('91005') then 13
                 when RRM_EXAM_CD in ('91003') then 14
                 when RRM_EXAM_CD in ('91004') then 15
                 when RRM_EXAM_CD in ('91099' ,'91006','61001','91001','81001') then 16
                 when RRM_EXAM_CD in ('41001') then 17
                 when RRM_EXAM_CD in ('42001') then 18
                 when RRM_EXAM_CD in ('71001') then 19
                 when RRM_EXAM_CD in ('91007') then 20
                 else 21
              end  sort,
        case when RRM_PAY_KD='01' AND RRM_OCCU_KD='20' then sum(RRM_RECE_PR - RRM_RESEREPL_PR) end cardpr,
        case when RRM_PAY_KD IN ('02','03') AND RRM_OCCU_KD='20' then sum(RRM_RECE_PR - RRM_RESEREPL_PR) end cashpr,
        case when RRM_PAY_KD='04' AND RRM_OCCU_KD='20' then sum(RRM_RECE_PR - RRM_RESEREPL_PR) end bkbookpr,
        case when RRM_PAY_KD NOT IN ('01','02','03','04') AND RRM_OCCU_KD='20' then sum(RRM_RECE_PR - RRM_RESEREPL_PR) end otherpr,
        case when RRM_PAY_KD='01' AND RRM_OCCU_KD IN('31','32','40','51','52','60')     then sum(RRM_RECE_PR - RRM_RESEREPL_PR) end micardpr,
        case when RRM_PAY_KD IN ('02','03') AND RRM_OCCU_KD IN('31','32','40','51','52','60')  then sum(RRM_RECE_PR - RRM_RESEREPL_PR) end micashpr,
        case when RRM_PAY_KD='04' AND RRM_OCCU_KD IN('31','32','40','51','52','60')  then sum(RRM_RECE_PR - RRM_RESEREPL_PR) end mibkbookpr,
        case when RRM_PAY_KD NOT IN ('01','02','03','04') AND RRM_OCCU_KD IN('31','32','40','51','52','60')  then sum(RRM_RECE_PR - RRM_RESEREPL_PR) end miother,
        case when RRM_PAY_KD='01' AND RRM_OCCU_KD IN('10')  then sum(RRM_RESER_PR) end secardpr,
        case when RRM_PAY_KD IN ('02','03') AND RRM_OCCU_KD IN('10')  then sum(RRM_RESER_PR) end secashpr,
        case when RRM_PAY_KD='04' AND RRM_OCCU_KD IN('10')  then sum(RRM_RESER_PR) end sebkbookpr,
        case when RRM_PAY_KD NOT IN ('01','02','03','04')AND RRM_OCCU_KD IN('10')  then sum(RRM_RESER_PR) end seotherpr,
        case when RRM_PAY_KD='01'  then sum(RRM_RETURN_PR) end recardpr,
        case when RRM_PAY_KD IN ('02','03')  then sum(RRM_RETURN_PR) end recashpr,
        case when RRM_PAY_KD='04'  then sum(RRM_RETURN_PR) end rebkbookpr,
        case when RRM_PAY_KD NOT IN ('01','02','03','04') then sum(RRM_RETURN_PR) end reotherpr
    from RT_RECE_MEDICHK
    where RRM_RECE_DT>=:dp_fromdt and RRM_RECE_DT<= :dp_todt
     group by RRM_EXAM_CD, RRM_PAY_KD,RRM_OCCU_KD
 ) a group by NM, NM2, sort order by sort

		*/

		sql = " SELECT NM, NM2, SORT, SUM(CARDPR) CARDPR, SUM(CASHPR) CASHPR, SUM(BKBOOKPR) BKBOOKPR, SUM(OTHERPR) OTHERPR, SUM(MICARDPR) MICARDPR, SUM(MICASHPR) MICASHPR, SUM(MIBKBOOKPR) MIBKBOOKPR, SUM(MIOTHERPR) MIOTHERPR, SUM(SECARDPR) SECARDPR, SUM(SECASHPR) SECASHPR, SUM(SEBKBOOKPR) SEBKBOOKPR, SUM(SEOTHERPR) SEOTHERPR, SUM(RECARDPR) RECARDPR, SUM(RECASHPR) RECASHPR, SUM(REBKBOOKPR) REBKBOOKPR, SUM(REOTHERPR) REOTHERPR";
		sql += " FROM ( SELECT '건강검진' NM, '" + AREXAMNM1 + "' NM2, 1 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '건강검진' NM, '" + AREXAMNM2 + "' NM2, 2 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '건강검진' NM, '" + AREXAMNM3 + "' NM2, 3 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '건강검진' NM, '" + AREXAMNM4 + "' NM2, 4 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '건강검진' NM, '" + AREXAMNM5 + "' NM2, 5 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '종합검진' NM, '" + AREXAMNM6 + "' NM2, 6 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '종합검진' NM, '" + AREXAMNM7 + "' NM2, 7 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '종합검진' NM, '" + AREXAMNM8 + "' NM2, 8 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '의무검진' NM, '" + AREXAMNM9 + "' NM2, 9 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '의무검진' NM, '" + AREXAMNM10 + "' NM2, 10 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '의무검진' NM, '" + AREXAMNM11 + "' NM2, 11 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '의무검진' NM, '" + AREXAMNM12 + "' NM2, 12 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '의무검진' NM, '" + AREXAMNM13 + "' NM2, 13 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '의무검진' NM, '" + AREXAMNM14 + "' NM2, 14 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '의무검진' NM, '" + AREXAMNM15 + "' NM2, 15 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '의무검진' NM, '" + AREXAMNM16 + "' NM2, 16 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '특수검진' NM, '" + AREXAMNM17 + "' NM2, 17 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '특수검진' NM, '" + AREXAMNM18 + "' NM2, 18 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '기타검진' NM, '" + AREXAMNM19 + "' NM2, 19 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '기타검진' NM, '" + AREXAMNM20 + "' NM2, 20 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT '기타검진' NM, '" + AREXAMNM21 + "' NM2, 21 SORT, 0 CARDPR ,0 CASHPR,0 BKBOOKPR,0 OTHERPR, 0 MICARDPR ,0 MICASHPR,0 MIBKBOOKPR,0 MIOTHERPR, 0 SECARDPR ,0 SECASHPR,0 SEBKBOOKPR,0 SEOTHERPR, 0 RECARDPR ,0 RECASHPR,0 REBKBOOKPR,0 REOTHERPR";
		sql += " FROM DUAL";
		sql += " UNION";
		sql += " ALL SELECT CASE WHEN RRM_EXAM_CD IN ('11001','12001','12003') THEN '건강검진' WHEN RRM_EXAM_CD IN ('11002','12002','12004') THEN '건강검진' WHEN RRM_EXAM_CD IN ('13001') THEN '건강검진' WHEN RRM_EXAM_CD IN ('15001') THEN '건강검진' WHEN RRM_EXAM_CD IN ('14001','14002') THEN '건강검진' WHEN RRM_EXAM_CD IN ('21001') THEN '종합검진' WHEN RRM_EXAM_CD IN ('51001') THEN '종합검진' WHEN RRM_EXAM_CD IN ('61001') THEN '종합검진' WHEN RRM_EXAM_CD IN ('32001') THEN '의무검진' WHEN RRM_EXAM_CD IN ('31001') THEN '의무검진' WHEN RRM_EXAM_CD IN ('31006') THEN '의무검진' WHEN RRM_EXAM_CD IN ('91002') THEN '의무검진' WHEN RRM_EXAM_CD IN ('91005') THEN '의무검진' WHEN RRM_EXAM_CD IN ('91003') THEN '의무검진' WHEN RRM_EXAM_CD IN ('91004') THEN '의무검진' WHEN RRM_EXAM_CD IN ('91099' ,'91006','61001','91001','81001') THEN '의무검진' WHEN RRM_EXAM_CD IN ('41001') THEN '특수검진' WHEN RRM_EXAM_CD IN ('42001') THEN '특수검진' WHEN RRM_EXAM_CD IN ('71001') THEN '기타검진' WHEN RRM_EXAM_CD IN ('91007') THEN '기타검진' ELSE '기타검진' END NM, CASE WHEN RRM_EXAM_CD IN ('11001','12001','12003') THEN '" + AREXAMNM1 + "' WHEN RRM_EXAM_CD IN ('11002','12002','12004') THEN '" + AREXAMNM2 + "' WHEN RRM_EXAM_CD IN ('13001') THEN '" + AREXAMNM3 + "' WHEN RRM_EXAM_CD IN ('15001') THEN '" + AREXAMNM4 + "' WHEN RRM_EXAM_CD IN ('14001','14002') THEN '" + AREXAMNM5 + "' WHEN RRM_EXAM_CD IN ('21001') THEN '" + AREXAMNM6 + "' WHEN RRM_EXAM_CD IN ('51001') THEN '" + AREXAMNM7 + "' WHEN RRM_EXAM_CD IN ('61001') THEN '" + AREXAMNM8 + "' WHEN RRM_EXAM_CD IN ('32001') THEN '" + AREXAMNM9 + "' WHEN RRM_EXAM_CD IN ('31001') THEN '" + AREXAMNM10 + "' WHEN RRM_EXAM_CD IN ('31006') THEN '" + AREXAMNM11 + "' WHEN RRM_EXAM_CD IN ('91002') THEN '" + AREXAMNM12 + "' WHEN RRM_EXAM_CD IN ('91005') THEN '" + AREXAMNM13 + "' WHEN RRM_EXAM_CD IN ('91003') THEN '" + AREXAMNM14 + "' WHEN RRM_EXAM_CD IN ('91004') THEN '" + AREXAMNM15 + "' WHEN RRM_EXAM_CD IN ('91099' ,'91006','61001','91001','81001') THEN '" + AREXAMNM16 + "' WHEN RRM_EXAM_CD IN ('41001') THEN '" + AREXAMNM17 + "' WHEN RRM_EXAM_CD IN ('42001') THEN '" + AREXAMNM18 + "' WHEN RRM_EXAM_CD IN ('71001') THEN '" + AREXAMNM19 + "' WHEN RRM_EXAM_CD IN ('91007') THEN '" + AREXAMNM20 + "' ELSE '" + AREXAMNM21 + "' END NM2, CASE WHEN RRM_EXAM_CD IN ('11001','12001','12003') THEN 1 WHEN RRM_EXAM_CD IN ('11002','12002','12004') THEN 2 WHEN RRM_EXAM_CD IN ('13001') THEN 3 WHEN RRM_EXAM_CD IN ('15001') THEN 4 WHEN RRM_EXAM_CD IN ('14001','14002') THEN 5 WHEN RRM_EXAM_CD IN ('21001') THEN 6 WHEN RRM_EXAM_CD IN ('51001') THEN 7 WHEN RRM_EXAM_CD IN ('61001') THEN 8 WHEN RRM_EXAM_CD IN ('32001') THEN 9 WHEN RRM_EXAM_CD IN ('31001') THEN 10 WHEN RRM_EXAM_CD IN ('31006') THEN 11 WHEN RRM_EXAM_CD IN ('91002') THEN 12 WHEN RRM_EXAM_CD IN ('91005') THEN 13 WHEN RRM_EXAM_CD IN ('91003') THEN 14 WHEN RRM_EXAM_CD IN ('91004') THEN 15 WHEN RRM_EXAM_CD IN ('91099' ,'91006','61001','91001','81001') THEN 16 WHEN RRM_EXAM_CD IN ('41001') THEN 17 WHEN RRM_EXAM_CD IN ('42001') THEN 18 WHEN RRM_EXAM_CD IN ('71001') THEN 19 WHEN RRM_EXAM_CD IN ('91007') THEN 20 ELSE 21 END SORT, CASE WHEN RRM_PAY_KD='01'";
		sql += " AND RRM_OCCU_KD='20' THEN SUM(RRM_RECE_PR - RRM_RESEREPL_PR) END CARDPR, CASE WHEN RRM_PAY_KD IN ('02','03')";
		sql += " AND RRM_OCCU_KD='20' THEN SUM(RRM_RECE_PR - RRM_RESEREPL_PR) END CASHPR, CASE WHEN RRM_PAY_KD='04'";
		sql += " AND RRM_OCCU_KD='20' THEN SUM(RRM_RECE_PR - RRM_RESEREPL_PR) END BKBOOKPR, CASE WHEN RRM_PAY_KD NOT IN ('01','02','03','04')";
		sql += " AND RRM_OCCU_KD='20' THEN SUM(RRM_RECE_PR - RRM_RESEREPL_PR) END OTHERPR, CASE WHEN RRM_PAY_KD='01'";
		sql += " AND RRM_OCCU_KD IN('31','32','40','51','52','60') THEN SUM(RRM_RECE_PR - RRM_RESEREPL_PR) END MICARDPR, CASE WHEN RRM_PAY_KD IN ('02','03')";
		sql += " AND RRM_OCCU_KD IN('31','32','40','51','52','60') THEN SUM(RRM_RECE_PR - RRM_RESEREPL_PR) END MICASHPR, CASE WHEN RRM_PAY_KD='04'";
		sql += " AND RRM_OCCU_KD IN('31','32','40','51','52','60') THEN SUM(RRM_RECE_PR - RRM_RESEREPL_PR) END MIBKBOOKPR, CASE WHEN RRM_PAY_KD NOT IN ('01','02','03','04')";
		sql += " AND RRM_OCCU_KD IN('31','32','40','51','52','60') THEN SUM(RRM_RECE_PR - RRM_RESEREPL_PR) END MIOTHER, CASE WHEN RRM_PAY_KD='01'";
		sql += " AND RRM_OCCU_KD IN('10') THEN SUM(RRM_RESER_PR) END SECARDPR, CASE WHEN RRM_PAY_KD IN ('02','03')";
		sql += " AND RRM_OCCU_KD IN('10') THEN SUM(RRM_RESER_PR) END SECASHPR, CASE WHEN RRM_PAY_KD='04'";
		sql += " AND RRM_OCCU_KD IN('10') THEN SUM(RRM_RESER_PR) END SEBKBOOKPR, CASE WHEN RRM_PAY_KD NOT IN ('01','02','03','04')";
		sql += " AND RRM_OCCU_KD IN('10') THEN SUM(RRM_RESER_PR) END SEOTHERPR, CASE WHEN RRM_PAY_KD='01' THEN SUM(RRM_RETURN_PR) END RECARDPR, CASE WHEN RRM_PAY_KD IN ('02','03') THEN SUM(RRM_RETURN_PR) END RECASHPR, CASE WHEN RRM_PAY_KD='04' THEN SUM(RRM_RETURN_PR) END REBKBOOKPR, CASE WHEN RRM_PAY_KD NOT IN ('01','02','03','04') THEN SUM(RRM_RETURN_PR) END REOTHERPR";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_DT>='" + DP_FROMDT + "'";
		sql += " AND RRM_RECE_DT<= '" + DP_TODT + "'";
		sql += " GROUP BY RRM_EXAM_CD, RRM_PAY_KD,RRM_OCCU_KD ) A";
		sql += " GROUP BY NM, NM2, SORT";
		sql += " ORDER BY SORT";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_ReceDayReport_Up_afLoadComp_001 \n";
			G_INFO += "설명 : 검진별 금액정보 로딩 \n";
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
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
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
		<s:AttributeType name='NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='NM2' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SORT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CARDPR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CASHPR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BKBOOKPR' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='OTHERPR' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='MICARDPR' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='MICASHPR' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='MIBKBOOKPR' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='MIOTHERPR' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SECARDPR' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SECASHPR' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SEBKBOOKPR' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SEOTHERPR' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RECARDPR' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RECASHPR' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='REBKBOOKPR' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='REOTHERPR' rs:number='19' rs:nullable='true'>
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

			String NM_T = cRsList.getString("NM");
			String NM2_T = cRsList.getString("NM2");
			String SORT_T = cRsList.getString("SORT");
			String CARDPR_T = cRsList.getString("CARDPR");
			String CASHPR_T = cRsList.getString("CASHPR");
			String BKBOOKPR_T = cRsList.getString("BKBOOKPR");
			String OTHERPR_T = cRsList.getString("OTHERPR");
			String MICARDPR_T = cRsList.getString("MICARDPR");
			String MICASHPR_T = cRsList.getString("MICASHPR");
			String MIBKBOOKPR_T = cRsList.getString("MIBKBOOKPR");
			String MIOTHERPR_T = cRsList.getString("MIOTHERPR");
			String SECARDPR_T = cRsList.getString("SECARDPR");
			String SECASHPR_T = cRsList.getString("SECASHPR");
			String SEBKBOOKPR_T = cRsList.getString("SEBKBOOKPR");
			String SEOTHERPR_T = cRsList.getString("SEOTHERPR");
			String RECARDPR_T = cRsList.getString("RECARDPR");
			String RECASHPR_T = cRsList.getString("RECASHPR");
			String REBKBOOKPR_T = cRsList.getString("REBKBOOKPR");
			String REOTHERPR_T = cRsList.getString("REOTHERPR");
%>
			<z:row
<%
			if(! NM_T.equals("")) {
%>
		 		NM='<%= NM_T%>'
<%
			}

			if(! NM2_T.equals("")) {
%>
		 		NM2='<%= NM2_T%>'
<%
			}

			if(! SORT_T.equals("")) {
%>
		 		SORT='<%= SORT_T%>'
<%
			}

			if(! CARDPR_T.equals("")) {
%>
		 		CARDPR='<%= CARDPR_T%>'
<%
			}

			if(! CASHPR_T.equals("")) {
%>
		 		CASHPR='<%= CASHPR_T%>'
<%
			}

			if(! BKBOOKPR_T.equals("")) {
%>
		 		BKBOOKPR='<%= BKBOOKPR_T%>'
<%
			}

			if(! OTHERPR_T.equals("")) {
%>
		 		OTHERPR='<%= OTHERPR_T%>'
<%
			}

			if(! MICARDPR_T.equals("")) {
%>
		 		MICARDPR='<%= MICARDPR_T%>'
<%
			}

			if(! MICASHPR_T.equals("")) {
%>
		 		MICASHPR='<%= MICASHPR_T%>'
<%
			}

			if(! MIBKBOOKPR_T.equals("")) {
%>
		 		MIBKBOOKPR='<%= MIBKBOOKPR_T%>'
<%
			}

			if(! MIOTHERPR_T.equals("")) {
%>
		 		MIOTHERPR='<%= MIOTHERPR_T%>'
<%
			}

			if(! SECARDPR_T.equals("")) {
%>
		 		SECARDPR='<%= SECARDPR_T%>'
<%
			}

			if(! SECASHPR_T.equals("")) {
%>
		 		SECASHPR='<%= SECASHPR_T%>'
<%
			}

			if(! SEBKBOOKPR_T.equals("")) {
%>
		 		SEBKBOOKPR='<%= SEBKBOOKPR_T%>'
<%
			}

			if(! SEOTHERPR_T.equals("")) {
%>
		 		SEOTHERPR='<%= SEOTHERPR_T%>'
<%
			}

			if(! RECARDPR_T.equals("")) {
%>
		 		RECARDPR='<%= RECARDPR_T%>'
<%
			}

			if(! RECASHPR_T.equals("")) {
%>
		 		RECASHPR='<%= RECASHPR_T%>'
<%
			}

			if(! REBKBOOKPR_T.equals("")) {
%>
		 		REBKBOOKPR='<%= REBKBOOKPR_T%>'
<%
			}

			if(! REOTHERPR_T.equals("")) {
%>
		 		REOTHERPR='<%= REOTHERPR_T%>'
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
