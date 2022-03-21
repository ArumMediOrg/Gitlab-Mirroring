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
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.*, B.*, C.*, D.*, E.*, F.*, G.*, M.*,                                                        
       H.IAU_PENL_NM AS STMC_DT, I.IAU_PENL_NM AS COLO_DT, J.IAU_PENL_NM AS LIVER_DT,                 
       K.IAU_PENL_NM AS BRST_DT, L.IAU_PENL_NM AS CRVC_DT, N.IAU_PENL_NM AS LUNG_DT                   
  FROM ET_EXAM_ACPT A                                                                                 
 INNER JOIN IT_CUSTOMER B ON ICR_CUST_NO = EEA_CUST_NO                                                
  LEFT OUTER JOIN ET_CANCER_STMC C  ON ECS_EXAM_DT = EEA_EXAM_DT                                      
                                   AND ECS_EXAM_SQ = EEA_EXAM_SQ                                      
  LEFT OUTER JOIN ET_CANCER_COLO D  ON ECC_EXAM_DT = EEA_EXAM_DT                                      
                                   AND ECC_EXAM_SQ = EEA_EXAM_SQ                                      
  LEFT OUTER JOIN ET_CANCER_LIVER E ON ECL_EXAM_DT = EEA_EXAM_DT                                      
                                   AND ECL_EXAM_SQ = EEA_EXAM_SQ                                      
  LEFT OUTER JOIN ET_CANCER_BRST F  ON ECB_EXAM_DT = EEA_EXAM_DT                                      
                                   AND ECB_EXAM_SQ = EEA_EXAM_SQ                                      
  LEFT OUTER JOIN ET_CANCER_CRVC G  ON ECV_EXAM_DT = EEA_EXAM_DT                                      
                                   AND ECV_EXAM_SQ = EEA_EXAM_SQ                                      
  LEFT OUTER JOIN ET_CANCER_LUNG M  ON ECG_EXAM_DT = EEA_EXAM_DT                                      
                                   AND ECG_EXAM_SQ = EEA_EXAM_SQ                                      
  LEFT OUTER JOIN IT_AUTH_USER H ON H.IAU_LICEN1_NO = ECS_LICEN_CD                                    
  LEFT OUTER JOIN IT_AUTH_USER I ON I.IAU_LICEN1_NO = ECC_LICEN_CD                                    
  LEFT OUTER JOIN IT_AUTH_USER J ON J.IAU_LICEN1_NO = ECL_LICEN_CD                                    
  LEFT OUTER JOIN IT_AUTH_USER K ON K.IAU_LICEN1_NO = ECB_LICEN_CD                                    
  LEFT OUTER JOIN IT_AUTH_USER L ON L.IAU_LICEN1_NO = ECV_LICEN_CD                                    
  LEFT OUTER JOIN IT_AUTH_USER N ON N.IAU_LICEN1_NO = ECG_LICEN_CD                                    
 WHERE EEA_EXAM_DT = :EXAM_DT
   AND EEA_EXAM_SQ = :EXAM_SQ
   AND (EEA_STOMA_CD > 0 OR EEA_COLON_CD > 0 OR EEA_LIVER_CD > 0                                      
    OR  EEA_BAST_CD  > 0 OR EEA_UTER_CD  > 0 OR NVL(EEA_LUNG_CD, 0) > 0)
		*/

		sql = " SELECT A.*, B.*, C.*, D.*, E.*, F.*, G.*, M.*, H.IAU_PENL_NM AS STMC_DT, I.IAU_PENL_NM AS COLO_DT, J.IAU_PENL_NM AS LIVER_DT, K.IAU_PENL_NM AS BRST_DT, L.IAU_PENL_NM AS CRVC_DT, N.IAU_PENL_NM AS LUNG_DT";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON ICR_CUST_NO = EEA_CUST_NO";
		
		sql += " LEFT OUTER JOIN ET_CANCER_STMC C";
		sql += " ON ECS_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECS_EXAM_SQ = EEA_EXAM_SQ";
		
		sql += " LEFT OUTER JOIN ET_CANCER_COLO D";
		sql += " ON ECC_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECC_EXAM_SQ = EEA_EXAM_SQ";
		
		sql += " LEFT OUTER JOIN ET_CANCER_LIVER E";
		sql += " ON ECL_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECL_EXAM_SQ = EEA_EXAM_SQ";
		
		sql += " LEFT OUTER JOIN ET_CANCER_BRST F";
		sql += " ON ECB_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECB_EXAM_SQ = EEA_EXAM_SQ";
		
		sql += " LEFT OUTER JOIN ET_CANCER_CRVC G";
		sql += " ON ECV_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECV_EXAM_SQ = EEA_EXAM_SQ";
		
		sql += " LEFT OUTER JOIN ET_CANCER_LUNG M";
		sql += " ON ECG_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECG_EXAM_SQ = EEA_EXAM_SQ";
		
		sql += " LEFT OUTER JOIN IT_AUTH_USER H";
		sql += " ON H.IAU_LICEN1_NO = ECS_LICEN_CD";
		
		sql += " LEFT OUTER JOIN IT_AUTH_USER I";
		sql += " ON I.IAU_LICEN1_NO = ECC_LICEN_CD";
		
		sql += " LEFT OUTER JOIN IT_AUTH_USER J";
		sql += " ON J.IAU_LICEN1_NO = ECL_LICEN_CD";
		
		sql += " LEFT OUTER JOIN IT_AUTH_USER K";
		sql += " ON K.IAU_LICEN1_NO = ECB_LICEN_CD";
		
		sql += " LEFT OUTER JOIN IT_AUTH_USER L";
		sql += " ON L.IAU_LICEN1_NO = ECV_LICEN_CD";
		
		sql += " LEFT OUTER JOIN IT_AUTH_USER N";
		sql += " ON N.IAU_LICEN1_NO = ECG_LICEN_CD";

		sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND (";
		sql += " 	   EEA_STOMA_CD > 0";
		sql += " 	OR EEA_COLON_CD > 0";
		sql += " 	OR EEA_LIVER_CD > 0";
		sql += " 	OR EEA_BAST_CD > 0";
		sql += " 	OR EEA_UTER_CD > 0";
		sql += " 	OR NVL(EEA_LUNG_CD, 0) > 0";
		sql += " )";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_PM_QRCompositeReport1AddReports_007 \n";
			G_INFO += "설명 : 검사정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_TM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_TM'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSVN_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RSVN_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_CD' rs:number='5' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_ACPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='7' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='8' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MMBR_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MMBR_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='11' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_CD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_SQ' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_AR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ROAD_AR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BLDG_NO' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BLDG_NO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEL_NO' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMAIL_AR' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_CD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEND_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_DT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEND_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SMS_YN' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SMS_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COTK_CD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COTK_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_NOTE_YN' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_NOTE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_CD' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENTRY_DT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENTRY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CS' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_CS'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CLSS_KD' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CLSS_KD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_CD' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FAMY_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_NM' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FAMY_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RFID_NO' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RFID_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FOOD_YN' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FOOD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SALES_ID' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SALES_ID'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='40' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_CD' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_CD' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_CD' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_CD' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_CD' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_YN' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_YN' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_YN' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_YN' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_YN' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTPR_CD' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPPR_CD' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVPR_CD' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMPR_CD' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETPR_CD' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNCL_CD' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_YR' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_HTYR' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_HTYR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_SPYM' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_SPYM'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_LT' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EXAM_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_LT' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_LT' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_LT' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_LT' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_LT' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADD_LT' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ADD_LT'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORDER_LT' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORDER_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPHT_CD' rs:number='70' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPHT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_NO' rs:number='71' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INSU_NO'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_CD' rs:number='72' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INSU_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENTY_CD' rs:number='73' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENTY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ASSO_CD' rs:number='74' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ASSO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNTR_CD' rs:number='75' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNTR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ARMY_CD' rs:number='76' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ARMY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HEPA_YN' rs:number='77' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HEPA_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_YN' rs:number='78' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANAD_YN' rs:number='79' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANAD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HOLIDAY_YN' rs:number='80' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HOLIDAY_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_CD' rs:number='81' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_STOMA_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_CD' rs:number='82' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COLON_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_CD' rs:number='83' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIVER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_CD' rs:number='84' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BAST_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_CD' rs:number='85' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UTER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_DR' rs:number='86' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_STOMA_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_DR' rs:number='87' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COLON_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_DR' rs:number='88' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIVER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_DR' rs:number='89' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BAST_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_DR' rs:number='90' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UTER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNCR_DT' rs:number='91' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNCR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HDMD_YN' rs:number='92' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SDMD_YN' rs:number='93' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPRT_PR' rs:number='94' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPRT_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_PR' rs:number='95' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_PR' rs:number='96' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTH_PR' rs:number='97' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTH_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_PR' rs:number='98' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CAN_PR' rs:number='99' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CAN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_PR' rs:number='100' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORAL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMPR_PR' rs:number='101' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMPR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNLR_PR' rs:number='102' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNLR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTHR_PR' rs:number='103' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTHR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCLR_PR' rs:number='104' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCLR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANR_PR' rs:number='105' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORALR_PR' rs:number='106' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORALR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PYER_CD' rs:number='107' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PYER_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CMPY_CD' rs:number='108' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CMPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PRPY_CD' rs:number='109' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PRPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RECE_NO' rs:number='110' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RECE_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RECE_KD' rs:number='111' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RECE_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSLT_CD' rs:number='112' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_RSLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BLRT_CD' rs:number='113' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_BLRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEFER_KD' rs:number='114' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEFER_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORDER_YN' rs:number='115' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORDER_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_NHIC_TX' rs:number='116' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_NHIC_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_TX' rs:number='117' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INPT_ID' rs:number='118' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INPT_DTT' rs:number='119' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MODI_ID' rs:number='120' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MODI_DTT' rs:number='121' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANAD_KD' rs:number='122' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANAD_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_2ND_YN' rs:number='123' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_2ND_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD2' rs:number='124' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD2'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIFE_YN' rs:number='125' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIFE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TOTAL_YN' rs:number='126' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_TOTAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_OCS_DR' rs:number='127' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_OCS_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HCV_YN' rs:number='128' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HCV_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_OCS_DV' rs:number='129' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_OCS_DV'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_OCS_NO' rs:number='130' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_OCS_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LABEL_DT' rs:number='131' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LABEL_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXEC_ID' rs:number='132' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EXEC_ID'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SELF_KD' rs:number='133' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SELF_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANPR_KD' rs:number='134' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANPR_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTH_KD' rs:number='135' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SAFE_YN' rs:number='136' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SAFE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADD_DT' rs:number='137' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ADD_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENDO_DR' rs:number='138' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENDO_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PDF_KD' rs:number='139' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PDF_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_CD' rs:number='140' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LUNG_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_DR' rs:number='141' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LUNG_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_KD' rs:number='142' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LUNG_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UBEH_YN' rs:number='143' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UBEH_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CUST_NO' rs:number='144' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='145' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_SQ' rs:number='146' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_NM' rs:number='147' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MANA_KD' rs:number='148' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MANA_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CUST_KD' rs:number='149' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CUST_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NTNA_CD' rs:number='150' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_NTNA_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CHART_NO' rs:number='151' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_KD' rs:number='152' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_SEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_COMP_CD' rs:number='153' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ENTR_DT' rs:number='154' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ENTR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_KD' rs:number='155' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='156' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MARY_KD' rs:number='157' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MARY_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MARY_DT' rs:number='158' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MARY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_TEL_NO' rs:number='159' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO' rs:number='160' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_EMAI_AR' rs:number='161' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_EMAI_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ADDR_KD' rs:number='162' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ADDR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_CD' rs:number='163' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_SQ' rs:number='164' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ZIP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_AR' rs:number='165' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_LOTT_AR' rs:number='166' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_LOTT_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ROAD_AR' rs:number='167' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BLDG_NO' rs:number='168' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BLDG_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PARE_NM' rs:number='169' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PARE_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PARE_NO' rs:number='170' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PARE_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INFO_YN' rs:number='171' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_INFO_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_RECV_YN' rs:number='172' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_RECV_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CUST_TX' rs:number='173' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CUST_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_NM' rs:number='174' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_DIVI_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_CS' rs:number='175' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_DIVI_CS'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_KD' rs:number='176' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_DIVI_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CLSS_KD' rs:number='177' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CLSS_KD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_NO' rs:number='178' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PID_EN' rs:number='179' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PID_EN'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_USE_YN' rs:number='180' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NUSE_ID' rs:number='181' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NUSE_DTT' rs:number='182' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INPT_ID' rs:number='183' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INPT_DTT' rs:number='184' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MODI_ID' rs:number='185' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MODI_DTT' rs:number='186' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NOTE_YN' rs:number='187' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_NOTE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CPENL_NM' rs:number='188' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CPENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INFORE_YN' rs:number='189' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_INFORE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_EXAM_DT' rs:number='190' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_EXAM_SQ' rs:number='191' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_CFRM_CD' rs:number='192' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIEX_DT' rs:number='193' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIEX_KD' rs:number='194' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT1_KD' rs:number='195' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT1S_KD' rs:number='196' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT1S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT2_KD' rs:number='197' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT2S_KD' rs:number='198' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT2S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT3_KD' rs:number='199' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT3S_KD' rs:number='200' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT3S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIETC_KD' rs:number='201' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT_EX' rs:number='202' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENEX_DT' rs:number='203' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT1_KD' rs:number='204' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT1S_KD' rs:number='205' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT1S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT2_KD' rs:number='206' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT2S_KD' rs:number='207' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT2S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT3_KD' rs:number='208' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT3_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT3S_KD' rs:number='209' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT3S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENETC_KD' rs:number='210' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT_EX' rs:number='211' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ENRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BIEX_YN' rs:number='212' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BIEX_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_FOCP_KD' rs:number='213' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_FOCP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BIRT_KD' rs:number='214' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BIRT_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BICT_KD' rs:number='215' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BICT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BICNCR_KD' rs:number='216' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BICNCR_KD'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BICNCR_EX' rs:number='217' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BICNCR_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BIETC_KD' rs:number='218' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BIETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BIETC_EX' rs:number='219' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_BIETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_RSLT_KD' rs:number='220' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_STCN_YN' rs:number='221' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_STCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ETC_EX' rs:number='222' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_RSLT_EX' rs:number='223' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_RPT_DT' rs:number='224' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_CFRM_DT' rs:number='225' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_LICEN_CD' rs:number='226' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_INPUT_DTT' rs:number='227' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_INPUT_ID' rs:number='228' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_MODI_DTT' rs:number='229' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_MODI_ID' rs:number='230' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_DECI_LICEN_CD' rs:number='231' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_DECI_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_CKUP_LICEN_CD' rs:number='232' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_CKUP_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_PATH_LICEN_CD' rs:number='233' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_PATH_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GICM_KD' rs:number='234' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GICM_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_EXAM_DT' rs:number='235' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_EXAM_SQ' rs:number='236' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CFRM_CD' rs:number='237' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_OBEX_DT' rs:number='238' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_OBEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_OBTP_KD' rs:number='239' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_OBTP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_OBRT_CD' rs:number='240' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_OBRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_OBRT_VL' rs:number='241' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_OBRT_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_OBVL_VL' rs:number='242' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_OBVL_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIEX_DT' rs:number='243' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIEX_KD' rs:number='244' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT1_KD' rs:number='245' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT1S_KD' rs:number='246' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT1S_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT2_KD' rs:number='247' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT2S_KD' rs:number='248' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT2S_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT3_KD' rs:number='249' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT3S_KD' rs:number='250' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT3S_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIPL_VL' rs:number='251' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIPL_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIETC_KD' rs:number='252' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT_EX' rs:number='253' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENEX_DT' rs:number='254' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT1_KD' rs:number='255' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT1S_KD' rs:number='256' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT1S_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT2_KD' rs:number='257' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT2S_KD' rs:number='258' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT2S_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT3_KD' rs:number='259' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT3S_KD' rs:number='260' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT3S_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENPL_VL' rs:number='261' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENPL_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENPL_CT' rs:number='262' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENPL_CT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENETC_KD' rs:number='263' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT_EX' rs:number='264' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BIEX_YN' rs:number='265' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BIEX_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_FOCP_KD' rs:number='266' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_FOCP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BIBF_KD' rs:number='267' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BIBF_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BICT_KD' rs:number='268' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BICT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BIRT_KD' rs:number='269' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BIRT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BICNCR_KD' rs:number='270' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BICNCR_KD'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BICNCR_EX' rs:number='271' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BICNCR_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BIETC_KD' rs:number='272' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BIETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BIETC_EX' rs:number='273' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BIETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_RSLT_KD' rs:number='274' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ETC_EX' rs:number='275' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_STCN_YN' rs:number='276' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_STCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_RSLT_EX' rs:number='277' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_RPT_DT' rs:number='278' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CFRM_DT' rs:number='279' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_LICEN_CD' rs:number='280' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_INPUT_DTT' rs:number='281' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_INPUT_ID' rs:number='282' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_MODI_DTT' rs:number='283' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_MODI_ID' rs:number='284' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENCE_KD' rs:number='285' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENCE_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENJJ_KD' rs:number='286' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENJJ_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_DECI_LICEN_CD' rs:number='287' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_DECI_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CKUP_LICEN_CD' rs:number='288' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_CKUP_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_PATH_LICEN_CD' rs:number='289' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_PATH_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_FOCP_ADD_KD' rs:number='290' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_FOCP_ADD_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_EXAM_DT' rs:number='291' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_EXAM_SQ' rs:number='292' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_CFRM_CD' rs:number='293' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_LVEX_DT' rs:number='294' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_LVEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_ALT_VL' rs:number='295' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_ALT_VL'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBTP_KD' rs:number='296' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBTP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBRT_CD' rs:number='297' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBRT_VL' rs:number='298' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBRT_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBVL_VL' rs:number='299' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBVL_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBPJ_KD' rs:number='300' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBPJ_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCTP_KD' rs:number='301' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCTP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCRT_CD' rs:number='302' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCRT_VL' rs:number='303' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCRT_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCVL_VL' rs:number='304' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCVL_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCPJ_KD' rs:number='305' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCPJ_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL1_KD' rs:number='306' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL2_KD' rs:number='307' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL3_KD' rs:number='308' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USPO_KD' rs:number='309' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USPO_KD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN1_KD' rs:number='310' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_KD' rs:number='311' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN3_KD' rs:number='312' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USETC_KD' rs:number='313' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USETC_EX' rs:number='314' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPTP_KD' rs:number='315' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPTP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPRT_CD' rs:number='316' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPRT_VL' rs:number='317' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPRT_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPRT_UNIT' rs:number='318' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPRT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPVL_VL' rs:number='319' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPVL_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_RSLT_KD' rs:number='320' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_ETC_EX' rs:number='321' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_LICN_YN' rs:number='322' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_LICN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_RSLT_EX' rs:number='323' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_RPT_DT' rs:number='324' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_CFRM_DT' rs:number='325' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_LICEN_CD' rs:number='326' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_INPUT_DTT' rs:number='327' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_INPUT_ID' rs:number='328' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_MODI_DTT' rs:number='329' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_MODI_ID' rs:number='330' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_1_KD' rs:number='331' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_1_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_VL1' rs:number='332' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_VL1'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_VL2' rs:number='333' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_VL2'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_VL3' rs:number='334' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_VL3'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USETC_EX2' rs:number='335' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USETC_EX2'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_CKUP_LICEN_CD' rs:number='336' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_CKUP_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL4_KD' rs:number='337' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL4_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL5_KD' rs:number='338' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL5_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL6_KD' rs:number='339' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL6_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL7_KD' rs:number='340' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL7_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_EXAM_DT' rs:number='341' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_EXAM_SQ' rs:number='342' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_CFRM_CD' rs:number='343' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGEX_DT' rs:number='344' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGDS_KD' rs:number='345' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGDS_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGEX_KD' rs:number='346' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1_KD' rs:number='347' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1SR_KD' rs:number='348' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1SR_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1R_EX' rs:number='349' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1R_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1SL_KD' rs:number='350' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1L_EX' rs:number='351' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1L_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2_KD' rs:number='352' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2SR_KD' rs:number='353' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2SR_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2R_EX' rs:number='354' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2R_EX'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2SL_KD' rs:number='355' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2L_EX' rs:number='356' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2L_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3_KD' rs:number='357' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3SR_KD' rs:number='358' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3SR_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3R_EX' rs:number='359' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3R_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3SL_KD' rs:number='360' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3L_EX' rs:number='361' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3L_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT_EX' rs:number='362' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_RSLT_KD' rs:number='363' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_BRCN_YN' rs:number='364' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_BRCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_RSLT_EX' rs:number='365' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_RPT_DT' rs:number='366' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_CFRM_DT' rs:number='367' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_LICEN_CD' rs:number='368' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_INPUT_DTT' rs:number='369' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_INPUT_ID' rs:number='370' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MODI_DTT' rs:number='371' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MODI_ID' rs:number='372' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGPT_KD' rs:number='373' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGPT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_DECI_LICEN_CD' rs:number='374' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_DECI_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EXAM_DT' rs:number='375' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EXAM_SQ' rs:number='376' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CFRM_CD' rs:number='377' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVEX_DT' rs:number='378' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_DBCV_KD' rs:number='379' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_DBCV_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVSP1_KD' rs:number='380' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVSP1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CELL1_KD' rs:number='381' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CELL1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVRT1_KD' rs:number='382' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_SQRT1_KD' rs:number='383' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_SQRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHRT1_KD' rs:number='384' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_NHRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPRT1_KD' rs:number='385' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EPRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPET1_EX' rs:number='386' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EPET1_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RTET1_EX' rs:number='387' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RTET1_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCRT1_KD' rs:number='388' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETCRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCEX1_EX' rs:number='389' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETCEX1_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVSP2_KD' rs:number='390' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVSP2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CELL2_KD' rs:number='391' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CELL2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVRT2_KD' rs:number='392' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_SQRT2_KD' rs:number='393' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_SQRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHRT2_KD' rs:number='394' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_NHRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPRT2_KD' rs:number='395' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EPRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPET2_EX' rs:number='396' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EPET2_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RTET2_EX' rs:number='397' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RTET2_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCRT2_KD' rs:number='398' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETCRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCEX2_EX' rs:number='399' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETCEX2_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RSLT_KD' rs:number='400' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETC_EX' rs:number='401' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVCN_YN' rs:number='402' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RSLT_EX' rs:number='403' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RPT_DT' rs:number='404' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CFRM_DT' rs:number='405' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_LICEN_CD' rs:number='406' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_INPUT_DTT' rs:number='407' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_INPUT_ID' rs:number='408' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_MODI_DTT' rs:number='409' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_MODI_ID' rs:number='410' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHEP1_KD' rs:number='411' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_NHEP1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHEP2_KD' rs:number='412' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_NHEP2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_COLL_LICEN_CD' rs:number='413' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_COLL_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_PATH_LICEN_CD' rs:number='414' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_PATH_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_EXAM_DT' rs:number='415' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_EXAM_SQ' rs:number='416' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_CFRM_CD' rs:number='417' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_LUEX_DT' rs:number='418' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_LUEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_LUEX_KD' rs:number='419' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_LUEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_CTDI_VL' rs:number='420' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_CTDI_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_BEFO_YN' rs:number='421' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_BEFO_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_BEFO_YY' rs:number='422' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_BEFO_YY'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_BEFO_MM' rs:number='423' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_BEFO_MM'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT_YN' rs:number='424' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1_YN' rs:number='425' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1IC_KD' rs:number='426' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1IC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1SL_KD' rs:number='427' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1SZ1_VL' rs:number='428' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1SZ1_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1SZ2_VL' rs:number='429' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1SZ2_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1FT_KD' rs:number='430' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1FT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1TR1_KD' rs:number='431' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1TR1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT1TR2_KD' rs:number='432' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT1TR2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2_YN' rs:number='433' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2IC_KD' rs:number='434' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2IC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2SL_KD' rs:number='435' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2SZ1_VL' rs:number='436' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2SZ1_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2SZ2_VL' rs:number='437' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2SZ2_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2FT_KD' rs:number='438' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2FT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2TR1_KD' rs:number='439' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2TR1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT2TR2_KD' rs:number='440' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT2TR2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3_YN' rs:number='441' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3IC_KD' rs:number='442' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3IC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3SL_KD' rs:number='443' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3SZ1_VL' rs:number='444' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3SZ1_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3SZ2_VL' rs:number='445' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3SZ2_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3FT_KD' rs:number='446' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3FT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3TR1_KD' rs:number='447' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3TR1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT3TR2_KD' rs:number='448' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT3TR2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4_YN' rs:number='449' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4IC_KD' rs:number='450' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4IC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4SL_KD' rs:number='451' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4SZ1_VL' rs:number='452' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4SZ1_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4SZ2_VL' rs:number='453' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4SZ2_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4FT_KD' rs:number='454' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4FT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4TR1_KD' rs:number='455' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4TR1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT4TR2_KD' rs:number='456' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT4TR2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5_YN' rs:number='457' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5IC_KD' rs:number='458' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5IC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5SL_KD' rs:number='459' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5SZ1_VL' rs:number='460' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5SZ1_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5SZ2_VL' rs:number='461' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5SZ2_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5FT_KD' rs:number='462' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5FT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5TR1_KD' rs:number='463' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5TR1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT5TR2_KD' rs:number='464' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT5TR2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6_YN' rs:number='465' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6IC_KD' rs:number='466' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6IC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6SL_KD' rs:number='467' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6SZ1_VL' rs:number='468' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6SZ1_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6SZ2_VL' rs:number='469' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6SZ2_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6FT_KD' rs:number='470' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6FT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6TR1_KD' rs:number='471' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6TR1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_PNRT6TR2_KD' rs:number='472' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_PNRT6TR2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_BRLE_YN' rs:number='473' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_BRLE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_BRLE_EX' rs:number='474' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_BRLE_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_LUCN_KD' rs:number='475' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_LUCN_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_LUCN_EX' rs:number='476' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_LUCN_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_SCRT_CD' rs:number='477' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_SCRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='9'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_SCRT_EX' rs:number='478' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_SCRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_INPT_YN' rs:number='479' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_INPT_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_RSLT_KD' rs:number='480' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_RSLT2_KD' rs:number='481' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_RSLT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_ETC_EX' rs:number='482' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_RSLT_EX' rs:number='483' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_RSLT_ETC_EX' rs:number='484' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_RSLT_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_CFRM_DT' rs:number='485' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_LICEN_CD' rs:number='486' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_DECI_LICEN_CD' rs:number='487' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_DECI_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_LUCN_YN' rs:number='488' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_LUCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_AFRL_EX' rs:number='489' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_AFRL_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_AFSM_EX' rs:number='490' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_AFSM_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_AFDT_DT' rs:number='491' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_AFDT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_AFPL_CD' rs:number='492' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_AFPL_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_AFTE_LICEN_CD' rs:number='493' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_AFTE_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_INPUT_DTT' rs:number='494' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_INPUT_ID' rs:number='495' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_MODI_DTT' rs:number='496' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_MODI_ID' rs:number='497' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECG_ETC_KD' rs:number='498' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ECG_ETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='STMC_DT' rs:number='499' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='COLO_DT' rs:number='500' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='LIVER_DT' rs:number='501' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='BRST_DT' rs:number='502' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CRVC_DT' rs:number='503' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='LUNG_DT' rs:number='504' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='505' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c505' rs:name='ROWID' rs:number='506' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c506' rs:name='ROWID' rs:number='507' rs:rowid='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c507' rs:name='ROWID' rs:number='508' rs:rowid='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c508' rs:name='ROWID' rs:number='509' rs:rowid='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c509' rs:name='ROWID' rs:number='510' rs:rowid='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c510' rs:name='ROWID' rs:number='511' rs:rowid='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c511' rs:name='ROWID' rs:number='512' rs:rowid='true' rs:basetable='ET_CANCER_LUNG'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c512' rs:name='ROWID' rs:number='513' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c513' rs:name='ROWID' rs:number='514' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c514' rs:name='ROWID' rs:number='515' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c515' rs:name='ROWID' rs:number='516' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c516' rs:name='ROWID' rs:number='517' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c517' rs:name='ROWID' rs:number='518' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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
			String ICR_CUST_NO_T = cRsList.getString("ICR_CUST_NO");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String ICR_PENL_SQ_T = cRsList.getString("ICR_PENL_SQ");
			String ICR_PENL_NM_T = cRsList.getString("ICR_PENL_NM");
			String ICR_MANA_KD_T = cRsList.getString("ICR_MANA_KD");
			String ICR_CUST_KD_T = cRsList.getString("ICR_CUST_KD");
			String ICR_NTNA_CD_T = cRsList.getString("ICR_NTNA_CD");
			String ICR_CHART_NO_T = cRsList.getString("ICR_CHART_NO");
			String ICR_SEX_KD_T = cRsList.getString("ICR_SEX_KD");
			String ICR_COMP_CD_T = cRsList.getString("ICR_COMP_CD");
			String ICR_ENTR_DT_T = cRsList.getString("ICR_ENTR_DT");
			String ICR_BIRH_KD_T = cRsList.getString("ICR_BIRH_KD");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String ICR_MARY_KD_T = cRsList.getString("ICR_MARY_KD");
			String ICR_MARY_DT_T = cRsList.getString("ICR_MARY_DT");
			String ICR_TEL_NO_T = cRsList.getString("ICR_TEL_NO");
			String ICR_MOBL_NO_T = cRsList.getString("ICR_MOBL_NO");
			String ICR_EMAI_AR_T = cRsList.getString("ICR_EMAI_AR");
			String ICR_ADDR_KD_T = cRsList.getString("ICR_ADDR_KD");
			String ICR_ZIP_CD_T = cRsList.getString("ICR_ZIP_CD");
			String ICR_ZIP_SQ_T = cRsList.getString("ICR_ZIP_SQ");
			String ICR_ZIP_AR_T = cRsList.getString("ICR_ZIP_AR");
			String ICR_LOTT_AR_T = cRsList.getString("ICR_LOTT_AR");
			String ICR_ROAD_AR_T = cRsList.getString("ICR_ROAD_AR");
			String ICR_BLDG_NO_T = cRsList.getString("ICR_BLDG_NO");
			String ICR_PARE_NM_T = cRsList.getString("ICR_PARE_NM");
			String ICR_PARE_NO_T = cRsList.getString("ICR_PARE_NO");
			String ICR_INFO_YN_T = cRsList.getString("ICR_INFO_YN");
			String ICR_RECV_YN_T = cRsList.getString("ICR_RECV_YN");
			String ICR_CUST_TX_T = cRsList.getString("ICR_CUST_TX");
			String ICR_DIVI_NM_T = cRsList.getString("ICR_DIVI_NM");
			String ICR_DIVI_CS_T = cRsList.getString("ICR_DIVI_CS");
			String ICR_DIVI_KD_T = cRsList.getString("ICR_DIVI_KD");
			String ICR_CLSS_KD_T = cRsList.getString("ICR_CLSS_KD");
			String ICR_DIVI_NO_T = cRsList.getString("ICR_DIVI_NO");
			String ICR_PID_EN_T = cRsList.getString("ICR_PID_EN");
			String ICR_USE_YN_T = cRsList.getString("ICR_USE_YN");
			String ICR_NUSE_ID_T = cRsList.getString("ICR_NUSE_ID");
			String ICR_NUSE_DTT_T = cRsList.getDate2("ICR_NUSE_DTT");
			String ICR_INPT_ID_T = cRsList.getString("ICR_INPT_ID");
			String ICR_INPT_DTT_T = cRsList.getDate2("ICR_INPT_DTT");
			String ICR_MODI_ID_T = cRsList.getString("ICR_MODI_ID");
			String ICR_MODI_DTT_T = cRsList.getDate2("ICR_MODI_DTT");
			String ICR_NOTE_YN_T = cRsList.getString("ICR_NOTE_YN");
			String ICR_CPENL_NM_T = cRsList.getString("ICR_CPENL_NM");
			String ICR_INFORE_YN_T = cRsList.getString("ICR_INFORE_YN");
			String ECS_EXAM_DT_T = cRsList.getString("ECS_EXAM_DT");
			String ECS_EXAM_SQ_T = cRsList.getString("ECS_EXAM_SQ");
			String ECS_CFRM_CD_T = cRsList.getString("ECS_CFRM_CD");
			String ECS_GIEX_DT_T = cRsList.getString("ECS_GIEX_DT");
			String ECS_GIEX_KD_T = cRsList.getString("ECS_GIEX_KD");
			String ECS_GIRT1_KD_T = cRsList.getString("ECS_GIRT1_KD");
			String ECS_GIRT1S_KD_T = cRsList.getString("ECS_GIRT1S_KD");
			String ECS_GIRT2_KD_T = cRsList.getString("ECS_GIRT2_KD");
			String ECS_GIRT2S_KD_T = cRsList.getString("ECS_GIRT2S_KD");
			String ECS_GIRT3_KD_T = cRsList.getString("ECS_GIRT3_KD");
			String ECS_GIRT3S_KD_T = cRsList.getString("ECS_GIRT3S_KD");
			String ECS_GIETC_KD_T = cRsList.getString("ECS_GIETC_KD");
			String ECS_GIRT_EX_T = cRsList.getString("ECS_GIRT_EX");
			String ECS_ENEX_DT_T = cRsList.getString("ECS_ENEX_DT");
			String ECS_ENRT1_KD_T = cRsList.getString("ECS_ENRT1_KD");
			String ECS_ENRT1S_KD_T = cRsList.getString("ECS_ENRT1S_KD");
			String ECS_ENRT2_KD_T = cRsList.getString("ECS_ENRT2_KD");
			String ECS_ENRT2S_KD_T = cRsList.getString("ECS_ENRT2S_KD");
			String ECS_ENRT3_KD_T = cRsList.getString("ECS_ENRT3_KD");
			String ECS_ENRT3S_KD_T = cRsList.getString("ECS_ENRT3S_KD");
			String ECS_ENETC_KD_T = cRsList.getString("ECS_ENETC_KD");
			String ECS_ENRT_EX_T = cRsList.getString("ECS_ENRT_EX");
			String ECS_BIEX_YN_T = cRsList.getString("ECS_BIEX_YN");
			String ECS_FOCP_KD_T = cRsList.getString("ECS_FOCP_KD");
			String ECS_BIRT_KD_T = cRsList.getString("ECS_BIRT_KD");
			String ECS_BICT_KD_T = cRsList.getString("ECS_BICT_KD");
			String ECS_BICNCR_KD_T = cRsList.getString("ECS_BICNCR_KD");
			String ECS_BICNCR_EX_T = cRsList.getString("ECS_BICNCR_EX");
			String ECS_BIETC_KD_T = cRsList.getString("ECS_BIETC_KD");
			String ECS_BIETC_EX_T = cRsList.getString("ECS_BIETC_EX");
			String ECS_RSLT_KD_T = cRsList.getString("ECS_RSLT_KD");
			String ECS_STCN_YN_T = cRsList.getString("ECS_STCN_YN");
			String ECS_ETC_EX_T = cRsList.getString("ECS_ETC_EX");
			String ECS_RSLT_EX_T = cRsList.getString("ECS_RSLT_EX");
			String ECS_RPT_DT_T = cRsList.getString("ECS_RPT_DT");
			String ECS_CFRM_DT_T = cRsList.getString("ECS_CFRM_DT");
			String ECS_LICEN_CD_T = cRsList.getString("ECS_LICEN_CD");
			String ECS_INPUT_DTT_T = cRsList.getDate2("ECS_INPUT_DTT");
			String ECS_INPUT_ID_T = cRsList.getString("ECS_INPUT_ID");
			String ECS_MODI_DTT_T = cRsList.getDate2("ECS_MODI_DTT");
			String ECS_MODI_ID_T = cRsList.getString("ECS_MODI_ID");
			String ECS_DECI_LICEN_CD_T = cRsList.getString("ECS_DECI_LICEN_CD");
			String ECS_CKUP_LICEN_CD_T = cRsList.getString("ECS_CKUP_LICEN_CD");
			String ECS_PATH_LICEN_CD_T = cRsList.getString("ECS_PATH_LICEN_CD");
			String ECS_GICM_KD_T = cRsList.getString("ECS_GICM_KD");
			String ECC_EXAM_DT_T = cRsList.getString("ECC_EXAM_DT");
			String ECC_EXAM_SQ_T = cRsList.getString("ECC_EXAM_SQ");
			String ECC_CFRM_CD_T = cRsList.getString("ECC_CFRM_CD");
			String ECC_OBEX_DT_T = cRsList.getString("ECC_OBEX_DT");
			String ECC_OBTP_KD_T = cRsList.getString("ECC_OBTP_KD");
			String ECC_OBRT_CD_T = cRsList.getString("ECC_OBRT_CD");
			String ECC_OBRT_VL_T = cRsList.getString("ECC_OBRT_VL");
			String ECC_OBVL_VL_T = cRsList.getString("ECC_OBVL_VL");
			String ECC_GIEX_DT_T = cRsList.getString("ECC_GIEX_DT");
			String ECC_GIEX_KD_T = cRsList.getString("ECC_GIEX_KD");
			String ECC_GIRT1_KD_T = cRsList.getString("ECC_GIRT1_KD");
			String ECC_GIRT1S_KD_T = cRsList.getString("ECC_GIRT1S_KD");
			String ECC_GIRT2_KD_T = cRsList.getString("ECC_GIRT2_KD");
			String ECC_GIRT2S_KD_T = cRsList.getString("ECC_GIRT2S_KD");
			String ECC_GIRT3_KD_T = cRsList.getString("ECC_GIRT3_KD");
			String ECC_GIRT3S_KD_T = cRsList.getString("ECC_GIRT3S_KD");
			String ECC_GIPL_VL_T = cRsList.getString("ECC_GIPL_VL");
			String ECC_GIETC_KD_T = cRsList.getString("ECC_GIETC_KD");
			String ECC_GIRT_EX_T = cRsList.getString("ECC_GIRT_EX");
			String ECC_ENEX_DT_T = cRsList.getString("ECC_ENEX_DT");
			String ECC_ENRT1_KD_T = cRsList.getString("ECC_ENRT1_KD");
			String ECC_ENRT1S_KD_T = cRsList.getString("ECC_ENRT1S_KD");
			String ECC_ENRT2_KD_T = cRsList.getString("ECC_ENRT2_KD");
			String ECC_ENRT2S_KD_T = cRsList.getString("ECC_ENRT2S_KD");
			String ECC_ENRT3_KD_T = cRsList.getString("ECC_ENRT3_KD");
			String ECC_ENRT3S_KD_T = cRsList.getString("ECC_ENRT3S_KD");
			String ECC_ENPL_VL_T = cRsList.getString("ECC_ENPL_VL");
			String ECC_ENPL_CT_T = cRsList.getString("ECC_ENPL_CT");
			String ECC_ENETC_KD_T = cRsList.getString("ECC_ENETC_KD");
			String ECC_ENRT_EX_T = cRsList.getString("ECC_ENRT_EX");
			String ECC_BIEX_YN_T = cRsList.getString("ECC_BIEX_YN");
			String ECC_FOCP_KD_T = cRsList.getString("ECC_FOCP_KD");
			String ECC_BIBF_KD_T = cRsList.getString("ECC_BIBF_KD");
			String ECC_BICT_KD_T = cRsList.getString("ECC_BICT_KD");
			String ECC_BIRT_KD_T = cRsList.getString("ECC_BIRT_KD");
			String ECC_BICNCR_KD_T = cRsList.getString("ECC_BICNCR_KD");
			String ECC_BICNCR_EX_T = cRsList.getString("ECC_BICNCR_EX");
			String ECC_BIETC_KD_T = cRsList.getString("ECC_BIETC_KD");
			String ECC_BIETC_EX_T = cRsList.getString("ECC_BIETC_EX");
			String ECC_RSLT_KD_T = cRsList.getString("ECC_RSLT_KD");
			String ECC_ETC_EX_T = cRsList.getString("ECC_ETC_EX");
			String ECC_STCN_YN_T = cRsList.getString("ECC_STCN_YN");
			String ECC_RSLT_EX_T = cRsList.getString("ECC_RSLT_EX");
			String ECC_RPT_DT_T = cRsList.getString("ECC_RPT_DT");
			String ECC_CFRM_DT_T = cRsList.getString("ECC_CFRM_DT");
			String ECC_LICEN_CD_T = cRsList.getString("ECC_LICEN_CD");
			String ECC_INPUT_DTT_T = cRsList.getDate2("ECC_INPUT_DTT");
			String ECC_INPUT_ID_T = cRsList.getString("ECC_INPUT_ID");
			String ECC_MODI_DTT_T = cRsList.getDate2("ECC_MODI_DTT");
			String ECC_MODI_ID_T = cRsList.getString("ECC_MODI_ID");
			String ECC_ENCE_KD_T = cRsList.getString("ECC_ENCE_KD");
			String ECC_ENJJ_KD_T = cRsList.getString("ECC_ENJJ_KD");
			String ECC_DECI_LICEN_CD_T = cRsList.getString("ECC_DECI_LICEN_CD");
			String ECC_CKUP_LICEN_CD_T = cRsList.getString("ECC_CKUP_LICEN_CD");
			String ECC_PATH_LICEN_CD_T = cRsList.getString("ECC_PATH_LICEN_CD");
			String ECC_FOCP_ADD_KD_T = cRsList.getString("ECC_FOCP_ADD_KD");
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
			String ECB_EXAM_DT_T = cRsList.getString("ECB_EXAM_DT");
			String ECB_EXAM_SQ_T = cRsList.getString("ECB_EXAM_SQ");
			String ECB_CFRM_CD_T = cRsList.getString("ECB_CFRM_CD");
			String ECB_MGEX_DT_T = cRsList.getString("ECB_MGEX_DT");
			String ECB_MGDS_KD_T = cRsList.getString("ECB_MGDS_KD");
			String ECB_MGEX_KD_T = cRsList.getString("ECB_MGEX_KD");
			String ECB_MGRT1_KD_T = cRsList.getString("ECB_MGRT1_KD");
			String ECB_MGRT1SR_KD_T = cRsList.getString("ECB_MGRT1SR_KD");
			String ECB_MGRT1R_EX_T = cRsList.getString("ECB_MGRT1R_EX");
			String ECB_MGRT1SL_KD_T = cRsList.getString("ECB_MGRT1SL_KD");
			String ECB_MGRT1L_EX_T = cRsList.getString("ECB_MGRT1L_EX");
			String ECB_MGRT2_KD_T = cRsList.getString("ECB_MGRT2_KD");
			String ECB_MGRT2SR_KD_T = cRsList.getString("ECB_MGRT2SR_KD");
			String ECB_MGRT2R_EX_T = cRsList.getString("ECB_MGRT2R_EX");
			String ECB_MGRT2SL_KD_T = cRsList.getString("ECB_MGRT2SL_KD");
			String ECB_MGRT2L_EX_T = cRsList.getString("ECB_MGRT2L_EX");
			String ECB_MGRT3_KD_T = cRsList.getString("ECB_MGRT3_KD");
			String ECB_MGRT3SR_KD_T = cRsList.getString("ECB_MGRT3SR_KD");
			String ECB_MGRT3R_EX_T = cRsList.getString("ECB_MGRT3R_EX");
			String ECB_MGRT3SL_KD_T = cRsList.getString("ECB_MGRT3SL_KD");
			String ECB_MGRT3L_EX_T = cRsList.getString("ECB_MGRT3L_EX");
			String ECB_MGRT_EX_T = cRsList.getString("ECB_MGRT_EX");
			String ECB_RSLT_KD_T = cRsList.getString("ECB_RSLT_KD");
			String ECB_BRCN_YN_T = cRsList.getString("ECB_BRCN_YN");
			String ECB_RSLT_EX_T = cRsList.getString("ECB_RSLT_EX");
			String ECB_RPT_DT_T = cRsList.getString("ECB_RPT_DT");
			String ECB_CFRM_DT_T = cRsList.getString("ECB_CFRM_DT");
			String ECB_LICEN_CD_T = cRsList.getString("ECB_LICEN_CD");
			String ECB_INPUT_DTT_T = cRsList.getDate2("ECB_INPUT_DTT");
			String ECB_INPUT_ID_T = cRsList.getString("ECB_INPUT_ID");
			String ECB_MODI_DTT_T = cRsList.getDate2("ECB_MODI_DTT");
			String ECB_MODI_ID_T = cRsList.getString("ECB_MODI_ID");
			String ECB_MGPT_KD_T = cRsList.getString("ECB_MGPT_KD");
			String ECB_DECI_LICEN_CD_T = cRsList.getString("ECB_DECI_LICEN_CD");
			String ECV_EXAM_DT_T = cRsList.getString("ECV_EXAM_DT");
			String ECV_EXAM_SQ_T = cRsList.getString("ECV_EXAM_SQ");
			String ECV_CFRM_CD_T = cRsList.getString("ECV_CFRM_CD");
			String ECV_CVEX_DT_T = cRsList.getString("ECV_CVEX_DT");
			String ECV_DBCV_KD_T = cRsList.getString("ECV_DBCV_KD");
			String ECV_CVSP1_KD_T = cRsList.getString("ECV_CVSP1_KD");
			String ECV_CELL1_KD_T = cRsList.getString("ECV_CELL1_KD");
			String ECV_CVRT1_KD_T = cRsList.getString("ECV_CVRT1_KD");
			String ECV_SQRT1_KD_T = cRsList.getString("ECV_SQRT1_KD");
			String ECV_NHRT1_KD_T = cRsList.getString("ECV_NHRT1_KD");
			String ECV_EPRT1_KD_T = cRsList.getString("ECV_EPRT1_KD");
			String ECV_EPET1_EX_T = cRsList.getString("ECV_EPET1_EX");
			String ECV_RTET1_EX_T = cRsList.getString("ECV_RTET1_EX");
			String ECV_ETCRT1_KD_T = cRsList.getString("ECV_ETCRT1_KD");
			String ECV_ETCEX1_EX_T = cRsList.getString("ECV_ETCEX1_EX");
			String ECV_CVSP2_KD_T = cRsList.getString("ECV_CVSP2_KD");
			String ECV_CELL2_KD_T = cRsList.getString("ECV_CELL2_KD");
			String ECV_CVRT2_KD_T = cRsList.getString("ECV_CVRT2_KD");
			String ECV_SQRT2_KD_T = cRsList.getString("ECV_SQRT2_KD");
			String ECV_NHRT2_KD_T = cRsList.getString("ECV_NHRT2_KD");
			String ECV_EPRT2_KD_T = cRsList.getString("ECV_EPRT2_KD");
			String ECV_EPET2_EX_T = cRsList.getString("ECV_EPET2_EX");
			String ECV_RTET2_EX_T = cRsList.getString("ECV_RTET2_EX");
			String ECV_ETCRT2_KD_T = cRsList.getString("ECV_ETCRT2_KD");
			String ECV_ETCEX2_EX_T = cRsList.getString("ECV_ETCEX2_EX");
			String ECV_RSLT_KD_T = cRsList.getString("ECV_RSLT_KD");
			String ECV_ETC_EX_T = cRsList.getString("ECV_ETC_EX");
			String ECV_CVCN_YN_T = cRsList.getString("ECV_CVCN_YN");
			String ECV_RSLT_EX_T = cRsList.getString("ECV_RSLT_EX");
			String ECV_RPT_DT_T = cRsList.getString("ECV_RPT_DT");
			String ECV_CFRM_DT_T = cRsList.getString("ECV_CFRM_DT");
			String ECV_LICEN_CD_T = cRsList.getString("ECV_LICEN_CD");
			String ECV_INPUT_DTT_T = cRsList.getDate2("ECV_INPUT_DTT");
			String ECV_INPUT_ID_T = cRsList.getString("ECV_INPUT_ID");
			String ECV_MODI_DTT_T = cRsList.getDate2("ECV_MODI_DTT");
			String ECV_MODI_ID_T = cRsList.getString("ECV_MODI_ID");
			String ECV_NHEP1_KD_T = cRsList.getString("ECV_NHEP1_KD");
			String ECV_NHEP2_KD_T = cRsList.getString("ECV_NHEP2_KD");
			String ECV_COLL_LICEN_CD_T = cRsList.getString("ECV_COLL_LICEN_CD");
			String ECV_PATH_LICEN_CD_T = cRsList.getString("ECV_PATH_LICEN_CD");
			String ECG_EXAM_DT_T = cRsList.getString("ECG_EXAM_DT");
			String ECG_EXAM_SQ_T = cRsList.getString("ECG_EXAM_SQ");
			String ECG_CFRM_CD_T = cRsList.getString("ECG_CFRM_CD");
			String ECG_LUEX_DT_T = cRsList.getString("ECG_LUEX_DT");
			String ECG_LUEX_KD_T = cRsList.getString("ECG_LUEX_KD");
			String ECG_CTDI_VL_T = cRsList.getString("ECG_CTDI_VL");
			String ECG_BEFO_YN_T = cRsList.getString("ECG_BEFO_YN");
			String ECG_BEFO_YY_T = cRsList.getString("ECG_BEFO_YY");
			String ECG_BEFO_MM_T = cRsList.getString("ECG_BEFO_MM");
			String ECG_PNRT_YN_T = cRsList.getString("ECG_PNRT_YN");
			String ECG_PNRT1_YN_T = cRsList.getString("ECG_PNRT1_YN");
			String ECG_PNRT1IC_KD_T = cRsList.getString("ECG_PNRT1IC_KD");
			String ECG_PNRT1SL_KD_T = cRsList.getString("ECG_PNRT1SL_KD");
			String ECG_PNRT1SZ1_VL_T = cRsList.getString("ECG_PNRT1SZ1_VL");
			String ECG_PNRT1SZ2_VL_T = cRsList.getString("ECG_PNRT1SZ2_VL");
			String ECG_PNRT1FT_KD_T = cRsList.getString("ECG_PNRT1FT_KD");
			String ECG_PNRT1TR1_KD_T = cRsList.getString("ECG_PNRT1TR1_KD");
			String ECG_PNRT1TR2_KD_T = cRsList.getString("ECG_PNRT1TR2_KD");
			String ECG_PNRT2_YN_T = cRsList.getString("ECG_PNRT2_YN");
			String ECG_PNRT2IC_KD_T = cRsList.getString("ECG_PNRT2IC_KD");
			String ECG_PNRT2SL_KD_T = cRsList.getString("ECG_PNRT2SL_KD");
			String ECG_PNRT2SZ1_VL_T = cRsList.getString("ECG_PNRT2SZ1_VL");
			String ECG_PNRT2SZ2_VL_T = cRsList.getString("ECG_PNRT2SZ2_VL");
			String ECG_PNRT2FT_KD_T = cRsList.getString("ECG_PNRT2FT_KD");
			String ECG_PNRT2TR1_KD_T = cRsList.getString("ECG_PNRT2TR1_KD");
			String ECG_PNRT2TR2_KD_T = cRsList.getString("ECG_PNRT2TR2_KD");
			String ECG_PNRT3_YN_T = cRsList.getString("ECG_PNRT3_YN");
			String ECG_PNRT3IC_KD_T = cRsList.getString("ECG_PNRT3IC_KD");
			String ECG_PNRT3SL_KD_T = cRsList.getString("ECG_PNRT3SL_KD");
			String ECG_PNRT3SZ1_VL_T = cRsList.getString("ECG_PNRT3SZ1_VL");
			String ECG_PNRT3SZ2_VL_T = cRsList.getString("ECG_PNRT3SZ2_VL");
			String ECG_PNRT3FT_KD_T = cRsList.getString("ECG_PNRT3FT_KD");
			String ECG_PNRT3TR1_KD_T = cRsList.getString("ECG_PNRT3TR1_KD");
			String ECG_PNRT3TR2_KD_T = cRsList.getString("ECG_PNRT3TR2_KD");
			String ECG_PNRT4_YN_T = cRsList.getString("ECG_PNRT4_YN");
			String ECG_PNRT4IC_KD_T = cRsList.getString("ECG_PNRT4IC_KD");
			String ECG_PNRT4SL_KD_T = cRsList.getString("ECG_PNRT4SL_KD");
			String ECG_PNRT4SZ1_VL_T = cRsList.getString("ECG_PNRT4SZ1_VL");
			String ECG_PNRT4SZ2_VL_T = cRsList.getString("ECG_PNRT4SZ2_VL");
			String ECG_PNRT4FT_KD_T = cRsList.getString("ECG_PNRT4FT_KD");
			String ECG_PNRT4TR1_KD_T = cRsList.getString("ECG_PNRT4TR1_KD");
			String ECG_PNRT4TR2_KD_T = cRsList.getString("ECG_PNRT4TR2_KD");
			String ECG_PNRT5_YN_T = cRsList.getString("ECG_PNRT5_YN");
			String ECG_PNRT5IC_KD_T = cRsList.getString("ECG_PNRT5IC_KD");
			String ECG_PNRT5SL_KD_T = cRsList.getString("ECG_PNRT5SL_KD");
			String ECG_PNRT5SZ1_VL_T = cRsList.getString("ECG_PNRT5SZ1_VL");
			String ECG_PNRT5SZ2_VL_T = cRsList.getString("ECG_PNRT5SZ2_VL");
			String ECG_PNRT5FT_KD_T = cRsList.getString("ECG_PNRT5FT_KD");
			String ECG_PNRT5TR1_KD_T = cRsList.getString("ECG_PNRT5TR1_KD");
			String ECG_PNRT5TR2_KD_T = cRsList.getString("ECG_PNRT5TR2_KD");
			String ECG_PNRT6_YN_T = cRsList.getString("ECG_PNRT6_YN");
			String ECG_PNRT6IC_KD_T = cRsList.getString("ECG_PNRT6IC_KD");
			String ECG_PNRT6SL_KD_T = cRsList.getString("ECG_PNRT6SL_KD");
			String ECG_PNRT6SZ1_VL_T = cRsList.getString("ECG_PNRT6SZ1_VL");
			String ECG_PNRT6SZ2_VL_T = cRsList.getString("ECG_PNRT6SZ2_VL");
			String ECG_PNRT6FT_KD_T = cRsList.getString("ECG_PNRT6FT_KD");
			String ECG_PNRT6TR1_KD_T = cRsList.getString("ECG_PNRT6TR1_KD");
			String ECG_PNRT6TR2_KD_T = cRsList.getString("ECG_PNRT6TR2_KD");
			String ECG_BRLE_YN_T = cRsList.getString("ECG_BRLE_YN");
			String ECG_BRLE_EX_T = cRsList.getString("ECG_BRLE_EX");
			String ECG_LUCN_KD_T = cRsList.getString("ECG_LUCN_KD");
			String ECG_LUCN_EX_T = cRsList.getString("ECG_LUCN_EX");
			String ECG_SCRT_CD_T = cRsList.getString("ECG_SCRT_CD");
			String ECG_SCRT_EX_T = cRsList.getString("ECG_SCRT_EX");
			String ECG_INPT_YN_T = cRsList.getString("ECG_INPT_YN");
			String ECG_RSLT_KD_T = cRsList.getString("ECG_RSLT_KD");
			String ECG_RSLT2_KD_T = cRsList.getString("ECG_RSLT2_KD");
			String ECG_ETC_EX_T = cRsList.getString("ECG_ETC_EX");
			String ECG_RSLT_EX_T = cRsList.getString("ECG_RSLT_EX");
			String ECG_RSLT_ETC_EX_T = cRsList.getString("ECG_RSLT_ETC_EX");
			String ECG_CFRM_DT_T = cRsList.getString("ECG_CFRM_DT");
			String ECG_LICEN_CD_T = cRsList.getString("ECG_LICEN_CD");
			String ECG_DECI_LICEN_CD_T = cRsList.getString("ECG_DECI_LICEN_CD");
			String ECG_LUCN_YN_T = cRsList.getString("ECG_LUCN_YN");
			String ECG_AFRL_EX_T = cRsList.getString("ECG_AFRL_EX");
			String ECG_AFSM_EX_T = cRsList.getString("ECG_AFSM_EX");
			String ECG_AFDT_DT_T = cRsList.getString("ECG_AFDT_DT");
			String ECG_AFPL_CD_T = cRsList.getString("ECG_AFPL_CD");
			String ECG_AFTE_LICEN_CD_T = cRsList.getString("ECG_AFTE_LICEN_CD");
			String ECG_INPUT_DTT_T = cRsList.getDate2("ECG_INPUT_DTT");
			String ECG_INPUT_ID_T = cRsList.getString("ECG_INPUT_ID");
			String ECG_MODI_DTT_T = cRsList.getDate2("ECG_MODI_DTT");
			String ECG_MODI_ID_T = cRsList.getString("ECG_MODI_ID");
			String ECG_ETC_KD_T = cRsList.getString("ECG_ETC_KD");
			String STMC_DT_T = cRsList.getString("STMC_DT");
			String COLO_DT_T = cRsList.getString("COLO_DT");
			String LIVER_DT_T = cRsList.getString("LIVER_DT");
			String BRST_DT_T = cRsList.getString("BRST_DT");
			String CRVC_DT_T = cRsList.getString("CRVC_DT");
			String LUNG_DT_T = cRsList.getString("LUNG_DT");
			String ROWID_T = cRsList.getString("ROWID");
			String c505_T = cRsList.getString("c505");
			String c506_T = cRsList.getString("c506");
			String c507_T = cRsList.getString("c507");
			String c508_T = cRsList.getString("c508");
			String c509_T = cRsList.getString("c509");
			String c510_T = cRsList.getString("c510");
			String c511_T = cRsList.getString("c511");
			String c512_T = cRsList.getString("c512");
			String c513_T = cRsList.getString("c513");
			String c514_T = cRsList.getString("c514");
			String c515_T = cRsList.getString("c515");
			String c516_T = cRsList.getString("c516");
			String c517_T = cRsList.getString("c517");
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

			if(! ICR_CUST_NO_T.equals("")) {
%>
		 		ICR_CUST_NO='<%= ICR_CUST_NO_T%>'
<%
			}

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! ICR_PENL_SQ_T.equals("")) {
%>
		 		ICR_PENL_SQ='<%= ICR_PENL_SQ_T%>'
<%
			}

			if(! ICR_PENL_NM_T.equals("")) {
%>
		 		ICR_PENL_NM='<%= ICR_PENL_NM_T%>'
<%
			}

			if(! ICR_MANA_KD_T.equals("")) {
%>
		 		ICR_MANA_KD='<%= ICR_MANA_KD_T%>'
<%
			}

			if(! ICR_CUST_KD_T.equals("")) {
%>
		 		ICR_CUST_KD='<%= ICR_CUST_KD_T%>'
<%
			}

			if(! ICR_NTNA_CD_T.equals("")) {
%>
		 		ICR_NTNA_CD='<%= ICR_NTNA_CD_T%>'
<%
			}

			if(! ICR_CHART_NO_T.equals("")) {
%>
		 		ICR_CHART_NO='<%= ICR_CHART_NO_T%>'
<%
			}

			if(! ICR_SEX_KD_T.equals("")) {
%>
		 		ICR_SEX_KD='<%= ICR_SEX_KD_T%>'
<%
			}

			if(! ICR_COMP_CD_T.equals("")) {
%>
		 		ICR_COMP_CD='<%= ICR_COMP_CD_T%>'
<%
			}

			if(! ICR_ENTR_DT_T.equals("")) {
%>
		 		ICR_ENTR_DT='<%= ICR_ENTR_DT_T%>'
<%
			}

			if(! ICR_BIRH_KD_T.equals("")) {
%>
		 		ICR_BIRH_KD='<%= ICR_BIRH_KD_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! ICR_MARY_KD_T.equals("")) {
%>
		 		ICR_MARY_KD='<%= ICR_MARY_KD_T%>'
<%
			}

			if(! ICR_MARY_DT_T.equals("")) {
%>
		 		ICR_MARY_DT='<%= ICR_MARY_DT_T%>'
<%
			}

			if(! ICR_TEL_NO_T.equals("")) {
%>
		 		ICR_TEL_NO='<%= ICR_TEL_NO_T%>'
<%
			}

			if(! ICR_MOBL_NO_T.equals("")) {
%>
		 		ICR_MOBL_NO='<%= ICR_MOBL_NO_T%>'
<%
			}

			if(! ICR_EMAI_AR_T.equals("")) {
%>
		 		ICR_EMAI_AR='<%= ICR_EMAI_AR_T%>'
<%
			}

			if(! ICR_ADDR_KD_T.equals("")) {
%>
		 		ICR_ADDR_KD='<%= ICR_ADDR_KD_T%>'
<%
			}

			if(! ICR_ZIP_CD_T.equals("")) {
%>
		 		ICR_ZIP_CD='<%= ICR_ZIP_CD_T%>'
<%
			}

			if(! ICR_ZIP_SQ_T.equals("")) {
%>
		 		ICR_ZIP_SQ='<%= ICR_ZIP_SQ_T%>'
<%
			}

			if(! ICR_ZIP_AR_T.equals("")) {
%>
		 		ICR_ZIP_AR='<%= ICR_ZIP_AR_T%>'
<%
			}

			if(! ICR_LOTT_AR_T.equals("")) {
%>
		 		ICR_LOTT_AR='<%= ICR_LOTT_AR_T%>'
<%
			}

			if(! ICR_ROAD_AR_T.equals("")) {
%>
		 		ICR_ROAD_AR='<%= ICR_ROAD_AR_T%>'
<%
			}

			if(! ICR_BLDG_NO_T.equals("")) {
%>
		 		ICR_BLDG_NO='<%= ICR_BLDG_NO_T%>'
<%
			}

			if(! ICR_PARE_NM_T.equals("")) {
%>
		 		ICR_PARE_NM='<%= ICR_PARE_NM_T%>'
<%
			}

			if(! ICR_PARE_NO_T.equals("")) {
%>
		 		ICR_PARE_NO='<%= ICR_PARE_NO_T%>'
<%
			}

			if(! ICR_INFO_YN_T.equals("")) {
%>
		 		ICR_INFO_YN='<%= ICR_INFO_YN_T%>'
<%
			}

			if(! ICR_RECV_YN_T.equals("")) {
%>
		 		ICR_RECV_YN='<%= ICR_RECV_YN_T%>'
<%
			}

			if(! ICR_CUST_TX_T.equals("")) {
%>
		 		ICR_CUST_TX='<%= ICR_CUST_TX_T%>'
<%
			}

			if(! ICR_DIVI_NM_T.equals("")) {
%>
		 		ICR_DIVI_NM='<%= ICR_DIVI_NM_T%>'
<%
			}

			if(! ICR_DIVI_CS_T.equals("")) {
%>
		 		ICR_DIVI_CS='<%= ICR_DIVI_CS_T%>'
<%
			}

			if(! ICR_DIVI_KD_T.equals("")) {
%>
		 		ICR_DIVI_KD='<%= ICR_DIVI_KD_T%>'
<%
			}

			if(! ICR_CLSS_KD_T.equals("")) {
%>
		 		ICR_CLSS_KD='<%= ICR_CLSS_KD_T%>'
<%
			}

			if(! ICR_DIVI_NO_T.equals("")) {
%>
		 		ICR_DIVI_NO='<%= ICR_DIVI_NO_T%>'
<%
			}

			if(! ICR_PID_EN_T.equals("")) {
%>
		 		ICR_PID_EN='<%= ICR_PID_EN_T%>'
<%
			}

			if(! ICR_USE_YN_T.equals("")) {
%>
		 		ICR_USE_YN='<%= ICR_USE_YN_T%>'
<%
			}

			if(! ICR_NUSE_ID_T.equals("")) {
%>
		 		ICR_NUSE_ID='<%= ICR_NUSE_ID_T%>'
<%
			}

			if(! ICR_NUSE_DTT_T.equals("")) {
%>
		 		ICR_NUSE_DTT='<%= ICR_NUSE_DTT_T%>'
<%
			}

			if(! ICR_INPT_ID_T.equals("")) {
%>
		 		ICR_INPT_ID='<%= ICR_INPT_ID_T%>'
<%
			}

			if(! ICR_INPT_DTT_T.equals("")) {
%>
		 		ICR_INPT_DTT='<%= ICR_INPT_DTT_T%>'
<%
			}

			if(! ICR_MODI_ID_T.equals("")) {
%>
		 		ICR_MODI_ID='<%= ICR_MODI_ID_T%>'
<%
			}

			if(! ICR_MODI_DTT_T.equals("")) {
%>
		 		ICR_MODI_DTT='<%= ICR_MODI_DTT_T%>'
<%
			}

			if(! ICR_NOTE_YN_T.equals("")) {
%>
		 		ICR_NOTE_YN='<%= ICR_NOTE_YN_T%>'
<%
			}

			if(! ICR_CPENL_NM_T.equals("")) {
%>
		 		ICR_CPENL_NM='<%= ICR_CPENL_NM_T%>'
<%
			}

			if(! ICR_INFORE_YN_T.equals("")) {
%>
		 		ICR_INFORE_YN='<%= ICR_INFORE_YN_T%>'
<%
			}

			if(! ECS_EXAM_DT_T.equals("")) {
%>
		 		ECS_EXAM_DT='<%= ECS_EXAM_DT_T%>'
<%
			}

			if(! ECS_EXAM_SQ_T.equals("")) {
%>
		 		ECS_EXAM_SQ='<%= ECS_EXAM_SQ_T%>'
<%
			}

			if(! ECS_CFRM_CD_T.equals("")) {
%>
		 		ECS_CFRM_CD='<%= ECS_CFRM_CD_T%>'
<%
			}

			if(! ECS_GIEX_DT_T.equals("")) {
%>
		 		ECS_GIEX_DT='<%= ECS_GIEX_DT_T%>'
<%
			}

			if(! ECS_GIEX_KD_T.equals("")) {
%>
		 		ECS_GIEX_KD='<%= ECS_GIEX_KD_T%>'
<%
			}

			if(! ECS_GIRT1_KD_T.equals("")) {
%>
		 		ECS_GIRT1_KD='<%= ECS_GIRT1_KD_T%>'
<%
			}

			if(! ECS_GIRT1S_KD_T.equals("")) {
%>
		 		ECS_GIRT1S_KD='<%= ECS_GIRT1S_KD_T%>'
<%
			}

			if(! ECS_GIRT2_KD_T.equals("")) {
%>
		 		ECS_GIRT2_KD='<%= ECS_GIRT2_KD_T%>'
<%
			}

			if(! ECS_GIRT2S_KD_T.equals("")) {
%>
		 		ECS_GIRT2S_KD='<%= ECS_GIRT2S_KD_T%>'
<%
			}

			if(! ECS_GIRT3_KD_T.equals("")) {
%>
		 		ECS_GIRT3_KD='<%= ECS_GIRT3_KD_T%>'
<%
			}

			if(! ECS_GIRT3S_KD_T.equals("")) {
%>
		 		ECS_GIRT3S_KD='<%= ECS_GIRT3S_KD_T%>'
<%
			}

			if(! ECS_GIETC_KD_T.equals("")) {
%>
		 		ECS_GIETC_KD='<%= ECS_GIETC_KD_T%>'
<%
			}

			if(! ECS_GIRT_EX_T.equals("")) {
%>
		 		ECS_GIRT_EX='<%= ECS_GIRT_EX_T%>'
<%
			}

			if(! ECS_ENEX_DT_T.equals("")) {
%>
		 		ECS_ENEX_DT='<%= ECS_ENEX_DT_T%>'
<%
			}

			if(! ECS_ENRT1_KD_T.equals("")) {
%>
		 		ECS_ENRT1_KD='<%= ECS_ENRT1_KD_T%>'
<%
			}

			if(! ECS_ENRT1S_KD_T.equals("")) {
%>
		 		ECS_ENRT1S_KD='<%= ECS_ENRT1S_KD_T%>'
<%
			}

			if(! ECS_ENRT2_KD_T.equals("")) {
%>
		 		ECS_ENRT2_KD='<%= ECS_ENRT2_KD_T%>'
<%
			}

			if(! ECS_ENRT2S_KD_T.equals("")) {
%>
		 		ECS_ENRT2S_KD='<%= ECS_ENRT2S_KD_T%>'
<%
			}

			if(! ECS_ENRT3_KD_T.equals("")) {
%>
		 		ECS_ENRT3_KD='<%= ECS_ENRT3_KD_T%>'
<%
			}

			if(! ECS_ENRT3S_KD_T.equals("")) {
%>
		 		ECS_ENRT3S_KD='<%= ECS_ENRT3S_KD_T%>'
<%
			}

			if(! ECS_ENETC_KD_T.equals("")) {
%>
		 		ECS_ENETC_KD='<%= ECS_ENETC_KD_T%>'
<%
			}

			if(! ECS_ENRT_EX_T.equals("")) {
%>
		 		ECS_ENRT_EX='<%= ECS_ENRT_EX_T%>'
<%
			}

			if(! ECS_BIEX_YN_T.equals("")) {
%>
		 		ECS_BIEX_YN='<%= ECS_BIEX_YN_T%>'
<%
			}

			if(! ECS_FOCP_KD_T.equals("")) {
%>
		 		ECS_FOCP_KD='<%= ECS_FOCP_KD_T%>'
<%
			}

			if(! ECS_BIRT_KD_T.equals("")) {
%>
		 		ECS_BIRT_KD='<%= ECS_BIRT_KD_T%>'
<%
			}

			if(! ECS_BICT_KD_T.equals("")) {
%>
		 		ECS_BICT_KD='<%= ECS_BICT_KD_T%>'
<%
			}

			if(! ECS_BICNCR_KD_T.equals("")) {
%>
		 		ECS_BICNCR_KD='<%= ECS_BICNCR_KD_T%>'
<%
			}

			if(! ECS_BICNCR_EX_T.equals("")) {
%>
		 		ECS_BICNCR_EX='<%= ECS_BICNCR_EX_T%>'
<%
			}

			if(! ECS_BIETC_KD_T.equals("")) {
%>
		 		ECS_BIETC_KD='<%= ECS_BIETC_KD_T%>'
<%
			}

			if(! ECS_BIETC_EX_T.equals("")) {
%>
		 		ECS_BIETC_EX='<%= ECS_BIETC_EX_T%>'
<%
			}

			if(! ECS_RSLT_KD_T.equals("")) {
%>
		 		ECS_RSLT_KD='<%= ECS_RSLT_KD_T%>'
<%
			}

			if(! ECS_STCN_YN_T.equals("")) {
%>
		 		ECS_STCN_YN='<%= ECS_STCN_YN_T%>'
<%
			}

			if(! ECS_ETC_EX_T.equals("")) {
%>
		 		ECS_ETC_EX='<%= ECS_ETC_EX_T%>'
<%
			}

			if(! ECS_RSLT_EX_T.equals("")) {
%>
		 		ECS_RSLT_EX='<%= ECS_RSLT_EX_T%>'
<%
			}

			if(! ECS_RPT_DT_T.equals("")) {
%>
		 		ECS_RPT_DT='<%= ECS_RPT_DT_T%>'
<%
			}

			if(! ECS_CFRM_DT_T.equals("")) {
%>
		 		ECS_CFRM_DT='<%= ECS_CFRM_DT_T%>'
<%
			}

			if(! ECS_LICEN_CD_T.equals("")) {
%>
		 		ECS_LICEN_CD='<%= ECS_LICEN_CD_T%>'
<%
			}

			if(! ECS_INPUT_DTT_T.equals("")) {
%>
		 		ECS_INPUT_DTT='<%= ECS_INPUT_DTT_T%>'
<%
			}

			if(! ECS_INPUT_ID_T.equals("")) {
%>
		 		ECS_INPUT_ID='<%= ECS_INPUT_ID_T%>'
<%
			}

			if(! ECS_MODI_DTT_T.equals("")) {
%>
		 		ECS_MODI_DTT='<%= ECS_MODI_DTT_T%>'
<%
			}

			if(! ECS_MODI_ID_T.equals("")) {
%>
		 		ECS_MODI_ID='<%= ECS_MODI_ID_T%>'
<%
			}

			if(! ECS_DECI_LICEN_CD_T.equals("")) {
%>
		 		ECS_DECI_LICEN_CD='<%= ECS_DECI_LICEN_CD_T%>'
<%
			}

			if(! ECS_CKUP_LICEN_CD_T.equals("")) {
%>
		 		ECS_CKUP_LICEN_CD='<%= ECS_CKUP_LICEN_CD_T%>'
<%
			}

			if(! ECS_PATH_LICEN_CD_T.equals("")) {
%>
		 		ECS_PATH_LICEN_CD='<%= ECS_PATH_LICEN_CD_T%>'
<%
			}

			if(! ECS_GICM_KD_T.equals("")) {
%>
		 		ECS_GICM_KD='<%= ECS_GICM_KD_T%>'
<%
			}

			if(! ECC_EXAM_DT_T.equals("")) {
%>
		 		ECC_EXAM_DT='<%= ECC_EXAM_DT_T%>'
<%
			}

			if(! ECC_EXAM_SQ_T.equals("")) {
%>
		 		ECC_EXAM_SQ='<%= ECC_EXAM_SQ_T%>'
<%
			}

			if(! ECC_CFRM_CD_T.equals("")) {
%>
		 		ECC_CFRM_CD='<%= ECC_CFRM_CD_T%>'
<%
			}

			if(! ECC_OBEX_DT_T.equals("")) {
%>
		 		ECC_OBEX_DT='<%= ECC_OBEX_DT_T%>'
<%
			}

			if(! ECC_OBTP_KD_T.equals("")) {
%>
		 		ECC_OBTP_KD='<%= ECC_OBTP_KD_T%>'
<%
			}

			if(! ECC_OBRT_CD_T.equals("")) {
%>
		 		ECC_OBRT_CD='<%= ECC_OBRT_CD_T%>'
<%
			}

			if(! ECC_OBRT_VL_T.equals("")) {
%>
		 		ECC_OBRT_VL='<%= ECC_OBRT_VL_T%>'
<%
			}

			if(! ECC_OBVL_VL_T.equals("")) {
%>
		 		ECC_OBVL_VL='<%= ECC_OBVL_VL_T%>'
<%
			}

			if(! ECC_GIEX_DT_T.equals("")) {
%>
		 		ECC_GIEX_DT='<%= ECC_GIEX_DT_T%>'
<%
			}

			if(! ECC_GIEX_KD_T.equals("")) {
%>
		 		ECC_GIEX_KD='<%= ECC_GIEX_KD_T%>'
<%
			}

			if(! ECC_GIRT1_KD_T.equals("")) {
%>
		 		ECC_GIRT1_KD='<%= ECC_GIRT1_KD_T%>'
<%
			}

			if(! ECC_GIRT1S_KD_T.equals("")) {
%>
		 		ECC_GIRT1S_KD='<%= ECC_GIRT1S_KD_T%>'
<%
			}

			if(! ECC_GIRT2_KD_T.equals("")) {
%>
		 		ECC_GIRT2_KD='<%= ECC_GIRT2_KD_T%>'
<%
			}

			if(! ECC_GIRT2S_KD_T.equals("")) {
%>
		 		ECC_GIRT2S_KD='<%= ECC_GIRT2S_KD_T%>'
<%
			}

			if(! ECC_GIRT3_KD_T.equals("")) {
%>
		 		ECC_GIRT3_KD='<%= ECC_GIRT3_KD_T%>'
<%
			}

			if(! ECC_GIRT3S_KD_T.equals("")) {
%>
		 		ECC_GIRT3S_KD='<%= ECC_GIRT3S_KD_T%>'
<%
			}

			if(! ECC_GIPL_VL_T.equals("")) {
%>
		 		ECC_GIPL_VL='<%= ECC_GIPL_VL_T%>'
<%
			}

			if(! ECC_GIETC_KD_T.equals("")) {
%>
		 		ECC_GIETC_KD='<%= ECC_GIETC_KD_T%>'
<%
			}

			if(! ECC_GIRT_EX_T.equals("")) {
%>
		 		ECC_GIRT_EX='<%= ECC_GIRT_EX_T%>'
<%
			}

			if(! ECC_ENEX_DT_T.equals("")) {
%>
		 		ECC_ENEX_DT='<%= ECC_ENEX_DT_T%>'
<%
			}

			if(! ECC_ENRT1_KD_T.equals("")) {
%>
		 		ECC_ENRT1_KD='<%= ECC_ENRT1_KD_T%>'
<%
			}

			if(! ECC_ENRT1S_KD_T.equals("")) {
%>
		 		ECC_ENRT1S_KD='<%= ECC_ENRT1S_KD_T%>'
<%
			}

			if(! ECC_ENRT2_KD_T.equals("")) {
%>
		 		ECC_ENRT2_KD='<%= ECC_ENRT2_KD_T%>'
<%
			}

			if(! ECC_ENRT2S_KD_T.equals("")) {
%>
		 		ECC_ENRT2S_KD='<%= ECC_ENRT2S_KD_T%>'
<%
			}

			if(! ECC_ENRT3_KD_T.equals("")) {
%>
		 		ECC_ENRT3_KD='<%= ECC_ENRT3_KD_T%>'
<%
			}

			if(! ECC_ENRT3S_KD_T.equals("")) {
%>
		 		ECC_ENRT3S_KD='<%= ECC_ENRT3S_KD_T%>'
<%
			}

			if(! ECC_ENPL_VL_T.equals("")) {
%>
		 		ECC_ENPL_VL='<%= ECC_ENPL_VL_T%>'
<%
			}

			if(! ECC_ENPL_CT_T.equals("")) {
%>
		 		ECC_ENPL_CT='<%= ECC_ENPL_CT_T%>'
<%
			}

			if(! ECC_ENETC_KD_T.equals("")) {
%>
		 		ECC_ENETC_KD='<%= ECC_ENETC_KD_T%>'
<%
			}

			if(! ECC_ENRT_EX_T.equals("")) {
%>
		 		ECC_ENRT_EX='<%= ECC_ENRT_EX_T%>'
<%
			}

			if(! ECC_BIEX_YN_T.equals("")) {
%>
		 		ECC_BIEX_YN='<%= ECC_BIEX_YN_T%>'
<%
			}

			if(! ECC_FOCP_KD_T.equals("")) {
%>
		 		ECC_FOCP_KD='<%= ECC_FOCP_KD_T%>'
<%
			}

			if(! ECC_BIBF_KD_T.equals("")) {
%>
		 		ECC_BIBF_KD='<%= ECC_BIBF_KD_T%>'
<%
			}

			if(! ECC_BICT_KD_T.equals("")) {
%>
		 		ECC_BICT_KD='<%= ECC_BICT_KD_T%>'
<%
			}

			if(! ECC_BIRT_KD_T.equals("")) {
%>
		 		ECC_BIRT_KD='<%= ECC_BIRT_KD_T%>'
<%
			}

			if(! ECC_BICNCR_KD_T.equals("")) {
%>
		 		ECC_BICNCR_KD='<%= ECC_BICNCR_KD_T%>'
<%
			}

			if(! ECC_BICNCR_EX_T.equals("")) {
%>
		 		ECC_BICNCR_EX='<%= ECC_BICNCR_EX_T%>'
<%
			}

			if(! ECC_BIETC_KD_T.equals("")) {
%>
		 		ECC_BIETC_KD='<%= ECC_BIETC_KD_T%>'
<%
			}

			if(! ECC_BIETC_EX_T.equals("")) {
%>
		 		ECC_BIETC_EX='<%= ECC_BIETC_EX_T%>'
<%
			}

			if(! ECC_RSLT_KD_T.equals("")) {
%>
		 		ECC_RSLT_KD='<%= ECC_RSLT_KD_T%>'
<%
			}

			if(! ECC_ETC_EX_T.equals("")) {
%>
		 		ECC_ETC_EX='<%= ECC_ETC_EX_T%>'
<%
			}

			if(! ECC_STCN_YN_T.equals("")) {
%>
		 		ECC_STCN_YN='<%= ECC_STCN_YN_T%>'
<%
			}

			if(! ECC_RSLT_EX_T.equals("")) {
%>
		 		ECC_RSLT_EX='<%= ECC_RSLT_EX_T%>'
<%
			}

			if(! ECC_RPT_DT_T.equals("")) {
%>
		 		ECC_RPT_DT='<%= ECC_RPT_DT_T%>'
<%
			}

			if(! ECC_CFRM_DT_T.equals("")) {
%>
		 		ECC_CFRM_DT='<%= ECC_CFRM_DT_T%>'
<%
			}

			if(! ECC_LICEN_CD_T.equals("")) {
%>
		 		ECC_LICEN_CD='<%= ECC_LICEN_CD_T%>'
<%
			}

			if(! ECC_INPUT_DTT_T.equals("")) {
%>
		 		ECC_INPUT_DTT='<%= ECC_INPUT_DTT_T%>'
<%
			}

			if(! ECC_INPUT_ID_T.equals("")) {
%>
		 		ECC_INPUT_ID='<%= ECC_INPUT_ID_T%>'
<%
			}

			if(! ECC_MODI_DTT_T.equals("")) {
%>
		 		ECC_MODI_DTT='<%= ECC_MODI_DTT_T%>'
<%
			}

			if(! ECC_MODI_ID_T.equals("")) {
%>
		 		ECC_MODI_ID='<%= ECC_MODI_ID_T%>'
<%
			}

			if(! ECC_ENCE_KD_T.equals("")) {
%>
		 		ECC_ENCE_KD='<%= ECC_ENCE_KD_T%>'
<%
			}

			if(! ECC_ENJJ_KD_T.equals("")) {
%>
		 		ECC_ENJJ_KD='<%= ECC_ENJJ_KD_T%>'
<%
			}

			if(! ECC_DECI_LICEN_CD_T.equals("")) {
%>
		 		ECC_DECI_LICEN_CD='<%= ECC_DECI_LICEN_CD_T%>'
<%
			}

			if(! ECC_CKUP_LICEN_CD_T.equals("")) {
%>
		 		ECC_CKUP_LICEN_CD='<%= ECC_CKUP_LICEN_CD_T%>'
<%
			}

			if(! ECC_PATH_LICEN_CD_T.equals("")) {
%>
		 		ECC_PATH_LICEN_CD='<%= ECC_PATH_LICEN_CD_T%>'
<%
			}

			if(! ECC_FOCP_ADD_KD_T.equals("")) {
%>
		 		ECC_FOCP_ADD_KD='<%= ECC_FOCP_ADD_KD_T%>'
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

			if(! ECB_EXAM_DT_T.equals("")) {
%>
		 		ECB_EXAM_DT='<%= ECB_EXAM_DT_T%>'
<%
			}

			if(! ECB_EXAM_SQ_T.equals("")) {
%>
		 		ECB_EXAM_SQ='<%= ECB_EXAM_SQ_T%>'
<%
			}

			if(! ECB_CFRM_CD_T.equals("")) {
%>
		 		ECB_CFRM_CD='<%= ECB_CFRM_CD_T%>'
<%
			}

			if(! ECB_MGEX_DT_T.equals("")) {
%>
		 		ECB_MGEX_DT='<%= ECB_MGEX_DT_T%>'
<%
			}

			if(! ECB_MGDS_KD_T.equals("")) {
%>
		 		ECB_MGDS_KD='<%= ECB_MGDS_KD_T%>'
<%
			}

			if(! ECB_MGEX_KD_T.equals("")) {
%>
		 		ECB_MGEX_KD='<%= ECB_MGEX_KD_T%>'
<%
			}

			if(! ECB_MGRT1_KD_T.equals("")) {
%>
		 		ECB_MGRT1_KD='<%= ECB_MGRT1_KD_T%>'
<%
			}

			if(! ECB_MGRT1SR_KD_T.equals("")) {
%>
		 		ECB_MGRT1SR_KD='<%= ECB_MGRT1SR_KD_T%>'
<%
			}

			if(! ECB_MGRT1R_EX_T.equals("")) {
%>
		 		ECB_MGRT1R_EX='<%= ECB_MGRT1R_EX_T%>'
<%
			}

			if(! ECB_MGRT1SL_KD_T.equals("")) {
%>
		 		ECB_MGRT1SL_KD='<%= ECB_MGRT1SL_KD_T%>'
<%
			}

			if(! ECB_MGRT1L_EX_T.equals("")) {
%>
		 		ECB_MGRT1L_EX='<%= ECB_MGRT1L_EX_T%>'
<%
			}

			if(! ECB_MGRT2_KD_T.equals("")) {
%>
		 		ECB_MGRT2_KD='<%= ECB_MGRT2_KD_T%>'
<%
			}

			if(! ECB_MGRT2SR_KD_T.equals("")) {
%>
		 		ECB_MGRT2SR_KD='<%= ECB_MGRT2SR_KD_T%>'
<%
			}

			if(! ECB_MGRT2R_EX_T.equals("")) {
%>
		 		ECB_MGRT2R_EX='<%= ECB_MGRT2R_EX_T%>'
<%
			}

			if(! ECB_MGRT2SL_KD_T.equals("")) {
%>
		 		ECB_MGRT2SL_KD='<%= ECB_MGRT2SL_KD_T%>'
<%
			}

			if(! ECB_MGRT2L_EX_T.equals("")) {
%>
		 		ECB_MGRT2L_EX='<%= ECB_MGRT2L_EX_T%>'
<%
			}

			if(! ECB_MGRT3_KD_T.equals("")) {
%>
		 		ECB_MGRT3_KD='<%= ECB_MGRT3_KD_T%>'
<%
			}

			if(! ECB_MGRT3SR_KD_T.equals("")) {
%>
		 		ECB_MGRT3SR_KD='<%= ECB_MGRT3SR_KD_T%>'
<%
			}

			if(! ECB_MGRT3R_EX_T.equals("")) {
%>
		 		ECB_MGRT3R_EX='<%= ECB_MGRT3R_EX_T%>'
<%
			}

			if(! ECB_MGRT3SL_KD_T.equals("")) {
%>
		 		ECB_MGRT3SL_KD='<%= ECB_MGRT3SL_KD_T%>'
<%
			}

			if(! ECB_MGRT3L_EX_T.equals("")) {
%>
		 		ECB_MGRT3L_EX='<%= ECB_MGRT3L_EX_T%>'
<%
			}

			if(! ECB_MGRT_EX_T.equals("")) {
%>
		 		ECB_MGRT_EX='<%= ECB_MGRT_EX_T%>'
<%
			}

			if(! ECB_RSLT_KD_T.equals("")) {
%>
		 		ECB_RSLT_KD='<%= ECB_RSLT_KD_T%>'
<%
			}

			if(! ECB_BRCN_YN_T.equals("")) {
%>
		 		ECB_BRCN_YN='<%= ECB_BRCN_YN_T%>'
<%
			}

			if(! ECB_RSLT_EX_T.equals("")) {
%>
		 		ECB_RSLT_EX='<%= ECB_RSLT_EX_T%>'
<%
			}

			if(! ECB_RPT_DT_T.equals("")) {
%>
		 		ECB_RPT_DT='<%= ECB_RPT_DT_T%>'
<%
			}

			if(! ECB_CFRM_DT_T.equals("")) {
%>
		 		ECB_CFRM_DT='<%= ECB_CFRM_DT_T%>'
<%
			}

			if(! ECB_LICEN_CD_T.equals("")) {
%>
		 		ECB_LICEN_CD='<%= ECB_LICEN_CD_T%>'
<%
			}

			if(! ECB_INPUT_DTT_T.equals("")) {
%>
		 		ECB_INPUT_DTT='<%= ECB_INPUT_DTT_T%>'
<%
			}

			if(! ECB_INPUT_ID_T.equals("")) {
%>
		 		ECB_INPUT_ID='<%= ECB_INPUT_ID_T%>'
<%
			}

			if(! ECB_MODI_DTT_T.equals("")) {
%>
		 		ECB_MODI_DTT='<%= ECB_MODI_DTT_T%>'
<%
			}

			if(! ECB_MODI_ID_T.equals("")) {
%>
		 		ECB_MODI_ID='<%= ECB_MODI_ID_T%>'
<%
			}

			if(! ECB_MGPT_KD_T.equals("")) {
%>
		 		ECB_MGPT_KD='<%= ECB_MGPT_KD_T%>'
<%
			}

			if(! ECB_DECI_LICEN_CD_T.equals("")) {
%>
		 		ECB_DECI_LICEN_CD='<%= ECB_DECI_LICEN_CD_T%>'
<%
			}

			if(! ECV_EXAM_DT_T.equals("")) {
%>
		 		ECV_EXAM_DT='<%= ECV_EXAM_DT_T%>'
<%
			}

			if(! ECV_EXAM_SQ_T.equals("")) {
%>
		 		ECV_EXAM_SQ='<%= ECV_EXAM_SQ_T%>'
<%
			}

			if(! ECV_CFRM_CD_T.equals("")) {
%>
		 		ECV_CFRM_CD='<%= ECV_CFRM_CD_T%>'
<%
			}

			if(! ECV_CVEX_DT_T.equals("")) {
%>
		 		ECV_CVEX_DT='<%= ECV_CVEX_DT_T%>'
<%
			}

			if(! ECV_DBCV_KD_T.equals("")) {
%>
		 		ECV_DBCV_KD='<%= ECV_DBCV_KD_T%>'
<%
			}

			if(! ECV_CVSP1_KD_T.equals("")) {
%>
		 		ECV_CVSP1_KD='<%= ECV_CVSP1_KD_T%>'
<%
			}

			if(! ECV_CELL1_KD_T.equals("")) {
%>
		 		ECV_CELL1_KD='<%= ECV_CELL1_KD_T%>'
<%
			}

			if(! ECV_CVRT1_KD_T.equals("")) {
%>
		 		ECV_CVRT1_KD='<%= ECV_CVRT1_KD_T%>'
<%
			}

			if(! ECV_SQRT1_KD_T.equals("")) {
%>
		 		ECV_SQRT1_KD='<%= ECV_SQRT1_KD_T%>'
<%
			}

			if(! ECV_NHRT1_KD_T.equals("")) {
%>
		 		ECV_NHRT1_KD='<%= ECV_NHRT1_KD_T%>'
<%
			}

			if(! ECV_EPRT1_KD_T.equals("")) {
%>
		 		ECV_EPRT1_KD='<%= ECV_EPRT1_KD_T%>'
<%
			}

			if(! ECV_EPET1_EX_T.equals("")) {
%>
		 		ECV_EPET1_EX='<%= ECV_EPET1_EX_T%>'
<%
			}

			if(! ECV_RTET1_EX_T.equals("")) {
%>
		 		ECV_RTET1_EX='<%= ECV_RTET1_EX_T%>'
<%
			}

			if(! ECV_ETCRT1_KD_T.equals("")) {
%>
		 		ECV_ETCRT1_KD='<%= ECV_ETCRT1_KD_T%>'
<%
			}

			if(! ECV_ETCEX1_EX_T.equals("")) {
%>
		 		ECV_ETCEX1_EX='<%= ECV_ETCEX1_EX_T%>'
<%
			}

			if(! ECV_CVSP2_KD_T.equals("")) {
%>
		 		ECV_CVSP2_KD='<%= ECV_CVSP2_KD_T%>'
<%
			}

			if(! ECV_CELL2_KD_T.equals("")) {
%>
		 		ECV_CELL2_KD='<%= ECV_CELL2_KD_T%>'
<%
			}

			if(! ECV_CVRT2_KD_T.equals("")) {
%>
		 		ECV_CVRT2_KD='<%= ECV_CVRT2_KD_T%>'
<%
			}

			if(! ECV_SQRT2_KD_T.equals("")) {
%>
		 		ECV_SQRT2_KD='<%= ECV_SQRT2_KD_T%>'
<%
			}

			if(! ECV_NHRT2_KD_T.equals("")) {
%>
		 		ECV_NHRT2_KD='<%= ECV_NHRT2_KD_T%>'
<%
			}

			if(! ECV_EPRT2_KD_T.equals("")) {
%>
		 		ECV_EPRT2_KD='<%= ECV_EPRT2_KD_T%>'
<%
			}

			if(! ECV_EPET2_EX_T.equals("")) {
%>
		 		ECV_EPET2_EX='<%= ECV_EPET2_EX_T%>'
<%
			}

			if(! ECV_RTET2_EX_T.equals("")) {
%>
		 		ECV_RTET2_EX='<%= ECV_RTET2_EX_T%>'
<%
			}

			if(! ECV_ETCRT2_KD_T.equals("")) {
%>
		 		ECV_ETCRT2_KD='<%= ECV_ETCRT2_KD_T%>'
<%
			}

			if(! ECV_ETCEX2_EX_T.equals("")) {
%>
		 		ECV_ETCEX2_EX='<%= ECV_ETCEX2_EX_T%>'
<%
			}

			if(! ECV_RSLT_KD_T.equals("")) {
%>
		 		ECV_RSLT_KD='<%= ECV_RSLT_KD_T%>'
<%
			}

			if(! ECV_ETC_EX_T.equals("")) {
%>
		 		ECV_ETC_EX='<%= ECV_ETC_EX_T%>'
<%
			}

			if(! ECV_CVCN_YN_T.equals("")) {
%>
		 		ECV_CVCN_YN='<%= ECV_CVCN_YN_T%>'
<%
			}

			if(! ECV_RSLT_EX_T.equals("")) {
%>
		 		ECV_RSLT_EX='<%= ECV_RSLT_EX_T%>'
<%
			}

			if(! ECV_RPT_DT_T.equals("")) {
%>
		 		ECV_RPT_DT='<%= ECV_RPT_DT_T%>'
<%
			}

			if(! ECV_CFRM_DT_T.equals("")) {
%>
		 		ECV_CFRM_DT='<%= ECV_CFRM_DT_T%>'
<%
			}

			if(! ECV_LICEN_CD_T.equals("")) {
%>
		 		ECV_LICEN_CD='<%= ECV_LICEN_CD_T%>'
<%
			}

			if(! ECV_INPUT_DTT_T.equals("")) {
%>
		 		ECV_INPUT_DTT='<%= ECV_INPUT_DTT_T%>'
<%
			}

			if(! ECV_INPUT_ID_T.equals("")) {
%>
		 		ECV_INPUT_ID='<%= ECV_INPUT_ID_T%>'
<%
			}

			if(! ECV_MODI_DTT_T.equals("")) {
%>
		 		ECV_MODI_DTT='<%= ECV_MODI_DTT_T%>'
<%
			}

			if(! ECV_MODI_ID_T.equals("")) {
%>
		 		ECV_MODI_ID='<%= ECV_MODI_ID_T%>'
<%
			}

			if(! ECV_NHEP1_KD_T.equals("")) {
%>
		 		ECV_NHEP1_KD='<%= ECV_NHEP1_KD_T%>'
<%
			}

			if(! ECV_NHEP2_KD_T.equals("")) {
%>
		 		ECV_NHEP2_KD='<%= ECV_NHEP2_KD_T%>'
<%
			}

			if(! ECV_COLL_LICEN_CD_T.equals("")) {
%>
		 		ECV_COLL_LICEN_CD='<%= ECV_COLL_LICEN_CD_T%>'
<%
			}

			if(! ECV_PATH_LICEN_CD_T.equals("")) {
%>
		 		ECV_PATH_LICEN_CD='<%= ECV_PATH_LICEN_CD_T%>'
<%
			}

			if(! ECG_EXAM_DT_T.equals("")) {
%>
		 		ECG_EXAM_DT='<%= ECG_EXAM_DT_T%>'
<%
			}

			if(! ECG_EXAM_SQ_T.equals("")) {
%>
		 		ECG_EXAM_SQ='<%= ECG_EXAM_SQ_T%>'
<%
			}

			if(! ECG_CFRM_CD_T.equals("")) {
%>
		 		ECG_CFRM_CD='<%= ECG_CFRM_CD_T%>'
<%
			}

			if(! ECG_LUEX_DT_T.equals("")) {
%>
		 		ECG_LUEX_DT='<%= ECG_LUEX_DT_T%>'
<%
			}

			if(! ECG_LUEX_KD_T.equals("")) {
%>
		 		ECG_LUEX_KD='<%= ECG_LUEX_KD_T%>'
<%
			}

			if(! ECG_CTDI_VL_T.equals("")) {
%>
		 		ECG_CTDI_VL='<%= ECG_CTDI_VL_T%>'
<%
			}

			if(! ECG_BEFO_YN_T.equals("")) {
%>
		 		ECG_BEFO_YN='<%= ECG_BEFO_YN_T%>'
<%
			}

			if(! ECG_BEFO_YY_T.equals("")) {
%>
		 		ECG_BEFO_YY='<%= ECG_BEFO_YY_T%>'
<%
			}

			if(! ECG_BEFO_MM_T.equals("")) {
%>
		 		ECG_BEFO_MM='<%= ECG_BEFO_MM_T%>'
<%
			}

			if(! ECG_PNRT_YN_T.equals("")) {
%>
		 		ECG_PNRT_YN='<%= ECG_PNRT_YN_T%>'
<%
			}

			if(! ECG_PNRT1_YN_T.equals("")) {
%>
		 		ECG_PNRT1_YN='<%= ECG_PNRT1_YN_T%>'
<%
			}

			if(! ECG_PNRT1IC_KD_T.equals("")) {
%>
		 		ECG_PNRT1IC_KD='<%= ECG_PNRT1IC_KD_T%>'
<%
			}

			if(! ECG_PNRT1SL_KD_T.equals("")) {
%>
		 		ECG_PNRT1SL_KD='<%= ECG_PNRT1SL_KD_T%>'
<%
			}

			if(! ECG_PNRT1SZ1_VL_T.equals("")) {
%>
		 		ECG_PNRT1SZ1_VL='<%= ECG_PNRT1SZ1_VL_T%>'
<%
			}

			if(! ECG_PNRT1SZ2_VL_T.equals("")) {
%>
		 		ECG_PNRT1SZ2_VL='<%= ECG_PNRT1SZ2_VL_T%>'
<%
			}

			if(! ECG_PNRT1FT_KD_T.equals("")) {
%>
		 		ECG_PNRT1FT_KD='<%= ECG_PNRT1FT_KD_T%>'
<%
			}

			if(! ECG_PNRT1TR1_KD_T.equals("")) {
%>
		 		ECG_PNRT1TR1_KD='<%= ECG_PNRT1TR1_KD_T%>'
<%
			}

			if(! ECG_PNRT1TR2_KD_T.equals("")) {
%>
		 		ECG_PNRT1TR2_KD='<%= ECG_PNRT1TR2_KD_T%>'
<%
			}

			if(! ECG_PNRT2_YN_T.equals("")) {
%>
		 		ECG_PNRT2_YN='<%= ECG_PNRT2_YN_T%>'
<%
			}

			if(! ECG_PNRT2IC_KD_T.equals("")) {
%>
		 		ECG_PNRT2IC_KD='<%= ECG_PNRT2IC_KD_T%>'
<%
			}

			if(! ECG_PNRT2SL_KD_T.equals("")) {
%>
		 		ECG_PNRT2SL_KD='<%= ECG_PNRT2SL_KD_T%>'
<%
			}

			if(! ECG_PNRT2SZ1_VL_T.equals("")) {
%>
		 		ECG_PNRT2SZ1_VL='<%= ECG_PNRT2SZ1_VL_T%>'
<%
			}

			if(! ECG_PNRT2SZ2_VL_T.equals("")) {
%>
		 		ECG_PNRT2SZ2_VL='<%= ECG_PNRT2SZ2_VL_T%>'
<%
			}

			if(! ECG_PNRT2FT_KD_T.equals("")) {
%>
		 		ECG_PNRT2FT_KD='<%= ECG_PNRT2FT_KD_T%>'
<%
			}

			if(! ECG_PNRT2TR1_KD_T.equals("")) {
%>
		 		ECG_PNRT2TR1_KD='<%= ECG_PNRT2TR1_KD_T%>'
<%
			}

			if(! ECG_PNRT2TR2_KD_T.equals("")) {
%>
		 		ECG_PNRT2TR2_KD='<%= ECG_PNRT2TR2_KD_T%>'
<%
			}

			if(! ECG_PNRT3_YN_T.equals("")) {
%>
		 		ECG_PNRT3_YN='<%= ECG_PNRT3_YN_T%>'
<%
			}

			if(! ECG_PNRT3IC_KD_T.equals("")) {
%>
		 		ECG_PNRT3IC_KD='<%= ECG_PNRT3IC_KD_T%>'
<%
			}

			if(! ECG_PNRT3SL_KD_T.equals("")) {
%>
		 		ECG_PNRT3SL_KD='<%= ECG_PNRT3SL_KD_T%>'
<%
			}

			if(! ECG_PNRT3SZ1_VL_T.equals("")) {
%>
		 		ECG_PNRT3SZ1_VL='<%= ECG_PNRT3SZ1_VL_T%>'
<%
			}

			if(! ECG_PNRT3SZ2_VL_T.equals("")) {
%>
		 		ECG_PNRT3SZ2_VL='<%= ECG_PNRT3SZ2_VL_T%>'
<%
			}

			if(! ECG_PNRT3FT_KD_T.equals("")) {
%>
		 		ECG_PNRT3FT_KD='<%= ECG_PNRT3FT_KD_T%>'
<%
			}

			if(! ECG_PNRT3TR1_KD_T.equals("")) {
%>
		 		ECG_PNRT3TR1_KD='<%= ECG_PNRT3TR1_KD_T%>'
<%
			}

			if(! ECG_PNRT3TR2_KD_T.equals("")) {
%>
		 		ECG_PNRT3TR2_KD='<%= ECG_PNRT3TR2_KD_T%>'
<%
			}

			if(! ECG_PNRT4_YN_T.equals("")) {
%>
		 		ECG_PNRT4_YN='<%= ECG_PNRT4_YN_T%>'
<%
			}

			if(! ECG_PNRT4IC_KD_T.equals("")) {
%>
		 		ECG_PNRT4IC_KD='<%= ECG_PNRT4IC_KD_T%>'
<%
			}

			if(! ECG_PNRT4SL_KD_T.equals("")) {
%>
		 		ECG_PNRT4SL_KD='<%= ECG_PNRT4SL_KD_T%>'
<%
			}

			if(! ECG_PNRT4SZ1_VL_T.equals("")) {
%>
		 		ECG_PNRT4SZ1_VL='<%= ECG_PNRT4SZ1_VL_T%>'
<%
			}

			if(! ECG_PNRT4SZ2_VL_T.equals("")) {
%>
		 		ECG_PNRT4SZ2_VL='<%= ECG_PNRT4SZ2_VL_T%>'
<%
			}

			if(! ECG_PNRT4FT_KD_T.equals("")) {
%>
		 		ECG_PNRT4FT_KD='<%= ECG_PNRT4FT_KD_T%>'
<%
			}

			if(! ECG_PNRT4TR1_KD_T.equals("")) {
%>
		 		ECG_PNRT4TR1_KD='<%= ECG_PNRT4TR1_KD_T%>'
<%
			}

			if(! ECG_PNRT4TR2_KD_T.equals("")) {
%>
		 		ECG_PNRT4TR2_KD='<%= ECG_PNRT4TR2_KD_T%>'
<%
			}

			if(! ECG_PNRT5_YN_T.equals("")) {
%>
		 		ECG_PNRT5_YN='<%= ECG_PNRT5_YN_T%>'
<%
			}

			if(! ECG_PNRT5IC_KD_T.equals("")) {
%>
		 		ECG_PNRT5IC_KD='<%= ECG_PNRT5IC_KD_T%>'
<%
			}

			if(! ECG_PNRT5SL_KD_T.equals("")) {
%>
		 		ECG_PNRT5SL_KD='<%= ECG_PNRT5SL_KD_T%>'
<%
			}

			if(! ECG_PNRT5SZ1_VL_T.equals("")) {
%>
		 		ECG_PNRT5SZ1_VL='<%= ECG_PNRT5SZ1_VL_T%>'
<%
			}

			if(! ECG_PNRT5SZ2_VL_T.equals("")) {
%>
		 		ECG_PNRT5SZ2_VL='<%= ECG_PNRT5SZ2_VL_T%>'
<%
			}

			if(! ECG_PNRT5FT_KD_T.equals("")) {
%>
		 		ECG_PNRT5FT_KD='<%= ECG_PNRT5FT_KD_T%>'
<%
			}

			if(! ECG_PNRT5TR1_KD_T.equals("")) {
%>
		 		ECG_PNRT5TR1_KD='<%= ECG_PNRT5TR1_KD_T%>'
<%
			}

			if(! ECG_PNRT5TR2_KD_T.equals("")) {
%>
		 		ECG_PNRT5TR2_KD='<%= ECG_PNRT5TR2_KD_T%>'
<%
			}

			if(! ECG_PNRT6_YN_T.equals("")) {
%>
		 		ECG_PNRT6_YN='<%= ECG_PNRT6_YN_T%>'
<%
			}

			if(! ECG_PNRT6IC_KD_T.equals("")) {
%>
		 		ECG_PNRT6IC_KD='<%= ECG_PNRT6IC_KD_T%>'
<%
			}

			if(! ECG_PNRT6SL_KD_T.equals("")) {
%>
		 		ECG_PNRT6SL_KD='<%= ECG_PNRT6SL_KD_T%>'
<%
			}

			if(! ECG_PNRT6SZ1_VL_T.equals("")) {
%>
		 		ECG_PNRT6SZ1_VL='<%= ECG_PNRT6SZ1_VL_T%>'
<%
			}

			if(! ECG_PNRT6SZ2_VL_T.equals("")) {
%>
		 		ECG_PNRT6SZ2_VL='<%= ECG_PNRT6SZ2_VL_T%>'
<%
			}

			if(! ECG_PNRT6FT_KD_T.equals("")) {
%>
		 		ECG_PNRT6FT_KD='<%= ECG_PNRT6FT_KD_T%>'
<%
			}

			if(! ECG_PNRT6TR1_KD_T.equals("")) {
%>
		 		ECG_PNRT6TR1_KD='<%= ECG_PNRT6TR1_KD_T%>'
<%
			}

			if(! ECG_PNRT6TR2_KD_T.equals("")) {
%>
		 		ECG_PNRT6TR2_KD='<%= ECG_PNRT6TR2_KD_T%>'
<%
			}

			if(! ECG_BRLE_YN_T.equals("")) {
%>
		 		ECG_BRLE_YN='<%= ECG_BRLE_YN_T%>'
<%
			}

			if(! ECG_BRLE_EX_T.equals("")) {
%>
		 		ECG_BRLE_EX='<%= ECG_BRLE_EX_T%>'
<%
			}

			if(! ECG_LUCN_KD_T.equals("")) {
%>
		 		ECG_LUCN_KD='<%= ECG_LUCN_KD_T%>'
<%
			}

			if(! ECG_LUCN_EX_T.equals("")) {
%>
		 		ECG_LUCN_EX='<%= ECG_LUCN_EX_T%>'
<%
			}

			if(! ECG_SCRT_CD_T.equals("")) {
%>
		 		ECG_SCRT_CD='<%= ECG_SCRT_CD_T%>'
<%
			}

			if(! ECG_SCRT_EX_T.equals("")) {
%>
		 		ECG_SCRT_EX='<%= ECG_SCRT_EX_T%>'
<%
			}

			if(! ECG_INPT_YN_T.equals("")) {
%>
		 		ECG_INPT_YN='<%= ECG_INPT_YN_T%>'
<%
			}

			if(! ECG_RSLT_KD_T.equals("")) {
%>
		 		ECG_RSLT_KD='<%= ECG_RSLT_KD_T%>'
<%
			}

			if(! ECG_RSLT2_KD_T.equals("")) {
%>
		 		ECG_RSLT2_KD='<%= ECG_RSLT2_KD_T%>'
<%
			}

			if(! ECG_ETC_EX_T.equals("")) {
%>
		 		ECG_ETC_EX='<%= ECG_ETC_EX_T%>'
<%
			}

			if(! ECG_RSLT_EX_T.equals("")) {
%>
		 		ECG_RSLT_EX='<%= ECG_RSLT_EX_T%>'
<%
			}

			if(! ECG_RSLT_ETC_EX_T.equals("")) {
%>
		 		ECG_RSLT_ETC_EX='<%= ECG_RSLT_ETC_EX_T%>'
<%
			}

			if(! ECG_CFRM_DT_T.equals("")) {
%>
		 		ECG_CFRM_DT='<%= ECG_CFRM_DT_T%>'
<%
			}

			if(! ECG_LICEN_CD_T.equals("")) {
%>
		 		ECG_LICEN_CD='<%= ECG_LICEN_CD_T%>'
<%
			}

			if(! ECG_DECI_LICEN_CD_T.equals("")) {
%>
		 		ECG_DECI_LICEN_CD='<%= ECG_DECI_LICEN_CD_T%>'
<%
			}

			if(! ECG_LUCN_YN_T.equals("")) {
%>
		 		ECG_LUCN_YN='<%= ECG_LUCN_YN_T%>'
<%
			}

			if(! ECG_AFRL_EX_T.equals("")) {
%>
		 		ECG_AFRL_EX='<%= ECG_AFRL_EX_T%>'
<%
			}

			if(! ECG_AFSM_EX_T.equals("")) {
%>
		 		ECG_AFSM_EX='<%= ECG_AFSM_EX_T%>'
<%
			}

			if(! ECG_AFDT_DT_T.equals("")) {
%>
		 		ECG_AFDT_DT='<%= ECG_AFDT_DT_T%>'
<%
			}

			if(! ECG_AFPL_CD_T.equals("")) {
%>
		 		ECG_AFPL_CD='<%= ECG_AFPL_CD_T%>'
<%
			}

			if(! ECG_AFTE_LICEN_CD_T.equals("")) {
%>
		 		ECG_AFTE_LICEN_CD='<%= ECG_AFTE_LICEN_CD_T%>'
<%
			}

			if(! ECG_INPUT_DTT_T.equals("")) {
%>
		 		ECG_INPUT_DTT='<%= ECG_INPUT_DTT_T%>'
<%
			}

			if(! ECG_INPUT_ID_T.equals("")) {
%>
		 		ECG_INPUT_ID='<%= ECG_INPUT_ID_T%>'
<%
			}

			if(! ECG_MODI_DTT_T.equals("")) {
%>
		 		ECG_MODI_DTT='<%= ECG_MODI_DTT_T%>'
<%
			}

			if(! ECG_MODI_ID_T.equals("")) {
%>
		 		ECG_MODI_ID='<%= ECG_MODI_ID_T%>'
<%
			}

			if(! ECG_ETC_KD_T.equals("")) {
%>
		 		ECG_ETC_KD='<%= ECG_ETC_KD_T%>'
<%
			}

			if(! STMC_DT_T.equals("")) {
%>
		 		STMC_DT='<%= STMC_DT_T%>'
<%
			}

			if(! COLO_DT_T.equals("")) {
%>
		 		COLO_DT='<%= COLO_DT_T%>'
<%
			}

			if(! LIVER_DT_T.equals("")) {
%>
		 		LIVER_DT='<%= LIVER_DT_T%>'
<%
			}

			if(! BRST_DT_T.equals("")) {
%>
		 		BRST_DT='<%= BRST_DT_T%>'
<%
			}

			if(! CRVC_DT_T.equals("")) {
%>
		 		CRVC_DT='<%= CRVC_DT_T%>'
<%
			}

			if(! LUNG_DT_T.equals("")) {
%>
		 		LUNG_DT='<%= LUNG_DT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c505='<%= cnt%>'
				c506='<%= cnt%>'
				c507='<%= cnt%>'
				c508='<%= cnt%>'
				c509='<%= cnt%>'
				c510='<%= cnt%>'
				c511='<%= cnt%>'
				c512='<%= cnt%>'
				c513='<%= cnt%>'
				c514='<%= cnt%>'
				c515='<%= cnt%>'
				c516='<%= cnt%>'
				c517='<%= cnt%>'
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
