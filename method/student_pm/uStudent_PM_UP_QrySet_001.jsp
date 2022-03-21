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

SELECT C.ICR_PENL_ID ICR_PENL_DE,    C.ICR_BIRH_DT,
       A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, A.EEA_COMP_CD, A.EEA_SEX_CD, A.EEA_PSNL_AGE, 
       A.EEA_PDF_KD,  A.EEA_ZIP_CD,  A.EEA_ZIP_AR || ' ' || A.EEA_ROAD_AR AS EEA_ADDR_NM,  
       A.EEA_DIVI_CS, A.EEA_CLSS_KD, A.EEA_DIVI_NO, A.EEA_DEPT_NM, 
       D.IAU_EMP_NO,  D.IAU_PENL_NM, D.IAU_LICEN1_CD, D.IAU_LICEN1_NO, D.IAU_LICEN2_CD, D.IAU_LICEN2_NO, 
       E.IAU_EMP_NO   IAU_OEMP_NO,   E.IAU_PENL_NM IAU_OPENL_NM, E.IAU_EPENL_NM IAU_OEPENL_NM, 
       E.IAU_LICEN1_CD IAU_OLICEN1_CD, E.IAU_LICEN1_NO IAU_OLICEN1_NO, 
       E.IAU_LICEN2_CD IAU_OLICEN2_CD, E.IAU_LICEN2_NO IAU_OLICEN2_NO, B.*
  FROM ET_EXAM_ACPT A 
            INNER JOIN ET_STDT_PNJN B ON A.EEA_EXAM_DT = B.ESP_EXAM_DT  AND A.EEA_EXAM_SQ = B.ESP_EXAM_SQ 
       LEFT OUTER JOIN IT_CUSTOMER  C ON A.EEA_CUST_NO = C.ICR_CUST_NO 
       LEFT OUTER JOIN IT_AUTH_USER D ON B.ESP_EXAM_DR = D.IAU_EMP_NO  
       LEFT OUTER JOIN IT_AUTH_USER E ON B.ESP_ORAL_DR = E.IAU_EMP_NO
