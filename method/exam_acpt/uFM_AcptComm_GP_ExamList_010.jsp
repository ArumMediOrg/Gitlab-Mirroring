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

		String MNGT_YR = htMethod.get("MNGT_YR");
		String ITEM_KD = htMethod.get("ITEM_KD");
		String PRCE_DT = htMethod.get("PRCE_DT");
		String CALC_CD = htMethod.get("CALC_CD");
		String ITEM_CD = htMethod.get("ITEM_CD");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ITEM_KD == null) { ITEM_KD = ""; }
		if(PRCE_DT == null) { PRCE_DT = ""; }
		if(CALC_CD == null) { CALC_CD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT '" + MNGT_YR + "' EXAM_YR, LTRIM(RTRIM(A.IIM_ITEM_CD)) EXAM_CD, '' EXAM_SQ, ";
		sql += " LTRIM(RTRIM(A.IIM_ITEM_CD)) EXAM_DP, LTRIM(RTRIM(A.IIM_KNME_NM)) EXAM_NM";
		sql += ", CASE WHEN '" + MNGT_YR + "' < '2018' THEN A.IIM_GBHC_KD ";
		sql += " ELSE CASE WHEN '" + ITEM_KD + "' = '9' THEN '000000'||F_ITEM_CALL('C', '" + MNGT_YR + "', A.IIM_ITEM_CD) ";
		sql += " ELSE F_ITEM_CALL('H', '" + MNGT_YR + "', A.IIM_ITEM_CD) END END AS GBHC_KD";
		sql += ", '" + PRCE_DT + "' PRCE_DT, F_PRICE_KIND('4') CALC_CD, A.IIM_ITEM_CD ITEM_LT";
		sql += ", CASE '" + CALC_CD + "' WHEN '0' THEN 0 WHEN '1' THEN B.IIP_JCSG_PR WHEN '2' THEN B.IIP_HESG_PR WHEN '3' THEN B.IIP_GBSG_PR ";
		sql += " WHEN '4' THEN B.IIP_SBSG_PR WHEN '5' THEN B.IIP_TGSG_PR END AS EXAM_PR ";
		sql += ", B.IIP_JCSG_PR JCSG_PR, B.IIP_HESG_PR HESG_PR, B.IIP_GBSG_PR GBSG_PR, B.IIP_SBSG_PR SBSG_PR, B.IIP_TGSG_PR TGSG_PR, A.IIM_CNIT_CD CNIT_CD ";
		sql += " FROM IT_ITEM A, IT_ITEM_PRICE B";
		sql += " WHERE A.IIM_ITEM_CD = '" + ITEM_CD + "'";
		sql += " AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(A.IIM_ITEM_CD, '" + PRCE_DT + "', 'ITEM_CD')";
		sql += " AND B.IIP_ITEM_CD = A.IIM_ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamList_010 \n";
			G_INFO += "설명 : 개별 검사항목 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ITEM_KD : " + ITEM_KD + " \n";
			G_INFO += " PRCE_DT : " + PRCE_DT + " \n";
			G_INFO += " CALC_CD : " + CALC_CD + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
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
			} else if (rsmd.getColumnTypeName(colCnt).equals("DATE")){  //why doesn't working?
				//<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
				dataType = "dateTime";
				maxLength = "20";
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
