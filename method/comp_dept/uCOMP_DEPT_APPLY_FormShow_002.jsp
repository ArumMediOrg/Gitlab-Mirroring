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
		String MNGT_YR = htMethod.get("MNGT_YR");
		String HALF_CD = htMethod.get("HALF_CD");
		String DEPT_CD = htMethod.get("DEPT_CD");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(HALF_CD == null) { HALF_CD = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

		*/

		sql = " SELECT C.ICY_COMP_NM, C.ICY_DISC_RT, C.ICY_COTK_CD, C.ICY_SUTK_YN, CASE WHEN D.ICD_HALF_CD IS NULL";
		sql += " OR D.ICD_HALF_CD = '' THEN D.ICD_HALF_CD ELSE '[' || D.ICD_HALF_CD || ']' || GETSP_COMMON_CDTONM('HM99F',D.ICD_HALF_CD) END ICD_HALF_NM, CASE WHEN D.ICD_TAGR_TM IS NULL";
		sql += " OR D.ICD_TAGR_TM = '' THEN D.ICD_TAGR_TM ELSE '[' || D.ICD_TAGR_TM || ']' || GETSP_COMMON_CDTONM('HM99B',D.ICD_TAGR_TM) END ICD_TAGR_NM, CASE WHEN C.ICY_TKCG_CD IS NULL";
		sql += " OR C.ICY_TKCG_CD = '' THEN C.ICY_TKCG_CD ELSE '[' || C.ICY_TKCG_CD || ']' || GETCOMMON_LVCDTONM('0804',C.ICY_TKCG_CD,'5',1) END ICD_TKCG_NM, CASE WHEN C.ICY_TBAS_CD IS NULL";
		sql += " OR C.ICY_TBAS_CD = '' THEN C.ICY_TBAS_CD ELSE '[' || C.ICY_TBAS_CD || ']' || GETCOMMON_LVCDTONM('0815',C.ICY_TBAS_CD,'5',1) END ICD_TBAS_NM, CASE WHEN C.ICY_TKDE_CD IS NULL";
		sql += " OR C.ICY_TKDE_CD = '' THEN C.ICY_TKDE_CD ELSE '[' || C.ICY_TKDE_CD || ']' || GETCOMMON_LVCDTONM('0814',C.ICY_TKDE_CD,'5',1) END ICD_TKDE_NM, D.*";
		sql += " FROM IT_COMP_DEPT D INNER JOIN IT_COMPANY C";
		sql += " ON D.ICD_COMP_CD = C.ICY_COMP_CD";
		sql += " AND C.ICY_DEPT_CD = '1'";
		sql += " AND C.ICY_USE_YN = 'Y'";
		sql += " WHERE D.ICD_COMP_CD = '" + COMP_CD + "'";
		sql += " AND D.ICD_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND D.ICD_HALF_CD = '" + HALF_CD + "'";
		sql += " AND D.ICD_DEPT_CD = '" + DEPT_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_DEPT_APPLY_FormShow_002 \n";
			G_INFO += "설명 : 특검검사 사업장부서 정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " HALF_CD : " + HALF_CD + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
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
