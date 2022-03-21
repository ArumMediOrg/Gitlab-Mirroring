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
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PSNL_AGE == null) { PSNL_AGE = ""; }
		if(EXAM_CHA == null) { EXAM_CHA = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.IIM_ITEM_CD, B.IIM_SBCD_CD, B.IIM_KNME_NM, B.IIM_TRTP_CD, B.IIM_THPR_YN, B.IIM_THPR1_CD, B.IIM_THPR2_CD,
       B.IIM_RSLT_KD, B.IIM_RSLT_KD, GetSP_COMMON_cdToNm('HM06D',B.IIM_TRLT_CD||B.IIM_TRNM_CD) IIM_TRNM_NM,
       B.IIM_SORT_SQ, C.ERI_RSLT_VL, C.ERI_RSLT_CD, C.ERI_SPSB_PANJ, C.ERI_SPRT_CD,
       D.IIV_CHAR_VAL, D.IIV_RSLT_UNIT, GetSP_COMMON_cdToNm('HM06F',D.IIV_TREF_CD) IIV_TREF_NM,
       D.IIV_RSLT_LOW, D.IIV_LOW_KD, D.IIV_RSLT_HIGH, D.IIV_HIGH_KD, D.IIV_RSLT_UNIT,
              E.SIH_HIPR_CD,  F.SIC_CANC_LT, C.ERI_SPMIGUM_YN
FROM IT_ITEM B
  Inner JOIN ET_RSLT_ITEM C ON B.IIM_ITEM_CD = C.ERI_ITEM_CD
                                AND C.ERI_SPCL_KD <> '0'
                                And C.ERI_CNCL_YN <> 'Y'
  LEFT OUTER JOIN IT_ITEM_VLDT D ON B.IIM_ITEM_CD = D.IIV_ITEM_CD
                                AND D.IIV_APLY_DT = GetITEM_VLDT_ApplyDate(B.IIM_ITEM_CD, :EXAM_DT,'ITEM_CD','4')
                                AND D.IIV_EXAM_CD = '4'
                                AND D.IIV_PANJ_CD = 'A'
                                AND D.IIV_SEX_CD  = :SEX_CD
                                AND D.IIV_AGE_FR <= :PSNL_AGE
                                AND D.IIV_AGE_TO >= :PSNL_AGE
                                AND D.IIV_USE_YN  = 'Y'
  LEFT OUTER JOIN ST_ITEM_HIGHPRICE E ON C.ERI_EXAM_DT = E.SIH_EXAM_DT
                                   AND C.ERI_EXAM_SQ = E.SIH_EXAM_SQ
                                   AND E.SIH_EXAM_CHA = :EXAM_CHA
                                   AND B.IIM_ITEM_CD = E.SIH_ITEM_CD
  LEFT OUTER JOIN ST_ITEM_CANCEL    F ON C.ERI_EXAM_DT = F.SIC_EXAM_DT
                                   AND C.ERI_EXAM_SQ = F.SIC_EXAM_SQ
                                   AND F.SIC_EXAM_CHA = :EXAM_CHA
                                   AND B.IIM_ITEM_CD = F.SIC_ITEM_CD
WHERE C.ERI_EXAM_DT = :EXAM_DT
  AND C.ERI_EXAM_SQ = :EXAM_SQ
  AND B.IIM_USE_YN = 'Y'
|| :sSQL_ADD
		*/

		sql = " SELECT B.IIM_ITEM_CD, B.IIM_SBCD_CD, B.IIM_KNME_NM, B.IIM_TRTP_CD, B.IIM_THPR_YN, B.IIM_THPR1_CD, B.IIM_THPR2_CD, B.IIM_RSLT_KD, B.IIM_RSLT_KD, GETSP_COMMON_CDTONM('HM06D',B.IIM_TRLT_CD||B.IIM_TRNM_CD) IIM_TRNM_NM, B.IIM_SORT_SQ, C.ERI_RSLT_VL, C.ERI_RSLT_CD, C.ERI_SPSB_PANJ, C.ERI_SPRT_CD, D.IIV_CHAR_VAL, D.IIV_RSLT_UNIT, GETSP_COMMON_CDTONM('HM06F',D.IIV_TREF_CD) IIV_TREF_NM, D.IIV_RSLT_LOW, D.IIV_LOW_KD, D.IIV_RSLT_HIGH, D.IIV_HIGH_KD, D.IIV_RSLT_UNIT, E.SIH_HIPR_CD, F.SIC_CANC_LT, C.ERI_SPMIGUM_YN";
		sql += " FROM IT_ITEM B INNER JOIN ET_RSLT_ITEM C";
		sql += " ON B.IIM_ITEM_CD = C.ERI_ITEM_CD";
		sql += " AND C.ERI_SPCL_KD <> '0'";
		sql += " AND C.ERI_CNCL_YN <> 'Y' LEFT OUTER JOIN IT_ITEM_VLDT D";
		sql += " ON B.IIM_ITEM_CD = D.IIV_ITEM_CD";
		sql += " AND D.IIV_APLY_DT = GETITEM_VLDT_APPLYDATE(B.IIM_ITEM_CD, '" + EXAM_DT + "','ITEM_CD','4')";
		sql += " AND D.IIV_EXAM_CD = '4'";
		sql += " AND D.IIV_PANJ_CD = 'A'";
		sql += " AND D.IIV_SEX_CD = '" + SEX_CD + "'";
		sql += " AND D.IIV_AGE_FR <= '" + PSNL_AGE + "'";
		sql += " AND D.IIV_AGE_TO >= '" + PSNL_AGE + "'";
		sql += " AND D.IIV_USE_YN = 'Y' LEFT OUTER JOIN ST_ITEM_HIGHPRICE E";
		sql += " ON C.ERI_EXAM_DT = E.SIH_EXAM_DT";
		sql += " AND C.ERI_EXAM_SQ = E.SIH_EXAM_SQ";
		sql += " AND E.SIH_EXAM_CHA = '" + EXAM_CHA + "'";
		sql += " AND B.IIM_ITEM_CD = E.SIH_ITEM_CD LEFT OUTER JOIN ST_ITEM_CANCEL F";
		sql += " ON C.ERI_EXAM_DT = F.SIC_EXAM_DT";
		sql += " AND C.ERI_EXAM_SQ = F.SIC_EXAM_SQ";
		sql += " AND F.SIC_EXAM_CHA = '" + EXAM_CHA + "'";
		sql += " AND B.IIM_ITEM_CD = F.SIC_ITEM_CD";
		sql += " WHERE C.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND C.ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND B.IIM_USE_YN = 'Y'";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_UP_ITEM_001 \n";
			G_INFO += "설명 : 검사항목 리스트 조회(검사항목,판정검사항목) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PSNL_AGE : " + PSNL_AGE + " \n";
			G_INFO += " EXAM_CHA : " + EXAM_CHA + " \n";
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
		<s:AttributeType name='IIM_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SBCD_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRTP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_THPR_YN' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_THPR_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_THPR1_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_THPR1_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_THPR2_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_THPR2_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RSLT_KD' rs:number='8' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='c8' rs:name='IIM_RSLT_KD' rs:number='9' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRNM_NM' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SORT_SQ' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPSB_PANJ' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPRT_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_CHAR_VAL' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_CHAR_VAL'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_UNIT' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_TREF_NM' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_LOW' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_LOW_KD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_LOW_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_HIGH' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_HIGH_KD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_HIGH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='c22' rs:name='IIV_RSLT_UNIT' rs:number='23' rs:nullable='true' rs:writeunknown='true'
			 rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_RSLT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='SIH_HIPR_CD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_HIGHPRICE'
			 rs:basecolumn='SIH_HIPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SIC_CANC_LT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_CANCEL'
			 rs:basecolumn='SIC_CANC_LT'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPMIGUM_YN' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPMIGUM_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='27' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c27' rs:name='ROWID' rs:number='28' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c28' rs:name='ROWID' rs:number='29' rs:rowid='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c29' rs:name='ROWID' rs:number='30' rs:rowid='true' rs:basetable='ST_ITEM_HIGHPRICE'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c30' rs:name='ROWID' rs:number='31' rs:rowid='true' rs:basetable='ST_ITEM_CANCEL' rs:basecolumn='ROWID'
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

			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String IIM_SBCD_CD_T = cRsList.getString("IIM_SBCD_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String IIM_TRTP_CD_T = cRsList.getString("IIM_TRTP_CD");
			String IIM_THPR_YN_T = cRsList.getString("IIM_THPR_YN");
			String IIM_THPR1_CD_T = cRsList.getString("IIM_THPR1_CD");
			String IIM_THPR2_CD_T = cRsList.getString("IIM_THPR2_CD");
			String IIM_RSLT_KD_T = cRsList.getString("IIM_RSLT_KD");
			String c8_T = cRsList.getString("c8");
			String IIM_TRNM_NM_T = cRsList.getString("IIM_TRNM_NM");
			String IIM_SORT_SQ_T = cRsList.getString("IIM_SORT_SQ");
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
			String c22_T = cRsList.getString("c22");
			String SIH_HIPR_CD_T = cRsList.getString("SIH_HIPR_CD");
			String SIC_CANC_LT_T = cRsList.getString("SIC_CANC_LT");
			String ERI_SPMIGUM_YN_T = cRsList.getString("ERI_SPMIGUM_YN");
			String ROWID_T = cRsList.getString("ROWID");
			String c27_T = cRsList.getString("c27");
			String c28_T = cRsList.getString("c28");
			String c29_T = cRsList.getString("c29");
			String c30_T = cRsList.getString("c30");
%>
			<z:row
<%
			if(! IIM_ITEM_CD_T.equals("")) {
%>
		 		IIM_ITEM_CD='<%= IIM_ITEM_CD_T%>'
<%
			}

			if(! IIM_SBCD_CD_T.equals("")) {
%>
		 		IIM_SBCD_CD='<%= IIM_SBCD_CD_T%>'
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

			if(! c8_T.equals("")) {
%>
		 		c8='<%= c8_T%>'
<%
			}

			if(! IIM_TRNM_NM_T.equals("")) {
%>
		 		IIM_TRNM_NM='<%= IIM_TRNM_NM_T%>'
<%
			}

			if(! IIM_SORT_SQ_T.equals("")) {
%>
		 		IIM_SORT_SQ='<%= IIM_SORT_SQ_T%>'
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

			if(! c22_T.equals("")) {
%>
		 		c22='<%= c22_T%>'
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

			if(! ERI_SPMIGUM_YN_T.equals("")) {
%>
		 		ERI_SPMIGUM_YN='<%= ERI_SPMIGUM_YN_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c27_T.equals("")) {
%>
		 		c27='<%= c27_T%>'
<%
			}

			if(! c28_T.equals("")) {
%>
		 		c28='<%= c28_T%>'
<%
			}

			if(! c29_T.equals("")) {
%>
		 		c29='<%= c29_T%>'
<%
			}

			if(! c30_T.equals("")) {
%>
		 		c30='<%= c30_T%>'
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
