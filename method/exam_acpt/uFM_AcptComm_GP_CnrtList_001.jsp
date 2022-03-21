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

		String ENCRT_KD = htMethod.get("ENCRT_KD");
		String COMP_CD = htMethod.get("COMP_CD");
		String COMP_NM = htMethod.get("COMP_NM");
		String CUST_NM = htMethod.get("CUST_NM");
		String RSVT_DT = htMethod.get("RSVT_DT");
		String MNGT_YR = htMethod.get("MNGT_YR");

		//
		if(ENCRT_KD == null) { ENCRT_KD = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(COMP_NM == null) { COMP_NM = ""; }
		if(CUST_NM == null) { CUST_NM = ""; }
		if(RSVT_DT == null) { RSVT_DT = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }

		// DB객체
		stmtList = connect.createStatement();

		if(ENCRT_KD.equals("2")) {
			sql = " SELECT ECL_DECRYPT(C.ECT_PID_EN) PENL_DE,";
		} else {
			sql = " SELECT C.ECT_PENL_ID PENL_DE,";
		}

		sql += " C.ECT_PID_EN PENL_EN, B.ICD_MNGT_YR MNGT_YR, '41001' EXAM_CD, C.ECT_CNRT_SQ CNRT_SQ, B.ICD_HALF_CD || B.ICD_DEPT_CD CNRT_SQ2, ";
		sql += " B.ICD_MNGT_YR||'-'||B.ICD_HALF_CD||B.ICD_DEPT_CD EXAM_DP, B.ICD_DEPT_NM||'-'||B.ICD_SUBD_NM||'('||F_CODE_FIND('0910', B.ICD_SPCL_CD, '', '1')||')' EXAM_NM, ";
		sql += " ' ~ ' CNRT_DT, C.ECT_MEMO_TX MEMO_TX, C.ECT_CUST_SQ CUST_SQ, C.ECT_CUST_NM CUST_NM, C.ECT_SEX_CD SEX_CD, C.ECT_BITH_DT BITH_DT, ";
		sql += " B.ICD_DEPT_CD DEPT_CD, B.ICD_DEPT_NM DEPT_NM, C.ECT_EMPL_CD EMPL_CD, C.ECT_RSVT_DT RSVT_DT, C.ECT_COTK_YN COTK_YN, A.ICY_COMP_CD COMP_CD, ";
		sql += " A.ICY_COMP_NM COMP_NM, A.ICY_COTK_CD COTK_CD, F_TEL_FORMAT(C.ECT_MOBL_NO) MOBL_NO, C.ECT_EXAM_DT EXAM_DT, C.ECT_EXAM_SQ EXAM_SQ, C.ECT_QSTN_NO QSTN_NO";
		sql += " FROM IT_COMPANY A, IT_COMP_DEPT B, ET_COMP_CNRT_CUST C";

		if(! COMP_CD.equals("")) {
			sql += " WHERE A.ICY_COMP_CD = '" + COMP_CD + "'";
		} else  {
			sql += " WHERE A.ICY_COMP_NM LIKE '%" + COMP_NM + "%'";
		}

		if(! CUST_NM.equals("")) {
			sql += " AND C.ECT_CUST_NM LIKE '%" + CUST_NM + "%'";
		}


		if(! RSVT_DT.equals("")) {
			sql += " AND C.ECT_RSVT_DT = '" + RSVT_DT + "'";
		}

		sql += " AND B.ICD_COMP_CD = A.ICY_COMP_CD";
		sql += " AND B.ICD_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND UPPER(B.ICD_TCHK_YN) = 'Y'";
		sql += " AND UPPER(B.ICD_USE_YN) = 'Y'";
		sql += " AND C.ECT_COMP_CD = B.ICD_COMP_CD";
		sql += " AND C.ECT_MNGT_YR = B.ICD_MNGT_YR";
		sql += " AND C.ECT_HALF_CD = B.ICD_HALF_CD";
		sql += " AND C.ECT_DEPT_CD = B.ICD_DEPT_CD";
		sql += " AND UPPER(C.ECT_COTK_YN) = 'Y'";
		sql += " AND UPPER(C.ECT_USE_YN) = 'Y'";
		sql += " AND (";
		sql += "	NVL(C.ECT_EXAM_DT, ' ') = ' '";
		sql += " 	OR NVL(C.ECT_EXAM_SQ, ' ') = ' '";
		sql += " )";
		sql += " AND NVL(C.ECT_RSVT_NO, ' ') = ' '";
		sql += " ORDER BY B.ICD_DEPT_NM, B.ICD_SUBD_NM, C.ECT_CUST_NM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_CnrtList_001 \n";
			G_INFO += "설명 : 특검 부서 명단 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ENCRT_KD : " + ENCRT_KD + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " COMP_NM : " + COMP_NM + " \n";
			G_INFO += " CUST_NM : " + CUST_NM + " \n";
			G_INFO += " RSVT_DT : " + RSVT_DT + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
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