WHERE A.EEA_EXAM_DT = :EXAM_DT
  and A.EEA_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT C.ICR_PENL_ID ICR_PENL_DE, C.ICR_BIRH_DT, A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, A.EEA_COMP_CD, A.EEA_SEX_CD, A.EEA_PSNL_AGE, A.EEA_PDF_KD, A.EEA_ZIP_CD, A.EEA_ZIP_AR || ' ' || A.EEA_ROAD_AR AS EEA_ADDR_NM, A.EEA_DIVI_CS, A.EEA_CLSS_KD, A.EEA_DIVI_NO, A.EEA_DEPT_NM, D.IAU_EMP_NO, D.IAU_PENL_NM, D.IAU_LICEN1_CD, D.IAU_LICEN1_NO, D.IAU_LICEN2_CD, D.IAU_LICEN2_NO, E.IAU_EMP_NO IAU_OEMP_NO, E.IAU_PENL_NM IAU_OPENL_NM, E.IAU_EPENL_NM IAU_OEPENL_NM, E.IAU_LICEN1_CD IAU_OLICEN1_CD, E.IAU_LICEN1_NO IAU_OLICEN1_NO, E.IAU_LICEN2_CD IAU_OLICEN2_CD, E.IAU_LICEN2_NO IAU_OLICEN2_NO, B.*";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN ET_STDT_PNJN B";
		sql += " ON A.EEA_EXAM_DT = B.ESP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.ESP_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER C";
		sql += " ON A.EEA_CUST_NO = C.ICR_CUST_NO LEFT OUTER JOIN IT_AUTH_USER D";
		sql += " ON B.ESP_EXAM_DR = D.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER E";
		sql += " ON B.ESP_ORAL_DR = E.IAU_EMP_NO";
		sql += " WHERE A.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStudent_PM_UP_QrySet_001 \n";
			G_INFO += "설명 : 학생검진 결과통보서 인쇄내역 조회 \n";
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
		<s:AttributeType name='ICR_PENL_DE' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='5' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PDF_KD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PDF_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADDR_NM' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='401'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CS' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_CS'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CLSS_KD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CLSS_KD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_EMP_NO' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_CD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_NO' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OEMP_NO' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OPENL_NM' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OEPENL_NM' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EPENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OLICEN1_CD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OLICEN1_NO' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OLICEN2_CD' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OLICEN2_NO' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EXAM_DT' rs:number='29' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN' rs:basecolumn='ESP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EXAM_SQ' rs:number='30' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN' rs:basecolumn='ESP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_TT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_TT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_01' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_01'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_02' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_02'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_03' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_03'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_04' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_04'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_05' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_05'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_06' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_06'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_07' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_07'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_08' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_08'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_09' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_09'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_10' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_10'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_11' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_11'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_12' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_12'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_13' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_13'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_14' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_14'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_15' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_15'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_16' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_16'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_17' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_17'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_18' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_18'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_19' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_19'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_20' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_20'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_QST_01' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_QST_01'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_QST_02' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_QST_02'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_QST_03' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_QST_03'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_QST_04' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_QST_04'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_QST_05' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_QST_05'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EXAM_VIEW' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_EXAM_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EXAM_ACT' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_EXAM_ACT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_ORAL_VIEW' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_ORAL_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_ORAL_ACT' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_ORAL_ACT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EIFRM_DT' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_EIFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_OIFRM_DT' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_OIFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EXAM_DR' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_EXAM_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_ORAL_DR' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_ORAL_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EPNJN_YN' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_EPNJN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_OPNJN_YN' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_OPNJN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_INPT_ID' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_INPT_DTT' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_MODI_ID' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_MODI_DTT' rs:number='70' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_CHUNG_YN' rs:number='71' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_CHUNG_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='72' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c72' rs:name='ROWID' rs:number='73' rs:rowid='true' rs:basetable='ET_STDT_PNJN' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c73' rs:name='ROWID' rs:number='74' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c74' rs:name='ROWID' rs:number='75' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c75' rs:name='ROWID' rs:number='76' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_PDF_KD_T = cRsList.getString("EEA_PDF_KD");
			String EEA_ZIP_CD_T = cRsList.getString("EEA_ZIP_CD");
			String EEA_ADDR_NM_T = cRsList.getString("EEA_ADDR_NM");
			String EEA_DIVI_CS_T = cRsList.getString("EEA_DIVI_CS");
			String EEA_CLSS_KD_T = cRsList.getString("EEA_CLSS_KD");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String IAU_EMP_NO_T = cRsList.getString("IAU_EMP_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_LICEN1_CD_T = cRsList.getString("IAU_LICEN1_CD");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_LICEN2_CD_T = cRsList.getString("IAU_LICEN2_CD");
			String IAU_LICEN2_NO_T = cRsList.getString("IAU_LICEN2_NO");
			String IAU_OEMP_NO_T = cRsList.getString("IAU_OEMP_NO");
			String IAU_OPENL_NM_T = cRsList.getString("IAU_OPENL_NM");
			String IAU_OEPENL_NM_T = cRsList.getString("IAU_OEPENL_NM");
			String IAU_OLICEN1_CD_T = cRsList.getString("IAU_OLICEN1_CD");
			String IAU_OLICEN1_NO_T = cRsList.getString("IAU_OLICEN1_NO");
			String IAU_OLICEN2_CD_T = cRsList.getString("IAU_OLICEN2_CD");
			String IAU_OLICEN2_NO_T = cRsList.getString("IAU_OLICEN2_NO");
			String ESP_EXAM_DT_T = cRsList.getString("ESP_EXAM_DT");
			String ESP_EXAM_SQ_T = cRsList.getString("ESP_EXAM_SQ");
			String ESP_PNJN_TT_T = cRsList.getString("ESP_PNJN_TT");
			String ESP_PNJN_01_T = cRsList.getString("ESP_PNJN_01");
			String ESP_PNJN_02_T = cRsList.getString("ESP_PNJN_02");
			String ESP_PNJN_03_T = cRsList.getString("ESP_PNJN_03");
			String ESP_PNJN_04_T = cRsList.getString("ESP_PNJN_04");
			String ESP_PNJN_05_T = cRsList.getString("ESP_PNJN_05");
			String ESP_PNJN_06_T = cRsList.getString("ESP_PNJN_06");
			String ESP_PNJN_07_T = cRsList.getString("ESP_PNJN_07");
			String ESP_PNJN_08_T = cRsList.getString("ESP_PNJN_08");
			String ESP_PNJN_09_T = cRsList.getString("ESP_PNJN_09");
			String ESP_PNJN_10_T = cRsList.getString("ESP_PNJN_10");
			String ESP_PNJN_11_T = cRsList.getString("ESP_PNJN_11");
			String ESP_PNJN_12_T = cRsList.getString("ESP_PNJN_12");
			String ESP_PNJN_13_T = cRsList.getString("ESP_PNJN_13");
			String ESP_PNJN_14_T = cRsList.getString("ESP_PNJN_14");
			String ESP_PNJN_15_T = cRsList.getString("ESP_PNJN_15");
			String ESP_PNJN_16_T = cRsList.getString("ESP_PNJN_16");
			String ESP_PNJN_17_T = cRsList.getString("ESP_PNJN_17");
			String ESP_PNJN_18_T = cRsList.getString("ESP_PNJN_18");
			String ESP_PNJN_19_T = cRsList.getString("ESP_PNJN_19");
			String ESP_PNJN_20_T = cRsList.getString("ESP_PNJN_20");
			String ESP_QST_01_T = cRsList.getString("ESP_QST_01");
			String ESP_QST_02_T = cRsList.getString("ESP_QST_02");
			String ESP_QST_03_T = cRsList.getString("ESP_QST_03");
			String ESP_QST_04_T = cRsList.getString("ESP_QST_04");
			String ESP_QST_05_T = cRsList.getString("ESP_QST_05");
			String ESP_EXAM_VIEW_T = cRsList.getString("ESP_EXAM_VIEW");
			String ESP_EXAM_ACT_T = cRsList.getString("ESP_EXAM_ACT");
			String ESP_ORAL_VIEW_T = cRsList.getString("ESP_ORAL_VIEW");
			String ESP_ORAL_ACT_T = cRsList.getString("ESP_ORAL_ACT");
			String ESP_EIFRM_DT_T = cRsList.getString("ESP_EIFRM_DT");
			String ESP_OIFRM_DT_T = cRsList.getString("ESP_OIFRM_DT");
			String ESP_EXAM_DR_T = cRsList.getString("ESP_EXAM_DR");
			String ESP_ORAL_DR_T = cRsList.getString("ESP_ORAL_DR");
			String ESP_EPNJN_YN_T = cRsList.getString("ESP_EPNJN_YN");
			String ESP_OPNJN_YN_T = cRsList.getString("ESP_OPNJN_YN");
			String ESP_INPT_ID_T = cRsList.getString("ESP_INPT_ID");
			String ESP_INPT_DTT_T = cRsList.getDate2("ESP_INPT_DTT");
			String ESP_MODI_ID_T = cRsList.getString("ESP_MODI_ID");
			String ESP_MODI_DTT_T = cRsList.getDate2("ESP_MODI_DTT");
			String ESP_CHUNG_YN_T = cRsList.getString("ESP_CHUNG_YN");
			String ROWID_T = cRsList.getString("ROWID");
			String c72_T = cRsList.getString("c72");
			String c73_T = cRsList.getString("c73");
			String c74_T = cRsList.getString("c74");
			String c75_T = cRsList.getString("c75");
%>
			<z:row
<%
			if(! ICR_PENL_DE_T.equals("")) {
%>
		 		ICR_PENL_DE='<%= ICR_PENL_DE_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
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

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
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

			if(! EEA_PDF_KD_T.equals("")) {
%>
		 		EEA_PDF_KD='<%= EEA_PDF_KD_T%>'
<%
			}

			if(! EEA_ZIP_CD_T.equals("")) {
%>
		 		EEA_ZIP_CD='<%= EEA_ZIP_CD_T%>'
<%
			}

			if(! EEA_ADDR_NM_T.equals("")) {
%>
		 		EEA_ADDR_NM='<%= EEA_ADDR_NM_T%>'
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

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! IAU_EMP_NO_T.equals("")) {
%>
		 		IAU_EMP_NO='<%= IAU_EMP_NO_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! IAU_LICEN1_CD_T.equals("")) {
%>
		 		IAU_LICEN1_CD='<%= IAU_LICEN1_CD_T%>'
<%
			}

			if(! IAU_LICEN1_NO_T.equals("")) {
%>
		 		IAU_LICEN1_NO='<%= IAU_LICEN1_NO_T%>'
<%
			}

			if(! IAU_LICEN2_CD_T.equals("")) {
%>
		 		IAU_LICEN2_CD='<%= IAU_LICEN2_CD_T%>'
<%
			}

			if(! IAU_LICEN2_NO_T.equals("")) {
%>
		 		IAU_LICEN2_NO='<%= IAU_LICEN2_NO_T%>'
<%
			}

			if(! IAU_OEMP_NO_T.equals("")) {
%>
		 		IAU_OEMP_NO='<%= IAU_OEMP_NO_T%>'
<%
			}

			if(! IAU_OPENL_NM_T.equals("")) {
%>
		 		IAU_OPENL_NM='<%= IAU_OPENL_NM_T%>'
<%
			}

			if(! IAU_OEPENL_NM_T.equals("")) {
%>
		 		IAU_OEPENL_NM='<%= IAU_OEPENL_NM_T%>'
<%
			}

			if(! IAU_OLICEN1_CD_T.equals("")) {
%>
		 		IAU_OLICEN1_CD='<%= IAU_OLICEN1_CD_T%>'
<%
			}

			if(! IAU_OLICEN1_NO_T.equals("")) {
%>
		 		IAU_OLICEN1_NO='<%= IAU_OLICEN1_NO_T%>'
<%
			}

			if(! IAU_OLICEN2_CD_T.equals("")) {
%>
		 		IAU_OLICEN2_CD='<%= IAU_OLICEN2_CD_T%>'
<%
			}

			if(! IAU_OLICEN2_NO_T.equals("")) {
%>
		 		IAU_OLICEN2_NO='<%= IAU_OLICEN2_NO_T%>'
<%
			}

			if(! ESP_EXAM_DT_T.equals("")) {
%>
		 		ESP_EXAM_DT='<%= ESP_EXAM_DT_T%>'
<%
			}

			if(! ESP_EXAM_SQ_T.equals("")) {
%>
		 		ESP_EXAM_SQ='<%= ESP_EXAM_SQ_T%>'
<%
			}

			if(! ESP_PNJN_TT_T.equals("")) {
%>
		 		ESP_PNJN_TT='<%= ESP_PNJN_TT_T%>'
<%
			}

			if(! ESP_PNJN_01_T.equals("")) {
%>
		 		ESP_PNJN_01='<%= ESP_PNJN_01_T%>'
<%
			}

			if(! ESP_PNJN_02_T.equals("")) {
%>
		 		ESP_PNJN_02='<%= ESP_PNJN_02_T%>'
<%
			}

			if(! ESP_PNJN_03_T.equals("")) {
%>
		 		ESP_PNJN_03='<%= ESP_PNJN_03_T%>'
<%
			}

			if(! ESP_PNJN_04_T.equals("")) {
%>
		 		ESP_PNJN_04='<%= ESP_PNJN_04_T%>'
<%
			}

			if(! ESP_PNJN_05_T.equals("")) {
%>
		 		ESP_PNJN_05='<%= ESP_PNJN_05_T%>'
<%
			}

			if(! ESP_PNJN_06_T.equals("")) {
%>
		 		ESP_PNJN_06='<%= ESP_PNJN_06_T%>'
<%
			}

			if(! ESP_PNJN_07_T.equals("")) {
%>
		 		ESP_PNJN_07='<%= ESP_PNJN_07_T%>'
<%
			}

			if(! ESP_PNJN_08_T.equals("")) {
%>
		 		ESP_PNJN_08='<%= ESP_PNJN_08_T%>'
<%
			}

			if(! ESP_PNJN_09_T.equals("")) {
%>
		 		ESP_PNJN_09='<%= ESP_PNJN_09_T%>'
<%
			}

			if(! ESP_PNJN_10_T.equals("")) {
%>
		 		ESP_PNJN_10='<%= ESP_PNJN_10_T%>'
<%
			}

			if(! ESP_PNJN_11_T.equals("")) {
%>
		 		ESP_PNJN_11='<%= ESP_PNJN_11_T%>'
<%
			}

			if(! ESP_PNJN_12_T.equals("")) {
%>
		 		ESP_PNJN_12='<%= ESP_PNJN_12_T%>'
<%
			}

			if(! ESP_PNJN_13_T.equals("")) {
%>
		 		ESP_PNJN_13='<%= ESP_PNJN_13_T%>'
<%
			}

			if(! ESP_PNJN_14_T.equals("")) {
%>
		 		ESP_PNJN_14='<%= ESP_PNJN_14_T%>'
<%
			}

			if(! ESP_PNJN_15_T.equals("")) {
%>
		 		ESP_PNJN_15='<%= ESP_PNJN_15_T%>'
<%
			}

			if(! ESP_PNJN_16_T.equals("")) {
%>
		 		ESP_PNJN_16='<%= ESP_PNJN_16_T%>'
<%
			}

			if(! ESP_PNJN_17_T.equals("")) {
%>
		 		ESP_PNJN_17='<%= ESP_PNJN_17_T%>'
<%
			}

			if(! ESP_PNJN_18_T.equals("")) {
%>
		 		ESP_PNJN_18='<%= ESP_PNJN_18_T%>'
<%
			}

			if(! ESP_PNJN_19_T.equals("")) {
%>
		 		ESP_PNJN_19='<%= ESP_PNJN_19_T%>'
<%
			}

			if(! ESP_PNJN_20_T.equals("")) {
%>
		 		ESP_PNJN_20='<%= ESP_PNJN_20_T%>'
<%
			}

			if(! ESP_QST_01_T.equals("")) {
%>
		 		ESP_QST_01='<%= ESP_QST_01_T%>'
<%
			}

			if(! ESP_QST_02_T.equals("")) {
%>
		 		ESP_QST_02='<%= ESP_QST_02_T%>'
<%
			}

			if(! ESP_QST_03_T.equals("")) {
%>
		 		ESP_QST_03='<%= ESP_QST_03_T%>'
<%
			}

			if(! ESP_QST_04_T.equals("")) {
%>
		 		ESP_QST_04='<%= ESP_QST_04_T%>'
<%
			}

			if(! ESP_QST_05_T.equals("")) {
%>
		 		ESP_QST_05='<%= ESP_QST_05_T%>'
<%
			}

			if(! ESP_EXAM_VIEW_T.equals("")) {
%>
		 		ESP_EXAM_VIEW='<%= ESP_EXAM_VIEW_T%>'
<%
			}

			if(! ESP_EXAM_ACT_T.equals("")) {
%>
		 		ESP_EXAM_ACT='<%= ESP_EXAM_ACT_T%>'
<%
			}

			if(! ESP_ORAL_VIEW_T.equals("")) {
%>
		 		ESP_ORAL_VIEW='<%= ESP_ORAL_VIEW_T%>'
<%
			}

			if(! ESP_ORAL_ACT_T.equals("")) {
%>
		 		ESP_ORAL_ACT='<%= ESP_ORAL_ACT_T%>'
<%
			}

			if(! ESP_EIFRM_DT_T.equals("")) {
%>
		 		ESP_EIFRM_DT='<%= ESP_EIFRM_DT_T%>'
<%
			}

			if(! ESP_OIFRM_DT_T.equals("")) {
%>
		 		ESP_OIFRM_DT='<%= ESP_OIFRM_DT_T%>'
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

			if(! ESP_EPNJN_YN_T.equals("")) {
%>
		 		ESP_EPNJN_YN='<%= ESP_EPNJN_YN_T%>'
<%
			}

			if(! ESP_OPNJN_YN_T.equals("")) {
%>
		 		ESP_OPNJN_YN='<%= ESP_OPNJN_YN_T%>'
<%
			}

			if(! ESP_INPT_ID_T.equals("")) {
%>
		 		ESP_INPT_ID='<%= ESP_INPT_ID_T%>'
<%
			}

			if(! ESP_INPT_DTT_T.equals("")) {
%>
		 		ESP_INPT_DTT='<%= ESP_INPT_DTT_T%>'
<%
			}

			if(! ESP_MODI_ID_T.equals("")) {
%>
		 		ESP_MODI_ID='<%= ESP_MODI_ID_T%>'
<%
			}

			if(! ESP_MODI_DTT_T.equals("")) {
%>
		 		ESP_MODI_DTT='<%= ESP_MODI_DTT_T%>'
<%
			}

			if(! ESP_CHUNG_YN_T.equals("")) {
%>
		 		ESP_CHUNG_YN='<%= ESP_CHUNG_YN_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c72='<%= cnt%>'
				c73='<%= cnt%>'
				c74='<%= cnt%>'
				c75='<%= cnt%>'
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
