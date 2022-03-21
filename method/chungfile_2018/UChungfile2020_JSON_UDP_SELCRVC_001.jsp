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
       CASE WHEN ECV_CVSP1_KD='0' THEN '' ELSE ECV_CVSP1_KD END  ECV_CVSP1_KD,
       CASE WHEN ECV_CELL1_KD='0' THEN '' ELSE ECV_CELL1_KD END  ECV_CELL1_KD,
       CASE WHEN ECV_CVRT1_KD='0' THEN '' ELSE ECV_CVRT1_KD END  ECV_CVRT1_KD,
       CASE WHEN ECV_SQRT1_KD='0' THEN '' ELSE ECV_SQRT1_KD END  ECV_SQRT1_KD,
       CASE WHEN ECV_NHRT1_KD='0' THEN '' ELSE ECV_NHRT1_KD END  ECV_NHRT1_KD,
       CASE WHEN ECV_EPRT1_KD='0' THEN '' ELSE ECV_EPRT1_KD END  ECV_EPRT1_KD,
       CASE WHEN ECV_NHEP1_KD='0' THEN '' ELSE ECV_NHEP1_KD END  ECV_NHEP1_KD,
       ECV_EPET1_EX,
       ECV_RTET1_EX,
       CASE WHEN ECV_ETCRT1_KD='0' THEN '' ELSE ECV_ETCRT1_KD END  ECV_ETCRT1_KD,
       ECV_ETCEX1_EX,
       ECV_DBCV_KD,
       CASE WHEN ECV_CVSP2_KD='0' THEN '' ELSE ECV_CVSP2_KD END  ECV_CVSP2_KD,
       CASE WHEN ECV_CELL2_KD='0' THEN '' ELSE ECV_CELL2_KD END  ECV_CELL2_KD,
       CASE WHEN ECV_CVRT2_KD='0' THEN '' ELSE ECV_CVRT2_KD END  ECV_CVRT2_KD,
       CASE WHEN ECV_SQRT2_KD='0' THEN '' ELSE ECV_SQRT2_KD END  ECV_SQRT2_KD,
       CASE WHEN ECV_NHRT2_KD='0' THEN '' ELSE ECV_NHRT2_KD END  ECV_NHRT2_KD,
       CASE WHEN ECV_EPRT2_KD='0' THEN '' ELSE ECV_EPRT2_KD END  ECV_EPRT2_KD,
       CASE WHEN ECV_NHEP2_KD='0' THEN '' ELSE ECV_NHEP2_KD END  ECV_NHEP2_KD,
       ECV_EPET2_EX,
       ECV_RTET2_EX,
       CASE WHEN ECV_ETCRT2_KD='0' THEN '' ELSE ECV_ETCRT2_KD END ECV_ETCRT2_KD,
       ECV_ETCEX2_EX,
       replace(ECV_CVEX_DT,'-','') ECV_CVEX_DT,
       ECV_RSLT_KD,
       ECV_CVCN_YN,
       ECV_ETC_EX,
       ECV_RSLT_EX,
       replace(ECV_CFRM_DT,'-','')ECV_CFRM_DT,
       H.IAU_LICEN1_NO,
       H.IAU_PENL_NM,
       H.IAU_PENL_ID,
       H2.IAU_LICEN1_NO IAU_LICEN1_NO_COLL,
       H2.IAU_PENL_NM   IAU_PENL_NM_COLL,
       H3.IAU_LICEN1_NO IAU_LICEN1_NO_PATH,
       H3.IAU_PENL_NM   IAU_PENL_NM_PATH,
       CASE WHEN F_CAN_PR(EEA_EXAM_DT,EEA_EXAM_SQ,'R0005') > 0 THEN'1' ELSE'0' END JINYN
  FROM ET_CANCER_CRVC A
       LEFT OUTER JOIN ET_EXAM_ACPT F     ON A.ECV_EXAM_DT=F.EEA_EXAM_DT AND A.ECV_EXAM_SQ=F.EEA_EXAM_SQ  AND EEA_UTER_CD > '0'
       LEFT OUTER JOIN IT_CUSTOMER  G     ON F.EEA_CUST_NO=G.ICR_CUST_NO
       LEFT OUTER JOIN IT_AUTH_USER H     ON A.ECV_LICEN_CD =H.IAU_EMP_NO
       LEFT OUTER JOIN IT_AUTH_USER H2    ON A.ECV_COLL_LICEN_CD = H2.IAU_EMP_NO
       LEFT OUTER JOIN IT_AUTH_USER H3    ON A.ECV_PATH_LICEN_CD = H3.IAU_EMP_NO
       LEFT OUTER JOIN ET_CANCER_HEADER I ON A.ECV_EXAM_DT = I.ECH_EXAM_DT AND A.ECV_EXAM_SQ=I.ECH_EXAM_SQ
 WHERE NVL(ECV_RSLT_KD, ' ') <> ' '
   AND ECH_CFRM_CD = '2'
   AND EEA_EXAM_DT = :EXAM_DT
   AND EEA_EXAM_SQ = :EXAM_SQ
   and SUBSTR(EEA_CANAD_KD,5,1) = :CANAD_KD

		*/

		sql = " SELECT EEA_PLCE_CD";
		sql += ", CASE WHEN ECV_CVSP1_KD='0' THEN '' ELSE ECV_CVSP1_KD END ECV_CVSP1_KD";
		sql += ", CASE WHEN ECV_CELL1_KD='0' THEN '' ELSE ECV_CELL1_KD END ECV_CELL1_KD";
		sql += ", CASE WHEN ECV_CVRT1_KD='0' THEN '' ELSE ECV_CVRT1_KD END ECV_CVRT1_KD";
		sql += ", CASE WHEN ECV_SQRT1_KD='0' THEN '' ELSE ECV_SQRT1_KD END ECV_SQRT1_KD";
		sql += ", CASE WHEN ECV_NHRT1_KD='0' THEN '' ELSE ECV_NHRT1_KD END ECV_NHRT1_KD";
		sql += ", CASE WHEN ECV_EPRT1_KD='0' THEN '' ELSE ECV_EPRT1_KD END ECV_EPRT1_KD";
		sql += ", CASE WHEN ECV_NHEP1_KD='0' THEN '' ELSE ECV_NHEP1_KD END ECV_NHEP1_KD";
		sql += ", ECV_EPET1_EX, ECV_RTET1_EX";
		sql += ", CASE WHEN ECV_ETCRT1_KD='0' THEN '' ELSE ECV_ETCRT1_KD END ECV_ETCRT1_KD";
		sql += ", ECV_ETCEX1_EX, ECV_DBCV_KD";
		sql += ", CASE WHEN ECV_CVSP2_KD='0' THEN '' ELSE ECV_CVSP2_KD END ECV_CVSP2_KD";
		sql += ", CASE WHEN ECV_CELL2_KD='0' THEN '' ELSE ECV_CELL2_KD END ECV_CELL2_KD";
		sql += ", CASE WHEN ECV_CVRT2_KD='0' THEN '' ELSE ECV_CVRT2_KD END ECV_CVRT2_KD";
		sql += ", CASE WHEN ECV_SQRT2_KD='0' THEN '' ELSE ECV_SQRT2_KD END ECV_SQRT2_KD";
		sql += ", CASE WHEN ECV_NHRT2_KD='0' THEN '' ELSE ECV_NHRT2_KD END ECV_NHRT2_KD";
		sql += ", CASE WHEN ECV_EPRT2_KD='0' THEN '' ELSE ECV_EPRT2_KD END ECV_EPRT2_KD";
		sql += ", CASE WHEN ECV_NHEP2_KD='0' THEN '' ELSE ECV_NHEP2_KD END ECV_NHEP2_KD";
		sql += ", ECV_EPET2_EX, ECV_RTET2_EX";
		sql += ", CASE WHEN ECV_ETCRT2_KD='0' THEN '' ELSE ECV_ETCRT2_KD END ECV_ETCRT2_KD";
		sql += ", ECV_ETCEX2_EX, REPLACE(ECV_CVEX_DT,'-','') ECV_CVEX_DT, ECV_RSLT_KD, ECV_CVCN_YN, ECV_ETC_EX, ECV_RSLT_EX, REPLACE(ECV_CFRM_DT,'-','')ECV_CFRM_DT, H.IAU_LICEN1_NO, H.IAU_PENL_NM, H.IAU_PENL_ID, H2.IAU_LICEN1_NO IAU_LICEN1_NO_COLL, H2.IAU_PENL_NM IAU_PENL_NM_COLL, H3.IAU_LICEN1_NO IAU_LICEN1_NO_PATH, H3.IAU_PENL_NM IAU_PENL_NM_PATH";
		sql += ", CASE WHEN F_CAN_PR(EEA_EXAM_DT,EEA_EXAM_SQ,'R0005') > 0 THEN'1' ELSE'0' END JINYN";
		sql += " FROM ET_CANCER_CRVC A LEFT OUTER JOIN ET_EXAM_ACPT F";
		sql += " ON A.ECV_EXAM_DT=F.EEA_EXAM_DT";
		sql += " AND A.ECV_EXAM_SQ=F.EEA_EXAM_SQ";
		sql += " AND EEA_UTER_CD > '0' LEFT OUTER JOIN IT_CUSTOMER G";
		sql += " ON F.EEA_CUST_NO=G.ICR_CUST_NO LEFT OUTER JOIN IT_AUTH_USER H";
		sql += " ON A.ECV_LICEN_CD =H.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER H2";
		sql += " ON A.ECV_COLL_LICEN_CD = H2.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER H3";
		sql += " ON A.ECV_PATH_LICEN_CD = H3.IAU_EMP_NO LEFT OUTER JOIN ET_CANCER_HEADER I";
		sql += " ON A.ECV_EXAM_DT = I.ECH_EXAM_DT";
		sql += " AND A.ECV_EXAM_SQ=I.ECH_EXAM_SQ";
		sql += " WHERE NVL(ECV_RSLT_KD, ' ') <> ' '";
		sql += " AND ECH_CFRM_CD = '2'";
		sql += " AND EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SUBSTR(EEA_CANAD_KD,5,1) = '" + CANAD_KD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UChungfile2020_JSON_UDP_SELCRVC_001 \n";
			G_INFO += "설명 : 청구생성(자궁암) 조회 \n";
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
		<s:AttributeType name='ECV_CVSP1_KD' rs:number='2' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_CVSP1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CELL1_KD' rs:number='3' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_CELL1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVRT1_KD' rs:number='4' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_CVRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_SQRT1_KD' rs:number='5' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_SQRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHRT1_KD' rs:number='6' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_NHRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPRT1_KD' rs:number='7' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_EPRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHEP1_KD' rs:number='8' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_NHEP1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPET1_EX' rs:number='9' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_EPET1_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RTET1_EX' rs:number='10' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_RTET1_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCRT1_KD' rs:number='11' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_ETCRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCEX1_EX' rs:number='12' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_ETCEX1_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_DBCV_KD' rs:number='13' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_DBCV_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVSP2_KD' rs:number='14' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_CVSP2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CELL2_KD' rs:number='15' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_CELL2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVRT2_KD' rs:number='16' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_CVRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_SQRT2_KD' rs:number='17' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_SQRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHRT2_KD' rs:number='18' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_NHRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPRT2_KD' rs:number='19' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_EPRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_NHEP2_KD' rs:number='20' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_NHEP2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_EPET2_EX' rs:number='21' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_EPET2_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RTET2_EX' rs:number='22' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_RTET2_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCRT2_KD' rs:number='23' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_ETCRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETCEX2_EX' rs:number='24' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_ETCEX2_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVEX_DT' rs:number='25' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_CVEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RSLT_KD' rs:number='26' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVCN_YN' rs:number='27' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_CVCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_ETC_EX' rs:number='28' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RSLT_EX' rs:number='29' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CFRM_DT' rs:number='30' rs:nullable='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ECV_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='31' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='32' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_ID' rs:number='33' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO_COLL' rs:number='34' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM_COLL' rs:number='35' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO_PATH' rs:number='36' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM_PATH' rs:number='37' rs:nullable='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='JINYN' rs:number='38' rs:nullable='true'>
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
			String ECV_CVSP1_KD_T = cRsList.getString("ECV_CVSP1_KD");
			String ECV_CELL1_KD_T = cRsList.getString("ECV_CELL1_KD");
			String ECV_CVRT1_KD_T = cRsList.getString("ECV_CVRT1_KD");
			String ECV_SQRT1_KD_T = cRsList.getString("ECV_SQRT1_KD");
			String ECV_NHRT1_KD_T = cRsList.getString("ECV_NHRT1_KD");
			String ECV_EPRT1_KD_T = cRsList.getString("ECV_EPRT1_KD");
			String ECV_NHEP1_KD_T = cRsList.getString("ECV_NHEP1_KD");
			String ECV_EPET1_EX_T = cRsList.getString("ECV_EPET1_EX");
			String ECV_RTET1_EX_T = cRsList.getString("ECV_RTET1_EX");
			String ECV_ETCRT1_KD_T = cRsList.getString("ECV_ETCRT1_KD");
			String ECV_ETCEX1_EX_T = cRsList.getString("ECV_ETCEX1_EX");
			String ECV_DBCV_KD_T = cRsList.getString("ECV_DBCV_KD");
			String ECV_CVSP2_KD_T = cRsList.getString("ECV_CVSP2_KD");
			String ECV_CELL2_KD_T = cRsList.getString("ECV_CELL2_KD");
			String ECV_CVRT2_KD_T = cRsList.getString("ECV_CVRT2_KD");
			String ECV_SQRT2_KD_T = cRsList.getString("ECV_SQRT2_KD");
			String ECV_NHRT2_KD_T = cRsList.getString("ECV_NHRT2_KD");
			String ECV_EPRT2_KD_T = cRsList.getString("ECV_EPRT2_KD");
			String ECV_NHEP2_KD_T = cRsList.getString("ECV_NHEP2_KD");
			String ECV_EPET2_EX_T = cRsList.getString("ECV_EPET2_EX");
			String ECV_RTET2_EX_T = cRsList.getString("ECV_RTET2_EX");
			String ECV_ETCRT2_KD_T = cRsList.getString("ECV_ETCRT2_KD");
			String ECV_ETCEX2_EX_T = cRsList.getString("ECV_ETCEX2_EX");
			String ECV_CVEX_DT_T = cRsList.getString("ECV_CVEX_DT");
			String ECV_RSLT_KD_T = cRsList.getString("ECV_RSLT_KD");
			String ECV_CVCN_YN_T = cRsList.getString("ECV_CVCN_YN");
			String ECV_ETC_EX_T = cRsList.getString("ECV_ETC_EX");
			String ECV_RSLT_EX_T = cRsList.getString("ECV_RSLT_EX");
			String ECV_CFRM_DT_T = cRsList.getString("ECV_CFRM_DT");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_PENL_ID_T = cRsList.getString("IAU_PENL_ID");
			String IAU_LICEN1_NO_COLL_T = cRsList.getString("IAU_LICEN1_NO_COLL");
			String IAU_PENL_NM_COLL_T = cRsList.getString("IAU_PENL_NM_COLL");
			String IAU_LICEN1_NO_PATH_T = cRsList.getString("IAU_LICEN1_NO_PATH");
			String IAU_PENL_NM_PATH_T = cRsList.getString("IAU_PENL_NM_PATH");
			String JINYN_T = cRsList.getString("JINYN");
