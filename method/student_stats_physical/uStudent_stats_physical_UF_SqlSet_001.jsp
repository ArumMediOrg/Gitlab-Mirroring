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

		String DTEDTEXAM_SDT = htMethod.get("DTEDTEXAM_SDT");
		String DTEDTEXAM_EDT = htMethod.get("DTEDTEXAM_EDT");
		String RG_SCHGBNVISIBLE = htMethod.get("RG_SCHGBNVISIBLE");
		String RG_SCHGBN = htMethod.get("RG_SCHGBN");
		String MSKEDTCOMP_CD1 = htMethod.get("MSKEDTCOMP_CD1");
		String CHKBOXMAIN = htMethod.get("CHKBOXMAIN");
		String MSKEDTCOMP_CD2 = htMethod.get("MSKEDTCOMP_CD2");
		String EDTPSNL_NM = htMethod.get("EDTPSNL_NM");
		String CMBGUBN = htMethod.get("CMBGUBN");
		String CMBBOXPLCE_CD = htMethod.get("CMBBOXPLCE_CD");
		String EDTDIVI_CS = htMethod.get("EDTDIVI_CS");
		String EDTCLSS_KD = htMethod.get("EDTCLSS_KD");
		String EDTDIVI_NO = htMethod.get("EDTDIVI_NO");

		//
		if(DTEDTEXAM_SDT == null) { DTEDTEXAM_SDT = ""; }
		if(DTEDTEXAM_EDT == null) { DTEDTEXAM_EDT = ""; }
		if(RG_SCHGBNVISIBLE == null) { RG_SCHGBNVISIBLE = ""; }
		if(RG_SCHGBN == null) { RG_SCHGBN = ""; }
		if(MSKEDTCOMP_CD1 == null) { MSKEDTCOMP_CD1 = ""; }
		if(CHKBOXMAIN == null) { CHKBOXMAIN = ""; }
		if(MSKEDTCOMP_CD2 == null) { MSKEDTCOMP_CD2 = ""; }
		if(EDTPSNL_NM == null) { EDTPSNL_NM = ""; }
		if(CMBGUBN == null) { CMBGUBN = ""; }
		if(CMBBOXPLCE_CD == null) { CMBBOXPLCE_CD = ""; }
		if(EDTDIVI_CS == null) { EDTDIVI_CS = ""; }
		if(EDTCLSS_KD == null) { EDTCLSS_KD = ""; }
		if(EDTDIVI_NO == null) { EDTDIVI_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_MNGT_SPYM, A.EEA_CUST_NO, A.EEA_PSNL_NM, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, A.EEA_ORAL_YN, A.EEA_DIVI_CD,
       CASE WHEN B.ICR_SEX_KD  IS NULL OR B.ICR_SEX_KD  = '' THEN B.ICR_SEX_KD  else GetCOMMON_LvCdToNm('0411',B.ICR_SEX_KD ,'5',1) END ICR_SEX_NM,
              A.EEA_PSNL_AGE, A.EEA_COMP_CD, C.ICY_COMP_NM, A.EEA_DEPT_NM, A.EEA_DIVI_CS, A.EEA_CLSS_KD, A.EEA_DIVI_NO,
              A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_SEX_CD, C.ICY_COKD_CD,
       CASE WHEN A.EEA_EXAM_CD IS NULL OR A.EEA_EXAM_CD = '' THEN A.EEA_EXAM_CD else '[' || A.EEA_EXAM_CD || ']' || GetCOMMON_LvCdToNm('0401',A.EEA_EXAM_CD,'5',5) END ICR_EXAM_NM,
       A.EEA_EXAM_CD, A.EEA_HDMD_YN, A.EEA_SDMD_YN, A.EEA_SPCL_LT, A.EEA_SPCL_CD, A.EEA_SPHT_CD, B.ICR_SEX_KD, C.ICY_SMPL_YN,
       (C.ICY_ZIP_AR || C.ICY_ROAD_AR) AS ICR_ADDR_NM, C.ICY_ZIP_CD, D.ESP_EXAM_VIEW, D.ESP_ORAL_VIEW, D.ESP_EIFRM_DT, D.ESP_OIFRM_DT
FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B ON A.EEA_CUST_NO = B.ICR_CUST_NO
     LEFT OUTER JOIN IT_COMPANY C ON A.EEA_COMP_CD = C.ICY_COMP_CD
     LEFT OUTER JOIN ET_STDT_PNJN D ON A.EEA_EXAM_DT = D.ESP_EXAM_DT  AND A.EEA_EXAM_SQ = D.ESP_EXAM_SQ

WHERE 0=0
      AND A.EEA_EXAM_DT >= :DTEdtEXAM_SDT
      AND A.EEA_EXAM_DT <= :DTEdtEXAM_EDT
      AND A.EEA_EXAM_CD = '31001'
      AND A.EEA_ORDER_YN <> 'C'
      
if (:rg_schgbnVisible = '1') then
      AND A.EEA_DIVI_CD = :rg_schgbn

if :MskEdtCOMP_CD1 <> '' then
begin
   if ChkBoxMain = '1' then 
      AND A.EEA_COMP_CD IN :MskEdtCOMP_CD2      
   else
      AND A.EEA_COMP_CD = :MskEdtCOMP_CD2
end;

if :EdtPSNL_NM <> '' then
      AND A.EEA_PSNL_NM like '%' || :EdtPSNL_NM || '%'

if :CmbGUBN = '0' then
begin
      AND ((D.ESP_PNJN_TT <> ' ' or D.ESP_PNJN_TT is Not NULL)
       OR (D.ESP_PNJN_05 <> ' ' or D.ESP_PNJN_05 is Not NULL))  
end else if :CmbGUBN = '1' then 
begin
      AND A.EEA_ORAL_YN in ('1','2')
      AND (D.ESP_PNJN_TT <> ' ' or D.ESP_PNJN_TT is Not NULL)
end else if :CmbGUBN = '2' then 
begin
      AND A.EEA_ORAL_YN in ('1','3')
      AND (D.ESP_PNJN_05 <> ' ' or D.ESP_PNJN_05 is Not NULL)
end;

if :CmbBoxPLCE_CD <> '0' then
      AND SUBSTR(A.EEA_PLCE_CD,1,1) = :CmbBoxPLCE_CD

If :EdtDIVI_CS <> '' Then
      AND A.EEA_DIVI_CS = :EdtDIVI_CS

If :EdtCLSS_KD <> '' Then
      AND A.EEA_CLSS_KD = :EdtCLSS_KD

If :EdtDIVI_NO <> '' Then
      AND A.EEA_DIVI_NO = :EdtDIVI_NO
		*/

		sql = " SELECT A.EEA_MNGT_SPYM, A.EEA_CUST_NO, A.EEA_PSNL_NM, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, A.EEA_ORAL_YN, A.EEA_DIVI_CD";
		sql += ", CASE WHEN B.ICR_SEX_KD IS NULL OR B.ICR_SEX_KD = '' THEN B.ICR_SEX_KD ELSE GETCOMMON_LVCDTONM('0411',B.ICR_SEX_KD ,'5',1) END ICR_SEX_NM";
		sql += ", A.EEA_PSNL_AGE, A.EEA_COMP_CD, C.ICY_COMP_NM, A.EEA_DEPT_NM, A.EEA_DIVI_CS, A.EEA_CLSS_KD, A.EEA_DIVI_NO, A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_SEX_CD, C.ICY_COKD_CD";
		sql += ", CASE WHEN A.EEA_EXAM_CD IS NULL OR A.EEA_EXAM_CD = '' THEN A.EEA_EXAM_CD ELSE '[' || A.EEA_EXAM_CD || ']' || GETCOMMON_LVCDTONM('0401',A.EEA_EXAM_CD,'5',5) END ICR_EXAM_NM";
		sql += ", A.EEA_EXAM_CD, A.EEA_HDMD_YN, A.EEA_SDMD_YN, A.EEA_SPCL_LT, A.EEA_SPCL_CD, A.EEA_SPHT_CD, B.ICR_SEX_KD, C.ICY_SMPL_YN, (C.ICY_ZIP_AR || C.ICY_ROAD_AR) AS ICR_ADDR_NM, C.ICY_ZIP_CD, D.ESP_EXAM_VIEW, D.ESP_ORAL_VIEW, D.ESP_EIFRM_DT, D.ESP_OIFRM_DT";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN ET_STDT_PNJN D";
		sql += " ON A.EEA_EXAM_DT = D.ESP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.ESP_EXAM_SQ";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_EXAM_DT >= '" + DTEDTEXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEXAM_EDT + "'";
		sql += " AND A.EEA_EXAM_CD = '31001'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(RG_SCHGBNVISIBLE.equals("1")) {
			sql += " AND A.EEA_DIVI_CD = '" + RG_SCHGBN + "'";
		}
		if(! MSKEDTCOMP_CD1.equals("")) {
			if(CHKBOXMAIN.equals("1")) {
				sql += " AND A.EEA_COMP_CD IN '" + MSKEDTCOMP_CD2 + "'";
			} else {
				sql += " AND A.EEA_COMP_CD = '" + MSKEDTCOMP_CD2 + "'";
			}
		}
		if(! EDTPSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%" + EDTPSNL_NM + "%'";
		}
		if(CMBGUBN.equals("0")) {
			sql += " AND (";
			sql += "	(D.ESP_PNJN_TT <> ' ' OR D.ESP_PNJN_TT IS NOT NULL)";
			sql += " 	OR (D.ESP_PNJN_05 <> ' ' OR D.ESP_PNJN_05 IS NOT NULL)";
			sql += " )";
		} else if(CMBGUBN.equals("1")) {
			sql += " AND A.EEA_ORAL_YN IN ('1','2')";
			sql += " AND (";
			sql += "	D.ESP_PNJN_TT <> ' '";
			sql += " 	OR D.ESP_PNJN_TT IS NOT NULL";
			sql += " )";
		} else if(CMBGUBN.equals("2")) {
			sql += " AND A.EEA_ORAL_YN IN ('1','3')";
			sql += " AND (";
			sql += "	D.ESP_PNJN_05 <> ' '";
			sql += " 	OR D.ESP_PNJN_05 IS NOT NULL";
			sql += " )";
		}
		if(! CMBBOXPLCE_CD.equals("0")) {
			sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD + "'";
		}
		if(! EDTDIVI_CS.equals("")) {
			sql += " AND A.EEA_DIVI_CS = '" + EDTDIVI_CS + "'";
		}
		if(! EDTCLSS_KD.equals("")) {
			sql += " AND A.EEA_CLSS_KD = '" + EDTCLSS_KD + "'";
		}
		if(! EDTDIVI_NO.equals("")) {
			sql += " AND A.EEA_DIVI_NO = '" + EDTDIVI_NO + "'";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStudent_stats_physical_UF_SqlSet_001 \n";
			G_INFO += "설명 : 통계정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEDTEXAM_SDT : " + DTEDTEXAM_SDT + " \n";
			G_INFO += " DTEDTEXAM_EDT : " + DTEDTEXAM_EDT + " \n";
			G_INFO += " RG_SCHGBNVISIBLE : " + RG_SCHGBNVISIBLE + " \n";
			G_INFO += " RG_SCHGBN : " + RG_SCHGBN + " \n";
			G_INFO += " MSKEDTCOMP_CD1 : " + MSKEDTCOMP_CD1 + " \n";
			G_INFO += " CHKBOXMAIN : " + CHKBOXMAIN + " \n";
			G_INFO += " MSKEDTCOMP_CD2 : " + MSKEDTCOMP_CD2 + " \n";
			G_INFO += " EDTPSNL_NM : " + EDTPSNL_NM + " \n";
			G_INFO += " CMBGUBN : " + CMBGUBN + " \n";
			G_INFO += " CMBBOXPLCE_CD : " + CMBBOXPLCE_CD + " \n";
			G_INFO += " EDTDIVI_CS : " + EDTDIVI_CS + " \n";
			G_INFO += " EDTCLSS_KD : " + EDTCLSS_KD + " \n";
			G_INFO += " EDTDIVI_NO : " + EDTDIVI_NO + " \n";
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
		<s:AttributeType name='EEA_MNGT_SPYM' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_SPYM'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BIRTH_DT' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_YN' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='15' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='16' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COKD_CD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COKD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_EXAM_NM' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='21'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HDMD_YN' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SDMD_YN' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPHT_CD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPHT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_KD' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_SEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_SMPL_YN' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_SMPL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ADDR_NM' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_ZIP_CD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EXAM_VIEW' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_EXAM_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_ORAL_VIEW' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_ORAL_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EIFRM_DT' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_EIFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_OIFRM_DT' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_OIFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='35' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c35' rs:name='ROWID' rs:number='36' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c36' rs:name='ROWID' rs:number='37' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c37' rs:name='ROWID' rs:number='38' rs:rowid='true' rs:basetable='ET_STDT_PNJN' rs:basecolumn='ROWID'
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

			String EEA_MNGT_SPYM_T = cRsList.getString("EEA_MNGT_SPYM");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_BIRTH_DT_T = cRsList.getString("EEA_BIRTH_DT");
			String EEA_ORAL_YN_T = cRsList.getString("EEA_ORAL_YN");
			String EEA_DIVI_CD_T = cRsList.getString("EEA_DIVI_CD");
			String ICR_SEX_NM_T = cRsList.getString("ICR_SEX_NM");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_DIVI_CS_T = cRsList.getString("EEA_DIVI_CS");
			String EEA_CLSS_KD_T = cRsList.getString("EEA_CLSS_KD");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String ICY_COKD_CD_T = cRsList.getString("ICY_COKD_CD");
			String ICR_EXAM_NM_T = cRsList.getString("ICR_EXAM_NM");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_HDMD_YN_T = cRsList.getString("EEA_HDMD_YN");
			String EEA_SDMD_YN_T = cRsList.getString("EEA_SDMD_YN");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_SPHT_CD_T = cRsList.getString("EEA_SPHT_CD");
			String ICR_SEX_KD_T = cRsList.getString("ICR_SEX_KD");
			String ICY_SMPL_YN_T = cRsList.getString("ICY_SMPL_YN");
			String ICR_ADDR_NM_T = cRsList.getString("ICR_ADDR_NM");
			String ICY_ZIP_CD_T = cRsList.getString("ICY_ZIP_CD");
			String ESP_EXAM_VIEW_T = cRsList.getString("ESP_EXAM_VIEW");
			String ESP_ORAL_VIEW_T = cRsList.getString("ESP_ORAL_VIEW");
			String ESP_EIFRM_DT_T = cRsList.getString("ESP_EIFRM_DT");
			String ESP_OIFRM_DT_T = cRsList.getString("ESP_OIFRM_DT");
			String ROWID_T = cRsList.getString("ROWID");
			String c35_T = cRsList.getString("c35");
			String c36_T = cRsList.getString("c36");
			String c37_T = cRsList.getString("c37");
%>
			<z:row
<%
			if(! EEA_MNGT_SPYM_T.equals("")) {
%>
		 		EEA_MNGT_SPYM='<%= EEA_MNGT_SPYM_T%>'
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

			if(! EEA_ORAL_YN_T.equals("")) {
%>
		 		EEA_ORAL_YN='<%= EEA_ORAL_YN_T%>'
<%
			}

			if(! EEA_DIVI_CD_T.equals("")) {
%>
		 		EEA_DIVI_CD='<%= EEA_DIVI_CD_T%>'
<%
			}

			if(! ICR_SEX_NM_T.equals("")) {
%>
		 		ICR_SEX_NM='<%= ICR_SEX_NM_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
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

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}

			if(! ICY_COKD_CD_T.equals("")) {
%>
		 		ICY_COKD_CD='<%= ICY_COKD_CD_T%>'
<%
			}

			if(! ICR_EXAM_NM_T.equals("")) {
%>
		 		ICR_EXAM_NM='<%= ICR_EXAM_NM_T%>'
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

			if(! ICR_SEX_KD_T.equals("")) {
%>
		 		ICR_SEX_KD='<%= ICR_SEX_KD_T%>'
<%
			}

			if(! ICY_SMPL_YN_T.equals("")) {
%>
		 		ICY_SMPL_YN='<%= ICY_SMPL_YN_T%>'
<%
			}

			if(! ICR_ADDR_NM_T.equals("")) {
%>
		 		ICR_ADDR_NM='<%= ICR_ADDR_NM_T%>'
<%
			}

			if(! ICY_ZIP_CD_T.equals("")) {
%>
		 		ICY_ZIP_CD='<%= ICY_ZIP_CD_T%>'
<%
			}

			if(! ESP_EXAM_VIEW_T.equals("")) {
%>
		 		ESP_EXAM_VIEW='<%= ESP_EXAM_VIEW_T%>'
<%
			}

			if(! ESP_ORAL_VIEW_T.equals("")) {
%>
		 		ESP_ORAL_VIEW='<%= ESP_ORAL_VIEW_T%>'
<%
			}

			if(! ESP_EIFRM_DT_T.equals("")) {
%>
		 		ESP_EIFRM_DT='<%= ESP_EIFRM_DT_T%>'
<%
			}

			if(! ESP_OIFRM_DT_T.equals("")) {
%>
		 		ESP_OIFRM_DT='<%= ESP_OIFRM_DT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c35='<%= cnt%>'
				c36='<%= cnt%>'
				c37='<%= cnt%>'
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
