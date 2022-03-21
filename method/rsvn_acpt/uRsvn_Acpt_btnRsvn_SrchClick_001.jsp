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

		String WHERE_KD = htMethod.get("WHERE_KD");
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String CNCL_YN = htMethod.get("CNCL_YN");
		String COMP_CD = htMethod.get("COMP_CD");
		String COMP_NM = htMethod.get("COMP_NM");
		String PSNL_ID = htMethod.get("PSNL_ID");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String INPT_ID = htMethod.get("INPT_ID");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");

		//
		if(WHERE_KD == null) { WHERE_KD = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(CNCL_YN == null) { CNCL_YN = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(COMP_NM == null) { COMP_NM = ""; }
		if(PSNL_ID == null) { PSNL_ID = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.*, A.RRT_INPT_DTT  RRT_RSVN_DT,
       B.ICR_PENL_ID, B.ICR_PID_EN, B.ICR_BIRH_DT,
       NVL((SELECT EPM_MEMO_SQ FROM ET_PSNL_MEMO WHERE EPM_CUST_NO = A.RRT_CUST_NO AND ROWNUM = 1), '0') EPM_MEMO_SQ,
       F_TEL_FORMAT(A.RRT_MOBL_NO) RRT_MOBL_NO2,
       F_TEL_FORMAT(A.RRT_TEL_NO)  RRT_TEL_NO2,
       F_PID(A.RRT_PSNL_ID) RRT_PSNL_ID2,
       CASE WHEN SUBSTR(A.RRT_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(A.RRT_EXAM_LT, '')
            WHEN SUBSTR(A.RRT_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(A.RRT_EXAM_LT, A.RRT_COMP_CD)
            ELSE F_CODE_FIND('0401', SUBSTR(A.RRT_EXAM_CD || '001', 1, 5), '', '1') END AS RRT_EXAM_NM,
       F_CODE_FIND('0401', SUBSTR(A.RRT_EXAM_CD || '001', 1, 5), '', '1') RRT_EXAM_NM2,
       CASE WHEN A.RRT_STOOL_YN = 'Y' THEN '분변통 / ' ELSE '' END ||
       CASE WHEN A.RRT_DRUG_YN  = 'Y' THEN '내시경 / ' ELSE '' END ||
       CASE WHEN A.RRT_BLOOD_YN = 'Y' THEN '혈압약 / ' ELSE '' END ||
       CASE WHEN A.RRT_ASPL_YN  = 'Y' THEN '아스피린'  ELSE '' END AS RRT_DRUG_NM,
       F_COMP_FIND(A.RRT_COMP_CD) RRT_COMP_NM,
       F_USER_FIND(A.RRT_INPT_ID) RRT_INPT_NM
  FROM RT_RSVT A
       LEFT OUTER JOIN IT_CUSTOMER B
         ON B.ICR_CUST_NO = A.RRT_CUST_NO

IF (:WHERE_KD = '1') THEN
   WHERE A.RRT_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
ELSE
   WHERE A.RRT_RSVN_NO BETWEEN :EXAM_SDT AND :EXAM_EDT

   AND SUBSTR(A.RRT_EXAM_CD, 1, 2) <> '31'
   AND NVL(A.RRT_CNCL_YN, 'N') = :CNCL_YN;

IF (:COMP_CD <> '') THEN
  AND A.RRT_COMP_CD = :COMP_CD
ELSE IF (:COMP_NM <> '') THEN
  AND F_COMP_FIND(A.RRT_COMP_CD) LIKE '%'||:COMP_NM||'%';

IF (:PSNL_ID <> '') THEN
  AND A.RRT_PSNL_ID LIKE :PSNL_ID||'%';

IF (:PSNL_NM <> '') THEN
    AND A.RRT_PSNL_NM LIKE '%'||:PSNL_NM||'%';

IF (:INPT_ID <> '') THEN
    AND A.RRT_INPT_ID = :INPT_ID;

:PARAM_TX1;
:PARAM_TX2;
		*/

		sql = " SELECT A.*, A.RRT_INPT_DTT RRT_RSVN_DT, B.ICR_PENL_ID, B.ICR_PID_EN, B.ICR_BIRH_DT";

		sql += ", NVL(";
		sql += "	(";
		sql += "		SELECT EPM_MEMO_SQ";
		sql += " 		FROM ET_PSNL_MEMO";
		sql += " 		WHERE EPM_CUST_NO = A.RRT_CUST_NO";
		sql += " 		AND ROWNUM = 1";
		sql += "	), '0') EPM_MEMO_SQ";

		sql += ", F_TEL_FORMAT(A.RRT_MOBL_NO) RRT_MOBL_NO2, F_TEL_FORMAT(A.RRT_TEL_NO) RRT_TEL_NO2, F_PID(A.RRT_PSNL_ID) RRT_PSNL_ID2";
		sql += ", CASE WHEN SUBSTR(A.RRT_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(A.RRT_EXAM_LT, '')";
		sql += " 	WHEN SUBSTR(A.RRT_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(A.RRT_EXAM_LT, A.RRT_COMP_CD)";
		sql += "	ELSE F_CODE_FIND('0401', SUBSTR(A.RRT_EXAM_CD || '001', 1, 5), '', '1') END AS RRT_EXAM_NM";

		sql += ", F_CODE_FIND('0401', SUBSTR(A.RRT_EXAM_CD || '001', 1, 5), '', '1') RRT_EXAM_NM2";

		sql += ", CASE WHEN A.RRT_STOOL_YN = 'Y' THEN '분변통 / ' ELSE '' END";
		sql += "  || CASE WHEN A.RRT_DRUG_YN = 'Y' THEN '내시경 / ' ELSE '' END";
		sql += "  || CASE WHEN A.RRT_BLOOD_YN = 'Y' THEN '혈압약 / ' ELSE '' END";
		sql += "  || CASE WHEN A.RRT_ASPL_YN = 'Y' THEN '아스피린' ELSE '' END AS RRT_DRUG_NM";

		sql += ", F_COMP_FIND(A.RRT_COMP_CD) RRT_COMP_NM, F_USER_FIND(A.RRT_INPT_ID) RRT_INPT_NM";

		sql += " FROM RT_RSVT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.RRT_CUST_NO";

		if(WHERE_KD.equals("1")) {
			sql += " WHERE A.RRT_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";
		} else {
			sql += " WHERE A.RRT_RSVN_NO BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";
		}

		sql += " AND SUBSTR(A.RRT_EXAM_CD, 1, 2) <> '31'";
		sql += " AND NVL(A.RRT_CNCL_YN, 'N') = '" + CNCL_YN + "'";

		if(! COMP_CD.equals("")) {
			sql += " AND A.RRT_COMP_CD = '" + COMP_CD + "'";
		} else if(! COMP_NM.equals("")) {
			sql += " AND F_COMP_FIND(A.RRT_COMP_CD) LIKE '%" + COMP_NM + "%'";
		}

		if(! PSNL_ID.equals("")) {
			sql += " AND A.RRT_PSNL_ID LIKE '" + PSNL_ID + "%'";
		}

		if(! PSNL_NM.equals("")) {
			sql += " AND A.RRT_PSNL_NM LIKE '%" + PSNL_NM + "%'";
		}

		if(! INPT_ID.equals("")) {
			sql += " AND A.RRT_INPT_ID = '" + INPT_ID + "'";
		}

		sql += PARAM_TX1;
		sql += PARAM_TX2;


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_btnRsvn_SrchClick_001 \n";
			G_INFO += "설명 : 예약 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " WHERE_KD : " + WHERE_KD + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " CNCL_YN : " + CNCL_YN + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " COMP_NM : " + COMP_NM + " \n";
			G_INFO += " PSNL_ID : " + PSNL_ID + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
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
