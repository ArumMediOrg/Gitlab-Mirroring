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

		String COLUMN1 = htMethod.get("COLUMN1");
		String COLUMN2 = htMethod.get("COLUMN2");
		String COLUMN3 = htMethod.get("COLUMN3");
		String TBL_NAME = htMethod.get("TBL_NAME");
		String EDCODE_NM = htMethod.get("EDCODE_NM");
		String SEARCH_CD = htMethod.get("SEARCH_CD");
		String SMALL_CD = htMethod.get("SMALL_CD");
		String GUBUN = htMethod.get("GUBUN");
		String RBCODE = htMethod.get("RBCODE");
		String CBORDERYN = htMethod.get("CBORDERYN");
		String CONTAINNOTUSE = htMethod.get("CONTAINNOTUSE");

		//
		if(COLUMN1 == null) { COLUMN1 = ""; }
		if(COLUMN2 == null) { COLUMN2 = ""; }
		if(COLUMN3 == null) { COLUMN3 = ""; }
		if(TBL_NAME == null) { TBL_NAME = ""; }
		if(EDCODE_NM == null) { EDCODE_NM = ""; }
		if(SEARCH_CD == null) { SEARCH_CD = ""; }
		if(SMALL_CD == null) { SMALL_CD = ""; }
		if(GUBUN == null) { GUBUN = ""; }
		if(RBCODE == null) { RBCODE = ""; }
		if(CBORDERYN == null) { CBORDERYN = ""; }
		if(CONTAINNOTUSE == null) { CONTAINNOTUSE = "";}

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT *";
		sql += " FROM (";

		if(! COLUMN1.equals("")) {

			sql += " SELECT " + COLUMN1 + " CCN_SMALL, " + COLUMN2 + " CCN_NAME, " + COLUMN3 + " CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE " + COLUMN2 + " LIKE '%" + EDCODE_NM + "%'";
		} else if(SEARCH_CD.equals("DOCTOR")) {

			sql += " SELECT IAU_EMP_NO CCN_SMALL, " + COLUMN2 + " CCN_NAME, " + COLUMN3 + " CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE " + COLUMN2 + " LIKE '%" + EDCODE_NM + "%'";
			sql += " AND IAU_LICEN1_CD IN( '11','12')";
			sql += " AND IAU_USE_YN='Y'";
		} else if(SEARCH_CD.equals("0801")) {

			sql += " SELECT CCN_SMALL, CASE WHEN CCN_SMALL = '999' THEN CCN_FULL_NM ELSE (GETCOMMON_LVCDTONM(CCN_LARGE,SUBSTR(CCN_SMALL,1,2),'1',2) || ':' || CCN_FULL_NM) END CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CCN_LARGE = '" + SEARCH_CD + "'";
			sql += " AND CCN_FULL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND CCN_LEVEL = '5'";
			sql += " AND UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'";
		} else if(SEARCH_CD.equals("comp") || SEARCH_CD.equals("사업장")) {

			sql += " SELECT ICY_COMP_CD CCN_SMALL, ICY_COMP_NM CCN_NAME, ' ' CCN_VALUE , ICY_USE_YN AS CCN_USE_YN";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE ICY_COMP_NM LIKE '%" + EDCODE_NM + "%'";
		} else if(SEARCH_CD.equals("comp2")) {	// 미사용 제외

			sql += " SELECT ICY_COMP_CD CCN_SMALL, ICY_COMP_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE ICY_COMP_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(NVL(ICY_USE_YN, 'Y')) = 'Y'";
		} else if(SEARCH_CD.equals("학교")) {
			sql += " SELECT ICY_COMP_CD CCN_SMALL, ICY_COMP_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE ICY_COMP_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND (SUBSTR(ICY_COKD_CD, 1, 2) = '05'";
			sql += " OR ICY_COMP_NM LIKE '%학교%')";
			if (CONTAINNOTUSE.equals("N")) {
				sql += "AND UPPER(ICY_USE_YN) = 'Y'";
			}
		} else if(SEARCH_CD.equals("사업장부서")) {

			sql += " SELECT ICY_COMP_CD CCN_SMALL, ICY_COMP_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE ICY_COMP_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND ICY_DEPT_CD = '1'";
		} else if(SEARCH_CD.equals("취급물질")) {

			sql += " SELECT CSM_MATT_CD CCN_SMALL, (CSM_PERIOD_TM || '|' || CSM_MATT_NM) CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CSM_MATT_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND CSM_USE_YN = 'Y'";
		} else if(SEARCH_CD.equals("00")) {

			sql += " SELECT CSM_LARGE CCN_SMALL, CSM_MATT_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CSM_MATT_CD = '" + SEARCH_CD + "'";
			sql += " AND CSM_MATT_NM LIKE '%" + EDCODE_NM + "%'";
		} else if(SEARCH_CD.equals("0401")) {

			sql += " SELECT CCN_SMALL CCN_SMALL, CCN_FULL_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CCN_LARGE = '" + SEARCH_CD + "'";
			sql += " AND CCN_FULL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND CCN_LEVEL = '2'";
			sql += " AND CCN_USE_YN = 'Y'";
		} else if(SEARCH_CD.equals("표적유형")) {

			sql += " SELECT DISTINCT CSP_JJ_CD CCN_SMALL, CSP_JJ_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CSP_JJ_NM LIKE '%" + EDCODE_NM + "%'";
		} else if(SEARCH_CD.equals("검사항목")) {

			sql += " SELECT IIM_SBCD_CD CCN_SMALL, IIM_KNME_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE IIM_SBCD_CD <> ' '";
			sql += " AND IIM_KNME_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(IIM_USE_YN) = 'Y'";
		} else if(SEARCH_CD.equals("영업사원")) {

			sql += " SELECT IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE IAU_PENL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(IAU_USE_YN) = 'Y'";
		} else if(SEARCH_CD.equals("담당사원")) {

			sql += " SELECT IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE IAU_PENL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(IAU_USE_YN) = 'Y'";
		} else if(SEARCH_CD.equals("의사")) {

			sql += " SELECT IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE IAU_PENL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND (IAU_LICEN1_CD IN ('11','12') OR IAU_LICEN2_CD IN ('11','12'))";
			sql += " AND UPPER(IAU_USE_YN) = 'Y'";
		} else if(SEARCH_CD.equals("과의사")) {

			sql += " SELECT IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE IAU_PENL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND IAU_DEPT_CD = " + COLUMN2;
			sql += " AND (IAU_LICEN1_CD IN ('11','12') OR IAU_LICEN2_CD IN ('11','12'))";
		} else if(SEARCH_CD.equals("간호사")) {

			sql += " SELECT IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE IAU_PENL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND (IAU_LICEN1_CD = '21'";
			sql += " OR IAU_LICEN2_CD = '21')";
		} else if(SEARCH_CD.equals("검사실구분")) {

			sql += " SELECT CCN_SMALL, CCN_FULL_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CCN_LARGE = '" + SEARCH_CD + "'";
			sql += " AND SUBSTR(CCN_SMALL,1,2) = '03'";
			sql += " AND CCN_LEVEL = '5'";
			sql += " AND CCN_FULL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'";
		} else if(TBL_NAME.equals("BT_ESTIMATE")) {

			sql += " SELECT A.BEE_ESTI_CD CCN_SMALL, CASE WHEN BEE_COMP_CD IS NULL";
			sql += " OR BEE_COMP_CD = ' ' THEN BEE_ESTI_NM ELSE '[' || BEE_COMP_CD || ':' || F_COMP_FIND(BEE_COMP_CD) || ']' || BEE_ESTI_NM END CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM BT_ESTIMATE A INNER JOIN IT_COMPANY B";
			sql += " ON A.BEE_COMP_CD = B.ICY_COMP_CD";
			sql += " WHERE A.BEE_MNGT_YR = '" + SEARCH_CD + "'";
			sql += " AND BEE_ESTI_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(NVL(A.BEE_USE_YN, 'Y')) = 'Y'";
		} else if(SEARCH_CD.equals("과거병력")) {

			sql += " SELECT CKD_KCD_CD CCN_SMALL, CKD_KNME_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE (CKD_KNME_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " OR CKD_KCD_CD LIKE '%" + EDCODE_NM + "%')";
			sql += " AND CKD_LEVL_KD IN ('3','4')";
			sql += " AND UPPER(NVL(CKD_SYMP_YN, 'Y')) = 'Y'";
		} else if(SEARCH_CD.equals("구강검진")) {

			sql += " SELECT CCP_GUBN_CD, CCP_MACH_CD CCN_SMALL, CCP_SOKUN_TX CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CCP_MACH_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND CCP_MACH_CD = '" + SMALL_CD + "'";
			sql += " AND UPPER(NVL(CCP_USE_YN, 'Y')) = 'Y'";
		} else if(SEARCH_CD.equals("질병분류")) {

			sql += " SELECT CKD_KSCD_CD CCN_SMALL, CKD_KNME_NM CCN_NAME, CKD_SNME_NM CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE (CKD_KNME_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " OR CKD_SNME_NM LIKE '%" + EDCODE_NM + "%')";
			sql += " AND CKD_LEVL_KD = '4'";
		} else if(SEARCH_CD.equals("0805") || SEARCH_CD.equals("0823")) {

			sql += " SELECT CCN_SMALL, CCN_FULL_NM CCN_NAME, CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CCN_LARGE = '" + SEARCH_CD + "'";
			sql += " AND CCN_LEVEL = '5'";
			sql += " AND CCN_FULL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'";
		} else if(SEARCH_CD.substring(0, 2).equals("HM")) {

			if(GUBUN.equals("SpPan")) {

				sql += " SELECT CT1.CSC_SMALL CCN_SMALL, CT1.CSC_FULL_NM CCN_NAME, ' ' CCN_VALUE, CT2.CSC_FULL_NM";
				sql += " FROM " + TBL_NAME + " CT1 INNER JOIN CT_SP_COMMON CT2";
				sql += " ON CT2.CSC_SMALL = CT1.CSC_ETC1_CD";
				sql += " AND CT2.CSC_LARGE = 'HM05E'";
				sql += " WHERE CT1.CSC_LARGE = '" + SEARCH_CD + "'";
				sql += " AND (CT1.CSC_FULL_NM LIKE '%" + EDCODE_NM + "%'";
				sql += " OR CT1.CSC_SMALL LIKE '%" + EDCODE_NM + "%')";
				sql += " AND CT1.CSC_LEVEL = '5'";
				sql += " AND CT1.CSC_USE_YN = 'Y'";
				sql += " AND (Ct1.CSC_SMALL NOT LIKE '%J%' And Ct1.CSC_SMALL NOT LIKE '%N%' ) ";
                sql += " AND Ct1.CSC_SMALL NOT In ('C00C', 'C00D') ";
			} else if(GUBUN.equals("SpNight")) {

				sql += " SELECT CT1.CSC_SMALL CCN_SMALL, CT1.CSC_FULL_NM CCN_NAME, ' ' CCN_VALUE, CT2.CSC_FULL_NM, CT1.CSC_CODE_GR";
				sql += " FROM " + TBL_NAME + " CT1 INNER JOIN CT_SP_COMMON CT2";
				sql += " ON CT2.CSC_SMALL = CT1.CSC_ETC1_CD";
				sql += " AND CT2.CSC_LARGE ='HM05E'";
				sql += " WHERE CT1.CSC_LARGE = '" + SEARCH_CD + "'";
				sql += " AND (CT1.CSC_FULL_NM LIKE '%" + EDCODE_NM + "%'";
				sql += " OR CT1.CSC_SMALL LIKE '%" + EDCODE_NM + "%')";
				sql += " AND CT1.CSC_LEVEL = '5'";
				sql += " AND CT1.CSC_USE_YN = 'Y'";
				sql += " AND CT1.CSC_SMALL LIKE '%N%'";
			} else if(GUBUN.equals("SpJob")){
				sql += " select Ct1.CSC_SMALL CCN_SMALL, Ct1.CSC_FULL_NM CCN_NAME, '' ccn_value, Ct2.CSC_FULL_NM, Ct1.CSC_CODE_GR ";
				sql += " 		FROM " + TBL_NAME + " Ct1 ";
				sql += " 	inner join CT_SP_COMMON Ct2 On Ct2.CSC_SMALL = Ct1.CSC_ETC1_CD And Ct2.CSC_LARGE ='HM05E' ";
				sql += " 	WHERE Ct1.CSC_LARGE = '" + SEARCH_CD + "' ";
				sql += " 		AND (UPPER(Ct1.CSC_FULL_NM)  like '%" + EDCODE_NM + "%' OR UPPER(Ct1.CSC_SMALL) like '%" + EDCODE_NM + "%') ";
				sql += " 		AND Ct1.CSC_LEVEL = '5' ";
				sql += " 		AND Ct1.CSC_USE_YN = 'Y' ";
				sql += " 		AND Ct1.CSC_SMALL like 'J%' ";
			} else if(GUBUN.equals("SpFire")) {
				sql += " select Ct1.CSC_SMALL CCN_SMALL, Ct1.CSC_FULL_NM CCN_NAME, '' ccn_value, Ct2.CSC_FULL_NM ";
				sql += " 		FROM " + TBL_NAME + " Ct1 ";
				sql += " 	inner join CT_SP_COMMON Ct2 On Ct2.CSC_SMALL = Ct1.CSC_ETC1_CD And Ct2.CSC_LARGE = 'HM05E' ";
				sql += " 	WHERE Ct1.CSC_LARGE = '" + SEARCH_CD + "' ";
				sql += " 		AND (UPPER(Ct1.CSC_FULL_NM)  like '%" + EDCODE_NM + "%' OR UPPER(Ct1.CSC_SMALL) like '%" + EDCODE_NM + "%') ";
				sql += " 		AND Ct1.CSC_LEVEL = '5' ";
				sql += " 		AND Ct1.CSC_USE_YN = 'Y' ";
				sql += " 		AND Ct1.CSC_SMALL In ('S01A', 'C00C', 'C00D', 'S01R', 'S01U') ";

			} else if(GUBUN.equals("SpPanSet")) {

				sql += " SELECT CT1.CSC_SMALL CCN_SMALL, CT1.CSC_FULL_NM CCN_NAME, ' ' CCN_VALUE, CT2.CSC_FULL_NM, CT1.CSC_CODE_GR";
				sql += " FROM " + TBL_NAME + " CT1 INNER JOIN CT_SP_COMMON CT2";
				sql += " ON CT2.CSC_SMALL = CT1.CSC_ETC1_CD";
				sql += " AND CT2.CSC_LARGE = 'HM05E'";
				sql += " WHERE CT1.CSC_LARGE = '" + SEARCH_CD + "'";
				sql += " AND (CT1.CSC_FULL_NM LIKE '%" + EDCODE_NM + "%'";
				sql += " OR CT1.CSC_SMALL LIKE '%" + EDCODE_NM + "%')";
				sql += " AND CT1.CSC_LEVEL = '5'";
				sql += " AND CT1.CSC_USE_YN = 'Y'";
			} else {

				sql += " SELECT CSC_SMALL CCN_SMALL, CSC_FULL_NM CCN_NAME, ' ' CCN_VALUE, CSC_CODE_GR";
				sql += " FROM " + TBL_NAME;
				sql += " WHERE CSC_LARGE = '" + SEARCH_CD + "'";
				sql += " AND CSC_FULL_NM LIKE '%" + EDCODE_NM + "%'";
				sql += " AND CSC_LEVEL = '5'";
				sql += " AND CSC_USE_YN = 'Y'";
			}
		} else if(SEARCH_CD.equals("PERSDOC")) {

			sql += " SELECT IAU_EMP_NO CCN_SMALL, " + COLUMN2 + " CCN_NAME, " + COLUMN3 + " CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE " + COLUMN2 + " LIKE '%" + EDCODE_NM + "%'";
			sql += " AND IAU_LICEN1_CD IN( '11','12')";
			sql += " AND (NVL('" + COLUMN3 + "', ' ') <> ' ' and ('" + COLUMN3 + "' <> '' or '" + COLUMN3 + "' <> ' ')) ";
			sql += " AND IAU_EMP_NO = " + COLUMN3;
			sql += " AND IAU_USE_YN = 'Y'";
		} else if(SEARCH_CD.equals("0312")) {

			sql += " SELECT CCN_VALUE CCN_SMALL, CCN_FULL_NM CCN_NAME, ' ' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CCN_LARGE = '" + SEARCH_CD + "'";
			sql += " AND CCN_LEVEL = '5'";
			sql += " AND NVL(CCN_VALUE,' ') <> ' '";
			sql += " AND CCN_FULL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'";
		} else {

			if(SMALL_CD.equals("")) {

				sql += " SELECT CCN_SMALL, CCN_FULL_NM CCN_NAME, CCN_VALUE";
				sql += " FROM " + TBL_NAME;
				sql += " WHERE CCN_LARGE = '" + SEARCH_CD + "'";
				sql += " AND CCN_LEVEL = '5'";
				sql += " AND (CCN_FULL_NM like '%" + EDCODE_NM + "%' or  CCN_SMALL like '%" + EDCODE_NM + "%') ";
				sql += " AND UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'";
			} else {

				sql += " SELECT CCN_SMALL, CCN_FULL_NM CCN_NAME, CCN_VALUE";
				sql += " FROM " + TBL_NAME;
				sql += " WHERE CCN_LARGE = '" + SEARCH_CD + "'";
				sql += " AND CCN_SMALL LIKE '" + SMALL_CD + "%'";
				sql += " AND CCN_LEVEL = '5'";
				sql += " AND CCN_FULL_NM LIKE '%" + EDCODE_NM + "%'";
				sql += " AND UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'";
			}
		}

		sql += " ) A";

		if(SEARCH_CD.length() > 2) {

			if(SEARCH_CD.substring(1, 2).equals("HM")) {

				if(GUBUN.trim().equals("SpPan") || GUBUN.trim().equals("SpPanSet")) {

					sql += " ORDER BY (CASE WHEN SUBSTR(A.CCN_SMALL,1,1) = 'S' THEN 'A001' END), CCN_SMALL ASC";
				} else if(GUBUN.equals("SpNight") || GUBUN.trim().equals("SpJob")) {

					sql += " ORDER BY A.CSC_CODE_GR, A.CCN_SMALL";
				} else {

					sql += " ORDER BY A.CSC_CODE_GR, A.CCN_SMALL";
				}
			} else if(RBCODE.equals("Y")) {

				sql += " ORDER BY A.CCN_SMALL";
			} else {

				sql += " ORDER BY A.CCN_NAME";
			}

		} else if(RBCODE.equals("Y")) {
			sql += " ORDER BY A.CCN_SMALL";
		} else if(CBORDERYN.equals("Y")) {
			sql += " ORDER BY A.CCN_USE_YN DESC, A.CCN_NAME";
		}
		else {
			sql += " ORDER BY A.CCN_NAME";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : FindCode_btnFindClick_001 \n";
			G_INFO += "설명 : 코드정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COLUMN1 : " + COLUMN1 + " \n";
			G_INFO += " COLUMN2 : " + COLUMN2 + " \n";
			G_INFO += " COLUMN3 : " + COLUMN3 + " \n";
			G_INFO += " TBL_NAME : " + TBL_NAME + " \n";
			G_INFO += " EDCODE_NM : " + EDCODE_NM + " \n";
			G_INFO += " SEARCH_CD : " + SEARCH_CD + " \n";
			G_INFO += " SMALL_CD : " + SMALL_CD + " \n";
			G_INFO += " GUBUN : " + GUBUN + " \n";
			G_INFO += " RBCODE : " + RBCODE + " \n";
			G_INFO += " CBORDERYN : " + CBORDERYN + " \n";
			G_INFO += " CONTAINNOTUSE : " + CONTAINNOTUSE + " \n";

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
