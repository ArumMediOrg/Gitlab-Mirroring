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
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();



		sql = " SELECT *";
		sql += " FROM ( SELECT ICR_PENL_ID, EEA_CUPN_NO, EEA_EXAM_DT EEA_BUSI_YR, (REPLACE(EEA_EXAM_DT,'-','') || EEP_EXAM_SQ ) RECENO, EEA_CUST_NO, EEA_CHART_NO, EEA_PSNL_NM, ICR_BIRH_DT, EEA_EXAM_DT, EEP_EXAM_SQ, EEP_PSNL_PR, NVL(EEA_DISC_PR,0) + NVL(EEA_DISC_CPR,0)  EEA_DISC_PR, EEA_EXAM_CD, EEA_RECE_NO , (SELECT A.ICY_COMP_NM";
		sql += " FROM IT_COMPANY A";
		sql += " WHERE EEA_COMP_CD = A.ICY_COMP_CD) ICY_COMP_NM , NVL((SELECT (SELECT (NVL(SUM(RRM_RESER_PR),0) - NVL(SUM(RRM_RESEREPL_PR),0) ) RRM_RESER_PR";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_NO=RRT_RECE_NO)";
		sql += " FROM RT_RSVT";
		sql += " WHERE RRT_RSVN_NO=EEA_RSVN_NO ),0) RESER_PR, NVL((SELECT (SELECT NVL(SUM(RRM_SALE_PR),0) RRM_SALE_PR";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_NO=RRT_RECE_NO)";
		sql += " FROM RT_RSVT";
		sql += " WHERE RRT_RSVN_NO=EEA_RSVN_NO ),0) RRM_SALE_PR, (SELECT MAX(RRT_RECE_NO)";
		sql += " FROM RT_RSVT";
		sql += " WHERE RRT_RECE_NO=EEA_RSVN_NO) RRT_RECE_NO , NVL(EEP_PSNL_PR - ( SELECT (NVL(SUM(RRM_SALE_PR),0) + NVL(EEA_DISC_PR,0) + NVL(EEA_DISC_CPR,0) + NVL(SUM(RRM_TRUNC_PR),0) + NVL(SUM(RRM_RECE_PR),0)-NVL(SUM(RRM_OVERPAY_PR),0)) - NVL(SUM(RRM_RETURN_PR ),0)";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_NO=A.EEA_RECE_NO";
		sql += " AND RRM_OCCU_KD IN ('20','70','71') ),0) RMH_NOPAY_PR, NVL(( SELECT NVL(SUM(RRM_RECE_PR),0) - NVL(SUM(RRM_RETURN_PR),0)";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_NO=A.EEA_RECE_NO";
		sql += " AND RRM_OCCU_KD IN ('20','70','71')),0) ";
		sql += " RMH_RECE_PR, NVL(( SELECT NVL(SUM(RRM_SALE_PR),0)";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_NO=A.EEA_RECE_NO";
		sql += " AND RRM_OCCU_KD IN ('20','70','71')),0) RMH_SALE_PR, NVL(( SELECT NVL(SUM(RRM_TRUNC_PR),0)";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_NO=A.EEA_RECE_NO";
		sql += " AND RRM_OCCU_KD IN ('20','70','71')),0) RMH_SERVI_PR,";
		sql += " (SELECT MAX(CCN_FULL_NM ) CCN_FULL_NM ";
		sql += " FROM CT_COMMON AA, RT_RECE_MEDICHK BB ";
		sql += " WHERE BB.RRM_PAY_KD=AA.CCN_SMALL";
		sql += " AND BB.RRM_RECE_NO=EEA_RECE_NO";
		sql += " AND AA.CCN_LARGE='0920' ";
		sql += " AND BB.RRM_RECE_SEQ = (select max(BB.RRM_RECE_SEQ) SEQ  FROM CT_COMMON AA, RT_RECE_MEDICHK BB ";
		sql += " WHERE BB.RRM_PAY_KD = AA.CCN_SMALL                                                           ";
		sql += " AND BB.RRM_RECE_NO = EEA_RECE_NO                                                           ";
		sql += " AND AA.CCN_LARGE='0920' )) RRM_PAY_NM ,                                                  ";
		sql += " (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE='0401'";
		sql += " AND CCN_SMALL=A.EEA_EXAM_CD ) EEA_EXAM_NM, CASE WHEN EEA_RECE_KD ='2' THEN '수납' WHEN EEA_RECE_KD ='1' THEN '일부수납' WHEN EEA_RECE_KD ='3' THEN '환불' ELSE '미납' END EEA_RECE_KD, EEA_RECE_KD RECE_GBN, EEA_MODI_DTT";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN (SELECT EEP_EXAM_DT, EEP_EXAM_SQ, SUM(EEP_PSNL_PR) EEP_PSNL_PR";
		sql += " FROM ET_EXAM_PRICE";
		sql += " GROUP BY EEP_EXAM_DT, EEP_EXAM_SQ ) B";
		sql += " ON A.EEA_EXAM_DT= B.EEP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=B.EEP_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER D";
		sql += " ON A.EEA_CUST_NO = D.ICR_CUST_NO";
		sql += " WHERE 0=0";
		sql += " AND EEA_EXAM_DT >= '" + DP_FROMDT + "'";
		sql += " AND EEA_EXAM_DT <= '" + DP_TODT + "'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubT_Rece_Up_afLoadper_001_2 \n";
			G_INFO += "설명 : 수납대상내역조회(직불) : 한양대(본원) 이 외 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
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
