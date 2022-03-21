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

SELECT C.ICR_PENL_ID ICR_PENL_DE, 
       A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, C.ICR_BIRH_DT, A.EEA_COMP_CD, A.EEA_SEX_CD, 
       A.EEA_PDF_KD,  A.EEA_ZIP_CD,  A.EEA_ZIP_AR || ' ' || A.EEA_ROAD_AR AS EEA_ADDR_NM,  
       A.EEA_DIVI_CS, A.EEA_CLSS_KD, A.EEA_DIVI_NO, A.EEA_DEPT_NM, A.EEA_CANAD_YN, A.EEA_CNCR_DT, A.EEA_UTER_CD, A.EEA_PLCE_CD, 
       D.IAU_EMP_NO, D.IAU_PENL_NM,  D.IAU_EPENL_NM, D.IAU_LICEN1_CD,  D.IAU_LICEN1_NO, D.IAU_LICEN2_CD, D.IAU_LICEN2_NO,
       E.IAU_EMP_NO    IAU_OEMP_NO,    E.IAU_PENL_NM   IAU_OPENL_NM,   E.IAU_EPENL_NM  IAU_OEPENL_NM,  E.IAU_LICEN1_CD IAU_OLICEN1_CD,
       E.IAU_LICEN1_NO IAU_OLICEN1_NO, E.IAU_LICEN2_CD IAU_OLICEN2_CD, E.IAU_LICEN2_NO IAU_OLICEN2_NO,
       F.IAU_EMP_NO    IAU_PEMP_NO,    F.IAU_PENL_NM   IAU_PPENL_NM,   F.IAU_EPENL_NM  IAU_PEPENL_NM,  F.IAU_LICEN1_CD IAU_PLICEN1_CD,
       F.IAU_LICEN1_NO IAU_PLICEN1_NO, F.IAU_LICEN2_CD IAU_PLICEN2_CD, F.IAU_LICEN2_NO IAU_PLICEN2_NO,
       B.*, Z.*
  FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_STDT_PNJNO  B ON A.EEA_EXAM_DT  = B.ESO_EXAM_DT  AND A.EEA_EXAM_SQ = B.ESO_EXAM_SQ
                      LEFT OUTER JOIN ET_CANCER_CRVC Z ON A.EEA_EXAM_DT  = Z.ECV_EXAM_DT  AND A.EEA_EXAM_SQ = Z.ECV_EXAM_SQ
                      LEFT OUTER JOIN IT_CUSTOMER    C ON A.EEA_CUST_NO  = C.ICR_CUST_NO
                      LEFT OUTER JOIN IT_AUTH_USER   D ON B.ESO_EXAM_DR  = D.IAU_EMP_NO 
                      LEFT OUTER JOIN IT_AUTH_USER   E ON B.ESO_ORAL_DR  = E.IAU_EMP_NO 
                      LEFT OUTER JOIN IT_AUTH_USER   F ON Z.ECV_LICEN_CD = F.IAU_EMP_NO 
  WHERE A.EEA_EXAM_DT = :EXAM_DT
    AND A.EEA_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT C.ICR_PENL_ID ICR_PENL_DE, A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, C.ICR_BIRH_DT, A.EEA_COMP_CD, A.EEA_SEX_CD, A.EEA_PDF_KD, A.EEA_ZIP_CD, A.EEA_ZIP_AR || ' ' || A.EEA_ROAD_AR AS EEA_ADDR_NM, A.EEA_DIVI_CS, A.EEA_CLSS_KD, A.EEA_DIVI_NO, A.EEA_DEPT_NM, A.EEA_CANAD_YN, A.EEA_CNCR_DT, A.EEA_UTER_CD, A.EEA_PLCE_CD, D.IAU_EMP_NO, D.IAU_PENL_NM, D.IAU_EPENL_NM, D.IAU_LICEN1_CD, D.IAU_LICEN1_NO, D.IAU_LICEN2_CD, D.IAU_LICEN2_NO, E.IAU_EMP_NO IAU_OEMP_NO, E.IAU_PENL_NM IAU_OPENL_NM, E.IAU_EPENL_NM IAU_OEPENL_NM, E.IAU_LICEN1_CD IAU_OLICEN1_CD, E.IAU_LICEN1_NO IAU_OLICEN1_NO, E.IAU_LICEN2_CD IAU_OLICEN2_CD, E.IAU_LICEN2_NO IAU_OLICEN2_NO, F.IAU_EMP_NO IAU_PEMP_NO, F.IAU_PENL_NM IAU_PPENL_NM, F.IAU_EPENL_NM IAU_PEPENL_NM, F.IAU_LICEN1_CD IAU_PLICEN1_CD, F.IAU_LICEN1_NO IAU_PLICEN1_NO, F.IAU_LICEN2_CD IAU_PLICEN2_CD, F.IAU_LICEN2_NO IAU_PLICEN2_NO, B.*, Z.*";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_STDT_PNJNO B";
		sql += " ON A.EEA_EXAM_DT = B.ESO_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.ESO_EXAM_SQ LEFT OUTER JOIN ET_CANCER_CRVC Z";
		sql += " ON A.EEA_EXAM_DT = Z.ECV_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = Z.ECV_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER C";
		sql += " ON A.EEA_CUST_NO = C.ICR_CUST_NO LEFT OUTER JOIN IT_AUTH_USER D";
		sql += " ON B.ESO_EXAM_DR = D.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER E";
		sql += " ON B.ESO_ORAL_DR = E.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER F";
		sql += " ON Z.ECV_LICEN_CD = F.IAU_EMP_NO";
		sql += " WHERE A.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uOutSchool_PM_UP_QrySet_001 \n";
			G_INFO += "설명 : 학교밖청소년 통보서 인쇄내역 조회 \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PDF_KD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PDF_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADDR_NM' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='401'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CS' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_CS'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CLSS_KD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CLSS_KD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANAD_YN' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANAD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNCR_DT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNCR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UTER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='18' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_EMP_NO' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_EPENL_NM' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EPENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_CD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_CD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_NO' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OEMP_NO' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OPENL_NM' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OEPENL_NM' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EPENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OLICEN1_CD' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OLICEN1_NO' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OLICEN2_CD' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_OLICEN2_NO' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PEMP_NO' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PPENL_NM' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PEPENL_NM' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EPENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PLICEN1_CD' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PLICEN1_NO' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PLICEN2_CD' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PLICEN2_NO' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EXAM_DT' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EXAM_SQ' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_DIAG' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_DIAG'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_DRUG' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_DRUG'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_STAT' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_STAT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_HABIT' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_HABIT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_DRUNK' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_DRUNK'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_SMOKE' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_SMOKE'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_SPORT' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_SPORT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_WEIGHT' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_WEIGHT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_INJURE' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_INJURE'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_1' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_2' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_3' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_4' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_5' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_5'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_6' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_6'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_7' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_7'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_ETC' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_ETC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_ETC2' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_ETC2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_1' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_2' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_3' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_4' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_5' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_5'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_6' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_6'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_7' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_7'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_8' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_8'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_ETC' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_ETC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_ETC2' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_ETC2'>
			<s:datatype dt:type='string' dt:maxLength='80'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNRD_1' rs:number='70' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNRD_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNRD_2' rs:number='71' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNRD_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNRD_3' rs:number='72' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNRD_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNRD_4' rs:number='73' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNRD_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJN_A' rs:number='74' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJN_A'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJN_B' rs:number='75' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJN_B'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJN_R' rs:number='76' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJN_R'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJN_RD' rs:number='77' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJN_RD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJN_ORAL' rs:number='78' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJN_ORAL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EXAM_VIEW' rs:number='79' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EXAM_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EXAM_ACT' rs:number='80' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EXAM_ACT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_ORAL_VIEW' rs:number='81' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_ORAL_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_ORAL_ACT' rs:number='82' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_ORAL_ACT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EPNJN_DT' rs:number='83' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EPNJN_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_OPNJN_DT' rs:number='84' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_OPNJN_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EIFRM_DT' rs:number='85' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EIFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_OIFRM_DT' rs:number='86' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_OIFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EXAM_DR' rs:number='87' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EXAM_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_ORAL_DR' rs:number='88' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_ORAL_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EPNJN_YN' rs:number='89' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EPNJN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_OPNJN_YN' rs:number='90' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_OPNJN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_CHUNG_YN' rs:number='91' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_CHUNG_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_INPT_ID' rs:number='92' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_INPT_DTT' rs:number='93' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_MODI_ID' rs:number='94' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_MODI_DTT' rs:number='95' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_8' rs:number='96' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_8'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_9' rs:number='97' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_9'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_ADD_VIEW' rs:number='98' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_ADD_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EXAM_DT' rs:number='99' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EXAM_SQ' rs:number='100' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CFRM_CD' rs:number='101' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVEX_DT' rs:number='102' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_DBCV_KD' rs:number='103' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_DBCV_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVSP1_KD' rs:number='104' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVSP1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CELL1_KD' rs:number='105' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CELL1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVRT1_KD' rs:number='106' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_SQRT1_KD' rs:number='107' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_SQRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHRT1_KD' rs:number='108' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_NHRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPRT1_KD' rs:number='109' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EPRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPET1_EX' rs:number='110' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EPET1_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RTET1_EX' rs:number='111' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RTET1_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCRT1_KD' rs:number='112' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETCRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCEX1_EX' rs:number='113' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETCEX1_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVSP2_KD' rs:number='114' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVSP2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CELL2_KD' rs:number='115' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CELL2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVRT2_KD' rs:number='116' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_SQRT2_KD' rs:number='117' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_SQRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHRT2_KD' rs:number='118' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_NHRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPRT2_KD' rs:number='119' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EPRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPET2_EX' rs:number='120' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_EPET2_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RTET2_EX' rs:number='121' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RTET2_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCRT2_KD' rs:number='122' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETCRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCEX2_EX' rs:number='123' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETCEX2_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RSLT_KD' rs:number='124' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETC_EX' rs:number='125' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVCN_YN' rs:number='126' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RSLT_EX' rs:number='127' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RPT_DT' rs:number='128' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CFRM_DT' rs:number='129' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_LICEN_CD' rs:number='130' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_INPUT_DTT' rs:number='131' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_INPUT_ID' rs:number='132' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_MODI_DTT' rs:number='133' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_MODI_ID' rs:number='134' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHEP1_KD' rs:number='135' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_NHEP1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHEP2_KD' rs:number='136' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_NHEP2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_COLL_LICEN_CD' rs:number='137' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_COLL_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_PATH_LICEN_CD' rs:number='138' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_PATH_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='139' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c139' rs:name='ROWID' rs:number='140' rs:rowid='true' rs:basetable='ET_STDT_PNJNO' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c140' rs:name='ROWID' rs:number='141' rs:rowid='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c141' rs:name='ROWID' rs:number='142' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c142' rs:name='ROWID' rs:number='143' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c143' rs:name='ROWID' rs:number='144' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c144' rs:name='ROWID' rs:number='145' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_PDF_KD_T = cRsList.getString("EEA_PDF_KD");
			String EEA_ZIP_CD_T = cRsList.getString("EEA_ZIP_CD");
			String EEA_ADDR_NM_T = cRsList.getString("EEA_ADDR_NM");
			String EEA_DIVI_CS_T = cRsList.getString("EEA_DIVI_CS");
			String EEA_CLSS_KD_T = cRsList.getString("EEA_CLSS_KD");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_CANAD_YN_T = cRsList.getString("EEA_CANAD_YN");
			String EEA_CNCR_DT_T = cRsList.getString("EEA_CNCR_DT");
			String EEA_UTER_CD_T = cRsList.getString("EEA_UTER_CD");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String IAU_EMP_NO_T = cRsList.getString("IAU_EMP_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_EPENL_NM_T = cRsList.getString("IAU_EPENL_NM");
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
			String IAU_PEMP_NO_T = cRsList.getString("IAU_PEMP_NO");
			String IAU_PPENL_NM_T = cRsList.getString("IAU_PPENL_NM");
			String IAU_PEPENL_NM_T = cRsList.getString("IAU_PEPENL_NM");
			String IAU_PLICEN1_CD_T = cRsList.getString("IAU_PLICEN1_CD");
			String IAU_PLICEN1_NO_T = cRsList.getString("IAU_PLICEN1_NO");
			String IAU_PLICEN2_CD_T = cRsList.getString("IAU_PLICEN2_CD");
			String IAU_PLICEN2_NO_T = cRsList.getString("IAU_PLICEN2_NO");
			String ESO_EXAM_DT_T = cRsList.getString("ESO_EXAM_DT");
			String ESO_EXAM_SQ_T = cRsList.getString("ESO_EXAM_SQ");
			String ESO_QST_DIAG_T = cRsList.getString("ESO_QST_DIAG");
			String ESO_QST_DRUG_T = cRsList.getString("ESO_QST_DRUG");
			String ESO_QST_STAT_T = cRsList.getString("ESO_QST_STAT");
			String ESO_QST_HABIT_T = cRsList.getString("ESO_QST_HABIT");
			String ESO_QST_DRUNK_T = cRsList.getString("ESO_QST_DRUNK");
			String ESO_QST_SMOKE_T = cRsList.getString("ESO_QST_SMOKE");
			String ESO_QST_SPORT_T = cRsList.getString("ESO_QST_SPORT");
			String ESO_QST_WEIGHT_T = cRsList.getString("ESO_QST_WEIGHT");
			String ESO_QST_INJURE_T = cRsList.getString("ESO_QST_INJURE");
			String ESO_PNJNB_1_T = cRsList.getString("ESO_PNJNB_1");
			String ESO_PNJNB_2_T = cRsList.getString("ESO_PNJNB_2");
			String ESO_PNJNB_3_T = cRsList.getString("ESO_PNJNB_3");
			String ESO_PNJNB_4_T = cRsList.getString("ESO_PNJNB_4");
			String ESO_PNJNB_5_T = cRsList.getString("ESO_PNJNB_5");
			String ESO_PNJNB_6_T = cRsList.getString("ESO_PNJNB_6");
			String ESO_PNJNB_7_T = cRsList.getString("ESO_PNJNB_7");
			String ESO_PNJNB_ETC_T = cRsList.getString("ESO_PNJNB_ETC");
			String ESO_PNJNB_ETC2_T = cRsList.getString("ESO_PNJNB_ETC2");
			String ESO_PNJNR_1_T = cRsList.getString("ESO_PNJNR_1");
			String ESO_PNJNR_2_T = cRsList.getString("ESO_PNJNR_2");
			String ESO_PNJNR_3_T = cRsList.getString("ESO_PNJNR_3");
			String ESO_PNJNR_4_T = cRsList.getString("ESO_PNJNR_4");
			String ESO_PNJNR_5_T = cRsList.getString("ESO_PNJNR_5");
			String ESO_PNJNR_6_T = cRsList.getString("ESO_PNJNR_6");
			String ESO_PNJNR_7_T = cRsList.getString("ESO_PNJNR_7");
			String ESO_PNJNR_8_T = cRsList.getString("ESO_PNJNR_8");
			String ESO_PNJNR_ETC_T = cRsList.getString("ESO_PNJNR_ETC");
			String ESO_PNJNR_ETC2_T = cRsList.getString("ESO_PNJNR_ETC2");
			String ESO_PNJNRD_1_T = cRsList.getString("ESO_PNJNRD_1");
			String ESO_PNJNRD_2_T = cRsList.getString("ESO_PNJNRD_2");
			String ESO_PNJNRD_3_T = cRsList.getString("ESO_PNJNRD_3");
			String ESO_PNJNRD_4_T = cRsList.getString("ESO_PNJNRD_4");
			String ESO_PNJN_A_T = cRsList.getString("ESO_PNJN_A");
			String ESO_PNJN_B_T = cRsList.getString("ESO_PNJN_B");
			String ESO_PNJN_R_T = cRsList.getString("ESO_PNJN_R");
			String ESO_PNJN_RD_T = cRsList.getString("ESO_PNJN_RD");
			String ESO_PNJN_ORAL_T = cRsList.getString("ESO_PNJN_ORAL");
			String ESO_EXAM_VIEW_T = cRsList.getString("ESO_EXAM_VIEW");
			String ESO_EXAM_ACT_T = cRsList.getString("ESO_EXAM_ACT");
			String ESO_ORAL_VIEW_T = cRsList.getString("ESO_ORAL_VIEW");
			String ESO_ORAL_ACT_T = cRsList.getString("ESO_ORAL_ACT");
			String ESO_EPNJN_DT_T = cRsList.getString("ESO_EPNJN_DT");
			String ESO_OPNJN_DT_T = cRsList.getString("ESO_OPNJN_DT");
			String ESO_EIFRM_DT_T = cRsList.getString("ESO_EIFRM_DT");
			String ESO_OIFRM_DT_T = cRsList.getString("ESO_OIFRM_DT");
			String ESO_EXAM_DR_T = cRsList.getString("ESO_EXAM_DR");
			String ESO_ORAL_DR_T = cRsList.getString("ESO_ORAL_DR");
			String ESO_EPNJN_YN_T = cRsList.getString("ESO_EPNJN_YN");
			String ESO_OPNJN_YN_T = cRsList.getString("ESO_OPNJN_YN");
			String ESO_CHUNG_YN_T = cRsList.getString("ESO_CHUNG_YN");
			String ESO_INPT_ID_T = cRsList.getString("ESO_INPT_ID");
			String ESO_INPT_DTT_T = cRsList.getDate2("ESO_INPT_DTT");
			String ESO_MODI_ID_T = cRsList.getString("ESO_MODI_ID");
			String ESO_MODI_DTT_T = cRsList.getDate2("ESO_MODI_DTT");
			String ESO_PNJNB_8_T = cRsList.getString("ESO_PNJNB_8");
			String ESO_PNJNR_9_T = cRsList.getString("ESO_PNJNR_9");
			String ESO_ADD_VIEW_T = cRsList.getString("ESO_ADD_VIEW");
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
			String ROWID_T = cRsList.getString("ROWID");
			String c139_T = cRsList.getString("c139");
			String c140_T = cRsList.getString("c140");
			String c141_T = cRsList.getString("c141");
			String c142_T = cRsList.getString("c142");
			String c143_T = cRsList.getString("c143");
			String c144_T = cRsList.getString("c144");
%>
			<z:row
<%
			if(! ICR_PENL_DE_T.equals("")) {
%>
		 		ICR_PENL_DE='<%= ICR_PENL_DE_T%>'
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

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
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

			if(! EEA_CANAD_YN_T.equals("")) {
%>
		 		EEA_CANAD_YN='<%= EEA_CANAD_YN_T%>'
<%
			}

			if(! EEA_CNCR_DT_T.equals("")) {
%>
		 		EEA_CNCR_DT='<%= EEA_CNCR_DT_T%>'
<%
			}

			if(! EEA_UTER_CD_T.equals("")) {
%>
		 		EEA_UTER_CD='<%= EEA_UTER_CD_T%>'
<%
			}

			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
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

			if(! IAU_EPENL_NM_T.equals("")) {
%>
		 		IAU_EPENL_NM='<%= IAU_EPENL_NM_T%>'
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

			if(! IAU_PEMP_NO_T.equals("")) {
%>
		 		IAU_PEMP_NO='<%= IAU_PEMP_NO_T%>'
<%
			}

			if(! IAU_PPENL_NM_T.equals("")) {
%>
		 		IAU_PPENL_NM='<%= IAU_PPENL_NM_T%>'
<%
			}

			if(! IAU_PEPENL_NM_T.equals("")) {
%>
		 		IAU_PEPENL_NM='<%= IAU_PEPENL_NM_T%>'
<%
			}

			if(! IAU_PLICEN1_CD_T.equals("")) {
%>
		 		IAU_PLICEN1_CD='<%= IAU_PLICEN1_CD_T%>'
<%
			}

			if(! IAU_PLICEN1_NO_T.equals("")) {
%>
		 		IAU_PLICEN1_NO='<%= IAU_PLICEN1_NO_T%>'
<%
			}

			if(! IAU_PLICEN2_CD_T.equals("")) {
%>
		 		IAU_PLICEN2_CD='<%= IAU_PLICEN2_CD_T%>'
<%
			}

			if(! IAU_PLICEN2_NO_T.equals("")) {
%>
		 		IAU_PLICEN2_NO='<%= IAU_PLICEN2_NO_T%>'
<%
			}

			if(! ESO_EXAM_DT_T.equals("")) {
%>
		 		ESO_EXAM_DT='<%= ESO_EXAM_DT_T%>'
<%
			}

			if(! ESO_EXAM_SQ_T.equals("")) {
%>
		 		ESO_EXAM_SQ='<%= ESO_EXAM_SQ_T%>'
<%
			}

			if(! ESO_QST_DIAG_T.equals("")) {
%>
		 		ESO_QST_DIAG='<%= ESO_QST_DIAG_T%>'
<%
			}

			if(! ESO_QST_DRUG_T.equals("")) {
%>
		 		ESO_QST_DRUG='<%= ESO_QST_DRUG_T%>'
<%
			}

			if(! ESO_QST_STAT_T.equals("")) {
%>
		 		ESO_QST_STAT='<%= ESO_QST_STAT_T%>'
<%
			}

			if(! ESO_QST_HABIT_T.equals("")) {
%>
		 		ESO_QST_HABIT='<%= ESO_QST_HABIT_T%>'
<%
			}

			if(! ESO_QST_DRUNK_T.equals("")) {
%>
		 		ESO_QST_DRUNK='<%= ESO_QST_DRUNK_T%>'
<%
			}

			if(! ESO_QST_SMOKE_T.equals("")) {
%>
		 		ESO_QST_SMOKE='<%= ESO_QST_SMOKE_T%>'
<%
			}

			if(! ESO_QST_SPORT_T.equals("")) {
%>
		 		ESO_QST_SPORT='<%= ESO_QST_SPORT_T%>'
<%
			}

			if(! ESO_QST_WEIGHT_T.equals("")) {
%>
		 		ESO_QST_WEIGHT='<%= ESO_QST_WEIGHT_T%>'
<%
			}

			if(! ESO_QST_INJURE_T.equals("")) {
%>
		 		ESO_QST_INJURE='<%= ESO_QST_INJURE_T%>'
<%
			}

			if(! ESO_PNJNB_1_T.equals("")) {
%>
		 		ESO_PNJNB_1='<%= ESO_PNJNB_1_T%>'
<%
			}

			if(! ESO_PNJNB_2_T.equals("")) {
%>
		 		ESO_PNJNB_2='<%= ESO_PNJNB_2_T%>'
<%
			}

			if(! ESO_PNJNB_3_T.equals("")) {
%>
		 		ESO_PNJNB_3='<%= ESO_PNJNB_3_T%>'
<%
			}

			if(! ESO_PNJNB_4_T.equals("")) {
%>
		 		ESO_PNJNB_4='<%= ESO_PNJNB_4_T%>'
<%
			}

			if(! ESO_PNJNB_5_T.equals("")) {
%>
		 		ESO_PNJNB_5='<%= ESO_PNJNB_5_T%>'
<%
			}

			if(! ESO_PNJNB_6_T.equals("")) {
%>
		 		ESO_PNJNB_6='<%= ESO_PNJNB_6_T%>'
<%
			}

			if(! ESO_PNJNB_7_T.equals("")) {
%>
		 		ESO_PNJNB_7='<%= ESO_PNJNB_7_T%>'
<%
			}

			if(! ESO_PNJNB_ETC_T.equals("")) {
%>
		 		ESO_PNJNB_ETC='<%= ESO_PNJNB_ETC_T%>'
<%
			}

			if(! ESO_PNJNB_ETC2_T.equals("")) {
%>
		 		ESO_PNJNB_ETC2='<%= ESO_PNJNB_ETC2_T%>'
<%
			}

			if(! ESO_PNJNR_1_T.equals("")) {
%>
		 		ESO_PNJNR_1='<%= ESO_PNJNR_1_T%>'
<%
			}

			if(! ESO_PNJNR_2_T.equals("")) {
%>
		 		ESO_PNJNR_2='<%= ESO_PNJNR_2_T%>'
<%
			}

			if(! ESO_PNJNR_3_T.equals("")) {
%>
		 		ESO_PNJNR_3='<%= ESO_PNJNR_3_T%>'
<%
			}

			if(! ESO_PNJNR_4_T.equals("")) {
%>
		 		ESO_PNJNR_4='<%= ESO_PNJNR_4_T%>'
<%
			}

			if(! ESO_PNJNR_5_T.equals("")) {
%>
		 		ESO_PNJNR_5='<%= ESO_PNJNR_5_T%>'
<%
			}

			if(! ESO_PNJNR_6_T.equals("")) {
%>
		 		ESO_PNJNR_6='<%= ESO_PNJNR_6_T%>'
<%
			}

			if(! ESO_PNJNR_7_T.equals("")) {
%>
		 		ESO_PNJNR_7='<%= ESO_PNJNR_7_T%>'
<%
			}

			if(! ESO_PNJNR_8_T.equals("")) {
%>
		 		ESO_PNJNR_8='<%= ESO_PNJNR_8_T%>'
<%
			}

			if(! ESO_PNJNR_ETC_T.equals("")) {
%>
		 		ESO_PNJNR_ETC='<%= ESO_PNJNR_ETC_T%>'
<%
			}

			if(! ESO_PNJNR_ETC2_T.equals("")) {
%>
		 		ESO_PNJNR_ETC2='<%= ESO_PNJNR_ETC2_T%>'
<%
			}

			if(! ESO_PNJNRD_1_T.equals("")) {
%>
		 		ESO_PNJNRD_1='<%= ESO_PNJNRD_1_T%>'
<%
			}

			if(! ESO_PNJNRD_2_T.equals("")) {
%>
		 		ESO_PNJNRD_2='<%= ESO_PNJNRD_2_T%>'
<%
			}

			if(! ESO_PNJNRD_3_T.equals("")) {
%>
		 		ESO_PNJNRD_3='<%= ESO_PNJNRD_3_T%>'
<%
			}

			if(! ESO_PNJNRD_4_T.equals("")) {
%>
		 		ESO_PNJNRD_4='<%= ESO_PNJNRD_4_T%>'
<%
			}

			if(! ESO_PNJN_A_T.equals("")) {
%>
		 		ESO_PNJN_A='<%= ESO_PNJN_A_T%>'
<%
			}

			if(! ESO_PNJN_B_T.equals("")) {
%>
		 		ESO_PNJN_B='<%= ESO_PNJN_B_T%>'
<%
			}

			if(! ESO_PNJN_R_T.equals("")) {
%>
		 		ESO_PNJN_R='<%= ESO_PNJN_R_T%>'
<%
			}

			if(! ESO_PNJN_RD_T.equals("")) {
%>
		 		ESO_PNJN_RD='<%= ESO_PNJN_RD_T%>'
<%
			}

			if(! ESO_PNJN_ORAL_T.equals("")) {
%>
		 		ESO_PNJN_ORAL='<%= ESO_PNJN_ORAL_T%>'
<%
			}

			if(! ESO_EXAM_VIEW_T.equals("")) {
%>
		 		ESO_EXAM_VIEW='<%= ESO_EXAM_VIEW_T%>'
<%
			}

			if(! ESO_EXAM_ACT_T.equals("")) {
%>
		 		ESO_EXAM_ACT='<%= ESO_EXAM_ACT_T%>'
<%
			}

			if(! ESO_ORAL_VIEW_T.equals("")) {
%>
		 		ESO_ORAL_VIEW='<%= ESO_ORAL_VIEW_T%>'
<%
			}

			if(! ESO_ORAL_ACT_T.equals("")) {
%>
		 		ESO_ORAL_ACT='<%= ESO_ORAL_ACT_T%>'
<%
			}

			if(! ESO_EPNJN_DT_T.equals("")) {
%>
		 		ESO_EPNJN_DT='<%= ESO_EPNJN_DT_T%>'
<%
			}

			if(! ESO_OPNJN_DT_T.equals("")) {
%>
		 		ESO_OPNJN_DT='<%= ESO_OPNJN_DT_T%>'
<%
			}

			if(! ESO_EIFRM_DT_T.equals("")) {
%>
		 		ESO_EIFRM_DT='<%= ESO_EIFRM_DT_T%>'
<%
			}

			if(! ESO_OIFRM_DT_T.equals("")) {
%>
		 		ESO_OIFRM_DT='<%= ESO_OIFRM_DT_T%>'
<%
			}

			if(! ESO_EXAM_DR_T.equals("")) {
%>
		 		ESO_EXAM_DR='<%= ESO_EXAM_DR_T%>'
<%
			}

			if(! ESO_ORAL_DR_T.equals("")) {
%>
		 		ESO_ORAL_DR='<%= ESO_ORAL_DR_T%>'
<%
			}

			if(! ESO_EPNJN_YN_T.equals("")) {
%>
		 		ESO_EPNJN_YN='<%= ESO_EPNJN_YN_T%>'
<%
			}

			if(! ESO_OPNJN_YN_T.equals("")) {
%>
		 		ESO_OPNJN_YN='<%= ESO_OPNJN_YN_T%>'
<%
			}

			if(! ESO_CHUNG_YN_T.equals("")) {
%>
		 		ESO_CHUNG_YN='<%= ESO_CHUNG_YN_T%>'
<%
			}

			if(! ESO_INPT_ID_T.equals("")) {
%>
		 		ESO_INPT_ID='<%= ESO_INPT_ID_T%>'
<%
			}

			if(! ESO_INPT_DTT_T.equals("")) {
%>
		 		ESO_INPT_DTT='<%= ESO_INPT_DTT_T%>'
<%
			}

			if(! ESO_MODI_ID_T.equals("")) {
%>
		 		ESO_MODI_ID='<%= ESO_MODI_ID_T%>'
<%
			}

			if(! ESO_MODI_DTT_T.equals("")) {
%>
		 		ESO_MODI_DTT='<%= ESO_MODI_DTT_T%>'
<%
			}

			if(! ESO_PNJNB_8_T.equals("")) {
%>
		 		ESO_PNJNB_8='<%= ESO_PNJNB_8_T%>'
<%
			}

			if(! ESO_PNJNR_9_T.equals("")) {
%>
		 		ESO_PNJNR_9='<%= ESO_PNJNR_9_T%>'
<%
			}

			if(! ESO_ADD_VIEW_T.equals("")) {
%>
		 		ESO_ADD_VIEW='<%= ESO_ADD_VIEW_T%>'
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
%>
				ROWID='<%= cnt%>'
<%
			if(! c139_T.equals("")) {
%>
		 		c139='<%= c139_T%>'
<%
			}

			if(! c140_T.equals("")) {
%>
		 		c140='<%= c140_T%>'
<%
			}

			if(! c141_T.equals("")) {
%>
		 		c141='<%= c141_T%>'
<%
			}

			if(! c142_T.equals("")) {
%>
		 		c142='<%= c142_T%>'
<%
			}

			if(! c143_T.equals("")) {
%>
		 		c143='<%= c143_T%>'
<%
			}

			if(! c144_T.equals("")) {
%>
		 		c144='<%= c144_T%>'
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
