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

		String SEDT_YEAR = htMethod.get("SEDT_YEAR");
		String DTEDTEXAM_SDT = htMethod.get("DTEDTEXAM_SDT");
		String DTEDTEXAM_EDT = htMethod.get("DTEDTEXAM_EDT");
		String MSKEDTCOMP_CD1 = htMethod.get("MSKEDTCOMP_CD1");
		String CHKBOXMAIN = htMethod.get("CHKBOXMAIN");
		String MSKEDTCOMP_CD2 = htMethod.get("MSKEDTCOMP_CD2");
		String EDTCUST_NO = htMethod.get("EDTCUST_NO");
		String COMP_CD = htMethod.get("COMP_CD");
		String EDTPSNL_NM = htMethod.get("EDTPSNL_NM");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String CMBSP_GUBN = htMethod.get("CMBSP_GUBN");
		String CMBBOXPLCE_CD = htMethod.get("CMBBOXPLCE_CD");
		String CMBBOXPLCE_CD2 = htMethod.get("CMBBOXPLCE_CD2");
		String CMBSP_CHA = htMethod.get("CMBSP_CHA");
		String RZCHECKBOX13 = htMethod.get("RZCHECKBOX13");
		String CMBBOXSORT = htMethod.get("CMBBOXSORT");
		String CMBPRINTCHK = htMethod.get("CMBPRINTCHK");
		String CMBSEND_CD = htMethod.get("CMBSEND_CD");


		//
		if(SEDT_YEAR == null) { SEDT_YEAR = ""; }
		if(DTEDTEXAM_SDT == null) { DTEDTEXAM_SDT = ""; }
		if(DTEDTEXAM_EDT == null) { DTEDTEXAM_EDT = ""; }
		if(MSKEDTCOMP_CD1 == null) { MSKEDTCOMP_CD1 = ""; }
		if(CHKBOXMAIN == null) { CHKBOXMAIN = ""; }
		if(MSKEDTCOMP_CD2 == null) { MSKEDTCOMP_CD2 = ""; }
		if(EDTCUST_NO == null) { EDTCUST_NO = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(EDTPSNL_NM == null) { EDTPSNL_NM = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(CMBSP_GUBN == null) { CMBSP_GUBN = ""; }
		if(CMBBOXPLCE_CD == null) { CMBBOXPLCE_CD = ""; }
		if(CMBBOXPLCE_CD2 == null) { CMBBOXPLCE_CD2 = ""; }
		if(CMBSP_CHA == null) { CMBSP_CHA = ""; }
		if(RZCHECKBOX13 == null) { RZCHECKBOX13 = ""; }
		if(CMBBOXSORT == null) { CMBBOXSORT = ""; }
		if(CMBPRINTCHK == null) { CMBPRINTCHK = ""; }
		if(CMBSEND_CD == null) { CMBSEND_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT DISTINCT A.EEA_MNGT_SPYM, A.EEA_CUST_NO, A.EEA_PSNL_NM, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT";
		sql += ", CASE WHEN B.ICR_SEX_KD IS NULL OR B.ICR_SEX_KD = '' THEN B.ICR_SEX_KD ELSE GETCOMMON_LVCDTONM('0411',B.ICR_SEX_KD ,'5',1) END ICR_SEX_NM";
		sql += ", A.EEA_PSNL_AGE, A.EEA_COMP_CD, C.ICY_COMP_NM, A.EEA_DEPT_NM";
		sql += ", CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE '[' || A.EEA_SPCL_CD || ']' || GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END ICR_SPCL_NM";
		sql += ", CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END ICR_SPCH_KD";
		sql += ", A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, E.SBE_TOBO_DT, E.SBE_PANJ_YN, E.SBE_TPAN_NM, E.SBE_TBUS_NM, GETCOMMON_LVCDTONM('0805',ICY_TKGJ_CD,'5',5) ICY_TKGJ_NM, GETCOMMON_LVCDTONM('0833',ICY_LABO_CD,'5',4) ICY_LABO_NM";
		sql += ", CASE WHEN A.EEA_SPHT_CD IS NULL OR A.EEA_SPHT_CD = '' THEN A.EEA_SPHT_CD ELSE '[' || A.EEA_SPHT_CD || ']' || GETCOMMON_LVCDTONM('0911',A.EEA_SPHT_CD,'5',1) END ICR_SPHT_MN";
		sql += ", CASE WHEN A.EEA_EXAM_CD IS NULL OR A.EEA_EXAM_CD = '' THEN A.EEA_EXAM_CD ELSE '[' || A.EEA_EXAM_CD || ']' || GETCOMMON_LVCDTONM('0401',A.EEA_EXAM_CD,'5',5) END ICR_EXAM_NM";
		sql += ", A.EEA_EXAM_CD, A.EEA_HDMD_YN, A.EEA_SDMD_YN, A.EEA_SPCL_LT, A.EEA_SPCL_CD, A.EEA_SPHT_CD, B.ICR_SEX_KD, (C.ICY_ZIP_AR || C.ICY_ROAD_AR) AS ICR_ADDR_NM, C.ICY_ZIP_CD, D.PFP_FIX_YN, F.EDP_PANJ_YN, G.ECH_CFRM_CD, NVL(A.EEA_LUNG_CD, '0') EEA_LUNG_CD, D.PFP_TRANC_DATE, F.EDP_TOBO_DT, A.EEA_CNCR_DT, M.SPG_PANJ_DT, A.EEA_MNGT_HTYR, A.EEA_STOMA_CD, A.EEA_COLON_CD, A.EEA_LIVER_CD, A.EEA_BAST_CD, A.EEA_UTER_CD, A.EEA_HTSB_CD, A.EEA_DIVI_NO, O.DCP_COMP_YN, O.DCP_TRANC_DT, P.SPG_MATT_CD AS MATT_CD, A.EEA_RFID_NO  ";
		sql += ", C.ICY_PRNT_ZIP_CD ,(C.ICY_PRNT_ZIP_AR + C.ICY_PRNT_ROAD_AR) AS ICY_PRNT_ADDR_NM   ";

		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO";

		sql += " LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD";

		sql += " LEFT OUTER JOIN PT_FIR_PANJUNG D";
		sql += " ON A.EEA_EXAM_DT = D.PFP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.PFP_EXAM_SQ";

		sql += " LEFT OUTER JOIN ST_BASE E";
		sql += " ON A.EEA_EXAM_DT = E.SBE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = E.SBE_EXAM_SQ";

		sql += " LEFT OUTER JOIN ET_DENTAL_PANJ F";
		sql += " ON A.EEA_EXAM_DT = F.EDP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = F.EDP_EXAM_SQ";

		sql += " LEFT OUTER JOIN ET_CANCER_HEADER G";
		sql += " ON A.EEA_EXAM_DT = G.ECH_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = G.ECH_EXAM_SQ";

		sql += " LEFT OUTER JOIN ET_CANCER_STMC H";
		sql += " ON A.EEA_EXAM_DT = H.ECS_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = H.ECS_EXAM_SQ";

		sql += " LEFT OUTER JOIN ET_CANCER_COLO I";
		sql += " ON A.EEA_EXAM_DT = I.ECC_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = I.ECC_EXAM_SQ";

		sql += " LEFT OUTER JOIN ET_CANCER_LIVER J";
		sql += " ON A.EEA_EXAM_DT = J.ECL_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = J.ECL_EXAM_SQ";

		sql += " LEFT OUTER JOIN ET_CANCER_BRST K";
		sql += " ON A.EEA_EXAM_DT = K.ECB_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = K.ECB_EXAM_SQ";

		sql += " LEFT OUTER JOIN ET_CANCER_CRVC L";
		sql += " ON A.EEA_EXAM_DT = L.ECV_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = L.ECV_EXAM_SQ";

		sql += " LEFT OUTER JOIN ET_CANCER_LUNG N";
		sql += " ON A.EEA_EXAM_DT = N.ECG_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = N.ECG_EXAM_SQ";

		sql += " LEFT OUTER JOIN ST_PANJUNG M";
		sql += " ON A.EEA_EXAM_DT = M.SPG_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = M.SPG_EXAM_SQ";

		sql += " LEFT OUTER JOIN DT_CCDT_PANJ O ";
		sql += " ON A.EEA_EXAM_DT = O.DCP_EXAM_DT ";
		sql += " AND A.EEA_EXAM_SQ = O.DCP_EXAM_SQ ";

		sql += " LEFT OUTER JOIN ST_PANJUNG P ";
		sql += " ON A.EEA_EXAM_DT = P.SPG_EXAM_DT ";
		sql += " AND A.EEA_EXAM_SQ = P.SPG_EXAM_SQ ";
		sql += " AND P.SPG_MATT_CD = '82001' ";

		sql += " WHERE 0=0";
		sql += " AND SUBSTR(A.EEA_MNGT_SPYM,1,4) = '" + SEDT_YEAR + "'";
		sql += " AND A.EEA_EXAM_DT >= '" + DTEDTEXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(! MSKEDTCOMP_CD1.equals("")) {
			if(CHKBOXMAIN.equals("1")) {
				sql += " AND A.EEA_COMP_CD IN '" + MSKEDTCOMP_CD2 + "'";
			} else {
				sql += " AND A.EEA_COMP_CD = '" + MSKEDTCOMP_CD1 + "'";
			}
		}

		if(! EDTCUST_NO.equals("")) {
			sql += " AND A.EEA_CUST_NO = '" + EDTCUST_NO + "' ";
		}

		if(! EDTPSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%" + EDTPSNL_NM + "%'";
		}

		if(! CMBSP_GUBN.equals("00")) {
			if(CMBSP_GUBN.equals("99")) {
				sql += " AND A.EEA_SPCL_CD IN ('03','04','05','07')";
			} else {
				sql += " AND A.EEA_SPCL_CD = '" + CMBSP_GUBN + "'";
			}
		}

		if(! CMBBOXPLCE_CD.equals("0")) {

			if(CMBBOXPLCE_CD2.equals("00")) {
				sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD + "'";
			} else {
				sql += " AND A.EEA_PLCE_CD = '" + CMBBOXPLCE_CD2 + "'";
			}
		}

		if(CMBSP_CHA.equals("0")) {
			sql += " AND (A.EEA_EXAM_CD = '41001' OR A.EEA_EXAM_CD = '42001' OR A.EEA_SPSB_YN = 'Y')";
		} else if(CMBSP_CHA.equals("1")) {
			sql += " AND (A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y')";
		} else if(CMBSP_CHA.equals("2")) {
			sql += " AND A.EEA_EXAM_CD = '42001'";
		} else if(CMBSP_CHA.equals("3")) {
			sql += " AND (A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y')";
		}

		if(RZCHECKBOX13.equals("1")) {
			sql += " AND (E.SBE_TPAN_NM <> 'R' OR E.SBE_TPAN_NM IS NULL OR E.SBE_TPAN_NM = '')";
		}

		if (CMBPRINTCHK.equals("1")){
			sql += " AND NVL(E.SBE_TOBO_DT, ' ') = ' ' ";
		} else if (CMBPRINTCHK.equals("2")){
			sql += " AND NVL(E.SBE_TOBO_DT, ' ') <> ' ' ";
		}

		if(!CMBSEND_CD.equals("00")){
			if(CMBSEND_CD.equals("99")){
				sql += " AND A.EEA_SEND_CD IN ('03', '11', '12', '13', '14') ";
			} else{
				sql += " AND A.EEA_SEND_CD = '" + CMBSEND_CD + "' ";
			}
		}


		if(CMBBOXSORT.equals("1")) {
			sql += " ORDER BY C.ICY_COMP_NM, A.EEA_EXAM_DT";
		} else if(CMBBOXSORT.equals("2")) {
			sql += " ORDER BY C.ICY_COMP_NM, A.EEA_DEPT_NM, A.EEA_PSNL_NM";
		} else if(CMBBOXSORT.equals("3")) {
			sql += " ORDER BY C.ICY_COMP_NM, A.EEA_PSNL_NM";
		} else if(CMBBOXSORT.equals("4")) {
			sql += " ORDER BY A.EEA_PSNL_NM";
		} else if(CMBBOXSORT.equals("5")) {
			sql += " ORDER BY A.EEA_DIVI_NO";
		} else if(CMBBOXSORT.equals("6")) {
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
		} else if(CMBBOXSORT.equals("7")){
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_RFID_NO";
		}
		else {
			sql += " ORDER BY A.EEA_EXAM_DT, C.ICY_COMP_NM";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_PM_UF_SqlSet_001 \n";
			G_INFO += "설명 : 접수정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SEDT_YEAR : " + SEDT_YEAR + " \n";
			G_INFO += " DTEDTEXAM_SDT : " + DTEDTEXAM_SDT + " \n";
			G_INFO += " DTEDTEXAM_EDT : " + DTEDTEXAM_EDT + " \n";
			G_INFO += " MSKEDTCOMP_CD1 : " + MSKEDTCOMP_CD1 + " \n";
			G_INFO += " CHKBOXMAIN : " + CHKBOXMAIN + " \n";
			G_INFO += " MSKEDTCOMP_CD2 : " + MSKEDTCOMP_CD2 + " \n";
			G_INFO += " EDTCUST_NO : " + EDTCUST_NO + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " EDTPSNL_NM : " + EDTPSNL_NM + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " CMBSP_GUBN : " + CMBSP_GUBN + " \n";
			G_INFO += " CMBBOXPLCE_CD : " + CMBBOXPLCE_CD + " \n";
			G_INFO += " CMBBOXPLCE_CD2 : " + CMBBOXPLCE_CD2 + " \n";
			G_INFO += " CMBSP_CHA : " + CMBSP_CHA + " \n";
			G_INFO += " RZCHECKBOX13 : " + RZCHECKBOX13 + " \n";
			G_INFO += " CMBBOXSORT : " + CMBBOXSORT + " \n";
			G_INFO += " CMBPRINTCHK : " + CMBPRINTCHK + " \n";
			G_INFO += " CMBSEND_CD : " + CMBSEND_CD + " \n";
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
