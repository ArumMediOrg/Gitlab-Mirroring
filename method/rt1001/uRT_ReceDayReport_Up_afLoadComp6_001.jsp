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

		String DP_FROMDT = htMethod.get("DP_FROMDT");
		String DP_TODT = htMethod.get("DP_TODT");
		String SSQLADD = htMethod.get("SSQLADD");

		//
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }
		if(SSQLADD == null) { SSQLADD = ""; }

		// DB객체
		stmtList = connect.createStatement();



		sql = " SELECT CCC.EEA_EXAM_DT, CCC.EEA_EXAM_SQ, PSNL_PR, COMP_PR, (PSNL_PR + COMP_PR) TOTPR, DISC_PR ";
		sql += " 	,SALEPR, CARDPR ,CASHPR ,BKBOOKPR ,POINTPR ,OTHERPR , (CARDPR + CASHPR) SUNABPR ";
		sql += " 	,CASE WHEN BKBOOKPR + POINTPR + OTHERPR = 0 THEN '' ELSE ";
		sql += " 		(BKBOOKPR + POINTPR + OTHERPR)||'(' || CASE WHEN BKBOOKPR = 0 THEN '' ELSE '통' END ";
		sql += " 											|| CASE WHEN POINTPR  = 0 THEN '' ELSE '건' END ";
		sql += " 											|| CASE WHEN OTHERPR  = 0 THEN '' ELSE '기' END ||')' ";
		sql += " 	END OTHERTOTPR ";
		sql += " 	,D.EEA_CHART_NO , D.EEA_PSNL_NM ";
		sql += " 	,(SELECT ICY_COMP_NM FROM IT_COMPANY WHERE ICY_COMP_CD = D.EEA_COMP_CD) ICY_COMP_NM ";
		sql += " FROM ";
		sql += " ( ";
		sql += " SELECT EEA_EXAM_DT, EEA_EXAM_SQ, SUM(PSNL_PR)  PSNL_PR, SUM(COMP_PR) COMP_PR,  SUM(DISC_PR) DISC_PR ";
		sql += " 	,SUM(SALEPR) SALEPR, SUM(CARDPR)CARDPR,SUM(CASHPR) CASHPR,SUM(BKBOOKPR) BKBOOKPR,SUM(POINTPR) POINTPR,SUM(OTHERPR) OTHERPR ";
		sql += " FROM ";
		sql += " (SELECT EEP_EXAM_DT EEA_EXAM_DT, EEP_EXAM_SQ EEA_EXAM_SQ ";
		sql += " 		,SUM(EEP_PSNL_PR + EEP_PSNLP_PR) PSNL_PR ";
		sql += " 		,SUM(EEP_COMP_PR + EEP_COMPS_PR) COMP_PR ";
		sql += " 		,SUM(EEP_DISC_PR + EEP_DISC_CPR) DISC_PR ";
		sql += " 		,0 SALEPR, 0 CARDPR ,0 CASHPR ,0 BKBOOKPR ,0 POINTPR ,0 OTHERPR ";
		sql += " 	FROM ET_EXAM_PRICE ";
		sql += " 	WHERE EEP_ORDER_DT BETWEEN  '" + DP_FROMDT + "'   AND  '" + DP_TODT + "' ";
		sql += " 	GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ";
		sql += " 	UNION ALL ";
		sql += " 	SELECT ";
		sql += " 	EEA_EXAM_DT, EEA_EXAM_SQ ";
		sql += " 	,0 PSNL_PR, 0 COMP_PR, 0 DISC_PR ";
		sql += "    ,SUM(NVL(SALEPR,0))   SALEPR ";
		sql += " 	,SUM(NVL(CARDPR,0))   CARDPR ";
		sql += " 	,SUM(NVL(CASHPR,0))   CASHPR ";
		sql += " 	,SUM(NVL(BKBOOKPR,0)) BKBOOKPR ";
		sql += " 	,SUM(NVL(POINTPR,0))  POINTPR ";
		sql += " 	,SUM(NVL(OTHERPR,0))  OTHERPR ";
		sql += " 	FROM ";
		sql += " 	(SELECT ";
		sql += " 		EEA_EXAM_DT ";
		sql += " 		,EEA_EXAM_SQ ";
		sql += "        ,(NVL(RRM_SALE_PR,0) + NVL(RRM_TRUNC_PR,0)) SALEPR ";
		sql += " 		,CASE WHEN RRM_PAY_KD ='01' THEN (NVL(RRM_RECE_PR,0) - NVL(RRM_RETURN_PR,0)) END CARDPR ";
		sql += " 		,CASE WHEN RRM_PAY_KD IN ('02','03')  THEN (NVL(RRM_RECE_PR,0) - NVL(RRM_RETURN_PR,0)) END CASHPR ";
		sql += " 		,CASE WHEN RRM_PAY_KD IN ('04')  THEN (NVL(RRM_RECE_PR,0) - NVL(RRM_RETURN_PR,0)) END BKBOOKPR ";
		sql += " 		,CASE WHEN RRM_PAY_KD IN ('05')  THEN (NVL(RRM_RECE_PR,0) - NVL(RRM_RETURN_PR,0)) END POINTPR ";
		sql += " 		,CASE WHEN RRM_PAY_KD  NOT IN ('01','02','03','04','05')  THEN (NVL(RRM_RECE_PR,0) - NVL(RRM_RETURN_PR,0)) END OTHERPR ";
		sql += " 	FROM RT_RECE_MEDICHK A LEFT OUTER JOIN ET_EXAM_ACPT  B ON A.RRM_RECE_NO = B.EEA_RECE_NO ";
		sql += " 	WHERE ";
		sql += " 		RRM_RECE_DT  BETWEEN  '" + DP_FROMDT + "'   AND  '" + DP_TODT + "' ";
		sql += " 	AND RRM_OCCU_KD IN ('20','70','71','72') ";
		sql += " 	) AA ";
		sql += " 	WHERE 1 = 1 ";
		sql += " 	GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ ";
		sql += " 	) BB GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ ";
		sql += " ) CCC LEFT OUTER JOIN ET_EXAM_ACPT  D ON CCC.EEA_EXAM_DT = D.EEA_EXAM_DT AND CCC.EEA_EXAM_SQ = D.EEA_EXAM_SQ ";

		sql += SSQLADD;


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_ReceDayReport_Up_afLoadComp6_001 \n";
			G_INFO += "설명 : 일일 수입금 명세서(고려대학교) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
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
