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
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String COMP_CD = htMethod.get("COMP_CD");
		String PLCE_CD = htMethod.get("PLCE_CD");
		String ACPT_CD = htMethod.get("ACPT_CD");
		String CAN_KD = htMethod.get("CAN_KD");

		//
		if(JUMIN_YN == null) { JUMIN_YN = ""; }
		if(ENCRT_KD == null) { ENCRT_KD = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(ACPT_CD == null) { ACPT_CD = ""; }
		if(CAN_KD == null) { CAN_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

IF (:JUMIN_YN = 'Y') THEN
BEGIN
  IF (:ENCRT_KD = '1') THEN
    SELECT I.ICR_PID_EN  AS EEA_PSNL_ID,
  ELSE IF (:ENCRT_KD = '2') THEN
    SELECT ECHELONDB.ECL_DECRYPT(I.ICR_PID_EN) AS EEA_PSNL_ID,
  ELSE
    SELECT I.ICR_PENL_ID AS EEA_PSNL_ID,
END
ELSE
  SELECT F_PID(I.ICR_PENL_ID) EEA_PSNL_ID,   

       A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_ACPT_CD,
       CASE WHEN A.EEA_ACPT_CD = '1' THEN  '개인' 
            WHEN A.EEA_ACPT_CD = '2' THEN  '사업장' 
            WHEN A.EEA_ACPT_CD = '3' THEN  '단체'
            WHEN A.EEA_ACPT_CD = '4' THEN  '해외' ELSE '기타' END EEA_ACPT_NM, 
       F_TEL_FORMAT(A.EEA_MOBL_NO) EEA_MOBL_NO, 
       F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, A.EEA_DIVI_NO, 
       F_ITEM_FIND('', B.ERI_ITEM_CD, 'K') EEA_ITEM_NM, 
       C.ECS_CFRM_DT || ' / ' || F_USER_FIND(C.ECS_LICEN_CD) EEA_STOMA_DR, 
       D.ECC_CFRM_DT || ' / ' || F_USER_FIND(D.ECC_LICEN_CD) EEA_COLON_DR, 
       E.ECL_CFRM_DT || ' / ' || F_USER_FIND(E.ECL_LICEN_CD) EEA_LIVER_DR, 
       F.ECB_CFRM_DT || ' / ' || F_USER_FIND(F.ECB_LICEN_CD) EEA_BAST_DR, 
       G.ECV_CFRM_DT || ' / ' || F_USER_FIND(G.ECV_LICEN_CD) EEA_UTER_DR, 
       H.ECG_CFRM_DT || ' / ' || F_USER_FIND(H.ECG_LICEN_CD) EEA_LUNG_DR 
  FROM ET_RSLT_ITEM B, IT_CUSTOMER I, 
       ET_EXAM_ACPT A LEFT OUTER JOIN ET_CANCER_STMC C 
                        ON C.ECS_EXAM_DT = A.EEA_EXAM_DT 
                       AND C.ECS_EXAM_SQ = A.EEA_EXAM_SQ 
                             LEFT OUTER JOIN ET_CANCER_COLO D 
                    ON D.ECC_EXAM_DT = A.EEA_EXAM_DT 
                   AND D.ECC_EXAM_SQ = A.EEA_EXAM_SQ 
                    LEFT OUTER JOIN ET_CANCER_LIVER E 
                    ON E.ECL_EXAM_DT = A.EEA_EXAM_DT 
                   AND E.ECL_EXAM_SQ = A.EEA_EXAM_SQ 
                    LEFT OUTER JOIN ET_CANCER_BRST F 
                    ON F.ECB_EXAM_DT = A.EEA_EXAM_DT 
                   AND F.ECB_EXAM_SQ = A.EEA_EXAM_SQ 
                    LEFT OUTER JOIN ET_CANCER_CRVC G 
                    ON G.ECV_EXAM_DT = A.EEA_EXAM_DT 
                   AND G.ECV_EXAM_SQ = A.EEA_EXAM_SQ 
                    LEFT OUTER JOIN ET_CANCER_LUNG H 
                    ON H.ECG_EXAM_DT = A.EEA_EXAM_DT 
                   AND H.ECG_EXAM_SQ = A.EEA_EXAM_SQ 
 WHERE A.EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 
   AND A.EEA_ORDER_YN <> 'C' 
   AND I.ICR_CUST_NO = A.EEA_CUST_NO 
   AND B.ERI_EXAM_DT = A.EEA_EXAM_DT 
   AND B.ERI_EXAM_SQ = A.EEA_EXAM_SQ 
   AND UPPER(B.ERI_ITEM_CD) = :ITEM_CD 
   AND B.ERI_CNCL_YN <> 'Y'
   
IF (:COMP_CD <> '') THEN 
   AND A.EEA_COMP_CD = :COMP_CD
   
IF (:PLCE_CD <> '00') THEN 
   AND A.EEA_PLCE_CD = :PLCE_CD
   
IF (:ACPT_CD <> '') THEN 
   AND A.EEA_ACPT_CD = :ACPT_CD
   
IF (:CAN_KD <> '') THEN 
   AND (A.EEA_STOMA_CD NOT IN ('0', '6', '9') 
    OR  A.EEA_COLON_CD NOT IN ('0', '6', '9'))
    
 ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ   
		*/

		if(JUMIN_YN.equals("Y")) {
			if(ENCRT_KD.equals("1")) {
				sql = " SELECT I.ICR_PID_EN AS EEA_PSNL_ID,";
			}
			else if (ENCRT_KD.equals("2")) {
				sql = " SELECT ECL_DECRYPT(I.ICR_PID_EN) AS EEA_PSNL_ID,";
			}
			else {
				sql = " SELECT I.ICR_PENL_ID AS EEA_PSNL_ID,";
			}
		}
		else {
			sql = " SELECT F_PID(I.ICR_PENL_ID) EEA_PSNL_ID,";
		}

		sql += " A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_ACPT_CD";
		sql += ", CASE WHEN A.EEA_ACPT_CD = '1' THEN '개인' WHEN A.EEA_ACPT_CD = '2' THEN '사업장' WHEN A.EEA_ACPT_CD = '3' THEN '단체' WHEN A.EEA_ACPT_CD = '4' THEN  '해외' ELSE '기타' END EEA_ACPT_NM";
		sql += ", F_TEL_FORMAT(A.EEA_MOBL_NO) EEA_MOBL_NO, F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, A.EEA_DIVI_NO, F_ITEM_FIND('', B.ERI_ITEM_CD, 'K') EEA_ITEM_NM, C.ECS_CFRM_DT || ' / ' || F_USER_FIND(C.ECS_LICEN_CD) EEA_STOMA_DR, D.ECC_CFRM_DT || ' / ' || F_USER_FIND(D.ECC_LICEN_CD) EEA_COLON_DR, E.ECL_CFRM_DT || ' / ' || F_USER_FIND(E.ECL_LICEN_CD) EEA_LIVER_DR, F.ECB_CFRM_DT || ' / ' || F_USER_FIND(F.ECB_LICEN_CD) EEA_BAST_DR, G.ECV_CFRM_DT || ' / ' || F_USER_FIND(G.ECV_LICEN_CD) EEA_UTER_DR, H.ECG_CFRM_DT || ' / ' || F_USER_FIND(H.ECG_LICEN_CD) EEA_LUNG_DR";
		sql += " FROM ET_RSLT_ITEM B, IT_CUSTOMER I, ET_EXAM_ACPT A LEFT OUTER JOIN ET_CANCER_STMC C";
		sql += " ON C.ECS_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND C.ECS_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_COLO D";
		sql += " ON D.ECC_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND D.ECC_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LIVER E";
		sql += " ON E.ECL_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND E.ECL_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_BRST F";
		sql += " ON F.ECB_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND F.ECB_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_CRVC G";
		sql += " ON G.ECV_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND G.ECV_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LUNG H";
		sql += " ON H.ECG_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND H.ECG_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND I.ICR_CUST_NO = A.EEA_CUST_NO";
		sql += " AND B.ERI_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND B.ERI_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " AND UPPER(B.ERI_ITEM_CD) = '" + ITEM_CD + "'";
		sql += " AND B.ERI_CNCL_YN <> 'Y'";

		if(!COMP_CD.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		}

		if(!PLCE_CD.equals("00")) {
			sql += " AND A.EEA_PLCE_CD = '" + PLCE_CD + "'";
		}

		if(!ACPT_CD.equals("")) {
			sql += " AND A.EEA_ACPT_CD = '" + ACPT_CD + "'";
		}

		if(!CAN_KD.equals("")) {
			sql += " AND (A.EEA_STOMA_CD NOT IN ('0', '6', '9')";
			sql += " OR A.EEA_COLON_CD NOT IN ('0', '6', '9'))";
		}

		sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_List_btnAcpt_SrchClick_004 \n";
			G_INFO += "설명 : 검진일자별 특정 검사항목 현황 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " JUMIN_YN : " + JUMIN_YN + " \n";
			G_INFO += " ENCRT_KD : " + ENCRT_KD + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
			G_INFO += " ACPT_CD : " + ACPT_CD + " \n";
			G_INFO += " CAN_KD : " + CAN_KD + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='5' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_CD' rs:number='6' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_ACPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ITEM_NM' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_DR' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_DR' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_DR' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_DR' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_DR' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_DR' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='18' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c18' rs:name='ROWID' rs:number='19' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c19' rs:name='ROWID' rs:number='20' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c20' rs:name='ROWID' rs:number='21' rs:rowid='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c21' rs:name='ROWID' rs:number='22' rs:rowid='true' rs:basetable='ET_CANCER_COLO' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c22' rs:name='ROWID' rs:number='23' rs:rowid='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c23' rs:name='ROWID' rs:number='24' rs:rowid='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c24' rs:name='ROWID' rs:number='25' rs:rowid='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c25' rs:name='ROWID' rs:number='26' rs:rowid='true' rs:basetable='ET_CANCER_LUNG' rs:basecolumn='ROWID'
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

			String EEA_PSNL_ID_T = cRsList.getString("EEA_PSNL_ID");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_ACPT_CD_T = cRsList.getString("EEA_ACPT_CD");
			String EEA_ACPT_NM_T = cRsList.getString("EEA_ACPT_NM");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_COMP_NM_T = cRsList.getString("EEA_COMP_NM");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_ITEM_NM_T = cRsList.getString("EEA_ITEM_NM");
			String EEA_STOMA_DR_T = cRsList.getString("EEA_STOMA_DR");
			String EEA_COLON_DR_T = cRsList.getString("EEA_COLON_DR");
			String EEA_LIVER_DR_T = cRsList.getString("EEA_LIVER_DR");
			String EEA_BAST_DR_T = cRsList.getString("EEA_BAST_DR");
			String EEA_UTER_DR_T = cRsList.getString("EEA_UTER_DR");
			String EEA_LUNG_DR_T = cRsList.getString("EEA_LUNG_DR");
			String ROWID_T = cRsList.getString("ROWID");
			String c18_T = cRsList.getString("c18");
			String c19_T = cRsList.getString("c19");
			String c20_T = cRsList.getString("c20");
			String c21_T = cRsList.getString("c21");
			String c22_T = cRsList.getString("c22");
			String c23_T = cRsList.getString("c23");
			String c24_T = cRsList.getString("c24");
			String c25_T = cRsList.getString("c25");
%>
			<z:row
<%
			if(! EEA_PSNL_ID_T.equals("")) {
%>
		 		EEA_PSNL_ID='<%= EEA_PSNL_ID_T%>'
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

			if(! EEA_ACPT_CD_T.equals("")) {
%>
		 		EEA_ACPT_CD='<%= EEA_ACPT_CD_T%>'
<%
			}

			if(! EEA_ACPT_NM_T.equals("")) {
%>
		 		EEA_ACPT_NM='<%= EEA_ACPT_NM_T%>'
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

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! EEA_ITEM_NM_T.equals("")) {
%>
		 		EEA_ITEM_NM='<%= EEA_ITEM_NM_T%>'
<%
			}

			if(! EEA_STOMA_DR_T.equals("")) {
%>
		 		EEA_STOMA_DR='<%= EEA_STOMA_DR_T%>'
<%
			}

			if(! EEA_COLON_DR_T.equals("")) {
%>
		 		EEA_COLON_DR='<%= EEA_COLON_DR_T%>'
<%
			}

			if(! EEA_LIVER_DR_T.equals("")) {
%>
		 		EEA_LIVER_DR='<%= EEA_LIVER_DR_T%>'
<%
			}

			if(! EEA_BAST_DR_T.equals("")) {
%>
		 		EEA_BAST_DR='<%= EEA_BAST_DR_T%>'
<%
			}

			if(! EEA_UTER_DR_T.equals("")) {
%>
		 		EEA_UTER_DR='<%= EEA_UTER_DR_T%>'
<%
			}

			if(! EEA_LUNG_DR_T.equals("")) {
%>
		 		EEA_LUNG_DR='<%= EEA_LUNG_DR_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c18_T.equals("")) {
%>
		 		c18='<%= c18_T%>'
<%
			}

			if(! c19_T.equals("")) {
%>
		 		c19='<%= c19_T%>'
<%
			}

			if(! c20_T.equals("")) {
%>
		 		c20='<%= c20_T%>'
<%
			}

			if(! c21_T.equals("")) {
%>
		 		c21='<%= c21_T%>'
<%
			}

			if(! c22_T.equals("")) {
%>
		 		c22='<%= c22_T%>'
<%
			}

			if(! c23_T.equals("")) {
%>
		 		c23='<%= c23_T%>'
<%
			}

			if(! c24_T.equals("")) {
%>
		 		c24='<%= c24_T%>'
<%
			}

			if(! c25_T.equals("")) {
%>
		 		c25='<%= c25_T%>'
<%
			}
%>
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
