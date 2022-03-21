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

		String G_ENCRT_KD = htMethod.get("G_ENCRT_KD");
		String MSKPSNLID = htMethod.get("MSKPSNLID");
		String RZCHECKBOX1 = htMethod.get("RZCHECKBOX1");
		String RZCOMBOBOX1 = htMethod.get("RZCOMBOBOX1");
		String SEDT_YEAR = htMethod.get("SEDT_YEAR");
		String CMBBOX_PANJ = htMethod.get("CMBBOX_PANJ");
		String CMBSP_CHA_ENABLED = htMethod.get("CMBSP_CHA_ENABLED");
		String CMBSP_CHA = htMethod.get("CMBSP_CHA");
		String DTEDTEXAM_SDT = htMethod.get("DTEDTEXAM_SDT");
		String DTEDTEXAM_EDT = htMethod.get("DTEDTEXAM_EDT");
		String MS_YEAR = htMethod.get("MS_YEAR");
		String CMBSP_GUBN = htMethod.get("CMBSP_GUBN");
		String CMBSP_GUBN_ENABLED = htMethod.get("CMBSP_GUBN_ENABLED");
		String MSKEDTCOMP_CD1 = htMethod.get("MSKEDTCOMP_CD1");
		String CHKBOXMAIN = htMethod.get("CHKBOXMAIN");
		String MSKEDTCOMP_CD2 = htMethod.get("MSKEDTCOMP_CD2");
		String EDTEEA_CHART_NO = htMethod.get("EDTEEA_CHART_NO");
		String EDTPSNL_NM = htMethod.get("EDTPSNL_NM");
		String CMBBOXPLCE_CD = htMethod.get("CMBBOXPLCE_CD");
		String CMBADVICE_CD = htMethod.get("CMBADVICE_CD");
		String CMBADVICE_YN = htMethod.get("CMBADVICE_YN");
		String CMBBOXSORT = htMethod.get("CMBBOXSORT");

		//
		if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
		if(MSKPSNLID == null) { MSKPSNLID = ""; }
		if(RZCHECKBOX1 == null) { RZCHECKBOX1 = ""; }
		if(RZCOMBOBOX1 == null) { RZCOMBOBOX1 = ""; }
		if(SEDT_YEAR == null) { SEDT_YEAR = ""; }
		if(CMBBOX_PANJ == null) { CMBBOX_PANJ = ""; }
		if(CMBSP_CHA_ENABLED == null) { CMBSP_CHA_ENABLED = ""; }
		if(CMBSP_CHA == null) { CMBSP_CHA = ""; }
		if(DTEDTEXAM_SDT == null) { DTEDTEXAM_SDT = ""; }
		if(DTEDTEXAM_EDT == null) { DTEDTEXAM_EDT = ""; }
		if(MS_YEAR == null) { MS_YEAR = ""; }
		if(CMBSP_GUBN == null) { CMBSP_GUBN = ""; }
		if(CMBSP_GUBN_ENABLED == null) { CMBSP_GUBN_ENABLED = ""; }
		if(MSKEDTCOMP_CD1 == null) { MSKEDTCOMP_CD1 = ""; }
		if(CHKBOXMAIN == null) { CHKBOXMAIN = ""; }
		if(MSKEDTCOMP_CD2 == null) { MSKEDTCOMP_CD2 = ""; }
		if(EDTEEA_CHART_NO == null) { EDTEEA_CHART_NO = ""; }
		if(EDTPSNL_NM == null) { EDTPSNL_NM = ""; }
		if(CMBBOXPLCE_CD == null) { CMBBOXPLCE_CD = ""; }
		if(CMBADVICE_CD == null) { CMBADVICE_CD = ""; }
		if(CMBADVICE_YN == null) { CMBADVICE_YN = ""; }
		if(CMBBOXSORT == null) { CMBBOXSORT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

if :g_Encrt_Kd = '1' then
  SELECT B.ICR_PID_EN  AS EEA_PSNL_ID,
else if :g_Encrt_Kd = '2' then
  SELECT DISTINCT ECHELONDB.ecl_decrypt(B.ICR_PID_EN)  EEA_PSNL_ID,
else
  SELECT DISTINCT B.ICR_PENL_ID  EEA_PSNL_ID,

         A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_EXAM_CD,   A.EEA_HTSB_CD,
         CASE WHEN (SELECT COUNT(*) FROM ET_PSNL_MEMO WHERE EPM_CUST_NO = EEA_CUST_NO) > 0 THEN 'Y' ELSE 'N' END AS ET_PSNL_MEMO,
         A.EEA_SPSB_CD, A.EEA_SPCL_CD, A.EEA_CUST_NO,  B.ICR_PENL_ID, A.EEA_MNGT_SPYM,
         Case When H.PFP_PANRETR2 = '1' Then 'R'
              When H.PFP_PANRETRD = '1' Then 'R'
              When H.PFP_PANRETR1 = '1' Then 'R'
              When H.PFP_PANRETB  = '1' Then 'B'
              When H.PFP_PANRETA  = '1' Then 'A'
              Else '' End PFP_PANRET1,
         Case When A.EEA_SEX_CD  IS NULL Or A.EEA_SEX_CD  = '' Then A.EEA_SEX_CD
              Else GetCOMMON_LvCdToNm('0411',A.EEA_SEX_CD ,'5',1) End EEA_SEX_NM,
         Case When A.EEA_SPCL_CD IS NULL Or A.EEA_SPCL_CD = '' Then A.EEA_SPCL_CD
              Else GetCOMMON_LvCdToNm('0910',A.EEA_SPCL_CD,'5',2) End EEA_SPCL_NM,
         D.SBE_TPAN_NM,
               A.EEA_COMP_CD,  C.ICY_COMP_NM,  A.EEA_DEPT_NM,  A.EEA_EXAM_CD, A.EEA_TEL_NO,
         A.EEA_MOBL_NO,  A.EEA_PLCE_CD,  E.SPG_PANJ_DT,  E.SPG_DOCT_CD, J.PLP_JLPN_TTPN,
               F_DOCTOR_FIND(1,E.SPG_DOCT_CD) SPG_DOCT_NM, A.EEA_DIVI_NO,
         A.EEA_STOMA_CD, A.EEA_COLON_CD, A.EEA_LIVER_CD, A.EEA_BAST_CD, A.EEA_UTER_CD,
         K.ECS_RSLT_KD,  L.ECC_RSLT_KD,  M.ECL_RSLT_KD,  N.ECB_RSLT_KD, O.ECV_RSLT_KD,
         A.EEA_LUNG_CD, A.EEA_HLTH_KD, P.ECG_RSLT_KD
  From ET_EXAM_ACPT A
       Inner Join IT_CUSTOMER B On A.EEA_CUST_NO = B.ICR_CUST_NO

//주민번호 2018.07.20 이명재 추가
if :mskPsnlID <> '' then
begin
       And B.ICR_PENL_ID = :mskPsnlID
end;
       Left Outer Join IT_COMPANY       C On A.EEA_COMP_CD = C.ICY_COMP_CD                                                            
       Left Outer Join ST_BASE          D On A.EEA_EXAM_DT = D.SBE_EXAM_DT                                                            
                                        And A.EEA_EXAM_SQ = D.SBE_EXAM_SQ And D.SBE_PANJ_YN = 'Y'                                   
       Left Outer Join ST_PANJUNG       E On A.EEA_EXAM_DT = E.SPG_EXAM_DT And A.EEA_EXAM_SQ = E.SPG_EXAM_SQ                          
       Left Outer Join PT_FIR_PANJUNG   H On A.EEA_EXAM_DT = H.PFP_EXAM_DT And A.EEA_EXAM_SQ = H.PFP_EXAM_SQ                          
       Left Outer Join PT_SED_PANJUNG   I On A.EEA_EXAM_DT = I.PSP_EXAM_DT And A.EEA_EXAM_SQ = I.PSP_EXAM_SQ                          
       Left Outer Join CT_SP_MATTER     F On E.SPG_MATT_CD = F.CSM_MATT_CD                                                            
       Left Outer Join ST_ADVICE        G On A.EEA_EXAM_DT = G.SAE_EXAM_DT And A.EEA_EXAM_SQ = G.SAE_EXAM_SQ And G.SAE_EXAM_CHA = ''
       Left Outer Join PT_LABOR_PANJUNG J On A.EEA_EXAM_DT = J.PLP_EXAM_DT And A.EEA_EXAM_SQ = J.PLP_EXAM_SQ                          
       Left Outer Join ET_CANCER_STMC   K On A.EEA_EXAM_DT = K.ECS_EXAM_DT And A.EEA_EXAM_SQ = K.ECS_EXAM_SQ                          
       Left Outer Join ET_CANCER_COLO   L On A.EEA_EXAM_DT = L.ECC_EXAM_DT And A.EEA_EXAM_SQ = L.ECC_EXAM_SQ                          
       Left Outer Join ET_CANCER_LIVER  M On A.EEA_EXAM_DT = M.ECL_EXAM_DT And A.EEA_EXAM_SQ = M.ECL_EXAM_SQ                          
       Left Outer Join ET_CANCER_BRST   N On A.EEA_EXAM_DT = N.ECB_EXAM_DT And A.EEA_EXAM_SQ = N.ECB_EXAM_SQ                          
       Left Outer Join ET_CANCER_CRVC   O On A.EEA_EXAM_DT = O.ECV_EXAM_DT And A.EEA_EXAM_SQ = O.ECV_EXAM_SQ                          
       Left Outer Join ET_CANCER_LUNG   P On A.EEA_EXAM_DT = P.ECG_EXAM_DT And A.EEA_EXAM_SQ = P.ECG_EXAM_SQ                          

  WHERE 0=0
        AND SUBSTR(EEA_EXAM_CD,1,2) <> '31'
//검진일자(특검검진년도)
if :RzCheckBox1 = '0' then   //2018.07.20 이명재 추가
begin
  if :RzComboBox1 = '1' then //종검
  begin
        AND SUBSTR(EEA_EXAM_CD,1,1) = '2'
  end else if :RzComboBox1 = '2' then //일검||암||노동부          //20200207:폐암조건추가, 공백체크 추가
  begin
        And ((SUBSTR(A.EEA_MNGT_HTYR,1,4) = :SEdt_Year) Or
             (NVL(A.EEA_STOMA_CD,'0') <> '0')       Or
             (NVL(A.EEA_COLON_CD,'0') <> '0')       Or
             (NVL(A.EEA_LIVER_CD,'0') <> '0')       Or
             (NVL(A.EEA_BAST_CD,'0')  <> '0')       Or
             (NVL(A.EEA_LUNG_CD,'0')  <> '0')       Or
             (NVL(A.EEA_UTER_CD,'0')  <> '0'))        
  end else if :RzComboBox1 = '3' then //일검||암||특검||노동부
  begin
        And ((SUBSTR(A.EEA_MNGT_SPYM,1,4) = :SEdt_Year) Or
             (NVL(A.EEA_STOMA_CD,'0') <> '0')       Or
             (NVL(A.EEA_COLON_CD,'0') <> '0')       Or
             (NVL(A.EEA_LIVER_CD,'0') <> '0')       Or
             (NVL(A.EEA_BAST_CD,'0')  <> '0')       Or
             (NVL(A.EEA_UTER_CD,'0')  <> '0')       Or
             (NVL(A.EEA_LUNG_CD,'0')  <> '0')       Or
             (SUBSTR(A.EEA_MNGT_HTYR,1,4) = :SEdt_Year))  
  end else if :RzComboBox1 = '4' then //특검||노동부
  begin
        And ((SUBSTR(A.EEA_MNGT_SPYM,1,4) = :SEdt_Year) Or
             (SUBSTR(A.EEA_MNGT_HTYR,1,4) = :SEdt_Year))  
    if :CmbBox_PanJ = '0' then
    begin
        And ((E.SPG_PANJ_CD In ('4','5','6','7','9','A','B') Or
             (J.PLP_JLPN_TTPN <> 'A' And NVL(J.PLP_JLPN_TTPN, ' ') <> ' ' And J.PLP_JLPN_TTPN Is Not Null)))
    end else
    if :CmbBox_PanJ) = '1' then
    begin
        And ((E.SPG_PANJ_CD In ('4','5','6','7','A','B')) Or
             (J.PLP_JLPN_TTPN <> 'A' And NVL(J.PLP_JLPN_TTPN, ' ') <> ' ' And J.PLP_JLPN_TTPN Is Not Null)))
    end else
    if :CmbBox_PanJ = 'C' then
    begin
        And ((E.SPG_PANJ_CD In ('4','5','A')) Or
             (J.PLP_JLPN_TTPN <> 'A' And NVL(J.PLP_JLPN_TTPN, ' ') <> ' ' And J.PLP_JLPN_TTPN Is Not Null)))
    end else
    if :CmbBox_PanJ = 'D' then
    begin
        And ((E.SPG_PANJ_CD In ('6','7','B')) Or
             (J.PLP_JLPN_TTPN <> 'A' And NVL(J.PLP_JLPN_TTPN, ' ') <> ' ' And J.PLP_JLPN_TTPN Is Not Null)))
    end else
    begin
        And ((E.SPG_PANJ_CD = :CmbBox_PanJ) Or
             (J.PLP_JLPN_TTPN <> 'A' And NVL(J.PLP_JLPN_TTPN, ' ') <> ' ' And J.PLP_JLPN_TTPN Is Not Null)))
    end;             
  end else if :RzComboBox1 = '5' then //기타
  begin
        AND SUBSTR(EEA_EXAM_CD,1,1) = '9'
  end;
  
  if (:CmbSP_CHA_Enabled = '1') and (:CmbSP_CHA = '0') then
  begin
        And ((A.EEA_EXAM_CD = '41001' Or A.EEA_EXAM_CD = '42001' Or A.EEA_SPSB_YN = 'Y') Or
             (A.EEA_EXAM_CD In ('11001', '12001', '12003') Or                              
              A.EEA_HTSB_CD In ('11001', '12001', '12003')))                               
  end else if (:CmbSP_CHA_Enabled = '1') and (:CmbSP_CHA = '1') then
  begin
        And ((A.EEA_EXAM_CD = '41001' Or A.EEA_SPSB_YN = 'Y') Or 
             (A.EEA_EXAM_CD In ('11001', '12001', '12003') Or  
              A.EEA_HTSB_CD In ('11001', '12001', '12003')))   
  end else if (:CmbSP_CHA_Enabled = '1') and (:CmbSP_CHA = '2') then  
  begin
        And ((A.EEA_EXAM_CD = '42001') Or                        
             (A.EEA_EXAM_CD In ('11001', '12001', '12003') Or
              A.EEA_HTSB_CD In ('11001', '12001', '12003'))) 
  end;
  
        And A.EEA_EXAM_DT >= :DTEdtEXAM_SDT
        And A.EEA_EXAM_DT <= :DTEdtEXAM_EDT        
