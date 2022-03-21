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

		String SFRDT = htMethod.get("SFRDT");
		String STODT = htMethod.get("STODT");
		String GUBN1 = htMethod.get("GUBN1");
		String SDOC = htMethod.get("SDOC");
		String GUBN2 = htMethod.get("GUBN2");

		//
		if(SFRDT == null) { SFRDT = ""; }
		if(STODT == null) { STODT = ""; }
		if(GUBN1 == null) { GUBN1 = ""; }
		if(SDOC == null) { SDOC = ""; }
		if(GUBN2 == null) { GUBN2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select DISTINCT                                                                                                 
 Acpt.EEA_EXAM_DT,  Acpt.EEA_EXAM_SQ,  Acpt.EEA_PSNL_NM,   Customer.ICR_PENL_ID,                                
 P1.PFP_FIX_YN,     P2.PSP_FIX_YN,     HEADER.ECH_CFRM_CD, DT.EDP_PANJ_YN,                                      
 C1.ECS_CFRM_DT,    C2.ECC_CFRM_DT,    C3.ECL_CFRM_DT,     C4.ECB_CFRM_DT,       C5.ECV_CFRM_DT,                
 P1.PFP_DOCTORFIR,  P2.PSP_DOCTORSED,  C1.ECS_LICEN_CD,    C2.ECC_LICEN_CD,      C3.ECL_LICEN_CD,               
 C4.ECB_LICEN_CD,   C5.ECV_LICEN_CD,   DT.EDP_DOCT_CD,     STP.ESP_EXAM_DR,                                     
 STP.ESP_ORAL_DR,   SP.SPG_DOCT_CD,    SP.SPG_EXAM_CHA,    SB.SBE_PANJ_YN,                                      
 SL.*                                                                                                           
From  ET_EXAM_ACPT Acpt                                                                                         
Inner Join IT_CUSTOMER Customer On Customer.ICR_CUST_NO = Acpt.EEA_CUST_NO                                      
Left Outer Join PT_FIR_PANJUNG  P1 On P1.PFP_EXAM_DT = Acpt.EEA_EXAM_DT And P1.PFP_EXAM_SQ = Acpt.EEA_EXAM_SQ   
Left Outer Join PT_SED_PANJUNG  P2 On P2.PSP_EXAM_DT = Acpt.EEA_EXAM_DT And P2.PSP_EXAM_SQ = Acpt.EEA_EXAM_SQ   
Left Outer Join ET_CANCER_HEADER HEADER On HEADER.ECH_EXAM_DT = Acpt.EEA_EXAM_DT                                
                                       And HEADER.ECH_EXAM_SQ = Acpt.EEA_EXAM_SQ                                
Left Outer Join ET_CANCER_STMC  C1 On C1.ECS_EXAM_DT = Acpt.EEA_EXAM_DT And C1.ECS_EXAM_SQ = Acpt.EEA_EXAM_SQ   
Left Outer Join ET_CANCER_COLO  C2 On C2.ECC_EXAM_DT = Acpt.EEA_EXAM_DT And C2.ECC_EXAM_SQ = Acpt.EEA_EXAM_SQ   
Left Outer Join ET_CANCER_LIVER C3 On C3.ECL_EXAM_DT = Acpt.EEA_EXAM_DT And C3.ECL_EXAM_SQ = Acpt.EEA_EXAM_SQ   
Left Outer Join ET_CANCER_BRST  C4 On C4.ECB_EXAM_DT = Acpt.EEA_EXAM_DT And C4.ECB_EXAM_SQ = Acpt.EEA_EXAM_SQ   
Left Outer Join ET_CANCER_CRVC  C5 On C5.ECV_EXAM_DT = Acpt.EEA_EXAM_DT And C5.ECV_EXAM_SQ = Acpt.EEA_EXAM_SQ   
Left Outer Join ET_CANCER_LUNG  C6 On C6.ECG_EXAM_DT = Acpt.EEA_EXAM_DT And C6.ECG_EXAM_SQ = Acpt.EEA_EXAM_SQ   
Left Outer Join ET_DENTAL_PANJ  DT On DT.EDP_EXAM_DT = Acpt.EEA_EXAM_DT And DT.EDP_EXAM_SQ = Acpt.EEA_EXAM_SQ   
Left Outer Join ET_STDT_PNJN    STP On STP.ESP_EXAM_DT = Acpt.EEA_EXAM_DT And STP.ESP_EXAM_SQ = Acpt.EEA_EXAM_SQ
                                   And (STP.ESP_EIFRM_DT <> '' Or STP.ESP_OIFRM_DT <> '')                   
Left Outer Join ST_PANJUNG      SP On SP.SPG_EXAM_DT = Acpt.EEA_EXAM_DT And SP.SPG_EXAM_SQ = Acpt.EEA_EXAM_SQ   
Left Outer Join ST_BASE         SB On SB.SBE_EXAM_DT = Acpt.EEA_EXAM_DT And SB.SBE_EXAM_SQ = Acpt.EEA_EXAM_SQ   
Left Outer Join SL_SIGNLIST     SL On SL.SL_EXAM_DATE = Acpt.EEA_EXAM_DT And SL.SL_EXAM_SQ = Acpt.EEA_EXAM_SQ   
 Where Acpt.EEA_EXAM_DT BetWeen :SFRDT And :STODT

                  
     Case :GUBN1 Of
       1 : And P1.PFP_DOCTORFIR = :SDOC   
       2 : And P2.PSP_DOCTORSED = :SDOC  
       3 : And C1.ECS_LICEN_CD = :SDOC    
       4 : And C2.ECC_LICEN_CD = :SDOC    
       5 : And C3.ECL_LICEN_CD = :SDOC    
       6 : And C4.ECB_LICEN_CD = :SDOC    
       7 : And C5.ECV_LICEN_CD = :SDOC   
       8 : And C6.ECG_LICEN_CD = :SDOC     
       9 : And DT.EDP_DOCT_CD = :SDOC    
       10: And STP.ESP_EXAM_DR = :SDOC    
       11: And STP.ESP_ORAL_DR = :SDOC    
       12: And (SP.SPG_DOCT_CD = :SDOC And SP.SPG_EXAM_CHA = '1')               
       13: And (SP.SPG_DOCT_CD = :SDOC And SP.SPG_EXAM_CHA = '2')      
     End;

     Case :GUBN2 Of
       0 : Order By Acpt.EEA_EXAM_DT, Acpt.EEA_EXAM_SQ 
       1 : Order By Acpt.EEA_PSNL_NM 
     End;

		*/

		sql = " SELECT DISTINCT ACPT.EEA_EXAM_DT, ACPT.EEA_EXAM_SQ, ACPT.EEA_PSNL_NM, CUSTOMER.ICR_PENL_ID, P1.PFP_FIX_YN, P2.PSP_FIX_YN, HEADER.ECH_CFRM_CD, DT.EDP_PANJ_YN, C1.ECS_CFRM_DT, C2.ECC_CFRM_DT, C3.ECL_CFRM_DT, C4.ECB_CFRM_DT, C5.ECV_CFRM_DT, P1.PFP_DOCTORFIR, P2.PSP_DOCTORSED, C1.ECS_LICEN_CD, C2.ECC_LICEN_CD, C3.ECL_LICEN_CD, C4.ECB_LICEN_CD, C5.ECV_LICEN_CD, DT.EDP_DOCT_CD, STP.ESP_EXAM_DR, STP.ESP_ORAL_DR, SP.SPG_DOCT_CD, SP.SPG_EXAM_CHA, SB.SBE_PANJ_YN, SL.*";
		sql += " FROM ET_EXAM_ACPT ACPT INNER JOIN IT_CUSTOMER CUSTOMER";
		sql += " ON CUSTOMER.ICR_CUST_NO = ACPT.EEA_CUST_NO LEFT OUTER JOIN PT_FIR_PANJUNG P1";
		sql += " ON P1.PFP_EXAM_DT = ACPT.EEA_EXAM_DT";
		sql += " AND P1.PFP_EXAM_SQ = ACPT.EEA_EXAM_SQ LEFT OUTER JOIN PT_SED_PANJUNG P2";
		sql += " ON P2.PSP_EXAM_DT = ACPT.EEA_EXAM_DT";
		sql += " AND P2.PSP_EXAM_SQ = ACPT.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_HEADER HEADER";
		sql += " ON HEADER.ECH_EXAM_DT = ACPT.EEA_EXAM_DT";
		sql += " AND HEADER.ECH_EXAM_SQ = ACPT.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_STMC C1";
		sql += " ON C1.ECS_EXAM_DT = ACPT.EEA_EXAM_DT";
		sql += " AND C1.ECS_EXAM_SQ = ACPT.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_COLO C2";
		sql += " ON C2.ECC_EXAM_DT = ACPT.EEA_EXAM_DT";
		sql += " AND C2.ECC_EXAM_SQ = ACPT.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LIVER C3";
		sql += " ON C3.ECL_EXAM_DT = ACPT.EEA_EXAM_DT";
		sql += " AND C3.ECL_EXAM_SQ = ACPT.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_BRST C4";
		sql += " ON C4.ECB_EXAM_DT = ACPT.EEA_EXAM_DT";
		sql += " AND C4.ECB_EXAM_SQ = ACPT.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_CRVC C5";
		sql += " ON C5.ECV_EXAM_DT = ACPT.EEA_EXAM_DT";
		sql += " AND C5.ECV_EXAM_SQ = ACPT.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LUNG C6";
		sql += " ON C6.ECG_EXAM_DT = ACPT.EEA_EXAM_DT";
		sql += " AND C6.ECG_EXAM_SQ = ACPT.EEA_EXAM_SQ LEFT OUTER JOIN ET_DENTAL_PANJ DT";
		sql += " ON DT.EDP_EXAM_DT = ACPT.EEA_EXAM_DT";
		sql += " AND DT.EDP_EXAM_SQ = ACPT.EEA_EXAM_SQ LEFT OUTER JOIN ET_STDT_PNJN STP";
		sql += " ON STP.ESP_EXAM_DT = ACPT.EEA_EXAM_DT";
		sql += " AND STP.ESP_EXAM_SQ = ACPT.EEA_EXAM_SQ";
		sql += " AND (STP.ESP_EIFRM_DT <> ''";
		sql += " OR STP.ESP_OIFRM_DT <> '') LEFT OUTER JOIN ST_PANJUNG SP";
		sql += " ON SP.SPG_EXAM_DT = ACPT.EEA_EXAM_DT";
		sql += " AND SP.SPG_EXAM_SQ = ACPT.EEA_EXAM_SQ LEFT OUTER JOIN ST_BASE SB";
		sql += " ON SB.SBE_EXAM_DT = ACPT.EEA_EXAM_DT";
		sql += " AND SB.SBE_EXAM_SQ = ACPT.EEA_EXAM_SQ LEFT OUTER JOIN SL_SIGNLIST SL";
		sql += " ON SL.SL_EXAM_DATE = ACPT.EEA_EXAM_DT";
		sql += " AND SL.SL_EXAM_SQ = ACPT.EEA_EXAM_SQ";
		sql += " WHERE ACPT.EEA_EXAM_DT BETWEEN '" + SFRDT + "' AND '" + STODT + "'";

		if(GUBN1.equals("1")) {
			sql += " AND P1.PFP_DOCTORFIR = '" + SDOC + "'";
		} else if(GUBN1.equals("2")) {
			sql += " AND P2.PSP_DOCTORSED = '" + SDOC + "'";
		} else if(GUBN1.equals("3")) {
			sql += " AND C1.ECS_LICEN_CD = '" + SDOC + "'";
		} else if(GUBN1.equals("4")) {
			sql += " AND C2.ECC_LICEN_CD = '" + SDOC + "'";
		} else if(GUBN1.equals("5")) {
			sql += " AND C3.ECL_LICEN_CD = '" + SDOC + "'";
		} else if(GUBN1.equals("6")) {
			sql += " AND C4.ECB_LICEN_CD = '" + SDOC + "'";
		} else if(GUBN1.equals("7")) {
			sql += " AND C5.ECV_LICEN_CD = '" + SDOC + "'";
		} else if(GUBN1.equals("8")) {
			sql += " AND C6.ECG_LICEN_CD = '" + SDOC + "'";
		} else if(GUBN1.equals("9")) {
			sql += " AND DT.EDP_DOCT_CD = '" + SDOC + "'";
		} else if(GUBN1.equals("10")) {
			sql += " AND STP.ESP_EXAM_DR = '" + SDOC + "'";
		} else if(GUBN1.equals("11")) {
			sql += " AND STP.ESP_ORAL_DR = '" + SDOC + "'";
		} else if(GUBN1.equals("12")) {
			sql += " AND (SP.SPG_DOCT_CD = '" + SDOC + "' OR SP.SPG_EXAM_CHA = '1')";
		} else if(GUBN1.equals("13")) {
			sql += " AND (SP.SPG_DOCT_CD = '" + SDOC + "' OR SP.SPG_EXAM_CHA = '2')";
		}
		
		if(GUBN2.equals("0")) {
			sql += " ORDER BY ACPT.EEA_EXAM_DT, ACPT.EEA_EXAM_SQ";
		} else if(GUBN2.equals("1")) {
			sql += " ORDER BY ACPT.EEA_PSNL_NM";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : SmartCMS_Sign1_001 \n";
			G_INFO += "설명 : 전자인증 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SFRDT : " + SFRDT + " \n";
			G_INFO += " STODT : " + STODT + " \n";
			G_INFO += " GUBN1 : " + GUBN1 + " \n";
			G_INFO += " SDOC : " + SDOC + " \n";
			G_INFO += " GUBN2 : " + GUBN2 + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='3' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='4' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_FIX_YN' rs:number='5' rs:nullable='true' rs:basetable='PT_FIR_PANJUNG' rs:basecolumn='PFP_FIX_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_FIX_YN' rs:number='6' rs:nullable='true' rs:basetable='PT_SED_PANJUNG' rs:basecolumn='PSP_FIX_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECH_CFRM_CD' rs:number='7' rs:nullable='true' rs:basetable='ET_CANCER_HEADER' rs:basecolumn='ECH_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_PANJ_YN' rs:number='8' rs:nullable='true' rs:basetable='ET_DENTAL_PANJ' rs:basecolumn='EDP_PANJ_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_CFRM_DT' rs:number='9' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CFRM_DT' rs:number='10' rs:nullable='true' rs:basetable='ET_CANCER_COLO' rs:basecolumn='ECC_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_CFRM_DT' rs:number='11' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_CFRM_DT' rs:number='12' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CFRM_DT' rs:number='13' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_DOCTORFIR' rs:number='14' rs:nullable='true' rs:basetable='PT_FIR_PANJUNG' rs:basecolumn='PFP_DOCTORFIR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_DOCTORSED' rs:number='15' rs:nullable='true' rs:basetable='PT_SED_PANJUNG' rs:basecolumn='PSP_DOCTORSED'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_LICEN_CD' rs:number='16' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_LICEN_CD' rs:number='17' rs:nullable='true' rs:basetable='ET_CANCER_COLO' rs:basecolumn='ECC_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_LICEN_CD' rs:number='18' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_LICEN_CD' rs:number='19' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_LICEN_CD' rs:number='20' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EDP_DOCT_CD' rs:number='21' rs:nullable='true' rs:basetable='ET_DENTAL_PANJ' rs:basecolumn='EDP_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EXAM_DR' rs:number='22' rs:nullable='true' rs:basetable='ET_STDT_PNJN' rs:basecolumn='ESP_EXAM_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_ORAL_DR' rs:number='23' rs:nullable='true' rs:basetable='ET_STDT_PNJN' rs:basecolumn='ESP_ORAL_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_DOCT_CD' rs:number='24' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_EXAM_CHA' rs:number='25' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_EXAM_CHA'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_PANJ_YN' rs:number='26' rs:nullable='true' rs:basetable='ST_BASE' rs:basecolumn='SBE_PANJ_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SL_EXAM_DATE' rs:number='27' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_EXAM_DATE'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SL_EXAM_SQ' rs:number='28' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_EXAM_SQ'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='SL_P1_CD' rs:number='29' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_P1_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_P2_CD' rs:number='30' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_P2_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_C1_CD' rs:number='31' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_C1_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_C2_CD' rs:number='32' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_C2_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_C3_CD' rs:number='33' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_C3_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_C4_CD' rs:number='34' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_C4_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_C5_CD' rs:number='35' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_C5_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_DT_CD' rs:number='36' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_DT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_STP_CD' rs:number='37' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_STP_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_STD_CD' rs:number='38' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_STD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_SP1_CD' rs:number='39' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_SP1_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_SP2_CD' rs:number='40' rs:nullable='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_SP2_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
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
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String PFP_FIX_YN_T = cRsList.getString("PFP_FIX_YN");
			String PSP_FIX_YN_T = cRsList.getString("PSP_FIX_YN");
			String ECH_CFRM_CD_T = cRsList.getString("ECH_CFRM_CD");
			String EDP_PANJ_YN_T = cRsList.getString("EDP_PANJ_YN");
			String ECS_CFRM_DT_T = cRsList.getString("ECS_CFRM_DT");
			String ECC_CFRM_DT_T = cRsList.getString("ECC_CFRM_DT");
			String ECL_CFRM_DT_T = cRsList.getString("ECL_CFRM_DT");
			String ECB_CFRM_DT_T = cRsList.getString("ECB_CFRM_DT");
			String ECV_CFRM_DT_T = cRsList.getString("ECV_CFRM_DT");
			String PFP_DOCTORFIR_T = cRsList.getString("PFP_DOCTORFIR");
			String PSP_DOCTORSED_T = cRsList.getString("PSP_DOCTORSED");
			String ECS_LICEN_CD_T = cRsList.getString("ECS_LICEN_CD");
			String ECC_LICEN_CD_T = cRsList.getString("ECC_LICEN_CD");
			String ECL_LICEN_CD_T = cRsList.getString("ECL_LICEN_CD");
			String ECB_LICEN_CD_T = cRsList.getString("ECB_LICEN_CD");
			String ECV_LICEN_CD_T = cRsList.getString("ECV_LICEN_CD");
			String EDP_DOCT_CD_T = cRsList.getString("EDP_DOCT_CD");
			String ESP_EXAM_DR_T = cRsList.getString("ESP_EXAM_DR");
			String ESP_ORAL_DR_T = cRsList.getString("ESP_ORAL_DR");
			String SPG_DOCT_CD_T = cRsList.getString("SPG_DOCT_CD");
			String SPG_EXAM_CHA_T = cRsList.getString("SPG_EXAM_CHA");
			String SBE_PANJ_YN_T = cRsList.getString("SBE_PANJ_YN");
			String SL_EXAM_DATE_T = cRsList.getString("SL_EXAM_DATE");
			String SL_EXAM_SQ_T = cRsList.getString("SL_EXAM_SQ");
			String SL_P1_CD_T = cRsList.getString("SL_P1_CD");
			String SL_P2_CD_T = cRsList.getString("SL_P2_CD");
			String SL_C1_CD_T = cRsList.getString("SL_C1_CD");
			String SL_C2_CD_T = cRsList.getString("SL_C2_CD");
			String SL_C3_CD_T = cRsList.getString("SL_C3_CD");
			String SL_C4_CD_T = cRsList.getString("SL_C4_CD");
			String SL_C5_CD_T = cRsList.getString("SL_C5_CD");
			String SL_DT_CD_T = cRsList.getString("SL_DT_CD");
			String SL_STP_CD_T = cRsList.getString("SL_STP_CD");
			String SL_STD_CD_T = cRsList.getString("SL_STD_CD");
			String SL_SP1_CD_T = cRsList.getString("SL_SP1_CD");
			String SL_SP2_CD_T = cRsList.getString("SL_SP2_CD");
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

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! PFP_FIX_YN_T.equals("")) {
%>
		 		PFP_FIX_YN='<%= PFP_FIX_YN_T%>'
<%
			}

			if(! PSP_FIX_YN_T.equals("")) {
%>
		 		PSP_FIX_YN='<%= PSP_FIX_YN_T%>'
<%
			}

			if(! ECH_CFRM_CD_T.equals("")) {
%>
		 		ECH_CFRM_CD='<%= ECH_CFRM_CD_T%>'
<%
			}

			if(! EDP_PANJ_YN_T.equals("")) {
%>
		 		EDP_PANJ_YN='<%= EDP_PANJ_YN_T%>'
<%
			}

			if(! ECS_CFRM_DT_T.equals("")) {
%>
		 		ECS_CFRM_DT='<%= ECS_CFRM_DT_T%>'
<%
			}

			if(! ECC_CFRM_DT_T.equals("")) {
%>
		 		ECC_CFRM_DT='<%= ECC_CFRM_DT_T%>'
<%
			}

			if(! ECL_CFRM_DT_T.equals("")) {
%>
		 		ECL_CFRM_DT='<%= ECL_CFRM_DT_T%>'
<%
			}

			if(! ECB_CFRM_DT_T.equals("")) {
%>
		 		ECB_CFRM_DT='<%= ECB_CFRM_DT_T%>'
<%
			}

			if(! ECV_CFRM_DT_T.equals("")) {
%>
		 		ECV_CFRM_DT='<%= ECV_CFRM_DT_T%>'
<%
			}

			if(! PFP_DOCTORFIR_T.equals("")) {
%>
		 		PFP_DOCTORFIR='<%= PFP_DOCTORFIR_T%>'
<%
			}

			if(! PSP_DOCTORSED_T.equals("")) {
%>
		 		PSP_DOCTORSED='<%= PSP_DOCTORSED_T%>'
<%
			}

			if(! ECS_LICEN_CD_T.equals("")) {
%>
		 		ECS_LICEN_CD='<%= ECS_LICEN_CD_T%>'
<%
			}

			if(! ECC_LICEN_CD_T.equals("")) {
%>
		 		ECC_LICEN_CD='<%= ECC_LICEN_CD_T%>'
<%
			}

			if(! ECL_LICEN_CD_T.equals("")) {
%>
		 		ECL_LICEN_CD='<%= ECL_LICEN_CD_T%>'
<%
			}

			if(! ECB_LICEN_CD_T.equals("")) {
%>
		 		ECB_LICEN_CD='<%= ECB_LICEN_CD_T%>'
<%
			}

			if(! ECV_LICEN_CD_T.equals("")) {
%>
		 		ECV_LICEN_CD='<%= ECV_LICEN_CD_T%>'
<%
			}

			if(! EDP_DOCT_CD_T.equals("")) {
%>
		 		EDP_DOCT_CD='<%= EDP_DOCT_CD_T%>'
<%
			}

			if(! ESP_EXAM_DR_T.equals("")) {
%>
		 		ESP_EXAM_DR='<%= ESP_EXAM_DR_T%>'
<%
			}

			if(! ESP_ORAL_DR_T.equals("")) {
%>
		 		ESP_ORAL_DR='<%= ESP_ORAL_DR_T%>'
<%
			}

			if(! SPG_DOCT_CD_T.equals("")) {
%>
		 		SPG_DOCT_CD='<%= SPG_DOCT_CD_T%>'
<%
			}

			if(! SPG_EXAM_CHA_T.equals("")) {
%>
		 		SPG_EXAM_CHA='<%= SPG_EXAM_CHA_T%>'
<%
			}

			if(! SBE_PANJ_YN_T.equals("")) {
%>
		 		SBE_PANJ_YN='<%= SBE_PANJ_YN_T%>'
<%
			}

			if(! SL_EXAM_DATE_T.equals("")) {
%>
		 		SL_EXAM_DATE='<%= SL_EXAM_DATE_T%>'
<%
			}

			if(! SL_EXAM_SQ_T.equals("")) {
%>
		 		SL_EXAM_SQ='<%= SL_EXAM_SQ_T%>'
<%
			}

			if(! SL_P1_CD_T.equals("")) {
%>
		 		SL_P1_CD='<%= SL_P1_CD_T%>'
<%
			}

			if(! SL_P2_CD_T.equals("")) {
%>
		 		SL_P2_CD='<%= SL_P2_CD_T%>'
<%
			}

			if(! SL_C1_CD_T.equals("")) {
%>
		 		SL_C1_CD='<%= SL_C1_CD_T%>'
<%
			}

			if(! SL_C2_CD_T.equals("")) {
%>
		 		SL_C2_CD='<%= SL_C2_CD_T%>'
<%
			}

			if(! SL_C3_CD_T.equals("")) {
%>
		 		SL_C3_CD='<%= SL_C3_CD_T%>'
<%
			}

			if(! SL_C4_CD_T.equals("")) {
%>
		 		SL_C4_CD='<%= SL_C4_CD_T%>'
<%
			}

			if(! SL_C5_CD_T.equals("")) {
%>
		 		SL_C5_CD='<%= SL_C5_CD_T%>'
<%
			}

			if(! SL_DT_CD_T.equals("")) {
%>
		 		SL_DT_CD='<%= SL_DT_CD_T%>'
<%
			}

			if(! SL_STP_CD_T.equals("")) {
%>
		 		SL_STP_CD='<%= SL_STP_CD_T%>'
<%
			}

			if(! SL_STD_CD_T.equals("")) {
%>
		 		SL_STD_CD='<%= SL_STD_CD_T%>'
<%
			}

			if(! SL_SP1_CD_T.equals("")) {
%>
		 		SL_SP1_CD='<%= SL_SP1_CD_T%>'
<%
			}

			if(! SL_SP2_CD_T.equals("")) {
%>
		 		SL_SP2_CD='<%= SL_SP2_CD_T%>'
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
