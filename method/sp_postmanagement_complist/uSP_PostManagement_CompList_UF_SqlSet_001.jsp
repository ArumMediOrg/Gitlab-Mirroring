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
  SELECT DISTINCT, B.ICR_PID_EN  ICR_PENL_DE, 
ELSE IF (:ENCRT_KD = '2') THEN 
  SELECT DISTINCT ECHELONDB.ECL_DECRYPT(B.ICR_PID_EN) ICR_PENL_DE, 
ELSE 
  SELECT DISTINCT B.ICR_PENL_ID ICR_PENL_DE,
  
       A.EEA_EXAM_DT, A.EEA_EXAM_SQ, EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_EXAM_CD, A.EEA_SPCL_CD, A.EEA_CUST_NO, B.ICR_PENL_ID, A.EEA_MNGT_SPYM, A.EEA_SEX_CD, 
       CASE WHEN A.EEA_SEX_CD  IS NULL OR A.EEA_SEX_CD  = '' THEN A.EEA_SEX_CD  ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) END EEA_SEX_NM, 
       CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END EEA_SPCL_NM, 
       CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END EEA_TKGM_CHA, E.SPG_PANJ_CD, E.SPG_MATT_CD, E.SPG_SWING_CD, 
       CASE WHEN E.SPG_PANJ_CD IS NULL OR E.SPG_PANJ_CD = '' THEN E.SPG_PANJ_CD ELSE GETSP_COMMON_CDTONM('HM05E',E.SPG_PANJ_CD) END SPG_PANJ_NM, 
       CASE WHEN E.SPG_ORGA_CD IS NULL OR E.SPG_ORGA_CD = '' THEN E.SPG_ORGA_CD ELSE GETSP_COMMON_CDTONM('HM05D',E.SPG_ORGA_CD) END SPG_ORGA_NM, 
       A.EEA_COMP_CD, C.ICY_COMP_NM, A.EEA_DEPT_NM, A.EEA_TEL_NO, A.EEA_MOBL_NO, A.EEA_PLCE_CD, E.SPG_PANJ_DT, E.SPG_DOCT_CD, E.SPG_ORGA_CD, 
       F_DOCTOR_FIND(1,E.SPG_DOCT_CD) SPG_DOCT_NM, F.CSM_MATT_NM, E.SPG_SOKY_NM, A.EEA_DIVI_NO, GETSP_COMMON_CDTONM('HM05B',E.SPG_BUSI_CD) SPG_BUSI_NM,
       CASE WHEN G.SAE_ADVI_DT IS NULL THEN 'N' ELSE 'Y' END SAE_ADVI_YN, A.EEA_PSNL_AGE, A.EEA_2ND_YN 
  FROM ET_EXAM_ACPT A 
            INNER JOIN IT_CUSTOMER  B ON A.EEA_CUST_NO = B.ICR_CUST_NO 
       LEFT OUTER JOIN IT_COMPANY   C ON A.EEA_COMP_CD = C.ICY_COMP_CD 
       LEFT OUTER JOIN ST_BASE      D ON A.EEA_EXAM_DT = D.SBE_EXAM_DT AND A.EEA_EXAM_SQ = D.SBE_EXAM_SQ AND D.SBE_PANJ_YN = 'Y' 
       LEFT OUTER JOIN ST_PANJUNG   E ON A.EEA_EXAM_DT = E.SPG_EXAM_DT AND A.EEA_EXAM_SQ = E.SPG_EXAM_SQ 
       LEFT OUTER JOIN CT_SP_MATTER F ON E.SPG_MATT_CD = F.CSM_MATT_CD 
       LEFT OUTER JOIN ST_ADVICE    G ON A.EEA_EXAM_DT = G.SAE_EXAM_DT AND A.EEA_EXAM_SQ = G.SAE_EXAM_SQ 
 WHERE A.EEA_EXAM_DT >= :EXAM_SDT 
   AND A.EEA_EXAM_DT <= :EXAM_EDT 
   AND SUBSTR(A.EEA_MNGT_SPYM, 1, 4) = :MNGT_YM 
   AND A.EEA_ORDER_YN <> 'C'

:PARAM_TX1
:PARAM_TX2

