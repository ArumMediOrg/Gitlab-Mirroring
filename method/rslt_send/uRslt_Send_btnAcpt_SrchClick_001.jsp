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

		String DTACPT_DTS = htMethod.get("DTACPT_DTS");
		String DTACPT_DTE = htMethod.get("DTACPT_DTE");
		String G_HOSP_NO = htMethod.get("G_HOSP_NO");
		String EDCOMP_CD = htMethod.get("EDCOMP_CD");
		String CBEXAM_CD = htMethod.get("CBEXAM_CD");
		String CBHDMD_CD = htMethod.get("CBHDMD_CD");
		String CBPLCE_CD1 = htMethod.get("CBPLCE_CD1");
		String CBPLCE_CD2 = htMethod.get("CBPLCE_CD2");
		String CBSEND_CD = htMethod.get("CBSEND_CD");
		String DTSEND_DTS = htMethod.get("DTSEND_DTS");
		String DTSEND_DTE = htMethod.get("DTSEND_DTE");
		String CBSORT_CD = htMethod.get("CBSORT_CD");
		String RBSEND_DT = htMethod.get("RBSEND_DT");
		String EDEXAM_NM = htMethod.get("EDEXAM_NM");
		String EDCHART_NO = htMethod.get("EDCHART_NO");

		//
		if(DTACPT_DTS == null) { DTACPT_DTS = ""; }
		if(DTACPT_DTE == null) { DTACPT_DTE = ""; }
		if(G_HOSP_NO == null) { G_HOSP_NO = ""; }
		if(EDCOMP_CD == null) { EDCOMP_CD = ""; }
		if(CBEXAM_CD == null) { CBEXAM_CD = ""; }
		if(CBHDMD_CD == null) { CBHDMD_CD = ""; }
		if(CBPLCE_CD1 == null) { CBPLCE_CD1 = ""; }
		if(CBPLCE_CD2 == null) { CBPLCE_CD2 = ""; }
		if(CBSEND_CD == null) { CBSEND_CD = ""; }
		if(DTSEND_DTS == null) { DTSEND_DTS = ""; }
		if(DTSEND_DTE == null) { DTSEND_DTE = ""; }
		if(CBSORT_CD == null) { CBSORT_CD = ""; }
		if(RBSEND_DT == null) { RBSEND_DT =""; }
		if(EDEXAM_NM == null) { EDEXAM_NM =""; }
		if(EDCHART_NO == null) { EDCHART_NO =""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, A.EEA_CUST_NO, A.EEA_HTSB_CD, A.EEA_DIVI_CS, A.EEA_CHART_NO, A.EEA_ORAL_YN, F_TEL_FORMAT(A.EEA_MOBL_NO) EEA_MOBL_NO, A.EEA_CNCR_DT, C.PFP_TRANC_DATE, D.PSP_TRANC_DATE, CASE WHEN A.EEA_EXAM_CD = '31001' THEN CASE WHEN A.EEA_ORAL_YN = '3' THEN E.ESP_OIFRM_DT ELSE E.ESP_EIFRM_DT END WHEN A.EEA_EXAM_CD = '31006' THEN F.ESO_EIFRM_DT WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '13' THEN CASE WHEN A.EEA_ORAL_YN = 'Y' THEN G.EDP_TOBO_DT ELSE A.EEA_CNCR_DT END WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '14' THEN G.EDP_TOBO_DT WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '2'";
		sql += " OR SUBSTR(A.EEA_HTSB_CD, 5, 1) = '4' THEN D.PSP_TRANC_DATE WHEN C.PFP_TRANC_DATE IS NOT NULL THEN C.PFP_TRANC_DATE WHEN D.PSP_TRANC_DATE IS NOT NULL THEN D.PSP_TRANC_DATE ELSE C.PFP_TRANC_DATE END AS EEA_SEND_DT, CASE WHEN UPPER(A.EEA_HTSB_YN) = 'Y' THEN F_CODE_FIND('0401', A.EEA_HTSB_CD, '', '1') WHEN A.EEA_EXAM_CD = '31001'";
		sql += " AND A.EEA_ORAL_YN = '3' THEN '학생구강' ELSE F_CODE_FIND('0401', A.EEA_EXAM_CD, '', '1') END AS EEA_EXAM_NM, CASE WHEN A.EEA_EXAM_CD = '31001' THEN CASE WHEN A.EEA_COTK_CD = '1' THEN '표본' ELSE '일반' END ELSE F_CODE_FIND('0916', A.EEA_ENTY_CD, '', '1') END AS EEA_ENTY_NM, F_PID(B.ICR_PENL_ID) EEA_PSNL_ID, A.EEA_TOTAL_YN, A.EEA_CANAD_YN, A.EEA_UTER_CD, CASE WHEN UPPER(A.EEA_HTSB_YN) = 'Y' THEN CASE WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '11' THEN CASE WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '1' THEN '일검' WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '3' THEN '일검' ELSE '일검2' END WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '12' THEN CASE WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '1' THEN '생애' WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '3' THEN '생애' ELSE '생애2' END WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '13' THEN '암' END ELSE '' END AS EEA_HTSB_OX, A.EEA_STOMA_CD || A.EEA_COLON_CD || A.EEA_LIVER_CD || A.EEA_BAST_CD || A.EEA_UTER_CD || NVL(A.EEA_LUNG_CD, '0') EEA_CAN_CD, CASE WHEN UPPER(A.EEA_ORAL_YN) = 'Y' THEN '구강' ELSE '' END AS EEA_ORAL_OX, UPPER(A.EEA_ORAL_YN) EEA_ORAL_YN, CASE WHEN A.EEA_EXAM_CD = '31001' THEN F_COMP_FIND(A.EEA_COMP_CD) ELSE '('|| A.EEA_ZIP_CD || ') ' || RTRIM(LTRIM(A.EEA_ZIP_AR)) || ' ' || RTRIM(LTRIM(A.EEA_ROAD_AR)) END AS EEA_ADDR_TX, A.EEA_EMAIL_AR, A.EEA_SEND_CD, F_CODE_FIND('0712', A.EEA_SEND_CD, '', '1') EEA_SEND_NM";
		sql += " FROM IT_CUSTOMER B, ET_EXAM_ACPT A LEFT OUTER JOIN PT_FIR_PANJUNG C";
		sql += " ON C.PFP_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND C.PFP_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN PT_SED_PANJUNG D";
		sql += " ON D.PSP_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND D.PSP_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_STDT_PNJN E";
		sql += " ON E.ESP_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND E.ESP_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_STDT_PNJNO F";
		sql += " ON F.ESO_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND F.ESO_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_DENTAL_PANJ G";
		sql += " ON G.EDP_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND G.EDP_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + DTACPT_DTS + "'";
		sql += " AND '" + DTACPT_DTE + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND B.ICR_CUST_NO = A.EEA_CUST_NO";

		if(G_HOSP_NO.equals("34100181")) {
			sql += " AND NVL(A.EEA_SEND_DT, ' ') <> ' '";
		}

		if(!EDCOMP_CD.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + EDCOMP_CD + "'";
		}

		if(!EDEXAM_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM = '" + EDEXAM_NM + "'";
		}

		if(!EDCHART_NO.equals("")) {
			sql += " AND A.EEA_CHART_NO = '" + EDCHART_NO + "'";
		}

		if(CBEXAM_CD.equals("00")) {
			sql += " AND (A.EEA_EXAM_CD LIKE '1%'";
			sql += " OR A.EEA_HTSB_CD LIKE '1%')";
		}

		else {
			if(CBEXAM_CD.equals("31")) {
				sql += " AND A.EEA_EXAM_CD = '31001'";
			}
			else if(CBEXAM_CD.equals("36")) {
				sql += " AND A.EEA_EXAM_CD = '31006'";
			}
			else {
				sql += " AND ((A.EEA_EXAM_CD LIKE '" + CBEXAM_CD + "'||'%'";
				sql += " OR A.EEA_HTSB_CD LIKE '" + CBEXAM_CD + "'||'%')";

				if(CBEXAM_CD.equals("13")) {
					sql += " OR A.EEA_STOMA_CD||A.EEA_COLON_CD||A.EEA_LIVER_CD||A.EEA_BAST_CD||A.EEA_UTER_CD||NVL(A.EEA_LUNG_CD, '0') <> '000000')";
				}
				else if(CBEXAM_CD.equals("14")) {
					sql += " OR A.EEA_ORAL_YN = 'Y')";
				}
				else {
					sql += " )";
				}
			}
		}

		if(!CBEXAM_CD.equals("31")) {
			if(CBHDMD_CD.equals("1")) {
				sql += " AND A.EEA_HLTHR_PR > 0";
			}
			else if(CBHDMD_CD.equals("2")) {
				sql += " AND A.EEA_HLTHR_PR = 0";
			}
		}

		if(!CBPLCE_CD1.equals("전체")) {
			sql += " AND A.EEA_PLCE_CD = '" + CBPLCE_CD2 + "'";
		}

		if(!CBSEND_CD.equals("00")) {
			sql += " AND A.EEA_SEND_CD IN ('" + CBSEND_CD + "')";
		}

		if(RBSEND_DT.equals("1")) {
			sql += " AND (NVL(C.PFP_TRANC_DATE, ' ') BETWEEN '" + DTSEND_DTS + "'";
			sql += " AND '" + DTSEND_DTE + "'";
			sql += " OR NVL(D.PSP_TRANC_DATE, ' ') BETWEEN '" + DTSEND_DTS + "'";
			sql += " AND '" + DTSEND_DTE + "'";
			sql += " OR NVL(A.EEA_CNCR_DT, ' ') BETWEEN '" + DTSEND_DTS + "'";
			sql += " AND '" + DTSEND_DTE + "'";
			sql += " OR NVL(G.EDP_TOBO_DT , ' ') BETWEEN '" + DTSEND_DTS + "'";
			sql += " AND '" + DTSEND_DTE + "'";
			sql += " OR NVL(CASE WHEN A.EEA_EXAM_CD = '31001' THEN CASE WHEN A.EEA_ORAL_YN = '3' THEN E.ESP_OIFRM_DT ELSE E.ESP_EIFRM_DT END WHEN A.EEA_EXAM_CD = '31006' THEN F.ESO_EIFRM_DT END, ' ') BETWEEN '" + DTSEND_DTS + "'";
			sql += " AND '" + DTSEND_DTE + "')";
		}

		if(CBSORT_CD.equals("1")) {
			sql += " ORDER BY A.EEA_PSNL_NM, A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
		}
		else if(CBSORT_CD.equals("2")) {
			sql += " ORDER BY EEA_EXAM_DT, A.EEA_EXAM_SQ";
		}
		else {
			sql += " ORDER BY A.EEA_EXAM_DT, CASE WHEN A.EEA_CNCR_DT IS NULL THEN CASE WHEN C.PFP_TRANC_DATE IS NULL THEN D.PSP_TRANC_DATE ELSE C.PFP_TRANC_DATE END ELSE A.EEA_CNCR_DT END, A.EEA_PSNL_NM";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRslt_Send_btnAcpt_SrchClick_001 \n";
			G_INFO += "설명 : 발송정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTACPT_DTS : " + DTACPT_DTS + " \n";
			G_INFO += " DTACPT_DTE : " + DTACPT_DTE + " \n";
			G_INFO += " G_HOSP_NO : " + G_HOSP_NO + " \n";
			G_INFO += " EDCOMP_CD : " + EDCOMP_CD + " \n";
			G_INFO += " CBEXAM_CD : " + CBEXAM_CD + " \n";
			G_INFO += " CBHDMD_CD : " + CBHDMD_CD + " \n";
			G_INFO += " CBPLCE_CD1 : " + CBPLCE_CD1 + " \n";
			G_INFO += " CBPLCE_CD2 : " + CBPLCE_CD2 + " \n";
			G_INFO += " CBSEND_CD : " + CBSEND_CD + " \n";
			G_INFO += " DTSEND_DTS : " + DTSEND_DTS + " \n";
			G_INFO += " DTSEND_DTE : " + DTSEND_DTE + " \n";
			G_INFO += " CBSORT_CD : " + CBSORT_CD + " \n";
			G_INFO += " RBSEND_DT : " + RBSEND_DT + " \n";
			G_INFO += " EDEXAM_NM : " + EDEXAM_NM + " \n";
			G_INFO += " EDCHART_NO : " + EDCHART_NO + " \n";
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

