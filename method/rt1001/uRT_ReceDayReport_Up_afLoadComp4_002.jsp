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

		//
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select aa.CCN_SMALL, aa.CCN_VALUE, aa.CCN_FULL_NM, aa.CCN_REL, nvl(bb.PR,0) PR , aa.CCN_RMK
      ,case when aa.CCN_SMALL in ('202','402') and PR > 0
            then (select CCN_VALUE from CT_COMMON where ccn_large = '9902' and CCN_SMALL = '01') else '' end BANK_CD
      ,case when aa.CCN_SMALL in ('202','402') and PR > 0
            then (select CCN_FULL_NM from CT_COMMON where ccn_large = '9902' and CCN_SMALL = '01') else '' end BANK_NM
      ,case when aa.CCN_SMALL in ('202','402') and PR > 0
            then (select  CCN_RMK  from CT_COMMON where ccn_large = '9902' and CCN_SMALL = '01') else '' end ACCO_NO
      , MNG_DT, MNG_CD, MNG_NM
From
  (select CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK from CT_COMMON
          where CCN_LARGE = '9901' and CCN_LEVEL = '5') aa ,
  (select CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK,
       case CCN_SMALL when '101' then sum(EEA_EXAM_PR)
                      when '102' then sum(EEA_COMPR_PR)
                      when '103' then sum(EEA_PSNLR_PR)
                      when '104' then sum(EMPL_DISC_PR) * -1
                      when '105' then sum(JONG_DISC_PR) * -1
                      when '106' then sum(EEA_DISC_PR)  * -1
                      when '107' then sum(EEA_DISC_CPR) * -1
       end PR, '' MNG_DT, '' MNG_CD, '' MNG_NM
  from
    (select (EEA_COMPR_PR + EEA_PSNLR_PR) EEA_EXAM_PR,  EEA_COMPR_PR, EEA_PSNLR_PR,
            case substr(EEA_DISC_RC,1,1) when '0' then nvl(EEA_DISC_PR,0) + nvl(EEA_DISC_CPR,0) else 0 end EMPL_DISC_PR,
            case substr(EEA_DISC_RC,1,1) when '0' then 0 else nvl(EEA_DISC_PR,0) + nvl(EEA_DISC_CPR,0) end JONG_DISC_PR,
            nvl(EEA_DISC_PR,0) EEA_DISC_PR,   nvl(EEA_DISC_CPR,0) EEA_DISC_CPR
    from ET_EXAM_ACPT
    where  eea_exam_dt between :dp_fromdt and  :dp_todt
         and EEA_ORDER_YN <> 'C'
    ) a, (select CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK from CT_COMMON
          where CCN_LARGE = '9901' and substr(CCN_SMALL,1,1) in ('1') and CCN_LEVEL = '5') b
  group by CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK
  union all
  select CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK,
         case CCN_SMALL when '201' then sum(RRM_CASH_PR)
                        when '202' then sum(RRM_BANK_PR)
                        when '203' then sum(RRM_CARD_PR)
                        when '204' then sum(RRM_COMP_PR - RRM_COMP_RPR)
                        when '205' then sum(RRM_PSNL_PR - RRM_PSNL_RPR)
                        when '301' then sum(RRM_TICKET_PR) * -1
                        when '302' then sum(RRM_TICKET_PR) * -1
                        when '501' then sum(RRM_RESEREPL_PR)
                        when '502' then sum(RRM_RESEREPL_PR)
         end PR, '' MNG_DT, '' MNG_CD, '' MNG_NM
  from
    (select
       case  when RRM_PAY_KD in ('02' , '03') then (RRM_RECE_PR - nvl(RRM_RESEREPL_PR,0) - nvl(RRM_RETURN_PR,0)) else 0 end  rrm_cash_pr, --현금(현금,현금영수증)
       case  when RRM_PAY_KD in ('04') then (RRM_RECE_PR - nvl(RRM_RESEREPL_PR,0) - nvl(RRM_RETURN_PR,0)) else 0 end  rrm_bank_pr,   --통장입금
       case  when RRM_PAY_KD in ('01') then (RRM_RECE_PR - nvl(RRM_RESEREPL_PR,0) - nvl(RRM_RETURN_PR,0)) else 0 end  rrm_card_pr,   --카드
       case  when RRM_OCCU_KD in ('31','32') then (RRM_RECE_PR   - nvl(RRM_RESEREPL_PR,0)) else 0 end  rrm_comp_pr,   --기관
       case  when RRM_OCCU_KD in ('20') then (RRM_RECE_PR   - nvl(RRM_RESEREPL_PR,0)) else 0 end  rrm_psnl_pr,   --개인
       case  when RRM_OCCU_KD in ('70','71','72') then
             case when substr(RRM_RECE_NO,9,1) = '3' then
                  case when RRM_PAY_KD in ('01','02','03','04') then nvl(RRM_RETURN_PR,0) else 0 end
              else 0 end
       else 0 end rrm_comp_rpr,   --기관
       case  when RRM_OCCU_KD in ('70','71','72') then
             case when substr(RRM_RECE_NO,9,1) in ('1','2') then
                  case when RRM_PAY_KD in ('01','02','03','04') then nvl(RRM_RETURN_PR,0) else 0 end
              else 0 end
       else 0 end rrm_psnl_rpr,   --개인
       case  when RRM_PAY_KD in ('05') then (RRM_RECE_PR - nvl(RRM_RETURN_PR,0)) else 0 end  rrm_ticket_pr,      --검진권쿠폰(차변)
       nvl(RRM_RESEREPL_PR,0) RRM_RESEREPL_PR         --예약대체금사용
     from RT_RECE_MEDICHK
     where RRM_RECE_DT between :dp_fromdt and  :dp_todt
         and RRM_OCCU_KD in ('20','31','32','70','71','72')         --73 : 예약금 환불 제외
    ) a, (select CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK from CT_COMMON
          where CCN_LARGE = '9901' and substr(CCN_SMALL,1,1) in ('2','3','5') and CCN_LEVEL = '5') b
  group by CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK
  union all
  select CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK,
         case CCN_SMALL when '401' then sum(SE_CASH_PR)
                        when '402' then sum(SE_BANK_PR)
                        when '403' then sum(SE_CARD_PR)
                        when '404' then sum(SE_PR)
         end PR , '' MNG_DT, '' MNG_CD, '' MNG_NM
  from
    (select
       case  when RRM_PAY_KD in ('02' , '03') then (nvl(RRM_RESER_PR,0) - nvl(RRM_RETURN_PR,0)) else 0 end  se_cash_pr,    --현금(현금,현금영수증)  선납
       case  when RRM_PAY_KD in ('04') then (nvl(RRM_RESER_PR,0) - nvl(RRM_RETURN_PR,0)) else 0 end  se_bank_pr,   --통장입금 선납
       case  when RRM_PAY_KD in ('01') then (nvl(RRM_RESER_PR,0) - nvl(RRM_RETURN_PR,0)) else 0 end  se_card_pr,   --카드 선납
       case  when RRM_PAY_KD in ('01','02','03','04') then nvl(RRM_RESER_PR,0) - nvl(RRM_RETURN_PR,0) else 0 end  se_pr   --선수금(예금대체금) 선납
     from RT_RECE_MEDICHK
     where RRM_RECE_DT between :dp_fromdt and  :dp_todt
      and RRM_OCCU_KD in ('10','73')         --10,73 : 예약금,예약금 환불 제외, 쿠폰선수금은 없다고 봄
    ) a, (select CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK from CT_COMMON
          where CCN_LARGE = '9901' and substr(CCN_SMALL,1,1) in ('4') and CCN_LEVEL = '5') b
  group by CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK
  union all                      --카트납부 통계
  select b.CCN_SMALL, b.CCN_VALUE, b.CCN_FULL_NM, b.CCN_REL, b.CCN_RMK, sum(nvl(RCR_RECE_PR,0)) PR,  MNG_DT, MNG_CD, MNG_NM
  from
    (select '601' CCN_REL, '' MNG_DT, '' MNG_CD, '' MNG_NM, sum(case when trim(RCR_TRACE_CD) = '신용취소' then to_number(RCR_RECE_PR) * -1 else to_number(RCR_RECE_PR) end) RCR_RECE_PR
     from RT_CARD_RECE
     where trim(RCR_TRACE_CD) in ('신용승인','신용취소') and To_Char(RCR_INPUT_DTT,'YYYY-MM-DD') between :dp_fromdt and  :dp_todt
     union all
     select s2.CCN_REL, replace(:dp_todt,'-','') MNG_DT,  s2.CCN_VALUE MNG_CD, MAX(s2.CCN_FULL_NM) MNG_NM, SUM(s1.RCR_RECE_PR) RCR_RECE_PR from
      (select RCR_PURCH_CD, case when trim(RCR_TRACE_CD) = '신용취소' then to_number(RCR_RECE_PR) * -1 else to_number(RCR_RECE_PR) end RCR_RECE_PR
       from RT_CARD_RECE
       where trim(RCR_TRACE_CD) in ('신용승인','신용취소') and To_Char(RCR_INPUT_DTT,'YYYY-MM-DD') between :dp_fromdt and  :dp_todt) s1,
      (select CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK from CT_COMMON where CCN_LARGE = '0923' and CCN_LEVEL = '5') s2
      where
        s1.RCR_PURCH_CD(+) = s2.CCN_SMALL
        group by s2.CCN_REL, s2.CCN_VALUE) a,
  (select CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK from CT_COMMON
          where CCN_LARGE = '9901' and substr(CCN_SMALL,1,1) in (6) and CCN_LEVEL = '5') b
 where
   a.CCN_REL(+) = b.CCN_SMALL
   group by b.CCN_SMALL, b.CCN_VALUE, b.CCN_FULL_NM, b.CCN_REL, b.CCN_RMK,  MNG_DT, MNG_CD, MNG_NM
  order by CCN_SMALL) bb
