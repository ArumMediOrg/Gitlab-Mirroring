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
		String CMB_PANINDEX = htMethod.get("CMB_PANINDEX");
		String CMB_PANTEXT = htMethod.get("CMB_PANTEXT");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CMB_PANINDEX == null) { CMB_PANINDEX = ""; }
		if(CMB_PANTEXT == null) { CMB_PANTEXT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT PLP_EXAM_DT, PLP_EXAM_SQ, PLP_JLPN_DSCD, PLP_JLPN_PNCD, PLP_JLPN_DOCV, ITEM_CD";

		sql += ", CASE WHEN ITEM_CD = 'A0014' AND NVL(PSP_HIBLOOD_VAL, ' ') <> ' ' THEN";
		sql += "	IIM_SNME_NM || ': 1차:' || ERI_RSLT_VL || ERI_RSLT_UNIT || ', 2차:' || PSP_HIBLOOD_VAL || ERI_RSLT_UNIT";
		sql += " WHEN ITEM_CD = 'A0015' AND NVL(PSP_LIBLOOD_VAL, ' ') <> ' ' THEN";
		sql += " IIM_SNME_NM || ': 1차:' || ERI_RSLT_VL || ERI_RSLT_UNIT || ', 2차:' || PSP_LIBLOOD_VAL || ERI_RSLT_UNIT WHEN ITEM_CD = 'BA014' AND NVL(PSP_RVAL_GLO, ' ') <> ' ' THEN";
		sql += "	IIM_SNME_NM || ': 1차:' || ERI_RSLT_VL || ERI_RSLT_UNIT || ', 2차:' || PSP_RVAL_GLO || ERI_RSLT_UNIT ELSE IIM_SNME_NM || ': ' || ERI_RSLT_VL || NVL(ERI_RSLT_UNIT, ' ')";
		sql += " END AS ERI_RSLT_VL";
		sql += " , CASE WHEN ERI_CNCL_YN = 'Y' THEN '' ELSE ERI_RSLT_VL END AS ERI_RSLT_VL2";
		sql += ", PFP_RESULTR2_1, PFP_RESULTR2_2";
		sql += ", CASE WHEN NVL(";
		sql += "	(";
		sql += "		SELECT JLPN_NAME";
		sql += " 		FROM JLPN_TEMP";
		sql += " 		WHERE PLP_JLPN_SH01 = CODE";
		sql += "	), ' ') <> ' ' THEN";
		sql += "	NVL(";
		sql += "		(";
		sql += "			SELECT JLPN_NAME";
		sql += " 			FROM JLPN_TEMP";
		sql += " 			WHERE PLP_JLPN_SH01 = CODE";
		sql += "		), ' ')";
		sql += "	|| CHR(13)";
		sql += "  ELSE '' END";

		sql += " || CASE WHEN NVL(";
		sql += "	(";
		sql += "		SELECT JLPN_NAME";
		sql += " 		FROM JLPN_TEMP";
		sql += " 		WHERE PLP_JLPN_SH02 = CODE";
		sql += "	), ' ') <> ' '";
		sql += " THEN NVL(";
		sql += "	(";
		sql += "		SELECT JLPN_NAME";
		sql += " 		FROM JLPN_TEMP";
		sql += " 		WHERE PLP_JLPN_SH02 = CODE";
		sql += "	), ' ') || CHR(13) ELSE '' END";
		sql += " || CASE WHEN NVL(";
		sql += "	(";
		sql += "		SELECT JLPN_NAME";
		sql += " 		FROM JLPN_TEMP";
		sql += " 		WHERE PLP_JLPN_SH03 = CODE";
		sql += "	), ' ') <> ' ' THEN";
		sql += " NVL(";
		sql += "	(";
		sql += "		SELECT JLPN_NAME";
		sql += " 		FROM JLPN_TEMP";
		sql += " 		WHERE PLP_JLPN_SH03 = CODE";
		sql += "	), ' ') || CHR(13) ELSE '' END";
		sql += " || NVL(";
		sql += "	PLP_ETC_EX, ' ') AS JLPN_EX";
		sql += ", PLP_JLPN_WORK, PLP_JLPN_TTPN";
		sql += " FROM PT_LABOR_PANJUNG LEFT OUTER JOIN PT_FIR_PANJUNG";
		sql += " ON PFP_EXAM_DT = PLP_EXAM_DT";
		sql += " AND PFP_EXAM_SQ = PLP_EXAM_SQ LEFT OUTER JOIN (SELECT CAST( SUBSTR(CCN_SMALL,1,2) AS INT) AS PACK_CD";
		sql += ", SUBSTR(CCN_SMALL,3,5) AS ITEM_CD, CCN_FULL_NM AS IIM_SNME_NM";
		sql += " FROM CT_COMMON JOIN IT_ITEM";
		sql += " ON IIM_ITEM_CD = SUBSTR(CCN_SMALL,3,5)";
		sql += " WHERE CCN_LARGE = '0423'";
		sql += " AND CCN_LEVEL = '5'";
		sql += " AND CCN_USE_YN = 'Y') C";
		sql += " ON SUBSTR(PLP_JLPN_DSCD,1,1) = C.PACK_CD LEFT OUTER JOIN ET_RSLT_ITEM";
		sql += " ON ERI_EXAM_DT = PLP_EXAM_DT";
		sql += " AND ERI_EXAM_SQ = PLP_EXAM_SQ";
		sql += " AND ERI_ITEM_CD = ITEM_CD LEFT OUTER JOIN PT_SED_PANJUNG";
		sql += " ON PSP_EXAM_DT = PFP_EXAM_DT2";
		sql += " AND PSP_EXAM_SQ = PFP_EXAM_SQ2";
		sql += " WHERE PLP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND PLP_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND NVL(PLP_JLPN_PNCD, ' ') <> ' '";

		if(CMB_PANINDEX.equals("5") || CMB_PANINDEX.equals("6")) {
			if(CMB_PANINDEX.equals("5")) {
				sql += " AND PLP_JLPN_PNCD IN ('C', 'D1', 'D2')";
			}
			else if(CMB_PANINDEX.equals("6")) {
				sql += " AND PLP_JLPN_PNCD IN ('D1', 'D2')";
			}
		}
		else if(!CMB_PANTEXT.equals("")) {
			sql += " AND PLP_JLPN_PNCD = '" + CMB_PANTEXT + "'";
		}

		sql += " ORDER BY PLP_JLPN_DSCD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHEPOSTMANPRT_up_GetDetailData_002 \n";
			G_INFO += "설명 : 상세판정정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " CMB_PANINDEX : " + CMB_PANINDEX + " \n";
			G_INFO += " CMB_PANTEXT : " + CMB_PANTEXT + " \n";
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
