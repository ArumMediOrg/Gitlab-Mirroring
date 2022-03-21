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
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

    if (:g_Encrt_Kd = '1') then
      SELECT B.ICR_PID_EN AS ICR_PENL_DE,
    else if (:g_Encrt_Kd = '2') then
      SELECT ECHELONDB.ecl_decrypt(B.ICR_PID_EN) AS ICR_PENL_DE, 
    else
      SELECT B.ICR_PENL_ID AS ICR_PENL_DE, 

                F_CODE_FIND('0908', A.EEA_CNTR_CD, '', '1') EEA_CNTR_NM,
                A.*, S.*, B.ICR_PENL_ID, 
                C.IAU_LICEN1_NO LICEN_NO1, C.IAU_PENL_NM LICEN_NM1, D.IAU_LICEN1_NO LICEN_NO2, D.IAU_PENL_NM LICEN_NM2 
      FROM ET_EXAM_ACPT A  
                INNER JOIN IT_CUSTOMER B ON A.EEA_CUST_NO = B.ICR_CUST_NO 
      LEFT OUTER JOIN ET_CANCER_HEADER H ON 
      H.ECH_EXAM_DT = A.EEA_EXAM_DT AND 
                H.ECH_EXAM_SQ = A.EEA_EXAM_SQ 
      LEFT OUTER JOIN ET_CANCER_LIVER S ON 
                S.ECL_EXAM_DT = A.EEA_EXAM_DT AND 
                S.ECL_EXAM_SQ = A.EEA_EXAM_SQ
      LEFT OUTER JOIN IT_AUTH_USER C ON 
                C.IAU_EMP_NO = S.ECL_LICEN_CD AND NVL(S.ECL_LICEN_CD, ' ') <> ' ' 
      LEFT OUTER JOIN IT_AUTH_USER D ON 
                D.IAU_EMP_NO = S.ECL_CKUP_LICEN_CD AND NVL(S.ECL_CKUP_LICEN_CD, ' ') <> ' '
      WHERE A.EEA_EXAM_DT = :EXAM_DT
                AND A.EEA_EXAM_SQ = :EXAM_SQ

		*/

		if(G_ENCRT_KD.equals("1")) {
			sql = " SELECT B.ICR_PID_EN AS ICR_PENL_DE,";
		}
		else if(G_ENCRT_KD.equals("2")) {
			sql = " SELECT ECL_DECRYPT(B.ICR_PID_EN) AS ICR_PENL_DE,";
		}
		else {
			sql = " SELECT B.ICR_PENL_ID AS ICR_PENL_DE,";
		}

		sql += " F_CODE_FIND('0908', A.EEA_CNTR_CD, '', '1') EEA_CNTR_NM, A.*, S.*, B.ICR_PENL_ID, C.IAU_LICEN1_NO LICEN_NO1, C.IAU_PENL_NM LICEN_NM1, D.IAU_LICEN1_NO LICEN_NO2, D.IAU_PENL_NM LICEN_NM2";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN ET_CANCER_HEADER H";
		sql += " ON H.ECH_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND H.ECH_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LIVER S";
		sql += " ON S.ECL_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND S.ECL_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN IT_AUTH_USER C";
		sql += " ON C.IAU_EMP_NO = S.ECL_LICEN_CD";
		sql += " AND NVL(S.ECL_LICEN_CD, ' ') <> ' ' LEFT OUTER JOIN IT_AUTH_USER D";
		sql += " ON D.IAU_EMP_NO = S.ECL_CKUP_LICEN_CD";
		sql += " AND NVL(S.ECL_CKUP_LICEN_CD, ' ') <> ' '";
		sql += " WHERE A.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCancer_Record_Liver_DetailBand1BeforePrint_001 \n";
			G_INFO += "설명 : 간암 검사정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " G_ENCRT_KD : " + G_ENCRT_KD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='EEA_CNTR_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_TM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_TM'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSVN_NO' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RSVN_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_CD' rs:number='7' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_ACPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_KD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='9' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='10' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MMBR_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MMBR_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='13' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_SQ' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_AR' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ROAD_AR' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BLDG_NO' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BLDG_NO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEL_NO' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMAIL_AR' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_CD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEND_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_DT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEND_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SMS_YN' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SMS_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COTK_CD' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COTK_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_NOTE_YN' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_NOTE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_CD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CD' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENTRY_DT' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENTRY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CS' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_CS'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CLSS_KD' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CLSS_KD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_CD' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FAMY_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_NM' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FAMY_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RFID_NO' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RFID_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FOOD_YN' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FOOD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SALES_ID' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SALES_ID'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='42' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_CD' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_CD' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_CD' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_CD' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_CD' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_YN' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_YN' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_YN' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_YN' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_YN' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTPR_CD' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPPR_CD' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVPR_CD' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMPR_CD' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETPR_CD' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNCL_CD' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_YR' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_HTYR' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_HTYR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_SPYM' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_SPYM'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_LT' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EXAM_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_LT' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_LT' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_LT' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_LT' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_LT' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADD_LT' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ADD_LT'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORDER_LT' rs:number='70' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORDER_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='71' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPHT_CD' rs:number='72' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPHT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_NO' rs:number='73' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INSU_NO'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_CD' rs:number='74' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INSU_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENTY_CD' rs:number='75' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENTY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ASSO_CD' rs:number='76' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ASSO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNTR_CD' rs:number='77' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNTR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ARMY_CD' rs:number='78' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ARMY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HEPA_YN' rs:number='79' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HEPA_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_YN' rs:number='80' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANAD_YN' rs:number='81' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANAD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HOLIDAY_YN' rs:number='82' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HOLIDAY_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_CD' rs:number='83' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_STOMA_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_CD' rs:number='84' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COLON_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_CD' rs:number='85' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIVER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_CD' rs:number='86' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BAST_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_CD' rs:number='87' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UTER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_DR' rs:number='88' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_STOMA_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_DR' rs:number='89' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COLON_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_DR' rs:number='90' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIVER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_DR' rs:number='91' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BAST_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_DR' rs:number='92' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UTER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNCR_DT' rs:number='93' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNCR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HDMD_YN' rs:number='94' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SDMD_YN' rs:number='95' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPRT_PR' rs:number='96' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPRT_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_PR' rs:number='97' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_PR' rs:number='98' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTH_PR' rs:number='99' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTH_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_PR' rs:number='100' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CAN_PR' rs:number='101' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CAN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_PR' rs:number='102' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORAL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMPR_PR' rs:number='103' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMPR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNLR_PR' rs:number='104' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNLR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTHR_PR' rs:number='105' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTHR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCLR_PR' rs:number='106' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCLR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANR_PR' rs:number='107' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORALR_PR' rs:number='108' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORALR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PYER_CD' rs:number='109' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PYER_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CMPY_CD' rs:number='110' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CMPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PRPY_CD' rs:number='111' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PRPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RECE_NO' rs:number='112' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RECE_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RECE_KD' rs:number='113' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RECE_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSLT_CD' rs:number='114' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_RSLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BLRT_CD' rs:number='115' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_BLRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEFER_KD' rs:number='116' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEFER_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORDER_YN' rs:number='117' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORDER_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_NHIC_TX' rs:number='118' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_NHIC_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_TX' rs:number='119' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INPT_ID' rs:number='120' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INPT_DTT' rs:number='121' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MODI_ID' rs:number='122' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MODI_DTT' rs:number='123' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANAD_KD' rs:number='124' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANAD_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_2ND_YN' rs:number='125' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_2ND_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD2' rs:number='126' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD2'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIFE_YN' rs:number='127' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIFE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TOTAL_YN' rs:number='128' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_TOTAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_OCS_DR' rs:number='129' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_OCS_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HCV_YN' rs:number='130' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HCV_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_OCS_DV' rs:number='131' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_OCS_DV'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_OCS_NO' rs:number='132' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_OCS_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LABEL_DT' rs:number='133' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LABEL_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXEC_ID' rs:number='134' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EXEC_ID'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SELF_KD' rs:number='135' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SELF_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANPR_KD' rs:number='136' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANPR_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTH_KD' rs:number='137' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SAFE_YN' rs:number='138' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SAFE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADD_DT' rs:number='139' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ADD_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENDO_DR' rs:number='140' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENDO_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PDF_KD' rs:number='141' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PDF_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_CD' rs:number='142' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LUNG_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_DR' rs:number='143' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LUNG_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_KD' rs:number='144' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LUNG_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UBEH_YN' rs:number='145' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UBEH_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_EXAM_DT' rs:number='146' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_EXAM_SQ' rs:number='147' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_CFRM_CD' rs:number='148' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_LVEX_DT' rs:number='149' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_LVEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_ALT_VL' rs:number='150' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_ALT_VL'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBTP_KD' rs:number='151' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBTP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBRT_CD' rs:number='152' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBRT_VL' rs:number='153' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBRT_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBVL_VL' rs:number='154' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBVL_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBPJ_KD' rs:number='155' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBPJ_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCTP_KD' rs:number='156' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCTP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCRT_CD' rs:number='157' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCRT_VL' rs:number='158' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCRT_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCVL_VL' rs:number='159' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCVL_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCPJ_KD' rs:number='160' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCPJ_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL1_KD' rs:number='161' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL2_KD' rs:number='162' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL3_KD' rs:number='163' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USPO_KD' rs:number='164' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USPO_KD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN1_KD' rs:number='165' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_KD' rs:number='166' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN3_KD' rs:number='167' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USETC_KD' rs:number='168' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USETC_EX' rs:number='169' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPTP_KD' rs:number='170' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPTP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPRT_CD' rs:number='171' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPRT_VL' rs:number='172' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPRT_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPRT_UNIT' rs:number='173' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPRT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPVL_VL' rs:number='174' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPVL_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_RSLT_KD' rs:number='175' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_ETC_EX' rs:number='176' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_LICN_YN' rs:number='177' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_LICN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_RSLT_EX' rs:number='178' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_RPT_DT' rs:number='179' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_CFRM_DT' rs:number='180' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_LICEN_CD' rs:number='181' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_INPUT_DTT' rs:number='182' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_INPUT_ID' rs:number='183' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_MODI_DTT' rs:number='184' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_MODI_ID' rs:number='185' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_1_KD' rs:number='186' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_1_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_VL1' rs:number='187' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_VL1'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_VL2' rs:number='188' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_VL2'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_VL3' rs:number='189' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_VL3'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USETC_EX2' rs:number='190' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USETC_EX2'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_CKUP_LICEN_CD' rs:number='191' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_CKUP_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL4_KD' rs:number='192' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL4_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL5_KD' rs:number='193' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL5_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL6_KD' rs:number='194' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL6_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL7_KD' rs:number='195' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL7_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='196' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='LICEN_NO1' rs:number='197' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='LICEN_NM1' rs:number='198' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='LICEN_NO2' rs:number='199' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='LICEN_NM2' rs:number='200' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='201' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c201' rs:name='ROWID' rs:number='202' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c202' rs:name='ROWID' rs:number='203' rs:rowid='true' rs:basetable='ET_CANCER_HEADER'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c203' rs:name='ROWID' rs:number='204' rs:rowid='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c204' rs:name='ROWID' rs:number='205' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c205' rs:name='ROWID' rs:number='206' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String ICR_PENL_DE_T = cRsList.getString("ICR_PENL_DE");
			String EEA_CNTR_NM_T = cRsList.getString("EEA_CNTR_NM");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_ACPT_TM_T = cRsList.getString("EEA_ACPT_TM");
			String EEA_RSVN_NO_T = cRsList.getString("EEA_RSVN_NO");
			String EEA_ACPT_CD_T = cRsList.getString("EEA_ACPT_CD");
			String EEA_ACPT_KD_T = cRsList.getString("EEA_ACPT_KD");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_MMBR_CD_T = cRsList.getString("EEA_MMBR_CD");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_ZIP_CD_T = cRsList.getString("EEA_ZIP_CD");
			String EEA_ZIP_SQ_T = cRsList.getString("EEA_ZIP_SQ");
			String EEA_ZIP_AR_T = cRsList.getString("EEA_ZIP_AR");
			String EEA_ROAD_AR_T = cRsList.getString("EEA_ROAD_AR");
			String EEA_BLDG_NO_T = cRsList.getString("EEA_BLDG_NO");
			String EEA_TEL_NO_T = cRsList.getString("EEA_TEL_NO");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_EMAIL_AR_T = cRsList.getString("EEA_EMAIL_AR");
			String EEA_SEND_CD_T = cRsList.getString("EEA_SEND_CD");
			String EEA_SEND_DT_T = cRsList.getString("EEA_SEND_DT");
			String EEA_SMS_YN_T = cRsList.getString("EEA_SMS_YN");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_COTK_CD_T = cRsList.getString("EEA_COTK_CD");
			String EEA_NOTE_YN_T = cRsList.getString("EEA_NOTE_YN");
			String EEA_DEPT_CD_T = cRsList.getString("EEA_DEPT_CD");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_DIVI_CD_T = cRsList.getString("EEA_DIVI_CD");
			String EEA_ENTRY_DT_T = cRsList.getString("EEA_ENTRY_DT");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_DIVI_CS_T = cRsList.getString("EEA_DIVI_CS");
			String EEA_CLSS_KD_T = cRsList.getString("EEA_CLSS_KD");
			String EEA_FAMY_CD_T = cRsList.getString("EEA_FAMY_CD");
			String EEA_FAMY_NM_T = cRsList.getString("EEA_FAMY_NM");
			String EEA_RFID_NO_T = cRsList.getString("EEA_RFID_NO");
			String EEA_FOOD_YN_T = cRsList.getString("EEA_FOOD_YN");
			String EEA_SALES_ID_T = cRsList.getString("EEA_SALES_ID");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_HTSB_CD_T = cRsList.getString("EEA_HTSB_CD");
			String EEA_SPSB_CD_T = cRsList.getString("EEA_SPSB_CD");
			String EEA_CVSB_CD_T = cRsList.getString("EEA_CVSB_CD");
			String EEA_EMSB_CD_T = cRsList.getString("EEA_EMSB_CD");
			String EEA_ETSB_CD_T = cRsList.getString("EEA_ETSB_CD");
			String EEA_HTSB_YN_T = cRsList.getString("EEA_HTSB_YN");
			String EEA_SPSB_YN_T = cRsList.getString("EEA_SPSB_YN");
			String EEA_CVSB_YN_T = cRsList.getString("EEA_CVSB_YN");
			String EEA_EMSB_YN_T = cRsList.getString("EEA_EMSB_YN");
			String EEA_ETSB_YN_T = cRsList.getString("EEA_ETSB_YN");
			String EEA_HTPR_CD_T = cRsList.getString("EEA_HTPR_CD");
			String EEA_SPPR_CD_T = cRsList.getString("EEA_SPPR_CD");
			String EEA_CVPR_CD_T = cRsList.getString("EEA_CVPR_CD");
			String EEA_EMPR_CD_T = cRsList.getString("EEA_EMPR_CD");
			String EEA_ETPR_CD_T = cRsList.getString("EEA_ETPR_CD");
			String EEA_CNCL_CD_T = cRsList.getString("EEA_CNCL_CD");
			String EEA_MNGT_YR_T = cRsList.getString("EEA_MNGT_YR");
			String EEA_MNGT_HTYR_T = cRsList.getString("EEA_MNGT_HTYR");
			String EEA_MNGT_SPYM_T = cRsList.getString("EEA_MNGT_SPYM");
			String EEA_EXAM_LT_T = cRsList.getString("EEA_EXAM_LT");
			String EEA_HTSB_LT_T = cRsList.getString("EEA_HTSB_LT");
			String EEA_SPSB_LT_T = cRsList.getString("EEA_SPSB_LT");
			String EEA_CVSB_LT_T = cRsList.getString("EEA_CVSB_LT");
			String EEA_EMSB_LT_T = cRsList.getString("EEA_EMSB_LT");
			String EEA_ETSB_LT_T = cRsList.getString("EEA_ETSB_LT");
			String EEA_ADD_LT_T = cRsList.getString("EEA_ADD_LT");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String EEA_ORDER_LT_T = cRsList.getString("EEA_ORDER_LT");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_SPHT_CD_T = cRsList.getString("EEA_SPHT_CD");
			String EEA_INSU_NO_T = cRsList.getString("EEA_INSU_NO");
			String EEA_INSU_CD_T = cRsList.getString("EEA_INSU_CD");
			String EEA_ENTY_CD_T = cRsList.getString("EEA_ENTY_CD");
			String EEA_ASSO_CD_T = cRsList.getString("EEA_ASSO_CD");
			String EEA_CNTR_CD_T = cRsList.getString("EEA_CNTR_CD");
			String EEA_ARMY_CD_T = cRsList.getString("EEA_ARMY_CD");
			String EEA_HEPA_YN_T = cRsList.getString("EEA_HEPA_YN");
			String EEA_ORAL_YN_T = cRsList.getString("EEA_ORAL_YN");
			String EEA_CANAD_YN_T = cRsList.getString("EEA_CANAD_YN");
			String EEA_HOLIDAY_YN_T = cRsList.getString("EEA_HOLIDAY_YN");
			String EEA_STOMA_CD_T = cRsList.getString("EEA_STOMA_CD");
			String EEA_COLON_CD_T = cRsList.getString("EEA_COLON_CD");
			String EEA_LIVER_CD_T = cRsList.getString("EEA_LIVER_CD");
			String EEA_BAST_CD_T = cRsList.getString("EEA_BAST_CD");
			String EEA_UTER_CD_T = cRsList.getString("EEA_UTER_CD");
			String EEA_STOMA_DR_T = cRsList.getString("EEA_STOMA_DR");
			String EEA_COLON_DR_T = cRsList.getString("EEA_COLON_DR");
			String EEA_LIVER_DR_T = cRsList.getString("EEA_LIVER_DR");
			String EEA_BAST_DR_T = cRsList.getString("EEA_BAST_DR");
			String EEA_UTER_DR_T = cRsList.getString("EEA_UTER_DR");
			String EEA_CNCR_DT_T = cRsList.getString("EEA_CNCR_DT");
			String EEA_HDMD_YN_T = cRsList.getString("EEA_HDMD_YN");
			String EEA_SDMD_YN_T = cRsList.getString("EEA_SDMD_YN");
			String EEA_SPRT_PR_T = cRsList.getString("EEA_SPRT_PR");
			String EEA_COMP_PR_T = cRsList.getString("EEA_COMP_PR");
			String EEA_PSNL_PR_T = cRsList.getString("EEA_PSNL_PR");
			String EEA_HLTH_PR_T = cRsList.getString("EEA_HLTH_PR");
			String EEA_SPCL_PR_T = cRsList.getString("EEA_SPCL_PR");
			String EEA_CAN_PR_T = cRsList.getString("EEA_CAN_PR");
			String EEA_ORAL_PR_T = cRsList.getString("EEA_ORAL_PR");
			String EEA_COMPR_PR_T = cRsList.getString("EEA_COMPR_PR");
			String EEA_PSNLR_PR_T = cRsList.getString("EEA_PSNLR_PR");
			String EEA_HLTHR_PR_T = cRsList.getString("EEA_HLTHR_PR");
			String EEA_SPCLR_PR_T = cRsList.getString("EEA_SPCLR_PR");
			String EEA_CANR_PR_T = cRsList.getString("EEA_CANR_PR");
			String EEA_ORALR_PR_T = cRsList.getString("EEA_ORALR_PR");
			String EEA_PYER_CD_T = cRsList.getString("EEA_PYER_CD");
			String EEA_CMPY_CD_T = cRsList.getString("EEA_CMPY_CD");
			String EEA_PRPY_CD_T = cRsList.getString("EEA_PRPY_CD");
			String EEA_RECE_NO_T = cRsList.getString("EEA_RECE_NO");
			String EEA_RECE_KD_T = cRsList.getString("EEA_RECE_KD");
			String EEA_RSLT_CD_T = cRsList.getString("EEA_RSLT_CD");
			String EEA_BLRT_CD_T = cRsList.getString("EEA_BLRT_CD");
			String EEA_DEFER_KD_T = cRsList.getString("EEA_DEFER_KD");
			String EEA_ORDER_YN_T = cRsList.getString("EEA_ORDER_YN");
			String EEA_NHIC_TX_T = cRsList.getString("EEA_NHIC_TX");
			String EEA_ACPT_TX_T = cRsList.getString("EEA_ACPT_TX");
			String EEA_INPT_ID_T = cRsList.getString("EEA_INPT_ID");
			String EEA_INPT_DTT_T = cRsList.getDate2("EEA_INPT_DTT");
			String EEA_MODI_ID_T = cRsList.getString("EEA_MODI_ID");
			String EEA_MODI_DTT_T = cRsList.getDate2("EEA_MODI_DTT");
			String EEA_CANAD_KD_T = cRsList.getString("EEA_CANAD_KD");
			String EEA_2ND_YN_T = cRsList.getString("EEA_2ND_YN");
			String EEA_COMP_CD2_T = cRsList.getString("EEA_COMP_CD2");
			String EEA_LIFE_YN_T = cRsList.getString("EEA_LIFE_YN");
			String EEA_TOTAL_YN_T = cRsList.getString("EEA_TOTAL_YN");
			String EEA_OCS_DR_T = cRsList.getString("EEA_OCS_DR");
			String EEA_HCV_YN_T = cRsList.getString("EEA_HCV_YN");
			String EEA_OCS_DV_T = cRsList.getString("EEA_OCS_DV");
			String EEA_OCS_NO_T = cRsList.getString("EEA_OCS_NO");
			String EEA_LABEL_DT_T = cRsList.getString("EEA_LABEL_DT");
			String EEA_EXEC_ID_T = cRsList.getString("EEA_EXEC_ID");
			String EEA_SELF_KD_T = cRsList.getString("EEA_SELF_KD");
			String EEA_CANPR_KD_T = cRsList.getString("EEA_CANPR_KD");
			String EEA_HLTH_KD_T = cRsList.getString("EEA_HLTH_KD");
			String EEA_SAFE_YN_T = cRsList.getString("EEA_SAFE_YN");
			String EEA_ADD_DT_T = cRsList.getString("EEA_ADD_DT");
			String EEA_ENDO_DR_T = cRsList.getString("EEA_ENDO_DR");
			String EEA_PDF_KD_T = cRsList.getString("EEA_PDF_KD");
			String EEA_LUNG_CD_T = cRsList.getString("EEA_LUNG_CD");
			String EEA_LUNG_DR_T = cRsList.getString("EEA_LUNG_DR");
			String EEA_LUNG_KD_T = cRsList.getString("EEA_LUNG_KD");
			String EEA_UBEH_YN_T = cRsList.getString("EEA_UBEH_YN");
			String ECL_EXAM_DT_T = cRsList.getString("ECL_EXAM_DT");
			String ECL_EXAM_SQ_T = cRsList.getString("ECL_EXAM_SQ");
			String ECL_CFRM_CD_T = cRsList.getString("ECL_CFRM_CD");
			String ECL_LVEX_DT_T = cRsList.getString("ECL_LVEX_DT");
			String ECL_ALT_VL_T = cRsList.getString("ECL_ALT_VL");
			String ECL_HBTP_KD_T = cRsList.getString("ECL_HBTP_KD");
			String ECL_HBRT_CD_T = cRsList.getString("ECL_HBRT_CD");
			String ECL_HBRT_VL_T = cRsList.getString("ECL_HBRT_VL");
			String ECL_HBVL_VL_T = cRsList.getString("ECL_HBVL_VL");
			String ECL_HBPJ_KD_T = cRsList.getString("ECL_HBPJ_KD");
			String ECL_HCTP_KD_T = cRsList.getString("ECL_HCTP_KD");
			String ECL_HCRT_CD_T = cRsList.getString("ECL_HCRT_CD");
			String ECL_HCRT_VL_T = cRsList.getString("ECL_HCRT_VL");
			String ECL_HCVL_VL_T = cRsList.getString("ECL_HCVL_VL");
			String ECL_HCPJ_KD_T = cRsList.getString("ECL_HCPJ_KD");
			String ECL_USRL1_KD_T = cRsList.getString("ECL_USRL1_KD");
			String ECL_USRL2_KD_T = cRsList.getString("ECL_USRL2_KD");
			String ECL_USRL3_KD_T = cRsList.getString("ECL_USRL3_KD");
			String ECL_USPO_KD_T = cRsList.getString("ECL_USPO_KD");
			String ECL_USCN1_KD_T = cRsList.getString("ECL_USCN1_KD");
			String ECL_USCN2_KD_T = cRsList.getString("ECL_USCN2_KD");
			String ECL_USCN3_KD_T = cRsList.getString("ECL_USCN3_KD");
			String ECL_USETC_KD_T = cRsList.getString("ECL_USETC_KD");
			String ECL_USETC_EX_T = cRsList.getString("ECL_USETC_EX");
			String ECL_AFPTP_KD_T = cRsList.getString("ECL_AFPTP_KD");
			String ECL_AFPRT_CD_T = cRsList.getString("ECL_AFPRT_CD");
			String ECL_AFPRT_VL_T = cRsList.getString("ECL_AFPRT_VL");
			String ECL_AFPRT_UNIT_T = cRsList.getString("ECL_AFPRT_UNIT");
			String ECL_AFPVL_VL_T = cRsList.getString("ECL_AFPVL_VL");
			String ECL_RSLT_KD_T = cRsList.getString("ECL_RSLT_KD");
			String ECL_ETC_EX_T = cRsList.getString("ECL_ETC_EX");
			String ECL_LICN_YN_T = cRsList.getString("ECL_LICN_YN");
			String ECL_RSLT_EX_T = cRsList.getString("ECL_RSLT_EX");
			String ECL_RPT_DT_T = cRsList.getString("ECL_RPT_DT");
			String ECL_CFRM_DT_T = cRsList.getString("ECL_CFRM_DT");
			String ECL_LICEN_CD_T = cRsList.getString("ECL_LICEN_CD");
			String ECL_INPUT_DTT_T = cRsList.getDate2("ECL_INPUT_DTT");
			String ECL_INPUT_ID_T = cRsList.getString("ECL_INPUT_ID");
			String ECL_MODI_DTT_T = cRsList.getDate2("ECL_MODI_DTT");
			String ECL_MODI_ID_T = cRsList.getString("ECL_MODI_ID");
			String ECL_USCN2_1_KD_T = cRsList.getString("ECL_USCN2_1_KD");
			String ECL_USCN2_VL1_T = cRsList.getString("ECL_USCN2_VL1");
			String ECL_USCN2_VL2_T = cRsList.getString("ECL_USCN2_VL2");
			String ECL_USCN2_VL3_T = cRsList.getString("ECL_USCN2_VL3");
			String ECL_USETC_EX2_T = cRsList.getString("ECL_USETC_EX2");
			String ECL_CKUP_LICEN_CD_T = cRsList.getString("ECL_CKUP_LICEN_CD");
			String ECL_USRL4_KD_T = cRsList.getString("ECL_USRL4_KD");
			String ECL_USRL5_KD_T = cRsList.getString("ECL_USRL5_KD");
			String ECL_USRL6_KD_T = cRsList.getString("ECL_USRL6_KD");
			String ECL_USRL7_KD_T = cRsList.getString("ECL_USRL7_KD");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String LICEN_NO1_T = cRsList.getString("LICEN_NO1");
			String LICEN_NM1_T = cRsList.getString("LICEN_NM1");
			String LICEN_NO2_T = cRsList.getString("LICEN_NO2");
			String LICEN_NM2_T = cRsList.getString("LICEN_NM2");
			String ROWID_T = cRsList.getString("ROWID");
			String c201_T = cRsList.getString("c201");
			String c202_T = cRsList.getString("c202");
			String c203_T = cRsList.getString("c203");
			String c204_T = cRsList.getString("c204");
			String c205_T = cRsList.getString("c205");