where aa.CCN_SMALL = bb.CCN_SMALL(+)
order by aa.CCN_SMALL
		*/

		sql = " SELECT AA.CCN_SMALL, AA.CCN_VALUE, AA.CCN_FULL_NM, AA.CCN_REL, NVL(BB.PR,0) PR , AA.CCN_RMK ,CASE WHEN AA.CCN_SMALL IN ('202','402')";
		sql += " AND PR > 0 THEN (SELECT CCN_VALUE";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '9902'";
		sql += " AND CCN_SMALL = '01') ELSE '' END BANK_CD ,CASE WHEN AA.CCN_SMALL IN ('202','402')";
		sql += " AND PR > 0 THEN (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '9902'";
		sql += " AND CCN_SMALL = '01') ELSE '' END BANK_NM ,CASE WHEN AA.CCN_SMALL IN ('202','402')";
		sql += " AND PR > 0 THEN (SELECT CCN_RMK";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '9902'";
		sql += " AND CCN_SMALL = '01') ELSE '' END ACCO_NO , MNG_DT, MNG_CD, MNG_NM";
		sql += " FROM (SELECT CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '9901'";
		sql += " AND CCN_LEVEL = '5') AA , (SELECT CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK, CASE CCN_SMALL WHEN '101' THEN SUM(EEA_EXAM_PR) WHEN '102' THEN SUM(EEA_COMPR_PR) WHEN '103' THEN SUM(EEA_PSNLR_PR) WHEN '104' THEN SUM(EMPL_DISC_PR) * -1 WHEN '105' THEN SUM(JONG_DISC_PR) * -1 WHEN '106' THEN SUM(EEA_DISC_PR) * -1 WHEN '107' THEN SUM(EEA_DISC_CPR) * -1 END PR, '' MNG_DT, '' MNG_CD, '' MNG_NM";
		sql += " FROM (SELECT (EEA_COMPR_PR + EEA_PSNLR_PR) EEA_EXAM_PR, EEA_COMPR_PR, EEA_PSNLR_PR, CASE SUBSTR(EEA_DISC_RC,1,1) WHEN '0' THEN NVL(EEA_DISC_PR,0) + NVL(EEA_DISC_CPR,0) ELSE 0 END EMPL_DISC_PR, CASE SUBSTR(EEA_DISC_RC,1,1) WHEN '0' THEN 0 ELSE NVL(EEA_DISC_PR,0) + NVL(EEA_DISC_CPR,0) END JONG_DISC_PR, NVL(EEA_DISC_PR,0) EEA_DISC_PR, NVL(EEA_DISC_CPR,0) EEA_DISC_CPR";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + DP_FROMDT + "'";
		sql += " AND '" + DP_TODT + "'";
		sql += " AND EEA_ORDER_YN <> 'C' ) A, (SELECT CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '9901'";
		sql += " AND SUBSTR(CCN_SMALL,1,1) IN ('1')";
		sql += " AND CCN_LEVEL = '5') B";
		sql += " GROUP BY CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK";
		sql += " UNION";
		sql += " ALL SELECT CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK, CASE CCN_SMALL WHEN '201' THEN SUM(RRM_CASH_PR) WHEN '202' THEN SUM(RRM_BANK_PR) WHEN '203' THEN SUM(RRM_CARD_PR) WHEN '204' THEN SUM(RRM_COMP_PR - RRM_COMP_RPR) WHEN '205' THEN SUM(RRM_PSNL_PR - RRM_PSNL_RPR) WHEN '301' THEN SUM(RRM_TICKET_PR) * -1 WHEN '302' THEN SUM(RRM_TICKET_PR) * -1 WHEN '501' THEN SUM(RRM_RESEREPL_PR) WHEN '502' THEN SUM(RRM_RESEREPL_PR) END PR, '' MNG_DT, '' MNG_CD, '' MNG_NM";
		sql += " FROM (SELECT CASE WHEN RRM_PAY_KD IN ('02' , '03') THEN (RRM_RECE_PR - NVL(RRM_RESEREPL_PR,0) - NVL(RRM_RETURN_PR,0)) ELSE 0 END RRM_CASH_PR, CASE WHEN RRM_PAY_KD IN ('04') THEN (RRM_RECE_PR - NVL(RRM_RESEREPL_PR,0) - NVL(RRM_RETURN_PR,0)) ELSE 0 END RRM_BANK_PR, CASE WHEN RRM_PAY_KD IN ('01') THEN (RRM_RECE_PR - NVL(RRM_RESEREPL_PR,0) - NVL(RRM_RETURN_PR,0)) ELSE 0 END RRM_CARD_PR, CASE WHEN RRM_OCCU_KD IN ('31','32') THEN (RRM_RECE_PR - NVL(RRM_RESEREPL_PR,0)) ELSE 0 END RRM_COMP_PR, CASE WHEN RRM_OCCU_KD IN ('20') THEN (RRM_RECE_PR - NVL(RRM_RESEREPL_PR,0)) ELSE 0 END RRM_PSNL_PR, CASE WHEN RRM_OCCU_KD IN ('70','71','72') THEN CASE WHEN SUBSTR(RRM_RECE_NO,9,1) = '3' THEN CASE WHEN RRM_PAY_KD IN ('01','02','03','04') THEN NVL(RRM_RETURN_PR,0) ELSE 0 END ELSE 0 END ELSE 0 END RRM_COMP_RPR, CASE WHEN RRM_OCCU_KD IN ('70','71','72') THEN CASE WHEN SUBSTR(RRM_RECE_NO,9,1) IN ('1','2') THEN CASE WHEN RRM_PAY_KD IN ('01','02','03','04') THEN NVL(RRM_RETURN_PR,0) ELSE 0 END ELSE 0 END ELSE 0 END RRM_PSNL_RPR, CASE WHEN RRM_PAY_KD IN ('05') THEN (RRM_RECE_PR - NVL(RRM_RETURN_PR,0)) ELSE 0 END RRM_TICKET_PR, NVL(RRM_RESEREPL_PR,0) RRM_RESEREPL_PR";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_DT BETWEEN '" + DP_FROMDT + "'";
		sql += " AND '" + DP_TODT + "'";
		sql += " AND RRM_OCCU_KD IN ('20','31','32','70','71','72') ) A, (SELECT CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '9901'";
		sql += " AND SUBSTR(CCN_SMALL,1,1) IN ('2','3','5')";
		sql += " AND CCN_LEVEL = '5') B";
		sql += " GROUP BY CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK";
		sql += " UNION";
		sql += " ALL SELECT CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK, CASE CCN_SMALL WHEN '401' THEN SUM(SE_CASH_PR) WHEN '402' THEN SUM(SE_BANK_PR) WHEN '403' THEN SUM(SE_CARD_PR) WHEN '404' THEN SUM(SE_PR) END PR , '' MNG_DT, '' MNG_CD, '' MNG_NM";
		sql += " FROM (SELECT CASE WHEN RRM_PAY_KD IN ('02' , '03') THEN (NVL(RRM_RESER_PR,0) - NVL(RRM_RETURN_PR,0)) ELSE 0 END SE_CASH_PR, CASE WHEN RRM_PAY_KD IN ('04') THEN (NVL(RRM_RESER_PR,0) - NVL(RRM_RETURN_PR,0)) ELSE 0 END SE_BANK_PR, CASE WHEN RRM_PAY_KD IN ('01') THEN (NVL(RRM_RESER_PR,0) - NVL(RRM_RETURN_PR,0)) ELSE 0 END SE_CARD_PR, CASE WHEN RRM_PAY_KD IN ('01','02','03','04') THEN NVL(RRM_RESER_PR,0) - NVL(RRM_RETURN_PR,0) ELSE 0 END SE_PR";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_DT BETWEEN '" + DP_FROMDT + "'";
		sql += " AND '" + DP_TODT + "'";
		sql += " AND RRM_OCCU_KD IN ('10','73') ) A, (SELECT CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '9901'";
		sql += " AND SUBSTR(CCN_SMALL,1,1) IN ('4')";
		sql += " AND CCN_LEVEL = '5') B";
		sql += " GROUP BY CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK";
		sql += " UNION";
		sql += " ALL SELECT B.CCN_SMALL, B.CCN_VALUE, B.CCN_FULL_NM, B.CCN_REL, B.CCN_RMK, SUM(NVL(RCR_RECE_PR,0)) PR, MNG_DT, MNG_CD, MNG_NM";
		sql += " FROM (SELECT '601' CCN_REL, '' MNG_DT, '' MNG_CD, '' MNG_NM, SUM(CASE WHEN TRIM(RCR_TRACE_CD) = '신용취소' THEN TO_NUMBER(RCR_RECE_PR) * -1 ELSE TO_NUMBER(RCR_RECE_PR) END) RCR_RECE_PR";
		sql += " FROM RT_CARD_RECE";
		sql += " WHERE TRIM(RCR_TRACE_CD) IN ('신용승인','신용취소')";
		sql += " AND TO_CHAR(RCR_INPUT_DTT,'YYYY-MM-DD') BETWEEN '" + DP_FROMDT + "'";
		sql += " AND '" + DP_TODT + "'";
		sql += " UNION";
		sql += " ALL SELECT S2.CCN_REL, REPLACE('" + DP_TODT + "','-','') MNG_DT, S2.CCN_VALUE MNG_CD, MAX(S2.CCN_FULL_NM) MNG_NM, SUM(S1.RCR_RECE_PR) RCR_RECE_PR";
		sql += " FROM (SELECT RCR_PURCH_CD, CASE WHEN TRIM(RCR_TRACE_CD) = '신용취소' THEN TO_NUMBER(RCR_RECE_PR) * -1 ELSE TO_NUMBER(RCR_RECE_PR) END RCR_RECE_PR";
		sql += " FROM RT_CARD_RECE";
		sql += " WHERE TRIM(RCR_TRACE_CD) IN ('신용승인','신용취소')";
		sql += " AND TO_CHAR(RCR_INPUT_DTT,'YYYY-MM-DD') BETWEEN '" + DP_FROMDT + "'";
		sql += " AND '" + DP_TODT + "') S1, (SELECT CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0923'";
		sql += " AND CCN_LEVEL = '5') S2";
		sql += " WHERE S1.RCR_PURCH_CD(+) = S2.CCN_SMALL";
		sql += " GROUP BY S2.CCN_REL, S2.CCN_VALUE) A, (SELECT CCN_SMALL, CCN_VALUE, CCN_FULL_NM, CCN_REL, CCN_RMK";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '9901'";
		sql += " AND SUBSTR(CCN_SMALL,1,1) IN (6)";
		sql += " AND CCN_LEVEL = '5') B";
		sql += " WHERE A.CCN_REL(+) = B.CCN_SMALL";
		sql += " GROUP BY B.CCN_SMALL, B.CCN_VALUE, B.CCN_FULL_NM, B.CCN_REL, B.CCN_RMK, MNG_DT, MNG_CD, MNG_NM";
		sql += " ORDER BY CCN_SMALL) BB";
		sql += " WHERE AA.CCN_SMALL = BB.CCN_SMALL(+)";
		sql += " ORDER BY AA.CCN_SMALL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_ReceDayReport_Up_afLoadComp4_002 \n";
			G_INFO += "설명 : 원무과 제공파일 통계조회(한양대본원)_2(카드별통계포함) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='CCN_SMALL' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_VALUE' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_FULL_NM' rs:number='3'>
			<s:datatype dt:type='string' dt:maxLength='300' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_REL' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_RMK' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='BANK_CD' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='BANK_NM' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='ACCO_NO' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='MNG_DT' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='MNG_CD' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='MNG_NM' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CCN_SMALL_T = cRsList.getString("CCN_SMALL");
			String CCN_VALUE_T = cRsList.getString("CCN_VALUE");
			String CCN_FULL_NM_T = cRsList.getString("CCN_FULL_NM");
			String CCN_REL_T = cRsList.getString("CCN_REL");
			String PR_T = cRsList.getString("PR");
			String CCN_RMK_T = cRsList.getString("CCN_RMK");
			String BANK_CD_T = cRsList.getString("BANK_CD");
			String BANK_NM_T = cRsList.getString("BANK_NM");
			String ACCO_NO_T = cRsList.getString("ACCO_NO");
			String MNG_DT_T = cRsList.getString("MNG_DT");
			String MNG_CD_T = cRsList.getString("MNG_CD");
			String MNG_NM_T = cRsList.getString("MNG_NM");
