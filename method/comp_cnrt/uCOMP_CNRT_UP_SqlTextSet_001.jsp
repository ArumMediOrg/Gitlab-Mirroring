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
		String CNRT_SQ = htMethod.get("CNRT_SQ");
		String CHKBOXUSE = htMethod.get("CHKBOXUSE");
		String SSORT_NM = htMethod.get("SSORT_NM");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }
		if(CHKBOXUSE == null) { CHKBOXUSE = ""; }
		if(SSORT_NM == null) { SSORT_NM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT TO_NUMBER(ROW_NUMBER() OVER (PARTITION BY ECT_CNRT_SQ ORDER BY ECT_CUST_SQ)) ECT_SQ";

		sql += ", CASE WHEN D.ICD_SUBD_NM IS NULL OR D.ICD_SUBD_NM = '' THEN";
		sql += "	'[' || D.ICD_DEPT_CD || ']' || D.ICD_DEPT_NM";
		sql += " ELSE";
		sql += " '[' || D.ICD_DEPT_CD || ']' || D.ICD_DEPT_NM || '(' || D.ICD_SUBD_NM || ')' END ECT_DEPT_CNM";

		sql += ", CASE WHEN P.ECP_PROF_TL IS NULL OR P.ECP_PROF_TL = '' THEN";
		sql += " '[' || P.ECP_PROF_SQ || ']' || P.ECP_PROF_NM";
		sql += " ELSE";
		sql += " '[' || P.ECP_PROF_SQ || ']' || '(' || P.ECP_PROF_TL || ')' || P.ECP_PROF_NM END ECT_PROF_NM";

		sql += ", SUBSTR(CASE WHEN C.ECT_SEX_CD IS NULL OR C.ECT_SEX_CD = '' THEN C.ECT_SEX_CD ELSE '[' || C.ECT_SEX_CD || ']' || GETCOMMON_LVCDTONM('0411',C.ECT_SEX_CD,'5',1) END,1,30) ECT_SEX_NM";
		sql += ", SUBSTR(CASE WHEN C.ECT_HALF_CD IS NULL OR C.ECT_HALF_CD = '' THEN C.ECT_HALF_CD ELSE '[' || C.ECT_HALF_CD || ']' || GETSP_COMMON_CDTONM('HM99F',C.ECT_HALF_CD) END,1,30) ECT_HALF_NM";
		sql += ", SUBSTR(CASE WHEN C.ECT_INPT_ID IS NULL OR C.ECT_INPT_ID = '' THEN C.ECT_INPT_ID ELSE '[' || C.ECT_INPT_ID || ']' || GETSALE_IDTONM( C.ECT_INPT_ID) END,1,30) ECT_INPT_NM";
		sql += ", ECT_COMP_CD, ECT_MNGT_YR, ECT_CNRT_SQ, ECT_CUST_NM, ECT_SEX_CD, ECT_BITH_DT, ECT_PENL_ID, ECT_MOBL_NO, ECT_TEL_NO ";
		sql += ", ECT_EMAIL_AR,ECT_ZIP_CD, ECT_ZIP_SQ, ECT_ZIP_AR, ECT_ROAD_AR, ECT_BLDG_NO, ECT_NHIS_YN, ECT_NHIC_TX, ECT_DEPT_NM ";
		sql += ", ECT_HALF_CD,ECT_DEPT_CD, ECT_EMPL_CD, ECT_PROF_SQ, ECT_COTK_YN, ECT_PID_EN, ECT_ADD_YN, ECT_ENTRY_DT, ECT_JUIP_DT ";
		sql += ", ECT_DIVI_CD, ECT_WORK_LT, ECT_GOJU_CD, ECT_1GOJU_CD,ECT_1FROM_DT,ECT_1TO_DT, ECT_2GOJU_CD, ECT_2FROM_DT, ECT_2TO_DT ";
		sql += ", ECT_EXAM_DT, ECT_EXAM_SQ, ECT_CUST_NO, ECT_USE_YN, ECT_NUSE_ID, ECT_NUSE_DTT, ECT_INPT_ID, ECT_INPT_DTT,ECT_MODI_ID ";
		sql += ", ECT_MODI_DTT,ECT_MEMO_TX,ECT_RSVT_DT, ECT_RSVT_NO, ECT_HLTH_KD, ECT_CUST_SQ, ECT_NCHR_HH, ECT_HTSB_YN, ECT_CANCER_YN, ECT_ORAL_YN, ECT_TOTAL_YN, ECT_SMS_YN ";
		sql += " FROM ET_COMP_CNRT_CUST C LEFT OUTER JOIN IT_COMP_DEPT D";
		sql += " ON C.ECT_COMP_CD = D.ICD_COMP_CD";
		sql += " AND C.ECT_MNGT_YR = D.ICD_MNGT_YR";
		sql += " AND C.ECT_HALF_CD = D.ICD_HALF_CD";
		sql += " AND C.ECT_DEPT_CD = D.ICD_DEPT_CD LEFT OUTER JOIN ET_COMP_CNRT_PROF P";
		sql += " ON C.ECT_COMP_CD = P.ECP_COMP_CD";
		sql += " AND C.ECT_MNGT_YR = P.ECP_MNGT_YR";
		sql += " AND C.ECT_CNRT_SQ = P.ECP_CNRT_SQ";
		sql += " AND C.ECT_PROF_SQ = P.ECP_PROF_SQ";
		sql += " WHERE C.ECT_COMP_CD = '" + COMP_CD + "'";
		sql += " AND C.ECT_MNGT_YR = '" + MNGT_YR + "'";

		if(!CNRT_SQ.equals("")){
			sql += " AND C.ECT_CNRT_SQ = '" + CNRT_SQ + "'";
		}

		if(CHKBOXUSE.equals("0")) {
			sql += " AND C.ECT_USE_YN = 'Y'";
		}

		if(!SSORT_NM.equals("")) {
			sql += " ORDER BY " + SSORT_NM ;
		}
		else {
			sql += " ORDER BY C.ECT_CUST_SQ";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_UP_SqlTextSet_001 \n";
			G_INFO += "설명 : 명단관리 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
			G_INFO += " CHKBOXUSE : " + CHKBOXUSE + " \n";
			G_INFO += " SSORT_NM : " + SSORT_NM + " \n";
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