:ORDER_BY
		*/

		if(ENCRT_KD.equals("1")) {
			sql = " SELECT DISTINCT, B.ICR_PID_EN ICR_PENL_DE,";
		}		
		else if(ENCRT_KD.equals("2")) {
			sql = " SELECT DISTINCT ECHELONDB.ECL_DECRYPT(B.ICR_PID_EN) ICR_PENL_DE,";
		}		
		else {
			sql = " SELECT DISTINCT B.ICR_PENL_ID ICR_PENL_DE,";
		}

		sql += " A.EEA_EXAM_DT, A.EEA_EXAM_SQ, EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_EXAM_CD, A.EEA_SPCL_CD, A.EEA_CUST_NO, B.ICR_PENL_ID, A.EEA_MNGT_SPYM, A.EEA_SEX_CD";
		sql += ", CASE WHEN A.EEA_SEX_CD IS NULL OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) END EEA_SEX_NM";
		sql += ", CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END EEA_SPCL_NM";
		sql += ", CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END EEA_TKGM_CHA, E.SPG_PANJ_CD, E.SPG_MATT_CD, E.SPG_SWING_CD";
		sql += ", CASE WHEN E.SPG_PANJ_CD IS NULL OR E.SPG_PANJ_CD = '' THEN E.SPG_PANJ_CD ELSE GETSP_COMMON_CDTONM('HM05E',E.SPG_PANJ_CD) END SPG_PANJ_NM";
		sql += ", CASE WHEN E.SPG_ORGA_CD IS NULL OR E.SPG_ORGA_CD = '' THEN E.SPG_ORGA_CD ELSE GETSP_COMMON_CDTONM('HM05D',E.SPG_ORGA_CD) END SPG_ORGA_NM";
		sql += ", A.EEA_COMP_CD, C.ICY_COMP_NM, A.EEA_DEPT_NM, A.EEA_TEL_NO, A.EEA_MOBL_NO, A.EEA_PLCE_CD, E.SPG_PANJ_DT, E.SPG_DOCT_CD, E.SPG_ORGA_CD, F_DOCTOR_FIND(1,E.SPG_DOCT_CD) SPG_DOCT_NM, F.CSM_MATT_NM, E.SPG_SOKY_NM, A.EEA_DIVI_NO, GETSP_COMMON_CDTONM('HM05B',E.SPG_BUSI_CD) SPG_BUSI_NM, CASE WHEN G.SAE_ADVI_DT IS NULL THEN 'N' ELSE 'Y' END SAE_ADVI_YN, A.EEA_PSNL_AGE, A.EEA_2ND_YN";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN ST_BASE D";
		sql += " ON A.EEA_EXAM_DT = D.SBE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.SBE_EXAM_SQ";
		sql += " AND D.SBE_PANJ_YN = 'Y' LEFT OUTER JOIN ST_PANJUNG E";
		sql += " ON A.EEA_EXAM_DT = E.SPG_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = E.SPG_EXAM_SQ LEFT OUTER JOIN CT_SP_MATTER F";
		sql += " ON E.SPG_MATT_CD = F.CSM_MATT_CD LEFT OUTER JOIN ST_ADVICE G";
		sql += " ON A.EEA_EXAM_DT = G.SAE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = G.SAE_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += " AND SUBSTR(A.EEA_MNGT_SPYM, 1, 4) = '" + MNGT_YM + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += PARAM_TX1;
		sql += PARAM_TX2;
		sql += ORDER_BY;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_PostManagement_CompList_UF_SqlSet_001 \n";
			G_INFO += "설명 : 상담 대상자 조회 \n";
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
		<s:AttributeType name='ICR_PENL_DE' rs:number='1' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='2' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='3' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='4' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='5' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='6' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='7' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='8' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='9' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_SPYM' rs:number='10' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_MNGT_SPYM'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='11' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_NM' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_NM' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TKGM_CHA' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_CD' rs:number='15' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_PANJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_MATT_CD' rs:number='16' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SWING_CD' rs:number='17' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_SWING_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_NM' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ORGA_NM' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='20' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='21' rs:nullable='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='22' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEL_NO' rs:number='23' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='24' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='25' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_DT' rs:number='26' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_PANJ_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_DOCT_CD' rs:number='27' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ORGA_CD' rs:number='28' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_ORGA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_DOCT_NM' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_MATT_NM' rs:number='30' rs:nullable='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='CSM_MATT_NM'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SOKY_NM' rs:number='31' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_SOKY_NM'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='32' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_BUSI_NM' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_ADVI_YN' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='35' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_2ND_YN' rs:number='36' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_2ND_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
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
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String EEA_MNGT_SPYM_T = cRsList.getString("EEA_MNGT_SPYM");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_SEX_NM_T = cRsList.getString("EEA_SEX_NM");
			String EEA_SPCL_NM_T = cRsList.getString("EEA_SPCL_NM");
			String EEA_TKGM_CHA_T = cRsList.getString("EEA_TKGM_CHA");
			String SPG_PANJ_CD_T = cRsList.getString("SPG_PANJ_CD");
			String SPG_MATT_CD_T = cRsList.getString("SPG_MATT_CD");
			String SPG_SWING_CD_T = cRsList.getString("SPG_SWING_CD");
			String SPG_PANJ_NM_T = cRsList.getString("SPG_PANJ_NM");
			String SPG_ORGA_NM_T = cRsList.getString("SPG_ORGA_NM");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_TEL_NO_T = cRsList.getString("EEA_TEL_NO");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String SPG_PANJ_DT_T = cRsList.getString("SPG_PANJ_DT");
			String SPG_DOCT_CD_T = cRsList.getString("SPG_DOCT_CD");
			String SPG_ORGA_CD_T = cRsList.getString("SPG_ORGA_CD");
			String SPG_DOCT_NM_T = cRsList.getString("SPG_DOCT_NM");
			String CSM_MATT_NM_T = cRsList.getString("CSM_MATT_NM");
			String SPG_SOKY_NM_T = cRsList.getString("SPG_SOKY_NM");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String SPG_BUSI_NM_T = cRsList.getString("SPG_BUSI_NM");
			String SAE_ADVI_YN_T = cRsList.getString("SAE_ADVI_YN");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_2ND_YN_T = cRsList.getString("EEA_2ND_YN");
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

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! EEA_SPCL_CD_T.equals("")) {
%>
		 		EEA_SPCL_CD='<%= EEA_SPCL_CD_T%>'
<%
			}

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! EEA_MNGT_SPYM_T.equals("")) {
%>
		 		EEA_MNGT_SPYM='<%= EEA_MNGT_SPYM_T%>'
<%
			}

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}

			if(! EEA_SEX_NM_T.equals("")) {
%>
		 		EEA_SEX_NM='<%= EEA_SEX_NM_T%>'
<%
			}

			if(! EEA_SPCL_NM_T.equals("")) {
%>
		 		EEA_SPCL_NM='<%= EEA_SPCL_NM_T%>'
<%
			}

			if(! EEA_TKGM_CHA_T.equals("")) {
%>
		 		EEA_TKGM_CHA='<%= EEA_TKGM_CHA_T%>'
<%
			}

			if(! SPG_PANJ_CD_T.equals("")) {
%>
		 		SPG_PANJ_CD='<%= SPG_PANJ_CD_T%>'
<%
			}

			if(! SPG_MATT_CD_T.equals("")) {
%>
		 		SPG_MATT_CD='<%= SPG_MATT_CD_T%>'
<%
			}

			if(! SPG_SWING_CD_T.equals("")) {
%>
		 		SPG_SWING_CD='<%= SPG_SWING_CD_T%>'
<%
			}

			if(! SPG_PANJ_NM_T.equals("")) {
%>
		 		SPG_PANJ_NM='<%= SPG_PANJ_NM_T%>'
<%
			}

			if(! SPG_ORGA_NM_T.equals("")) {
%>
		 		SPG_ORGA_NM='<%= SPG_ORGA_NM_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
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

			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
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

			if(! SPG_ORGA_CD_T.equals("")) {
%>
		 		SPG_ORGA_CD='<%= SPG_ORGA_CD_T%>'
<%
			}

			if(! SPG_DOCT_NM_T.equals("")) {
%>
		 		SPG_DOCT_NM='<%= SPG_DOCT_NM_T%>'
<%
			}

			if(! CSM_MATT_NM_T.equals("")) {
%>
		 		CSM_MATT_NM='<%= CSM_MATT_NM_T%>'
<%
			}

			if(! SPG_SOKY_NM_T.equals("")) {
%>
		 		SPG_SOKY_NM='<%= SPG_SOKY_NM_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! SPG_BUSI_NM_T.equals("")) {
%>
		 		SPG_BUSI_NM='<%= SPG_BUSI_NM_T%>'
<%
			}

			if(! SAE_ADVI_YN_T.equals("")) {
%>
		 		SAE_ADVI_YN='<%= SAE_ADVI_YN_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! EEA_2ND_YN_T.equals("")) {
%>
		 		EEA_2ND_YN='<%= EEA_2ND_YN_T%>'
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
