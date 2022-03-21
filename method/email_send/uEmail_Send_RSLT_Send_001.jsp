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
		String EXAM_YR = htMethod.get("EXAM_YR");

		//

		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(EXAM_YR == null) { EXAM_YR = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT ERI_EXAM_DT, ERI_EXAM_SQ, IIM_ITEM_CD, IIM_KNME_NM, ERI_RSLT_VL, ERI_VLDT_LH, ERI_RSLT_EX, ";
		sql += " CASE WHEN ERI_CHAR_VAL <> ' ' THEN ERI_CHAR_VAL ";
		sql += " ELSE ERI_RSLT_LOW || ' ' || ";
		sql += " (CASE WHEN ERI_LOW_KD = '1' THEN '이상' WHEN ERI_LOW_KD = '2' THEN '초과' ";
		sql += " WHEN ERI_LOW_KD = '3' THEN '이하' WHEN ERI_LOW_KD = '4' THEN '미만' END) || ' ' || ";
		sql += " ERI_RSLT_HIGH || ' ' || ";
		sql += " (CASE WHEN ERI_HIGH_KD = '1' THEN '이상' WHEN ERI_HIGH_KD = '2' THEN '초과' ";
		sql += " WHEN ERI_HIGH_KD = '3' THEN '이하' WHEN ERI_HIGH_KD = '4' THEN '미만' END) ";
		sql += " end ERI_VLSV_VL, ERI_RSLT_UNIT, IIC_RSLT_GROUP ";
		sql += " from ET_RSLT_ITEM A ";
		sql += " INNER JOIN IT_ITEM B ON B.IIM_ITEM_CD = A.ERI_ITEM_CD ";
		sql += " INNER JOIN IT_ITEM_CALL C ON C.IIC_ITEM_CD = A.ERI_ITEM_CD ";
		sql += " Where ERI_EXAM_DT = '" + EXAM_DT + "' ";
		sql += " And   ERI_EXAM_SQ = '" + EXAM_SQ + "' ";
		sql += " AND SUBSTR(ERI_ITEM_CD,1,1) NOT IN ('M','R') ";
		sql += " AND NVL(ERI_CNCL_YN, 'N') <> 'Y' ";
		sql += " AND IIM_RSLT_KD <> '9' ";
		sql += " AND IIC_EXAM_YR = '" + EXAM_YR + "' ";


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uEmail_Send_RSLT_Send_001 \n";
			G_INFO += "설명 : 결과전송 결과정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " EXAM_YR : " + EXAM_YR + " \n";
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
