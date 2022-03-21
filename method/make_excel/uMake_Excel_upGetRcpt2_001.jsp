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

		String G_ENCRT_KD = htMethod.get("G_ENCRT_KD");
		String DTERCPTFR = htMethod.get("DTERCPTFR");
		String DTERCPTTO = htMethod.get("DTERCPTTO");
		String EDTEEA_CHART_NO = htMethod.get("EDTEEA_CHART_NO");
		String EDTEEA_PSNL_NM = htMethod.get("EDTEEA_PSNL_NM");
		String MSKCOMP_CODE = htMethod.get("MSKCOMP_CODE");
		String CMBPLACE = htMethod.get("CMBPLACE");
		String CMBSPCL = htMethod.get("CMBSPCL");
		String CMBPACK_CD = htMethod.get("CMBPACK_CD");
		String CMBSRCHTEST = htMethod.get("CMBSRCHTEST");
		String CMBSORT = htMethod.get("CMBSORT");

		//
		if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
		if(DTERCPTFR == null) { DTERCPTFR = ""; }
		if(DTERCPTTO == null) { DTERCPTTO = ""; }
		if(EDTEEA_CHART_NO == null) { EDTEEA_CHART_NO = ""; }
		if(EDTEEA_PSNL_NM == null) { EDTEEA_PSNL_NM = ""; }
		if(MSKCOMP_CODE == null) { MSKCOMP_CODE = ""; }
		if(CMBPLACE == null) { CMBPLACE = ""; }
		if(CMBSPCL == null) { CMBSPCL = ""; }
		if(CMBPACK_CD == null) { CMBPACK_CD = ""; }
		if(CMBSRCHTEST == null) { CMBSRCHTEST = ""; }
		if(CMBSORT == null) { CMBSORT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		if(G_ENCRT_KD.equals("1")) {
			sql = " SELECT DISTINCT ICR_PID_EN AS ICR_PENL_ID,";
		}
		else if(G_ENCRT_KD.equals("2")) {
			sql = " SELECT DISTINCT ECL_DECRYPT(ICR_PID_EN) AS ICR_PENL_ID,";
		}
		else {
			sql = " SELECT DISTINCT ICR_PENL_ID,";
		}

		sql += " EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM, EEA_PSNL_AGE, EEA_SEX_CD, EEA_EXAM_CD, EEA_HTSB_YN, EEA_SPSB_YN, ";
		sql += " EEA_EMSB_YN, EEA_RSLT_CD, EEA_BLRT_CD, RTRIM(LTRIM(EEA_CHART_NO)) EEA_CHART_NO, EEA_TEL_NO, EEA_MOBL_NO, ";
		sql += " EEA_ZIP_CD, EEA_ZIP_AR || EEA_ROAD_AR AS EEA_ZIP_AR, EEA_DIVI_NO, EEA_ENTRY_DT, EEA_FAMY_NM, ICR_BIRH_DT, ";
		sql += " EEA_COMP_CD, ICY_COMP_NM, EEA_DEPT_NM, CASE WHEN EEA_SEX_CD = '1' THEN '남' WHEN EEA_SEX_CD = '2' THEN '여' END AS EEA_SEX_NM, (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0919'";
		sql += " AND CCN_LEVEL = '5'";
		sql += " AND CCN_SMALL = EEA_FAMY_CD) AS EEA_FAMY_CD, EEA_HLTHR_PR, EEA_SPCLR_PR, EEA_PSNLR_PR, EEA_COMPR_PR, EEA_ACPT_TX, ";
		sql += " EEA_DIVI_CS, EEA_CLSS_KD, ICR_EMAI_AR, ICR_INFO_YN, ICR_INFORE_YN, ";
        sql += "  case when substr(EEA_EXAM_LT, 1, 3) in ('P00', 'E00') then f_pack_find(EEA_EXAM_LT, '')  ";
        sql += "       when substr(EEA_EXAM_LT, 1, 3) = 'C03' then f_pack_find(EEA_EXAM_LT, EEA_COMP_CD) ";
        sql += "       else f_code_find('0401', EEA_EXAM_CD, '', '1') end as EEA_PACK_NM ";
		sql += " FROM ET_EXAM_ACPT JOIN IT_CUSTOMER";
		sql += " ON ICR_CUST_NO = EEA_CUST_NO LEFT OUTER JOIN IT_COMPANY";
		sql += " ON ICY_COMP_CD = EEA_COMP_CD";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + DTERCPTFR + "'";
		sql += " AND '" + DTERCPTTO + "'";
		sql += " AND EEA_ORDER_YN <> 'C'";

		if(!EDTEEA_CHART_NO.equals("")) {
			sql += " AND EEA_CHART_NO = '" + EDTEEA_CHART_NO + "'";
		}

		if(!EDTEEA_PSNL_NM.equals("")) {
			sql += " AND EEA_PSNL_NM LIKE '" + EDTEEA_PSNL_NM + "' || '%'";
		}

		if(!MSKCOMP_CODE.equals("")) {
			sql += " AND EEA_COMP_CD = '" + MSKCOMP_CODE + "'";
		}

		if(!CMBPLACE.equals("")) {
			sql += " AND EEA_PLCE_CD = '" + CMBPLACE + "'";
		}

		if(!CMBSPCL.equals("")) {
			sql += " AND EEA_SPCL_CD = '" + CMBSPCL + "'";
		}

		if(!CMBPACK_CD.equals("")) {
			sql += " AND EEA_EXAM_LT LIKE '%' || '" + CMBPACK_CD + "' || '%'";
		}

		if(!CMBSRCHTEST.equals("")) {
			if(CMBSRCHTEST.equals("10000")) {
				sql += " AND (SUBSTR(EEA_EXAM_CD,1,1) = '1'";
				sql += " OR SUBSTR(EEA_HTSB_CD,1,1) = '1')";
			}
			else if(CMBSRCHTEST.equals("11001")) {
				sql += " AND (EEA_EXAM_CD IN ('11001', '12001', '12003')";
				sql += " OR EEA_HTSB_CD IN ('11001', '12001', '12003'))";
			}
			else if(CMBSRCHTEST.equals("11002")) {
				sql += " AND (EEA_EXAM_CD IN ('11002', '12002', '12004')";
				sql += " OR EEA_HTSB_CD IN ('11002', '12002', '12004'))";
			}
			else if(CMBSRCHTEST.equals("12000")) {
				sql += " AND (EEA_EXAM_CD IN ('12001', '12002', '12003', '12004')";
				sql += " OR EEA_HTSB_CD IN ('12001', '12002', '12003', '12004'))";
			}
			else if(CMBSRCHTEST.equals("13000")) {
				sql += " AND (EEA_STOMA_CD > '0'";
				sql += " OR EEA_COLON_CD > '0'";
				sql += " OR EEA_LIVER_CD > '0'";
				sql += " OR EEA_BAST_CD > '0'";
				sql += " OR EEA_UTER_CD > '0'";
				sql += " OR NVL(EEA_LUNG_CD, '0') > '0')";
			}
			else if(CMBSRCHTEST.equals("14001")) {
				sql += " AND EEA_ORAL_YN = 'Y'";
			}
			else if(CMBSRCHTEST.equals("20000")) {
				sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '2'";
			}
			else if(CMBSRCHTEST.equals("31000")) {
				sql += " AND SUBSTR(EEA_EXAM_CD,1,2) = '31'";
			}
			else if(CMBSRCHTEST.equals("32000")) {
				sql += " AND (SUBSTR(EEA_EXAM_CD,1,2) = '32'";
				sql += " OR SUBSTR(EEA_EMSB_CD,1,2) = '32')";
			}
			else if(CMBSRCHTEST.equals("40000")) {
				sql += " AND (SUBSTR(EEA_EXAM_CD,1,1) = '4'";
				sql += " OR SUBSTR(EEA_SPSB_CD,1,1) = '4')";
			}
			else if(CMBSRCHTEST.equals("41001")) {
				sql += " AND (EEA_EXAM_CD = '41001'";
				sql += " OR EEA_SPSB_CD = '41001')";
			}
			else if(CMBSRCHTEST.equals("42001")) {
				sql += " AND (EEA_EXAM_CD = '42001'";
				sql += " OR EEA_SPSB_CD = '42001')";
			}
			else if(CMBSRCHTEST.equals("43002")) {
				sql += " AND ((EEA_EXAM_CD IN ('11002', '12002', '12004'))";
				sql += " OR (EEA_HTSB_CD IN ('11002', '12002', '12004'))";
				sql += " OR (EEA_EXAM_CD = '42001')";
				sql += " OR (EEA_SPSB_CD = '42001'))";
			}
			else if(CMBSRCHTEST.equals("49001")) {
				sql += " AND (SUBSTR(EEA_EXAM_CD,1,1) = '4'";
				sql += " OR SUBSTR(EEA_SPSB_CD,1,1) = '4')";
				sql += " AND EEA_SPCL_CD = '07'";
			}
			else if(CMBSRCHTEST.equals("49002")) {
				sql += " AND (SUBSTR(EEA_EXAM_CD,1,1) = '4'";
				sql += " OR SUBSTR(EEA_SPSB_CD,1,1) = '4')";
				sql += " AND EEA_SPCL_CD <> '07'";
			}
			else if(CMBSRCHTEST.equals("50000")) {
				sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '5'";
			}
			else if(CMBSRCHTEST.equals("60000")) {
				sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '6'";
			}
			else if(CMBSRCHTEST.equals("70000")) {
				sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '7'";
			}
			else if(CMBSRCHTEST.equals("80000")) {
				sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '8'";
			}
			else if(CMBSRCHTEST.equals("90000")) {
				sql += " AND (SUBSTR(EEA_EXAM_CD,1,1) = '9'";
				sql += " OR SUBSTR(EEA_ETSB_CD,1,1) = '9')";
			}
		}

		if(CMBSORT.equals("1")) {
			sql += " ORDER BY EEA_EXAM_DT, EEA_EXAM_SQ";
		}
		else if(CMBSORT.equals("2")) {
			sql += " ORDER BY ICY_COMP_NM, EEA_DEPT_NM, EEA_PSNL_NM, EEA_EXAM_DT, EEA_EXAM_SQ";
		}
		else if(CMBSORT.equals("3")) {
			sql += " ORDER BY ICY_COMP_NM";
		}
		else if(CMBSORT.equals("4")) {
			sql += " ORDER BY EEA_PSNL_NM";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMake_Excel_upGetRcpt2_001 \n";
			G_INFO += "설명 : 개인정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " G_ENCRT_KD : " + G_ENCRT_KD + " \n";
			G_INFO += " DTERCPTFR : " + DTERCPTFR + " \n";
			G_INFO += " DTERCPTTO : " + DTERCPTTO + " \n";
			G_INFO += " EDTEEA_CHART_NO : " + EDTEEA_CHART_NO + " \n";
			G_INFO += " EDTEEA_PSNL_NM : " + EDTEEA_PSNL_NM + " \n";
			G_INFO += " MSKCOMP_CODE : " + MSKCOMP_CODE + " \n";
			G_INFO += " CMBPLACE : " + CMBPLACE + " \n";
			G_INFO += " CMBSPCL : " + CMBSPCL + " \n";
			G_INFO += " CMBPACK_CD : " + CMBPACK_CD + " \n";
			G_INFO += " CMBSRCHTEST : " + CMBSRCHTEST + " \n";
			G_INFO += " CMBSORT : " + CMBSORT + " \n";
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
