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
		String EXAM_KD = htMethod.get("EXAM_KD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(EXAM_KD == null) { EXAM_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 SELECT * FROM ( 
                         SELECT ET_RSLT_ITEM.*, IT_ITEM.IIM_NITEM_CD, IT_ITEM.IIM_KNME_NM, IT_ITEM.IIM_SNME_NM, IT_ITEM.IIM_REJH_EX,  IT_ITEM.IIM_TRTP_CD, 
                                ET_EXAM_ACPT.EEA_SEX_CD, ET_EXAM_ACPT.EEA_PSNL_AGE, ET_EXAM_ACPT.EEA_CHART_NO 
                         FROM ET_RSLT_ITEM, IT_ITEM, ET_EXAM_ACPT 
                         WHERE ET_RSLT_ITEM.ERI_ITEM_CD = IT_ITEM.IIM_ITEM_CD 
                           AND ET_RSLT_ITEM.ERI_EXAM_DT = ET_EXAM_ACPT.EEA_EXAM_DT 
                                  AND ET_RSLT_ITEM.ERI_EXAM_SQ = ET_EXAM_ACPT.EEA_EXAM_SQ
                           AND ET_RSLT_ITEM.ERI_EXAM_DT = :EXAM_DT
                           AND ET_RSLT_ITEM.ERI_EXAM_SQ = :EXAM_SQ
                           AND ET_RSLT_ITEM.ERI_CNCL_YN = 'N'
                      ) G 
                     
   LEFT OUTER JOIN  TABLE(GetItemVldtTable_PKG.GetItemVldtTable(ERI_ITEM_CD, EEA_SEX_CD, EEA_PSNL_AGE, ERI_EXAM_DT, :EXAM_KD)) A ON A.ITEM_CD = G.ERI_ITEM_CD
