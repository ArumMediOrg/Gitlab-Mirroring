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
		String EDPSNL_NM = htMethod.get("EDPSNL_NM");
		String EDPSNL_ID = htMethod.get("EDPSNL_ID");
		String SECUREEDPSNL_ID = htMethod.get("SECUREEDPSNL_ID");
		String EDCHART_NO = htMethod.get("EDCHART_NO");
		String SMOBL_NO = htMethod.get("SMOBL_NO");
		String CBJUMIN_YN = htMethod.get("CBJUMIN_YN");

		//
		if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
		if(EDPSNL_NM == null) { EDPSNL_NM = ""; }
		if(EDPSNL_ID == null) { EDPSNL_ID = ""; }
		if(SECUREEDPSNL_ID == null) { SECUREEDPSNL_ID = ""; }
		if(EDCHART_NO == null) { EDCHART_NO = ""; }
		if(SMOBL_NO == null) { SMOBL_NO = ""; }
		if(CBJUMIN_YN == null) { CBJUMIN_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT CASE WHEN ICR_CHART_NO = ' ' OR ICR_CHART_NO IS NULL THEN ";
		sql += " 		CASE WHEN EEA_CHART_NO = ' ' OR EEA_CHART_NO IS NULL THEN RRT_CHART_NO ELSE EEA_CHART_NO END ";
		sql += " ELSE ICR_CHART_NO END ICR_CHART_NO, ";
		sql += " ICR_CUST_NO, ICR_PENL_NM, ICR_BIRH_DT,  F_PID(ICR_PENL_ID) AS ICR_PSNL_ID, ICR_PID_EN ";

		if(G_ENCRT_KD.equals("2")) {
			sql += ", ECL_DECRYPT(ICR_PID_EN) ICR_DEC_ID";
		} else {
			sql += ", ICR_PENL_ID ICR_DEC_ID";
		}

		sql += ", F_TEL_FORMAT(ICR_TEL_NO) ICR_TEL_NO, F_TEL_FORMAT(ICR_MOBL_NO) ICR_MOBL_NO, ";
		sql += " ICR_COMP_CD, F_COMP_FIND(ICR_COMP_CD) ICR_COMP_NM, ";
		sql += " LTRIM(RTRIM(LTRIM(ICR_ZIP_AR)) || ' ' || RTRIM(LTRIM(ICR_ROAD_AR))) ICR_ADDR, EEA_EXAM_DT, RRT_EXAM_DT ";
		sql += " FROM IT_CUSTOMER A LEFT OUTER JOIN (SELECT EEA_CUST_NO, MAX(EEA_CHART_NO) EEA_CHART_NO, MAX(EEA_EXAM_DT) EEA_EXAM_DT ";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_ORDER_YN <> 'C'";
		sql += " GROUP BY EEA_CUST_NO) B";
		sql += " ON EEA_CUST_NO = ICR_CUST_NO";
		sql += " LEFT OUTER JOIN (SELECT RRT_CUST_NO, MAX(RRT_CHART_NO) RRT_CHART_NO, MAX(RRT_EXAM_DT) RRT_EXAM_DT ";
		sql += " 		FROM RT_RSVT ";
		sql += " 		WHERE RRT_CNCL_YN <> 'Y' ";
		sql += " 		GROUP BY RRT_CUST_NO) C ";
		sql += " 	ON RRT_CUST_NO = ICR_CUST_NO ";
		sql += " WHERE 1 = 1";


		if(! EDPSNL_NM.equals("")) {
			sql += " AND ICR_PENL_NM LIKE '" + EDPSNL_NM + "%'";
		}

		if(EDPSNL_ID.length() == 13) {


			if(G_ENCRT_KD.equals("1")) {
				sql += " AND ICR_PID_EN = '" + SECUREEDPSNL_ID + "'";
			} else if(G_ENCRT_KD.equals("2")) {
				sql += " AND ICR_PID_EN = ECL_ENCRYPT('" + EDPSNL_ID + "')";
			} else {
				sql += " AND ICR_PENL_ID = TRIM('" + EDPSNL_ID + "')";
			}
		} else if(! EDPSNL_ID.equals("")) {

			sql += " AND ICR_PENL_ID LIKE SUBSTR('" + EDPSNL_ID + "',1,7) || '%'";
		}

		if(! EDCHART_NO.equals("")) {
			sql += " AND (";
			sql += "	ICR_CHART_NO LIKE '%" + EDCHART_NO + "'";
			sql += " 	OR EEA_CHART_NO LIKE '%" + EDCHART_NO + "'";
			sql += "    OR RRT_CHART_NO LIKE '%" + EDCHART_NO + "'";
			sql += ")";
		}

		if(! SMOBL_NO.equals("")) {
			sql += " AND ICR_MOBL_NO LIKE '" + SMOBL_NO + "%'";
		}

		sql += " AND NVL(ICR_USE_YN, 'Y') <> 'N'";
		sql += " ORDER BY ICR_PENL_NM, ICR_PENL_ID";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFind_Cust_Up_FindCustomer_001 \n";
			G_INFO += "설명 : 고객정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " G_ENCRT_KD : " + G_ENCRT_KD + " \n";
			G_INFO += " EDPSNL_NM : " + EDPSNL_NM + " \n";
			G_INFO += " EDPSNL_ID : " + EDPSNL_ID + " \n";
			G_INFO += " SECUREEDPSNL_ID : " + SECUREEDPSNL_ID + " \n";
			G_INFO += " EDCHART_NO : " + EDCHART_NO + " \n";
			G_INFO += " SMOBL_NO : " + SMOBL_NO + " \n";
			G_INFO += " CBJUMIN_YN : " + CBJUMIN_YN + " \n";
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
