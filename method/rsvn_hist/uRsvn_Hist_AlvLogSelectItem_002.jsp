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

		String RSVN_NO = htMethod.get("RSVN_NO");
		String INPT_DTT = htMethod.get("INPT_DTT");

		//
		if(RSVN_NO == null) { RSVN_NO = ""; }
		if(INPT_DTT == null) { INPT_DTT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.RRG_RSVN_NO  RSVN_NO,  A.RRG_EXAM_DT  EXAM_DT,
       A.RRG_EXAM_TM  EXAM_TM,  A.RRG_ACPT_CD  ACPT_CD,
       A.RRG_PSNL_ID  PSNL_ID,  A.RRG_PSNL_NM  PSNL_NM,
       A.RRG_CUST_NO  CUST_NO,  A.RRG_CHART_NO CHART_NO,
       A.RRG_SEX_CD   SEX_CD,   A.RRG_PSNL_AGE PSNL_AGE,
       A.RRG_EXAM_CD  EXAM_CD,  A.RRG_SMS_YN   SMS_YN,
       A.RRG_ZIP_CD   ZIP_CD,   A.RRG_ZIP_AR   ZIP_AR,
       A.RRG_ROAD_AR  ROAD_AR,  A.RRG_TEL_NO   TEL_NO,
       A.RRG_MOBL_NO  MOBL_NO,  A.RRG_EMAIL_AR EMAIL_AR,
       A.RRG_COMP_CD  COMP_CD,  A.RRG_DEPT_NM  DEPT_NM,
       A.RRG_HTSB_YN  HTSB_YN,  A.RRG_HTPR_CD  HTPR_CD,
       A.RRG_INSU_NO  INSU_NO,  A.RRG_INSU_CD  INSU_CD,
       A.RRG_ENTY_CD  ENTY_CD,  A.RRG_CNTR_CD  CNTR_CD,
       A.RRG_HEPA_YN  HEPA_YN,  A.RRG_ORAL_YN  ORAL_YN,

       A.RRG_STOMA_CD STOMA_CD, A.RRG_COLON_CD COLON_CD,
       A.RRG_LIVER_CD LIVER_CD, A.RRG_BAST_CD  BAST_CD, 
       A.RRG_UTER_CD  UTER_CD,  A.RRG_STOMA_DR STOMA_DR,
       A.RRG_COLON_DR COLON_DR, A.RRG_LIVER_DR LIVER_DR,
       A.RRG_BAST_DR  BAST_DR,  A.RRG_UTER_DR  UTER_DR,

       A.RRG_HDMD_YN  HDMD_YN,  A.RRG_FAMY_CD  FAMY_CD,
       A.RRG_FAMY_NM  FAMY_NM,  A.RRG_SALES_ID SALES_ID,
       A.RRG_EXAM_LT  EXAM_LT,  A.RRG_EQUIP_LT EQUIP_LT,
       A.RRG_RSVN_TX  RSVN_TX,  A.RRG_NHIC_TX  NHIC_TX,
       A.RRG_EQUIP_TM EQUIP_TM, A.RRG_HCV_YN   HCV_YN,
       A.RRG_DRUG_YN  DRUG_YN,  A.RRG_BLOOD_YN BLOOD_YN,
       A.RRG_ASPL_YN  ASPL_YN,  A.RRG_STOOL_YN STOOL_YN,
       A.RRG_SPSB_YN  SPSB_YN,  A.RRG_EMSB_YN  EMSB_YN,
       A.RRG_ETSB_YN  ETSB_YN,  A.RRG_SPHT_CD  SPHT_CD,
       A.RRG_SDMD_YN  SDMD_YN,  A.RRG_UBEH_YN  UBEH_YN,

       A.RRG_CNCL_YN  CNCL_YN,  A.RRG_STOMA_YN STOMA_YN,
       A.RRG_HLTH_KD  HLTH_KD,  A.RRG_COLON_YN COLON_YN,
       A.RRG_LUNG_CD LUNG_CD,  A.RRG_LUNG_DR LUNG_DR,
       A.RRG_ENTRY_DT ENTRY_DT, A.RRG_QUEST_KD QUEST_KD,
       A.RRG_SMPL_YN  SMPL_YN,  A.RRG_DRUG_DT DRUG_DT,

       F_DOCTOR_FIND('2', A.RRG_STOMA_DR) STOMA_NM,
       F_DOCTOR_FIND('2', A.RRG_COLON_DR) COLON_NM,
       F_DOCTOR_FIND('2', A.RRG_LIVER_DR) LIVER_NM,
       F_DOCTOR_FIND('2', A.RRG_BAST_DR)  BAST_NM,
       F_DOCTOR_FIND('2', A.RRG_UTER_DR)  UTER_NM,
       F_DOCTOR_FIND('2', A.RRG_LUNG_DR)  LUNG_NM,
       F_CODE_FIND('0401', A.RRG_EXAM_CD, '', '1') EXAM_NM,
       F_CODE_FIND('0401', A.RRG_EXAM_CD||'000', '', '1') EXAM_NM2,
       F_CODE_FIND('0401', A.RRG_HTSB_CD, '', '1') HTSB_NM,
       F_CODE_FIND('0418', A.RRG_ACPT_KD, '', '1') ACPT_NM,
       F_CODE_FIND('0902', A.RRG_PLCE_CD, '', '1') PLCE_NM,
       F_CODE_FIND('0711', A.RRG_MMBR_CD, '', '1') MMBR_NM,
       F_CODE_FIND('0712', A.RRG_SEND_CD, '', '1') SEND_NM,
       F_CODE_FIND('0714', A.RRG_RSVN_CD, '', '1') RSVN_NM,
       F_CODE_FIND('0907', A.RRG_ASSO_CD, '', '1') ASSO_NM,
       F_CODE_FIND('0908', A.RRG_CNTR_CD, '', '1') CNTR_NM,
       F_CODE_FIND('0919', A.RRG_FAMY_CD, '', '1') RLTN_NM,
       F_CODE_FIND('0910', A.RRG_SPCL_CD, '', '1') SPCL_NM,
       F_COMP_FIND(A.RRG_COMP_CD) AS COMP_NM 
  FROM RT_RSVT_LOG A 
 WHERE A.RRG_RSVN_NO = :RSVN_NO
   AND TO_CHAR(A.RRG_INPT_DTT, 'YYYY-MM-DD AM HH24:MI:SS') = :INPT_DTT


		*/

		sql = " SELECT A.RRG_RSVN_NO RSVN_NO, A.RRG_EXAM_DT EXAM_DT, A.RRG_EXAM_TM EXAM_TM, A.RRG_ACPT_CD ACPT_CD, A.RRG_PSNL_ID PSNL_ID, A.RRG_PSNL_NM PSNL_NM, A.RRG_CUST_NO CUST_NO, A.RRG_CHART_NO CHART_NO, A.RRG_SEX_CD SEX_CD, A.RRG_PSNL_AGE PSNL_AGE, A.RRG_EXAM_CD EXAM_CD, A.RRG_SMS_YN SMS_YN, A.RRG_ZIP_CD ZIP_CD, A.RRG_ZIP_AR ZIP_AR, A.RRG_ROAD_AR ROAD_AR, A.RRG_TEL_NO TEL_NO, A.RRG_MOBL_NO MOBL_NO, A.RRG_EMAIL_AR EMAIL_AR, A.RRG_COMP_CD COMP_CD, A.RRG_DEPT_NM DEPT_NM, A.RRG_HTSB_YN HTSB_YN, A.RRG_HTPR_CD HTPR_CD, A.RRG_INSU_NO INSU_NO, A.RRG_INSU_CD INSU_CD, A.RRG_ENTY_CD ENTY_CD, A.RRG_CNTR_CD CNTR_CD, A.RRG_HEPA_YN HEPA_YN, A.RRG_ORAL_YN ORAL_YN, A.RRG_STOMA_CD STOMA_CD, A.RRG_COLON_CD COLON_CD, A.RRG_LIVER_CD LIVER_CD, A.RRG_BAST_CD BAST_CD, A.RRG_UTER_CD UTER_CD, A.RRG_STOMA_DR STOMA_DR, A.RRG_COLON_DR COLON_DR, A.RRG_LIVER_DR LIVER_DR, A.RRG_BAST_DR BAST_DR, A.RRG_UTER_DR UTER_DR, A.RRG_HDMD_YN HDMD_YN, A.RRG_FAMY_CD FAMY_CD, A.RRG_FAMY_NM FAMY_NM, A.RRG_SALES_ID SALES_ID, A.RRG_EXAM_LT EXAM_LT, A.RRG_EQUIP_LT EQUIP_LT, A.RRG_RSVN_TX RSVN_TX, A.RRG_NHIC_TX NHIC_TX, A.RRG_EQUIP_TM EQUIP_TM, A.RRG_HCV_YN HCV_YN, A.RRG_DRUG_YN DRUG_YN, A.RRG_BLOOD_YN BLOOD_YN, A.RRG_ASPL_YN ASPL_YN, A.RRG_STOOL_YN STOOL_YN, A.RRG_SPSB_YN SPSB_YN, A.RRG_EMSB_YN EMSB_YN, A.RRG_ETSB_YN ETSB_YN, A.RRG_SPHT_CD SPHT_CD, A.RRG_SDMD_YN SDMD_YN, A.RRG_UBEH_YN UBEH_YN, A.RRG_CNCL_YN CNCL_YN, A.RRG_STOMA_YN STOMA_YN, A.RRG_HLTH_KD HLTH_KD, A.RRG_COLON_YN COLON_YN, A.RRG_LUNG_CD LUNG_CD, A.RRG_LUNG_DR LUNG_DR, A.RRG_ENTRY_DT ENTRY_DT, A.RRG_QUEST_KD QUEST_KD, A.RRG_SMPL_YN SMPL_YN, A.RRG_DRUG_DT DRUG_DT, F_DOCTOR_FIND('2', A.RRG_STOMA_DR) STOMA_NM, F_DOCTOR_FIND('2', A.RRG_COLON_DR) COLON_NM, F_DOCTOR_FIND('2', A.RRG_LIVER_DR) LIVER_NM, F_DOCTOR_FIND('2', A.RRG_BAST_DR) BAST_NM, F_DOCTOR_FIND('2', A.RRG_UTER_DR) UTER_NM, F_DOCTOR_FIND('2', A.RRG_LUNG_DR) LUNG_NM, F_CODE_FIND('0401', A.RRG_EXAM_CD, '', '1') EXAM_NM, F_CODE_FIND('0401', A.RRG_EXAM_CD||'000', '', '1') EXAM_NM2, F_CODE_FIND('0401', A.RRG_HTSB_CD, '', '1') HTSB_NM, F_CODE_FIND('0418', A.RRG_ACPT_KD, '', '1') ACPT_NM, F_CODE_FIND('0902', A.RRG_PLCE_CD, '', '1') PLCE_NM, F_CODE_FIND('0711', A.RRG_MMBR_CD, '', '1') MMBR_NM, F_CODE_FIND('0712', A.RRG_SEND_CD, '', '1') SEND_NM, F_CODE_FIND('0714', A.RRG_RSVN_CD, '', '1') RSVN_NM, F_CODE_FIND('0907', A.RRG_ASSO_CD, '', '1') ASSO_NM, F_CODE_FIND('0908', A.RRG_CNTR_CD, '', '1') CNTR_NM, F_CODE_FIND('0919', A.RRG_FAMY_CD, '', '1') RLTN_NM, F_CODE_FIND('0910', A.RRG_SPCL_CD, '', '1') SPCL_NM, F_COMP_FIND(A.RRG_COMP_CD) AS COMP_NM";
		sql += " FROM RT_RSVT_LOG A";
		sql += " WHERE A.RRG_RSVN_NO = '" + RSVN_NO + "'";
		sql += " AND TO_CHAR(A.RRG_INPT_DTT, 'YYYY-MM-DD AM HH24:MI:SS') = '" + INPT_DTT + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Hist_AlvLogSelectItem_002 \n";
			G_INFO += "설명 : 예약이력 조회 - 과거 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
			G_INFO += " INPT_DTT : " + INPT_DTT + " \n";
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
		<s:AttributeType name='RSVN_NO' rs:number='1' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='RRG_RSVN_NO'>
			<s:datatype dt:type='string' dt:maxLength='14' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_DT' rs:number='2' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='RRG_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_TM' rs:number='3' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='RRG_EXAM_TM'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ACPT_CD' rs:number='4' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='RRG_ACPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_ID' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_PSNL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_NM' rs:number='6' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='RRG_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CUST_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CHART_NO' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SEX_CD' rs:number='9' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='RRG_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_AGE' rs:number='10' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='RRG_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_CD' rs:number='11' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='RRG_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SMS_YN' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_SMS_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='ZIP_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='ZIP_AR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROAD_AR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='TEL_NO' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='MOBL_NO' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EMAIL_AR' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='COMP_CD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='DEPT_NM' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='HTSB_YN' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_HTSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='HTPR_CD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_HTPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='INSU_NO' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_INSU_NO'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='INSU_CD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_INSU_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ENTY_CD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_ENTY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CNTR_CD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_CNTR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='HEPA_YN' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_HEPA_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='ORAL_YN' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_ORAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='STOMA_CD' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_STOMA_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='COLON_CD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_COLON_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='LIVER_CD' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_LIVER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='BAST_CD' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_BAST_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='UTER_CD' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_UTER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='STOMA_DR' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_STOMA_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='COLON_DR' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_COLON_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='LIVER_DR' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_LIVER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BAST_DR' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_BAST_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='UTER_DR' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_UTER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='HDMD_YN' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_HDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='FAMY_CD' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_FAMY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='FAMY_NM' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_FAMY_NM'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='SALES_ID' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_SALES_ID'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_LT' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_EXAM_LT'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='EQUIP_LT' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_EQUIP_LT'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_TX' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_RSVN_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='NHIC_TX' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_NHIC_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='EQUIP_TM' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_EQUIP_TM'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='HCV_YN' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_HCV_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='DRUG_YN' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_DRUG_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='BLOOD_YN' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_BLOOD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='ASPL_YN' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_ASPL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='STOOL_YN' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_STOOL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='SPSB_YN' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_SPSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EMSB_YN' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_EMSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='ETSB_YN' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_ETSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='SPHT_CD' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_SPHT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='SDMD_YN' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_SDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='UBEH_YN' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_UBEH_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='CNCL_YN' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_CNCL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='STOMA_YN' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_STOMA_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='HLTH_KD' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='COLON_YN' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_COLON_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='LUNG_CD' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_LUNG_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='LUNG_DR' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_LUNG_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ENTRY_DT' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_ENTRY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='QUEST_KD' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_QUEST_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SMPL_YN' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_SMPL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='DRUG_DT' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_LOG'
			 rs:basecolumn='RRG_DRUG_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='STOMA_NM' rs:number='69' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='COLON_NM' rs:number='70' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='LIVER_NM' rs:number='71' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='BAST_NM' rs:number='72' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='UTER_NM' rs:number='73' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='LUNG_NM' rs:number='74' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NM' rs:number='75' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NM2' rs:number='76' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HTSB_NM' rs:number='77' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ACPT_NM' rs:number='78' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='PLCE_NM' rs:number='79' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='MMBR_NM' rs:number='80' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SEND_NM' rs:number='81' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_NM' rs:number='82' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ASSO_NM' rs:number='83' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CNTR_NM' rs:number='84' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RLTN_NM' rs:number='85' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPCL_NM' rs:number='86' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='COMP_NM' rs:number='87' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='88' rs:rowid='true' rs:basetable='RT_RSVT_LOG' rs:basecolumn='ROWID'
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

			String RSVN_NO_T = cRsList.getString("RSVN_NO");
			String EXAM_DT_T = cRsList.getString("EXAM_DT");
			String EXAM_TM_T = cRsList.getString("EXAM_TM");
			String ACPT_CD_T = cRsList.getString("ACPT_CD");
			String PSNL_ID_T = cRsList.getString("PSNL_ID");
			String PSNL_NM_T = cRsList.getString("PSNL_NM");
			String CUST_NO_T = cRsList.getString("CUST_NO");
			String CHART_NO_T = cRsList.getString("CHART_NO");
			String SEX_CD_T = cRsList.getString("SEX_CD");
			String PSNL_AGE_T = cRsList.getString("PSNL_AGE");
			String EXAM_CD_T = cRsList.getString("EXAM_CD");
			String SMS_YN_T = cRsList.getString("SMS_YN");
			String ZIP_CD_T = cRsList.getString("ZIP_CD");
			String ZIP_AR_T = cRsList.getString("ZIP_AR");
			String ROAD_AR_T = cRsList.getString("ROAD_AR");
			String TEL_NO_T = cRsList.getString("TEL_NO");
			String MOBL_NO_T = cRsList.getString("MOBL_NO");
			String EMAIL_AR_T = cRsList.getString("EMAIL_AR");
			String COMP_CD_T = cRsList.getString("COMP_CD");
			String DEPT_NM_T = cRsList.getString("DEPT_NM");
			String HTSB_YN_T = cRsList.getString("HTSB_YN");
			String HTPR_CD_T = cRsList.getString("HTPR_CD");
			String INSU_NO_T = cRsList.getString("INSU_NO");
			String INSU_CD_T = cRsList.getString("INSU_CD");
			String ENTY_CD_T = cRsList.getString("ENTY_CD");
			String CNTR_CD_T = cRsList.getString("CNTR_CD");
			String HEPA_YN_T = cRsList.getString("HEPA_YN");
			String ORAL_YN_T = cRsList.getString("ORAL_YN");
			String STOMA_CD_T = cRsList.getString("STOMA_CD");
			String COLON_CD_T = cRsList.getString("COLON_CD");
			String LIVER_CD_T = cRsList.getString("LIVER_CD");
			String BAST_CD_T = cRsList.getString("BAST_CD");
			String UTER_CD_T = cRsList.getString("UTER_CD");
			String STOMA_DR_T = cRsList.getString("STOMA_DR");
			String COLON_DR_T = cRsList.getString("COLON_DR");
			String LIVER_DR_T = cRsList.getString("LIVER_DR");
			String BAST_DR_T = cRsList.getString("BAST_DR");
			String UTER_DR_T = cRsList.getString("UTER_DR");
			String HDMD_YN_T = cRsList.getString("HDMD_YN");
			String FAMY_CD_T = cRsList.getString("FAMY_CD");
			String FAMY_NM_T = cRsList.getString("FAMY_NM");
			String SALES_ID_T = cRsList.getString("SALES_ID");
			String EXAM_LT_T = cRsList.getString("EXAM_LT");
			String EQUIP_LT_T = cRsList.getString("EQUIP_LT");
			String RSVN_TX_T = cRsList.getString("RSVN_TX");
			String NHIC_TX_T = cRsList.getString("NHIC_TX");
			String EQUIP_TM_T = cRsList.getString("EQUIP_TM");
			String HCV_YN_T = cRsList.getString("HCV_YN");
			String DRUG_YN_T = cRsList.getString("DRUG_YN");
			String BLOOD_YN_T = cRsList.getString("BLOOD_YN");
			String ASPL_YN_T = cRsList.getString("ASPL_YN");
			String STOOL_YN_T = cRsList.getString("STOOL_YN");
			String SPSB_YN_T = cRsList.getString("SPSB_YN");
			String EMSB_YN_T = cRsList.getString("EMSB_YN");
			String ETSB_YN_T = cRsList.getString("ETSB_YN");
			String SPHT_CD_T = cRsList.getString("SPHT_CD");
			String SDMD_YN_T = cRsList.getString("SDMD_YN");
			String UBEH_YN_T = cRsList.getString("UBEH_YN");
			String CNCL_YN_T = cRsList.getString("CNCL_YN");
			String STOMA_YN_T = cRsList.getString("STOMA_YN");
			String HLTH_KD_T = cRsList.getString("HLTH_KD");
			String COLON_YN_T = cRsList.getString("COLON_YN");
			String LUNG_CD_T = cRsList.getString("LUNG_CD");
			String LUNG_DR_T = cRsList.getString("LUNG_DR");
			String ENTRY_DT_T = cRsList.getString("ENTRY_DT");
			String QUEST_KD_T = cRsList.getString("QUEST_KD");
			String SMPL_YN_T = cRsList.getString("SMPL_YN");
			String DRUG_DT_T = cRsList.getString("DRUG_DT");
			String STOMA_NM_T = cRsList.getString("STOMA_NM");
			String COLON_NM_T = cRsList.getString("COLON_NM");
			String LIVER_NM_T = cRsList.getString("LIVER_NM");
			String BAST_NM_T = cRsList.getString("BAST_NM");
			String UTER_NM_T = cRsList.getString("UTER_NM");
			String LUNG_NM_T = cRsList.getString("LUNG_NM");
			String EXAM_NM_T = cRsList.getString("EXAM_NM");
			String EXAM_NM2_T = cRsList.getString("EXAM_NM2");
			String HTSB_NM_T = cRsList.getString("HTSB_NM");
			String ACPT_NM_T = cRsList.getString("ACPT_NM");
			String PLCE_NM_T = cRsList.getString("PLCE_NM");
			String MMBR_NM_T = cRsList.getString("MMBR_NM");
			String SEND_NM_T = cRsList.getString("SEND_NM");
			String RSVN_NM_T = cRsList.getString("RSVN_NM");
			String ASSO_NM_T = cRsList.getString("ASSO_NM");
			String CNTR_NM_T = cRsList.getString("CNTR_NM");
			String RLTN_NM_T = cRsList.getString("RLTN_NM");
			String SPCL_NM_T = cRsList.getString("SPCL_NM");
			String COMP_NM_T = cRsList.getString("COMP_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! RSVN_NO_T.equals("")) {
%>
		 		RSVN_NO='<%= RSVN_NO_T%>'
<%
			}

			if(! EXAM_DT_T.equals("")) {
%>
		 		EXAM_DT='<%= EXAM_DT_T%>'
<%
			}

			if(! EXAM_TM_T.equals("")) {
%>
		 		EXAM_TM='<%= EXAM_TM_T%>'
<%
			}

			if(! ACPT_CD_T.equals("")) {
%>
		 		ACPT_CD='<%= ACPT_CD_T%>'
<%
			}

			if(! PSNL_ID_T.equals("")) {
%>
		 		PSNL_ID='<%= PSNL_ID_T%>'
<%
			}

			if(! PSNL_NM_T.equals("")) {
%>
		 		PSNL_NM='<%= PSNL_NM_T%>'
<%
			}

			if(! CUST_NO_T.equals("")) {
%>
		 		CUST_NO='<%= CUST_NO_T%>'
<%
			}

			if(! CHART_NO_T.equals("")) {
%>
		 		CHART_NO='<%= CHART_NO_T%>'
<%
			}

			if(! SEX_CD_T.equals("")) {
%>
		 		SEX_CD='<%= SEX_CD_T%>'
<%
			}

			if(! PSNL_AGE_T.equals("")) {
%>
		 		PSNL_AGE='<%= PSNL_AGE_T%>'
<%
			}

			if(! EXAM_CD_T.equals("")) {
%>
		 		EXAM_CD='<%= EXAM_CD_T%>'
<%
			}

			if(! SMS_YN_T.equals("")) {
%>
		 		SMS_YN='<%= SMS_YN_T%>'
<%
			}

			if(! ZIP_CD_T.equals("")) {
%>
		 		ZIP_CD='<%= ZIP_CD_T%>'
<%
			}

			if(! ZIP_AR_T.equals("")) {
%>
		 		ZIP_AR='<%= ZIP_AR_T%>'
<%
			}

			if(! ROAD_AR_T.equals("")) {
%>
		 		ROAD_AR='<%= ROAD_AR_T%>'
<%
			}

			if(! TEL_NO_T.equals("")) {
%>
		 		TEL_NO='<%= TEL_NO_T%>'
<%
			}

			if(! MOBL_NO_T.equals("")) {
%>
		 		MOBL_NO='<%= MOBL_NO_T%>'
<%
			}

			if(! EMAIL_AR_T.equals("")) {
%>
		 		EMAIL_AR='<%= EMAIL_AR_T%>'
<%
			}

			if(! COMP_CD_T.equals("")) {
%>
		 		COMP_CD='<%= COMP_CD_T%>'
<%
			}

			if(! DEPT_NM_T.equals("")) {
%>
		 		DEPT_NM='<%= DEPT_NM_T%>'
<%
			}

			if(! HTSB_YN_T.equals("")) {
%>
		 		HTSB_YN='<%= HTSB_YN_T%>'
<%
			}

			if(! HTPR_CD_T.equals("")) {
%>
		 		HTPR_CD='<%= HTPR_CD_T%>'
<%
			}

			if(! INSU_NO_T.equals("")) {
%>
		 		INSU_NO='<%= INSU_NO_T%>'
<%
			}

			if(! INSU_CD_T.equals("")) {
%>
		 		INSU_CD='<%= INSU_CD_T%>'
<%
			}

			if(! ENTY_CD_T.equals("")) {
%>
		 		ENTY_CD='<%= ENTY_CD_T%>'
<%
			}

			if(! CNTR_CD_T.equals("")) {
%>
		 		CNTR_CD='<%= CNTR_CD_T%>'
<%
			}

			if(! HEPA_YN_T.equals("")) {
%>
		 		HEPA_YN='<%= HEPA_YN_T%>'
<%
			}

			if(! ORAL_YN_T.equals("")) {
%>
		 		ORAL_YN='<%= ORAL_YN_T%>'
<%
			}

			if(! STOMA_CD_T.equals("")) {
%>
		 		STOMA_CD='<%= STOMA_CD_T%>'
<%
			}

			if(! COLON_CD_T.equals("")) {
%>
		 		COLON_CD='<%= COLON_CD_T%>'
<%
			}

			if(! LIVER_CD_T.equals("")) {
%>
		 		LIVER_CD='<%= LIVER_CD_T%>'
<%
			}

			if(! BAST_CD_T.equals("")) {
%>
		 		BAST_CD='<%= BAST_CD_T%>'
<%
			}

			if(! UTER_CD_T.equals("")) {
%>
		 		UTER_CD='<%= UTER_CD_T%>'
<%
			}

			if(! STOMA_DR_T.equals("")) {
%>
		 		STOMA_DR='<%= STOMA_DR_T%>'
<%
			}

			if(! COLON_DR_T.equals("")) {
%>
		 		COLON_DR='<%= COLON_DR_T%>'
<%
			}

			if(! LIVER_DR_T.equals("")) {
%>
		 		LIVER_DR='<%= LIVER_DR_T%>'
<%
			}

			if(! BAST_DR_T.equals("")) {
%>
		 		BAST_DR='<%= BAST_DR_T%>'
<%
			}

			if(! UTER_DR_T.equals("")) {
%>
		 		UTER_DR='<%= UTER_DR_T%>'
<%
			}

			if(! HDMD_YN_T.equals("")) {
%>
		 		HDMD_YN='<%= HDMD_YN_T%>'
<%
			}

			if(! FAMY_CD_T.equals("")) {
%>
		 		FAMY_CD='<%= FAMY_CD_T%>'
<%
			}

			if(! FAMY_NM_T.equals("")) {
%>
		 		FAMY_NM='<%= FAMY_NM_T%>'
<%
			}

			if(! SALES_ID_T.equals("")) {
%>
		 		SALES_ID='<%= SALES_ID_T%>'
<%
			}

			if(! EXAM_LT_T.equals("")) {
%>
		 		EXAM_LT='<%= EXAM_LT_T%>'
<%
			}

			if(! EQUIP_LT_T.equals("")) {
%>
		 		EQUIP_LT='<%= EQUIP_LT_T%>'
<%
			}

			if(! RSVN_TX_T.equals("")) {
%>
		 		RSVN_TX='<%= RSVN_TX_T%>'
<%
			}

			if(! NHIC_TX_T.equals("")) {
%>
		 		NHIC_TX='<%= NHIC_TX_T%>'
<%
			}

			if(! EQUIP_TM_T.equals("")) {
%>
		 		EQUIP_TM='<%= EQUIP_TM_T%>'
<%
			}

			if(! HCV_YN_T.equals("")) {
%>
		 		HCV_YN='<%= HCV_YN_T%>'
<%
			}

			if(! DRUG_YN_T.equals("")) {
%>
		 		DRUG_YN='<%= DRUG_YN_T%>'
<%
			}

			if(! BLOOD_YN_T.equals("")) {
%>
		 		BLOOD_YN='<%= BLOOD_YN_T%>'
<%
			}

			if(! ASPL_YN_T.equals("")) {
%>
		 		ASPL_YN='<%= ASPL_YN_T%>'
<%
			}

			if(! STOOL_YN_T.equals("")) {
%>
		 		STOOL_YN='<%= STOOL_YN_T%>'
<%
			}

			if(! SPSB_YN_T.equals("")) {
%>
		 		SPSB_YN='<%= SPSB_YN_T%>'
<%
			}

			if(! EMSB_YN_T.equals("")) {
%>
		 		EMSB_YN='<%= EMSB_YN_T%>'
<%
			}

			if(! ETSB_YN_T.equals("")) {
%>
		 		ETSB_YN='<%= ETSB_YN_T%>'
<%
			}

			if(! SPHT_CD_T.equals("")) {
%>
		 		SPHT_CD='<%= SPHT_CD_T%>'
<%
			}

			if(! SDMD_YN_T.equals("")) {
%>
		 		SDMD_YN='<%= SDMD_YN_T%>'
<%
			}

			if(! UBEH_YN_T.equals("")) {
%>
		 		UBEH_YN='<%= UBEH_YN_T%>'
<%
			}

			if(! CNCL_YN_T.equals("")) {
%>
		 		CNCL_YN='<%= CNCL_YN_T%>'
<%
			}

			if(! STOMA_YN_T.equals("")) {
%>
		 		STOMA_YN='<%= STOMA_YN_T%>'
<%
			}

			if(! HLTH_KD_T.equals("")) {
%>
		 		HLTH_KD='<%= HLTH_KD_T%>'
<%
			}

			if(! COLON_YN_T.equals("")) {
%>
		 		COLON_YN='<%= COLON_YN_T%>'
<%
			}

			if(! LUNG_CD_T.equals("")) {
%>
		 		LUNG_CD='<%= LUNG_CD_T%>'
<%
			}

			if(! LUNG_DR_T.equals("")) {
%>
		 		LUNG_DR='<%= LUNG_DR_T%>'
<%
			}

			if(! ENTRY_DT_T.equals("")) {
%>
		 		ENTRY_DT='<%= ENTRY_DT_T%>'
<%
			}

			if(! QUEST_KD_T.equals("")) {
%>
		 		QUEST_KD='<%= QUEST_KD_T%>'
<%
			}

			if(! SMPL_YN_T.equals("")) {
%>
		 		SMPL_YN='<%= SMPL_YN_T%>'
<%
			}

			if(! DRUG_DT_T.equals("")) {
%>
		 		DRUG_DT='<%= DRUG_DT_T%>'
<%
			}

			if(! STOMA_NM_T.equals("")) {
%>
		 		STOMA_NM='<%= STOMA_NM_T%>'
<%
			}

			if(! COLON_NM_T.equals("")) {
%>
		 		COLON_NM='<%= COLON_NM_T%>'
<%
			}

			if(! LIVER_NM_T.equals("")) {
%>
		 		LIVER_NM='<%= LIVER_NM_T%>'
<%
			}

			if(! BAST_NM_T.equals("")) {
%>
		 		BAST_NM='<%= BAST_NM_T%>'
<%
			}

			if(! UTER_NM_T.equals("")) {
%>
		 		UTER_NM='<%= UTER_NM_T%>'
<%
			}

			if(! LUNG_NM_T.equals("")) {
%>
		 		LUNG_NM='<%= LUNG_NM_T%>'
<%
			}

			if(! EXAM_NM_T.equals("")) {
%>
		 		EXAM_NM='<%= EXAM_NM_T%>'
<%
			}

			if(! EXAM_NM2_T.equals("")) {
%>
		 		EXAM_NM2='<%= EXAM_NM2_T%>'
<%
			}

			if(! HTSB_NM_T.equals("")) {
%>
		 		HTSB_NM='<%= HTSB_NM_T%>'
<%
			}

			if(! ACPT_NM_T.equals("")) {
%>
		 		ACPT_NM='<%= ACPT_NM_T%>'
<%
			}

			if(! PLCE_NM_T.equals("")) {
%>
		 		PLCE_NM='<%= PLCE_NM_T%>'
<%
			}

			if(! MMBR_NM_T.equals("")) {
%>
		 		MMBR_NM='<%= MMBR_NM_T%>'
<%
			}

			if(! SEND_NM_T.equals("")) {
%>
		 		SEND_NM='<%= SEND_NM_T%>'
<%
			}

			if(! RSVN_NM_T.equals("")) {
%>
		 		RSVN_NM='<%= RSVN_NM_T%>'
<%
			}

			if(! ASSO_NM_T.equals("")) {
%>
		 		ASSO_NM='<%= ASSO_NM_T%>'
<%
			}

			if(! CNTR_NM_T.equals("")) {
%>
		 		CNTR_NM='<%= CNTR_NM_T%>'
<%
			}

			if(! RLTN_NM_T.equals("")) {
%>
		 		RLTN_NM='<%= RLTN_NM_T%>'
<%
			}

			if(! SPCL_NM_T.equals("")) {
%>
		 		SPCL_NM='<%= SPCL_NM_T%>'
<%
			}

			if(! COMP_NM_T.equals("")) {
%>
		 		COMP_NM='<%= COMP_NM_T%>'
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
