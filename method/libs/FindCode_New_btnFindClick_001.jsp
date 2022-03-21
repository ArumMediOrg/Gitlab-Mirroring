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

		String COLUMN1 = htMethod.get("COLUMN1");
		String COLUMN2 = htMethod.get("COLUMN2");
		String COLUMN3 = htMethod.get("COLUMN3");
		String TBL_NAME = htMethod.get("TBL_NAME");
		String EDCODE_NM = htMethod.get("EDCODE_NM");
		String SEARCH_CD = htMethod.get("SEARCH_CD");
		String GUBUN = htMethod.get("GUBUN");
		String SMALL_CD = htMethod.get("SMALL_CD");
		String RBCODE = htMethod.get("RBCODE");

		//
		if(COLUMN1 == null) { COLUMN1 = ""; }
		if(COLUMN2 == null) { COLUMN2 = ""; }
		if(COLUMN3 == null) { COLUMN3 = ""; }
		if(TBL_NAME == null) { TBL_NAME = ""; }
		if(EDCODE_NM == null) { EDCODE_NM = ""; }
		if(SEARCH_CD == null) { SEARCH_CD = ""; }
		if(GUBUN == null) { GUBUN = ""; }
		if(SMALL_CD == null) { SMALL_CD = ""; }
		if(RBCODE == null) { RBCODE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select * from ( 
    if (:column1 <> '') then
      select :column1 ccn_small, :column2 CCN_NAME, :column3 CCN_VALUE
                from :tbl_Name
                 where :column2|| 'like %'||:edCode_Nm||'%'
    else if (:Search_Cd = 'DOCTOR') then
      select IAU_EMP_NO ccn_small, :column2 CCN_NAME, :column3 CCN_VALUE 
                  from :tbl_Name
                 where :column2 like '%'||:edCode_Nm||'%' AND IAU_LICEN1_CD in( '11','12') AND IAU_USE_YN='Y' 
                 order by IAU_EMP_NO  
    else if (:Search_Cd = '0801') then
       select CCN_SMALL, 
                 case WHEN CCN_SMALL = '999' THEN CCN_FULL_NM 
                      else (GetCOMMON_LvCdToNm(ccn_large,SUBSTR(CCN_SMALL,1,2),'1',2) || ':' || CCN_FULL_NM) END CCN_NAME, '' ccn_value  
                  from :tbl_Name
                 where ccn_large = :Search_Cd
                   AND CCN_FULL_NM like '%' || :edCode_Nm || '%'
                   and ccn_level = '5' 
                   and upper(nvl(ccn_use_yn, 'Y')) = 'Y'
    else if (:Search_Cd = 'comp') or (:Search_Cd = '사업장') then
      select icy_comp_cd CCN_SMALL, icy_comp_nm CCN_NAME, '' ccn_value 
                     , ICY_USE_YN AS CCN_USE_YN '
                  from :tbl_Name
                 where icy_comp_nm like '%'||edCode_Nm.Text||'%'
    else if (:Search_Cd = 'comp2') then // 미사용 제외
      select icy_comp_cd CCN_SMALL, icy_comp_nm CCN_NAME, '' ccn_value 
                  from :tbl_Name
                 where icy_comp_nm like '%'||edCode_Nm||'%'
                   and upper(nvl(icy_use_yn, 'Y')) = 'Y'
    else if  (:Search_Cd = '학교') then
      select icy_comp_cd CCN_SMALL, icy_comp_nm CCN_NAME, '' ccn_value 
                  from :tbl_Name
                 where icy_comp_nm like '%'||:edCode_Nm||'%'
                   and (SUBSTR(icy_cokd_cd, 1, 2) = '05' 
                    or  icy_comp_nm like '%학교%')
    else if (:Search_Cd = '사업장부서') then
      select icy_comp_cd CCN_SMALL, icy_comp_nm CCN_NAME, '' ccn_value 
                  from  :tbl_Name
                 where icy_comp_nm like '%'||:edCode_Nm||'%'
                   and ICY_DEPT_CD = '1'
    else if (:Search_Cd = '취급물질') then
      select CSM_MATT_CD CCN_SMALL, (CSM_PERIOD_TM || '|' || CSM_MATT_NM) CCN_NAME, '' ccn_value 
                  from :tbl_Name
                 where CSM_MATT_NM like '%' || :edCode_Nm || '%'
                 and CSM_USE_YN = 'Y'
    else if (:Search_Cd = '00') then
      select CSM_LARGE CCN_SMALL, CSM_MATT_NM CCN_NAME, '' ccn_value 
                 from :tbl_Name
                 WHERE CSM_MATT_CD = :Search_Cd
                   AND CSM_MATT_NM like '%' || :edCode_Nm || '%'
    else if (SUBSTR(:Search_Cd,1,2) = 'HM') then
    begin
      if :Gubun = 'SpPan' then 
      begin
        select Ct1.CSC_SMALL CCN_SMALL, Ct1.CSC_FULL_NM CCN_NAME, '' ccn_value, Ct2.CSC_FULL_NM 
                    FROM :tbl_Name || ' Ct1 '
                  inner join CT_SP_COMMON Ct2 On Ct2.CSC_SMALL = Ct1.CSC_ETC1_CD And Ct2.CSC_LARGE ='HM05E'
                   WHERE Ct1.CSC_LARGE = :Search_Cd 
                     AND (Ct1.CSC_FULL_NM  like '%' || :edCode_Nm || '%' OR Ct1.CSC_SMALL like '%' || :edCode_Nm || '% ) 
                     AND Ct1.CSC_LEVEL = '5'
                     AND Ct1.CSC_USE_YN = 'Y'
                     AND Ct1.CSC_SMALL Not Like '%N%'
      end else
      if  :Gubun = 'SpNight' then 
      begin
        select Ct1.CSC_SMALL CCN_SMALL, Ct1.CSC_FULL_NM CCN_NAME, '' ccn_value, Ct2.CSC_FULL_NM 
                    FROM :tbl_Name Ct1
                  inner join CT_SP_COMMON Ct2 On Ct2.CSC_SMALL = Ct1.CSC_ETC1_CD And Ct2.CSC_LARGE ='HM05E'
                   WHERE Ct1.CSC_LARGE = :Search_Cd
                     AND (Ct1.CSC_FULL_NM  like '%' || :edCode_Nm || '%' OR Ct1.CSC_SMALL like '%' || :edCode_Nm || '%' ) 
                     AND Ct1.CSC_LEVEL = '5'
                     AND Ct1.CSC_USE_YN = 'Y'
                     AND Ct1.CSC_SMALL like '%N%'
      end else
      begin
        select CSC_SMALL CCN_SMALL, CSC_FULL_NM CCN_NAME, '' ccn_value, CSC_CODE_GR 
                    FROM :tbl_Name
                   WHERE CSC_LARGE = :Search_Cd
                     AND CSC_FULL_NM like '%' || :edCode_Nm || '%'
                     AND CSC_LEVEL = '5' 
                     AND CSC_USE_YN = 'Y'
      end;
    end
    else if (:Search_Cd = '0401') then
      select CCN_SMALL CCN_SMALL, CCN_FULL_NM CCN_NAME, '' ccn_value 
                  FROM :tbl_Name
                 WHERE CCN_LARGE = :Search_Cd
                   AND CCN_FULL_NM like '%' || :edCode_Nm || '%'
                   AND CCN_LEVEL = '2'
                   AND CCN_USE_YN = 'Y' 
    else if (:Search_Cd = '표적유형') then
      select DISTINCT CSP_JJ_CD CCN_SMALL, CSP_JJ_NM CCN_NAME, '' ccn_value 
                  FROM :tbl_Name
                 WHERE CSP_JJ_NM like '%' || :edCode_Nm || '%'
    else if (:Search_Cd = '검사항목') then
      select IIM_SBCD_CD CCN_SMALL, IIM_KNME_NM CCN_NAME, '' ccn_value 
                  from :tbl_Name
                 WHERE IIM_SBCD_CD <> ''
                   AND IIM_KNME_NM like '%' || :edCode_Nm || '%'
                   AND upper(iim_use_yn) = 'Y'
    else if (:Search_Cd = '영업사원') then
      select IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, '' ccn_value 
                  from :tbl_Name
                 WHERE IAU_PENL_NM like '%' || :edCode_Nm || '%'
                   AND upper(iau_use_yn) = 'Y' 
    else if (:Search_Cd = '담당사원') then
      select IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, '' ccn_value 
                  from :tbl_Name
                  WHERE IAU_PENL_NM like '%' || :edCode_Nm || '%'
                   AND upper(iau_use_yn) = 'Y' 
    else if (:Search_Cd = '의사') then
      select IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, '' ccn_value 
                  from :tbl_Name
                  WHERE IAU_PENL_NM like '%' || :edCode_Nm || '%'
                   AND (IAU_LICEN1_CD IN ('11','12') OR IAU_LICEN2_CD IN ('11','12')) 
                   AND upper(iau_use_yn) = 'Y'
    else if (:Search_Cd = '과의사') then
      select IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, '' ccn_value 
                  from :tbl_Name
                  WHERE IAU_PENL_NM like '%' || :edCode_Nm || '%'
                   AND  IAU_DEPT_CD = :column2
                   AND (IAU_LICEN1_CD IN ('11','12') OR IAU_LICEN2_CD IN ('11','12')) '
    else if (:Search_Cd = '간호사') then
      select IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, '' ccn_value 
                  from :tbl_Name
                  WHERE IAU_PENL_NM like '%' || :edCode_Nm || '%'
                   AND (IAU_LICEN1_CD = '21' OR IAU_LICEN2_CD = '21')
    else if (:Search_Cd = '검사실구분') then
      select CCN_SMALL, CCN_FULL_NM CCN_NAME, '' ccn_value 
                  FROM :tbl_Name
                 WHERE CCN_LARGE = :Search_Cd
                   AND SUBSTR(CCN_SMALL,1,2) = '03'
                   AND CCN_LEVEL = '5'
                   AND CCN_FULL_NM like '%' || :edCode_Nm || '%'
                   and UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'
    else if (:tbl_Name = 'BT_ESTIMATE') then
      SELECT A.BEE_ESTI_CD CCN_SMALL, 
                       CASE WHEN BEE_COMP_CD IS NULL OR BEE_COMP_CD = '' THEN BEE_ESTI_NM  
                            else '[' || BEE_COMP_CD || ':' || F_COMP_FIND(BEE_COMP_CD) || ']' || BEE_ESTI_NM END CCN_NAME, '' ccn_value 
                  FROM BT_ESTIMATE A INNER JOIN IT_COMPANY B ON A.BEE_COMP_CD = B.ICY_COMP_CD 
                 WHERE A.BEE_MNGT_YR = :Search_Cd
                   AND BEE_ESTI_NM like '%' || :edCode_Nm || '%'
                   and UPPER(NVL(A.BEE_USE_YN, 'Y')) = 'Y' 
    else if (:Search_Cd = '과거병력') then
      select CKD_KCD_CD CCN_SMALL, CKD_KNME_NM CCN_NAME, '' ccn_value 
                  FROM :tbl_Name
                 WHERE (CKD_KNME_NM like '%' || :edCode_Nm || '%' OR CKD_KCD_CD like '%' || :edCode_Nm || '%')
                   AND CKD_LEVL_KD IN ('3','4') 
                   AND UPPER(NVL(CKD_SYMP_YN, 'Y')) = 'Y'
    else if (:Search_Cd = '구강검진') then
      select CCP_GUBN_CD, CCP_MACH_CD ccn_small, CCP_SOKUN_TX CCN_NAME, '' CCN_VALUE
                  FROM :tbl_Name
                 WHERE CCP_MACH_NM like '%' || :edCode_Nm || '%'
                   AND CCP_MACH_CD = :small_cd
                   AND UPPER(NVL(CCP_USE_YN, 'Y')) = 'Y'
    else if (:Search_Cd = '질병분류') then
      select CKD_KSCD_CD CCN_SMALL, GetKSCD_cdToNm(CKD_KSCD_CD,CKD_SUKN_CD) CCN_NAME, CKD_SNME_NM CCN_VALUE 
                  FROM :tbl_Name
                 WHERE (CKD_KNME_NM like '%' || :edCode_Nm || '%' OR CKD_SNME_NM like '%' || :edCode_Nm || '%')                 
                   AND CKD_LEVL_KD = '4'
    else if (:Search_Cd = '0805') then
        select CCN_SMALL, CCN_FULL_NM CCN_NAME, CCN_VALUE 
                    FROM :tbl_Name
                   WHERE CCN_LARGE = :Search_Cd
                     AND CCN_LEVEL = '5' 
                     AND CCN_FULL_NM like '%' || :edCode_Nm || '%'
                     and UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'
    else
    begin
      if (:small_cd = '') then
        select CCN_SMALL, CCN_FULL_NM CCN_NAME, CCN_VALUE 
                    FROM :tbl_Name
                   WHERE CCN_LARGE = :Search_Cd
                     AND CCN_LEVEL = '5' 
                     AND CCN_FULL_NM like '%' || :edCode_Nm || '%'
                     and UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'
      else
        select CCN_SMALL, CCN_FULL_NM CCN_NAME, CCN_VALUE 
                    FROM :tbl_Name
                   WHERE CCN_LARGE = :Search_Cd
                     AND CCN_SMALL like small_cd || '%'
                     AND CCN_LEVEL = '5'
                     AND CCN_FULL_NM like '%' || :edCode_Nm || '%'
                     and UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'
    end;
) a
if (SUBSTR(Search_Cd,1,2) = 'HM') then
begin
  if :Gubun = 'SpPan' then  
     ORDER BY (CASE WHEN SUBSTR(a.CCN_SMALL,1,1) = 'S' Then 'A001' End) Desc 
  else if  :Gubun = 'SpNight' then 
     ORDER BY a.CSC_CODE_GR, a.CCN_SMALL 
  else
     ORDER BY a.CSC_CODE_GR, a.CCN_SMALL 
end
else if (rbCode = 'Y') then
   order by a.ccn_small 
else
   order by a.ccn_name 
		*/

		sql = " SELECT *";
		sql += " FROM (";

		if(! COLUMN1.equals("")) {

			sql += " SELECT '" + COLUMN1 + "' CCN_SMALL, '" + COLUMN2 + "' CCN_NAME, '" + COLUMN3 + "' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE " + COLUMN2 + " LIKE '%" + EDCODE_NM + "%'";
		} else if(SEARCH_CD.equals("DOCTOR")) {
		
			sql += " SELECT IAU_EMP_NO CCN_SMALL, '" + COLUMN2 + "' CCN_NAME, '" + COLUMN3 + "' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE " + COLUMN2 + " LIKE '%" + EDCODE_NM + "%'";
			sql += " AND IAU_LICEN1_CD IN( '11','12')";
			sql += " AND IAU_USE_YN='Y'";
			sql += " ORDER BY IAU_EMP_NO";
		} else if(SEARCH_CD.equals("0801")) {

			sql += " SELECT CCN_SMALL, CASE WHEN CCN_SMALL = '999' THEN CCN_FULL_NM ELSE (GETCOMMON_LVCDTONM(CCN_LARGE,SUBSTR(CCN_SMALL,1,2),'1',2) || ':' || CCN_FULL_NM) END CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CCN_LARGE = '" + SEARCH_CD + "'";
			sql += " AND CCN_FULL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND CCN_LEVEL = '5'";
			sql += " AND UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'";
		} else if(SEARCH_CD.equals("comp") || SEARCH_CD.equals("사업장")) {

			sql += " SELECT ICY_COMP_CD CCN_SMALL, ICY_COMP_NM CCN_NAME, '' CCN_VALUE , ICY_USE_YN AS CCN_USE_YN '";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE ICY_COMP_NM LIKE '%" + EDCODE_NM + "%'";
		} else if(SEARCH_CD.equals("comp2")) {	// 미사용 제외

			sql += " SELECT ICY_COMP_CD CCN_SMALL, ICY_COMP_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE ICY_COMP_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(NVL(ICY_USE_YN, 'Y')) = 'Y'";

		} else if(SEARCH_CD.equals("학교")) {

			sql += " SELECT ICY_COMP_CD CCN_SMALL, ICY_COMP_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE ICY_COMP_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND (SUBSTR(ICY_COKD_CD, 1, 2) = '05'";
			sql += " OR ICY_COMP_NM LIKE '%학교%')";
		} else if(SEARCH_CD.equals("사업장부서")) {

			sql += " SELECT ICY_COMP_CD CCN_SMALL, ICY_COMP_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE ICY_COMP_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND ICY_DEPT_CD = '1'";
		} else if(SEARCH_CD.equals("취급물질")) {

			sql += " SELECT CSM_MATT_CD CCN_SMALL, (CSM_PERIOD_TM || '|' || CSM_MATT_NM) CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CSM_MATT_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND CSM_USE_YN = 'Y'";
		} else if(SEARCH_CD.equals("00")) {

			sql += " SELECT CSM_LARGE CCN_SMALL, CSM_MATT_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CSM_MATT_CD = '" + SEARCH_CD + "'";
			sql += " AND CSM_MATT_NM LIKE '%" + EDCODE_NM + "%'";
		} else if(SEARCH_CD.substring(1, 2).equals("HM")) {

			if(GUBUN.equals("SpPan")) {
			
				sql += " SELECT CT1.CSC_SMALL CCN_SMALL, CT1.CSC_FULL_NM CCN_NAME, '' CCN_VALUE, CT2.CSC_FULL_NM";
				sql += " FROM " + TBL_NAME + " || ' CT1 ' INNER JOIN CT_SP_COMMON CT2";
				sql += " ON CT2.CSC_SMALL = CT1.CSC_ETC1_CD";
				sql += " AND CT2.CSC_LARGE ='HM05E'";
				sql += " WHERE CT1.CSC_LARGE = '" + SEARCH_CD + "'";
				sql += " AND (";
				sql += "	CT1.CSC_FULL_NM LIKE '%" + EDCODE_NM + "%'";
				sql += " 	OR CT1.CSC_SMALL LIKE '%" + EDCODE_NM + "%'";
				sql += " )";
				sql += " AND CT1.CSC_LEVEL = '5'";
				sql += " AND CT1.CSC_USE_YN = 'Y'";
				sql += " AND CT1.CSC_SMALL NOT LIKE '%N%'";
			} else if(GUBUN.equals("SpNight")) {
			
				sql += " SELECT CT1.CSC_SMALL CCN_SMALL, CT1.CSC_FULL_NM CCN_NAME, '' CCN_VALUE, CT2.CSC_FULL_NM";
				sql += " FROM " + TBL_NAME + " CT1 INNER JOIN CT_SP_COMMON CT2";
				sql += " ON CT2.CSC_SMALL = CT1.CSC_ETC1_CD";
				sql += " AND CT2.CSC_LARGE ='HM05E'";
				sql += " WHERE CT1.CSC_LARGE = '" + SEARCH_CD + "'";
				sql += " AND (";
				sql += "	CT1.CSC_FULL_NM LIKE '%" + EDCODE_NM + "%'";
				sql += " 	OR CT1.CSC_SMALL LIKE '%" + EDCODE_NM + "%'";
				sql += " )";
				sql += " AND CT1.CSC_LEVEL = '5'";
				sql += " AND CT1.CSC_USE_YN = 'Y'";
				sql += " AND CT1.CSC_SMALL LIKE '%N%'";
			} else {
			
				sql += " SELECT CSC_SMALL CCN_SMALL, CSC_FULL_NM CCN_NAME, '' CCN_VALUE, CSC_CODE_GR";
				sql += " FROM " + TBL_NAME;
				sql += " WHERE CSC_LARGE = '" + SEARCH_CD + "'";
				sql += " AND CSC_FULL_NM LIKE '%" + EDCODE_NM + "%'";
				sql += " AND CSC_LEVEL = '5'";
				sql += " AND CSC_USE_YN = 'Y'";
			}
		} else if(SEARCH_CD.equals("0401")) {

			sql += " SELECT CCN_SMALL CCN_SMALL, CCN_FULL_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CCN_LARGE = '" + SEARCH_CD + "'";
			sql += " AND CCN_FULL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND CCN_LEVEL = '2'";
			sql += " AND CCN_USE_YN = 'Y'";
		} else if(SEARCH_CD.equals("표적유형")) {

			sql += " SELECT DISTINCT CSP_JJ_CD CCN_SMALL, CSP_JJ_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CSP_JJ_NM LIKE '%" + EDCODE_NM + "%'";
		} else if(SEARCH_CD.equals("검사항목")) {

			sql += " SELECT IIM_SBCD_CD CCN_SMALL, IIM_KNME_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE IIM_SBCD_CD <> ''";
			sql += " AND IIM_KNME_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(IIM_USE_YN) = 'Y'";
		} else if(SEARCH_CD.equals("영업사원")) {

			sql += " SELECT IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE IAU_PENL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(IAU_USE_YN) = 'Y'";
		} else if(SEARCH_CD.equals("담당사원")) {

			sql += " SELECT IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE IAU_PENL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(IAU_USE_YN) = 'Y'";
		} else if(SEARCH_CD.equals("의사")) {

			sql += " SELECT IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE IAU_PENL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND (IAU_LICEN1_CD IN ('11','12')";
			sql += " OR IAU_LICEN2_CD IN ('11','12'))";
			sql += " AND UPPER(IAU_USE_YN) = 'Y'";
		} else if(SEARCH_CD.equals("과의사")) {

			sql += " SELECT IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE IAU_PENL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND IAU_DEPT_CD = '" + COLUMN2 + "'";
			sql += " AND (";
			sql += "	IAU_LICEN1_CD IN ('11','12')";
			sql += " 	OR IAU_LICEN2_CD IN ('11','12')";
			sql += " )";
		} else if(SEARCH_CD.equals("간호사")) {

			sql += " SELECT IAU_EMP_NO CCN_SMALL, IAU_PENL_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE IAU_PENL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND (";
			sql += "	IAU_LICEN1_CD = '21'";
			sql += " 	OR IAU_LICEN2_CD = '21'";
			sql += " )";
		} else if(SEARCH_CD.equals("검사실구분")) {

			sql += " SELECT CCN_SMALL, CCN_FULL_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CCN_LARGE = '" + SEARCH_CD + "'";
			sql += " AND SUBSTR(CCN_SMALL,1,2) = '03'";
			sql += " AND CCN_LEVEL = '5'";
			sql += " AND CCN_FULL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'";
		} else if(TBL_NAME.equals("BT_ESTIMATE")) {

			sql += " SELECT A.BEE_ESTI_CD CCN_SMALL, CASE WHEN BEE_COMP_CD IS NULL";
			sql += " OR BEE_COMP_CD = '' THEN BEE_ESTI_NM ELSE '[' || BEE_COMP_CD || ':' || F_COMP_FIND(BEE_COMP_CD) || ']' || BEE_ESTI_NM END CCN_NAME, '' CCN_VALUE";
			sql += " FROM BT_ESTIMATE A INNER JOIN IT_COMPANY B";
			sql += " ON A.BEE_COMP_CD = B.ICY_COMP_CD";
			sql += " WHERE A.BEE_MNGT_YR = '" + SEARCH_CD + "'";
			sql += " AND BEE_ESTI_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(NVL(A.BEE_USE_YN, 'Y')) = 'Y'";
		} else if(SEARCH_CD.equals("과거병력")) {

			sql += " SELECT CKD_KCD_CD CCN_SMALL, CKD_KNME_NM CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE (";
			sql += "	CKD_KNME_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " 	OR CKD_KCD_CD LIKE '%" + EDCODE_NM + "%'";
			sql += " )";
			sql += " AND CKD_LEVL_KD IN ('3','4')";
			sql += " AND UPPER(NVL(CKD_SYMP_YN, 'Y')) = 'Y'";
		} else if(SEARCH_CD.equals("구강검진")) {

			sql += " SELECT CCP_GUBN_CD, CCP_MACH_CD CCN_SMALL, CCP_SOKUN_TX CCN_NAME, '' CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CCP_MACH_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND CCP_MACH_CD = '" + SMALL_CD + "'";
			sql += " AND UPPER(NVL(CCP_USE_YN, 'Y')) = 'Y'";
		} else if(SEARCH_CD.equals("질병분류")) {

			sql += " SELECT CKD_KSCD_CD CCN_SMALL, GETKSCD_CDTONM(CKD_KSCD_CD,CKD_SUKN_CD) CCN_NAME, CKD_SNME_NM CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE (";
			sql += "	CKD_KNME_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " 	OR CKD_SNME_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " )";
			sql += " AND CKD_LEVL_KD = '4'";
		} else if(SEARCH_CD.equals("0805")) {

			sql += " SELECT CCN_SMALL, CCN_FULL_NM CCN_NAME, CCN_VALUE";
			sql += " FROM " + TBL_NAME;
			sql += " WHERE CCN_LARGE = '" + SEARCH_CD + "'";
			sql += " AND CCN_LEVEL = '5'";
			sql += " AND CCN_FULL_NM LIKE '%" + EDCODE_NM + "%'";
			sql += " AND UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'";
		} else {

			if(SMALL_CD.equals("")) {
			
				sql += " SELECT CCN_SMALL, CCN_FULL_NM CCN_NAME, CCN_VALUE";
				sql += " FROM " + TBL_NAME;
				sql += " WHERE CCN_LARGE = '" + SEARCH_CD + "'";
				sql += " AND CCN_LEVEL = '5'";
				sql += " AND CCN_FULL_NM LIKE '%" + EDCODE_NM + "%'";
				sql += " AND UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'";
			} else {
			
				sql += " SELECT CCN_SMALL, CCN_FULL_NM CCN_NAME, CCN_VALUE";
				sql += " FROM " + TBL_NAME;
				sql += " WHERE CCN_LARGE = '" + SEARCH_CD + "'";
				sql += " AND CCN_SMALL LIKE SMALL_CD || '%'";
				sql += " AND CCN_LEVEL = '5'";
				sql += " AND CCN_FULL_NM LIKE '%" + EDCODE_NM + "%'";
				sql += " AND UPPER(NVL(CCN_USE_YN, 'Y')) = 'Y'";
			}
		}

		sql += " ) A";
		
		if(SEARCH_CD.substring(1, 2).equals("HM")) {
		
			if(GUBUN.equals("SpPan")) {
				sql += " ORDER BY (CASE WHEN SUBSTR(A.CCN_SMALL,1,1) = 'S' THEN 'A001' END) DESC";
			} else if(GUBUN.equals("SpNight")) {
				sql += " ORDER BY A.CSC_CODE_GR, A.CCN_SMALL";
			} else {
				sql += " ORDER BY A.CSC_CODE_GR, A.CCN_SMALL";
			}
		} else if(RBCODE.equals("Y")) {
			sql += " ORDER BY A.CCN_SMALL";
		} else {
			sql += " ORDER BY A.CCN_NAME";
		}
		
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : FindCode_New_btnFindClick_001 \n";
			G_INFO += "설명 : 코드정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COLUMN1 : " + COLUMN1 + " \n";
			G_INFO += " COLUMN2 : " + COLUMN2 + " \n";
			G_INFO += " COLUMN3 : " + COLUMN3 + " \n";
			G_INFO += " TBL_NAME : " + TBL_NAME + " \n";
			G_INFO += " EDCODE_NM : " + EDCODE_NM + " \n";
			G_INFO += " SEARCH_CD : " + SEARCH_CD + " \n";
			G_INFO += " GUBUN : " + GUBUN + " \n";
			G_INFO += " SMALL_CD : " + SMALL_CD + " \n";
			G_INFO += " RBCODE : " + RBCODE + " \n";
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
		<s:AttributeType name='CCN_SMALL' rs:number='1' rs:writeunknown='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='BEE_ESTI_CD'>
			<s:datatype dt:type='string' dt:maxLength='8' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_NAME' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_VALUE' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_USE_YN' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_FULL_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_CODE_GR' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c7' rs:name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
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

			String CCN_SMALL_T = cRsList.getString("CCN_SMALL");
			String CCN_NAME_T = cRsList.getString("CCN_NAME");
			String CCN_VALUE_T = cRsList.getString("CCN_VALUE");
			String CCN_USE_YN_T = cRsList.getString("CCN_USE_YN");
			String CSC_FULL_NM_T = cRsList.getString("CSC_FULL_NM");
			String CSC_CODE_GR_T = cRsList.getString("CSC_CODE_GR");
			String ROWID_T = cRsList.getString("ROWID");
			String c7_T = cRsList.getString("c7");
%>
			<z:row
<%
			if(! CCN_SMALL_T.equals("")) {
%>
		 		CCN_SMALL='<%= CCN_SMALL_T%>'
<%
			}

			if(! CCN_NAME_T.equals("")) {
%>
		 		CCN_NAME='<%= CCN_NAME_T%>'
<%
			}

			if(! CCN_VALUE_T.equals("")) {
%>
		 		CCN_VALUE='<%= CCN_VALUE_T%>'
<%
			}

			if(! CCN_USE_YN_T.equals("")) {
%>
		 		CCN_USE_YN='<%= CCN_USE_YN_T%>'
<%
			}

			if(! CSC_FULL_NM_T.equals("")) {
%>
		 		CSC_FULL_NM='<%= CSC_FULL_NM_T%>'
<%
			}

			if(! CSC_CODE_GR_T.equals("")) {
%>
		 		CSC_CODE_GR='<%= CSC_CODE_GR_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c7='<%= cnt%>'
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
