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

		String SSORT = htMethod.get("SSORT");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String CHKVIEWFRST = htMethod.get("CHKVIEWFRST");
		String SSQLADD = htMethod.get("SSQLADD");

		//
		if(SSORT == null) { SSORT = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CHKVIEWFRST == null) { CHKVIEWFRST = ""; }
		if(SSQLADD == null) { SSQLADD = ""; }

		// DB객체
		stmtList = connect.createStatement();



		sql = " SELECT ROW_NUMBER() OVER (";
		sql += " ORDER BY " + SSORT + " ) AS ORD_NO , G2.*";
		sql += " FROM ( SELECT G1.* , CASE WHEN NVL(ERI_VLSV_YN, ' ') = ' ' THEN RLOW WHEN NVL(ERI_RSLT_LOW, ' ') = ' ' THEN RLOW ELSE ERI_RSLT_LOW END AS RSLT_LOW , CASE WHEN NVL(ERI_VLSV_YN, ' ') = ' ' THEN RHIGH WHEN NVL(ERI_RSLT_HIGH, ' ') = ' ' THEN RHIGH ELSE ERI_RSLT_HIGH END AS RSLT_HIGH , CASE WHEN NVL(ERI_VLSV_YN, ' ') = ' ' THEN RUNIT WHEN NVL(ERI_RSLT_UNIT, ' ') = ' ' THEN RUNIT ELSE ERI_RSLT_UNIT END AS RSLT_UNIT , CASE WHEN NVL(ERI_VLSV_YN, ' ') = ' ' THEN IIM_RSLT_KD WHEN NVL(ERI_RSLT_KD, ' ') = ' ' THEN IIM_RSLT_KD ELSE ERI_RSLT_KD END AS RSLT_KD , CASE WHEN NVL(ERI_VLSV_YN, ' ') = ' ' THEN LOWKD WHEN NVL(ERI_LOW_KD, ' ') = ' ' THEN LOWKD ELSE ERI_LOW_KD END AS LOW_KD , CASE WHEN NVL(ERI_VLSV_YN, ' ') = ' ' THEN HIGHKD WHEN NVL(ERI_HIGH_KD, ' ') = ' ' THEN HIGHKD ELSE ERI_HIGH_KD END AS HIGH_KD , CASE WHEN NVL(ERI_RSZR_KD, ' ') = ' ' THEN RSZR_KD WHEN NVL(ERI_RSZR_KD, ' ') = ' ' THEN RSZR_KD ELSE ERI_RSZR_KD END AS RSZR";
		sql += " FROM ( SELECT *";
		sql += " FROM ( SELECT ERI_EXAM_DT, EEA_PSNL_NM, EEA_SEX_CD, EEA_PSNL_AGE, ERI_VLSV_YN, ERI_UNIT_CD, ERI_HERT_CD, ERI_SPRT_CD , ERI_ITEM_CD, IIM_KNME_NM, IIM_RSLT_KD, IIM_EXGN_CD, IIM_SORT_SQ, IIM_SUTK_YN, ERI_HUNIT_CD, ERI_RSLT_LOW, ERI_RSLT_HIGH , ERI_VLDT_LH, ERI_RSLT_KD, ERI_RSLT_VL, IIM_ACAL_YN, ERI_RSLT_UNIT, ERI_LOW_KD, ERI_HIGH_KD, ERI_RSZR_KD, IIM_DFLT_VL , ERI_ALSB_PANJ, ERI_HTSB_PANJ, ERI_WOSB_PANJ, ERI_SPSB_PANJ, ERI_EMSB_PANJ, ERI_STSB_PANJ, IIM_PNUM_CD , NVL(ERI_SORT_SQ, 999) AS ERI_SORT_SQ , ERI_PRCH_VL, ERI_PRNM_VL, EEA_EXAM_CD, IIM_BLPT_CD, IIM_MIN_VL, IIM_MAX_VL, IIR_RSLT_CD , (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0401'";
		sql += " AND CCN_SMALL = EEA_EXAM_CD";
		sql += " AND CCN_LEVEL = '5') AS EXAM_NM , GETBFR_RSLT(ERI_ITEM_CD, EEA_CUST_NO, ERI_EXAM_DT) AS BFRRSLT , ";
		sql += " CASE WHEN ERI_TOTAL_KD > 0 THEN '1' WHEN ERI_HLTH_KD > 0 THEN '2' WHEN ERI_SPCL_KD > 0 THEN '4' WHEN ERI_EMPY_KD > 0 THEN '5' WHEN ERI_STDT_KD > 0 THEN '6' ELSE '1' END AS VLDT_KD, ";
		sql += " ERI_HLTH_KD, ERI_OCS_VL, ERI_TOTAL_KD, ERI_STDT_KD, ERI_EMPY_KD, ERI_SPCL_KD, ERI_ETC_KD, ERI_ADD_KD, IIM_SBCD_CD ";
		sql += " FROM ET_RSLT_ITEM LEFT OUTER JOIN ET_EXAM_ACPT";
		sql += " ON ERI_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ERI_EXAM_SQ = EEA_EXAM_SQ LEFT OUTER JOIN IT_ITEM";
		sql += " ON ERI_ITEM_CD = IIM_ITEM_CD LEFT OUTER JOIN IT_ITEM_RESULT";
		sql += " ON ERI_ITEM_CD = IIR_ITEM_CD";
		sql += " AND IIR_RSLT_KD = '2'";
		sql += " AND NVL(IIR_RSLT_VL, ' ') <> ' '";
		sql += " AND IIM_DFLT_VL = IIR_RSLT_VL";
		sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND NVL(ERI_CNCL_YN, 'N') <> 'Y' ) A LEFT OUTER JOIN TABLE(GETITEMVLDTTABLE_PKG.GETITEMVLDTTABLE(A.ERI_ITEM_CD, A.EEA_SEX_CD, A.EEA_PSNL_AGE, A.ERI_EXAM_DT, A.VLDT_KD)) B";
		sql += " ON B.ITEM_CD = A.ERI_ITEM_CD ) G1 ) G2";
		sql += " WHERE RSLT_KD IN ('1', '2', '4', '5', '7' )";

		if(CHKVIEWFRST.equals("1")) {
			sql += " AND NVL(ERI_HLTH_KD,' ') >= '1'";
		}

		if(!SSQLADD.equals("")){
			sql += SSQLADD;
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBld_Rslt_upGetBldRslt_001 \n";
			G_INFO += "설명 : 혈액결과 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSORT : " + SSORT + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " CHKVIEWFRST : " + CHKVIEWFRST + " \n";
			G_INFO += " SSQLADD : " + SSQLADD + " \n";
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