where nvl(A.Item_CD, ' ') <> ' ' 
		*/

		sql = " SELECT *";
		sql += " FROM ( SELECT ET_RSLT_ITEM.*, IT_ITEM.IIM_NITEM_CD, IT_ITEM.IIM_KNME_NM, IT_ITEM.IIM_SNME_NM, IT_ITEM.IIM_REJH_EX, IT_ITEM.IIM_TRTP_CD, ET_EXAM_ACPT.EEA_SEX_CD, ET_EXAM_ACPT.EEA_PSNL_AGE, ET_EXAM_ACPT.EEA_CHART_NO";
		sql += " FROM ET_RSLT_ITEM, IT_ITEM, ET_EXAM_ACPT";
		sql += " WHERE ET_RSLT_ITEM.ERI_ITEM_CD = IT_ITEM.IIM_ITEM_CD";
		sql += " AND ET_RSLT_ITEM.ERI_EXAM_DT = ET_EXAM_ACPT.EEA_EXAM_DT";
		sql += " AND ET_RSLT_ITEM.ERI_EXAM_SQ = ET_EXAM_ACPT.EEA_EXAM_SQ";
		sql += " AND ET_RSLT_ITEM.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND ET_RSLT_ITEM.ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND ET_RSLT_ITEM.ERI_CNCL_YN = 'N' ) G LEFT OUTER JOIN TABLE(GETITEMVLDTTABLE_PKG.GETITEMVLDTTABLE(ERI_ITEM_CD, EEA_SEX_CD, EEA_PSNL_AGE, ERI_EXAM_DT, '" + EXAM_KD + "')) A ON A.ITEM_CD = G.ERI_ITEM_CD";
		sql += " WHERE NVL(A.ITEM_CD, ' ') <> ' '";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGet_Result_Report_001 \n";
			G_INFO += "설명 : 신체검사 판정서 검사 결과 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " EXAM_KD : " + EXAM_KD + " \n";
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
		<s:AttributeType name='ERI_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EXAM_SQ' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ITEM_CD' rs:number='3'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HLTH_KD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_TOTAL_KD' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_STDT_KD' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EMPY_KD' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPCL_KD' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_DETL_KD' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_BLOOD_KD' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EACH_KD' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CVCL_KD' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ETC_KD' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ADD_KD' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HLTH_CD' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPCL_CD' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OCS_CD' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HPTL_CD' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EXGN_CD' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SORT_SQ' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CFRM_YN' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_KD' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PRCH_VL' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PRNM_VL' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VLDT_LH' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSPT_CNT' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSZR_KD' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CHAR_CD' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VERIFY_CD' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_CD' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_EX' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PACS_RSLT' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_TYPE_CD' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VLSV_YN' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_UNIT' rs:number='36' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_UNIT_CD' rs:number='37' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HUNIT_CD' rs:number='38' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_TUNIT_CD' rs:number='39' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PART_CD' rs:number='40' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CLINIC_CD' rs:number='41' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_TEST_CD' rs:number='42' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_LOW_KD' rs:number='43' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_LOW' rs:number='44' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HIGH_KD' rs:number='45' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_HIGH' rs:number='46' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CHAR_VAL' rs:number='47' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HERT_CD' rs:number='48' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPRT_CD' rs:number='49' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ALSB_PANJ' rs:number='50' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HTSB_PANJ' rs:number='51' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_WOSB_PANJ' rs:number='52' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPSB_PANJ' rs:number='53' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EMSB_PANJ' rs:number='54' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_STSB_PANJ' rs:number='55' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_START_DTT' rs:number='56' rs:nullable='true'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RECV_DTT' rs:number='57' rs:nullable='true'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_INPUT_DTT' rs:number='58' rs:nullable='true'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CFRM_DTT' rs:number='59' rs:nullable='true'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CNCL_YN' rs:number='60' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_STEP_CD' rs:number='61' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_DSS_CD' rs:number='62' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_INPT_ID' rs:number='63' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_INPT_DTT' rs:number='64' rs:nullable='true'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_MODI_ID' rs:number='65' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_MODI_DTT' rs:number='66' rs:nullable='true'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OSSB_CD' rs:number='67' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OSRL_CD' rs:number='68' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPMIGUM_YN' rs:number='69' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_EX2' rs:number='70' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_OCSC_SNO' rs:number='71' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_NITEM_CD' rs:number='72' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='73'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SNME_NM' rs:number='74' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_REJH_EX' rs:number='75' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='76' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='77' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='78' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='79' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_CD' rs:number='80' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RLOW' rs:number='81' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RHIGH' rs:number='82' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CHRVAL' rs:number='83' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='RUNIT' rs:number='84' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='RSPT' rs:number='85' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='LOWKD' rs:number='86' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='HIGHKD' rs:number='87' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RSZR_KD' rs:number='88' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
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
			String IIM_NITEM_CD_T = cRsList.getString("IIM_NITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String IIM_SNME_NM_T = cRsList.getString("IIM_SNME_NM");
			String IIM_REJH_EX_T = cRsList.getString("IIM_REJH_EX");
			String IIM_TRTP_CD_T = cRsList.getString("IIM_TRTP_CD");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String RLOW_T = cRsList.getString("RLOW");
			String RHIGH_T = cRsList.getString("RHIGH");
			String CHRVAL_T = cRsList.getString("CHRVAL");
			String RUNIT_T = cRsList.getString("RUNIT");
			String RSPT_T = cRsList.getString("RSPT");
			String LOWKD_T = cRsList.getString("LOWKD");
			String HIGHKD_T = cRsList.getString("HIGHKD");
			String RSZR_KD_T = cRsList.getString("RSZR_KD");
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

			if(! IIM_TRTP_CD_T.equals("")) {
%>
		 		IIM_TRTP_CD='<%= IIM_TRTP_CD_T%>'
<%
			}

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! ITEM_CD_T.equals("")) {
%>
		 		ITEM_CD='<%= ITEM_CD_T%>'
<%
			}

			if(! RLOW_T.equals("")) {
%>
		 		RLOW='<%= RLOW_T%>'
<%
			}

			if(! RHIGH_T.equals("")) {
%>
		 		RHIGH='<%= RHIGH_T%>'
<%
			}

			if(! CHRVAL_T.equals("")) {
%>
		 		CHRVAL='<%= CHRVAL_T%>'
<%
			}

			if(! RUNIT_T.equals("")) {
%>
		 		RUNIT='<%= RUNIT_T%>'
<%
			}

			if(! RSPT_T.equals("")) {
%>
		 		RSPT='<%= RSPT_T%>'
<%
			}

			if(! LOWKD_T.equals("")) {
%>
		 		LOWKD='<%= LOWKD_T%>'
<%
			}

			if(! HIGHKD_T.equals("")) {
%>
		 		HIGHKD='<%= HIGHKD_T%>'
<%
			}

			if(! RSZR_KD_T.equals("")) {
%>
		 		RSZR_KD='<%= RSZR_KD_T%>'
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
