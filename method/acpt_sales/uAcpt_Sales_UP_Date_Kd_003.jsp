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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_ACPT_CD, A.EEA_PLCE_CD, A.EEA_SEX_CD, A.EEA_PSNL_AGE, ";
		sql += " 	CASE WHEN SUBSTR(A.EEA_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(A.EEA_EXAM_LT, '') ";
		sql += " 			WHEN SUBSTR(A.EEA_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(A.EEA_EXAM_LT, A.EEA_COMP_CD) ";
		sql += " 			ELSE CASE WHEN A.EEA_RECE_NO = 'R' THEN F_CODE_FIND('0401', SUBSTR(A.EEA_EXAM_CD, 1, 2) || '000', '', '1') || '-자료이관' ";
		sql += " 					ELSE F_CODE_FIND('0401', A.EEA_EXAM_CD, '', '1') END END || ";
		sql += " 	CASE WHEN A.EEA_EXAM_CD = '31001' THEN CASE WHEN A.EEA_DIVI_CD = '1' THEN '-초-' || A.EEA_DIVI_CS ";
		sql += " 												WHEN A.EEA_DIVI_CD = '2' THEN '-중' ";
		sql += " 												WHEN A.EEA_DIVI_CD = '3' THEN '-고' END ";
		sql += " 			WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) = '4'  THEN '('||F_CODE_FIND('0910', A.EEA_SPCL_CD, '', '1')||')' ";
		sql += " 												ELSE '' END AS EEA_EXAM_NM, ";
		sql += " 	CASE WHEN UPPER(A.EEA_HTSB_YN) = 'Y' THEN ";
		sql += " 			CASE WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '11' THEN CASE WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '1' THEN '일검' ";
		sql += " 																WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '3' THEN '일검' ";
		sql += " 																ELSE '일검2' END ";
		sql += " 				WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '12' THEN CASE WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '1' THEN '생애' ";
		sql += " 																WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '3' THEN '생애' ";
		sql += " 																ELSE '생애2' END ";
		sql += " 				WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '13' THEN '암' ";
		sql += " 				WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '14' THEN '구강' END ELSE '' END AS EEA_HTSB_OX, ";
		sql += " 	A.EEA_STOMA_CD||A.EEA_COLON_CD||A.EEA_LIVER_CD||A.EEA_BAST_CD||A.EEA_UTER_CD||NVL(A.EEA_LUNG_CD, '0') EEA_CAN_CD, ";
		sql += " 	CASE WHEN NVL(A.EEA_STOMA_CD, ' ') = ' ' OR NVL(A.EEA_STOMA_CD, '0') = '0' THEN '' ELSE '위' END EEA_STOMA_CT, ";
		sql += " 	CASE WHEN NVL(A.EEA_COLON_CD, ' ') = ' ' OR NVL(A.EEA_COLON_CD, '0') = '0' THEN '' ELSE '대' END EEA_COLON_CT, ";
		sql += " 	CASE WHEN NVL(A.EEA_LIVER_CD, ' ') = ' ' OR NVL(A.EEA_LIVER_CD, '0') = '0' THEN '' ELSE '간' END EEA_LIVER_CT, ";
		sql += " 	CASE WHEN NVL(A.EEA_BAST_CD,  ' ') = ' ' OR NVL(A.EEA_BAST_CD,  '0') = '0' THEN '' ELSE '유' END EEA_BAST_CT, ";
		sql += " 	CASE WHEN NVL(A.EEA_UTER_CD,  ' ') = ' ' OR NVL(A.EEA_UTER_CD,  '0') = '0' THEN '' ELSE '자' END EEA_UTER_CT, ";
		sql += " 	CASE WHEN NVL(A.EEA_LUNG_CD,  ' ') = ' ' OR NVL(A.EEA_LUNG_CD,  '0') = '0' THEN '' ELSE '폐' END EEA_LUNG_CT, ";
		sql += " 	CASE WHEN UPPER(A.EEA_ORAL_YN) = 'Y' AND UPPER(A.EEA_HDMD_YN) = 'Y' THEN '구강' WHEN A.EEA_ORAL_YN  = '1' THEN '구강' ";
		sql += " 			WHEN       A.EEA_ORAL_YN  = '3' THEN '구강' ELSE '' END AS EEA_ORAL_OX, ";
		sql += " 	CASE WHEN UPPER(A.EEA_SPSB_YN) = 'Y' THEN F_CODE_FIND('0910', A.EEA_SPCL_CD, '', '1') ELSE '' END AS EEA_SPSB_OX, ";
		sql += " 	CASE WHEN UPPER(A.EEA_CVSB_YN) = 'Y' THEN '뇌심' ELSE '' END AS EEA_CVSB_OX, ";
		sql += " 	CASE WHEN UPPER(A.EEA_EMSB_YN) = 'Y' THEN '채용' ELSE '' END AS EEA_EMSB_OX, ";
		sql += " 	CASE WHEN UPPER(A.EEA_ETSB_YN) = 'Y' THEN '기타' ELSE '' END AS EEA_ETSB_OX, ";
		sql += " 	F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, ";
		sql += " 	F_CODE_FIND('0902', A.EEA_PLCE_CD,   '', '1') EEA_PLCE_NM, ";
		sql += " 	F_CODE_FIND('0703', B.ICR_NTNA_CD,   '', '1') EEA_NTNA_NM, ";
		sql += " 	F_CODE_FIND('0723', B.ICR_REGION_CD, '', '1') EEA_REGN_NM, ";
		sql += " 	F_CODE_FIND('0989', A.EEA_DISC_RC,   '', '1') EEA_DISC_NM, A.EEA_DISC_RT, A.EEA_DISC_CD, ";
		sql += " 	A.EEA_PSNLR_PR+A.EEA_COMPR_PR+A.EEA_HLTHR_PR+A.EEA_SPCLR_PR EXAM_APR, ";
		sql += " 	CASE WHEN A.EEA_EXAM_CD = '31001' THEN 0 ELSE A.EEA_PSNLR_PR END AS PSNL_APR, ";
		sql += " 	CASE WHEN A.EEA_EXAM_CD = '31001' THEN A.EEA_COMPR_PR+A.EEA_PSNLR_PR ELSE A.EEA_COMPR_PR END AS COMP_APR, ";
		sql += " 	A.EEA_HLTHR_PR HLTH_APR, A.EEA_SPCLR_PR SPCL_APR, A.EEA_DISC_PR DISC_APR, A.EEA_DISC_CPR DISC_ACPR, ";
		sql += " 	C.TOTAL_PR EXAM_PR, ";
		sql += " 	CASE WHEN A.EEA_EXAM_CD = '31001' THEN 0 ELSE C.PSNL_PR END AS PSNL_PR, ";
		sql += " 	CASE WHEN A.EEA_EXAM_CD = '31001' THEN C.COMP_PR+C.PSNL_PR ELSE C.COMP_PR END AS COMP_PR, ";
		sql += " 	C.HDMD_PR HLTH_PR, C.SDMD_PR SPCL_PR, ";
		sql += " 	C.DISC_PR DISC_PR, C.DISC_CPR DISC_CPR ";
		sql += " FROM (SELECT EEP_EXAM_DT, EEP_EXAM_SQ, ";
		sql += " 			CASE WHEN MIN(EEP_ORDER_SQ) = '1' THEN 1 ELSE 0 END INSU, ";
		sql += " 			CASE WHEN MIN(EEP_ORDER_SQ) = '1' THEN 1 ELSE 0 END CNT, ";
		sql += " 			SUM(EEP_HDMD_PR) HDMD_PR, ";
		sql += " 			SUM(EEP_SDMD_PR) SDMD_PR, ";
		sql += " 			SUM(EEP_COMP_PR+EEP_COMPS_PR) COMP_PR, ";
		sql += " 			SUM(EEP_COMP_PR) COMP_CPR, ";
		sql += " 			SUM(EEP_COMPS_PR) COMP_SPR, ";
		sql += " 			SUM(EEP_PSNL_PR+EEP_PSNLP_PR) PSNL_PR, ";
		sql += " 			SUM(EEP_HDMD_PR+EEP_SDMD_PR+EEP_COMPS_PR+EEP_COMP_PR+EEP_PSNL_PR+EEP_PSNLP_PR) TOTAL_PR, ";
		sql += " 			SUM(NVL(EEP_DISC_PR, 0)) DISC_PR, ";
		sql += " 			SUM(NVL(EEP_DISC_CPR, 0)) DISC_CPR ";
		sql += " 		FROM ET_EXAM_PRICE ";
		sql += " WHERE EEP_ORDER_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += " 		GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ";
		sql += " 	) C, ET_EXAM_ACPT A ";
		sql += " LEFT OUTER JOIN IT_CUSTOMER B ";
		sql += " 	ON B.ICR_CUST_NO = A.EEA_CUST_NO ";
		sql += " WHERE A.EEA_EXAM_DT = C.EEP_EXAM_DT ";
		sql += " AND A.EEA_EXAM_SQ = C.EEP_EXAM_SQ ";
		sql += " AND EEA_ORDER_YN <> 'C' ";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R' ";

		sql += PARAM_TX;

		sql += " ORDER BY EEA_EXAM_DT, EEA_EXAM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_Sales_UP_Date_Kd_003 \n";
			G_INFO += "설명 : 검진일자별 상세 현황(처리일자 기준) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
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
