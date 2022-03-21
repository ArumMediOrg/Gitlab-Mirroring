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

		String JUMIN_YN = htMethod.get("JUMIN_YN");
		String ENCRT_KD = htMethod.get("ENCRT_KD");
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String DEFER_YN = htMethod.get("DEFER_YN");
		String NODEL_YN = htMethod.get("NODEL_YN");
		String INPT_ID = htMethod.get("INPT_ID");
		String COMP_CD = htMethod.get("COMP_CD");
		String DEPT_CD = htMethod.get("DEPT_CD");
		String DEPT_NM = htMethod.get("DEPT_NM");
		String CHART_NO = htMethod.get("CHART_NO");
		String ACPT_CD = htMethod.get("ACPT_CD");
		String PLCE_CD = htMethod.get("PLCE_CD");
		String HDMD_YN = htMethod.get("HDMD_YN");
		String SDMD_YN = htMethod.get("SDMD_YN");
		String MMBR_CD = htMethod.get("MMBR_CD");
		String SALES_ID = htMethod.get("SALES_ID");
		String SEND_CD = htMethod.get("SEND_CD");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");

		//
		if(JUMIN_YN == null) { JUMIN_YN = ""; }
		if(ENCRT_KD == null) { ENCRT_KD = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(DEFER_YN == null) { DEFER_YN = ""; }
		if(NODEL_YN == null) { NODEL_YN = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }
		if(DEPT_NM == null) { DEPT_NM = ""; }
		if(CHART_NO == null) { CHART_NO = ""; }
		if(ACPT_CD == null) { ACPT_CD = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(HDMD_YN == null) { HDMD_YN = ""; }
		if(SDMD_YN == null) { SDMD_YN = ""; }
		if(MMBR_CD == null) { MMBR_CD = ""; }
		if(SALES_ID == null) { SALES_ID = ""; }
		if(SEND_CD == null) { SEND_CD = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }

		// DB객체
		stmtList = connect.createStatement();


		if(JUMIN_YN.equals("Y")) {
			if(ENCRT_KD.equals("1")) {
				sql = " SELECT B.ICR_PID_EN AS EEA_PSNL_ID,";
			}
			else if (ENCRT_KD.equals("2")) {
				sql = " SELECT ECL_DECRYPT(B.ICR_PID_EN) AS EEA_PSNL_ID,";
			}
			else {
				sql = " SELECT B.ICR_PENL_ID AS EEA_PSNL_ID,";
			}
		}
		else {
			sql = " SELECT F_PID(B.ICR_PENL_ID) EEA_PSNL_ID,";
		}

		sql += " A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_COMP_CD";
		sql += ", CASE WHEN A.EEA_RSVN_NO = ' ' THEN ' ' ELSE SUBSTR(A.EEA_RSVN_NO, 1, 4)||'-'||SUBSTR(A.EEA_RSVN_NO, 5, 6) END AS EEA_RSVN_NO";
		sql += ", A.EEA_PSNL_NM, B.ICR_BIRH_DT, A.EEA_CUST_NO, A.EEA_ORDER_YN, LTRIM(RTRIM(A.EEA_CHART_NO)) EEA_CHART_NO, A.EEA_COMPR_PR, A.EEA_PSNLR_PR, A.EEA_HLTHR_PR, A.EEA_SPCLR_PR, F_TEL_FORMAT(A.EEA_MOBL_NO) EEA_MOBL_NO, A.EEA_PSNL_AGE";
		sql += ", CASE WHEN (A.EEA_SEX_CD) = '1' THEN '남' ELSE '여' END AS EEA_SEX_NM";
		sql += ", F_CODE_FIND('0401', A.EEA_EXAM_CD, '', '1') AS EEA_EXAM_NM";
		sql += ", CASE WHEN A.EEA_MMBR_CD = '00' THEN '' ELSE F_CODE_FIND('0711', A.EEA_MMBR_CD, '', '1') END AS EEA_MMBR_NM";
		sql += ", F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, F_CODE_FIND('0908', A.EEA_CNTR_CD, '', '1') EEA_CNTR_NM";
		sql += ", CASE WHEN NVL(A.EEA_STOMA_CD, ' ') = ' ' THEN '0' WHEN A.EEA_STOMA_CD = '6' THEN '0' WHEN A.EEA_STOMA_CD = '9' THEN '0' ELSE A.EEA_STOMA_CD END EEA_STOMA_CT";
		sql += ", CASE WHEN NVL(A.EEA_COLON_CD, ' ') = ' ' THEN '0' WHEN A.EEA_COLON_CD = '6' THEN '0' WHEN A.EEA_COLON_CD = '9' THEN '0' ELSE A.EEA_COLON_CD END EEA_COLON_CT";
		sql += ", CASE WHEN NVL(A.EEA_LIVER_CD, ' ') = ' ' THEN '0' WHEN A.EEA_LIVER_CD = '6' THEN '0' WHEN A.EEA_LIVER_CD = '9' THEN '0' ELSE A.EEA_LIVER_CD END EEA_LIVER_CT";
		sql += ", CASE WHEN NVL(A.EEA_BAST_CD, ' ') = ' ' THEN '0' WHEN A.EEA_BAST_CD = '6' THEN '0' WHEN A.EEA_BAST_CD = '9' THEN '0' ELSE A.EEA_BAST_CD END EEA_BAST_CT";
		sql += ", CASE WHEN NVL(A.EEA_UTER_CD, ' ') = ' ' THEN '0' WHEN A.EEA_UTER_CD = '6' THEN '0' WHEN A.EEA_UTER_CD = '9' THEN '0' ELSE A.EEA_UTER_CD END EEA_UTER_CT";
		sql += ", CASE WHEN NVL(A.EEA_LUNG_CD, ' ') = ' ' THEN '0' WHEN A.EEA_LUNG_CD = '6' THEN '0' WHEN A.EEA_LUNG_CD = '9' THEN '0' ELSE A.EEA_LUNG_CD END EEA_LUNG_CT, F_CODE_FIND('0915'";
		sql += ", CASE WHEN NVL(A.EEA_STOMA_CD, ' ') = ' ' THEN '0' WHEN A.EEA_STOMA_CD = '6' THEN '0' WHEN A.EEA_STOMA_CD = '9' THEN '0' WHEN A.EEA_STOMA_CD = '8' THEN '1' WHEN A.EEA_STOMA_CD = '7' THEN '1' ELSE A.EEA_STOMA_CD END, '', '1') EEA_STOMA_NM, F_CODE_FIND('0915'";
		sql += ", CASE WHEN NVL(A.EEA_COLON_CD, ' ') = ' ' THEN '0' WHEN A.EEA_COLON_CD = '6' THEN '0' WHEN A.EEA_COLON_CD = '9' THEN '0' WHEN A.EEA_COLON_CD = '8' THEN '1' WHEN A.EEA_COLON_CD = '7' THEN '1' ELSE A.EEA_COLON_CD END, '', '1') EEA_COLON_NM, F_CODE_FIND('0915'";
		sql += ", CASE WHEN NVL(A.EEA_LIVER_CD, ' ') = ' ' THEN '0' WHEN A.EEA_LIVER_CD = '6' THEN '0' WHEN A.EEA_LIVER_CD = '9' THEN '0' WHEN A.EEA_LIVER_CD = '8' THEN '1' WHEN A.EEA_LIVER_CD = '7' THEN '1' ELSE A.EEA_LIVER_CD END, '', '1') EEA_LIVER_NM, F_CODE_FIND('0915'";
		sql += ", CASE WHEN NVL(A.EEA_BAST_CD, ' ') = ' ' THEN '0' WHEN A.EEA_BAST_CD = '6' THEN '0' WHEN A.EEA_BAST_CD = '9' THEN '0' WHEN A.EEA_BAST_CD = '8' THEN '1' WHEN A.EEA_BAST_CD = '7' THEN '1' ELSE A.EEA_BAST_CD END, '', '1') EEA_BAST_NM, F_CODE_FIND('0915'";
		sql += ", CASE WHEN NVL(A.EEA_UTER_CD, ' ') = ' ' THEN '0' WHEN A.EEA_UTER_CD = '6' THEN '0' WHEN A.EEA_UTER_CD = '9' THEN '0' WHEN A.EEA_UTER_CD = '8' THEN '1' WHEN A.EEA_UTER_CD = '7' THEN '1' ELSE A.EEA_UTER_CD END, '', '1') EEA_UTER_NM, F_CODE_FIND('0915'";
		sql += ", CASE WHEN NVL(A.EEA_LUNG_CD, ' ') = ' ' THEN '0' WHEN A.EEA_LUNG_CD = '6' THEN '0' WHEN A.EEA_LUNG_CD = '9' THEN '0' WHEN A.EEA_LUNG_CD = '8' THEN '1' WHEN A.EEA_LUNG_CD = '7' THEN '1' ELSE A.EEA_LUNG_CD END, '', '1') EEA_LUNG_NM";
		sql += ", CASE WHEN UPPER(A.EEA_HTSB_YN) = 'Y' THEN 'Y' ELSE '' END AS EEA_HTSB_OX";
		sql += ", CASE WHEN UPPER(A.EEA_SPSB_YN) = 'Y' THEN 'Y' ELSE '' END AS EEA_SPSB_OX";
		sql += ", CASE WHEN UPPER(A.EEA_CVSB_YN) = 'Y' THEN 'Y' ELSE '' END AS EEA_CVSB_OX";
		sql += ", CASE WHEN UPPER(A.EEA_EMSB_YN) = 'Y' THEN 'Y' ELSE '' END AS EEA_EMSB_OX";
		sql += ", CASE WHEN UPPER(A.EEA_ETSB_YN) = 'Y' THEN 'Y' ELSE '' END AS EEA_ETSB_OX";
		sql += ", CASE WHEN UPPER(A.EEA_ETSB_YN) = 'Y' THEN A.EEA_ETSB_LT ELSE '' END EEA_ETSB_LT";

		sql += ", CASE WHEN A.EEA_RSLT_CD = '0' THEN '대기' ELSE";
		sql += "	CASE WHEN A.EEA_RSLT_CD = '1' THEN '입력중' ELSE '완료' END";
		sql += " END AS EEA_RSLT_NM";

		sql += ", CASE WHEN EEA_RECE_KD = '0' THEN '미납' ELSE";
		sql += "	CASE WHEN EEA_RECE_KD = '1' THEN '일부' ELSE '완료' END";
		sql += " END AS EEA_RECE_NM";

		sql += ", F_TEL_FORMAT(A.EEA_ZIP_CD) EEA_ZIP_CD, A.EEA_ZIP_AR, A.EEA_ROAD_AR, C.ECS_CFRM_DT || ' / ' || F_USER_FIND(C.ECS_LICEN_CD) EEA_STOMA_DR, D.ECC_CFRM_DT || ' / ' || F_USER_FIND(D.ECC_LICEN_CD) EEA_COLON_DR, E.ECL_CFRM_DT || ' / ' || F_USER_FIND(E.ECL_LICEN_CD) EEA_LIVER_DR, F.ECB_CFRM_DT || ' / ' || F_USER_FIND(F.ECB_LICEN_CD) EEA_BAST_DR, G.ECV_CFRM_DT || ' / ' || F_USER_FIND(G.ECV_LICEN_CD) EEA_UTER_DR, H.ECG_CFRM_DT || ' / ' || F_USER_FIND(H.ECG_LICEN_CD) EEA_LUNG_DR";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.EEA_CUST_NO LEFT OUTER JOIN ET_CANCER_STMC C";
		sql += " ON C.ECS_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND C.ECS_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_COLO D";
		sql += " ON D.ECC_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND D.ECC_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LIVER E";
		sql += " ON E.ECL_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND E.ECL_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_BRST F";
		sql += " ON F.ECB_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND F.ECB_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_CRVC G";
		sql += " ON G.ECV_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND G.ECV_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LUNG H";
		sql += " ON H.ECG_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND H.ECG_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";

		if(DEFER_YN.equals("Y")) {
			sql += " AND NVL(A.EEA_DEFER_KD, '0') <> '0'";
		}

		if(NODEL_YN.equals("Y")) {
			sql += " AND A.EEA_ORDER_YN = 'C'";
		}
		else {
			sql += " AND A.EEA_ORDER_YN <> 'C'";
		}

		if(!INPT_ID.equals("")) {
			sql += " AND A.EEA_INPT_ID = '" + INPT_ID + "'";
		}

		if(!COMP_CD.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		}

		if(!DEPT_CD.equals("")) {
			sql += " AND A.EEA_DEPT_CD = '" + DEPT_CD + "'";
		}
		else if(!DEPT_NM.equals("")) {
			sql += " AND A.EEA_DEPT_NM LIKE '%'||'" + DEPT_NM + "'||'%'";
		}

		if(!CHART_NO.equals("")) {
			sql += " AND A.EEA_CHART_NO = '" + CHART_NO + "'";
		}

		if(!ACPT_CD.equals("")) {
			sql += " AND A.EEA_ACPT_CD = '" + ACPT_CD + "'";
		}

		if(!PLCE_CD.equals("")) {
			sql += " AND A.EEA_PLCE_CD = '" + PLCE_CD + "'";
		}

		if(HDMD_YN.equals("1")) {
			sql += " AND A.EEA_HDMD_YN = 'Y'";
		}
		else if(HDMD_YN.equals("2")) {
			sql += " AND A.EEA_HDMD_YN <> 'Y'";
		}

		if(SDMD_YN.equals("1")) {
			sql += " AND A.EEA_SDMD_YN = 'Y'";
		}
		else if(SDMD_YN.equals("2")) {
			sql += " AND A.EEA_SDMD_YN <> 'Y'";
		}

		if(!MMBR_CD.equals("")) {
			sql += " AND A.EEA_MMBR_CD = '" + MMBR_CD + "'";
		}

		if(!SALES_ID.equals("")) {
			sql += " AND SUBSTR(A.EEA_SALES_ID, 1, INSTR(A.EEA_SALES_ID, '-')) = '" + SALES_ID + "'";
		}

		if(!SEND_CD.equals("")) {
			sql += " AND A.EEA_SEND_CD = '" + SEND_CD + "'";
		}

		if(!PSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%'||'" + PSNL_NM + "'||'%'";
		}

		sql += PARAM_TX1;
		sql += PARAM_TX2;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_List_btnAcpt_SrchClick_002 \n";
			G_INFO += "설명 : 암검사 현황 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " JUMIN_YN : " + JUMIN_YN + " \n";
			G_INFO += " ENCRT_KD : " + ENCRT_KD + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " DEFER_YN : " + DEFER_YN + " \n";
			G_INFO += " NODEL_YN : " + NODEL_YN + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
			G_INFO += " DEPT_NM : " + DEPT_NM + " \n";
			G_INFO += " CHART_NO : " + CHART_NO + " \n";
			G_INFO += " ACPT_CD : " + ACPT_CD + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
			G_INFO += " HDMD_YN : " + HDMD_YN + " \n";
			G_INFO += " SDMD_YN : " + SDMD_YN + " \n";
			G_INFO += " MMBR_CD : " + MMBR_CD + " \n";
			G_INFO += " SALES_ID : " + SALES_ID + " \n";
			G_INFO += " SEND_CD : " + SEND_CD + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
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
