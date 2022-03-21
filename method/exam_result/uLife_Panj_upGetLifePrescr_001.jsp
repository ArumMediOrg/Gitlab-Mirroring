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

SELECT  *
  FROM PT_LIFE_PRESCR
 WHERE PLR_EXAM_DT = :EXAM_DT
   AND PLR_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT *";
		sql += " FROM PT_LIFE_PRESCR";
		sql += " WHERE PLR_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND PLR_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uLife_Panj_upGetLifePrescr_001 \n";
			G_INFO += "설명 : 생활습관 처방조회(전체항목) \n";
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
		<s:AttributeType name='PLR_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR' rs:basecolumn='PLR_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR' rs:basecolumn='PLR_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_1' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_SMK_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_2' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_SMK_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_3' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_SMK_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_4' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_SMK_4'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_4_TX' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_SMK_4_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_5' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_SMK_5'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_6' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_SMK_6'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_SMK_6_TX' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_SMK_6_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_PR1' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_DRK_PR1'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_PR1_YN' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_DRK_PR1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_PR2' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_DRK_PR2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_PR2_TX' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_DRK_PR2_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_1' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_DRK_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_2' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_DRK_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_3' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_DRK_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_DRK_3_TX' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_DRK_3_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_1' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_EXCS_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_2_1' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_EXCS_2_1'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_2_1_TX' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_EXCS_2_1_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_2_2' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_EXCS_2_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_2_2_TX' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_EXCS_2_2_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_2_3' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_EXCS_2_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_3' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_EXCS_3'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_3_TX' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_EXCS_3_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_4' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_EXCS_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_EXCS_4_TX' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_EXCS_4_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_NUTR_1' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_NUTR_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_NUTR_2' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_NUTR_2'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_NUTR_3' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_NUTR_3'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_NUTR_3_TX' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_NUTR_3_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_NUTR_4' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_NUTR_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_NUTR_4_TX' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_NUTR_4_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_1' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_2' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_3' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_4_1' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_4_1'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_4_2' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_4_2'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_4_3' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_4_3'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_4_4' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_4_4'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_5' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_5'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_5_TX' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_5_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_6' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_6'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_6_TX' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_6_TX'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_7' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_7'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_7_TX' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_7_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_INPUT_ID' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_INPUT_DTT' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_MODI_DTT' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_MODI_ID' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PLR_FAT_4' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
			 rs:basecolumn='PLR_FAT_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='53' rs:rowid='true' rs:writeunknown='true' rs:basetable='PT_LIFE_PRESCR'
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

			String PLR_EXAM_DT_T = cRsList.getString("PLR_EXAM_DT");
			String PLR_EXAM_SQ_T = cRsList.getString("PLR_EXAM_SQ");
			String PLR_SMK_1_T = cRsList.getString("PLR_SMK_1");
			String PLR_SMK_2_T = cRsList.getString("PLR_SMK_2");
			String PLR_SMK_3_T = cRsList.getString("PLR_SMK_3");
			String PLR_SMK_4_T = cRsList.getString("PLR_SMK_4");
			String PLR_SMK_4_TX_T = cRsList.getString("PLR_SMK_4_TX");
			String PLR_SMK_5_T = cRsList.getString("PLR_SMK_5");
			String PLR_SMK_6_T = cRsList.getString("PLR_SMK_6");
			String PLR_SMK_6_TX_T = cRsList.getString("PLR_SMK_6_TX");
			String PLR_DRK_PR1_T = cRsList.getString("PLR_DRK_PR1");
			String PLR_DRK_PR1_YN_T = cRsList.getString("PLR_DRK_PR1_YN");
			String PLR_DRK_PR2_T = cRsList.getString("PLR_DRK_PR2");
			String PLR_DRK_PR2_TX_T = cRsList.getString("PLR_DRK_PR2_TX");
			String PLR_DRK_1_T = cRsList.getString("PLR_DRK_1");
			String PLR_DRK_2_T = cRsList.getString("PLR_DRK_2");
			String PLR_DRK_3_T = cRsList.getString("PLR_DRK_3");
			String PLR_DRK_3_TX_T = cRsList.getString("PLR_DRK_3_TX");
			String PLR_EXCS_1_T = cRsList.getString("PLR_EXCS_1");
			String PLR_EXCS_2_1_T = cRsList.getString("PLR_EXCS_2_1");
			String PLR_EXCS_2_1_TX_T = cRsList.getString("PLR_EXCS_2_1_TX");
			String PLR_EXCS_2_2_T = cRsList.getString("PLR_EXCS_2_2");
			String PLR_EXCS_2_2_TX_T = cRsList.getString("PLR_EXCS_2_2_TX");
			String PLR_EXCS_2_3_T = cRsList.getString("PLR_EXCS_2_3");
			String PLR_EXCS_3_T = cRsList.getString("PLR_EXCS_3");
			String PLR_EXCS_3_TX_T = cRsList.getString("PLR_EXCS_3_TX");
			String PLR_EXCS_4_T = cRsList.getString("PLR_EXCS_4");
			String PLR_EXCS_4_TX_T = cRsList.getString("PLR_EXCS_4_TX");
			String PLR_NUTR_1_T = cRsList.getString("PLR_NUTR_1");
			String PLR_NUTR_2_T = cRsList.getString("PLR_NUTR_2");
			String PLR_NUTR_3_T = cRsList.getString("PLR_NUTR_3");
			String PLR_NUTR_3_TX_T = cRsList.getString("PLR_NUTR_3_TX");
			String PLR_NUTR_4_T = cRsList.getString("PLR_NUTR_4");
			String PLR_NUTR_4_TX_T = cRsList.getString("PLR_NUTR_4_TX");
			String PLR_FAT_1_T = cRsList.getString("PLR_FAT_1");
			String PLR_FAT_2_T = cRsList.getString("PLR_FAT_2");
			String PLR_FAT_3_T = cRsList.getString("PLR_FAT_3");
			String PLR_FAT_4_1_T = cRsList.getString("PLR_FAT_4_1");
			String PLR_FAT_4_2_T = cRsList.getString("PLR_FAT_4_2");
			String PLR_FAT_4_3_T = cRsList.getString("PLR_FAT_4_3");
			String PLR_FAT_4_4_T = cRsList.getString("PLR_FAT_4_4");
			String PLR_FAT_5_T = cRsList.getString("PLR_FAT_5");
			String PLR_FAT_5_TX_T = cRsList.getString("PLR_FAT_5_TX");
			String PLR_FAT_6_T = cRsList.getString("PLR_FAT_6");
			String PLR_FAT_6_TX_T = cRsList.getString("PLR_FAT_6_TX");
			String PLR_FAT_7_T = cRsList.getString("PLR_FAT_7");
			String PLR_FAT_7_TX_T = cRsList.getString("PLR_FAT_7_TX");
			String PLR_INPUT_ID_T = cRsList.getString("PLR_INPUT_ID");
			String PLR_INPUT_DTT_T = cRsList.getDate2("PLR_INPUT_DTT");
			String PLR_MODI_DTT_T = cRsList.getDate2("PLR_MODI_DTT");
			String PLR_MODI_ID_T = cRsList.getString("PLR_MODI_ID");
			String PLR_FAT_4_T = cRsList.getString("PLR_FAT_4");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! PLR_EXAM_DT_T.equals("")) {
%>
		 		PLR_EXAM_DT='<%= PLR_EXAM_DT_T%>'
<%
			}

			if(! PLR_EXAM_SQ_T.equals("")) {
%>
		 		PLR_EXAM_SQ='<%= PLR_EXAM_SQ_T%>'
<%
			}

			if(! PLR_SMK_1_T.equals("")) {
%>
		 		PLR_SMK_1='<%= PLR_SMK_1_T%>'
<%
			}

			if(! PLR_SMK_2_T.equals("")) {
%>
		 		PLR_SMK_2='<%= PLR_SMK_2_T%>'
<%
			}

			if(! PLR_SMK_3_T.equals("")) {
%>
		 		PLR_SMK_3='<%= PLR_SMK_3_T%>'
<%
			}

			if(! PLR_SMK_4_T.equals("")) {
%>
		 		PLR_SMK_4='<%= PLR_SMK_4_T%>'
<%
			}

			if(! PLR_SMK_4_TX_T.equals("")) {
%>
		 		PLR_SMK_4_TX='<%= PLR_SMK_4_TX_T%>'
<%
			}

			if(! PLR_SMK_5_T.equals("")) {
%>
		 		PLR_SMK_5='<%= PLR_SMK_5_T%>'
<%
			}

			if(! PLR_SMK_6_T.equals("")) {
%>
		 		PLR_SMK_6='<%= PLR_SMK_6_T%>'
<%
			}

			if(! PLR_SMK_6_TX_T.equals("")) {
%>
		 		PLR_SMK_6_TX='<%= PLR_SMK_6_TX_T%>'
<%
			}

			if(! PLR_DRK_PR1_T.equals("")) {
%>
		 		PLR_DRK_PR1='<%= PLR_DRK_PR1_T%>'
<%
			}

			if(! PLR_DRK_PR1_YN_T.equals("")) {
%>
		 		PLR_DRK_PR1_YN='<%= PLR_DRK_PR1_YN_T%>'
<%
			}

			if(! PLR_DRK_PR2_T.equals("")) {
%>
		 		PLR_DRK_PR2='<%= PLR_DRK_PR2_T%>'
<%
			}

			if(! PLR_DRK_PR2_TX_T.equals("")) {
%>
		 		PLR_DRK_PR2_TX='<%= PLR_DRK_PR2_TX_T%>'
<%
			}

			if(! PLR_DRK_1_T.equals("")) {
%>
		 		PLR_DRK_1='<%= PLR_DRK_1_T%>'
<%
			}

			if(! PLR_DRK_2_T.equals("")) {
%>
		 		PLR_DRK_2='<%= PLR_DRK_2_T%>'
<%
			}

			if(! PLR_DRK_3_T.equals("")) {
%>
		 		PLR_DRK_3='<%= PLR_DRK_3_T%>'
<%
			}

			if(! PLR_DRK_3_TX_T.equals("")) {
%>
		 		PLR_DRK_3_TX='<%= PLR_DRK_3_TX_T%>'
<%
			}

			if(! PLR_EXCS_1_T.equals("")) {
%>
		 		PLR_EXCS_1='<%= PLR_EXCS_1_T%>'
<%
			}

			if(! PLR_EXCS_2_1_T.equals("")) {
%>
		 		PLR_EXCS_2_1='<%= PLR_EXCS_2_1_T%>'
<%
			}

			if(! PLR_EXCS_2_1_TX_T.equals("")) {
%>
		 		PLR_EXCS_2_1_TX='<%= PLR_EXCS_2_1_TX_T%>'
<%
			}

			if(! PLR_EXCS_2_2_T.equals("")) {
%>
		 		PLR_EXCS_2_2='<%= PLR_EXCS_2_2_T%>'
<%
			}

			if(! PLR_EXCS_2_2_TX_T.equals("")) {
%>
		 		PLR_EXCS_2_2_TX='<%= PLR_EXCS_2_2_TX_T%>'
<%
			}

			if(! PLR_EXCS_2_3_T.equals("")) {
%>
		 		PLR_EXCS_2_3='<%= PLR_EXCS_2_3_T%>'
<%
			}

			if(! PLR_EXCS_3_T.equals("")) {
%>
		 		PLR_EXCS_3='<%= PLR_EXCS_3_T%>'
<%
			}

			if(! PLR_EXCS_3_TX_T.equals("")) {
%>
		 		PLR_EXCS_3_TX='<%= PLR_EXCS_3_TX_T%>'
<%
			}

			if(! PLR_EXCS_4_T.equals("")) {
%>
		 		PLR_EXCS_4='<%= PLR_EXCS_4_T%>'
<%
			}

			if(! PLR_EXCS_4_TX_T.equals("")) {
%>
		 		PLR_EXCS_4_TX='<%= PLR_EXCS_4_TX_T%>'
<%
			}

			if(! PLR_NUTR_1_T.equals("")) {
%>
		 		PLR_NUTR_1='<%= PLR_NUTR_1_T%>'
<%
			}

			if(! PLR_NUTR_2_T.equals("")) {
%>
		 		PLR_NUTR_2='<%= PLR_NUTR_2_T%>'
<%
			}

			if(! PLR_NUTR_3_T.equals("")) {
%>
		 		PLR_NUTR_3='<%= PLR_NUTR_3_T%>'
<%
			}

			if(! PLR_NUTR_3_TX_T.equals("")) {
%>
		 		PLR_NUTR_3_TX='<%= PLR_NUTR_3_TX_T%>'
<%
			}

			if(! PLR_NUTR_4_T.equals("")) {
%>
		 		PLR_NUTR_4='<%= PLR_NUTR_4_T%>'
<%
			}

			if(! PLR_NUTR_4_TX_T.equals("")) {
%>
		 		PLR_NUTR_4_TX='<%= PLR_NUTR_4_TX_T%>'
<%
			}

			if(! PLR_FAT_1_T.equals("")) {
%>
		 		PLR_FAT_1='<%= PLR_FAT_1_T%>'
<%
			}

			if(! PLR_FAT_2_T.equals("")) {
%>
		 		PLR_FAT_2='<%= PLR_FAT_2_T%>'
<%
			}

			if(! PLR_FAT_3_T.equals("")) {
%>
		 		PLR_FAT_3='<%= PLR_FAT_3_T%>'
<%
			}

			if(! PLR_FAT_4_1_T.equals("")) {
%>
		 		PLR_FAT_4_1='<%= PLR_FAT_4_1_T%>'
<%
			}

			if(! PLR_FAT_4_2_T.equals("")) {
%>
		 		PLR_FAT_4_2='<%= PLR_FAT_4_2_T%>'
<%
			}

			if(! PLR_FAT_4_3_T.equals("")) {
%>
		 		PLR_FAT_4_3='<%= PLR_FAT_4_3_T%>'
<%
			}

			if(! PLR_FAT_4_4_T.equals("")) {
%>
		 		PLR_FAT_4_4='<%= PLR_FAT_4_4_T%>'
<%
			}

			if(! PLR_FAT_5_T.equals("")) {
%>
		 		PLR_FAT_5='<%= PLR_FAT_5_T%>'
<%
			}

			if(! PLR_FAT_5_TX_T.equals("")) {
%>
		 		PLR_FAT_5_TX='<%= PLR_FAT_5_TX_T%>'
<%
			}

			if(! PLR_FAT_6_T.equals("")) {
%>
		 		PLR_FAT_6='<%= PLR_FAT_6_T%>'
<%
			}

			if(! PLR_FAT_6_TX_T.equals("")) {
%>
		 		PLR_FAT_6_TX='<%= PLR_FAT_6_TX_T%>'
<%
			}

			if(! PLR_FAT_7_T.equals("")) {
%>
		 		PLR_FAT_7='<%= PLR_FAT_7_T%>'
<%
			}

			if(! PLR_FAT_7_TX_T.equals("")) {
%>
		 		PLR_FAT_7_TX='<%= PLR_FAT_7_TX_T%>'
<%
			}

			if(! PLR_INPUT_ID_T.equals("")) {
%>
		 		PLR_INPUT_ID='<%= PLR_INPUT_ID_T%>'
<%
			}

			if(! PLR_INPUT_DTT_T.equals("")) {
%>
		 		PLR_INPUT_DTT='<%= PLR_INPUT_DTT_T%>'
<%
			}

			if(! PLR_MODI_DTT_T.equals("")) {
%>
		 		PLR_MODI_DTT='<%= PLR_MODI_DTT_T%>'
<%
			}

			if(! PLR_MODI_ID_T.equals("")) {
%>
		 		PLR_MODI_ID='<%= PLR_MODI_ID_T%>'
<%
			}

			if(! PLR_FAT_4_T.equals("")) {
%>
		 		PLR_FAT_4='<%= PLR_FAT_4_T%>'
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
