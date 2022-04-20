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

		String FREXAM_DT = htMethod.get("FREXAM_DT");
		String TOEXAM_DT = htMethod.get("TOEXAM_DT");
		String ADD_WHERE = htMethod.get("ADD_WHERE");

		//
		if(FREXAM_DT == null) { FREXAM_DT = ""; }
		if(TOEXAM_DT == null) { TOEXAM_DT = ""; }
		if(ADD_WHERE == null) { ADD_WHERE = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT EEA_HLTH_KD, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM, EEA_PSNL_AGE, EEA_SEX_CD, EEA_CUST_NO, EEA_MOBL_NO , EEA_EXAM_CD, EEA_HTSB_YN, EEA_SPSB_YN, EEA_EMSB_YN, EEA_RSLT_CD, EEA_BLRT_CD, RTRIM(LTRIM(EEA_CHART_NO)) EEA_CHART_NO , EEA_ETSB_CD, EEA_ACPT_TX, EEA_RFID_NO, EEA_EMSB_CD, SUBSTR(EEA_SELF_KD,1,4) EEA_SELF_KD , EEA_CNCR_DT, SUBSTR(EEA_PLCE_CD,1,1) PLCE_CD, EEA_DIVI_CS, EEA_CLSS_KD, EEA_DIVI_NO, EEA_DEPT_NM , EEA_HLTHR_PR, EEA_CANR_PR, EEA_ORALR_PR, EEA_PSNLR_PR, EEA_SPCLR_PR, EEA_MNGT_SPYM, EEA_SPHT_CD, EEA_RSVN_NO , EEA_MODI_ID, EEA_MODI_DTT, EDP_TOBO_DT";
		sql += ", CASE WHEN EEA_STOMA_CD = '7' OR EEA_STOMA_CD = '8' THEN '1' ELSE EEA_STOMA_CD END AS EEA_STOMA_CD";
		sql += ", CASE WHEN EEA_COLON_CD = '7' OR EEA_COLON_CD = '8' THEN '1' ELSE EEA_COLON_CD END AS EEA_COLON_CD";
		sql += ", CASE WHEN EEA_LIVER_CD = '7' OR EEA_LIVER_CD = '8' THEN '1' ELSE EEA_LIVER_CD END AS EEA_LIVER_CD";
		sql += ", CASE WHEN EEA_BAST_CD = '7' OR EEA_BAST_CD = '8' THEN '1' ELSE EEA_BAST_CD END AS EEA_BAST_CD";
		sql += ", CASE WHEN EEA_UTER_CD = '7' OR EEA_UTER_CD = '8' THEN '1' ELSE EEA_UTER_CD END AS EEA_UTER_CD";
		sql += ", CASE WHEN NVL(EEA_LUNG_CD, '0') = '7' OR NVL(EEA_LUNG_CD, '0') = '8' THEN '1' ELSE NVL(EEA_LUNG_CD, '0') END AS EEA_LUNG_CD";
		sql += ", EEA_STOMA_DR, EEA_COLON_DR, EEA_LIVER_DR, EEA_BAST_DR, EEA_UTER_DR, EEA_LUNG_DR , EEA_HTSB_CD, EEA_SPSB_CD, EEA_SPCL_CD, EEA_LIFE_YN, EEA_EXAM_LT , F_EXAM_FIND(EEA_EXAM_LT, EEA_COMP_CD, EEA_EXAM_CD) AS PACK_NM , F_CODE_FIND('0401', EEA_EXAM_CD, '', '1') AS EXAM_NM , F_CODE_FIND('0401', EEA_HTSB_CD, '', '1') AS HTSB_NM , F_CODE_FIND('0401', EEA_SPSB_CD, '', '1') AS SPSB_NM , F_CODE_FIND('0401', EEA_CVSB_CD, '', '1') AS CVSB_NM , F_CODE_FIND('0401', EEA_EMSB_CD, '', '1') AS EMSB_NM , F_CODE_FIND('0401', EEA_ETSB_CD, '', '1') AS ETSB_NM";
		sql += ", CASE WHEN EEA_SEX_CD = '1' THEN '남' WHEN EEA_SEX_CD = '2' THEN '여' END AS EEA_SEX_NM";
		sql += ", EEA_HDMD_YN, EEA_SDMD_YN, EEA_COMP_CD, EEA_MNGT_HTYR, ICR_PENL_ID , ICR_PID_EN, SUBSTR(ICR_PENL_ID,1,6) AS EEA_BIRTH_DT";
		sql += ", (SELECT ICY_COMP_NM FROM IT_COMPANY WHERE ICY_COMP_CD = EEA_COMP_CD ) AS ICY_COMP_NM";
		sql += ", SSV_CFRM_CD, ICR_BIRH_DT, ICR_MOBL_NO, ICR_TEL_NO, ICR_INFO_YN , ECH_CFRM_CD, ECH_MODI_ID, ECH_MODI_DTT";
		sql += ", (SELECT ERI_RSLT_VL FROM ET_RSLT_ITEM WHERE ERI_EXAM_DT = EEA_EXAM_DT AND ERI_EXAM_SQ = EEA_EXAM_SQ AND ERI_ITEM_CD = 'F0002' AND ERI_CNCL_YN = 'N' ) AS ERI_F0002_NO";
		sql += ", (SELECT ERI_ITEM_CD FROM ET_RSLT_ITEM WHERE ERI_EXAM_DT = EEA_EXAM_DT AND ERI_EXAM_SQ = EEA_EXAM_SQ AND ERI_ITEM_CD = 'M0020' AND ERI_CNCL_YN = 'N' ) AS DNTL_CD";
		sql += ", EEA_ORAL_YN, EEA_RECE_NO";
		sql += ", CASE WHEN (SELECT COUNT(*) FROM ET_PSNL_MEMO WHERE EPM_CUST_NO = EEA_CUST_NO) > 0 THEN 'Y' ELSE 'N' END AS ET_PSNL_MEMO";
		sql += ", PFP_FIX_YN, PFP_EXAM_DT2, PFP_EXAM_SQ2, PSP_FIX_YN";
		sql += ", CASE WHEN NVL(PFP_TRANC_DATE, '1900-01-01') = '1900-01-01' THEN 'N' ELSE 'Y' END AS PFP_PRNT_YN";
		sql += ", CASE WHEN NVL(BBP_CHUNG_KD, '1900-01-01') = '1900-01-01' THEN 'N' ELSE 'Y' END AS BBP_CHNG_YN";
		sql += ", CASE WHEN (EEA_EXAM_CD IN ('11001', '12001', '12003')) OR (EEA_HTSB_CD IN ('11001', '12001', '12003')) THEN 'Y' END AS EEA_FRST_YN";
		sql += ", (SELECT COUNT(*) FROM ET_RSLT_ITEM WHERE ERI_EXAM_DT = EEA_EXAM_DT AND ERI_EXAM_SQ = EEA_EXAM_SQ AND ERI_ITEM_CD IN ('N0045', 'N0046') ) AS TFINDING";
		sql += ", CASE WHEN SSV_EXAM_DT IS NULL THEN 'N' ELSE 'Y' END SSV_YN";
		sql += ", CASE WHEN ECH_EXAM_DT IS NULL THEN 'N' ELSE 'Y' END ECH_YN";
		sql += ", CASE WHEN NVL(PFP_PANRETRD, '0') = '1' THEN 'RD' WHEN NVL(PFP_PANRETR2, '0') = '1' THEN 'R2' WHEN NVL(PFP_PANRETR1, '0') = '1' THEN 'R1' WHEN NVL(PFP_PANRETB, '0') = '1' THEN 'B' WHEN NVL(PFP_PANRETA, '0') = '1' THEN 'A' END PFP_PAN, PFP_DOCTORQQN, EEA_QTRT_CD, EEA_FSTPAN_REQ, EEA_CANPAN_REQ, NVL(EEA_RSLT_INPUT,'0000000000')  EEA_RSLT_INPUT, SSV_RSLT_INPUT, EDP_PANJ_YN ";
		sql += " FROM ET_EXAM_ACPT JOIN IT_CUSTOMER";
		sql += " ON ICR_CUST_NO = EEA_CUST_NO";

		sql += " LEFT OUTER JOIN ST_SYTH_VIEW";
		sql += " ON EEA_EXAM_DT = SSV_EXAM_DT";
		sql += " AND EEA_EXAM_SQ = SSV_EXAM_SQ";

		sql += " LEFT OUTER JOIN ET_CANCER_HEADER";
		sql += " ON EEA_EXAM_DT = ECH_EXAM_DT";
		sql += " AND EEA_EXAM_SQ = ECH_EXAM_SQ";

		sql += " LEFT OUTER JOIN PT_FIR_PANJUNG";
		sql += " ON EEA_EXAM_DT = PFP_EXAM_DT";
		sql += " AND EEA_EXAM_SQ = PFP_EXAM_SQ";

		sql += " LEFT OUTER JOIN PT_SED_PANJUNG";
		sql += " ON EEA_EXAM_DT = PSP_EXAM_DT";
		sql += " AND EEA_EXAM_SQ = PSP_EXAM_SQ";

		sql += " LEFT OUTER JOIN ET_DENTAL_PANJ";
		sql += " ON EEA_EXAM_DT = EDP_EXAM_DT";
		sql += " AND EEA_EXAM_SQ = EDP_EXAM_SQ";

		sql += " LEFT OUTER JOIN BT_BILLHN_PR";
		sql += " ON BBP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND BBP_EXAM_SQ = EEA_EXAM_SQ";
		sql += " AND SUBSTR(BBP_CHUNG_KD, 1, 1) = '1'";
		sql += " AND BBP_RETURN_KD = '0'";

		sql += " LEFT OUTER JOIN ST_BASE";
		sql += " ON EEA_EXAM_DT = SBE_EXAM_DT";
		sql += " AND EEA_EXAM_SQ = SBE_EXAM_SQ";


		sql += " WHERE EEA_EXAM_DT BETWEEN '" + FREXAM_DT + "'";
		sql += " AND '" + TOEXAM_DT + "'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += ADD_WHERE;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Result_upGetRcpt_001 \n";
			G_INFO += "설명 : 검진결과 조회 MAIN \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " FREXAM_DT : " + FREXAM_DT + " \n";
			G_INFO += " TOEXAM_DT : " + TOEXAM_DT + " \n";
			G_INFO += " ADD_WHERE : " + ADD_WHERE + " \n";
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
