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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String CNRT_SQ = htMethod.get("CNRT_SQ");
		String CUST_SQ = htMethod.get("CUST_SQ");
		String COMP_CD = htMethod.get("COMP_CD");
		String HALF_CD = htMethod.get("HALF_CD");
		String DEPT_CD = htMethod.get("DEPT_CD");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }
		if(CUST_SQ == null) { CUST_SQ = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(HALF_CD == null) { HALF_CD = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.ICD_MNGT_YR EXAM_YR, B.ICD_MATT_LT EXAM_CD, B.ICD_HALF_CD || B.ICD_DEPT_CD EXAM_SQ, '' EXAM_YN,
       B.ICD_MNGT_YR ||'-'|| B.ICD_HALF_CD || B.ICD_DEPT_CD EXAM_DP,
       B.ICD_DEPT_NM ||'-'|| B.ICD_SUBD_NM ||'('|| F_CODE_FIND('0910', B.ICD_SPCL_CD, '', '1') || ')' EXAM_NM,
       :EXAM_DT PRCE_DT, B.ICD_MATT_LT ITEM_LT, C.ECT_RSVT_DT,
       CASE WHEN A.ICY_TBAS_CD = '1' THEN '4'
            WHEN A.ICY_TBAS_CD = '2' THEN '5'
            ELSE F_PRICE_KIND('4') END AS CALC_CD,
       CASE WHEN A.ICY_TKCG_CD = '1' THEN B.ICD_BSBS_PR ELSE B.ICD_BCAS_PR END AS EXAM_PR,
       NVL(B.ICD_JCAS_PR, 0) AS SALE_PR,
       NVL(B.ICD_JSBS_PR, 0) AS COUP_PR,
       NVL(B.ICD_DCAS_PR, 0) AS FAMY_PR,
       NVL(B.ICD_BCAS_PR, 0) AS GRUP_PR,
       NVL(B.ICD_BSBS_PR, 0) AS CUPN_PR,
       NVL(B.ICD_DSBS_PR, 0) AS MMBR_PR,
       0 OPTN_PR, 0 JCSG_PR, 0 HESG_PR, 0 GBSG_PR, 0 SBSG_PR, 0 TGSG_PR,
       'N' HTSB_YN, 'N' SPSB_YN, 'N' CVSB_YN, 'N' ETSB_YN, 'N' EMSB_YN,
       ''  HTPR_CD, ''  SPPR_CD, ''  CVPR_CD, ''  ETPR_CD, ''  EMPR_CD, '' SALE_ID,
       '9' CNCL_CD, 'N' OPTN_YN, ''  EXAM_KD, ''  PACK_RMK,
       A.ICY_PYER_CD PYER_CD, A.ICY_CMPY_CD CMPY_CD, A.ICY_PRPY_CD PRPY_CD, A.ICY_TKCG_CD SDMD_CD,
       A.ICY_COMP_CD, A.ICY_COMP_NM, A.ICY_COTK_CD,  C.ECT_NHIS_YN, C.ECT_NHIC_TX,
       C.ECT_CUST_SQ, C.ECT_CUST_NM, C.ECT_SEX_CD,   TO_CHAR(TO_DATE(C.ECT_BITH_DT), 'YYYYMMDD') BITH_DT, C.ECT_PENL_ID,
       C.ECT_ZIP_CD,  C.ECT_ZIP_SQ,  C.ECT_ZIP_AR,   C.ECT_ROAD_AR, C.ECT_BLDG_NO, C.ECT_MOBL_NO, C.ECT_TEL_NO,  C.ECT_EMAIL_AR,
       B.ICD_DEPT_CD DEPT_CD, B.ICD_DEPT_NM DEPT_NM, C.ECT_EMPL_CD, C.ECT_HALF_CD, C.ECT_COTK_YN, B.ICD_SPCL_CD SPCL_CD, C.ECT_DIVI_CD,
       TO_CHAR(TO_DATE(C.ECT_ENTRY_DT), 'YYYYMMDD') ENTRY_DT, A.ICY_COMP_TX, 'N' UBEH_YN
  FROM IT_COMPANY A, IT_COMP_DEPT B LEFT OUTER JOIN ET_COMP_CNRT_CUST C
    ON C.ECT_COMP_CD = B.ICD_COMP_CD
   AND C.ECT_MNGT_YR = B.ICD_MNGT_YR
   AND C.ECT_CNRT_SQ = :CNRT_SQ
   AND C.ECT_CUST_SQ = :CUST_SQ
   AND C.ECT_HALF_CD = B.ICD_HALF_CD
   AND C.ECT_DEPT_CD = B.ICD_DEPT_CD
   AND UPPER(C.ECT_COTK_YN) = 'Y'
   AND UPPER(C.ECT_USE_YN) = 'Y'
   AND NVL(C.ECT_EXAM_DT, ' ') = ' '
 WHERE A.ICY_COMP_CD = :COMP_CD
   AND B.ICD_COMP_CD = A.ICY_COMP_CD
   AND B.ICD_MNGT_YR = SUBSTR(:EXAM_DT, 1, 4)
   AND B.ICD_HALF_CD = :HALF_CD
   AND B.ICD_DEPT_CD = :DEPT_CD
   AND UPPER(B.ICD_TCHK_YN) = 'Y'
   AND UPPER(B.ICD_USE_YN)  = 'Y'
  :PARAM_TX
		*/

		sql = " SELECT B.ICD_MNGT_YR EXAM_YR, B.ICD_MATT_LT EXAM_CD, B.ICD_HALF_CD || B.ICD_DEPT_CD EXAM_SQ,";
		sql += " '' EXAM_YN, B.ICD_MNGT_YR ||'-'|| B.ICD_HALF_CD || B.ICD_DEPT_CD EXAM_DP, ";
		sql += " B.ICD_DEPT_NM ||'-'|| B.ICD_SUBD_NM ||'('|| F_CODE_FIND('0910', B.ICD_SPCL_CD, '', '1') || ')' EXAM_NM, '" + EXAM_DT + "' PRCE_DT, ";
		sql += " B.ICD_MATT_LT ITEM_LT, C.ECT_RSVT_DT, ";
		sql += " CASE WHEN A.ICY_TBAS_CD = '1' THEN '4' WHEN A.ICY_TBAS_CD = '2' THEN '5' ELSE F_PRICE_KIND('4') END AS CALC_CD, ";
		sql += " CASE WHEN A.ICY_TKCG_CD = '1' THEN B.ICD_BSBS_PR ELSE B.ICD_BCAS_PR END AS EXAM_PR, NVL(B.ICD_JCAS_PR, 0) AS SALE_PR, ";
		sql += " NVL(B.ICD_JSBS_PR, 0) AS COUP_PR, NVL(B.ICD_DCAS_PR, 0) AS FAMY_PR, NVL(B.ICD_BCAS_PR, 0) AS GRUP_PR, NVL(B.ICD_BSBS_PR, 0) AS CUPN_PR, ";
		sql += " NVL(B.ICD_DSBS_PR, 0) AS MMBR_PR, 0 OPTN_PR, 0 JCSG_PR, 0 HESG_PR, 0 GBSG_PR, 0 SBSG_PR, 0 TGSG_PR, 'N' HTSB_YN, 'N' SPSB_YN, 'N' CVSB_YN, ";
		sql += " 'N' ETSB_YN, 'N' EMSB_YN, '' HTPR_CD, '' SPPR_CD, '' CVPR_CD, '' ETPR_CD, '' EMPR_CD, '' SALE_ID, '9' CNCL_CD, 'N' OPTN_YN, '' EXAM_KD, ";
		sql += " '' PACK_RMK, A.ICY_PYER_CD PYER_CD, A.ICY_CMPY_CD CMPY_CD, A.ICY_PRPY_CD PRPY_CD, A.ICY_TKCG_CD SDMD_CD, A.ICY_COMP_CD, A.ICY_COMP_NM, ";
		sql += " A.ICY_COTK_CD, C.ECT_NHIS_YN, C.ECT_NHIC_TX, C.ECT_CUST_SQ, C.ECT_CUST_NM, C.ECT_SEX_CD, TO_CHAR(TO_DATE(C.ECT_BITH_DT, 'YYYYMMDD'), 'YYYYMMDD') BITH_DT, ";
		sql += " C.ECT_PENL_ID, C.ECT_ZIP_CD, C.ECT_ZIP_SQ, C.ECT_ZIP_AR, C.ECT_ROAD_AR, C.ECT_BLDG_NO, C.ECT_MOBL_NO, C.ECT_TEL_NO, C.ECT_EMAIL_AR, ";
		sql += " B.ICD_DEPT_CD DEPT_CD, B.ICD_DEPT_NM DEPT_NM, C.ECT_EMPL_CD, C.ECT_HALF_CD, C.ECT_COTK_YN, B.ICD_SPCL_CD SPCL_CD, C.ECT_DIVI_CD, ";
		sql += " TO_CHAR(TO_DATE(C.ECT_ENTRY_DT, 'YYYYMMDD'), 'YYYYMMDD') ENTRY_DT, A.ICY_COMP_TX, 'N' UBEH_YN";
		sql += " FROM IT_COMPANY A, IT_COMP_DEPT B LEFT OUTER JOIN ET_COMP_CNRT_CUST C";
		sql += " ON C.ECT_COMP_CD = B.ICD_COMP_CD";
		sql += " AND C.ECT_MNGT_YR = B.ICD_MNGT_YR";
		sql += " AND C.ECT_CNRT_SQ = '" + CNRT_SQ + "'";
		sql += " AND C.ECT_CUST_SQ = '" + CUST_SQ + "'";
		sql += " AND C.ECT_HALF_CD = B.ICD_HALF_CD";
		sql += " AND C.ECT_DEPT_CD = B.ICD_DEPT_CD";
		sql += " AND UPPER(C.ECT_COTK_YN) = 'Y'";
		sql += " AND UPPER(C.ECT_USE_YN) = 'Y'";
		sql += " AND NVL(C.ECT_EXAM_DT, ' ') = ' '";
		sql += " WHERE A.ICY_COMP_CD = '" + COMP_CD + "'";
		sql += " AND B.ICD_COMP_CD = A.ICY_COMP_CD";
		sql += " AND B.ICD_MNGT_YR = SUBSTR('" + EXAM_DT + "', 1, 4)";
		sql += " AND B.ICD_HALF_CD = '" + HALF_CD + "'";
		sql += " AND B.ICD_DEPT_CD = '" + DEPT_CD + "'";
		sql += " AND UPPER(B.ICD_TCHK_YN) = 'Y'";
		sql += " AND UPPER(B.ICD_USE_YN) = 'Y'";
		sql += PARAM_TX;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamSetting_010 \n";
			G_INFO += "설명 : 사업장 특검 부서연계 명단 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
			G_INFO += " CUST_SQ : " + CUST_SQ + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " HALF_CD : " + HALF_CD + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
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
