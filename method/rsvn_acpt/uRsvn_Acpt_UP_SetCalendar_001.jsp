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

		String EXAM_DTS = htMethod.get("EXAM_DTS");
		String EXAM_DTE = htMethod.get("EXAM_DTE");
		String AM_YN = htMethod.get("AM_YN");
		String PM_YN = htMethod.get("PM_YN");

		//
		if(EXAM_DTS == null) { EXAM_DTS = ""; }
		if(EXAM_DTE == null) { EXAM_DTE = ""; }
		if(AM_YN == null) { AM_YN = ""; }
		if(PM_YN == null) { PM_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT RRL_EXAM_DT,   MAX(ECM_RSVT_TX) ECM_RSVT_TX,
       MAX(RRL_HOLI_CD) RRL_HOLI_CD, MAX(RRL_HOLI_NM) RRL_HOLI_NM,
       SUM(EQUIP_R00) R00, SUM(EQUIP_R01) R01, SUM(EQUIP_R02) R02,
       SUM(EQUIP_R03) R03, SUM(EQUIP_R04) R04, SUM(EQUIP_R05) R05,
       SUM(EQUIP_R06) R06, SUM(EQUIP_R07) R07, SUM(EQUIP_R08) R08,
       SUM(EQUIP_R09) R09, SUM(EQUIP_R10) R10, SUM(EQUIP_R11) R11,
       F_LPAD(CASE WHEN SUM(EQUIP_R00) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R00)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R01) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R01)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R02) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R02)) END, 3, ' ') || ' ' DIS_CNT1,
       F_LPAD(CASE WHEN SUM(EQUIP_R03) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R03)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R04) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R04)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R05) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R05)) END, 3, ' ') || ' ' DIS_CNT2,
       F_LPAD(CASE WHEN SUM(EQUIP_R06) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R06)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R07) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R07)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R08) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R08)) END, 3, ' ') || ' ' DIS_CNT3,
       F_LPAD(CASE WHEN SUM(EQUIP_R09) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R09)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R10) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R10)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R11) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R11)) END, 3, ' ') || ' ' DIS_CNT4,
       SUM(EQUIP_P00) P00, SUM(EQUIP_P01) P01, SUM(EQUIP_P02) P02,
       SUM(EQUIP_P03) P03, SUM(EQUIP_P04) P04, SUM(EQUIP_P05) P05,
       SUM(EQUIP_P06) P06, SUM(EQUIP_P07) P07, SUM(EQUIP_P08) P08,
       SUM(EQUIP_P09) P09, SUM(EQUIP_P10) P10, SUM(EQUIP_P11) P11,
       F_LPAD(CASE WHEN SUM(EQUIP_P00) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P00)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P01) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P01)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P02) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P02)) END, 3, ' ') || ' ' DIS_PCNT1,
       F_LPAD(CASE WHEN SUM(EQUIP_P03) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P03)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P04) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P04)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P05) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P05)) END, 3, ' ') || ' ' DIS_PCNT2,
       F_LPAD(CASE WHEN SUM(EQUIP_P06) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P06)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P07) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P07)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P08) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P08)) END, 3, ' ') || ' ' DIS_PCNT3,
       F_LPAD(CASE WHEN SUM(EQUIP_P09) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P09)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P10) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P10)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P11) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P11)) END, 3, ' ') || ' ' DIS_PCNT4
  FROM (SELECT RRL_EXAM_DT,
               CASE WHEN ECM_RSVT_TX = '' OR ECM_RSVT_TX IS NULL THEN 'X' ELSE '★메모' END ECM_RSVT_TX,
               CASE WHEN RRL_EQUI_CD = '00' THEN RRL_HOLI_CD ELSE '0' END RRL_HOLI_CD,
               CASE WHEN RRL_EQUI_CD = '00' THEN RRL_HOLI_NM ELSE ''  END RRL_HOLI_NM,
               CASE WHEN RRL_EQUI_CD = '00' AND RRE_USE_YN = 'Y' THEN NVL(RRL_TOT_CNT, 0) - NVL(RRL_RSVN_CNT,0) ELSE 0 END EQUIP_R00,
               CASE WHEN RRL_EQUI_CD = '01' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R01,
               CASE WHEN RRL_EQUI_CD = '02' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R02,
               CASE WHEN RRL_EQUI_CD = '03' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R03,
               CASE WHEN RRL_EQUI_CD = '04' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R04,
               CASE WHEN RRL_EQUI_CD = '05' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R05,
               CASE WHEN RRL_EQUI_CD = '06' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R06,
               CASE WHEN RRL_EQUI_CD = '07' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R07,
               CASE WHEN RRL_EQUI_CD = '08' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R08,
               CASE WHEN RRL_EQUI_CD = '09' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R09,
               CASE WHEN RRL_EQUI_CD = '10' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R10,
               CASE WHEN RRL_EQUI_CD = '11' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R11,
               CASE WHEN RRL_EQUI_CD = '00' AND RRE_USE_YN = 'Y' THEN NVL(RRL_RSVN_CNT,0) ELSE 0 END EQUIP_P00,
               CASE WHEN RRL_EQUI_CD = '01' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P01,
               CASE WHEN RRL_EQUI_CD = '02' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P02,
               CASE WHEN RRL_EQUI_CD = '03' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P03,
               CASE WHEN RRL_EQUI_CD = '04' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P04,
               CASE WHEN RRL_EQUI_CD = '05' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P05,
               CASE WHEN RRL_EQUI_CD = '06' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P06,
               CASE WHEN RRL_EQUI_CD = '07' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P07,
               CASE WHEN RRL_EQUI_CD = '08' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P08,
               CASE WHEN RRL_EQUI_CD = '09' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P09,
               CASE WHEN RRL_EQUI_CD = '10' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P10,
               CASE WHEN RRL_EQUI_CD = '11' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P11
          FROM RT_RSVT_EQUIP B, RT_RSVT_EQUIP_LIMIT C
               LEFT OUTER JOIN ET_CLDR_MEMO D
            ON D.ECM_MEMO_DT = C.RRL_EXAM_DT
           AND D.ECM_MEMO_SQ = 0
         WHERE RRL_EXAM_DT BETWEEN :EXAM_DTS AND :EXAM_DTE
           AND RRL_EQUI_CD = RRE_EQUI_CD

        IF (:AM_YN = 'Y') THEN
           AND NVL(RRL_TIME_CD, ' ') IN (' ', '1', '2')
        ELSE IF (:PM_YN = 'Y') THEN
           AND NVL(RRL_TIME_CD, ' ') IN (' ', '1', '3')

       ) A
 GROUP BY RRL_EXAM_DT
		*/

		sql = " SELECT RRL_EXAM_DT, MAX(ECM_RSVT_TX) ECM_RSVT_TX, MAX(RRL_HOLI_CD) RRL_HOLI_CD, MAX(RRL_HOLI_NM) RRL_HOLI_NM, SUM(EQUIP_R00) R00, SUM(EQUIP_R01) R01, SUM(EQUIP_R02) R02, SUM(EQUIP_R03) R03, SUM(EQUIP_R04) R04, SUM(EQUIP_R05) R05, SUM(EQUIP_R06) R06, SUM(EQUIP_R07) R07, SUM(EQUIP_R08) R08, SUM(EQUIP_R09) R09, SUM(EQUIP_R10) R10, SUM(EQUIP_R11) R11, F_LPAD(CASE WHEN SUM(EQUIP_R00) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R00)) END, 3, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R01) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R01)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R02) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R02)) END, 3, ' ') || ' ' DIS_CNT1, F_LPAD(CASE WHEN SUM(EQUIP_R03) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R03)) END, 3, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R04) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R04)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R05) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R05)) END, 3, ' ') || ' ' DIS_CNT2, F_LPAD(CASE WHEN SUM(EQUIP_R06) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R06)) END, 3, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R07) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R07)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R08) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R08)) END, 3, ' ') || ' ' DIS_CNT3, F_LPAD(CASE WHEN SUM(EQUIP_R09) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R09)) END, 3, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R10) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R10)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R11) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R11)) END, 3, ' ') || ' ' DIS_CNT4, F_LPAD(CASE WHEN SUM(EQUIP_R10) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R10)) END, 4, ' ') || ' | ' ||F_LPAD(CASE WHEN SUM(EQUIP_R11) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R11)) END, 3, ' ') || ' ' DIS_CNT4,SUM(EQUIP_P00) P00, SUM(EQUIP_P01) P01, SUM(EQUIP_P02) P02, SUM(EQUIP_P03) P03, SUM(EQUIP_P04) P04, SUM(EQUIP_P05) P05, SUM(EQUIP_P06) P06, SUM(EQUIP_P07) P07, SUM(EQUIP_P08) P08, SUM(EQUIP_P09) P09, SUM(EQUIP_P10) P10, SUM(EQUIP_P11) P11, F_LPAD(CASE WHEN SUM(EQUIP_P00) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P00)) END, 3, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_P01) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P01)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_P02) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P02)) END, 3, ' ') || ' ' DIS_PCNT1, F_LPAD(CASE WHEN SUM(EQUIP_P03) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P03)) END, 3, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_P04) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P04)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_P05) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P05)) END, 3, ' ') || ' ' DIS_PCNT2, F_LPAD(CASE WHEN SUM(EQUIP_P06) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P06)) END, 3, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_P07) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P07)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_P08) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P08)) END, 3, ' ') || ' ' DIS_PCNT3, F_LPAD(CASE WHEN SUM(EQUIP_P09) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P09)) END, 3, ' ') || ' | ' ||F_LPAD(CASE WHEN SUM(EQUIP_P10) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P10)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_P11) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P11)) END, 3, ' ') || ' ' DIS_PCNT4";
		sql += " FROM (SELECT RRL_EXAM_DT, CASE WHEN ECM_RSVT_TX = ''";
		sql += " OR ECM_RSVT_TX IS NULL THEN 'X' ELSE '★메모' END ECM_RSVT_TX, CASE WHEN RRL_EQUI_CD = '00' THEN RRL_HOLI_CD ELSE '0' END RRL_HOLI_CD, CASE WHEN RRL_EQUI_CD = '00' THEN RRL_HOLI_NM ELSE '' END RRL_HOLI_NM, CASE WHEN RRL_EQUI_CD = '00'";
		sql += " AND RRE_USE_YN = 'Y' THEN NVL(RRL_TOT_CNT, 0) - NVL(RRL_RSVN_CNT,0) ELSE 0 END EQUIP_R00, CASE WHEN RRL_EQUI_CD = '01'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R01, CASE WHEN RRL_EQUI_CD = '02'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R02, CASE WHEN RRL_EQUI_CD = '03'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R03, CASE WHEN RRL_EQUI_CD = '04'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R04, CASE WHEN RRL_EQUI_CD = '05'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R05, CASE WHEN RRL_EQUI_CD = '06'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R06, CASE WHEN RRL_EQUI_CD = '07'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R07, CASE WHEN RRL_EQUI_CD = '08'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R08, CASE WHEN RRL_EQUI_CD = '09'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R09, CASE WHEN RRL_EQUI_CD = '10'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R10, CASE WHEN RRL_EQUI_CD = '11'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R11, CASE WHEN RRL_EQUI_CD = '00'";
		sql += " AND RRE_USE_YN = 'Y' THEN NVL(RRL_RSVN_CNT,0) ELSE 0 END EQUIP_P00, CASE WHEN RRL_EQUI_CD = '01'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P01, CASE WHEN RRL_EQUI_CD = '02'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P02, CASE WHEN RRL_EQUI_CD = '03'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P03, CASE WHEN RRL_EQUI_CD = '04'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P04, CASE WHEN RRL_EQUI_CD = '05'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P05, CASE WHEN RRL_EQUI_CD = '06'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P06, CASE WHEN RRL_EQUI_CD = '07'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P07, CASE WHEN RRL_EQUI_CD = '08'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P07, CASE WHEN RRL_EQUI_CD = '09'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P09, CASE WHEN RRL_EQUI_CD = '10'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P07, CASE WHEN RRL_EQUI_CD = '08'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P10, CASE WHEN RRL_EQUI_CD = '11'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P11";
		sql += " FROM RT_RSVT_EQUIP B, RT_RSVT_EQUIP_LIMIT C LEFT OUTER JOIN ET_CLDR_MEMO D";
		sql += " ON D.ECM_MEMO_DT = C.RRL_EXAM_DT";
		sql += " AND D.ECM_MEMO_SQ = 0";
		sql += " WHERE RRL_EXAM_DT BETWEEN '" + EXAM_DTS + "'";
		sql += " AND '" + EXAM_DTE + "'";
		sql += " AND RRL_EQUI_CD = RRE_EQUI_CD";

		if(AM_YN.equals("Y")) {
			sql += " AND NVL(RRL_TIME_CD, ' ') IN (' ', '1', '2')";
		} else if(PM_YN.equals("Y")) {
			sql += " AND NVL(RRL_TIME_CD, ' ') IN (' ', '1', '3')";
		}

		sql += " ) A";

		sql += " GROUP BY RRL_EXAM_DT";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_UP_SetCalendar_001 \n";
			G_INFO += "설명 : 일별 예약장비 현황 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DTS : " + EXAM_DTS + " \n";
			G_INFO += " EXAM_DTE : " + EXAM_DTE + " \n";
			G_INFO += " AM_YN : " + AM_YN + " \n";
			G_INFO += " PM_YN : " + PM_YN + " \n";
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
