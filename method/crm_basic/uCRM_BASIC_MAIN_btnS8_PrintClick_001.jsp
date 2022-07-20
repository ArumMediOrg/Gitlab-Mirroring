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

	ResultSetMetaData rsmd = null;

	CRs cRsList = null;

	//
	String G_INFO = "";

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

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();



		sql = " SELECT EEA_PSNL_NM, EEA_CHART_NO, MAX_ORDER, rownum NUM_ORDER ,EPM_MARK_TNM ";
		sql += " 	,EEA_EXAM_NO1 ,EEA_EXAM_NO2 ,EEA_EXAM_NO3 ,EEA_EXAM_NO4 ,EEA_EXAM_NO5 ";
		sql += " 	,(SELECT CASE WHEN count(*) > 0 THEN 'V' ELSE '' END  FROM et_rslt_item ";
		sql += " 		WHERE eri_exam_dt = substr(eea.EEA_EXAM_NO1,1,10) AND eri_exam_sq = substr(eea.EEA_EXAM_NO1,12,6) ";
		sql += " 		AND eri_item_cd IN (SELECT emi_item_cd FROM ET_PACK_MARK_item ";
		sql += " 							WHERE emi_mark_kd = epm_mark_kd AND emi_mark_cd = epm_mark_cd AND emi_mark_sq = epm_mark_sq) AND ERI_CNCL_YN = 'N') EXAM_RSLT_CNT1 ";
		sql += " 	,(SELECT CASE WHEN count(*) > 0 THEN 'V' ELSE '' END FROM et_rslt_item ";
		sql += " 		WHERE eri_exam_dt = substr(eea.EEA_EXAM_NO2,1,10) AND eri_exam_sq = substr(eea.EEA_EXAM_NO2,12,6) ";
		sql += " 		AND eri_item_cd IN (SELECT emi_item_cd FROM ET_PACK_MARK_item ";
		sql += " 							WHERE emi_mark_kd = epm_mark_kd AND emi_mark_cd = epm_mark_cd AND emi_mark_sq = epm_mark_sq) AND ERI_CNCL_YN = 'N') EXAM_RSLT_CNT2 ";
		sql += " 	,(SELECT CASE WHEN count(*) > 0 THEN 'V' ELSE '' END FROM et_rslt_item ";
		sql += " 		WHERE eri_exam_dt = substr(eea.EEA_EXAM_NO3,1,10) AND eri_exam_sq = substr(eea.EEA_EXAM_NO3,12,6) ";
		sql += " 		AND eri_item_cd IN (SELECT emi_item_cd FROM ET_PACK_MARK_item ";
		sql += " 							WHERE emi_mark_kd = epm_mark_kd AND emi_mark_cd = epm_mark_cd AND emi_mark_sq = epm_mark_sq) AND ERI_CNCL_YN = 'N') EXAM_RSLT_CNT3 ";
		sql += " 	,(SELECT CASE WHEN count(*) > 0 THEN 'V' ELSE '' END FROM et_rslt_item ";
		sql += " 		WHERE eri_exam_dt = substr(eea.EEA_EXAM_NO4,1,10) AND eri_exam_sq = substr(eea.EEA_EXAM_NO4,12,6) ";
		sql += " 		AND eri_item_cd IN (SELECT emi_item_cd FROM ET_PACK_MARK_item ";
		sql += " 							WHERE emi_mark_kd = epm_mark_kd AND emi_mark_cd = epm_mark_cd AND emi_mark_sq = epm_mark_sq) AND ERI_CNCL_YN = 'N') EXAM_RSLT_CNT4 ";
		sql += " 	,(SELECT CASE WHEN count(*) > 0 THEN 'V' ELSE '' END FROM et_rslt_item ";
		sql += " 		WHERE eri_exam_dt = substr(eea.EEA_EXAM_NO5,1,10) AND eri_exam_sq = substr(eea.EEA_EXAM_NO5,12,6) ";
		sql += " 		AND eri_item_cd IN (SELECT emi_item_cd FROM ET_PACK_MARK_item ";
		sql += " 							WHERE emi_mark_kd = epm_mark_kd AND emi_mark_cd = epm_mark_cd AND emi_mark_sq = epm_mark_sq) AND ERI_CNCL_YN = 'N') EXAM_RSLT_CNT5 ";
		sql += " FROM ( ";
		sql += " SELECT  (SELECT EEA_PSNL_NM FROM ET_EXAM_ACPT WHERE EEA_EXAM_DT =  '" + EXAM_DT + "' AND EEA_EXAM_SQ =   '" + EXAM_SQ + "') EEA_PSNL_NM ";
		sql += "    , EEA_CHART_NO, MAX(ACPT_ORDER) MAX_ORDER ";
		sql += " 	,max(EEA_EXAM_NO1) EEA_EXAM_NO1, max(EEA_EXAM_NO2) EEA_EXAM_NO2, max(EEA_EXAM_NO3) EEA_EXAM_NO3 ";
		sql += " 	,max(EEA_EXAM_NO4) EEA_EXAM_NO4, max(EEA_EXAM_NO5) EEA_EXAM_NO5 ";
		sql += " FROM ";
		sql += " (SELECT rownum ACPT_ORDER,  EEA_EXAM_DT, EEA_EXAM_sQ, EEA_PSNL_NM, EEA_CHART_NO ";
		sql += " 		,case when rownum = 1 THEN EEA_EXAM_DT||' '||EEA_EXAM_SQ END AS EEA_EXAM_NO1 ";
		sql += " 		,case when rownum = 2 THEN EEA_EXAM_DT||' '||EEA_EXAM_SQ END AS EEA_EXAM_NO2 ";
		sql += " 		,case when rownum = 3 THEN EEA_EXAM_DT||' '||EEA_EXAM_SQ END AS EEA_EXAM_NO3 ";
		sql += " 		,case when rownum = 4 THEN EEA_EXAM_DT||' '||EEA_EXAM_SQ END AS EEA_EXAM_NO4 ";
		sql += " 		,case when rownum = 5 THEN EEA_EXAM_DT||' '||EEA_EXAM_SQ END AS EEA_EXAM_NO5 ";
		sql += " FROM ";
		sql += " 	(select A.eea_exam_dt, A.eea_exam_sq, A.EEA_PSNL_NM, A.EEA_CHART_NO ";
		sql += " 	from et_exam_acpt A join ";
		sql += " 	( ";
		sql += " 	select eea_cust_no from et_exam_acpt ";
		sql += " 	where eea_exam_dt = '" + EXAM_DT + "' and eea_exam_sq = '" + EXAM_SQ + "' ";
		sql += " 	)    B On A.eea_cust_no = B.eea_cust_no ";
		sql += " 	INNER JOIN IT_CUSTOMER ICR ON ICR.ICR_CUST_NO = A.EEA_CUST_NO ";
		sql += " 	WHERE ";
		sql += " 		((a.EEA_EXAM_DT < '" + EXAM_DT + "')  AND (a.EEA_EXAM_CD LIKE '2%')  AND (a.EEA_ORDER_YN <> 'C') ) ";
		sql += " 	or (a.EEA_EXAM_DT = '" + EXAM_DT + "') ";
		sql += " 	order by eea_exam_dt desc ";
		sql += " 	) a ";
		sql += " WHERE ";
		sql += " 	rownum <= 5 ";
		sql += " ) ";
		sql += " GROUP BY EEA_CHART_NO ";
		sql += " ) eea, (SELECT * FROM ET_PACK_MARK WHERE epm_mark_kd = '3' AND epm_mark_cd = '05' ORDER BY epm_mark_sq ) epm ";




			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_MAIN_btnS8_PrintClick_001 \n";
			G_INFO += "설명 : 건강검진 재진 안내문 출력 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:basetable='DUAL' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
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
