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

		String ENCRT_KD = htMethod.get("ENCRT_KD");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String MNGT_YM = htMethod.get("MNGT_YM");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(ENCRT_KD == null) { ENCRT_KD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(MNGT_YM == null) { MNGT_YM = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

IF (:ENCRT_KD = '1') THEN
  SELECT B.ICR_PID_EN  ICR_PENL_DE, 
ELSE IF (:ENCRT_KD = '2') THEN 
  SELECT ECHELONDB.ECL_DECRYPT(B.ICR_PID_EN) ICR_PENL_DE, 
ELSE 
  SELECT B.ICR_PENL_ID ICR_PENL_DE,
  
       CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END ICR_SPCH_KD,                                    
       CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END ICR_SPCL_NM,  
       CASE WHEN A.EEA_SPHT_CD IS NULL OR A.EEA_SPHT_CD = '' THEN A.EEA_SPHT_CD ELSE GETCOMMON_LVCDTONM('0911',A.EEA_SPHT_CD,'5',1) END ICR_SPHT_MN,  
       CASE WHEN A.EEA_EXAM_CD IS NULL OR A.EEA_EXAM_CD = '' THEN A.EEA_EXAM_CD ELSE GETCOMMON_LVCDTONM('0401',A.EEA_EXAM_CD,'5',5) END ICR_EXAM_NM,  
       CASE WHEN A.EEA_SEX_CD  IS NULL OR A.EEA_SEX_CD  = '' THEN A.EEA_SEX_CD  ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) END ICR_SEX_NM,  
       A.EEA_EXAM_DT, A.EEA_CUST_NO, A.EEA_PSNL_NM,  A.EEA_EXAM_SQ, A.EEA_PSNL_AGE, A.EEA_EXAM_CD, A.EEA_HDMD_YN, A.EEA_SDMD_YN, A.EEA_SPCL_LT, A.EEA_SPCL_CD,  
       A.EEA_SPHT_CD, A.EEA_DEPT_NM, A.EEA_CHART_NO, A.EEA_PLCE_CD, A.EEA_COMP_CD,                                                            
       SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, B.ICR_BIRH_KD, A.EEA_TEL_NO, A.EEA_MOBL_NO,                                                 
       C.ICY_COMP_CD, C.ICY_COMP_NM, E.IIM_ITEM_CD, E.IIM_KNME_NM, D.ERI_RSLT_VL                                  
  FROM ET_EXAM_ACPT A                        
            INNER JOIN IT_CUSTOMER  B ON A.EEA_CUST_NO = B.ICR_CUST_NO 
       LEFT OUTER JOIN IT_COMPANY   C ON A.EEA_COMP_CD = C.ICY_COMP_CD
            INNER JOIN ET_RSLT_ITEM D ON D.ERI_EXAM_DT = A.EEA_EXAM_DT
                                     AND D.ERI_EXAM_SQ = A.EEA_EXAM_SQ 
                                     AND D.ERI_ITEM_CD = :ITEM_CD
            INNER JOIN IT_ITEM      E ON E.IIM_ITEM_CD = :ITEM_CD       
 WHERE A.EEA_EXAM_DT >= :EXAM_SDT
   AND A.EEA_EXAM_DT <= :EXAM_EDT
   AND SUBSTR(A.EEA_MNGT_SPYM,1,4) = :MNGT_YM
   AND A.EEA_ORDER_YN <> 'C'
   
:PARAM_TX1
:PARAM_TX2
:ORDER_BY
		*/

		if(ENCRT_KD.equals("1")) {
			sql = " SELECT B.ICR_PID_EN ICR_PENL_DE,";
		}
		else if (ENCRT_KD.equals("2")) {
			sql = " SELECT ECHELONDB.ECL_DECRYPT(B.ICR_PID_EN) ICR_PENL_DE,";
		}
		else {
			sql = " SELECT B.ICR_PENL_ID ICR_PENL_DE,";
		}
		sql += " CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END ICR_SPCH_KD";
		sql += ", CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END ICR_SPCL_NM";
		sql += ", CASE WHEN A.EEA_SPHT_CD IS NULL OR A.EEA_SPHT_CD = '' THEN A.EEA_SPHT_CD ELSE GETCOMMON_LVCDTONM('0911',A.EEA_SPHT_CD,'5',1) END ICR_SPHT_MN";
		sql += ", CASE WHEN A.EEA_EXAM_CD IS NULL OR A.EEA_EXAM_CD = '' THEN A.EEA_EXAM_CD ELSE GETCOMMON_LVCDTONM('0401',A.EEA_EXAM_CD,'5',5) END ICR_EXAM_NM";
		sql += ", CASE WHEN A.EEA_SEX_CD IS NULL OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) END ICR_SEX_NM";
		sql += ", A.EEA_EXAM_DT, A.EEA_CUST_NO, A.EEA_PSNL_NM, A.EEA_EXAM_SQ, A.EEA_PSNL_AGE, A.EEA_EXAM_CD, A.EEA_HDMD_YN, A.EEA_SDMD_YN, A.EEA_SPCL_LT, A.EEA_SPCL_CD, A.EEA_SPHT_CD, A.EEA_DEPT_NM, A.EEA_CHART_NO, A.EEA_PLCE_CD, A.EEA_COMP_CD, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, B.ICR_BIRH_KD, A.EEA_TEL_NO, A.EEA_MOBL_NO, C.ICY_COMP_CD, C.ICY_COMP_NM, E.IIM_ITEM_CD, E.IIM_KNME_NM, D.ERI_RSLT_VL";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD INNER JOIN ET_RSLT_ITEM D";
		sql += " ON D.ERI_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND D.ERI_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " AND D.ERI_ITEM_CD = '" + ITEM_CD + "' INNER JOIN IT_ITEM E";
		sql += " ON E.IIM_ITEM_CD = '" + ITEM_CD + "'";
		sql += " WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += " AND SUBSTR(A.EEA_MNGT_SPYM,1,4) = '" + MNGT_YM + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		sql += PARAM_TX1;
		sql += PARAM_TX2;
		sql += ORDER_BY;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_CUSTLIST_UF_SqlSet_006 \n";
			G_INFO += "설명 : 06-특정검사 검사자 현황 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ENCRT_KD : " + ENCRT_KD + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " MNGT_YM : " + MNGT_YM + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
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
		<s:AttributeType name='ICR_PENL_DE' rs:number='1' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SPCH_KD' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SPCL_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SPHT_MN' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_EXAM_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='7'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='8' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='9' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='10' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='12' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HDMD_YN' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SDMD_YN' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPHT_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPHT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='20' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BIRTH_DT' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_KD' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEL_NO' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_CD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ITEM_CD' rs:number='28' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='29' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='31' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c31' rs:name='ROWID' rs:number='32' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c32' rs:name='ROWID' rs:number='33' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c33' rs:name='ROWID' rs:number='34' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c34' rs:name='ROWID' rs:number='35' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ICR_PENL_DE_T = cRsList.getString("ICR_PENL_DE");
			String ICR_SPCH_KD_T = cRsList.getString("ICR_SPCH_KD");
			String ICR_SPCL_NM_T = cRsList.getString("ICR_SPCL_NM");
			String ICR_SPHT_MN_T = cRsList.getString("ICR_SPHT_MN");
			String ICR_EXAM_NM_T = cRsList.getString("ICR_EXAM_NM");
			String ICR_SEX_NM_T = cRsList.getString("ICR_SEX_NM");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_HDMD_YN_T = cRsList.getString("EEA_HDMD_YN");
			String EEA_SDMD_YN_T = cRsList.getString("EEA_SDMD_YN");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_SPHT_CD_T = cRsList.getString("EEA_SPHT_CD");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_BIRTH_DT_T = cRsList.getString("EEA_BIRTH_DT");
			String ICR_BIRH_KD_T = cRsList.getString("ICR_BIRH_KD");
			String EEA_TEL_NO_T = cRsList.getString("EEA_TEL_NO");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String ICY_COMP_CD_T = cRsList.getString("ICY_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String ROWID_T = cRsList.getString("ROWID");
			String c31_T = cRsList.getString("c31");
			String c32_T = cRsList.getString("c32");
			String c33_T = cRsList.getString("c33");
			String c34_T = cRsList.getString("c34");
%>
			<z:row
<%
			if(! ICR_PENL_DE_T.equals("")) {
%>
		 		ICR_PENL_DE='<%= ICR_PENL_DE_T%>'
<%
			}

			if(! ICR_SPCH_KD_T.equals("")) {
%>
		 		ICR_SPCH_KD='<%= ICR_SPCH_KD_T%>'
<%
			}

			if(! ICR_SPCL_NM_T.equals("")) {
%>
		 		ICR_SPCL_NM='<%= ICR_SPCL_NM_T%>'
<%
			}

			if(! ICR_SPHT_MN_T.equals("")) {
%>
		 		ICR_SPHT_MN='<%= ICR_SPHT_MN_T%>'
<%
			}

			if(! ICR_EXAM_NM_T.equals("")) {
%>
		 		ICR_EXAM_NM='<%= ICR_EXAM_NM_T%>'
<%
			}

			if(! ICR_SEX_NM_T.equals("")) {
%>
		 		ICR_SEX_NM='<%= ICR_SEX_NM_T%>'
<%
			}

			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! EEA_HDMD_YN_T.equals("")) {
%>
		 		EEA_HDMD_YN='<%= EEA_HDMD_YN_T%>'
<%
			}

			if(! EEA_SDMD_YN_T.equals("")) {
%>
		 		EEA_SDMD_YN='<%= EEA_SDMD_YN_T%>'
<%
			}

			if(! EEA_SPCL_LT_T.equals("")) {
%>
		 		EEA_SPCL_LT='<%= EEA_SPCL_LT_T%>'
<%
			}

			if(! EEA_SPCL_CD_T.equals("")) {
%>
		 		EEA_SPCL_CD='<%= EEA_SPCL_CD_T%>'
<%
			}

			if(! EEA_SPHT_CD_T.equals("")) {
%>
		 		EEA_SPHT_CD='<%= EEA_SPHT_CD_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! EEA_BIRTH_DT_T.equals("")) {
%>
		 		EEA_BIRTH_DT='<%= EEA_BIRTH_DT_T%>'
<%
			}

			if(! ICR_BIRH_KD_T.equals("")) {
%>
		 		ICR_BIRH_KD='<%= ICR_BIRH_KD_T%>'
<%
			}

			if(! EEA_TEL_NO_T.equals("")) {
%>
		 		EEA_TEL_NO='<%= EEA_TEL_NO_T%>'
<%
			}

			if(! EEA_MOBL_NO_T.equals("")) {
%>
		 		EEA_MOBL_NO='<%= EEA_MOBL_NO_T%>'
<%
			}

			if(! ICY_COMP_CD_T.equals("")) {
%>
		 		ICY_COMP_CD='<%= ICY_COMP_CD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! IIM_ITEM_CD_T.equals("")) {
%>
		 		IIM_ITEM_CD='<%= IIM_ITEM_CD_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c31='<%= cnt%>'
				c32='<%= cnt%>'
				c33='<%= cnt%>'
				c34='<%= cnt%>'
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
