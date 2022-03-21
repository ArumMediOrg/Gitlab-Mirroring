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
		String CANAD_KD = htMethod.get("CANAD_KD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CANAD_KD == null) { CANAD_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT
      ECS_GIEX_KD,
      ECS_GIRT1_KD,
      ECS_GIRT1S_KD,
      ECS_GIRT2_KD,
      ECS_GIRT2S_KD,
      ECS_GIRT3_KD,
      ECS_GIRT3S_KD,
      ECS_GIETC_KD,
      SUBSTR(ECS_GIRT_EX,1,10) ECS_GIRT_EX,
      EEA_PLCE_CD ,
      replace(ECS_GIEX_DT,'-','') ECS_GIEX_DT,
      ECS_GICM_KD,
      ECS_ENRT1_KD,
      ECS_ENRT1S_KD,
      ECS_ENRT2_KD,
      ECS_ENRT2S_KD,
      ECS_ENRT3_KD,
      ECS_ENRT3S_KD,
      ECS_ENETC_KD,
      SUBSTR(ECS_ENRT_EX,1,10) ECS_ENRT_EX,
      ECS_BIEX_YN,
      ECS_FOCP_KD ,
      ECS_BIRT_KD,
      ECS_BICT_KD,
      ECS_BICNCR_KD,
      SUBSTR(ECS_BICNCR_EX,1,10) ECS_BICNCR_EX,
      ECS_BIETC_KD,
      ECS_BIETC_EX,
      replace(ECS_ENEX_DT,'-','') ECS_ENEX_DT ,
      ECS_RSLT_KD,
      ECS_STCN_YN,
      ECS_ETC_EX,
      ECS_RSLT_EX,
      replace(ECS_CFRM_DT,'-','') ECS_CFRM_DT,
      H.IAU_LICEN1_NO,
      H.IAU_PENL_NM,
      H.IAU_PENL_ID,
      H1.IAU_LICEN1_NO IAU_LICEN1_NO_DECI,
      H1.IAU_PENL_NM   IAU_PENL_NM_DECI,
      H2.IAU_LICEN1_NO IAU_LICEN1_NO_CKUP,
      H2.IAU_PENL_NM   IAU_PENL_NM_CKUP,
      H3.IAU_LICEN1_NO IAU_LICEN1_NO_PATH,
      H3.IAU_PENL_NM   IAU_PENL_NM_PATH,
      CASE WHEN F_CAN_PR(EEA_EXAM_DT,EEA_EXAM_SQ,'R0001') > 0 THEN'1' ELSE'0' END JINGBN
 FROM ET_CANCER_STMC A
      LEFT OUTER JOIN ET_EXAM_ACPT F     ON A.ECS_EXAM_DT=F.EEA_EXAM_DT AND A.ECS_EXAM_SQ=F.EEA_EXAM_SQ AND EEA_STOMA_CD > '0'
      LEFT OUTER JOIN IT_CUSTOMER  G     ON F.EEA_CUST_NO=G.ICR_CUST_NO
      LEFT OUTER JOIN IT_AUTH_USER H     ON A.ECS_LICEN_CD = H.IAU_EMP_NO
      LEFT OUTER JOIN IT_AUTH_USER H1    ON A.ECS_DECI_LICEN_CD = H1.IAU_EMP_NO
      LEFT OUTER JOIN IT_AUTH_USER H2    ON A.ECS_CKUP_LICEN_CD = H2.IAU_EMP_NO
      LEFT OUTER JOIN IT_AUTH_USER H3    ON A.ECS_PATH_LICEN_CD = H3.IAU_EMP_NO
      LEFT OUTER JOIN ET_CANCER_HEADER I ON A.ECS_EXAM_DT  = I.ECH_EXAM_DT AND A.ECS_EXAM_SQ=I.ECH_EXAM_SQ
WHERE NVL(ECS_RSLT_KD, ' ') <> ' '
  AND ECH_CFRM_CD = '2'
  AND EEA_EXAM_DT = :EXAM_DT
  AND EEA_EXAM_SQ = :EXAM_SQ
  and SUBSTR(EEA_CANAD_KD,1,1) = :CANAD_KD

		*/

		sql = " SELECT ECS_GIEX_KD, ECS_GIRT1_KD, ECS_GIRT1S_KD, ECS_GIRT2_KD, ECS_GIRT2S_KD, ECS_GIRT3_KD, ECS_GIRT3S_KD, ECS_GIETC_KD, SUBSTR(ECS_GIRT_EX,1,10) ECS_GIRT_EX, EEA_PLCE_CD , REPLACE(ECS_GIEX_DT,'-','') ECS_GIEX_DT, ECS_GICM_KD, ECS_ENRT1_KD, ECS_ENRT1S_KD, ECS_ENRT2_KD, ECS_ENRT2S_KD, ECS_ENRT3_KD, ECS_ENRT3S_KD, ECS_ENETC_KD, SUBSTR(ECS_ENRT_EX,1,10) ECS_ENRT_EX, ECS_BIEX_YN, ECS_FOCP_KD , ECS_BIRT_KD, ECS_BICT_KD, ECS_BICNCR_KD, SUBSTR(ECS_BICNCR_EX,1,10) ECS_BICNCR_EX, ECS_BIETC_KD, ECS_BIETC_EX, REPLACE(ECS_ENEX_DT,'-','') ECS_ENEX_DT , ECS_RSLT_KD, ECS_STCN_YN, ECS_ETC_EX, ECS_RSLT_EX, REPLACE(ECS_CFRM_DT,'-','') ECS_CFRM_DT, H.IAU_LICEN1_NO, H.IAU_PENL_NM, H.IAU_PENL_ID, H1.IAU_LICEN1_NO IAU_LICEN1_NO_DECI, H1.IAU_PENL_NM IAU_PENL_NM_DECI, H2.IAU_LICEN1_NO IAU_LICEN1_NO_CKUP, H2.IAU_PENL_NM IAU_PENL_NM_CKUP, H3.IAU_LICEN1_NO IAU_LICEN1_NO_PATH, H3.IAU_PENL_NM IAU_PENL_NM_PATH";
		sql += ", CASE WHEN F_CAN_PR(EEA_EXAM_DT,EEA_EXAM_SQ,'R0001') > 0 THEN'1' ELSE'0' END JINGBN";
		sql += " FROM ET_CANCER_STMC A LEFT OUTER JOIN ET_EXAM_ACPT F";
		sql += " ON A.ECS_EXAM_DT=F.EEA_EXAM_DT";
		sql += " AND A.ECS_EXAM_SQ=F.EEA_EXAM_SQ";
		sql += " AND EEA_STOMA_CD > '0' LEFT OUTER JOIN IT_CUSTOMER G";
		sql += " ON F.EEA_CUST_NO=G.ICR_CUST_NO LEFT OUTER JOIN IT_AUTH_USER H";
		sql += " ON A.ECS_LICEN_CD = H.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER H1";
		sql += " ON A.ECS_DECI_LICEN_CD = H1.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER H2";
		sql += " ON A.ECS_CKUP_LICEN_CD = H2.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER H3";
		sql += " ON A.ECS_PATH_LICEN_CD = H3.IAU_EMP_NO LEFT OUTER JOIN ET_CANCER_HEADER I";
		sql += " ON A.ECS_EXAM_DT = I.ECH_EXAM_DT";
		sql += " AND A.ECS_EXAM_SQ=I.ECH_EXAM_SQ";
		sql += " WHERE NVL(ECS_RSLT_KD, ' ') <> ' '";
		sql += " AND ECH_CFRM_CD = '2'";
		sql += " AND EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SUBSTR(EEA_CANAD_KD,1,1) = '" + CANAD_KD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UChungfile2020_JSON_UDP_SELSTMC_001 \n";
			G_INFO += "설명 : 청구생성(위암) 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " CANAD_KD : " + CANAD_KD + " \n";
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
		<s:AttributeType name='ECS_GIEX_KD' rs:number='1' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_GIEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT1_KD' rs:number='2' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_GIRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT1S_KD' rs:number='3' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_GIRT1S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT2_KD' rs:number='4' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_GIRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT2S_KD' rs:number='5' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_GIRT2S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT3_KD' rs:number='6' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_GIRT3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT3S_KD' rs:number='7' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_GIRT3S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIETC_KD' rs:number='8' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_GIETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT_EX' rs:number='9' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_GIRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='10' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIEX_DT' rs:number='11' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_GIEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GICM_KD' rs:number='12' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_GICM_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT1_KD' rs:number='13' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_ENRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT1S_KD' rs:number='14' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_ENRT1S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT2_KD' rs:number='15' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_ENRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT2S_KD' rs:number='16' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_ENRT2S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT3_KD' rs:number='17' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_ENRT3_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT3S_KD' rs:number='18' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_ENRT3S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENETC_KD' rs:number='19' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_ENETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENRT_EX' rs:number='20' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_ENRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BIEX_YN' rs:number='21' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_BIEX_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_FOCP_KD' rs:number='22' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_FOCP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BIRT_KD' rs:number='23' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_BIRT_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BICT_KD' rs:number='24' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_BICT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BICNCR_KD' rs:number='25' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_BICNCR_KD'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BICNCR_EX' rs:number='26' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_BICNCR_EX'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BIETC_KD' rs:number='27' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_BIETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_BIETC_EX' rs:number='28' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_BIETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ENEX_DT' rs:number='29' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_ENEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_RSLT_KD' rs:number='30' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_STCN_YN' rs:number='31' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_STCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_ETC_EX' rs:number='32' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_RSLT_EX' rs:number='33' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_CFRM_DT' rs:number='34' rs:nullable='true' rs:basetable='ET_CANCER_STMC' rs:basecolumn='ECS_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='35' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='36' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_ID' rs:number='37' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO_DECI' rs:number='38' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM_DECI' rs:number='39' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO_CKUP' rs:number='40' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM_CKUP' rs:number='41' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO_PATH' rs:number='42' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM_PATH' rs:number='43' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='JINGBN' rs:number='44' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ECS_GIEX_KD_T = cRsList.getString("ECS_GIEX_KD");
			String ECS_GIRT1_KD_T = cRsList.getString("ECS_GIRT1_KD");
			String ECS_GIRT1S_KD_T = cRsList.getString("ECS_GIRT1S_KD");
			String ECS_GIRT2_KD_T = cRsList.getString("ECS_GIRT2_KD");
			String ECS_GIRT2S_KD_T = cRsList.getString("ECS_GIRT2S_KD");
			String ECS_GIRT3_KD_T = cRsList.getString("ECS_GIRT3_KD");
			String ECS_GIRT3S_KD_T = cRsList.getString("ECS_GIRT3S_KD");
			String ECS_GIETC_KD_T = cRsList.getString("ECS_GIETC_KD");
			String ECS_GIRT_EX_T = cRsList.getString("ECS_GIRT_EX");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String ECS_GIEX_DT_T = cRsList.getString("ECS_GIEX_DT");
			String ECS_GICM_KD_T = cRsList.getString("ECS_GICM_KD");
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
			String ECS_ENEX_DT_T = cRsList.getString("ECS_ENEX_DT");
			String ECS_RSLT_KD_T = cRsList.getString("ECS_RSLT_KD");
			String ECS_STCN_YN_T = cRsList.getString("ECS_STCN_YN");
			String ECS_ETC_EX_T = cRsList.getString("ECS_ETC_EX");
			String ECS_RSLT_EX_T = cRsList.getString("ECS_RSLT_EX");
			String ECS_CFRM_DT_T = cRsList.getString("ECS_CFRM_DT");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_PENL_ID_T = cRsList.getString("IAU_PENL_ID");
			String IAU_LICEN1_NO_DECI_T = cRsList.getString("IAU_LICEN1_NO_DECI");
			String IAU_PENL_NM_DECI_T = cRsList.getString("IAU_PENL_NM_DECI");
			String IAU_LICEN1_NO_CKUP_T = cRsList.getString("IAU_LICEN1_NO_CKUP");
			String IAU_PENL_NM_CKUP_T = cRsList.getString("IAU_PENL_NM_CKUP");
			String IAU_LICEN1_NO_PATH_T = cRsList.getString("IAU_LICEN1_NO_PATH");
			String IAU_PENL_NM_PATH_T = cRsList.getString("IAU_PENL_NM_PATH");
			String JINGBN_T = cRsList.getString("JINGBN");
%>
			<z:row
<%
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

			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
<%
			}

			if(! ECS_GIEX_DT_T.equals("")) {
%>
		 		ECS_GIEX_DT='<%= ECS_GIEX_DT_T%>'
<%
			}

			if(! ECS_GICM_KD_T.equals("")) {
%>
		 		ECS_GICM_KD='<%= ECS_GICM_KD_T%>'
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

			if(! ECS_ENEX_DT_T.equals("")) {
%>
		 		ECS_ENEX_DT='<%= ECS_ENEX_DT_T%>'
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

			if(! ECS_CFRM_DT_T.equals("")) {
%>
		 		ECS_CFRM_DT='<%= ECS_CFRM_DT_T%>'
<%
			}

			if(! IAU_LICEN1_NO_T.equals("")) {
%>
		 		IAU_LICEN1_NO='<%= IAU_LICEN1_NO_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! IAU_PENL_ID_T.equals("")) {
%>
		 		IAU_PENL_ID='<%= IAU_PENL_ID_T%>'
<%
			}

			if(! IAU_LICEN1_NO_DECI_T.equals("")) {
%>
		 		IAU_LICEN1_NO_DECI='<%= IAU_LICEN1_NO_DECI_T%>'
<%
			}

			if(! IAU_PENL_NM_DECI_T.equals("")) {
%>
		 		IAU_PENL_NM_DECI='<%= IAU_PENL_NM_DECI_T%>'
<%
			}

			if(! IAU_LICEN1_NO_CKUP_T.equals("")) {
%>
		 		IAU_LICEN1_NO_CKUP='<%= IAU_LICEN1_NO_CKUP_T%>'
<%
			}

			if(! IAU_PENL_NM_CKUP_T.equals("")) {
%>
		 		IAU_PENL_NM_CKUP='<%= IAU_PENL_NM_CKUP_T%>'
<%
			}

			if(! IAU_LICEN1_NO_PATH_T.equals("")) {
%>
		 		IAU_LICEN1_NO_PATH='<%= IAU_LICEN1_NO_PATH_T%>'
<%
			}

			if(! IAU_PENL_NM_PATH_T.equals("")) {
%>
		 		IAU_PENL_NM_PATH='<%= IAU_PENL_NM_PATH_T%>'
<%
			}

			if(! JINGBN_T.equals("")) {
%>
		 		JINGBN='<%= JINGBN_T%>'
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
