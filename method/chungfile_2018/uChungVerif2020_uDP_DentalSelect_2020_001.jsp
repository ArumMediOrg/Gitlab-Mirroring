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

		String DTEFROMDT = htMethod.get("DTEFROMDT");
		String DTETODT = htMethod.get("DTETODT");
		String CMBCHUNGYYYY = htMethod.get("CMBCHUNGYYYY");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(DTEFROMDT == null) { DTEFROMDT = ""; }
		if(DTETODT == null) { DTETODT = ""; }
		if(CMBCHUNGYYYY == null) { CMBCHUNGYYYY = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT EEA_EXAM_DT,EEA_EXAM_SQ, EEA_ORALR_PR EEA_HLTHR_PR,EEA_CNTR_CD, ICR_PID_EN, ICR_PENL_ID, EEA_HLTH_KD, EEA_HTSB_CD, ";
		sql += " EEA_PSNL_NM, EEA_CHART_NO, EEA_MNGT_HTYR, EEA_PLCE_CD, EEA_INSU_NO, EDP_EXAM_DT, EDP_MJ01_KD, EDP_MJ02_KD, EDP_MJ03_KD, EDP_MJ04_KD, EDP_MJ05_KD, EDP_MJ06_KD, EDP_DT01_KD, EDP_DT02_KD, EDP_DT03_KD, EDP_DT04_KD, EDP_DJ01_KD, EDP_DJ02_KD, EDP_ETAL_EX, EDP_D401_VAL, EDP_D402_VAL, EDP_D403_VAL, EDP_D404_VAL, EDP_D405_VAL, EDP_D406_VAL, EDP_PANJ_CD, EDP_TOBO_DT, EDP_PANJ_DT, F_RPAD(NVL(EDP_IMME_EX,' '),500,' ') EDP_IMME_EX, F_RPAD(NVL(EDP_ACTI_EX,' '),500,' ') EDP_ACTI_EX, IAU_LICEN1_NO, H.IAU_PENL_NM, H.IAU_PENL_ID, C.ICR_INFO_YN, REPLACE(EDP_EXAM_DT,'-','') EEA_INFO_DT";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_DENTAL_PANJ B";
		sql += " ON A.EEA_EXAM_DT=B.EDP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=B.EDP_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER C";
		sql += " ON A.EEA_CUST_NO=C.ICR_CUST_NO LEFT OUTER JOIN IT_AUTH_USER H";
		sql += " ON B.EDP_DOCT_CD =H.IAU_EMP_NO";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + DTEFROMDT + "' AND '" + DTETODT + "'";

		if (CMBCHUNGYYYY.equals("2020")){
			sql += " and (substr(EEA_HLTH_KD, 19, 1) = '1' or EEA_MNGT_HTYR = '" + CMBCHUNGYYYY + "' ) ";
		} else {
			sql += " and (substr(EEA_HLTH_KD, 19, 1) = '0' or EEA_MNGT_HTYR = '" + CMBCHUNGYYYY + "' ) ";
		}

		sql += " AND EEA_HTSB_CD LIKE '1%'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " AND NVL(EEA_ORAL_YN, 'N') = 'Y'";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChungVerif2020_uDP_DentalSelect_2020_001 \n";
			G_INFO += "설명 : 구강검진 성적확인 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEFROMDT : " + DTEFROMDT + " \n";
			G_INFO += " DTETODT : " + DTETODT + " \n";
			G_INFO += " CMBCHUNGYYYY : " + CMBCHUNGYYYY + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
