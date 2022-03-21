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

		String SSQLORDERBYADD = htMethod.get("SSQLORDERBYADD");
		String SFROMDT = htMethod.get("SFROMDT");
		String STODT = htMethod.get("STODT");
		String SCOMPCD = htMethod.get("SCOMPCD");
		String SSQLWHEREADD = htMethod.get("SSQLWHEREADD");
		String CK_CHUNG_CRT = htMethod.get("CK_CHUNG_CRT");
		String SCHUNGBN = htMethod.get("SCHUNGBN");
		String SSQLADDSQL = htMethod.get("SSQLADDSQL");

		//
		if(SSQLORDERBYADD == null) { SSQLORDERBYADD = ""; }
		if(SFROMDT == null) { SFROMDT = ""; }
		if(STODT == null) { STODT = ""; }
		if(SCOMPCD == null) { SCOMPCD = ""; }
		if(SSQLWHEREADD == null) { SSQLWHEREADD = ""; }
		if(CK_CHUNG_CRT == null) { CK_CHUNG_CRT = ""; }
		if(SCHUNGBN == null) { SCHUNGBN = ""; }
		if(SSQLADDSQL == null) { SSQLADDSQL = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT  row_number() over (" + SSQLORDERBYADD + ") Row_num, EEA_COMP_CD, EEA_EXAM_CD, EEA_CHART_NO, ";
		sql += " 		CASE WHEN CHUNGGB ='특검' THEN ";
		sql += " 			case when EEA_SPHT_CD = '1' then '일특' else '특검' end || ";
		sql += " 			case when EEA_EXAM_CD = '41001' then '1차' ";
		sql += " 				when EEA_EXAM_CD = '42001' then '2차' ";
		sql += " 				when EEA_SPSB_CD = '41001' then '1차' ";
		sql += " 				when EEA_SPSB_CD = '42001' then '2차' ";
		sql += " 			end || ";
		sql += " 			case when EEA_SPCL_CD = '03' then '(특수)' ";
		sql += " 				when EEA_SPCL_CD = '04' then '(임시)' ";
		sql += " 				when EEA_SPCL_CD = '05' then '(수시)' ";
		sql += " 				when EEA_SPCL_CD = '07' then '(배치)' ";
		sql += " 				when EEA_SPCL_CD = '10' then '(소방)' ";
		sql += " 			end ";
		sql += " 		WHEN EEA_EXAM_CD IN('11001','12001','12003') THEN '일검1차' ";
		sql += " 		WHEN EEA_EXAM_CD IN('11002','12002','12004') THEN '일검2차' ";
		sql += " 		WHEN EEA_EXAM_CD ='31001' THEN '학생검진' ";
		sql += " 		ELSE (SELECT CCN_FULL_NM FROM CT_COMMON WHERE CCN_LARGE='0401' AND CCN_SMALL= EEA_EXAM_CD) END EEA_EXAM_NM, ";
		sql += " 		ICY_COMP_NM, EEA_DEPT_NM, ";
		sql += " 		EEA_CUST_NO, ";
		sql += " 		(select ICR_DIVI_NO from IT_CUSTOMER where ICR_CUST_NO = EEA_CUST_NO) ICR_DIVI_NO, ";
		sql += " 		EEA_PSNL_NM, ";
		sql += " 		(select CCN_FULL_NM from ct_common where ccn_large='0919' and CCN_SMALL= EEA_FAMY_CD) EEA_FAMY_CD, ";
		sql += " 		CASE WHEN EEA_FAMY_CD = '01' THEN '' ELSE EEA_FAMY_NM END EEA_FAMY_NM, ";
		sql += " 		IAU_PENL_NM , EEA_EXAM_DT, EEA_EXAM_SQ, ICR_PENL_ID, ";
		sql += " 		CHUNGGB,  SUM(EEA_DISC_CPR) EEA_DISC_CPR, ";
		sql += " 		SUM(CHUNGAMT)  CHUNGAMT , sum(NVL(EEP_PSNL_PR, 0)) EEP_PSNL_PR, ICR_PID_EN ";
		sql += " FROM ( ";
		sql += " 	SELECT EEA_COMP_CD, EEA_EXAM_CD, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_CD, EEA_CHART_NO, ";
		sql += " 			ICY_COMP_NM,  EEA_DEPT_NM, ";
		sql += " 			EEA_CUST_NO, ";
		sql += " 			EEA_PSNL_NM, EEA_FAMY_CD,  EEA_FAMY_NM, ";
		sql += " 			IAU_PENL_NM ,  EEA_EXAM_DT, EEA_EXAM_SQ, ICR_PENL_ID, ICR_PID_EN, ";
		sql += " 			CASE ";
		sql += " 			WHEN CHUNGGB IN('일반','학생') ";
		sql += " 			THEN EEP_CDMD_DT ";
		sql += " 			ELSE NULL ";
		sql += " 			END EEP_CDMD_DT, ";
		sql += " 			CASE ";
		sql += " 			WHEN CHUNGGB='특검' ";
		sql += " 			THEN EEP_CDMDS_DT ";
		sql += " 			ELSE NULL ";
		sql += " 			END EEP_CDMDS_DT, ";
		sql += " 			CHUNGGB,  EEA_DISC_CPR, ";
		sql += " 			CHUNGAMT, ";
		sql += " 			case when CHUNGGB IN('일반','학생') then EEP_PSNL_PR end EEP_PSNL_PR ";
		sql += " 	FROM ( ";
		sql += " 			SELECT EEA_COMP_CD, EEA_EXAM_DT, EEA_EXAM_SQ, ICR_PENL_ID, EEA_EXAM_CD,  EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_CD, EEA_CHART_NO, ";
		sql += " 				ICY_COMP_NM, EEA_DEPT_NM, ICR_PID_EN, ";
		sql += " 				EEA_CUST_NO, ";
		sql += " 				EEA_PSNL_NM, EEA_FAMY_CD, EEA_FAMY_NM, ";
		sql += " 				IAU_PENL_NM, ";
		sql += " 				EEP_CDMD_DT, ";
		sql += " 				EEP_CDMDS_DT,  MAX(NVL(EEA_DISC_CPR,0))  EEA_DISC_CPR, ";
		sql += " 				SUM(EEP_COMP_PR) 일반, ";
		sql += " 				SUM(EEP_COMPS_PR) 특검, ";
		sql += " 				SUM(EEP_COMP_PR+EEP_COMPS_PR) 학생, ";
		sql += " 				SUM(EEP_COMP_PR+EEP_COMPS_PR) 전체, ";
		sql += " 				case when sum( EEP_COMP_PR)> 0 then sum(EEP_PSNL_PR) else sum(EEP_PSNL_PR) end EEP_PSNL_PR ";
		sql += " 			FROM ( ";
		sql += " 				SELECT A.EEA_COMP_CD,  EEA_EXAM_DT, EEA_EXAM_SQ, ICR_PENL_ID, EEA_EXAM_CD,  EEA_SPHT_CD , EEA_SPSB_CD, EEA_SPCL_CD, EEA_CHART_NO, ";
		sql += " 						C.ICY_COMP_NM, EEA_DEPT_NM, ";
		sql += " 						A.EEA_CUST_NO, ";
		sql += " 						A.EEA_PSNL_NM, A.EEA_FAMY_CD, EEA_FAMY_NM, ";
		sql += " 								D.IAU_PENL_NM, E.ICR_PID_EN, ";
		sql += " 								B.EEP_CDMD_DT, ";
		sql += " 								B.EEP_CDMDS_DT,  EEA_DISC_CPR, ";
		sql += " 								(B.EEP_COMP_PR) EEP_COMP_PR, ";
		sql += " 								(B.EEP_COMPS_PR) EEP_COMPS_PR, ";
		sql += " 								(B.EEP_PSNLP_PR) EEP_PSNLP_PR , ";
		sql += " 						CASE WHEN EEA_RECE_KD<>'2' THEN  EEP_PSNL_PR ELSE 0  END EEP_PSNL_PR ";
		sql += " 				FROM ET_EXAM_ACPT A ";
		sql += " 					LEFT OUTER JOIN ET_EXAM_PRICE B ";
		sql += " 						ON A.EEA_EXAM_DT = B.EEP_EXAM_DT ";
		sql += " 						AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ ";
		sql += " 					LEFT OUTER JOIN IT_COMPANY C ";
		sql += " 						ON A.EEA_COMP_CD = C.ICY_COMP_CD ";
		sql += " 					LEFT OUTER JOIN IT_AUTH_USER D ";
		sql += " 						ON C.ICY_SALE_ID = D.IAU_EMP_NO ";
		sql += " 					LEFT OUTER JOIN IT_CUSTOMER E ";
		sql += " 						ON A.EEA_CUST_NO=E.ICR_CUST_NO ";
		sql += " 				WHERE NVL(A.EEA_COMP_CD, ' ') <> ' ' AND eea_order_yn<>'C' ";
		sql += " 				AND EEA_EXAM_DT >= '" + SFROMDT + "'";
		sql += " 				AND EEA_EXAM_DT <= '" + STODT + "'";
		sql += " 				AND EEA_COMP_CD LIKE '" + SCOMPCD + "%'";
		sql += SSQLADDSQL;
		sql += SSQLWHEREADD;
		sql += " ";
		sql += " 				) LAST_G ";
		sql += " 			GROUP BY EEA_COMP_CD,  EEA_EXAM_CD,  EEA_SPHT_CD , EEA_SPSB_CD, EEA_SPCL_CD, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_CHART_NO, ";
		sql += " 				ICY_COMP_NM, EEA_DEPT_NM, ";
		sql += " 				EEA_CUST_NO, ";
		sql += " 				EEA_PSNL_NM, EEA_FAMY_CD, EEA_FAMY_NM, ";
		sql += " 				IAU_PENL_NM, ";
		sql += " 				EEP_CDMD_DT, ";
		sql += " 				EEP_CDMDS_DT,EEA_EXAM_DT,EEA_EXAM_SQ,ICR_PENL_ID, ICR_PID_EN ";
		sql += "        )  UNPIVOT(CHUNGAMT for CHUNGGB IN (일반,특검,학생,전체)) UNPVT ";
		sql += " 	WHERE 0=0 ";
		sql += " 			AND ";
		sql += " 			CASE ";
		sql += " 			WHEN CHUNGGB IN('일반' ,'학생') ";
		sql += " 				THEN EEP_CDMD_DT ";
		sql += " 				ELSE NULL ";
		sql += " 			END IS NULL ";
		sql += " 			AND ";
		sql += " 			CASE ";
		sql += " 				WHEN CHUNGGB='특검' ";
		sql += " 				THEN EEP_CDMDS_DT ";
		sql += " 				ELSE NULL ";
		sql += " 			END IS NULL ";

		if(CK_CHUNG_CRT.equals("1")) {

			sql += " AND ";
			sql += " CASE ";
			sql += " WHEN  CHUNGGB in('일반') THEN  (select MAX(BCL_BILL_KD) BCL_BILL_KD from BT_BILL_COMP_LIST T  where EEA_EXAM_DT=T.BCL_EXAM_DT and EEA_EXAM_SQ=T.BCL_EXAM_SQ  and T.BCL_BILL_KD = '31') ";
			sql += " WHEN  CHUNGGB in('특검') THEN  (select MAX(BCL_BILL_KD) BCL_BILL_KD from BT_BILL_COMP_LIST T  where EEA_EXAM_DT=T.BCL_EXAM_DT and EEA_EXAM_SQ=T.BCL_EXAM_SQ  and T.BCL_BILL_KD = '32') ";
			sql += " ELSE  (select MAX(BCL_BILL_KD) BCL_BILL_KD from BT_BILL_COMP_LIST T where EEA_EXAM_DT=T.BCL_EXAM_DT and EEA_EXAM_SQ=T.BCL_EXAM_SQ) ";
			sql += " END IS NULL ";
		}

		sql += " 	AND CHUNGGB = '" + SCHUNGBN + "'";
		sql += " 	AND EEA_COMP_CD LIKE '" + SCOMPCD + "%'";
		sql += " 	) LAST_T ";
		sql += " WHERE  CHUNGAMT > 0 ";
		sql += " GROUP BY EEA_COMP_CD,EEA_EXAM_CD, EEA_SPHT_CD, EEA_SPSB_CD, EEA_SPCL_CD, EEA_CHART_NO, ";
		sql += " 	ICY_COMP_NM, EEA_DEPT_NM, ";
		sql += " 	EEA_CUST_NO, ";
		sql += " 	EEA_PSNL_NM, EEA_FAMY_CD,  EEA_FAMY_NM , ";
		sql += " 	IAU_PENL_NM, ";
		sql += " 	CHUNGGB  ,EEA_EXAM_DT, EEA_EXAM_SQ, ICR_PENL_ID, ICR_PID_EN ";
		sql += SSQLORDERBYADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ChungPer_UDP_CHUNGSEL_001_2 \n";
			G_INFO += "설명 : 개별목록 및 금액 조회(한양대 본원 이 외)  : 사업장 청구는 감액 금액 없음 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSQLORDERBYADD : " + SSQLORDERBYADD + " \n";
			G_INFO += " SFROMDT : " + SFROMDT + " \n";
			G_INFO += " STODT : " + STODT + " \n";
			G_INFO += " SCOMPCD : " + SCOMPCD + " \n";
			G_INFO += " SSQLWHEREADD : " + SSQLWHEREADD + " \n";
			G_INFO += " CK_CHUNG_CRT : " + CK_CHUNG_CRT + " \n";
			G_INFO += " SCHUNGBN : " + SCHUNGBN + " \n";
			G_INFO += " SSQLADDSQL : " + SSQLADDSQL + " \n";
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
