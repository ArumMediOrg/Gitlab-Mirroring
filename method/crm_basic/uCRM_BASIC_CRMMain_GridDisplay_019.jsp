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

	ResultSetMetaData rsmd = null;

	CRs cRsList = null;

	//
	String G_INFO = "";

	int colCnt = 0;

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String SCUST_NO = htMethod.get("SCUST_NO");
		String SSQL_ADD1 = htMethod.get("SSQL_ADD1");

		//
		if(SCUST_NO == null) { SCUST_NO = ""; }
		if(SSQL_ADD1 == null) { SSQL_ADD1 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT B.EEA_CHART_NO, ";
		sql += " 	GetCOMMON_LvCdToNm('0427',A.SAE_ADVI_CD,'5',1) SAE_ADVI_NM, ";
		sql += " 	GetCOMMON_LvCdToNm('0910',B.EEA_SPCL_CD,'5',2) EEA_SPCL_NM, ";
		sql += " 	F_USER_FIND(A.SAE_NURSE_ID) SAE_NURSE_NM, ";
		sql += " 	F_USER_FIND(A.SAE_DOCT_ID) SAE_DOCT_NM, ";
		sql += "    C.CAP_RSVN_DT, C.CAP_RSVN_TM, C.CAP_PLAN_TX, ";
		sql += " 	A.* ";
		sql += " FROM ST_ADVICE A ";
		sql += " Left Outer Join ET_EXAM_ACPT B ON A.SAE_EXAM_DT = B.EEA_EXAM_DT ";
		sql += " 						AND A.SAE_EXAM_SQ = B.EEA_EXAM_SQ ";
		sql += " Left Outer Join CR_ADVICE_PLAN C ON C.CAP_EXAM_DT = A.SAE_EXAM_DT ";
        sql += "                        AND C.CAP_EXAM_SQ = A.SAE_EXAM_SQ ";
		sql += " WHERE A.SAE_CUST_NO  = '" + SCUST_NO + "' ";
		sql += " AND NVL(A.SAE_USE_YN, 'Y') <> 'N' ";
		sql += SSQL_ADD1;
		sql += " ORDER BY A.SAE_ADVI_DT DESC, A.SAE_ADVI_SQ DESC ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_CRMMain_GridDisplay_019 \n";
			G_INFO += "설명 : 상담관리-접수-상담정보 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";

			G_INFO += " SCUST_NO : " + SCUST_NO + " \n";
			G_INFO += " SSQL_ADD1 : " + SSQL_ADD1 + " \n";
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
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:basetable='DUAL' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
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
