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

SELECT EEA_PLCE_CD, CASE WHEN ECL_USRL1_KD ='0' THEN '' ELSE ECL_USRL1_KD END ECL_USRL1_KD,
       CASE WHEN ECL_USRL2_KD ='0' THEN '' ELSE ECL_USRL2_KD END ECL_USRL2_KD,
       CASE WHEN ECL_USRL3_KD ='0' THEN '' ELSE ECL_USRL3_KD END ECL_USRL3_KD,
       CASE WHEN ECL_USRL4_KD ='0' THEN '' ELSE ECL_USRL4_KD END ECL_USRL4_KD,
       CASE WHEN ECL_USRL5_KD ='0' THEN '' ELSE ECL_USRL5_KD END ECL_USRL5_KD,
       CASE WHEN ECL_USRL6_KD ='0' THEN '' ELSE ECL_USRL6_KD END ECL_USRL6_KD,
       CASE WHEN ECL_USRL7_KD ='0' THEN '' ELSE ECL_USRL7_KD END ECL_USRL7_KD,
       ECL_USCN2_1_KD,
       ECL_USCN2_KD,
       ECL_USCN2_VL1,
       ECL_USCN2_VL2,
       ECL_USCN2_VL3,
       ECL_USETC_KD,
       SUBSTR(ECL_USETC_EX2,1,10) ECL_USETC_EX2,
       SUBSTR(ECL_USETC_EX,1,10) ECL_USETC_EX,
       CASE WHEN ECL_AFPTP_KD='0' THEN '' ELSE ECL_AFPTP_KD END ECL_AFPTP_KD,
       CASE WHEN ECL_AFPRT_CD='0' THEN '' ELSE ECL_AFPRT_CD END ECL_AFPRT_CD,
       ECL_AFPRT_VL ,
       CASE WHEN ECL_AFPRT_UNIT='0' THEN '' ELSE ECL_AFPRT_UNIT END  ECL_AFPRT_UNIT ,
       ECL_AFPVL_VL,
       Replace(ECL_LVEX_DT,'-','') ECL_LVEX_DT,
       CASE WHEN ECL_RSLT_KD='0' THEN '' ELSE ECL_RSLT_KD END  ECL_RSLT_KD ,
       ECL_LICN_YN,
       ECL_ETC_EX,
       ECL_RSLT_EX,
       replace(ECL_CFRM_DT,'-','') ECL_CFRM_DT,
       H.IAU_LICEN1_NO,
       H.IAU_PENL_NM,
       H.IAU_PENL_ID,
       H2.IAU_LICEN1_NO IAU_LICEN1_NO_CKUP,
       H2.IAU_PENL_NM   IAU_PENL_NM_CKUP,
       CASE WHEN F_CAN_PR(EEA_EXAM_DT,EEA_EXAM_SQ,'R0003') > 0 THEN'1' ELSE'0' END JINYN
  FROM ET_CANCER_LIVER A
       LEFT OUTER JOIN ET_EXAM_ACPT F     ON A.ECL_EXAM_DT=F.EEA_EXAM_DT AND A.ECL_EXAM_SQ=F.EEA_EXAM_SQ AND EEA_LIVER_CD > '0'
       LEFT OUTER JOIN IT_CUSTOMER  G     ON F.EEA_CUST_NO=G.ICR_CUST_NO
       LEFT OUTER JOIN IT_AUTH_USER H     ON A.ECL_LICEN_CD =H.IAU_EMP_NO
       LEFT OUTER JOIN IT_AUTH_USER H2    ON A.ECL_CKUP_LICEN_CD = H2.IAU_EMP_NO
       LEFT OUTER JOIN ET_CANCER_HEADER I ON A.ECL_EXAM_DT = I.ECH_EXAM_DT AND A.ECL_EXAM_SQ=I.ECH_EXAM_SQ
 WHERE NVL(ECL_RSLT_KD, ' ') <> ' '
   AND ECH_CFRM_CD ='2'
   AND EEA_EXAM_DT = :EXAM_DT
   AND EEA_EXAM_SQ = :EXAM_SQ
   and SUBSTR(EEA_CANAD_KD,3,1) = :CANAD_KD
		*/

		sql = " SELECT EEA_PLCE_CD";
		sql += ", CASE WHEN ECL_USRL1_KD ='0' THEN '' ELSE ECL_USRL1_KD END ECL_USRL1_KD";
		sql += ", CASE WHEN ECL_USRL2_KD ='0' THEN '' ELSE ECL_USRL2_KD END ECL_USRL2_KD";
		sql += ", CASE WHEN ECL_USRL3_KD ='0' THEN '' ELSE ECL_USRL3_KD END ECL_USRL3_KD";
		sql += ", CASE WHEN ECL_USRL4_KD ='0' THEN '' ELSE ECL_USRL4_KD END ECL_USRL4_KD";
		sql += ", CASE WHEN ECL_USRL5_KD ='0' THEN '' ELSE ECL_USRL5_KD END ECL_USRL5_KD";
		sql += ", CASE WHEN ECL_USRL6_KD ='0' THEN '' ELSE ECL_USRL6_KD END ECL_USRL6_KD";
		sql += ", CASE WHEN ECL_USRL7_KD ='0' THEN '' ELSE ECL_USRL7_KD END ECL_USRL7_KD";
		sql += ", ECL_USCN2_1_KD, ECL_USCN2_KD, ECL_USCN2_VL1, ECL_USCN2_VL2, ECL_USCN2_VL3, ECL_USETC_KD, SUBSTR(ECL_USETC_EX2,1,10) ECL_USETC_EX2, SUBSTR(ECL_USETC_EX,1,10) ECL_USETC_EX";
		sql += ", CASE WHEN ECL_AFPTP_KD='0' THEN '' ELSE ECL_AFPTP_KD END ECL_AFPTP_KD";
		sql += ", CASE WHEN ECL_AFPRT_CD='0' THEN '' ELSE ECL_AFPRT_CD END ECL_AFPRT_CD";
		sql += ", ECL_AFPRT_VL , CASE WHEN ECL_AFPRT_UNIT='0' THEN '' ELSE ECL_AFPRT_UNIT END ECL_AFPRT_UNIT , ECL_AFPVL_VL, REPLACE(ECL_LVEX_DT,'-','') ECL_LVEX_DT";
		sql += ", CASE WHEN ECL_RSLT_KD='0' THEN '' ELSE ECL_RSLT_KD END ECL_RSLT_KD";
		sql += ", ECL_LICN_YN, ECL_ETC_EX, ECL_RSLT_EX, REPLACE(ECL_CFRM_DT,'-','') ECL_CFRM_DT, H.IAU_LICEN1_NO, H.IAU_PENL_NM, H.IAU_PENL_ID, H2.IAU_LICEN1_NO IAU_LICEN1_NO_CKUP, H2.IAU_PENL_NM IAU_PENL_NM_CKUP";
		sql += ", CASE WHEN F_CAN_PR(EEA_EXAM_DT,EEA_EXAM_SQ,'R0003') > 0 THEN'1' ELSE'0' END JINYN";
		sql += " FROM ET_CANCER_LIVER A LEFT OUTER JOIN ET_EXAM_ACPT F";
		sql += " ON A.ECL_EXAM_DT=F.EEA_EXAM_DT";
		sql += " AND A.ECL_EXAM_SQ=F.EEA_EXAM_SQ";
		sql += " AND EEA_LIVER_CD > '0' LEFT OUTER JOIN IT_CUSTOMER G";
		sql += " ON F.EEA_CUST_NO=G.ICR_CUST_NO LEFT OUTER JOIN IT_AUTH_USER H";
		sql += " ON A.ECL_LICEN_CD =H.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER H2";
		sql += " ON A.ECL_CKUP_LICEN_CD = H2.IAU_EMP_NO LEFT OUTER JOIN ET_CANCER_HEADER I";
		sql += " ON A.ECL_EXAM_DT = I.ECH_EXAM_DT";
		sql += " AND A.ECL_EXAM_SQ=I.ECH_EXAM_SQ";
		sql += " WHERE NVL(ECL_RSLT_KD, ' ') <> ' '";
		sql += " AND ECH_CFRM_CD ='2'";
		sql += " AND EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SUBSTR(EEA_CANAD_KD,3,1) = '" + CANAD_KD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UChungfile2020_JSON_UDP_SELLIVER_001 \n";
			G_INFO += "설명 : 청구생성(간암) 조회 \n";
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
		<s:AttributeType name='EEA_PLCE_CD' rs:number='1' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL1_KD' rs:number='2' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USRL1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL2_KD' rs:number='3' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USRL2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL3_KD' rs:number='4' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USRL3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL4_KD' rs:number='5' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USRL4_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL5_KD' rs:number='6' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USRL5_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL6_KD' rs:number='7' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USRL6_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL7_KD' rs:number='8' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USRL7_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_1_KD' rs:number='9' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USCN2_1_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_KD' rs:number='10' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USCN2_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_VL1' rs:number='11' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USCN2_VL1'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_VL2' rs:number='12' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USCN2_VL2'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_VL3' rs:number='13' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USCN2_VL3'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USETC_KD' rs:number='14' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USETC_EX2' rs:number='15' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USETC_EX2'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USETC_EX' rs:number='16' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_USETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPTP_KD' rs:number='17' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_AFPTP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPRT_CD' rs:number='18' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_AFPRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPRT_VL' rs:number='19' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_AFPRT_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPRT_UNIT' rs:number='20' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_AFPRT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPVL_VL' rs:number='21' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_AFPVL_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_LVEX_DT' rs:number='22' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_LVEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_RSLT_KD' rs:number='23' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_LICN_YN' rs:number='24' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_LICN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_ETC_EX' rs:number='25' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_RSLT_EX' rs:number='26' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_CFRM_DT' rs:number='27' rs:nullable='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='28' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='29' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_ID' rs:number='30' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO_CKUP' rs:number='31' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM_CKUP' rs:number='32' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='JINYN' rs:number='33' rs:nullable='true'>
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

			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String ECL_USRL1_KD_T = cRsList.getString("ECL_USRL1_KD");
			String ECL_USRL2_KD_T = cRsList.getString("ECL_USRL2_KD");
			String ECL_USRL3_KD_T = cRsList.getString("ECL_USRL3_KD");
			String ECL_USRL4_KD_T = cRsList.getString("ECL_USRL4_KD");
			String ECL_USRL5_KD_T = cRsList.getString("ECL_USRL5_KD");
			String ECL_USRL6_KD_T = cRsList.getString("ECL_USRL6_KD");
			String ECL_USRL7_KD_T = cRsList.getString("ECL_USRL7_KD");
			String ECL_USCN2_1_KD_T = cRsList.getString("ECL_USCN2_1_KD");
			String ECL_USCN2_KD_T = cRsList.getString("ECL_USCN2_KD");
			String ECL_USCN2_VL1_T = cRsList.getString("ECL_USCN2_VL1");
			String ECL_USCN2_VL2_T = cRsList.getString("ECL_USCN2_VL2");
			String ECL_USCN2_VL3_T = cRsList.getString("ECL_USCN2_VL3");
			String ECL_USETC_KD_T = cRsList.getString("ECL_USETC_KD");
			String ECL_USETC_EX2_T = cRsList.getString("ECL_USETC_EX2");
			String ECL_USETC_EX_T = cRsList.getString("ECL_USETC_EX");
			String ECL_AFPTP_KD_T = cRsList.getString("ECL_AFPTP_KD");
			String ECL_AFPRT_CD_T = cRsList.getString("ECL_AFPRT_CD");
			String ECL_AFPRT_VL_T = cRsList.getString("ECL_AFPRT_VL");
			String ECL_AFPRT_UNIT_T = cRsList.getString("ECL_AFPRT_UNIT");
			String ECL_AFPVL_VL_T = cRsList.getString("ECL_AFPVL_VL");
			String ECL_LVEX_DT_T = cRsList.getString("ECL_LVEX_DT");
			String ECL_RSLT_KD_T = cRsList.getString("ECL_RSLT_KD");
			String ECL_LICN_YN_T = cRsList.getString("ECL_LICN_YN");
			String ECL_ETC_EX_T = cRsList.getString("ECL_ETC_EX");
			String ECL_RSLT_EX_T = cRsList.getString("ECL_RSLT_EX");
			String ECL_CFRM_DT_T = cRsList.getString("ECL_CFRM_DT");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_PENL_ID_T = cRsList.getString("IAU_PENL_ID");
			String IAU_LICEN1_NO_CKUP_T = cRsList.getString("IAU_LICEN1_NO_CKUP");
			String IAU_PENL_NM_CKUP_T = cRsList.getString("IAU_PENL_NM_CKUP");
			String JINYN_T = cRsList.getString("JINYN");
