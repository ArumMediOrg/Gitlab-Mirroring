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

		//

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT ";
		sql += " (SUBSTR(B.ICR_PENL_ID,1,6) || '-' || SUBSTR(B.ICR_PENL_ID,7,1) || '******') AS EEA_JUMIN_NO, ";
		sql += " A.EEA_PSNL_NM, A.EEA_PSNL_AGE, B.ICR_SEX_KD, ";
		sql += " CASE WHEN B.ICR_SEX_KD = '1' THEN '남' ELSE '여' END SEX, ";
		sql += " (D.ICY_COMP_NM || ' ' || A.EEA_DEPT_NM) AS ICY_COMP_NM, ";
		sql += " A.EEA_ZIP_CD, (A.EEA_ZIP_AR || ' ' || A.EEA_ROAD_AR) AS EEA_ADDR_NM, ";
		sql += " D.ICY_ZIP_CD, (D.ICY_ZIP_AR || D.ICY_ROAD_AR) AS ICR_ADDR_NM, ";
		sql += " D.ICY_PRNT_ZIP_CD, (D.ICY_PRNT_ZIP_AR || D.ICY_PRNT_ROAD_AR) AS ICY_PRNT_ADDR_NM,  ";
		sql += " CASE WHEN A.EEA_MOBL_NO IS NULL OR A.EEA_MOBL_NO  = '' THEN A.EEA_TEL_NO ";
		sql += " 		ELSE A.EEA_MOBL_NO END EEA_PHONE_NO, ";
		sql += " C.SBE_JIJO_CD, A.EEA_ENTRY_DT, C.SBE_JUIP_DT, C.SBE_TPAN_NM, C.SBE_TBUS_NM, ";
		sql += " GetCOMMON_LvCdToNm('0824',C.SBE_JIJO_CD,'5',5) SF_NAME, ";
		sql += " C.SBE_REMARK_TX, C.SBE_ETC_TX, A.EEA_DEPT_NM ";
		sql += " FROM ET_EXAM_ACPT A ";
		sql += " INNER JOIN IT_CUSTOMER      B ON A.EEA_CUST_NO = B.ICR_CUST_NO ";
		sql += " LEFT OUTER JOIN ST_BASE     C ON A.EEA_EXAM_DT = C.SBE_EXAM_DT AND A.EEA_EXAM_SQ = C.SBE_EXAM_SQ ";
		sql += " LEFT OUTER JOIN IT_COMPANY  D ON A.EEA_COMP_CD = D.ICY_COMP_CD ";
		sql += " WHERE 0 = 0 ";
		sql += " AND A.EEA_EXAM_DT = '" + EXAM_DT + "' ";
		sql += " AND A.EEA_EXAM_SQ = '" + EXAM_SQ + "' ";

			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : ufireman_UP_SqlOpen_001 \n";
		G_INFO += "설명 : 접수정보로딩 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
		G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";

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
