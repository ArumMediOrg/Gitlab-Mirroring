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

		String SRCH_KD = htMethod.get("SRCH_KD");
		String SRCH_NO = htMethod.get("SRCH_NO");

		//
		if(SRCH_KD == null) { SRCH_KD = ""; }
		if(SRCH_NO == null) { SRCH_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT TO_CHAR(A.RRT_INPT_DTT, 'YYYY-MM-DD AM HH24:MI:SS') RRG_INPT_DT, A.RRT_RSVN_NO RRG_RSVN_NO, A.RRT_EXAM_DT RRG_EXAM_DT, A.RRT_EXAM_SQ RRG_EXAM_SQ, A.RRT_EXAM_TM RRG_EXAM_TM, A.RRT_PSNL_NM RRG_PSNL_NM, A.RRT_MOBL_NO RRG_MOBL_NO, A.RRT_TEL_NO RRG_TEL_NO, A.RRT_CUST_NO RRG_CUST_NO, A.RRT_SMPL_YN RRG_SMPL_YN, F_PID(A.RRT_PSNL_ID) RRG_PSNL_ID, A.RRT_RSVN_TX RRG_RSVN_TX, A.RRT_COMP_CD RRG_COMP_CD, A.RRT_EXAM_LT RRG_EXAM_LT";
		sql += ", CASE WHEN NVL(A.RRT_EXAM_LT, ' ') = ' ' AND LENGTH(A.RRT_EXAM_CD) = 2 THEN F_CODE_FIND('0401', A.RRT_EXAM_CD||'000', '', '1') WHEN SUBSTR(A.RRT_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(A.RRT_EXAM_LT, '') WHEN SUBSTR(A.RRT_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(A.RRT_EXAM_LT, A.RRT_COMP_CD) ELSE F_CODE_FIND('0401', A.RRT_EXAM_CD, '', '1') END AS RRG_EXAM_NM";
		sql += ", CASE WHEN UPPER(A.RRT_HTSB_YN) = 'Y' THEN";
		sql += "	CASE WHEN SUBSTR(A.RRT_HTSB_CD, 1, 2) = '11' THEN";
		sql += "		CASE WHEN SUBSTR(A.RRT_HTSB_CD, 5, 1) = '1' THEN '일검+' WHEN SUBSTR(A.RRT_HTSB_CD, 5, 1) = '3' THEN '일검+' ELSE '일검2+' END";
		sql += "	WHEN SUBSTR(A.RRT_HTSB_CD, 1, 2) = '12' THEN";
		sql += "		CASE WHEN SUBSTR(A.RRT_HTSB_CD, 5, 1) = '1' THEN '생애+' WHEN SUBSTR(A.RRT_HTSB_CD, 5, 1) = '3' THEN '생애+' ELSE '생애2+' END";
		sql += "	WHEN SUBSTR(A.RRT_HTSB_CD, 1, 2) = '13' THEN '암' WHEN SUBSTR(A.RRT_HTSB_CD, 1, 2) = '14' THEN '구강+' ELSE '일검+' END";
		sql += "  ELSE '' END";
		sql += "  || CASE WHEN A.RRT_STOMA_CD || A.RRT_COLON_CD || A.RRT_LIVER_CD || A.RRT_BAST_CD ||A.RRT_UTER_CD || NVL(A.RRT_LUNG_CD, '0') <> '000000' THEN";
		sql += "	CASE WHEN SUBSTR(A.RRT_HTSB_CD, 1, 2) = '13' THEN '(' ELSE '암(' END";
		sql += "  ELSE '' END";
		sql += "  || CASE WHEN NVL(A.RRT_STOMA_CD, ' ') = ' ' OR NVL(A.RRT_STOMA_CD, '0') = '0' THEN '' ELSE '위,' END";
		sql += "  || CASE WHEN NVL(A.RRT_COLON_CD, ' ') = ' ' OR NVL(A.RRT_COLON_CD, '0') = '0' THEN '' ELSE '대,' END";
		sql += "  || CASE WHEN NVL(A.RRT_LIVER_CD, ' ') = ' ' OR NVL(A.RRT_LIVER_CD, '0') = '0' THEN '' ELSE '간,' END";
		sql += "  || CASE WHEN NVL(A.RRT_BAST_CD, ' ') = ' ' OR NVL(A.RRT_BAST_CD, '0') = '0' THEN '' ELSE '유,' END";
		sql += "  || CASE WHEN NVL(A.RRT_UTER_CD, ' ') = ' ' OR NVL(A.RRT_UTER_CD, '0') = '0' THEN '' ELSE '자,' END";
		sql += "  || CASE WHEN NVL(A.RRT_LUNG_CD, ' ') = ' ' OR NVL(A.RRT_LUNG_CD, '0') = '0' THEN '' ELSE '폐,' END";
		sql += "  || CASE WHEN A.RRT_STOMA_CD || A.RRT_COLON_CD || A.RRT_LIVER_CD || A.RRT_BAST_CD || A.RRT_UTER_CD || NVL(A.RRT_LUNG_CD, '0') <> '000000' THEN ')+' ELSE '' END";
		sql += "  || CASE WHEN SUBSTR(A.RRT_HTSB_CD, 1, 2) <> '14' THEN";
		sql += "		CASE WHEN UPPER(A.RRT_ORAL_YN) = 'Y' AND UPPER(A.RRT_HDMD_YN) = 'Y' THEN '구강+' WHEN A.RRT_ORAL_YN = '1' OR A.RRT_ORAL_YN = '3' THEN '구강+' ELSE '' END";
		sql += "  ELSE '' END";
		sql += "  || CASE WHEN UPPER(A.RRT_SPSB_YN) = 'Y' THEN '특검+' ELSE '' END";
		sql += "  || CASE WHEN UPPER(A.RRT_CVSB_YN) = 'Y' THEN '뇌심+' ELSE '' END";
		sql += "  || CASE WHEN UPPER(A.RRT_EMSB_YN) = 'Y' THEN '채용+' ELSE '' END";
		sql += "  || CASE WHEN UPPER(A.RRT_ETSB_YN) = 'Y' THEN '기타+' ELSE '' END AS RRG_EXAM_SUB";
		sql += ", F_USER_FIND(A.RRT_INPT_ID) RRG_INPT_NM,  A.RRT_DRUG_DT RRG_DRUG_DT, F_COMP_FIND(A.RRT_COMP_CD) RRG_COMP_NM, 'I' RRG_DATA_KD";
		sql += " , A.RRT_FAMY_CD RRG_FAMY_CD, A.RRT_FAMY_NM RRG_FAMY_NM ";
		sql += " FROM RT_RSVT A";

		if(SRCH_KD.equals("C")) {
			sql += " WHERE A.RRT_CUST_NO = '" + SRCH_NO + "'";
		}
		else {
			sql += " WHERE A.RRT_RSVN_NO = '" + SRCH_NO + "'";
		}
		sql += " AND SUBSTR(A.RRT_EXAM_CD, 1, 2) <> '31'";
		sql += " AND NVL(A.RRT_CNCL_YN, 'N') <> 'Y'";

		sql += " ORDER BY RRG_RSVN_NO DESC";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_UP_FindHistR_001 \n";
			G_INFO += "설명 : 고객 예약 이력 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SRCH_KD : " + SRCH_KD + " \n";
			G_INFO += " SRCH_NO : " + SRCH_NO + " \n";
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
