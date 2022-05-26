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

		String DTERCPTFR = htMethod.get("DTERCPTFR");
		String DTERCPTTO = htMethod.get("DTERCPTTO");
		String SRCPTSQL = htMethod.get("SRCPTSQL");

		//
		if(DTERCPTFR == null) { DTERCPTFR = ""; }
		if(DTERCPTTO == null) { DTERCPTTO = ""; }
		if(SRCPTSQL == null) { SRCPTSQL = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.ERI_EXAM_DT, A.ERI_EXAM_SQ, A.ERI_ITEM_CD, A.ERI_RSLT_VL, TO_CLOB(A.ERI_RSLT_EX) ERI_RSLT_EX, A.ERI_VLDT_LH, A.ERI_PACS_RSLT, '1' AS SEQ";
		sql += " FROM ET_RSLT_ITEM A JOIN IT_ITEM B";
		sql += " ON IIM_ITEM_CD = ERI_ITEM_CD";
		sql += " AND IIM_RSLT_KD <> '9'";
		sql += " WHERE ERI_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND A.ERI_EXAM_DT = EEA_EXAM_DT";
		sql += " AND A.ERI_EXAM_SQ = EEA_EXAM_SQ";
		sql += " AND NVL(A.ERI_CNCL_YN, 'N') <> 'Y'";
		sql += ")";

		sql += " UNION ALL";
		sql += " SELECT SSV_EXAM_DT AS ERI_EXAM_DT, SSV_EXAM_SQ AS ERI_EXAM_SQ, 'TOTAL' AS ERI_ITEM_CD, '' ERI_RSLT_VL, TO_CLOB(SSV_VIEW_EX) ERI_RSLT_EX, '' ERI_VLDT_LH, '' ERI_PACS_RSLT, '2' SEQ";
		sql += " FROM ST_SYTH_VIEW";
		sql += " WHERE SSV_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND SSV_EXAM_DT = EEA_EXAM_DT";
		sql += " AND SSV_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += " UNION ALL";
		sql += " SELECT PFP_EXAM_DT AS ERI_EXAM_DT, PFP_EXAM_SQ AS ERI_EXAM_SQ, 'FIRPAN' AS ERI_ITEM_CD , CASE WHEN PFP_PANRETA = '1' THEN 'A, ' ELSE '' END || CASE WHEN PFP_PANRETB = '1' THEN 'B, ' ELSE '' END || CASE WHEN PFP_PANRETR1 = '1' THEN 'R1, ' ELSE '' END || CASE WHEN PFP_PANRETR2 = '1' THEN 'R2, ' ELSE '' END || CASE WHEN PFP_PANRETRD = '1' THEN 'RD, ' ELSE '' END AS ERI_RSLT_VL , TO_CLOB('')  ERI_RSLT_EX, '' ERI_VLDT_LH, '' ERI_PACS_RSLT, '3' SEQ";
		sql += " FROM PT_FIR_PANJUNG";
		sql += " WHERE PFP_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND PFP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND PFP_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += " UNION ALL";
		sql += " SELECT PFP_EXAM_DT AS ERI_EXAM_DT, PFP_EXAM_SQ AS ERI_EXAM_SQ, 'FIREX' AS ERI_ITEM_CD, '' ERI_RSLT_VL , TO_CLOB(CASE WHEN PFP_EXAM_DT < '2018-01-01' THEN '조치: ' || PFP_RVIEW || ' / 소견: ' || PFP_BVIEW ELSE '의심질환소견: ' || PFP_OPIN1 || ' / 유질환소견: ' || PFP_OPIN2 || ' / 생활습관소견: ' || PFP_OPIN3 || ' / 기타소견: ' || PFP_OPIN4 END) AS ERI_RSLT_EX , '' ERI_VLDT_LH, '' ERI_PACS_RSLT, '4' SEQ";
		sql += " FROM PT_FIR_PANJUNG";
		sql += " WHERE PFP_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND PFP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND PFP_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += " UNION ALL";
		sql += " SELECT PSP_EXAM_DT AS ERI_EXAM_DT, PSP_EXAM_SQ AS ERI_EXAM_SQ, 'SECEX' AS ERI_ITEM_CD, '' ERI_RSLT_VL, TO_CLOB(PSP_RVIEW || CHR(13) || CHR(10) || PSP_BVIEW) ERI_RSLT_EX, '' ERI_VLDT_LH, '' ERI_PACS_RSLT, '5' SEQ";
		sql += " FROM PT_SED_PANJUNG";
		sql += " WHERE PSP_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND PSP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND PSP_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += " UNION ALL ";
		sql += " SELECT ECS_EXAM_DT AS ERI_EXAM_DT, ECS_EXAM_SQ AS ERI_EXAM_SQ, ";
		sql += " 'STMCCHECK' AS ERI_ITEM_CD, ";
		sql += " CASE WHEN ECS_STCN_YN = '1' THEN 'Y' ";
		sql += " ELSE 'N' END AS ERI_RSLT_VL, ";
		sql += " TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH,";
		sql += " ' ' ERI_PACS_RSLT, '06' SEQ ";
		sql += " FROM ET_CANCER_STMC  ";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND ECS_EXAM_DT = EEA_EXAM_DT ";
		sql += " AND ECS_EXAM_SQ = EEA_EXAM_SQ ";
		sql += ")";

		sql += " UNION ALL ";
		sql += " SELECT ECS_EXAM_DT AS ERI_EXAM_DT, ECS_EXAM_SQ AS ERI_EXAM_SQ, ";
		sql += " 'STMCPAN' AS ERI_ITEM_CD, ";
		sql += " CASE WHEN ECS_RSLT_KD = '1' THEN '이상소견없음 또는 위염' ";
		sql += " 		WHEN ECS_RSLT_KD = '2' THEN '양성질환' ";
		sql += " 		WHEN ECS_RSLT_KD = '3' THEN '위암 의심' ";
		sql += " 		WHEN ECS_RSLT_KD = '4' THEN '위암' ";
		sql += " 		WHEN ECS_RSLT_KD = '5' THEN '기타' ";
		sql += " END AS ERI_RSLT_VL, ";
		sql += " TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH, ";
		sql += " ' ' ERI_PACS_RSLT, '06' SEQ ";
		sql += " FROM ET_CANCER_STMC ";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND ECS_EXAM_DT = EEA_EXAM_DT ";
		sql += " AND ECS_EXAM_SQ = EEA_EXAM_SQ ";
		sql += " ) ";

		sql += " UNION ALL ";
		sql += " SELECT ECS_EXAM_DT AS ERI_EXAM_DT, ECS_EXAM_SQ AS ERI_EXAM_SQ, ";
		sql += " 'STMCSO' AS ERI_ITEM_CD, ";
		sql += " ECS_RSLT_EX As ERI_RSLT_VL, ";
		sql += " TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH, ";
		sql += " ' ' ERI_PACS_RSLT, '06' SEQ ";
		sql += " FROM ET_CANCER_STMC ";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND ECS_EXAM_DT = EEA_EXAM_DT ";
		sql += " AND ECS_EXAM_SQ = EEA_EXAM_SQ ";
		sql += " ) ";

		sql += " UNION ALL ";
		sql += " SELECT ECC_EXAM_DT AS ERI_EXAM_DT, ECC_EXAM_SQ AS ERI_EXAM_SQ, ";
		sql += " 'COLOCHECK' AS ERI_ITEM_CD, ";
		sql += " CASE WHEN ECC_STCN_YN = '1' THEN 'Y' ";
		sql += " 		ELSE 'N' END AS ERI_RSLT_VL, ";
		sql += " TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH, ";
		sql += " ' ' ERI_PACS_RSLT, '07' SEQ ";
		sql += " FROM ET_CANCER_COLO ";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND ECC_EXAM_DT = EEA_EXAM_DT ";
		sql += " AND ECC_EXAM_SQ = EEA_EXAM_SQ ";
		sql += " ) ";

		sql += " UNION ALL ";
		sql += " SELECT ECC_EXAM_DT AS ERI_EXAM_DT, ECC_EXAM_SQ AS ERI_EXAM_SQ, ";
		sql += " 'COLOPAN' AS ERI_ITEM_CD, ";
		sql += " CASE WHEN ECC_RSLT_KD = '1' THEN '이상소견 없음' ";
		sql += " 		WHEN ECC_RSLT_KD = '2' THEN '대장폴립(용종)' ";
		sql += " 		WHEN ECC_RSLT_KD = '3' THEN '대장암 의심' ";
		sql += " 		WHEN ECC_RSLT_KD = '4' THEN '대장암' ";
		sql += " 		WHEN ECC_RSLT_KD = '5' THEN '기타' ";
		sql += " 		WHEN ECC_RSLT_KD = '6' THEN '잠혈반응없음' ";
		sql += " 		WHEN ECC_RSLT_KD = '7' THEN '잠혈반응있음' ";
		sql += " END AS ERI_RSLT_VL, ";
		sql += " TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH, ";
		sql += " ' ' ERI_PACS_RSLT, '07' SEQ ";
		sql += " FROM ET_CANCER_COLO ";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND ECC_EXAM_DT = EEA_EXAM_DT ";
		sql += " AND ECC_EXAM_SQ = EEA_EXAM_SQ ";
		sql += " ) ";

		sql += " UNION ALL ";
		sql += " SELECT ECC_EXAM_DT AS ERI_EXAM_DT, ECC_EXAM_SQ AS ERI_EXAM_SQ, ";
		sql += " 'COLOSO' AS ERI_ITEM_CD, ";
		sql += " ECC_RSLT_EX As ERI_RSLT_VL, ";
		sql += " TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH, ";
		sql += " ' ' ERI_PACS_RSLT, '07' SEQ ";
		sql += " FROM ET_CANCER_COLO ";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND ECC_EXAM_DT = EEA_EXAM_DT ";
		sql += " AND ECC_EXAM_SQ = EEA_EXAM_SQ ";
		sql += " ) ";

		sql += " UNION ALL ";
		sql += " SELECT ECL_EXAM_DT AS ERI_EXAM_DT, ECL_EXAM_SQ AS ERI_EXAM_SQ, ";
		sql += " ' 'LIVERCHECK' ' AS ERI_ITEM_CD, ";
		sql += " CASE WHEN ECL_LICN_YN = ' '1' ' THEN ' 'Y' ' ";
		sql += " ELSE ' 'N' ' END AS ERI_RSLT_VL, ";
		sql += " TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH, ";
		sql += " ' ' ERI_PACS_RSLT, ' '08' ' SEQ ";
		sql += " FROM ET_CANCER_LIVER ";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND ECL_EXAM_DT = EEA_EXAM_DT ";
		sql += " AND ECL_EXAM_SQ = EEA_EXAM_SQ ";
		sql += " ) ";

		sql += " UNION ALL ";
		sql += " SELECT ECL_EXAM_DT AS ERI_EXAM_DT, ECL_EXAM_SQ AS ERI_EXAM_SQ, ";
		sql += " ' 'LIVERPAN' ' AS ERI_ITEM_CD, ";
		sql += " CASE WHEN ECL_RSLT_KD = ' '1' ' THEN ' '간암 의심소견 없음' ' ";
		sql += " WHEN ECL_RSLT_KD = ' '2' ' THEN ' '추적검사 요망(3개월 이내)' ' ";
		sql += " WHEN ECL_RSLT_KD = ' '3' ' THEN ' '간암 의심(정밀 검사 요망)심' ' ";
		sql += " WHEN ECL_RSLT_KD = ' '4' ' THEN ' '기타' ' ";
		sql += " END AS ERI_RSLT_VL, ";
		sql += " TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH, ";
		sql += " ' ' ERI_PACS_RSLT, ' '08' ' SEQ ";
		sql += " FROM ET_CANCER_LIVER ";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND ECL_EXAM_DT = EEA_EXAM_DT ";
		sql += " AND ECL_EXAM_SQ = EEA_EXAM_SQ ";
		sql += " ) ";

		sql += " UNION ALL ";
		sql += " SELECT ECL_EXAM_DT AS ERI_EXAM_DT, ECL_EXAM_SQ AS ERI_EXAM_SQ, ";
		sql += " ' 'LIVERSO' ' AS ERI_ITEM_CD, ";
		sql += " ECL_RSLT_EX As ERI_RSLT_VL, ";
		sql += " TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH, ";
		sql += " ' ' ERI_PACS_RSLT, ' '08' ' SEQ ";
		sql += " FROM ET_CANCER_LIVER ";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND ECL_EXAM_DT = EEA_EXAM_DT ";
		sql += " AND ECL_EXAM_SQ = EEA_EXAM_SQ ";
		sql += " ) ";

		sql += " UNION ALL";
		sql += " SELECT ECB_EXAM_DT AS ERI_EXAM_DT, ECB_EXAM_SQ AS ERI_EXAM_SQ,";
		sql += " ' 'BRSTCHECK' ' AS ERI_ITEM_CD,";
		sql += " CASE WHEN ECB_BRCN_YN = ' '1' ' THEN ' 'Y' '";
		sql += " ELSE ' 'N' ' END AS ERI_RSLT_VL,";
		sql += " TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH,";
		sql += " ' ' ERI_PACS_RSLT, ' '09' ' SEQ";
		sql += " FROM ET_CANCER_BRST";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND ECB_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECB_EXAM_SQ = EEA_EXAM_SQ";
		sql += " )";

		sql += "UNION ALL";
		sql += "SELECT ECB_EXAM_DT AS ERI_EXAM_DT, ECB_EXAM_SQ AS ERI_EXAM_SQ,";
		sql += "' 'BRSTPAN' ' AS ERI_ITEM_CD,";
		sql += "CASE WHEN ECB_RSLT_KD = ' '1' ' THEN ' '이상소견 없음' '";
		sql += "WHEN ECB_RSLT_KD = ' '2' ' THEN ' '양성질환' '";
		sql += "WHEN ECB_RSLT_KD = ' '3' ' THEN ' '유방암 의심' '";
		sql += "WHEN ECB_RSLT_KD = ' '4' ' THEN ' '기타' '";
		sql += "END AS ERI_RSLT_VL,";
		sql += "TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH,";
		sql += "' ' ERI_PACS_RSLT, ' '09' ' SEQ";
		sql += "FROM ET_CANCER_BRST";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += "AND ECB_EXAM_DT = EEA_EXAM_DT";
		sql += "AND ECB_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += "UNION ALL";
		sql += "SELECT ECB_EXAM_DT AS ERI_EXAM_DT, ECB_EXAM_SQ AS ERI_EXAM_SQ,";
		sql += "' 'BRSTSO' ' AS ERI_ITEM_CD,";
		sql += "ECB_RSLT_EX As ERI_RSLT_VL,";
		sql += "TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH,";
		sql += "' ' ERI_PACS_RSLT, ' '09' ' SEQ";
		sql += "FROM ET_CANCER_BRST";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += "AND ECB_EXAM_DT = EEA_EXAM_DT";
		sql += "AND ECB_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += "UNION ALL";
		sql += "SELECT ECV_EXAM_DT AS ERI_EXAM_DT, ECV_EXAM_SQ AS ERI_EXAM_SQ,";
		sql += "' 'CRVCCHECK' ' AS ERI_ITEM_CD,";
		sql += "CASE WHEN ECV_CVCN_YN = ' '1' ' THEN ' 'Y' '";
		sql += "ELSE ' 'N' ' END AS ERI_RSLT_VL,";
		sql += "TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH,";
		sql += "' ' ERI_PACS_RSLT, ' '10' ' SEQ";
		sql += "FROM ET_CANCER_CRVC";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += "AND ECV_EXAM_DT = EEA_EXAM_DT";
		sql += "AND ECV_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += "UNION ALL";
		sql += "SELECT ECV_EXAM_DT AS ERI_EXAM_DT, ECV_EXAM_SQ AS ERI_EXAM_SQ,";
		sql += "' 'CRVCPAN' ' AS ERI_ITEM_CD,";
		sql += "CASE WHEN ECV_RSLT_KD = ' '1' ' THEN ' '이상소견없음' '";
		sql += "WHEN ECV_RSLT_KD = ' '2' ' THEN ' '반응성 소견 및 감염성 질환' '";
		sql += "WHEN ECV_RSLT_KD = ' '3' ' THEN ' '비정형 상피세포 이상' '";
		sql += "WHEN ECV_RSLT_KD = ' '4' ' THEN ' '자궁경부암 전구단계 의심' '";
		sql += "WHEN ECV_RSLT_KD = ' '5' ' THEN ' '자궁경부암 의심' '";
		sql += "WHEN ECV_RSLT_KD = ' '6' ' THEN ' '기타' '";
		sql += "END AS ERI_RSLT_VL,";
		sql += "TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH,";
		sql += "' ' ERI_PACS_RSLT, ' '10' ' SEQ";
		sql += "FROM ET_CANCER_CRVC";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += "AND ECV_EXAM_DT = EEA_EXAM_DT";
		sql += "AND ECV_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += "UNION ALL";
		sql += "SELECT ECV_EXAM_DT AS ERI_EXAM_DT, ECV_EXAM_SQ AS ERI_EXAM_SQ,";
		sql += "' 'CRVCSO' ' AS ERI_ITEM_CD,";
		sql += "ECV_RSLT_EX As ERI_RSLT_VL,";
		sql += "TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH,";
		sql += "' ' ERI_PACS_RSLT, ' '10' ' SEQ";
		sql += "FROM ET_CANCER_CRVC";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += "AND ECV_EXAM_DT = EEA_EXAM_DT";
		sql += "AND ECV_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += "UNION ALL";
		sql += "SELECT ECG_EXAM_DT AS ERI_EXAM_DT, ECG_EXAM_SQ AS ERI_EXAM_SQ,";
		sql += "' 'LUNGCHECK' ' AS ERI_ITEM_CD,";
		sql += "CASE WHEN ECG_LUCN_YN = ' '1' ' THEN ' 'Y' '";
		sql += "ELSE ' 'N' ' END AS ERI_RSLT_VL,";
		sql += "TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH,";
		sql += "' ' ERI_PACS_RSLT, ' '11' ' SEQ";
		sql += "FROM ET_CANCER_LUNG";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += "AND ECG_EXAM_DT = EEA_EXAM_DT";
		sql += "AND ECG_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += "UNION ALL";
		sql += "SELECT ECG_EXAM_DT AS ERI_EXAM_DT, ECG_EXAM_SQ AS ERI_EXAM_SQ,";
		sql += "' 'LUNGPAN' ' AS ERI_ITEM_CD,";
		sql += "CASE WHEN ECG_RSLT_KD = ' '1' ' THEN ' '이상소견없음' '";
		sql += "WHEN ECG_RSLT_KD = ' '2' ' THEN ' '양성결절' '";
		sql += "WHEN ECG_RSLT_KD = ' '3' ' THEN ' '경계성결절' '";
		sql += "WHEN ECG_RSLT_KD = ' '4' ' THEN ' '폐암의심' '";
		sql += "WHEN ECG_RSLT_KD = ' '5' ' THEN ' '기타' '";
		sql += "END AS ERI_RSLT_VL,";
		sql += "TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH,";
		sql += "' ' ERI_PACS_RSLT, ' '11' ' SEQ";
		sql += "FROM ET_CANCER_LUNG";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += "AND ECG_EXAM_DT = EEA_EXAM_DT";
		sql += "AND ECG_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += "UNION ALL";
		sql += "SELECT ECG_EXAM_DT AS ERI_EXAM_DT, ECG_EXAM_SQ AS ERI_EXAM_SQ,";
		sql += "' 'LUNGPANS' ' AS ERI_ITEM_CD,";
		sql += "CASE WHEN ECG_RSLT2_KD = ' '1' ' THEN ' '4A' '";
		sql += "WHEN ECG_RSLT2_KD = ' '2' ' THEN ' '4B' '";
		sql += "WHEN ECG_RSLT2_KD = ' '3' ' THEN ' '4X절' '";
		sql += "END AS ERI_RSLT_VL,";
		sql += "TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH,";
		sql += "' ' ERI_PACS_RSLT, ' '11' ' SEQ";
		sql += "FROM ET_CANCER_LUNG";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += "AND ECG_EXAM_DT = EEA_EXAM_DT";
		sql += "AND ECG_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += "UNION ALL";
		sql += "SELECT ECG_EXAM_DT AS ERI_EXAM_DT, ECG_EXAM_SQ AS ERI_EXAM_SQ,";
		sql += "' 'LUNGPANT' ' AS ERI_ITEM_CD,";
		sql += "ECG_ETC_EX As ERI_RSLT_VL,";
		sql += "TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH,";
		sql += "' ' ERI_PACS_RSLT, ' '11' ' SEQ";
		sql += "FROM ET_CANCER_LUNG";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += "AND ECG_EXAM_DT = EEA_EXAM_DT";
		sql += "AND ECG_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += "UNION ALL";
		sql += "SELECT ECG_EXAM_DT AS ERI_EXAM_DT, ECG_EXAM_SQ AS ERI_EXAM_SQ,";
		sql += "' 'LUNGSO' ' AS ERI_ITEM_CD,";
		sql += "ECG_RSLT_EX As ERI_RSLT_VL,";
		sql += "TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH,";
		sql += "' ' ERI_PACS_RSLT, ' '11' ' SEQ";
		sql += "FROM ET_CANCER_LUNG";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += "AND ECG_EXAM_DT = EEA_EXAM_DT";
		sql += "AND ECG_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += "UNION ALL";
		sql += "SELECT ECG_EXAM_DT AS ERI_EXAM_DT, ECG_EXAM_SQ AS ERI_EXAM_SQ,";
		sql += "' 'LUNGSOS' ' AS ERI_ITEM_CD,";
		sql += "ECG_RSLT_ETC_EX As ERI_RSLT_VL,";
		sql += "TO_CLOB(' ') ERI_RSLT_EX, ' ' ERI_VLDT_LH,";
		sql += "' ' ERI_PACS_RSLT, ' '11' ' SEQ";
		sql += "FROM ET_CANCER_LUNG";
		sql += " WHERE ECS_EXAM_DT BETWEEN '" + DTERCPTFR + "' AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += "AND ECG_EXAM_DT = EEA_EXAM_DT";
		sql += "AND ECG_EXAM_SQ = EEA_EXAM_SQ";
		sql += ")";

		sql += " ORDER BY ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD, SEQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMake_Excel_upGetExamItem_001 \n";
			G_INFO += "설명 : 검사정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTERCPTFR : " + DTERCPTFR + " \n";
			G_INFO += " DTERCPTTO : " + DTERCPTTO + " \n";
			G_INFO += " SRCPTSQL : " + SRCPTSQL + " \n";
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