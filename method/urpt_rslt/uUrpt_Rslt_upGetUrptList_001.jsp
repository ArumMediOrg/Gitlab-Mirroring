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

		String CMBPRINT_KD = htMethod.get("CMBPRINT_KD");
		String RZCOMBOBOX1 = htMethod.get("RZCOMBOBOX1");
		String DTERCPTFR = htMethod.get("DTERCPTFR");
		String DTERCPTTO = htMethod.get("DTERCPTTO");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String CHTG = htMethod.get("CHTG");
		String CMBSRCHTEST = htMethod.get("CMBSRCHTEST");
		String CMBORDER = htMethod.get("CMBORDER");

		//
		if(CMBPRINT_KD == null) { CMBPRINT_KD = ""; }
		if(RZCOMBOBOX1 == null) { RZCOMBOBOX1 = ""; }
		if(DTERCPTFR == null) { DTERCPTFR = ""; }
		if(DTERCPTTO == null) { DTERCPTTO = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(CHTG == null) { CHTG = ""; }
		if(CMBSRCHTEST == null) { CMBSRCHTEST = ""; }
		if(CMBORDER == null) { CMBORDER = ""; }

		// DB객체
		stmtList = connect.createStatement();

		if(CMBPRINT_KD.equals("3")) {

			sql = " SELECT DISTINCT ERI_EXAM_DT, ERI_EXAM_SQ, EEA_CHART_NO, EEA_PSNL_NM, EEA_MOBL_NO, ICR_PENL_ID";
			sql += ", CASE WHEN EEA_SEX_CD = '1' THEN '남' WHEN EEA_SEX_CD = '2' THEN '여' END AS EEA_SEX_CD";
			sql += ", EEA_PSNL_AGE";

			if(RZCOMBOBOX1.equals("0")) {			// 위암
				sql += " ,ECS_RSLT_KD AS RSLT_KD, ECS_ETC_EX AS ETC_EX, ECS_RSLT_EX AS RSLT_EX";
			} else if(RZCOMBOBOX1.equals("1")) {	// 대장암
				sql += " ,ECC_RSLT_KD AS RSLT_KD, ECC_ETC_EX AS ETC_EX, ECC_RSLT_EX AS RSLT_EX";
			} else if(RZCOMBOBOX1.equals("2")) {	// 간암
				sql += " ,ECL_RSLT_KD AS RSLT_KD, ECL_ETC_EX AS ETC_EX, ECL_RSLT_EX AS RSLT_EX";
			} else if(RZCOMBOBOX1.equals("3")) {	// 유방암
				sql += " ,ECB_RSLT_KD AS RSLT_KD, ECB_RSLT_EX AS RSLT_EX";
			} else if(RZCOMBOBOX1.equals("4")) {	// 자궁암
				sql += " ,ECV_RSLT_KD AS RSLT_KD, ECV_ETC_EX AS ETC_EX, ECV_RSLT_EX AS RSLT_EX";
			} else if(RZCOMBOBOX1.equals("5")) {	// 폐암
				sql += " ,ECG_RSLT_KD AS RSLT_KD, ECG_ETC_KD, ECG_ETC_EX AS ETC_EX, ECG_RSLT_EX AS RSLT_EX, ECG_RSLT_ETC_EX, ECG_AFRL_EX, ECG_AFSM_EX";
			}

			sql += " FROM ET_RSLT_ITEM JOIN ET_EXAM_ACPT";
			sql += " ON EEA_EXAM_DT = ERI_EXAM_DT";
			sql += " AND EEA_EXAM_SQ = ERI_EXAM_SQ JOIN IT_CUSTOMER";
			sql += " ON EEA_CUST_NO = ICR_CUST_NO JOIN IT_ITEM";
			sql += " ON IIM_ITEM_CD = ERI_ITEM_CD";
			sql += " AND IIM_RSLT_KD <> '9'";

			if(RZCOMBOBOX1.equals("0")) {			// 위암

				sql += " INNER JOIN ET_CANCER_STMC";
				sql += " ON ECS_EXAM_DT = ERI_EXAM_DT";
				sql += " AND ECS_EXAM_SQ = EEA_EXAM_SQ";
			} else if(RZCOMBOBOX1.equals("1")) {	// 대장암

				sql += " INNER JOIN ET_CANCER_COLO";
				sql += " ON ECC_EXAM_DT = ERI_EXAM_DT";
				sql += " AND ECC_EXAM_SQ = EEA_EXAM_SQ";
			} else if(RZCOMBOBOX1.equals("2")) {	// 간암

				sql += " INNER JOIN ET_CANCER_LIVER";
				sql += " ON ECL_EXAM_DT = ERI_EXAM_DT";
				sql += " AND ECL_EXAM_SQ = EEA_EXAM_SQ";
			} else if(RZCOMBOBOX1.equals("3")) {	// 유방암

				sql += " INNER JOIN ET_CANCER_BRST";
				sql += " ON ECB_EXAM_DT = ERI_EXAM_DT";
				sql += " AND ECB_EXAM_SQ = EEA_EXAM_SQ";
			} else if(RZCOMBOBOX1.equals("4")) {	// 자궁암

				sql += " INNER JOIN ET_CANCER_CRVC";
				sql += " ON ECV_EXAM_DT = ERI_EXAM_DT";
				sql += " AND ECV_EXAM_SQ = EEA_EXAM_SQ";
			} else if(RZCOMBOBOX1.equals("5")) {	// 폐암

				sql += " INNER JOIN ET_CANCER_LUNG";
				sql += " ON ECG_EXAM_DT = ERI_EXAM_DT";
				sql += " AND ECG_EXAM_SQ = EEA_EXAM_SQ";
			}

			sql += " WHERE ERI_EXAM_DT BETWEEN '" + DTERCPTFR + "'";
			sql += " AND '" + DTERCPTTO + "'";
			sql += " AND NVL(ERI_CNCL_YN, 'N') <> 'Y'";
			sql += " AND (";
			sql += "	EEA_STOMA_CD > 0";
			sql += " 	OR EEA_COLON_CD > 0";
			sql += " 	OR EEA_LIVER_CD > 0";
			sql += " 	OR EEA_BAST_CD > 0";
			sql += " 	OR EEA_UTER_CD > 0";
			sql += " 	OR EEA_LUNG_CD > 0";
			sql += " )";

			if (CMBORDER.equals("0")) {
				sql += " ORDER BY ERI_EXAM_DT, ERI_EXAM_SQ";
			} else if (CMBORDER.equals("1")) {
				sql += " ORDER BY EEA_CHART_NO ";
			} else if (CMBORDER.equals("2")) {
				sql += " ORDER BY EEA_PSNL_NM ";
			} else if (CMBORDER.equals("3")) {
				sql += " ORDER BY ERI_EXAM_DT, EEA_RFID_NO ";
			} else {
				sql += " ORDER BY ERI_EXAM_DT, ERI_EXAM_SQ";
			}

		} else {

			sql = " SELECT DISTINCT ERI_EXAM_DT, ERI_EXAM_SQ, EEA_CHART_NO, EEA_PSNL_NM";
			sql += ", CASE WHEN EEA_SEX_CD = '1' THEN '남' WHEN EEA_SEX_CD = '2' THEN '여' END AS EEA_SEX_CD";
			sql += ", EEA_PSNL_AGE";
			sql += ", EEA_HLTH_KD ";
			sql += " FROM ET_RSLT_ITEM JOIN ET_EXAM_ACPT";
			sql += " ON EEA_EXAM_DT = ERI_EXAM_DT";
			sql += " AND EEA_EXAM_SQ = ERI_EXAM_SQ JOIN IT_ITEM";
			sql += " ON IIM_ITEM_CD = ERI_ITEM_CD";
			sql += " WHERE ERI_EXAM_DT BETWEEN '" + DTERCPTFR + "'";
			sql += " AND '" + DTERCPTTO + "'";
			sql += " AND NVL(ERI_CNCL_YN, 'N') <> 'Y'";

			if(! CMBPRINT_KD.equals("0")) {
				sql += " AND IIM_RSLT_KD <> '9'";
			}

			if(CMBPRINT_KD.equals("0")) {

				sql += " AND ERI_ITEM_CD = '" + ITEM_CD + "'";

				if(CHTG.equals("1")) {
					sql += " AND TO_NUMBER(NVL(ERI_RSLT_VL,0)) >= 400";
				}
			} else if(CMBPRINT_KD.equals("1")) {

				sql += " AND (NVL(ERI_RSLT_VL, ' ') = ' '";
				sql += " AND NVL(ERI_RSLT_EX, ' ') = ' ')";
			}

			if(! CMBSRCHTEST.equals("")) {

				if(CMBSRCHTEST.equals("10000")) {					// 일반검진

					sql += " AND (";
					sql += "	SUBSTR(EEA_EXAM_CD,1,1) = '1'";
					sql += " 	OR SUBSTR(EEA_HTSB_CD,1,1) = '1'";
					sql += " )";
				} else if(CMBSRCHTEST.equals("11001")) {			// 일반검진 1차

					sql += " AND (";
					sql += "	EEA_EXAM_CD IN ('11001', '12001', '12003')";
					sql += " 	OR EEA_HTSB_CD IN ('11001', '12001', '12003')";
					sql += " )";
				} else if(CMBSRCHTEST.equals("11002")) {			// 일반검진 2차

					sql += " AND (";
					sql += "	EEA_EXAM_CD IN ('11002', '12002', '12004')";
					sql += " 	OR EEA_HTSB_CD IN ('11002', '12002', '12004')";
					sql += " )";
				} else if(CMBSRCHTEST.equals("11002")) {			// 생애검진

					sql += " AND (";
					sql += "	EEA_EXAM_CD IN ('12001', '12002', '12003', '12004')";
					sql += " 	OR EEA_HTSB_CD IN ('12001', '12002', '12003', '12004')";
					sql += " )";
				} else if(CMBSRCHTEST.equals("13000")) {			// 암검진

					sql += " AND (";
					sql += "	EEA_STOMA_CD > 0";
					sql += " 	OR EEA_COLON_CD > 0";
					sql += " 	OR EEA_LIVER_CD > 0";
					sql += " 	OR EEA_BAST_CD > 0";
					sql += " 	OR EEA_UTER_CD > 0";
					sql += " )";
				} else if(CMBSRCHTEST.equals("20000")) {			// 종합검진

					sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '2'";
				} else if(CMBSRCHTEST.equals("31000")) {			// 학생검진

					sql += " AND SUBSTR(EEA_EXAM_CD,1,2) = '31'";
				} else if(CMBSRCHTEST.equals("32000")) {			// 채용검진

					sql += " AND (SUBSTR(EEA_EXAM_CD,1,2) = '32'";
					sql += " OR SUBSTR(EEA_EMSB_CD,1,2) = '32')";
				} else if(CMBSRCHTEST.equals("40000")) {			// 특수검진

					sql += " AND (SUBSTR(EEA_EXAM_CD,1,1) = '4'";
					sql += " OR SUBSTR(EEA_SPSB_CD,1,1) = '4')";
				} else if(CMBSRCHTEST.equals("40000")) {			// 정밀검진

					sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '5'";
				} else if(CMBSRCHTEST.equals("50000")) {			// 혈액검진

					sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '6'";
				} else if(CMBSRCHTEST.equals("70000")) {			// 개별검진

					sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '7'";
				} else if(CMBSRCHTEST.equals("80000")) {			// 뇌심혈관

					sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '8'";
				} else if(CMBSRCHTEST.equals("90000")) {			// 기타검진

					sql += " AND (";
					sql += "	SUBSTR(EEA_EXAM_CD,1,1) = '9'";
					sql += " 	OR SUBSTR(EEA_EXAM_CD,1,1) = '9'";
					sql += " )";
				}
			}

			if (CMBORDER.equals("0")) {
				sql += " ORDER BY ERI_EXAM_DT, ERI_EXAM_SQ";
			} else if (CMBORDER.equals("1")) {
				sql += " ORDER BY EEA_CHART_NO ";
			} else if (CMBORDER.equals("2")) {
				sql += " ORDER BY EEA_PSNL_NM ";
			} else if (CMBORDER.equals("3")) {
				sql += " ORDER BY ERI_EXAM_DT, EEA_RFID_NO ";
			} else {
				sql += " ORDER BY ERI_EXAM_DT, ERI_EXAM_SQ";
			}
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uUrpt_Rslt_upGetUrptList_001 \n";
			G_INFO += "설명 : 검진결과정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CMBPRINT_KD : " + CMBPRINT_KD + " \n";
			G_INFO += " RZCOMBOBOX1 : " + RZCOMBOBOX1 + " \n";
			G_INFO += " DTERCPTFR : " + DTERCPTFR + " \n";
			G_INFO += " DTERCPTTO : " + DTERCPTTO + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " CHTG : " + CHTG + " \n";
			G_INFO += " CMBSRCHTEST : " + CMBSRCHTEST + " \n";
			G_INFO += " CMBORDER : " + CMBORDER + " \n";
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
			} else if (rsmd.getColumnTypeName(colCnt).equals("DATE")){  //why doesn't working?
				//<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
				dataType = "dateTime";
				maxLength = "20";
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
