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

		String COMP_CD = htMethod.get("COMP_CD");
		String SALE_CD = htMethod.get("SALE_CD");
		String ITKD_CD = htMethod.get("ITKD_CD");
		String CALC_CD = htMethod.get("CALC_CD");
		String TBAS_CD = htMethod.get("TBAS_CD");
		String SPEDTBEE_MNGT_YR = htMethod.get("SPEDTBEE_MNGT_YR");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(SALE_CD == null) { SALE_CD = ""; }
		if(ITKD_CD == null) { ITKD_CD = ""; }
		if(CALC_CD == null) { CALC_CD = ""; }
		if(TBAS_CD == null) { TBAS_CD = ""; }
		if(SPEDTBEE_MNGT_YR == null) { SPEDTBEE_MNGT_YR = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT " + COMP_CD + " BEE_COMP_NM, " + SALE_CD + " BEE_SALE_NM";
		sql += ", CASE WHEN BEE_ITKD_CD IS NULL OR BEE_ITKD_CD = '' THEN BEE_ITKD_CD ELSE '[' || BEE_ITKD_CD || ']' || " + ITKD_CD + " END BEE_ITKD_NM";
		sql += ", CASE WHEN BEE_CALC_CD IS NULL OR BEE_CALC_CD = '' THEN BEE_CALC_CD ELSE '[' || BEE_CALC_CD || ']' || " + CALC_CD + " END BEE_CALC_NM";
		sql += ", CASE WHEN BEE_TBAS_CD IS NULL OR BEE_TBAS_CD = '' THEN BEE_TBAS_CD ELSE '[' || BEE_TBAS_CD || ']' || " + TBAS_CD + " END BEE_TBAS_NM";
		sql += ", CASE WHEN BEE_SALE_CD IS NULL OR BEE_SALE_CD = '' THEN BEE_SALE_CD ELSE '[' || BEE_SALE_CD || ']' || " + SALE_CD + " END BEE_SALE_FNM";
		sql += ", A.*";
		sql += " FROM BT_ESTIMATE A";
		sql += " WHERE 0 = 0";
		sql += " AND BEE_MNGT_YR = '" + SPEDTBEE_MNGT_YR + "'";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTIMATE_BtnJ_DELETEClick_002 \n";
			G_INFO += "설명 : 검진정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " SALE_CD : " + SALE_CD + " \n";
			G_INFO += " ITKD_CD : " + ITKD_CD + " \n";
			G_INFO += " CALC_CD : " + CALC_CD + " \n";
			G_INFO += " TBAS_CD : " + TBAS_CD + " \n";
			G_INFO += " SPEDTBEE_MNGT_YR : " + SPEDTBEE_MNGT_YR + " \n";
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
