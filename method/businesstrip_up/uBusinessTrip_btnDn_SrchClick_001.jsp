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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String CBPLCE_CD1 = htMethod.get("CBPLCE_CD1");
		String CBPLCE_CD2 = htMethod.get("CBPLCE_CD2");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(CBPLCE_CD1 == null) { CBPLCE_CD1 = ""; }
		if(CBPLCE_CD2 == null) { CBPLCE_CD2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select f_pid(b.icr_penl_id) eea_psnl_id,
       a.eea_exam_dt, a.eea_exam_sq, a.eea_exam_cd, a.eea_spcl_lt,
       case when a.eea_rsvn_no = ' ' then ' ' else SUBSTR(a.eea_rsvn_no, 1, 8)||'-'||SUBSTR(a.eea_rsvn_no, 9, 6) end as eea_rsvn_no,
       a.eea_psnl_nm, b.icr_birh_dt, a.eea_cust_no, a.eea_order_yn, ltrim(rtrim(a.eea_chart_no)) eea_chart_no, a.eea_send_dt,
       case when a.eea_exam_cd = '31001' then a.eea_compr_pr + a.eea_psnlr_pr else a.eea_compr_pr end as eea_compr_pr,
       case when a.eea_exam_cd = '31001' then 0 else a.eea_psnlr_pr end as eea_psnlr_pr,
       a.eea_hlthr_pr, a.eea_spclr_pr,
       f_tel_format(a.eea_mobl_no) eea_mobl_no, f_tel_format(a.eea_tel_no) eea_tel_no, a.eea_psnl_age, a.eea_mngt_yr, a.eea_mngt_htyr, a.eea_mngt_spym,
       case when (a.eea_sex_cd) = '1' then '남' else '여' end as eea_sex_nm,
       case when SUBSTR(a.eea_exam_lt, 1, 3) IN ('E00', 'P00') then f_pack_find(a.eea_exam_lt, '')
            when SUBSTR(a.eea_exam_lt, 1, 3) = 'C03' then f_pack_find(a.eea_exam_lt, a.eea_comp_cd)
            else case when a.eea_rece_no = 'R' then f_code_find('0401', SUBSTR(a.eea_exam_cd, 1, 2)||'000', '', '1')||'-자료이관'
                      else f_code_find('0401', a.eea_exam_cd, '', '1') end end ||
       case when a.eea_exam_cd = '31001' then case when a.eea_divi_cd = '1' then '-초-' || a.eea_divi_cs
                                                     when a.eea_divi_cd = '2' then '-중'
                                                     when a.eea_divi_cd = '3' then '-고' end else '' end as eea_exam_nm,
                           case when SUBSTR(a.eea_exam_cd, 1, 1) = '4' or a.eea_spsb_yn = 'Y' then f_code_find('0910', a.eea_spcl_cd, '', '1') else '' end eea_bach_nm,
       case when a.eea_mmbr_cd = '00' then '' else F_CODE_FIND('0711', a.eea_mmbr_cd, '', '1') end as eea_mmbr_nm,
       F_COMP_FIND(a.eea_comp_cd) eea_comp_nm, a.eea_sales_id,
                   case when ltrim(a.eea_dept_nm) <> '' then ltrim(a.eea_dept_nm) else '' end as eea_dept_nm, eea_divi_no eea_divi_no2,
       case when ltrim(rtrim(a.eea_divi_no)) <> '' then '('|| ltrim(rtrim(a.eea_divi_no)) || ')' else '' end as eea_divi_no,
       case when upper(a.eea_htsb_yn) = 'Y' then
            case when SUBSTR(a.eea_htsb_cd, 1, 2) = '11' then case when SUBSTR(a.eea_htsb_cd, 5, 1) = '1' then '일검'
                                                                        when SUBSTR(a.eea_htsb_cd, 5, 1) = '3' then '일검'
                                                                        else '일검2' end
                 when SUBSTR(a.eea_htsb_cd, 1, 2) = '12' then case when SUBSTR(a.eea_htsb_cd, 5, 1) = '1' then '생애'
                                                                        when SUBSTR(a.eea_htsb_cd, 5, 1) = '3' then '생애'
                                                                        else '생애2' end
                 when SUBSTR(a.eea_htsb_cd, 1, 2) = '13' then '암'
                 when SUBSTR(a.eea_htsb_cd, 1, 2) = '14' then '구강' end else '' end as eea_htsb_ox,
       a.eea_stoma_cd||a.eea_colon_cd||a.eea_liver_cd||a.eea_bast_cd||a.eea_uter_cd||NVL(a.eea_lung_cd, '0') eea_can_cd,
       case when NVL(a.eea_stoma_cd, ' ') = ' ' or NVL(a.eea_stoma_cd, '0') = '0' then ''
            else '위' end eea_stoma_ct,
       case when NVL(a.eea_colon_cd, ' ') = ' ' or NVL(a.eea_colon_cd, '0') = '0' then ''
            else '대' end eea_colon_ct,
       case when NVL(a.eea_liver_cd, ' ') = ' ' or NVL(a.eea_liver_cd, '0') = '0' then ''
            else '간' end eea_liver_ct,
       case when NVL(a.eea_bast_cd,  ' ') = ' ' or NVL(a.eea_bast_cd,  '0') = '0' then ''
            else '유' end eea_bast_ct,
       case when NVL(a.eea_uter_cd,  ' ') = ' ' or NVL(a.eea_uter_cd,  '0') = '0' then ''
            else '자' end eea_uter_ct,
       case when NVL(a.eea_lung_cd,  ' ') = ' ' or NVL(a.eea_lung_cd,  '0') = '0' then ''
            else '폐' end eea_lung_ct,
       case when upper(a.eea_oral_yn) = 'Y' and upper(a.eea_hdmd_yn) = 'Y' then '구강' when a.eea_oral_yn  = '1' then '구강'
            when       a.eea_oral_yn  = '3' then '구강' else '' end as eea_oral_ox,
       case when upper(a.eea_spsb_yn) = 'Y' then '특검' else '' end as eea_spsb_ox,
       case when upper(a.eea_cvsb_yn) = 'Y' then '뇌심' else '' end as eea_cvsb_ox,
       case when upper(a.eea_emsb_yn) = 'Y' then '채용' else '' end as eea_emsb_ox,
       case when upper(a.eea_etsb_yn) = 'Y' then '기타' else '' end as eea_etsb_ox,
       case when SUBSTR(a.eea_htsb_cd, 1, 1) = '1' and SUBSTR(a.eea_hlth_kd, 1, 1) = '1' then '대상' else '' end eea_chol_ox,
       case when SUBSTR(a.eea_spsb_cd, 1, 1) = '4' and upper(a.eea_2nd_yn) = 'Y' then '실시' else '' end eea_2nd_ox,
       case when a.eea_rslt_cd = '0' then '대기'
            else case when a.eea_rslt_cd = '1' then '입력중'
            else '완료' end end as eea_rslt_nm,
       case when eea_rece_kd = '0' then '미납'
            else case when eea_rece_kd = '1' then '일부'
            else '완료' end end as eea_rece_nm,
       case when a.eea_defer_kd = '0' then ''
            else case when a.eea_defer_kd = '1' then '보류'
            else '보류완료' end end as eea_defer_nm,
       f_tel_format(a.eea_zip_cd) eea_zip_cd, a.eea_zip_ar, a.eea_road_ar, a.eea_acpt_tx,
       case when rtrim(NVL(a.eea_rfid_no, ' ')) = ' ' then ' ' else f_lpad(rtrim(a.eea_rfid_no), 4, '0') end eea_rfid_no,
       TO_CHAR(TO_DATE( c.pfp_result_date), 'YYYY-MM-DD') || ' / ' || f_user_find(c.pfp_doctorfir) pfp_pan_dr
from et_exam_acpt a
     left outer join it_customer b
  on b.icr_cust_no = a.eea_cust_no
     left outer join pt_fir_panjung c
  on pfp_exam_dt = eea_exam_dt
 and pfp_exam_sq = eea_exam_sq
where a.eea_exam_dt = :exam_dt
  and a.eea_order_yn <> 'C'

if (:cbPlce_Cd1 = '0') then
  and a.eea_plce_cd like :cbPlce_Cd2||'%'
else
  and a.eea_plce_cd    = :cbPlce_Cd2

order by a.eea_exam_dt, a.eea_exam_sq
		*/

		sql = " SELECT F_PID(B.ICR_PENL_ID) EEA_PSNL_ID, A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_EXAM_CD, A.EEA_SPCL_LT";
		sql += ", CASE WHEN A.EEA_RSVN_NO = ' ' THEN ' ' ELSE SUBSTR(A.EEA_RSVN_NO, 1, 8)||'-'||SUBSTR(A.EEA_RSVN_NO, 9, 6) END AS EEA_RSVN_NO";
		sql += ", A.EEA_PSNL_NM, B.ICR_BIRH_DT, A.EEA_CUST_NO, A.EEA_ORDER_YN, LTRIM(RTRIM(A.EEA_CHART_NO)) EEA_CHART_NO, A.EEA_SEND_DT";
		sql += ", CASE WHEN A.EEA_EXAM_CD = '31001' THEN A.EEA_COMPR_PR + A.EEA_PSNLR_PR ELSE A.EEA_COMPR_PR END AS EEA_COMPR_PR";
		sql += ", CASE WHEN A.EEA_EXAM_CD = '31001' THEN 0 ELSE A.EEA_PSNLR_PR END AS EEA_PSNLR_PR";
		sql += ", A.EEA_HLTHR_PR, A.EEA_SPCLR_PR, F_TEL_FORMAT(A.EEA_MOBL_NO) EEA_MOBL_NO, F_TEL_FORMAT(A.EEA_TEL_NO) EEA_TEL_NO, A.EEA_PSNL_AGE, A.EEA_MNGT_YR, A.EEA_MNGT_HTYR, A.EEA_MNGT_SPYM";
		sql += ", CASE WHEN (A.EEA_SEX_CD) = '1' THEN '남' ELSE '여' END AS EEA_SEX_NM";

		sql += ", CASE WHEN SUBSTR(A.EEA_EXAM_LT, 1, 3) IN ('E00', 'P00') THEN F_PACK_FIND(A.EEA_EXAM_LT, '')";
		sql += "	WHEN SUBSTR(A.EEA_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(A.EEA_EXAM_LT, A.EEA_COMP_CD)";
		sql += "	ELSE";
		sql += "		CASE WHEN A.EEA_RECE_NO = 'R' THEN F_CODE_FIND('0401', SUBSTR(A.EEA_EXAM_CD, 1, 2)||'000', '', '1')||'-자료이관' ELSE F_CODE_FIND('0401', A.EEA_EXAM_CD, '', '1') END";
		sql += "	END";
		sql += "  || CASE WHEN A.EEA_EXAM_CD = '31001' THEN";
		sql += "	CASE WHEN A.EEA_DIVI_CD = '1' THEN '-초-' || A.EEA_DIVI_CS";
		sql += "		WHEN A.EEA_DIVI_CD = '2' THEN '-중'";
		sql += "		WHEN A.EEA_DIVI_CD = '3' THEN '-고'";
		sql += "	END ELSE '' END AS EEA_EXAM_NM";
		
		sql += ", CASE WHEN SUBSTR(A.EEA_EXAM_CD, 1, 1) = '4' OR A.EEA_SPSB_YN = 'Y' THEN F_CODE_FIND('0910', A.EEA_SPCL_CD, '', '1') ELSE '' END EEA_BACH_NM";
		sql += ", CASE WHEN A.EEA_MMBR_CD = '00' THEN '' ELSE F_CODE_FIND('0711', A.EEA_MMBR_CD, '', '1') END AS EEA_MMBR_NM";
		sql += ", F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, A.EEA_SALES_ID";
		sql += ", CASE WHEN LTRIM(A.EEA_DEPT_NM) <> '' THEN LTRIM(A.EEA_DEPT_NM) ELSE '' END AS EEA_DEPT_NM";
		sql += ", EEA_DIVI_NO EEA_DIVI_NO2";
		sql += ", CASE WHEN LTRIM(RTRIM(A.EEA_DIVI_NO)) <> '' THEN '('|| LTRIM(RTRIM(A.EEA_DIVI_NO)) || ')' ELSE '' END AS EEA_DIVI_NO";

		sql += ", CASE WHEN UPPER(A.EEA_HTSB_YN) = 'Y' THEN";
		sql += "	CASE WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '11' THEN";
		sql += "		CASE WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '1' THEN '일검'";
		sql += "		WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '3' THEN '일검'";
		sql += "		ELSE '일검2' END";
		sql += "	WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '12' THEN";
		sql += "		CASE WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '1' THEN '생애'";
		sql += "		WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '3' THEN '생애'";
		sql += "		ELSE '생애2' END";
		sql += "	WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '13' THEN '암'";
		sql += "	WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '14' THEN '구강'";
		sql += "	END";
		sql += " ELSE '' END AS EEA_HTSB_OX";
		
		sql += ", A.EEA_STOMA_CD||A.EEA_COLON_CD||A.EEA_LIVER_CD||A.EEA_BAST_CD||A.EEA_UTER_CD||NVL(A.EEA_LUNG_CD, '0') EEA_CAN_CD";

		sql += ", CASE WHEN NVL(A.EEA_STOMA_CD, ' ') = ' ' OR NVL(A.EEA_STOMA_CD, '0') = '0' THEN '' ELSE '위' END EEA_STOMA_CT";
		sql += ", CASE WHEN NVL(A.EEA_COLON_CD, ' ') = ' ' OR NVL(A.EEA_COLON_CD, '0') = '0' THEN '' ELSE '대' END EEA_COLON_CT";
		sql += ", CASE WHEN NVL(A.EEA_LIVER_CD, ' ') = ' ' OR NVL(A.EEA_LIVER_CD, '0') = '0' THEN '' ELSE '간' END EEA_LIVER_CT";
		sql += ", CASE WHEN NVL(A.EEA_BAST_CD, ' ') = ' ' OR NVL(A.EEA_BAST_CD, '0') = '0' THEN '' ELSE '유' END EEA_BAST_CT";
		sql += ", CASE WHEN NVL(A.EEA_UTER_CD, ' ') = ' ' OR NVL(A.EEA_UTER_CD, '0') = '0' THEN '' ELSE '자' END EEA_UTER_CT";
		sql += ", CASE WHEN NVL(A.EEA_LUNG_CD, ' ') = ' ' OR NVL(A.EEA_LUNG_CD, '0') = '0' THEN '' ELSE '폐' END EEA_LUNG_CT";
		sql += ", CASE WHEN UPPER(A.EEA_ORAL_YN) = 'Y' AND UPPER(A.EEA_HDMD_YN) = 'Y' THEN '구강' WHEN A.EEA_ORAL_YN = '1' THEN '구강' WHEN A.EEA_ORAL_YN = '3' THEN '구강' ELSE '' END AS EEA_ORAL_OX";
		sql += ", CASE WHEN UPPER(A.EEA_SPSB_YN) = 'Y' THEN '특검' ELSE '' END AS EEA_SPSB_OX";
		sql += ", CASE WHEN UPPER(A.EEA_CVSB_YN) = 'Y' THEN '뇌심' ELSE '' END AS EEA_CVSB_OX";
		sql += ", CASE WHEN UPPER(A.EEA_EMSB_YN) = 'Y' THEN '채용' ELSE '' END AS EEA_EMSB_OX";
		sql += ", CASE WHEN UPPER(A.EEA_ETSB_YN) = 'Y' THEN '기타' ELSE '' END AS EEA_ETSB_OX";
		sql += ", CASE WHEN SUBSTR(A.EEA_HTSB_CD, 1, 1) = '1' AND SUBSTR(A.EEA_HLTH_KD, 1, 1) = '1' THEN '대상' ELSE '' END EEA_CHOL_OX";
		sql += ", CASE WHEN SUBSTR(A.EEA_SPSB_CD, 1, 1) = '4' AND UPPER(A.EEA_2ND_YN) = 'Y' THEN '실시' ELSE '' END EEA_2ND_OX";

		sql += ", CASE WHEN A.EEA_RSLT_CD = '0' THEN '대기' ELSE CASE WHEN A.EEA_RSLT_CD = '1' THEN '입력중' ELSE '완료' END END AS EEA_RSLT_NM";
		sql += ", CASE WHEN EEA_RECE_KD = '0' THEN '미납' ELSE CASE WHEN EEA_RECE_KD = '1' THEN '일부' ELSE '완료' END END AS EEA_RECE_NM";
		sql += ", CASE WHEN A.EEA_DEFER_KD = '0' THEN '' ELSE CASE WHEN A.EEA_DEFER_KD = '1' THEN '보류' ELSE '보류완료' END END AS EEA_DEFER_NM";
		sql += ", F_TEL_FORMAT(A.EEA_ZIP_CD) EEA_ZIP_CD, A.EEA_ZIP_AR, A.EEA_ROAD_AR, A.EEA_ACPT_TX";
		sql += ", CASE WHEN RTRIM(NVL(A.EEA_RFID_NO, ' ')) = ' ' THEN ' ' ELSE F_LPAD(RTRIM(A.EEA_RFID_NO), 4, '0') END EEA_RFID_NO";
		sql += ", TO_CHAR(TO_DATE( C.PFP_RESULT_DATE), 'YYYY-MM-DD') || ' / ' || F_USER_FIND(C.PFP_DOCTORFIR) PFP_PAN_DR";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.EEA_CUST_NO LEFT OUTER JOIN PT_FIR_PANJUNG C";
		sql += " ON PFP_EXAM_DT = EEA_EXAM_DT";
		sql += " AND PFP_EXAM_SQ = EEA_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(CBPLCE_CD1.equals("0")) {
			sql += " AND A.EEA_PLCE_CD LIKE '" + CBPLCE_CD2 + "%'";
		} else {
			sql += " AND A.EEA_PLCE_CD = '" + CBPLCE_CD2 + "'";
		}

		sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBusinessTrip_btnDn_SrchClick_001 \n";
			G_INFO += "설명 : 접수정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " CBPLCE_CD1 : " + CBPLCE_CD1 + " \n";
			G_INFO += " CBPLCE_CD2 : " + CBPLCE_CD2 + " \n";
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
		<s:AttributeType name='EEA_EXAM_CD' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSVN_NO' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='29'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='7' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='9' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_ORDER_YN'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORDER_YN' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEND_DT'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_DT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTHR_PR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMPR_PR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCLR_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNLR_PR' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTHR_PR' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCLR_PR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEL_NO' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_HTYR'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_SPYM'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_YR' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_HTYR' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_SPYM' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SALES_ID'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_NM' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_NM' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BACH_NM' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MMBR_NM' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SALES_ID' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO2' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='22'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_OX' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CAN_CD' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_CT' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_CT' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_CT' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_TX'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_CT' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RFID_NO'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_CT' rs:number='38' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_CT' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_OX' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_OX' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_OX' rs:number='42' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_OX' rs:number='43' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_OX' rs:number='44' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHOL_OX' rs:number='45' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_2ND_OX' rs:number='46' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSLT_NM' rs:number='47' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RECE_NM' rs:number='48' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEFER_NM' rs:number='49' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_CD' rs:number='50' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_AR' rs:number='51' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ROAD_AR' rs:number='52' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_TX' rs:number='53' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RFID_NO' rs:number='54' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_PAN_DR' rs:number='55' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='56' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c56' rs:name='ROWID' rs:number='57' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c57' rs:name='ROWID' rs:number='58' rs:rowid='true' rs:hidden='true'>
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
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String EEA_RSVN_NO_T = cRsList.getString("EEA_RSVN_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_ORDER_YN_T = cRsList.getString("EEA_ORDER_YN");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_SEND_DT_T = cRsList.getString("EEA_SEND_DT");
			String EEA_COMPR_PR_T = cRsList.getString("EEA_COMPR_PR");
			String EEA_PSNLR_PR_T = cRsList.getString("EEA_PSNLR_PR");
			String EEA_HLTHR_PR_T = cRsList.getString("EEA_HLTHR_PR");
			String EEA_SPCLR_PR_T = cRsList.getString("EEA_SPCLR_PR");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_TEL_NO_T = cRsList.getString("EEA_TEL_NO");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_MNGT_YR_T = cRsList.getString("EEA_MNGT_YR");
			String EEA_MNGT_HTYR_T = cRsList.getString("EEA_MNGT_HTYR");
			String EEA_MNGT_SPYM_T = cRsList.getString("EEA_MNGT_SPYM");
			String EEA_SEX_NM_T = cRsList.getString("EEA_SEX_NM");
			String EEA_EXAM_NM_T = cRsList.getString("EEA_EXAM_NM");
			String EEA_BACH_NM_T = cRsList.getString("EEA_BACH_NM");
			String EEA_MMBR_NM_T = cRsList.getString("EEA_MMBR_NM");
			String EEA_COMP_NM_T = cRsList.getString("EEA_COMP_NM");
			String EEA_SALES_ID_T = cRsList.getString("EEA_SALES_ID");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_DIVI_NO2_T = cRsList.getString("EEA_DIVI_NO2");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_HTSB_OX_T = cRsList.getString("EEA_HTSB_OX");
			String EEA_CAN_CD_T = cRsList.getString("EEA_CAN_CD");
			String EEA_STOMA_CT_T = cRsList.getString("EEA_STOMA_CT");
			String EEA_COLON_CT_T = cRsList.getString("EEA_COLON_CT");
			String EEA_LIVER_CT_T = cRsList.getString("EEA_LIVER_CT");
			String EEA_BAST_CT_T = cRsList.getString("EEA_BAST_CT");
			String EEA_UTER_CT_T = cRsList.getString("EEA_UTER_CT");
			String EEA_LUNG_CT_T = cRsList.getString("EEA_LUNG_CT");
			String EEA_ORAL_OX_T = cRsList.getString("EEA_ORAL_OX");
			String EEA_SPSB_OX_T = cRsList.getString("EEA_SPSB_OX");
			String EEA_CVSB_OX_T = cRsList.getString("EEA_CVSB_OX");
			String EEA_EMSB_OX_T = cRsList.getString("EEA_EMSB_OX");
			String EEA_ETSB_OX_T = cRsList.getString("EEA_ETSB_OX");
			String EEA_CHOL_OX_T = cRsList.getString("EEA_CHOL_OX");
			String EEA_2ND_OX_T = cRsList.getString("EEA_2ND_OX");
			String EEA_RSLT_NM_T = cRsList.getString("EEA_RSLT_NM");
			String EEA_RECE_NM_T = cRsList.getString("EEA_RECE_NM");
			String EEA_DEFER_NM_T = cRsList.getString("EEA_DEFER_NM");
			String EEA_ZIP_CD_T = cRsList.getString("EEA_ZIP_CD");
			String EEA_ZIP_AR_T = cRsList.getString("EEA_ZIP_AR");
			String EEA_ROAD_AR_T = cRsList.getString("EEA_ROAD_AR");
			String EEA_ACPT_TX_T = cRsList.getString("EEA_ACPT_TX");
			String EEA_RFID_NO_T = cRsList.getString("EEA_RFID_NO");
			String PFP_PAN_DR_T = cRsList.getString("PFP_PAN_DR");
			String ROWID_T = cRsList.getString("ROWID");
			String c56_T = cRsList.getString("c56");
			String c57_T = cRsList.getString("c57");
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

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! EEA_SPCL_LT_T.equals("")) {
%>
		 		EEA_SPCL_LT='<%= EEA_SPCL_LT_T%>'
<%
			}

			if(! EEA_RSVN_NO_T.equals("")) {
%>
		 		EEA_RSVN_NO='<%= EEA_RSVN_NO_T%>'
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

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_SEND_DT_T.equals("")) {
%>
		 		EEA_SEND_DT='<%= EEA_SEND_DT_T%>'
<%
			}

			if(! EEA_COMPR_PR_T.equals("")) {
%>
		 		EEA_COMPR_PR='<%= EEA_COMPR_PR_T%>'
<%
			}

			if(! EEA_PSNLR_PR_T.equals("")) {
%>
		 		EEA_PSNLR_PR='<%= EEA_PSNLR_PR_T%>'
<%
			}

			if(! EEA_HLTHR_PR_T.equals("")) {
%>
		 		EEA_HLTHR_PR='<%= EEA_HLTHR_PR_T%>'
<%
			}

			if(! EEA_SPCLR_PR_T.equals("")) {
%>
		 		EEA_SPCLR_PR='<%= EEA_SPCLR_PR_T%>'
<%
			}

			if(! EEA_MOBL_NO_T.equals("")) {
%>
		 		EEA_MOBL_NO='<%= EEA_MOBL_NO_T%>'
<%
			}

			if(! EEA_TEL_NO_T.equals("")) {
%>
		 		EEA_TEL_NO='<%= EEA_TEL_NO_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! EEA_MNGT_YR_T.equals("")) {
%>
		 		EEA_MNGT_YR='<%= EEA_MNGT_YR_T%>'
<%
			}

			if(! EEA_MNGT_HTYR_T.equals("")) {
%>
		 		EEA_MNGT_HTYR='<%= EEA_MNGT_HTYR_T%>'
<%
			}

			if(! EEA_MNGT_SPYM_T.equals("")) {
%>
		 		EEA_MNGT_SPYM='<%= EEA_MNGT_SPYM_T%>'
<%
			}

			if(! EEA_SEX_NM_T.equals("")) {
%>
		 		EEA_SEX_NM='<%= EEA_SEX_NM_T%>'
<%
			}

			if(! EEA_EXAM_NM_T.equals("")) {
%>
		 		EEA_EXAM_NM='<%= EEA_EXAM_NM_T%>'
<%
			}

			if(! EEA_BACH_NM_T.equals("")) {
%>
		 		EEA_BACH_NM='<%= EEA_BACH_NM_T%>'
<%
			}

			if(! EEA_MMBR_NM_T.equals("")) {
%>
		 		EEA_MMBR_NM='<%= EEA_MMBR_NM_T%>'
<%
			}

			if(! EEA_COMP_NM_T.equals("")) {
%>
		 		EEA_COMP_NM='<%= EEA_COMP_NM_T%>'
<%
			}

			if(! EEA_SALES_ID_T.equals("")) {
%>
		 		EEA_SALES_ID='<%= EEA_SALES_ID_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! EEA_DIVI_NO2_T.equals("")) {
%>
		 		EEA_DIVI_NO2='<%= EEA_DIVI_NO2_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! EEA_HTSB_OX_T.equals("")) {
%>
		 		EEA_HTSB_OX='<%= EEA_HTSB_OX_T%>'
<%
			}

			if(! EEA_CAN_CD_T.equals("")) {
%>
		 		EEA_CAN_CD='<%= EEA_CAN_CD_T%>'
<%
			}

			if(! EEA_STOMA_CT_T.equals("")) {
%>
		 		EEA_STOMA_CT='<%= EEA_STOMA_CT_T%>'
<%
			}

			if(! EEA_COLON_CT_T.equals("")) {
%>
		 		EEA_COLON_CT='<%= EEA_COLON_CT_T%>'
<%
			}

			if(! EEA_LIVER_CT_T.equals("")) {
%>
		 		EEA_LIVER_CT='<%= EEA_LIVER_CT_T%>'
<%
			}

			if(! EEA_BAST_CT_T.equals("")) {
%>
		 		EEA_BAST_CT='<%= EEA_BAST_CT_T%>'
<%
			}

			if(! EEA_UTER_CT_T.equals("")) {
%>
		 		EEA_UTER_CT='<%= EEA_UTER_CT_T%>'
<%
			}
