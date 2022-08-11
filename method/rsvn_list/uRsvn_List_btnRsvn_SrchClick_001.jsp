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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String EXAM_YN = htMethod.get("EXAM_YN");
		String CNCL_YN = htMethod.get("CNCL_YN");
		String COMP_CD = htMethod.get("COMP_CD");
		String DEPT_CD = htMethod.get("DEPT_CD");
		String DEPT_NM = htMethod.get("DEPT_NM");
		String ACPT_CD = htMethod.get("ACPT_CD");
		String PLCE_CD = htMethod.get("PLCE_CD");
		String MMBR_CD = htMethod.get("MMBR_CD");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String INPT_ID = htMethod.get("INPT_ID");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(EXAM_YN == null) { EXAM_YN = ""; }
		if(CNCL_YN == null) { CNCL_YN = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }
		if(DEPT_NM == null) { DEPT_NM = ""; }
		if(ACPT_CD == null) { ACPT_CD = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(MMBR_CD == null) { MMBR_CD = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT A.RRT_INPT_DTT RRT_RSVN_DT, A.RRT_EXAM_TM, A.RRT_EXAM_DT, SUBSTR(A.RRT_RSVN_NO, 1, 8) || '-' || SUBSTR(A.RRT_RSVN_NO, 9, 6) RRT_RSVN_NO, A.RRT_EQUIP_TM, CASE WHEN NVL(A.RRT_DRUG_YN, ' ') = 'Y' THEN 'Y' ELSE '' END AS RRT_DRUG_YN, A.RRT_SMPL_YN, A.RRT_EXAM_LT, A.RRT_COMP_PR, A.RRT_PSNL_PR, A.RRT_HLTH_PR, A.RRT_SPCL_PR, A.RRT_SPRT_PR, A.RRT_DRUG_DT, A.RRT_PSNL_NM, B.ICR_BIRH_DT, A.RRT_CUST_NO, A.RRT_PSNL_AGE, F_TEL_FORMAT(A.RRT_MOBL_NO) RRT_MOBL_NO, F_TEL_FORMAT(A.RRT_TEL_NO) RRT_TEL_NO, CASE WHEN (A.RRT_SEX_CD) = '1' THEN 'M' ELSE 'F' END AS RRT_SEX_NM, F_PID(A.RRT_PSNL_ID) RRT_PSNL_ID, B.ICR_NTNA_CD, B.ICR_PENL_ID ICR_PENL_DE, B.ICR_PID_EN, CASE WHEN LENGTH(A.RRT_EXAM_CD) = 2 THEN F_CODE_FIND('0401', A.RRT_EXAM_CD || '000', '', '1') WHEN SUBSTR(A.RRT_EXAM_LT, 1, 3) IN ('E00', 'P00') THEN F_PACK_FIND(A.RRT_EXAM_LT, '') WHEN SUBSTR(A.RRT_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(A.RRT_EXAM_LT, A.RRT_COMP_CD) ELSE F_CODE_FIND('0401', A.RRT_EXAM_CD, '', '1') END AS RRT_EXAM_NM, CASE WHEN UPPER(A.RRT_HTSB_YN) = 'Y' THEN CASE WHEN SUBSTR(A.RRT_HTSB_CD, 1, 2) = '11' THEN CASE WHEN SUBSTR(A.RRT_HTSB_CD, 5, 1) = '1' THEN '일검,' WHEN SUBSTR(A.RRT_HTSB_CD, 5, 1) = '3' THEN '일검,' ELSE '일검2,' END WHEN SUBSTR(A.RRT_HTSB_CD, 1, 2) = '12' THEN CASE WHEN SUBSTR(A.RRT_HTSB_CD, 5, 1) = '1' THEN '생애,' WHEN SUBSTR(A.RRT_HTSB_CD, 5, 1) = '3' THEN '생애,' ELSE '생애2,' END WHEN SUBSTR(A.RRT_HTSB_CD, 1, 2) = '13' THEN '암' WHEN SUBSTR(A.RRT_HTSB_CD, 1, 2) = '14' THEN '구강,' ELSE '일검,' END ELSE '' END || CASE WHEN A.RRT_STOMA_CD || A.RRT_COLON_CD || A.RRT_LIVER_CD || A.RRT_BAST_CD || A.RRT_UTER_CD || NVL(A.RRT_LUNG_CD, '0') <> '000000' THEN CASE WHEN SUBSTR(A.RRT_HTSB_CD, 1, 2) = '13' THEN '암(' ELSE '암(' END ELSE '' END || CASE WHEN NVL(A.RRT_STOMA_CD, ' ') = ' '";
		sql += " OR NVL(A.RRT_STOMA_CD, '0') = '0' THEN '' ELSE '위,' END || CASE WHEN NVL(A.RRT_COLON_CD, ' ') = ' '";
		sql += " OR NVL(A.RRT_COLON_CD, '0') = '0' THEN '' ELSE '대,' END || CASE WHEN NVL(A.RRT_LIVER_CD, ' ') = ' '";
		sql += " OR NVL(A.RRT_LIVER_CD, '0') = '0' THEN '' ELSE '간,' END || CASE WHEN NVL(A.RRT_BAST_CD, ' ') = ' '";
		sql += " OR NVL(A.RRT_BAST_CD, '0') = '0' THEN '' ELSE '유,' END || CASE WHEN NVL(A.RRT_UTER_CD, ' ') = ' '";
		sql += " OR NVL(A.RRT_UTER_CD, '0') = '0' THEN '' ELSE '자,' END || CASE WHEN NVL(A.RRT_LUNG_CD, ' ') = ' '";
		sql += " OR NVL(A.RRT_LUNG_CD, '0') = '0' THEN '' ELSE '폐,' END || CASE WHEN A.RRT_STOMA_CD || A.RRT_COLON_CD || A.RRT_LIVER_CD || A.RRT_BAST_CD || A.RRT_UTER_CD || NVL(A.RRT_LUNG_CD, '0') <> '000000' THEN '),' ELSE '' END || CASE WHEN SUBSTR(A.RRT_HTSB_CD, 1, 2) <> '14' THEN CASE WHEN UPPER(A.RRT_ORAL_YN) = 'Y'";
		sql += " AND UPPER(A.RRT_HDMD_YN) = 'Y' THEN '구강,' WHEN A.RRT_ORAL_YN = '1'";
		sql += " OR A.RRT_ORAL_YN = '3' THEN '구강,' ELSE '' END ELSE '' END || CASE WHEN UPPER(A.RRT_SPSB_YN) = 'Y' THEN '특검,' ELSE '' END || CASE WHEN UPPER(A.RRT_CVSB_YN) = 'Y' THEN '뇌심,' ELSE '' END || CASE WHEN UPPER(A.RRT_EMSB_YN) = 'Y' THEN '채용,' ELSE '' END || CASE WHEN UPPER(A.RRT_ETSB_YN) = 'Y' THEN '기타,' ELSE '' END AS RRT_HTSB_OX, CASE WHEN A.RRT_MMBR_CD = '00' THEN '' ELSE F_CODE_FIND('0711', A.RRT_MMBR_CD, '', '1') END AS RRT_MMBR_NM, F_COMP_FIND(A.RRT_COMP_CD) RRT_COMP_NM, A.RRT_DEPT_NM, A.RRT_DIVI_NO, F_CODE_FIND('0703', B.ICR_NTNA_CD, '', '1') RRT_NTNA_NM, CASE WHEN NVL(A.RRT_STOOL_YN, ' ') = 'Y' THEN '분변/' ELSE '' END || CASE WHEN NVL(A.RRT_DRUG_YN, ' ') = 'Y' THEN '내시경/' ELSE '' END || CASE WHEN NVL(A.RRT_BLOOD_YN, ' ') = 'Y' THEN '혈압/' ELSE '' END || CASE WHEN NVL(A.RRT_ASPL_YN, ' ') = 'Y' THEN '아스피린' ELSE '' END AS RRT_DRUG_NM, CASE WHEN INSTR(A.RRT_EQUIP_LT, 'E0001|') > 0";
		sql += " OR INSTR(A.RRT_EQUIP_LT, 'E0002|') > 0 THEN 'Y' ELSE 'N' END RRT_STOMA_YN, CASE WHEN INSTR(A.RRT_EQUIP_LT, 'E0007|') > 0";
		sql += " OR INSTR(A.RRT_EQUIP_LT, 'E0008|') > 0 THEN 'Y' ELSE 'N' END RRT_COLON_YN, CASE WHEN NVL(A.RRT_CNCL_YN, 'N') = 'Y' THEN '예약취소' ELSE CASE WHEN A.RRT_EXAM_DT < TO_CHAR(SYSDATE, 'YYYY-MM-DD') THEN CASE WHEN NVL(A.RRT_EXAM_SQ, ' ') = ' ' THEN '미검' ELSE A.RRT_EXAM_SQ END ELSE CASE WHEN NVL(A.RRT_EXAM_SQ, ' ') <> ' ' THEN A.RRT_EXAM_SQ ELSE '' END END END AS RRT_EXAM_SQ, F_TEL_FORMAT(A.RRT_ZIP_CD) RRT_ZIP_CD, A.RRT_ZIP_AR, A.RRT_ROAD_AR, A.RRT_RSVN_TX";
		sql += ", A.RRT_CHART_NO, A.RRT_QUEST_KD, F_CODE_FIND('0723', B.ICR_REGION_CD, '', '1') RRT_REGN_NM,";
		sql += " A.RRT_DISC_RC,  F_CODE_FIND('0989', A.RRT_DISC_RC, '', '1') AS RRT_DISC_NM, ";
        sql += " A.RRT_DISC_CD,  A.RRT_DISC_RT, A.RRT_DISC_PR, A.RRT_DISC_CPR, A.RRT_DISC_TX, A.RRT_OCS_NO, A.RRT_SALES_ID, C.IAU_PENL_NM, A.RRT_INPT_DTT";
		sql += " FROM RT_RSVT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.RRT_CUST_NO ";
		sql += " INNER JOIN IT_AUTH_USER C ON C.IAU_EMP_NO = A.RRT_INPT_ID";
		sql += " WHERE A.RRT_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";
		sql += " AND SUBSTR(A.RRT_EXAM_CD, 1, 2) <> '31'";

		if(EXAM_YN.equals("N")) {
			sql += " AND A.RRT_EXAM_DT < TO_CHAR(SYSDATE, 'YYYY-MM-DD')";
			sql += " AND NVL(A.RRT_EXAM_SQ, ' ') = ' '";
		}

		if(CNCL_YN.equals("Y")) {
			sql += " AND NVL(A.RRT_CNCL_YN, 'N') = 'Y'";
		} else if(CNCL_YN.equals("N")) {
			sql += " AND NVL(A.RRT_CNCL_YN, 'N') <> 'Y'";
		}

		if(!COMP_CD.equals("")) {
			sql += " AND A.RRT_COMP_CD = '" + COMP_CD + "'";
		}

		if(!DEPT_CD.equals("")) {
			sql += " AND A.RRT_DEPT_CD = '" + DEPT_CD + "'";
		}
		else if(!DEPT_NM.equals("")) {
			sql += " AND A.RRT_DEPT_NM LIKE '%'||'" + DEPT_NM + "'||'%'";
		}

		if(!ACPT_CD.equals("")) {
			sql += " AND A.RRT_ACPT_CD = '" + ACPT_CD + "'";
		}

		if(!PLCE_CD.equals("")) {
			sql += " AND A.RRT_PLCE_CD = '" + PLCE_CD + "'";
		}

		if(!MMBR_CD.equals("")) {
			sql += " AND A.RRT_MMBR_CD = '" + MMBR_CD + "'";
		}

		if(!PSNL_NM.equals("")) {
			sql += " AND A.RRT_PSNL_NM LIKE '%" + PSNL_NM + "%'";
		}

		if(!INPT_ID.equals("")) {
			sql += " AND A.RRT_INPT_ID = '" + INPT_ID + "'";
		}

		sql += PARAM_TX1;
		sql += PARAM_TX2;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_List_btnRsvn_SrchClick_001 \n";
			G_INFO += "설명 : 예약 현황 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " EXAM_YN : " + EXAM_YN + " \n";
			G_INFO += " CNCL_YN : " + CNCL_YN + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
			G_INFO += " DEPT_NM : " + DEPT_NM + " \n";
			G_INFO += " ACPT_CD : " + ACPT_CD + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
			G_INFO += " MMBR_CD : " + MMBR_CD + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
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
