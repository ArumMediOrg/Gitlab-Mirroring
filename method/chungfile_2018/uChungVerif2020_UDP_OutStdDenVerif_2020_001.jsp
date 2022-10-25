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
		String SSQL_ADD1 = htMethod.get("SSQL_ADD1");
		String SSQL_ADD2 = htMethod.get("SSQL_ADD2");

		//
		if(DTEFROMDT == null) { DTEFROMDT = ""; }
		if(DTETODT == null) { DTETODT = ""; }
		if(CMBCHUNGYYYY == null) { CMBCHUNGYYYY = ""; }
		if(SSQL_ADD1 == null) { SSQL_ADD1 = ""; }
		if(SSQL_ADD2 == null) { SSQL_ADD2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT EEA_EXAM_DT,EEA_EXAM_SQ, EEA_PSNL_NM, EEA_HLTHR_PR,EEA_CNTR_CD,EEA_MNGT_HTYR,EEA_SEND_CD,ICR_PID_EN,ICR_PENL_ID,EEA_INSU_NO,J0001,J0001_1,J0001_2, J0004,J0004_1,J0004_2,J0003,J0003_1,J0003_2,J0022,J0009,J0021,J0021_1, J0012,J0012_1,J0002,J0002_1,J0002_2,J0005,J0005_1,J0011,J0008, ESO_OIFRM_DT, ESO_OPNJN_DT, ESO_PNJN_ORAL, ESO_ORAL_VIEW, ESO_ORAL_ACT, ESO_EXAM_DT, EEA_PLCE_CD, IAU_LICEN1_NO, IAU_PENL_NM, IAU_PENL_ID, ICR_INFO_YN,INFODT,ENDGBN";
		sql += " FROM (";
		sql += "	SELECT ERI_EXAM_DT, EEA_HLTHR_PR, F_RPAD(NVL(EEA_CNTR_CD,' '),11,' ') EEA_CNTR_CD, ERI_EXAM_SQ, EEA_MNGT_HTYR, ICR_PID_EN, ICR_PENL_ID, F_RPAD(NVL(EEA_INSU_NO,' '),11,' ') EEA_INSU_NO, MAX(J0001) J0001, MAX(J0001_1) J0001_1, MAX(J0001_2) J0001_2, MAX(J0004) J0004, MAX(J0004_1) J0004_1, MAX(J0004_2) J0004_2, MAX(J0003) J0003, MAX(J0003_1) J0003_1, MAX(J0003_2) J0003_2, MAX(J0022) J0022, MAX(J0009) J0009, MAX(J0021) J0021, MAX(J0021_1) J0021_1, MAX(J0012 ) J0012, MAX(J0012_1) J0012_1, MAX(J0002) J0002, MAX(J0002_1) J0002_1, MAX(J0002_2) J0002_2, MAX(J0005) J0005, MAX(J0005_1) J0005_1, MAX(J0011) J0011, MAX(J0008) J0008";
		sql += " 	FROM (";
		sql += "		SELECT ERI_EXAM_DT, ERI_EXAM_SQ, EEA_MNGT_HTYR, ICR_PID_EN, NVL(ICR_PENL_ID ,' ') ICR_PENL_ID, EEA_INSU_NO, NVL(EEA_ORALR_PR,0) EEA_HLTHR_PR, EEA_CNTR_CD";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0001' THEN ERI_HERT_CD END J0001";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0001' THEN ERI_PRCH_VL END J0001_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0001' THEN ERI_PRNM_VL END J0001_2";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0004' THEN ERI_HERT_CD END J0004";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0004' THEN ERI_PRCH_VL END J0004_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0004' THEN ERI_PRNM_VL END J0004_2";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0003' THEN ERI_HERT_CD END J0003";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0003' THEN ERI_PRCH_VL END J0003_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0003' THEN ERI_PRNM_VL END J0003_2";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0022' THEN ERI_HERT_CD END J0022";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0009' THEN ERI_HERT_CD END J0009";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0021' THEN ERI_HERT_CD END J0021";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0021' THEN ERI_RSLT_VL END J0021_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0012' THEN ERI_HERT_CD END J0012";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0012' THEN ERI_RSLT_VL END J0012_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0002' THEN SUBSTR(ERI_HERT_CD,1,1) END J0002";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0002' THEN SUBSTR(ERI_HERT_CD,2,1) END J0002_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0002' THEN ERI_RSLT_VL END J0002_2";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0005' THEN ERI_HERT_CD END J0005";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0005' THEN ERI_RSLT_VL END J0005_1";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0011' THEN ERI_HERT_CD END J0011";
		sql += "		, CASE WHEN ERI_ITEM_CD='J0008' THEN ERI_HERT_CD END J0008";
		sql += " 		FROM ET_RSLT_ITEM A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " 		ON A.ERI_EXAM_DT=B.EEA_EXAM_DT";
		sql += " 		AND A.ERI_EXAM_SQ=B.EEA_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER D";
		sql += " 		ON B.EEA_CUST_NO=D.ICR_CUST_NO LEFT OUTER JOIN BT_BILLHN_PR E";
		sql += " 		ON B.EEA_EXAM_DT=E.BBP_EXAM_DT";
		sql += " 		AND B.EEA_EXAM_SQ=E.BBP_EXAM_SQ";
		sql += " 		AND BBP_CHUNG_KD='52'";
		sql += " 		WHERE EEA_EXAM_DT>= '" + DTEFROMDT + "'";
		sql += " 		AND EEA_EXAM_DT<= '" + DTETODT + "'";
		sql += " 		AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " 		AND EEA_MNGT_HTYR= '" + CMBCHUNGYYYY + "'";
		sql += " 		AND EEA_EXAM_CD IN('31006')";
		sql += " 		AND EEA_HDMD_YN='Y'";
		sql += " 		AND EEA_ORDER_YN<>'C'";
		sql += " 		AND ERI_CNCL_YN <>'Y'";
		sql += SSQL_ADD1;
		sql += "	) FFF";
		sql += " 	GROUP BY ERI_EXAM_DT, ERI_EXAM_SQ,EEA_MNGT_HTYR,ICR_PID_EN,ICR_PENL_ID,EEA_INSU_NO,EEA_HLTHR_PR ,EEA_CNTR_CD";
		sql += " ) AAA RIGHT OUTER JOIN (";
		sql += "	SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM, EEA_SEND_CD, ESO_PNJN_ORAL, ESO_OIFRM_DT, ESO_OPNJN_DT, F_RPAD(NVL(ESO_ORAL_VIEW,' '),500,' ') ESO_ORAL_VIEW, F_RPAD(NVL(ESO_ORAL_ACT, ' '),500,' ') ESO_ORAL_ACT, REPLACE(ESO_EXAM_DT,'-','') ESO_EXAM_DT, NVL(CASE WHEN SUBSTR(EEA_PLCE_CD,1,1)='1' THEN '2' ELSE '1' END, ' ') EEA_PLCE_CD, NVL(REPLACE(ESO_EIFRM_DT,'-',''),' ') ESO_EIFRM_DT, NVL((IAU_LICEN1_NO),' ') IAU_LICEN1_NO, NVL((IAU_PENL_NM),' ') IAU_PENL_NM, NVL((IAU_PENL_ID),' ') IAU_PENL_ID, ICR_INFO_YN, NVL(REPLACE(EEA_EXAM_DT,'-',''),' ') INFODT, 'E' ENDGBN";
		sql += " 	FROM ET_STDT_PNJNO A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " 	ON A.ESO_EXAM_DT=B.EEA_EXAM_DT";
		sql += " 	AND A.ESO_EXAM_SQ=B.EEA_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER C";
		sql += " 	ON B.EEA_CUST_NO=C.ICR_CUST_NO LEFT OUTER JOIN IT_AUTH_USER D";
		sql += " 	ON A.ESO_ORAL_DR =D.IAU_EMP_NO LEFT OUTER JOIN BT_BILLHN_PR E";
		sql += " 	ON B.EEA_EXAM_DT=E.BBP_EXAM_DT";
		sql += " 	AND B.EEA_EXAM_SQ=E.BBP_EXAM_SQ";
		sql += " 	AND BBP_CHUNG_KD='52'";
		sql += " 	WHERE EEA_EXAM_DT>= '" + DTEFROMDT + "'";
		sql += " 	AND EEA_EXAM_DT<= '" + DTETODT + "'";
		sql += " 	AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " 	AND EEA_ORAL_YN='Y'";
		sql += " 	AND EEA_HDMD_YN='Y'";
		sql += " 	AND EEA_ORDER_YN<>'C'";
		sql += " 	AND EEA_MNGT_HTYR= '" + CMBCHUNGYYYY + "'";
		sql += " 	AND ESO_OPNJN_YN='Y'";
		sql += SSQL_ADD2;
		sql += " ) BBB";
		sql += " ON AAA.ERI_EXAM_DT=BBB.EEA_EXAM_DT";
		sql += " AND AAA.ERI_EXAM_SQ =BBB.EEA_EXAM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChungVerif2020_UDP_OutStdDenVerif_2020_001 \n";
			G_INFO += "설명 : 학교밖(구강) 성적확인 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEFROMDT : " + DTEFROMDT + " \n";
			G_INFO += " DTETODT : " + DTETODT + " \n";
			G_INFO += " CMBCHUNGYYYY : " + CMBCHUNGYYYY + " \n";
			G_INFO += " SSQL_ADD1 : " + SSQL_ADD1 + " \n";
			G_INFO += " SSQL_ADD2 : " + SSQL_ADD2 + " \n";
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
