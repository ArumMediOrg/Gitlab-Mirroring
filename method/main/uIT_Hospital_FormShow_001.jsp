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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IHL_HOSP_NO, IHL_HOSP_NM, IHL_BUSI_NO, IHL_BUCO_NO, IHL_BUCA_NO, IHL_PRES_NM, IHL_ZIP_CD, IHL_ZIP_AR, IHL_ROAD_AR,                    
       IHL_ASSO_NO, IHL_ASSO_NM, IHL_STAN_CD, IHL_HECK_CD, IHL_SYCK_CD, IHL_SUCK_CD, IHL_EOCK_CD, IHL_EBCK_CD, IHL_SACK_CD,                  
       IHL_GUCK_CD, IHL_HYCK_CD, IHL_SPCK_CD, IHL_MACK_CD, IHL_BLCK_CD, IHL_SECK_CD, IHL_BUSI_CD, IHL_CHAR_YN, IHL_SUBO_CD,                  
       IHL_JTEL_NO, IHL_GTEL_NO, IHL_STEL_NO, IHL_DOSI_NO, IHL_ACNU1_NO, IHL_ACNU2_NO, IHL_ACNU3_NO, IHL_CXRY_CD,                            
       IHL_NXRY_CD, IHL_INPT_ID, IHL_INPT_DTT, IHL_MODI_ID, IHL_MODI_DTT, IHL_HCAR_CD, IHL_HBSAG_KD, IHL_HBS_KD, IHL_XRAY_KD, IHL_EGRF_KD,   
       IHL_BONE_KD, IHL_UGI_KD, IHL_BOENT_KD, IHL_ENEMA_KD, IHL_EIA_KD, IHL_HCVAB_KD, IHL_AFTP_KD, IHL_MMGP_KD, IHL_STDAG_NO, IHL_STDAB_NO,  
       IHL_ACPT_KD, IHL_ORAL_KD, IHL_ATCNR_KD, IHL_BLOODCK_KD, IHL_ENCRT_KD, IHL_BOENT_AGN, IHL_SIDO_CD, IHL_PRCARE_EMAT,                    
       IHL_DOWN_URL, IHL_SIGN_YN, IHL_SBPR_CD, IHL_MGPR_KD, IHL_COMPORT, IHL_TELSPD, IHL_VAN_NM, IHL_DANNO, IHL_TRUNC_KD, IHL_RECE_KD,       
       IHL_OCS_KD, IHL_DBUPDATE, IHL_MUUPDATE, IHL_HIV_KD, IHL_SVP_KD, IHL_HEPA_NO, IHL_HIV_NO, IHL_SVP_NO, IHL_ATCF_YN,                     
       IHL_QSTN_KD, IHL_OCSAUTO_KD, IHL_FOCP_KD, IHL_LAST_CD, IHL_GUSE_YN, IHL_SUSE_YN, IHL_CUSE_YN, IHL_JUSE_YN, IHL_STUSE_YN, IHL_SOUSE_YN,
       IHL_SPUSE_YN, IHL_HOSP_NM2, IHL_HOSP_NO2, IHL_DTTEL_NO, IHL_ZIP_CD2, IHL_ZIP_AR2, IHL_ROAD_AR2,                                       
       IHL_SPNIGHT_LDL, IHL_SPNIGHT_LDL1, IHL_DIS1_PO, IHL_HOSP_CD, IHL_DRUG_KD,                                                             
       IHL_LOGO_IM, IHL_HOSP_IMG, IHL_HOSP_IMG2, IHL_AUTO_CD,                                                                                
       (select ccn_full_nm from CT_COMMON where A.ihl_buco_no= ccn_small and ccn_large=''0806'') buconm,                                     
       (select ccn_full_nm from CT_COMMON where A.ihl_buca_no= ccn_small and ccn_large=''0805'') bucanm                                      
  FROM it_hospital A                                                                                                                         

		*/

		sql = " SELECT IHL_HOSP_NO, IHL_HOSP_NM, IHL_BUSI_NO, IHL_BUCO_NO, IHL_BUCA_NO, IHL_PRES_NM, IHL_ZIP_CD, IHL_ZIP_AR, IHL_ROAD_AR, IHL_ASSO_NO, IHL_ASSO_NM, IHL_STAN_CD, IHL_HECK_CD, IHL_SYCK_CD, IHL_SUCK_CD, IHL_EOCK_CD, IHL_EBCK_CD, IHL_SACK_CD, IHL_GUCK_CD, IHL_HYCK_CD, IHL_SPCK_CD, IHL_MACK_CD, IHL_BLCK_CD, IHL_SECK_CD, IHL_BUSI_CD, IHL_CHAR_YN, IHL_SUBO_CD, IHL_JTEL_NO, IHL_GTEL_NO, IHL_STEL_NO, IHL_DOSI_NO, IHL_ACNU1_NO, IHL_ACNU2_NO, IHL_ACNU3_NO, IHL_CXRY_CD, IHL_NXRY_CD, IHL_INPT_ID, IHL_INPT_DTT, IHL_MODI_ID, IHL_MODI_DTT, IHL_HCAR_CD, IHL_HBSAG_KD, IHL_HBS_KD, IHL_XRAY_KD, IHL_EGRF_KD, IHL_BONE_KD, IHL_UGI_KD, IHL_BOENT_KD, IHL_ENEMA_KD, IHL_EIA_KD, IHL_HCVAB_KD, IHL_AFTP_KD, IHL_MMGP_KD, IHL_STDAG_NO, IHL_STDAB_NO, IHL_ACPT_KD, IHL_ORAL_KD, IHL_ATCNR_KD, IHL_BLOODCK_KD, IHL_ENCRT_KD, IHL_BOENT_AGN, IHL_SIDO_CD, IHL_PRCARE_EMAT, IHL_DOWN_URL, IHL_SIGN_YN, IHL_SBPR_CD, IHL_MGPR_KD, IHL_COMPORT, IHL_TELSPD, IHL_VAN_NM, IHL_DANNO, IHL_TRUNC_KD, IHL_RECE_KD, IHL_OCS_KD, IHL_DBUPDATE, IHL_MUUPDATE, IHL_HIV_KD, IHL_SVP_KD, IHL_HEPA_NO, IHL_HIV_NO, IHL_SVP_NO, IHL_ATCF_YN, IHL_QSTN_KD, IHL_OCSAUTO_KD, IHL_FOCP_KD, IHL_LAST_CD, IHL_GUSE_YN, IHL_SUSE_YN, IHL_CUSE_YN, IHL_JUSE_YN, IHL_STUSE_YN, IHL_SOUSE_YN, IHL_SPUSE_YN, IHL_HOSP_NM2, IHL_HOSP_NO2, IHL_DTTEL_NO, IHL_ZIP_CD2, IHL_ZIP_AR2, IHL_ROAD_AR2, IHL_SPNIGHT_LDL, IHL_SPNIGHT_LDL1, IHL_DIS1_PO, IHL_HOSP_CD, IHL_DRUG_KD, IHL_LOGO_IM, IHL_HOSP_IMG, IHL_HOSP_IMG2, IHL_AUTO_CD";
		sql += ", (";
		sql += "	SELECT ccn_full_nm";
		sql += "	FROM CT_COMMON";
		sql += "	WHERE A.ihl_buco_no= ccn_small";
		sql += "	AND ccn_large='0806'";
		sql += ") buconm";
		sql += ", (";
		sql += "	SELECT ccn_full_nm";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE A.ihl_buca_no= ccn_small";
		sql += " 	AND ccn_large='0805'";
		sql += ") bucanm";
		sql += " FROM it_hospital A";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_Hospital_FormShow_001 \n";
			G_INFO += "설명 : 병원정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='IHL_HOSP_NO' rs:number='1' rs:writeunknown='true' rs:basetable='IT_HOSPITAL' rs:basecolumn='IHL_HOSP_NO'>
			<s:datatype dt:type='string' dt:maxLength='8' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HOSP_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_HOSPITAL' rs:basecolumn='IHL_HOSP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_BUSI_NO' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_BUSI_NO'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_BUCO_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_BUCO_NO'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_BUCA_NO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_BUCA_NO'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_PRES_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_PRES_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ZIP_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ZIP_AR' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ROAD_AR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ASSO_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ASSO_NO'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ASSO_NM' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ASSO_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_STAN_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_STAN_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HECK_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HECK_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SYCK_CD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SYCK_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SUCK_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SUCK_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_EOCK_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_EOCK_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_EBCK_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_EBCK_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SACK_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SACK_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_GUCK_CD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_GUCK_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HYCK_CD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HYCK_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SPCK_CD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SPCK_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_MACK_CD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_MACK_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_BLCK_CD' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_BLCK_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SECK_CD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SECK_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_BUSI_CD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_BUSI_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_CHAR_YN' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_CHAR_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SUBO_CD' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SUBO_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_JTEL_NO' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_JTEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_GTEL_NO' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_GTEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_STEL_NO' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_STEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_DOSI_NO' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_DOSI_NO'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ACNU1_NO' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ACNU1_NO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ACNU2_NO' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ACNU2_NO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ACNU3_NO' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ACNU3_NO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_CXRY_CD' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_CXRY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_NXRY_CD' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_NXRY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_INPT_ID' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_INPT_DTT' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_MODI_ID' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_MODI_DTT' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HCAR_CD' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HCAR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HBSAG_KD' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HBSAG_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HBS_KD' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HBS_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_XRAY_KD' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_XRAY_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_EGRF_KD' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_EGRF_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_BONE_KD' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_BONE_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_UGI_KD' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_UGI_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_BOENT_KD' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_BOENT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ENEMA_KD' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ENEMA_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_EIA_KD' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_EIA_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HCVAB_KD' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HCVAB_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_AFTP_KD' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_AFTP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_MMGP_KD' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_MMGP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_STDAG_NO' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_STDAG_NO'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_STDAB_NO' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_STDAB_NO'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ACPT_KD' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ACPT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ORAL_KD' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ORAL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ATCNR_KD' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ATCNR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_BLOODCK_KD' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_BLOODCK_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ENCRT_KD' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ENCRT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_BOENT_AGN' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_BOENT_AGN'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SIDO_CD' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SIDO_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_PRCARE_EMAT' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_PRCARE_EMAT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_DOWN_URL' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_DOWN_URL'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SIGN_YN' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SIGN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SBPR_CD' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SBPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_MGPR_KD' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_MGPR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_COMPORT' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_COMPORT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_TELSPD' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_TELSPD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_VAN_NM' rs:number='70' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_VAN_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_DANNO' rs:number='71' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_DANNO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_TRUNC_KD' rs:number='72' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_TRUNC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_RECE_KD' rs:number='73' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_RECE_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_OCS_KD' rs:number='74' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_OCS_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_DBUPDATE' rs:number='75' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_DBUPDATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_MUUPDATE' rs:number='76' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_MUUPDATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HIV_KD' rs:number='77' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HIV_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SVP_KD' rs:number='78' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SVP_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HEPA_NO' rs:number='79' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HEPA_NO'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HIV_NO' rs:number='80' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HIV_NO'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SVP_NO' rs:number='81' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SVP_NO'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ATCF_YN' rs:number='82' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ATCF_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_QSTN_KD' rs:number='83' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_QSTN_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_OCSAUTO_KD' rs:number='84' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_OCSAUTO_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_FOCP_KD' rs:number='85' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_FOCP_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_LAST_CD' rs:number='86' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_LAST_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_GUSE_YN' rs:number='87' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_GUSE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SUSE_YN' rs:number='88' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SUSE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_CUSE_YN' rs:number='89' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_CUSE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_JUSE_YN' rs:number='90' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_JUSE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_STUSE_YN' rs:number='91' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_STUSE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SOUSE_YN' rs:number='92' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SOUSE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SPUSE_YN' rs:number='93' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SPUSE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HOSP_NM2' rs:number='94' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HOSP_NM2'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HOSP_NO2' rs:number='95' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HOSP_NO2'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_DTTEL_NO' rs:number='96' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_DTTEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ZIP_CD2' rs:number='97' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ZIP_CD2'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ZIP_AR2' rs:number='98' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ZIP_AR2'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_ROAD_AR2' rs:number='99' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_ROAD_AR2'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SPNIGHT_LDL' rs:number='100' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SPNIGHT_LDL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_SPNIGHT_LDL1' rs:number='101' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_SPNIGHT_LDL1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_DIS1_PO' rs:number='102' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_DIS1_PO'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HOSP_CD' rs:number='103' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HOSP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_DRUG_KD' rs:number='104' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_DRUG_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_LOGO_IM' rs:number='105' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_LOGO_IM'>
			<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HOSP_IMG' rs:number='106' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HOSP_IMG'>
			<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_HOSP_IMG2' rs:number='107' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_HOSP_IMG2'>
			<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='IHL_AUTO_CD' rs:number='108' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_HOSPITAL'
			 rs:basecolumn='IHL_AUTO_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BUCONM' rs:number='109' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='BUCANM' rs:number='110' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='111' rs:rowid='true' rs:basetable='IT_HOSPITAL' rs:basecolumn='ROWID'
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

			String IHL_HOSP_NO_T = cRsList.getString("IHL_HOSP_NO");
			String IHL_HOSP_NM_T = cRsList.getString("IHL_HOSP_NM");
			String IHL_BUSI_NO_T = cRsList.getString("IHL_BUSI_NO");
			String IHL_BUCO_NO_T = cRsList.getString("IHL_BUCO_NO");
			String IHL_BUCA_NO_T = cRsList.getString("IHL_BUCA_NO");
			String IHL_PRES_NM_T = cRsList.getString("IHL_PRES_NM");
			String IHL_ZIP_CD_T = cRsList.getString("IHL_ZIP_CD");
			String IHL_ZIP_AR_T = cRsList.getString("IHL_ZIP_AR");
			String IHL_ROAD_AR_T = cRsList.getString("IHL_ROAD_AR");
			String IHL_ASSO_NO_T = cRsList.getString("IHL_ASSO_NO");
			String IHL_ASSO_NM_T = cRsList.getString("IHL_ASSO_NM");
			String IHL_STAN_CD_T = cRsList.getString("IHL_STAN_CD");
			String IHL_HECK_CD_T = cRsList.getString("IHL_HECK_CD");
			String IHL_SYCK_CD_T = cRsList.getString("IHL_SYCK_CD");
			String IHL_SUCK_CD_T = cRsList.getString("IHL_SUCK_CD");
			String IHL_EOCK_CD_T = cRsList.getString("IHL_EOCK_CD");
			String IHL_EBCK_CD_T = cRsList.getString("IHL_EBCK_CD");
			String IHL_SACK_CD_T = cRsList.getString("IHL_SACK_CD");
			String IHL_GUCK_CD_T = cRsList.getString("IHL_GUCK_CD");
			String IHL_HYCK_CD_T = cRsList.getString("IHL_HYCK_CD");
			String IHL_SPCK_CD_T = cRsList.getString("IHL_SPCK_CD");
			String IHL_MACK_CD_T = cRsList.getString("IHL_MACK_CD");
			String IHL_BLCK_CD_T = cRsList.getString("IHL_BLCK_CD");
			String IHL_SECK_CD_T = cRsList.getString("IHL_SECK_CD");
			String IHL_BUSI_CD_T = cRsList.getString("IHL_BUSI_CD");
			String IHL_CHAR_YN_T = cRsList.getString("IHL_CHAR_YN");
			String IHL_SUBO_CD_T = cRsList.getString("IHL_SUBO_CD");
			String IHL_JTEL_NO_T = cRsList.getString("IHL_JTEL_NO");
			String IHL_GTEL_NO_T = cRsList.getString("IHL_GTEL_NO");
			String IHL_STEL_NO_T = cRsList.getString("IHL_STEL_NO");
			String IHL_DOSI_NO_T = cRsList.getString("IHL_DOSI_NO");
			String IHL_ACNU1_NO_T = cRsList.getString("IHL_ACNU1_NO");
			String IHL_ACNU2_NO_T = cRsList.getString("IHL_ACNU2_NO");
			String IHL_ACNU3_NO_T = cRsList.getString("IHL_ACNU3_NO");
			String IHL_CXRY_CD_T = cRsList.getString("IHL_CXRY_CD");
			String IHL_NXRY_CD_T = cRsList.getString("IHL_NXRY_CD");
			String IHL_INPT_ID_T = cRsList.getString("IHL_INPT_ID");
			String IHL_INPT_DTT_T = cRsList.getDate2("IHL_INPT_DTT");
			String IHL_MODI_ID_T = cRsList.getString("IHL_MODI_ID");
			String IHL_MODI_DTT_T = cRsList.getDate2("IHL_MODI_DTT");
			String IHL_HCAR_CD_T = cRsList.getString("IHL_HCAR_CD");
			String IHL_HBSAG_KD_T = cRsList.getString("IHL_HBSAG_KD");
			String IHL_HBS_KD_T = cRsList.getString("IHL_HBS_KD");
			String IHL_XRAY_KD_T = cRsList.getString("IHL_XRAY_KD");
			String IHL_EGRF_KD_T = cRsList.getString("IHL_EGRF_KD");
			String IHL_BONE_KD_T = cRsList.getString("IHL_BONE_KD");
			String IHL_UGI_KD_T = cRsList.getString("IHL_UGI_KD");
			String IHL_BOENT_KD_T = cRsList.getString("IHL_BOENT_KD");
			String IHL_ENEMA_KD_T = cRsList.getString("IHL_ENEMA_KD");
			String IHL_EIA_KD_T = cRsList.getString("IHL_EIA_KD");
			String IHL_HCVAB_KD_T = cRsList.getString("IHL_HCVAB_KD");
			String IHL_AFTP_KD_T = cRsList.getString("IHL_AFTP_KD");
			String IHL_MMGP_KD_T = cRsList.getString("IHL_MMGP_KD");
			String IHL_STDAG_NO_T = cRsList.getString("IHL_STDAG_NO");
			String IHL_STDAB_NO_T = cRsList.getString("IHL_STDAB_NO");
			String IHL_ACPT_KD_T = cRsList.getString("IHL_ACPT_KD");
			String IHL_ORAL_KD_T = cRsList.getString("IHL_ORAL_KD");
			String IHL_ATCNR_KD_T = cRsList.getString("IHL_ATCNR_KD");
			String IHL_BLOODCK_KD_T = cRsList.getString("IHL_BLOODCK_KD");
			String IHL_ENCRT_KD_T = cRsList.getString("IHL_ENCRT_KD");
			String IHL_BOENT_AGN_T = cRsList.getString("IHL_BOENT_AGN");
			String IHL_SIDO_CD_T = cRsList.getString("IHL_SIDO_CD");
			String IHL_PRCARE_EMAT_T = cRsList.getString("IHL_PRCARE_EMAT");
			String IHL_DOWN_URL_T = cRsList.getString("IHL_DOWN_URL");
			String IHL_SIGN_YN_T = cRsList.getString("IHL_SIGN_YN");
			String IHL_SBPR_CD_T = cRsList.getString("IHL_SBPR_CD");
			String IHL_MGPR_KD_T = cRsList.getString("IHL_MGPR_KD");
			String IHL_COMPORT_T = cRsList.getString("IHL_COMPORT");
			String IHL_TELSPD_T = cRsList.getString("IHL_TELSPD");
			String IHL_VAN_NM_T = cRsList.getString("IHL_VAN_NM");
			String IHL_DANNO_T = cRsList.getString("IHL_DANNO");
			String IHL_TRUNC_KD_T = cRsList.getString("IHL_TRUNC_KD");
			String IHL_RECE_KD_T = cRsList.getString("IHL_RECE_KD");
			String IHL_OCS_KD_T = cRsList.getString("IHL_OCS_KD");
			String IHL_DBUPDATE_T = cRsList.getString("IHL_DBUPDATE");
			String IHL_MUUPDATE_T = cRsList.getString("IHL_MUUPDATE");
			String IHL_HIV_KD_T = cRsList.getString("IHL_HIV_KD");
			String IHL_SVP_KD_T = cRsList.getString("IHL_SVP_KD");
			String IHL_HEPA_NO_T = cRsList.getString("IHL_HEPA_NO");
			String IHL_HIV_NO_T = cRsList.getString("IHL_HIV_NO");
			String IHL_SVP_NO_T = cRsList.getString("IHL_SVP_NO");
			String IHL_ATCF_YN_T = cRsList.getString("IHL_ATCF_YN");
			String IHL_QSTN_KD_T = cRsList.getString("IHL_QSTN_KD");
			String IHL_OCSAUTO_KD_T = cRsList.getString("IHL_OCSAUTO_KD");
			String IHL_FOCP_KD_T = cRsList.getString("IHL_FOCP_KD");
			String IHL_LAST_CD_T = cRsList.getString("IHL_LAST_CD");
			String IHL_GUSE_YN_T = cRsList.getString("IHL_GUSE_YN");
			String IHL_SUSE_YN_T = cRsList.getString("IHL_SUSE_YN");
			String IHL_CUSE_YN_T = cRsList.getString("IHL_CUSE_YN");
			String IHL_JUSE_YN_T = cRsList.getString("IHL_JUSE_YN");
			String IHL_STUSE_YN_T = cRsList.getString("IHL_STUSE_YN");
			String IHL_SOUSE_YN_T = cRsList.getString("IHL_SOUSE_YN");
			String IHL_SPUSE_YN_T = cRsList.getString("IHL_SPUSE_YN");
			String IHL_HOSP_NM2_T = cRsList.getString("IHL_HOSP_NM2");
			String IHL_HOSP_NO2_T = cRsList.getString("IHL_HOSP_NO2");
			String IHL_DTTEL_NO_T = cRsList.getString("IHL_DTTEL_NO");
			String IHL_ZIP_CD2_T = cRsList.getString("IHL_ZIP_CD2");
			String IHL_ZIP_AR2_T = cRsList.getString("IHL_ZIP_AR2");
			String IHL_ROAD_AR2_T = cRsList.getString("IHL_ROAD_AR2");
			String IHL_SPNIGHT_LDL_T = cRsList.getString("IHL_SPNIGHT_LDL");
			String IHL_SPNIGHT_LDL1_T = cRsList.getString("IHL_SPNIGHT_LDL1");
			String IHL_DIS1_PO_T = cRsList.getString("IHL_DIS1_PO");
			String IHL_HOSP_CD_T = cRsList.getString("IHL_HOSP_CD");
			String IHL_DRUG_KD_T = cRsList.getString("IHL_DRUG_KD");
			String IHL_LOGO_IM_T = cRsList.getString("IHL_LOGO_IM");
			
			String IHL_HOSP_IMG_T = "";
			byte[] buf_IHL_HOSP_IMG = rsList.getBytes("IHL_HOSP_IMG");
			if(buf_IHL_HOSP_IMG != null) {
				IHL_HOSP_IMG_T = new String(buf_IHL_HOSP_IMG);
			}

			String IHL_HOSP_IMG2_T = "";
			byte[] buf_IHL_HOSP_IMG2 = rsList.getBytes("IHL_HOSP_IMG2");
			if(buf_IHL_HOSP_IMG2 != null) {
				IHL_HOSP_IMG2_T = new String(buf_IHL_HOSP_IMG2);
			}

			String IHL_AUTO_CD_T = cRsList.getString("IHL_AUTO_CD");
			String BUCONM_T = cRsList.getString("BUCONM");
			String BUCANM_T = cRsList.getString("BUCANM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IHL_HOSP_NO_T.equals("")) {
%>
		 		IHL_HOSP_NO='<%= IHL_HOSP_NO_T%>'
<%
			}

			if(! IHL_HOSP_NM_T.equals("")) {
%>
		 		IHL_HOSP_NM='<%= IHL_HOSP_NM_T%>'
<%
			}

			if(! IHL_BUSI_NO_T.equals("")) {
%>
		 		IHL_BUSI_NO='<%= IHL_BUSI_NO_T%>'
<%
			}

			if(! IHL_BUCO_NO_T.equals("")) {
%>
		 		IHL_BUCO_NO='<%= IHL_BUCO_NO_T%>'
<%
			}

			if(! IHL_BUCA_NO_T.equals("")) {
%>
		 		IHL_BUCA_NO='<%= IHL_BUCA_NO_T%>'
<%
			}

			if(! IHL_PRES_NM_T.equals("")) {
%>
		 		IHL_PRES_NM='<%= IHL_PRES_NM_T%>'
<%
			}

			if(! IHL_ZIP_CD_T.equals("")) {
%>
		 		IHL_ZIP_CD='<%= IHL_ZIP_CD_T%>'
<%
			}

			if(! IHL_ZIP_AR_T.equals("")) {
%>
		 		IHL_ZIP_AR='<%= IHL_ZIP_AR_T%>'
<%
			}

			if(! IHL_ROAD_AR_T.equals("")) {
%>
		 		IHL_ROAD_AR='<%= IHL_ROAD_AR_T%>'
<%
			}

			if(! IHL_ASSO_NO_T.equals("")) {
%>
		 		IHL_ASSO_NO='<%= IHL_ASSO_NO_T%>'
<%
			}

			if(! IHL_ASSO_NM_T.equals("")) {
%>
		 		IHL_ASSO_NM='<%= IHL_ASSO_NM_T%>'
<%
			}

			if(! IHL_STAN_CD_T.equals("")) {
%>
		 		IHL_STAN_CD='<%= IHL_STAN_CD_T%>'
<%
			}

			if(! IHL_HECK_CD_T.equals("")) {
%>
		 		IHL_HECK_CD='<%= IHL_HECK_CD_T%>'
<%
			}

			if(! IHL_SYCK_CD_T.equals("")) {
%>
		 		IHL_SYCK_CD='<%= IHL_SYCK_CD_T%>'
<%
			}

			if(! IHL_SUCK_CD_T.equals("")) {
%>
		 		IHL_SUCK_CD='<%= IHL_SUCK_CD_T%>'
<%
			}

			if(! IHL_EOCK_CD_T.equals("")) {
%>
		 		IHL_EOCK_CD='<%= IHL_EOCK_CD_T%>'
<%
			}

			if(! IHL_EBCK_CD_T.equals("")) {
%>
		 		IHL_EBCK_CD='<%= IHL_EBCK_CD_T%>'
<%
			}

			if(! IHL_SACK_CD_T.equals("")) {
%>
		 		IHL_SACK_CD='<%= IHL_SACK_CD_T%>'
<%
			}

			if(! IHL_GUCK_CD_T.equals("")) {
%>
		 		IHL_GUCK_CD='<%= IHL_GUCK_CD_T%>'
<%
			}

			if(! IHL_HYCK_CD_T.equals("")) {
%>
		 		IHL_HYCK_CD='<%= IHL_HYCK_CD_T%>'
<%
			}

			if(! IHL_SPCK_CD_T.equals("")) {
%>
		 		IHL_SPCK_CD='<%= IHL_SPCK_CD_T%>'
<%
			}

			if(! IHL_MACK_CD_T.equals("")) {
%>
		 		IHL_MACK_CD='<%= IHL_MACK_CD_T%>'
<%
			}

			if(! IHL_BLCK_CD_T.equals("")) {
%>
		 		IHL_BLCK_CD='<%= IHL_BLCK_CD_T%>'
<%
			}

			if(! IHL_SECK_CD_T.equals("")) {
%>
		 		IHL_SECK_CD='<%= IHL_SECK_CD_T%>'
<%
			}

			if(! IHL_BUSI_CD_T.equals("")) {
%>
		 		IHL_BUSI_CD='<%= IHL_BUSI_CD_T%>'
<%
			}

			if(! IHL_CHAR_YN_T.equals("")) {
%>
		 		IHL_CHAR_YN='<%= IHL_CHAR_YN_T%>'
<%
			}

			if(! IHL_SUBO_CD_T.equals("")) {
%>
		 		IHL_SUBO_CD='<%= IHL_SUBO_CD_T%>'
<%
			}

			if(! IHL_JTEL_NO_T.equals("")) {
%>
		 		IHL_JTEL_NO='<%= IHL_JTEL_NO_T%>'
<%
			}

			if(! IHL_GTEL_NO_T.equals("")) {
%>
		 		IHL_GTEL_NO='<%= IHL_GTEL_NO_T%>'
<%
			}

			if(! IHL_STEL_NO_T.equals("")) {
%>
		 		IHL_STEL_NO='<%= IHL_STEL_NO_T%>'
<%
			}

			if(! IHL_DOSI_NO_T.equals("")) {
%>
		 		IHL_DOSI_NO='<%= IHL_DOSI_NO_T%>'
<%
			}

			if(! IHL_ACNU1_NO_T.equals("")) {
%>
		 		IHL_ACNU1_NO='<%= IHL_ACNU1_NO_T%>'
<%
			}

			if(! IHL_ACNU2_NO_T.equals("")) {
%>
		 		IHL_ACNU2_NO='<%= IHL_ACNU2_NO_T%>'
<%
			}

			if(! IHL_ACNU3_NO_T.equals("")) {
%>
		 		IHL_ACNU3_NO='<%= IHL_ACNU3_NO_T%>'
<%
			}

			if(! IHL_CXRY_CD_T.equals("")) {
%>
		 		IHL_CXRY_CD='<%= IHL_CXRY_CD_T%>'
<%
			}

			if(! IHL_NXRY_CD_T.equals("")) {
%>
		 		IHL_NXRY_CD='<%= IHL_NXRY_CD_T%>'
<%
			}

			if(! IHL_INPT_ID_T.equals("")) {
%>
		 		IHL_INPT_ID='<%= IHL_INPT_ID_T%>'
<%
			}

			if(! IHL_INPT_DTT_T.equals("")) {
%>
		 		IHL_INPT_DTT='<%= IHL_INPT_DTT_T%>'
<%
			}

			if(! IHL_MODI_ID_T.equals("")) {
%>
		 		IHL_MODI_ID='<%= IHL_MODI_ID_T%>'
<%
			}

			if(! IHL_MODI_DTT_T.equals("")) {
%>
		 		IHL_MODI_DTT='<%= IHL_MODI_DTT_T%>'
<%
			}

			if(! IHL_HCAR_CD_T.equals("")) {
%>
		 		IHL_HCAR_CD='<%= IHL_HCAR_CD_T%>'
<%
			}

			if(! IHL_HBSAG_KD_T.equals("")) {
%>
		 		IHL_HBSAG_KD='<%= IHL_HBSAG_KD_T%>'
<%
			}

			if(! IHL_HBS_KD_T.equals("")) {
%>
		 		IHL_HBS_KD='<%= IHL_HBS_KD_T%>'
<%
			}

			if(! IHL_XRAY_KD_T.equals("")) {
%>
		 		IHL_XRAY_KD='<%= IHL_XRAY_KD_T%>'
<%
			}

			if(! IHL_EGRF_KD_T.equals("")) {
%>
		 		IHL_EGRF_KD='<%= IHL_EGRF_KD_T%>'
<%
			}

			if(! IHL_BONE_KD_T.equals("")) {
%>
		 		IHL_BONE_KD='<%= IHL_BONE_KD_T%>'
<%
			}

			if(! IHL_UGI_KD_T.equals("")) {
%>
		 		IHL_UGI_KD='<%= IHL_UGI_KD_T%>'
<%
			}

			if(! IHL_BOENT_KD_T.equals("")) {
%>
		 		IHL_BOENT_KD='<%= IHL_BOENT_KD_T%>'
<%
			}

			if(! IHL_ENEMA_KD_T.equals("")) {
%>
		 		IHL_ENEMA_KD='<%= IHL_ENEMA_KD_T%>'
<%
			}

			if(! IHL_EIA_KD_T.equals("")) {
%>
		 		IHL_EIA_KD='<%= IHL_EIA_KD_T%>'
<%
			}

			if(! IHL_HCVAB_KD_T.equals("")) {
%>
		 		IHL_HCVAB_KD='<%= IHL_HCVAB_KD_T%>'
<%
			}

			if(! IHL_AFTP_KD_T.equals("")) {
%>
		 		IHL_AFTP_KD='<%= IHL_AFTP_KD_T%>'
<%
			}

			if(! IHL_MMGP_KD_T.equals("")) {
%>
		 		IHL_MMGP_KD='<%= IHL_MMGP_KD_T%>'
<%
			}

			if(! IHL_STDAG_NO_T.equals("")) {
%>
		 		IHL_STDAG_NO='<%= IHL_STDAG_NO_T%>'
<%
			}

			if(! IHL_STDAB_NO_T.equals("")) {
%>
		 		IHL_STDAB_NO='<%= IHL_STDAB_NO_T%>'
<%
			}

			if(! IHL_ACPT_KD_T.equals("")) {
%>
		 		IHL_ACPT_KD='<%= IHL_ACPT_KD_T%>'
<%
			}

			if(! IHL_ORAL_KD_T.equals("")) {
%>
		 		IHL_ORAL_KD='<%= IHL_ORAL_KD_T%>'
<%
			}

			if(! IHL_ATCNR_KD_T.equals("")) {
%>
		 		IHL_ATCNR_KD='<%= IHL_ATCNR_KD_T%>'
<%
			}

			if(! IHL_BLOODCK_KD_T.equals("")) {
%>
		 		IHL_BLOODCK_KD='<%= IHL_BLOODCK_KD_T%>'
<%
			}

			if(! IHL_ENCRT_KD_T.equals("")) {
%>
		 		IHL_ENCRT_KD='<%= IHL_ENCRT_KD_T%>'
<%
			}

			if(! IHL_BOENT_AGN_T.equals("")) {
%>
		 		IHL_BOENT_AGN='<%= IHL_BOENT_AGN_T%>'
<%
			}

			if(! IHL_SIDO_CD_T.equals("")) {
%>
		 		IHL_SIDO_CD='<%= IHL_SIDO_CD_T%>'
<%
			}

			if(! IHL_PRCARE_EMAT_T.equals("")) {
%>
		 		IHL_PRCARE_EMAT='<%= IHL_PRCARE_EMAT_T%>'
<%
			}

			if(! IHL_DOWN_URL_T.equals("")) {
%>
		 		IHL_DOWN_URL='<%= IHL_DOWN_URL_T%>'
<%
			}

			if(! IHL_SIGN_YN_T.equals("")) {
%>
		 		IHL_SIGN_YN='<%= IHL_SIGN_YN_T%>'
<%
			}

			if(! IHL_SBPR_CD_T.equals("")) {
%>
		 		IHL_SBPR_CD='<%= IHL_SBPR_CD_T%>'
<%
			}

			if(! IHL_MGPR_KD_T.equals("")) {
%>
		 		IHL_MGPR_KD='<%= IHL_MGPR_KD_T%>'
<%
			}

			if(! IHL_COMPORT_T.equals("")) {
%>
		 		IHL_COMPORT='<%= IHL_COMPORT_T%>'
<%
			}

			if(! IHL_TELSPD_T.equals("")) {
%>
		 		IHL_TELSPD='<%= IHL_TELSPD_T%>'
<%
			}

			if(! IHL_VAN_NM_T.equals("")) {
%>
		 		IHL_VAN_NM='<%= IHL_VAN_NM_T%>'
<%
			}

			if(! IHL_DANNO_T.equals("")) {
%>
		 		IHL_DANNO='<%= IHL_DANNO_T%>'
<%
			}

			if(! IHL_TRUNC_KD_T.equals("")) {
%>
		 		IHL_TRUNC_KD='<%= IHL_TRUNC_KD_T%>'
<%
			}

			if(! IHL_RECE_KD_T.equals("")) {
%>
		 		IHL_RECE_KD='<%= IHL_RECE_KD_T%>'
<%
			}

			if(! IHL_OCS_KD_T.equals("")) {
%>
		 		IHL_OCS_KD='<%= IHL_OCS_KD_T%>'
<%
			}

			if(! IHL_DBUPDATE_T.equals("")) {
%>
		 		IHL_DBUPDATE='<%= IHL_DBUPDATE_T%>'
<%
			}

			if(! IHL_MUUPDATE_T.equals("")) {
%>
		 		IHL_MUUPDATE='<%= IHL_MUUPDATE_T%>'
<%
			}

			if(! IHL_HIV_KD_T.equals("")) {
%>
		 		IHL_HIV_KD='<%= IHL_HIV_KD_T%>'
<%
			}

			if(! IHL_SVP_KD_T.equals("")) {
%>
		 		IHL_SVP_KD='<%= IHL_SVP_KD_T%>'
<%
			}

			if(! IHL_HEPA_NO_T.equals("")) {
%>
		 		IHL_HEPA_NO='<%= IHL_HEPA_NO_T%>'
<%
			}

			if(! IHL_HIV_NO_T.equals("")) {
%>
		 		IHL_HIV_NO='<%= IHL_HIV_NO_T%>'
<%
			}

			if(! IHL_SVP_NO_T.equals("")) {
%>
		 		IHL_SVP_NO='<%= IHL_SVP_NO_T%>'
<%
			}

			if(! IHL_ATCF_YN_T.equals("")) {
%>
		 		IHL_ATCF_YN='<%= IHL_ATCF_YN_T%>'
<%
			}

			if(! IHL_QSTN_KD_T.equals("")) {
%>
		 		IHL_QSTN_KD='<%= IHL_QSTN_KD_T%>'
<%
			}

			if(! IHL_OCSAUTO_KD_T.equals("")) {
%>
		 		IHL_OCSAUTO_KD='<%= IHL_OCSAUTO_KD_T%>'
<%
			}

			if(! IHL_FOCP_KD_T.equals("")) {
%>
		 		IHL_FOCP_KD='<%= IHL_FOCP_KD_T%>'
<%
			}

			if(! IHL_LAST_CD_T.equals("")) {
%>
		 		IHL_LAST_CD='<%= IHL_LAST_CD_T%>'
<%
			}

			if(! IHL_GUSE_YN_T.equals("")) {
%>
		 		IHL_GUSE_YN='<%= IHL_GUSE_YN_T%>'
<%
			}

			if(! IHL_SUSE_YN_T.equals("")) {
%>
		 		IHL_SUSE_YN='<%= IHL_SUSE_YN_T%>'
<%
			}

			if(! IHL_CUSE_YN_T.equals("")) {
%>
		 		IHL_CUSE_YN='<%= IHL_CUSE_YN_T%>'
<%
			}

			if(! IHL_JUSE_YN_T.equals("")) {
%>
		 		IHL_JUSE_YN='<%= IHL_JUSE_YN_T%>'
<%
			}

			if(! IHL_STUSE_YN_T.equals("")) {
%>
		 		IHL_STUSE_YN='<%= IHL_STUSE_YN_T%>'
<%
			}

			if(! IHL_SOUSE_YN_T.equals("")) {
%>
		 		IHL_SOUSE_YN='<%= IHL_SOUSE_YN_T%>'
<%
			}

			if(! IHL_SPUSE_YN_T.equals("")) {
%>
		 		IHL_SPUSE_YN='<%= IHL_SPUSE_YN_T%>'
<%
			}

			if(! IHL_HOSP_NM2_T.equals("")) {
%>
		 		IHL_HOSP_NM2='<%= IHL_HOSP_NM2_T%>'
<%
			}

			if(! IHL_HOSP_NO2_T.equals("")) {
%>
		 		IHL_HOSP_NO2='<%= IHL_HOSP_NO2_T%>'
<%
			}

			if(! IHL_DTTEL_NO_T.equals("")) {
%>
		 		IHL_DTTEL_NO='<%= IHL_DTTEL_NO_T%>'
<%
			}

			if(! IHL_ZIP_CD2_T.equals("")) {
%>
		 		IHL_ZIP_CD2='<%= IHL_ZIP_CD2_T%>'
<%
			}

			if(! IHL_ZIP_AR2_T.equals("")) {
%>
		 		IHL_ZIP_AR2='<%= IHL_ZIP_AR2_T%>'
<%
			}

			if(! IHL_ROAD_AR2_T.equals("")) {
%>
		 		IHL_ROAD_AR2='<%= IHL_ROAD_AR2_T%>'
<%
			}

			if(! IHL_SPNIGHT_LDL_T.equals("")) {
%>
		 		IHL_SPNIGHT_LDL='<%= IHL_SPNIGHT_LDL_T%>'
<%
			}

			if(! IHL_SPNIGHT_LDL1_T.equals("")) {
%>
		 		IHL_SPNIGHT_LDL1='<%= IHL_SPNIGHT_LDL1_T%>'
<%
			}

			if(! IHL_DIS1_PO_T.equals("")) {
%>
		 		IHL_DIS1_PO='<%= IHL_DIS1_PO_T%>'
<%
			}

			if(! IHL_HOSP_CD_T.equals("")) {
%>
		 		IHL_HOSP_CD='<%= IHL_HOSP_CD_T%>'
<%
			}

			if(! IHL_DRUG_KD_T.equals("")) {
%>
		 		IHL_DRUG_KD='<%= IHL_DRUG_KD_T%>'
<%
			}

			if(! IHL_LOGO_IM_T.equals("")) {
%>
		 		IHL_LOGO_IM='<%= IHL_LOGO_IM_T%>'
<%
			}

			if(! IHL_HOSP_IMG_T.equals("")) {
%>
		 		IHL_HOSP_IMG='<%= IHL_HOSP_IMG_T%>'
<%
			}

			if(! IHL_HOSP_IMG2_T.equals("")) {
%>
		 		IHL_HOSP_IMG2='<%= IHL_HOSP_IMG2_T%>'
<%
			}

			if(! IHL_AUTO_CD_T.equals("")) {
%>
		 		IHL_AUTO_CD='<%= IHL_AUTO_CD_T%>'
<%
			}

			if(! BUCONM_T.equals("")) {
%>
		 		BUCONM='<%= BUCONM_T%>'
<%
			}

			if(! BUCANM_T.equals("")) {
%>
		 		BUCANM='<%= BUCANM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
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
