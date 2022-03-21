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
		String RECE_NO = htMethod.get("RECE_NO");
		String SUGA_KD = htMethod.get("SUGA_KD");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(RECE_NO == null) { RECE_NO = ""; }
		if(SUGA_KD == null) { SUGA_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT COMP_CD, F_COMP_FIND(COMP_CD) COMP_NM, EXAM_YM, SUM(CNT) EXAM_CNT, SUM(PSNL_PR+COMP_PR+HLTH_PR+SPCL_PR) TOTAL_PR, SUM(PSNL_PR) PSNL_PR, SUM(COMP_PR) COMP_PR, SUM(HLTH_PR) HLTH_PR, SUM(SPCL_PR) SPCL_PR, SUM(DISC_PR) DISC_PR, SUM(CHARGE_PR) CHARGE_PR, SUM(SALE_PR) SALE_PR, SUM(RECE_PR) RECE_PR";
		sql += " FROM (SELECT SUBSTR(EEA_EXAM_DT, 1, 7) EXAM_YM, EEA_COMP_CD COMP_CD, 1 CNT, EEA_PSNLR_PR PSNL_PR, EEA_COMPR_PR COMP_PR, EEA_HLTHR_PR HLTH_PR, EEA_SPCLR_PR SPCL_PR, NVL(EEA_DISC_PR, 0)+NVL(EEA_DISC_CPR, 0) DISC_PR, 0 CHARGE_PR, 0 SALE_PR, 0 RECE_PR";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEA_ACPT_CD = '2'";
		sql += " AND EEA_ORDER_YN <> 'C'";

		if(RECE_NO.equals("R")) {
			sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		}

		if(SUGA_KD.equals("1")){
			sql += " AND EEA_PSNLR_PR + EEA_COMPR_PR + EEA_HLTHR_PR + EEA_SPCLR_PR <> 0 ";
		}

		sql += " UNION";
		sql += " ALL SELECT SUBSTR(A.RRM_RECE_DT, 1, 7) EXAM_YM, B.EEA_COMP_CD COMP_CD, 0 CNT, 0 PSNL_PR, 0 COMP_PR, 0 HLTH_PR, 0 SPCL_PR, 0 DISC_PR, A.RRM_CHARGE_PR CHARGE_PR, A.RRM_SALE_PR SALE_PR, A.RRM_RECE_PR - A.RRM_RETURN_PR RECE_PR";
		sql += " FROM RT_RECE_MEDICHK A, ET_EXAM_ACPT B";
		sql += " WHERE A.RRM_RECE_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND NOT RRM_OCCU_KD LIKE '3%'";
		sql += " AND (REPLACE(B.EEA_EXAM_DT, '-', '')||B.EEA_EXAM_SQ = A.RRM_RECE_NO";
		sql += " OR B.EEA_RECE_NO = A.RRM_RECE_NO)";
		sql += " AND B.EEA_ACPT_CD = '2'";
		sql += " AND B.EEA_PSNLR_PR > 0";
		sql += " AND B.EEA_ORDER_YN <> 'C'";

		if(RECE_NO.equals("R")) {
			sql += " AND NVL(A.EEA_RECE_NO, ' ') <> 'R'";
		}

		sql += " UNION";
		sql += " ALL SELECT SUBSTR(RRM_RECE_DT, 1, 7) EXAM_YM, RRM_CUST_NO COMP_CD, 0 CNT, 0 PSNL_PR, 0 COMP_PR, 0 HLTH_PR, 0 SPCL_PR, 0 DISC_PR, RRM_CHARGE_PR CHARGE_PR, RRM_SALE_PR SALE_PR, RRM_RECE_PR - RRM_RETURN_PR RECE_PR";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND RRM_OCCU_KD LIKE '3%' ) A";
		sql += " GROUP BY COMP_CD, EXAM_YM";
		sql += " ORDER BY NVL(F_COMP_FIND(COMP_CD), ' '), NVL(COMP_CD, ' '), EXAM_YM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_Sales_UP_Comp_Stat_002 \n";
			G_INFO += "설명 : 기업체 월별 현황 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " RECE_NO : " + RECE_NO + " \n";
			G_INFO += " SUGA_KD : " + SUGA_KD + " \n";
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