%>
			<z:row
<%
			if(! CCN_SMALL_T.equals("")) {
%>
		 		CCN_SMALL='<%= CCN_SMALL_T%>'
<%
			}

			if(! CCN_VALUE_T.equals("")) {
%>
		 		CCN_VALUE='<%= CCN_VALUE_T%>'
<%
			}

			if(! CCN_FULL_NM_T.equals("")) {
%>
		 		CCN_FULL_NM='<%= CCN_FULL_NM_T%>'
<%
			}

			if(! CCN_REL_T.equals("")) {
%>
		 		CCN_REL='<%= CCN_REL_T%>'
<%
			}

			if(! PR_T.equals("")) {
%>
		 		PR='<%= PR_T%>'
<%
			}

			if(! CCN_RMK_T.equals("")) {
%>
		 		CCN_RMK='<%= CCN_RMK_T%>'
<%
			}

			if(! BANK_CD_T.equals("")) {
%>
		 		BANK_CD='<%= BANK_CD_T%>'
<%
			}

			if(! BANK_NM_T.equals("")) {
%>
		 		BANK_NM='<%= BANK_NM_T%>'
<%
			}

			if(! ACCO_NO_T.equals("")) {
%>
		 		ACCO_NO='<%= ACCO_NO_T%>'
<%
			}

			if(! MNG_DT_T.equals("")) {
%>
		 		MNG_DT='<%= MNG_DT_T%>'
<%
			}

			if(! MNG_CD_T.equals("")) {
%>
		 		MNG_CD='<%= MNG_CD_T%>'
<%
			}

			if(! MNG_NM_T.equals("")) {
%>
		 		MNG_NM='<%= MNG_NM_T%>'
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
