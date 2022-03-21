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
		String OSRL_CD = htMethod.get("OSRL_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(OSRL_CD == null) { OSRL_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT ET_RSLT_ITEM.*, IT_ITEM.*,                                                             
 CASE WHEN ERI_TOTAL_KD > 0 THEN '1' WHEN ERI_HLTH_KD > 0 THEN '2'
      WHEN ERI_SPCL_KD > 0 THEN '4'                                 
      WHEN ERI_EMPY_KD > 0 THEN '5' WHEN ERI_STDT_KD > 0 THEN '6' 
      ELSE  '1' END AS VLDT_KD                                      
FROM ET_RSLT_ITEM                                                     
LEFT OUTER JOIN IT_ITEM ON IIM_ITEM_CD = ERI_ITEM_CD                  
  WHERE ERI_EXAM_DT = :EXAM_DT
    And ERI_EXAM_SQ = :EXAM_SQ
    AND ERI_OSRL_CD = :OSRL_CD
		*/

		sql = " SELECT ET_RSLT_ITEM.*, IT_ITEM.*, CASE WHEN ERI_TOTAL_KD > 0 THEN '1' WHEN ERI_HLTH_KD > 0 THEN '2' WHEN ERI_SPCL_KD > 0 THEN '4' WHEN ERI_EMPY_KD > 0 THEN '5' WHEN ERI_STDT_KD > 0 THEN '6' ELSE '1' END AS VLDT_KD";
		sql += " FROM ET_RSLT_ITEM LEFT OUTER JOIN IT_ITEM";
		sql += " ON IIM_ITEM_CD = ERI_ITEM_CD";
		sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND ERI_OSRL_CD = '" + OSRL_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMain_rsltNoramlUpdate_001 \n";
			G_INFO += "설명 : 결과정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " OSRL_CD : " + OSRL_CD + " \n";
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
		<s:AttributeType name='ERI_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ITEM_CD' rs:number='3' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HLTH_KD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_TOTAL_KD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_TOTAL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_STDT_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_STDT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EMPY_KD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_EMPY_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPCL_KD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPCL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_DETL_KD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_DETL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_BLOOD_KD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_BLOOD_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EACH_KD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_EACH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CVCL_KD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_CVCL_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ETC_KD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_ETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ADD_KD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_ADD_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HLTH_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_HLTH_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPCL_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OCS_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_OCS_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HPTL_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_HPTL_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EXGN_CD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_EXGN_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SORT_SQ' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CFRM_YN' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_CFRM_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_KD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PRCH_VL' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_PRCH_VL'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PRNM_VL' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_PRNM_VL'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VLDT_LH' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_VLDT_LH'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSPT_CNT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSPT_CNT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSZR_KD' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSZR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CHAR_CD' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_CHAR_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VERIFY_CD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_VERIFY_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_CD' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_EX' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PACS_RSLT' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_PACS_RSLT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_TYPE_CD' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_TYPE_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VLSV_YN' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_VLSV_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_UNIT' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_UNIT_CD' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_UNIT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HUNIT_CD' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_HUNIT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_TUNIT_CD' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_TUNIT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PART_CD' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_PART_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CLINIC_CD' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_CLINIC_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_TEST_CD' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_TEST_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_LOW_KD' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_LOW_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_LOW' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HIGH_KD' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_HIGH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_HIGH' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CHAR_VAL' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_CHAR_VAL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HERT_CD' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_HERT_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPRT_CD' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ALSB_PANJ' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_ALSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HTSB_PANJ' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_HTSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_WOSB_PANJ' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_WOSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPSB_PANJ' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EMSB_PANJ' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_EMSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_STSB_PANJ' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_STSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_START_DTT' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_START_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RECV_DTT' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RECV_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_INPUT_DTT' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CFRM_DTT' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_CFRM_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CNCL_YN' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_CNCL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_STEP_CD' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_STEP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_DSS_CD' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_DSS_CD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_INPT_ID' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_INPT_DTT' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_MODI_ID' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_MODI_DTT' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OSSB_CD' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_OSSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OSRL_CD' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_OSRL_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPMIGUM_YN' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPMIGUM_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_EX2' rs:number='70' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_EX2'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OCSC_SNO' rs:number='71' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_OCSC_SNO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ITEM_CD' rs:number='72' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_NITEM_CD' rs:number='73' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_NITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='74' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ENME_NM' rs:number='75' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_ENME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_CNME_NM' rs:number='76' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_CNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_JNME_NM' rs:number='77' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_JNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SNME_NM' rs:number='78' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_OSCD_CD' rs:number='79' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_GBCD_CD' rs:number='80' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_GBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SBCD_CD' rs:number='81' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_EXGN_CD' rs:number='82' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_EXGN_CD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RIGN_KD' rs:number='83' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_RIGN_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RECH_CD' rs:number='84' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_RECH_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SAMP_CD' rs:number='85' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SAMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RSLT_KD' rs:number='86' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SORT_SQ' rs:number='87' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_UICH_YN' rs:number='88' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_UICH_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_DISE_EX' rs:number='89' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_DISE_EX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_GBHC_KD' rs:number='90' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_GBHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='16'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_STHC_KD' rs:number='91' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_STHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_EMHC_KD' rs:number='92' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_EMHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_HYHC_KD' rs:number='93' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_HYHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_APHC_KD' rs:number='94' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_APHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_JGJH_CD' rs:number='95' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_JGJH_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TGJH_CD' rs:number='96' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TGJH_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_BLPT_CD' rs:number='97' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_BLPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_REJH_EX' rs:number='98' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_REJH_EX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_CANCER_CD' rs:number='99' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_CANCER_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_CNIT_CD' rs:number='100' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_CNIT_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TUSE_YN' rs:number='101' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TUSE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TPRT_CD' rs:number='102' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TPRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='103' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRTP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRLT_CD' rs:number='104' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRNM_CD' rs:number='105' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRNM_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TEDT_YR' rs:number='106' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TEDT_YR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TETC_YN' rs:number='107' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TETC_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_THPR_YN' rs:number='108' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_THPR_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_THPR1_CD' rs:number='109' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_THPR1_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_THPR2_CD' rs:number='110' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_THPR2_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TSND_YN' rs:number='111' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TSND_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TBIO_YN' rs:number='112' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TBIO_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TXRAY_YN' rs:number='113' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TXRAY_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_OSSB_CD' rs:number='114' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_OSRL_CD' rs:number='115' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSRL_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_CDOP_KD' rs:number='116' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_CDOP_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ACAL_YN' rs:number='117' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_ACAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SUTK_YN' rs:number='118' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SUTK_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_PITEM_CD' rs:number='119' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_PITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_DTVL_YN' rs:number='120' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_DTVL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_USE_YN' rs:number='121' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_NUSE_ID' rs:number='122' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_NUSE_DTT' rs:number='123' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_INPT_ID' rs:number='124' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_INPT_DTT' rs:number='125' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_MODI_ID' rs:number='126' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_MODI_DTT' rs:number='127' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_MIN_VL' rs:number='128' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_MIN_VL'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_MAX_VL' rs:number='129' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_MAX_VL'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SANBO_KD' rs:number='130' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SANBO_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SANBO_CD' rs:number='131' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SANBO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SANBO_CAL' rs:number='132' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SANBO_CAL'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_DFLT_VL' rs:number='133' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_DFLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='25'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_PNUM_CD' rs:number='134' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_PNUM_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SUTK_CD' rs:number='135' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SUTK_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TEMP_SQ' rs:number='136' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TEMP_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='UB_ORDCODE_NM' rs:number='137' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='UB_ORDCODE_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='UB_EDICODE_NM' rs:number='138' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='UB_EDICODE_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='UB_ORD_CODE' rs:number='139' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='UB_ORD_CODE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='UB_EDI_CODE' rs:number='140' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='UB_EDI_CODE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VLDT_KD' rs:number='141' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='142' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c142' rs:name='ROWID' rs:number='143' rs:rowid='true' rs:hidden='true'>
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
			String ERI_RSLT_EX2_T = cRsList.getString("ERI_RSLT_EX2");
			String ERI_OCSC_SNO_T = cRsList.getString("ERI_OCSC_SNO");
			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String IIM_NITEM_CD_T = cRsList.getString("IIM_NITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String IIM_ENME_NM_T = cRsList.getString("IIM_ENME_NM");
			String IIM_CNME_NM_T = cRsList.getString("IIM_CNME_NM");
			String IIM_JNME_NM_T = cRsList.getString("IIM_JNME_NM");
			String IIM_SNME_NM_T = cRsList.getString("IIM_SNME_NM");
			String IIM_OSCD_CD_T = cRsList.getString("IIM_OSCD_CD");
			String IIM_GBCD_CD_T = cRsList.getString("IIM_GBCD_CD");
			String IIM_SBCD_CD_T = cRsList.getString("IIM_SBCD_CD");
			String IIM_EXGN_CD_T = cRsList.getString("IIM_EXGN_CD");
			String IIM_RIGN_KD_T = cRsList.getString("IIM_RIGN_KD");
			String IIM_RECH_CD_T = cRsList.getString("IIM_RECH_CD");
			String IIM_SAMP_CD_T = cRsList.getString("IIM_SAMP_CD");
			String IIM_RSLT_KD_T = cRsList.getString("IIM_RSLT_KD");
			String IIM_SORT_SQ_T = cRsList.getString("IIM_SORT_SQ");
			String IIM_UICH_YN_T = cRsList.getString("IIM_UICH_YN");
			String IIM_DISE_EX_T = cRsList.getString("IIM_DISE_EX");
			String IIM_GBHC_KD_T = cRsList.getString("IIM_GBHC_KD");
			String IIM_STHC_KD_T = cRsList.getString("IIM_STHC_KD");
			String IIM_EMHC_KD_T = cRsList.getString("IIM_EMHC_KD");
			String IIM_HYHC_KD_T = cRsList.getString("IIM_HYHC_KD");
			String IIM_APHC_KD_T = cRsList.getString("IIM_APHC_KD");
			String IIM_JGJH_CD_T = cRsList.getString("IIM_JGJH_CD");
			String IIM_TGJH_CD_T = cRsList.getString("IIM_TGJH_CD");
			String IIM_BLPT_CD_T = cRsList.getString("IIM_BLPT_CD");
			String IIM_REJH_EX_T = cRsList.getString("IIM_REJH_EX");
			String IIM_CANCER_CD_T = cRsList.getString("IIM_CANCER_CD");
			String IIM_CNIT_CD_T = cRsList.getString("IIM_CNIT_CD");
			String IIM_TUSE_YN_T = cRsList.getString("IIM_TUSE_YN");
			String IIM_TPRT_CD_T = cRsList.getString("IIM_TPRT_CD");
			String IIM_TRTP_CD_T = cRsList.getString("IIM_TRTP_CD");
			String IIM_TRLT_CD_T = cRsList.getString("IIM_TRLT_CD");
			String IIM_TRNM_CD_T = cRsList.getString("IIM_TRNM_CD");
			String IIM_TEDT_YR_T = cRsList.getString("IIM_TEDT_YR");
			String IIM_TETC_YN_T = cRsList.getString("IIM_TETC_YN");
			String IIM_THPR_YN_T = cRsList.getString("IIM_THPR_YN");
			String IIM_THPR1_CD_T = cRsList.getString("IIM_THPR1_CD");
			String IIM_THPR2_CD_T = cRsList.getString("IIM_THPR2_CD");
			String IIM_TSND_YN_T = cRsList.getString("IIM_TSND_YN");
			String IIM_TBIO_YN_T = cRsList.getString("IIM_TBIO_YN");
			String IIM_TXRAY_YN_T = cRsList.getString("IIM_TXRAY_YN");
			String IIM_OSSB_CD_T = cRsList.getString("IIM_OSSB_CD");
			String IIM_OSRL_CD_T = cRsList.getString("IIM_OSRL_CD");
			String IIM_CDOP_KD_T = cRsList.getString("IIM_CDOP_KD");
			String IIM_ACAL_YN_T = cRsList.getString("IIM_ACAL_YN");
			String IIM_SUTK_YN_T = cRsList.getString("IIM_SUTK_YN");
			String IIM_PITEM_CD_T = cRsList.getString("IIM_PITEM_CD");
			String IIM_DTVL_YN_T = cRsList.getString("IIM_DTVL_YN");
			String IIM_USE_YN_T = cRsList.getString("IIM_USE_YN");
			String IIM_NUSE_ID_T = cRsList.getString("IIM_NUSE_ID");
			String IIM_NUSE_DTT_T = cRsList.getDate2("IIM_NUSE_DTT");
			String IIM_INPT_ID_T = cRsList.getString("IIM_INPT_ID");
			String IIM_INPT_DTT_T = cRsList.getDate2("IIM_INPT_DTT");
			String IIM_MODI_ID_T = cRsList.getString("IIM_MODI_ID");
			String IIM_MODI_DTT_T = cRsList.getDate2("IIM_MODI_DTT");
			String IIM_MIN_VL_T = cRsList.getString("IIM_MIN_VL");
			String IIM_MAX_VL_T = cRsList.getString("IIM_MAX_VL");
			String IIM_SANBO_KD_T = cRsList.getString("IIM_SANBO_KD");
			String IIM_SANBO_CD_T = cRsList.getString("IIM_SANBO_CD");
			String IIM_SANBO_CAL_T = cRsList.getString("IIM_SANBO_CAL");
			String IIM_DFLT_VL_T = cRsList.getString("IIM_DFLT_VL");
			String IIM_PNUM_CD_T = cRsList.getString("IIM_PNUM_CD");
			String IIM_SUTK_CD_T = cRsList.getString("IIM_SUTK_CD");
			String IIM_TEMP_SQ_T = cRsList.getString("IIM_TEMP_SQ");
			String UB_ORDCODE_NM_T = cRsList.getString("UB_ORDCODE_NM");
			String UB_EDICODE_NM_T = cRsList.getString("UB_EDICODE_NM");
			String UB_ORD_CODE_T = cRsList.getString("UB_ORD_CODE");
			String UB_EDI_CODE_T = cRsList.getString("UB_EDI_CODE");
			String VLDT_KD_T = cRsList.getString("VLDT_KD");
			String ROWID_T = cRsList.getString("ROWID");
			String c142_T = cRsList.getString("c142");
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

			if(! ERI_RSLT_EX2_T.equals("")) {
%>
		 		ERI_RSLT_EX2='<%= ERI_RSLT_EX2_T%>'
<%
			}

			if(! ERI_OCSC_SNO_T.equals("")) {
%>
		 		ERI_OCSC_SNO='<%= ERI_OCSC_SNO_T%>'
<%
			}

			if(! IIM_ITEM_CD_T.equals("")) {
%>
		 		IIM_ITEM_CD='<%= IIM_ITEM_CD_T%>'
<%
			}

			if(! IIM_NITEM_CD_T.equals("")) {
%>
		 		IIM_NITEM_CD='<%= IIM_NITEM_CD_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
<%
			}

			if(! IIM_ENME_NM_T.equals("")) {
%>
		 		IIM_ENME_NM='<%= IIM_ENME_NM_T%>'
<%
			}

			if(! IIM_CNME_NM_T.equals("")) {
%>
		 		IIM_CNME_NM='<%= IIM_CNME_NM_T%>'
<%
			}

			if(! IIM_JNME_NM_T.equals("")) {
%>
		 		IIM_JNME_NM='<%= IIM_JNME_NM_T%>'
<%
			}

			if(! IIM_SNME_NM_T.equals("")) {
%>
		 		IIM_SNME_NM='<%= IIM_SNME_NM_T%>'
<%
			}

			if(! IIM_OSCD_CD_T.equals("")) {
%>
		 		IIM_OSCD_CD='<%= IIM_OSCD_CD_T%>'
<%
			}

			if(! IIM_GBCD_CD_T.equals("")) {
%>
		 		IIM_GBCD_CD='<%= IIM_GBCD_CD_T%>'
<%
			}

			if(! IIM_SBCD_CD_T.equals("")) {
%>
		 		IIM_SBCD_CD='<%= IIM_SBCD_CD_T%>'
<%
			}

			if(! IIM_EXGN_CD_T.equals("")) {
%>
		 		IIM_EXGN_CD='<%= IIM_EXGN_CD_T%>'
<%
			}

			if(! IIM_RIGN_KD_T.equals("")) {
%>
		 		IIM_RIGN_KD='<%= IIM_RIGN_KD_T%>'
<%
			}

			if(! IIM_RECH_CD_T.equals("")) {
%>
		 		IIM_RECH_CD='<%= IIM_RECH_CD_T%>'
<%
			}

			if(! IIM_SAMP_CD_T.equals("")) {
%>
		 		IIM_SAMP_CD='<%= IIM_SAMP_CD_T%>'
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

			if(! IIM_UICH_YN_T.equals("")) {
%>
		 		IIM_UICH_YN='<%= IIM_UICH_YN_T%>'
<%
			}

			if(! IIM_DISE_EX_T.equals("")) {
%>
		 		IIM_DISE_EX='<%= IIM_DISE_EX_T%>'
<%
			}

			if(! IIM_GBHC_KD_T.equals("")) {
%>
		 		IIM_GBHC_KD='<%= IIM_GBHC_KD_T%>'
<%
			}

			if(! IIM_STHC_KD_T.equals("")) {
%>
		 		IIM_STHC_KD='<%= IIM_STHC_KD_T%>'
<%
			}

			if(! IIM_EMHC_KD_T.equals("")) {
%>
		 		IIM_EMHC_KD='<%= IIM_EMHC_KD_T%>'
<%
			}

			if(! IIM_HYHC_KD_T.equals("")) {
%>
		 		IIM_HYHC_KD='<%= IIM_HYHC_KD_T%>'
<%
			}

			if(! IIM_APHC_KD_T.equals("")) {
%>
		 		IIM_APHC_KD='<%= IIM_APHC_KD_T%>'
<%
			}

			if(! IIM_JGJH_CD_T.equals("")) {
%>
		 		IIM_JGJH_CD='<%= IIM_JGJH_CD_T%>'
<%
			}

			if(! IIM_TGJH_CD_T.equals("")) {
%>
		 		IIM_TGJH_CD='<%= IIM_TGJH_CD_T%>'
<%
			}

			if(! IIM_BLPT_CD_T.equals("")) {
%>
		 		IIM_BLPT_CD='<%= IIM_BLPT_CD_T%>'
<%
			}

			if(! IIM_REJH_EX_T.equals("")) {
%>
		 		IIM_REJH_EX='<%= IIM_REJH_EX_T%>'
<%
			}

			if(! IIM_CANCER_CD_T.equals("")) {
%>
		 		IIM_CANCER_CD='<%= IIM_CANCER_CD_T%>'
<%
			}

			if(! IIM_CNIT_CD_T.equals("")) {
%>
		 		IIM_CNIT_CD='<%= IIM_CNIT_CD_T%>'
<%
			}

			if(! IIM_TUSE_YN_T.equals("")) {
%>
		 		IIM_TUSE_YN='<%= IIM_TUSE_YN_T%>'
<%
			}

			if(! IIM_TPRT_CD_T.equals("")) {
%>
		 		IIM_TPRT_CD='<%= IIM_TPRT_CD_T%>'
<%
			}

			if(! IIM_TRTP_CD_T.equals("")) {
%>
		 		IIM_TRTP_CD='<%= IIM_TRTP_CD_T%>'
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

			if(! IIM_TEDT_YR_T.equals("")) {
%>
		 		IIM_TEDT_YR='<%= IIM_TEDT_YR_T%>'
<%
			}

			if(! IIM_TETC_YN_T.equals("")) {
%>
		 		IIM_TETC_YN='<%= IIM_TETC_YN_T%>'
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

			if(! IIM_TSND_YN_T.equals("")) {
%>
		 		IIM_TSND_YN='<%= IIM_TSND_YN_T%>'
<%
			}

			if(! IIM_TBIO_YN_T.equals("")) {
%>
		 		IIM_TBIO_YN='<%= IIM_TBIO_YN_T%>'
<%
			}

			if(! IIM_TXRAY_YN_T.equals("")) {
%>
		 		IIM_TXRAY_YN='<%= IIM_TXRAY_YN_T%>'
<%
			}

			if(! IIM_OSSB_CD_T.equals("")) {
%>
		 		IIM_OSSB_CD='<%= IIM_OSSB_CD_T%>'
<%
			}

			if(! IIM_OSRL_CD_T.equals("")) {
%>
		 		IIM_OSRL_CD='<%= IIM_OSRL_CD_T%>'
<%
			}

			if(! IIM_CDOP_KD_T.equals("")) {
%>
		 		IIM_CDOP_KD='<%= IIM_CDOP_KD_T%>'
<%
			}

			if(! IIM_ACAL_YN_T.equals("")) {
%>
		 		IIM_ACAL_YN='<%= IIM_ACAL_YN_T%>'
<%
			}

			if(! IIM_SUTK_YN_T.equals("")) {
%>
		 		IIM_SUTK_YN='<%= IIM_SUTK_YN_T%>'
<%
			}

			if(! IIM_PITEM_CD_T.equals("")) {
%>
		 		IIM_PITEM_CD='<%= IIM_PITEM_CD_T%>'
<%
			}

			if(! IIM_DTVL_YN_T.equals("")) {
%>
		 		IIM_DTVL_YN='<%= IIM_DTVL_YN_T%>'
<%
			}

			if(! IIM_USE_YN_T.equals("")) {
%>
		 		IIM_USE_YN='<%= IIM_USE_YN_T%>'
<%
			}

			if(! IIM_NUSE_ID_T.equals("")) {
%>
		 		IIM_NUSE_ID='<%= IIM_NUSE_ID_T%>'
<%
			}

			if(! IIM_NUSE_DTT_T.equals("")) {
%>
		 		IIM_NUSE_DTT='<%= IIM_NUSE_DTT_T%>'
<%
			}

			if(! IIM_INPT_ID_T.equals("")) {
%>
		 		IIM_INPT_ID='<%= IIM_INPT_ID_T%>'
<%
			}

			if(! IIM_INPT_DTT_T.equals("")) {
%>
		 		IIM_INPT_DTT='<%= IIM_INPT_DTT_T%>'
<%
			}

			if(! IIM_MODI_ID_T.equals("")) {
%>
		 		IIM_MODI_ID='<%= IIM_MODI_ID_T%>'
<%
			}

			if(! IIM_MODI_DTT_T.equals("")) {
%>
		 		IIM_MODI_DTT='<%= IIM_MODI_DTT_T%>'
<%
			}

			if(! IIM_MIN_VL_T.equals("")) {
%>
		 		IIM_MIN_VL='<%= IIM_MIN_VL_T%>'
<%
			}

			if(! IIM_MAX_VL_T.equals("")) {
%>
		 		IIM_MAX_VL='<%= IIM_MAX_VL_T%>'
<%
			}

			if(! IIM_SANBO_KD_T.equals("")) {
%>
		 		IIM_SANBO_KD='<%= IIM_SANBO_KD_T%>'
<%
			}

			if(! IIM_SANBO_CD_T.equals("")) {
%>
		 		IIM_SANBO_CD='<%= IIM_SANBO_CD_T%>'
<%
			}

			if(! IIM_SANBO_CAL_T.equals("")) {
%>
		 		IIM_SANBO_CAL='<%= IIM_SANBO_CAL_T%>'
<%
			}

			if(! IIM_DFLT_VL_T.equals("")) {
%>
		 		IIM_DFLT_VL='<%= IIM_DFLT_VL_T%>'
<%
			}

			if(! IIM_PNUM_CD_T.equals("")) {
%>
		 		IIM_PNUM_CD='<%= IIM_PNUM_CD_T%>'
<%
			}

			if(! IIM_SUTK_CD_T.equals("")) {
%>
		 		IIM_SUTK_CD='<%= IIM_SUTK_CD_T%>'
<%
			}

			if(! IIM_TEMP_SQ_T.equals("")) {
%>
		 		IIM_TEMP_SQ='<%= IIM_TEMP_SQ_T%>'
<%
			}

			if(! UB_ORDCODE_NM_T.equals("")) {
%>
		 		UB_ORDCODE_NM='<%= UB_ORDCODE_NM_T%>'
<%
			}

			if(! UB_EDICODE_NM_T.equals("")) {
%>
		 		UB_EDICODE_NM='<%= UB_EDICODE_NM_T%>'
<%
			}

			if(! UB_ORD_CODE_T.equals("")) {
%>
		 		UB_ORD_CODE='<%= UB_ORD_CODE_T%>'
<%
			}

			if(! UB_EDI_CODE_T.equals("")) {
%>
		 		UB_EDI_CODE='<%= UB_EDI_CODE_T%>'
<%
			}

			if(! VLDT_KD_T.equals("")) {
%>
		 		VLDT_KD='<%= VLDT_KD_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c142_T.equals("")) {
%>
		 		c142='<%= c142_T%>'
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
