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

		String CUST_NO = htMethod.get("CUST_NO");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String CHKABNORMAL = htMethod.get("CHKABNORMAL");
		String SSORT = htMethod.get("SSORT");

		//
		if(CUST_NO == null) { CUST_NO = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CHKABNORMAL == null) { CHKABNORMAL = ""; }
		if(SSORT == null) { SSORT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT ROW_NUMBER() OVER (";
		if (!SSORT.equals("")){
			sql += " ORDER BY " + SSORT + " ) AS ORD_NO , B.*";
		} else {
			sql += " ORDER BY ERI_SORT_SQ ) AS ORD_NO , B.*";
		}

		sql += " FROM (";
		sql += "	SELECT CASE WHEN NVL(ERI_RSLT_KD, ' ') <> ' ' THEN ERI_RSLT_KD ELSE IIM_RSLT_KD END AS RSLT_KD , A.* , ";
		sql += "           GETBFR_RSLT(ERI_ITEM_CD, '" + CUST_NO + "' , '" + EXAM_DT + "') AS BFR_RSLT";
		sql += "         , case when NVL(ERI_VLDT_LH,' ') <> ' '  then 'Y' else 'N' end CHK_LH_YN ";
        sql += "         , case when ERI_ITEM_CD IN (SELECT CCN_SMALL FROM CT_COMMON WHERE CCN_LARGE = '0425' AND CCN_LEVEL = '5') then 'Y' else 'N' end CHK_CD_YN ";
		sql += " 	FROM (";
		sql += "		SELECT ERI_ITEM_CD, IIM_KNME_NM, IIM_RSLT_KD, ERI_RSLT_KD, ERI_RSLT_VL, ERI_VLDT_LH, ERI_ALSB_PANJ, ERI_SORT_SQ, IIM_SORT_SQ, ";
		sql += "        ERI_RSLT_CD , ERI_RSLT_EX, ERI_RSLT_EX2, ERI_PACS_RSLT, ERI_LOW_KD, ERI_HIGH_KD, ERI_RSLT_LOW, ERI_RSLT_HIGH, ERI_CNCL_YN, ERI_ADD_KD, ERI_TOTAL_KD";
		sql += " 		FROM ET_RSLT_ITEM LEFT OUTER JOIN IT_ITEM";
		sql += " 		ON ERI_ITEM_CD = IIM_ITEM_CD";
		sql += " 		WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 		AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += "	) A";
		sql += " )B";
		sql += " WHERE RSLT_KD <> '9'";
		sql += " AND NVL(ERI_CNCL_YN, 'N') <> 'Y'";

 		if(CHKABNORMAL.equals("1")) {
 			sql += " AND (";
 			sql += "	ERI_ITEM_CD IN (";
 			sql += "		SELECT CCN_SMALL";
			sql += " 		FROM CT_COMMON";
			sql += " 		WHERE CCN_LARGE = '0425'";
			sql += " 		AND CCN_LEVEL = '5'";
			sql += "	)";
			sql += " 	OR NVL(ERI_VLDT_LH, ' ') <> ' '";
			sql += ")";

		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uTotal_Finding_upGetRslt_001 \n";
			G_INFO += "설명 : 결과불러옴 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " CHKABNORMAL : " + CHKABNORMAL + " \n";
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
