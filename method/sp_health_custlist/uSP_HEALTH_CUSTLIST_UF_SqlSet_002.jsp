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
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String MNGT_YM = htMethod.get("MNGT_YM");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(ENCRT_KD == null) { ENCRT_KD = ""; }
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
  
       A.EEA_EXAM_DT, A.EEA_CUST_NO, A.EEA_PSNL_NM, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, B.ICR_BIRH_KD, A.EEA_EXAM_SQ, 
       A.EEA_PSNL_AGE, A.EEA_TEL_NO, A.EEA_MOBL_NO, C.ICY_COMP_CD, C.ICY_COMP_NM, A.EEA_PLCE_CD, A.EEA_COMP_CD, 
       CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END ICR_SPCH_KD, 
       CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END ICR_SPCL_NM, 
       CASE WHEN A.EEA_SPHT_CD IS NULL OR A.EEA_SPHT_CD = '' THEN A.EEA_SPHT_CD ELSE GETCOMMON_LVCDTONM('0911',A.EEA_SPHT_CD,'5',1) END ICR_SPHT_MN, 
       CASE WHEN A.EEA_EXAM_CD IS NULL OR A.EEA_EXAM_CD = '' THEN A.EEA_EXAM_CD ELSE GETCOMMON_LVCDTONM('0401',A.EEA_EXAM_CD,'5',5) END ICR_EXAM_NM, 
       CASE WHEN A.EEA_SEX_CD  IS NULL OR A.EEA_SEX_CD  = '' THEN A.EEA_SEX_CD  ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) END ICR_SEX_NM,  
       CASE WHEN E.SPG_ORGA_CD IS NULL OR E.SPG_ORGA_CD = '' THEN E.SPG_ORGA_CD ELSE GETSP_COMMON_CDTONM('HM05D',E.SPG_ORGA_CD) END SPG_ORGA_NM,  
       CASE WHEN E.SPG_PANJ_CD IS NULL OR E.SPG_PANJ_CD = '' THEN E.SPG_PANJ_CD ELSE GETSP_COMMON_CDTONM('HM05E',E.SPG_PANJ_CD) END SPG_PANJ_NM,  
       GETSP_COMMON_CDTONM('HM05A',E.SPG_POSM1_CD) SPG_POSM1_NM, 
       GETSP_COMMON_CDTONM('HM05A',E.SPG_POSM2_CD) SPG_POSM2_NM, 
       GETSP_COMMON_CDTONM('HM05A',E.SPG_POSM3_CD) SPG_POSM3_NM, 
       GETSP_COMMON_CDTONM('HM05B',E.SPG_BUSI_CD)  SPG_BUSI_NM,  
       A.EEA_EXAM_CD, A.EEA_HDMD_YN, A.EEA_SDMD_YN, A.EEA_SPCL_LT, A.EEA_SPCL_CD, A.EEA_SPHT_CD, A.EEA_CHART_NO, 
       A.EEA_DEPT_NM, D.SBE_TOBO_DT, D.SBE_RECHK_DT, D.SBE_SEND_YN, D.SBE_SEND_NM, 
       E.SPG_ORGA_CD, E.SPG_SWING_CD, E.SPG_PANJ_CD, E.SPG_PANJ_DT, E.SPG_DOCT_CD, E.SPG_MATT_CD, E.SPG_REMARK, 
       E.SPG_POSM1_TX, E.SPG_POSM1_DT, E.SPG_POSM2_TX, E.SPG_POSM2_DT, E.SPG_POSM3_TX, E.SPG_POSM3_DT, 
       E.SPG_POSM1_CD, E.SPG_POSM2_CD, E.SPG_POSM3_CD, E.SPG_SOKY_NM, E.SPG_JILH_CD, E.SPG_SWING_CD,
       E.SPG_SOKY_TX,  E.SPG_POSM1_TX, SPG_POSM2_TX, SPG_POSM3_TX, D.SBE_ETC_TX
  FROM ET_EXAM_ACPT A 
            INNER JOIN IT_CUSTOMER B ON A.EEA_CUST_NO = B.ICR_CUST_NO 
       LEFT OUTER JOIN IT_COMPANY  C ON A.EEA_COMP_CD = C.ICY_COMP_CD 
       LEFT OUTER JOIN ST_BASE     D ON A.EEA_EXAM_DT = D.SBE_EXAM_DT AND A.EEA_EXAM_SQ = D.SBE_EXAM_SQ
       LEFT OUTER JOIN ST_PANJUNG  E ON A.EEA_EXAM_DT = E.SPG_EXAM_DT AND A.EEA_EXAM_SQ = E.SPG_EXAM_SQ
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
		else if(ENCRT_KD.equals("2")) {
			sql = " SELECT ECL_DECRYPT(B.ICR_PID_EN) ICR_PENL_DE,";
		}
		else {
			sql = " SELECT B.ICR_PENL_ID ICR_PENL_DE,";
		}

		sql += " A.EEA_EXAM_DT, A.EEA_CUST_NO, A.EEA_PSNL_NM, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, B.ICR_BIRH_KD, A.EEA_EXAM_SQ, A.EEA_PSNL_AGE, A.EEA_TEL_NO, A.EEA_MOBL_NO, C.ICY_COMP_CD, C.ICY_COMP_NM, A.EEA_PLCE_CD, A.EEA_COMP_CD, CASE WHEN A.EEA_EXAM_CD = '41001'";
		sql += " OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END ICR_SPCH_KD, CASE WHEN A.EEA_SPCL_CD IS NULL";
		sql += " OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END ICR_SPCL_NM, CASE WHEN A.EEA_SPHT_CD IS NULL";
		sql += " OR A.EEA_SPHT_CD = '' THEN A.EEA_SPHT_CD ELSE GETCOMMON_LVCDTONM('0911',A.EEA_SPHT_CD,'5',1) END ICR_SPHT_MN, CASE WHEN A.EEA_EXAM_CD IS NULL";
		sql += " OR A.EEA_EXAM_CD = '' THEN A.EEA_EXAM_CD ELSE GETCOMMON_LVCDTONM('0401',A.EEA_EXAM_CD,'5',5) END ICR_EXAM_NM, CASE WHEN A.EEA_SEX_CD IS NULL";
		sql += " OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) END ICR_SEX_NM, CASE WHEN E.SPG_ORGA_CD IS NULL";
		sql += " OR E.SPG_ORGA_CD = '' THEN E.SPG_ORGA_CD ELSE GETSP_COMMON_CDTONM('HM05D',E.SPG_ORGA_CD) END SPG_ORGA_NM, CASE WHEN E.SPG_PANJ_CD IS NULL";
		sql += " OR E.SPG_PANJ_CD = '' THEN E.SPG_PANJ_CD ELSE GETSP_COMMON_CDTONM('HM05E',E.SPG_PANJ_CD) END SPG_PANJ_NM, GETSP_COMMON_CDTONM('HM05A',E.SPG_POSM1_CD) SPG_POSM1_NM, GETSP_COMMON_CDTONM('HM05A',E.SPG_POSM2_CD) SPG_POSM2_NM, GETSP_COMMON_CDTONM('HM05A',E.SPG_POSM3_CD) SPG_POSM3_NM, GETSP_COMMON_CDTONM('HM05B',E.SPG_BUSI_CD) SPG_BUSI_NM, A.EEA_EXAM_CD, A.EEA_HDMD_YN, A.EEA_SDMD_YN, A.EEA_SPCL_LT, A.EEA_SPCL_CD, A.EEA_SPHT_CD, A.EEA_CHART_NO, A.EEA_DEPT_NM, D.SBE_TOBO_DT, D.SBE_RECHK_DT, D.SBE_SEND_YN, D.SBE_SEND_NM, E.SPG_ORGA_CD, E.SPG_SWING_CD, E.SPG_PANJ_CD, E.SPG_PANJ_DT, E.SPG_DOCT_CD, E.SPG_MATT_CD, E.SPG_REMARK, E.SPG_POSM1_TX, E.SPG_POSM1_DT, E.SPG_POSM2_TX, E.SPG_POSM2_DT, E.SPG_POSM3_TX, E.SPG_POSM3_DT, E.SPG_POSM1_CD, E.SPG_POSM2_CD, E.SPG_POSM3_CD, E.SPG_SOKY_NM, E.SPG_JILH_CD, E.SPG_SWING_CD, E.SPG_SOKY_TX, E.SPG_POSM1_TX, SPG_POSM2_TX, SPG_POSM3_TX, D.SBE_ETC_TX";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN ST_BASE D";
		sql += " ON A.EEA_EXAM_DT = D.SBE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.SBE_EXAM_SQ LEFT OUTER JOIN ST_PANJUNG E";
		sql += " ON A.EEA_EXAM_DT = E.SPG_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = E.SPG_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += " AND SUBSTR(A.EEA_MNGT_SPYM,1,4) = '" + MNGT_YM + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += PARAM_TX1;
		sql += PARAM_TX2;
		sql += ORDER_BY;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_CUSTLIST_UF_SqlSet_002 \n";
			G_INFO += "설명 : 02-특검 유질환 명단 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ENCRT_KD : " + ENCRT_KD + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BIRTH_DT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='7' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEL_NO' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='13' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SPCH_KD' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SPCL_NM' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SPHT_MN' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_EXAM_NM' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_NM' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ORGA_NM' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_NM' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM1_NM' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM2_NM' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM3_NM' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_BUSI_NM' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='26' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HDMD_YN' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SDMD_YN' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPHT_CD' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPHT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TOBO_DT' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_TOBO_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_RECHK_DT' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_RECHK_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_SEND_YN' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_SEND_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_SEND_NM' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_SEND_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ORGA_CD' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_ORGA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SWING_CD' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_SWING_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_CD' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_PANJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_DT' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_PANJ_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_DOCT_CD' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_MATT_CD' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_REMARK' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_REMARK'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM1_TX' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM1_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM1_DT' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM1_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM2_TX' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM2_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM2_DT' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM2_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM3_TX' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM3_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM3_DT' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM3_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM1_CD' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM1_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM2_CD' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM2_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM3_CD' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_POSM3_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SOKY_NM' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_SOKY_NM'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_JILH_CD' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_JILH_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='c55' rs:name='SPG_SWING_CD' rs:number='56' rs:nullable='true' rs:writeunknown='true'
			 rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_SWING_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SOKY_TX' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PANJUNG'
			 rs:basecolumn='SPG_SOKY_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='c57' rs:name='SPG_POSM1_TX' rs:number='58' rs:nullable='true' rs:writeunknown='true'
			 rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_POSM1_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='c58' rs:name='SPG_POSM2_TX' rs:number='59' rs:nullable='true' rs:writeunknown='true'
			 rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_POSM2_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='c59' rs:name='SPG_POSM3_TX' rs:number='60' rs:nullable='true' rs:writeunknown='true'
			 rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_POSM3_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_ETC_TX' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_ETC_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='62' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c62' rs:name='ROWID' rs:number='63' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c63' rs:name='ROWID' rs:number='64' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c64' rs:name='ROWID' rs:number='65' rs:rowid='true' rs:basetable='ST_BASE' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c65' rs:name='ROWID' rs:number='66' rs:rowid='true' rs:basetable='ST_PANJUNG' rs:basecolumn='ROWID'
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
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_BIRTH_DT_T = cRsList.getString("EEA_BIRTH_DT");
			String ICR_BIRH_KD_T = cRsList.getString("ICR_BIRH_KD");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_TEL_NO_T = cRsList.getString("EEA_TEL_NO");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String ICY_COMP_CD_T = cRsList.getString("ICY_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String ICR_SPCH_KD_T = cRsList.getString("ICR_SPCH_KD");
			String ICR_SPCL_NM_T = cRsList.getString("ICR_SPCL_NM");
			String ICR_SPHT_MN_T = cRsList.getString("ICR_SPHT_MN");
			String ICR_EXAM_NM_T = cRsList.getString("ICR_EXAM_NM");
			String ICR_SEX_NM_T = cRsList.getString("ICR_SEX_NM");
			String SPG_ORGA_NM_T = cRsList.getString("SPG_ORGA_NM");
			String SPG_PANJ_NM_T = cRsList.getString("SPG_PANJ_NM");
			String SPG_POSM1_NM_T = cRsList.getString("SPG_POSM1_NM");
			String SPG_POSM2_NM_T = cRsList.getString("SPG_POSM2_NM");
			String SPG_POSM3_NM_T = cRsList.getString("SPG_POSM3_NM");
			String SPG_BUSI_NM_T = cRsList.getString("SPG_BUSI_NM");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_HDMD_YN_T = cRsList.getString("EEA_HDMD_YN");
			String EEA_SDMD_YN_T = cRsList.getString("EEA_SDMD_YN");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_SPHT_CD_T = cRsList.getString("EEA_SPHT_CD");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String SBE_TOBO_DT_T = cRsList.getString("SBE_TOBO_DT");
			String SBE_RECHK_DT_T = cRsList.getString("SBE_RECHK_DT");
			String SBE_SEND_YN_T = cRsList.getString("SBE_SEND_YN");
			String SBE_SEND_NM_T = cRsList.getString("SBE_SEND_NM");
			String SPG_ORGA_CD_T = cRsList.getString("SPG_ORGA_CD");
			String SPG_SWING_CD_T = cRsList.getString("SPG_SWING_CD");
			String SPG_PANJ_CD_T = cRsList.getString("SPG_PANJ_CD");
			String SPG_PANJ_DT_T = cRsList.getString("SPG_PANJ_DT");
			String SPG_DOCT_CD_T = cRsList.getString("SPG_DOCT_CD");
			String SPG_MATT_CD_T = cRsList.getString("SPG_MATT_CD");
			String SPG_REMARK_T = cRsList.getString("SPG_REMARK");
			String SPG_POSM1_TX_T = cRsList.getString("SPG_POSM1_TX");
			String SPG_POSM1_DT_T = cRsList.getString("SPG_POSM1_DT");
			String SPG_POSM2_TX_T = cRsList.getString("SPG_POSM2_TX");
			String SPG_POSM2_DT_T = cRsList.getString("SPG_POSM2_DT");
			String SPG_POSM3_TX_T = cRsList.getString("SPG_POSM3_TX");
			String SPG_POSM3_DT_T = cRsList.getString("SPG_POSM3_DT");
			String SPG_POSM1_CD_T = cRsList.getString("SPG_POSM1_CD");
			String SPG_POSM2_CD_T = cRsList.getString("SPG_POSM2_CD");
			String SPG_POSM3_CD_T = cRsList.getString("SPG_POSM3_CD");
			String SPG_SOKY_NM_T = cRsList.getString("SPG_SOKY_NM");
			String SPG_JILH_CD_T = cRsList.getString("SPG_JILH_CD");
			String c55_T = cRsList.getString("c55");
			String SPG_SOKY_TX_T = cRsList.getString("SPG_SOKY_TX");
			String c57_T = cRsList.getString("c57");
			String c58_T = cRsList.getString("c58");
			String c59_T = cRsList.getString("c59");
			String SBE_ETC_TX_T = cRsList.getString("SBE_ETC_TX");
			String ROWID_T = cRsList.getString("ROWID");
			String c62_T = cRsList.getString("c62");
			String c63_T = cRsList.getString("c63");
			String c64_T = cRsList.getString("c64");
			String c65_T = cRsList.getString("c65");
%>
			<z:row
<%
			if(! ICR_PENL_DE_T.equals("")) {
%>
		 		ICR_PENL_DE='<%= ICR_PENL_DE_T%>'
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

			if(! SPG_ORGA_NM_T.equals("")) {
%>
		 		SPG_ORGA_NM='<%= SPG_ORGA_NM_T%>'
<%
			}

			if(! SPG_PANJ_NM_T.equals("")) {
%>
		 		SPG_PANJ_NM='<%= SPG_PANJ_NM_T%>'
<%
			}

			if(! SPG_POSM1_NM_T.equals("")) {
%>
		 		SPG_POSM1_NM='<%= SPG_POSM1_NM_T%>'
<%
			}

			if(! SPG_POSM2_NM_T.equals("")) {
%>
		 		SPG_POSM2_NM='<%= SPG_POSM2_NM_T%>'
<%
			}

			if(! SPG_POSM3_NM_T.equals("")) {
%>
		 		SPG_POSM3_NM='<%= SPG_POSM3_NM_T%>'
<%
			}

			if(! SPG_BUSI_NM_T.equals("")) {
%>
		 		SPG_BUSI_NM='<%= SPG_BUSI_NM_T%>'
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

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! SBE_TOBO_DT_T.equals("")) {
%>
		 		SBE_TOBO_DT='<%= SBE_TOBO_DT_T%>'
<%
			}

			if(! SBE_RECHK_DT_T.equals("")) {
%>
		 		SBE_RECHK_DT='<%= SBE_RECHK_DT_T%>'
<%
			}

			if(! SBE_SEND_YN_T.equals("")) {
%>
		 		SBE_SEND_YN='<%= SBE_SEND_YN_T%>'
<%
			}

			if(! SBE_SEND_NM_T.equals("")) {
%>
		 		SBE_SEND_NM='<%= SBE_SEND_NM_T%>'
<%
			}

			if(! SPG_ORGA_CD_T.equals("")) {
%>
		 		SPG_ORGA_CD='<%= SPG_ORGA_CD_T%>'
<%
			}

			if(! SPG_SWING_CD_T.equals("")) {
%>
		 		SPG_SWING_CD='<%= SPG_SWING_CD_T%>'
<%
			}

			if(! SPG_PANJ_CD_T.equals("")) {
%>
		 		SPG_PANJ_CD='<%= SPG_PANJ_CD_T%>'
<%
			}

			if(! SPG_PANJ_DT_T.equals("")) {
%>
		 		SPG_PANJ_DT='<%= SPG_PANJ_DT_T%>'
<%
			}

			if(! SPG_DOCT_CD_T.equals("")) {
%>
		 		SPG_DOCT_CD='<%= SPG_DOCT_CD_T%>'
<%
			}

			if(! SPG_MATT_CD_T.equals("")) {
%>
		 		SPG_MATT_CD='<%= SPG_MATT_CD_T%>'
<%
			}

			if(! SPG_REMARK_T.equals("")) {
%>
		 		SPG_REMARK='<%= SPG_REMARK_T%>'
<%
			}

			if(! SPG_POSM1_TX_T.equals("")) {
%>
		 		SPG_POSM1_TX='<%= SPG_POSM1_TX_T%>'
<%
			}

			if(! SPG_POSM1_DT_T.equals("")) {
%>
		 		SPG_POSM1_DT='<%= SPG_POSM1_DT_T%>'
<%
			}

			if(! SPG_POSM2_TX_T.equals("")) {
%>
		 		SPG_POSM2_TX='<%= SPG_POSM2_TX_T%>'
<%
			}

			if(! SPG_POSM2_DT_T.equals("")) {
%>
		 		SPG_POSM2_DT='<%= SPG_POSM2_DT_T%>'
<%
			}

			if(! SPG_POSM3_TX_T.equals("")) {
%>
		 		SPG_POSM3_TX='<%= SPG_POSM3_TX_T%>'
<%
			}

			if(! SPG_POSM3_DT_T.equals("")) {
%>
		 		SPG_POSM3_DT='<%= SPG_POSM3_DT_T%>'
<%
			}

			if(! SPG_POSM1_CD_T.equals("")) {
%>
		 		SPG_POSM1_CD='<%= SPG_POSM1_CD_T%>'
<%
			}

			if(! SPG_POSM2_CD_T.equals("")) {
%>
		 		SPG_POSM2_CD='<%= SPG_POSM2_CD_T%>'
<%
			}

			if(! SPG_POSM3_CD_T.equals("")) {
%>
		 		SPG_POSM3_CD='<%= SPG_POSM3_CD_T%>'
<%
			}

			if(! SPG_SOKY_NM_T.equals("")) {
%>
		 		SPG_SOKY_NM='<%= SPG_SOKY_NM_T%>'
<%
			}

			if(! SPG_JILH_CD_T.equals("")) {
%>
		 		SPG_JILH_CD='<%= SPG_JILH_CD_T%>'
<%
			}

			if(! c55_T.equals("")) {
%>
		 		c55='<%= c55_T%>'
<%
			}

			if(! SPG_SOKY_TX_T.equals("")) {
%>
		 		SPG_SOKY_TX='<%= SPG_SOKY_TX_T%>'
<%
			}

			if(! c57_T.equals("")) {
%>
		 		c57='<%= c57_T%>'
<%
			}

			if(! c58_T.equals("")) {
%>
		 		c58='<%= c58_T%>'
<%
			}

			if(! c59_T.equals("")) {
%>
		 		c59='<%= c59_T%>'
<%
			}

			if(! SBE_ETC_TX_T.equals("")) {
%>
		 		SBE_ETC_TX='<%= SBE_ETC_TX_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c62='<%= cnt%>'
				c63='<%= cnt%>'
				c64='<%= cnt%>'
				c65='<%= cnt%>'
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
