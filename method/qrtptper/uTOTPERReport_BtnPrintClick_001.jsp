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
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String RZCOMBOBOX2 = htMethod.get("RZCOMBOBOX2");
		String G_HOSP_NO = htMethod.get("G_HOSP_NO");
		String CBVIEW_NO = htMethod.get("CBVIEW_NO");
		String CBONLY_VIEW = htMethod.get("CBONLY_VIEW");
		String SSORT = htMethod.get("SSORT");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(RZCOMBOBOX2 == null) { RZCOMBOBOX2 = ""; }
		if(G_HOSP_NO == null) { G_HOSP_NO = ""; }
		if(CBVIEW_NO == null) { CBVIEW_NO = ""; }
		if(CBONLY_VIEW == null) { CBONLY_VIEW = ""; }
		if(SSORT == null) { SSORT = ""; }


		// DB객체
		stmtList = connect.createStatement();

		if(CBONLY_VIEW.equals("0")){
			sql = " SELECT ET_EXAM_ACPT.EEA_ACPT_TX, ET_EXAM_ACPT.EEA_DEPT_NM, ET_EXAM_ACPT.EEA_PSNL_AGE, ET_EXAM_ACPT.EEA_EXAM_DT, ";
			sql += " ET_EXAM_ACPT.EEA_EXAM_SQ, ET_EXAM_ACPT.EEA_PSNL_NM, IT_CUSTOMER.ICR_PENL_ID, ET_EXAM_ACPT.EEA_CHART_NO, ";
			sql += " ET_EXAM_ACPT.EEA_ZIP_AR, ET_EXAM_ACPT.EEA_ROAD_AR, ET_EXAM_ACPT.EEA_SEX_CD, ET_EXAM_ACPT.EEA_ZIP_CD, ET_RSLT_ITEM.ERI_RSLT_KD, ";
			sql += " ET_RSLT_ITEM.ERI_CHAR_VAL, ET_RSLT_ITEM.ERI_ITEM_CD, ET_RSLT_ITEM.ERI_RSLT_VL, ET_RSLT_ITEM.ERI_VLDT_LH, ET_RSLT_ITEM.ERI_RSLT_UNIT, ";
			sql += " ET_RSLT_ITEM.ERI_RSLT_EX, IT_ITEM.IIM_REJH_EX, IT_ITEM.IIM_SNME_NM, IT_ITEM.IIM_KNME_NM, IT_ITEM.IIM_ENME_NM, ET_RSLT_ITEM.ERI_RSLT_LOW , ";
			sql += " ET_RSLT_ITEM.ERI_RSLT_HIGH , IT_ITEM.IIM_RSLT_KD, ";
			sql += " CASE WHEN IIM_RSLT_KD = '7'";
			sql += " AND (RTRIM(ERI_RSLT_EX) = ''";
			sql += " OR ERI_RSLT_EX IS NULL) THEN '2' ELSE IIM_RSLT_KD END AS ERI_SORT_FST, ET_RSLT_ITEM.ERI_SORT_SQ, ICY_COMP_NM, ICR_CUST_NO,   ";
			sql += " CASE WHEN IIM_RSLT_KD = '7' AND (RTRIM(ERI_RSLT_EX) = '' OR ERI_RSLT_EX IS NULL) THEN '2' ";
			sql += " 			WHEN IIM_RSLT_KD IN ('1', '2') THEN '2' ";
			sql += " 			ELSE IIM_RSLT_KD ";
			sql += " 			END AS ERI_SORT_FST2, IIM_SORT_SQ ";
			sql += " FROM ET_EXAM_ACPT INNER JOIN IT_CUSTOMER";
			sql += " ON ET_EXAM_ACPT.EEA_CUST_NO = IT_CUSTOMER.ICR_CUST_NO INNER JOIN ET_RSLT_ITEM";
			sql += " ON ET_EXAM_ACPT.EEA_EXAM_DT = ET_RSLT_ITEM.ERI_EXAM_DT";
			sql += " AND ET_EXAM_ACPT.EEA_EXAM_SQ = ET_RSLT_ITEM.ERI_EXAM_SQ INNER JOIN IT_ITEM";
			sql += " ON ET_RSLT_ITEM.ERI_ITEM_CD = IT_ITEM.IIM_ITEM_CD LEFT OUTER JOIN IT_COMPANY C";
			sql += " ON ET_EXAM_ACPT.EEA_COMP_CD = C.ICY_COMP_CD";
			sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
			sql += " AND NVL(ERI_CNCL_YN, 'N') <> 'Y'";
			sql += " AND NVL(ERI_RSLT_KD, ' ') <> '9'";
			sql += " AND NVL(IIM_RSLT_KD, '9') <> '9'";
			//sql += " AND (ERI_RSLT_VL <> ' '";
			//sql += " OR ERI_RSLT_EX <> ' ')";

			if(RZCOMBOBOX2.equals("1")) {
				sql += " AND C.ERI_ADD_KD IN ('1', '7')";
			}

			if(RZCOMBOBOX2.equals("2")) {
				sql += " AND C.ERI_ADD_KD <> '0'";
			}

			if(RZCOMBOBOX2.equals("3")) {
				sql += " AND C.ERI_ADD_KD IN ('3')";
			}

			if(RZCOMBOBOX2.equals("4")) {
				sql += " AND C.ERI_ADD_KD IN ('4', '5')";
			}

			if(RZCOMBOBOX2.equals("5")) {
				sql += " AND C.ERI_ETC_KD <> '0'";
			}

			if(RZCOMBOBOX2.equals("6")) {
				sql += " AND (C.ERI_ETC_KD <> '0' OR ERI_ADD_KD <> '0')";
			}

			if(RZCOMBOBOX2.equals("7")) {
				sql += " AND D.IIM_RSLT_KD IN ('6', '7')";
			}

			if(G_HOSP_NO.equals("11100761") && RZCOMBOBOX2.equals("1")) {
				sql += " AND ERI_ITEM_CD NOT IN ('BZ159', 'BZ179', 'C0001', 'C0006', 'C0007', 'C0008', 'Z0267', 'Z0268')";
			}
		}

		if(CBVIEW_NO.equals("0") && CBONLY_VIEW.equals("0")) {
			sql += " UNION";
		}

		if(CBVIEW_NO.equals("0")) {

			sql += " SELECT ET_EXAM_ACPT.EEA_ACPT_TX, ET_EXAM_ACPT.EEA_DEPT_NM, ET_EXAM_ACPT.EEA_PSNL_AGE, SSV_EXAM_DT EEA_EXAM_DT, SSV_EXAM_SQ EEA_EXAM_SQ, ";
			sql += " ET_EXAM_ACPT.EEA_PSNL_NM, IT_CUSTOMER.ICR_PENL_ID, ET_EXAM_ACPT.EEA_CHART_NO, ET_EXAM_ACPT.EEA_ZIP_AR, ET_EXAM_ACPT.EEA_ROAD_AR, ";
			sql += " ET_EXAM_ACPT.EEA_SEX_CD, ET_EXAM_ACPT.EEA_ZIP_CD, '99' ERI_RSLT_KD, ' ' ERI_CHAR_VAL, 'X999' ERI_ITEM_CD, ' ' ERI_RSLT_VL, ";
			sql += " ' ' ERI_VLDT_LH, ' ' ERI_RSLT_UNIT, CASE WHEN SSV_VIEW_EX IS NULL THEN '' ELSE 'X999' END AS ERI_RSLT_EX, ' ' IIM_REJH_EX, ";
			sql += " '종합소견' IIM_SNME_NM, '종합소견' IIM_KNME_NM, 'opinion' IIM_ENME_NM, ' ' ERI_RSLT_LOW, ' ' ERI_RSLT_HIGH, ' ' IIM_RSLT_KD, '99' ERI_SORT_FST, 99999 ERI_SORT_SQ, ICY_COMP_NM, ICR_CUST_NO, '99' ERI_SORT_FST2,   99999999  IIM_SORT_SQ ";
			sql += " FROM ST_SYTH_VIEW LEFT OUTER JOIN ET_EXAM_ACPT";
			sql += " ON ET_EXAM_ACPT.EEA_EXAM_DT = ST_SYTH_VIEW.SSV_EXAM_DT";
			sql += " AND ET_EXAM_ACPT.EEA_EXAM_SQ = ST_SYTH_VIEW.SSV_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
			sql += " ON ET_EXAM_ACPT.EEA_COMP_CD = C.ICY_COMP_CD LEFT JOIN IT_CUSTOMER";
			sql += " ON ET_EXAM_ACPT.EEA_CUST_NO = IT_CUSTOMER.ICR_CUST_NO";
			sql += " WHERE SSV_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND SSV_EXAM_SQ = '" + EXAM_SQ + "'";
		}

		if(!SSORT.equals("")){
			sql += SSORT;
		} else {
			sql += " ORDER BY ERI_SORT_FST, ERI_SORT_SQ, ERI_ITEM_CD";
		}


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uTOTPERReport_BtnPrintClick_001 \n";
			G_INFO += "설명 : 검사정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " RZCOMBOBOX2 : " + RZCOMBOBOX2 + " \n";
			G_INFO += " G_HOSP_NO : " + G_HOSP_NO + " \n";
			G_INFO += " CBVIEW_NO : " + CBVIEW_NO + " \n";
			G_INFO += " CBONLY_VIEW : " + CBONLY_VIEW + " \n";
			G_INFO += " SSORT : " + SSORT + " \n";
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
