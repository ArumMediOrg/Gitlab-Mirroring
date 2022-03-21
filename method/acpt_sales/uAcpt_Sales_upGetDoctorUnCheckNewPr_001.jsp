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

		String YEAR = htMethod.get("YEAR");
		String SDT = htMethod.get("SDT");
		String EDT = htMethod.get("EDT");

		//
		if(YEAR == null) { YEAR = ""; }
		if(SDT == null) { SDT = ""; }
		if(EDT == null) { EDT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT DR_NM, NVL(SUM(ITEM_PR),0) NEW_UNCHECK_PR FROM ( ";
		sql += " SELECT CASE WHEN NVL(D.PFP_DOCTORFIR, ' ') = ' ' THEN '>미판정<' ELSE F_USER_FIND(D.PFP_DOCTORFIR) END AS DR_NM, ";
		sql += " 	B.ITEM_PR FROM ET_RSLT_ITEM A ";
		sql += " INNER JOIN ";
		sql += " (SELECT CASE WHEN C.IIM_EXGN_CD = 'I' THEN  'N0042' ELSE C.IIM_ITEM_CD END IIM_ITEM_CD, C.IIM_KNME_NM, C.IIM_EXGN_CD, C.IIM_RSLT_KD, ";
		sql += " CASE WHEN 'IIC_HLTH_KD' = 'IIC_HLTH_KD' OR 'IIC_HLTH_KD' = 'IIC_CAN_KD' OR 'IIC_HLTH_KD' = 'IIC_STDTO_KD' ";
		sql += " THEN B.IIP_GBSG_PR ";
		sql += " WHEN 'IIC_HLTH_KD' = 'IIC_STDT_KD' THEN B.IIP_STSG_PR END AS ITEM_PR, ";
		sql += " CASE WHEN 'IIC_HLTH_KD' = 'IIC_STDT_KD' THEN 0 ELSE B.IIP_GASN_PR END AS GASN_PR, IIC_EXAM_YR ";
		sql += " FROM IT_ITEM_CALL A, IT_ITEM_PRICE B, IT_ITEM C ";
		sql += " WHERE IIC_EXAM_YR IN (" + YEAR + ") AND ";
		sql += " (     NVL(SUBSTR(IIC_HLTH_KD, 1, 1),  '0') <> '0' OR NVL(SUBSTR(IIC_HLTH_KD, 1, 1),  '0') <> '0' ";
		sql += " OR NVL(SUBSTR(IIC_HLTH_KD, 2, 1),  '0') <> '0' OR NVL(SUBSTR(IIC_HLTH_KD, 3, 1),  '0') <> '0' ";
		sql += " OR NVL(SUBSTR(IIC_HLTH_KD, 4, 1),  '0') <> '0' OR NVL(SUBSTR(IIC_HLTH_KD, 5, 1),  '0') <> '0' ";
		sql += " OR NVL(SUBSTR(IIC_HLTH_KD, 6, 1),  '0') <> '0' OR NVL(SUBSTR(IIC_HLTH_KD, 7, 1),  '0') <> '0' ";
		sql += " OR NVL(SUBSTR(IIC_HLTH_KD, 8, 1),  '0') <> '0' OR NVL(SUBSTR(IIC_HLTH_KD, 9, 1),  '0') <> '0' ";
		sql += " OR NVL(SUBSTR(IIC_HLTH_KD, 10, 1), '0') <> '0' OR NVL(SUBSTR(IIC_HLTH_KD, 11, 1), '0') <> '0' ";
		sql += " OR NVL(SUBSTR(IIC_HLTH_KD, 12, 1), '0') <> '0' OR NVL(SUBSTR(IIC_HLTH_KD, 13, 1), '0') <> '0' ";
		sql += " OR NVL(SUBSTR(IIC_HLTH_KD, 14, 1), '0') <> '0' OR NVL(SUBSTR(IIC_HLTH_KD, 15, 1), '0') <> '0' ";
		sql += " OR NVL(SUBSTR(IIC_HLTH_KD, 16, 1), '0') <> '0' OR NVL(SUBSTR(IIC_HLTH_KD, 17, 1), '0') <> '0' ";
		sql += " OR NVL(SUBSTR(IIC_HLTH_KD, 18, 1), '0') <> '0' OR NVL(SUBSTR(IIC_HLTH_KD, 19, 1), '0') <> '0' ";
		sql += " OR NVL(SUBSTR(IIC_HLTH_KD, 20, 1), '0') <> '0') ";
		sql += " AND C.IIM_ITEM_CD = A.IIC_ITEM_CD ";
		sql += " AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIC_ITEM_CD, IIC_EXAM_YR ||'-12-31', 'ITEM_CD') ";
		sql += " AND B.IIP_ITEM_CD = A.IIC_ITEM_CD AND UPPER(B.IIP_USE_YN) = 'Y' ) B ";
		sql += " ON B.IIM_ITEM_CD = A.ERI_ITEM_CD AND B.IIC_EXAM_YR = SUBSTR(TO_CHAR(TO_DATE(A.ERI_EXAM_DT,'YYYY-MM-DD')),1,4) ";
		sql += " LEFT OUTER JOIN PT_FIR_PANJUNG D ON D.PFP_EXAM_DT = A.ERI_EXAM_DT AND D.PFP_EXAM_SQ = A.ERI_EXAM_SQ ";
		sql += " WHERE ERI_EXAM_DT BETWEEN '" + SDT + "' and '" + EDT + "' ";
		sql += " AND NVL(ERI_HLTH_KD, '0') = '1' ";
		sql += " AND (B.ITEM_PR <> '0' OR B.GASN_PR <> '0') ";
		sql += " AND ERI_CNCL_YN <> 'Y' ";
		sql += " AND NVL(ERI_RSLT_VL, ' ') IN (' ', '미촬영') AND IIM_RSLT_KD <> '9') A ";
		sql += " GROUP BY A.DR_NM ";


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_Sales_upGetDoctorUnCheckNewPr_001 \n";
			G_INFO += "설명 : 판정의사별 일반검진 미검수가 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " YEAR : " + YEAR + " \n";
			G_INFO += " SDT : " + SDT + " \n";
			G_INFO += " EDT : " + EDT + " \n";
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