%>
			<z:row
<%
			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
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

			if(! ECV_NHEP1_KD_T.equals("")) {
%>
		 		ECV_NHEP1_KD='<%= ECV_NHEP1_KD_T%>'
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

			if(! ECV_DBCV_KD_T.equals("")) {
%>
		 		ECV_DBCV_KD='<%= ECV_DBCV_KD_T%>'
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

			if(! ECV_NHEP2_KD_T.equals("")) {
%>
		 		ECV_NHEP2_KD='<%= ECV_NHEP2_KD_T%>'
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

			if(! ECV_CVEX_DT_T.equals("")) {
%>
		 		ECV_CVEX_DT='<%= ECV_CVEX_DT_T%>'
<%
			}

			if(! ECV_RSLT_KD_T.equals("")) {
%>
		 		ECV_RSLT_KD='<%= ECV_RSLT_KD_T%>'
<%
			}

			if(! ECV_CVCN_YN_T.equals("")) {
%>
		 		ECV_CVCN_YN='<%= ECV_CVCN_YN_T%>'
<%
			}

			if(! ECV_ETC_EX_T.equals("")) {
%>
		 		ECV_ETC_EX='<%= ECV_ETC_EX_T%>'
<%
			}

			if(! ECV_RSLT_EX_T.equals("")) {
%>
		 		ECV_RSLT_EX='<%= ECV_RSLT_EX_T%>'
<%
			}

			if(! ECV_CFRM_DT_T.equals("")) {
%>
		 		ECV_CFRM_DT='<%= ECV_CFRM_DT_T%>'
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

			if(! IAU_LICEN1_NO_COLL_T.equals("")) {
%>
		 		IAU_LICEN1_NO_COLL='<%= IAU_LICEN1_NO_COLL_T%>'
<%
			}

			if(! IAU_PENL_NM_COLL_T.equals("")) {
%>
		 		IAU_PENL_NM_COLL='<%= IAU_PENL_NM_COLL_T%>'
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
