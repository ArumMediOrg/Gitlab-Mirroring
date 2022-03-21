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

		String COMP_CD = htMethod.get("COMP_CD");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String CNRT_SQ = htMethod.get("CNRT_SQ");
		String CUST_SQ = htMethod.get("CUST_SQ");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }
		if(CUST_SQ == null) { CUST_SQ = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT '' EXAM_YR, '' EXAM_CD, '' EXAM_SQ, '' EXAM_YN, '' EXAM_DP, '' EXAM_NM,
       '' PRCE_DT, '' ITEM_LT, '' CALC_CD,    0 EXAM_PR,
          0 SALE_PR,    0 COUP_PR,    0 FAMY_PR,    0 GRUP_PR,    0 CUPN_PR,    0 MMBR_PR,
          0 OPTN_PR,    0 JCSG_PR,    0 HESG_PR,    0 GBSG_PR,    0 SBSG_PR,    0 TGSG_PR,
       'N' HTSB_YN, 'N' SPSB_YN, 'N' CVSB_YN, 'N' ETSB_YN, 'N' EMSB_YN,
       ''  HTPR_CD, ''  SPPR_CD, ''  CVPR_CD, ''  ETPR_CD, ''  EMPR_CD, C.ECC_SALE_ID SALE_ID,
       '9' CNCL_CD, 'N' OPTN_YN, ''  EXAM_KD, ''  PACK_RMK, B.ECT_RSVT_DT,
       A.ICY_PYER_CD  PYER_CD, A.ICY_CMPY_CD CMPY_CD, A.ICY_PRPY_CD PRPY_CD, A.ICY_TKCG_CD SDMD_CD,
       A.ICY_COMP_CD, A.ICY_COMP_NM, A.ICY_COTK_CD, B.ECT_NHIS_YN, B.ECT_NHIC_TX,
       B.ECT_CUST_SQ, B.ECT_CUST_NM, B.ECT_SEX_CD,  TO_CHAR(TO_DATE(B.ECT_BITH_DT), 'YYYYMMDD') BITH_DT, B.ECT_PENL_ID,
       B.ECT_ZIP_CD,  B.ECT_ZIP_SQ,  B.ECT_ZIP_AR,  B.ECT_ROAD_AR, B.ECT_BLDG_NO, B.ECT_MOBL_NO, B.ECT_TEL_NO,  B.ECT_EMAIL_AR,
       '' DEPT_CD,  B.ECT_DEPT_NM  DEPT_NM, B.ECT_EMPL_CD, B.ECT_HALF_CD, B.ECT_COTK_YN, '99' SPCL_CD, B.ECT_DIVI_CD,
       TO_CHAR(TO_DATE(B.ECT_ENTRY_DT), 'YYYYMMDD') ENTRY_DT, A.ICY_COMP_TX, 'N' UBEH_YN
  FROM IT_COMPANY A, ET_COMP_CNRT_CUST B, ET_COMP_CNRT C
 WHERE A.ICY_COMP_CD = :COMP_CD
   AND B.ECT_COMP_CD = A.ICY_COMP_CD
   AND B.ECT_MNGT_YR = SUBSTR(:EXAM_DT, 1, 4)
   AND B.ECT_CNRT_SQ = :CNRT_SQ
   AND B.ECT_CUST_SQ = :CUST_SQ
   AND UPPER(B.ECT_COTK_YN) = 'N'
   AND UPPER(B.ECT_USE_YN) = 'Y'
   AND ISNULL(B.ECT_EXAM_DT, ' ') = ' '
   AND C.ECC_COMP_CD = B.ECT_COMP_CD
   AND C.ECC_MNGT_YR = B.ECT_MNGT_YR
   AND C.ECC_CNRT_SQ = B.ECT_CNRT_SQ
  :PARAM_TX
		*/

		sql = " SELECT '' EXAM_YR, '' EXAM_CD, '' EXAM_SQ, '' EXAM_YN, '' EXAM_DP, '' EXAM_NM, '' PRCE_DT, '' ITEM_LT, '' CALC_CD, 0 EXAM_PR, ";
		sql += " 0 SALE_PR, 0 COUP_PR, 0 FAMY_PR, 0 GRUP_PR, 0 CUPN_PR, 0 MMBR_PR, 0 OPTN_PR, 0 JCSG_PR, 0 HESG_PR, 0 GBSG_PR, 0 SBSG_PR, ";
		sql += " 0 TGSG_PR, 'N' HTSB_YN, 'N' SPSB_YN, 'N' CVSB_YN, 'N' ETSB_YN, 'N' EMSB_YN, '' HTPR_CD, '' SPPR_CD, '' CVPR_CD, '' ETPR_CD, ";
		sql += " '' EMPR_CD, C.ECC_SALE_ID SALE_ID, '9' CNCL_CD, 'N' OPTN_YN, '' EXAM_KD, '' PACK_RMK, B.ECT_RSVT_DT, A.ICY_PYER_CD PYER_CD, ";
		sql += " A.ICY_CMPY_CD CMPY_CD, A.ICY_PRPY_CD PRPY_CD, A.ICY_TKCG_CD SDMD_CD, A.ICY_COMP_CD, A.ICY_COMP_NM, A.ICY_COTK_CD, B.ECT_NHIS_YN, ";
		sql += " B.ECT_NHIC_TX, B.ECT_CUST_SQ, B.ECT_CUST_NM, B.ECT_SEX_CD, TO_CHAR(TO_DATE(B.ECT_BITH_DT, 'YYYYMMDD'), 'YYYYMMDD') BITH_DT, B.ECT_PENL_ID, ";
		sql += " B.ECT_ZIP_CD, B.ECT_ZIP_SQ, B.ECT_ZIP_AR, B.ECT_ROAD_AR, B.ECT_BLDG_NO, B.ECT_MOBL_NO, B.ECT_TEL_NO, B.ECT_EMAIL_AR, '' DEPT_CD, ";
		sql += " B.ECT_DEPT_NM DEPT_NM, B.ECT_EMPL_CD, B.ECT_HALF_CD, B.ECT_COTK_YN, '99' SPCL_CD, B.ECT_DIVI_CD, ";
		sql += " TO_CHAR(TO_DATE(B.ECT_ENTRY_DT, 'YYYYMMDD'), 'YYYYMMDD') ENTRY_DT, A.ICY_COMP_TX, 'N' UBEH_YN";
		sql += " FROM IT_COMPANY A, ET_COMP_CNRT_CUST B, ET_COMP_CNRT C";
		sql += " WHERE A.ICY_COMP_CD = '" + COMP_CD + "'";
		sql += " AND B.ECT_COMP_CD = A.ICY_COMP_CD";
		sql += " AND B.ECT_MNGT_YR = SUBSTR('" + EXAM_DT + "', 1, 4)";
		sql += " AND B.ECT_CNRT_SQ = '" + CNRT_SQ + "'";
		sql += " AND B.ECT_CUST_SQ = '" + CUST_SQ + "'";
		sql += " AND UPPER(B.ECT_COTK_YN) = 'N'";
		sql += " AND UPPER(B.ECT_USE_YN) = 'Y'";
		sql += " AND NVL(B.ECT_EXAM_DT, ' ') = ' '";
		sql += " AND C.ECC_COMP_CD = B.ECT_COMP_CD";
		sql += " AND C.ECC_MNGT_YR = B.ECT_MNGT_YR";
		sql += " AND C.ECC_CNRT_SQ = B.ECT_CNRT_SQ";
		sql += PARAM_TX;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamSetting_011 \n";
			G_INFO += "설명 : 사업장 계약 명단만 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
			G_INFO += " CUST_SQ : " + CUST_SQ + " \n";
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
