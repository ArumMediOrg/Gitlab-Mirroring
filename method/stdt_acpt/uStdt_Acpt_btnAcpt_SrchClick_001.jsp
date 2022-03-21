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

		String JUMIN_YN = htMethod.get("JUMIN_YN");
		String ENCRT_KD = htMethod.get("ENCRT_KD");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String CHART_NO = htMethod.get("CHART_NO");
		String COMP_CD = htMethod.get("COMP_CD");
		String COMP_NM = htMethod.get("COMP_NM");
		String PLCE_CD = htMethod.get("PLCE_CD");
		String DIVI_CD = htMethod.get("DIVI_CD");
		String DIVI_CS = htMethod.get("DIVI_CS");
		String CLSS_KD = htMethod.get("CLSS_KD");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String SEX_CD = htMethod.get("SEX_CD");
		String PARAM_TX = htMethod.get("PARAM_TX");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(JUMIN_YN == null) { JUMIN_YN = ""; }
		if(ENCRT_KD == null) { ENCRT_KD = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(CHART_NO == null) { CHART_NO = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(COMP_NM == null) { COMP_NM = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(DIVI_CD == null) { DIVI_CD = ""; }
		if(DIVI_CS == null) { DIVI_CS = ""; }
		if(CLSS_KD == null) { CLSS_KD = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

IF (:JUMIN_YN = 'Y') THEN
BEGIN
  IF (:ENCRT_KD = '1') THEN
    SELECT B.ICR_PID_EN  AS EEA_PSNL_ID,
  ELSE IF (:ENCRT_KD = '2') THEN
    SELECT ECHELONDB.ECL_DECRYPT(B.ICR_PID_EN) AS EEA_PSNL_ID,
  ELSE
    SELECT B.ICR_PENL_ID AS EEA_PSNL_ID,
END
ELSE
  SELECT F_PID(B.ICR_PENL_ID) EEA_PSNL_ID, 

       NVL((SELECT '1' FROM ET_PSNL_MEMO WHERE EPM_CUST_NO = A.EEA_CUST_NO AND ROWNUM = 1), '0') EPM_MEMO_SQ,
       A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_RSVN_NO, A.EEA_CHART_NO, 
       A.EEA_PSNL_NM, B.ICR_BIRH_DT, A.EEA_CUST_NO, A.EEA_ORDER_YN, A.EEA_SEND_DT, 
       A.EEA_DIVI_CS, A.EEA_CLSS_KD, A.EEA_DIVI_NO, 
       CASE WHEN :EXAM_CD = '31001' THEN A.EEA_DIVI_CS || ' / ' ELSE '' END || A.EEA_CLSS_KD || ' / ' || A.EEA_DIVI_NO AS EEA_STDT_KD, 
       CASE WHEN A.EEA_RSLT_CD = '0' THEN '대기' 
            ELSE CASE WHEN A.EEA_RSLT_CD = '1' THEN '입력중' 
            ELSE '완료' END END AS EEA_RSLT_NM, 
       CASE WHEN A.EEA_RECE_KD = '0' THEN '미수납' 
            ELSE CASE WHEN A.EEA_RECE_KD = '1' THEN '일부' 
            ELSE '완료' END END AS EEA_RECE_NM, 
       F_CODE_FIND('0401', A.EEA_EXAM_CD, '', '1') EEA_EXAM_NM, 
       F_TEL_FORMAT(B.ICR_MOBL_NO) EEA_MOBL_NO, 
       F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, 
       F_USER_FIND(A.EEA_INPT_ID) EEA_INPT_NM 
  FROM ET_EXAM_ACPT A
       LEFT OUTER JOIN IT_CUSTOMER B ON B.ICR_CUST_NO = A.EEA_CUST_NO 
 WHERE A.EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
   AND A.EEA_EXAM_CD = :EXAM_CD
   AND A.EEA_ORDER_YN <> 'C'
   
IF (:CHART_NO <> '') THEN
  AND A.EEA_CHART_NO LIKE '%'||:CHART_NO||'%';

IF (:COMP_CD <> '') THEN
  AND A.EEA_COMP_CD = :COMP_CD
ELSE IF (:COMP_NM <> '') THEN
  AND F_COMP_FIND(A.EEA_COMP_CD) LIKE '%'||:COMP_NM||'%';

IF (:PLCE_CD <> '') THEN
  AND A.EEA_PLCE_CD = :PLCE_CD;

IF (:DIVI_CD <> '') THEN
  AND A.EEA_DIVI_CD = :DIVI_CD;
  
IF (:DIVI_CS <> '') THEN
  AND A.EEA_DIVI_CS = :DIVI_CS;
  
IF (:CLSS_KD <> '') THEN
  AND A.EEA_CLSS_KD = :CLSS_KD;

IF (:PSNL_NM <> '') THEN
   AND A.EEA_PSNL_NM LIKE '%'||:PSNL_NM||'%';

IF (:SEX_CD <> '') THEN
   AND A.EEA_SEX_CD = :SEX_CD;

:PARAM_TX

:ORDER_BY


		*/

		if(JUMIN_YN.equals("Y")) {
			if(ENCRT_KD.equals("1")) {
				sql = " SELECT B.ICR_PID_EN AS EEA_PSNL_ID,";
			}
			else if(ENCRT_KD.equals("2")) {
				sql = " SELECT ECL_DECRYPT(B.ICR_PID_EN) AS EEA_PSNL_ID,";
			}
			else {
				sql = " SELECT B.ICR_PENL_ID AS EEA_PSNL_ID,";
			}
		}
		else {
			sql = " SELECT F_PID(B.ICR_PENL_ID) EEA_PSNL_ID,";
		}

		sql += " NVL(";
		sql += "	(";
		sql += "		SELECT '1'";
		sql += " 		FROM ET_PSNL_MEMO";
		sql += " 		WHERE EPM_CUST_NO = A.EEA_CUST_NO";
		sql += " 		AND ROWNUM = 1";
		sql += "	), '0') EPM_MEMO_SQ";
		sql += ", A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_RSVN_NO, A.EEA_CHART_NO, A.EEA_PSNL_NM, B.ICR_BIRH_DT, A.EEA_CUST_NO, A.EEA_ORDER_YN, A.EEA_SEND_DT, A.EEA_DIVI_CS, A.EEA_CLSS_KD, A.EEA_DIVI_NO";
		sql += ", CASE WHEN '" + EXAM_CD + "' = '31001' THEN A.EEA_DIVI_CS || ' / ' ELSE '' END || A.EEA_CLSS_KD || ' / ' || A.EEA_DIVI_NO AS EEA_STDT_KD";
		sql += ", CASE WHEN A.EEA_RSLT_CD = '0' THEN '대기' ELSE CASE WHEN A.EEA_RSLT_CD = '1' THEN '입력중' ELSE '완료' END END AS EEA_RSLT_NM";
		sql += ", CASE WHEN A.EEA_RECE_KD = '0' THEN '미수납' ELSE CASE WHEN A.EEA_RECE_KD = '1' THEN '일부' ELSE '완료' END END AS EEA_RECE_NM";
		sql += ", F_CODE_FIND('0401', A.EEA_EXAM_CD, '', '1') EEA_EXAM_NM";
		sql += ", F_TEL_FORMAT(B.ICR_MOBL_NO) EEA_MOBL_NO, F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, F_USER_FIND(A.EEA_INPT_ID) EEA_INPT_NM";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.EEA_CUST_NO";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND A.EEA_EXAM_CD = '" + EXAM_CD + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(!CHART_NO.equals("")) {
			sql += " AND A.EEA_CHART_NO LIKE '%'||'" + CHART_NO + "'||'%'";
		}
		
		if(!COMP_CD.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		}
		else if(!COMP_NM.equals("")) {
			sql += " AND F_COMP_FIND(A.EEA_COMP_CD) LIKE '%'||'" + COMP_NM + "'||'%'";
		}
		
		if(!PLCE_CD.equals("")) {
			sql += " AND A.EEA_PLCE_CD = '" + PLCE_CD + "'";
		}
		
		if(!DIVI_CD.equals("")) {
			sql += " AND A.EEA_DIVI_CD = '" + DIVI_CD + "'";
		}
		
		if(!DIVI_CS.equals("")) {
			sql += " AND A.EEA_DIVI_CS = '" + DIVI_CS + "'";
		}
		
		if(!CLSS_KD.equals("")) {
			sql += " AND A.EEA_CLSS_KD = '" + CLSS_KD + "'";
		}
		
		if(!PSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%'||'" + PSNL_NM + "'||'%'";
		}
		
		if(!SEX_CD.equals("")) {
			sql += " AND A.EEA_SEX_CD = '" + SEX_CD + "'";
		}

		sql += PARAM_TX;
		sql += ORDER_BY;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Acpt_btnAcpt_SrchClick_001 \n";
			G_INFO += "설명 : 학생/학교밖 접수 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " JUMIN_YN : " + JUMIN_YN + " \n";
			G_INFO += " ENCRT_KD : " + ENCRT_KD + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " CHART_NO : " + CHART_NO + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " COMP_NM : " + COMP_NM + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
			G_INFO += " DIVI_CD : " + DIVI_CD + " \n";
			G_INFO += " DIVI_CS : " + DIVI_CS + " \n";
			G_INFO += " CLSS_KD : " + CLSS_KD + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
			G_INFO += " ORDER_BY : " + ORDER_BY + " \n";
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
		<s:AttributeType name='EEA_PSNL_ID' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MEMO_SQ' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSVN_NO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RSVN_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='7' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='9' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORDER_YN' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORDER_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_DT' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEND_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CS' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_CS'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CLSS_KD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CLSS_KD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STDT_KD' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='96'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSLT_NM' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RECE_NM' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_NM' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 >
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INPT_NM' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 >
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='22' rs:rowid='true' rs:hidden='true'>
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

			String EEA_PSNL_ID_T = cRsList.getString("EEA_PSNL_ID");
			String EPM_MEMO_SQ_T = cRsList.getString("EPM_MEMO_SQ");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_RSVN_NO_T = cRsList.getString("EEA_RSVN_NO");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_ORDER_YN_T = cRsList.getString("EEA_ORDER_YN");
			String EEA_SEND_DT_T = cRsList.getString("EEA_SEND_DT");
			String EEA_DIVI_CS_T = cRsList.getString("EEA_DIVI_CS");
			String EEA_CLSS_KD_T = cRsList.getString("EEA_CLSS_KD");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_STDT_KD_T = cRsList.getString("EEA_STDT_KD");
			String EEA_RSLT_NM_T = cRsList.getString("EEA_RSLT_NM");
			String EEA_RECE_NM_T = cRsList.getString("EEA_RECE_NM");
			String EEA_EXAM_NM_T = cRsList.getString("EEA_EXAM_NM");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_COMP_NM_T = cRsList.getString("EEA_COMP_NM");
			String EEA_INPT_NM_T = cRsList.getString("EEA_INPT_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EEA_PSNL_ID_T.equals("")) {
%>
		 		EEA_PSNL_ID='<%= EEA_PSNL_ID_T%>'
<%
			}

			if(! EPM_MEMO_SQ_T.equals("")) {
%>
		 		EPM_MEMO_SQ='<%= EPM_MEMO_SQ_T%>'
<%
			}

			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
<%
			}

			if(! EEA_RSVN_NO_T.equals("")) {
%>
		 		EEA_RSVN_NO='<%= EEA_RSVN_NO_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! EEA_ORDER_YN_T.equals("")) {
%>
		 		EEA_ORDER_YN='<%= EEA_ORDER_YN_T%>'
<%
			}

			if(! EEA_SEND_DT_T.equals("")) {
%>
		 		EEA_SEND_DT='<%= EEA_SEND_DT_T%>'
<%
			}

			if(! EEA_DIVI_CS_T.equals("")) {
%>
		 		EEA_DIVI_CS='<%= EEA_DIVI_CS_T%>'
<%
			}

			if(! EEA_CLSS_KD_T.equals("")) {
%>
		 		EEA_CLSS_KD='<%= EEA_CLSS_KD_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! EEA_STDT_KD_T.equals("")) {
%>
		 		EEA_STDT_KD='<%= EEA_STDT_KD_T%>'
<%
			}

			if(! EEA_RSLT_NM_T.equals("")) {
%>
		 		EEA_RSLT_NM='<%= EEA_RSLT_NM_T%>'
<%
			}

			if(! EEA_RECE_NM_T.equals("")) {
%>
		 		EEA_RECE_NM='<%= EEA_RECE_NM_T%>'
<%
			}

			if(! EEA_EXAM_NM_T.equals("")) {
%>
		 		EEA_EXAM_NM='<%= EEA_EXAM_NM_T%>'
<%
			}

			if(! EEA_MOBL_NO_T.equals("")) {
%>
		 		EEA_MOBL_NO='<%= EEA_MOBL_NO_T%>'
<%
			}

			if(! EEA_COMP_NM_T.equals("")) {
%>
		 		EEA_COMP_NM='<%= EEA_COMP_NM_T%>'
<%
			}

			if(! EEA_INPT_NM_T.equals("")) {
%>
		 		EEA_INPT_NM='<%= EEA_INPT_NM_T%>'
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
