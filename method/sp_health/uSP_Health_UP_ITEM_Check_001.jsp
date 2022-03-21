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
		String SEX_CD = htMethod.get("SEX_CD");
		String PSNL_AGE = htMethod.get("PSNL_AGE");
		String EXAM_CHA = htMethod.get("EXAM_CHA");
		String JJ_CD = htMethod.get("JJ_CD");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PSNL_AGE == null) { PSNL_AGE = ""; }
		if(EXAM_CHA == null) { EXAM_CHA = ""; }
		if(JJ_CD == null) { JJ_CD = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.CSP_JJ_CD, A.CSP_SBCD_CD, GetSP_COMMON_cdToNm('HM05D',A.CSP_JANGGI_CD) CSP_JJ_NM,
       B.IIM_ITEM_CD, B.IIM_KNME_NM, B.IIM_TRTP_CD, B.IIM_THPR_YN, B.IIM_THPR1_CD, B.IIM_THPR2_CD,
       B.IIM_RSLT_KD, B.IIM_SORT_SQ, B.IIM_TRLT_CD, B.IIM_TRNM_CD,
       GetSP_COMMON_cdToNm('HM06D',B.IIM_TRLT_CD||B.IIM_TRNM_CD) IIM_TRNM_NM,
             C.ERI_RSLT_VL, C.ERI_RSLT_CD, C.ERI_SPSB_PANJ, C.ERI_SPRT_CD,
       D.IIV_CHAR_VAL, D.IIV_RSLT_UNIT, GetSP_COMMON_cdToNm('HM06F',D.IIV_TREF_CD) IIV_TREF_NM,
       D.IIV_RSLT_LOW, D.IIV_LOW_KD, D.IIV_RSLT_HIGH, D.IIV_HIGH_KD, D.IIV_RSLT_UNIT,
             E.SIH_HIPR_CD, F.SIC_CANC_LT
  FROM CT_SP_PROF A
  INNER JOIN IT_ITEM B ON A.CSP_SBCD_CD = B.IIM_SBCD_CD
  LEFT OUTER JOIN ET_RSLT_ITEM  C ON B.IIM_ITEM_CD = C.ERI_ITEM_CD AND C.ERI_SPCL_KD <> '0'
                                 And C.ERI_CNCL_YN <> 'Y'
  LEFT OUTER JOIN IT_ITEM_VLDT  D ON B.IIM_ITEM_CD = D.IIV_ITEM_CD
                                 AND D.IIV_APLY_DT = GetITEM_VLDT_ApplyDate(B.IIM_ITEM_CD,:EXAM_DT, 'ITEM_CD','4')
                                 AND D.IIV_EXAM_CD = '4'
                                 AND D.IIV_PANJ_CD = 'A'
                                 AND D.IIV_SEX_CD  = :SEX_CD
                                 AND D.IIV_AGE_FR <= :PSNL_AGE
                                 AND D.IIV_AGE_TO >= :PSNL_AGE
                                 AND D.IIV_USE_YN  = 'Y'
  LEFT OUTER JOIN ST_ITEM_HIGHPRICE E ON C.ERI_EXAM_DT = E.SIH_EXAM_DT
                                     AND C.ERI_EXAM_SQ = E.SIH_EXAM_SQ
                                     AND E.SIH_EXAM_CHA = :EXAM_CHA
                                     AND A.CSP_SBCD_CD = E.SIH_SBCD_CD
        LEFT OUTER JOIN ST_ITEM_CANCEL    F ON C.ERI_EXAM_DT = F.SIC_EXAM_DT
                                     AND C.ERI_EXAM_SQ = F.SIC_EXAM_SQ
                                     AND F.SIC_EXAM_CHA = :EXAM_CHA
                                     AND A.CSP_SBCD_CD = F.SIC_SBCD_CD
 WHERE A.CSP_JJ_CD = :JJ_CD
   AND A.CSP_USE_YN = 'Y'
   AND C.ERI_EXAM_DT = :EXAM_DT
   AND C.ERI_EXAM_SQ = :EXAM_SQ
|| :sSQL_ADD

		*/

		sql = " SELECT A.CSP_JJ_CD, A.CSP_SBCD_CD, GETSP_COMMON_CDTONM('HM05D',A.CSP_JANGGI_CD) CSP_JJ_NM, B.IIM_ITEM_CD, B.IIM_KNME_NM, B.IIM_TRTP_CD, B.IIM_THPR_YN, B.IIM_THPR1_CD, B.IIM_THPR2_CD, B.IIM_RSLT_KD, B.IIM_SORT_SQ, B.IIM_TRLT_CD, B.IIM_TRNM_CD, GETSP_COMMON_CDTONM('HM06D',B.IIM_TRLT_CD||B.IIM_TRNM_CD) IIM_TRNM_NM, C.ERI_RSLT_VL, C.ERI_RSLT_CD, C.ERI_SPSB_PANJ, C.ERI_SPRT_CD, D.IIV_CHAR_VAL, D.IIV_RSLT_UNIT, GETSP_COMMON_CDTONM('HM06F',D.IIV_TREF_CD) IIV_TREF_NM, D.IIV_RSLT_LOW, D.IIV_LOW_KD, D.IIV_RSLT_HIGH, D.IIV_HIGH_KD, D.IIV_RSLT_UNIT, E.SIH_HIPR_CD, F.SIC_CANC_LT";
		sql += " FROM CT_SP_PROF A INNER JOIN IT_ITEM B";
		sql += " ON A.CSP_SBCD_CD = B.IIM_SBCD_CD LEFT OUTER JOIN ET_RSLT_ITEM C";
		sql += " ON B.IIM_ITEM_CD = C.ERI_ITEM_CD";
		sql += " AND C.ERI_SPCL_KD <> '0'";
		sql += " AND C.ERI_CNCL_YN <> 'Y' LEFT OUTER JOIN IT_ITEM_VLDT D";
		sql += " ON B.IIM_ITEM_CD = D.IIV_ITEM_CD";
		sql += " AND D.IIV_APLY_DT = GETITEM_VLDT_APPLYDATE(B.IIM_ITEM_CD,'" + EXAM_DT + "', 'ITEM_CD','4')";
		sql += " AND D.IIV_EXAM_CD = '4'";
		sql += " AND D.IIV_PANJ_CD = 'A'";
		sql += " AND D.IIV_SEX_CD = '" + SEX_CD + "'";
		sql += " AND D.IIV_AGE_FR <= '" + PSNL_AGE + "'";
		sql += " AND D.IIV_AGE_TO >= '" + PSNL_AGE + "'";
		sql += " AND D.IIV_USE_YN = 'Y' LEFT OUTER JOIN ST_ITEM_HIGHPRICE E";
		sql += " ON C.ERI_EXAM_DT = E.SIH_EXAM_DT";
		sql += " AND C.ERI_EXAM_SQ = E.SIH_EXAM_SQ";
		sql += " AND E.SIH_EXAM_CHA = '" + EXAM_CHA + "'";
		sql += " AND A.CSP_SBCD_CD = E.SIH_SBCD_CD LEFT OUTER JOIN ST_ITEM_CANCEL F";
		sql += " ON C.ERI_EXAM_DT = F.SIC_EXAM_DT";
		sql += " AND C.ERI_EXAM_SQ = F.SIC_EXAM_SQ";
		sql += " AND F.SIC_EXAM_CHA = '" + EXAM_CHA + "'";
		sql += " AND A.CSP_SBCD_CD = F.SIC_SBCD_CD";
		sql += " WHERE A.CSP_JJ_CD IN " + JJ_CD + " ";
		sql += " AND A.CSP_USE_YN = 'Y'";
		sql += " AND C.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND C.ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_UP_ITEM_Check_001 \n";
			G_INFO += "설명 : 특검검사항목 결과 확인 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PSNL_AGE : " + PSNL_AGE + " \n";
			G_INFO += " EXAM_CHA : " + EXAM_CHA + " \n";
			G_INFO += " JJ_CD : " + JJ_CD + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
		<s:AttributeType name='CSP_JJ_CD' rs:number='1' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_JJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_SBCD_CD' rs:number='2' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_JJ_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ITEM_CD' rs:number='4' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='5' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRTP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_THPR_YN' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_THPR_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_THPR1_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_THPR1_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_THPR2_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_THPR2_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RSLT_KD' rs:number='10' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SORT_SQ' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRLT_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRNM_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRNM_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRNM_NM' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPSB_PANJ' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPRT_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_CHAR_VAL' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_CHAR_VAL'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_UNIT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_TREF_NM' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_LOW' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_LOW_KD' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_LOW_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_HIGH' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_HIGH_KD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_HIGH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='c25' rs:name='IIV_RSLT_UNIT' rs:number='26' rs:nullable='true' rs:writeunknown='true'
			 rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_RSLT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='SIH_HIPR_CD' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_HIGHPRICE'
			 rs:basecolumn='SIH_HIPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SIC_CANC_LT' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL'
			 rs:basecolumn='SIC_CANC_LT'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='29' rs:rowid='true' rs:basetable='CT_SP_PROF' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c29' rs:name='ROWID' rs:number='30' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c30' rs:name='ROWID' rs:number='31' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c31' rs:name='ROWID' rs:number='32' rs:rowid='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c32' rs:name='ROWID' rs:number='33' rs:rowid='true' rs:basetable='ST_ITEM_HIGHPRICE'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c33' rs:name='ROWID' rs:number='34' rs:rowid='true' rs:basetable='ST_ITEM_CANCEL' rs:basecolumn='ROWID'
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

			String CSP_JJ_CD_T = cRsList.getString("CSP_JJ_CD");
			String CSP_SBCD_CD_T = cRsList.getString("CSP_SBCD_CD");
			String CSP_JJ_NM_T = cRsList.getString("CSP_JJ_NM");
			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String IIM_TRTP_CD_T = cRsList.getString("IIM_TRTP_CD");
			String IIM_THPR_YN_T = cRsList.getString("IIM_THPR_YN");
			String IIM_THPR1_CD_T = cRsList.getString("IIM_THPR1_CD");
			String IIM_THPR2_CD_T = cRsList.getString("IIM_THPR2_CD");
			String IIM_RSLT_KD_T = cRsList.getString("IIM_RSLT_KD");
			String IIM_SORT_SQ_T = cRsList.getString("IIM_SORT_SQ");
			String IIM_TRLT_CD_T = cRsList.getString("IIM_TRLT_CD");
			String IIM_TRNM_CD_T = cRsList.getString("IIM_TRNM_CD");
			String IIM_TRNM_NM_T = cRsList.getString("IIM_TRNM_NM");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String ERI_RSLT_CD_T = cRsList.getString("ERI_RSLT_CD");
			String ERI_SPSB_PANJ_T = cRsList.getString("ERI_SPSB_PANJ");
			String ERI_SPRT_CD_T = cRsList.getString("ERI_SPRT_CD");
			String IIV_CHAR_VAL_T = cRsList.getString("IIV_CHAR_VAL");
			String IIV_RSLT_UNIT_T = cRsList.getString("IIV_RSLT_UNIT");
			String IIV_TREF_NM_T = cRsList.getString("IIV_TREF_NM");
			String IIV_RSLT_LOW_T = cRsList.getString("IIV_RSLT_LOW");
			String IIV_LOW_KD_T = cRsList.getString("IIV_LOW_KD");
			String IIV_RSLT_HIGH_T = cRsList.getString("IIV_RSLT_HIGH");
			String IIV_HIGH_KD_T = cRsList.getString("IIV_HIGH_KD");
			String c25_T = cRsList.getString("c25");
			String SIH_HIPR_CD_T = cRsList.getString("SIH_HIPR_CD");
			String SIC_CANC_LT_T = cRsList.getString("SIC_CANC_LT");
			String ROWID_T = cRsList.getString("ROWID");
			String c29_T = cRsList.getString("c29");
			String c30_T = cRsList.getString("c30");
			String c31_T = cRsList.getString("c31");
			String c32_T = cRsList.getString("c32");
			String c33_T = cRsList.getString("c33");
%>
			<z:row
<%
			if(! CSP_JJ_CD_T.equals("")) {
%>
		 		CSP_JJ_CD='<%= CSP_JJ_CD_T%>'
<%
			}

			if(! CSP_SBCD_CD_T.equals("")) {
%>
		 		CSP_SBCD_CD='<%= CSP_SBCD_CD_T%>'
<%
			}

			if(! CSP_JJ_NM_T.equals("")) {
%>
		 		CSP_JJ_NM='<%= CSP_JJ_NM_T%>'
<%
			}

			if(! IIM_ITEM_CD_T.equals("")) {
%>
		 		IIM_ITEM_CD='<%= IIM_ITEM_CD_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
<%
			}

			if(! IIM_TRTP_CD_T.equals("")) {
%>
		 		IIM_TRTP_CD='<%= IIM_TRTP_CD_T%>'
<%
			}

			if(! IIM_THPR_YN_T.equals("")) {
%>
		 		IIM_THPR_YN='<%= IIM_THPR_YN_T%>'
<%
			}

			if(! IIM_THPR1_CD_T.equals("")) {
%>
		 		IIM_THPR1_CD='<%= IIM_THPR1_CD_T%>'
<%
			}

			if(! IIM_THPR2_CD_T.equals("")) {
%>
		 		IIM_THPR2_CD='<%= IIM_THPR2_CD_T%>'
<%
			}

			if(! IIM_RSLT_KD_T.equals("")) {
%>
		 		IIM_RSLT_KD='<%= IIM_RSLT_KD_T%>'
<%
			}

			if(! IIM_SORT_SQ_T.equals("")) {
%>
		 		IIM_SORT_SQ='<%= IIM_SORT_SQ_T%>'
<%
			}

			if(! IIM_TRLT_CD_T.equals("")) {
%>
		 		IIM_TRLT_CD='<%= IIM_TRLT_CD_T%>'
<%
			}

			if(! IIM_TRNM_CD_T.equals("")) {
%>
		 		IIM_TRNM_CD='<%= IIM_TRNM_CD_T%>'
<%
			}

			if(! IIM_TRNM_NM_T.equals("")) {
%>
		 		IIM_TRNM_NM='<%= IIM_TRNM_NM_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! ERI_RSLT_CD_T.equals("")) {
%>
		 		ERI_RSLT_CD='<%= ERI_RSLT_CD_T%>'
<%
			}

			if(! ERI_SPSB_PANJ_T.equals("")) {
%>
		 		ERI_SPSB_PANJ='<%= ERI_SPSB_PANJ_T%>'
<%
			}

			if(! ERI_SPRT_CD_T.equals("")) {
%>
		 		ERI_SPRT_CD='<%= ERI_SPRT_CD_T%>'
<%
			}

			if(! IIV_CHAR_VAL_T.equals("")) {
%>
		 		IIV_CHAR_VAL='<%= IIV_CHAR_VAL_T%>'
<%
			}

			if(! IIV_RSLT_UNIT_T.equals("")) {
%>
		 		IIV_RSLT_UNIT='<%= IIV_RSLT_UNIT_T%>'
<%
			}

			if(! IIV_TREF_NM_T.equals("")) {
%>
		 		IIV_TREF_NM='<%= IIV_TREF_NM_T%>'
<%
			}

			if(! IIV_RSLT_LOW_T.equals("")) {
%>
		 		IIV_RSLT_LOW='<%= IIV_RSLT_LOW_T%>'
<%
			}

			if(! IIV_LOW_KD_T.equals("")) {
%>
		 		IIV_LOW_KD='<%= IIV_LOW_KD_T%>'
<%
			}

			if(! IIV_RSLT_HIGH_T.equals("")) {
%>
		 		IIV_RSLT_HIGH='<%= IIV_RSLT_HIGH_T%>'
<%
			}

			if(! IIV_HIGH_KD_T.equals("")) {
%>
		 		IIV_HIGH_KD='<%= IIV_HIGH_KD_T%>'
<%
			}

			if(! c25_T.equals("")) {
%>
		 		c25='<%= c25_T%>'
<%
			}

			if(! SIH_HIPR_CD_T.equals("")) {
%>
		 		SIH_HIPR_CD='<%= SIH_HIPR_CD_T%>'
<%
			}

			if(! SIC_CANC_LT_T.equals("")) {
%>
		 		SIC_CANC_LT='<%= SIC_CANC_LT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c29='<%= cnt%>'
				c30='<%= cnt%>'
				c31='<%= cnt%>'
				c32='<%= cnt%>'
				c33='<%= cnt%>'
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
