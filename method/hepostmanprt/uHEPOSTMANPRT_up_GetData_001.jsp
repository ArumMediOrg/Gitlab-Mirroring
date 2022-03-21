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

		String RZCHECKBOX2 = htMethod.get("RZCHECKBOX2");
		String G_ENCRT_KD = htMethod.get("G_ENCRT_KD");
		String DP_FROMDT = htMethod.get("DP_FROMDT");
		String DP_TODT = htMethod.get("DP_TODT");
		String RZCMB_CHGBN = htMethod.get("RZCMB_CHGBN");
		String EDCHART = htMethod.get("EDCHART");
		String EDNAME = htMethod.get("EDNAME");
		String COMP_CD = htMethod.get("COMP_CD");
		String CBDEPT_CDTEXT = htMethod.get("CBDEPT_CDTEXT");
		String CBDEPT_CDVALUE = htMethod.get("CBDEPT_CDVALUE");
		String RZCMB_MEKD1 = htMethod.get("RZCMB_MEKD1");
		String RZCMB_MEKD2 = htMethod.get("RZCMB_MEKD2");
		String RZCMB_PLACE1_1 = htMethod.get("RZCMB_PLACE1_1");
		String RZCMB_PLACE1_2 = htMethod.get("RZCMB_PLACE1_2");
		String RZCMB_PLACE2_1 = htMethod.get("RZCMB_PLACE2_1");
		String RZCMB_PLACE2_2 = htMethod.get("RZCMB_PLACE2_2");
		String CMB_PANINDEX = htMethod.get("CMB_PANINDEX");
		String CMB_PANTEXT = htMethod.get("CMB_PANTEXT");
		String CHK_DOCTOR = htMethod.get("CHK_DOCTOR");
		String EDTDCTNO = htMethod.get("EDTDCTNO");
		String RZCMB_ORDER = htMethod.get("RZCMB_ORDER");

		//
		if(RZCHECKBOX2 == null) { RZCHECKBOX2 = ""; }
		if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }
		if(RZCMB_CHGBN == null) { RZCMB_CHGBN = ""; }
		if(EDCHART == null) { EDCHART = ""; }
		if(EDNAME == null) { EDNAME = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(CBDEPT_CDTEXT == null) { CBDEPT_CDTEXT = ""; }
		if(CBDEPT_CDVALUE == null) { CBDEPT_CDVALUE = ""; }
		if(RZCMB_MEKD1 == null) { RZCMB_MEKD1 = ""; }
		if(RZCMB_MEKD2 == null) { RZCMB_MEKD2 = ""; }
		if(RZCMB_PLACE1_1 == null) { RZCMB_PLACE1_1 = ""; }
		if(RZCMB_PLACE1_2 == null) { RZCMB_PLACE1_2 = ""; }
		if(RZCMB_PLACE2_1 == null) { RZCMB_PLACE2_1 = ""; }
		if(RZCMB_PLACE2_2 == null) { RZCMB_PLACE2_2 = ""; }
		if(CMB_PANINDEX == null) { CMB_PANINDEX = ""; }
		if(CMB_PANTEXT == null) { CMB_PANTEXT = ""; }
		if(CHK_DOCTOR == null) { CHK_DOCTOR = ""; }
		if(EDTDCTNO == null) { EDTDCTNO = ""; }
		if(RZCMB_ORDER == null) { RZCMB_ORDER = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT EEA_EXAM_DT,EEA_EXAM_SQ, ICY_COMP_NM,EEA_COMP_CD, 
       TO_NUMBER(MAX(TRUNC((TO_DATE(EEA_EXAM_DT, 'YYYY-MM-DD') - case when NVL(EEA_ENTRY_DT,' ') = ' ' then TO_DATE(EEA_EXAM_DT, 'YYYY-MM-DD') else TO_DATE(EEA_ENTRY_DT, 'YYYY-MM-DD') end) / 365))) EEAYY
        , EEA_DEPT_NM,EEA_PSNL_NM,CASE WHEN EEA_SEX_CD ='1' THEN '남' ELSE '여' END EEA_SEX_CD ,EEA_PSNL_AGE
        , MAX(EEA_MOBL_NO) EEA_PHONE_NO1, MAX(EEA_TEL_NO) EEA_PHONE_NO2  
if :RzCheckBox2 = '1' then
begin
  if (:g_Encrt_Kd = '1') then 
    , MAX(icr_pid_en)  as eea_psnl_id
  else if (:g_Encrt_Kd = '2') then
    , ECHELONDB.ecl_decrypt(MAX(icr_pid_en)) as eea_psnl_id
  else
    , MAX(ICR_PENL_ID) as eea_psnl_id
end else
  f_pid(MAX(ICR_PENL_ID)) eea_psnl_id

  ,  EEA_CHART_NO, A.EEA_DIVI_NO, F.ICR_BIRH_DT 
FROM ET_EXAM_ACPT A 
  LEFT OUTER JOIN PT_LABOR_PANJUNG B 
    ON A.EEA_EXAM_DT=B.PLP_EXAM_DT AND A.EEA_EXAM_SQ=B.PLP_EXAM_SQ 
  LEFT OUTER JOIN (SELECT CAST( SUBSTR(CCN_SMALL,1,2) AS INT) PACK_CD, SUBSTR(CCN_SMALL,3,5) ITEM_CD,CCN_FULL_NM 
                    FROM CT_COMMON
                   WHERE CCN_LARGE='0423' AND  CCN_LEVEL='5' AND CCN_USE_YN='Y') C
    ON SUBSTR(B.PLP_JLPN_DSCD,1,1) = C.PACK_CD
  LEFT OUTER JOIN ET_RSLT_ITEM D
    ON A.EEA_EXAM_DT = D.ERI_EXAM_DT
    AND A.EEA_EXAM_SQ=D.ERI_EXAM_SQ 
    AND C.ITEM_CD=D.ERI_ITEM_CD
  LEFT OUTER JOIN IT_COMPANY E 
    ON A.EEA_COMP_CD=E.ICY_COMP_CD 
  LEFT OUTER JOIN IT_CUSTOMER F 
    ON A.EEA_CUST_NO=F.ICR_CUST_NO 
  LEFT OUTER JOIN PT_FIR_PANJUNG G 
    ON G.PFP_EXAM_DT = A.EEA_EXAM_DT
    AND G.PFP_EXAM_SQ = A.EEA_EXAM_SQ
WHERE PLP_EXAM_DT >= :dp_fromdt AND PLP_EXAM_DT <= :dp_todt
  AND NVL(PLP_JLPN_PNCD, 'A') <> 'A' AND NVL(PLP_JLPN_PNCD, ' ') <> ' ' 
  AND nvl(PLP_JLPN_TTPN,' ') <> 'A' 
  AND EEA_HTSB_CD IN ('11001', '12001', '12003') 
  AND EEA_ORDER_YN <> 'C' 

if :RzCmb_chgbn = '1' then
  AND EEA_HDMD_YN = 'Y' 
else if :RzCmb_chgbn = '2' then
  AND EEA_HDMD_YN = 'N' 

if :Edchart <> '' then
  AND EEA_CHART_NO = :Edchart

if :edName <> '' then
  AND EEA_PSNL_NM  LIKE :edName || '%' 

if :COMP_CD <> '' then
  AND EEA_COMP_CD = :COMP_CD

if :cbDept_CdText <> '' then
  AND EEA_DEPT_CD = :cbDept_CdValue

if :RzCmb_mekd1 <> '' then
  AND EEA_FAMY_CD = :RzCmb_mekd2

if :RzCmb_place1_1 <> '' then
  AND SUBSTR(EEA_PLCE_CD, 1, 1) = :RzCmb_place1_2

if :RzCmb_place2_1.Text <> '' then
  AND EEA_PLCE_CD = :RzCmb_place2_2

if (:cmb_panIndex = '5') or
   (:cmb_panIndex = '6') then 
begin
  if :cmb_panIndex = '5' then
    AND PLP_JLPN_PNCD In ('C', 'D1', 'D2') 
  else if :cmb_panIndex = '6' then
    AND PLP_JLPN_PNCD In ('D1', 'D2')
end else if :cmb_panText <> '' then
begin
  AND nvl(PLP_JLPN_PNCD,'XX') = :cmb_panText
end;

if :chk_Doctor = '1' then
  AND PFP_DOCTORFIR = :edtDctNo

GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, ICY_COMP_NM, EEA_COMP_CD, EEA_DEPT_NM, EEA_PSNL_NM, EEA_SEX_CD, EEA_PSNL_AGE, EEA_CHART_NO
         , EEA_DIVI_NO, ICR_BIRH_DT 
         
union all 

SELECT EEA_EXAM_DT, EEA_EXAM_SQ, ICY_COMP_NM, EEA_COMP_CD,
       TO_NUMBER(MAX(TRUNC((TO_DATE(EEA_EXAM_DT, 'YYYY-MM-DD') - case when NVL(EEA_ENTRY_DT,' ') = ' ' then TO_DATE(EEA_EXAM_DT, 'YYYY-MM-DD') else TO_DATE(EEA_ENTRY_DT, 'YYYY-MM-DD') end) / 365))) EEAYY
       , EEA_DEPT_NM, EEA_PSNL_NM, CASE WHEN EEA_SEX_CD ='1' THEN '남' ELSE '여' END EEA_SEX_CD, EEA_PSNL_AGE
       , MAX(EEA_MOBL_NO) EEA_PHONE_NO1, MAX(EEA_TEL_NO) EEA_PHONE_NO2

if :RzCheckBox2 = '1' then
begin
  if :g_Encrt_Kd = '1' then 
    , MAX(icr_pid_en) as eea_psnl_id
  else if :g_Encrt_Kd = '2' then
    , ECHELONDB.ecl_decrypt(MAX(icr_pid_en)) as eea_psnl_id
  else
    , MAX(ICR_PENL_ID) as eea_psnl_id
end else
  , f_pid(MAX(ICR_PENL_ID)) eea_psnl_id

  ,  EEA_CHART_NO, A.EEA_DIVI_NO, F.ICR_BIRH_DT 
FROM ET_EXAM_ACPT A 
  LEFT OUTER JOIN PT_LABOR_PANJUNG B 
    ON A.EEA_EXAM_DT = B.PlP_EXAM_DT AND A.EEA_EXAM_SQ=B.PlP_EXAM_SQ
  LEFT OUTER JOIN (SELECT CAST( SUBSTR(CCN_SMALL,1,2) AS INT) PACK_CD, SUBSTR(CCN_SMALL,3,5) ITEM_CD, CCN_FULL_NM
                    FROM CT_COMMON
                   WHERE CCN_LARGE = '0423' AND CCN_LEVEL='5' AND CCN_USE_YN='Y') C
    ON SUBSTR(B.PLP_JLPN_DSCD,1,1)= C.PACK_CD
  LEFT OUTER JOIN ET_RSLT_ITEM D
    ON A.EEA_EXAM_DT=D.ERI_EXAM_DT AND A.EEA_EXAM_SQ=D.ERI_EXAM_SQ AND C.ITEM_CD=D.ERI_ITEM_CD
  LEFT OUTER JOIN IT_COMPANY E ON A.EEA_COMP_CD = E.ICY_COMP_CD
  LEFT OUTER JOIN IT_CUSTOMER F ON A.EEA_CUST_NO = F.ICR_CUST_NO
  LEFT OUTER JOIN PT_FIR_PANJUNG G
    ON G.PFP_EXAM_DT = A.EEA_EXAM_DT
   AND G.PFP_EXAM_SQ = A.EEA_EXAM_SQ
WHERE PlP_EXAM_DT >= :dp_fromdt AND PlP_EXAM_DT <= :dp_todt
  AND NVL(PLP_JLPN_TTPN, 'X') = 'A' 
  AND EEA_HTSB_CD IN ('11001', '12001', '12003') 
  AND EEA_ORDER_YN <> 'C' 

if :RzCmb_chgbn = '1' then
  AND EEA_HDMD_YN = 'Y' 
else if :RzCmb_chgbn = '2' then
  AND EEA_HDMD_YN = 'N'

if :Edchart <> '' then
  AND EEA_CHART_NO = :Edchart

if :edName <> '' then
  AND EEA_PSNL_NM LIKE :edName || '%'

if :COMP_CD <> '' then
  AND EEA_COMP_CD = :COMP_CD

if :cbDept_CdText <> '' then
  AND EEA_DEPT_CD = :cbDept_CdValue

if :RzCmb_mekd1 <> '' then
  AND EEA_FAMY_CD = :RzCmb_mekd2

if :RzCmb_place1_1 <> '' then
  AND SUBSTR(EEA_PLCE_CD, 1, 1) = :RzCmb_place1_2

if :RzCmb_place2_1 <> '' then
  AND EEA_PLCE_CD = :RzCmb_place2_2

if (cmb_panIndex = '5') or
   (cmb_panIndex = '6') then 
begin
  if cmb_panIndex = '5' then
    AND PLP_JLPN_PNCD In ('C', 'D1', 'D2') 
  else if cmb_panIndex = '6' then
    AND PLP_JLPN_PNCD In ('D1', 'D2')
end else if cmb_panText <> '' then
begin
  AND nvl(PLP_JLPN_PNCD,'XX') = :cmb_panText
end;

if :chk_Doctor = '1' then
  AND PFP_DOCTORFIR = :edtDctNo

GROUP BY EEA_EXAM_DT,EEA_EXAM_SQ,ICY_COMP_NM,EEA_COMP_CD,EEA_DEPT_NM,EEA_PSNL_NM,EEA_SEX_CD ,EEA_PSNL_AGE, EEA_CHART_NO 
         , EEA_DIVI_NO, ICR_BIRH_DT 
if :RzCmb_order = '0' then
  ORDER BY EEA_EXAM_DT,EEA_EXAM_SQ 
if :RzCmb_order = '1' then
  ORDER BY EEA_PSNL_NM 
if :RzCmb_order = '2' then
  ORDER BY EEA_DEPT_NM,EEA_PSNL_NM 

		*/

		sql = " SELECT EEA_EXAM_DT,EEA_EXAM_SQ, ICY_COMP_NM,EEA_COMP_CD, TO_NUMBER(MAX(TRUNC((TO_DATE(EEA_EXAM_DT, 'YYYY-MM-DD') - case when NVL(EEA_ENTRY_DT,' ') = ' ' then TO_DATE(EEA_EXAM_DT, 'YYYY-MM-DD') else TO_DATE(EEA_ENTRY_DT, 'YYYY-MM-DD') end) / 365))) EEAYY , EEA_DEPT_NM,EEA_PSNL_NM,CASE WHEN EEA_SEX_CD ='1' THEN '남' ELSE '여' END EEA_SEX_CD ,EEA_PSNL_AGE , MAX(EEA_MOBL_NO) EEA_PHONE_NO1, MAX(EEA_TEL_NO) EEA_PHONE_NO2";

		if(RZCHECKBOX2.equals("1")) {
			if(G_ENCRT_KD.equals("1")) {
				sql += " , MAX(ICR_PID_EN) AS EEA_PSNL_ID";
			}
			else if(G_ENCRT_KD.equals("2")) {
				sql += " , ECL_DECRYPT(MAX(ICR_PID_EN)) AS EEA_PSNL_ID";
			}
			else {
				sql += " , MAX(ICR_PENL_ID) AS EEA_PSNL_ID";
			}
		}
		else {
			sql += " , F_PID(MAX(ICR_PENL_ID)) EEA_PSNL_ID";
		}

		sql += " , EEA_CHART_NO, A.EEA_DIVI_NO, F.ICR_BIRH_DT";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN PT_LABOR_PANJUNG B";
		sql += " ON A.EEA_EXAM_DT=B.PLP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=B.PLP_EXAM_SQ LEFT OUTER JOIN (SELECT CAST( SUBSTR(CCN_SMALL,1,2) AS INT) PACK_CD, SUBSTR(CCN_SMALL,3,5) ITEM_CD,CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE='0423'";
		sql += " AND CCN_LEVEL='5'";
		sql += " AND CCN_USE_YN='Y') C";
		sql += " ON SUBSTR(B.PLP_JLPN_DSCD,1,1) = C.PACK_CD LEFT OUTER JOIN ET_RSLT_ITEM D";
		sql += " ON A.EEA_EXAM_DT = D.ERI_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=D.ERI_EXAM_SQ";
		sql += " AND C.ITEM_CD=D.ERI_ITEM_CD LEFT OUTER JOIN IT_COMPANY E";
		sql += " ON A.EEA_COMP_CD=E.ICY_COMP_CD LEFT OUTER JOIN IT_CUSTOMER F";
		sql += " ON A.EEA_CUST_NO=F.ICR_CUST_NO LEFT OUTER JOIN PT_FIR_PANJUNG G";
		sql += " ON G.PFP_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND G.PFP_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " WHERE PLP_EXAM_DT >= '" + DP_FROMDT + "'";
		sql += " AND PLP_EXAM_DT <= '" + DP_TODT + "'";
		sql += " AND NVL(PLP_JLPN_PNCD, 'A') <> 'A'";
		sql += " AND NVL(PLP_JLPN_PNCD, ' ') <> ' '";
		sql += " AND nvl(PLP_JLPN_TTPN,' ') <> 'A'";
		sql += " AND EEA_HTSB_CD IN ('11001', '12001', '12003')";
		sql += " AND EEA_ORDER_YN <> 'C'";

		if(RZCMB_CHGBN.equals("1")) {
			sql += " AND EEA_HDMD_YN = 'Y'";
		}
		else if(RZCMB_CHGBN.equals("2")) {
			sql += " AND EEA_HDMD_YN = 'N'";
		}
		
		if(!EDCHART.equals("")) {
			sql += " AND EEA_CHART_NO = '" + EDCHART + "'";
		}
		
		if(!EDNAME.equals("")) {
			sql += " AND EEA_PSNL_NM LIKE '" + EDNAME + "' || '%'";
		}
		
		if(!COMP_CD.equals("")) {
			sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
		}
		
		if(!CBDEPT_CDTEXT.equals("")) {
			sql += " AND EEA_DEPT_CD = '" + CBDEPT_CDVALUE + "'";
		}
		
		if(!RZCMB_MEKD1.equals("")) {
			sql += " AND EEA_FAMY_CD = '" + RZCMB_MEKD2 + "'";
		}
		
		if(!RZCMB_PLACE1_1.equals("")) {
			sql += " AND SUBSTR(EEA_PLCE_CD, 1, 1) = '" + RZCMB_PLACE1_2 + "'";
		}
		
		if(!RZCMB_PLACE2_1.equals("")) {
			sql += " AND EEA_PLCE_CD = '" + RZCMB_PLACE2_2 + "'";
		}

		if(CMB_PANINDEX.equals("5") || CMB_PANINDEX.equals("6")) {
			if(CMB_PANINDEX.equals("5")) {
				sql += " AND PLP_JLPN_PNCD IN ('C', 'D1', 'D2')";
			}
			else if(CMB_PANINDEX.equals("6")) {
				sql += " AND PLP_JLPN_PNCD IN ('D1', 'D2')";
			}
		}
		else if(! CMB_PANTEXT.equals("")) {
			sql += " AND nvl(PLP_JLPN_PNCD,'XX') = '" + CMB_PANTEXT + "'";
		}
		
		if(CHK_DOCTOR.equals("1")) {
			sql += " AND PFP_DOCTORFIR = '" + EDTDCTNO + "'";
		}

		sql += " GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, ICY_COMP_NM, EEA_COMP_CD, EEA_DEPT_NM, EEA_PSNL_NM, EEA_SEX_CD, EEA_PSNL_AGE, EEA_CHART_NO , EEA_DIVI_NO, ICR_BIRH_DT";
		sql += " UNION";
		sql += " ALL SELECT EEA_EXAM_DT, EEA_EXAM_SQ, ICY_COMP_NM, EEA_COMP_CD, TO_NUMBER(MAX(TRUNC((TO_DATE(EEA_EXAM_DT, 'YYYY-MM-DD') - case when NVL(EEA_ENTRY_DT,' ') = ' ' then TO_DATE(EEA_EXAM_DT, 'YYYY-MM-DD') else TO_DATE(EEA_ENTRY_DT, 'YYYY-MM-DD') end) / 365))) EEAYY, EEA_DEPT_NM, EEA_PSNL_NM, CASE WHEN EEA_SEX_CD ='1' THEN '남' ELSE '여' END EEA_SEX_CD, EEA_PSNL_AGE , MAX(EEA_MOBL_NO) EEA_PHONE_NO1, MAX(EEA_TEL_NO) EEA_PHONE_NO2";

		if(RZCHECKBOX2.equals("1")) {
			if(G_ENCRT_KD.equals("1")) {
				sql += " , MAX(ICR_PID_EN) AS EEA_PSNL_ID";
			}
			else if(G_ENCRT_KD.equals("2")) {
				sql += " , ECL_DECRYPT(MAX(ICR_PID_EN)) AS EEA_PSNL_ID";
			}
			else {
				sql += " , MAX(ICR_PENL_ID) AS EEA_PSNL_ID";
			}
		}
		else {
			sql += " , F_PID(MAX(ICR_PENL_ID)) EEA_PSNL_ID";
		}

		sql += " , EEA_CHART_NO, A.EEA_DIVI_NO, F.ICR_BIRH_DT";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN PT_LABOR_PANJUNG B";
		sql += " ON A.EEA_EXAM_DT = B.PLP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=B.PLP_EXAM_SQ LEFT OUTER JOIN (SELECT CAST( SUBSTR(CCN_SMALL,1,2) AS INT) PACK_CD, SUBSTR(CCN_SMALL,3,5) ITEM_CD, CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0423'";
		sql += " AND CCN_LEVEL='5'";
		sql += " AND CCN_USE_YN='Y') C";
		sql += " ON SUBSTR(B.PLP_JLPN_DSCD,1,1)= C.PACK_CD LEFT OUTER JOIN ET_RSLT_ITEM D";
		sql += " ON A.EEA_EXAM_DT=D.ERI_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=D.ERI_EXAM_SQ";
		sql += " AND C.ITEM_CD=D.ERI_ITEM_CD LEFT OUTER JOIN IT_COMPANY E";
		sql += " ON A.EEA_COMP_CD = E.ICY_COMP_CD LEFT OUTER JOIN IT_CUSTOMER F";
		sql += " ON A.EEA_CUST_NO = F.ICR_CUST_NO LEFT OUTER JOIN PT_FIR_PANJUNG G";
		sql += " ON G.PFP_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND G.PFP_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " WHERE PLP_EXAM_DT >= '" + DP_FROMDT + "'";
		sql += " AND PLP_EXAM_DT <= '" + DP_TODT + "'";
		sql += " AND NVL(PLP_JLPN_TTPN, 'X') = 'A'";
		sql += " AND EEA_HTSB_CD IN ('11001', '12001', '12003')";
		sql += " AND EEA_ORDER_YN <> 'C'";

		if(RZCMB_CHGBN.equals("1")) {
			sql += " AND EEA_HDMD_YN = 'Y'";
		}
		else if(RZCMB_CHGBN.equals("2")) {
			sql += " AND EEA_HDMD_YN = 'N'";
		}
		
		if(!EDCHART.equals("")) {
			sql += " AND EEA_CHART_NO = '" + EDCHART + "'";
		}
		
		if(!EDNAME.equals("")) {
			sql += " AND EEA_PSNL_NM LIKE '" + EDNAME + "' || '%'";
		}
		
		if(!COMP_CD.equals("")) {
			sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
		}
		
		if(!CBDEPT_CDTEXT.equals("")) {
			sql += " AND EEA_DEPT_CD = '" + CBDEPT_CDVALUE + "'";
		}
		
		if(!RZCMB_MEKD1.equals("")) {
			sql += " AND EEA_FAMY_CD = '" + RZCMB_MEKD2 + "'";
		}
		
		if(!RZCMB_PLACE1_1.equals("")) {
			sql += " AND SUBSTR(EEA_PLCE_CD, 1, 1) = '" + RZCMB_PLACE1_2 + "'";
		}
		
		if(!RZCMB_PLACE2_1.equals("")) {
			sql += " AND EEA_PLCE_CD = '" + RZCMB_PLACE2_2 + "'";
		}

		if(CMB_PANINDEX.equals("5") || CMB_PANINDEX.equals("6")) {
			if(CMB_PANINDEX.equals("5")) {
				sql += " AND PLP_JLPN_PNCD IN ('C', 'D1', 'D2')";
			}
			else if(CMB_PANINDEX.equals("6")) {
				sql += " AND PLP_JLPN_PNCD IN ('D1', 'D2')";
			}
		}
		else if(! CMB_PANTEXT.equals("")) {
			sql += " AND nvl(PLP_JLPN_PNCD,'XX') = '" + CMB_PANTEXT + "'";
		}
		
		if(CHK_DOCTOR.equals("1")) {
			sql += " AND PFP_DOCTORFIR = '" + EDTDCTNO + "'";
		}

		sql += " GROUP BY EEA_EXAM_DT,EEA_EXAM_SQ,ICY_COMP_NM,EEA_COMP_CD,EEA_DEPT_NM,EEA_PSNL_NM,EEA_SEX_CD ,EEA_PSNL_AGE, EEA_CHART_NO , EEA_DIVI_NO, ICR_BIRH_DT";

		if(RZCMB_ORDER.equals("0")) {
			sql += " ORDER BY EEA_EXAM_DT,EEA_EXAM_SQ";
		}
		if(RZCMB_ORDER.equals("1")) {
			sql += " ORDER BY EEA_PSNL_NM";
		}
		if(RZCMB_ORDER.equals("2")) {
			sql += " ORDER BY EEA_DEPT_NM,EEA_PSNL_NM";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHEPOSTMANPRT_up_GetData_001 \n";
			G_INFO += "설명 : 소견서 정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RZCHECKBOX2 : " + RZCHECKBOX2 + " \n";
			G_INFO += " G_ENCRT_KD : " + G_ENCRT_KD + " \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
			G_INFO += " RZCMB_CHGBN : " + RZCMB_CHGBN + " \n";
			G_INFO += " EDCHART : " + EDCHART + " \n";
			G_INFO += " EDNAME : " + EDNAME + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " CBDEPT_CDTEXT : " + CBDEPT_CDTEXT + " \n";
			G_INFO += " CBDEPT_CDVALUE : " + CBDEPT_CDVALUE + " \n";
			G_INFO += " RZCMB_MEKD1 : " + RZCMB_MEKD1 + " \n";
			G_INFO += " RZCMB_MEKD2 : " + RZCMB_MEKD2 + " \n";
			G_INFO += " RZCMB_PLACE1_1 : " + RZCMB_PLACE1_1 + " \n";
			G_INFO += " RZCMB_PLACE1_2 : " + RZCMB_PLACE1_2 + " \n";
			G_INFO += " RZCMB_PLACE2_1 : " + RZCMB_PLACE2_1 + " \n";
			G_INFO += " RZCMB_PLACE2_2 : " + RZCMB_PLACE2_2 + " \n";
			G_INFO += " CMB_PANINDEX : " + CMB_PANINDEX + " \n";
			G_INFO += " CMB_PANTEXT : " + CMB_PANTEXT + " \n";
			G_INFO += " CHK_DOCTOR : " + CHK_DOCTOR + " \n";
			G_INFO += " EDTDCTNO : " + EDTDCTNO + " \n";
			G_INFO += " RZCMB_ORDER : " + RZCMB_ORDER + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEAYY' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='7'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PHONE_NO1' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PHONE_NO2' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_ID' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
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
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEAYY_T = cRsList.getString("EEAYY");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_PHONE_NO1_T = cRsList.getString("EEA_PHONE_NO1");
			String EEA_PHONE_NO2_T = cRsList.getString("EEA_PHONE_NO2");
			String EEA_PSNL_ID_T = cRsList.getString("EEA_PSNL_ID");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
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

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! EEAYY_T.equals("")) {
%>
		 		EEAYY='<%= EEAYY_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
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

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! EEA_PHONE_NO1_T.equals("")) {
%>
		 		EEA_PHONE_NO1='<%= EEA_PHONE_NO1_T%>'
<%
			}

			if(! EEA_PHONE_NO2_T.equals("")) {
%>
		 		EEA_PHONE_NO2='<%= EEA_PHONE_NO2_T%>'
<%
			}

			if(! EEA_PSNL_ID_T.equals("")) {
%>
		 		EEA_PSNL_ID='<%= EEA_PSNL_ID_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
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
