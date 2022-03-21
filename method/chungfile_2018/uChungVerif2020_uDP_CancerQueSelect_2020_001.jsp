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

SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM ,  EEA_CHART_NO,  EEA_MNGT_HTYR, EEA_INSU_NO, EEA_SEND_CD, EEA_SEX_CD,  QQN_EXAM_DT,
       F_TEL_FORMAT_NUM(ICR_TEL_NO,'1') ICR_TEL_NO1,F_TEL_FORMAT_NUM(ICR_TEL_NO,'2') ICR_TEL_NO2,F_TEL_FORMAT_NUM(ICR_TEL_NO,'3') ICR_TEL_NO3,
       F_TEL_FORMAT_NUM(ICR_MOBL_NO,'1') ICR_MOBL_NO1,F_TEL_FORMAT_NUM(ICR_MOBL_NO,'2') ICR_MOBL_NO2,F_TEL_FORMAT_NUM(ICR_MOBL_NO,'3') ICR_MOBL_NO3 ,
       ICR_EMAI_AR, MAX(ICR_RECV_YN) ICR_RECV_YN,
       MAX(ICR_ZIP_CD) ICR_ZIP_CD, MAX(ICR_ZIP_AR) ICR_ZIP_AR, MAX(ICR_ROAD_AR) ICR_ROAD_AR,
       MAX(M71)  M71, MAX(M72) M72  , MAX(M73) M73  , MAX(M74) M74  , MAX(M75) M75  , MAX(M76) M76  , MAX(M77) M77, MAX(M78) M78, MAX(M79) M79, MAX(M80) M80 ,MAX(M81) M81 ,
       CASE WHEN MAX(M76)IN ('1','3') THEN '    ' ELSE ( MAX(M77)|| MAX(M78)|| MAX(M79)|| MAX(M80)  ||MAX(M81)) END STMC_F,
       MAX(M83) M83, MAX(M84) M84,MAX(M85) M85, MAX(M86) M86, MAX(M87) M87, MAX(M89) M89, MAX(M90) M90, MAX(M91) M91,MAX(M92) M92, MAX(M93) M93, MAX(M95) M95,MAX(M96) M96, MAX(M97) M97,MAX(M98) M98,MAX(M99) M99,
       MAX(M101) M101,MAX(M102) M102,MAX(M103) M103,MAX(M104) M104,MAX(M105) M105,MAX(M108) M108, MAX(M109) M109,MAX(M110) M110,MAX(M111) M111,MAX(M112) M112 ,
       MAX(M82) M82  , CASE WHEN MAX(M82)IN ('3') THEN  '    ' ELSE (MAX(M83) || MAX(M84) || MAX(M85) || MAX(M86) || MAX(M87))  END BRST_F ,
       MAX(M88) M88  , CASE WHEN MAX(M88)IN ('3') THEN  '    ' ELSE (MAX(M89) || MAX(M90) || MAX(M91) || MAX(M92) || MAX(M93))  END COLO_F  ,
       MAX(M94) M94  , CASE WHEN MAX(M94)IN ('3') THEN  '    ' ELSE (MAX(M95) || MAX(M96) || MAX(M97) || MAX(M98) || MAX(M99))  END LIVER_F ,
       MAX(M100)M100  ,CASE WHEN MAX(M100)IN ('3') THEN '    ' ELSE (MAX(M101)|| MAX(M102)|| MAX(M103)|| MAX(M104)|| MAX(M105)) END CRVC_F,
       MAX(M106)M106  , MAX(M107)M107  ,CASE WHEN MAX(M107)IN ('3') THEN '    ' ELSE (MAX(M108)|| MAX(M109)||MAX(M110)||MAX(M111)||MAX(M112)) END ETC_F,
       MAX(M113)M113  , MAX(M114)M114  ,MAX(M115)M115  , MAX(M116)M116  ,
       MAX(M117)M117  , MAX(M118)M118  , MAX(M119)M119  ,MAX(M120)M120  ,MAX(M121)M121  ,MAX(M122)M122  ,MAX(M123)M123  ,MAX(M124)M124  ,MAX(M125)M125  ,
       MAX(M126)M126  , MAX(M127)M127  , MAX(M128)M128  ,MAX(M129)M129  ,MAX(M130)M130  ,MAX(M131)M131  ,MAX(M132)M132  ,MAX(M133)M133  ,MAX(M134)M134  ,
       MAX(M135)M135  , MAX(M136)M136  ,MAX(M137)M137  ,MAX(M138)M138   ,MAX(M139)M139  ,MAX(M140)M140  ,MAX(M141)M141  ,MAX(M142)M142  ,MAX(M143)M143  ,
       MAX(M144)M144  , MAX(M145)M145  ,MAX(M146)M146  ,MAX(M147)M147   ,MAX(M148)M148  ,
       MAX(M986)M986  ,MAX(M987)M987  ,MAX(M988)M988  ,MAX(M989)M989  ,MAX(M990)M990  ,MAX(M991)M991 ,MAX(M992)M992  ,
       CASE WHEN MAX(M986)IN ('3') THEN '    ' ELSE (MAX(M987)|| MAX(M988)|| MAX(M989)|| MAX(M990)|| MAX(M991)) END LUNG_F,
       MAX(M993)M993  ,MAX(M994)M994  ,MAX(M995)M995  ,MAX(M996)M996  ,MAX(M997)M997  ,MAX(M998)M998 ,MAX(M999)M999
      FROM (
       SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM , EEA_CHART_NO, EEA_MNGT_HTYR, EEA_INSU_NO, EEA_SEND_CD, EEA_SEX_CD,
              QQN_EXAM_DT ,QQN_EXAM_SQ , ICR_TEL_NO , ICR_MOBL_NO,  ICR_EMAI_AR, ICR_RECV_YN,
              ICR_ZIP_CD, ICR_ZIP_AR, ICR_ROAD_AR,
             CASE WHEN QQN_QSTN_CD='71' THEN QQN_RESULT END M71  ,
             CASE WHEN QQN_QSTN_CD='72' THEN QQN_RESULT END M72  ,
             CASE WHEN QQN_QSTN_CD='73' THEN QQN_RESULT END M73  ,
             CASE WHEN QQN_QSTN_CD='74' THEN QQN_RESULT END M74  ,
             CASE WHEN QQN_QSTN_CD='75' THEN QQN_RESULT END M75  ,
             CASE WHEN QQN_QSTN_CD='76' THEN QQN_RESULT END M76  ,
             CASE WHEN QQN_QSTN_CD='77' THEN QQN_RESULT END M77  ,
             CASE WHEN QQN_QSTN_CD='78' THEN QQN_RESULT END M78  ,
             CASE WHEN QQN_QSTN_CD='79' THEN QQN_RESULT END M79  ,
             CASE WHEN QQN_QSTN_CD='80' THEN QQN_RESULT END M80  ,
             CASE WHEN QQN_QSTN_CD='81' THEN QQN_RESULT END M81  ,
             CASE WHEN QQN_QSTN_CD='82' THEN QQN_RESULT END M82  ,
             CASE WHEN QQN_QSTN_CD='83' THEN QQN_RESULT END M83  ,
             CASE WHEN QQN_QSTN_CD='84' THEN QQN_RESULT END M84  ,
             CASE WHEN QQN_QSTN_CD='85' THEN QQN_RESULT END M85  ,
             CASE WHEN QQN_QSTN_CD='86' THEN QQN_RESULT END M86  ,
             CASE WHEN QQN_QSTN_CD='87' THEN QQN_RESULT END M87  ,
             CASE WHEN QQN_QSTN_CD='88' THEN QQN_RESULT END M88  ,
             CASE WHEN QQN_QSTN_CD='89' THEN QQN_RESULT END M89  ,
             CASE WHEN QQN_QSTN_CD='90' THEN QQN_RESULT END M90  ,
             CASE WHEN QQN_QSTN_CD='91' THEN QQN_RESULT END M91  ,
             CASE WHEN QQN_QSTN_CD='92' THEN QQN_RESULT END M92  ,
             CASE WHEN QQN_QSTN_CD='93' THEN QQN_RESULT END M93  ,
             CASE WHEN QQN_QSTN_CD='94' THEN QQN_RESULT END M94  ,
             CASE WHEN QQN_QSTN_CD='95' THEN QQN_RESULT END M95  ,
             CASE WHEN QQN_QSTN_CD='96' THEN QQN_RESULT END M96  ,
             CASE WHEN QQN_QSTN_CD='97' THEN QQN_RESULT END M97  ,
             CASE WHEN QQN_QSTN_CD='98' THEN QQN_RESULT END M98  ,
             CASE WHEN QQN_QSTN_CD='99' THEN QQN_RESULT END M99  ,
             CASE WHEN QQN_QSTN_CD='100' THEN QQN_RESULT END M100  ,
             CASE WHEN QQN_QSTN_CD='101' THEN QQN_RESULT END M101  ,
             CASE WHEN QQN_QSTN_CD='102' THEN QQN_RESULT END M102  ,
             CASE WHEN QQN_QSTN_CD='103' THEN QQN_RESULT END M103  ,
             CASE WHEN QQN_QSTN_CD='104' THEN QQN_RESULT END M104  ,
             CASE WHEN QQN_QSTN_CD='105' THEN QQN_RESULT END M105  ,
             CASE WHEN QQN_QSTN_CD='986' THEN QQN_RESULT END M986  ,
             CASE WHEN QQN_QSTN_CD='987' THEN QQN_RESULT END M987  ,
             CASE WHEN QQN_QSTN_CD='988' THEN QQN_RESULT END M988  ,
             CASE WHEN QQN_QSTN_CD='989' THEN QQN_RESULT END M989  ,
             CASE WHEN QQN_QSTN_CD='990' THEN QQN_RESULT END M990  ,
             CASE WHEN QQN_QSTN_CD='991' THEN QQN_RESULT END M991  ,
             CASE WHEN QQN_QSTN_CD='106' THEN QQN_RESULT END M106  ,
             CASE WHEN QQN_QSTN_CD='107' THEN QQN_RESULT END M107  ,
             CASE WHEN QQN_QSTN_CD='108' THEN QQN_RESULT END M108  ,
             CASE WHEN QQN_QSTN_CD='109' THEN QQN_RESULT END M109  ,
             CASE WHEN QQN_QSTN_CD='110' THEN QQN_RESULT END M110  ,
             CASE WHEN QQN_QSTN_CD='111' THEN QQN_RESULT END M111  ,
             CASE WHEN QQN_QSTN_CD='112' THEN QQN_RESULT END M112  ,
             CASE WHEN QQN_QSTN_CD='113' THEN QQN_RESULT END M113  ,
             CASE WHEN QQN_QSTN_CD='114' THEN QQN_RESULT END M114  ,
             CASE WHEN QQN_QSTN_CD='115' THEN QQN_RESULT END M115  ,
             CASE WHEN QQN_QSTN_CD='116' THEN QQN_RESULT END M116  ,
             CASE WHEN QQN_QSTN_CD='117' THEN QQN_RESULT END M117  ,
             CASE WHEN QQN_QSTN_CD='118' THEN QQN_RESULT END M118  ,
             CASE WHEN QQN_QSTN_CD='119' THEN QQN_RESULT END M119  ,
             CASE WHEN QQN_QSTN_CD='120' THEN QQN_RESULT END M120  ,
             CASE WHEN QQN_QSTN_CD='992' THEN QQN_RESULT END M992  ,
             CASE WHEN QQN_QSTN_CD='121' THEN QQN_RESULT END M121  ,
             CASE WHEN QQN_QSTN_CD='122' THEN QQN_RESULT END M122  ,
             CASE WHEN QQN_QSTN_CD='123' THEN QQN_RESULT END M123  ,
             CASE WHEN QQN_QSTN_CD='124' THEN QQN_RESULT END M124  ,
             CASE WHEN QQN_QSTN_CD='125' THEN QQN_RESULT END M125  ,
             CASE WHEN QQN_QSTN_CD='126' THEN QQN_RESULT END M126  ,
             CASE WHEN QQN_QSTN_CD='127' THEN QQN_RESULT END M127  ,
             CASE WHEN QQN_QSTN_CD='128' THEN QQN_RESULT END M128  ,
             CASE WHEN QQN_QSTN_CD='129' THEN QQN_RESULT END M129  ,
             CASE WHEN QQN_QSTN_CD='130' THEN QQN_RESULT END M130  ,
             CASE WHEN QQN_QSTN_CD='131' THEN QQN_RESULT END M131  ,
             CASE WHEN QQN_QSTN_CD='132' THEN QQN_RESULT END M132  ,
             CASE WHEN QQN_QSTN_CD='133' THEN QQN_RESULT END M133  ,
             CASE WHEN QQN_QSTN_CD='134' THEN QQN_RESULT END M134  ,
             CASE WHEN QQN_QSTN_CD='135' THEN QQN_RESULT END M135  ,
             CASE WHEN QQN_QSTN_CD='136' THEN QQN_RESULT END M136  ,
             CASE WHEN QQN_QSTN_CD='137' THEN QQN_RESULT END M137  ,
             CASE WHEN QQN_QSTN_CD='138' THEN QQN_RESULT END M138  ,
             CASE WHEN QQN_QSTN_CD='139' THEN QQN_RESULT END M139  ,
             CASE WHEN QQN_QSTN_CD='993' THEN QQN_RESULT END M993  ,
             CASE WHEN QQN_QSTN_CD='994' THEN QQN_RESULT END M994  ,
             CASE WHEN QQN_QSTN_CD='995' THEN QQN_RESULT END M995  ,
             CASE WHEN QQN_QSTN_CD='996' THEN QQN_RESULT END M996  ,
             CASE WHEN QQN_QSTN_CD='997' THEN QQN_RESULT END M997  ,
             CASE WHEN QQN_QSTN_CD='998' THEN QQN_RESULT END M998  ,
             CASE WHEN QQN_QSTN_CD='999' THEN QQN_RESULT END M999  ,
             CASE WHEN QQN_QSTN_CD='140' THEN QQN_RESULT END M140  ,
             CASE WHEN QQN_QSTN_CD='141' THEN QQN_RESULT END M141  ,
             CASE WHEN QQN_QSTN_CD='142' THEN QQN_RESULT END M142  ,
             CASE WHEN QQN_QSTN_CD='143' THEN QQN_RESULT END M143  ,
             CASE WHEN QQN_QSTN_CD='144' THEN QQN_RESULT END M144  ,
             CASE WHEN QQN_QSTN_CD='145' THEN QQN_RESULT END M145  ,
             CASE WHEN QQN_QSTN_CD='146' THEN QQN_RESULT END M146  ,
             CASE WHEN QQN_QSTN_CD='147' THEN QQN_RESULT END M147  ,
             CASE WHEN QQN_QSTN_CD='148' THEN QQN_RESULT END M148
           from ET_EXAM_ACPT A
                LEFT OUTER JOIN QT_QUESTION B ON A.EEA_EXAM_DT=B.QQN_EXAM_DT AND A.EEA_EXAM_SQ=B.QQN_EXAM_SQ
                LEFT OUTER JOIN IT_ITEM_QUESTION C ON B.QQN_QSTN_CD=C.IIQ_QGTN_CD    AND IIQ_ITEM_CD IN( 'M0029')  AND  IIQ_ITQU_LV1> 0
                LEFT OUTER JOIN IT_CUSTOMER D ON A.EEA_CUST_NO=D.ICR_CUST_NO
          where EEA_EXAM_DT = :EXAM_DT  and EEA_EXAM_SQ = :EXAM_SQ
        ) B
      group by EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM, EEA_CHART_NO, EEA_MNGT_HTYR, EEA_INSU_NO, EEA_SEND_CD, EEA_SEX_CD, QQN_EXAM_DT, ICR_TEL_NO, ICR_MOBL_NO, ICR_EMAI_AR
		*/

		sql = " SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM , EEA_CHART_NO, EEA_MNGT_HTYR, EEA_INSU_NO, EEA_SEND_CD, EEA_SEX_CD, QQN_EXAM_DT, F_TEL_FORMAT_NUM(ICR_TEL_NO,'1') ICR_TEL_NO1,F_TEL_FORMAT_NUM(ICR_TEL_NO,'2') ICR_TEL_NO2,F_TEL_FORMAT_NUM(ICR_TEL_NO,'3') ICR_TEL_NO3, F_TEL_FORMAT_NUM(ICR_MOBL_NO,'1') ICR_MOBL_NO1,F_TEL_FORMAT_NUM(ICR_MOBL_NO,'2') ICR_MOBL_NO2,F_TEL_FORMAT_NUM(ICR_MOBL_NO,'3') ICR_MOBL_NO3 , ICR_EMAI_AR, MAX(ICR_RECV_YN) ICR_RECV_YN, MAX(ICR_ZIP_CD) ICR_ZIP_CD, MAX(ICR_ZIP_AR) ICR_ZIP_AR, MAX(ICR_ROAD_AR) ICR_ROAD_AR, MAX(M71) M71, MAX(M72) M72 , MAX(M73) M73 , MAX(M74) M74 , MAX(M75) M75 , MAX(M76) M76 , MAX(M77) M77, MAX(M78) M78, MAX(M79) M79, MAX(M80) M80 ,MAX(M81) M81";
		sql += ", CASE WHEN MAX(M76)IN ('1','3') THEN ' ' ELSE ( MAX(M77)|| MAX(M78)|| MAX(M79)|| MAX(M80) ||MAX(M81)) END STMC_F, MAX(M83) M83, MAX(M84) M84,MAX(M85) M85, MAX(M86) M86, MAX(M87) M87, MAX(M89) M89, MAX(M90) M90, MAX(M91) M91,MAX(M92) M92, MAX(M93) M93, MAX(M95) M95,MAX(M96) M96, MAX(M97) M97,MAX(M98) M98,MAX(M99) M99, MAX(M101) M101,MAX(M102) M102,MAX(M103) M103,MAX(M104) M104,MAX(M105) M105,MAX(M108) M108, MAX(M109) M109,MAX(M110) M110,MAX(M111) M111,MAX(M112) M112 , MAX(M82) M82";
		sql += ", CASE WHEN MAX(M82)IN ('3') THEN ' ' ELSE (MAX(M83) || MAX(M84) || MAX(M85) || MAX(M86) || MAX(M87)) END BRST_F , MAX(M88) M88";
		sql += ", CASE WHEN MAX(M88)IN ('3') THEN ' ' ELSE (MAX(M89) || MAX(M90) || MAX(M91) || MAX(M92) || MAX(M93)) END COLO_F , MAX(M94) M94";
		sql += ", CASE WHEN MAX(M94)IN ('3') THEN ' ' ELSE (MAX(M95) || MAX(M96) || MAX(M97) || MAX(M98) || MAX(M99)) END LIVER_F , MAX(M100)M100";
		sql += ", CASE WHEN MAX(M100)IN ('3') THEN ' ' ELSE (MAX(M101)|| MAX(M102)|| MAX(M103)|| MAX(M104)|| MAX(M105)) END CRVC_F, MAX(M106)M106 , MAX(M107)M107";
		sql += ", CASE WHEN MAX(M107)IN ('3') THEN ' ' ELSE (MAX(M108)|| MAX(M109)||MAX(M110)||MAX(M111)||MAX(M112)) END ETC_F, MAX(M113)M113 , MAX(M114)M114 ,MAX(M115)M115 , MAX(M116)M116 , MAX(M117)M117 , MAX(M118)M118 , MAX(M119)M119 ,MAX(M120)M120 ,MAX(M121)M121 ,MAX(M122)M122 ,MAX(M123)M123 ,MAX(M124)M124 ,MAX(M125)M125 , MAX(M126)M126 , MAX(M127)M127 , MAX(M128)M128 ,MAX(M129)M129 ,MAX(M130)M130 ,MAX(M131)M131 ,MAX(M132)M132 ,MAX(M133)M133 ,MAX(M134)M134 , MAX(M135)M135 , MAX(M136)M136 ,MAX(M137)M137 ,MAX(M138)M138 ,MAX(M139)M139 ,MAX(M140)M140 ,MAX(M141)M141 ,MAX(M142)M142 ,MAX(M143)M143 , MAX(M144)M144 , MAX(M145)M145 ,MAX(M146)M146 ,MAX(M147)M147 ,MAX(M148)M148 , MAX(M986)M986 ,MAX(M987)M987 ,MAX(M988)M988 ,MAX(M989)M989 ,MAX(M990)M990 ,MAX(M991)M991 ,MAX(M992)M992";
		sql += ", CASE WHEN MAX(M986)IN ('3') THEN ' ' ELSE (MAX(M987)|| MAX(M988)|| MAX(M989)|| MAX(M990)|| MAX(M991)) END LUNG_F, MAX(M993)M993 ,MAX(M994)M994 ,MAX(M995)M995 ,MAX(M996)M996 ,MAX(M997)M997 ,MAX(M998)M998 ,MAX(M999)M999";
		sql += " FROM (";
		sql += "	SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM , EEA_CHART_NO, EEA_MNGT_HTYR, EEA_INSU_NO, EEA_SEND_CD, EEA_SEX_CD, QQN_EXAM_DT ,QQN_EXAM_SQ , ICR_TEL_NO , ICR_MOBL_NO, ICR_EMAI_AR, ICR_RECV_YN, ICR_ZIP_CD, ICR_ZIP_AR, ICR_ROAD_AR";
		sql += "	, CASE WHEN QQN_QSTN_CD='71' THEN QQN_RESULT END M71";
		sql += "	, CASE WHEN QQN_QSTN_CD='72' THEN QQN_RESULT END M72";
		sql += "	, CASE WHEN QQN_QSTN_CD='73' THEN QQN_RESULT END M73";
		sql += "	, CASE WHEN QQN_QSTN_CD='74' THEN QQN_RESULT END M74";
		sql += "	, CASE WHEN QQN_QSTN_CD='75' THEN QQN_RESULT END M75";
		sql += "	, CASE WHEN QQN_QSTN_CD='76' THEN QQN_RESULT END M76";
		sql += "	, CASE WHEN QQN_QSTN_CD='77' THEN QQN_RESULT END M77";
		sql += "	, CASE WHEN QQN_QSTN_CD='78' THEN QQN_RESULT END M78";
		sql += "	, CASE WHEN QQN_QSTN_CD='79' THEN QQN_RESULT END M79";
		sql += "	, CASE WHEN QQN_QSTN_CD='80' THEN QQN_RESULT END M80";
		sql += "	, CASE WHEN QQN_QSTN_CD='81' THEN QQN_RESULT END M81";
		sql += "	, CASE WHEN QQN_QSTN_CD='82' THEN QQN_RESULT END M82";
		sql += "	, CASE WHEN QQN_QSTN_CD='83' THEN QQN_RESULT END M83";
		sql += "	, CASE WHEN QQN_QSTN_CD='84' THEN QQN_RESULT END M84";
		sql += "	, CASE WHEN QQN_QSTN_CD='85' THEN QQN_RESULT END M85";
		sql += "	, CASE WHEN QQN_QSTN_CD='86' THEN QQN_RESULT END M86";
		sql += "	, CASE WHEN QQN_QSTN_CD='87' THEN QQN_RESULT END M87";
		sql += "	, CASE WHEN QQN_QSTN_CD='88' THEN QQN_RESULT END M88";
		sql += "	, CASE WHEN QQN_QSTN_CD='89' THEN QQN_RESULT END M89";
		sql += "	, CASE WHEN QQN_QSTN_CD='90' THEN QQN_RESULT END M90";
		sql += "	, CASE WHEN QQN_QSTN_CD='91' THEN QQN_RESULT END M91";
		sql += "	, CASE WHEN QQN_QSTN_CD='92' THEN QQN_RESULT END M92";
		sql += "	, CASE WHEN QQN_QSTN_CD='93' THEN QQN_RESULT END M93";
		sql += "	, CASE WHEN QQN_QSTN_CD='94' THEN QQN_RESULT END M94";
		sql += "	, CASE WHEN QQN_QSTN_CD='95' THEN QQN_RESULT END M95";
		sql += "	, CASE WHEN QQN_QSTN_CD='96' THEN QQN_RESULT END M96";
		sql += "	, CASE WHEN QQN_QSTN_CD='97' THEN QQN_RESULT END M97";
		sql += "	, CASE WHEN QQN_QSTN_CD='98' THEN QQN_RESULT END M98";
		sql += "	, CASE WHEN QQN_QSTN_CD='99' THEN QQN_RESULT END M99";
		sql += "	, CASE WHEN QQN_QSTN_CD='100' THEN QQN_RESULT END M100";
		sql += "	, CASE WHEN QQN_QSTN_CD='101' THEN QQN_RESULT END M101";
		sql += "	, CASE WHEN QQN_QSTN_CD='102' THEN QQN_RESULT END M102";
		sql += "	, CASE WHEN QQN_QSTN_CD='103' THEN QQN_RESULT END M103";
		sql += "	, CASE WHEN QQN_QSTN_CD='104' THEN QQN_RESULT END M104";
		sql += "	, CASE WHEN QQN_QSTN_CD='105' THEN QQN_RESULT END M105";
		sql += "	, CASE WHEN QQN_QSTN_CD='986' THEN QQN_RESULT END M986";
		sql += "	, CASE WHEN QQN_QSTN_CD='987' THEN QQN_RESULT END M987";
		sql += "	, CASE WHEN QQN_QSTN_CD='988' THEN QQN_RESULT END M988";
		sql += "	, CASE WHEN QQN_QSTN_CD='989' THEN QQN_RESULT END M989";
		sql += "	, CASE WHEN QQN_QSTN_CD='990' THEN QQN_RESULT END M990";
		sql += "	, CASE WHEN QQN_QSTN_CD='991' THEN QQN_RESULT END M991";
		sql += "	, CASE WHEN QQN_QSTN_CD='106' THEN QQN_RESULT END M106";
		sql += "	, CASE WHEN QQN_QSTN_CD='107' THEN QQN_RESULT END M107";
		sql += "	, CASE WHEN QQN_QSTN_CD='108' THEN QQN_RESULT END M108";
		sql += "	, CASE WHEN QQN_QSTN_CD='109' THEN QQN_RESULT END M109";
		sql += "	, CASE WHEN QQN_QSTN_CD='110' THEN QQN_RESULT END M110";
		sql += "	, CASE WHEN QQN_QSTN_CD='111' THEN QQN_RESULT END M111";
		sql += "	, CASE WHEN QQN_QSTN_CD='112' THEN QQN_RESULT END M112";
		sql += "	, CASE WHEN QQN_QSTN_CD='113' THEN QQN_RESULT END M113";
		sql += "	, CASE WHEN QQN_QSTN_CD='114' THEN QQN_RESULT END M114";
		sql += "	, CASE WHEN QQN_QSTN_CD='115' THEN QQN_RESULT END M115";
		sql += "	, CASE WHEN QQN_QSTN_CD='116' THEN QQN_RESULT END M116";
		sql += "	, CASE WHEN QQN_QSTN_CD='117' THEN QQN_RESULT END M117";
		sql += "	, CASE WHEN QQN_QSTN_CD='118' THEN QQN_RESULT END M118";
		sql += "	, CASE WHEN QQN_QSTN_CD='119' THEN QQN_RESULT END M119";
		sql += "	, CASE WHEN QQN_QSTN_CD='120' THEN QQN_RESULT END M120";
		sql += "	, CASE WHEN QQN_QSTN_CD='992' THEN QQN_RESULT END M992";
		sql += "	, CASE WHEN QQN_QSTN_CD='121' THEN QQN_RESULT END M121";
		sql += "	, CASE WHEN QQN_QSTN_CD='122' THEN QQN_RESULT END M122";
		sql += "	, CASE WHEN QQN_QSTN_CD='123' THEN QQN_RESULT END M123";
		sql += "	, CASE WHEN QQN_QSTN_CD='124' THEN QQN_RESULT END M124";
		sql += "	, CASE WHEN QQN_QSTN_CD='125' THEN QQN_RESULT END M125";
		sql += "	, CASE WHEN QQN_QSTN_CD='126' THEN QQN_RESULT END M126";
		sql += "	, CASE WHEN QQN_QSTN_CD='127' THEN QQN_RESULT END M127";
		sql += "	, CASE WHEN QQN_QSTN_CD='128' THEN QQN_RESULT END M128";
		sql += "	, CASE WHEN QQN_QSTN_CD='129' THEN QQN_RESULT END M129";
		sql += "	, CASE WHEN QQN_QSTN_CD='130' THEN QQN_RESULT END M130";
		sql += "	, CASE WHEN QQN_QSTN_CD='131' THEN QQN_RESULT END M131";
		sql += "	, CASE WHEN QQN_QSTN_CD='132' THEN QQN_RESULT END M132";
		sql += "	, CASE WHEN QQN_QSTN_CD='133' THEN QQN_RESULT END M133";
		sql += "	, CASE WHEN QQN_QSTN_CD='134' THEN QQN_RESULT END M134";
		sql += "	, CASE WHEN QQN_QSTN_CD='135' THEN QQN_RESULT END M135";
		sql += "	, CASE WHEN QQN_QSTN_CD='136' THEN QQN_RESULT END M136";
		sql += "	, CASE WHEN QQN_QSTN_CD='137' THEN QQN_RESULT END M137";
		sql += "	, CASE WHEN QQN_QSTN_CD='138' THEN QQN_RESULT END M138";
		sql += "	, CASE WHEN QQN_QSTN_CD='139' THEN QQN_RESULT END M139";
		sql += "	, CASE WHEN QQN_QSTN_CD='993' THEN QQN_RESULT END M993";
		sql += "	, CASE WHEN QQN_QSTN_CD='994' THEN QQN_RESULT END M994";
		sql += "	, CASE WHEN QQN_QSTN_CD='995' THEN QQN_RESULT END M995";
		sql += "	, CASE WHEN QQN_QSTN_CD='996' THEN QQN_RESULT END M996";
		sql += "	, CASE WHEN QQN_QSTN_CD='997' THEN QQN_RESULT END M997";
		sql += "	, CASE WHEN QQN_QSTN_CD='998' THEN QQN_RESULT END M998";
		sql += "	, CASE WHEN QQN_QSTN_CD='999' THEN QQN_RESULT END M999";
		sql += "	, CASE WHEN QQN_QSTN_CD='140' THEN QQN_RESULT END M140";
		sql += "	, CASE WHEN QQN_QSTN_CD='141' THEN QQN_RESULT END M141";
		sql += "	, CASE WHEN QQN_QSTN_CD='142' THEN QQN_RESULT END M142";
		sql += "	, CASE WHEN QQN_QSTN_CD='143' THEN QQN_RESULT END M143";
		sql += "	, CASE WHEN QQN_QSTN_CD='144' THEN QQN_RESULT END M144";
		sql += "	, CASE WHEN QQN_QSTN_CD='145' THEN QQN_RESULT END M145";
		sql += "	, CASE WHEN QQN_QSTN_CD='146' THEN QQN_RESULT END M146";
		sql += "	, CASE WHEN QQN_QSTN_CD='147' THEN QQN_RESULT END M147";
		sql += "	, CASE WHEN QQN_QSTN_CD='148' THEN QQN_RESULT END M148";

		sql += " 	FROM ET_EXAM_ACPT A LEFT OUTER JOIN QT_QUESTION B";
		sql += " 	ON A.EEA_EXAM_DT=B.QQN_EXAM_DT";
		sql += " 	AND A.EEA_EXAM_SQ=B.QQN_EXAM_SQ";
		
		sql += " 	LEFT OUTER JOIN IT_ITEM_QUESTION C";
		sql += " 	ON B.QQN_QSTN_CD=C.IIQ_QGTN_CD";
		sql += " 	AND IIQ_ITEM_CD IN( 'M0029')";
		sql += " 	AND IIQ_ITQU_LV1> 0";
		
		sql += " 	LEFT OUTER JOIN IT_CUSTOMER D";
		sql += " 	ON A.EEA_CUST_NO=D.ICR_CUST_NO";

		sql += " 	WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " ) B";

		sql += " GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM, EEA_CHART_NO, EEA_MNGT_HTYR, EEA_INSU_NO, EEA_SEND_CD, EEA_SEX_CD, QQN_EXAM_DT, ICR_TEL_NO, ICR_MOBL_NO, ICR_EMAI_AR";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChungVerif2020_uDP_CancerQueSelect_2020_001 \n";
			G_INFO += "설명 : 암검진 문진성적확인 내역 조회 \n";
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
		<s:AttributeType name='EEA_CHART_NO' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_HTYR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_NO' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_CD' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_EXAM_DT' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_TEL_NO1' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_TEL_NO2' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_TEL_NO3' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO1' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO2' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO3' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_EMAI_AR' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_RECV_YN' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_CD' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_AR' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ROAD_AR' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='M71' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M72' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M73' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M74' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M75' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M76' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M77' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M78' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M79' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M80' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M81' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='STMC_F' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='M83' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M84' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M85' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M86' rs:number='36' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M87' rs:number='37' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M89' rs:number='38' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M90' rs:number='39' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M91' rs:number='40' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M92' rs:number='41' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M93' rs:number='42' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M95' rs:number='43' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M96' rs:number='44' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M97' rs:number='45' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M98' rs:number='46' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M99' rs:number='47' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M101' rs:number='48' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M102' rs:number='49' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M103' rs:number='50' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M104' rs:number='51' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M105' rs:number='52' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M108' rs:number='53' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M109' rs:number='54' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M110' rs:number='55' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M111' rs:number='56' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M112' rs:number='57' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M82' rs:number='58' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='BRST_F' rs:number='59' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='M88' rs:number='60' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='COLO_F' rs:number='61' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='M94' rs:number='62' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='LIVER_F' rs:number='63' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='M100' rs:number='64' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='CRVC_F' rs:number='65' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='M106' rs:number='66' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M107' rs:number='67' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ETC_F' rs:number='68' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='M113' rs:number='69' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M114' rs:number='70' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M115' rs:number='71' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M116' rs:number='72' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M117' rs:number='73' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M118' rs:number='74' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M119' rs:number='75' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M120' rs:number='76' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M121' rs:number='77' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M122' rs:number='78' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M123' rs:number='79' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M124' rs:number='80' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M125' rs:number='81' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M126' rs:number='82' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M127' rs:number='83' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M128' rs:number='84' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M129' rs:number='85' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M130' rs:number='86' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M131' rs:number='87' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M132' rs:number='88' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M133' rs:number='89' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M134' rs:number='90' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M135' rs:number='91' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M136' rs:number='92' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M137' rs:number='93' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M138' rs:number='94' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M139' rs:number='95' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M140' rs:number='96' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M141' rs:number='97' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M142' rs:number='98' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M143' rs:number='99' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M144' rs:number='100' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M145' rs:number='101' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M146' rs:number='102' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M147' rs:number='103' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M148' rs:number='104' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M986' rs:number='105' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M987' rs:number='106' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M988' rs:number='107' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M989' rs:number='108' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M990' rs:number='109' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M991' rs:number='110' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M992' rs:number='111' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='LUNG_F' rs:number='112' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='M993' rs:number='113' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M994' rs:number='114' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M995' rs:number='115' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M996' rs:number='116' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M997' rs:number='117' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M998' rs:number='118' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M999' rs:number='119' rs:nullable='true'>
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
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_MNGT_HTYR_T = cRsList.getString("EEA_MNGT_HTYR");
			String EEA_INSU_NO_T = cRsList.getString("EEA_INSU_NO");
			String EEA_SEND_CD_T = cRsList.getString("EEA_SEND_CD");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String QQN_EXAM_DT_T = cRsList.getString("QQN_EXAM_DT");
			String ICR_TEL_NO1_T = cRsList.getString("ICR_TEL_NO1");
			String ICR_TEL_NO2_T = cRsList.getString("ICR_TEL_NO2");
			String ICR_TEL_NO3_T = cRsList.getString("ICR_TEL_NO3");
			String ICR_MOBL_NO1_T = cRsList.getString("ICR_MOBL_NO1");
			String ICR_MOBL_NO2_T = cRsList.getString("ICR_MOBL_NO2");
			String ICR_MOBL_NO3_T = cRsList.getString("ICR_MOBL_NO3");
			String ICR_EMAI_AR_T = cRsList.getString("ICR_EMAI_AR");
			String ICR_RECV_YN_T = cRsList.getString("ICR_RECV_YN");
			String ICR_ZIP_CD_T = cRsList.getString("ICR_ZIP_CD");
			String ICR_ZIP_AR_T = cRsList.getString("ICR_ZIP_AR");
			String ICR_ROAD_AR_T = cRsList.getString("ICR_ROAD_AR");
			String M71_T = cRsList.getString("M71");
			String M72_T = cRsList.getString("M72");
			String M73_T = cRsList.getString("M73");
			String M74_T = cRsList.getString("M74");
			String M75_T = cRsList.getString("M75");
			String M76_T = cRsList.getString("M76");
			String M77_T = cRsList.getString("M77");
			String M78_T = cRsList.getString("M78");
			String M79_T = cRsList.getString("M79");
			String M80_T = cRsList.getString("M80");
			String M81_T = cRsList.getString("M81");
			String STMC_F_T = cRsList.getString("STMC_F");
			String M83_T = cRsList.getString("M83");
			String M84_T = cRsList.getString("M84");
			String M85_T = cRsList.getString("M85");
			String M86_T = cRsList.getString("M86");
			String M87_T = cRsList.getString("M87");
			String M89_T = cRsList.getString("M89");
			String M90_T = cRsList.getString("M90");
			String M91_T = cRsList.getString("M91");
			String M92_T = cRsList.getString("M92");
			String M93_T = cRsList.getString("M93");
			String M95_T = cRsList.getString("M95");
			String M96_T = cRsList.getString("M96");
			String M97_T = cRsList.getString("M97");
			String M98_T = cRsList.getString("M98");
			String M99_T = cRsList.getString("M99");
			String M101_T = cRsList.getString("M101");
			String M102_T = cRsList.getString("M102");
			String M103_T = cRsList.getString("M103");
			String M104_T = cRsList.getString("M104");
			String M105_T = cRsList.getString("M105");
			String M108_T = cRsList.getString("M108");
			String M109_T = cRsList.getString("M109");
			String M110_T = cRsList.getString("M110");
			String M111_T = cRsList.getString("M111");
			String M112_T = cRsList.getString("M112");
			String M82_T = cRsList.getString("M82");
			String BRST_F_T = cRsList.getString("BRST_F");
			String M88_T = cRsList.getString("M88");
			String COLO_F_T = cRsList.getString("COLO_F");
			String M94_T = cRsList.getString("M94");
			String LIVER_F_T = cRsList.getString("LIVER_F");
			String M100_T = cRsList.getString("M100");
			String CRVC_F_T = cRsList.getString("CRVC_F");
			String M106_T = cRsList.getString("M106");
			String M107_T = cRsList.getString("M107");
			String ETC_F_T = cRsList.getString("ETC_F");
			String M113_T = cRsList.getString("M113");
			String M114_T = cRsList.getString("M114");
			String M115_T = cRsList.getString("M115");
			String M116_T = cRsList.getString("M116");
			String M117_T = cRsList.getString("M117");
			String M118_T = cRsList.getString("M118");
			String M119_T = cRsList.getString("M119");
			String M120_T = cRsList.getString("M120");
			String M121_T = cRsList.getString("M121");
			String M122_T = cRsList.getString("M122");
			String M123_T = cRsList.getString("M123");
			String M124_T = cRsList.getString("M124");
			String M125_T = cRsList.getString("M125");
			String M126_T = cRsList.getString("M126");
			String M127_T = cRsList.getString("M127");
			String M128_T = cRsList.getString("M128");
			String M129_T = cRsList.getString("M129");
			String M130_T = cRsList.getString("M130");
			String M131_T = cRsList.getString("M131");
			String M132_T = cRsList.getString("M132");
			String M133_T = cRsList.getString("M133");
			String M134_T = cRsList.getString("M134");
			String M135_T = cRsList.getString("M135");
			String M136_T = cRsList.getString("M136");
			String M137_T = cRsList.getString("M137");
			String M138_T = cRsList.getString("M138");
			String M139_T = cRsList.getString("M139");
			String M140_T = cRsList.getString("M140");
			String M141_T = cRsList.getString("M141");
			String M142_T = cRsList.getString("M142");
			String M143_T = cRsList.getString("M143");
			String M144_T = cRsList.getString("M144");
			String M145_T = cRsList.getString("M145");
			String M146_T = cRsList.getString("M146");
			String M147_T = cRsList.getString("M147");
			String M148_T = cRsList.getString("M148");
			String M986_T = cRsList.getString("M986");
			String M987_T = cRsList.getString("M987");
			String M988_T = cRsList.getString("M988");
			String M989_T = cRsList.getString("M989");
			String M990_T = cRsList.getString("M990");
			String M991_T = cRsList.getString("M991");
			String M992_T = cRsList.getString("M992");
			String LUNG_F_T = cRsList.getString("LUNG_F");
			String M993_T = cRsList.getString("M993");
			String M994_T = cRsList.getString("M994");
			String M995_T = cRsList.getString("M995");
			String M996_T = cRsList.getString("M996");
			String M997_T = cRsList.getString("M997");
			String M998_T = cRsList.getString("M998");
			String M999_T = cRsList.getString("M999");
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

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
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

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}

			if(! QQN_EXAM_DT_T.equals("")) {
%>
		 		QQN_EXAM_DT='<%= QQN_EXAM_DT_T%>'
<%
			}

			if(! ICR_TEL_NO1_T.equals("")) {
%>
		 		ICR_TEL_NO1='<%= ICR_TEL_NO1_T%>'
<%
			}

			if(! ICR_TEL_NO2_T.equals("")) {
%>
		 		ICR_TEL_NO2='<%= ICR_TEL_NO2_T%>'
<%
			}

			if(! ICR_TEL_NO3_T.equals("")) {
%>
		 		ICR_TEL_NO3='<%= ICR_TEL_NO3_T%>'
<%
			}

			if(! ICR_MOBL_NO1_T.equals("")) {
%>
		 		ICR_MOBL_NO1='<%= ICR_MOBL_NO1_T%>'
<%
			}

			if(! ICR_MOBL_NO2_T.equals("")) {
%>
		 		ICR_MOBL_NO2='<%= ICR_MOBL_NO2_T%>'
<%
			}

			if(! ICR_MOBL_NO3_T.equals("")) {
%>
		 		ICR_MOBL_NO3='<%= ICR_MOBL_NO3_T%>'
<%
			}

			if(! ICR_EMAI_AR_T.equals("")) {
%>
		 		ICR_EMAI_AR='<%= ICR_EMAI_AR_T%>'
<%
			}

			if(! ICR_RECV_YN_T.equals("")) {
%>
		 		ICR_RECV_YN='<%= ICR_RECV_YN_T%>'
<%
			}

			if(! ICR_ZIP_CD_T.equals("")) {
%>
		 		ICR_ZIP_CD='<%= ICR_ZIP_CD_T%>'
<%
			}

			if(! ICR_ZIP_AR_T.equals("")) {
%>
		 		ICR_ZIP_AR='<%= ICR_ZIP_AR_T%>'
<%
			}

			if(! ICR_ROAD_AR_T.equals("")) {
%>
		 		ICR_ROAD_AR='<%= ICR_ROAD_AR_T%>'
<%
			}

			if(! M71_T.equals("")) {
%>
		 		M71='<%= M71_T%>'
<%
			}

			if(! M72_T.equals("")) {
%>
		 		M72='<%= M72_T%>'
<%
			}

			if(! M73_T.equals("")) {
%>
		 		M73='<%= M73_T%>'
<%
			}

			if(! M74_T.equals("")) {
%>
		 		M74='<%= M74_T%>'
<%
			}

			if(! M75_T.equals("")) {
%>
		 		M75='<%= M75_T%>'
<%
			}

			if(! M76_T.equals("")) {
%>
		 		M76='<%= M76_T%>'
<%
			}

			if(! M77_T.equals("")) {
%>
		 		M77='<%= M77_T%>'
<%
			}

			if(! M78_T.equals("")) {
%>
		 		M78='<%= M78_T%>'
<%
			}

			if(! M79_T.equals("")) {
%>
		 		M79='<%= M79_T%>'
<%
			}

			if(! M80_T.equals("")) {
%>
		 		M80='<%= M80_T%>'
<%
			}

			if(! M81_T.equals("")) {
%>
		 		M81='<%= M81_T%>'
<%
			}

			if(! STMC_F_T.equals("")) {
%>
		 		STMC_F='<%= STMC_F_T%>'
<%
			}

			if(! M83_T.equals("")) {
%>
		 		M83='<%= M83_T%>'
<%
			}

			if(! M84_T.equals("")) {
%>
		 		M84='<%= M84_T%>'
<%
			}

			if(! M85_T.equals("")) {
%>
		 		M85='<%= M85_T%>'
<%
			}

			if(! M86_T.equals("")) {
%>
		 		M86='<%= M86_T%>'
<%
			}

			if(! M87_T.equals("")) {
%>
		 		M87='<%= M87_T%>'
<%
			}

			if(! M89_T.equals("")) {
%>
		 		M89='<%= M89_T%>'
<%
			}

			if(! M90_T.equals("")) {
%>
		 		M90='<%= M90_T%>'
<%
			}

			if(! M91_T.equals("")) {
%>
		 		M91='<%= M91_T%>'
<%
			}

			if(! M92_T.equals("")) {
%>
		 		M92='<%= M92_T%>'
<%
			}

			if(! M93_T.equals("")) {
%>
		 		M93='<%= M93_T%>'
<%
			}

			if(! M95_T.equals("")) {
%>
		 		M95='<%= M95_T%>'
<%
			}

			if(! M96_T.equals("")) {
%>
		 		M96='<%= M96_T%>'
<%
			}

			if(! M97_T.equals("")) {
%>
		 		M97='<%= M97_T%>'
<%
			}

			if(! M98_T.equals("")) {
%>
		 		M98='<%= M98_T%>'
<%
			}

			if(! M99_T.equals("")) {
%>
		 		M99='<%= M99_T%>'
<%
			}

			if(! M101_T.equals("")) {
%>
		 		M101='<%= M101_T%>'
<%
			}

			if(! M102_T.equals("")) {
%>
		 		M102='<%= M102_T%>'
<%
			}

			if(! M103_T.equals("")) {
%>
		 		M103='<%= M103_T%>'
<%
			}

			if(! M104_T.equals("")) {
%>
		 		M104='<%= M104_T%>'
<%
			}

			if(! M105_T.equals("")) {
%>
		 		M105='<%= M105_T%>'
<%
			}

			if(! M108_T.equals("")) {
%>
		 		M108='<%= M108_T%>'
<%
			}

			if(! M109_T.equals("")) {
%>
		 		M109='<%= M109_T%>'
<%
			}

			if(! M110_T.equals("")) {
%>
		 		M110='<%= M110_T%>'
<%
			}

			if(! M111_T.equals("")) {
%>
		 		M111='<%= M111_T%>'
<%
			}

			if(! M112_T.equals("")) {
%>
		 		M112='<%= M112_T%>'
<%
			}

			if(! M82_T.equals("")) {
%>
		 		M82='<%= M82_T%>'
<%
			}

			if(! BRST_F_T.equals("")) {
%>
		 		BRST_F='<%= BRST_F_T%>'
<%
			}

			if(! M88_T.equals("")) {
%>
		 		M88='<%= M88_T%>'
<%
			}

			if(! COLO_F_T.equals("")) {
%>
		 		COLO_F='<%= COLO_F_T%>'
<%
			}

			if(! M94_T.equals("")) {
%>
		 		M94='<%= M94_T%>'
<%
			}

			if(! LIVER_F_T.equals("")) {
%>
		 		LIVER_F='<%= LIVER_F_T%>'
<%
			}

			if(! M100_T.equals("")) {
%>
		 		M100='<%= M100_T%>'
<%
			}

			if(! CRVC_F_T.equals("")) {
%>
		 		CRVC_F='<%= CRVC_F_T%>'
<%
			}

			if(! M106_T.equals("")) {
%>
		 		M106='<%= M106_T%>'
<%
			}

			if(! M107_T.equals("")) {
%>
		 		M107='<%= M107_T%>'
<%
			}

			if(! ETC_F_T.equals("")) {
%>
		 		ETC_F='<%= ETC_F_T%>'
<%
			}

			if(! M113_T.equals("")) {
%>
		 		M113='<%= M113_T%>'
<%
			}

			if(! M114_T.equals("")) {
%>
		 		M114='<%= M114_T%>'
<%
			}

			if(! M115_T.equals("")) {
%>
		 		M115='<%= M115_T%>'
<%
			}

			if(! M116_T.equals("")) {
%>
		 		M116='<%= M116_T%>'
<%
			}

			if(! M117_T.equals("")) {
%>
		 		M117='<%= M117_T%>'
<%
			}

			if(! M118_T.equals("")) {
%>
		 		M118='<%= M118_T%>'
<%
			}

			if(! M119_T.equals("")) {
%>
		 		M119='<%= M119_T%>'
<%
			}

			if(! M120_T.equals("")) {
%>
		 		M120='<%= M120_T%>'
<%
			}

			if(! M121_T.equals("")) {
%>
		 		M121='<%= M121_T%>'
<%
			}

			if(! M122_T.equals("")) {
%>
		 		M122='<%= M122_T%>'
<%
			}

			if(! M123_T.equals("")) {
%>
		 		M123='<%= M123_T%>'
<%
			}

			if(! M124_T.equals("")) {
%>
		 		M124='<%= M124_T%>'
<%
			}

			if(! M125_T.equals("")) {
%>
		 		M125='<%= M125_T%>'
<%
			}

			if(! M126_T.equals("")) {
%>
		 		M126='<%= M126_T%>'
<%
			}

			if(! M127_T.equals("")) {
%>
		 		M127='<%= M127_T%>'
<%
			}

			if(! M128_T.equals("")) {
%>
		 		M128='<%= M128_T%>'
<%
			}

			if(! M129_T.equals("")) {
%>
		 		M129='<%= M129_T%>'
<%
			}

			if(! M130_T.equals("")) {
%>
		 		M130='<%= M130_T%>'
<%
			}

			if(! M131_T.equals("")) {
%>
		 		M131='<%= M131_T%>'
<%
			}

			if(! M132_T.equals("")) {
%>
		 		M132='<%= M132_T%>'
<%
			}

			if(! M133_T.equals("")) {
%>
		 		M133='<%= M133_T%>'
<%
			}

			if(! M134_T.equals("")) {
%>
		 		M134='<%= M134_T%>'
<%
			}

			if(! M135_T.equals("")) {
%>
		 		M135='<%= M135_T%>'
<%
			}

			if(! M136_T.equals("")) {
%>
		 		M136='<%= M136_T%>'
<%
			}

			if(! M137_T.equals("")) {
%>
		 		M137='<%= M137_T%>'
<%
			}

			if(! M138_T.equals("")) {
%>
		 		M138='<%= M138_T%>'
<%
			}

			if(! M139_T.equals("")) {
%>
		 		M139='<%= M139_T%>'
<%
			}

			if(! M140_T.equals("")) {
%>
		 		M140='<%= M140_T%>'
<%
			}

			if(! M141_T.equals("")) {
%>
		 		M141='<%= M141_T%>'
<%
			}

			if(! M142_T.equals("")) {
%>
		 		M142='<%= M142_T%>'
<%
			}

			if(! M143_T.equals("")) {
%>
		 		M143='<%= M143_T%>'
<%
			}

			if(! M144_T.equals("")) {
%>
		 		M144='<%= M144_T%>'
<%
			}

			if(! M145_T.equals("")) {
%>
		 		M145='<%= M145_T%>'
<%
			}

			if(! M146_T.equals("")) {
%>
		 		M146='<%= M146_T%>'
<%
			}

			if(! M147_T.equals("")) {
%>
		 		M147='<%= M147_T%>'
<%
			}

			if(! M148_T.equals("")) {
%>
		 		M148='<%= M148_T%>'
<%
			}

			if(! M986_T.equals("")) {
%>
		 		M986='<%= M986_T%>'
<%
			}

			if(! M987_T.equals("")) {
%>
		 		M987='<%= M987_T%>'
<%
			}

			if(! M988_T.equals("")) {
%>
		 		M988='<%= M988_T%>'
<%
			}

			if(! M989_T.equals("")) {
%>
		 		M989='<%= M989_T%>'
<%
			}

			if(! M990_T.equals("")) {
%>
		 		M990='<%= M990_T%>'
<%
			}

			if(! M991_T.equals("")) {
%>
		 		M991='<%= M991_T%>'
<%
			}

			if(! M992_T.equals("")) {
%>
		 		M992='<%= M992_T%>'
<%
			}

			if(! LUNG_F_T.equals("")) {
%>
		 		LUNG_F='<%= LUNG_F_T%>'
<%
			}

			if(! M993_T.equals("")) {
%>
		 		M993='<%= M993_T%>'
<%
			}

			if(! M994_T.equals("")) {
%>
		 		M994='<%= M994_T%>'
<%
			}

			if(! M995_T.equals("")) {
%>
		 		M995='<%= M995_T%>'
<%
			}

			if(! M996_T.equals("")) {
%>
		 		M996='<%= M996_T%>'
<%
			}

			if(! M997_T.equals("")) {
%>
		 		M997='<%= M997_T%>'
<%
			}

			if(! M998_T.equals("")) {
%>
		 		M998='<%= M998_T%>'
<%
			}

			if(! M999_T.equals("")) {
%>
		 		M999='<%= M999_T%>'
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