end if :RzCheckBox1 = '1' then  //2018.07.20 이명재 추가
begin
        And A.EEA_EXAM_DT >= :Ms_Year || '0101'
        And A.EEA_EXAM_DT <= :DTEdtEXAM_EDT
end;

        And A.EEA_ORDER_YN <> 'C'

//특수구분 2016.12.21 이명재 추가(구분자는 넣어놓고는 코딩을 안해놓은 아이러니...)
if (:CmbSP_GUBN <> '00') and
   (:CmbSP_GUBN_Enabled = '1')   then
        And A.EEA_SPCL_CD = :CmbSP_GUBN

//사업장
if :MskEdtCOMP_CD1 <> '' then
begin
  if :ChkBoxMain = '1' then
  begin
        And A.EEA_COMP_CD IN :MskEdtCOMP_CD2
  end else
  begin
        And A.EEA_COMP_CD = :MskEdtCOMP_CD2
  end;
end;

//차트번호
if :EdtEEA_CHART_NO <> '' then
        And A.EEA_CHART_NO = :EdtEEA_CHART_NO

//성명
if :EdtPSNL_NM <> '' then
        And A.EEA_PSNL_NM like '%' || :EdtPSNL_NM || '%'

//내원/출장
if :CmbBoxPLCE_CD <> '0' then
        And SUBSTR(A.EEA_PLCE_CD,1,1) = :CmbBoxPLCE_CD

