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

		String CHUNG_KD = htMethod.get("CHUNG_KD");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_SPYM = htMethod.get("MNGT_SPYM");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(CHUNG_KD == null) { CHUNG_KD = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_SPYM == null) { MNGT_SPYM = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();



		sql = " SELECT EEA_EXAM_DT,EEA_EXAM_SQ,SBE_EXAM_DT, EEA_PSNL_NM,  ";
		sql += " 	CASE WHEN EEA_HDMD_YN='Y'  THEN '1' ELSE '0' END EEA_HDMD_YN, ";
		sql += " 	CASE WHEN EEA_ENTY_CD='9'  THEN '4' ELSE  EEA_ENTY_CD end  EEA_ENTY_CD, ";
		sql += " 	CASE WHEN EEA_SDMD_YN='Y'  THEN '1' ELSE '0' END EEA_SDMD_YN, ";
		sql += " 	CASE WHEN EEA_SPCL_CD='03' THEN '1' ELSE '0' END SLNS, ";
		sql += " 	CASE WHEN EEA_SPCL_CD='07' THEN '1' ELSE '0' END BEPOSTNG, ";
		sql += " 	CASE WHEN EEA_SPCL_CD='05' THEN '1' ELSE '0' END ANYTM, ";
		sql += " 	CASE WHEN EEA_SPCL_CD='04' THEN '1' ELSE '0' END TMPR, ";
		sql += " 	case when EEA_NOTE_YN='Y'  THEN '1' ELSE '0' END HM_PKTBUK_YN , ";
		sql += " 	CASE WHEN EEA_SPCL_CD='08' THEN '1' ELSE '0' END PNUMCN, ";
		sql += " 	EEA_TEL_NO,EEA_MOBL_NO,EEA_EMAIL_AR,EEA_DIVI_NO, ";
		sql += " 	EEA_DIVI_CD ,EEA_ENTRY_DT,SBE_JUIP_DT, ";
		sql += " 	SBE_NCPN_LT,SBE_NCHR_HH,SBE_GOJU_CD,EEA_DEPT_NM,'부서2' AS \"부서2\", EEA_ZIP_CD,EEA_ZIP_AR,EEA_ROAD_AR,ICR_NTNA_CD, ";
		sql += " 	(SELECT Max(CCN_FULL_NM) CCN_FULL_NM FROM CT_COMMON WHERE CCN_LARGE='0808' AND CCN_SMALL=B.SBE_GOJU_CD ) GOJUNM, ";
		sql += " 	SBE_JIJO_CD, ";
		sql += " 	(SELECT Max(CCN_FULL_NM) CCN_FULL_NM FROM CT_COMMON WHERE CCN_LARGE='0807' AND CCN_SMALL=B.SBE_JIJO_CD ) JIJONM, ";
		sql += " 	(select Max(SSM_SYSQ_NM) SSM_SYSQ_NM from ST_SYMPTOM  where SSM_EXAM_DT=A.EEA_EXAM_DT  AND SSM_EXAM_SQ=A.EEA_EXAM_SQ and SSM_SYSQ_CD='2' and  SSM_SYMP_CD='3' )  FAM, ";
		sql += " 	(select Max(SSM_SYSQ_NM) SSM_SYSQ_NM from ST_SYMPTOM  where SSM_EXAM_DT=A.EEA_EXAM_DT  AND SSM_EXAM_SQ=A.EEA_EXAM_SQ and SSM_SYSQ_CD='1' and  SSM_SYMP_CD='3' )  JOB, ";
		sql += " 	(select Max(SSM_SYSQ_NM) SSM_SYSQ_NM from ST_SYMPTOM  where SSM_EXAM_DT=A.EEA_EXAM_DT  AND SSM_EXAM_SQ=A.EEA_EXAM_SQ and SSM_SYSQ_CD='3' and  SSM_SYMP_CD='3' )  SMDR, ";
		sql += " 	CASE WHEN NVL(SBE_DDOC_CD, ' ') <> ' ' THEN'1' ELSE '0' END  DSGR_RQEST_YN, ";
		sql += " 	SBE_SAHU_YN,SBE_REMARK_TX SLNS_REMARK, SBE_SMTM_CD, SBE_BUILD_CD, ";
		sql += " 	CASE WHEN  EEA_SEX_CD='1' then 'M' else 'W' end SEXDSTN ,'' REMARK , EEA_SPCL_PR, ";
		sql += " 	(SELECT CASE WHEN A.EEA_SPHT_CD = '2' THEN SUM(IIP_SBSG_PR) ";
		sql += " 					WHEN A.EEA_SPHT_CD = '1' THEN SUM(IIP_SBSG_PR - IIP_GBSG_PR) ";
		sql += " 			END SLNS_MCCHRG ";
		sql += " 		FROM ET_RSLT_ITEM A2 ";
		sql += " 			LEFT OUTER JOIN IT_ITEM_PRICE B2 ON B2.IIP_APLY_DT = GetITEM_PRICE_ApplyDate(A2.ERI_ITEM_CD, A2.ERI_EXAM_DT, 'ITEM_CD') AND A2.ERI_ITEM_CD = B2.IIP_ITEM_CD ";
		sql += " 		WHERE A2.ERI_EXAM_DT = A.EEA_EXAM_DT and A2.ERI_EXAM_SQ = A.EEA_EXAM_SQ ";
		sql += " 		AND A2.ERI_SPCL_KD = '1' ";
		sql += " 		AND NVL(A2.ERI_CNCL_YN, 'N') <> 'Y' ";
		sql += " 	) SLNS_MCCHRG, ";
		sql += " 	EEA_ORAL_YN, EEA_SPHT_CD ";
		sql += " 	, B.SBE_NOT_REG, B.SBE_SLNS_DELAY, B.SBE_KOSHA_PROVD_YN, B.SBE_INFO_PROVD_YN ";
		sql += " 	, B.SBE_NIGHT_OPERT_CD ";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ST_BASE B      ON A.EEA_EXAM_DT =B.SBE_EXAM_DT AND A.EEA_EXAM_SQ =B.SBE_EXAM_SQ ";
		sql += " 					LEFT OUTER JOIN IT_CUSTOMER C  ON A.EEA_CUST_NO=C.ICR_CUST_NO ";
		sql += " 					LEFT OUTER JOIN IT_COMPANY I   ON A.EEA_COMP_CD=I.ICY_COMP_CD ";
		sql += " 					LEFT OUTER JOIN ST_BILLHN_PR D ON A.EEA_EXAM_DT=D.SBP_EXAM_DT AND A.EEA_EXAM_SQ=D.SBP_EXAM_SQ  AND SBP_CHUNG_KD = '" + CHUNG_KD + "' ";
		sql += " WHERE 0=0 ";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "' AND (A.EEA_EXAM_CD  IN ('41001','42001') OR  A.EEA_SPSB_CD IN ('41001','42001')) ";
   		sql += " AND  SBE_PANJ_YN='Y' AND SBE_EXAM_CHA='1' ";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : Uspchungfile2020_UDP_PER_001 \n";
			G_INFO += "설명 : 특검청구 인적 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHUNG_KD : " + CHUNG_KD + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_SPYM : " + MNGT_SPYM + " \n";
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
