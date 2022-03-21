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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

Select * From IT_ITEM
 Where IIM_SBCD_CD In ('0008', '0602')
  And IIM_USE_YN = 'Y'
		*/

		sql = " SELECT *";
		sql += " FROM IT_ITEM";
		sql += " WHERE IIM_SBCD_CD IN ('0008', '0602')";
		sql += " AND IIM_USE_YN = 'Y'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_UF_SP2CHA_CREATE_010 \n";
			G_INFO += "설명 : 2차접수생성-대상 검사항목 조회(it_item) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_NITEM_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_NITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ENME_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_ENME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_CNME_NM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_CNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_JNME_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_JNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SNME_NM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_OSCD_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_GBCD_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_GBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SBCD_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_EXGN_CD' rs:number='11' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_EXGN_CD'>
			<s:datatype dt:type='string' dt:maxLength='7' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RIGN_KD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_RIGN_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RECH_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_RECH_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SAMP_CD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SAMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RSLT_KD' rs:number='15' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SORT_SQ' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_UICH_YN' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_UICH_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_DISE_EX' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_DISE_EX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_GBHC_KD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_GBHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='16'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_STHC_KD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_STHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_EMHC_KD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_EMHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_HYHC_KD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_HYHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_APHC_KD' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_APHC_KD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_JGJH_CD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_JGJH_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TGJH_CD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TGJH_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_BLPT_CD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_BLPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_REJH_EX' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_REJH_EX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_CANCER_CD' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_CANCER_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_CNIT_CD' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_CNIT_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TUSE_YN' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TUSE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TPRT_CD' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TPRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRTP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRLT_CD' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRNM_CD' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRNM_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TEDT_YR' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TEDT_YR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TETC_YN' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TETC_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_THPR_YN' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_THPR_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_THPR1_CD' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_THPR1_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_THPR2_CD' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_THPR2_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TSND_YN' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TSND_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TBIO_YN' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TBIO_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TXRAY_YN' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TXRAY_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_OSSB_CD' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_OSRL_CD' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSRL_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_CDOP_KD' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_CDOP_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ACAL_YN' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_ACAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SUTK_YN' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SUTK_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_PITEM_CD' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_PITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_DTVL_YN' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_DTVL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_USE_YN' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_NUSE_ID' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_NUSE_DTT' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_INPT_ID' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_INPT_DTT' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_MODI_ID' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_MODI_DTT' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_MIN_VL' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_MIN_VL'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_MAX_VL' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_MAX_VL'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SANBO_KD' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SANBO_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SANBO_CD' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SANBO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SANBO_CAL' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SANBO_CAL'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_DFLT_VL' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_DFLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='25'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_PNUM_CD' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_PNUM_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SUTK_CD' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SUTK_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TEMP_SQ' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TEMP_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='UB_ORDCODE_NM' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='UB_ORDCODE_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='UB_EDICODE_NM' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='UB_EDICODE_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='UB_ORD_CODE' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='UB_ORD_CODE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='UB_EDI_CODE' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='UB_EDI_CODE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='70' rs:rowid='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
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
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
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
