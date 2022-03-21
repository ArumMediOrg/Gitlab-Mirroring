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

SELECT EEA_PLCE_CD,
       CASE WHEN  ECB_MGDS_KD='0' THEN '' ELSE ECB_MGDS_KD END ECB_MGDS_KD ,
       CASE WHEN  ECB_MGPT_KD='0' THEN '' ELSE ECB_MGPT_KD END ECB_MGPT_KD ,
       CASE WHEN  ECB_MGEX_KD='0' THEN  (SELECT IHL_MMGP_KD FROM IT_HOSPITAL ) ELSE ECB_MGEX_KD END ECB_MGEX_KD,
       ECB_MGRT1_KD,
       ECB_MGRT1SR_KD,
       ECB_MGRT1R_EX,
       ECB_MGRT1SL_KD,
       ECB_MGRT1L_EX,
       ECB_MGRT2_KD,
       ECB_MGRT2SR_KD,
       ECB_MGRT2R_EX,
       ECB_MGRT2SL_KD,
       ECB_MGRT2L_EX,
       ECB_MGRT3_KD,
       ECB_MGRT3SR_KD,
       ECB_MGRT3R_EX,
       ECB_MGRT3SL_KD,
       ECB_MGRT3L_EX,
       SUBSTR(ECB_MGRT_EX,1,10) ECB_MGRT_EX,
       replace(ECB_MGEX_DT,'-','') ECB_MGEX_DT,
       ECB_RSLT_KD,
       ECB_BRCN_YN,
       ECB_RSLT_EX,
       replace(ECB_CFRM_DT,'-','') ECB_CFRM_DT,
       H.IAU_LICEN1_NO,
       H.IAU_PENL_NM,
       H.IAU_PENL_ID,
       H1.IAU_LICEN1_NO IAU_LICEN1_NO_DECI,
       H1.IAU_PENL_NM   IAU_PENL_NM_DECI,
       CASE WHEN F_CAN_PR(EEA_EXAM_DT,EEA_EXAM_SQ,'R0004') > 0 THEN'1' ELSE'0' END JINYN
  FROM ET_CANCER_BRST A
       LEFT OUTER JOIN ET_EXAM_ACPT F     ON A.ECB_EXAM_DT=F.EEA_EXAM_DT  AND A.ECB_EXAM_SQ=F.EEA_EXAM_SQ AND EEA_BAST_CD > '0'
       LEFT OUTER JOIN IT_CUSTOMER  G     ON F.EEA_CUST_NO=G.ICR_CUST_NO
       LEFT OUTER JOIN IT_AUTH_USER H     ON A.ECB_LICEN_CD =H.IAU_EMP_NO
       LEFT OUTER JOIN IT_AUTH_USER H1    ON A.ECB_DECI_LICEN_CD = H1.IAU_EMP_NO
       LEFT OUTER JOIN ET_CANCER_HEADER I ON A.ECB_EXAM_DT = I.ECH_EXAM_DT AND A.ECB_EXAM_SQ=I.ECH_EXAM_SQ
 WHERE NVL(ECB_RSLT_KD, ' ') <> ' '
   AND ECH_CFRM_CD = '2'
   AND EEA_EXAM_DT = :EXAM_DT
   AND EEA_EXAM_SQ = :EXAM_SQ
   and SUBSTR(EEA_CANAD_KD,4,1) = :CANAD_KD
		*/

		sql = " SELECT EEA_PLCE_CD";
		sql += ", CASE WHEN ECB_MGDS_KD='0' THEN '' ELSE ECB_MGDS_KD END ECB_MGDS_KD";
		sql += ", CASE WHEN ECB_MGPT_KD='0' THEN '' ELSE ECB_MGPT_KD END ECB_MGPT_KD";
		sql += ", CASE WHEN ECB_MGEX_KD='0' THEN (SELECT IHL_MMGP_KD FROM IT_HOSPITAL ) ELSE ECB_MGEX_KD END ECB_MGEX_KD";
		sql += ", ECB_MGRT1_KD, ECB_MGRT1SR_KD, ECB_MGRT1R_EX, ECB_MGRT1SL_KD, ECB_MGRT1L_EX, ECB_MGRT2_KD, ECB_MGRT2SR_KD, ECB_MGRT2R_EX, ECB_MGRT2SL_KD, ECB_MGRT2L_EX, ECB_MGRT3_KD, ECB_MGRT3SR_KD, ECB_MGRT3R_EX, ECB_MGRT3SL_KD, ECB_MGRT3L_EX, SUBSTR(ECB_MGRT_EX,1,10) ECB_MGRT_EX, REPLACE(ECB_MGEX_DT,'-','') ECB_MGEX_DT, ECB_RSLT_KD, ECB_BRCN_YN, ECB_RSLT_EX, REPLACE(ECB_CFRM_DT,'-','') ECB_CFRM_DT, H.IAU_LICEN1_NO, H.IAU_PENL_NM, H.IAU_PENL_ID, H1.IAU_LICEN1_NO IAU_LICEN1_NO_DECI, H1.IAU_PENL_NM IAU_PENL_NM_DECI";
		sql += ", CASE WHEN F_CAN_PR(EEA_EXAM_DT,EEA_EXAM_SQ,'R0004') > 0 THEN'1' ELSE'0' END JINYN";
		sql += " FROM ET_CANCER_BRST A LEFT OUTER JOIN ET_EXAM_ACPT F";
		sql += " ON A.ECB_EXAM_DT=F.EEA_EXAM_DT";
		sql += " AND A.ECB_EXAM_SQ=F.EEA_EXAM_SQ";
		sql += " AND EEA_BAST_CD > '0' LEFT OUTER JOIN IT_CUSTOMER G";
		sql += " ON F.EEA_CUST_NO=G.ICR_CUST_NO LEFT OUTER JOIN IT_AUTH_USER H";
		sql += " ON A.ECB_LICEN_CD =H.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER H1";
		sql += " ON A.ECB_DECI_LICEN_CD = H1.IAU_EMP_NO LEFT OUTER JOIN ET_CANCER_HEADER I";
		sql += " ON A.ECB_EXAM_DT = I.ECH_EXAM_DT";
		sql += " AND A.ECB_EXAM_SQ=I.ECH_EXAM_SQ";
		sql += " WHERE NVL(ECB_RSLT_KD, ' ') <> ' '";
		sql += " AND ECH_CFRM_CD = '2'";
		sql += " AND EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SUBSTR(EEA_CANAD_KD,4,1) = '" + CANAD_KD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UChungfile2020_JSON_UDP_SELBRST_001 \n";
			G_INFO += "설명 : 청구생성(유방암) 조회 \n";
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
		<s:AttributeType name='ECB_MGDS_KD' rs:number='2' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGDS_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGPT_KD' rs:number='3' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGPT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGEX_KD' rs:number='4' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1_KD' rs:number='5' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1SR_KD' rs:number='6' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT1SR_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1R_EX' rs:number='7' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT1R_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1SL_KD' rs:number='8' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT1SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1L_EX' rs:number='9' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT1L_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2_KD' rs:number='10' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2SR_KD' rs:number='11' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT2SR_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2R_EX' rs:number='12' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT2R_EX'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2SL_KD' rs:number='13' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT2SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2L_EX' rs:number='14' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT2L_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3_KD' rs:number='15' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT3_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3SR_KD' rs:number='16' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT3SR_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3R_EX' rs:number='17' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT3R_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3SL_KD' rs:number='18' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT3SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3L_EX' rs:number='19' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT3L_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT_EX' rs:number='20' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGEX_DT' rs:number='21' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_MGEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_RSLT_KD' rs:number='22' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_BRCN_YN' rs:number='23' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_BRCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_RSLT_EX' rs:number='24' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_CFRM_DT' rs:number='25' rs:nullable='true' rs:basetable='ET_CANCER_BRST' rs:basecolumn='ECB_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='26' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='27' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_ID' rs:number='28' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO_DECI' rs:number='29' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM_DECI' rs:number='30' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='JINYN' rs:number='31' rs:nullable='true'>
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
			String ECB_MGDS_KD_T = cRsList.getString("ECB_MGDS_KD");
			String ECB_MGPT_KD_T = cRsList.getString("ECB_MGPT_KD");
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
			String ECB_MGEX_DT_T = cRsList.getString("ECB_MGEX_DT");
			String ECB_RSLT_KD_T = cRsList.getString("ECB_RSLT_KD");
			String ECB_BRCN_YN_T = cRsList.getString("ECB_BRCN_YN");
			String ECB_RSLT_EX_T = cRsList.getString("ECB_RSLT_EX");
			String ECB_CFRM_DT_T = cRsList.getString("ECB_CFRM_DT");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_PENL_ID_T = cRsList.getString("IAU_PENL_ID");
			String IAU_LICEN1_NO_DECI_T = cRsList.getString("IAU_LICEN1_NO_DECI");
			String IAU_PENL_NM_DECI_T = cRsList.getString("IAU_PENL_NM_DECI");
			String JINYN_T = cRsList.getString("JINYN");
%>
			<z:row
<%
			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
<%
			}

			if(! ECB_MGDS_KD_T.equals("")) {
%>
		 		ECB_MGDS_KD='<%= ECB_MGDS_KD_T%>'
<%
			}

			if(! ECB_MGPT_KD_T.equals("")) {
%>
		 		ECB_MGPT_KD='<%= ECB_MGPT_KD_T%>'
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

			if(! ECB_MGEX_DT_T.equals("")) {
%>
		 		ECB_MGEX_DT='<%= ECB_MGEX_DT_T%>'
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

			if(! ECB_CFRM_DT_T.equals("")) {
%>
		 		ECB_CFRM_DT='<%= ECB_CFRM_DT_T%>'
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