%>
				EEA_LUNG_CT='<%= cnt%>'
				EEA_ORAL_OX='<%= cnt%>'
				EEA_SPSB_OX='<%= cnt%>'
<%
			if(! EEA_CVSB_OX_T.equals("")) {
%>
		 		EEA_CVSB_OX='<%= EEA_CVSB_OX_T%>'
<%
			}

			if(! EEA_EMSB_OX_T.equals("")) {
%>
		 		EEA_EMSB_OX='<%= EEA_EMSB_OX_T%>'
<%
			}

			if(! EEA_ETSB_OX_T.equals("")) {
%>
		 		EEA_ETSB_OX='<%= EEA_ETSB_OX_T%>'
<%
			}

			if(! EEA_CHOL_OX_T.equals("")) {
%>
		 		EEA_CHOL_OX='<%= EEA_CHOL_OX_T%>'
<%
			}

			if(! EEA_2ND_OX_T.equals("")) {
%>
		 		EEA_2ND_OX='<%= EEA_2ND_OX_T%>'
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

			if(! EEA_DEFER_NM_T.equals("")) {
%>
		 		EEA_DEFER_NM='<%= EEA_DEFER_NM_T%>'
<%
			}

			if(! EEA_ZIP_CD_T.equals("")) {
%>
		 		EEA_ZIP_CD='<%= EEA_ZIP_CD_T%>'
<%
			}

			if(! EEA_ZIP_AR_T.equals("")) {
%>
		 		EEA_ZIP_AR='<%= EEA_ZIP_AR_T%>'
<%
			}

			if(! EEA_ROAD_AR_T.equals("")) {
%>
		 		EEA_ROAD_AR='<%= EEA_ROAD_AR_T%>'
<%
			}

			if(! EEA_ACPT_TX_T.equals("")) {
%>
		 		EEA_ACPT_TX='<%= EEA_ACPT_TX_T%>'
<%
			}

			if(! EEA_RFID_NO_T.equals("")) {
%>
		 		EEA_RFID_NO='<%= EEA_RFID_NO_T%>'
<%
			}

			if(! PFP_PAN_DR_T.equals("")) {
%>
		 		PFP_PAN_DR='<%= PFP_PAN_DR_T%>'
<%
			}

			if(! ROWID_T.equals("")) {
%>
		 		ROWID='<%= ROWID_T%>'
<%
			}

			if(! c56_T.equals("")) {
%>
		 		c56='<%= c56_T%>'
<%
			}

			if(! c57_T.equals("")) {
%>
		 		c57='<%= c57_T%>'
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
