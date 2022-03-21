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
		String PRCE_CD = htMethod.get("PRCE_CD");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String SEX_CD = htMethod.get("SEX_CD");
		String PARAM_TX = htMethod.get("PARAM_TX");
		String EPK_PRCE_CD = htMethod.get("EPK_PRCE_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(PRCE_CD == null) { PRCE_CD = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }
		if(EPK_PRCE_CD == null) { EPK_PRCE_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT SUBSTR(:EXAM_DT, 1, 4) EXAM_YR, EPK_EXAM_CD EXAM_CD, EPK_PACK_SQ EXAM_SQ,
       EPK_EXAM_CD||'-'||EPK_PACK_SQ EXAM_DP, EPK_PACK_NM EXAM_NM, '00000' GBHC_KD, '' EXAM_YN,
       EPK_PACK_DT PRCE_DT, :PRCE_CD CALC_CD, EPK_ITEM_LT ITEM_LT,
       CASE :PRCE_CD WHEN '1' THEN EPK_SALE_PR
                         WHEN '2' THEN EPK_COUP_PR
                         WHEN '3' THEN EPK_FAMY_PR
                         WHEN '4' THEN EPK_GRUP_PR
                         WHEN '5' THEN EPK_CUPN_PR
                         WHEN '6' THEN EPK_MMBR_PR ELSE EPK_SALE_PR END AS EXAM_PR,
       EPK_SALE_PR SALE_PR, EPK_GRUP_PR GRUP_PR, EPK_COUP_PR COUP_PR, 
       EPK_FAMY_PR FAMY_PR, EPK_CUPN_PR CUPN_PR, EPK_MMBR_PR MMBR_PR,
       EPK_OPTN_PR OPTN_PR, 0 JCSG_PR,  0 HESG_PR, 0 GBSG_PR, 0 SBSG_PR, 0 TGSG_PR,
       'N' HTSB_YN, 'N' SPSB_YN, 'N' CVSB_YN, 'N' ETSB_YN, 'N' EMSB_YN,
       ''  HTPR_CD, ''  SPPR_CD, ''  CVPR_CD, ''  ETPR_CD, ''  EMPR_CD,
       EPK_CNCL_CD CNCL_CD, EPK_OPTN_YN OPTN_YN, '0' EXAM_KD, EPK_PACK_TX PACK_RMK, '' SALE_ID,
       '1'       PYER_CD, '9'       CMPY_CD, '3' PRPY_CD,
       CASE WHEN NVL(RTRIM(UB_PACKAGE), ' ') = ' ' THEN 'N' ELSE 'Y' END UBEH_YN
  FROM ET_PACK
 WHERE EPK_EXAM_CD LIKE :EXAM_CD||% 
   AND EPK_PACK_SDT <= :EXAM_DT
   AND EPK_PACK_EDT >= :EXAM_DT
   AND EPK_SEX_CD IN (:SEX_CD)
   AND UPPER(EPK_USE_YN) = 'Y'
  :PARAM_TX


- 수정사항
:EPK_PRCE_CD CALC_CD >> :PRCE_CD CALC_CD
		*/

		sql = " SELECT SUBSTR('" + EXAM_DT + "', 1, 4) EXAM_YR, EPK_EXAM_CD EXAM_CD, EPK_PACK_SQ EXAM_SQ, EPK_EXAM_CD||'-'||EPK_PACK_SQ EXAM_DP, EPK_PACK_NM EXAM_NM, '00000' GBHC_KD, '' EXAM_YN, EPK_PACK_DT PRCE_DT, '" + PRCE_CD + "' CALC_CD, EPK_ITEM_LT ITEM_LT";
		sql += ", CASE '" + PRCE_CD + "' WHEN '1' THEN EPK_SALE_PR WHEN '2' THEN EPK_COUP_PR WHEN '3' THEN EPK_FAMY_PR WHEN '4' THEN EPK_GRUP_PR WHEN '5' THEN EPK_CUPN_PR WHEN '6' THEN EPK_MMBR_PR ELSE EPK_SALE_PR END AS EXAM_PR";
		sql += ", EPK_SALE_PR SALE_PR, EPK_GRUP_PR GRUP_PR, EPK_COUP_PR COUP_PR, EPK_FAMY_PR FAMY_PR, EPK_CUPN_PR CUPN_PR, EPK_MMBR_PR MMBR_PR, EPK_OPTN_PR OPTN_PR, 0 JCSG_PR, 0 HESG_PR, 0 GBSG_PR, 0 SBSG_PR, 0 TGSG_PR, 'N' HTSB_YN, 'N' SPSB_YN, 'N' CVSB_YN, 'N' ETSB_YN, 'N' EMSB_YN, '' HTPR_CD, '' SPPR_CD, '' CVPR_CD, '' ETPR_CD, '' EMPR_CD, EPK_CNCL_CD CNCL_CD, EPK_OPTN_YN OPTN_YN, '0' EXAM_KD, EPK_PACK_TX PACK_RMK, '' SALE_ID, '1' PYER_CD, '9' CMPY_CD, '3' PRPY_CD";
		sql += ", CASE WHEN NVL(RTRIM(UB_PACKAGE), ' ') = ' ' THEN 'N' ELSE 'Y' END UBEH_YN";
		sql += " FROM ET_PACK";
		sql += " WHERE EPK_EXAM_CD LIKE '" + EXAM_CD + "%'";
		sql += " AND EPK_PACK_SDT <= '" + EXAM_DT + "'";
		sql += " AND EPK_PACK_EDT >= '" + EXAM_DT + "'";
		sql += " AND EPK_SEX_CD IN ('" + SEX_CD + "')";
		sql += " AND UPPER(EPK_USE_YN) = 'Y' ";
		sql += PARAM_TX;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamSetting_002 \n";
			G_INFO += "설명 : 개별묶음 유형별 세팅 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " PRCE_CD : " + PRCE_CD + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
			G_INFO += " EPK_PRCE_CD : " + EPK_PRCE_CD + " \n";
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
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_DP' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='16'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NM' rs:number='5' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='GBHC_KD' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_YN' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PRCE_DT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_PACK_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CALC_CD' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_LT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_ITEM_LT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_PR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_SALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SALE_PR' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_GRUP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='GRUP_PR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_COUP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='COUP_PR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_FAMY_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='FAMY_PR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_CUPN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CUPN_PR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_MMBR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='MMBR_PR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_OPTN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_PR' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='JCSG_PR' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HESG_PR' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='GBSG_PR' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SBSG_PR' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='TGSG_PR' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HTSB_YN' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPSB_YN' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CVSB_YN' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ETSB_YN' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EMSB_YN' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='HTPR_CD' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPPR_CD' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CVPR_CD' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ETPR_CD' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EMPR_CD' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_CNCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CNCL_CD' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_OPTN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_YN' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_KD' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_PACK_TX'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PACK_RMK' rs:number='37' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='SALE_ID' rs:number='38' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PYER_CD' rs:number='39' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CMPY_CD' rs:number='40' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PRPY_CD' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='UBEH_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='UBEH_YN' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='43' rs:rowid='true' rs:basetable='ET_PACK' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
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
%>
				UBEH_YN='<%= cnt%>'
				ROWID='<%= cnt%>'
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
