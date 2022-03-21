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

		String DTACPT_DTS = htMethod.get("DTACPT_DTS");
		String DTACPT_DTE = htMethod.get("DTACPT_DTE");
		String G_HOSP_NO = htMethod.get("G_HOSP_NO");
		String EDCOMP_CD = htMethod.get("EDCOMP_CD");
		String CBEXAM_CD = htMethod.get("CBEXAM_CD");
		String CBHDMD_CD = htMethod.get("CBHDMD_CD");
		String CBPLCE_CD1 = htMethod.get("CBPLCE_CD1");
		String CBPLCE_CD2 = htMethod.get("CBPLCE_CD2");
		String CBSEND_CD = htMethod.get("CBSEND_CD");
		String RBSEND_DT = htMethod.get("RBSEND_DT");
		String DTSEND_DTS = htMethod.get("DTSEND_DTS");
		String DTSEND_DTE = htMethod.get("DTSEND_DTE");
		String CBSORT_CD = htMethod.get("CBSORT_CD");

		//
		if(DTACPT_DTS == null) { DTACPT_DTS = ""; }
		if(DTACPT_DTE == null) { DTACPT_DTE = ""; }
		if(G_HOSP_NO == null) { G_HOSP_NO = ""; }
		if(EDCOMP_CD == null) { EDCOMP_CD = ""; }
		if(CBEXAM_CD == null) { CBEXAM_CD = ""; }
		if(CBHDMD_CD == null) { CBHDMD_CD = ""; }
		if(CBPLCE_CD1 == null) { CBPLCE_CD1 = ""; }
		if(CBPLCE_CD2 == null) { CBPLCE_CD2 = ""; }
		if(CBSEND_CD == null) { CBSEND_CD = ""; }
		if(RBSEND_DT == null) { RBSEND_DT = ""; }
		if(DTSEND_DTS == null) { DTSEND_DTS = ""; }
		if(DTSEND_DTE == null) { DTSEND_DTE = ""; }
		if(CBSORT_CD == null) { CBSORT_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

  select a.eea_exam_dt, a.eea_exam_sq, a.eea_psnl_nm, a.eea_cust_no, a.eea_htsb_cd, a.eea_divi_cs, a.eea_chart_no,
         f_tel_format(a.eea_mobl_no) eea_mobl_no, a.eea_cncr_dt, c.pfp_tranc_date, d.psp_tranc_date,
         case when a.eea_exam_cd = '31001' then
                   case when a.eea_oral_yn = '3' then e.esp_oifrm_dt else e.esp_eifrm_dt end
              when a.eea_exam_cd = '31006' then f.eso_eifrm_dt
              when SUBSTR(a.eea_htsb_cd, 1, 2) = '13' then a.eea_cncr_dt
              when SUBSTR(a.eea_htsb_cd, 1, 2) = '14' then g.edp_tobo_dt
              when SUBSTR(a.eea_htsb_cd, 5, 1) = '2' or SUBSTR(a.eea_htsb_cd, 5, 1) = '4' then d.psp_tranc_date
                           else c.pfp_tranc_date end as eea_send_dt,
         case when upper(a.eea_htsb_yn) = 'Y' then F_CODE_FIND('0401', a.eea_htsb_cd, '', '1')
              when a.eea_exam_cd = '31001' and a.eea_oral_yn = '3' then '학생구강'
              else F_CODE_FIND('0401', a.eea_exam_cd, '', '1') end as eea_exam_nm,
         case when a.eea_exam_cd = '31001' then case when a.eea_cotk_cd = '1' then '표본' else '일반' end
                                             else F_CODE_FIND('0916', a.eea_enty_cd, '', '1') end as eea_enty_nm,
         f_pid(b.icr_penl_id) eea_psnl_id, a.eea_total_yn, a.eea_canad_yn, a.eea_uter_cd,
         case when upper(a.eea_htsb_yn) = 'Y' then
              case when SUBSTR(a.eea_htsb_cd, 1, 2) = '11' then case when SUBSTR(a.eea_htsb_cd, 5, 1) = '1' then '일검'
                                                                          when SUBSTR(a.eea_htsb_cd, 5, 1) = '3' then '일검'
                                                                          else '일검2' end
                   when SUBSTR(a.eea_htsb_cd, 1, 2) = '12' then case when SUBSTR(a.eea_htsb_cd, 5, 1) = '1' then '생애'
                                                                          when SUBSTR(a.eea_htsb_cd, 5, 1) = '3' then '생애'
                                                                          else '생애2' end
                   when SUBSTR(a.eea_htsb_cd, 1, 2) = '13' then '암' end else '' end as eea_htsb_ox,
         a.eea_stoma_cd||a.eea_colon_cd||a.eea_liver_cd||a.eea_bast_cd||a.eea_uter_cd||NVL(a.eea_lung_cd, '0') eea_can_cd,
         case when upper(a.eea_oral_yn) = 'Y' then '구강' else '' end as eea_oral_ox, upper(a.eea_oral_yn) eea_oral_yn,
         case when a.eea_exam_cd = '31001' then F_COMP_FIND(a.eea_comp_cd)
              else '('|| a.eea_zip_cd || ') ' || rtrim(ltrim(a.eea_zip_ar)) || ' ' || rtrim(ltrim(a.eea_road_ar)) end as eea_addr_tx,
         a.eea_email_ar, a.eea_send_cd, F_CODE_FIND('0712', a.eea_send_cd, '', '1') eea_send_nm
    from it_customer b, et_exam_acpt a
         left outer join pt_fir_panjung c
      on c.pfp_exam_dt = a.eea_exam_dt
     and c.pfp_exam_sq = a.eea_exam_sq
         left outer join pt_sed_panjung d
      on d.psp_exam_dt = a.eea_exam_dt
     and d.psp_exam_sq = a.eea_exam_sq
         left outer join et_stdt_pnjn e
      on e.esp_exam_dt = a.eea_exam_dt
     and e.esp_exam_sq = a.eea_exam_sq
         left outer join et_stdt_pnjno f
      on f.eso_exam_dt = a.eea_exam_dt
     and f.eso_exam_sq = a.eea_exam_sq
         left outer join et_dental_panj g
      on g.edp_exam_dt = a.eea_exam_dt
     and g.edp_exam_sq = a.eea_exam_sq
   where a.eea_exam_dt between :dtAcpt_DtS and :dtAcpt_DtE
     and a.eea_order_yn <> 'C' 
     and b.icr_cust_no = a.eea_cust_no

if (:g_HOSP_NO = '34100181') then
     and NVL(a.eea_send_dt, ' ') <> ' '

if (:edComp_Cd <> '') then
    and a.eea_comp_cd = :edComp_Cd

if (:cbExam_Cd = '00') then
     and (a.eea_exam_cd like '1%'
      or  a.eea_htsb_cd like '1%')
else
begin
  if (:cbExam_Cd = '31') then
     and a.eea_exam_cd = '31001'
  else if (:cbExam_Cd = '36') then
     and a.eea_exam_cd = '31006'
  else
  begin
     and ((a.eea_exam_cd like :cbExam_Cd||'%'
      or   a.eea_htsb_cd like :cbExam_Cd||'%')

    if (:cbExam_Cd = '13') then
      or a.eea_stoma_cd||a.eea_colon_cd||a.eea_liver_cd||a.eea_bast_cd||a.eea_uter_cd||NVL(a.eea_lung_cd, '0') <> '000000')
    else if (:cbExam_Cd = '14') then
      or a.eea_oral_yn = 'Y') 
    else
      )
  end;
