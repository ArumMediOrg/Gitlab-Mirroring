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

		String FROM_DT = htMethod.get("FROM_DT");
		String TO_DT = htMethod.get("TO_DT");
		String EXAM_YR = htMethod.get("EXAM_YR");
		String BILL_FL = htMethod.get("BILL_FL");

		if(FROM_DT == null) { FROM_DT = ""; }
		if(TO_DT == null) { TO_DT = ""; }
		if(EXAM_YR == null) { EXAM_YR = ""; }
		if(BILL_FL == null) { BILL_FL = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT a.IIC_ITEM_CD,	b.IIP_GBSG_PR,	b.IIP_GASN_PR, a.IIC_CAN_KD,  ";
		sql += " 	d.EEA_EXAM_DT , d.EEA_EXAM_SQ , d.EEA_ENTY_CD , d.EEA_CNTR_CD ,   ";
		sql += " 	d.EEA_UTER_CD , d.EEA_COLON_CD, d.EEA_HOLIDAY_YN , d.EEA_SAFE_YN, ";
		sql += "    d.EEA_STOMA_CD, d.EEA_CANAD_KD                                    ";
		sql += " FROM IT_ITEM_CALL a, IT_ITEM_PRICE b, ET_RSLT_ITEM c ";
		sql += " Inner join ET_EXAM_ACPT d On ERI_EXAM_DT = EEA_EXAM_DT ";
		sql += " 						And ERI_EXAM_SQ = EEA_EXAM_SQ ";
		sql += " Inner join BT_BILLHN_PR e ON ERI_EXAM_DT = BBP_EXAM_DT ";
		sql += " 						And ERI_EXAM_SQ = BBP_EXAM_SQ ";
		sql += " Where BBP_CHUNG_DT Between '" + FROM_DT + "' AND '" + TO_DT + "' ";
		sql += " And BBP_BILL_FL   = '" + BILL_FL + "' ";
		sql += " AND BBP_RETURN_KD = '0' ";
		sql += " And IIC_EXAM_YR = '" + EXAM_YR + "' ";
		sql += " AND ( ";
		sql += " 	SUBSTR(IIC_CAN_KD, 1, 1) <> '0' OR ";
		sql += " 	SUBSTR(IIC_CAN_KD, 2, 1) <> '0' OR ";
		sql += " 	SUBSTR(IIC_CAN_KD, 3, 1) <> '0' OR ";
		sql += " 	SUBSTR(IIC_CAN_KD, 4, 1) <> '0' OR ";
		sql += " 	SUBSTR(IIC_CAN_KD, 5, 1) <> '0' OR ";
		sql += " 	SUBSTR(IIC_CAN_KD, 6, 1) <> '0'    ) ";
		sql += " AND IIP_APLY_DT = GetITEM_PRICE_ApplyDate(a.IIC_ITEM_CD, '" + EXAM_YR + "-12-31', 'ITEM_CD') ";
		sql += " AND b.IIP_ITEM_CD = a.IIC_ITEM_CD ";
		sql += " AND upper(IIP_USE_YN) = 'Y' ";
		sql += " AND IIP_ITEM_CD <> 'M0029' ";
		sql += " AND c.ERI_ITEM_CD = a.IIC_ITEM_CD ";
		sql += " AND upper(ERI_CNCL_YN) <> 'Y' ";
		sql += " AND ERI_CNCL_YN  <> 'Y' ";
		sql += " AND NVL(ERI_HLTH_KD, ' ') >= '1' ";
		sql += " ORDER BY EEA_EXAM_DT, EEA_EXAM_SQ, replace(IIC_CAN_KD, '0', '9'), IIC_ITEM_CD ";


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UChungfile2020_JSON_UDP_UINT_CHUNGPER_005 \n";
			G_INFO += "설명 : 암검진 건보수가 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " FROM_DT : " + FROM_DT + " \n";
			G_INFO += " TO_DT : " + TO_DT + " \n";
			G_INFO += " EXAM_YR : " + EXAM_YR + " \n";
			G_INFO += " BILL_FL : " + BILL_FL + " \n";
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
