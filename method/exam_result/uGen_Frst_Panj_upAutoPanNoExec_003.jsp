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

		String ASPACCODE = htMethod.get("ASPACCODE");
		String ASXRAYKD = htMethod.get("ASXRAYKD");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		if(ASPACCODE == null) { ASPACCODE = ""; }
		if(ASXRAYKD == null) { ASXRAYKD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT * ";
		sql += " FROM ( ";
		sql += " 		SELECT CCN_LARGE, SUBSTR(CCN_SMALL,1,2) PACK_CD, ";
		sql += " 				CASE WHEN  '" + ASPACCODE + "'   = '01' THEN ";
		sql += " 					 CASE   '" + ASXRAYKD + "'  WHEN '1' THEN 'F0001' ";
		sql += " 												WHEN '2' THEN 'F0003' ";
		sql += " 												WHEN '3' THEN 'F0007' ";
		sql += " 												WHEN '4' THEN 'F0014' ";
		sql += " 												ELSE 'F0014' END ";
		sql += " 					ELSE SUBSTR(CCN_SMALL,3,5) END AS ITEM_CD, ";
		sql += " 				CCN_LEVEL, CCN_FULL_NM, CCN_USE_YN ";
		sql += " 		FROM CT_COMMON ";
		sql += " 		WHERE CCN_LARGE = '0423' ";
		sql += " 			AND CCN_LEVEL = '5' ";
		sql += " 	) AA ";
		sql += " LEFT OUTER JOIN ( ";
		sql += " 					SELECT ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD, ERI_RSLT_VL, (ERI_RSLT_LOW ||' - '|| ERI_RSLT_HIGH) LH ";
		sql += " 						, ERI_WOSB_PANJ, ERI_HERT_CD, ERI_VLDT_LH, IIM_SNME_NM, PFP_RESULTRD_1, PFP_RESULTRD_2 ";
		sql += " 					FROM ET_RSLT_ITEM A ";
		sql += " 					LEFT OUTER JOIN IT_ITEM B ";
		sql += " 						ON A.ERI_ITEM_CD=B.IIM_ITEM_CD ";
		sql += " 					LEFT OUTER JOIN PT_FIR_PANJUNG C  ON A.ERI_EXAM_DT=c.PFP_EXAM_DT and a.ERI_EXAM_sq = c.PFP_EXAM_sq ";
		sql += " 					WHERE ERI_EXAM_DT = '" + EXAM_DT + "' ";
		sql += " 					AND ERI_EXAM_SQ = '" + EXAM_SQ + "' ";
		sql += " 					AND NVL(ERI_RSLT_VL, ' ') <> ' ' ";
		sql += " 					AND (ERI_HTSB_PANJ NOT LIKE '%A%' OR ERI_HERT_CD IS NOT NULL) ";
		sql += " 				) BB ";
		sql += " 	ON AA.ITEM_CD = BB.ERI_ITEM_CD ";
		sql += " WHERE ERI_EXAM_DT IS NOT NULL  AND PACK_CD = '" + ASPACCODE + "' ";
		sql += SSQL_ADD;

			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uGen_Frst_Panj_upAutoPanNoExec_003 \n";
		G_INFO += "설명 : 노동부자동판정 (판정항목관련 일괄조회) \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";

		G_INFO += " ASPACCODE : " + ASPACCODE + " \n";
		G_INFO += " ASXRAYKD : " + ASXRAYKD + " \n";
		G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
		G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