//상담구분
if :CmbADVICE_CD <> '0' then
        And G.SAE_ADVI_CD = :CmbADVICE_CD

//상담여부
if :CmbADVICE_YN = '1' then
begin
        And G.SAE_ADVI_CD Is NOT NULL
end else if :CmbADVICE_YN = '2' then
begin
        And G.SAE_ADVI_CD Is NULL;
end;

//정렬조건
if :CmbBoxSort = '0' then
        Order By A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_COMP_CD
else if :CmbBoxSort = '1' then
        Order By A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_COMP_CD, A.EEA_DEPT_NM, A.EEA_PSNL_NM
else if :CmbBoxSort = '2' then
        Order By A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_COMP_CD, EEA_PSNL_ID
else if :CmbBoxSort = '3' then
        Order By A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_COMP_CD, A.EEA_PSNL_NM
else if :CmbBoxSort = '4' then
        Order By EEA_PSNL_ID
else if :CmbBoxSort = '5' then
        Order By A.EEA_PSNL_NM

		*/

		if(G_ENCRT_KD.equals("1")) {
			sql = " SELECT B.ICR_PID_EN AS EEA_PSNL_ID,";
		}
		else if(G_ENCRT_KD.equals("2")) {
			sql = " SELECT DISTINCT ECL_DECRYPT(B.ICR_PID_EN) EEA_PSNL_ID,";
		}
		else {
			sql = " SELECT DISTINCT B.ICR_PENL_ID EEA_PSNL_ID,";
		}

		sql += " A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_EXAM_CD, A.EEA_HTSB_CD, CASE WHEN (SELECT COUNT(*)";
		sql += " FROM ET_PSNL_MEMO";
		sql += " WHERE EPM_CUST_NO = EEA_CUST_NO) > 0 THEN 'Y' ELSE 'N' END AS ET_PSNL_MEMO, A.EEA_SPSB_CD, A.EEA_SPCL_CD, A.EEA_CUST_NO, B.ICR_PENL_ID, A.EEA_MNGT_SPYM, CASE WHEN H.PFP_PANRETR2 = '1' THEN 'R' WHEN H.PFP_PANRETRD = '1' THEN 'R' WHEN H.PFP_PANRETR1 = '1' THEN 'R' WHEN H.PFP_PANRETB = '1' THEN 'B' WHEN H.PFP_PANRETA = '1' THEN 'A' ELSE '' END PFP_PANRET1, CASE WHEN A.EEA_SEX_CD IS NULL";
		sql += " OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) END EEA_SEX_NM, CASE WHEN A.EEA_SPCL_CD IS NULL";
		sql += " OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END EEA_SPCL_NM, D.SBE_TPAN_NM, A.EEA_COMP_CD, C.ICY_COMP_NM, A.EEA_DEPT_NM, A.EEA_EXAM_CD, A.EEA_TEL_NO, A.EEA_MOBL_NO, A.EEA_PLCE_CD, E.SPG_PANJ_DT, E.SPG_DOCT_CD, J.PLP_JLPN_TTPN, F_DOCTOR_FIND(1,E.SPG_DOCT_CD) SPG_DOCT_NM, A.EEA_DIVI_NO, A.EEA_STOMA_CD, A.EEA_COLON_CD, A.EEA_LIVER_CD, A.EEA_BAST_CD, A.EEA_UTER_CD, K.ECS_RSLT_KD, L.ECC_RSLT_KD, M.ECL_RSLT_KD, N.ECB_RSLT_KD, O.ECV_RSLT_KD, A.EEA_LUNG_CD, A.EEA_HLTH_KD, P.ECG_RSLT_KD";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO";

		if(!MSKPSNLID.equals("")) {
			sql += " AND B.ICR_PENL_ID = '" + MSKPSNLID + "'";
		}

		sql += " LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN ST_BASE D";
		sql += " ON A.EEA_EXAM_DT = D.SBE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.SBE_EXAM_SQ";
		sql += " AND D.SBE_PANJ_YN = 'Y' LEFT OUTER JOIN ST_PANJUNG E";
		sql += " ON A.EEA_EXAM_DT = E.SPG_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = E.SPG_EXAM_SQ LEFT OUTER JOIN PT_FIR_PANJUNG H";
		sql += " ON A.EEA_EXAM_DT = H.PFP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = H.PFP_EXAM_SQ LEFT OUTER JOIN PT_SED_PANJUNG I";
		sql += " ON A.EEA_EXAM_DT = I.PSP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = I.PSP_EXAM_SQ LEFT OUTER JOIN CT_SP_MATTER F";
		sql += " ON E.SPG_MATT_CD = F.CSM_MATT_CD LEFT OUTER JOIN ST_ADVICE G";
		sql += " ON A.EEA_EXAM_DT = G.SAE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = G.SAE_EXAM_SQ";
		sql += " AND G.SAE_EXAM_CHA = '' LEFT OUTER JOIN PT_LABOR_PANJUNG J";
		sql += " ON A.EEA_EXAM_DT = J.PLP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = J.PLP_EXAM_SQ LEFT OUTER JOIN ET_CANCER_STMC K";
		sql += " ON A.EEA_EXAM_DT = K.ECS_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = K.ECS_EXAM_SQ LEFT OUTER JOIN ET_CANCER_COLO L";
		sql += " ON A.EEA_EXAM_DT = L.ECC_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = L.ECC_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LIVER M";
		sql += " ON A.EEA_EXAM_DT = M.ECL_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = M.ECL_EXAM_SQ LEFT OUTER JOIN ET_CANCER_BRST N";
		sql += " ON A.EEA_EXAM_DT = N.ECB_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = N.ECB_EXAM_SQ LEFT OUTER JOIN ET_CANCER_CRVC O";
		sql += " ON A.EEA_EXAM_DT = O.ECV_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = O.ECV_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LUNG P";
		sql += " ON A.EEA_EXAM_DT = P.ECG_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = P.ECG_EXAM_SQ";
		sql += " WHERE 0=0";
		sql += " AND SUBSTR(EEA_EXAM_CD,1,2) <> '31'";

		if(RZCHECKBOX1.equals("0")) {
			if(RZCOMBOBOX1.equals("1")) {
				sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '2'";
			}
			else if(RZCOMBOBOX1.equals("2")) {
				sql += " AND ((SUBSTR(A.EEA_MNGT_HTYR,1,4) = '" + SEDT_YEAR + "')";
				sql += " OR (NVL(A.EEA_STOMA_CD,'0') <> '0')";
				sql += " OR (NVL(A.EEA_COLON_CD,'0') <> '0')";
				sql += " OR (NVL(A.EEA_LIVER_CD,'0') <> '0')";
				sql += " OR (NVL(A.EEA_BAST_CD,'0') <> '0')";
				sql += " OR (NVL(A.EEA_LUNG_CD,'0') <> '0')";
				sql += " OR (NVL(A.EEA_UTER_CD,'0') <> '0'))";
			}
			else if(RZCOMBOBOX1.equals("3")) {
				sql += " AND ((SUBSTR(A.EEA_MNGT_SPYM,1,4) = '" + SEDT_YEAR + "')";
				sql += " OR (NVL(A.EEA_STOMA_CD,'0') <> '0')";
				sql += " OR (NVL(A.EEA_COLON_CD,'0') <> '0')";
				sql += " OR (NVL(A.EEA_LIVER_CD,'0') <> '0')";
				sql += " OR (NVL(A.EEA_BAST_CD,'0') <> '0')";
				sql += " OR (NVL(A.EEA_UTER_CD,'0') <> '0')";
				sql += " OR (NVL(A.EEA_LUNG_CD,'0') <> '0')";
				sql += " OR (SUBSTR(A.EEA_MNGT_HTYR,1,4) = '" + SEDT_YEAR + "'))";
			}
			else if(RZCOMBOBOX1.equals("4")) {
				sql += " AND ((SUBSTR(A.EEA_MNGT_SPYM,1,4) = '" + SEDT_YEAR + "')";
				sql += " OR (SUBSTR(A.EEA_MNGT_HTYR,1,4) = '" + SEDT_YEAR + "'))";

				if(CMBBOX_PANJ.equals("0")) {
					sql += " AND ((E.SPG_PANJ_CD IN ('4','5','6','7','9','A','B')";
					sql += " OR (J.PLP_JLPN_TTPN <> 'A'";
					sql += " AND NVL(J.PLP_JLPN_TTPN, ' ') <> ' '";
					sql += " AND J.PLP_JLPN_TTPN IS NOT NULL)))";
				}
				else if(CMBBOX_PANJ.equals("1")) {
					sql += " AND ((E.SPG_PANJ_CD IN ('4','5','6','7','A','B'))";
					sql += " OR (J.PLP_JLPN_TTPN <> 'A'";
					sql += " AND NVL(J.PLP_JLPN_TTPN, ' ') <> ' '";
					sql += " AND J.PLP_JLPN_TTPN IS NOT NULL)))";
				}
				else if(CMBBOX_PANJ.equals("C")) {
					sql += " AND ((E.SPG_PANJ_CD IN ('4','5','A'))";
					sql += " OR (J.PLP_JLPN_TTPN <> 'A'";
					sql += " AND NVL(J.PLP_JLPN_TTPN, ' ') <> ' '";
					sql += " AND J.PLP_JLPN_TTPN IS NOT NULL)))";
				}
				else if(CMBBOX_PANJ.equals("D")) {
					sql += " AND ((E.SPG_PANJ_CD IN ('6','7','B'))";
					sql += " OR (J.PLP_JLPN_TTPN <> 'A'";
					sql += " AND NVL(J.PLP_JLPN_TTPN, ' ') <> ' '";
					sql += " AND J.PLP_JLPN_TTPN IS NOT NULL)))";
				}
				else {
					sql += " AND ((E.SPG_PANJ_CD = '" + CMBBOX_PANJ + "')";
					sql += " OR (J.PLP_JLPN_TTPN <> 'A'";
					sql += " AND NVL(J.PLP_JLPN_TTPN, ' ') <> ' '";
					sql += " AND J.PLP_JLPN_TTPN IS NOT NULL)))";
				}
			}
			else if(RZCOMBOBOX1.equals("5")) {
				sql += " AND SUBSTR(EEA_EXAM_CD,1,1) = '9'";
			}

			if(CMBSP_CHA_ENABLED.equals("1") && CMBSP_CHA.equals("0")) {
				sql += " AND ((A.EEA_EXAM_CD = '41001'";
				sql += " OR A.EEA_EXAM_CD = '42001'";
				sql += " OR A.EEA_SPSB_YN = 'Y')";
				sql += " OR (A.EEA_EXAM_CD IN ('11001', '12001', '12003')";
				sql += " OR A.EEA_HTSB_CD IN ('11001', '12001', '12003')))";
			}
			else if(CMBSP_CHA_ENABLED.equals("1") && CMBSP_CHA.equals("1")) {
				sql += " AND ((A.EEA_EXAM_CD = '41001'";
				sql += " OR A.EEA_SPSB_YN = 'Y')";
				sql += " OR (A.EEA_EXAM_CD IN ('11001', '12001', '12003')";
				sql += " OR A.EEA_HTSB_CD IN ('11001', '12001', '12003')))";
			}
			else if(CMBSP_CHA_ENABLED.equals("1") && CMBSP_CHA.equals("2")) {
				sql += " AND ((A.EEA_EXAM_CD = '42001')";
				sql += " OR (A.EEA_EXAM_CD IN ('11001', '12001', '12003')";
				sql += " OR A.EEA_HTSB_CD IN ('11001', '12001', '12003')))";
			}

			sql += " AND A.EEA_EXAM_DT >= '" + DTEDTEXAM_SDT + "'";
			sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEXAM_EDT + "'";
		}

		if(RZCHECKBOX1.equals("1")) {
			sql += " AND A.EEA_EXAM_DT >= '" + MS_YEAR + "' || '0101'";
			sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEXAM_EDT + "'";
		}

		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(!CMBSP_GUBN.equals("00") && CMBSP_GUBN_ENABLED.equals("1")) {
			sql += " AND A.EEA_SPCL_CD = '" + CMBSP_GUBN + "'";
		}

		if(!MSKEDTCOMP_CD1.equals("")) {
			if(CHKBOXMAIN.equals("1")) {
				sql += " AND A.EEA_COMP_CD IN '" + MSKEDTCOMP_CD2 + "'";
			}
			else {
				sql += " AND A.EEA_COMP_CD = '" + MSKEDTCOMP_CD2 + "'";
			}
		}

		if(!EDTEEA_CHART_NO.equals("")) {
			sql += " AND A.EEA_CHART_NO = '" + EDTEEA_CHART_NO + "'";
		}
		
		if(!EDTPSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%' || '" + EDTPSNL_NM + "' || '%'";
		}
		
		if(!CMBBOXPLCE_CD.equals("0")) {
			sql += " AND SUBSTR(A.EEA_PLCE_CD,1,1) = '" + CMBBOXPLCE_CD + "'";
		}
		
		if(!CMBADVICE_CD.equals("0")) {
			sql += " AND G.SAE_ADVI_CD = '" + CMBADVICE_CD + "'";
		}
		
		if(CMBADVICE_YN.equals("1")) {
			sql += " AND G.SAE_ADVI_CD IS NOT NULL";
		}
		else if(CMBADVICE_YN.equals("2")) {
			sql += " AND G.SAE_ADVI_CD IS NULL;";
		}

		if(CMBBOXSORT.equals("0")) {
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_COMP_CD";
		}
		else if(CMBBOXSORT.equals("1")) {
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_COMP_CD, A.EEA_DEPT_NM, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("2")) {
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_COMP_CD, EEA_PSNL_ID";
		}
		else if(CMBBOXSORT.equals("3")) {
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_COMP_CD, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("4")) {
			sql += " ORDER BY EEA_PSNL_ID";
		}
		else if(CMBBOXSORT.equals("5")) {
			sql += " ORDER BY A.EEA_PSNL_NM";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPostManagement_NEWCustList_UF_SqlSet_001 \n";
			G_INFO += "설명 : 검사 결과정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " G_ENCRT_KD : " + G_ENCRT_KD + " \n";
			G_INFO += " MSKPSNLID : " + MSKPSNLID + " \n";
			G_INFO += " RZCHECKBOX1 : " + RZCHECKBOX1 + " \n";
			G_INFO += " RZCOMBOBOX1 : " + RZCOMBOBOX1 + " \n";
			G_INFO += " SEDT_YEAR : " + SEDT_YEAR + " \n";
			G_INFO += " CMBBOX_PANJ : " + CMBBOX_PANJ + " \n";
			G_INFO += " CMBSP_CHA_ENABLED : " + CMBSP_CHA_ENABLED + " \n";
			G_INFO += " CMBSP_CHA : " + CMBSP_CHA + " \n";
			G_INFO += " DTEDTEXAM_SDT : " + DTEDTEXAM_SDT + " \n";
			G_INFO += " DTEDTEXAM_EDT : " + DTEDTEXAM_EDT + " \n";
			G_INFO += " MS_YEAR : " + MS_YEAR + " \n";
			G_INFO += " CMBSP_GUBN : " + CMBSP_GUBN + " \n";
			G_INFO += " CMBSP_GUBN_ENABLED : " + CMBSP_GUBN_ENABLED + " \n";
			G_INFO += " MSKEDTCOMP_CD1 : " + MSKEDTCOMP_CD1 + " \n";
			G_INFO += " CHKBOXMAIN : " + CHKBOXMAIN + " \n";
			G_INFO += " MSKEDTCOMP_CD2 : " + MSKEDTCOMP_CD2 + " \n";
			G_INFO += " EDTEEA_CHART_NO : " + EDTEEA_CHART_NO + " \n";
			G_INFO += " EDTPSNL_NM : " + EDTPSNL_NM + " \n";
			G_INFO += " CMBBOXPLCE_CD : " + CMBBOXPLCE_CD + " \n";
			G_INFO += " CMBADVICE_CD : " + CMBADVICE_CD + " \n";
			G_INFO += " CMBADVICE_YN : " + CMBADVICE_YN + " \n";
			G_INFO += " CMBBOXSORT : " + CMBBOXSORT + " \n";
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
		<s:AttributeType name='EEA_PSNL_ID' rs:number='1' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='2' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='3' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='4' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='5' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='6' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_CD' rs:number='7' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_HTSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ET_PSNL_MEMO' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_CD' rs:number='9' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_SPSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='10' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='11' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='12' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_SPYM' rs:number='13' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_MNGT_SPYM'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_PANRET1' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_NM' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_NM' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TPAN_NM' rs:number='17' rs:nullable='true' rs:basetable='ST_BASE' rs:basecolumn='SBE_TPAN_NM'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='18' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='19' rs:nullable='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='20' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='c20' rs:name='EEA_EXAM_CD' rs:number='21' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEL_NO' rs:number='22' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='23' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='24' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_DT' rs:number='25' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_PANJ_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_DOCT_CD' rs:number='26' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_TTPN' rs:number='27' rs:nullable='true' rs:basetable='PT_LABOR_PANJUNG' rs:basecolumn='PLP_JLPN_TTPN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_DOCT_NM' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='29' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_CD' rs:number='30' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_STOMA_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_CD' rs:number='31' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_COLON_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_CD' rs:number='32' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_LIVER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_CD' rs:number='33' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_BAST_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_CD' rs:number='34' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_UTER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_RSLT_KD' rs:number='35' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_RSLT_KD' rs:number='36' rs:nullable='true' rs:basetable='ET_CANCER_COLO' rs:basecolumn='ECC_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_RSLT_KD' rs:number='37' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_RSLT_KD' rs:number='38' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RSLT_KD' rs:number='39' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_CD' rs:number='40' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_LUNG_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTH_KD' rs:number='41' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_RSLT_KD' rs:number='42' rs:nullable='true' rs:basetable='ET_CANCER_LUNG' rs:basecolumn='ECG_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
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
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_HTSB_CD_T = cRsList.getString("EEA_HTSB_CD");
			String ET_PSNL_MEMO_T = cRsList.getString("ET_PSNL_MEMO");
			String EEA_SPSB_CD_T = cRsList.getString("EEA_SPSB_CD");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String EEA_MNGT_SPYM_T = cRsList.getString("EEA_MNGT_SPYM");
			String PFP_PANRET1_T = cRsList.getString("PFP_PANRET1");
			String EEA_SEX_NM_T = cRsList.getString("EEA_SEX_NM");
			String EEA_SPCL_NM_T = cRsList.getString("EEA_SPCL_NM");
			String SBE_TPAN_NM_T = cRsList.getString("SBE_TPAN_NM");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String c20_T = cRsList.getString("c20");
			String EEA_TEL_NO_T = cRsList.getString("EEA_TEL_NO");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String SPG_PANJ_DT_T = cRsList.getString("SPG_PANJ_DT");
			String SPG_DOCT_CD_T = cRsList.getString("SPG_DOCT_CD");
			String PLP_JLPN_TTPN_T = cRsList.getString("PLP_JLPN_TTPN");
			String SPG_DOCT_NM_T = cRsList.getString("SPG_DOCT_NM");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_STOMA_CD_T = cRsList.getString("EEA_STOMA_CD");
			String EEA_COLON_CD_T = cRsList.getString("EEA_COLON_CD");
			String EEA_LIVER_CD_T = cRsList.getString("EEA_LIVER_CD");
			String EEA_BAST_CD_T = cRsList.getString("EEA_BAST_CD");
			String EEA_UTER_CD_T = cRsList.getString("EEA_UTER_CD");
			String ECS_RSLT_KD_T = cRsList.getString("ECS_RSLT_KD");
			String ECC_RSLT_KD_T = cRsList.getString("ECC_RSLT_KD");
			String ECL_RSLT_KD_T = cRsList.getString("ECL_RSLT_KD");
			String ECB_RSLT_KD_T = cRsList.getString("ECB_RSLT_KD");
			String ECV_RSLT_KD_T = cRsList.getString("ECV_RSLT_KD");
			String EEA_LUNG_CD_T = cRsList.getString("EEA_LUNG_CD");
			String EEA_HLTH_KD_T = cRsList.getString("EEA_HLTH_KD");
			String ECG_RSLT_KD_T = cRsList.getString("ECG_RSLT_KD");
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

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! EEA_HTSB_CD_T.equals("")) {
%>
		 		EEA_HTSB_CD='<%= EEA_HTSB_CD_T%>'
<%
			}

			if(! ET_PSNL_MEMO_T.equals("")) {
%>
		 		ET_PSNL_MEMO='<%= ET_PSNL_MEMO_T%>'
<%
			}

			if(! EEA_SPSB_CD_T.equals("")) {
%>
		 		EEA_SPSB_CD='<%= EEA_SPSB_CD_T%>'
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

			if(! PFP_PANRET1_T.equals("")) {
%>
		 		PFP_PANRET1='<%= PFP_PANRET1_T%>'
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

			if(! SBE_TPAN_NM_T.equals("")) {
%>
		 		SBE_TPAN_NM='<%= SBE_TPAN_NM_T%>'
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

			if(! c20_T.equals("")) {
%>
		 		c20='<%= c20_T%>'
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

			if(! PLP_JLPN_TTPN_T.equals("")) {
%>
		 		PLP_JLPN_TTPN='<%= PLP_JLPN_TTPN_T%>'
<%
			}

			if(! SPG_DOCT_NM_T.equals("")) {
%>
		 		SPG_DOCT_NM='<%= SPG_DOCT_NM_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! EEA_STOMA_CD_T.equals("")) {
%>
		 		EEA_STOMA_CD='<%= EEA_STOMA_CD_T%>'
<%
			}

			if(! EEA_COLON_CD_T.equals("")) {
%>
		 		EEA_COLON_CD='<%= EEA_COLON_CD_T%>'
<%
			}

			if(! EEA_LIVER_CD_T.equals("")) {
%>
		 		EEA_LIVER_CD='<%= EEA_LIVER_CD_T%>'
<%
			}

			if(! EEA_BAST_CD_T.equals("")) {
%>
		 		EEA_BAST_CD='<%= EEA_BAST_CD_T%>'
<%
			}

			if(! EEA_UTER_CD_T.equals("")) {
%>
		 		EEA_UTER_CD='<%= EEA_UTER_CD_T%>'
<%
			}

			if(! ECS_RSLT_KD_T.equals("")) {
%>
		 		ECS_RSLT_KD='<%= ECS_RSLT_KD_T%>'
<%
			}

			if(! ECC_RSLT_KD_T.equals("")) {
%>
		 		ECC_RSLT_KD='<%= ECC_RSLT_KD_T%>'
<%
			}

			if(! ECL_RSLT_KD_T.equals("")) {
%>
		 		ECL_RSLT_KD='<%= ECL_RSLT_KD_T%>'
<%
			}

			if(! ECB_RSLT_KD_T.equals("")) {
%>
		 		ECB_RSLT_KD='<%= ECB_RSLT_KD_T%>'
<%
			}

			if(! ECV_RSLT_KD_T.equals("")) {
%>
		 		ECV_RSLT_KD='<%= ECV_RSLT_KD_T%>'
<%
			}

			if(! EEA_LUNG_CD_T.equals("")) {
%>
		 		EEA_LUNG_CD='<%= EEA_LUNG_CD_T%>'
<%
			}

			if(! EEA_HLTH_KD_T.equals("")) {
%>
		 		EEA_HLTH_KD='<%= EEA_HLTH_KD_T%>'
<%
			}

			if(! ECG_RSLT_KD_T.equals("")) {
%>
		 		ECG_RSLT_KD='<%= ECG_RSLT_KD_T%>'
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
