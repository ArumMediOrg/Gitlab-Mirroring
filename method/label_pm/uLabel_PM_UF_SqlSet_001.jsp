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

		String DTEDTEXAM_SDT = htMethod.get("DTEDTEXAM_SDT");
		String DTEDTEXAM_EDT = htMethod.get("DTEDTEXAM_EDT");
		String MSKEDTCOMP_CD1 = htMethod.get("MSKEDTCOMP_CD1");
		String CHKBOXMAIN = htMethod.get("CHKBOXMAIN");
		String MSKEDTCOMP_CD2 = htMethod.get("MSKEDTCOMP_CD2");
		String EDTCUST_NO = htMethod.get("EDTCUST_NO");
		String EDTPSNL_NM = htMethod.get("EDTPSNL_NM");
		String CMBBOXEXAM_CD1 = htMethod.get("CMBBOXEXAM_CD1");
		String CMBBOXPLCE_CD = htMethod.get("CMBBOXPLCE_CD");
		String CMBBOXFAMY_CD = htMethod.get("CMBBOXFAMY_CD");
		String EDTDIVI_CS = htMethod.get("EDTDIVI_CS");
		String EDTCLSS_KD = htMethod.get("EDTCLSS_KD");
		String EDTDIVI_NO = htMethod.get("EDTDIVI_NO");
		String RADIOBUTTON2 = htMethod.get("RADIOBUTTON2");
		String RADIOBUTTON3 = htMethod.get("RADIOBUTTON3");
		String CMBBOXSORT = htMethod.get("CMBBOXSORT");
		String ACPTCD = htMethod.get("ACPTCD");

		//
		if(DTEDTEXAM_SDT == null) { DTEDTEXAM_SDT = ""; }
		if(DTEDTEXAM_EDT == null) { DTEDTEXAM_EDT = ""; }
		if(MSKEDTCOMP_CD1 == null) { MSKEDTCOMP_CD1 = ""; }
		if(CHKBOXMAIN == null) { CHKBOXMAIN = ""; }
		if(MSKEDTCOMP_CD2 == null) { MSKEDTCOMP_CD2 = ""; }
		if(EDTCUST_NO == null) { EDTCUST_NO = ""; }
		if(EDTPSNL_NM == null) { EDTPSNL_NM = ""; }
		if(CMBBOXEXAM_CD1 == null) { CMBBOXEXAM_CD1 = ""; }
		if(CMBBOXPLCE_CD == null) { CMBBOXPLCE_CD = ""; }
		if(CMBBOXFAMY_CD == null) { CMBBOXFAMY_CD = ""; }
		if(EDTDIVI_CS == null) { EDTDIVI_CS = ""; }
		if(EDTCLSS_KD == null) { EDTCLSS_KD = ""; }
		if(EDTDIVI_NO == null) { EDTDIVI_NO = ""; }
		if(RADIOBUTTON2 == null) { RADIOBUTTON2 = ""; }
		if(RADIOBUTTON3 == null) { RADIOBUTTON3 = ""; }
		if(CMBBOXSORT == null) { CMBBOXSORT = ""; }
		if(ACPTCD == null) { ACPTCD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_ACPT_CD, A.EEA_CUST_NO, A.EEA_PSNL_NM, A.EEA_EXAM_CD, A.EEA_CHART_NO, C.ICY_COMP_NM, A.EEA_DEPT_NM, A.EEA_PSNL_AGE, CASE WHEN B.ICR_SEX_KD IS NULL";
		sql += " OR B.ICR_SEX_KD = '' THEN B.ICR_SEX_KD ELSE GETCOMMON_LVCDTONM('0411',B.ICR_SEX_KD,'5',1) END ICR_SEX_NM, SUBSTR(B.ICR_PENL_ID,1,6) ICR_BIRH_DT, A.EEA_COMP_CD, (C.ICY_ZIP_AR || ' ' || C.ICY_ROAD_AR) ICY_COMP_AR, A.EEA_LABEL_DT, CASE WHEN A.EEA_COMP_CD IS NULL";
		sql += " OR A.EEA_COMP_CD = '' THEN '' ELSE '[' || A.EEA_COMP_CD || ']' || C.ICY_COMP_NM END EEA_COMP_NM, (A.EEA_ZIP_AR || ' ' || A.EEA_ROAD_AR) AS EEA_ADDR_NM, A.EEA_ZIP_CD, C.ICY_ZIP_CD, A.EEA_MOBL_NO, A.EEA_FAMY_NM, A.EEA_DIVI_CS, A.EEA_CLSS_KD, A.EEA_DIVI_NO";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_EXAM_DT >= '" + DTEDTEXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(!MSKEDTCOMP_CD1.equals("")) {
			if(CHKBOXMAIN.equals("1")) {
				sql += " AND A.EEA_COMP_CD IN '" + MSKEDTCOMP_CD2 + "'";
			}
			else {
				sql += " AND A.EEA_COMP_CD = '" + MSKEDTCOMP_CD2 + "'";
			}
		}

		if(!EDTCUST_NO.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + EDTCUST_NO + "'";
		}

		if(!EDTPSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%' || '" + EDTPSNL_NM + "' || '%'";
		}

		if(!CMBBOXEXAM_CD1.equals("00")) {
			if(CMBBOXEXAM_CD1.equals("1") || CMBBOXEXAM_CD1.equals("12")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEXAM_CD1 + "'";
				sql += " OR (EEA_HTSB_YN = 'Y'";
				sql += " AND SUBSTR(A.EEA_HTSB_CD,1,2) = '" + CMBBOXEXAM_CD1 + "'))";
			}
			else if(CMBBOXEXAM_CD1.equals("13")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEXAM_CD1 + "'";
				sql += " OR EEA_STOMA_CD <> '0'";
				sql += " OR EEA_COLON_CD <> '0'";
				sql += " OR EEA_LIVER_CD <> '0'";
				sql += " OR EEA_BAST_CD <> '0'";
				sql += " OR EEA_UTER_CD <> '0')";
			}
			else if(CMBBOXEXAM_CD1.equals("14")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEXAM_CD1 + "'";
				sql += " OR EEA_ORAL_YN = 'Y')";
			}
			else if(CMBBOXEXAM_CD1.equals("32")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEXAM_CD1 + "'";
				sql += " OR (EEA_EMSB_YN = 'Y'";
				sql += " AND SUBSTR(A.EEA_EMSB_CD,1,2) = '" + CMBBOXEXAM_CD1 + "'))";
			}
			else if(CMBBOXEXAM_CD1.equals("41")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEXAM_CD1 + "'";
				sql += " OR (EEA_SPSB_YN = 'Y'";
				sql += " AND SUBSTR(A.EEA_SPSB_CD,1,2) = '" + CMBBOXEXAM_CD1 + "'))";
			}
			else if(CMBBOXEXAM_CD1.equals("81")) {
				sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEXAM_CD1 + "'";
				sql += " OR (EEA_CVSB_YN = 'Y'";
				sql += " AND SUBSTR(A.EEA_CVSB_CD,1,2) = '" + CMBBOXEXAM_CD1 + "'))";
			}
			else {
				sql += " AND SUBSTR(A.EEA_EXAM_CD,1,2) = '" + CMBBOXEXAM_CD1 + "'";
			}
		}

		if(!CMBBOXPLCE_CD.equals("00")) {
			sql += " AND SUBSTR(A.EEA_PLCE_CD,1,2) = '" + CMBBOXPLCE_CD + "'";
		}

		if(!CMBBOXFAMY_CD.equals("00")) {
			sql += " AND A.EEA_FAMY_CD = '" + CMBBOXFAMY_CD + "'";
		}

		if(!EDTDIVI_CS.equals("")) {
			sql += " AND A.EEA_DIVI_CS = '" + EDTDIVI_CS + "'";
		}

		if(!EDTCLSS_KD.equals("")) {
			sql += " AND A.EEA_CLSS_KD = '" + EDTCLSS_KD + "'";
		}

		if(!EDTDIVI_NO.equals("")) {
			sql += " AND A.EEA_DIVI_NO = '" + EDTDIVI_NO + "'";
		}

		if(!ACPTCD.equals("")){
			sql += " AND A.EEA_ACPT_CD = '" + ACPTCD + "' ";
		}

		if(RADIOBUTTON2.equals("1")) {
			sql += " AND (NVL(A.EEA_LABEL_DT, ' ') = ' '";
			sql += " OR TO_CHAR(TO_DATE( A.EEA_LABEL_DT), 'YYYY-MM-DD') = '1900-01-01')";
		}
		else if(RADIOBUTTON3.equals("1")) {
			sql += " AND (NVL(A.EEA_LABEL_DT, ' ') <> ' '";
			sql += " AND TO_CHAR(TO_DATE( A.EEA_LABEL_DT), 'YYYY-MM-DD') <> '1900-01-01')";
		}

		if(CMBBOXSORT.equals("0")) {
			sql += " ORDER BY C.ICY_COMP_CD, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("1")) {
			sql += " ORDER BY C.ICY_COMP_CD, A.EEA_DEPT_NM, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("2")) {
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
		}
		else if(CMBBOXSORT.equals("3")) {
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("4")) {
			sql += " ORDER BY A.EEA_PSNL_NM, A.EEA_EXAM_SQ";
		}
		else if(CMBBOXSORT.equals("5")) {
			sql += " ORDER BY C.ICY_COMP_CD, A.EEA_DEPT_NM, A.EEA_DIVI_CS, A.EEA_CLSS_KD, A.EEA_DIVI_NO";
		}
		else if(CMBBOXSORT.equals("6")) {
			sql += " ORDER BY A.EEA_CHART_NO";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uLabel_PM_UF_SqlSet_001 \n";
			G_INFO += "설명 : 라벨 출력정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEDTEXAM_SDT : " + DTEDTEXAM_SDT + " \n";
			G_INFO += " DTEDTEXAM_EDT : " + DTEDTEXAM_EDT + " \n";
			G_INFO += " MSKEDTCOMP_CD1 : " + MSKEDTCOMP_CD1 + " \n";
			G_INFO += " CHKBOXMAIN : " + CHKBOXMAIN + " \n";
			G_INFO += " MSKEDTCOMP_CD2 : " + MSKEDTCOMP_CD2 + " \n";
			G_INFO += " EDTCUST_NO : " + EDTCUST_NO + " \n";
			G_INFO += " EDTPSNL_NM : " + EDTPSNL_NM + " \n";
			G_INFO += " CMBBOXEXAM_CD1 : " + CMBBOXEXAM_CD1 + " \n";
			G_INFO += " CMBBOXPLCE_CD : " + CMBBOXPLCE_CD + " \n";
			G_INFO += " CMBBOXFAMY_CD : " + CMBBOXFAMY_CD + " \n";
			G_INFO += " EDTDIVI_CS : " + EDTDIVI_CS + " \n";
			G_INFO += " EDTCLSS_KD : " + EDTCLSS_KD + " \n";
			G_INFO += " EDTDIVI_NO : " + EDTDIVI_NO + " \n";
			G_INFO += " RADIOBUTTON2 : " + RADIOBUTTON2 + " \n";
			G_INFO += " RADIOBUTTON3 : " + RADIOBUTTON3 + " \n";
			G_INFO += " CMBBOXSORT : " + CMBBOXSORT + " \n";
			G_INFO += " ACPTCD : " + ACPTCD + " \n";
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