%>
			<z:row
<%
			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
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

			if(! ECL_USCN2_1_KD_T.equals("")) {
%>
		 		ECL_USCN2_1_KD='<%= ECL_USCN2_1_KD_T%>'
<%
			}

			if(! ECL_USCN2_KD_T.equals("")) {
%>
		 		ECL_USCN2_KD='<%= ECL_USCN2_KD_T%>'
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

			if(! ECL_USETC_KD_T.equals("")) {
%>
		 		ECL_USETC_KD='<%= ECL_USETC_KD_T%>'
<%
			}

			if(! ECL_USETC_EX2_T.equals("")) {
%>
		 		ECL_USETC_EX2='<%= ECL_USETC_EX2_T%>'
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

			if(! ECL_LVEX_DT_T.equals("")) {
%>
		 		ECL_LVEX_DT='<%= ECL_LVEX_DT_T%>'
<%
			}

			if(! ECL_RSLT_KD_T.equals("")) {
%>
		 		ECL_RSLT_KD='<%= ECL_RSLT_KD_T%>'
<%
			}

			if(! ECL_LICN_YN_T.equals("")) {
%>
		 		ECL_LICN_YN='<%= ECL_LICN_YN_T%>'
<%
			}

			if(! ECL_ETC_EX_T.equals("")) {
%>
		 		ECL_ETC_EX='<%= ECL_ETC_EX_T%>'
<%
			}

			if(! ECL_RSLT_EX_T.equals("")) {
%>
		 		ECL_RSLT_EX='<%= ECL_RSLT_EX_T%>'
<%
			}

			if(! ECL_CFRM_DT_T.equals("")) {
%>
		 		ECL_CFRM_DT='<%= ECL_CFRM_DT_T%>'
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

			if(! JINYN_T.equals("")) {
%>
		 		JINYN='<%= JINYN_T%>'
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
