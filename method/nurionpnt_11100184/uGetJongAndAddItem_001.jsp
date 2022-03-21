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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String CBVIEW_NO = htMethod.get("CBVIEW_NO");
		String SSQLADD = htMethod.get("SSQLADD");

		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CBVIEW_NO == null) { CBVIEW_NO = ""; }
		if(SSQLADD == null) { SSQLADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql += "   select ET_EXAM_ACPT.EEA_ACPT_TX,  ET_EXAM_ACPT.EEA_DEPT_NM,   ET_EXAM_ACPT.EEA_PSNL_AGE, ET_EXAM_ACPT.EEA_EXAM_DT, ";
		sql += " 		ET_EXAM_ACPT.EEA_EXAM_SQ,  ET_EXAM_ACPT.EEA_PSNL_NM,   IT_CUSTOMER.ICR_PENL_ID,   ET_EXAM_ACPT.EEA_CHART_NO, ";
		sql += " 		ET_EXAM_ACPT.EEA_ZIP_AR,   ET_EXAM_ACPT.EEA_ROAD_AR,   ET_EXAM_ACPT.EEA_SEX_CD,   ET_EXAM_ACPT.EEA_ZIP_CD, ";
		sql += " 		ET_RSLT_ITEM.ERI_RSLT_KD,  ET_RSLT_ITEM.ERI_CHAR_VAL,  ET_RSLT_ITEM.ERI_ITEM_CD,  ET_RSLT_ITEM.ERI_RSLT_VL, ";
		sql += " 		ET_RSLT_ITEM.ERI_VLDT_LH,  ET_RSLT_ITEM.ERI_RSLT_UNIT, ET_RSLT_ITEM.ERI_RSLT_EX, ";
		sql += " 		IT_ITEM.IIM_REJH_EX,       IT_ITEM.IIM_SNME_NM, ET_RSLT_ITEM.ERI_RSLT_LOW , ET_RSLT_ITEM.ERI_RSLT_HIGH , ";
		sql += " 		CASE WHEN ERI_RSLT_KD = '7' AND (RTRIM(ERI_RSLT_EX) = '' OR ERI_RSLT_EX IS NULL) THEN '2' ELSE ERI_RSLT_KD END AS ERI_SORT_FST, ";
		sql += " 		ET_RSLT_ITEM.ERI_SORT_SQ,  ICY_COMP_NM ";
		sql += " From ET_EXAM_ACPT ";
		sql += " inner join IT_CUSTOMER  ON ET_EXAM_ACPT.EEA_CUST_NO = IT_CUSTOMER.ICR_CUST_NO ";
		sql += " inner join ET_RSLT_ITEM ON ET_EXAM_ACPT.EEA_EXAM_DT = ET_RSLT_ITEM.ERI_EXAM_DT ";
		sql += " 						and ET_EXAM_ACPT.EEA_EXAM_SQ = ET_RSLT_ITEM.ERI_EXAM_SQ ";
		sql += " inner join IT_ITEM ON ET_RSLT_ITEM.ERI_ITEM_CD = IT_ITEM.IIM_ITEM_CD ";
		sql += " 	LEFT OUTER JOIN IT_COMPANY C ON ET_EXAM_ACPT.EEA_COMP_CD = C.ICY_COMP_CD ";
		sql += " where EEA_EXAM_DT = '" + EXAM_DT + "' ";
		sql += " 	and EEA_EXAM_SQ = '" + EXAM_SQ + "' ";
		sql += " 	and NVL(ERI_CNCL_YN, 'N') <> 'Y' ";
		sql += " 	and NVL(ERI_RSLT_KD, ' ') <> '9' ";
		sql += " 	and NVL(IIM_RSLT_KD, '9') <> '9' ";
		sql += " 	and (ERI_RSLT_VL <> ' ' OR ERI_RSLT_EX <> ' ') ";

		if (! SSQLADD.equals("")) {
			sql += " and (ERI_ADD_KD IN ('1', '7') or ERI_ETC_KD ='1' or ERI_ITEM_CD IN " + SSQLADD + ") ";
		} else {
			sql += " and (ERI_ADD_KD IN ('1', '7') or ERI_ETC_KD = '1') ";
		}

		if (CBVIEW_NO.equals("0")) {
			sql += " union ";
			sql += " Select ET_EXAM_ACPT.EEA_ACPT_TX, ET_EXAM_ACPT.EEA_DEPT_NM, ET_EXAM_ACPT.EEA_PSNL_AGE, SSV_EXAM_DT EEA_EXAM_DT, ";
			sql += " 		SSV_EXAM_SQ EEA_EXAM_SQ,  ET_EXAM_ACPT.EEA_PSNL_NM, IT_CUSTOMER.ICR_PENL_ID,   ET_EXAM_ACPT.EEA_CHART_NO, ";
			sql += " 		ET_EXAM_ACPT.EEA_ZIP_AR,  ET_EXAM_ACPT.EEA_ROAD_AR, ET_EXAM_ACPT.EEA_SEX_CD,   ET_EXAM_ACPT.EEA_ZIP_CD, ";
			sql += " 		'99' ERI_RSLT_KD,       ' ' ERI_CHAR_VAL,       'X999' ERI_ITEM_CD,      ' ' ERI_RSLT_VL, ";
			sql += " 		' ' ERI_VLDT_LH,        ' ' ERI_RSLT_UNIT, ";
			sql += " 		CASE WHEN SSV_VIEW_EX IS NULL THEN '' ELSE 'X999' END AS ERI_RSLT_EX, ";
			sql += " 		' ' IIM_REJH_EX,        '종합소견' IIM_SNME_NM, ' ' ERI_RSLT_LOW,        ' ' ERI_RSLT_HIGH, ";
			sql += " 			'99' ERI_SORT_FST,      99999 ERI_SORT_SQ,        ICY_COMP_NM ";
			sql += " From ST_SYTH_VIEW left outer join ET_EXAM_ACPT  ON ET_EXAM_ACPT.EEA_EXAM_DT = ST_SYTH_VIEW.SSV_EXAM_DT ";
			sql += " 												AND ET_EXAM_ACPT.EEA_EXAM_SQ = ST_SYTH_VIEW.SSV_EXAM_SQ ";
			sql += " 		LEFT OUTER JOIN IT_COMPANY C ON ET_EXAM_ACPT.EEA_COMP_CD = C.ICY_COMP_CD ";
			sql += " 		LEFT join IT_CUSTOMER  ON  ET_EXAM_ACPT.EEA_CUST_NO = IT_CUSTOMER.ICR_CUST_NO ";
			sql += " where SSV_EXAM_DT = '" + EXAM_DT + "' ";
			sql += " 	and SSV_EXAM_SQ = '" + EXAM_SQ + "' ";
		}

		sql += " order by ERI_ITEM_CD ";

			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uGetJongAndAddItem_001 \n";
		G_INFO += "설명 : 종검, 추가검사 항목 조회 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
		G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
		G_INFO += " CBVIEW_NO : " + CBVIEW_NO + " \n";
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
