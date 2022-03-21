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

		String SEX_CD = htMethod.get("SEX_CD");
		String PSNL_AGE = htMethod.get("PSNL_AGE");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String ITEM_CD = htMethod.get("ITEM_CD");

		//
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PSNL_AGE == null) { PSNL_AGE = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.*,
       B.IIM_ITEM_CD, B.IIM_KNME_NM, B.IIM_SNME_NM, B.IIM_REJH_EX,
       D.IIV_CHAR_VAL, D.IIV_RSLT_UNIT, GETSP_COMMON_CDTONM('HM06F', D.IIV_TREF_CD) IIV_TREF_NM,
       D.IIV_RSLT_LOW  || CASE WHEN D.IIV_LOW_KD  IS NULL OR D.IIV_LOW_KD  = '' THEN D.IIV_LOW_KD  ELSE GETCOMMON_LVCDTONM('0512', D.IIV_LOW_KD, '5', 1) END || '~' ||
       D.IIV_RSLT_HIGH || CASE WHEN D.IIV_HIGH_KD IS NULL OR D.IIV_HIGH_KD = '' THEN D.IIV_HIGH_KD ELSE GETCOMMON_LVCDTONM('0512', D.IIV_HIGH_KD,'5', 1) END IIV_REF_NM
  FROM ET_RSLT_ITEM A
            INNER JOIN IT_ITEM B      ON A.ERI_ITEM_CD = B.IIM_ITEM_CD
       LEFT OUTER JOIN IT_ITEM_VLDT D ON B.IIM_ITEM_CD = D.IIV_ITEM_CD
                                     AND D.IIV_APLY_DT = GETITEM_VLDT_APPLYDATE(B.IIM_ITEM_CD, A.ERI_EXAM_DT, 'ITEM_CD', '6')
                                     AND D.IIV_EXAM_CD = '6'
                                     AND D.IIV_PANJ_CD = 'A'
                                     AND D.IIV_SEX_CD  = :SEX_CD
                                     AND D.IIV_AGE_FR <= :PSNL_AGE
                                     AND D.IIV_AGE_TO >= :PSNL_AGE
                                     AND D.IIV_USE_YN  = 'Y'
 WHERE A.ERI_EXAM_DT = :EXAM_DT
   AND A.ERI_EXAM_SQ = :EXAM_SQ
   AND A.ERI_CNCL_YN = 'N'

IF (:ITEM_CD <> '') THEN
   AND A.ERI_ITEM_CD = :ITEM_CD
		*/

		sql = " SELECT A.*, B.IIM_ITEM_CD, B.IIM_KNME_NM, B.IIM_SNME_NM, B.IIM_REJH_EX, D.IIV_CHAR_VAL, D.IIV_RSLT_UNIT, GETSP_COMMON_CDTONM('HM06F', D.IIV_TREF_CD) IIV_TREF_NM, D.IIV_RSLT_LOW || CASE WHEN D.IIV_LOW_KD IS NULL";
		sql += " OR D.IIV_LOW_KD = '' THEN D.IIV_LOW_KD ELSE GETCOMMON_LVCDTONM('0512', D.IIV_LOW_KD, '5', 1) END || '~' || D.IIV_RSLT_HIGH || CASE WHEN D.IIV_HIGH_KD IS NULL";
		sql += " OR D.IIV_HIGH_KD = '' THEN D.IIV_HIGH_KD ELSE GETCOMMON_LVCDTONM('0512', D.IIV_HIGH_KD,'5', 1) END IIV_REF_NM";
		sql += " FROM ET_RSLT_ITEM A INNER JOIN IT_ITEM B";
		sql += " ON A.ERI_ITEM_CD = B.IIM_ITEM_CD LEFT OUTER JOIN IT_ITEM_VLDT D";
		sql += " ON B.IIM_ITEM_CD = D.IIV_ITEM_CD";
		sql += " AND D.IIV_APLY_DT = GETITEM_VLDT_APPLYDATE(B.IIM_ITEM_CD, A.ERI_EXAM_DT, 'ITEM_CD', '6')";
		sql += " AND D.IIV_EXAM_CD = '6'";
		sql += " AND D.IIV_PANJ_CD = 'A'";
		sql += " AND D.IIV_SEX_CD = '" + SEX_CD + "'";
		sql += " AND D.IIV_AGE_FR <= '" + PSNL_AGE + "'";
		sql += " AND D.IIV_AGE_TO >= '" + PSNL_AGE + "'";
		sql += " AND D.IIV_USE_YN = 'Y'";
		sql += " WHERE A.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND A.ERI_CNCL_YN = 'N'";

		if(! ITEM_CD.equals("")) {
			sql += " AND A.ERI_ITEM_CD = '" + ITEM_CD + "'";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStudent_Common_XML_003 \n";
			G_INFO += "설명 : 학생검진 결과 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PSNL_AGE : " + PSNL_AGE + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
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
		<s:AttributeType name='ERI_EXAM_DT' rs:number='1' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_EXAM_DT' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EXAM_SQ' rs:number='2' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_EXAM_SQ' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ITEM_CD' rs:number='3' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_ITEM_CD' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HLTH_KD' rs:number='4' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_TOTAL_KD' rs:number='5' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_TOTAL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_STDT_KD' rs:number='6' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_STDT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EMPY_KD' rs:number='7' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_EMPY_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPCL_KD' rs:number='8' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_SPCL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_DETL_KD' rs:number='9' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_DETL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_BLOOD_KD' rs:number='10' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_BLOOD_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EACH_KD' rs:number='11' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_EACH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CVCL_KD' rs:number='12' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_CVCL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ETC_KD' rs:number='13' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_ETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ADD_KD' rs:number='14' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_ADD_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HLTH_CD' rs:number='15' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_HLTH_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPCL_CD' rs:number='16' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OCS_CD' rs:number='17' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_OCS_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HPTL_CD' rs:number='18' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_HPTL_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EXGN_CD' rs:number='19' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_EXGN_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SORT_SQ' rs:number='20' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CFRM_YN' rs:number='21' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_CFRM_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_KD' rs:number='22' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='23' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PRCH_VL' rs:number='24' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_PRCH_VL'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PRNM_VL' rs:number='25' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_PRNM_VL'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VLDT_LH' rs:number='26' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_VLDT_LH'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSPT_CNT' rs:number='27' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RSPT_CNT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSZR_KD' rs:number='28' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RSZR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CHAR_CD' rs:number='29' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_CHAR_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VERIFY_CD' rs:number='30' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_VERIFY_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_CD' rs:number='31' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RSLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_EX' rs:number='32' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PACS_RSLT' rs:number='33' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_PACS_RSLT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_TYPE_CD' rs:number='34' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_TYPE_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VLSV_YN' rs:number='35' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_VLSV_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_UNIT' rs:number='36' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RSLT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_UNIT_CD' rs:number='37' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_UNIT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HUNIT_CD' rs:number='38' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_HUNIT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_TUNIT_CD' rs:number='39' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_TUNIT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PART_CD' rs:number='40' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_PART_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CLINIC_CD' rs:number='41' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_CLINIC_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_TEST_CD' rs:number='42' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_TEST_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_LOW_KD' rs:number='43' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_LOW_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_LOW' rs:number='44' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HIGH_KD' rs:number='45' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_HIGH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_HIGH' rs:number='46' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CHAR_VAL' rs:number='47' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_CHAR_VAL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HERT_CD' rs:number='48' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_HERT_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPRT_CD' rs:number='49' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_SPRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ALSB_PANJ' rs:number='50' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_ALSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HTSB_PANJ' rs:number='51' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_HTSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_WOSB_PANJ' rs:number='52' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_WOSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPSB_PANJ' rs:number='53' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_SPSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EMSB_PANJ' rs:number='54' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_EMSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_STSB_PANJ' rs:number='55' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_STSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_START_DTT' rs:number='56' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_START_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RECV_DTT' rs:number='57' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RECV_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_INPUT_DTT' rs:number='58' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CFRM_DTT' rs:number='59' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_CFRM_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CNCL_YN' rs:number='60' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_CNCL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_STEP_CD' rs:number='61' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_STEP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_DSS_CD' rs:number='62' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_DSS_CD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_INPT_ID' rs:number='63' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_INPT_DTT' rs:number='64' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_MODI_ID' rs:number='65' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_MODI_DTT' rs:number='66' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OSSB_CD' rs:number='67' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_OSSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OSRL_CD' rs:number='68' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_OSRL_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPMIGUM_YN' rs:number='69' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_SPMIGUM_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ITEM_CD' rs:number='70' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='71' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SNME_NM' rs:number='72' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_SNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_REJH_EX' rs:number='73' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_REJH_EX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_CHAR_VAL' rs:number='74' rs:nullable='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_CHAR_VAL'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_UNIT' rs:number='75' rs:nullable='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_RSLT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_TREF_NM' rs:number='76' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_REF_NM' rs:number='77' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ERI_EXAM_DT_T = cRsList.getString("ERI_EXAM_DT");
			String ERI_EXAM_SQ_T = cRsList.getString("ERI_EXAM_SQ");
			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String ERI_HLTH_KD_T = cRsList.getString("ERI_HLTH_KD");
			String ERI_TOTAL_KD_T = cRsList.getString("ERI_TOTAL_KD");
			String ERI_STDT_KD_T = cRsList.getString("ERI_STDT_KD");
			String ERI_EMPY_KD_T = cRsList.getString("ERI_EMPY_KD");
			String ERI_SPCL_KD_T = cRsList.getString("ERI_SPCL_KD");
			String ERI_DETL_KD_T = cRsList.getString("ERI_DETL_KD");
			String ERI_BLOOD_KD_T = cRsList.getString("ERI_BLOOD_KD");
			String ERI_EACH_KD_T = cRsList.getString("ERI_EACH_KD");
			String ERI_CVCL_KD_T = cRsList.getString("ERI_CVCL_KD");
			String ERI_ETC_KD_T = cRsList.getString("ERI_ETC_KD");
			String ERI_ADD_KD_T = cRsList.getString("ERI_ADD_KD");
			String ERI_HLTH_CD_T = cRsList.getString("ERI_HLTH_CD");
			String ERI_SPCL_CD_T = cRsList.getString("ERI_SPCL_CD");
			String ERI_OCS_CD_T = cRsList.getString("ERI_OCS_CD");
			String ERI_HPTL_CD_T = cRsList.getString("ERI_HPTL_CD");
			String ERI_EXGN_CD_T = cRsList.getString("ERI_EXGN_CD");
			String ERI_SORT_SQ_T = cRsList.getString("ERI_SORT_SQ");
			String ERI_CFRM_YN_T = cRsList.getString("ERI_CFRM_YN");
			String ERI_RSLT_KD_T = cRsList.getString("ERI_RSLT_KD");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String ERI_PRCH_VL_T = cRsList.getString("ERI_PRCH_VL");
			String ERI_PRNM_VL_T = cRsList.getString("ERI_PRNM_VL");
			String ERI_VLDT_LH_T = cRsList.getString("ERI_VLDT_LH");
			String ERI_RSPT_CNT_T = cRsList.getString("ERI_RSPT_CNT");
			String ERI_RSZR_KD_T = cRsList.getString("ERI_RSZR_KD");
			String ERI_CHAR_CD_T = cRsList.getString("ERI_CHAR_CD");
			String ERI_VERIFY_CD_T = cRsList.getString("ERI_VERIFY_CD");
			String ERI_RSLT_CD_T = cRsList.getString("ERI_RSLT_CD");
			String ERI_RSLT_EX_T = cRsList.getString("ERI_RSLT_EX");
			String ERI_PACS_RSLT_T = cRsList.getString("ERI_PACS_RSLT");
			String ERI_TYPE_CD_T = cRsList.getString("ERI_TYPE_CD");
			String ERI_VLSV_YN_T = cRsList.getString("ERI_VLSV_YN");
			String ERI_RSLT_UNIT_T = cRsList.getString("ERI_RSLT_UNIT");
			String ERI_UNIT_CD_T = cRsList.getString("ERI_UNIT_CD");
			String ERI_HUNIT_CD_T = cRsList.getString("ERI_HUNIT_CD");
			String ERI_TUNIT_CD_T = cRsList.getString("ERI_TUNIT_CD");
			String ERI_PART_CD_T = cRsList.getString("ERI_PART_CD");
			String ERI_CLINIC_CD_T = cRsList.getString("ERI_CLINIC_CD");
			String ERI_TEST_CD_T = cRsList.getString("ERI_TEST_CD");
			String ERI_LOW_KD_T = cRsList.getString("ERI_LOW_KD");
			String ERI_RSLT_LOW_T = cRsList.getString("ERI_RSLT_LOW");
			String ERI_HIGH_KD_T = cRsList.getString("ERI_HIGH_KD");
			String ERI_RSLT_HIGH_T = cRsList.getString("ERI_RSLT_HIGH");
			String ERI_CHAR_VAL_T = cRsList.getString("ERI_CHAR_VAL");
			String ERI_HERT_CD_T = cRsList.getString("ERI_HERT_CD");
			String ERI_SPRT_CD_T = cRsList.getString("ERI_SPRT_CD");
			String ERI_ALSB_PANJ_T = cRsList.getString("ERI_ALSB_PANJ");
			String ERI_HTSB_PANJ_T = cRsList.getString("ERI_HTSB_PANJ");
			String ERI_WOSB_PANJ_T = cRsList.getString("ERI_WOSB_PANJ");
			String ERI_SPSB_PANJ_T = cRsList.getString("ERI_SPSB_PANJ");
			String ERI_EMSB_PANJ_T = cRsList.getString("ERI_EMSB_PANJ");
			String ERI_STSB_PANJ_T = cRsList.getString("ERI_STSB_PANJ");
			String ERI_START_DTT_T = cRsList.getDate2("ERI_START_DTT");
			String ERI_RECV_DTT_T = cRsList.getDate2("ERI_RECV_DTT");
			String ERI_INPUT_DTT_T = cRsList.getDate2("ERI_INPUT_DTT");
			String ERI_CFRM_DTT_T = cRsList.getDate2("ERI_CFRM_DTT");
			String ERI_CNCL_YN_T = cRsList.getString("ERI_CNCL_YN");
			String ERI_STEP_CD_T = cRsList.getString("ERI_STEP_CD");
			String ERI_DSS_CD_T = cRsList.getString("ERI_DSS_CD");
			String ERI_INPT_ID_T = cRsList.getString("ERI_INPT_ID");
			String ERI_INPT_DTT_T = cRsList.getDate2("ERI_INPT_DTT");
			String ERI_MODI_ID_T = cRsList.getString("ERI_MODI_ID");
			String ERI_MODI_DTT_T = cRsList.getDate2("ERI_MODI_DTT");
			String ERI_OSSB_CD_T = cRsList.getString("ERI_OSSB_CD");
			String ERI_OSRL_CD_T = cRsList.getString("ERI_OSRL_CD");
			String ERI_SPMIGUM_YN_T = cRsList.getString("ERI_SPMIGUM_YN");
			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String IIM_SNME_NM_T = cRsList.getString("IIM_SNME_NM");
			String IIM_REJH_EX_T = cRsList.getString("IIM_REJH_EX");
			String IIV_CHAR_VAL_T = cRsList.getString("IIV_CHAR_VAL");
			String IIV_RSLT_UNIT_T = cRsList.getString("IIV_RSLT_UNIT");
			String IIV_TREF_NM_T = cRsList.getString("IIV_TREF_NM");
			String IIV_REF_NM_T = cRsList.getString("IIV_REF_NM");
%>
			<z:row
<%
			if(! ERI_EXAM_DT_T.equals("")) {
%>
		 		ERI_EXAM_DT='<%= ERI_EXAM_DT_T%>'
<%
			}

			if(! ERI_EXAM_SQ_T.equals("")) {
%>
		 		ERI_EXAM_SQ='<%= ERI_EXAM_SQ_T%>'
<%
			}

			if(! ERI_ITEM_CD_T.equals("")) {
%>
		 		ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
<%
			}

			if(! ERI_HLTH_KD_T.equals("")) {
%>
		 		ERI_HLTH_KD='<%= ERI_HLTH_KD_T%>'
<%
			}

			if(! ERI_TOTAL_KD_T.equals("")) {
%>
		 		ERI_TOTAL_KD='<%= ERI_TOTAL_KD_T%>'
<%
			}

			if(! ERI_STDT_KD_T.equals("")) {
%>
		 		ERI_STDT_KD='<%= ERI_STDT_KD_T%>'
<%
			}

			if(! ERI_EMPY_KD_T.equals("")) {
%>
		 		ERI_EMPY_KD='<%= ERI_EMPY_KD_T%>'
<%
			}

			if(! ERI_SPCL_KD_T.equals("")) {
%>
		 		ERI_SPCL_KD='<%= ERI_SPCL_KD_T%>'
<%
			}

			if(! ERI_DETL_KD_T.equals("")) {
%>
		 		ERI_DETL_KD='<%= ERI_DETL_KD_T%>'
<%
			}

			if(! ERI_BLOOD_KD_T.equals("")) {
%>
		 		ERI_BLOOD_KD='<%= ERI_BLOOD_KD_T%>'
<%
			}

			if(! ERI_EACH_KD_T.equals("")) {
%>
		 		ERI_EACH_KD='<%= ERI_EACH_KD_T%>'
<%
			}

			if(! ERI_CVCL_KD_T.equals("")) {
%>
		 		ERI_CVCL_KD='<%= ERI_CVCL_KD_T%>'
<%
			}

			if(! ERI_ETC_KD_T.equals("")) {
%>
		 		ERI_ETC_KD='<%= ERI_ETC_KD_T%>'
<%
			}

			if(! ERI_ADD_KD_T.equals("")) {
%>
		 		ERI_ADD_KD='<%= ERI_ADD_KD_T%>'
<%
			}

			if(! ERI_HLTH_CD_T.equals("")) {
%>
		 		ERI_HLTH_CD='<%= ERI_HLTH_CD_T%>'
<%
			}

			if(! ERI_SPCL_CD_T.equals("")) {
%>
		 		ERI_SPCL_CD='<%= ERI_SPCL_CD_T%>'
<%
			}

			if(! ERI_OCS_CD_T.equals("")) {
%>
		 		ERI_OCS_CD='<%= ERI_OCS_CD_T%>'
<%
			}

			if(! ERI_HPTL_CD_T.equals("")) {
%>
		 		ERI_HPTL_CD='<%= ERI_HPTL_CD_T%>'
<%
			}

			if(! ERI_EXGN_CD_T.equals("")) {
%>
		 		ERI_EXGN_CD='<%= ERI_EXGN_CD_T%>'
<%
			}

			if(! ERI_SORT_SQ_T.equals("")) {
%>
		 		ERI_SORT_SQ='<%= ERI_SORT_SQ_T%>'
<%
			}

			if(! ERI_CFRM_YN_T.equals("")) {
%>
		 		ERI_CFRM_YN='<%= ERI_CFRM_YN_T%>'
<%
			}

			if(! ERI_RSLT_KD_T.equals("")) {
%>
		 		ERI_RSLT_KD='<%= ERI_RSLT_KD_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! ERI_PRCH_VL_T.equals("")) {
%>
		 		ERI_PRCH_VL='<%= ERI_PRCH_VL_T%>'
<%
			}

			if(! ERI_PRNM_VL_T.equals("")) {
%>
		 		ERI_PRNM_VL='<%= ERI_PRNM_VL_T%>'
<%
			}

			if(! ERI_VLDT_LH_T.equals("")) {
%>
		 		ERI_VLDT_LH='<%= ERI_VLDT_LH_T%>'
<%
			}

			if(! ERI_RSPT_CNT_T.equals("")) {
%>
		 		ERI_RSPT_CNT='<%= ERI_RSPT_CNT_T%>'
<%
			}

			if(! ERI_RSZR_KD_T.equals("")) {
%>
		 		ERI_RSZR_KD='<%= ERI_RSZR_KD_T%>'
<%
			}

			if(! ERI_CHAR_CD_T.equals("")) {
%>
		 		ERI_CHAR_CD='<%= ERI_CHAR_CD_T%>'
<%
			}

			if(! ERI_VERIFY_CD_T.equals("")) {
%>
		 		ERI_VERIFY_CD='<%= ERI_VERIFY_CD_T%>'
<%
			}

			if(! ERI_RSLT_CD_T.equals("")) {
%>
		 		ERI_RSLT_CD='<%= ERI_RSLT_CD_T%>'
<%
			}

			if(! ERI_RSLT_EX_T.equals("")) {
%>
		 		ERI_RSLT_EX='<%= ERI_RSLT_EX_T%>'
<%
			}

			if(! ERI_PACS_RSLT_T.equals("")) {
%>
		 		ERI_PACS_RSLT='<%= ERI_PACS_RSLT_T%>'
<%
			}

			if(! ERI_TYPE_CD_T.equals("")) {
%>
		 		ERI_TYPE_CD='<%= ERI_TYPE_CD_T%>'
<%
			}

			if(! ERI_VLSV_YN_T.equals("")) {
%>
		 		ERI_VLSV_YN='<%= ERI_VLSV_YN_T%>'
<%
			}

			if(! ERI_RSLT_UNIT_T.equals("")) {
%>
		 		ERI_RSLT_UNIT='<%= ERI_RSLT_UNIT_T%>'
<%
			}

			if(! ERI_UNIT_CD_T.equals("")) {
%>
		 		ERI_UNIT_CD='<%= ERI_UNIT_CD_T%>'
<%
			}

			if(! ERI_HUNIT_CD_T.equals("")) {
%>
		 		ERI_HUNIT_CD='<%= ERI_HUNIT_CD_T%>'
<%
			}

			if(! ERI_TUNIT_CD_T.equals("")) {
%>
		 		ERI_TUNIT_CD='<%= ERI_TUNIT_CD_T%>'
<%
			}

			if(! ERI_PART_CD_T.equals("")) {
%>
		 		ERI_PART_CD='<%= ERI_PART_CD_T%>'
<%
			}

			if(! ERI_CLINIC_CD_T.equals("")) {
%>
		 		ERI_CLINIC_CD='<%= ERI_CLINIC_CD_T%>'
<%
			}

			if(! ERI_TEST_CD_T.equals("")) {
%>
		 		ERI_TEST_CD='<%= ERI_TEST_CD_T%>'
<%
			}

			if(! ERI_LOW_KD_T.equals("")) {
%>
		 		ERI_LOW_KD='<%= ERI_LOW_KD_T%>'
<%
			}

			if(! ERI_RSLT_LOW_T.equals("")) {
%>
		 		ERI_RSLT_LOW='<%= ERI_RSLT_LOW_T%>'
<%
			}

			if(! ERI_HIGH_KD_T.equals("")) {
%>
		 		ERI_HIGH_KD='<%= ERI_HIGH_KD_T%>'
<%
			}

			if(! ERI_RSLT_HIGH_T.equals("")) {
%>
		 		ERI_RSLT_HIGH='<%= ERI_RSLT_HIGH_T%>'
<%
			}

			if(! ERI_CHAR_VAL_T.equals("")) {
%>
		 		ERI_CHAR_VAL='<%= ERI_CHAR_VAL_T%>'
<%
			}

			if(! ERI_HERT_CD_T.equals("")) {
%>
		 		ERI_HERT_CD='<%= ERI_HERT_CD_T%>'
<%
			}

			if(! ERI_SPRT_CD_T.equals("")) {
%>
		 		ERI_SPRT_CD='<%= ERI_SPRT_CD_T%>'
<%
			}

			if(! ERI_ALSB_PANJ_T.equals("")) {
%>
		 		ERI_ALSB_PANJ='<%= ERI_ALSB_PANJ_T%>'
<%
			}

			if(! ERI_HTSB_PANJ_T.equals("")) {
%>
		 		ERI_HTSB_PANJ='<%= ERI_HTSB_PANJ_T%>'
<%
			}

			if(! ERI_WOSB_PANJ_T.equals("")) {
%>
		 		ERI_WOSB_PANJ='<%= ERI_WOSB_PANJ_T%>'
<%
			}

			if(! ERI_SPSB_PANJ_T.equals("")) {
%>
		 		ERI_SPSB_PANJ='<%= ERI_SPSB_PANJ_T%>'
<%
			}

			if(! ERI_EMSB_PANJ_T.equals("")) {
%>
		 		ERI_EMSB_PANJ='<%= ERI_EMSB_PANJ_T%>'
<%
			}

			if(! ERI_STSB_PANJ_T.equals("")) {
%>
		 		ERI_STSB_PANJ='<%= ERI_STSB_PANJ_T%>'
<%
			}

			if(! ERI_START_DTT_T.equals("")) {
%>
		 		ERI_START_DTT='<%= ERI_START_DTT_T%>'
<%
			}

			if(! ERI_RECV_DTT_T.equals("")) {
%>
		 		ERI_RECV_DTT='<%= ERI_RECV_DTT_T%>'
<%
			}

			if(! ERI_INPUT_DTT_T.equals("")) {
%>
		 		ERI_INPUT_DTT='<%= ERI_INPUT_DTT_T%>'
<%
			}

			if(! ERI_CFRM_DTT_T.equals("")) {
%>
		 		ERI_CFRM_DTT='<%= ERI_CFRM_DTT_T%>'
<%
			}

			if(! ERI_CNCL_YN_T.equals("")) {
%>
		 		ERI_CNCL_YN='<%= ERI_CNCL_YN_T%>'
<%
			}

			if(! ERI_STEP_CD_T.equals("")) {
%>
		 		ERI_STEP_CD='<%= ERI_STEP_CD_T%>'
<%
			}

			if(! ERI_DSS_CD_T.equals("")) {
%>
		 		ERI_DSS_CD='<%= ERI_DSS_CD_T%>'
<%
			}

			if(! ERI_INPT_ID_T.equals("")) {
%>
		 		ERI_INPT_ID='<%= ERI_INPT_ID_T%>'
<%
			}

			if(! ERI_INPT_DTT_T.equals("")) {
%>
		 		ERI_INPT_DTT='<%= ERI_INPT_DTT_T%>'
<%
			}

			if(! ERI_MODI_ID_T.equals("")) {
%>
		 		ERI_MODI_ID='<%= ERI_MODI_ID_T%>'
<%
			}

			if(! ERI_MODI_DTT_T.equals("")) {
%>
		 		ERI_MODI_DTT='<%= ERI_MODI_DTT_T%>'
<%
			}

			if(! ERI_OSSB_CD_T.equals("")) {
%>
		 		ERI_OSSB_CD='<%= ERI_OSSB_CD_T%>'
<%
			}

			if(! ERI_OSRL_CD_T.equals("")) {
%>
		 		ERI_OSRL_CD='<%= ERI_OSRL_CD_T%>'
<%
			}

			if(! ERI_SPMIGUM_YN_T.equals("")) {
%>
		 		ERI_SPMIGUM_YN='<%= ERI_SPMIGUM_YN_T%>'
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

			if(! IIM_SNME_NM_T.equals("")) {
%>
		 		IIM_SNME_NM='<%= IIM_SNME_NM_T%>'
<%
			}

			if(! IIM_REJH_EX_T.equals("")) {
%>
		 		IIM_REJH_EX='<%= IIM_REJH_EX_T%>'
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

			if(! IIV_REF_NM_T.equals("")) {
%>
		 		IIV_REF_NM='<%= IIV_REF_NM_T%>'
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
