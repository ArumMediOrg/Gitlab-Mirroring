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

		String DTERCPTFR = htMethod.get("DTERCPTFR");
		String DTERCPTTO = htMethod.get("DTERCPTTO");
		String SRCPTSQL = htMethod.get("SRCPTSQL");

		//
		if(DTERCPTFR == null) { DTERCPTFR = ""; }
		if(DTERCPTTO == null) { DTERCPTTO = ""; }
		if(SRCPTSQL == null) { SRCPTSQL = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT DISTINCT
       A.ERI_ITEM_CD, B.IIM_SNME_NM, B.IIM_RSLT_KD, '0' AS SEQ
  FROM ET_RSLT_ITEM A
  JOIN IT_ITEM B
    ON IIM_ITEM_CD = ERI_ITEM_CD
   AND IIM_RSLT_KD <> '9'
 WHERE ERI_EXAM_DT BETWEEN :dteRcptFr AND :dteRcptTo
   AND EXISTS (:sRcptSQL
   AND A.ERI_EXAM_DT = EEA_EXAM_DT
   AND A.ERI_EXAM_SQ = EEA_EXAM_SQ
   AND NVL(A.ERI_CNCL_YN, 'N') <> 'Y'
)
UNION
SELECT 'TOTAL' ERI_ITEM_CD, '종합소견' IIM_SNME_NM, '7' IIM_RSLT_KD, '1' AS SEQ from dual
UNION
SELECT 'FIRPAN' ERI_ITEM_CD, '1차판정' IIM_SNME_NM, '7' IIM_RSLT_KD, '2' AS SEQ from dual
UNION
SELECT 'FIREX' ERI_ITEM_CD, '1차소견' IIM_SNME_NM,  '7' IIM_RSLT_KD, '2' AS SEQ from dual
UNION
SELECT 'SECEX' ERI_ITEM_CD, '2차소견' IIM_SNME_NM,  '7' IIM_RSLT_KD, '3' AS SEQ from dual
ORDER BY SEQ, ERI_ITEM_CD
		*/

		sql = " SELECT DISTINCT A.ERI_ITEM_CD, B.IIM_SNME_NM, B.IIM_RSLT_KD, '0' AS SEQ";
		sql += " FROM ET_RSLT_ITEM A JOIN IT_ITEM B";
		sql += " ON IIM_ITEM_CD = ERI_ITEM_CD";
		sql += " AND IIM_RSLT_KD <> '9'";
		sql += " WHERE ERI_EXAM_DT BETWEEN '" + DTERCPTFR + "'";
		sql += " AND '" + DTERCPTTO + "'";
		sql += " AND EXISTS (" + SRCPTSQL;
		sql += " AND A.ERI_EXAM_DT = EEA_EXAM_DT";
		sql += " AND A.ERI_EXAM_SQ = EEA_EXAM_SQ";
		sql += " AND NVL(A.ERI_CNCL_YN, 'N') <> 'Y' )";
		sql += " UNION";
		sql += " SELECT 'TOTAL' ERI_ITEM_CD, '종합소견' IIM_SNME_NM, '7' IIM_RSLT_KD, '1' AS SEQ";
		sql += " FROM DUAL";

		sql += " UNION";
		sql += " SELECT 'FIRPAN' ERI_ITEM_CD, '1차판정' IIM_SNME_NM, '7' IIM_RSLT_KD, '2' AS SEQ";
		sql += " FROM DUAL";

		sql += " UNION";
		sql += " SELECT 'FIREX' ERI_ITEM_CD, '1차소견' IIM_SNME_NM, '7' IIM_RSLT_KD, '2' AS SEQ";
		sql += " FROM DUAL";

		sql += " UNION";
		sql += " SELECT 'SECEX' ERI_ITEM_CD, '2차소견' IIM_SNME_NM, '7' IIM_RSLT_KD, '3' AS SEQ";
		sql += " FROM DUAL";

		sql += " UNION";
		sql += " SELECT STMCCHECK ERI_ITEM_CD, '기존위암자' IIM_SNME_NM,  '8' IIM_RSLT_KD, '4' AS SEQ";
		sql += " UNION";
		sql += " SELECT STMCPAN ERI_ITEM_CD, '위암판정' IIM_SNME_NM,  '8' IIM_RSLT_KD, '4' AS SEQ";
		sql += " UNION";
		sql += " SELECT STMCSO ERI_ITEM_CD, '위암소견' IIM_SNME_NM,  '8' IIM_RSLT_KD, '4' AS SEQ";

		sql += " UNION";
		sql += " SELECT COLOCHECK ERI_ITEM_CD, '기존대장암자' IIM_SNME_NM,  '8' IIM_RSLT_KD, '5' AS SEQ";
		sql += " UNION";
		sql += " SELECT COLOPAN ERI_ITEM_CD, '대장암판정' IIM_SNME_NM,  '8' IIM_RSLT_KD, '5' AS SEQ";
		sql += " UNION";
		sql += " SELECT COLOSO ERI_ITEM_CD, '대장암판정소견' IIM_SNME_NM,  '8' IIM_RSLT_KD, '5' AS SEQ";

		sql += " UNION";
		sql += " SELECT LIVERCHECK ERI_ITEM_CD, '기존간암자' IIM_SNME_NM,  '8' IIM_RSLT_KD, '6' AS SEQ";
		sql += " UNION";
		sql += " SELECT LIVERPAN ERI_ITEM_CD, '간암판정' IIM_SNME_NM,  '8' IIM_RSLT_KD, '6' AS SEQ";
		sql += " UNION";
		sql += " SELECT LIVERSO ERI_ITEM_CD, '간암판정소견' IIM_SNME_NM,  '8' IIM_RSLT_KD, '6' AS SEQ";

		sql += " UNION";
		sql += " SELECT BRSTCHECK ERI_ITEM_CD, '기존유방암자' IIM_SNME_NM,  '8' IIM_RSLT_KD, '7' AS SEQ";
		sql += " UNION";
		sql += " SELECT BRSTPAN ERI_ITEM_CD, '유방암판정' IIM_SNME_NM,  '8'' IIM_RSLT_KD, '7' AS SEQ";
		sql += " UNION";
		sql += " SELECT BRSTSO ERI_ITEM_CD, '유방암판정소견' IIM_SNME_NM,  '8' IIM_RSLT_KD, '7' AS SEQ";

		sql += " UNION";
		sql += " SELECT CRVCCHECK ERI_ITEM_CD, '기존자궁암자' IIM_SNME_NM,  '8' IIM_RSLT_KD, '8'' AS SEQ";
		sql += " UNION";
		sql += " SELECT CRVCPAN ERI_ITEM_CD, '자궁암판정' IIM_SNME_NM,  '8' IIM_RSLT_KD, '8' AS SEQ";
		sql += " UNION";
		sql += " SELECT CRVCSO ERI_ITEM_CD, '자궁암판정소견' IIM_SNME_NM,  '8' IIM_RSLT_KD, '8' AS SEQ";

		sql += " UNION";
		sql += " SELECT LUNGCHECK ERI_ITEM_CD, '기존폐암자' IIM_SNME_NM,  '8' IIM_RSLT_KD, '9' AS SEQ";
		sql += " UNION";
		sql += " SELECT LUNGPAN ERI_ITEM_CD, '폐암판정' IIM_SNME_NM,  '8' IIM_RSLT_KD, '9' AS SEQ";
		sql += " UNION";
		sql += " SELECT LUNGPANS ERI_ITEM_CD, '폐암범주' IIM_SNME_NM,  '8' IIM_RSLT_KD, '9' AS SEQ";
		sql += " UNION";
		sql += " SELECT LUNGPANT ERI_ITEM_CD, '폐암기타폐결절외 의미있는 소견' IIM_SNME_NM,  '8' IIM_RSLT_KD, '9' AS SEQ";
		sql += " UNION";
		sql += " SELECT LUNGSO ERI_ITEM_CD, '폐암판정권고' IIM_SNME_NM,  '8' IIM_RSLT_KD, '9' AS SEQ";
		sql += " UNION";
		sql += " SELECT LUNGSOS ERI_ITEM_CD, '폐암판정권고(폐결절)' IIM_SNME_NM,  '8' IIM_RSLT_KD, '9' AS SEQ";

		sql += " ORDER BY SEQ, ERI_ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMake_Excel_upSetGridColumn_001 \n";
			G_INFO += "설명 : 검진정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTERCPTFR : " + DTERCPTFR + " \n";
			G_INFO += " DTERCPTTO : " + DTERCPTTO + " \n";
			G_INFO += " SRCPTSQL : " + SRCPTSQL + " \n";
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
