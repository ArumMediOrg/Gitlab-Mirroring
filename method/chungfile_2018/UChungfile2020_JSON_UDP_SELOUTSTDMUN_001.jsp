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

SELECT EEA_MNGT_HTYR, EEA_INSU_NO,
       MAX(ICR_ZIP_CD) ICR_ZIP_CD, MAX(ICR_ZIP_AR) ICR_ZIP_AR, MAX(ICR_ROAD_AR) ICR_ROAD_AR,
       CASE WHEN MAX(ITEM4) ='2' THEN '0' ELSE MAX(ITEM4) END ITEM4,
       MAX(ITEM5) ITEM5,
       MAX(ITEM6) ITEM6,
       CASE WHEN MAX(ITEM7) ='2' THEN '0' ELSE MAX(ITEM7) END ITEM7,
       MAX(ITEM8) ITEM8,
       MAX(ITEM9) ITEM9,
       CASE WHEN MAX(ITEM10) ='2' THEN '0' ELSE MAX(ITEM10) END ITEM10,
       MAX(ITEM11) ITEM11,
       MAX(ITEM12) ITEM12,
       CASE WHEN MAX(ITEM13) ='2' THEN '0' ELSE MAX(ITEM13) END ITEM13,
       MAX(ITEM14) ITEM14,
       MAX(ITEM15) ITEM15,
       CASE WHEN MAX(ITEM16) ='2' THEN '0' ELSE MAX(ITEM16) END ITEM16,
       MAX(ITEM17) ITEM17,
       MAX(ITEM18) ITEM18,
       CASE WHEN MAX(ITEM19) ='2' THEN '0' ELSE MAX(ITEM19) END ITEM19,
       MAX(ITEM20) ITEM20,
       MAX(ITEM21) ITEM21,
       CASE WHEN MAX(ITEM22) ='2' THEN '0' ELSE MAX(ITEM22) END ITEM22,
       MAX(ITEM23) ITEM23,
       MAX(ITEM24) ITEM24,
       CASE WHEN MAX(ITEM25) ='2' THEN '0' ELSE MAX(ITEM25) END ITEM25,
       MAX(ITEM26) ITEM26,
       CASE WHEN MAX(ITEM27) ='2' THEN '0' ELSE MAX(ITEM27) END ITEM27,
       MAX(ITEM28) ITEM28,
       CASE WHEN MAX(ITEM29) ='2' THEN '0' ELSE MAX(ITEM29) END ITEM29,
       MAX(ITEM30) ITEM30,
       CASE WHEN MAX(ITEM31) ='2' THEN '0' ELSE MAX(ITEM31) END ITEM31,
       MAX(ITEM32) ITEM32,
       CASE WHEN MAX(ITEM33) ='2' THEN '0' ELSE MAX(ITEM33) END ITEM33,
       CASE WHEN MAX(ITEM34) ='2' THEN '0' ELSE MAX(ITEM34) END ITEM34,
       CASE WHEN MAX(ITEM35) ='2' THEN '0' ELSE MAX(ITEM35) END ITEM35,
       CASE WHEN MAX(ITEM36) ='2' THEN '0' ELSE MAX(ITEM36) END ITEM36,
       CASE WHEN MAX(ITEM37) ='2' THEN '0' ELSE MAX(ITEM37) END ITEM37,
       CASE WHEN MAX(ITEM38) ='2' THEN '0' ELSE MAX(ITEM38) END ITEM38,
       CASE WHEN MAX(ITEM39) ='2' THEN '0' ELSE MAX(ITEM39) END ITEM39,
       CASE WHEN MAX(ITEM40) ='2' THEN '0' ELSE MAX(ITEM40) END ITEM40,
       CASE WHEN MAX(ITEM41) ='2' THEN '0' ELSE MAX(ITEM41) END ITEM41,
       CASE WHEN MAX(ITEM42) ='2' THEN '0' ELSE MAX(ITEM42) END ITEM42,
       CASE WHEN MAX(ITEM43) ='2' THEN '0' ELSE MAX(ITEM43) END ITEM43,
       CASE WHEN MAX(ITEM44) ='2' THEN '0' ELSE MAX(ITEM44) END ITEM44,
       CASE WHEN MAX(ITEM45) ='2' THEN '0' ELSE MAX(ITEM45) END ITEM45,
       CASE WHEN MAX(ITEM46) ='2' THEN '0' ELSE MAX(ITEM46) END ITEM46,
       CASE WHEN MAX(ITEM47) ='2' THEN '0' ELSE MAX(ITEM47) END ITEM47,
       CASE WHEN MAX(ITEM48) ='2' THEN '0' ELSE MAX(ITEM48) END ITEM48,
       CASE WHEN MAX(ITEM49) ='2' THEN '0' ELSE MAX(ITEM49) END ITEM49,
       CASE WHEN MAX(ITEM50) ='2' THEN '0' ELSE MAX(ITEM50) END ITEM50,
       CASE WHEN MAX(ITEM51) ='2' THEN '0' ELSE MAX(ITEM51) END ITEM51,
       CASE WHEN MAX(ITEM52) ='2' THEN '0' ELSE MAX(ITEM52) END ITEM52,
       CASE WHEN MAX(ITEM53) ='2' THEN '0' ELSE MAX(ITEM53) END ITEM53,
       CASE WHEN MAX(ITEM54) ='2' THEN '0' ELSE MAX(ITEM54) END ITEM54,
       CASE WHEN MAX(ITEM55) ='2' THEN '0' ELSE MAX(ITEM55) END ITEM55,
       CASE WHEN MAX(ITEM56) ='2' THEN '0' ELSE MAX(ITEM56) END ITEM56,
       CASE WHEN MAX(ITEM57) ='2' THEN '0' ELSE MAX(ITEM57) END ITEM57,
       CASE WHEN MAX(ITEM58) ='2' THEN '0' ELSE MAX(ITEM58) END ITEM58,
       CASE WHEN MAX(ITEM59) ='2' THEN '0' ELSE MAX(ITEM59) END ITEM59,
       CASE WHEN MAX(ITEM60) ='2' THEN '0' ELSE MAX(ITEM60) END ITEM60,
       CASE WHEN MAX(ITEM61) ='2' THEN '0' ELSE MAX(ITEM61) END ITEM61,
       MAX(ITEM62) ITEM62,
       CASE WHEN MAX(ITEM63) ='2' THEN '0' ELSE MAX(ITEM63) END ITEM63,
       CASE WHEN MAX(ITEM64) ='2' THEN '0' ELSE MAX(ITEM64) END ITEM64,
       CASE WHEN MAX(ITEM65) ='2' THEN '0' ELSE MAX(ITEM65) END ITEM65,
       CASE WHEN MAX(ITEM66) ='2' THEN '0' ELSE MAX(ITEM66) END ITEM66,
       CASE WHEN MAX(ITEM67) ='2' THEN '0' ELSE MAX(ITEM67) END ITEM67,
       CASE WHEN MAX(ITEM68) ='2' THEN '0' ELSE MAX(ITEM68) END ITEM68,
       CASE WHEN MAX(ITEM69) ='2' THEN '0' ELSE MAX(ITEM69) END ITEM69,
       CASE WHEN MAX(ITEM70) ='2' THEN '0' ELSE MAX(ITEM70) END ITEM70,
       CASE WHEN MAX(ITEM71) ='2' THEN '0' ELSE MAX(ITEM71) END ITEM71,
       CASE WHEN MAX(ITEM72) ='2' THEN '0' ELSE MAX(ITEM72) END ITEM72,
       CASE WHEN MAX(ITEM73) ='2' THEN '0' ELSE MAX(ITEM73) END ITEM73,
       CASE WHEN MAX(ITEM74) ='2' THEN '0' ELSE MAX(ITEM74) END ITEM74,
       CASE WHEN MAX(ITEM75) ='2' THEN '0' ELSE MAX(ITEM75) END ITEM75,
       CASE WHEN MAX(ITEM76) ='2' THEN '0' ELSE MAX(ITEM76) END ITEM76,
       CASE WHEN MAX(ITEM77) ='2' THEN '0' ELSE MAX(ITEM77) END ITEM77,
       CASE WHEN MAX(ITEM78) ='2' THEN '0' ELSE MAX(ITEM78) END ITEM78,
       CASE WHEN MAX(ITEM79) ='2' THEN '0' ELSE MAX(ITEM79) END ITEM79,
       CASE WHEN MAX(ITEM80) ='2' THEN '0' ELSE MAX(ITEM80) END ITEM80,
       CASE WHEN MAX(ITEM81) ='2' THEN '0' ELSE MAX(ITEM81) END ITEM81,
       CASE WHEN MAX(ITEM82) ='2' THEN '0' ELSE MAX(ITEM82) END ITEM82,
       CASE WHEN MAX(ITEM83) ='2' THEN '0' ELSE MAX(ITEM83) END ITEM83,
       CASE WHEN MAX(ITEM84) ='2' THEN '0' ELSE MAX(ITEM84) END ITEM84,
       CASE WHEN MAX(ITEM85) ='2' THEN '0' ELSE MAX(ITEM85) END ITEM85,
       CASE WHEN MAX(ITEM86) ='2' THEN '0' ELSE MAX(ITEM86) END ITEM86,
       CASE WHEN MAX(ITEM87) ='2' THEN '0' ELSE MAX(ITEM87) END ITEM87,
       CASE WHEN MAX(ITEM88) ='2' THEN '0' ELSE MAX(ITEM88) END ITEM88
  FROM (SELECT EEA_EXAM_DT,
               EEA_EXAM_SQ,
               EEA_MNGT_HTYR,
               F_RPAD(ICR_PENL_ID,13,' ') ICR_PENL_ID,
               EEA_INSU_NO,
               ICR_TEL_NO,
               ICR_MOBL_NO,
               ICR_EMAI_AR,
               ICR_INFO_YN,
               ICR_ZIP_CD, ICR_ZIP_AR, ICR_ROAD_AR,
               CASE WHEN IIQ_QGTN_CD='504' THEN QQN_RESULT END ITEM4,
               CASE WHEN IIQ_QGTN_CD='505' THEN QQN_RESULT END ITEM5,
               CASE WHEN IIQ_QGTN_CD='506' THEN QQN_RESULT END ITEM6,
               CASE WHEN IIQ_QGTN_CD='507' THEN QQN_RESULT END ITEM7,
               CASE WHEN IIQ_QGTN_CD='508' THEN QQN_RESULT END ITEM8,
               CASE WHEN IIQ_QGTN_CD='509' THEN QQN_RESULT END ITEM9,
               CASE WHEN IIQ_QGTN_CD='510' THEN QQN_RESULT END ITEM10,
               CASE WHEN IIQ_QGTN_CD='511' THEN QQN_RESULT END ITEM11,
               CASE WHEN IIQ_QGTN_CD='512' THEN QQN_RESULT END ITEM12,
               CASE WHEN IIQ_QGTN_CD='513' THEN QQN_RESULT END ITEM13,
               CASE WHEN IIQ_QGTN_CD='514' THEN QQN_RESULT END ITEM14,
               CASE WHEN IIQ_QGTN_CD='515' THEN QQN_RESULT END ITEM15,
               CASE WHEN IIQ_QGTN_CD='516' THEN QQN_RESULT END ITEM16,
               CASE WHEN IIQ_QGTN_CD='517' THEN QQN_RESULT END ITEM17,
               CASE WHEN IIQ_QGTN_CD='518' THEN QQN_RESULT END ITEM18,
               CASE WHEN IIQ_QGTN_CD='519' THEN QQN_RESULT END ITEM19,
               CASE WHEN IIQ_QGTN_CD='520' THEN QQN_RESULT END ITEM20,
               CASE WHEN IIQ_QGTN_CD='521' THEN QQN_RESULT END ITEM21,
               CASE WHEN IIQ_QGTN_CD='522' THEN QQN_RESULT END ITEM22,
               CASE WHEN IIQ_QGTN_CD='523' THEN QQN_RESULT END ITEM23,
               CASE WHEN IIQ_QGTN_CD='524' THEN QQN_RESULT END ITEM24,
               CASE WHEN IIQ_QGTN_CD='824' THEN QQN_RESULT END ITEM25,
               CASE WHEN IIQ_QGTN_CD='825' THEN QQN_RESULT END ITEM26,
               CASE WHEN IIQ_QGTN_CD='826' THEN QQN_RESULT END ITEM27,
               CASE WHEN IIQ_QGTN_CD='827' THEN QQN_RESULT END ITEM28,
               CASE WHEN IIQ_QGTN_CD='828' THEN QQN_RESULT END ITEM29,
               CASE WHEN IIQ_QGTN_CD='829' THEN QQN_RESULT END ITEM30,
               CASE WHEN IIQ_QGTN_CD='830' THEN QQN_RESULT END ITEM31,
               CASE WHEN IIQ_QGTN_CD='831' THEN QQN_RESULT END ITEM32,
               CASE WHEN IIQ_QGTN_CD='599' THEN QQN_RESULT END ITEM33,
               CASE WHEN IIQ_QGTN_CD='600' THEN QQN_RESULT END ITEM34,
               CASE WHEN IIQ_QGTN_CD='601' THEN QQN_RESULT END ITEM35,
               CASE WHEN IIQ_QGTN_CD='607' THEN QQN_RESULT END ITEM36,
               CASE WHEN IIQ_QGTN_CD='608' THEN QQN_RESULT END ITEM37,
               CASE WHEN IIQ_QGTN_CD='604' THEN QQN_RESULT END ITEM38,
               CASE WHEN IIQ_QGTN_CD='606' THEN QQN_RESULT END ITEM39,
               CASE WHEN IIQ_QGTN_CD='609' THEN QQN_RESULT END ITEM40,
               CASE WHEN IIQ_QGTN_CD='605' THEN QQN_RESULT END ITEM41,
               CASE WHEN IIQ_QGTN_CD='610' THEN QQN_RESULT END ITEM42,
               CASE WHEN IIQ_QGTN_CD='617' THEN QQN_RESULT END ITEM43,
               CASE WHEN IIQ_QGTN_CD='618' THEN QQN_RESULT END ITEM44,
               CASE WHEN IIQ_QGTN_CD='623' THEN QQN_RESULT END ITEM45,
               CASE WHEN IIQ_QGTN_CD='624' THEN QQN_RESULT END ITEM46,
               CASE WHEN IIQ_QGTN_CD='625' THEN QQN_RESULT END ITEM47,
               CASE WHEN IIQ_QGTN_CD='626' THEN QQN_RESULT END ITEM48,
               CASE WHEN IIQ_QGTN_CD='632' THEN QQN_RESULT END ITEM49,
               CASE WHEN IIQ_QGTN_CD='834' THEN QQN_RESULT END ITEM50,
               CASE WHEN IIQ_QGTN_CD='634' THEN QQN_RESULT END ITEM51,
               CASE WHEN IIQ_QGTN_CD='635' THEN QQN_RESULT END ITEM52,
               CASE WHEN IIQ_QGTN_CD='835' THEN QQN_RESULT END ITEM53,
               CASE WHEN IIQ_QGTN_CD='636' THEN QQN_RESULT END ITEM54,
               CASE WHEN IIQ_QGTN_CD='637' THEN QQN_RESULT END ITEM55,
               CASE WHEN IIQ_QGTN_CD='644' THEN QQN_RESULT END ITEM56,
               CASE WHEN IIQ_QGTN_CD='639' THEN QQN_RESULT END ITEM57,
               CASE WHEN IIQ_QGTN_CD='646' THEN QQN_RESULT END ITEM58,
               CASE WHEN IIQ_QGTN_CD='647' THEN QQN_RESULT END ITEM59,
               CASE WHEN IIQ_QGTN_CD='836' THEN QQN_RESULT END ITEM60,
               CASE WHEN IIQ_QGTN_CD='652' THEN QQN_RESULT END ITEM61,
               CASE WHEN IIQ_QGTN_CD='846' THEN QQN_RESULT END ITEM62,
               CASE WHEN IIQ_QGTN_CD='657' THEN QQN_RESULT END ITEM63,
               CASE WHEN IIQ_QGTN_CD='654' THEN QQN_RESULT END ITEM64,
               CASE WHEN IIQ_QGTN_CD='658' THEN QQN_RESULT END ITEM65,
               CASE WHEN IIQ_QGTN_CD='659' THEN QQN_RESULT END ITEM66,
               CASE WHEN IIQ_QGTN_CD='660' THEN QQN_RESULT END ITEM67,
               CASE WHEN IIQ_QGTN_CD='663' THEN QQN_RESULT END ITEM68,
               CASE WHEN IIQ_QGTN_CD='662' THEN QQN_RESULT END ITEM69,
               CASE WHEN IIQ_QGTN_CD='664' THEN QQN_RESULT END ITEM70,
               CASE WHEN IIQ_QGTN_CD='665' THEN QQN_RESULT END ITEM71,
               CASE WHEN IIQ_QGTN_CD='666' THEN QQN_RESULT END ITEM72,
               CASE WHEN IIQ_QGTN_CD='847' THEN QQN_RESULT END ITEM73,
               CASE WHEN IIQ_QGTN_CD='671' THEN QQN_RESULT END ITEM74,
               CASE WHEN IIQ_QGTN_CD='672' THEN QQN_RESULT END ITEM75,
               CASE WHEN IIQ_QGTN_CD='848' THEN QQN_RESULT END ITEM76,
               CASE WHEN IIQ_QGTN_CD='849' THEN QQN_RESULT END ITEM77,
               CASE WHEN IIQ_QGTN_CD='850' THEN QQN_RESULT END ITEM78,
               CASE WHEN IIQ_QGTN_CD='851' THEN QQN_RESULT END ITEM79,
               CASE WHEN IIQ_QGTN_CD='852' THEN QQN_RESULT END ITEM80,
               CASE WHEN IIQ_QGTN_CD='853' THEN QQN_RESULT END ITEM81,
               CASE WHEN IIQ_QGTN_CD='854' THEN QQN_RESULT END ITEM82,
               CASE WHEN IIQ_QGTN_CD='855' THEN QQN_RESULT END ITEM83,
               CASE WHEN IIQ_QGTN_CD='856' THEN QQN_RESULT END ITEM84,
               CASE WHEN IIQ_QGTN_CD='691' THEN QQN_RESULT END ITEM85,
               CASE WHEN IIQ_QGTN_CD='692' THEN QQN_RESULT END ITEM86,
               CASE WHEN IIQ_QGTN_CD='695' THEN QQN_RESULT END ITEM87,
               CASE WHEN IIQ_QGTN_CD='985' THEN QQN_RESULT END ITEM88
          FROM QT_QUESTION A
               LEFT OUTER JOIN ET_EXAM_ACPT     B ON A.QQN_EXAM_DT=B.EEA_EXAM_DT
                                                 AND A.QQN_EXAM_SQ=B.EEA_EXAM_SQ
               LEFT OUTER JOIN IT_CUSTOMER      C ON B.EEA_CUST_NO=C.ICR_CUST_NO
               LEFT OUTER JOIN IT_ITEM_QUESTION D ON A.QQN_QSTN_CD=D.IIQ_QGTN_CD
        WHERE EEA_EXAM_DT = :EXAM_DT
          AND EEA_EXAM_SQ = :EXAM_SQ
          AND IIQ_ITEM_CD IN('M0054')
          AND EEA_EXAM_CD in('31006')
     ) TTT
GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, EEA_MNGT_HTYR, EEA_INSU_NO
		*/

		sql = " SELECT EEA_MNGT_HTYR, EEA_INSU_NO, MAX(ICR_ZIP_CD) ICR_ZIP_CD, MAX(ICR_ZIP_AR) ICR_ZIP_AR, MAX(ICR_ROAD_AR) ICR_ROAD_AR";
		sql += ", CASE WHEN MAX(ITEM4) ='2' THEN '0' ELSE MAX(ITEM4) END ITEM4, MAX(ITEM5) ITEM5, MAX(ITEM6) ITEM6";
		sql += ", CASE WHEN MAX(ITEM7) ='2' THEN '0' ELSE MAX(ITEM7) END ITEM7, MAX(ITEM8) ITEM8, MAX(ITEM9) ITEM9";
		sql += ", CASE WHEN MAX(ITEM10) ='2' THEN '0' ELSE MAX(ITEM10) END ITEM10, MAX(ITEM11) ITEM11, MAX(ITEM12) ITEM12";
		sql += ", CASE WHEN MAX(ITEM13) ='2' THEN '0' ELSE MAX(ITEM13) END ITEM13, MAX(ITEM14) ITEM14, MAX(ITEM15) ITEM15";
		sql += ", CASE WHEN MAX(ITEM16) ='2' THEN '0' ELSE MAX(ITEM16) END ITEM16, MAX(ITEM17) ITEM17, MAX(ITEM18) ITEM18";
		sql += ", CASE WHEN MAX(ITEM19) ='2' THEN '0' ELSE MAX(ITEM19) END ITEM19, MAX(ITEM20) ITEM20, MAX(ITEM21) ITEM21";
		sql += ", CASE WHEN MAX(ITEM22) ='2' THEN '0' ELSE MAX(ITEM22) END ITEM22, MAX(ITEM23) ITEM23, MAX(ITEM24) ITEM24";
		sql += ", CASE WHEN MAX(ITEM25) ='2' THEN '0' ELSE MAX(ITEM25) END ITEM25, MAX(ITEM26) ITEM26";
		sql += ", CASE WHEN MAX(ITEM27) ='2' THEN '0' ELSE MAX(ITEM27) END ITEM27, MAX(ITEM28) ITEM28";
		sql += ", CASE WHEN MAX(ITEM29) ='2' THEN '0' ELSE MAX(ITEM29) END ITEM29, MAX(ITEM30) ITEM30";
		sql += ", CASE WHEN MAX(ITEM31) ='2' THEN '0' ELSE MAX(ITEM31) END ITEM31, MAX(ITEM32) ITEM32";
		sql += ", CASE WHEN MAX(ITEM33) ='2' THEN '0' ELSE MAX(ITEM33) END ITEM33";
		sql += ", CASE WHEN MAX(ITEM34) ='2' THEN '0' ELSE MAX(ITEM34) END ITEM34";
		sql += ", CASE WHEN MAX(ITEM35) ='2' THEN '0' ELSE MAX(ITEM35) END ITEM35";
		sql += ", CASE WHEN MAX(ITEM36) ='2' THEN '0' ELSE MAX(ITEM36) END ITEM36";
		sql += ", CASE WHEN MAX(ITEM37) ='2' THEN '0' ELSE MAX(ITEM37) END ITEM37";
		sql += ", CASE WHEN MAX(ITEM38) ='2' THEN '0' ELSE MAX(ITEM38) END ITEM38";
		sql += ", CASE WHEN MAX(ITEM39) ='2' THEN '0' ELSE MAX(ITEM39) END ITEM39";
		sql += ", CASE WHEN MAX(ITEM40) ='2' THEN '0' ELSE MAX(ITEM40) END ITEM40";
		sql += ", CASE WHEN MAX(ITEM41) ='2' THEN '0' ELSE MAX(ITEM41) END ITEM41";
		sql += ", CASE WHEN MAX(ITEM42) ='2' THEN '0' ELSE MAX(ITEM42) END ITEM42";
		sql += ", CASE WHEN MAX(ITEM43) ='2' THEN '0' ELSE MAX(ITEM43) END ITEM43";
		sql += ", CASE WHEN MAX(ITEM44) ='2' THEN '0' ELSE MAX(ITEM44) END ITEM44";
		sql += ", CASE WHEN MAX(ITEM45) ='2' THEN '0' ELSE MAX(ITEM45) END ITEM45";
		sql += ", CASE WHEN MAX(ITEM46) ='2' THEN '0' ELSE MAX(ITEM46) END ITEM46";
		sql += ", CASE WHEN MAX(ITEM47) ='2' THEN '0' ELSE MAX(ITEM47) END ITEM47";
		sql += ", CASE WHEN MAX(ITEM48) ='2' THEN '0' ELSE MAX(ITEM48) END ITEM48";
		sql += ", CASE WHEN MAX(ITEM49) ='2' THEN '0' ELSE MAX(ITEM49) END ITEM49";
		sql += ", CASE WHEN MAX(ITEM50) ='2' THEN '0' ELSE MAX(ITEM50) END ITEM50";
		sql += ", CASE WHEN MAX(ITEM51) ='2' THEN '0' ELSE MAX(ITEM51) END ITEM51";
		sql += ", CASE WHEN MAX(ITEM52) ='2' THEN '0' ELSE MAX(ITEM52) END ITEM52";
		sql += ", CASE WHEN MAX(ITEM53) ='2' THEN '0' ELSE MAX(ITEM53) END ITEM53";
		sql += ", CASE WHEN MAX(ITEM54) ='2' THEN '0' ELSE MAX(ITEM54) END ITEM54";
		sql += ", CASE WHEN MAX(ITEM55) ='2' THEN '0' ELSE MAX(ITEM55) END ITEM55";
		sql += ", CASE WHEN MAX(ITEM56) ='2' THEN '0' ELSE MAX(ITEM56) END ITEM56";
		sql += ", CASE WHEN MAX(ITEM57) ='2' THEN '0' ELSE MAX(ITEM57) END ITEM57";
		sql += ", CASE WHEN MAX(ITEM58) ='2' THEN '0' ELSE MAX(ITEM58) END ITEM58";
		sql += ", CASE WHEN MAX(ITEM59) ='2' THEN '0' ELSE MAX(ITEM59) END ITEM59";
		sql += ", CASE WHEN MAX(ITEM60) ='2' THEN '0' ELSE MAX(ITEM60) END ITEM60";
		sql += ", CASE WHEN MAX(ITEM61) ='2' THEN '0' ELSE MAX(ITEM61) END ITEM61";
		sql += ", MAX(ITEM62) ITEM62";
		sql += ", CASE WHEN MAX(ITEM63) ='2' THEN '0' ELSE MAX(ITEM63) END ITEM63";
		sql += ", CASE WHEN MAX(ITEM64) ='2' THEN '0' ELSE MAX(ITEM64) END ITEM64";
		sql += ", CASE WHEN MAX(ITEM65) ='2' THEN '0' ELSE MAX(ITEM65) END ITEM65";
		sql += ", CASE WHEN MAX(ITEM66) ='2' THEN '0' ELSE MAX(ITEM66) END ITEM66";
		sql += ", CASE WHEN MAX(ITEM67) ='2' THEN '0' ELSE MAX(ITEM67) END ITEM67";
		sql += ", CASE WHEN MAX(ITEM68) ='2' THEN '0' ELSE MAX(ITEM68) END ITEM68";
		sql += ", CASE WHEN MAX(ITEM69) ='2' THEN '0' ELSE MAX(ITEM69) END ITEM69";
		sql += ", CASE WHEN MAX(ITEM70) ='2' THEN '0' ELSE MAX(ITEM70) END ITEM70";
		sql += ", CASE WHEN MAX(ITEM71) ='2' THEN '0' ELSE MAX(ITEM71) END ITEM71";
		sql += ", CASE WHEN MAX(ITEM72) ='2' THEN '0' ELSE MAX(ITEM72) END ITEM72";
		sql += ", CASE WHEN MAX(ITEM73) ='2' THEN '0' ELSE MAX(ITEM73) END ITEM73";
		sql += ", CASE WHEN MAX(ITEM74) ='2' THEN '0' ELSE MAX(ITEM74) END ITEM74";
		sql += ", CASE WHEN MAX(ITEM75) ='2' THEN '0' ELSE MAX(ITEM75) END ITEM75";
		sql += ", CASE WHEN MAX(ITEM76) ='2' THEN '0' ELSE MAX(ITEM76) END ITEM76";
		sql += ", CASE WHEN MAX(ITEM77) ='2' THEN '0' ELSE MAX(ITEM77) END ITEM77";
		sql += ", CASE WHEN MAX(ITEM78) ='2' THEN '0' ELSE MAX(ITEM78) END ITEM78";
		sql += ", CASE WHEN MAX(ITEM79) ='2' THEN '0' ELSE MAX(ITEM79) END ITEM79";
		sql += ", CASE WHEN MAX(ITEM80) ='2' THEN '0' ELSE MAX(ITEM80) END ITEM80";
		sql += ", CASE WHEN MAX(ITEM81) ='2' THEN '0' ELSE MAX(ITEM81) END ITEM81";
		sql += ", CASE WHEN MAX(ITEM82) ='2' THEN '0' ELSE MAX(ITEM82) END ITEM82";
		sql += ", CASE WHEN MAX(ITEM83) ='2' THEN '0' ELSE MAX(ITEM83) END ITEM83";
		sql += ", CASE WHEN MAX(ITEM84) ='2' THEN '0' ELSE MAX(ITEM84) END ITEM84";
		sql += ", CASE WHEN MAX(ITEM85) ='2' THEN '0' ELSE MAX(ITEM85) END ITEM85";
		sql += ", CASE WHEN MAX(ITEM86) ='2' THEN '0' ELSE MAX(ITEM86) END ITEM86";
		sql += ", CASE WHEN MAX(ITEM87) ='2' THEN '0' ELSE MAX(ITEM87) END ITEM87";
		sql += ", CASE WHEN MAX(ITEM88) ='2' THEN '0' ELSE MAX(ITEM88) END ITEM88";

		sql += " FROM (";
		sql += "	SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_MNGT_HTYR, F_RPAD(ICR_PENL_ID,13,' ') ICR_PENL_ID, EEA_INSU_NO, ICR_TEL_NO, ICR_MOBL_NO, ICR_EMAI_AR, ICR_INFO_YN, ICR_ZIP_CD, ICR_ZIP_AR, ICR_ROAD_AR";
		sql += "	, CASE WHEN IIQ_QGTN_CD='504' THEN QQN_RESULT END ITEM4";
		sql += "	, CASE WHEN IIQ_QGTN_CD='505' THEN QQN_RESULT END ITEM5";
		sql += "	, CASE WHEN IIQ_QGTN_CD='506' THEN QQN_RESULT END ITEM6";
		sql += "	, CASE WHEN IIQ_QGTN_CD='507' THEN QQN_RESULT END ITEM7";
		sql += "	, CASE WHEN IIQ_QGTN_CD='508' THEN QQN_RESULT END ITEM8";
		sql += "	, CASE WHEN IIQ_QGTN_CD='509' THEN QQN_RESULT END ITEM9";
		sql += "	, CASE WHEN IIQ_QGTN_CD='510' THEN QQN_RESULT END ITEM10";
		sql += "	, CASE WHEN IIQ_QGTN_CD='511' THEN QQN_RESULT END ITEM11";
		sql += "	, CASE WHEN IIQ_QGTN_CD='512' THEN QQN_RESULT END ITEM12";
		sql += "	, CASE WHEN IIQ_QGTN_CD='513' THEN QQN_RESULT END ITEM13";
		sql += "	, CASE WHEN IIQ_QGTN_CD='514' THEN QQN_RESULT END ITEM14";
		sql += "	, CASE WHEN IIQ_QGTN_CD='515' THEN QQN_RESULT END ITEM15";
		sql += "	, CASE WHEN IIQ_QGTN_CD='516' THEN QQN_RESULT END ITEM16";
		sql += "	, CASE WHEN IIQ_QGTN_CD='517' THEN QQN_RESULT END ITEM17";
		sql += "	, CASE WHEN IIQ_QGTN_CD='518' THEN QQN_RESULT END ITEM18";
		sql += "	, CASE WHEN IIQ_QGTN_CD='519' THEN QQN_RESULT END ITEM19";
		sql += "	, CASE WHEN IIQ_QGTN_CD='520' THEN QQN_RESULT END ITEM20";
		sql += "	, CASE WHEN IIQ_QGTN_CD='521' THEN QQN_RESULT END ITEM21";
		sql += "	, CASE WHEN IIQ_QGTN_CD='522' THEN QQN_RESULT END ITEM22";
		sql += "	, CASE WHEN IIQ_QGTN_CD='523' THEN QQN_RESULT END ITEM23";
		sql += "	, CASE WHEN IIQ_QGTN_CD='524' THEN QQN_RESULT END ITEM24";
		sql += "	, CASE WHEN IIQ_QGTN_CD='824' THEN QQN_RESULT END ITEM25";
		sql += "	, CASE WHEN IIQ_QGTN_CD='825' THEN QQN_RESULT END ITEM26";
		sql += "	, CASE WHEN IIQ_QGTN_CD='826' THEN QQN_RESULT END ITEM27";
		sql += "	, CASE WHEN IIQ_QGTN_CD='827' THEN QQN_RESULT END ITEM28";
		sql += "	, CASE WHEN IIQ_QGTN_CD='828' THEN QQN_RESULT END ITEM29";
		sql += "	, CASE WHEN IIQ_QGTN_CD='829' THEN QQN_RESULT END ITEM30";
		sql += "	, CASE WHEN IIQ_QGTN_CD='830' THEN QQN_RESULT END ITEM31";
		sql += "	, CASE WHEN IIQ_QGTN_CD='831' THEN QQN_RESULT END ITEM32";
		sql += "	, CASE WHEN IIQ_QGTN_CD='599' THEN QQN_RESULT END ITEM33";
		sql += "	, CASE WHEN IIQ_QGTN_CD='600' THEN QQN_RESULT END ITEM34";
		sql += "	, CASE WHEN IIQ_QGTN_CD='601' THEN QQN_RESULT END ITEM35";
		sql += "	, CASE WHEN IIQ_QGTN_CD='607' THEN QQN_RESULT END ITEM36";
		sql += "	, CASE WHEN IIQ_QGTN_CD='608' THEN QQN_RESULT END ITEM37";
		sql += "	, CASE WHEN IIQ_QGTN_CD='604' THEN QQN_RESULT END ITEM38";
		sql += "	, CASE WHEN IIQ_QGTN_CD='606' THEN QQN_RESULT END ITEM39";
		sql += "	, CASE WHEN IIQ_QGTN_CD='609' THEN QQN_RESULT END ITEM40";
		sql += "	, CASE WHEN IIQ_QGTN_CD='605' THEN QQN_RESULT END ITEM41";
		sql += "	, CASE WHEN IIQ_QGTN_CD='610' THEN QQN_RESULT END ITEM42";
		sql += "	, CASE WHEN IIQ_QGTN_CD='617' THEN QQN_RESULT END ITEM43";
		sql += "	, CASE WHEN IIQ_QGTN_CD='618' THEN QQN_RESULT END ITEM44";
		sql += "	, CASE WHEN IIQ_QGTN_CD='623' THEN QQN_RESULT END ITEM45";
		sql += "	, CASE WHEN IIQ_QGTN_CD='624' THEN QQN_RESULT END ITEM46";
		sql += "	, CASE WHEN IIQ_QGTN_CD='625' THEN QQN_RESULT END ITEM47";
		sql += "	, CASE WHEN IIQ_QGTN_CD='626' THEN QQN_RESULT END ITEM48";
		sql += "	, CASE WHEN IIQ_QGTN_CD='632' THEN QQN_RESULT END ITEM49";
		sql += "	, CASE WHEN IIQ_QGTN_CD='834' THEN QQN_RESULT END ITEM50";
		sql += "	, CASE WHEN IIQ_QGTN_CD='634' THEN QQN_RESULT END ITEM51";
		sql += "	, CASE WHEN IIQ_QGTN_CD='635' THEN QQN_RESULT END ITEM52";
		sql += "	, CASE WHEN IIQ_QGTN_CD='835' THEN QQN_RESULT END ITEM53";
		sql += "	, CASE WHEN IIQ_QGTN_CD='636' THEN QQN_RESULT END ITEM54";
		sql += "	, CASE WHEN IIQ_QGTN_CD='637' THEN QQN_RESULT END ITEM55";
		sql += "	, CASE WHEN IIQ_QGTN_CD='644' THEN QQN_RESULT END ITEM56";
		sql += "	, CASE WHEN IIQ_QGTN_CD='639' THEN QQN_RESULT END ITEM57";
		sql += "	, CASE WHEN IIQ_QGTN_CD='646' THEN QQN_RESULT END ITEM58";
		sql += "	, CASE WHEN IIQ_QGTN_CD='647' THEN QQN_RESULT END ITEM59";
		sql += "	, CASE WHEN IIQ_QGTN_CD='836' THEN QQN_RESULT END ITEM60";
		sql += "	, CASE WHEN IIQ_QGTN_CD='652' THEN QQN_RESULT END ITEM61";
		sql += "	, CASE WHEN IIQ_QGTN_CD='846' THEN QQN_RESULT END ITEM62";
		sql += "	, CASE WHEN IIQ_QGTN_CD='657' THEN QQN_RESULT END ITEM63";
		sql += "	, CASE WHEN IIQ_QGTN_CD='654' THEN QQN_RESULT END ITEM64";
		sql += "	, CASE WHEN IIQ_QGTN_CD='658' THEN QQN_RESULT END ITEM65";
		sql += "	, CASE WHEN IIQ_QGTN_CD='659' THEN QQN_RESULT END ITEM66";
		sql += "	, CASE WHEN IIQ_QGTN_CD='660' THEN QQN_RESULT END ITEM67";
		sql += "	, CASE WHEN IIQ_QGTN_CD='663' THEN QQN_RESULT END ITEM68";
		sql += "	, CASE WHEN IIQ_QGTN_CD='662' THEN QQN_RESULT END ITEM69";
		sql += "	, CASE WHEN IIQ_QGTN_CD='664' THEN QQN_RESULT END ITEM70";
		sql += "	, CASE WHEN IIQ_QGTN_CD='665' THEN QQN_RESULT END ITEM71";
		sql += "	, CASE WHEN IIQ_QGTN_CD='666' THEN QQN_RESULT END ITEM72";
		sql += "	, CASE WHEN IIQ_QGTN_CD='847' THEN QQN_RESULT END ITEM73";
		sql += "	, CASE WHEN IIQ_QGTN_CD='671' THEN QQN_RESULT END ITEM74";
		sql += "	, CASE WHEN IIQ_QGTN_CD='672' THEN QQN_RESULT END ITEM75";
		sql += "	, CASE WHEN IIQ_QGTN_CD='848' THEN QQN_RESULT END ITEM76";
		sql += "	, CASE WHEN IIQ_QGTN_CD='849' THEN QQN_RESULT END ITEM77";
		sql += "	, CASE WHEN IIQ_QGTN_CD='850' THEN QQN_RESULT END ITEM78";
		sql += "	, CASE WHEN IIQ_QGTN_CD='851' THEN QQN_RESULT END ITEM79";
		sql += "	, CASE WHEN IIQ_QGTN_CD='852' THEN QQN_RESULT END ITEM80";
		sql += "	, CASE WHEN IIQ_QGTN_CD='853' THEN QQN_RESULT END ITEM81";
		sql += "	, CASE WHEN IIQ_QGTN_CD='854' THEN QQN_RESULT END ITEM82";
		sql += "	, CASE WHEN IIQ_QGTN_CD='855' THEN QQN_RESULT END ITEM83";
		sql += "	, CASE WHEN IIQ_QGTN_CD='856' THEN QQN_RESULT END ITEM84";
		sql += "	, CASE WHEN IIQ_QGTN_CD='691' THEN QQN_RESULT END ITEM85";
		sql += "	, CASE WHEN IIQ_QGTN_CD='692' THEN QQN_RESULT END ITEM86";
		sql += "	, CASE WHEN IIQ_QGTN_CD='695' THEN QQN_RESULT END ITEM87";
		sql += "	, CASE WHEN IIQ_QGTN_CD='985' THEN QQN_RESULT END ITEM88";

		sql += " 	FROM QT_QUESTION A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " 	ON A.QQN_EXAM_DT=B.EEA_EXAM_DT";
		sql += " 	AND A.QQN_EXAM_SQ=B.EEA_EXAM_SQ";

		sql += "	LEFT OUTER JOIN IT_CUSTOMER C";
		sql += " 	ON B.EEA_CUST_NO=C.ICR_CUST_NO";
		
		sql += "	LEFT OUTER JOIN IT_ITEM_QUESTION D";
		sql += " 	ON A.QQN_QSTN_CD=D.IIQ_QGTN_CD";

		sql += " 	WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " 	AND IIQ_ITEM_CD IN('M0054')";
		sql += " 	AND EEA_EXAM_CD IN('31006')";
		sql += " ) TTT";
		sql += " GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, EEA_MNGT_HTYR, EEA_INSU_NO";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UChungfile2020_JSON_UDP_SELOUTSTDMUN_001 \n";
			G_INFO += "설명 : 청구생성(학교밖 문진) 조회 \n";
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
		<s:AttributeType name='EEA_MNGT_HTYR' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_NO' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_CD' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_AR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ROAD_AR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM4' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM5' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM6' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM7' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM8' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM9' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM10' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM11' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM12' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM13' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM14' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM15' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM16' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM17' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM18' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM19' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM20' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM21' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM22' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM23' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM24' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM25' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM26' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM27' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM28' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM29' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM30' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM31' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM32' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM33' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM34' rs:number='36' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM35' rs:number='37' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM36' rs:number='38' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM37' rs:number='39' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM38' rs:number='40' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM39' rs:number='41' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM40' rs:number='42' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM41' rs:number='43' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM42' rs:number='44' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM43' rs:number='45' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM44' rs:number='46' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM45' rs:number='47' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM46' rs:number='48' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM47' rs:number='49' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM48' rs:number='50' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM49' rs:number='51' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM50' rs:number='52' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM51' rs:number='53' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM52' rs:number='54' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM53' rs:number='55' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM54' rs:number='56' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM55' rs:number='57' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM56' rs:number='58' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM57' rs:number='59' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM58' rs:number='60' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM59' rs:number='61' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM60' rs:number='62' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM61' rs:number='63' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM62' rs:number='64' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM63' rs:number='65' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM64' rs:number='66' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM65' rs:number='67' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM66' rs:number='68' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM67' rs:number='69' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM68' rs:number='70' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM69' rs:number='71' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM70' rs:number='72' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM71' rs:number='73' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM72' rs:number='74' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM73' rs:number='75' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM74' rs:number='76' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM75' rs:number='77' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM76' rs:number='78' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM77' rs:number='79' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM78' rs:number='80' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM79' rs:number='81' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM80' rs:number='82' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM81' rs:number='83' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM82' rs:number='84' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM83' rs:number='85' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM84' rs:number='86' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM85' rs:number='87' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM86' rs:number='88' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM87' rs:number='89' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM88' rs:number='90' rs:nullable='true'>
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

			String EEA_MNGT_HTYR_T = cRsList.getString("EEA_MNGT_HTYR");
			String EEA_INSU_NO_T = cRsList.getString("EEA_INSU_NO");
			String ICR_ZIP_CD_T = cRsList.getString("ICR_ZIP_CD");
			String ICR_ZIP_AR_T = cRsList.getString("ICR_ZIP_AR");
			String ICR_ROAD_AR_T = cRsList.getString("ICR_ROAD_AR");
			String ITEM4_T = cRsList.getString("ITEM4");
			String ITEM5_T = cRsList.getString("ITEM5");
			String ITEM6_T = cRsList.getString("ITEM6");
			String ITEM7_T = cRsList.getString("ITEM7");
			String ITEM8_T = cRsList.getString("ITEM8");
			String ITEM9_T = cRsList.getString("ITEM9");
			String ITEM10_T = cRsList.getString("ITEM10");
			String ITEM11_T = cRsList.getString("ITEM11");
			String ITEM12_T = cRsList.getString("ITEM12");
			String ITEM13_T = cRsList.getString("ITEM13");
			String ITEM14_T = cRsList.getString("ITEM14");
			String ITEM15_T = cRsList.getString("ITEM15");
			String ITEM16_T = cRsList.getString("ITEM16");
			String ITEM17_T = cRsList.getString("ITEM17");
			String ITEM18_T = cRsList.getString("ITEM18");
			String ITEM19_T = cRsList.getString("ITEM19");
			String ITEM20_T = cRsList.getString("ITEM20");
			String ITEM21_T = cRsList.getString("ITEM21");
			String ITEM22_T = cRsList.getString("ITEM22");
			String ITEM23_T = cRsList.getString("ITEM23");
			String ITEM24_T = cRsList.getString("ITEM24");
			String ITEM25_T = cRsList.getString("ITEM25");
			String ITEM26_T = cRsList.getString("ITEM26");
			String ITEM27_T = cRsList.getString("ITEM27");
			String ITEM28_T = cRsList.getString("ITEM28");
			String ITEM29_T = cRsList.getString("ITEM29");
			String ITEM30_T = cRsList.getString("ITEM30");
			String ITEM31_T = cRsList.getString("ITEM31");
			String ITEM32_T = cRsList.getString("ITEM32");
			String ITEM33_T = cRsList.getString("ITEM33");
			String ITEM34_T = cRsList.getString("ITEM34");
			String ITEM35_T = cRsList.getString("ITEM35");
			String ITEM36_T = cRsList.getString("ITEM36");
			String ITEM37_T = cRsList.getString("ITEM37");
			String ITEM38_T = cRsList.getString("ITEM38");
			String ITEM39_T = cRsList.getString("ITEM39");
			String ITEM40_T = cRsList.getString("ITEM40");
			String ITEM41_T = cRsList.getString("ITEM41");
			String ITEM42_T = cRsList.getString("ITEM42");
			String ITEM43_T = cRsList.getString("ITEM43");
			String ITEM44_T = cRsList.getString("ITEM44");
			String ITEM45_T = cRsList.getString("ITEM45");
			String ITEM46_T = cRsList.getString("ITEM46");
			String ITEM47_T = cRsList.getString("ITEM47");
			String ITEM48_T = cRsList.getString("ITEM48");
			String ITEM49_T = cRsList.getString("ITEM49");
			String ITEM50_T = cRsList.getString("ITEM50");
			String ITEM51_T = cRsList.getString("ITEM51");
			String ITEM52_T = cRsList.getString("ITEM52");
			String ITEM53_T = cRsList.getString("ITEM53");
			String ITEM54_T = cRsList.getString("ITEM54");
			String ITEM55_T = cRsList.getString("ITEM55");
			String ITEM56_T = cRsList.getString("ITEM56");
			String ITEM57_T = cRsList.getString("ITEM57");
			String ITEM58_T = cRsList.getString("ITEM58");
			String ITEM59_T = cRsList.getString("ITEM59");
			String ITEM60_T = cRsList.getString("ITEM60");
			String ITEM61_T = cRsList.getString("ITEM61");
			String ITEM62_T = cRsList.getString("ITEM62");
			String ITEM63_T = cRsList.getString("ITEM63");
			String ITEM64_T = cRsList.getString("ITEM64");
			String ITEM65_T = cRsList.getString("ITEM65");
			String ITEM66_T = cRsList.getString("ITEM66");
			String ITEM67_T = cRsList.getString("ITEM67");
			String ITEM68_T = cRsList.getString("ITEM68");
			String ITEM69_T = cRsList.getString("ITEM69");
			String ITEM70_T = cRsList.getString("ITEM70");
			String ITEM71_T = cRsList.getString("ITEM71");
			String ITEM72_T = cRsList.getString("ITEM72");
			String ITEM73_T = cRsList.getString("ITEM73");
			String ITEM74_T = cRsList.getString("ITEM74");
			String ITEM75_T = cRsList.getString("ITEM75");
			String ITEM76_T = cRsList.getString("ITEM76");
			String ITEM77_T = cRsList.getString("ITEM77");
			String ITEM78_T = cRsList.getString("ITEM78");
			String ITEM79_T = cRsList.getString("ITEM79");
			String ITEM80_T = cRsList.getString("ITEM80");
			String ITEM81_T = cRsList.getString("ITEM81");
			String ITEM82_T = cRsList.getString("ITEM82");
			String ITEM83_T = cRsList.getString("ITEM83");
			String ITEM84_T = cRsList.getString("ITEM84");
			String ITEM85_T = cRsList.getString("ITEM85");
			String ITEM86_T = cRsList.getString("ITEM86");
			String ITEM87_T = cRsList.getString("ITEM87");
			String ITEM88_T = cRsList.getString("ITEM88");
