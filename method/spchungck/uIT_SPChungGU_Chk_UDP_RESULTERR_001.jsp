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

		String PENCRT_KD = htMethod.get("PENCRT_KD");
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");

		//
		if(PENCRT_KD == null) { PENCRT_KD = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CASE :PENCRT_KD WHEN '1' THEN F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '1')
                       WHEN '2' THEN ECHELONDB.ECL_DECRYPT(F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '1')) 
                                ELSE F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '0') END ICR_PENL_ID,                                      
       A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, A.EEA_SEX_CD, A.EEA_EXAM_CD, G.SIR_EXAM_DT2, G.SIR_EXAM_SQ2,
       CASE WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) <> '4' THEN A.EEA_SPSB_CD ELSE A.EEA_EXAM_CD END EEA_SPSB_CD,
       B.ERI_ITEM_CD, C.IIM_SBCD_CD, B.ERI_RSLT_VL, B.ERI_SPRT_CD, B.ERI_SPSB_PANJ, C.IIM_TRLT_CD, E.SIC_CANC_LT, C.IIM_TRTP_CD, B.ERI_RSLT_UNIT,
       F_ITEM_VLDT_FIND(B.ERI_ITEM_CD, A.EEA_SEX_CD, '1', '0', SUBSTR(NVL(B.ERI_SPSB_PANJ, 'XX'), 2, 1), A.EEA_EXAM_DT) CLINC_REFER_LOW,
       F_ITEM_VLDT_FIND(B.ERI_ITEM_CD, A.EEA_SEX_CD, '2', '0', SUBSTR(NVL(B.ERI_SPSB_PANJ, 'XX'), 2, 1), A.EEA_EXAM_DT) CLINC_REFER_HGH,
       C.IIM_SANBO_KD, C.IIM_SANBO_CD, C.IIM_SANBO_CAL, H.CSC_FULL_NM
  FROM ET_EXAM_ACPT A 
       LEFT OUTER JOIN ET_RSLT_ITEM B      ON B.ERI_EXAM_DT = A.EEA_EXAM_DT AND B.ERI_EXAM_SQ = A.EEA_EXAM_SQ
       LEFT OUTER JOIN ST_ITEM_HIGHPRICE D ON D.SIH_EXAM_DT = A.EEA_EXAM_DT AND D.SIH_EXAM_SQ = A.EEA_EXAM_SQ  AND B.ERI_ITEM_CD = D.SIH_ITEM_CD
       LEFT OUTER JOIN IT_ITEM C           ON C.IIM_ITEM_CD = B.ERI_ITEM_CD
       LEFT OUTER JOIN ST_ITEM_CANCEL E    ON E.SIC_EXAM_DT = A.EEA_EXAM_DT AND E.SIC_EXAM_SQ = A.EEA_EXAM_SQ  AND B.ERI_ITEM_CD = E.SIC_ITEM_CD
       LEFT OUTER JOIN ST_BASE F           ON F.SBE_EXAM_DT = A.EEA_EXAM_DT AND F.SBE_EXAM_SQ = A.EEA_EXAM_SQ
       LEFT OUTER JOIN ST_ITEM_RECHECK G   ON G.SIR_EXAM_DT = A.EEA_EXAM_DT AND G.SIR_EXAM_SQ = A.EEA_EXAM_SQ
       LEFT OUTER JOIN CT_SP_COMMON H      ON H.CSC_LARGE   = 'HM06F'       AND H.CSC_SMALL   = C.IIM_SANBO_CD AND H.CSC_LEVEL = '5'           
 WHERE A.EEA_EXAM_DT >= :EXAM_SDT 
   AND A.EEA_EXAM_DT <= :EXAM_EDT                                                                                            
   AND A.EEA_COMP_CD  = :COMP_CD              
   AND SUBSTR(EEA_MNGT_SPYM, 1, 4) = :MNGT_YR  
   AND A.EEA_ORDER_YN <> 'C'
   AND (A.EEA_EXAM_CD IN ('41001', '42001') 
    OR  A.EEA_SPSB_CD IN ('41001', '42001'))    
   AND F.SBE_PANJ_YN  = 'Y' 
   AND F.SBE_EXAM_CHA = '1'  
   AND IIM_RSLT_KD IN ('1', '2', '4', '5', '7')
   AND NVL(B.ERI_CNCL_YN, 'N') <> 'Y' 
   AND B.ERI_SPCL_KD = '1'

IF (:PSNL_NM <> '') THEN 
  AND A.EEA_PSNL_NM = :PSNL_NM
  
