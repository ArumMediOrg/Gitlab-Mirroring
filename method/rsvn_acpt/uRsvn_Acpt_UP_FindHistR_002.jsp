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

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String RSVN_NO = htMethod.get("RSVN_NO");

		//
		if(RSVN_NO == null) { RSVN_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT TO_CHAR(A.RRG_INPT_DTT, 'YYYY-MM-DD AM HH24:MI:SS') RRG_INPT_DT, A.RRG_RSVN_NO, A.RRG_EXAM_DT, A.RRG_EXAM_SQ, 
       A.RRG_EXAM_TM, A.RRG_PSNL_NM, A.RRG_MOBL_NO, A.RRG_TEL_NO, A.RRG_CUST_NO, A.RRG_SMPL_YN, 
       F_PID(A.RRG_PSNL_ID) RRG_PSNL_ID, A.RRG_RSVN_TX, A.RRG_COMP_CD, A.RRG_EXAM_LT, 
       CASE WHEN NVL(A.RRG_EXAM_LT, ' ') = ' ' AND LENGTH(A.RRG_EXAM_CD) = 2 THEN F_CODE_FIND('0401', A.RRG_EXAM_CD || '000', '', '1') 
            WHEN SUBSTR(A.RRG_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(A.RRG_EXAM_LT, '') 
            WHEN SUBSTR(A.RRG_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(A.RRG_EXAM_LT, A.RRG_COMP_CD)
            ELSE F_CODE_FIND('0401', A.RRG_EXAM_CD, '', '1') END AS RRG_EXAM_NM, 
       CASE WHEN UPPER(A.RRG_HTSB_YN) = 'Y' THEN 
            CASE WHEN SUBSTR(A.RRG_HTSB_CD, 1, 2) = '11' THEN CASE WHEN SUBSTR(A.RRG_HTSB_CD, 5, 1) = '1' THEN '일검+' 
                                                                   WHEN SUBSTR(A.RRG_HTSB_CD, 5, 1) = '3' THEN '일검+' 
                                                                   ELSE '일검2+' END 
                 WHEN SUBSTR(A.RRG_HTSB_CD, 1, 2) = '12' THEN CASE WHEN SUBSTR(A.RRG_HTSB_CD, 5, 1) = '1' THEN '생애+' 
                                                                   WHEN SUBSTR(A.RRG_HTSB_CD, 5, 1) = '3' THEN '생애+' 
                                                                   ELSE '생애2+' END 
                 WHEN SUBSTR(A.RRG_HTSB_CD, 1, 2) = '13' THEN '암' 
                 WHEN SUBSTR(A.RRG_HTSB_CD, 1, 2) = '14' THEN '구강+' ELSE '일검+' END ELSE '' END || 
       CASE WHEN A.RRG_STOMA_CD || A.RRG_COLON_CD || A.RRG_LIVER_CD || A.RRG_BAST_CD || A.RRG_UTER_CD || NVL(A.RRG_LUNG_CD, '0') <> '000000' THEN 
            CASE WHEN SUBSTR(A.RRG_HTSB_CD, 1, 2) = '13' THEN '(' ELSE '암(' END ELSE '' END || 
       CASE WHEN NVL(A.RRG_STOMA_CD, ' ') = ' ' OR NVL(A.RRG_STOMA_CD, '0') = '0' THEN '' ELSE '위,' END || 
       CASE WHEN NVL(A.RRG_COLON_CD, ' ') = ' ' OR NVL(A.RRG_COLON_CD, '0') = '0' THEN '' ELSE '대,' END || 
       CASE WHEN NVL(A.RRG_LIVER_CD, ' ') = ' ' OR NVL(A.RRG_LIVER_CD, '0') = '0' THEN '' ELSE '간,' END || 
       CASE WHEN NVL(A.RRG_BAST_CD,  ' ') = ' ' OR NVL(A.RRG_BAST_CD,  '0') = '0' THEN '' ELSE '유,' END || 
       CASE WHEN NVL(A.RRG_UTER_CD,  ' ') = ' ' OR NVL(A.RRG_UTER_CD,  '0') = '0' THEN '' ELSE '자,' END || 
       CASE WHEN NVL(A.RRG_LUNG_CD,  ' ') = ' ' OR NVL(A.RRG_LUNG_CD,  '0') = '0' THEN '' ELSE '폐,' END || 
       CASE WHEN A.RRG_STOMA_CD || A.RRG_COLON_CD || A.RRG_LIVER_CD || A.RRG_BAST_CD || A.RRG_UTER_CD || NVL(A.RRG_LUNG_CD, '0') <> '000000' THEN ')+' ELSE '' END ||
       CASE WHEN SUBSTR(A.RRG_HTSB_CD, 1, 2) <> '14' THEN 
            CASE WHEN UPPER(A.RRG_ORAL_YN) = 'Y' AND UPPER(A.RRG_HDMD_YN) = 'Y' THEN '구강+' 
                 WHEN A.RRG_ORAL_YN = '1' OR A.RRG_ORAL_YN = '3' THEN '구강+' ELSE '' END ELSE '' END ||
       CASE WHEN UPPER(A.RRG_SPSB_YN) = 'Y' THEN '특검+' ELSE '' END || 
       CASE WHEN UPPER(A.RRG_CVSB_YN) = 'Y' THEN '뇌심+' ELSE '' END || 
       CASE WHEN UPPER(A.RRG_EMSB_YN) = 'Y' THEN '채용+' ELSE '' END || 
       CASE WHEN UPPER(A.RRG_ETSB_YN) = 'Y' THEN '기타+' ELSE '' END AS RRG_EXAM_SUB, 
       F_USER_FIND(A.RRG_INPT_ID) RRG_INPT_NM, 
       F_COMP_FIND(A.RRG_COMP_CD) RRG_COMP_NM, A.RRG_DATA_KD
  FROM RT_RSVT_LOG A 
 WHERE A.RRG_RSVN_NO = :RSVN_NO 
 ORDER BY RRG_INPT_DT DESC

		*/

		sql = " SELECT TO_CHAR(A.RRG_INPT_DTT, 'YYYY-MM-DD AM HH24:MI:SS') RRG_INPT_DT, A.RRG_RSVN_NO, A.RRG_EXAM_DT, A.RRG_EXAM_SQ, A.RRG_EXAM_TM, A.RRG_PSNL_NM, A.RRG_MOBL_NO, A.RRG_TEL_NO, A.RRG_CUST_NO, A.RRG_SMPL_YN, F_PID(A.RRG_PSNL_ID) RRG_PSNL_ID, A.RRG_RSVN_TX, A.RRG_COMP_CD, A.RRG_EXAM_LT";
		sql += ", CASE WHEN NVL(A.RRG_EXAM_LT, ' ') = ' ' AND LENGTH(A.RRG_EXAM_CD) = 2 THEN F_CODE_FIND('0401', A.RRG_EXAM_CD || '000', '', '1') WHEN SUBSTR(A.RRG_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(A.RRG_EXAM_LT, '') WHEN SUBSTR(A.RRG_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(A.RRG_EXAM_LT, A.RRG_COMP_CD) ELSE F_CODE_FIND('0401', A.RRG_EXAM_CD, '', '1') END AS RRG_EXAM_NM";
		sql += ", CASE WHEN UPPER(A.RRG_HTSB_YN) = 'Y' THEN";
		sql += "	CASE WHEN SUBSTR(A.RRG_HTSB_CD, 1, 2) = '11' THEN";
		sql += "		CASE WHEN SUBSTR(A.RRG_HTSB_CD, 5, 1) = '1' THEN '일검+' WHEN SUBSTR(A.RRG_HTSB_CD, 5, 1) = '3' THEN '일검+' ELSE '일검2+' END";
		sql += "	WHEN SUBSTR(A.RRG_HTSB_CD, 1, 2) = '12' THEN";
		sql += "		CASE WHEN SUBSTR(A.RRG_HTSB_CD, 5, 1) = '1' THEN '생애+' WHEN SUBSTR(A.RRG_HTSB_CD, 5, 1) = '3' THEN '생애+' ELSE '생애2+' END";
		sql += "	WHEN SUBSTR(A.RRG_HTSB_CD, 1, 2) = '13' THEN '암' WHEN SUBSTR(A.RRG_HTSB_CD, 1, 2) = '14' THEN '구강+' ELSE '일검+' END";
		sql += "  ELSE '' END";

		sql += "  || CASE WHEN A.RRG_STOMA_CD || A.RRG_COLON_CD || A.RRG_LIVER_CD || A.RRG_BAST_CD || A.RRG_UTER_CD || NVL(A.RRG_LUNG_CD, '0') <> '000000' THEN";
		sql += "     CASE WHEN SUBSTR(A.RRG_HTSB_CD, 1, 2) = '13' THEN '(' ELSE '암(' END";
		sql += "  ELSE '' END";

		sql += "  || CASE WHEN NVL(A.RRG_STOMA_CD, ' ') = ' ' OR NVL(A.RRG_STOMA_CD, '0') = '0' THEN '' ELSE '위,' END";
		sql += "  || CASE WHEN NVL(A.RRG_COLON_CD, ' ') = ' ' OR NVL(A.RRG_COLON_CD, '0') = '0' THEN '' ELSE '대,' END";
		sql += "  || CASE WHEN NVL(A.RRG_LIVER_CD, ' ') = ' ' OR NVL(A.RRG_LIVER_CD, '0') = '0' THEN '' ELSE '간,' END";
		sql += "  || CASE WHEN NVL(A.RRG_BAST_CD, ' ') = ' ' OR NVL(A.RRG_BAST_CD, '0') = '0' THEN '' ELSE '유,' END";
		sql += "  || CASE WHEN NVL(A.RRG_UTER_CD, ' ') = ' ' OR NVL(A.RRG_UTER_CD, '0') = '0' THEN '' ELSE '자,' END";
		sql += "  || CASE WHEN NVL(A.RRG_LUNG_CD, ' ') = ' ' OR NVL(A.RRG_LUNG_CD, '0') = '0' THEN '' ELSE '폐,' END";
		sql += "  || CASE WHEN A.RRG_STOMA_CD || A.RRG_COLON_CD || A.RRG_LIVER_CD || A.RRG_BAST_CD || A.RRG_UTER_CD || NVL(A.RRG_LUNG_CD, '0') <> '000000' THEN ')+' ELSE '' END";

		sql += "  || CASE WHEN SUBSTR(A.RRG_HTSB_CD, 1, 2) <> '14' THEN";
		sql += "  		CASE WHEN UPPER(A.RRG_ORAL_YN) = 'Y' AND UPPER(A.RRG_HDMD_YN) = 'Y' THEN '구강+' WHEN A.RRG_ORAL_YN = '1' OR A.RRG_ORAL_YN = '3' THEN '구강+' ELSE '' END";
		sql += "  ELSE '' END";

		sql += "  || CASE WHEN UPPER(A.RRG_SPSB_YN) = 'Y' THEN '특검+' ELSE '' END";
		sql += "  || CASE WHEN UPPER(A.RRG_CVSB_YN) = 'Y' THEN '뇌심+' ELSE '' END";
		sql += "  || CASE WHEN UPPER(A.RRG_EMSB_YN) = 'Y' THEN '채용+' ELSE '' END";
		sql += "  || CASE WHEN UPPER(A.RRG_ETSB_YN) = 'Y' THEN '기타+' ELSE '' END AS RRG_EXAM_SUB";
		sql += ", F_USER_FIND(A.RRG_INPT_ID) RRG_INPT_NM, A.RRG_DRUG_DT, F_COMP_FIND(A.RRG_COMP_CD) RRG_COMP_NM, A.RRG_DATA_KD";
		sql += " FROM RT_RSVT_LOG A";
		sql += " WHERE A.RRG_RSVN_NO = '" + RSVN_NO + "'";
		sql += " ORDER BY RRG_INPT_DT DESC";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_UP_FindHistR_002 \n";
			G_INFO += "설명 : 예약 이력 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

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
		<s:AttributeType name='RRG_INPT_DT' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_INPT_DTT'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_RSVN_NO' rs:number='2' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='RRG_RSVN_NO'>
			<s:datatype dt:type='string' dt:maxLength='14' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_EXAM_DT' rs:number='3' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='RRG_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_EXAM_SQ' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_EXAM_TM' rs:number='5' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='RRG_EXAM_TM'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_PSNL_NM' rs:number='6' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='RRG_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_MOBL_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_TEL_NO' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_CUST_NO' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_SMPL_YN' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_SMPL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_PSNL_ID' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_RSVN_TX' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_RSVN_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_COMP_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_EXAM_LT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_EXAM_LT'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_EXAM_NM' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_EXAM_SUB' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_DRUG_DT'>
			<s:datatype dt:type='string' dt:maxLength='54'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_INPT_NM' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_DRUG_DT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_DATA_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_COMP_NM' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRG_DATA_KD' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='21' rs:rowid='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='ROWID'
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

			String RRG_INPT_DT_T = cRsList.getString("RRG_INPT_DT");
			String RRG_RSVN_NO_T = cRsList.getString("RRG_RSVN_NO");
			String RRG_EXAM_DT_T = cRsList.getString("RRG_EXAM_DT");
			String RRG_EXAM_SQ_T = cRsList.getString("RRG_EXAM_SQ");
			String RRG_EXAM_TM_T = cRsList.getString("RRG_EXAM_TM");
			String RRG_PSNL_NM_T = cRsList.getString("RRG_PSNL_NM");
			String RRG_MOBL_NO_T = cRsList.getString("RRG_MOBL_NO");
			String RRG_TEL_NO_T = cRsList.getString("RRG_TEL_NO");
			String RRG_CUST_NO_T = cRsList.getString("RRG_CUST_NO");
			String RRG_SMPL_YN_T = cRsList.getString("RRG_SMPL_YN");
			String RRG_PSNL_ID_T = cRsList.getString("RRG_PSNL_ID");
			String RRG_RSVN_TX_T = cRsList.getString("RRG_RSVN_TX");
			String RRG_COMP_CD_T = cRsList.getString("RRG_COMP_CD");
			String RRG_EXAM_LT_T = cRsList.getString("RRG_EXAM_LT");
			String RRG_EXAM_NM_T = cRsList.getString("RRG_EXAM_NM");
			String RRG_EXAM_SUB_T = cRsList.getString("RRG_EXAM_SUB");
			String RRG_INPT_NM_T = cRsList.getString("RRG_INPT_NM");
			String RRG_DRUG_DT_T = cRsList.getString("RRG_DRUG_DT");
			String RRG_COMP_NM_T = cRsList.getString("RRG_COMP_NM");
			String RRG_DATA_KD_T = cRsList.getString("RRG_DATA_KD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! RRG_INPT_DT_T.equals("")) {
%>
		 		RRG_INPT_DT='<%= RRG_INPT_DT_T%>'
<%
			}

			if(! RRG_RSVN_NO_T.equals("")) {
%>
		 		RRG_RSVN_NO='<%= RRG_RSVN_NO_T%>'
<%
			}

			if(! RRG_EXAM_DT_T.equals("")) {
%>
		 		RRG_EXAM_DT='<%= RRG_EXAM_DT_T%>'
<%
			}

			if(! RRG_EXAM_SQ_T.equals("")) {
%>
		 		RRG_EXAM_SQ='<%= RRG_EXAM_SQ_T%>'
<%
			}

			if(! RRG_EXAM_TM_T.equals("")) {
%>
		 		RRG_EXAM_TM='<%= RRG_EXAM_TM_T%>'
<%
			}

			if(! RRG_PSNL_NM_T.equals("")) {
%>
		 		RRG_PSNL_NM='<%= RRG_PSNL_NM_T%>'
<%
			}

			if(! RRG_MOBL_NO_T.equals("")) {
%>
		 		RRG_MOBL_NO='<%= RRG_MOBL_NO_T%>'
<%
			}

			if(! RRG_TEL_NO_T.equals("")) {
%>
		 		RRG_TEL_NO='<%= RRG_TEL_NO_T%>'
<%
			}

			if(! RRG_CUST_NO_T.equals("")) {
%>
		 		RRG_CUST_NO='<%= RRG_CUST_NO_T%>'
<%
			}

			if(! RRG_SMPL_YN_T.equals("")) {
%>
		 		RRG_SMPL_YN='<%= RRG_SMPL_YN_T%>'
<%
			}

			if(! RRG_PSNL_ID_T.equals("")) {
%>
		 		RRG_PSNL_ID='<%= RRG_PSNL_ID_T%>'
<%
			}

			if(! RRG_RSVN_TX_T.equals("")) {
%>
		 		RRG_RSVN_TX='<%= RRG_RSVN_TX_T%>'
<%
			}

			if(! RRG_COMP_CD_T.equals("")) {
%>
		 		RRG_COMP_CD='<%= RRG_COMP_CD_T%>'
<%
			}

			if(! RRG_EXAM_LT_T.equals("")) {
%>
		 		RRG_EXAM_LT='<%= RRG_EXAM_LT_T%>'
<%
			}

			if(! RRG_EXAM_NM_T.equals("")) {
%>
		 		RRG_EXAM_NM='<%= RRG_EXAM_NM_T%>'
<%
			}

			if(! RRG_EXAM_SUB_T.equals("")) {
%>
		 		RRG_EXAM_SUB='<%= RRG_EXAM_SUB_T%>'
<%
			}

			if(! RRG_INPT_NM_T.equals("")) {
%>
		 		RRG_INPT_NM='<%= RRG_INPT_NM_T%>'
<%
			}

			if(! RRG_DRUG_DT_T.equals("")) {
%>
		 		RRG_DRUG_DT='<%= RRG_DRUG_DT_T%>'
<%
			}

			if(! RRG_COMP_NM_T.equals("")) {
%>
		 		RRG_COMP_NM='<%= RRG_COMP_NM_T%>'
<%
			}

			if(! RRG_DATA_KD_T.equals("")) {
%>
		 		RRG_DATA_KD='<%= RRG_DATA_KD_T%>'
<%
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