end;

if (:cbExam_Cd <> '31') then // 학생검진 제외. 청구여부...
begin
  if (:cbHDmd_Cd = '1') then
     and a.eea_hlthr_pr > 0
  else if (:cbHDmd_Cd = '2') then
     and a.eea_hlthr_pr = 0
end;

if (:cbPlce_Cd1 <> '전체') then
     and a.eea_plce_cd = :cbPlce_Cd2

if (:cbSend_Cd <> '00') then
     and a.eea_send_cd in (:cbSend_Cd)

if (:rbSend_Dt = '1') then
     and (NVL(c.pfp_tranc_date, ' ') between :dtSend_DtS and :dtSend_DtE
      or  NVL(d.psp_tranc_date, ' ') between :dtSend_DtS and :dtSend_DtE
      or  NVL(a.eea_cncr_dt,    ' ') between :dtSend_DtS and :dtSend_DtE
      or  NVL(g.edp_tobo_dt ,   ' ') between :dtSend_DtS and :dtSend_DtE
      or  NVL(case when a.eea_exam_cd = '31001' then
                           case when a.eea_oral_yn = '3' then e.esp_oifrm_dt else e.esp_eifrm_dt end
                      when a.eea_exam_cd = '31006' then f.eso_eifrm_dt end, ' ') between :dtSend_DtS and :dtSend_DtE)