%>
			<z:row
<%
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

			if(! ITEM4_T.equals("")) {
%>
		 		ITEM4='<%= ITEM4_T%>'
<%
			}

			if(! ITEM5_T.equals("")) {
%>
		 		ITEM5='<%= ITEM5_T%>'
<%
			}

			if(! ITEM6_T.equals("")) {
%>
		 		ITEM6='<%= ITEM6_T%>'
<%
			}

			if(! ITEM7_T.equals("")) {
%>
		 		ITEM7='<%= ITEM7_T%>'
<%
			}

			if(! ITEM8_T.equals("")) {
%>
		 		ITEM8='<%= ITEM8_T%>'
<%
			}

			if(! ITEM9_T.equals("")) {
%>
		 		ITEM9='<%= ITEM9_T%>'
<%
			}

			if(! ITEM10_T.equals("")) {
%>
		 		ITEM10='<%= ITEM10_T%>'
<%
			}

			if(! ITEM11_T.equals("")) {
%>
		 		ITEM11='<%= ITEM11_T%>'
<%
			}

			if(! ITEM12_T.equals("")) {
%>
		 		ITEM12='<%= ITEM12_T%>'
<%
			}

			if(! ITEM13_T.equals("")) {
%>
		 		ITEM13='<%= ITEM13_T%>'
<%
			}

			if(! ITEM14_T.equals("")) {
%>
		 		ITEM14='<%= ITEM14_T%>'
<%
			}

			if(! ITEM15_T.equals("")) {
%>
		 		ITEM15='<%= ITEM15_T%>'
<%
			}

			if(! ITEM16_T.equals("")) {
%>
		 		ITEM16='<%= ITEM16_T%>'
<%
			}

			if(! ITEM17_T.equals("")) {
%>
		 		ITEM17='<%= ITEM17_T%>'
<%
			}

			if(! ITEM18_T.equals("")) {
%>
		 		ITEM18='<%= ITEM18_T%>'
<%
			}

			if(! ITEM19_T.equals("")) {
%>
		 		ITEM19='<%= ITEM19_T%>'
<%
			}

			if(! ITEM20_T.equals("")) {
%>
		 		ITEM20='<%= ITEM20_T%>'
<%
			}

			if(! ITEM21_T.equals("")) {
%>
		 		ITEM21='<%= ITEM21_T%>'
<%
			}

			if(! ITEM22_T.equals("")) {
%>
		 		ITEM22='<%= ITEM22_T%>'
<%
			}

			if(! ITEM23_T.equals("")) {
%>
		 		ITEM23='<%= ITEM23_T%>'
<%
			}

			if(! ITEM24_T.equals("")) {
%>
		 		ITEM24='<%= ITEM24_T%>'
<%
			}

			if(! ITEM25_T.equals("")) {
%>
		 		ITEM25='<%= ITEM25_T%>'
<%
			}

			if(! ITEM26_T.equals("")) {
%>
		 		ITEM26='<%= ITEM26_T%>'
<%
			}

			if(! ITEM27_T.equals("")) {
%>
		 		ITEM27='<%= ITEM27_T%>'
<%
			}

			if(! ITEM28_T.equals("")) {
%>
		 		ITEM28='<%= ITEM28_T%>'
<%
			}

			if(! ITEM29_T.equals("")) {
%>
		 		ITEM29='<%= ITEM29_T%>'
<%
			}

			if(! ITEM30_T.equals("")) {
%>
		 		ITEM30='<%= ITEM30_T%>'
<%
			}

			if(! ITEM31_T.equals("")) {
%>
		 		ITEM31='<%= ITEM31_T%>'
<%
			}

			if(! ITEM32_T.equals("")) {
%>
		 		ITEM32='<%= ITEM32_T%>'
<%
			}

			if(! ITEM33_T.equals("")) {
%>
		 		ITEM33='<%= ITEM33_T%>'
<%
			}

			if(! ITEM34_T.equals("")) {
%>
		 		ITEM34='<%= ITEM34_T%>'
<%
			}

			if(! ITEM35_T.equals("")) {
%>
		 		ITEM35='<%= ITEM35_T%>'
<%
			}

			if(! ITEM36_T.equals("")) {
%>
		 		ITEM36='<%= ITEM36_T%>'
<%
			}

			if(! ITEM37_T.equals("")) {
%>
		 		ITEM37='<%= ITEM37_T%>'
<%
			}

			if(! ITEM38_T.equals("")) {
%>
		 		ITEM38='<%= ITEM38_T%>'
<%
			}

			if(! ITEM39_T.equals("")) {
%>
		 		ITEM39='<%= ITEM39_T%>'
<%
			}

			if(! ITEM40_T.equals("")) {
%>
		 		ITEM40='<%= ITEM40_T%>'
<%
			}

			if(! ITEM41_T.equals("")) {
%>
		 		ITEM41='<%= ITEM41_T%>'
<%
			}

			if(! ITEM42_T.equals("")) {
%>
		 		ITEM42='<%= ITEM42_T%>'
<%
			}

			if(! ITEM43_T.equals("")) {
%>
		 		ITEM43='<%= ITEM43_T%>'
<%
			}

			if(! ITEM44_T.equals("")) {
%>
		 		ITEM44='<%= ITEM44_T%>'
<%
			}

			if(! ITEM45_T.equals("")) {
%>
		 		ITEM45='<%= ITEM45_T%>'
<%
			}

			if(! ITEM46_T.equals("")) {
%>
		 		ITEM46='<%= ITEM46_T%>'
<%
			}

			if(! ITEM47_T.equals("")) {
%>
		 		ITEM47='<%= ITEM47_T%>'
<%
			}

			if(! ITEM48_T.equals("")) {
%>
		 		ITEM48='<%= ITEM48_T%>'
<%
			}

			if(! ITEM49_T.equals("")) {
%>
		 		ITEM49='<%= ITEM49_T%>'
<%
			}

			if(! ITEM50_T.equals("")) {
%>
		 		ITEM50='<%= ITEM50_T%>'
<%
			}

			if(! ITEM51_T.equals("")) {
%>
		 		ITEM51='<%= ITEM51_T%>'
<%
			}

			if(! ITEM52_T.equals("")) {
%>
		 		ITEM52='<%= ITEM52_T%>'
<%
			}

			if(! ITEM53_T.equals("")) {
%>
		 		ITEM53='<%= ITEM53_T%>'
<%
			}

			if(! ITEM54_T.equals("")) {
%>
		 		ITEM54='<%= ITEM54_T%>'
<%
			}

			if(! ITEM55_T.equals("")) {
%>
		 		ITEM55='<%= ITEM55_T%>'
<%
			}

			if(! ITEM56_T.equals("")) {
%>
		 		ITEM56='<%= ITEM56_T%>'
<%
			}

			if(! ITEM57_T.equals("")) {
%>
		 		ITEM57='<%= ITEM57_T%>'
<%
			}

			if(! ITEM58_T.equals("")) {
%>
		 		ITEM58='<%= ITEM58_T%>'
<%
			}

			if(! ITEM59_T.equals("")) {
%>
		 		ITEM59='<%= ITEM59_T%>'
<%
			}

			if(! ITEM60_T.equals("")) {
%>
		 		ITEM60='<%= ITEM60_T%>'
<%
			}

			if(! ITEM61_T.equals("")) {
%>
		 		ITEM61='<%= ITEM61_T%>'
<%
			}

			if(! ITEM62_T.equals("")) {
%>
		 		ITEM62='<%= ITEM62_T%>'
<%
			}

			if(! ITEM63_T.equals("")) {
%>
		 		ITEM63='<%= ITEM63_T%>'
<%
			}

			if(! ITEM64_T.equals("")) {
%>
		 		ITEM64='<%= ITEM64_T%>'
<%
			}

			if(! ITEM65_T.equals("")) {
%>
		 		ITEM65='<%= ITEM65_T%>'
<%
			}

			if(! ITEM66_T.equals("")) {
%>
		 		ITEM66='<%= ITEM66_T%>'
<%
			}

			if(! ITEM67_T.equals("")) {
%>
		 		ITEM67='<%= ITEM67_T%>'
<%
			}

			if(! ITEM68_T.equals("")) {
%>
		 		ITEM68='<%= ITEM68_T%>'
<%
			}

			if(! ITEM69_T.equals("")) {
%>
		 		ITEM69='<%= ITEM69_T%>'
<%
			}

			if(! ITEM70_T.equals("")) {
%>
		 		ITEM70='<%= ITEM70_T%>'
<%
			}

			if(! ITEM71_T.equals("")) {
%>
		 		ITEM71='<%= ITEM71_T%>'
<%
			}

			if(! ITEM72_T.equals("")) {
%>
		 		ITEM72='<%= ITEM72_T%>'
<%
			}

			if(! ITEM73_T.equals("")) {
%>
		 		ITEM73='<%= ITEM73_T%>'
<%
			}

			if(! ITEM74_T.equals("")) {
%>
		 		ITEM74='<%= ITEM74_T%>'
<%
			}

			if(! ITEM75_T.equals("")) {
%>
		 		ITEM75='<%= ITEM75_T%>'
<%
			}

			if(! ITEM76_T.equals("")) {
%>
		 		ITEM76='<%= ITEM76_T%>'
<%
			}

			if(! ITEM77_T.equals("")) {
%>
		 		ITEM77='<%= ITEM77_T%>'
<%
			}

			if(! ITEM78_T.equals("")) {
%>
		 		ITEM78='<%= ITEM78_T%>'
<%
			}

			if(! ITEM79_T.equals("")) {
%>
		 		ITEM79='<%= ITEM79_T%>'
<%
			}

			if(! ITEM80_T.equals("")) {
%>
		 		ITEM80='<%= ITEM80_T%>'
<%
			}

			if(! ITEM81_T.equals("")) {
%>
		 		ITEM81='<%= ITEM81_T%>'
<%
			}

			if(! ITEM82_T.equals("")) {
%>
		 		ITEM82='<%= ITEM82_T%>'
<%
			}

			if(! ITEM83_T.equals("")) {
%>
		 		ITEM83='<%= ITEM83_T%>'
<%
			}

			if(! ITEM84_T.equals("")) {
%>
		 		ITEM84='<%= ITEM84_T%>'
<%
			}

			if(! ITEM85_T.equals("")) {
%>
		 		ITEM85='<%= ITEM85_T%>'
<%
			}

			if(! ITEM86_T.equals("")) {
%>
		 		ITEM86='<%= ITEM86_T%>'
<%
			}

			if(! ITEM87_T.equals("")) {
%>
		 		ITEM87='<%= ITEM87_T%>'
<%
			}

			if(! ITEM88_T.equals("")) {
%>
		 		ITEM88='<%= ITEM88_T%>'
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
