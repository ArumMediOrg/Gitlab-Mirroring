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

		String CHUNG_KD = htMethod.get("CHUNG_KD");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_SPYM = htMethod.get("MNGT_SPYM");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(CHUNG_KD == null) { CHUNG_KD = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_SPYM == null) { MNGT_SPYM = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT EEA_EXAM_DT, EEA_EXAM_SQ,
        MAX(M3)  M3, MAX(M4)  M4, MAX(M5)  M5 ,MAX(M6)  M6, MAX(M7) M7,
        MAX(M8)  M8, MAX(M9)  M9, MAX(M10) M10,MAX(M11) M11,MAX(M12) M12,MAX(M13) M13,
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
        MAX(M268) M268, MAX(M269) M269, MAX(M270) M270, MAX(M271) M271,
        MAX(M272) M272, MAX(M273) M273, MAX(M274) M274, MAX(M275) M275, MAX(M276) M276,
        MAX(M758) M758, MAX(M760) M760, MAX(M761) M761,
        MAX(M277) M277, MAX(M278) M278, MAX(M279) M279, MAX(M280) M280, MAX(M281) M281,
        MAX(M282) M282, MAX(M283) M283, MAX(M284) M284, MAX(M285) M285, MAX(M286) M286,
        MAX(M287) M287, MAX(M288) M288, MAX(M289) M289, MAX(M290) M290, MAX(M291) M291,
        MAX(M292) M292, MAX(M293) M293, MAX(M294) M294, MAX(M295) M295, MAX(M296) M296,
        MAX(M297) M297, MAX(M298) M298, MAX(M299) M299, MAX(M300) M300, MAX(M301) M301,
        MAX(M302) M302, MAX(M303) M303, MAX(M304) M304, MAX(M305) M305, MAX(M306) M306,
        MAX(M307) M307, MAX(M308) M308, MAX(M309) M309, MAX(M312) M312, MAX(M315) M315
 FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ,
          case when QQN_QSTN_CD='3'  then    QQN_RESULT end M3,
          case when QQN_QSTN_CD='4'  then    QQN_RESULT end M4,
          case when QQN_QSTN_CD='5'  then    QQN_RESULT end M5,
          case when QQN_QSTN_CD='6'  then    QQN_RESULT end M6,
          case when QQN_QSTN_CD='7'  then    QQN_RESULT end M7,
          case when QQN_QSTN_CD='8'  then    QQN_RESULT end M8,
          case when QQN_QSTN_CD='9'  then    QQN_RESULT end M9,
          case when QQN_QSTN_CD='10' then    QQN_RESULT end M10,
          case when QQN_QSTN_CD='11' then    QQN_RESULT end M11,
          case when QQN_QSTN_CD='12' then    QQN_RESULT end M12,
          case when QQN_QSTN_CD='13' then    QQN_RESULT end M13,
          case when QQN_QSTN_CD='14' then    QQN_RESULT end M14,
          case when QQN_QSTN_CD='15' then    QQN_RESULT end M15,
          case when QQN_QSTN_CD='16' then    QQN_RESULT end M16,
          case when QQN_QSTN_CD='17' then    QQN_RESULT end M17,
          case when QQN_QSTN_CD='18' then    QQN_RESULT end M18,
          case when QQN_QSTN_CD='19' then    QQN_RESULT end M19,
          case when QQN_QSTN_CD='20' then    QQN_RESULT end M20,
          case when QQN_QSTN_CD='21' then    QQN_RESULT end M21,
          case when QQN_QSTN_CD='22' then    QQN_RESULT end M22,
          case when QQN_QSTN_CD='23' then    QQN_RESULT end M23,
          case when QQN_QSTN_CD='983' then   QQN_RESULT end M983,
          case when QQN_QSTN_CD='27'  then   QQN_RESULT end M27,
          case when QQN_QSTN_CD='28'  then   QQN_RESULT end M28,
          case when QQN_QSTN_CD='25'  then   QQN_RESULT end M25,
          case when QQN_QSTN_CD='26'  then   QQN_RESULT end M26,
          case when QQN_QSTN_CD='976' then   QQN_RESULT end M976,
          case when QQN_QSTN_CD='977' then   QQN_RESULT end M977,
          case when QQN_QSTN_CD='981' then   QQN_RESULT end M981,
          case when QQN_QSTN_CD='982' then   QQN_RESULT end M982,
          case when QQN_QSTN_CD='978' then   QQN_RESULT end M978,
          case when QQN_QSTN_CD='979' then   QQN_RESULT end M979,
          case when QQN_QSTN_CD='980' then   QQN_RESULT end M980,
          case when QQN_QSTN_CD='873' then    QQN_RESULT end M873,
          case when QQN_QSTN_CD='865' then    QQN_RESULT end M865,
          case when QQN_QSTN_CD='867' then    QQN_RESULT end M867,
          case when QQN_QSTN_CD='868' then    QQN_RESULT end M868,
          case when QQN_QSTN_CD='869' then    QQN_RESULT end M869,
          case when QQN_QSTN_CD='870' then    QQN_RESULT end M870,
          case when QQN_QSTN_CD='871' then    QQN_RESULT end M871,
          case when QQN_QSTN_CD='874' then    QQN_RESULT end M874,
          case when QQN_QSTN_CD='872' then    QQN_RESULT end M872,
          case when QQN_QSTN_CD='875' then    QQN_RESULT end M875,
          case when QQN_QSTN_CD='876' then    QQN_RESULT end M876,
          case when QQN_QSTN_CD='877' then    QQN_RESULT end M877,
          case when QQN_QSTN_CD='878' then    QQN_RESULT end M878,
          case when QQN_QSTN_CD='879' then    QQN_RESULT end M879,
          case when QQN_QSTN_CD='880' then    QQN_RESULT end M880,
          case when QQN_QSTN_CD='881' then    QQN_RESULT end M881,
          case when QQN_QSTN_CD='882' then    QQN_RESULT end M882,
          case when QQN_QSTN_CD='883' then    QQN_RESULT end M883,
          case when QQN_QSTN_CD='884' then    QQN_RESULT end M884,
          case when QQN_QSTN_CD='885' then    QQN_RESULT end M885,
          case when QQN_QSTN_CD='887' then    QQN_RESULT end M887,
          case when QQN_QSTN_CD='888' then    QQN_RESULT end M888,
          case when QQN_QSTN_CD='889' then    QQN_RESULT end M889,
          case when QQN_QSTN_CD='890' then    QQN_RESULT end M890,
          case when QQN_QSTN_CD='891' then    QQN_RESULT end M891,
          case when QQN_QSTN_CD='892' then    QQN_RESULT end M892,
          case when QQN_QSTN_CD='893' then    QQN_RESULT end M893,
          case when QQN_QSTN_CD='894' then    QQN_RESULT end M894,
          case when QQN_QSTN_CD='895' then    QQN_RESULT end M895,
          case when QQN_QSTN_CD='896' then    QQN_RESULT end M896,
          case when QQN_QSTN_CD='897' then    QQN_RESULT end M897,
          case when QQN_QSTN_CD='898' then    QQN_RESULT end M898,
          case when QQN_QSTN_CD='899' then    QQN_RESULT end M899,
          case when QQN_QSTN_CD='900' then    QQN_RESULT end M900,
          case when QQN_QSTN_CD='902' then    QQN_RESULT end M902,
          case when QQN_QSTN_CD='901' then    QQN_RESULT end M901,
          case when QQN_QSTN_CD='903' then    QQN_RESULT end M903,
          case when QQN_QSTN_CD='904' then    QQN_RESULT end M904,
          case when QQN_QSTN_CD='905' then    QQN_RESULT end M905,
          case when QQN_QSTN_CD='906' then    QQN_RESULT end M906,
          case when QQN_QSTN_CD='908' then    QQN_RESULT end M908,
          case when QQN_QSTN_CD='909' then    QQN_RESULT end M909,
          case when QQN_QSTN_CD='910' then    QQN_RESULT end M910,
          case when QQN_QSTN_CD='911' then    QQN_RESULT end M911,
          case when QQN_QSTN_CD='912' then    QQN_RESULT end M912,
          case when QQN_QSTN_CD='914' then    QQN_RESULT end M914,
          case when QQN_QSTN_CD='915' then    QQN_RESULT end M915,
          case when QQN_QSTN_CD='916' then    QQN_RESULT end M916,
          case when QQN_QSTN_CD='918' then    QQN_RESULT end M918,
          case when QQN_QSTN_CD='919' then    QQN_RESULT end M919,
          case when QQN_QSTN_CD='920' then    QQN_RESULT end M920,
          CASE WHEN QQN_QSTN_CD='268' THEN QQN_RESULT END M268,
          CASE WHEN QQN_QSTN_CD='269' THEN QQN_RESULT END M269,
          CASE WHEN QQN_QSTN_CD='270' THEN QQN_RESULT END M270,
          CASE WHEN QQN_QSTN_CD='271' THEN QQN_RESULT END M271,
          CASE WHEN QQN_QSTN_CD='272' THEN QQN_RESULT END M272,
          CASE WHEN QQN_QSTN_CD='273' THEN QQN_RESULT END M273,
          CASE WHEN QQN_QSTN_CD='274' THEN QQN_RESULT END M274,
          CASE WHEN QQN_QSTN_CD='275' THEN QQN_RESULT END M275,
          CASE WHEN QQN_QSTN_CD='276' THEN QQN_RESULT END M276,
          CASE WHEN QQN_QSTN_CD='277' THEN QQN_RESULT END M277,
          CASE WHEN QQN_QSTN_CD='278' THEN QQN_RESULT END M278,
          CASE WHEN QQN_QSTN_CD='279' THEN QQN_RESULT END M279,
          CASE WHEN QQN_QSTN_CD='758' THEN QQN_RESULT END M758,
          CASE WHEN QQN_QSTN_CD='760' THEN QQN_RESULT END M760,
          CASE WHEN QQN_QSTN_CD='761' THEN QQN_RESULT END M761,
          CASE WHEN QQN_QSTN_CD='280' THEN QQN_RESULT END M280,
          CASE WHEN QQN_QSTN_CD='281' THEN QQN_RESULT END M281,
          CASE WHEN QQN_QSTN_CD='282' THEN QQN_RESULT END M282,
          CASE WHEN QQN_QSTN_CD='283' THEN QQN_RESULT END M283,
          CASE WHEN QQN_QSTN_CD='284' THEN QQN_RESULT END M284,
          CASE WHEN QQN_QSTN_CD='285' THEN QQN_RESULT END M285,
          CASE WHEN QQN_QSTN_CD='286' THEN QQN_RESULT END M286,
          CASE WHEN QQN_QSTN_CD='287' THEN QQN_RESULT END M287,
          CASE WHEN QQN_QSTN_CD='288' THEN QQN_RESULT END M288,
          CASE WHEN QQN_QSTN_CD='289' THEN QQN_RESULT END M289,
          CASE WHEN QQN_QSTN_CD='290' THEN QQN_RESULT END M290,
          CASE WHEN QQN_QSTN_CD='291' THEN QQN_RESULT END M291,
          CASE WHEN QQN_QSTN_CD='292' THEN QQN_RESULT END M292,
          CASE WHEN QQN_QSTN_CD='293' THEN QQN_RESULT END M293,
          CASE WHEN QQN_QSTN_CD='294' THEN QQN_RESULT END M294,
          CASE WHEN QQN_QSTN_CD='295' THEN QQN_RESULT END M295,
          CASE WHEN QQN_QSTN_CD='296' THEN QQN_RESULT END M296,
          CASE WHEN QQN_QSTN_CD='297' THEN QQN_RESULT END M297,
          CASE WHEN QQN_QSTN_CD='298' THEN QQN_RESULT END M298,
          CASE WHEN QQN_QSTN_CD='299' THEN QQN_RESULT END M299,
          CASE WHEN QQN_QSTN_CD='300' THEN QQN_RESULT END M300,
          CASE WHEN QQN_QSTN_CD='301' THEN QQN_RESULT END M301,
          CASE WHEN QQN_QSTN_CD='302' THEN QQN_RESULT END M302,
          CASE WHEN QQN_QSTN_CD='303' THEN QQN_RESULT END M303,
          CASE WHEN QQN_QSTN_CD='304' THEN QQN_RESULT END M304,
          CASE WHEN QQN_QSTN_CD='305' THEN QQN_RESULT END M305,
          CASE WHEN QQN_QSTN_CD='306' THEN QQN_RESULT END M306,
          CASE WHEN QQN_QSTN_CD='307' THEN QQN_RESULT END M307,
          CASE WHEN QQN_QSTN_CD='308' THEN QQN_RESULT END M308,
          CASE WHEN QQN_QSTN_CD='309' THEN QQN_RESULT END M309,
          CASE WHEN QQN_QSTN_CD='312' THEN QQN_RESULT END M312,
          CASE WHEN QQN_QSTN_CD='315' THEN QQN_RESULT END M315
      FROM ET_EXAM_ACPT A LEFT OUTER JOIN QT_QUESTION B  ON A.EEA_EXAM_DT =B.QQN_EXAM_DT AND A.EEA_EXAM_SQ =B.QQN_EXAM_SQ
                      LEFT OUTER JOIN ST_BILLHN_PR D ON A.EEA_EXAM_DT=D.SBP_EXAM_DT AND A.EEA_EXAM_SQ=D.SBP_EXAM_SQ  AND SBP_CHUNG_KD = :CHUNG_KD
                      LEFT OUTER JOIN ST_BASE E      ON E.SBE_EXAM_DT=A.EEA_EXAM_DT AND E.SBE_EXAM_SQ=A.EEA_EXAM_SQ
                      LEFT OUTER JOIN IT_COMPANY I   ON A.EEA_COMP_CD=I.ICY_COMP_CD
      WHERE 0=0
        AND A.EEA_COMP_CD= :COMP_CD  AND (A.EEA_EXAM_CD  IN ('41001','42001') OR  A.EEA_SPSB_CD IN ('41001','42001'))
        AND A.EEA_MNGT_SPYM  LIKE :MNGT_SPYM||'%'  AND SBE_PANJ_YN='Y' AND SBE_EXAM_CHA='1'
        ||:sSQL_ADD
     ) F1
