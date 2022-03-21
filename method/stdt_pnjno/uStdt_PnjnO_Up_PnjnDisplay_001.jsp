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

SELECT A.*, 
       F_USER_FIND(A.ESO_EXAM_DR) AS ESO_EXAM_NM, 
       F_USER_FIND(A.ESO_ORAL_DR) AS ESO_ORAL_NM 
  FROM ET_STDT_PNJNO A 
 WHERE A.ESO_EXAM_DT = :EXAM_DT 
   AND A.ESO_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT A.*, F_USER_FIND(A.ESO_EXAM_DR) AS ESO_EXAM_NM, F_USER_FIND(A.ESO_ORAL_DR) AS ESO_ORAL_NM";
		sql += " FROM ET_STDT_PNJNO A";
		sql += " WHERE A.ESO_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.ESO_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_PnjnO_Up_PnjnDisplay_001 \n";
			G_INFO += "설명 : 학교밖청소년 판정 조회 \n";
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
		<s:AttributeType name='ESO_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO' rs:basecolumn='ESO_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO' rs:basecolumn='ESO_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_DIAG' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_DIAG'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_DRUG' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_DRUG'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_STAT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_STAT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_HABIT' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_HABIT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_DRUNK' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_DRUNK'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_SMOKE' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_SMOKE'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_SPORT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_SPORT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_WEIGHT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_WEIGHT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_QST_INJURE' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_QST_INJURE'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_1' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_2' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_3' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_4' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_5' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_5'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_6' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_6'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_7' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_7'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_ETC' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_ETC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_ETC2' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_ETC2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_1' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_2' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_3' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_4' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_5' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_5'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_6' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_6'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_7' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_7'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_8' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_8'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_ETC' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_ETC'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_ETC2' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_ETC2'>
			<s:datatype dt:type='string' dt:maxLength='80'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNRD_1' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNRD_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNRD_2' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNRD_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNRD_3' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNRD_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNRD_4' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNRD_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJN_A' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJN_A'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJN_B' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJN_B'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJN_R' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJN_R'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJN_RD' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJN_RD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJN_ORAL' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJN_ORAL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EXAM_VIEW' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EXAM_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EXAM_ACT' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EXAM_ACT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_ORAL_VIEW' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_ORAL_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_ORAL_ACT' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_ORAL_ACT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EPNJN_DT' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EPNJN_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_OPNJN_DT' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_OPNJN_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EIFRM_DT' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EIFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_OIFRM_DT' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_OIFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EXAM_DR' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EXAM_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_ORAL_DR' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_ORAL_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EPNJN_YN' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EPNJN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_OPNJN_YN' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_OPNJN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_CHUNG_YN' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_CHUNG_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_INPT_ID' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_INPT_DTT' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_MODI_ID' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_MODI_DTT' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNB_8' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNB_8'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_PNJNR_9' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_PNJNR_9'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_ADD_VIEW' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_ADD_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EXAM_NM' rs:number='60' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_ORAL_NM' rs:number='61' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='62' rs:rowid='true' rs:basetable='ET_STDT_PNJNO' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ESO_EXAM_DT_T = cRsList.getString("ESO_EXAM_DT");
			String ESO_EXAM_SQ_T = cRsList.getString("ESO_EXAM_SQ");
			String ESO_QST_DIAG_T = cRsList.getString("ESO_QST_DIAG");
			String ESO_QST_DRUG_T = cRsList.getString("ESO_QST_DRUG");
			String ESO_QST_STAT_T = cRsList.getString("ESO_QST_STAT");
			String ESO_QST_HABIT_T = cRsList.getString("ESO_QST_HABIT");
			String ESO_QST_DRUNK_T = cRsList.getString("ESO_QST_DRUNK");
			String ESO_QST_SMOKE_T = cRsList.getString("ESO_QST_SMOKE");
			String ESO_QST_SPORT_T = cRsList.getString("ESO_QST_SPORT");
			String ESO_QST_WEIGHT_T = cRsList.getString("ESO_QST_WEIGHT");
			String ESO_QST_INJURE_T = cRsList.getString("ESO_QST_INJURE");
			String ESO_PNJNB_1_T = cRsList.getString("ESO_PNJNB_1");
			String ESO_PNJNB_2_T = cRsList.getString("ESO_PNJNB_2");
			String ESO_PNJNB_3_T = cRsList.getString("ESO_PNJNB_3");
			String ESO_PNJNB_4_T = cRsList.getString("ESO_PNJNB_4");
			String ESO_PNJNB_5_T = cRsList.getString("ESO_PNJNB_5");
			String ESO_PNJNB_6_T = cRsList.getString("ESO_PNJNB_6");
			String ESO_PNJNB_7_T = cRsList.getString("ESO_PNJNB_7");
			String ESO_PNJNB_ETC_T = cRsList.getString("ESO_PNJNB_ETC");
			String ESO_PNJNB_ETC2_T = cRsList.getString("ESO_PNJNB_ETC2");
			String ESO_PNJNR_1_T = cRsList.getString("ESO_PNJNR_1");
			String ESO_PNJNR_2_T = cRsList.getString("ESO_PNJNR_2");
			String ESO_PNJNR_3_T = cRsList.getString("ESO_PNJNR_3");
			String ESO_PNJNR_4_T = cRsList.getString("ESO_PNJNR_4");
			String ESO_PNJNR_5_T = cRsList.getString("ESO_PNJNR_5");
			String ESO_PNJNR_6_T = cRsList.getString("ESO_PNJNR_6");
			String ESO_PNJNR_7_T = cRsList.getString("ESO_PNJNR_7");
			String ESO_PNJNR_8_T = cRsList.getString("ESO_PNJNR_8");
			String ESO_PNJNR_ETC_T = cRsList.getString("ESO_PNJNR_ETC");
			String ESO_PNJNR_ETC2_T = cRsList.getString("ESO_PNJNR_ETC2");
			String ESO_PNJNRD_1_T = cRsList.getString("ESO_PNJNRD_1");
			String ESO_PNJNRD_2_T = cRsList.getString("ESO_PNJNRD_2");
			String ESO_PNJNRD_3_T = cRsList.getString("ESO_PNJNRD_3");
			String ESO_PNJNRD_4_T = cRsList.getString("ESO_PNJNRD_4");
			String ESO_PNJN_A_T = cRsList.getString("ESO_PNJN_A");
			String ESO_PNJN_B_T = cRsList.getString("ESO_PNJN_B");
			String ESO_PNJN_R_T = cRsList.getString("ESO_PNJN_R");
			String ESO_PNJN_RD_T = cRsList.getString("ESO_PNJN_RD");
			String ESO_PNJN_ORAL_T = cRsList.getString("ESO_PNJN_ORAL");
			String ESO_EXAM_VIEW_T = cRsList.getString("ESO_EXAM_VIEW");
			String ESO_EXAM_ACT_T = cRsList.getString("ESO_EXAM_ACT");
			String ESO_ORAL_VIEW_T = cRsList.getString("ESO_ORAL_VIEW");
			String ESO_ORAL_ACT_T = cRsList.getString("ESO_ORAL_ACT");
			String ESO_EPNJN_DT_T = cRsList.getString("ESO_EPNJN_DT");
			String ESO_OPNJN_DT_T = cRsList.getString("ESO_OPNJN_DT");
			String ESO_EIFRM_DT_T = cRsList.getString("ESO_EIFRM_DT");
			String ESO_OIFRM_DT_T = cRsList.getString("ESO_OIFRM_DT");
			String ESO_EXAM_DR_T = cRsList.getString("ESO_EXAM_DR");
			String ESO_ORAL_DR_T = cRsList.getString("ESO_ORAL_DR");
			String ESO_EPNJN_YN_T = cRsList.getString("ESO_EPNJN_YN");
			String ESO_OPNJN_YN_T = cRsList.getString("ESO_OPNJN_YN");
			String ESO_CHUNG_YN_T = cRsList.getString("ESO_CHUNG_YN");
			String ESO_INPT_ID_T = cRsList.getString("ESO_INPT_ID");
			String ESO_INPT_DTT_T = cRsList.getDate2("ESO_INPT_DTT");
			String ESO_MODI_ID_T = cRsList.getString("ESO_MODI_ID");
			String ESO_MODI_DTT_T = cRsList.getDate2("ESO_MODI_DTT");
			String ESO_PNJNB_8_T = cRsList.getString("ESO_PNJNB_8");
			String ESO_PNJNR_9_T = cRsList.getString("ESO_PNJNR_9");
			String ESO_ADD_VIEW_T = cRsList.getString("ESO_ADD_VIEW");
			String ESO_EXAM_NM_T = cRsList.getString("ESO_EXAM_NM");
			String ESO_ORAL_NM_T = cRsList.getString("ESO_ORAL_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ESO_EXAM_DT_T.equals("")) {
%>
		 		ESO_EXAM_DT='<%= ESO_EXAM_DT_T%>'
<%
			}

			if(! ESO_EXAM_SQ_T.equals("")) {
%>
		 		ESO_EXAM_SQ='<%= ESO_EXAM_SQ_T%>'
<%
			}

			if(! ESO_QST_DIAG_T.equals("")) {
%>
		 		ESO_QST_DIAG='<%= ESO_QST_DIAG_T%>'
<%
			}

			if(! ESO_QST_DRUG_T.equals("")) {
%>
		 		ESO_QST_DRUG='<%= ESO_QST_DRUG_T%>'
<%
			}

			if(! ESO_QST_STAT_T.equals("")) {
%>
		 		ESO_QST_STAT='<%= ESO_QST_STAT_T%>'
<%
			}

			if(! ESO_QST_HABIT_T.equals("")) {
%>
		 		ESO_QST_HABIT='<%= ESO_QST_HABIT_T%>'
<%
			}

			if(! ESO_QST_DRUNK_T.equals("")) {
%>
		 		ESO_QST_DRUNK='<%= ESO_QST_DRUNK_T%>'
<%
			}

			if(! ESO_QST_SMOKE_T.equals("")) {
%>
		 		ESO_QST_SMOKE='<%= ESO_QST_SMOKE_T%>'
<%
			}

			if(! ESO_QST_SPORT_T.equals("")) {
%>
		 		ESO_QST_SPORT='<%= ESO_QST_SPORT_T%>'
<%
			}

			if(! ESO_QST_WEIGHT_T.equals("")) {
%>
		 		ESO_QST_WEIGHT='<%= ESO_QST_WEIGHT_T%>'
<%
			}

			if(! ESO_QST_INJURE_T.equals("")) {
%>
		 		ESO_QST_INJURE='<%= ESO_QST_INJURE_T%>'
<%
			}

			if(! ESO_PNJNB_1_T.equals("")) {
%>
		 		ESO_PNJNB_1='<%= ESO_PNJNB_1_T%>'
<%
			}

			if(! ESO_PNJNB_2_T.equals("")) {
%>
		 		ESO_PNJNB_2='<%= ESO_PNJNB_2_T%>'
<%
			}

			if(! ESO_PNJNB_3_T.equals("")) {
%>
		 		ESO_PNJNB_3='<%= ESO_PNJNB_3_T%>'
<%
			}

			if(! ESO_PNJNB_4_T.equals("")) {
%>
		 		ESO_PNJNB_4='<%= ESO_PNJNB_4_T%>'
<%
			}

			if(! ESO_PNJNB_5_T.equals("")) {
%>
		 		ESO_PNJNB_5='<%= ESO_PNJNB_5_T%>'
<%
			}

			if(! ESO_PNJNB_6_T.equals("")) {
%>
		 		ESO_PNJNB_6='<%= ESO_PNJNB_6_T%>'
<%
			}

			if(! ESO_PNJNB_7_T.equals("")) {
%>
		 		ESO_PNJNB_7='<%= ESO_PNJNB_7_T%>'
<%
			}

			if(! ESO_PNJNB_ETC_T.equals("")) {
%>
		 		ESO_PNJNB_ETC='<%= ESO_PNJNB_ETC_T%>'
<%
			}

			if(! ESO_PNJNB_ETC2_T.equals("")) {
%>
		 		ESO_PNJNB_ETC2='<%= ESO_PNJNB_ETC2_T%>'
<%
			}

			if(! ESO_PNJNR_1_T.equals("")) {
%>
		 		ESO_PNJNR_1='<%= ESO_PNJNR_1_T%>'
<%
			}

			if(! ESO_PNJNR_2_T.equals("")) {
%>
		 		ESO_PNJNR_2='<%= ESO_PNJNR_2_T%>'
<%
			}

			if(! ESO_PNJNR_3_T.equals("")) {
%>
		 		ESO_PNJNR_3='<%= ESO_PNJNR_3_T%>'
<%
			}

			if(! ESO_PNJNR_4_T.equals("")) {
%>
		 		ESO_PNJNR_4='<%= ESO_PNJNR_4_T%>'
<%
			}

			if(! ESO_PNJNR_5_T.equals("")) {
%>
		 		ESO_PNJNR_5='<%= ESO_PNJNR_5_T%>'
<%
			}

			if(! ESO_PNJNR_6_T.equals("")) {
%>
		 		ESO_PNJNR_6='<%= ESO_PNJNR_6_T%>'
<%
			}

			if(! ESO_PNJNR_7_T.equals("")) {
%>
		 		ESO_PNJNR_7='<%= ESO_PNJNR_7_T%>'
<%
			}

			if(! ESO_PNJNR_8_T.equals("")) {
%>
		 		ESO_PNJNR_8='<%= ESO_PNJNR_8_T%>'
<%
			}

			if(! ESO_PNJNR_ETC_T.equals("")) {
%>
		 		ESO_PNJNR_ETC='<%= ESO_PNJNR_ETC_T%>'
<%
			}

			if(! ESO_PNJNR_ETC2_T.equals("")) {
%>
		 		ESO_PNJNR_ETC2='<%= ESO_PNJNR_ETC2_T%>'
<%
			}

			if(! ESO_PNJNRD_1_T.equals("")) {
%>
		 		ESO_PNJNRD_1='<%= ESO_PNJNRD_1_T%>'
<%
			}

			if(! ESO_PNJNRD_2_T.equals("")) {
%>
		 		ESO_PNJNRD_2='<%= ESO_PNJNRD_2_T%>'
<%
			}

			if(! ESO_PNJNRD_3_T.equals("")) {
%>
		 		ESO_PNJNRD_3='<%= ESO_PNJNRD_3_T%>'
<%
			}

			if(! ESO_PNJNRD_4_T.equals("")) {
%>
		 		ESO_PNJNRD_4='<%= ESO_PNJNRD_4_T%>'
<%
			}

			if(! ESO_PNJN_A_T.equals("")) {
%>
		 		ESO_PNJN_A='<%= ESO_PNJN_A_T%>'
<%
			}

			if(! ESO_PNJN_B_T.equals("")) {
%>
		 		ESO_PNJN_B='<%= ESO_PNJN_B_T%>'
<%
			}

			if(! ESO_PNJN_R_T.equals("")) {
%>
		 		ESO_PNJN_R='<%= ESO_PNJN_R_T%>'
<%
			}

			if(! ESO_PNJN_RD_T.equals("")) {
%>
		 		ESO_PNJN_RD='<%= ESO_PNJN_RD_T%>'
<%
			}

			if(! ESO_PNJN_ORAL_T.equals("")) {
%>
		 		ESO_PNJN_ORAL='<%= ESO_PNJN_ORAL_T%>'
<%
			}

			if(! ESO_EXAM_VIEW_T.equals("")) {
%>
		 		ESO_EXAM_VIEW='<%= ESO_EXAM_VIEW_T%>'
<%
			}

			if(! ESO_EXAM_ACT_T.equals("")) {
%>
		 		ESO_EXAM_ACT='<%= ESO_EXAM_ACT_T%>'
<%
			}

			if(! ESO_ORAL_VIEW_T.equals("")) {
%>
		 		ESO_ORAL_VIEW='<%= ESO_ORAL_VIEW_T%>'
<%
			}

			if(! ESO_ORAL_ACT_T.equals("")) {
%>
		 		ESO_ORAL_ACT='<%= ESO_ORAL_ACT_T%>'
<%
			}

			if(! ESO_EPNJN_DT_T.equals("")) {
%>
		 		ESO_EPNJN_DT='<%= ESO_EPNJN_DT_T%>'
<%
			}

			if(! ESO_OPNJN_DT_T.equals("")) {
%>
		 		ESO_OPNJN_DT='<%= ESO_OPNJN_DT_T%>'
<%
			}

			if(! ESO_EIFRM_DT_T.equals("")) {
%>
		 		ESO_EIFRM_DT='<%= ESO_EIFRM_DT_T%>'
<%
			}

			if(! ESO_OIFRM_DT_T.equals("")) {
%>
		 		ESO_OIFRM_DT='<%= ESO_OIFRM_DT_T%>'
<%
			}

			if(! ESO_EXAM_DR_T.equals("")) {
%>
		 		ESO_EXAM_DR='<%= ESO_EXAM_DR_T%>'
<%
			}

			if(! ESO_ORAL_DR_T.equals("")) {
%>
		 		ESO_ORAL_DR='<%= ESO_ORAL_DR_T%>'
<%
			}

			if(! ESO_EPNJN_YN_T.equals("")) {
%>
		 		ESO_EPNJN_YN='<%= ESO_EPNJN_YN_T%>'
<%
			}

			if(! ESO_OPNJN_YN_T.equals("")) {
%>
		 		ESO_OPNJN_YN='<%= ESO_OPNJN_YN_T%>'
<%
			}

			if(! ESO_CHUNG_YN_T.equals("")) {
%>
		 		ESO_CHUNG_YN='<%= ESO_CHUNG_YN_T%>'
<%
			}

			if(! ESO_INPT_ID_T.equals("")) {
%>
		 		ESO_INPT_ID='<%= ESO_INPT_ID_T%>'
<%
			}

			if(! ESO_INPT_DTT_T.equals("")) {
%>
		 		ESO_INPT_DTT='<%= ESO_INPT_DTT_T%>'
<%
			}

			if(! ESO_MODI_ID_T.equals("")) {
%>
		 		ESO_MODI_ID='<%= ESO_MODI_ID_T%>'
<%
			}

			if(! ESO_MODI_DTT_T.equals("")) {
%>
		 		ESO_MODI_DTT='<%= ESO_MODI_DTT_T%>'
<%
			}

			if(! ESO_PNJNB_8_T.equals("")) {
%>
		 		ESO_PNJNB_8='<%= ESO_PNJNB_8_T%>'
<%
			}

			if(! ESO_PNJNR_9_T.equals("")) {
%>
		 		ESO_PNJNR_9='<%= ESO_PNJNR_9_T%>'
<%
			}

			if(! ESO_ADD_VIEW_T.equals("")) {
%>
		 		ESO_ADD_VIEW='<%= ESO_ADD_VIEW_T%>'
<%
			}

			if(! ESO_EXAM_NM_T.equals("")) {
%>
		 		ESO_EXAM_NM='<%= ESO_EXAM_NM_T%>'
<%
			}

			if(! ESO_ORAL_NM_T.equals("")) {
%>
		 		ESO_ORAL_NM='<%= ESO_ORAL_NM_T%>'
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