if :cbSort_Cd = '1' then
  Order By a.eea_psnl_nm, a.eea_exam_dt, a.eea_exam_sq
else if :cbSort_Cd = '2' then
  Order By eea_exam_dt, a.eea_exam_sq
else
  order by a.eea_exam_dt,
           case when a.eea_cncr_dt is NULL then case when c.pfp_tranc_date is NULL then d.psp_tranc_date else c.pfp_tranc_date end
                                        else a.eea_cncr_dt end, a.eea_psnl_nm
  
		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, A.EEA_CUST_NO, A.EEA_HTSB_CD, A.EEA_DIVI_CS, A.EEA_CHART_NO, F_TEL_FORMAT(A.EEA_MOBL_NO) EEA_MOBL_NO, A.EEA_CNCR_DT, C.PFP_TRANC_DATE, D.PSP_TRANC_DATE, CASE WHEN A.EEA_EXAM_CD = '31001' THEN CASE WHEN A.EEA_ORAL_YN = '3' THEN E.ESP_OIFRM_DT ELSE E.ESP_EIFRM_DT END WHEN A.EEA_EXAM_CD = '31006' THEN F.ESO_EIFRM_DT WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '13' THEN A.EEA_CNCR_DT WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '14' THEN G.EDP_TOBO_DT WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '2'";
		sql += " OR SUBSTR(A.EEA_HTSB_CD, 5, 1) = '4' THEN D.PSP_TRANC_DATE ELSE C.PFP_TRANC_DATE END AS EEA_SEND_DT, CASE WHEN UPPER(A.EEA_HTSB_YN) = 'Y' THEN F_CODE_FIND('0401', A.EEA_HTSB_CD, '', '1') WHEN A.EEA_EXAM_CD = '31001'";
		sql += " AND A.EEA_ORAL_YN = '3' THEN '학생구강' ELSE F_CODE_FIND('0401', A.EEA_EXAM_CD, '', '1') END AS EEA_EXAM_NM, CASE WHEN A.EEA_EXAM_CD = '31001' THEN CASE WHEN A.EEA_COTK_CD = '1' THEN '표본' ELSE '일반' END ELSE F_CODE_FIND('0916', A.EEA_ENTY_CD, '', '1') END AS EEA_ENTY_NM, F_PID(B.ICR_PENL_ID) EEA_PSNL_ID, A.EEA_TOTAL_YN, A.EEA_CANAD_YN, A.EEA_UTER_CD, CASE WHEN UPPER(A.EEA_HTSB_YN) = 'Y' THEN CASE WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '11' THEN CASE WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '1' THEN '일검' WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '3' THEN '일검' ELSE '일검2' END WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '12' THEN CASE WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '1' THEN '생애' WHEN SUBSTR(A.EEA_HTSB_CD, 5, 1) = '3' THEN '생애' ELSE '생애2' END WHEN SUBSTR(A.EEA_HTSB_CD, 1, 2) = '13' THEN '암' END ELSE '' END AS EEA_HTSB_OX, A.EEA_STOMA_CD || A.EEA_COLON_CD || A.EEA_LIVER_CD || A.EEA_BAST_CD || A.EEA_UTER_CD || NVL(A.EEA_LUNG_CD, '0') EEA_CAN_CD, CASE WHEN UPPER(A.EEA_ORAL_YN) = 'Y' THEN '구강' ELSE '' END AS EEA_ORAL_OX, UPPER(A.EEA_ORAL_YN) EEA_ORAL_YN, CASE WHEN A.EEA_EXAM_CD = '31001' THEN F_COMP_FIND(A.EEA_COMP_CD) ELSE '('|| A.EEA_ZIP_CD || ') ' || RTRIM(LTRIM(A.EEA_ZIP_AR)) || ' ' || RTRIM(LTRIM(A.EEA_ROAD_AR)) END AS EEA_ADDR_TX, A.EEA_EMAIL_AR, A.EEA_SEND_CD, F_CODE_FIND('0712', A.EEA_SEND_CD, '', '1') EEA_SEND_NM";
		sql += " FROM IT_CUSTOMER B, ET_EXAM_ACPT A LEFT OUTER JOIN PT_FIR_PANJUNG C";
		sql += " ON C.PFP_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND C.PFP_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN PT_SED_PANJUNG D";
		sql += " ON D.PSP_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND D.PSP_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_STDT_PNJN E";
		sql += " ON E.ESP_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND E.ESP_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_STDT_PNJNO F";
		sql += " ON F.ESO_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND F.ESO_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_DENTAL_PANJ G";
		sql += " ON G.EDP_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND G.EDP_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + DTACPT_DTS + "'";
		sql += " AND '" + DTACPT_DTE + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND B.ICR_CUST_NO = A.EEA_CUST_NO";

		if(G_HOSP_NO.equals("34100181")) {
			sql += " AND NVL(A.EEA_SEND_DT, ' ') <> ' '";
		}
		
		if(!EDCOMP_CD.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + EDCOMP_CD + "'";
		}
		
		if(CBEXAM_CD.equals("00")) {
			sql += " AND (A.EEA_EXAM_CD LIKE '1%'";
			sql += " OR A.EEA_HTSB_CD LIKE '1%')";
		}
		else {
			if(CBEXAM_CD.equals("31")) {
				sql += " AND A.EEA_EXAM_CD = '31001'";
			}
			else if(CBEXAM_CD.equals("36")) {
				sql += " AND A.EEA_EXAM_CD = '31006'";
			}
			else {
				sql += " AND ((A.EEA_EXAM_CD LIKE '" + CBEXAM_CD + "'||'%'";
				sql += " OR A.EEA_HTSB_CD LIKE '" + CBEXAM_CD + "'||'%')";

				if(CBEXAM_CD.equals("13")) {
					sql += " OR A.EEA_STOMA_CD||A.EEA_COLON_CD||A.EEA_LIVER_CD||A.EEA_BAST_CD||A.EEA_UTER_CD||NVL(A.EEA_LUNG_CD, '0') <> '000000')";
				}
				else if(CBEXAM_CD.equals("14")) {
					sql += " OR A.EEA_ORAL_YN = 'Y')";
				}
				else {
					sql += " )";
				}
			}
		}

		if(!CBEXAM_CD.equals("31")) {
			if(CBHDMD_CD.equals("1")) {
				sql += " AND A.EEA_HLTHR_PR > 0";
			}
			else if(CBHDMD_CD.equals("2")) {
				sql += " AND A.EEA_HLTHR_PR = 0";
			}
		}

		if(!CBPLCE_CD1.equals("전체")) {
			sql += " AND A.EEA_PLCE_CD = '" + CBPLCE_CD2 + "'";
		}

		if(!CBSEND_CD.equals("00")) {
			sql += " AND A.EEA_SEND_CD IN ('" + CBSEND_CD + "')";
		}
		
		if(RBSEND_DT.equals("1")) {
			sql += " AND (NVL(C.PFP_TRANC_DATE, ' ') BETWEEN '" + DTSEND_DTS + "'";
			sql += " AND '" + DTSEND_DTE + "'";
			sql += " OR NVL(D.PSP_TRANC_DATE, ' ') BETWEEN '" + DTSEND_DTS + "'";
			sql += " AND '" + DTSEND_DTE + "'";
			sql += " OR NVL(A.EEA_CNCR_DT, ' ') BETWEEN '" + DTSEND_DTS + "'";
			sql += " AND '" + DTSEND_DTE + "'";
			sql += " OR NVL(G.EDP_TOBO_DT , ' ') BETWEEN '" + DTSEND_DTS + "'";
			sql += " AND '" + DTSEND_DTE + "'";
			sql += " OR NVL(CASE WHEN A.EEA_EXAM_CD = '31001' THEN CASE WHEN A.EEA_ORAL_YN = '3' THEN E.ESP_OIFRM_DT ELSE E.ESP_EIFRM_DT END WHEN A.EEA_EXAM_CD = '31006' THEN F.ESO_EIFRM_DT END, ' ') BETWEEN '" + DTSEND_DTS + "'";
			sql += " AND '" + DTSEND_DTE + "')";
		}
		
		if(CBSORT_CD.equals("1")) {
			sql += " ORDER BY A.EEA_PSNL_NM, A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
		}
		else if(CBSORT_CD.equals("2")) {
			sql += " ORDER BY EEA_EXAM_DT, A.EEA_EXAM_SQ";
		}
		else {
			sql += " ORDER BY A.EEA_EXAM_DT, CASE WHEN A.EEA_CNCR_DT IS NULL THEN CASE WHEN C.PFP_TRANC_DATE IS NULL THEN D.PSP_TRANC_DATE ELSE C.PFP_TRANC_DATE END ELSE A.EEA_CNCR_DT END, A.EEA_PSNL_NM";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRslt_Send_btnAcpt_SrchClick_001 \n";
			G_INFO += "설명 : 발송정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTACPT_DTS : " + DTACPT_DTS + " \n";
			G_INFO += " DTACPT_DTE : " + DTACPT_DTE + " \n";
			G_INFO += " G_HOSP_NO : " + G_HOSP_NO + " \n";
			G_INFO += " EDCOMP_CD : " + EDCOMP_CD + " \n";
			G_INFO += " CBEXAM_CD : " + CBEXAM_CD + " \n";
			G_INFO += " CBHDMD_CD : " + CBHDMD_CD + " \n";
			G_INFO += " CBPLCE_CD1 : " + CBPLCE_CD1 + " \n";
			G_INFO += " CBPLCE_CD2 : " + CBPLCE_CD2 + " \n";
			G_INFO += " CBSEND_CD : " + CBSEND_CD + " \n";
			G_INFO += " RBSEND_DT : " + RBSEND_DT + " \n";
			G_INFO += " DTSEND_DTS : " + DTSEND_DTS + " \n";
			G_INFO += " DTSEND_DTE : " + DTSEND_DTE + " \n";
			G_INFO += " CBSORT_CD : " + CBSORT_CD + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CS' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_CS'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNCR_DT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNCR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_TRANC_DATE' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_TRANC_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_TRANC_DATE' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_TRANC_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_DT' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_NM' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_TOTAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENTY_NM' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANAD_YN'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_ID' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UTER_CD'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TOTAL_YN' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANAD_YN' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_OX' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEND_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CAN_CD' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_OX' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_YN' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADDR_TX' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMAIL_AR' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_CD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_NM' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='27' rs:rowid='true' rs:basetable='ET_DENTAL_PANJ' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c27' rs:name='ROWID' rs:number='28' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c28' rs:name='ROWID' rs:number='29' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c29' rs:name='ROWID' rs:number='30' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c30' rs:name='ROWID' rs:number='31' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c31' rs:name='ROWID' rs:number='32' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c32' rs:name='ROWID' rs:number='33' rs:rowid='true' rs:hidden='true'>
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

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_HTSB_CD_T = cRsList.getString("EEA_HTSB_CD");
			String EEA_DIVI_CS_T = cRsList.getString("EEA_DIVI_CS");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_CNCR_DT_T = cRsList.getString("EEA_CNCR_DT");
			String PFP_TRANC_DATE_T = cRsList.getString("PFP_TRANC_DATE");
			String PSP_TRANC_DATE_T = cRsList.getString("PSP_TRANC_DATE");
			String EEA_SEND_DT_T = cRsList.getString("EEA_SEND_DT");
			String EEA_EXAM_NM_T = cRsList.getString("EEA_EXAM_NM");
			String EEA_ENTY_NM_T = cRsList.getString("EEA_ENTY_NM");
			String EEA_PSNL_ID_T = cRsList.getString("EEA_PSNL_ID");
			String EEA_TOTAL_YN_T = cRsList.getString("EEA_TOTAL_YN");
			String EEA_CANAD_YN_T = cRsList.getString("EEA_CANAD_YN");
			String EEA_UTER_CD_T = cRsList.getString("EEA_UTER_CD");
			String EEA_HTSB_OX_T = cRsList.getString("EEA_HTSB_OX");
			String EEA_CAN_CD_T = cRsList.getString("EEA_CAN_CD");
			String EEA_ORAL_OX_T = cRsList.getString("EEA_ORAL_OX");
			String EEA_ORAL_YN_T = cRsList.getString("EEA_ORAL_YN");
			String EEA_ADDR_TX_T = cRsList.getString("EEA_ADDR_TX");
			String EEA_EMAIL_AR_T = cRsList.getString("EEA_EMAIL_AR");
			String EEA_SEND_CD_T = cRsList.getString("EEA_SEND_CD");
			String EEA_SEND_NM_T = cRsList.getString("EEA_SEND_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c27_T = cRsList.getString("c27");
			String c28_T = cRsList.getString("c28");
			String c29_T = cRsList.getString("c29");
			String c30_T = cRsList.getString("c30");
			String c31_T = cRsList.getString("c31");
			String c32_T = cRsList.getString("c32");
%>
			<z:row
<%
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

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! EEA_HTSB_CD_T.equals("")) {
%>
		 		EEA_HTSB_CD='<%= EEA_HTSB_CD_T%>'
<%
			}

			if(! EEA_DIVI_CS_T.equals("")) {
%>
		 		EEA_DIVI_CS='<%= EEA_DIVI_CS_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_MOBL_NO_T.equals("")) {
%>
		 		EEA_MOBL_NO='<%= EEA_MOBL_NO_T%>'
<%
			}

			if(! EEA_CNCR_DT_T.equals("")) {
%>
		 		EEA_CNCR_DT='<%= EEA_CNCR_DT_T%>'
<%
			}

			if(! PFP_TRANC_DATE_T.equals("")) {
%>
		 		PFP_TRANC_DATE='<%= PFP_TRANC_DATE_T%>'
<%
			}

			if(! PSP_TRANC_DATE_T.equals("")) {
%>
		 		PSP_TRANC_DATE='<%= PSP_TRANC_DATE_T%>'
<%
			}

			if(! EEA_SEND_DT_T.equals("")) {
%>
		 		EEA_SEND_DT='<%= EEA_SEND_DT_T%>'
<%
			}

			if(! EEA_EXAM_NM_T.equals("")) {
%>
		 		EEA_EXAM_NM='<%= EEA_EXAM_NM_T%>'
<%
			}

			if(! EEA_ENTY_NM_T.equals("")) {
%>
		 		EEA_ENTY_NM='<%= EEA_ENTY_NM_T%>'
<%
			}

			if(! EEA_PSNL_ID_T.equals("")) {
%>
		 		EEA_PSNL_ID='<%= EEA_PSNL_ID_T%>'
<%
			}

			if(! EEA_TOTAL_YN_T.equals("")) {
%>
		 		EEA_TOTAL_YN='<%= EEA_TOTAL_YN_T%>'
<%
			}

			if(! EEA_CANAD_YN_T.equals("")) {
%>
		 		EEA_CANAD_YN='<%= EEA_CANAD_YN_T%>'
<%
			}

			if(! EEA_UTER_CD_T.equals("")) {
%>
		 		EEA_UTER_CD='<%= EEA_UTER_CD_T%>'
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

			if(! EEA_ORAL_OX_T.equals("")) {
%>
		 		EEA_ORAL_OX='<%= EEA_ORAL_OX_T%>'
<%
			}

			if(! EEA_ORAL_YN_T.equals("")) {
%>
		 		EEA_ORAL_YN='<%= EEA_ORAL_YN_T%>'
<%
			}

			if(! EEA_ADDR_TX_T.equals("")) {
%>
		 		EEA_ADDR_TX='<%= EEA_ADDR_TX_T%>'
<%
			}

			if(! EEA_EMAIL_AR_T.equals("")) {
%>
		 		EEA_EMAIL_AR='<%= EEA_EMAIL_AR_T%>'
<%
			}

			if(! EEA_SEND_CD_T.equals("")) {
%>
		 		EEA_SEND_CD='<%= EEA_SEND_CD_T%>'
<%
			}

			if(! EEA_SEND_NM_T.equals("")) {
%>
		 		EEA_SEND_NM='<%= EEA_SEND_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c27_T.equals("")) {
%>
		 		c27='<%= c27_T%>'
<%
			}

			if(! c28_T.equals("")) {
%>
		 		c28='<%= c28_T%>'
<%
			}

			if(! c29_T.equals("")) {
%>
		 		c29='<%= c29_T%>'
<%
			}

			if(! c30_T.equals("")) {
%>
		 		c30='<%= c30_T%>'
<%
			}

			if(! c31_T.equals("")) {
%>
		 		c31='<%= c31_T%>'
<%
			}

			if(! c32_T.equals("")) {
%>
		 		c32='<%= c32_T%>'
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
