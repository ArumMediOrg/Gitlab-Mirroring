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
		String CBDEPT_CDTEXT = htMethod.get("CBDEPT_CDTEXT");
		String CBDEPT_CDVALUE = htMethod.get("CBDEPT_CDVALUE");
		String RZCMB_MEKD1 = htMethod.get("RZCMB_MEKD1");
		String RZCMB_MEKD2 = htMethod.get("RZCMB_MEKD2");
		String RZCMB_CHGBN = htMethod.get("RZCMB_CHGBN");
		String RZCMB_PLACE1_1 = htMethod.get("RZCMB_PLACE1_1");
		String RZCMB_PLACE1_2 = htMethod.get("RZCMB_PLACE1_2");
		String RZCMB_PLACE2_1 = htMethod.get("RZCMB_PLACE2_1");
		String RZCMB_PLACE2_2 = htMethod.get("RZCMB_PLACE2_2");

		//
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(CBDEPT_CDTEXT == null) { CBDEPT_CDTEXT = ""; }
		if(CBDEPT_CDVALUE == null) { CBDEPT_CDVALUE = ""; }
		if(RZCMB_MEKD1 == null) { RZCMB_MEKD1 = ""; }
		if(RZCMB_MEKD2 == null) { RZCMB_MEKD2 = ""; }
		if(RZCMB_CHGBN == null) { RZCMB_CHGBN = ""; }
		if(RZCMB_PLACE1_1 == null) { RZCMB_PLACE1_1 = ""; }
		if(RZCMB_PLACE1_2 == null) { RZCMB_PLACE1_2 = ""; }
		if(RZCMB_PLACE2_1 == null) { RZCMB_PLACE2_1 = ""; }
		if(RZCMB_PLACE2_2 == null) { RZCMB_PLACE2_2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT MAX(D117) D117,MAX(D116) D116, MAX(D115) D115, MAX(D114) D114, MAX(D113) D113, MAX(D112) D112, MAX(D110) D110,
       MAX(D127) D127, MAX(D126) D126, MAX(D125) D125, MAX(D124) D124, MAX(D123) D123,MAX(D122) D122, MAX(D120) D120,
       MAX(D217) D217, MAX(D216) D216, MAX(D215) D215, MAX(D214) D214, MAX(D213) D213, MAX(D212) D212, MAX(D210) D210,
       MAX(D227) D227, MAX(D226) D226, MAX(D225) D225, MAX(D224) D224, MAX(D223) D223, MAX(D222) D222, MAX(D220) D220,
       MAX(C117) C117, MAX(C116) C116, MAX(C115) C115, MAX(C114) C114, MAX(C113) C113, MAX(C112) C112, MAX(C110) C110,
       MAX(C127) C127, MAX(C126) C126, MAX(C125) C125, MAX(C124) C124, MAX(C123) C123, MAX(C122) C122, MAX(C120) C120
FROM(
     SELECT CASE WHEN GB='D11' THEN MAX7 ELSE 0 END D117,
            CASE WHEN GB='D11' THEN MAX6 ELSE 0 END D116,
            CASE WHEN GB='D11' THEN MAX5 ELSE 0 END D115,
            CASE WHEN GB='D11' THEN MAX4 ELSE 0 END D114,
            CASE WHEN GB='D11' THEN MAX3 ELSE 0 END D113,
            CASE WHEN GB='D11' THEN MAX2 ELSE 0 END D112,
            CASE WHEN GB='D11' THEN MAX9 ELSE 0 END D110,
            CASE WHEN GB='D12' THEN MAX7 ELSE 0 END D127,
            CASE WHEN GB='D12' THEN MAX6 ELSE 0 END D126,
            CASE WHEN GB='D12' THEN MAX5 ELSE 0 END D125,
            CASE WHEN GB='D12' THEN MAX4 ELSE 0 END D124,
            CASE WHEN GB='D12' THEN MAX3 ELSE 0 END D123,
            CASE WHEN GB='D12' THEN MAX2 ELSE 0 END D122,
            CASE WHEN GB='D12' THEN MAX9 ELSE 0 END D120,
            CASE WHEN GB='D21' THEN MAX7 ELSE 0 END D217,
            CASE WHEN GB='D21' THEN MAX6 ELSE 0 END D216,
            CASE WHEN GB='D21' THEN MAX5 ELSE 0 END D215,
            CASE WHEN GB='D21' THEN MAX4 ELSE 0 END D214,
            CASE WHEN GB='D21' THEN MAX3 ELSE 0 END D213,
            CASE WHEN GB='D21' THEN MAX2 ELSE 0 END D212,
            CASE WHEN GB='D21' THEN MAX9 ELSE 0 END D210,
            CASE WHEN GB='D22' THEN MAX7 ELSE 0 END D227,
            CASE WHEN GB='D22' THEN MAX6 ELSE 0 END D226,
            CASE WHEN GB='D22' THEN MAX5 ELSE 0 END D225,
            CASE WHEN GB='D22' THEN MAX4 ELSE 0 END D224,
            CASE WHEN GB='D22' THEN MAX3 ELSE 0 END D223,
            CASE WHEN GB='D22' THEN MAX2 ELSE 0 END D222,
            CASE WHEN GB='D22' THEN MAX9 ELSE 0 END D220,
            CASE WHEN GB='C11' THEN MAX7 ELSE 0 END C117,
            CASE WHEN GB='C11' THEN MAX6 ELSE 0 END C116,
            CASE WHEN GB='C11' THEN MAX5 ELSE 0 END C115,
            CASE WHEN GB='C11' THEN MAX4 ELSE 0 END C114,
            CASE WHEN GB='C11' THEN MAX3 ELSE 0 END C113,
            CASE WHEN GB='C11' THEN MAX2 ELSE 0 END C112,
            CASE WHEN GB='C11' THEN MAX9 ELSE 0 END C110,
            CASE WHEN GB='C12' THEN MAX7 ELSE 0 END C127,
            CASE WHEN GB='C12' THEN MAX6 ELSE 0 END C126,
            CASE WHEN GB='C12' THEN MAX5 ELSE 0 END C125,
            CASE WHEN GB='C12' THEN MAX4 ELSE 0 END C124,
            CASE WHEN GB='C12' THEN MAX3 ELSE 0 END C123,
            CASE WHEN GB='C12' THEN MAX2 ELSE 0 END C122,
            CASE WHEN GB='C12' THEN MAX9 ELSE 0 END C120
     FROM (
           select 'D11' GB,sum(max7) max7,
                  sum(max6) max6,
                  sum(max5) max5,
                  sum(max4) max4,
                  sum(max3) max3,
                  sum(max2) max2,
                  sum(max9) max9
           from (
                 select case when maxcol ='7' then 1 end max7,
                        case when maxcol ='6' then 1 end max6,
                        case when maxcol ='5' then 1 end max5,
                        case when maxcol ='4' then 1 end max4,
                        case when maxcol ='3' then 1 end max3,
                        case when maxcol ='2' then 1 end max2,
                        case when maxcol ='0' then 1 end max9
                 from(
                      select PlP_EXAM_DT,PLP_EXAM_SQ,
                             max(case when NVL(a1, 0) > NVL(a2, 0) and NVL(a1, 0) > NVL(a3, 0) then a1
                                      when NVL(a2, 0) > NVL(a3, 0)  then a2
                                      else NVL(a3, 0) end) as maxcol
                      from (
                            SELECT PlP_EXAM_DT,PLP_EXAM_SQ,
                                   max(PLP_JLPN_SH01) a1,max(PLP_JLPN_SH02) a2,max(PLP_JLPN_SH03) a3
                            from (
                                  SELECT PlP_EXAM_DT,PLP_EXAM_SQ,
                                         case when PLP_JLPN_SH01 ='9' Then '0' else PLP_JLPN_SH01 end  PLP_JLPN_SH01,
                                         case when  PLP_JLPN_SH02 ='9' Then '0' else PLP_JLPN_SH02 end PLP_JLPN_SH02,
                                         case when  PLP_JLPN_SH03 ='9' Then '0' else PLP_JLPN_SH03 end PLP_JLPN_SH03
                                  FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B ON A.PlP_EXAM_DT=B.EEA_EXAM_DT AND  A.PLP_EXAM_SQ=B.EEA_EXAM_SQ
                                  where EEA_EXAM_DT>=:dp_fromdt and EEA_EXAM_DT<=:dp_todt AND NVL(EEA_HTSB_CD, ' ') <> ' '
                                        AND EEA_COMP_CD= :COMP_CD

if :cbDept_CdText <> '' then
                                        AND EEA_DEPT_CD = :cbDept_CdValue

if :RzCmb_mekd1 <> '' then
                                        AND  EEA_FAMY_CD = :RzCmb_mekd2

if :RzCmb_chgbn = '1' then
                                        AND EEA_HDMD_YN = 'Y'
else if :RzCmb_chgbn = '2' then
                                        AND EEA_HDMD_YN = 'N'

if :RzCmb_place1_1 <> '' then
                                        AND SUBSTR(EEA_PLCE_CD, 1, 1) = :RzCmb_place1_2

if :RzCmb_place2_1 <> '' then
                                        AND EEA_PLCE_CD = :RzCmb_place2_2

                                        AND PLP_JLPN_PNCD ='D2'
                                        and EEA_SEX_CD='1'
                                 ) ff
                            group by PlP_EXAM_DT,PLP_EXAM_SQ
                           ) t1
                      group by  PlP_EXAM_DT,PLP_EXAM_SQ
                     ) t2) t3
           union all
           select 'D12' GB, sum(max7) max7,
                  sum(max6) max6,
                  sum(max5) max5,
                  sum(max4) max4,
                  sum(max3) max3,
                  sum(max2) max2,
                  sum(max9) max9
           from (
                 select case when maxcol ='7' then 1 end max7,
                        case when maxcol ='6' then 1 end max6,
                        case when maxcol ='5' then 1 end max5,
                        case when maxcol ='4' then 1 end max4,
                        case when maxcol ='3' then 1 end max3,
                        case when maxcol ='2' then 1 end max2,
                        case when maxcol ='0' then 1 end max9
                 from (
                       select PlP_EXAM_DT,PLP_EXAM_SQ,
                              max(case when NVL(a1, 0) > NVL(a2, 0) and NVL(a1, 0) > NVL(a3, 0) then a1
                                       when NVL(a2, 0) > NVL(a3, 0)  then a2
                                       else NVL(a3, 0) end) as maxcol
                       from (
                             SELECT PlP_EXAM_DT,PLP_EXAM_SQ,
                                    max(PLP_JLPN_SH01) a1,max(PLP_JLPN_SH02) a2,max(PLP_JLPN_SH03) a3
                             from (
                                   SELECT PlP_EXAM_DT,PLP_EXAM_SQ,
                                          case when PLP_JLPN_SH01 ='9' Then '0' else PLP_JLPN_SH01 end  PLP_JLPN_SH01,
                                          case when  PLP_JLPN_SH02 ='9' Then '0' else PLP_JLPN_SH02 end PLP_JLPN_SH02,
                                          case when  PLP_JLPN_SH03 ='9' Then '0' else PLP_JLPN_SH03 end PLP_JLPN_SH03
                                   FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B ON A.PlP_EXAM_DT=B.EEA_EXAM_DT AND  A.PLP_EXAM_SQ=B.EEA_EXAM_SQ              
                                   where EEA_EXAM_DT>=:dp_fromdt and EEA_EXAM_DT<=:dp_todt AND NVL(EEA_HTSB_CD, ' ') <> ' '
                                         AND EEA_COMP_CD=:COMP_CD

if :cbDept_CdText <> '' then
                                         AND EEA_DEPT_CD = :cbDept_CdValue
                              
if :RzCmb_mekd1 <> '' then
                                         AND  EEA_FAMY_CD = :RzCmb_mekd2
                              
if :RzCmb_chgbn = '1' then
                                         AND EEA_HDMD_YN = 'Y'
else if :RzCmb_chgbn = '2' then
                                         AND EEA_HDMD_YN = 'N'
                              
if :RzCmb_place1_1 <> '' then
                                         AND SUBSTR(EEA_PLCE_CD, 1, 1) = :RzCmb_place1_2

if :RzCmb_place2_1 <> '' then
                                         AND EEA_PLCE_CD = :RzCmb_place2_2

                                         AND PLP_JLPN_PNCD ='D2'
                                         and EEA_SEX_CD='2'
                                  ) ff
                             group by PlP_EXAM_DT,PLP_EXAM_SQ
                            )  t1
                       group by  PlP_EXAM_DT,PLP_EXAM_SQ
                      ) t2) t3
           union all
           select 'D21' GB,sum(max7) max7,
                  sum(max6) max6,
                  sum(max5) max5,
                  sum(max4) max4,
                  sum(max3) max3,
                  sum(max2) max2,
                  sum(max9) max9
           from (
                 select case when maxcol ='7' then 1 end max7,
                        case when maxcol ='6' then 1 end max6,
                        case when maxcol ='5' then 1 end max5,
                        case when maxcol ='4' then 1 end max4,
                        case when maxcol ='3' then 1 end max3,
                        case when maxcol ='2' then 1 end max2,
                        case when maxcol ='0' then 1 end max9
                 from (
                       select PlP_EXAM_DT,PLP_EXAM_SQ,
                              max(case when NVL(a1, 0) > NVL(a2, 0) and NVL(a1, 0) > NVL(a3, 0) then a1
                                       when NVL(a2, 0) > NVL(a3, 0)  then a2
                                       else NVL(a3, 0) end) as maxcol
                       from (
                             SELECT PlP_EXAM_DT,PLP_EXAM_SQ,
                                    max(PLP_JLPN_SH01) a1,max(PLP_JLPN_SH02) a2,max(PLP_JLPN_SH03) a3
                             from (
                                   SELECT PlP_EXAM_DT,PLP_EXAM_SQ,
                                          case when PLP_JLPN_SH01 ='9' Then '0' else PLP_JLPN_SH01 end  PLP_JLPN_SH01,
                                          case when PLP_JLPN_SH02 ='9' Then '0' else PLP_JLPN_SH02 end PLP_JLPN_SH02,
                                          case when PLP_JLPN_SH03 ='9' Then '0' else PLP_JLPN_SH03 end PLP_JLPN_SH03
                                   FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B ON A.PlP_EXAM_DT=B.EEA_EXAM_DT AND  A.PLP_EXAM_SQ=B.EEA_EXAM_SQ
                                   where EEA_EXAM_DT>=:dp_fromdt and EEA_EXAM_DT<=:dp_todt AND NVL(EEA_HTSB_CD, ' ') <> ' '
                                         AND EEA_COMP_CD=:COMP_CD

if :cbDept_CdText <> '' then
                                         AND EEA_DEPT_CD = :cbDept_CdValue

if :RzCmb_mekd1 <> '' then
                                         AND  EEA_FAMY_CD = :RzCmb_mekd2

if :RzCmb_chgbn = '1' then
                                         AND EEA_HDMD_YN = 'Y'
else if :RzCmb_chgbn = '2' then
                                         AND EEA_HDMD_YN = 'N'

if :RzCmb_place1_1 <> '' then
                                         AND SUBSTR(EEA_PLCE_CD, 1, 1) = :RzCmb_place1_2

if :RzCmb_place2_1 <> '' then
                                         AND EEA_PLCE_CD = :RzCmb_place2_2

                                         AND PLP_JLPN_PNCD ='D1'
                                         and EEA_SEX_CD='1'
                                  ) ff
                             group by PlP_EXAM_DT,PLP_EXAM_SQ
                            ) t1
                       group by  PlP_EXAM_DT,PLP_EXAM_SQ
                      ) t2) t3
           union all
           select 'D22' GB,sum(max7) max7,
                  sum(max6) max6,
                  sum(max5) max5,
                  sum(max4) max4,
                  sum(max3) max3,
                  sum(max2) max2,
                  sum(max9) max9
           from (
                 select case when maxcol ='7' then 1 end max7,
                        case when maxcol ='6' then 1 end max6,
                        case when maxcol ='5' then 1 end max5,
                        case when maxcol ='4' then 1 end max4,
                        case when maxcol ='3' then 1 end max3,
                        case when maxcol ='2' then 1 end max2,
                        case when maxcol ='0' then 1 end max9
                 from (
                       select PlP_EXAM_DT,PLP_EXAM_SQ,
                              max(case when NVL(a1, 0) > NVL(a2, 0) and NVL(a1, 0) > NVL(a3, 0) then a1
                                       when NVL(a2, 0) > NVL(a3, 0)  then a2
                                       else NVL(a3, 0) end) as maxcol
                       from (
                             SELECT PlP_EXAM_DT,PLP_EXAM_SQ,
                                    max(PLP_JLPN_SH01) a1,max(PLP_JLPN_SH02) a2,max(PLP_JLPN_SH03) a3
                             from (
                                   SELECT PlP_EXAM_DT,PLP_EXAM_SQ,
                                          case when PLP_JLPN_SH01 ='9' Then '0' else PLP_JLPN_SH01 end  PLP_JLPN_SH01,
                                          case when PLP_JLPN_SH02 ='9' Then '0' else PLP_JLPN_SH02 end PLP_JLPN_SH02,
                                          case when PLP_JLPN_SH03 ='9' Then '0' else PLP_JLPN_SH03 end PLP_JLPN_SH03
                                   FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B ON A.PlP_EXAM_DT=B.EEA_EXAM_DT AND  A.PLP_EXAM_SQ=B.EEA_EXAM_SQ
                                   where EEA_EXAM_DT>=:dp_fromdt and EEA_EXAM_DT<=:dp_todt AND NVL(EEA_HTSB_CD, ' ') <> ' '
                                         AND EEA_COMP_CD=:COMP_CD

if :cbDept_CdText <> '' then
                                         AND EEA_DEPT_CD = :cbDept_CdValue

if :RzCmb_mekd1 <> '' then
                                         AND  EEA_FAMY_CD = :RzCmb_mekd2

if :RzCmb_chgbn = '1' then
                                         AND EEA_HDMD_YN = 'Y'
else if :RzCmb_chgbn = '2' then
                                         AND EEA_HDMD_YN = 'N'

if :RzCmb_place1_1 <> '' then
                                         AND SUBSTR(EEA_PLCE_CD, 1, 1) = :RzCmb_place1_2

if :RzCmb_place2_1 <> '' then
                                         AND EEA_PLCE_CD = :RzCmb_place2_2

                                         AND PLP_JLPN_PNCD ='D1'
                                         and EEA_SEX_CD='2'
                                  ) ff
                             group by PlP_EXAM_DT,PLP_EXAM_SQ
                            ) t1
                       group by PlP_EXAM_DT,PLP_EXAM_SQ
                      ) t2) t3
           union all
           select 'C11' GB, sum(max7) max7,
                  sum(max6) max6,
                  sum(max5) max5,
                  sum(max4) max4,
                  sum(max3) max3,
                  sum(max2) max2,
                  sum(max9) max9
           from (
                 select case when maxcol ='7' then 1 end max7,
                        case when maxcol ='6' then 1 end max6,
                        case when maxcol ='5' then 1 end max5,
                        case when maxcol ='4' then 1 end max4,
                        case when maxcol ='3' then 1 end max3,
                        case when maxcol ='2' then 1 end max2,
                        case when maxcol ='0' then 1 end max9
                 from (
                       select PlP_EXAM_DT,PLP_EXAM_SQ,
                              max(case when NVL(a1, 0) > NVL(a2, 0) and NVL(a1, 0) > NVL(a3, 0) then a1
                                       when NVL(a2, 0) > NVL(a3, 0)  then a2
                                       else NVL(a3, 0) end) as maxcol
                       from (
                             SELECT PlP_EXAM_DT,PLP_EXAM_SQ,
                                    max(PLP_JLPN_SH01) a1,max(PLP_JLPN_SH02) a2,max(PLP_JLPN_SH03) a3
                             from (
                                   SELECT PlP_EXAM_DT,PLP_EXAM_SQ,
                                          case when PLP_JLPN_SH01 IN ('1', '9') Then '0' else PLP_JLPN_SH01 end  PLP_JLPN_SH01,
                                          case when PLP_JLPN_SH02 IN ('1', '9') Then '0' else PLP_JLPN_SH02 end PLP_JLPN_SH02,
                                          case when PLP_JLPN_SH03 IN ('1', '9') Then '0' else PLP_JLPN_SH03 end PLP_JLPN_SH03
                                   FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B ON A.PlP_EXAM_DT=B.EEA_EXAM_DT AND  A.PLP_EXAM_SQ=B.EEA_EXAM_SQ
                                   where EEA_EXAM_DT>=:dp_fromdt and EEA_EXAM_DT<=:dp_todt AND NVL(EEA_HTSB_CD, ' ') <> ' '
                                         AND EEA_COMP_CD=:COMP_CD

if :cbDept_CdText <> '' then
                                         AND EEA_DEPT_CD = :cbDept_CdValue

if :RzCmb_mekd1 <> '' then
                                         AND  EEA_FAMY_CD = :RzCmb_mekd2

if :RzCmb_chgbn = '1' then
                                         AND EEA_HDMD_YN = 'Y'
else if :RzCmb_chgbn = '2' then
                                         AND EEA_HDMD_YN = 'N'

if :RzCmb_place1_1 <> '' then
                                         AND SUBSTR(EEA_PLCE_CD, 1, 1) = :RzCmb_place1_2

if :RzCmb_place2_1 <> '' then
                                         AND EEA_PLCE_CD = :RzCmb_place2_2

                                         AND PLP_JLPN_PNCD ='C'
                                         and EEA_SEX_CD='1'
                                  ) ff
                             group by PlP_EXAM_DT,PLP_EXAM_SQ
                            ) t1
                       group by  PlP_EXAM_DT,PLP_EXAM_SQ
                      ) t2) t3
           union all
           select 'C12',sum(max7) max7,
                  sum(max6) max6,
                  sum(max5) max5,
                  sum(max4) max4,
                  sum(max3) max3,
                  sum(max2) max2,
                  sum(max9) max9
           from (
                 select case when maxcol ='7' then 1 end max7,
                        case when maxcol ='6' then 1 end max6,
                        case when maxcol ='5' then 1 end max5,
                        case when maxcol ='4' then 1 end max4,
                        case when maxcol ='3' then 1 end max3,
                        case when maxcol ='2' then 1 end max2,
                        case when maxcol ='0' then 1 end max9
                 from (
                       select PlP_EXAM_DT,PLP_EXAM_SQ,
                              max(case when NVL(a1, 0) > NVL(a2, 0) and NVL(a1, 0) > NVL(a3, 0) then a1
                                       when NVL(a2, 0) > NVL(a3, 0)  then a2
                                       else NVL(a3, 0) end) as maxcol
                       from(
                            SELECT PlP_EXAM_DT,PLP_EXAM_SQ,
                                   max(PLP_JLPN_SH01) a1, max(PLP_JLPN_SH02) a2,max(PLP_JLPN_SH03) a3
                            from (
                                  SELECT PlP_EXAM_DT,PLP_EXAM_SQ,
                                         case when PLP_JLPN_SH01 IN ('1', '9') Then '0' else PLP_JLPN_SH01 end  PLP_JLPN_SH01,
                                         case when PLP_JLPN_SH02 IN ('1', '9') Then '0' else PLP_JLPN_SH02 end PLP_JLPN_SH02,
                                         case when PLP_JLPN_SH03 IN ('1', '9') Then '0' else PLP_JLPN_SH03 end PLP_JLPN_SH03
                                  FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B ON A.PlP_EXAM_DT=B.EEA_EXAM_DT AND  A.PLP_EXAM_SQ=B.EEA_EXAM_SQ
                                  where EEA_EXAM_DT>=:dp_fromdt and EEA_EXAM_DT<=:dp_todt AND NVL(EEA_HTSB_CD, ' ') <> ' '   '
                                        AND EEA_COMP_CD=:COMP_CD

if :cbDept_CdText <> '' then
                                        AND EEA_DEPT_CD = :cbDept_CdValue

if :RzCmb_mekd1 <> '' then
                                        AND  EEA_FAMY_CD = :RzCmb_mekd2

if :RzCmb_chgbn = '1' then
                                        AND EEA_HDMD_YN = 'Y'
else if :RzCmb_chgbn = '2' then
                                        AND EEA_HDMD_YN = 'N'

if :RzCmb_place1_1 <> '' then
                                        AND SUBSTR(EEA_PLCE_CD, 1, 1) = :RzCmb_place1_2

if :RzCmb_place2_1 <> '' then
                                        AND EEA_PLCE_CD = :RzCmb_place2_2

                                        AND PLP_JLPN_PNCD ='C'
                                        and EEA_SEX_CD='2'
                                 ) ff
                            group by PlP_EXAM_DT,PLP_EXAM_SQ
                           ) t1
                       group by  PlP_EXAM_DT,PLP_EXAM_SQ
                      ) t2) t3
          ) TALL
    ) TALL1

		*/

		sql = " SELECT MAX(D117) D117,MAX(D116) D116, MAX(D115) D115, MAX(D114) D114, MAX(D113) D113, MAX(D112) D112, MAX(D110) D110, MAX(D127) D127, MAX(D126) D126, MAX(D125) D125, MAX(D124) D124, MAX(D123) D123,MAX(D122) D122, MAX(D120) D120, MAX(D217) D217, MAX(D216) D216, MAX(D215) D215, MAX(D214) D214, MAX(D213) D213, MAX(D212) D212, MAX(D210) D210, MAX(D227) D227, MAX(D226) D226, MAX(D225) D225, MAX(D224) D224, MAX(D223) D223, MAX(D222) D222, MAX(D220) D220, MAX(C117) C117, MAX(C116) C116, MAX(C115) C115, MAX(C114) C114, MAX(C113) C113, MAX(C112) C112, MAX(C110) C110, MAX(C127) C127, MAX(C126) C126, MAX(C125) C125, MAX(C124) C124, MAX(C123) C123, MAX(C122) C122, MAX(C120) C120 FROM( SELECT CASE WHEN GB='D11' THEN MAX7 ELSE 0 END D117, CASE WHEN GB='D11' THEN MAX6 ELSE 0 END D116, CASE WHEN GB='D11' THEN MAX5 ELSE 0 END D115, CASE WHEN GB='D11' THEN MAX4 ELSE 0 END D114, CASE WHEN GB='D11' THEN MAX3 ELSE 0 END D113, CASE WHEN GB='D11' THEN MAX2 ELSE 0 END D112, CASE WHEN GB='D11' THEN MAX9 ELSE 0 END D110, CASE WHEN GB='D12' THEN MAX7 ELSE 0 END D127, CASE WHEN GB='D12' THEN MAX6 ELSE 0 END D126, CASE WHEN GB='D12' THEN MAX5 ELSE 0 END D125, CASE WHEN GB='D12' THEN MAX4 ELSE 0 END D124, CASE WHEN GB='D12' THEN MAX3 ELSE 0 END D123, CASE WHEN GB='D12' THEN MAX2 ELSE 0 END D122, CASE WHEN GB='D12' THEN MAX9 ELSE 0 END D120, CASE WHEN GB='D21' THEN MAX7 ELSE 0 END D217, CASE WHEN GB='D21' THEN MAX6 ELSE 0 END D216, CASE WHEN GB='D21' THEN MAX5 ELSE 0 END D215, CASE WHEN GB='D21' THEN MAX4 ELSE 0 END D214, CASE WHEN GB='D21' THEN MAX3 ELSE 0 END D213, CASE WHEN GB='D21' THEN MAX2 ELSE 0 END D212, CASE WHEN GB='D21' THEN MAX9 ELSE 0 END D210, CASE WHEN GB='D22' THEN MAX7 ELSE 0 END D227, CASE WHEN GB='D22' THEN MAX6 ELSE 0 END D226, CASE WHEN GB='D22' THEN MAX5 ELSE 0 END D225, CASE WHEN GB='D22' THEN MAX4 ELSE 0 END D224, CASE WHEN GB='D22' THEN MAX3 ELSE 0 END D223, CASE WHEN GB='D22' THEN MAX2 ELSE 0 END D222, CASE WHEN GB='D22' THEN MAX9 ELSE 0 END D220, CASE WHEN GB='C11' THEN MAX7 ELSE 0 END C117, CASE WHEN GB='C11' THEN MAX6 ELSE 0 END C116, CASE WHEN GB='C11' THEN MAX5 ELSE 0 END C115, CASE WHEN GB='C11' THEN MAX4 ELSE 0 END C114, CASE WHEN GB='C11' THEN MAX3 ELSE 0 END C113, CASE WHEN GB='C11' THEN MAX2 ELSE 0 END C112, CASE WHEN GB='C11' THEN MAX9 ELSE 0 END C110, CASE WHEN GB='C12' THEN MAX7 ELSE 0 END C127, CASE WHEN GB='C12' THEN MAX6 ELSE 0 END C126, CASE WHEN GB='C12' THEN MAX5 ELSE 0 END C125, CASE WHEN GB='C12' THEN MAX4 ELSE 0 END C124, CASE WHEN GB='C12' THEN MAX3 ELSE 0 END C123, CASE WHEN GB='C12' THEN MAX2 ELSE 0 END C122, CASE WHEN GB='C12' THEN MAX9 ELSE 0 END C120";
		sql += " FROM ( SELECT 'D11' GB,SUM(MAX7) MAX7, SUM(MAX6) MAX6, SUM(MAX5) MAX5, SUM(MAX4) MAX4, SUM(MAX3) MAX3, SUM(MAX2) MAX2, SUM(MAX9) MAX9";
		sql += " FROM ( SELECT CASE WHEN MAXCOL ='7' THEN 1 END MAX7, CASE WHEN MAXCOL ='6' THEN 1 END MAX6, CASE WHEN MAXCOL ='5' THEN 1 END MAX5, CASE WHEN MAXCOL ='4' THEN 1 END MAX4, CASE WHEN MAXCOL ='3' THEN 1 END MAX3, CASE WHEN MAXCOL ='2' THEN 1 END MAX2, CASE WHEN MAXCOL ='0' THEN 1 END MAX9 FROM( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, MAX(CASE WHEN NVL(A1, 0) > NVL(A2, 0)";
		sql += " AND NVL(A1, 0) > NVL(A3, 0) THEN A1 WHEN NVL(A2, 0) > NVL(A3, 0) THEN A2 ELSE NVL(A3, 0) END) AS MAXCOL";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, MAX(PLP_JLPN_SH01) A1,MAX(PLP_JLPN_SH02) A2,MAX(PLP_JLPN_SH03) A3";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, CASE WHEN PLP_JLPN_SH01 ='9' THEN '0' ELSE PLP_JLPN_SH01 END PLP_JLPN_SH01, CASE WHEN PLP_JLPN_SH02 ='9' THEN '0' ELSE PLP_JLPN_SH02 END PLP_JLPN_SH02, CASE WHEN PLP_JLPN_SH03 ='9' THEN '0' ELSE PLP_JLPN_SH03 END PLP_JLPN_SH03";
		sql += " FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B";
		sql += " ON A.PLP_EXAM_DT=B.EEA_EXAM_DT";
		sql += " AND A.PLP_EXAM_SQ=B.EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT>='" + DP_FROMDT + "'";
		sql += " AND EEA_EXAM_DT<='" + DP_TODT + "'";
		sql += " AND NVL(EEA_HTSB_CD, ' ') <> ' '";
		sql += " AND EEA_COMP_CD= '" + COMP_CD + "'";

		if(!CBDEPT_CDTEXT.equals("")) {
			sql += " AND EEA_DEPT_CD = '" + CBDEPT_CDVALUE + "'";
		}
		
		if(!RZCMB_MEKD1.equals("")) {
			sql += " AND EEA_FAMY_CD = '" + RZCMB_MEKD2 + "'";
		}
		
		if(RZCMB_CHGBN.equals("1")) {
			sql += " AND EEA_HDMD_YN = 'Y'";
		}
		else if(RZCMB_CHGBN.equals("2")) {
			sql += " AND EEA_HDMD_YN = 'N'";
		}
		
		if(!RZCMB_PLACE1_1.equals("")) {
			sql += " AND SUBSTR(EEA_PLCE_CD, 1, 1) = '" + RZCMB_PLACE1_2 + "'";
		}
		
		if(!RZCMB_PLACE2_1.equals("")) {
			sql += " AND EEA_PLCE_CD = '" + RZCMB_PLACE2_2 + "'";
		}

		sql += " AND PLP_JLPN_PNCD ='D2'";
		sql += " AND EEA_SEX_CD='1' ) FF";
		sql += " GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ ) T1";
		sql += " GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ ) T2) T3";
		sql += " UNION";
		sql += " ALL SELECT 'D12' GB, SUM(MAX7) MAX7, SUM(MAX6) MAX6, SUM(MAX5) MAX5, SUM(MAX4) MAX4, SUM(MAX3) MAX3, SUM(MAX2) MAX2, SUM(MAX9) MAX9";
		sql += " FROM ( SELECT CASE WHEN MAXCOL ='7' THEN 1 END MAX7, CASE WHEN MAXCOL ='6' THEN 1 END MAX6, CASE WHEN MAXCOL ='5' THEN 1 END MAX5, CASE WHEN MAXCOL ='4' THEN 1 END MAX4, CASE WHEN MAXCOL ='3' THEN 1 END MAX3, CASE WHEN MAXCOL ='2' THEN 1 END MAX2, CASE WHEN MAXCOL ='0' THEN 1 END MAX9";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, MAX(CASE WHEN NVL(A1, 0) > NVL(A2, 0)";
		sql += " AND NVL(A1, 0) > NVL(A3, 0) THEN A1 WHEN NVL(A2, 0) > NVL(A3, 0) THEN A2 ELSE NVL(A3, 0) END) AS MAXCOL";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, MAX(PLP_JLPN_SH01) A1,MAX(PLP_JLPN_SH02) A2,MAX(PLP_JLPN_SH03) A3";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, CASE WHEN PLP_JLPN_SH01 ='9' THEN '0' ELSE PLP_JLPN_SH01 END PLP_JLPN_SH01, CASE WHEN PLP_JLPN_SH02 ='9' THEN '0' ELSE PLP_JLPN_SH02 END PLP_JLPN_SH02, CASE WHEN PLP_JLPN_SH03 ='9' THEN '0' ELSE PLP_JLPN_SH03 END PLP_JLPN_SH03";
		sql += " FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B";
		sql += " ON A.PLP_EXAM_DT=B.EEA_EXAM_DT";
		sql += " AND A.PLP_EXAM_SQ=B.EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT>='" + DP_FROMDT + "'";
		sql += " AND EEA_EXAM_DT<='" + DP_TODT + "'";
		sql += " AND NVL(EEA_HTSB_CD, ' ') <> ' '";
		sql += " AND EEA_COMP_CD='" + COMP_CD + "'";

		if(!CBDEPT_CDTEXT.equals("")) {
			sql += " AND EEA_DEPT_CD = '" + CBDEPT_CDVALUE + "'";
		}
		
		if(!RZCMB_MEKD1.equals("")) {
			sql += " AND EEA_FAMY_CD = '" + RZCMB_MEKD2 + "'";
		}
		
		if(RZCMB_CHGBN.equals("1")) {
			sql += " AND EEA_HDMD_YN = 'Y'";
		}
		else if(RZCMB_CHGBN.equals("2")) {
			sql += " AND EEA_HDMD_YN = 'N'";
		}
		
		if(!RZCMB_PLACE1_1.equals("")) {
			sql += " AND SUBSTR(EEA_PLCE_CD, 1, 1) = '" + RZCMB_PLACE1_2 + "'";
		}
		
		if(!RZCMB_PLACE2_1.equals("")) {
			sql += " AND EEA_PLCE_CD = '" + RZCMB_PLACE2_2 + "'";
		}

		sql += " AND PLP_JLPN_PNCD ='D2'";
		sql += " AND EEA_SEX_CD='2' ) FF";
		sql += " GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ ) T1";
		sql += " GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ ) T2) T3";
		sql += " UNION";
		sql += " ALL SELECT 'D21' GB,SUM(MAX7) MAX7, SUM(MAX6) MAX6, SUM(MAX5) MAX5, SUM(MAX4) MAX4, SUM(MAX3) MAX3, SUM(MAX2) MAX2, SUM(MAX9) MAX9";
		sql += " FROM ( SELECT CASE WHEN MAXCOL ='7' THEN 1 END MAX7, CASE WHEN MAXCOL ='6' THEN 1 END MAX6, CASE WHEN MAXCOL ='5' THEN 1 END MAX5, CASE WHEN MAXCOL ='4' THEN 1 END MAX4, CASE WHEN MAXCOL ='3' THEN 1 END MAX3, CASE WHEN MAXCOL ='2' THEN 1 END MAX2, CASE WHEN MAXCOL ='0' THEN 1 END MAX9";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, MAX(CASE WHEN NVL(A1, 0) > NVL(A2, 0)";
		sql += " AND NVL(A1, 0) > NVL(A3, 0) THEN A1 WHEN NVL(A2, 0) > NVL(A3, 0) THEN A2 ELSE NVL(A3, 0) END) AS MAXCOL";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, MAX(PLP_JLPN_SH01) A1,MAX(PLP_JLPN_SH02) A2,MAX(PLP_JLPN_SH03) A3";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, CASE WHEN PLP_JLPN_SH01 ='9' THEN '0' ELSE PLP_JLPN_SH01 END PLP_JLPN_SH01, CASE WHEN PLP_JLPN_SH02 ='9' THEN '0' ELSE PLP_JLPN_SH02 END PLP_JLPN_SH02, CASE WHEN PLP_JLPN_SH03 ='9' THEN '0' ELSE PLP_JLPN_SH03 END PLP_JLPN_SH03";
		sql += " FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B";
		sql += " ON A.PLP_EXAM_DT=B.EEA_EXAM_DT";
		sql += " AND A.PLP_EXAM_SQ=B.EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT>='" + DP_FROMDT + "'";
		sql += " AND EEA_EXAM_DT<='" + DP_TODT + "'";
		sql += " AND NVL(EEA_HTSB_CD, ' ') <> ' '";
		sql += " AND EEA_COMP_CD='" + COMP_CD + "'";

		if(!CBDEPT_CDTEXT.equals("")) {
			sql += " AND EEA_DEPT_CD = '" + CBDEPT_CDVALUE + "'";
		}
		
		if(!RZCMB_MEKD1.equals("")) {
			sql += " AND EEA_FAMY_CD = '" + RZCMB_MEKD2 + "'";
		}
		
		if(RZCMB_CHGBN.equals("1")) {
			sql += " AND EEA_HDMD_YN = 'Y'";
		}
		else if(RZCMB_CHGBN.equals("2")) {
			sql += " AND EEA_HDMD_YN = 'N'";
		}
		
		if(!RZCMB_PLACE1_1.equals("")) {
			sql += " AND SUBSTR(EEA_PLCE_CD, 1, 1) = '" + RZCMB_PLACE1_2 + "'";
		}
		
		if(!RZCMB_PLACE2_1.equals("")) {
			sql += " AND EEA_PLCE_CD = '" + RZCMB_PLACE2_2 + "'";
		}

		sql += " AND PLP_JLPN_PNCD ='D1'";
		sql += " AND EEA_SEX_CD='1' ) FF";
		sql += " GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ ) T1";
		sql += " GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ ) T2) T3";
		sql += " UNION";
		sql += " ALL SELECT 'D22' GB,SUM(MAX7) MAX7, SUM(MAX6) MAX6, SUM(MAX5) MAX5, SUM(MAX4) MAX4, SUM(MAX3) MAX3, SUM(MAX2) MAX2, SUM(MAX9) MAX9";
		sql += " FROM ( SELECT CASE WHEN MAXCOL ='7' THEN 1 END MAX7, CASE WHEN MAXCOL ='6' THEN 1 END MAX6, CASE WHEN MAXCOL ='5' THEN 1 END MAX5, CASE WHEN MAXCOL ='4' THEN 1 END MAX4, CASE WHEN MAXCOL ='3' THEN 1 END MAX3, CASE WHEN MAXCOL ='2' THEN 1 END MAX2, CASE WHEN MAXCOL ='0' THEN 1 END MAX9";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, MAX(CASE WHEN NVL(A1, 0) > NVL(A2, 0)";
		sql += " AND NVL(A1, 0) > NVL(A3, 0) THEN A1 WHEN NVL(A2, 0) > NVL(A3, 0) THEN A2 ELSE NVL(A3, 0) END) AS MAXCOL";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, MAX(PLP_JLPN_SH01) A1,MAX(PLP_JLPN_SH02) A2,MAX(PLP_JLPN_SH03) A3";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, CASE WHEN PLP_JLPN_SH01 ='9' THEN '0' ELSE PLP_JLPN_SH01 END PLP_JLPN_SH01, CASE WHEN PLP_JLPN_SH02 ='9' THEN '0' ELSE PLP_JLPN_SH02 END PLP_JLPN_SH02, CASE WHEN PLP_JLPN_SH03 ='9' THEN '0' ELSE PLP_JLPN_SH03 END PLP_JLPN_SH03";
		sql += " FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B";
		sql += " ON A.PLP_EXAM_DT=B.EEA_EXAM_DT";
		sql += " AND A.PLP_EXAM_SQ=B.EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT>='" + DP_FROMDT + "'";
		sql += " AND EEA_EXAM_DT<='" + DP_TODT + "'";
		sql += " AND NVL(EEA_HTSB_CD, ' ') <> ' '";
		sql += " AND EEA_COMP_CD='" + COMP_CD + "'";

		if(!CBDEPT_CDTEXT.equals("")) {
			sql += " AND EEA_DEPT_CD = '" + CBDEPT_CDVALUE + "'";
		}
		
		if(!RZCMB_MEKD1.equals("")) {
			sql += " AND EEA_FAMY_CD = '" + RZCMB_MEKD2 + "'";
		}
		
		if(RZCMB_CHGBN.equals("1")) {
			sql += " AND EEA_HDMD_YN = 'Y'";
		}
		else if(RZCMB_CHGBN.equals("2")) {
			sql += " AND EEA_HDMD_YN = 'N'";
		}
		
		if(!RZCMB_PLACE1_1.equals("")) {
			sql += " AND SUBSTR(EEA_PLCE_CD, 1, 1) = '" + RZCMB_PLACE1_2 + "'";
		}
		
		if(!RZCMB_PLACE2_1.equals("")) {
			sql += " AND EEA_PLCE_CD = '" + RZCMB_PLACE2_2 + "'";
		}

		sql += " AND PLP_JLPN_PNCD ='D1'";
		sql += " AND EEA_SEX_CD='2' ) FF";
		sql += " GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ ) T1";
		sql += " GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ ) T2) T3";
		sql += " UNION";
		sql += " ALL SELECT 'C11' GB, SUM(MAX7) MAX7, SUM(MAX6) MAX6, SUM(MAX5) MAX5, SUM(MAX4) MAX4, SUM(MAX3) MAX3, SUM(MAX2) MAX2, SUM(MAX9) MAX9";
		sql += " FROM ( SELECT CASE WHEN MAXCOL ='7' THEN 1 END MAX7, CASE WHEN MAXCOL ='6' THEN 1 END MAX6, CASE WHEN MAXCOL ='5' THEN 1 END MAX5, CASE WHEN MAXCOL ='4' THEN 1 END MAX4, CASE WHEN MAXCOL ='3' THEN 1 END MAX3, CASE WHEN MAXCOL ='2' THEN 1 END MAX2, CASE WHEN MAXCOL ='0' THEN 1 END MAX9";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, MAX(CASE WHEN NVL(A1, 0) > NVL(A2, 0)";
		sql += " AND NVL(A1, 0) > NVL(A3, 0) THEN A1 WHEN NVL(A2, 0) > NVL(A3, 0) THEN A2 ELSE NVL(A3, 0) END) AS MAXCOL";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, MAX(PLP_JLPN_SH01) A1,MAX(PLP_JLPN_SH02) A2,MAX(PLP_JLPN_SH03) A3";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, CASE WHEN PLP_JLPN_SH01 IN ('1', '9') THEN '0' ELSE PLP_JLPN_SH01 END PLP_JLPN_SH01, CASE WHEN PLP_JLPN_SH02 IN ('1', '9') THEN '0' ELSE PLP_JLPN_SH02 END PLP_JLPN_SH02, CASE WHEN PLP_JLPN_SH03 IN ('1', '9') THEN '0' ELSE PLP_JLPN_SH03 END PLP_JLPN_SH03";
		sql += " FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B";
		sql += " ON A.PLP_EXAM_DT=B.EEA_EXAM_DT";
		sql += " AND A.PLP_EXAM_SQ=B.EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT>='" + DP_FROMDT + "'";
		sql += " AND EEA_EXAM_DT<='" + DP_TODT + "'";
		sql += " AND NVL(EEA_HTSB_CD, ' ') <> ' '";
		sql += " AND EEA_COMP_CD='" + COMP_CD + "'";

		if(!CBDEPT_CDTEXT.equals("")) {
			sql += " AND EEA_DEPT_CD = '" + CBDEPT_CDVALUE + "'";
		}
		
		if(!RZCMB_MEKD1.equals("")) {
			sql += " AND EEA_FAMY_CD = '" + RZCMB_MEKD2 + "'";
		}
		
		if(RZCMB_CHGBN.equals("1")) {
			sql += " AND EEA_HDMD_YN = 'Y'";
		}
		else if(RZCMB_CHGBN.equals("2")) {
			sql += " AND EEA_HDMD_YN = 'N'";
		}
		
		if(!RZCMB_PLACE1_1.equals("")) {
			sql += " AND SUBSTR(EEA_PLCE_CD, 1, 1) = '" + RZCMB_PLACE1_2 + "'";
		}
		
		if(!RZCMB_PLACE2_1.equals("")) {
			sql += " AND EEA_PLCE_CD = '" + RZCMB_PLACE2_2 + "'";
		}
		
		sql += " AND PLP_JLPN_PNCD ='C'";
		sql += " AND EEA_SEX_CD='1' ) FF";
		sql += " GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ ) T1";
		sql += " GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ ) T2) T3";
		sql += " UNION";
		sql += " ALL SELECT 'C12',SUM(MAX7) MAX7, SUM(MAX6) MAX6, SUM(MAX5) MAX5, SUM(MAX4) MAX4, SUM(MAX3) MAX3, SUM(MAX2) MAX2, SUM(MAX9) MAX9";
		sql += " FROM ( SELECT CASE WHEN MAXCOL ='7' THEN 1 END MAX7, CASE WHEN MAXCOL ='6' THEN 1 END MAX6, CASE WHEN MAXCOL ='5' THEN 1 END MAX5, CASE WHEN MAXCOL ='4' THEN 1 END MAX4, CASE WHEN MAXCOL ='3' THEN 1 END MAX3, CASE WHEN MAXCOL ='2' THEN 1 END MAX2, CASE WHEN MAXCOL ='0' THEN 1 END MAX9";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, MAX(CASE WHEN NVL(A1, 0) > NVL(A2, 0)";
		sql += " AND NVL(A1, 0) > NVL(A3, 0) THEN A1 WHEN NVL(A2, 0) > NVL(A3, 0) THEN A2 ELSE NVL(A3, 0) END) AS MAXCOL FROM( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, MAX(PLP_JLPN_SH01) A1, MAX(PLP_JLPN_SH02) A2,MAX(PLP_JLPN_SH03) A3";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ, CASE WHEN PLP_JLPN_SH01 IN ('1', '9') THEN '0' ELSE PLP_JLPN_SH01 END PLP_JLPN_SH01, CASE WHEN PLP_JLPN_SH02 IN ('1', '9') THEN '0' ELSE PLP_JLPN_SH02 END PLP_JLPN_SH02, CASE WHEN PLP_JLPN_SH03 IN ('1', '9') THEN '0' ELSE PLP_JLPN_SH03 END PLP_JLPN_SH03";
		sql += " FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B";
		sql += " ON A.PLP_EXAM_DT=B.EEA_EXAM_DT";
		sql += " AND A.PLP_EXAM_SQ=B.EEA_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT>='" + DP_FROMDT + "'";
		sql += " AND EEA_EXAM_DT<='" + DP_TODT + "'";
		sql += " AND NVL(EEA_HTSB_CD, ' ') <> ' '";
		sql += " AND EEA_COMP_CD='" + COMP_CD + "'";

		if(!CBDEPT_CDTEXT.equals("")) {
			sql += " AND EEA_DEPT_CD = '" + CBDEPT_CDVALUE + "'";
		}
		
		if(!RZCMB_MEKD1.equals("")) {
			sql += " AND EEA_FAMY_CD = '" + RZCMB_MEKD2 + "'";
		}
		
		if(RZCMB_CHGBN.equals("1")) {
			sql += " AND EEA_HDMD_YN = 'Y'";
		}
		else if(RZCMB_CHGBN.equals("2")) {
			sql += " AND EEA_HDMD_YN = 'N'";
		}
		
		if(!RZCMB_PLACE1_1.equals("")) {
			sql += " AND SUBSTR(EEA_PLCE_CD, 1, 1) = '" + RZCMB_PLACE1_2 + "'";
		}
		
		if(!RZCMB_PLACE2_1.equals("")) {
			sql += " AND EEA_PLCE_CD = '" + RZCMB_PLACE2_2 + "'";
		}

		sql += " AND PLP_JLPN_PNCD ='C'";
		sql += " AND EEA_SEX_CD='2' ) FF";
		sql += " GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ ) T1";
		sql += " GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ ) T2) T3 ) TALL ) TALL1";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHERESULTPRT_UDP_SEL_SAHUVIEW_001 \n";
			G_INFO += "설명 : 사후관리정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " CBDEPT_CDTEXT : " + CBDEPT_CDTEXT + " \n";
			G_INFO += " CBDEPT_CDVALUE : " + CBDEPT_CDVALUE + " \n";
			G_INFO += " RZCMB_MEKD1 : " + RZCMB_MEKD1 + " \n";
			G_INFO += " RZCMB_MEKD2 : " + RZCMB_MEKD2 + " \n";
			G_INFO += " RZCMB_CHGBN : " + RZCMB_CHGBN + " \n";
			G_INFO += " RZCMB_PLACE1_1 : " + RZCMB_PLACE1_1 + " \n";
			G_INFO += " RZCMB_PLACE1_2 : " + RZCMB_PLACE1_2 + " \n";
			G_INFO += " RZCMB_PLACE2_1 : " + RZCMB_PLACE2_1 + " \n";
			G_INFO += " RZCMB_PLACE2_2 : " + RZCMB_PLACE2_2 + " \n";
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
		<s:AttributeType name='D117' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D116' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D115' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D114' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D113' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D112' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D110' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D127' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D126' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D125' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D124' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D123' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D122' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D120' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D217' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D216' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D215' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D214' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D213' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D212' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D210' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D227' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D226' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D225' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D224' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D223' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D222' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='D220' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C117' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C116' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C115' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C114' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C113' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C112' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C110' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C127' rs:number='36' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C126' rs:number='37' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C125' rs:number='38' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C124' rs:number='39' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C123' rs:number='40' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C122' rs:number='41' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='C120' rs:number='42' rs:nullable='true'>
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

			String D117_T = cRsList.getString("D117");
			String D116_T = cRsList.getString("D116");
			String D115_T = cRsList.getString("D115");
			String D114_T = cRsList.getString("D114");
			String D113_T = cRsList.getString("D113");
			String D112_T = cRsList.getString("D112");
			String D110_T = cRsList.getString("D110");
			String D127_T = cRsList.getString("D127");
			String D126_T = cRsList.getString("D126");
			String D125_T = cRsList.getString("D125");
			String D124_T = cRsList.getString("D124");
			String D123_T = cRsList.getString("D123");
			String D122_T = cRsList.getString("D122");
			String D120_T = cRsList.getString("D120");
			String D217_T = cRsList.getString("D217");
			String D216_T = cRsList.getString("D216");
			String D215_T = cRsList.getString("D215");
			String D214_T = cRsList.getString("D214");
			String D213_T = cRsList.getString("D213");
			String D212_T = cRsList.getString("D212");
			String D210_T = cRsList.getString("D210");
			String D227_T = cRsList.getString("D227");
			String D226_T = cRsList.getString("D226");
			String D225_T = cRsList.getString("D225");
			String D224_T = cRsList.getString("D224");
			String D223_T = cRsList.getString("D223");
			String D222_T = cRsList.getString("D222");
			String D220_T = cRsList.getString("D220");
			String C117_T = cRsList.getString("C117");
			String C116_T = cRsList.getString("C116");
			String C115_T = cRsList.getString("C115");
			String C114_T = cRsList.getString("C114");
			String C113_T = cRsList.getString("C113");
			String C112_T = cRsList.getString("C112");
			String C110_T = cRsList.getString("C110");
			String C127_T = cRsList.getString("C127");
			String C126_T = cRsList.getString("C126");
			String C125_T = cRsList.getString("C125");
			String C124_T = cRsList.getString("C124");
			String C123_T = cRsList.getString("C123");
			String C122_T = cRsList.getString("C122");
			String C120_T = cRsList.getString("C120");
%>
			<z:row
<%
			if(! D117_T.equals("")) {
%>
		 		D117='<%= D117_T%>'
<%
			}

			if(! D116_T.equals("")) {
%>
		 		D116='<%= D116_T%>'
<%
			}

			if(! D115_T.equals("")) {
%>
		 		D115='<%= D115_T%>'
<%
			}

			if(! D114_T.equals("")) {
%>
		 		D114='<%= D114_T%>'
<%
			}

			if(! D113_T.equals("")) {
%>
		 		D113='<%= D113_T%>'
<%
			}

			if(! D112_T.equals("")) {
%>
		 		D112='<%= D112_T%>'
<%
			}

			if(! D110_T.equals("")) {
%>
		 		D110='<%= D110_T%>'
<%
			}

			if(! D127_T.equals("")) {
%>
		 		D127='<%= D127_T%>'
<%
			}

			if(! D126_T.equals("")) {
%>
		 		D126='<%= D126_T%>'
<%
			}

			if(! D125_T.equals("")) {
%>
		 		D125='<%= D125_T%>'
<%
			}

			if(! D124_T.equals("")) {
%>
		 		D124='<%= D124_T%>'
<%
			}

			if(! D123_T.equals("")) {
%>
		 		D123='<%= D123_T%>'
<%
			}

			if(! D122_T.equals("")) {
%>
		 		D122='<%= D122_T%>'
<%
			}

			if(! D120_T.equals("")) {
%>
		 		D120='<%= D120_T%>'
<%
			}

			if(! D217_T.equals("")) {
%>
		 		D217='<%= D217_T%>'
<%
			}

			if(! D216_T.equals("")) {
%>
		 		D216='<%= D216_T%>'
<%
			}

			if(! D215_T.equals("")) {
%>
		 		D215='<%= D215_T%>'
<%
			}

			if(! D214_T.equals("")) {
%>
		 		D214='<%= D214_T%>'
<%
			}

			if(! D213_T.equals("")) {
%>
		 		D213='<%= D213_T%>'
<%
			}

			if(! D212_T.equals("")) {
%>
		 		D212='<%= D212_T%>'
<%
			}

			if(! D210_T.equals("")) {
%>
		 		D210='<%= D210_T%>'
<%
			}

			if(! D227_T.equals("")) {
%>
		 		D227='<%= D227_T%>'
<%
			}

			if(! D226_T.equals("")) {
%>
		 		D226='<%= D226_T%>'
<%
			}

			if(! D225_T.equals("")) {
%>
		 		D225='<%= D225_T%>'
<%
			}

			if(! D224_T.equals("")) {
%>
		 		D224='<%= D224_T%>'
<%
			}

			if(! D223_T.equals("")) {
%>
		 		D223='<%= D223_T%>'
<%
			}

			if(! D222_T.equals("")) {
%>
		 		D222='<%= D222_T%>'
<%
			}

			if(! D220_T.equals("")) {
%>
		 		D220='<%= D220_T%>'
<%
			}

			if(! C117_T.equals("")) {
%>
		 		C117='<%= C117_T%>'
<%
			}

			if(! C116_T.equals("")) {
%>
		 		C116='<%= C116_T%>'
<%
			}

			if(! C115_T.equals("")) {
%>
		 		C115='<%= C115_T%>'
<%
			}

			if(! C114_T.equals("")) {
%>
		 		C114='<%= C114_T%>'
<%
			}

			if(! C113_T.equals("")) {
%>
		 		C113='<%= C113_T%>'
<%
			}

			if(! C112_T.equals("")) {
%>
		 		C112='<%= C112_T%>'
<%
			}

			if(! C110_T.equals("")) {
%>
		 		C110='<%= C110_T%>'
<%
			}

			if(! C127_T.equals("")) {
%>
		 		C127='<%= C127_T%>'
<%
			}

			if(! C126_T.equals("")) {
%>
		 		C126='<%= C126_T%>'
<%
			}

			if(! C125_T.equals("")) {
%>
		 		C125='<%= C125_T%>'
<%
			}

			if(! C124_T.equals("")) {
%>
		 		C124='<%= C124_T%>'
<%
			}

			if(! C123_T.equals("")) {
%>
		 		C123='<%= C123_T%>'
<%
			}

			if(! C122_T.equals("")) {
%>
		 		C122='<%= C122_T%>'
<%
			}

			if(! C120_T.equals("")) {
%>
		 		C120='<%= C120_T%>'
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
