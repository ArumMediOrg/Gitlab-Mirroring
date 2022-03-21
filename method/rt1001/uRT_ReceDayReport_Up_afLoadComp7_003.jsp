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


		sql = " SELECT b.EEA_EXAM_DT BBC_BILL_DT, b.EEA_EXAM_SQ BBC_BILL_NO, b.EEA_PSNL_NM ICY_COMP_NM , (nvl(CARD_PR,0) + nvl(BOOK_PR,0) + nvl(SALE_PR,0)) BBC_BILL_PR ";
		sql += "        ,a.RRM_RECE_DT ";
		sql += "        ,nvl(CARD_PR,0) CARD_PR, nvl(BOOK_PR,0) BOOK_PR, (nvl(CARD_PR,0) + nvl(BOOK_PR,0)) TOT_PR, nvl(SALE_PR,0) SALE_PR";
		sql += "        ,0 MISU_PR";
		sql += " FROM (SELECT RRM_RECE_NO, RRM_RECE_DT, sum(CARD_PR) CARD_PR, sum(BOOK_PR) BOOK_PR, sum(RRM_SALE_PR) SALE_PR";
		sql += "       FROM";

		sql += " (SELECT RRM_RECE_NO, RRM_RECE_DT, RRM_PAY_KD, CASE WHEN RRM_PAY_KD NOT IN('04') THEN sum(nvl(RRM_RECE_AF_PR,0)) ELSE 0 end CARD_PR,";
		sql += "                                          CASE WHEN RRM_PAY_KD in ('04') THEN sum(nvl(RRM_RECE_AF_PR,0)) ELSE 0 end BOOK_PR,";
		sql += "                                          sum(nvl(RRM_SALE_AF_PR,0) + nvl(RRM_TRUNC_AF_PR,0)) RRM_SALE_PR";
		sql += "          FROM RT_RECE_MEDICHK";
		sql += " 		WHERE RRM_RECE_DT BETWEEN  '" + DP_FROMDT +"'   AND  '" + DP_TODT + "' ";
		sql += "            AND RRM_OCCU_KD IN ('20')";
		sql += "            AND ((nvl(RRM_RECE_AF_PR,0) <> 0) OR ((nvl(RRM_SALE_AF_PR,0) + nvl(RRM_TRUNC_AF_PR,0)) <> 0))";
		sql += "          GROUP BY RRM_RECE_NO, RRM_RECE_DT, RRM_PAY_KD) bb";
		sql += "        GROUP BY RRM_RECE_NO, RRM_RECE_DT  ) a";
		sql += "    LEFT OUTER JOIN ET_EXAM_ACPT  b";
		sql += "   ON  a.RRM_RECE_NO = b.EEA_RECE_NO";
		sql += " WHERE";
		sql += " 1 = 1";

		sql += SSQLADD;



			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_ReceDayReport_Up_afLoadComp7_003 \n";
			G_INFO += "설명 : 미수입금 명세서(고려대학교)-개인미수금 \n";
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
