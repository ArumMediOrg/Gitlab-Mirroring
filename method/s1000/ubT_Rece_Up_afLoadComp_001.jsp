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

		sql = " SELECT BBC_BUSI_YR, BBC_COMP_CD, BBC_EXAM_CD, B.ICY_COMP_NM, BBC_BILL_DT, BBC_BILL_NO, (REPLACE(BBC_BILL_DT,'-','') || BBC_BILL_NO ) RECENO";
		sql += ", CASE WHEN BBC_BILL_KD IN( '31','90') THEN '일반' ELSE '특검' END BBC_BILL_KD, BBC_BILL_ETC, BBC_BILL_CT, BBC_BILL_PR, BBC_BILLCOM_PR, BBC_BILLPER_PR";
		sql += ", (";
		sql += "	SELECT CCN_FULL_NM";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE CCN_LARGE='0401'";
		sql += " 	AND CCN_SMALL=A.BBC_EXAM_CD";
		sql += " ) BBC_EXAM_NM";

		sql += ", NVL(";
		sql += "	BBC_BILL_PR";
		sql += "	- (";
		sql += "		SELECT (NVL(SUM(RRM_SALE_PR),0) || NVL(SUM(RRM_TRUNC_PR),0)||NVL(SUM(RRM_RECE_PR),0)-NVL(SUM(RRM_OVERPAY_PR),0)) - NVL(SUM(RRM_RETURN_PR ),0)";
		sql += " 		FROM RT_RECE_MEDICHK";
		sql += " 		WHERE RRM_RECE_NO=A.BBC_RECE_NO";
		sql += "	),0) RMH_NOPAY_PR";

		sql += ", NVL(";
		sql += "	(";
		sql += "		SELECT NVL(SUM(RRM_RECE_PR),0)";
		sql += " 		FROM RT_RECE_MEDICHK";
		sql += " 		WHERE RRM_RECE_NO=A.BBC_RECE_NO";
		sql += "	),0) RMH_RECE_PR";

		sql += ", NVL(";
		sql += "	(";
		sql += "		SELECT NVL(SUM(RRM_SALE_PR),0)";
		sql += " 		FROM RT_RECE_MEDICHK";
		sql += " 		WHERE RRM_RECE_NO=A.BBC_RECE_NO";
		sql += "	),0) RMH_SALE_PR";

		sql += ", NVL(";
		sql += "	(";
		sql += "		SELECT NVL(SUM(RRM_TRUNC_PR),0)";
		sql += " 		FROM RT_RECE_MEDICHK";
		sql += " 		WHERE RRM_RECE_NO=A.BBC_RECE_NO";
		sql += "	),0) RMH_SERVI_PR";

		sql += ", (";
		sql += "	SELECT MAX(CCN_FULL_NM ) CCN_FULL_NM";
		sql += " 	FROM CT_COMMON AA, RT_RECE_MEDICHK BB";
		sql += " 	WHERE BB.RRM_PAY_KD=AA.CCN_SMALL";
		sql += " 	AND BB.RRM_RECE_NO=BBC_RECE_NO";
		sql += " 	AND AA.CCN_LARGE='0920'";
		sql += ") RRM_PAY_NM";

		sql += ", CASE WHEN BBC_RECE_KD ='2' THEN '수납' WHEN BBC_RECE_KD ='1' THEN '일부수납' WHEN BBC_RECE_KD ='3' THEN '환불' ELSE '미납' END BBC_RECE_KD";
		sql += ", BBC_RECE_KD RECE_GBN, BBC_INPUT_DTT, BBC_INPUT_ID, BBC_MODI_DTT, BBC_MODI_ID, BBC_RECE_NO ";
		sql += ", CASE WHEN BBC_BILL_ETC_NM IS NULL THEN SUBSTR(BBC_BILL_ETC,1,2) ELSE BBC_BILL_ETC_NM END BBC_BILL_ETC_NM, BBC_BILL_FL, BBH_BOGUN_NM ";
		sql += " FROM BT_BILL_COMP A LEFT OUTER JOIN IT_COMPANY B";
		sql += " ON A.BBC_COMP_CD=B.ICY_COMP_CD";
		sql += " LEFT OUTER JOIN BT_BILL_HNHIS C ON A.BBC_BILL_FL = C.BBH_BILL_FL ";
		sql += " WHERE 0=0";
		sql += " AND BBC_BILL_DT >= '" + DP_FROMDT + "'";
		sql += " AND BBC_BILL_DT <= '" + DP_TODT + "'";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubT_Rece_Up_afLoadComp_001 \n";
			G_INFO += "설명 : 수납대상내역조회(사업장) \n";
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
