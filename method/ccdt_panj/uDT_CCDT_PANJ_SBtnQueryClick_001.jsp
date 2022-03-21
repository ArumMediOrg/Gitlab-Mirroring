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

		String DTEDTEEA_EXAM_SDT = htMethod.get("DTEDTEEA_EXAM_SDT");
		String DTEDTEEA_EXAM_EDT = htMethod.get("DTEDTEEA_EXAM_EDT");
		String EDTEEA_CHART_NO = htMethod.get("EDTEEA_CHART_NO");
		String CMBBOXEEA_PLCE_CD = htMethod.get("CMBBOXEEA_PLCE_CD");
		String MSKEDTEEA_COMP_CD1 = htMethod.get("MSKEDTEEA_COMP_CD1");
		String CHKBOXMAIN = htMethod.get("CHKBOXMAIN");
		String MSKEDTEEA_COMP_CD2 = htMethod.get("MSKEDTEEA_COMP_CD2");
		String CBDEPT_CD = htMethod.get("CBDEPT_CD");
		String DEPT_CD = htMethod.get("DEPT_CD");
		String EDDEPT_NM = htMethod.get("EDDEPT_NM");
		String CMBBOXEEA_EXAM_CD2 = htMethod.get("CMBBOXEEA_EXAM_CD2");
		String EXAM_CD1 = htMethod.get("EXAM_CD1");
		String EXAM_CD2 = htMethod.get("EXAM_CD2");
		String CMBBOXEEA_EXAM_CD1 = htMethod.get("CMBBOXEEA_EXAM_CD1");
		String CMBFAMYCD = htMethod.get("CMBFAMYCD");
		String EDTEEA_PSNL_NM = htMethod.get("EDTEEA_PSNL_NM");
		String CMBBOXCOMP_YN = htMethod.get("CMBBOXCOMP_YN");
		String CMBBOXSORT_KD = htMethod.get("CMBBOXSORT_KD");

		//
		if(DTEDTEEA_EXAM_SDT == null) { DTEDTEEA_EXAM_SDT = ""; }
		if(DTEDTEEA_EXAM_EDT == null) { DTEDTEEA_EXAM_EDT = ""; }
		if(EDTEEA_CHART_NO == null) { EDTEEA_CHART_NO = ""; }
		if(CMBBOXEEA_PLCE_CD == null) { CMBBOXEEA_PLCE_CD = ""; }
		if(MSKEDTEEA_COMP_CD1 == null) { MSKEDTEEA_COMP_CD1 = ""; }
		if(CHKBOXMAIN == null) { CHKBOXMAIN = ""; }
		if(MSKEDTEEA_COMP_CD2 == null) { MSKEDTEEA_COMP_CD2 = ""; }
		if(CBDEPT_CD == null) { CBDEPT_CD = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }
		if(EDDEPT_NM == null) { EDDEPT_NM = ""; }
		if(CMBBOXEEA_EXAM_CD2 == null) { CMBBOXEEA_EXAM_CD2 = ""; }
		if(EXAM_CD1 == null) { EXAM_CD1 = ""; }
		if(EXAM_CD2 == null) { EXAM_CD2 = ""; }
		if(CMBBOXEEA_EXAM_CD1 == null) { CMBBOXEEA_EXAM_CD1 = ""; }
		if(CMBFAMYCD == null) { CMBFAMYCD = ""; }
		if(EDTEEA_PSNL_NM == null) { EDTEEA_PSNL_NM = ""; }
		if(CMBBOXCOMP_YN == null) { CMBBOXCOMP_YN = ""; }
		if(CMBBOXSORT_KD == null) { CMBBOXSORT_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_CUST_NO, A.EEA_PSNL_NM, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, A.EEA_EXAM_CD, A.EEA_HTSB_CD, B.ICR_BIRH_KD, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_DEPT_NM, CASE WHEN B.ICR_SEX_KD IS NULL";
		sql += " OR B.ICR_SEX_KD = '' THEN B.ICR_SEX_KD ELSE '['||B.ICR_SEX_KD||']'||GETCOMMON_LVCDTONM('0411',B.ICR_SEX_KD,'5',1) END ICR_SEX_NM, A.EEA_PSNL_AGE, B.ICR_TEL_NO, B.ICR_MOBL_NO, A.EEA_COMP_CD, C.ICY_COMP_NM, CASE WHEN A.EEA_EXAM_CD IS NULL";
		sql += " OR A.EEA_EXAM_CD = '' THEN A.EEA_EXAM_CD ELSE '['||A.EEA_EXAM_CD||']'||GETCOMMON_LVCDTONM('0401',A.EEA_EXAM_CD,'5',5) END ICR_EXAM_NM, A.EEA_HDMD_YN, A.EEA_SDMD_YN, A.EEA_RFID_NO ";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN DT_CCDT_PANJ J";
		sql += " ON A.EEA_EXAM_DT = J.DCP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = J.DCP_EXAM_SQ";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_EXAM_DT >= '" + DTEDTEEA_EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEEA_EXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(!EDTEEA_CHART_NO.equals("")) {
			sql += " AND A.EEA_CHART_NO = '" + EDTEEA_CHART_NO + "'";
		}

		if(!CMBBOXEEA_PLCE_CD.equals("00")) {
			sql += " AND A.EEA_PLCE_CD = '" + CMBBOXEEA_PLCE_CD + "'";
		}

		if(!MSKEDTEEA_COMP_CD1.equals("")) {
			if(CHKBOXMAIN.equals("1")) {
				sql += " AND A.EEA_COMP_CD IN '" + MSKEDTEEA_COMP_CD2 + "'";
			}
			else {
				sql += " AND A.EEA_COMP_CD = '" + MSKEDTEEA_COMP_CD2 + "'";
			}
		}

		if(CBDEPT_CD.equals("1")) {
			sql += " AND A.EEA_DEPT_CD = '" + DEPT_CD + "'";
		}
		else if(!EDDEPT_NM.equals("")) {
			sql += " AND A.EEA_DEPT_NM LIKE '" + EDDEPT_NM + "'||'%'";
		}

		if(!CMBBOXEEA_EXAM_CD2.equals("00000") && !CMBBOXEEA_EXAM_CD2.equals("")) {
			if(EXAM_CD1.equals("11") || EXAM_CD1.equals("12")) {
				sql += " AND (A.EEA_EXAM_CD = '" + CMBBOXEEA_EXAM_CD2 + "'";
				sql += " OR (A.EEA_HTSB_YN = 'Y'";
				sql += " AND A.EEA_HTSB_CD = '" + CMBBOXEEA_EXAM_CD2 + "'))";
			}
			else if(EXAM_CD2.equals("13")) {
				sql += " AND (A.EEA_EXAM_CD = '" + CMBBOXEEA_EXAM_CD2 + "'";
				sql += " OR EEA_STOMA_CD <> '0'";
				sql += " OR EEA_COLON_CD <> '0'";
				sql += " OR EEA_LIVER_CD <> '0'";
				sql += " OR EEA_BAST_CD <> '0'";
				sql += " OR EEA_UTER_CD <> '0')";
			}
			else if(EXAM_CD1.equals("14")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + EXAM_CD1 + "'";
				sql += " OR EEA_ORAL_YN = 'Y')";
			}
			else if(EXAM_CD2.equals("32")) {
				sql += " AND (A.EEA_EXAM_CD = '" + CMBBOXEEA_EXAM_CD2 + "'";
				sql += " OR (A.EEA_EMSB_YN = 'Y'";
				sql += " AND A.EEA_EMSB_CD = '" + CMBBOXEEA_EXAM_CD2 + "'))";
			}
			else if(EXAM_CD1.equals("41")) {
				sql += " AND (A.EEA_EXAM_CD = '" + CMBBOXEEA_EXAM_CD2 + "'";
				sql += " OR (A.EEA_SPSB_YN = 'Y'";
				sql += " AND A.EEA_SPSB_CD = '" + CMBBOXEEA_EXAM_CD2 + "'))";
			}
			else if(EXAM_CD2.equals("81")) {
				sql += " AND (A.EEA_EXAM_CD = '" + CMBBOXEEA_EXAM_CD2 + "'";
				sql += " OR (A.EEA_CVSB_YN = 'Y'";
				sql += " AND A.EEA_CVSB_CD = '" + CMBBOXEEA_EXAM_CD2 + "'))";
			}
			else {
				sql += " AND A.EEA_EXAM_CD = '" + CMBBOXEEA_EXAM_CD2 + "'";
			}
		}
		else if(!EXAM_CD1.equals("00")) {
			if(EXAM_CD1.equals("11") || EXAM_CD1.equals("12")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + EXAM_CD1 + "'";
				sql += " OR (EEA_HTSB_YN = 'Y'";
				sql += " AND SUBSTR(A.EEA_HTSB_CD,1,2) = '" + EXAM_CD1 + "'))";
			}
			else if(EXAM_CD1.equals("13")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + EXAM_CD1 + "'";
				sql += " OR EEA_STOMA_CD <> '0'";
				sql += " OR EEA_COLON_CD <> '0'";
				sql += " OR EEA_LIVER_CD <> '0'";
				sql += " OR EEA_BAST_CD <> '0'";
				sql += " OR EEA_UTER_CD <> '0')";
			}
			else if(EXAM_CD1.equals("14")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + EXAM_CD1 + "'";
				sql += " OR EEA_ORAL_YN = 'Y')";
			}
			else if(EXAM_CD1.equals("32")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + EXAM_CD1 + "'";
				sql += " OR (EEA_EMSB_YN = 'Y'";
				sql += " AND SUBSTR(A.EEA_EMSB_CD,1,2) = '" + EXAM_CD1 + "'))";
			}
			else if(EXAM_CD1.equals("41")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + EXAM_CD1 + "'";
				sql += " OR (EEA_SPSB_YN = 'Y'";
				sql += " AND SUBSTR(A.EEA_SPSB_CD,1,2) = '" + EXAM_CD1 + "'))";
			}
			else if(EXAM_CD1.equals("81")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + EXAM_CD1 + "'";
				sql += " OR (EEA_CVSB_YN = 'Y'";
				sql += " AND SUBSTR(A.EEA_CVSB_CD,1,2) = '" + EXAM_CD1 + "'))";
			}
			else if(CMBBOXEEA_EXAM_CD1.equals("99998")) {
				sql += " AND (A.EEA_EXAM_CD = '11001'";
				sql += " OR A.EEA_EXAM_CD = '12001'";
				sql += " OR A.EEA_EXAM_CD = '12003'";
				sql += " OR (EEA_HTSB_YN = 'Y'";
				sql += " AND A.EEA_HTSB_CD = '11001')";
				sql += " OR (EEA_HTSB_YN = 'Y'";
				sql += " AND (A.EEA_HTSB_CD = '12001'";
				sql += " OR A.EEA_HTSB_CD = '12003'))";
				sql += " OR SUBSTR(A.EEA_EXAM_CD,1,2) = '21')";
			}
			else if(CMBBOXEEA_EXAM_CD1.equals("99997")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '11'";
				sql += " OR SUBSTR(A.EEA_EXAM_CD,1,2) = '12'";
				sql += " OR (EEA_HTSB_YN = 'Y'";
				sql += " AND (SUBSTR(A.EEA_HTSB_CD,1,2) = '11'";
				sql += " OR SUBSTR(A.EEA_HTSB_CD,1,2) = '12')))";
			}
			else {
				sql += " AND SUBSTR(A.EEA_EXAM_CD,1,2) = '" + EXAM_CD1 + "'";
			}
		}

		if(!CMBFAMYCD.equals("00")) {
			sql += " AND A.EEA_FAMY_CD = '" + CMBFAMYCD + "'";
		}

		if(!EDTEEA_PSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%' || '" + EDTEEA_PSNL_NM + "' || '%'";
		}

		if(CMBBOXCOMP_YN.equals("1")) {
			sql += " AND J.DCP_COMP_YN = 'Y'";
		}
		else if(CMBBOXCOMP_YN.equals("2")) {
			sql += " AND NVL(J.DCP_COMP_YN,'N') = 'N'";
		}

		if(CMBBOXSORT_KD.equals("2")) {
			sql += " ORDER BY A.EEA_PSNL_NM, A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
		}
		else if(CMBBOXSORT_KD.equals("3")) {
			sql += " ORDER BY C.ICY_COMP_NM, A.EEA_PSNL_NM, A.EEA_EXAM_DT, A.EEA_EXAM_SQ  ";
		}
		else if(CMBBOXSORT_KD.equals("4")) {
			sql += " ORDER BY ORDER BY A.EEA_EXAM_DT, TO_NUMBER(A.EEA_RFID_NO), A.EEA_EXAM_SQ  ";
		}
		else {
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
		}



			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDT_CCDT_PANJ_SBtnQueryClick_001 \n";
			G_INFO += "설명 : 판정정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEDTEEA_EXAM_SDT : " + DTEDTEEA_EXAM_SDT + " \n";
			G_INFO += " DTEDTEEA_EXAM_EDT : " + DTEDTEEA_EXAM_EDT + " \n";
			G_INFO += " EDTEEA_CHART_NO : " + EDTEEA_CHART_NO + " \n";
			G_INFO += " CMBBOXEEA_PLCE_CD : " + CMBBOXEEA_PLCE_CD + " \n";
			G_INFO += " MSKEDTEEA_COMP_CD1 : " + MSKEDTEEA_COMP_CD1 + " \n";
			G_INFO += " CHKBOXMAIN : " + CHKBOXMAIN + " \n";
			G_INFO += " MSKEDTEEA_COMP_CD2 : " + MSKEDTEEA_COMP_CD2 + " \n";
			G_INFO += " CBDEPT_CD : " + CBDEPT_CD + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
			G_INFO += " EDDEPT_NM : " + EDDEPT_NM + " \n";
			G_INFO += " CMBBOXEEA_EXAM_CD2 : " + CMBBOXEEA_EXAM_CD2 + " \n";
			G_INFO += " EXAM_CD1 : " + EXAM_CD1 + " \n";
			G_INFO += " EXAM_CD2 : " + EXAM_CD2 + " \n";
			G_INFO += " CMBBOXEEA_EXAM_CD1 : " + CMBBOXEEA_EXAM_CD1 + " \n";
			G_INFO += " CMBFAMYCD : " + CMBFAMYCD + " \n";
			G_INFO += " EDTEEA_PSNL_NM : " + EDTEEA_PSNL_NM + " \n";
			G_INFO += " CMBBOXCOMP_YN : " + CMBBOXCOMP_YN + " \n";
			G_INFO += " CMBBOXSORT_KD : " + CMBBOXSORT_KD + " \n";
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
