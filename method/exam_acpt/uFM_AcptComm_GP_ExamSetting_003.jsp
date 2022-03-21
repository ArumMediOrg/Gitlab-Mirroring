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
		String ITEM_KD = htMethod.get("ITEM_KD");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String HTPR_DT = htMethod.get("HTPR_DT");
		String PRCE_CD = htMethod.get("PRCE_CD");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(ITEM_KD == null) { ITEM_KD = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(HTPR_DT == null) { HTPR_DT = ""; }
		if(PRCE_CD == null) { PRCE_CD = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT SUBSTR(:EXAM_DT, 1, 4) EXAM_YR, LTRIM(RTRIM(A.IIM_ITEM_CD)) EXAM_CD, '' EXAM_SQ, 
       LTRIM(RTRIM(A.IIM_ITEM_CD)) EXAM_DP, LTRIM(RTRIM(A.IIM_KNME_NM)) EXAM_NM, 

IF (:ITEM_KD = '91') THEN 
       A.IIM_GBHC_KD GBHC_KD,
ELSE
BEGIN
  IF (SUBSTR(:EXAM_DT, 1, 4) >= '2018') THEN
       F_ITEM_CALL('H', SUBSTR(:EXAM_DT, 1, 4), A.IIM_ITEM_CD) AS GBHC_KD,
  ELSE
       A.IIM_GBHC_KD GBHC_KD,
END;

       A.IIM_CANCER_CD CAN_CD, '' EXAM_YN,
       CASE WHEN :ITEM_KD = '91' OR SUBSTR(:EXAM_CD, 1, 1) = '1' THEN :HTPR_DT
                                                                         ELSE :EXAM_DT END AS PRCE_DT, 
       :PRCE_CD CALC_CD, A.IIM_ITEM_CD ITEM_LT,
       CASE :PRCE_CD WHEN '1'  THEN B.IIP_JCSG_PR
                         WHEN '2'  THEN B.IIP_HESG_PR
                         WHEN '3'  THEN B.IIP_GBSG_PR
                         WHEN '4'  THEN B.IIP_SBSG_PR
                         WHEN '5'  THEN B.IIP_TGSG_PR 
                         ELSE B.IIP_JCSG_PR 
       END AS EXAM_PR,
       0    SALE_PR, 0    GRUP_PR, 0    COUP_PR, 0 FAMY_PR, 0 CUPN_PR, 0 MMBR_PR, 0 OPTN_PR,
       B.IIP_JCSG_PR JCSG_PR, B.IIP_HESG_PR HESG_PR, B.IIP_GBSG_PR GBSG_PR, 
       B.IIP_SBSG_PR SBSG_PR, B.IIP_TGSG_PR TGSG_PR,
       'N' HTSB_YN, 'N' SPSB_YN, 'N' CVSB_YN, 'N' ETSB_YN, 'N' EMSB_YN,
       ''  HTPR_CD, ''  SPPR_CD, ''  CVPR_CD, ''  ETPR_CD,  '' EMPR_CD,
       '9' CNCL_CD, 'N' OPTN_YN, '0' EXAM_KD, ''  PACK_RMK, '' SALE_ID,
       '1' PYER_CD, '9' CMPY_CD, '3' PRPY_CD, 'N' UBEH_YN
  FROM IT_ITEM A, IT_ITEM_PRICE B
 WHERE 1 = 1
 :PARAM_TX1
 :PARAM_TX2
		*/

		sql = " SELECT SUBSTR('" + EXAM_DT + "', 1, 4) EXAM_YR, LTRIM(RTRIM(A.IIM_ITEM_CD)) EXAM_CD, '' EXAM_SQ, LTRIM(RTRIM(A.IIM_ITEM_CD)) EXAM_DP, LTRIM(RTRIM(A.IIM_KNME_NM)) EXAM_NM";

		if(ITEM_KD.equals("91")) {
			sql += ", A.IIM_GBHC_KD GBHC_KD";
		} else {
			if(EXAM_DT.substring(0, 4).compareTo("2018") >= 0) {
				sql += ", F_ITEM_CALL('H', SUBSTR('" + EXAM_DT + "', 1, 4), A.IIM_ITEM_CD) AS GBHC_KD";
			} else {
				sql += ", A.IIM_GBHC_KD GBHC_KD";
			}
		}

		sql += ", A.IIM_CANCER_CD CAN_CD, '' EXAM_YN";
		sql += ", CASE WHEN '" + ITEM_KD + "' = '91' OR SUBSTR('" + EXAM_CD + "', 1, 1) = '1' THEN '" + HTPR_DT + "' ELSE '" + EXAM_DT + "' END AS PRCE_DT";
		sql += ", '" + PRCE_CD + "' CALC_CD, A.IIM_ITEM_CD ITEM_LT";
		sql += ", CASE '" + PRCE_CD + "' WHEN '1' THEN B.IIP_JCSG_PR WHEN '2' THEN B.IIP_HESG_PR WHEN '3' THEN B.IIP_GBSG_PR WHEN '4' THEN B.IIP_SBSG_PR WHEN '5' THEN B.IIP_TGSG_PR ELSE B.IIP_JCSG_PR END AS EXAM_PR";
		sql += ", 0 SALE_PR, 0 GRUP_PR, 0 COUP_PR, 0 FAMY_PR, 0 CUPN_PR, 0 MMBR_PR, 0 OPTN_PR, B.IIP_JCSG_PR JCSG_PR, B.IIP_HESG_PR HESG_PR, B.IIP_GBSG_PR GBSG_PR, B.IIP_SBSG_PR SBSG_PR, B.IIP_TGSG_PR TGSG_PR, 'N' HTSB_YN, 'N' SPSB_YN, 'N' CVSB_YN, 'N' ETSB_YN, 'N' EMSB_YN, '' HTPR_CD, '' SPPR_CD, '' CVPR_CD, '' ETPR_CD, '' EMPR_CD, '9' CNCL_CD, 'N' OPTN_YN, '0' EXAM_KD, '' PACK_RMK, '' SALE_ID, '1' PYER_CD, '9' CMPY_CD, '3' PRPY_CD, 'N' UBEH_YN";
		sql += " FROM IT_ITEM A, IT_ITEM_PRICE B";
		sql += " WHERE 1 = 1 ";
		sql += " " + PARAM_TX1;
		sql += " " + PARAM_TX2;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamSetting_003 \n";
			G_INFO += "설명 : 개별항목 및 2018이전 암검진 유형별 세팅 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " ITEM_KD : " + ITEM_KD + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " HTPR_DT : " + HTPR_DT + " \n";
			G_INFO += " PRCE_CD : " + PRCE_CD + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
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
		<s:AttributeType name='EXAM_YR' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_CD' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_SQ' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_DP' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='GBHC_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_GBHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='16'/>
		</s:AttributeType>
		<s:AttributeType name='CAN_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_CANCER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_YN' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PRCE_DT' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CALC_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_LT' rs:number='11'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_PR' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SALE_PR' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='GRUP_PR' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='COUP_PR' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='FAMY_PR' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CUPN_PR' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='MMBR_PR' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='IIP_JCSG_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_PR' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='IIP_HESG_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='JCSG_PR' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='IIP_GBSG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='HESG_PR' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='IIP_SBSG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='GBSG_PR' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='IIP_TGSG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SBSG_PR' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='TGSG_PR' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='HTSB_YN' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPSB_YN' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CVSB_YN' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ETSB_YN' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EMSB_YN' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='HTPR_CD' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPPR_CD' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CVPR_CD' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ETPR_CD' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EMPR_CD' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CNCL_CD' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_YN' rs:number='36' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_KD' rs:number='37' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PACK_RMK' rs:number='38' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SALE_ID' rs:number='39' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PYER_CD' rs:number='40' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CMPY_CD' rs:number='41' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PRPY_CD' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='UBEH_YN' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='44' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c44' rs:name='ROWID' rs:number='45' rs:rowid='true' rs:hidden='true'>
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

			String EXAM_YR_T = cRsList.getString("EXAM_YR");
			String EXAM_CD_T = cRsList.getString("EXAM_CD");
			String EXAM_SQ_T = cRsList.getString("EXAM_SQ");
			String EXAM_DP_T = cRsList.getString("EXAM_DP");
			String EXAM_NM_T = cRsList.getString("EXAM_NM");
			String GBHC_KD_T = cRsList.getString("GBHC_KD");
			String CAN_CD_T = cRsList.getString("CAN_CD");
			String EXAM_YN_T = cRsList.getString("EXAM_YN");
			String PRCE_DT_T = cRsList.getString("PRCE_DT");
			String CALC_CD_T = cRsList.getString("CALC_CD");
			String ITEM_LT_T = cRsList.getString("ITEM_LT");
			String EXAM_PR_T = cRsList.getString("EXAM_PR");
			String SALE_PR_T = cRsList.getString("SALE_PR");
			String GRUP_PR_T = cRsList.getString("GRUP_PR");
			String COUP_PR_T = cRsList.getString("COUP_PR");
			String FAMY_PR_T = cRsList.getString("FAMY_PR");
			String CUPN_PR_T = cRsList.getString("CUPN_PR");
			String MMBR_PR_T = cRsList.getString("MMBR_PR");
			String OPTN_PR_T = cRsList.getString("OPTN_PR");
			String JCSG_PR_T = cRsList.getString("JCSG_PR");
			String HESG_PR_T = cRsList.getString("HESG_PR");
			String GBSG_PR_T = cRsList.getString("GBSG_PR");
			String SBSG_PR_T = cRsList.getString("SBSG_PR");
			String TGSG_PR_T = cRsList.getString("TGSG_PR");
			String HTSB_YN_T = cRsList.getString("HTSB_YN");
			String SPSB_YN_T = cRsList.getString("SPSB_YN");
			String CVSB_YN_T = cRsList.getString("CVSB_YN");
			String ETSB_YN_T = cRsList.getString("ETSB_YN");
			String EMSB_YN_T = cRsList.getString("EMSB_YN");
			String HTPR_CD_T = cRsList.getString("HTPR_CD");
			String SPPR_CD_T = cRsList.getString("SPPR_CD");
			String CVPR_CD_T = cRsList.getString("CVPR_CD");
			String ETPR_CD_T = cRsList.getString("ETPR_CD");
			String EMPR_CD_T = cRsList.getString("EMPR_CD");
			String CNCL_CD_T = cRsList.getString("CNCL_CD");
			String OPTN_YN_T = cRsList.getString("OPTN_YN");
			String EXAM_KD_T = cRsList.getString("EXAM_KD");
			String PACK_RMK_T = cRsList.getString("PACK_RMK");
			String SALE_ID_T = cRsList.getString("SALE_ID");
			String PYER_CD_T = cRsList.getString("PYER_CD");
			String CMPY_CD_T = cRsList.getString("CMPY_CD");
			String PRPY_CD_T = cRsList.getString("PRPY_CD");
			String UBEH_YN_T = cRsList.getString("UBEH_YN");
			String ROWID_T = cRsList.getString("ROWID");
			String c44_T = cRsList.getString("c44");
%>
			<z:row
<%
			if(! EXAM_YR_T.equals("")) {
%>
		 		EXAM_YR='<%= EXAM_YR_T%>'
<%
			}

			if(! EXAM_CD_T.equals("")) {
%>
		 		EXAM_CD='<%= EXAM_CD_T%>'
<%
			}

			if(! EXAM_SQ_T.equals("")) {
%>
		 		EXAM_SQ='<%= EXAM_SQ_T%>'
<%
			}

			if(! EXAM_DP_T.equals("")) {
%>
		 		EXAM_DP='<%= EXAM_DP_T%>'
<%
			}

			if(! EXAM_NM_T.equals("")) {
%>
		 		EXAM_NM='<%= EXAM_NM_T%>'
<%
			}

			if(! GBHC_KD_T.equals("")) {
%>
		 		GBHC_KD='<%= GBHC_KD_T%>'
<%
			}

			if(! CAN_CD_T.equals("")) {
%>
		 		CAN_CD='<%= CAN_CD_T%>'
<%
			}

			if(! EXAM_YN_T.equals("")) {
%>
		 		EXAM_YN='<%= EXAM_YN_T%>'
<%
			}

			if(! PRCE_DT_T.equals("")) {
%>
		 		PRCE_DT='<%= PRCE_DT_T%>'
<%
			}

			if(! CALC_CD_T.equals("")) {
%>
		 		CALC_CD='<%= CALC_CD_T%>'
<%
			}

			if(! ITEM_LT_T.equals("")) {
%>
		 		ITEM_LT='<%= ITEM_LT_T%>'
<%
			}

			if(! EXAM_PR_T.equals("")) {
%>
		 		EXAM_PR='<%= EXAM_PR_T%>'
<%
			}

			if(! SALE_PR_T.equals("")) {
%>
		 		SALE_PR='<%= SALE_PR_T%>'
<%
			}

			if(! GRUP_PR_T.equals("")) {
%>
		 		GRUP_PR='<%= GRUP_PR_T%>'
<%
			}

			if(! COUP_PR_T.equals("")) {
%>
		 		COUP_PR='<%= COUP_PR_T%>'
<%
			}

			if(! FAMY_PR_T.equals("")) {
%>
		 		FAMY_PR='<%= FAMY_PR_T%>'
<%
			}

			if(! CUPN_PR_T.equals("")) {
%>
		 		CUPN_PR='<%= CUPN_PR_T%>'
<%
			}

			if(! MMBR_PR_T.equals("")) {
%>
		 		MMBR_PR='<%= MMBR_PR_T%>'
<%
			}

			if(! OPTN_PR_T.equals("")) {
%>
		 		OPTN_PR='<%= OPTN_PR_T%>'
<%
			}

			if(! JCSG_PR_T.equals("")) {
%>
		 		JCSG_PR='<%= JCSG_PR_T%>'
<%
			}

			if(! HESG_PR_T.equals("")) {
%>
		 		HESG_PR='<%= HESG_PR_T%>'
<%
			}

			if(! GBSG_PR_T.equals("")) {
%>
		 		GBSG_PR='<%= GBSG_PR_T%>'
<%
			}

			if(! SBSG_PR_T.equals("")) {
%>
		 		SBSG_PR='<%= SBSG_PR_T%>'
<%
			}

			if(! TGSG_PR_T.equals("")) {
%>
		 		TGSG_PR='<%= TGSG_PR_T%>'
<%
			}

			if(! HTSB_YN_T.equals("")) {
%>
		 		HTSB_YN='<%= HTSB_YN_T%>'
<%
			}

			if(! SPSB_YN_T.equals("")) {
%>
		 		SPSB_YN='<%= SPSB_YN_T%>'
<%
			}

			if(! CVSB_YN_T.equals("")) {
%>
		 		CVSB_YN='<%= CVSB_YN_T%>'
<%
			}

			if(! ETSB_YN_T.equals("")) {
%>
		 		ETSB_YN='<%= ETSB_YN_T%>'
<%
			}

			if(! EMSB_YN_T.equals("")) {
%>
		 		EMSB_YN='<%= EMSB_YN_T%>'
<%
			}

			if(! HTPR_CD_T.equals("")) {
%>
		 		HTPR_CD='<%= HTPR_CD_T%>'
<%
			}

			if(! SPPR_CD_T.equals("")) {
%>
		 		SPPR_CD='<%= SPPR_CD_T%>'
<%
			}

			if(! CVPR_CD_T.equals("")) {
%>
		 		CVPR_CD='<%= CVPR_CD_T%>'
<%
			}

			if(! ETPR_CD_T.equals("")) {
%>
		 		ETPR_CD='<%= ETPR_CD_T%>'
<%
			}

			if(! EMPR_CD_T.equals("")) {
%>
		 		EMPR_CD='<%= EMPR_CD_T%>'
<%
			}

			if(! CNCL_CD_T.equals("")) {
%>
		 		CNCL_CD='<%= CNCL_CD_T%>'
<%
			}

			if(! OPTN_YN_T.equals("")) {
%>
		 		OPTN_YN='<%= OPTN_YN_T%>'
<%
			}

			if(! EXAM_KD_T.equals("")) {
%>
		 		EXAM_KD='<%= EXAM_KD_T%>'
<%
			}

			if(! PACK_RMK_T.equals("")) {
%>
		 		PACK_RMK='<%= PACK_RMK_T%>'
<%
			}

			if(! SALE_ID_T.equals("")) {
%>
		 		SALE_ID='<%= SALE_ID_T%>'
<%
			}

			if(! PYER_CD_T.equals("")) {
%>
		 		PYER_CD='<%= PYER_CD_T%>'
<%
			}

			if(! CMPY_CD_T.equals("")) {
%>
		 		CMPY_CD='<%= CMPY_CD_T%>'
<%
			}

			if(! PRPY_CD_T.equals("")) {
%>
		 		PRPY_CD='<%= PRPY_CD_T%>'
<%
			}

			if(! UBEH_YN_T.equals("")) {
%>
		 		UBEH_YN='<%= UBEH_YN_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c44_T.equals("")) {
%>
		 		c44='<%= c44_T%>'
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
