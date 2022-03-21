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

		String ITEM_CD = htMethod.get("ITEM_CD");
		String SEX_CD = htMethod.get("SEX_CD");
		String AGE_V1 = htMethod.get("AGE_V1");
		String APLY_DT = htMethod.get("APLY_DT");
		String PANJ_CD = htMethod.get("PANJ_CD");
		String EXAM_CD = htMethod.get("EXAM_CD");

		//

		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(AGE_V1 == null) { AGE_V1 = ""; }
		if(APLY_DT == null) { APLY_DT = ""; }
		if(PANJ_CD == null) { PANJ_CD = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT  IIV_LOW_KD, IIV_RSLT_LOW, IIV_HIGH_KD, IIV_RSLT_HIGH ";
		sql += " FROM IT_ITEM_VLDT ";
		sql += " WHERE IIV_ITEM_CD  = '" + ITEM_CD + "' ";
		sql += " AND IIV_SEX_CD   = '" + SEX_CD + "' ";
		sql += " AND IIV_AGE_FR  <= '" + AGE_V1 + "' ";
		sql += " AND IIV_AGE_TO  >= '" + AGE_V1 + "' ";
		sql += " AND IIV_APLY_DT <= '" + APLY_DT + "' ";
		sql += " AND IIV_PANJ_CD  LIKE '" + PANJ_CD + "%'   ";
		sql += " AND IIV_EXAM_CD  = '" + EXAM_CD + "' ";
		sql += " AND IIV_USE_YN   = 'Y' ";
		sql += " ORDER BY IIV_APLY_DT DESC ";

			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uInsuranceReport_getHosVDL_001 \n";
		G_INFO += "설명 : 병원별 참고치 조회 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : 없음 \n";

		G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
		G_INFO += " SEX_CD : " + SEX_CD + " \n";
		G_INFO += " AGE_V1 : " + AGE_V1 + " \n";
		G_INFO += " APLY_DT : " + APLY_DT + " \n";
		G_INFO += " PANJ_CD : " + PANJ_CD + " \n";
		G_INFO += " EXAM_CD : " + EXAM_CD + " \n";

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
