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

		String SPRKIND = htMethod.get("SPRKIND");
		String SAPPLYDATE = htMethod.get("SAPPLYDATE");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String CNRT_SQ = htMethod.get("CNRT_SQ");
		String PROF_SQ = htMethod.get("PROF_SQ");

		//
		if(SPRKIND == null) { SPRKIND = ""; }
		if(SAPPLYDATE == null) { SAPPLYDATE = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.ECI_ITEM_CD, C.IIM_KNME_NM AS ECI_ITEM_NM, C.IIM_OSCD_CD AS ECI_OSCD_CD,

if :sPrKind = '1' then          // 병원수가
     B.IIP_JCSG_PR ECI_ITEM_PR,
if :sPrKind = '2' then          // 의보수가
     B.IIP_HESG_PR ECI_ITEM_PR,
if :sPrKind = '3' then          // 건보수가
     B.IIP_GBSG_PR ECI_ITEM_PR,
if :sPrKind = '4' then          // 산보수가
     B.IIP_SBSG_PR ECI_ITEM_PR,
if :sPrKind = '5' then          // 특기업수가
     B.IIP_TGSG_PR ECI_ITEM_PR,

  A.ECI_CNRT_PR, A.ECI_SORT_SQ
FROM ET_COMP_CNRT_PROF_ITEM A INNER JOIN IT_ITEM_PRICE B ON
    A.ECI_ITEM_CD = B.IIP_ITEM_CD and GetITEM_PRICE_ApplyDate(ECI_ITEM_CD, :sApplyDate,'ITEM_CD') = B.IIP_APLY_DT
INNER JOIN IT_ITEM C ON A.ECI_ITEM_CD = C.IIM_ITEM_CD
WHERE A.ECI_COMP_CD = :COMP_CD
  AND A.ECI_MNGT_YR = :MNGT_YR
  AND A.ECI_CNRT_SQ = :CNRT_SQ
  AND A.ECI_PROF_SQ = :PROF_SQ
ORDER BY A.ECI_SORT_SQ
		*/

		sql = " SELECT A.ECI_ITEM_CD, C.IIM_KNME_NM AS ECI_ITEM_NM, C.IIM_OSCD_CD AS ECI_OSCD_CD,";

		if(SPRKIND.equals("1")) {
			sql += " B.IIP_JCSG_PR ECI_ITEM_PR,";
		}
		else if(SPRKIND.equals("2")) {
			sql += " B.IIP_HESG_PR ECI_ITEM_PR,";
		}
		else if(SPRKIND.equals("3")) {
			sql += " B.IIP_GBSG_PR ECI_ITEM_PR,";
		}
		else if(SPRKIND.equals("4")) {
			sql += " B.IIP_SBSG_PR ECI_ITEM_PR,";
		}
		else if(SPRKIND.equals("5")) {
			sql += " B.IIP_TGSG_PR ECI_ITEM_PR,";
		}

		sql += " A.ECI_CNRT_PR, A.ECI_SORT_SQ";
		sql += " FROM ET_COMP_CNRT_PROF_ITEM A INNER JOIN IT_ITEM_PRICE B";
		sql += " ON A.ECI_ITEM_CD = B.IIP_ITEM_CD";
		sql += " AND GETITEM_PRICE_APPLYDATE(ECI_ITEM_CD, '" + SAPPLYDATE + "','ITEM_CD') = B.IIP_APLY_DT INNER JOIN IT_ITEM C";
		sql += " ON A.ECI_ITEM_CD = C.IIM_ITEM_CD";
		sql += " WHERE A.ECI_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.ECI_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND A.ECI_CNRT_SQ = '" + CNRT_SQ + "'";
		sql += " AND A.ECI_PROF_SQ = '" + PROF_SQ + "'";
		sql += " ORDER BY A.ECI_SORT_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_PROF_TRNS_UP_SearchPORF_ITEM_001 \n";
			G_INFO += "설명 : 검사항목 수가 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SPRKIND : " + SPRKIND + " \n";
			G_INFO += " SAPPLYDATE : " + SAPPLYDATE + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
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