%>
			<z:row
<%
			if(! ICR_PENL_DE_T.equals("")) {
%>
		 		ICR_PENL_DE='<%= ICR_PENL_DE_T%>'
<%
			}

			if(! EEA_CNTR_NM_T.equals("")) {
%>
		 		EEA_CNTR_NM='<%= EEA_CNTR_NM_T%>'
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

			if(! EEA_ACPT_TM_T.equals("")) {
%>
		 		EEA_ACPT_TM='<%= EEA_ACPT_TM_T%>'
<%
			}

			if(! EEA_RSVN_NO_T.equals("")) {
%>
		 		EEA_RSVN_NO='<%= EEA_RSVN_NO_T%>'
<%
			}

			if(! EEA_ACPT_CD_T.equals("")) {
%>
		 		EEA_ACPT_CD='<%= EEA_ACPT_CD_T%>'
<%
			}

			if(! EEA_ACPT_KD_T.equals("")) {
%>
		 		EEA_ACPT_KD='<%= EEA_ACPT_KD_T%>'
<%
			}

			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
<%
			}

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! EEA_MMBR_CD_T.equals("")) {
%>
		 		EEA_MMBR_CD='<%= EEA_MMBR_CD_T%>'
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

			if(! EEA_ZIP_CD_T.equals("")) {
%>
		 		EEA_ZIP_CD='<%= EEA_ZIP_CD_T%>'
<%
			}

			if(! EEA_ZIP_SQ_T.equals("")) {
%>
		 		EEA_ZIP_SQ='<%= EEA_ZIP_SQ_T%>'
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

			if(! EEA_BLDG_NO_T.equals("")) {
%>
		 		EEA_BLDG_NO='<%= EEA_BLDG_NO_T%>'
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

			if(! EEA_SEND_DT_T.equals("")) {
%>
		 		EEA_SEND_DT='<%= EEA_SEND_DT_T%>'
<%
			}

			if(! EEA_SMS_YN_T.equals("")) {
%>
		 		EEA_SMS_YN='<%= EEA_SMS_YN_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! EEA_COTK_CD_T.equals("")) {
%>
		 		EEA_COTK_CD='<%= EEA_COTK_CD_T%>'
<%
			}

			if(! EEA_NOTE_YN_T.equals("")) {
%>
		 		EEA_NOTE_YN='<%= EEA_NOTE_YN_T%>'
<%
			}

			if(! EEA_DEPT_CD_T.equals("")) {
%>
		 		EEA_DEPT_CD='<%= EEA_DEPT_CD_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! EEA_DIVI_CD_T.equals("")) {
%>
		 		EEA_DIVI_CD='<%= EEA_DIVI_CD_T%>'
<%
			}

			if(! EEA_ENTRY_DT_T.equals("")) {
%>
		 		EEA_ENTRY_DT='<%= EEA_ENTRY_DT_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
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

			if(! EEA_FAMY_CD_T.equals("")) {
%>
		 		EEA_FAMY_CD='<%= EEA_FAMY_CD_T%>'
<%
			}

			if(! EEA_FAMY_NM_T.equals("")) {
%>
		 		EEA_FAMY_NM='<%= EEA_FAMY_NM_T%>'
<%
			}

			if(! EEA_RFID_NO_T.equals("")) {
%>
		 		EEA_RFID_NO='<%= EEA_RFID_NO_T%>'
<%
			}

			if(! EEA_FOOD_YN_T.equals("")) {
%>
		 		EEA_FOOD_YN='<%= EEA_FOOD_YN_T%>'
<%
			}

			if(! EEA_SALES_ID_T.equals("")) {
%>
		 		EEA_SALES_ID='<%= EEA_SALES_ID_T%>'
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

			if(! EEA_SPSB_CD_T.equals("")) {
%>
		 		EEA_SPSB_CD='<%= EEA_SPSB_CD_T%>'
<%
			}

			if(! EEA_CVSB_CD_T.equals("")) {
%>
		 		EEA_CVSB_CD='<%= EEA_CVSB_CD_T%>'
<%
			}

			if(! EEA_EMSB_CD_T.equals("")) {
%>
		 		EEA_EMSB_CD='<%= EEA_EMSB_CD_T%>'
<%
			}

			if(! EEA_ETSB_CD_T.equals("")) {
%>
		 		EEA_ETSB_CD='<%= EEA_ETSB_CD_T%>'
<%
			}

			if(! EEA_HTSB_YN_T.equals("")) {
%>
		 		EEA_HTSB_YN='<%= EEA_HTSB_YN_T%>'
<%
			}

			if(! EEA_SPSB_YN_T.equals("")) {
%>
		 		EEA_SPSB_YN='<%= EEA_SPSB_YN_T%>'
<%
			}

			if(! EEA_CVSB_YN_T.equals("")) {
%>
		 		EEA_CVSB_YN='<%= EEA_CVSB_YN_T%>'
<%
			}

			if(! EEA_EMSB_YN_T.equals("")) {
%>
		 		EEA_EMSB_YN='<%= EEA_EMSB_YN_T%>'
<%
			}

			if(! EEA_ETSB_YN_T.equals("")) {
%>
		 		EEA_ETSB_YN='<%= EEA_ETSB_YN_T%>'
<%
			}

			if(! EEA_HTPR_CD_T.equals("")) {
%>
		 		EEA_HTPR_CD='<%= EEA_HTPR_CD_T%>'
<%
			}

			if(! EEA_SPPR_CD_T.equals("")) {
%>
		 		EEA_SPPR_CD='<%= EEA_SPPR_CD_T%>'
<%
			}

			if(! EEA_CVPR_CD_T.equals("")) {
%>
		 		EEA_CVPR_CD='<%= EEA_CVPR_CD_T%>'
<%
			}

			if(! EEA_EMPR_CD_T.equals("")) {
%>
		 		EEA_EMPR_CD='<%= EEA_EMPR_CD_T%>'
<%
			}

			if(! EEA_ETPR_CD_T.equals("")) {
%>
		 		EEA_ETPR_CD='<%= EEA_ETPR_CD_T%>'
<%
			}

			if(! EEA_CNCL_CD_T.equals("")) {
%>
		 		EEA_CNCL_CD='<%= EEA_CNCL_CD_T%>'
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

			if(! EEA_EXAM_LT_T.equals("")) {
%>
		 		EEA_EXAM_LT='<%= EEA_EXAM_LT_T%>'
<%
			}

			if(! EEA_HTSB_LT_T.equals("")) {
%>
		 		EEA_HTSB_LT='<%= EEA_HTSB_LT_T%>'
<%
			}

			if(! EEA_SPSB_LT_T.equals("")) {
%>
		 		EEA_SPSB_LT='<%= EEA_SPSB_LT_T%>'
<%
			}

			if(! EEA_CVSB_LT_T.equals("")) {
%>
		 		EEA_CVSB_LT='<%= EEA_CVSB_LT_T%>'
<%
			}

			if(! EEA_EMSB_LT_T.equals("")) {
%>
		 		EEA_EMSB_LT='<%= EEA_EMSB_LT_T%>'
<%
			}

			if(! EEA_ETSB_LT_T.equals("")) {
%>
		 		EEA_ETSB_LT='<%= EEA_ETSB_LT_T%>'
<%
			}

			if(! EEA_ADD_LT_T.equals("")) {
%>
		 		EEA_ADD_LT='<%= EEA_ADD_LT_T%>'
<%
			}

			if(! EEA_SPCL_LT_T.equals("")) {
%>
		 		EEA_SPCL_LT='<%= EEA_SPCL_LT_T%>'
<%
			}

			if(! EEA_ORDER_LT_T.equals("")) {
%>
		 		EEA_ORDER_LT='<%= EEA_ORDER_LT_T%>'
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

			if(! EEA_INSU_NO_T.equals("")) {
%>
		 		EEA_INSU_NO='<%= EEA_INSU_NO_T%>'
<%
			}

			if(! EEA_INSU_CD_T.equals("")) {
%>
		 		EEA_INSU_CD='<%= EEA_INSU_CD_T%>'
<%
			}

			if(! EEA_ENTY_CD_T.equals("")) {
%>
		 		EEA_ENTY_CD='<%= EEA_ENTY_CD_T%>'
<%
			}

			if(! EEA_ASSO_CD_T.equals("")) {
%>
		 		EEA_ASSO_CD='<%= EEA_ASSO_CD_T%>'
<%
			}

			if(! EEA_CNTR_CD_T.equals("")) {
%>
		 		EEA_CNTR_CD='<%= EEA_CNTR_CD_T%>'
<%
			}

			if(! EEA_ARMY_CD_T.equals("")) {
%>
		 		EEA_ARMY_CD='<%= EEA_ARMY_CD_T%>'
<%
			}

			if(! EEA_HEPA_YN_T.equals("")) {
%>
		 		EEA_HEPA_YN='<%= EEA_HEPA_YN_T%>'
<%
			}

			if(! EEA_ORAL_YN_T.equals("")) {
%>
		 		EEA_ORAL_YN='<%= EEA_ORAL_YN_T%>'
<%
			}

			if(! EEA_CANAD_YN_T.equals("")) {
%>
		 		EEA_CANAD_YN='<%= EEA_CANAD_YN_T%>'
<%
			}

			if(! EEA_HOLIDAY_YN_T.equals("")) {
%>
		 		EEA_HOLIDAY_YN='<%= EEA_HOLIDAY_YN_T%>'
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

			if(! EEA_STOMA_DR_T.equals("")) {
%>
		 		EEA_STOMA_DR='<%= EEA_STOMA_DR_T%>'
<%
			}

			if(! EEA_COLON_DR_T.equals("")) {
%>
		 		EEA_COLON_DR='<%= EEA_COLON_DR_T%>'
<%
			}

			if(! EEA_LIVER_DR_T.equals("")) {
%>
		 		EEA_LIVER_DR='<%= EEA_LIVER_DR_T%>'
<%
			}

			if(! EEA_BAST_DR_T.equals("")) {
%>
		 		EEA_BAST_DR='<%= EEA_BAST_DR_T%>'
<%
			}

			if(! EEA_UTER_DR_T.equals("")) {
%>
		 		EEA_UTER_DR='<%= EEA_UTER_DR_T%>'
<%
			}

			if(! EEA_CNCR_DT_T.equals("")) {
%>
		 		EEA_CNCR_DT='<%= EEA_CNCR_DT_T%>'
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

			if(! EEA_SPRT_PR_T.equals("")) {
%>
		 		EEA_SPRT_PR='<%= EEA_SPRT_PR_T%>'
<%
			}

			if(! EEA_COMP_PR_T.equals("")) {
%>
		 		EEA_COMP_PR='<%= EEA_COMP_PR_T%>'
<%
			}

			if(! EEA_PSNL_PR_T.equals("")) {
%>
		 		EEA_PSNL_PR='<%= EEA_PSNL_PR_T%>'
<%
			}

			if(! EEA_HLTH_PR_T.equals("")) {
%>
		 		EEA_HLTH_PR='<%= EEA_HLTH_PR_T%>'
<%
			}

			if(! EEA_SPCL_PR_T.equals("")) {
%>
		 		EEA_SPCL_PR='<%= EEA_SPCL_PR_T%>'
<%
			}

			if(! EEA_CAN_PR_T.equals("")) {
%>
		 		EEA_CAN_PR='<%= EEA_CAN_PR_T%>'
<%
			}

			if(! EEA_ORAL_PR_T.equals("")) {
%>
		 		EEA_ORAL_PR='<%= EEA_ORAL_PR_T%>'
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

			if(! EEA_CANR_PR_T.equals("")) {
%>
		 		EEA_CANR_PR='<%= EEA_CANR_PR_T%>'
<%
			}

			if(! EEA_ORALR_PR_T.equals("")) {
%>
		 		EEA_ORALR_PR='<%= EEA_ORALR_PR_T%>'
<%
			}

			if(! EEA_PYER_CD_T.equals("")) {
%>
		 		EEA_PYER_CD='<%= EEA_PYER_CD_T%>'
<%
			}

			if(! EEA_CMPY_CD_T.equals("")) {
%>
		 		EEA_CMPY_CD='<%= EEA_CMPY_CD_T%>'
<%
			}

			if(! EEA_PRPY_CD_T.equals("")) {
%>
		 		EEA_PRPY_CD='<%= EEA_PRPY_CD_T%>'
<%
			}

			if(! EEA_RECE_NO_T.equals("")) {
%>
		 		EEA_RECE_NO='<%= EEA_RECE_NO_T%>'
<%
			}

			if(! EEA_RECE_KD_T.equals("")) {
%>
		 		EEA_RECE_KD='<%= EEA_RECE_KD_T%>'
<%
			}

			if(! EEA_RSLT_CD_T.equals("")) {
%>
		 		EEA_RSLT_CD='<%= EEA_RSLT_CD_T%>'
<%
			}

			if(! EEA_BLRT_CD_T.equals("")) {
%>
		 		EEA_BLRT_CD='<%= EEA_BLRT_CD_T%>'
<%
			}

			if(! EEA_DEFER_KD_T.equals("")) {
%>
		 		EEA_DEFER_KD='<%= EEA_DEFER_KD_T%>'
<%
			}

			if(! EEA_ORDER_YN_T.equals("")) {
%>
		 		EEA_ORDER_YN='<%= EEA_ORDER_YN_T%>'
<%
			}

			if(! EEA_NHIC_TX_T.equals("")) {
%>
		 		EEA_NHIC_TX='<%= EEA_NHIC_TX_T%>'
<%
			}

			if(! EEA_ACPT_TX_T.equals("")) {
%>
		 		EEA_ACPT_TX='<%= EEA_ACPT_TX_T%>'
<%
			}

			if(! EEA_INPT_ID_T.equals("")) {
%>
		 		EEA_INPT_ID='<%= EEA_INPT_ID_T%>'
<%
			}

			if(! EEA_INPT_DTT_T.equals("")) {
%>
		 		EEA_INPT_DTT='<%= EEA_INPT_DTT_T%>'
<%
			}

			if(! EEA_MODI_ID_T.equals("")) {
%>
		 		EEA_MODI_ID='<%= EEA_MODI_ID_T%>'
<%
			}

			if(! EEA_MODI_DTT_T.equals("")) {
%>
		 		EEA_MODI_DTT='<%= EEA_MODI_DTT_T%>'
<%
			}

			if(! EEA_CANAD_KD_T.equals("")) {
%>
		 		EEA_CANAD_KD='<%= EEA_CANAD_KD_T%>'
<%
			}

			if(! EEA_2ND_YN_T.equals("")) {
%>
		 		EEA_2ND_YN='<%= EEA_2ND_YN_T%>'
<%
			}

			if(! EEA_COMP_CD2_T.equals("")) {
%>
		 		EEA_COMP_CD2='<%= EEA_COMP_CD2_T%>'
<%
			}

			if(! EEA_LIFE_YN_T.equals("")) {
%>
		 		EEA_LIFE_YN='<%= EEA_LIFE_YN_T%>'
<%
			}

			if(! EEA_TOTAL_YN_T.equals("")) {
%>
		 		EEA_TOTAL_YN='<%= EEA_TOTAL_YN_T%>'
<%
			}

			if(! EEA_OCS_DR_T.equals("")) {
%>
		 		EEA_OCS_DR='<%= EEA_OCS_DR_T%>'
<%
			}

			if(! EEA_HCV_YN_T.equals("")) {
%>
		 		EEA_HCV_YN='<%= EEA_HCV_YN_T%>'
<%
			}

			if(! EEA_OCS_DV_T.equals("")) {
%>
		 		EEA_OCS_DV='<%= EEA_OCS_DV_T%>'
<%
			}

			if(! EEA_OCS_NO_T.equals("")) {
%>
		 		EEA_OCS_NO='<%= EEA_OCS_NO_T%>'
<%
			}

			if(! EEA_LABEL_DT_T.equals("")) {
%>
		 		EEA_LABEL_DT='<%= EEA_LABEL_DT_T%>'
<%
			}

			if(! EEA_EXEC_ID_T.equals("")) {
%>
		 		EEA_EXEC_ID='<%= EEA_EXEC_ID_T%>'
<%
			}

			if(! EEA_SELF_KD_T.equals("")) {
%>
		 		EEA_SELF_KD='<%= EEA_SELF_KD_T%>'
<%
			}

			if(! EEA_CANPR_KD_T.equals("")) {
%>
		 		EEA_CANPR_KD='<%= EEA_CANPR_KD_T%>'
<%
			}

			if(! EEA_HLTH_KD_T.equals("")) {
%>
		 		EEA_HLTH_KD='<%= EEA_HLTH_KD_T%>'
<%
			}

			if(! EEA_SAFE_YN_T.equals("")) {
%>
		 		EEA_SAFE_YN='<%= EEA_SAFE_YN_T%>'
<%
			}

			if(! EEA_ADD_DT_T.equals("")) {
%>
		 		EEA_ADD_DT='<%= EEA_ADD_DT_T%>'
<%
			}

			if(! EEA_ENDO_DR_T.equals("")) {
%>
		 		EEA_ENDO_DR='<%= EEA_ENDO_DR_T%>'
<%
			}

			if(! EEA_PDF_KD_T.equals("")) {
%>
		 		EEA_PDF_KD='<%= EEA_PDF_KD_T%>'
<%
			}

			if(! EEA_LUNG_CD_T.equals("")) {
%>
		 		EEA_LUNG_CD='<%= EEA_LUNG_CD_T%>'
<%
			}

			if(! EEA_LUNG_DR_T.equals("")) {
%>
		 		EEA_LUNG_DR='<%= EEA_LUNG_DR_T%>'
<%
			}

			if(! EEA_LUNG_KD_T.equals("")) {
%>
		 		EEA_LUNG_KD='<%= EEA_LUNG_KD_T%>'
<%
			}

			if(! EEA_UBEH_YN_T.equals("")) {
%>
		 		EEA_UBEH_YN='<%= EEA_UBEH_YN_T%>'
<%
			}

			if(! ECL_EXAM_DT_T.equals("")) {
%>
		 		ECL_EXAM_DT='<%= ECL_EXAM_DT_T%>'
<%
			}

			if(! ECL_EXAM_SQ_T.equals("")) {
%>
		 		ECL_EXAM_SQ='<%= ECL_EXAM_SQ_T%>'
<%
			}

			if(! ECL_CFRM_CD_T.equals("")) {
%>
		 		ECL_CFRM_CD='<%= ECL_CFRM_CD_T%>'
<%
			}

			if(! ECL_LVEX_DT_T.equals("")) {
%>
		 		ECL_LVEX_DT='<%= ECL_LVEX_DT_T%>'
<%
			}

			if(! ECL_ALT_VL_T.equals("")) {
%>
		 		ECL_ALT_VL='<%= ECL_ALT_VL_T%>'
<%
			}

			if(! ECL_HBTP_KD_T.equals("")) {
%>
		 		ECL_HBTP_KD='<%= ECL_HBTP_KD_T%>'
<%
			}

			if(! ECL_HBRT_CD_T.equals("")) {
%>
		 		ECL_HBRT_CD='<%= ECL_HBRT_CD_T%>'
<%
			}

			if(! ECL_HBRT_VL_T.equals("")) {
%>
		 		ECL_HBRT_VL='<%= ECL_HBRT_VL_T%>'
<%
			}

			if(! ECL_HBVL_VL_T.equals("")) {
%>
		 		ECL_HBVL_VL='<%= ECL_HBVL_VL_T%>'
<%
			}

			if(! ECL_HBPJ_KD_T.equals("")) {
%>
		 		ECL_HBPJ_KD='<%= ECL_HBPJ_KD_T%>'
<%
			}

			if(! ECL_HCTP_KD_T.equals("")) {
%>
		 		ECL_HCTP_KD='<%= ECL_HCTP_KD_T%>'
<%
			}

			if(! ECL_HCRT_CD_T.equals("")) {
%>
		 		ECL_HCRT_CD='<%= ECL_HCRT_CD_T%>'
<%
			}

			if(! ECL_HCRT_VL_T.equals("")) {
%>
		 		ECL_HCRT_VL='<%= ECL_HCRT_VL_T%>'
<%
			}

			if(! ECL_HCVL_VL_T.equals("")) {
%>
		 		ECL_HCVL_VL='<%= ECL_HCVL_VL_T%>'
<%
			}

			if(! ECL_HCPJ_KD_T.equals("")) {
%>
		 		ECL_HCPJ_KD='<%= ECL_HCPJ_KD_T%>'
<%
			}

			if(! ECL_USRL1_KD_T.equals("")) {
%>
		 		ECL_USRL1_KD='<%= ECL_USRL1_KD_T%>'
<%
			}

			if(! ECL_USRL2_KD_T.equals("")) {
%>
		 		ECL_USRL2_KD='<%= ECL_USRL2_KD_T%>'
<%
			}

			if(! ECL_USRL3_KD_T.equals("")) {
%>
		 		ECL_USRL3_KD='<%= ECL_USRL3_KD_T%>'
<%
			}

			if(! ECL_USPO_KD_T.equals("")) {
%>
		 		ECL_USPO_KD='<%= ECL_USPO_KD_T%>'
<%
			}

			if(! ECL_USCN1_KD_T.equals("")) {
%>
		 		ECL_USCN1_KD='<%= ECL_USCN1_KD_T%>'
<%
			}

			if(! ECL_USCN2_KD_T.equals("")) {
%>
		 		ECL_USCN2_KD='<%= ECL_USCN2_KD_T%>'
<%
			}

			if(! ECL_USCN3_KD_T.equals("")) {
%>
		 		ECL_USCN3_KD='<%= ECL_USCN3_KD_T%>'
<%
			}

			if(! ECL_USETC_KD_T.equals("")) {
%>
		 		ECL_USETC_KD='<%= ECL_USETC_KD_T%>'
<%
			}

			if(! ECL_USETC_EX_T.equals("")) {
%>
		 		ECL_USETC_EX='<%= ECL_USETC_EX_T%>'
<%
			}

			if(! ECL_AFPTP_KD_T.equals("")) {
%>
		 		ECL_AFPTP_KD='<%= ECL_AFPTP_KD_T%>'
<%
			}

			if(! ECL_AFPRT_CD_T.equals("")) {
%>
		 		ECL_AFPRT_CD='<%= ECL_AFPRT_CD_T%>'
<%
			}

			if(! ECL_AFPRT_VL_T.equals("")) {
%>
		 		ECL_AFPRT_VL='<%= ECL_AFPRT_VL_T%>'
<%
			}

			if(! ECL_AFPRT_UNIT_T.equals("")) {
%>
		 		ECL_AFPRT_UNIT='<%= ECL_AFPRT_UNIT_T%>'
<%
			}

			if(! ECL_AFPVL_VL_T.equals("")) {
%>
		 		ECL_AFPVL_VL='<%= ECL_AFPVL_VL_T%>'
<%
			}

			if(! ECL_RSLT_KD_T.equals("")) {
%>
		 		ECL_RSLT_KD='<%= ECL_RSLT_KD_T%>'
<%
			}

			if(! ECL_ETC_EX_T.equals("")) {
%>
		 		ECL_ETC_EX='<%= ECL_ETC_EX_T%>'
<%
			}

			if(! ECL_LICN_YN_T.equals("")) {
%>
		 		ECL_LICN_YN='<%= ECL_LICN_YN_T%>'
<%
			}

			if(! ECL_RSLT_EX_T.equals("")) {
%>
		 		ECL_RSLT_EX='<%= ECL_RSLT_EX_T%>'
<%
			}

			if(! ECL_RPT_DT_T.equals("")) {
%>
		 		ECL_RPT_DT='<%= ECL_RPT_DT_T%>'
<%
			}

			if(! ECL_CFRM_DT_T.equals("")) {
%>
		 		ECL_CFRM_DT='<%= ECL_CFRM_DT_T%>'
<%
			}

			if(! ECL_LICEN_CD_T.equals("")) {
%>
		 		ECL_LICEN_CD='<%= ECL_LICEN_CD_T%>'
<%
			}

			if(! ECL_INPUT_DTT_T.equals("")) {
%>
		 		ECL_INPUT_DTT='<%= ECL_INPUT_DTT_T%>'
<%
			}

			if(! ECL_INPUT_ID_T.equals("")) {
%>
		 		ECL_INPUT_ID='<%= ECL_INPUT_ID_T%>'
<%
			}

			if(! ECL_MODI_DTT_T.equals("")) {
%>
		 		ECL_MODI_DTT='<%= ECL_MODI_DTT_T%>'
<%
			}

			if(! ECL_MODI_ID_T.equals("")) {
%>
		 		ECL_MODI_ID='<%= ECL_MODI_ID_T%>'
<%
			}

			if(! ECL_USCN2_1_KD_T.equals("")) {
%>
		 		ECL_USCN2_1_KD='<%= ECL_USCN2_1_KD_T%>'
<%
			}

			if(! ECL_USCN2_VL1_T.equals("")) {
%>
		 		ECL_USCN2_VL1='<%= ECL_USCN2_VL1_T%>'
<%
			}

			if(! ECL_USCN2_VL2_T.equals("")) {
%>
		 		ECL_USCN2_VL2='<%= ECL_USCN2_VL2_T%>'
<%
			}

			if(! ECL_USCN2_VL3_T.equals("")) {
%>
		 		ECL_USCN2_VL3='<%= ECL_USCN2_VL3_T%>'
<%
			}

			if(! ECL_USETC_EX2_T.equals("")) {
%>
		 		ECL_USETC_EX2='<%= ECL_USETC_EX2_T%>'
<%
			}

			if(! ECL_CKUP_LICEN_CD_T.equals("")) {
%>
		 		ECL_CKUP_LICEN_CD='<%= ECL_CKUP_LICEN_CD_T%>'
<%
			}

			if(! ECL_USRL4_KD_T.equals("")) {
%>
		 		ECL_USRL4_KD='<%= ECL_USRL4_KD_T%>'
<%
			}

			if(! ECL_USRL5_KD_T.equals("")) {
%>
		 		ECL_USRL5_KD='<%= ECL_USRL5_KD_T%>'
<%
			}

			if(! ECL_USRL6_KD_T.equals("")) {
%>
		 		ECL_USRL6_KD='<%= ECL_USRL6_KD_T%>'
<%
			}

			if(! ECL_USRL7_KD_T.equals("")) {
%>
		 		ECL_USRL7_KD='<%= ECL_USRL7_KD_T%>'
<%
			}

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! LICEN_NO1_T.equals("")) {
%>
		 		LICEN_NO1='<%= LICEN_NO1_T%>'
<%
			}

			if(! LICEN_NM1_T.equals("")) {
%>
		 		LICEN_NM1='<%= LICEN_NM1_T%>'
<%
			}

			if(! LICEN_NO2_T.equals("")) {
%>
		 		LICEN_NO2='<%= LICEN_NO2_T%>'
<%
			}

			if(! LICEN_NM2_T.equals("")) {
%>
		 		LICEN_NM2='<%= LICEN_NM2_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c201_T.equals("")) {
%>
		 		c201='<%= c201_T%>'
<%
			}

			if(! c202_T.equals("")) {
%>
		 		c202='<%= c202_T%>'
<%
			}

			if(! c203_T.equals("")) {
%>
		 		c203='<%= c203_T%>'
<%
			}

			if(! c204_T.equals("")) {
%>
		 		c204='<%= c204_T%>'
<%
			}

			if(! c205_T.equals("")) {
%>
		 		c205='<%= c205_T%>'
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