:PARAM_TX1
:PARAM_TX2

 ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ, B.ERI_ITEM_CD

		*/

		sql = " SELECT CASE '" + PENCRT_KD + "' WHEN '1' THEN F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '1') WHEN '2' THEN ECL_DECRYPT(F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '1')) ELSE F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '0') END ICR_PENL_ID";
		sql += ", A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, A.EEA_SEX_CD, A.EEA_EXAM_CD, G.SIR_EXAM_DT2, G.SIR_EXAM_SQ2";
		sql += ", CASE WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) <> '4' THEN A.EEA_SPSB_CD ELSE A.EEA_EXAM_CD END EEA_SPSB_CD";
		sql += ", B.ERI_ITEM_CD, C.IIM_SBCD_CD, B.ERI_RSLT_VL, B.ERI_SPRT_CD, B.ERI_SPSB_PANJ, C.IIM_TRLT_CD, E.SIC_CANC_LT, C.IIM_TRTP_CD, B.ERI_RSLT_UNIT, F_ITEM_VLDT_FIND(B.ERI_ITEM_CD, A.EEA_SEX_CD, '1', '0', SUBSTR(NVL(B.ERI_SPSB_PANJ, 'XX'), 2, 1), A.EEA_EXAM_DT) CLINC_REFER_LOW, F_ITEM_VLDT_FIND(B.ERI_ITEM_CD, A.EEA_SEX_CD, '2', '0', SUBSTR(NVL(B.ERI_SPSB_PANJ, 'XX'), 2, 1), A.EEA_EXAM_DT) CLINC_REFER_HGH, C.IIM_SANBO_KD, C.IIM_SANBO_CD, C.IIM_SANBO_CAL, H.CSC_FULL_NM";

		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_RSLT_ITEM B";
		sql += " ON B.ERI_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND B.ERI_EXAM_SQ = A.EEA_EXAM_SQ";
		
		sql += " LEFT OUTER JOIN ST_ITEM_HIGHPRICE D";
		sql += " ON D.SIH_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND D.SIH_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " AND B.ERI_ITEM_CD = D.SIH_ITEM_CD";
		
		sql += " LEFT OUTER JOIN IT_ITEM C";
		sql += " ON C.IIM_ITEM_CD = B.ERI_ITEM_CD";
		
		sql += " LEFT OUTER JOIN ST_ITEM_CANCEL E";
		sql += " ON E.SIC_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND E.SIC_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " AND B.ERI_ITEM_CD = E.SIC_ITEM_CD";
		
		sql += " LEFT OUTER JOIN ST_BASE F";
		sql += " ON F.SBE_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND F.SBE_EXAM_SQ = A.EEA_EXAM_SQ";
		
		sql += " LEFT OUTER JOIN ST_ITEM_RECHECK G";
		sql += " ON G.SIR_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND G.SIR_EXAM_SQ = A.EEA_EXAM_SQ";
		
		sql += " LEFT OUTER JOIN CT_SP_COMMON H";
		sql += " ON H.CSC_LARGE = 'HM06F'";
		sql += " AND H.CSC_SMALL = C.IIM_SANBO_CD";
		sql += " AND H.CSC_LEVEL = '5'";

		sql += " WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND SUBSTR(EEA_MNGT_SPYM, 1, 4) = '" + MNGT_YR + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND (";
		sql += "	A.EEA_EXAM_CD IN ('41001', '42001')";
		sql += " 	OR A.EEA_SPSB_CD IN ('41001', '42001')";
		sql += " )";
		sql += " AND F.SBE_PANJ_YN = 'Y'";
		sql += " AND F.SBE_EXAM_CHA = '1'";
		sql += " AND IIM_RSLT_KD IN ('1', '2', '4', '5', '7')";
		sql += " AND NVL(B.ERI_CNCL_YN, 'N') <> 'Y'";
		sql += " AND B.ERI_SPCL_KD = '1'";

		if(! PSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM = '" + PSNL_NM + "'";
		}
		
		sql += PARAM_TX1;
		sql += PARAM_TX2;

		sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ, B.ERI_ITEM_CD";


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_SPChungGU_Chk_UDP_RESULTERR_001 \n";
			G_INFO += "설명 : 검진결과 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PENCRT_KD : " + PENCRT_KD + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
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
		<s:AttributeType name='ICR_PENL_ID' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='6' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_DT2' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_EXAM_DT2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_SQ2' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_EXAM_SQ2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ITEM_CD' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SBCD_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPRT_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPSB_PANJ' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRLT_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SIC_CANC_LT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL'
			 rs:basecolumn='SIC_CANC_LT'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRTP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_UNIT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CLINC_REFER_LOW' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CLINC_REFER_HGH' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SANBO_KD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SANBO_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SANBO_CD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SANBO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SANBO_CAL' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SANBO_CAL'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_FULL_NM' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_COMMON'
			 rs:basecolumn='CSC_FULL_NM'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='25' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c25' rs:name='ROWID' rs:number='26' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c26' rs:name='ROWID' rs:number='27' rs:rowid='true' rs:basetable='ST_ITEM_HIGHPRICE'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c27' rs:name='ROWID' rs:number='28' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c28' rs:name='ROWID' rs:number='29' rs:rowid='true' rs:basetable='ST_ITEM_CANCEL' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c29' rs:name='ROWID' rs:number='30' rs:rowid='true' rs:basetable='ST_BASE' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c30' rs:name='ROWID' rs:number='31' rs:rowid='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c31' rs:name='ROWID' rs:number='32' rs:rowid='true' rs:basetable='CT_SP_COMMON' rs:basecolumn='ROWID'
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

			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String SIR_EXAM_DT2_T = cRsList.getString("SIR_EXAM_DT2");
			String SIR_EXAM_SQ2_T = cRsList.getString("SIR_EXAM_SQ2");
			String EEA_SPSB_CD_T = cRsList.getString("EEA_SPSB_CD");
			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String IIM_SBCD_CD_T = cRsList.getString("IIM_SBCD_CD");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String ERI_SPRT_CD_T = cRsList.getString("ERI_SPRT_CD");
			String ERI_SPSB_PANJ_T = cRsList.getString("ERI_SPSB_PANJ");
			String IIM_TRLT_CD_T = cRsList.getString("IIM_TRLT_CD");
			String SIC_CANC_LT_T = cRsList.getString("SIC_CANC_LT");
			String IIM_TRTP_CD_T = cRsList.getString("IIM_TRTP_CD");
			String ERI_RSLT_UNIT_T = cRsList.getString("ERI_RSLT_UNIT");
			String CLINC_REFER_LOW_T = cRsList.getString("CLINC_REFER_LOW");
			String CLINC_REFER_HGH_T = cRsList.getString("CLINC_REFER_HGH");
			String IIM_SANBO_KD_T = cRsList.getString("IIM_SANBO_KD");
			String IIM_SANBO_CD_T = cRsList.getString("IIM_SANBO_CD");
			String IIM_SANBO_CAL_T = cRsList.getString("IIM_SANBO_CAL");
			String CSC_FULL_NM_T = cRsList.getString("CSC_FULL_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c25_T = cRsList.getString("c25");
			String c26_T = cRsList.getString("c26");
			String c27_T = cRsList.getString("c27");
			String c28_T = cRsList.getString("c28");
			String c29_T = cRsList.getString("c29");
			String c30_T = cRsList.getString("c30");
			String c31_T = cRsList.getString("c31");
%>
			<z:row
<%
			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
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

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! SIR_EXAM_DT2_T.equals("")) {
%>
		 		SIR_EXAM_DT2='<%= SIR_EXAM_DT2_T%>'
<%
			}

			if(! SIR_EXAM_SQ2_T.equals("")) {
%>
		 		SIR_EXAM_SQ2='<%= SIR_EXAM_SQ2_T%>'
<%
			}

			if(! EEA_SPSB_CD_T.equals("")) {
%>
		 		EEA_SPSB_CD='<%= EEA_SPSB_CD_T%>'
<%
			}

			if(! ERI_ITEM_CD_T.equals("")) {
%>
		 		ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
<%
			}

			if(! IIM_SBCD_CD_T.equals("")) {
%>
		 		IIM_SBCD_CD='<%= IIM_SBCD_CD_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! ERI_SPRT_CD_T.equals("")) {
%>
		 		ERI_SPRT_CD='<%= ERI_SPRT_CD_T%>'
<%
			}

			if(! ERI_SPSB_PANJ_T.equals("")) {
%>
		 		ERI_SPSB_PANJ='<%= ERI_SPSB_PANJ_T%>'
<%
			}

			if(! IIM_TRLT_CD_T.equals("")) {
%>
		 		IIM_TRLT_CD='<%= IIM_TRLT_CD_T%>'
<%
			}

			if(! SIC_CANC_LT_T.equals("")) {
%>
		 		SIC_CANC_LT='<%= SIC_CANC_LT_T%>'
<%
			}

			if(! IIM_TRTP_CD_T.equals("")) {
%>
		 		IIM_TRTP_CD='<%= IIM_TRTP_CD_T%>'
<%
			}

			if(! ERI_RSLT_UNIT_T.equals("")) {
%>
		 		ERI_RSLT_UNIT='<%= ERI_RSLT_UNIT_T%>'
<%
			}

			if(! CLINC_REFER_LOW_T.equals("")) {
%>
		 		CLINC_REFER_LOW='<%= CLINC_REFER_LOW_T%>'
<%
			}

			if(! CLINC_REFER_HGH_T.equals("")) {
%>
		 		CLINC_REFER_HGH='<%= CLINC_REFER_HGH_T%>'
<%
			}

			if(! IIM_SANBO_KD_T.equals("")) {
%>
		 		IIM_SANBO_KD='<%= IIM_SANBO_KD_T%>'
<%
			}

			if(! IIM_SANBO_CD_T.equals("")) {
%>
		 		IIM_SANBO_CD='<%= IIM_SANBO_CD_T%>'
<%
			}

			if(! IIM_SANBO_CAL_T.equals("")) {
%>
		 		IIM_SANBO_CAL='<%= IIM_SANBO_CAL_T%>'
<%
			}

			if(! CSC_FULL_NM_T.equals("")) {
%>
		 		CSC_FULL_NM='<%= CSC_FULL_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c25='<%= cnt%>'
				c26='<%= cnt%>'
				c27='<%= cnt%>'
				c28='<%= cnt%>'
				c29='<%= cnt%>'
				c30='<%= cnt%>'
				c31='<%= cnt%>'
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