GROUP BY  EEA_EXAM_DT, EEA_EXAM_SQ





		*/

		sql = " SELECT EEA_EXAM_DT, EEA_EXAM_SQ, MAX(M3) M3, MAX(M4) M4, MAX(M5) M5 ,MAX(M6) M6, MAX(M7) M7, MAX(M8) M8, MAX(M9) M9, MAX(M10) M10,MAX(M11) M11,MAX(M12) M12,MAX(M13) M13, MAX(M14) M14,MAX(M15) M15,MAX(M16) M16,MAX(M17) M17,MAX(M18) M18,MAX(M19) M19, MAX(M20) M20,MAX(M21) M21,MAX(M22) M22,MAX(M23) M23,MAX(M983) M983,MAX(M25) M25, MAX(M26) M26,MAX(M27) M27,MAX(M28) M28,MAX(M976) M976, MAX(M977) M977, MAX(M978) M978, MAX(M979) M979, MAX(M980) M980, MAX(M981) M981, MAX(M982) M982, MAX(M873) M873, MAX(M865) M865, MAX(M867) M867, MAX(M868) M868, MAX(M869) M869, MAX(M870) M870, MAX(M871) M871, MAX(M874) M874, MAX(M872) M872, MAX(M875) M875, MAX(M876) M876, MAX(M877) M877, MAX(M878) M878, MAX(M879) M879, MAX(M880) M880, MAX(M881) M881, MAX(M882) M882, MAX(M883) M883, MAX(M884) M884, MAX(M885) M885, MAX(M887) M887, MAX(M888) M888, MAX(M889) M889, MAX(M890) M890, MAX(M891) M891, MAX(M892) M892, MAX(M893) M893, MAX(M894) M894, MAX(M895) M895, MAX(M896) M896, MAX(M897) M897, MAX(M898) M898, MAX(M899) M899, MAX(M900) M900, MAX(M902) M902, MAX(M901) M901, MAX(M903) M903, MAX(M904) M904, MAX(M905) M905, MAX(M906) M906, MAX(M908) M908, MAX(M909) M909, MAX(M910) M910, MAX(M911) M911, MAX(M912) M912, MAX(M914) M914, MAX(M915) M915, MAX(M916) M916, MAX(M918) M918, MAX(M919) M919, MAX(M920) M920, MAX(M268) M268, MAX(M269) M269, MAX(M270) M270, MAX(M271) M271, MAX(M272) M272, MAX(M273) M273, MAX(M274) M274, MAX(M275) M275, MAX(M276) M276, MAX(M758) M758, MAX(M760) M760, MAX(M761) M761, MAX(M277) M277, MAX(M278) M278, MAX(M279) M279, MAX(M280) M280, MAX(M281) M281, MAX(M282) M282, MAX(M283) M283, MAX(M284) M284, MAX(M285) M285, MAX(M286) M286, MAX(M287) M287, MAX(M288) M288, MAX(M289) M289, MAX(M290) M290, MAX(M291) M291, MAX(M292) M292, MAX(M293) M293, MAX(M294) M294, MAX(M295) M295, MAX(M296) M296, MAX(M297) M297, MAX(M298) M298, MAX(M299) M299, MAX(M300) M300, MAX(M301) M301, MAX(M302) M302, MAX(M303) M303, MAX(M304) M304, MAX(M305) M305, MAX(M306) M306, MAX(M307) M307, MAX(M308) M308, MAX(M309) M309, MAX(M312) M312, MAX(M315) M315";
		sql += " FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, CASE WHEN QQN_QSTN_CD='3' THEN QQN_RESULT END M3, CASE WHEN QQN_QSTN_CD='4' THEN QQN_RESULT END M4, CASE WHEN QQN_QSTN_CD='5' THEN QQN_RESULT END M5, CASE WHEN QQN_QSTN_CD='6' THEN QQN_RESULT END M6, CASE WHEN QQN_QSTN_CD='7' THEN QQN_RESULT END M7, CASE WHEN QQN_QSTN_CD='8' THEN QQN_RESULT END M8, CASE WHEN QQN_QSTN_CD='9' THEN QQN_RESULT END M9, CASE WHEN QQN_QSTN_CD='10' THEN QQN_RESULT END M10, CASE WHEN QQN_QSTN_CD='11' THEN QQN_RESULT END M11, CASE WHEN QQN_QSTN_CD='12' THEN QQN_RESULT END M12, CASE WHEN QQN_QSTN_CD='13' THEN QQN_RESULT END M13, CASE WHEN QQN_QSTN_CD='14' THEN QQN_RESULT END M14, CASE WHEN QQN_QSTN_CD='15' THEN QQN_RESULT END M15, CASE WHEN QQN_QSTN_CD='16' THEN QQN_RESULT END M16, CASE WHEN QQN_QSTN_CD='17' THEN QQN_RESULT END M17, CASE WHEN QQN_QSTN_CD='18' THEN QQN_RESULT END M18, CASE WHEN QQN_QSTN_CD='19' THEN QQN_RESULT END M19, CASE WHEN QQN_QSTN_CD='20' THEN QQN_RESULT END M20, CASE WHEN QQN_QSTN_CD='21' THEN QQN_RESULT END M21, CASE WHEN QQN_QSTN_CD='22' THEN QQN_RESULT END M22, CASE WHEN QQN_QSTN_CD='23' THEN QQN_RESULT END M23, CASE WHEN QQN_QSTN_CD='983' THEN QQN_RESULT END M983, CASE WHEN QQN_QSTN_CD='27' THEN QQN_RESULT END M27, CASE WHEN QQN_QSTN_CD='28' THEN QQN_RESULT END M28, CASE WHEN QQN_QSTN_CD='25' THEN QQN_RESULT END M25, CASE WHEN QQN_QSTN_CD='26' THEN QQN_RESULT END M26, CASE WHEN QQN_QSTN_CD='976' THEN QQN_RESULT END M976, CASE WHEN QQN_QSTN_CD='977' THEN QQN_RESULT END M977, CASE WHEN QQN_QSTN_CD='981' THEN QQN_RESULT END M981, CASE WHEN QQN_QSTN_CD='982' THEN QQN_RESULT END M982, CASE WHEN QQN_QSTN_CD='978' THEN QQN_RESULT END M978, CASE WHEN QQN_QSTN_CD='979' THEN QQN_RESULT END M979, CASE WHEN QQN_QSTN_CD='980' THEN QQN_RESULT END M980, CASE WHEN QQN_QSTN_CD='873' THEN QQN_RESULT END M873, CASE WHEN QQN_QSTN_CD='865' THEN QQN_RESULT END M865, CASE WHEN QQN_QSTN_CD='867' THEN QQN_RESULT END M867, CASE WHEN QQN_QSTN_CD='868' THEN QQN_RESULT END M868, CASE WHEN QQN_QSTN_CD='869' THEN QQN_RESULT END M869, CASE WHEN QQN_QSTN_CD='870' THEN QQN_RESULT END M870, CASE WHEN QQN_QSTN_CD='871' THEN QQN_RESULT END M871, CASE WHEN QQN_QSTN_CD='874' THEN QQN_RESULT END M874, CASE WHEN QQN_QSTN_CD='872' THEN QQN_RESULT END M872, CASE WHEN QQN_QSTN_CD='875' THEN QQN_RESULT END M875, CASE WHEN QQN_QSTN_CD='876' THEN QQN_RESULT END M876, CASE WHEN QQN_QSTN_CD='877' THEN QQN_RESULT END M877, CASE WHEN QQN_QSTN_CD='878' THEN QQN_RESULT END M878, CASE WHEN QQN_QSTN_CD='879' THEN QQN_RESULT END M879, CASE WHEN QQN_QSTN_CD='880' THEN QQN_RESULT END M880, CASE WHEN QQN_QSTN_CD='881' THEN QQN_RESULT END M881, CASE WHEN QQN_QSTN_CD='882' THEN QQN_RESULT END M882, CASE WHEN QQN_QSTN_CD='883' THEN QQN_RESULT END M883, CASE WHEN QQN_QSTN_CD='884' THEN QQN_RESULT END M884, CASE WHEN QQN_QSTN_CD='885' THEN QQN_RESULT END M885, CASE WHEN QQN_QSTN_CD='887' THEN QQN_RESULT END M887, CASE WHEN QQN_QSTN_CD='888' THEN QQN_RESULT END M888, CASE WHEN QQN_QSTN_CD='889' THEN QQN_RESULT END M889, CASE WHEN QQN_QSTN_CD='890' THEN QQN_RESULT END M890, CASE WHEN QQN_QSTN_CD='891' THEN QQN_RESULT END M891, CASE WHEN QQN_QSTN_CD='892' THEN QQN_RESULT END M892, CASE WHEN QQN_QSTN_CD='893' THEN QQN_RESULT END M893, CASE WHEN QQN_QSTN_CD='894' THEN QQN_RESULT END M894, CASE WHEN QQN_QSTN_CD='895' THEN QQN_RESULT END M895, CASE WHEN QQN_QSTN_CD='896' THEN QQN_RESULT END M896, CASE WHEN QQN_QSTN_CD='897' THEN QQN_RESULT END M897, CASE WHEN QQN_QSTN_CD='898' THEN QQN_RESULT END M898, CASE WHEN QQN_QSTN_CD='899' THEN QQN_RESULT END M899, CASE WHEN QQN_QSTN_CD='900' THEN QQN_RESULT END M900, CASE WHEN QQN_QSTN_CD='902' THEN QQN_RESULT END M902, CASE WHEN QQN_QSTN_CD='901' THEN QQN_RESULT END M901, CASE WHEN QQN_QSTN_CD='903' THEN QQN_RESULT END M903, CASE WHEN QQN_QSTN_CD='904' THEN QQN_RESULT END M904, CASE WHEN QQN_QSTN_CD='905' THEN QQN_RESULT END M905, CASE WHEN QQN_QSTN_CD='906' THEN QQN_RESULT END M906, CASE WHEN QQN_QSTN_CD='908' THEN QQN_RESULT END M908, CASE WHEN QQN_QSTN_CD='909' THEN QQN_RESULT END M909, CASE WHEN QQN_QSTN_CD='910' THEN QQN_RESULT END M910, CASE WHEN QQN_QSTN_CD='911' THEN QQN_RESULT END M911, CASE WHEN QQN_QSTN_CD='912' THEN QQN_RESULT END M912, CASE WHEN QQN_QSTN_CD='914' THEN QQN_RESULT END M914, CASE WHEN QQN_QSTN_CD='915' THEN QQN_RESULT END M915, CASE WHEN QQN_QSTN_CD='916' THEN QQN_RESULT END M916, CASE WHEN QQN_QSTN_CD='918' THEN QQN_RESULT END M918, CASE WHEN QQN_QSTN_CD='919' THEN QQN_RESULT END M919, CASE WHEN QQN_QSTN_CD='920' THEN QQN_RESULT END M920, CASE WHEN QQN_QSTN_CD='268' THEN QQN_RESULT END M268, CASE WHEN QQN_QSTN_CD='269' THEN QQN_RESULT END M269, CASE WHEN QQN_QSTN_CD='270' THEN QQN_RESULT END M270, CASE WHEN QQN_QSTN_CD='271' THEN QQN_RESULT END M271, CASE WHEN QQN_QSTN_CD='272' THEN QQN_RESULT END M272, CASE WHEN QQN_QSTN_CD='273' THEN QQN_RESULT END M273, CASE WHEN QQN_QSTN_CD='274' THEN QQN_RESULT END M274, CASE WHEN QQN_QSTN_CD='275' THEN QQN_RESULT END M275, CASE WHEN QQN_QSTN_CD='276' THEN QQN_RESULT END M276, CASE WHEN QQN_QSTN_CD='277' THEN QQN_RESULT END M277, CASE WHEN QQN_QSTN_CD='278' THEN QQN_RESULT END M278, CASE WHEN QQN_QSTN_CD='279' THEN QQN_RESULT END M279, CASE WHEN QQN_QSTN_CD='758' THEN QQN_RESULT END M758, CASE WHEN QQN_QSTN_CD='760' THEN QQN_RESULT END M760, CASE WHEN QQN_QSTN_CD='761' THEN QQN_RESULT END M761, CASE WHEN QQN_QSTN_CD='280' THEN QQN_RESULT END M280, CASE WHEN QQN_QSTN_CD='281' THEN QQN_RESULT END M281, CASE WHEN QQN_QSTN_CD='282' THEN QQN_RESULT END M282, CASE WHEN QQN_QSTN_CD='283' THEN QQN_RESULT END M283, CASE WHEN QQN_QSTN_CD='284' THEN QQN_RESULT END M284, CASE WHEN QQN_QSTN_CD='285' THEN QQN_RESULT END M285, CASE WHEN QQN_QSTN_CD='286' THEN QQN_RESULT END M286, CASE WHEN QQN_QSTN_CD='287' THEN QQN_RESULT END M287, CASE WHEN QQN_QSTN_CD='288' THEN QQN_RESULT END M288, CASE WHEN QQN_QSTN_CD='289' THEN QQN_RESULT END M289, CASE WHEN QQN_QSTN_CD='290' THEN QQN_RESULT END M290, CASE WHEN QQN_QSTN_CD='291' THEN QQN_RESULT END M291, CASE WHEN QQN_QSTN_CD='292' THEN QQN_RESULT END M292, CASE WHEN QQN_QSTN_CD='293' THEN QQN_RESULT END M293, CASE WHEN QQN_QSTN_CD='294' THEN QQN_RESULT END M294, CASE WHEN QQN_QSTN_CD='295' THEN QQN_RESULT END M295, CASE WHEN QQN_QSTN_CD='296' THEN QQN_RESULT END M296, CASE WHEN QQN_QSTN_CD='297' THEN QQN_RESULT END M297, CASE WHEN QQN_QSTN_CD='298' THEN QQN_RESULT END M298, CASE WHEN QQN_QSTN_CD='299' THEN QQN_RESULT END M299, CASE WHEN QQN_QSTN_CD='300' THEN QQN_RESULT END M300, CASE WHEN QQN_QSTN_CD='301' THEN QQN_RESULT END M301, CASE WHEN QQN_QSTN_CD='302' THEN QQN_RESULT END M302, CASE WHEN QQN_QSTN_CD='303' THEN QQN_RESULT END M303, CASE WHEN QQN_QSTN_CD='304' THEN QQN_RESULT END M304, CASE WHEN QQN_QSTN_CD='305' THEN QQN_RESULT END M305, CASE WHEN QQN_QSTN_CD='306' THEN QQN_RESULT END M306, CASE WHEN QQN_QSTN_CD='307' THEN QQN_RESULT END M307, CASE WHEN QQN_QSTN_CD='308' THEN QQN_RESULT END M308, CASE WHEN QQN_QSTN_CD='309' THEN QQN_RESULT END M309, CASE WHEN QQN_QSTN_CD='312' THEN QQN_RESULT END M312, CASE WHEN QQN_QSTN_CD='315' THEN QQN_RESULT END M315";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN QT_QUESTION B";
		sql += " ON A.EEA_EXAM_DT =B.QQN_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ =B.QQN_EXAM_SQ LEFT OUTER JOIN ST_BILLHN_PR D";
		sql += " ON A.EEA_EXAM_DT=D.SBP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=D.SBP_EXAM_SQ";
		sql += " AND SBP_CHUNG_KD = '" + CHUNG_KD + "' LEFT OUTER JOIN ST_BASE E";
		sql += " ON E.SBE_EXAM_DT=A.EEA_EXAM_DT";
		sql += " AND E.SBE_EXAM_SQ=A.EEA_EXAM_SQ LEFT OUTER JOIN IT_COMPANY I";
		sql += " ON A.EEA_COMP_CD=I.ICY_COMP_CD";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_COMP_CD= '" + COMP_CD + "'";
		sql += " AND (A.EEA_EXAM_CD IN ('41001','42001')";
		sql += " OR A.EEA_SPSB_CD IN ('41001','42001'))";
		sql += " AND A.EEA_MNGT_SPYM LIKE '" + MNGT_SPYM + "'||'%'";
		sql += " AND SBE_PANJ_YN='Y'";
		sql += " AND SBE_EXAM_CHA='1'";
		sql += SSQL_ADD;
		sql += " ) F1";
		sql += " GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : Uspchungfile2020_UDP_MUNJIN_20190201_001 \n";
			G_INFO += "설명 : 특검청구 문진 조회(20190221 이 후) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHUNG_KD : " + CHUNG_KD + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_SPYM : " + MNGT_SPYM + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
		<s:AttributeType name='M3' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M4' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M5' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M6' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M7' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M8' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M9' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M10' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M11' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M12' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M13' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M14' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M15' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M16' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M17' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M18' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M19' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M20' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M21' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M22' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M23' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M983' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M25' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M26' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M27' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M28' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M976' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M977' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M978' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M979' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M980' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M981' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M982' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M873' rs:number='36' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M865' rs:number='37' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M867' rs:number='38' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M868' rs:number='39' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M869' rs:number='40' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M870' rs:number='41' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M871' rs:number='42' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M874' rs:number='43' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M872' rs:number='44' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M875' rs:number='45' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M876' rs:number='46' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M877' rs:number='47' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M878' rs:number='48' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M879' rs:number='49' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M880' rs:number='50' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M881' rs:number='51' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M882' rs:number='52' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M883' rs:number='53' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M884' rs:number='54' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M885' rs:number='55' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M887' rs:number='56' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M888' rs:number='57' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M889' rs:number='58' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M890' rs:number='59' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M891' rs:number='60' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M892' rs:number='61' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M893' rs:number='62' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M894' rs:number='63' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M895' rs:number='64' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M896' rs:number='65' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M897' rs:number='66' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M898' rs:number='67' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M899' rs:number='68' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M900' rs:number='69' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M902' rs:number='70' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M901' rs:number='71' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M903' rs:number='72' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M904' rs:number='73' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M905' rs:number='74' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M906' rs:number='75' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M908' rs:number='76' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M909' rs:number='77' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M910' rs:number='78' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M911' rs:number='79' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M912' rs:number='80' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M914' rs:number='81' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M915' rs:number='82' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M916' rs:number='83' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M918' rs:number='84' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M919' rs:number='85' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M920' rs:number='86' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M268' rs:number='87' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M269' rs:number='88' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M270' rs:number='89' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M271' rs:number='90' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M272' rs:number='91' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M273' rs:number='92' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M274' rs:number='93' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M275' rs:number='94' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M276' rs:number='95' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M758' rs:number='96' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M760' rs:number='97' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M761' rs:number='98' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M277' rs:number='99' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M278' rs:number='100' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M279' rs:number='101' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M280' rs:number='102' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M281' rs:number='103' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M282' rs:number='104' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M283' rs:number='105' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M284' rs:number='106' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M285' rs:number='107' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M286' rs:number='108' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M287' rs:number='109' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M288' rs:number='110' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M289' rs:number='111' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M290' rs:number='112' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M291' rs:number='113' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M292' rs:number='114' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M293' rs:number='115' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M294' rs:number='116' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M295' rs:number='117' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M296' rs:number='118' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M297' rs:number='119' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M298' rs:number='120' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M299' rs:number='121' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M300' rs:number='122' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M301' rs:number='123' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M302' rs:number='124' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M303' rs:number='125' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M304' rs:number='126' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M305' rs:number='127' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M306' rs:number='128' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M307' rs:number='129' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M308' rs:number='130' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M309' rs:number='131' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M312' rs:number='132' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M315' rs:number='133' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String M3_T = cRsList.getString("M3");
			String M4_T = cRsList.getString("M4");
			String M5_T = cRsList.getString("M5");
			String M6_T = cRsList.getString("M6");
			String M7_T = cRsList.getString("M7");
			String M8_T = cRsList.getString("M8");
			String M9_T = cRsList.getString("M9");
			String M10_T = cRsList.getString("M10");
			String M11_T = cRsList.getString("M11");
			String M12_T = cRsList.getString("M12");
			String M13_T = cRsList.getString("M13");
			String M14_T = cRsList.getString("M14");
			String M15_T = cRsList.getString("M15");
			String M16_T = cRsList.getString("M16");
			String M17_T = cRsList.getString("M17");
			String M18_T = cRsList.getString("M18");
			String M19_T = cRsList.getString("M19");
			String M20_T = cRsList.getString("M20");
			String M21_T = cRsList.getString("M21");
			String M22_T = cRsList.getString("M22");
			String M23_T = cRsList.getString("M23");
			String M983_T = cRsList.getString("M983");
			String M25_T = cRsList.getString("M25");
			String M26_T = cRsList.getString("M26");
			String M27_T = cRsList.getString("M27");
			String M28_T = cRsList.getString("M28");
			String M976_T = cRsList.getString("M976");
			String M977_T = cRsList.getString("M977");
			String M978_T = cRsList.getString("M978");
			String M979_T = cRsList.getString("M979");
			String M980_T = cRsList.getString("M980");
			String M981_T = cRsList.getString("M981");
			String M982_T = cRsList.getString("M982");
			String M873_T = cRsList.getString("M873");
			String M865_T = cRsList.getString("M865");
			String M867_T = cRsList.getString("M867");
			String M868_T = cRsList.getString("M868");
			String M869_T = cRsList.getString("M869");
			String M870_T = cRsList.getString("M870");
			String M871_T = cRsList.getString("M871");
			String M874_T = cRsList.getString("M874");
			String M872_T = cRsList.getString("M872");
			String M875_T = cRsList.getString("M875");
			String M876_T = cRsList.getString("M876");
			String M877_T = cRsList.getString("M877");
			String M878_T = cRsList.getString("M878");
			String M879_T = cRsList.getString("M879");
			String M880_T = cRsList.getString("M880");
			String M881_T = cRsList.getString("M881");
			String M882_T = cRsList.getString("M882");
			String M883_T = cRsList.getString("M883");
			String M884_T = cRsList.getString("M884");
			String M885_T = cRsList.getString("M885");
			String M887_T = cRsList.getString("M887");
			String M888_T = cRsList.getString("M888");
			String M889_T = cRsList.getString("M889");
			String M890_T = cRsList.getString("M890");
			String M891_T = cRsList.getString("M891");
			String M892_T = cRsList.getString("M892");
			String M893_T = cRsList.getString("M893");
			String M894_T = cRsList.getString("M894");
			String M895_T = cRsList.getString("M895");
			String M896_T = cRsList.getString("M896");
			String M897_T = cRsList.getString("M897");
			String M898_T = cRsList.getString("M898");
			String M899_T = cRsList.getString("M899");
			String M900_T = cRsList.getString("M900");
			String M902_T = cRsList.getString("M902");
			String M901_T = cRsList.getString("M901");
			String M903_T = cRsList.getString("M903");
			String M904_T = cRsList.getString("M904");
			String M905_T = cRsList.getString("M905");
			String M906_T = cRsList.getString("M906");
			String M908_T = cRsList.getString("M908");
			String M909_T = cRsList.getString("M909");
			String M910_T = cRsList.getString("M910");
			String M911_T = cRsList.getString("M911");
			String M912_T = cRsList.getString("M912");
			String M914_T = cRsList.getString("M914");
			String M915_T = cRsList.getString("M915");
			String M916_T = cRsList.getString("M916");
			String M918_T = cRsList.getString("M918");
			String M919_T = cRsList.getString("M919");
			String M920_T = cRsList.getString("M920");
			String M268_T = cRsList.getString("M268");
			String M269_T = cRsList.getString("M269");
			String M270_T = cRsList.getString("M270");
			String M271_T = cRsList.getString("M271");
			String M272_T = cRsList.getString("M272");
			String M273_T = cRsList.getString("M273");
			String M274_T = cRsList.getString("M274");
			String M275_T = cRsList.getString("M275");
			String M276_T = cRsList.getString("M276");
			String M758_T = cRsList.getString("M758");
			String M760_T = cRsList.getString("M760");
			String M761_T = cRsList.getString("M761");
			String M277_T = cRsList.getString("M277");
			String M278_T = cRsList.getString("M278");
			String M279_T = cRsList.getString("M279");
			String M280_T = cRsList.getString("M280");
			String M281_T = cRsList.getString("M281");
			String M282_T = cRsList.getString("M282");
			String M283_T = cRsList.getString("M283");
			String M284_T = cRsList.getString("M284");
			String M285_T = cRsList.getString("M285");
			String M286_T = cRsList.getString("M286");
			String M287_T = cRsList.getString("M287");
			String M288_T = cRsList.getString("M288");
			String M289_T = cRsList.getString("M289");
			String M290_T = cRsList.getString("M290");
			String M291_T = cRsList.getString("M291");
			String M292_T = cRsList.getString("M292");
			String M293_T = cRsList.getString("M293");
			String M294_T = cRsList.getString("M294");
			String M295_T = cRsList.getString("M295");
			String M296_T = cRsList.getString("M296");
			String M297_T = cRsList.getString("M297");
			String M298_T = cRsList.getString("M298");
			String M299_T = cRsList.getString("M299");
			String M300_T = cRsList.getString("M300");
			String M301_T = cRsList.getString("M301");
			String M302_T = cRsList.getString("M302");
			String M303_T = cRsList.getString("M303");
			String M304_T = cRsList.getString("M304");
			String M305_T = cRsList.getString("M305");
			String M306_T = cRsList.getString("M306");
			String M307_T = cRsList.getString("M307");
			String M308_T = cRsList.getString("M308");
			String M309_T = cRsList.getString("M309");
			String M312_T = cRsList.getString("M312");
			String M315_T = cRsList.getString("M315");
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

			if(! M3_T.equals("")) {
%>
		 		M3='<%= M3_T%>'
<%
			}

			if(! M4_T.equals("")) {
%>
		 		M4='<%= M4_T%>'
<%
			}

			if(! M5_T.equals("")) {
%>
		 		M5='<%= M5_T%>'
<%
			}

			if(! M6_T.equals("")) {
%>
		 		M6='<%= M6_T%>'
<%
			}

			if(! M7_T.equals("")) {
%>
		 		M7='<%= M7_T%>'
<%
			}

			if(! M8_T.equals("")) {
%>
		 		M8='<%= M8_T%>'
<%
			}

			if(! M9_T.equals("")) {
%>
		 		M9='<%= M9_T%>'
<%
			}

			if(! M10_T.equals("")) {
%>
		 		M10='<%= M10_T%>'
<%
			}

			if(! M11_T.equals("")) {
%>
		 		M11='<%= M11_T%>'
<%
			}

			if(! M12_T.equals("")) {
%>
		 		M12='<%= M12_T%>'
<%
			}

			if(! M13_T.equals("")) {
%>
		 		M13='<%= M13_T%>'
<%
			}

			if(! M14_T.equals("")) {
%>
		 		M14='<%= M14_T%>'
<%
			}

			if(! M15_T.equals("")) {
%>
		 		M15='<%= M15_T%>'
<%
			}

			if(! M16_T.equals("")) {
%>
		 		M16='<%= M16_T%>'
<%
			}

			if(! M17_T.equals("")) {
%>
		 		M17='<%= M17_T%>'
<%
			}

			if(! M18_T.equals("")) {
%>
		 		M18='<%= M18_T%>'
<%
			}

			if(! M19_T.equals("")) {
%>
		 		M19='<%= M19_T%>'
<%
			}

			if(! M20_T.equals("")) {
%>
		 		M20='<%= M20_T%>'
<%
			}

			if(! M21_T.equals("")) {
%>
		 		M21='<%= M21_T%>'
<%
			}

			if(! M22_T.equals("")) {
%>
		 		M22='<%= M22_T%>'
<%
			}

			if(! M23_T.equals("")) {
%>
		 		M23='<%= M23_T%>'
<%
			}

			if(! M983_T.equals("")) {
%>
		 		M983='<%= M983_T%>'
<%
			}

			if(! M25_T.equals("")) {
%>
		 		M25='<%= M25_T%>'
<%
			}

			if(! M26_T.equals("")) {
%>
		 		M26='<%= M26_T%>'
<%
			}

			if(! M27_T.equals("")) {
%>
		 		M27='<%= M27_T%>'
<%
			}

			if(! M28_T.equals("")) {
%>
		 		M28='<%= M28_T%>'
<%
			}

			if(! M976_T.equals("")) {
%>
		 		M976='<%= M976_T%>'
<%
			}

			if(! M977_T.equals("")) {
%>
		 		M977='<%= M977_T%>'
<%
			}

			if(! M978_T.equals("")) {
%>
		 		M978='<%= M978_T%>'
<%
			}

			if(! M979_T.equals("")) {
%>
		 		M979='<%= M979_T%>'
<%
			}

			if(! M980_T.equals("")) {
%>
		 		M980='<%= M980_T%>'
<%
			}

			if(! M981_T.equals("")) {
%>
		 		M981='<%= M981_T%>'
<%
			}

			if(! M982_T.equals("")) {
%>
		 		M982='<%= M982_T%>'
<%
			}

			if(! M873_T.equals("")) {
%>
		 		M873='<%= M873_T%>'
<%
			}

			if(! M865_T.equals("")) {
%>
		 		M865='<%= M865_T%>'
<%
			}

			if(! M867_T.equals("")) {
%>
		 		M867='<%= M867_T%>'
<%
			}

			if(! M868_T.equals("")) {
%>
		 		M868='<%= M868_T%>'
<%
			}

			if(! M869_T.equals("")) {
%>
		 		M869='<%= M869_T%>'
<%
			}

			if(! M870_T.equals("")) {
%>
		 		M870='<%= M870_T%>'
<%
			}

			if(! M871_T.equals("")) {
%>
		 		M871='<%= M871_T%>'
<%
			}

			if(! M874_T.equals("")) {
%>
		 		M874='<%= M874_T%>'
<%
			}

			if(! M872_T.equals("")) {
%>
		 		M872='<%= M872_T%>'
<%
			}

			if(! M875_T.equals("")) {
%>
		 		M875='<%= M875_T%>'
<%
			}

			if(! M876_T.equals("")) {
%>
		 		M876='<%= M876_T%>'
<%
			}

			if(! M877_T.equals("")) {
%>
		 		M877='<%= M877_T%>'
<%
			}

			if(! M878_T.equals("")) {
%>
		 		M878='<%= M878_T%>'
<%
			}

			if(! M879_T.equals("")) {
%>
		 		M879='<%= M879_T%>'
<%
			}

			if(! M880_T.equals("")) {
%>
		 		M880='<%= M880_T%>'
<%
			}

			if(! M881_T.equals("")) {
%>
		 		M881='<%= M881_T%>'
<%
			}

			if(! M882_T.equals("")) {
%>
		 		M882='<%= M882_T%>'
<%
			}

			if(! M883_T.equals("")) {
%>
		 		M883='<%= M883_T%>'
<%
			}

			if(! M884_T.equals("")) {
%>
		 		M884='<%= M884_T%>'
<%
			}

			if(! M885_T.equals("")) {
%>
		 		M885='<%= M885_T%>'
<%
			}

			if(! M887_T.equals("")) {
%>
		 		M887='<%= M887_T%>'
<%
			}

			if(! M888_T.equals("")) {
%>
		 		M888='<%= M888_T%>'
<%
			}

			if(! M889_T.equals("")) {
%>
		 		M889='<%= M889_T%>'
<%
			}

			if(! M890_T.equals("")) {
%>
		 		M890='<%= M890_T%>'
<%
			}

			if(! M891_T.equals("")) {
%>
		 		M891='<%= M891_T%>'
<%
			}

			if(! M892_T.equals("")) {
%>
		 		M892='<%= M892_T%>'
<%
			}

			if(! M893_T.equals("")) {
%>
		 		M893='<%= M893_T%>'
<%
			}

			if(! M894_T.equals("")) {
%>
		 		M894='<%= M894_T%>'
<%
			}

			if(! M895_T.equals("")) {
%>
		 		M895='<%= M895_T%>'
<%
			}

			if(! M896_T.equals("")) {
%>
		 		M896='<%= M896_T%>'
<%
			}

			if(! M897_T.equals("")) {
%>
		 		M897='<%= M897_T%>'
<%
			}

			if(! M898_T.equals("")) {
%>
		 		M898='<%= M898_T%>'
<%
			}

			if(! M899_T.equals("")) {
%>
		 		M899='<%= M899_T%>'
<%
			}

			if(! M900_T.equals("")) {
%>
		 		M900='<%= M900_T%>'
<%
			}

			if(! M902_T.equals("")) {
%>
		 		M902='<%= M902_T%>'
<%
			}

			if(! M901_T.equals("")) {
%>
		 		M901='<%= M901_T%>'
<%
			}

			if(! M903_T.equals("")) {
%>
		 		M903='<%= M903_T%>'
<%
			}

			if(! M904_T.equals("")) {
%>
		 		M904='<%= M904_T%>'
<%
			}

			if(! M905_T.equals("")) {
%>
		 		M905='<%= M905_T%>'
<%
			}

			if(! M906_T.equals("")) {
%>
		 		M906='<%= M906_T%>'
<%
			}

			if(! M908_T.equals("")) {
%>
		 		M908='<%= M908_T%>'
<%
			}

			if(! M909_T.equals("")) {
%>
		 		M909='<%= M909_T%>'
<%
			}

			if(! M910_T.equals("")) {
%>
		 		M910='<%= M910_T%>'
<%
			}

			if(! M911_T.equals("")) {
%>
		 		M911='<%= M911_T%>'
<%
			}

			if(! M912_T.equals("")) {
%>
		 		M912='<%= M912_T%>'
<%
			}

			if(! M914_T.equals("")) {
%>
		 		M914='<%= M914_T%>'
<%
			}

			if(! M915_T.equals("")) {
%>
		 		M915='<%= M915_T%>'
<%
			}

			if(! M916_T.equals("")) {
%>
		 		M916='<%= M916_T%>'
<%
			}

			if(! M918_T.equals("")) {
%>
		 		M918='<%= M918_T%>'
<%
			}

			if(! M919_T.equals("")) {
%>
		 		M919='<%= M919_T%>'
<%
			}

			if(! M920_T.equals("")) {
%>
		 		M920='<%= M920_T%>'
<%
			}

			if(! M268_T.equals("")) {
%>
		 		M268='<%= M268_T%>'
<%
			}

			if(! M269_T.equals("")) {
%>
		 		M269='<%= M269_T%>'
<%
			}

			if(! M270_T.equals("")) {
%>
		 		M270='<%= M270_T%>'
<%
			}

			if(! M271_T.equals("")) {
%>
		 		M271='<%= M271_T%>'
<%
			}

			if(! M272_T.equals("")) {
%>
		 		M272='<%= M272_T%>'
<%
			}

			if(! M273_T.equals("")) {
%>
		 		M273='<%= M273_T%>'
<%
			}

			if(! M274_T.equals("")) {
%>
		 		M274='<%= M274_T%>'
<%
			}

			if(! M275_T.equals("")) {
%>
		 		M275='<%= M275_T%>'
<%
			}

			if(! M276_T.equals("")) {
%>
		 		M276='<%= M276_T%>'
<%
			}

			if(! M758_T.equals("")) {
%>
		 		M758='<%= M758_T%>'
<%
			}

			if(! M760_T.equals("")) {
%>
		 		M760='<%= M760_T%>'
<%
			}

			if(! M761_T.equals("")) {
%>
		 		M761='<%= M761_T%>'
<%
			}

			if(! M277_T.equals("")) {
%>
		 		M277='<%= M277_T%>'
<%
			}

			if(! M278_T.equals("")) {
%>
		 		M278='<%= M278_T%>'
<%
			}

			if(! M279_T.equals("")) {
%>
		 		M279='<%= M279_T%>'
<%
			}

			if(! M280_T.equals("")) {
%>
		 		M280='<%= M280_T%>'
<%
			}

			if(! M281_T.equals("")) {
%>
		 		M281='<%= M281_T%>'
<%
			}

			if(! M282_T.equals("")) {
%>
		 		M282='<%= M282_T%>'
<%
			}

			if(! M283_T.equals("")) {
%>
		 		M283='<%= M283_T%>'
<%
			}

			if(! M284_T.equals("")) {
%>
		 		M284='<%= M284_T%>'
<%
			}

			if(! M285_T.equals("")) {
%>
		 		M285='<%= M285_T%>'
<%
			}

			if(! M286_T.equals("")) {
%>
		 		M286='<%= M286_T%>'
<%
			}

			if(! M287_T.equals("")) {
%>
		 		M287='<%= M287_T%>'
<%
			}

			if(! M288_T.equals("")) {
%>
		 		M288='<%= M288_T%>'
<%
			}

			if(! M289_T.equals("")) {
%>
		 		M289='<%= M289_T%>'
<%
			}

			if(! M290_T.equals("")) {
%>
		 		M290='<%= M290_T%>'
<%
			}

			if(! M291_T.equals("")) {
%>
		 		M291='<%= M291_T%>'
<%
			}

			if(! M292_T.equals("")) {
%>
		 		M292='<%= M292_T%>'
<%
			}

			if(! M293_T.equals("")) {
%>
		 		M293='<%= M293_T%>'
<%
			}

			if(! M294_T.equals("")) {
%>
		 		M294='<%= M294_T%>'
<%
			}

			if(! M295_T.equals("")) {
%>
		 		M295='<%= M295_T%>'
<%
			}

			if(! M296_T.equals("")) {
%>
		 		M296='<%= M296_T%>'
<%
			}

			if(! M297_T.equals("")) {
%>
		 		M297='<%= M297_T%>'
<%
			}

			if(! M298_T.equals("")) {
%>
		 		M298='<%= M298_T%>'
<%
			}

			if(! M299_T.equals("")) {
%>
		 		M299='<%= M299_T%>'
<%
			}

			if(! M300_T.equals("")) {
%>
		 		M300='<%= M300_T%>'
<%
			}

			if(! M301_T.equals("")) {
%>
		 		M301='<%= M301_T%>'
<%
			}

			if(! M302_T.equals("")) {
%>
		 		M302='<%= M302_T%>'
<%
			}

			if(! M303_T.equals("")) {
%>
		 		M303='<%= M303_T%>'
<%
			}

			if(! M304_T.equals("")) {
%>
		 		M304='<%= M304_T%>'
<%
			}

			if(! M305_T.equals("")) {
%>
		 		M305='<%= M305_T%>'
<%
			}

			if(! M306_T.equals("")) {
%>
		 		M306='<%= M306_T%>'
<%
			}

			if(! M307_T.equals("")) {
%>
		 		M307='<%= M307_T%>'
<%
			}

			if(! M308_T.equals("")) {
%>
		 		M308='<%= M308_T%>'
<%
			}

			if(! M309_T.equals("")) {
%>
		 		M309='<%= M309_T%>'
<%
			}

			if(! M312_T.equals("")) {
%>
		 		M312='<%= M312_T%>'
<%
			}

			if(! M315_T.equals("")) {
%>
		 		M315='<%= M315_T%>'
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
