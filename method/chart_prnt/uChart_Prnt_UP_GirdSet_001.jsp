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
		String RZCOMBOBOX2 = htMethod.get("RZCOMBOBOX2");
		String RZCOMBOBOX1 = htMethod.get("RZCOMBOBOX1");
		String MSKEDTCOMP_CD = htMethod.get("MSKEDTCOMP_CD");
		String EDTPSNL_NM = htMethod.get("EDTPSNL_NM");
		String CMBBOXPLCE_CD = htMethod.get("CMBBOXPLCE_CD");
		String RZEDIT3 = htMethod.get("RZEDIT3");
		String CMBBOXSORT = htMethod.get("CMBBOXSORT");
		String CMBBOXPLCE_CD2 = htMethod.get("CMBBOXPLCE_CD2");

		//
		if(DTEDTEXAM_SDT == null) { DTEDTEXAM_SDT = ""; }
		if(DTEDTEXAM_EDT == null) { DTEDTEXAM_EDT = ""; }
		if(RZCOMBOBOX2 == null) { RZCOMBOBOX2 = ""; }
		if(RZCOMBOBOX1 == null) { RZCOMBOBOX1 = ""; }
		if(MSKEDTCOMP_CD == null) { MSKEDTCOMP_CD = ""; }
		if(EDTPSNL_NM == null) { EDTPSNL_NM = ""; }
		if(CMBBOXPLCE_CD == null) { CMBBOXPLCE_CD = ""; }
		if(RZEDIT3 == null) { RZEDIT3 = ""; }
		if(CMBBOXSORT == null) { CMBBOXSORT = ""; }
		if(CMBBOXPLCE_CD2 == null) { CMBBOXPLCE_CD2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, A.EEA_PSNL_AGE, A.EEA_CHART_NO, A.EEA_EXAM_LT, A.EEA_EXAM_CD, ";
		sql += " A.EEA_HTSB_CD, A.EEA_PLCE_CD, A.EEA_SEX_CD, A.EEA_DEPT_NM, A.EEA_ENTY_CD, ";
		sql += " A.EEA_HLTH_KD, A.EEA_STOMA_CD, A.EEA_COLON_CD, A.EEA_LIVER_CD, A.EEA_BAST_CD, A.EEA_UTER_CD, NVL(A.EEA_LUNG_CD, '0') EEA_LUNG_CD, A.EEA_ORAL_YN, ";
		sql += " B.ICR_PENL_ID, B.ICR_BIRH_DT, F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO";
		sql += " WHERE A.EEA_EXAM_DT >= '" + DTEDTEXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEXAM_EDT + "'";
		sql += " AND (A.EEA_HDMD_YN = 'Y'";
		sql += " OR A.EEA_HLTHR_PR > 0)";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(RZCOMBOBOX2.equals("0")) {
			sql += " AND A.EEA_MNGT_HTYR >= '2019'";

			if(RZCOMBOBOX1.equals("0") || RZCOMBOBOX1.equals("4")) {
				sql += " AND A.EEA_HTSB_CD = '11001'";
			}
			else if(RZCOMBOBOX1.equals("1")) {
				sql += " AND A.EEA_HTSB_CD = '12003'";
			}
			else if(RZCOMBOBOX1.equals("2") || RZCOMBOBOX1.equals("5")) {
				sql += " AND SUBSTR(A.EEA_HTSB_CD, 1, 1) = '1'";
				sql += " AND (A.EEA_STOMA_CD <> '0'";
				sql += " OR A.EEA_COLON_CD <> '0'";
				sql += " OR A.EEA_LIVER_CD <> '0'";
				sql += " OR A.EEA_BAST_CD <> '0'";
				sql += " OR A.EEA_UTER_CD <> '0'";
				sql += " OR NVL(A.EEA_LUNG_CD, '0') <> '0')";
			}
			else if(RZCOMBOBOX1.equals("3") || RZCOMBOBOX1.equals("6")) {
				sql += " AND A.EEA_HTSB_CD = '11001'";
				sql += " AND SUBSTR(NVL(A.EEA_HLTH_KD, '0000000000'), 7, 1) = '1'";
			}
		}
		else if(RZCOMBOBOX2.equals("1")) {
			sql += " AND A.EEA_MNGT_HTYR = '2018'";

			if(RZCOMBOBOX1.equals("0")) {
				sql += " AND A.EEA_HTSB_CD = '11001'";
			}
			else if(RZCOMBOBOX1.equals("1")) {
				sql += " AND A.EEA_HTSB_CD = '12003'";
			}
			else if(RZCOMBOBOX1.equals("2")) {
				sql += " AND SUBSTR(A.EEA_HTSB_CD, 1, 1) = '1'";
				sql += " AND (A.EEA_STOMA_CD <> '0'";
				sql += " OR A.EEA_COLON_CD <> '0'";
				sql += " OR A.EEA_LIVER_CD <> '0'";
				sql += " OR A.EEA_BAST_CD <> '0'";
				sql += " OR A.EEA_UTER_CD <> '0')";
			}
			else if(RZCOMBOBOX1.equals("3")) {
				sql += " AND A.EEA_HTSB_CD = '11001'";
			}
		}

		if(!MSKEDTCOMP_CD.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + MSKEDTCOMP_CD + "'";
		}

		if(!EDTPSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%' || '" + EDTPSNL_NM + "' || '%'";
		}

		if(!CMBBOXPLCE_CD.equals("0")) {
			if(!CMBBOXPLCE_CD2.equals("")) {
				sql += " AND SUBSTR(A.EEA_PLCE_CD,1,2) = '" + CMBBOXPLCE_CD2 + "' ";
			}
			else {
				sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD + "' ";
			}
		}

		if(!RZEDIT3.equals("")) {
			sql += " AND A.EEA_CHART_NO = '" + RZEDIT3 + "'";
		}

		if(CMBBOXSORT.equals("1")) {
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("2")) {
			sql += " ORDER BY A.EEA_PSNL_NM, B.ICR_PENL_ID";
		}
		else {
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
		}


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChart_Prnt_UP_GirdSet_001 \n";
			G_INFO += "설명 : 기록지 정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEDTEXAM_SDT : " + DTEDTEXAM_SDT + " \n";
			G_INFO += " DTEDTEXAM_EDT : " + DTEDTEXAM_EDT + " \n";
			G_INFO += " RZCOMBOBOX2 : " + RZCOMBOBOX2 + " \n";
			G_INFO += " RZCOMBOBOX1 : " + RZCOMBOBOX1 + " \n";
			G_INFO += " MSKEDTCOMP_CD : " + MSKEDTCOMP_CD + " \n";
			G_INFO += " EDTPSNL_NM : " + EDTPSNL_NM + " \n";
			G_INFO += " CMBBOXPLCE_CD : " + CMBBOXPLCE_CD + " \n";
			G_INFO += " RZEDIT3 : " + RZEDIT3 + " \n";
			G_INFO += " CMBBOXSORT : " + CMBBOXSORT + " \n";
			G_INFO += " CMBBOXPLCE_CD2 : " + CMBBOXPLCE_CD2 + " \n";
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
