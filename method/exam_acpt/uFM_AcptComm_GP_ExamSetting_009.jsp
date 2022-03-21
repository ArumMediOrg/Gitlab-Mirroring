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
		String COMP_CD = htMethod.get("COMP_CD");
		String CNRT_SQ = htMethod.get("CNRT_SQ");
		String PROF_SQ = htMethod.get("PROF_SQ");
		String CUST_SQ = htMethod.get("CUST_SQ");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }
		if(CUST_SQ == null) { CUST_SQ = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.ECP_MNGT_YR EXAM_YR, B.ECP_EXAM_CD EXAM_CD, B.ECP_CNRT_SQ || B.ECP_PROF_SQ EXAM_SQ,
       B.ECP_MNGT_YR || '-' || B.ECP_CNRT_SQ || B.ECP_PROF_SQ EXAM_DP,
       B.ECP_PROF_NM || '-' || B.ECP_PROF_TL EXAM_NM, '' EXAM_YN,
       :EXAM_DT PRCE_DT, B.ECP_CALC_CD CALC_CD, B.ECP_ITEM_LT ITEM_LT, C.ECT_RSVT_DT,
       B.ECP_SPRT_PR SALE_PR, B.ECP_CNRT_PR GRUP_PR, B.ECP_COMP_PR COUP_PR, B.ECP_PERS_PR FAMY_PR, 0 CUPN_PR, 0 MMBR_PR,
       0 JCSG_PR,  0 HESG_PR, 0 GBSG_PR,  0 SBSG_PR, 0 TGSG_PR, B.ECP_CNRT_PR EXAM_PR, B.ECP_OPTN_PR OPTN_PR,
       B.ECP_HTSB_YN HTSB_YN, B.ECP_SPSB_YN SPSB_YN, B.ECP_CVSB_YN CVSB_YN, B.ECP_EMSB_YN EMSB_YN, B.ECP_ETSB_YN ETSB_YN,
       B.ECP_HTPR_CD HTPR_CD, B.ECP_SPPR_CD SPPR_CD, B.ECP_CVPR_CD CVPR_CD, B.ECP_EMPR_CD EMPR_CD, B.ECP_ETPR_CD ETPR_CD,
       B.ECP_CNCL_CD CNCL_CD, B.ECP_OPTN_YN OPTN_YN, '0' EXAM_KD, B.ECP_PROF_TX PACK_RMK, A.ECC_SALE_ID SALE_ID,
       B.ECP_PYER_CD PYER_CD, B.ECP_CMPY_CD CMPY_CD, B.ECP_PRPY_CD PRPY_CD, C.ECT_NHIS_YN, C.ECT_NHIC_TX,
       C.ECT_CUST_SQ, C.ECT_CUST_NM, C.ECT_SEX_CD,   TO_CHAR(TO_DATE(C.ECT_BITH_DT), 'YYYYMMDD') BITH_DT, C.ECT_PENL_ID, '99' SPCL_CD,
       C.ECT_ZIP_CD,  C.ECT_ZIP_SQ,  C.ECT_ZIP_AR,   C.ECT_ROAD_AR, C.ECT_BLDG_NO, C.ECT_MOBL_NO, C.ECT_TEL_NO,  C.ECT_EMAIL_AR,
       C.ECT_DEPT_CD DEPT_CD, C.ECT_DEPT_NM DEPT_NM, C.ECT_EMPL_CD, C.ECT_HALF_CD, C.ECT_COTK_YN, D.ICY_COMP_CD, D.ICY_COMP_NM, D.ICY_COTK_CD,
       C.ECT_DIVI_CD, TO_CHAR(TO_DATE(C.ECT_ENTRY_DT), 'YYYYMMDD') ENTRY_DT, D.ICY_COMP_TX, 'N' UBEH_YN
  FROM ET_COMP_CNRT A, ET_COMP_CNRT_PROF B, ET_COMP_CNRT_CUST C, IT_COMPANY D
 WHERE D.ICY_COMP_CD = :COMP_CD
   AND A.ECC_COMP_CD = D.ICY_COMP_CD
   AND A.ECC_MNGT_YR = SUBSTR(:EXAM_DT, 1, 4)
   AND A.ECC_CNRT_SQ = :CNRT_SQ
   AND UPPER(A.ECC_USE_YN) = 'Y'
   AND B.ECP_COMP_CD = A.ECC_COMP_CD
   AND B.ECP_MNGT_YR = A.ECC_MNGT_YR
   AND B.ECP_CNRT_SQ = A.ECC_CNRT_SQ
   AND B.ECP_PROF_SQ = :PROF_SQ
   AND UPPER(B.ECP_USE_YN) = 'Y'
   AND C.ECT_COMP_CD = B.ECP_COMP_CD
   AND C.ECT_MNGT_YR = B.ECP_MNGT_YR
   AND C.ECT_CNRT_SQ = B.ECP_CNRT_SQ
   AND C.ECT_PROF_SQ = B.ECP_PROF_SQ
   AND C.ECT_CUST_SQ = :CUST_SQ
   AND UPPER(C.ECT_USE_YN) = 'Y'
  :PARAM_TX
		*/

		sql = " SELECT B.ECP_MNGT_YR EXAM_YR, B.ECP_EXAM_CD EXAM_CD, B.ECP_CNRT_SQ || B.ECP_PROF_SQ EXAM_SQ, ";
		sql += " B.ECP_MNGT_YR || '-' || B.ECP_CNRT_SQ || B.ECP_PROF_SQ EXAM_DP, B.ECP_PROF_NM || '-' || B.ECP_PROF_TL EXAM_NM, ";
		sql += " '' EXAM_YN, '" + EXAM_DT + "' PRCE_DT, B.ECP_CALC_CD CALC_CD, B.ECP_ITEM_LT ITEM_LT, C.ECT_RSVT_DT, ";
		sql += " B.ECP_SPRT_PR SALE_PR, B.ECP_CNRT_PR GRUP_PR, B.ECP_COMP_PR COUP_PR, B.ECP_PERS_PR FAMY_PR, ";
		sql += " 0 CUPN_PR, 0 MMBR_PR, 0 JCSG_PR, 0 HESG_PR, 0 GBSG_PR, 0 SBSG_PR, 0 TGSG_PR, B.ECP_CNRT_PR EXAM_PR, ";
		sql += " B.ECP_OPTN_PR OPTN_PR, B.ECP_HTSB_YN HTSB_YN, B.ECP_SPSB_YN SPSB_YN, B.ECP_CVSB_YN CVSB_YN, B.ECP_EMSB_YN EMSB_YN, ";
		sql += " B.ECP_ETSB_YN ETSB_YN, B.ECP_HTPR_CD HTPR_CD, B.ECP_SPPR_CD SPPR_CD, B.ECP_CVPR_CD CVPR_CD, B.ECP_EMPR_CD EMPR_CD, ";
		sql += " B.ECP_ETPR_CD ETPR_CD, B.ECP_CNCL_CD CNCL_CD, B.ECP_OPTN_YN OPTN_YN, '0' EXAM_KD, B.ECP_PROF_TX PACK_RMK, ";
		sql += " A.ECC_SALE_ID SALE_ID, B.ECP_PYER_CD PYER_CD, B.ECP_CMPY_CD CMPY_CD, B.ECP_PRPY_CD PRPY_CD, C.ECT_NHIS_YN, ";
		sql += " C.ECT_NHIC_TX, C.ECT_CUST_SQ, C.ECT_CUST_NM, C.ECT_SEX_CD, TO_CHAR(TO_DATE(C.ECT_BITH_DT, 'YYYYMMDD'), 'YYYYMMDD') BITH_DT, ";
		sql += " C.ECT_PENL_ID, '99' SPCL_CD, C.ECT_ZIP_CD, C.ECT_ZIP_SQ, C.ECT_ZIP_AR, C.ECT_ROAD_AR, C.ECT_BLDG_NO, C.ECT_MOBL_NO, ";
		sql += " C.ECT_TEL_NO, C.ECT_EMAIL_AR, C.ECT_DEPT_CD DEPT_CD, C.ECT_DEPT_NM DEPT_NM, C.ECT_EMPL_CD, C.ECT_HALF_CD, C.ECT_COTK_YN, ";
		sql += " D.ICY_COMP_CD, D.ICY_COMP_NM, D.ICY_COTK_CD, C.ECT_DIVI_CD, TO_CHAR(TO_DATE(C.ECT_ENTRY_DT, 'YYYYMMDD'), 'YYYYMMDD') ENTRY_DT, D.ICY_COMP_TX, 'N' UBEH_YN";
		sql += " FROM ET_COMP_CNRT A, ET_COMP_CNRT_PROF B, ET_COMP_CNRT_CUST C, IT_COMPANY D";
		sql += " WHERE D.ICY_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.ECC_COMP_CD = D.ICY_COMP_CD";
		sql += " AND A.ECC_MNGT_YR = SUBSTR('" + EXAM_DT + "', 1, 4)";
		sql += " AND A.ECC_CNRT_SQ = '" + CNRT_SQ + "'";
		sql += " AND UPPER(A.ECC_USE_YN) = 'Y'";
		sql += " AND B.ECP_COMP_CD = A.ECC_COMP_CD";
		sql += " AND B.ECP_MNGT_YR = A.ECC_MNGT_YR";
		sql += " AND B.ECP_CNRT_SQ = A.ECC_CNRT_SQ";
		sql += " AND B.ECP_PROF_SQ = '" + PROF_SQ + "'";
		sql += " AND UPPER(B.ECP_USE_YN) = 'Y'";
		sql += " AND C.ECT_COMP_CD = B.ECP_COMP_CD";
		sql += " AND C.ECT_MNGT_YR = B.ECP_MNGT_YR";
		sql += " AND C.ECT_CNRT_SQ = B.ECP_CNRT_SQ";
		sql += " AND C.ECT_PROF_SQ = B.ECP_PROF_SQ";
		sql += " AND C.ECT_CUST_SQ = '" + CUST_SQ + "'";
		sql += " AND UPPER(C.ECT_USE_YN) = 'Y'";
		sql += PARAM_TX;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamSetting_009 \n";
			G_INFO += "설명 : 사업장 묶음 계약명단 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
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
