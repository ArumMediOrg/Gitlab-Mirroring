<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;

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
		String RZ_CMBPLE1 = htMethod.get("RZ_CMBPLE1");
		String RZ_CMBPLE2 = htMethod.get("RZ_CMBPLE2");


		//
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }
		if(RZ_CMBPLE1 == null) { RZ_CMBPLE1 = ""; }
		if(RZ_CMBPLE2 == null) { RZ_CMBPLE2 = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		sql = " CREATE OR REPLACE view DATA_EXAM_ACPT AS";

		sql += " SELECT C.SORT_ORDER, CASE WHEN C.SORT_ORDER = '1' THEN '건강검진' WHEN C.SORT_ORDER = '2' THEN '종합검진' WHEN C.SORT_ORDER = '3' THEN '의무검진' WHEN C.SORT_ORDER = '4' THEN '특수검진' WHEN C.SORT_ORDER = '5' THEN '정밀검진' WHEN C.SORT_ORDER = '6' THEN '혈액검진' WHEN C.SORT_ORDER = '8' THEN '뇌심혈관' ELSE '기타검진' END EXAM_KIND, C.EXAM_CD, F_CODE_FIND('0401', C.EXAM_CD, '5', '1') EXAM_NM, SUM(C.NEW_INSU) NEW_INSU, SUM(C.NEW_CNT) NEW_CNT, SUM(C.NEW_SUM) NEW_SUM, SUM(C.NEW_HDMD) NEW_HDMD, SUM(C.NEW_SDMD) NEW_SDMD, SUM(C.NEW_COMPS + C.NEW_COMP) NEW_COMP, SUM(C.NEW_PSNL) NEW_PSNL, SUM(C.NEW_PSNLP) NEW_PSNLP";
		sql += " FROM (SELECT CASE WHEN A.EEA_EXAM_CD = '71001' THEN '9' WHEN A.EEA_EXAM_CD = '91006' THEN '9' ELSE CASE WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) = '9' THEN '3' ELSE SUBSTR(A.EEA_EXAM_CD, 1, 1) END END SORT_ORDER, CASE WHEN A.EEA_EXAM_CD = '12001' THEN '11001' WHEN A.EEA_EXAM_CD = '12003' THEN '11001' WHEN A.EEA_EXAM_CD = '12002' THEN '11002' WHEN A.EEA_EXAM_CD = '12004' THEN '11002' WHEN A.EEA_EXAM_CD = '14002' THEN '14001' ELSE A.EEA_EXAM_CD END AS EXAM_CD, A.EEA_CMPY_CD, A.EEA_PRPY_CD, 0 OLD_INSU, 0 OLD_CNT, 0 OLD_SUM, B.INSU NEW_INSU, B.CNT NEW_CNT, B.HDMD_PR+B.SDMD_PR+B.COMPS_PR+B.COMP_PR+B.PSNL_PR+B.PSNLP_PR NEW_SUM, 0 OLD_HDMD, B.HDMD_PR NEW_HDMD, 0 OLD_SDMD, B.SDMD_PR NEW_SDMD, 0 OLD_COMPS, B.COMPS_PR NEW_COMPS, 0 OLD_COMP, B.COMP_PR NEW_COMP, 0 OLD_PSNL, B.PSNL_PR NEW_PSNL, PSNLP_PR NEW_PSNLP";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, CASE WHEN EEP_EXAM_DT = EEP_ORDER_DT THEN 1 ELSE 0 END INSU, CASE WHEN EEP_EXAM_DT = EEP_ORDER_DT THEN 1 ELSE 0 END CNT, SUM(EEP_HDMD_PR) HDMD_PR, SUM(EEP_SDMD_PR) SDMD_PR, SUM(EEP_COMPS_PR) COMPS_PR, SUM(EEP_COMP_PR) COMP_PR, SUM(EEP_PSNL_PR) PSNL_PR ,SUM(EEP_PSNLP_PR) PSNLP_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_ORDER_DT >= '" + DP_FROMDT + "'";
		sql += " AND EEP_ORDER_DT <= '" + DP_TODT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ, EEP_ORDER_DT ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_INPT_ID <> '자료변환'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(! RZ_CMBPLE1.equals("0")) {
			if(RZ_CMBPLE2.equals("00")) {
				sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + RZ_CMBPLE1 + "'";
			} else {
				sql += " AND A.EEA_PLCE_CD = '" + RZ_CMBPLE2 + "'";
			}
		}

		sql += " UNION ALL";

		sql += " SELECT '1' SORT_ORDER, CASE WHEN A.EEA_HTSB_CD = '12001' THEN '11001' WHEN A.EEA_HTSB_CD = '12003' THEN '11001' WHEN A.EEA_HTSB_CD = '12002' THEN '11002' WHEN A.EEA_HTSB_CD = '12004' THEN '11002' WHEN A.EEA_HTSB_CD = '13001' THEN '11001' WHEN A.EEA_HTSB_CD = '14001' THEN '11001' WHEN A.EEA_HTSB_CD = '14002' THEN '11001' ELSE A.EEA_HTSB_CD END AS EXAM_CD, A.EEA_CMPY_CD, A.EEA_PRPY_CD, 0 OLD_INSU, 0 OLD_CNT, 0 OLD_SUM, 0 NEW_INSU, CNT NEW_CNT, 0 NEW_SUM, 0 OLD_HDMD, 0 NEW_HDMD, 0 OLD_SDMD, 0 NEW_SDMD, 0 OLD_COMPS, 0 NEW_COMPS, 0 OLD_COMP, 0 NEW_COMP, 0 OLD_PSNL, 0 NEW_PSNL, 0 NEW_PSNLP";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ, CASE WHEN EEP_EXAM_DT = EEP_ORDER_DT THEN 1 ELSE 0 END INSU, CASE WHEN EEP_EXAM_DT = EEP_ORDER_DT THEN 1 ELSE 0 END CNT, SUM(EEP_HDMD_PR) HDMD_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_ORDER_DT >= '" + DP_FROMDT + "'";
		sql += " AND EEP_ORDER_DT <= '" + DP_TODT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ, EEP_ORDER_DT ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_HTSB_YN = 'Y'";
		sql += " AND A.EEA_HTSB_CD NOT IN ('13001', '14001', '14002')";
		sql += " AND A.EEA_INPT_ID <> '자료변환'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(! RZ_CMBPLE1.equals("0")) {
			if(RZ_CMBPLE2.equals("00")) {
				sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + RZ_CMBPLE1 + "'";
			} else {
				sql += " AND A.EEA_PLCE_CD = '" + RZ_CMBPLE2 + "'";
			}
		}

		sql += " AND B.HDMD_PR > 0";

		sql += " UNION ALL";

		sql += " SELECT '4' SORT_ORDER, A.EEA_SPSB_CD EXAM_CD, A.EEA_CMPY_CD, A.EEA_PRPY_CD, 0 OLD_INSU, 0 OLD_CNT, 0 OLD_SUM, 0 NEW_INSU, 1 NEW_CNT, 0 NEW_SUM, 0 OLD_HDMD, 0 NEW_HDMD, 0 OLD_SDMD, 0 NEW_SDMD, 0 OLD_COMPS, 0 NEW_COMPS, 0 OLD_COMP, 0 NEW_COMP, 0 OLD_PSNL, 0 NEW_PSNL,0 NEW_PSNLP";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_ORDER_DT >= '" + DP_FROMDT + "'";
		sql += " AND EEP_ORDER_DT <= '" + DP_TODT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_SPSB_YN = 'Y'";
		sql += " AND A.EEA_INPT_ID <> '자료변환'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(! RZ_CMBPLE1.equals("0")) {
			if(RZ_CMBPLE2.equals("00")) {
				sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + RZ_CMBPLE1 + "'";
			} else {
				sql += " AND A.EEA_PLCE_CD = '" + RZ_CMBPLE2 + "'";
			}
		}

		sql += " UNION ALL";

		sql += " SELECT '8' SORT_ORDER, A.EEA_CVSB_CD EXAM_CD, A.EEA_CMPY_CD, A.EEA_PRPY_CD, 0 OLD_INSU, 0 OLD_CNT, 0 OLD_SUM, 0 NEW_INSU, 1 NEW_CNT, 0 NEW_SUM, 0 OLD_HDMD, 0 NEW_HDMD, 0 OLD_SDMD, 0 NEW_SDMD, 0 OLD_COMPS, 0 NEW_COMPS, 0 OLD_COMP, 0 NEW_COMP, 0 OLD_PSNL, 0 NEW_PSNL,0 NEW_PSNLP";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_ORDER_DT >= '" + DP_FROMDT + "'";
		sql += " AND EEP_ORDER_DT <= '" + DP_TODT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_CVSB_YN = 'Y'";
		sql += " AND A.EEA_INPT_ID <> '자료변환'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(! RZ_CMBPLE1.equals("0")) {
			if(RZ_CMBPLE2.equals("00")) {
				sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + RZ_CMBPLE1 + "'";
			} else {
				sql += " AND A.EEA_PLCE_CD = '" + RZ_CMBPLE2 + "'";
			}
		}

		sql += " UNION ALL";

		sql += " SELECT '3' SORT_ORDER, A.EEA_EMSB_CD EXAM_CD, A.EEA_CMPY_CD, A.EEA_PRPY_CD, 0 OLD_INSU, 0 OLD_CNT, 0 OLD_SUM, 0 NEW_INSU, 1 NEW_CNT, 0 NEW_SUM, 0 OLD_HDMD, 0 NEW_HDMD, 0 OLD_SDMD, 0 NEW_SDMD, 0 OLD_COMPS, 0 NEW_COMPS, 0 OLD_COMP, 0 NEW_COMP, 0 OLD_PSNL, 0 NEW_PSNL,0 NEW_PSNLP";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_ORDER_DT >= '" + DP_FROMDT + "'";
		sql += " AND EEP_ORDER_DT <= '" + DP_TODT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_EMSB_YN = 'Y'";
		sql += " AND A.EEA_INPT_ID <> '자료변환'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(! RZ_CMBPLE1.equals("0")) {
			if(RZ_CMBPLE2.equals("00")) {
				sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + RZ_CMBPLE1 + "'";
			} else {
				sql += " AND A.EEA_PLCE_CD = '" + RZ_CMBPLE2 + "'";
			}
		}

		sql += " UNION ALL";

		sql += " SELECT CASE WHEN A.EEA_ETSB_CD = '91006' THEN '9' ELSE '3' END SORT_ORDER, A.EEA_ETSB_CD EXAM_CD, A.EEA_CMPY_CD, A.EEA_PRPY_CD, 0 OLD_INSU, 0 OLD_CNT, 0 OLD_SUM, 0 NEW_INSU, 1 NEW_CNT, 0 NEW_SUM, 0 OLD_HDMD, 0 NEW_HDMD, 0 OLD_SDMD, 0 NEW_SDMD, 0 OLD_COMPS, 0 NEW_COMPS, 0 OLD_COMP, 0 NEW_COMP, 0 OLD_PSNL, 0 NEW_PSNL,0 NEW_PSNLP";
		sql += " FROM (SELECT EEP_EXAM_DT EXAM_DT, EEP_EXAM_SQ EXAM_SQ";
		sql += " FROM ET_EXAM_PRICE";
		sql += " WHERE EEP_ORDER_DT >= '" + DP_FROMDT + "'";
		sql += " AND EEP_ORDER_DT <= '" + DP_TODT + "'";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B, ET_EXAM_ACPT A";
		sql += " WHERE A.EEA_EXAM_DT = B.EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EXAM_SQ";
		sql += " AND A.EEA_ETSB_YN = 'Y'";
		sql += " AND A.EEA_INPT_ID <> '자료변환'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(! RZ_CMBPLE1.equals("0")) {
			if(RZ_CMBPLE2.equals("00")) {
				sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + RZ_CMBPLE1 + "'";
			} else {
				sql += " AND A.EEA_PLCE_CD = '" + RZ_CMBPLE2 + "'";
			}
		}

		sql += " ) C";
		sql += " GROUP BY C.SORT_ORDER, C.EXAM_CD";

		stmtExec.executeUpdate(sql);

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_SellReceDayReport_UDP_CREATEVIEW_001 \n";
			G_INFO += "설명 : 뷰생성 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
			G_INFO += " RZ_CMBPLE1 : " + RZ_CMBPLE1 + " \n";
			G_INFO += " RZ_CMBPLE2 : " + RZ_CMBPLE2 + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>200</resultCode>
	<resultXml></resultXml>
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

		if(stmtExec != null) {
			stmtExec.close();
			stmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
