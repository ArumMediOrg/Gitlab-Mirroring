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

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select * from PT_SED_PANJUNG
where PSP_EXAM_DT = :EXAM_DT
  and PSP_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT *";
		sql += " FROM PT_SED_PANJUNG";
		sql += " WHERE PSP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND PSP_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : QRinresultA4_2018_DetailBand1BeforePrint_002 \n";
			G_INFO += "설명 : 2차 판정정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='PSP_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG' rs:basecolumn='PSP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG' rs:basecolumn='PSP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_TRANC_DATE' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_TRANC_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RESULT_DATE' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_RESULT_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_CESD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_CESD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_GDS' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_GDS'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_KDSQC' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_KDSQC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_FIR_VIEW' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_FIR_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RVIEW' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_RVIEW'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_BVIEW' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_BVIEW'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_DOCTORSED' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_DOCTORSED'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_NICO_SM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_NICO_SM'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_SM' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_SM'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SCORE_SM' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_SCORE_SM'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_EVALU_DRN' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_EVALU_DRN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_DRN' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_DRN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SCORE_DRN' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_SCORE_DRN'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_EVALU_SPT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_EVALU_SPT'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_SPT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_SPT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSTM_SPT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSTM_SPT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSNUM_SPT' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSNUM_SPT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SCORE_SPT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_SCORE_SPT'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_EVALU_NUT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_EVALU_NUT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RECOMDAI_NUT' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_RECOMDAI_NUT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RECOMPRO_NUT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_RECOMPRO_NUT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RECOMVEG_NUT' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_RECOMVEG_NUT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RESTFAT_NUT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_RESTFAT_NUT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RESTSGA_NUT' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_RESTSGA_NUT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RESTSALT_NUT' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_RESTSALT_NUT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_BFAST_NUT' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_BFAST_NUT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_ALLFOOD_NUT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_ALLFOOD_NUT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_NUT' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_NUT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SCORE_NUT' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_SCORE_NUT'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_BMI_PYC' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_BMI_PYC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_WAIST_PYC' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_WAIST_PYC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_REPAST_PYC' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_REPAST_PYC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SNACK_PYC' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_SNACK_PYC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_DRINK_PYC' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_DRINK_PYC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_FASTFD_PYC' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_FASTFD_PYC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SPORT_PYC' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_SPORT_PYC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_CRINIC_PYC' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_CRINIC_PYC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_ETC_PYC' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_ETC_PYC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_METH_GLO' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_METH_GLO'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RESULT_GLO' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_RESULT_GLO'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RESULT_HIBL' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_RESULT_HIBL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_INPUT_ID' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_INPUT_DTT' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_MODI_DTT' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_MODI_ID' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RVAL_GLO' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_RVAL_GLO'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_HIBLOOD_VAL' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_HIBLOOD_VAL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_LIBLOOD_VAL' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_LIBLOOD_VAL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SCORE_CESD' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_SCORE_CESD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SCORE_GDS' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_SCORE_GDS'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_SCORE_SQC' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_SCORE_SQC'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_FIX_YN' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_FIX_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_EVALU_SM' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_EVALU_SM'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_SM_YN' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_SM_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_DRN_YN' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_DRN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_SPT_TX' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_SPT_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSTM_SPT_TX' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSTM_SPT_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_SPT_YN' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_SPT_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_NUT_YN' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_NUT_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_ETC_PYC_TX' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_ETC_PYC_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_PYC_YN' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_PYC_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_CESD_INFO_YN' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_CESD_INFO_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_LIFE_YN' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_LIFE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='68' rs:rowid='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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

			String PSP_EXAM_DT_T = cRsList.getString("PSP_EXAM_DT");
			String PSP_EXAM_SQ_T = cRsList.getString("PSP_EXAM_SQ");
			String PSP_TRANC_DATE_T = cRsList.getString("PSP_TRANC_DATE");
			String PSP_RESULT_DATE_T = cRsList.getString("PSP_RESULT_DATE");
			String PSP_CESD_T = cRsList.getString("PSP_CESD");
			String PSP_GDS_T = cRsList.getString("PSP_GDS");
			String PSP_KDSQC_T = cRsList.getString("PSP_KDSQC");
			String PSP_FIR_VIEW_T = cRsList.getString("PSP_FIR_VIEW");
			String PSP_RVIEW_T = cRsList.getString("PSP_RVIEW");
			String PSP_BVIEW_T = cRsList.getString("PSP_BVIEW");
			String PSP_DOCTORSED_T = cRsList.getString("PSP_DOCTORSED");
			String PSP_NICO_SM_T = cRsList.getString("PSP_NICO_SM");
			String PSP_PRSCR_SM_T = cRsList.getString("PSP_PRSCR_SM");
			String PSP_SCORE_SM_T = cRsList.getString("PSP_SCORE_SM");
			String PSP_EVALU_DRN_T = cRsList.getString("PSP_EVALU_DRN");
			String PSP_PRSCR_DRN_T = cRsList.getString("PSP_PRSCR_DRN");
			String PSP_SCORE_DRN_T = cRsList.getString("PSP_SCORE_DRN");
			String PSP_EVALU_SPT_T = cRsList.getString("PSP_EVALU_SPT");
			String PSP_PRSCR_SPT_T = cRsList.getString("PSP_PRSCR_SPT");
			String PSP_PRSTM_SPT_T = cRsList.getString("PSP_PRSTM_SPT");
			String PSP_PRSNUM_SPT_T = cRsList.getString("PSP_PRSNUM_SPT");
			String PSP_SCORE_SPT_T = cRsList.getString("PSP_SCORE_SPT");
			String PSP_EVALU_NUT_T = cRsList.getString("PSP_EVALU_NUT");
			String PSP_RECOMDAI_NUT_T = cRsList.getString("PSP_RECOMDAI_NUT");
			String PSP_RECOMPRO_NUT_T = cRsList.getString("PSP_RECOMPRO_NUT");
			String PSP_RECOMVEG_NUT_T = cRsList.getString("PSP_RECOMVEG_NUT");
			String PSP_RESTFAT_NUT_T = cRsList.getString("PSP_RESTFAT_NUT");
			String PSP_RESTSGA_NUT_T = cRsList.getString("PSP_RESTSGA_NUT");
			String PSP_RESTSALT_NUT_T = cRsList.getString("PSP_RESTSALT_NUT");
			String PSP_BFAST_NUT_T = cRsList.getString("PSP_BFAST_NUT");
			String PSP_ALLFOOD_NUT_T = cRsList.getString("PSP_ALLFOOD_NUT");
			String PSP_PRSCR_NUT_T = cRsList.getString("PSP_PRSCR_NUT");
			String PSP_SCORE_NUT_T = cRsList.getString("PSP_SCORE_NUT");
			String PSP_BMI_PYC_T = cRsList.getString("PSP_BMI_PYC");
			String PSP_WAIST_PYC_T = cRsList.getString("PSP_WAIST_PYC");
			String PSP_REPAST_PYC_T = cRsList.getString("PSP_REPAST_PYC");
			String PSP_SNACK_PYC_T = cRsList.getString("PSP_SNACK_PYC");
			String PSP_DRINK_PYC_T = cRsList.getString("PSP_DRINK_PYC");
			String PSP_FASTFD_PYC_T = cRsList.getString("PSP_FASTFD_PYC");
			String PSP_SPORT_PYC_T = cRsList.getString("PSP_SPORT_PYC");
			String PSP_CRINIC_PYC_T = cRsList.getString("PSP_CRINIC_PYC");
			String PSP_ETC_PYC_T = cRsList.getString("PSP_ETC_PYC");
			String PSP_METH_GLO_T = cRsList.getString("PSP_METH_GLO");
			String PSP_RESULT_GLO_T = cRsList.getString("PSP_RESULT_GLO");
			String PSP_RESULT_HIBL_T = cRsList.getString("PSP_RESULT_HIBL");
			String PSP_INPUT_ID_T = cRsList.getString("PSP_INPUT_ID");
			String PSP_INPUT_DTT_T = cRsList.getDate2("PSP_INPUT_DTT");
			String PSP_MODI_DTT_T = cRsList.getDate2("PSP_MODI_DTT");
			String PSP_MODI_ID_T = cRsList.getString("PSP_MODI_ID");
			String PSP_RVAL_GLO_T = cRsList.getString("PSP_RVAL_GLO");
			String PSP_HIBLOOD_VAL_T = cRsList.getString("PSP_HIBLOOD_VAL");
			String PSP_LIBLOOD_VAL_T = cRsList.getString("PSP_LIBLOOD_VAL");
			String PSP_SCORE_CESD_T = cRsList.getString("PSP_SCORE_CESD");
			String PSP_SCORE_GDS_T = cRsList.getString("PSP_SCORE_GDS");
			String PSP_SCORE_SQC_T = cRsList.getString("PSP_SCORE_SQC");
			String PSP_FIX_YN_T = cRsList.getString("PSP_FIX_YN");
			String PSP_EVALU_SM_T = cRsList.getString("PSP_EVALU_SM");
			String PSP_PRSCR_SM_YN_T = cRsList.getString("PSP_PRSCR_SM_YN");
			String PSP_PRSCR_DRN_YN_T = cRsList.getString("PSP_PRSCR_DRN_YN");
			String PSP_PRSCR_SPT_TX_T = cRsList.getString("PSP_PRSCR_SPT_TX");
			String PSP_PRSTM_SPT_TX_T = cRsList.getString("PSP_PRSTM_SPT_TX");
			String PSP_PRSCR_SPT_YN_T = cRsList.getString("PSP_PRSCR_SPT_YN");
			String PSP_PRSCR_NUT_YN_T = cRsList.getString("PSP_PRSCR_NUT_YN");
			String PSP_ETC_PYC_TX_T = cRsList.getString("PSP_ETC_PYC_TX");
			String PSP_PRSCR_PYC_YN_T = cRsList.getString("PSP_PRSCR_PYC_YN");
			String PSP_CESD_INFO_YN_T = cRsList.getString("PSP_CESD_INFO_YN");
			String PSP_LIFE_YN_T = cRsList.getString("PSP_LIFE_YN");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! PSP_EXAM_DT_T.equals("")) {
%>
		 		PSP_EXAM_DT='<%= PSP_EXAM_DT_T%>'
<%
			}

			if(! PSP_EXAM_SQ_T.equals("")) {
%>
		 		PSP_EXAM_SQ='<%= PSP_EXAM_SQ_T%>'
<%
			}

			if(! PSP_TRANC_DATE_T.equals("")) {
%>
		 		PSP_TRANC_DATE='<%= PSP_TRANC_DATE_T%>'
<%
			}

			if(! PSP_RESULT_DATE_T.equals("")) {
%>
		 		PSP_RESULT_DATE='<%= PSP_RESULT_DATE_T%>'
<%
			}

			if(! PSP_CESD_T.equals("")) {
%>
		 		PSP_CESD='<%= PSP_CESD_T%>'
<%
			}

			if(! PSP_GDS_T.equals("")) {
%>
		 		PSP_GDS='<%= PSP_GDS_T%>'
<%
			}

			if(! PSP_KDSQC_T.equals("")) {
%>
		 		PSP_KDSQC='<%= PSP_KDSQC_T%>'
<%
			}

			if(! PSP_FIR_VIEW_T.equals("")) {
%>
		 		PSP_FIR_VIEW='<%= PSP_FIR_VIEW_T%>'
<%
			}

			if(! PSP_RVIEW_T.equals("")) {
%>
		 		PSP_RVIEW='<%= PSP_RVIEW_T%>'
<%
			}

			if(! PSP_BVIEW_T.equals("")) {
%>
		 		PSP_BVIEW='<%= PSP_BVIEW_T%>'
<%
			}

			if(! PSP_DOCTORSED_T.equals("")) {
%>
		 		PSP_DOCTORSED='<%= PSP_DOCTORSED_T%>'
<%
			}

			if(! PSP_NICO_SM_T.equals("")) {
%>
		 		PSP_NICO_SM='<%= PSP_NICO_SM_T%>'
<%
			}

			if(! PSP_PRSCR_SM_T.equals("")) {
%>
		 		PSP_PRSCR_SM='<%= PSP_PRSCR_SM_T%>'
<%
			}

			if(! PSP_SCORE_SM_T.equals("")) {
%>
		 		PSP_SCORE_SM='<%= PSP_SCORE_SM_T%>'
<%
			}

			if(! PSP_EVALU_DRN_T.equals("")) {
%>
		 		PSP_EVALU_DRN='<%= PSP_EVALU_DRN_T%>'
<%
			}

			if(! PSP_PRSCR_DRN_T.equals("")) {
%>
		 		PSP_PRSCR_DRN='<%= PSP_PRSCR_DRN_T%>'
<%
			}

			if(! PSP_SCORE_DRN_T.equals("")) {
%>
		 		PSP_SCORE_DRN='<%= PSP_SCORE_DRN_T%>'
<%
			}

			if(! PSP_EVALU_SPT_T.equals("")) {
%>
		 		PSP_EVALU_SPT='<%= PSP_EVALU_SPT_T%>'
<%
			}

			if(! PSP_PRSCR_SPT_T.equals("")) {
%>
		 		PSP_PRSCR_SPT='<%= PSP_PRSCR_SPT_T%>'
<%
			}

			if(! PSP_PRSTM_SPT_T.equals("")) {
%>
		 		PSP_PRSTM_SPT='<%= PSP_PRSTM_SPT_T%>'
<%
			}

			if(! PSP_PRSNUM_SPT_T.equals("")) {
%>
		 		PSP_PRSNUM_SPT='<%= PSP_PRSNUM_SPT_T%>'
<%
			}

			if(! PSP_SCORE_SPT_T.equals("")) {
%>
		 		PSP_SCORE_SPT='<%= PSP_SCORE_SPT_T%>'
<%
			}

			if(! PSP_EVALU_NUT_T.equals("")) {
%>
		 		PSP_EVALU_NUT='<%= PSP_EVALU_NUT_T%>'
<%
			}

			if(! PSP_RECOMDAI_NUT_T.equals("")) {
%>
		 		PSP_RECOMDAI_NUT='<%= PSP_RECOMDAI_NUT_T%>'
<%
			}

			if(! PSP_RECOMPRO_NUT_T.equals("")) {
%>
		 		PSP_RECOMPRO_NUT='<%= PSP_RECOMPRO_NUT_T%>'
<%
			}

			if(! PSP_RECOMVEG_NUT_T.equals("")) {
%>
		 		PSP_RECOMVEG_NUT='<%= PSP_RECOMVEG_NUT_T%>'
<%
			}

			if(! PSP_RESTFAT_NUT_T.equals("")) {
%>
		 		PSP_RESTFAT_NUT='<%= PSP_RESTFAT_NUT_T%>'
<%
			}

			if(! PSP_RESTSGA_NUT_T.equals("")) {
%>
		 		PSP_RESTSGA_NUT='<%= PSP_RESTSGA_NUT_T%>'
<%
			}

			if(! PSP_RESTSALT_NUT_T.equals("")) {
%>
		 		PSP_RESTSALT_NUT='<%= PSP_RESTSALT_NUT_T%>'
<%
			}

			if(! PSP_BFAST_NUT_T.equals("")) {
%>
		 		PSP_BFAST_NUT='<%= PSP_BFAST_NUT_T%>'
<%
			}

			if(! PSP_ALLFOOD_NUT_T.equals("")) {
%>
		 		PSP_ALLFOOD_NUT='<%= PSP_ALLFOOD_NUT_T%>'
<%
			}

			if(! PSP_PRSCR_NUT_T.equals("")) {
%>
		 		PSP_PRSCR_NUT='<%= PSP_PRSCR_NUT_T%>'
<%
			}

			if(! PSP_SCORE_NUT_T.equals("")) {
%>
		 		PSP_SCORE_NUT='<%= PSP_SCORE_NUT_T%>'
<%
			}

			if(! PSP_BMI_PYC_T.equals("")) {
%>
		 		PSP_BMI_PYC='<%= PSP_BMI_PYC_T%>'
<%
			}

			if(! PSP_WAIST_PYC_T.equals("")) {
%>
		 		PSP_WAIST_PYC='<%= PSP_WAIST_PYC_T%>'
<%
			}

			if(! PSP_REPAST_PYC_T.equals("")) {
%>
		 		PSP_REPAST_PYC='<%= PSP_REPAST_PYC_T%>'
<%
			}

			if(! PSP_SNACK_PYC_T.equals("")) {
%>
		 		PSP_SNACK_PYC='<%= PSP_SNACK_PYC_T%>'
<%
			}

			if(! PSP_DRINK_PYC_T.equals("")) {
%>
		 		PSP_DRINK_PYC='<%= PSP_DRINK_PYC_T%>'
<%
			}

			if(! PSP_FASTFD_PYC_T.equals("")) {
%>
		 		PSP_FASTFD_PYC='<%= PSP_FASTFD_PYC_T%>'
<%
			}

			if(! PSP_SPORT_PYC_T.equals("")) {
%>
		 		PSP_SPORT_PYC='<%= PSP_SPORT_PYC_T%>'
<%
			}

			if(! PSP_CRINIC_PYC_T.equals("")) {
%>
		 		PSP_CRINIC_PYC='<%= PSP_CRINIC_PYC_T%>'
<%
			}

			if(! PSP_ETC_PYC_T.equals("")) {
%>
		 		PSP_ETC_PYC='<%= PSP_ETC_PYC_T%>'
<%
			}

			if(! PSP_METH_GLO_T.equals("")) {
%>
		 		PSP_METH_GLO='<%= PSP_METH_GLO_T%>'
<%
			}

			if(! PSP_RESULT_GLO_T.equals("")) {
%>
		 		PSP_RESULT_GLO='<%= PSP_RESULT_GLO_T%>'
<%
			}

			if(! PSP_RESULT_HIBL_T.equals("")) {
%>
		 		PSP_RESULT_HIBL='<%= PSP_RESULT_HIBL_T%>'
<%
			}

			if(! PSP_INPUT_ID_T.equals("")) {
%>
		 		PSP_INPUT_ID='<%= PSP_INPUT_ID_T%>'
<%
			}

			if(! PSP_INPUT_DTT_T.equals("")) {
%>
		 		PSP_INPUT_DTT='<%= PSP_INPUT_DTT_T%>'
<%
			}

			if(! PSP_MODI_DTT_T.equals("")) {
%>
		 		PSP_MODI_DTT='<%= PSP_MODI_DTT_T%>'
<%
			}

			if(! PSP_MODI_ID_T.equals("")) {
%>
		 		PSP_MODI_ID='<%= PSP_MODI_ID_T%>'
<%
			}

			if(! PSP_RVAL_GLO_T.equals("")) {
%>
		 		PSP_RVAL_GLO='<%= PSP_RVAL_GLO_T%>'
<%
			}

			if(! PSP_HIBLOOD_VAL_T.equals("")) {
%>
		 		PSP_HIBLOOD_VAL='<%= PSP_HIBLOOD_VAL_T%>'
<%
			}

			if(! PSP_LIBLOOD_VAL_T.equals("")) {
%>
		 		PSP_LIBLOOD_VAL='<%= PSP_LIBLOOD_VAL_T%>'
<%
			}

			if(! PSP_SCORE_CESD_T.equals("")) {
%>
		 		PSP_SCORE_CESD='<%= PSP_SCORE_CESD_T%>'
<%
			}

			if(! PSP_SCORE_GDS_T.equals("")) {
%>
		 		PSP_SCORE_GDS='<%= PSP_SCORE_GDS_T%>'
<%
			}

			if(! PSP_SCORE_SQC_T.equals("")) {
%>
		 		PSP_SCORE_SQC='<%= PSP_SCORE_SQC_T%>'
<%
			}

			if(! PSP_FIX_YN_T.equals("")) {
%>
		 		PSP_FIX_YN='<%= PSP_FIX_YN_T%>'
<%
			}

			if(! PSP_EVALU_SM_T.equals("")) {
%>
		 		PSP_EVALU_SM='<%= PSP_EVALU_SM_T%>'
<%
			}

			if(! PSP_PRSCR_SM_YN_T.equals("")) {
%>
		 		PSP_PRSCR_SM_YN='<%= PSP_PRSCR_SM_YN_T%>'
<%
			}

			if(! PSP_PRSCR_DRN_YN_T.equals("")) {
%>
		 		PSP_PRSCR_DRN_YN='<%= PSP_PRSCR_DRN_YN_T%>'
<%
			}

			if(! PSP_PRSCR_SPT_TX_T.equals("")) {
%>
		 		PSP_PRSCR_SPT_TX='<%= PSP_PRSCR_SPT_TX_T%>'
<%
			}

			if(! PSP_PRSTM_SPT_TX_T.equals("")) {
%>
		 		PSP_PRSTM_SPT_TX='<%= PSP_PRSTM_SPT_TX_T%>'
<%
			}

			if(! PSP_PRSCR_SPT_YN_T.equals("")) {
%>
		 		PSP_PRSCR_SPT_YN='<%= PSP_PRSCR_SPT_YN_T%>'
<%
			}

			if(! PSP_PRSCR_NUT_YN_T.equals("")) {
%>
		 		PSP_PRSCR_NUT_YN='<%= PSP_PRSCR_NUT_YN_T%>'
<%
			}

			if(! PSP_ETC_PYC_TX_T.equals("")) {
%>
		 		PSP_ETC_PYC_TX='<%= PSP_ETC_PYC_TX_T%>'
<%
			}

			if(! PSP_PRSCR_PYC_YN_T.equals("")) {
%>
		 		PSP_PRSCR_PYC_YN='<%= PSP_PRSCR_PYC_YN_T%>'
<%
			}

			if(! PSP_CESD_INFO_YN_T.equals("")) {
%>
		 		PSP_CESD_INFO_YN='<%= PSP_CESD_INFO_YN_T%>'
<%
			}

			if(! PSP_LIFE_YN_T.equals("")) {
%>
		 		PSP_LIFE_YN='<%= PSP_LIFE_YN_T%>'
<%
			}
%>
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
