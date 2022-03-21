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
		String EXAM_CHA = htMethod.get("EXAM_CHA");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(EXAM_CHA == null) { EXAM_CHA = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CASE WHEN SPG_SWING_CD IS NULL OR SPG_SWING_CD = '' THEN SPG_SWING_CD else '[' || SPG_SWING_CD || ']' || GetSP_COMMON_cdToNm('HM05F',SPG_SWING_CD) END SPG_SWING_NM,
       CASE WHEN SPG_PANJ_CD  IS NULL OR SPG_PANJ_CD  = '' THEN SPG_PANJ_CD  else '[' || SPG_PANJ_CD  || ']' || GetSP_COMMON_cdToNm('HM05E', SPG_PANJ_CD) END SPG_PANJ_NM,
       CASE WHEN SPG_ORGA_CD  IS NULL OR SPG_ORGA_CD  = '' THEN SPG_ORGA_CD  else '[' || SPG_ORGA_CD  || ']' || GetSP_COMMON_cdToNm('HM05D', SPG_ORGA_CD) END SPG_ORGA_NM,
       CASE WHEN SPG_JILH_CD  IS NULL OR SPG_JILH_CD  = '' THEN SPG_JILH_CD  else '[' || SPG_JILH_CD  || ']' || GetSP_COMMON_cdToNm('HM05H', SPG_JILH_CD) END SPG_JILH_NM,
       CASE WHEN SPG_POSM1_CD IS NULL OR SPG_POSM1_CD = '' THEN SPG_POSM1_CD else '[' || SPG_POSM1_CD || ']' || GetSP_COMMON_cdToNm('HM05A',SPG_POSM1_CD) END SPG_POSM1_NM,
       CASE WHEN SPG_POSM2_CD IS NULL OR SPG_POSM2_CD = '' THEN SPG_POSM2_CD else '[' || SPG_POSM2_CD || ']' || GetSP_COMMON_cdToNm('HM05A',SPG_POSM2_CD) END SPG_POSM2_NM,
       CASE WHEN SPG_POSM3_CD IS NULL OR SPG_POSM3_CD = '' THEN SPG_POSM3_CD else '[' || SPG_POSM3_CD || ']' || GetSP_COMMON_cdToNm('HM05A',SPG_POSM3_CD) END SPG_POSM3_NM,
       CASE WHEN SPG_BUSI_CD  IS NULL OR SPG_BUSI_CD  = '' THEN SPG_BUSI_CD  else '[' || SPG_BUSI_CD  || ']' || GetSP_COMMON_cdToNm('HM05B', SPG_BUSI_CD) END SPG_BUSI_NM,
       CASE WHEN SPG_CYCLE_CD IS NULL OR SPG_CYCLE_CD = '' THEN SPG_CYCLE_CD else '[' || SPG_CYCLE_CD || ']' || GetSP_COMMON_cdToNm('HM05C',SPG_CYCLE_CD) END SPG_CYCLE_NM,
       CASE WHEN SPG_ORSU_CD  IS NULL OR SPG_ORSU_CD  = '' THEN SPG_ORSU_CD  else '[' || SPG_ORSU_CD  || ']' || GetSP_COMMON_cdToNm('HM90E', SPG_ORGA_CD || SPG_ORSU_CD) END SPG_ORSU_NM,
       CASE WHEN SPG_DOCT_CD  IS NULL OR SPG_DOCT_CD  = '' THEN SPG_DOCT_CD  else '[' || SPG_DOCT_CD  || ']' || B.IAU_PENL_NM END SPG_DOCT_NM, A.*
  FROM ST_PANJUNG A LEFT OUTER JOIN IT_AUTH_USER B ON A.SPG_DOCT_CD = B.IAU_EMP_NO
 WHERE SPG_EXAM_DT  = :EXAM_DT
   AND SPG_EXAM_SQ  = :EXAM_SQ
   AND SPG_EXAM_CHA = :EXAM_CHA
 ORDER BY SPG_MATT_CD, SPG_MATT_SQ
		*/

		sql = " SELECT CASE WHEN SPG_SWING_CD IS NULL";
		sql += " OR SPG_SWING_CD = '' THEN SPG_SWING_CD ELSE '[' || SPG_SWING_CD || ']' || GETSP_COMMON_CDTONM('HM05F',SPG_SWING_CD) END SPG_SWING_NM, CASE WHEN SPG_PANJ_CD IS NULL";
		sql += " OR SPG_PANJ_CD = '' THEN SPG_PANJ_CD ELSE '[' || SPG_PANJ_CD || ']' || GETSP_COMMON_CDTONM('HM05E', SPG_PANJ_CD) END SPG_PANJ_NM, CASE WHEN SPG_ORGA_CD IS NULL";
		sql += " OR SPG_ORGA_CD = '' THEN SPG_ORGA_CD ELSE '[' || SPG_ORGA_CD || ']' || GETSP_COMMON_CDTONM('HM05D', SPG_ORGA_CD) END SPG_ORGA_NM, CASE WHEN SPG_JILH_CD IS NULL";
		sql += " OR SPG_JILH_CD = '' THEN SPG_JILH_CD ELSE '[' || SPG_JILH_CD || ']' || GETSP_COMMON_CDTONM('HM05H', SPG_JILH_CD) END SPG_JILH_NM, CASE WHEN SPG_POSM1_CD IS NULL";
		sql += " OR SPG_POSM1_CD = '' THEN SPG_POSM1_CD ELSE '[' || SPG_POSM1_CD || ']' || GETSP_COMMON_CDTONM('HM05A',SPG_POSM1_CD) END SPG_POSM1_NM, CASE WHEN SPG_POSM2_CD IS NULL";
		sql += " OR SPG_POSM2_CD = '' THEN SPG_POSM2_CD ELSE '[' || SPG_POSM2_CD || ']' || GETSP_COMMON_CDTONM('HM05A',SPG_POSM2_CD) END SPG_POSM2_NM, CASE WHEN SPG_POSM3_CD IS NULL";
		sql += " OR SPG_POSM3_CD = '' THEN SPG_POSM3_CD ELSE '[' || SPG_POSM3_CD || ']' || GETSP_COMMON_CDTONM('HM05A',SPG_POSM3_CD) END SPG_POSM3_NM, CASE WHEN SPG_BUSI_CD IS NULL";
		sql += " OR SPG_BUSI_CD = '' THEN SPG_BUSI_CD ELSE '[' || SPG_BUSI_CD || ']' || GETSP_COMMON_CDTONM('HM05B', SPG_BUSI_CD) END SPG_BUSI_NM, CASE WHEN SPG_CYCLE_CD IS NULL";
		sql += " OR SPG_CYCLE_CD = '' THEN SPG_CYCLE_CD ELSE '[' || SPG_CYCLE_CD || ']' || GETSP_COMMON_CDTONM('HM05C',SPG_CYCLE_CD) END SPG_CYCLE_NM, CASE WHEN SPG_ORSU_CD IS NULL";
		sql += " OR SPG_ORSU_CD = '' THEN SPG_ORSU_CD ELSE '[' || SPG_ORSU_CD || ']' || GETSP_COMMON_CDTONM('HM90E', SPG_ORGA_CD || SPG_ORSU_CD) END SPG_ORSU_NM, CASE WHEN SPG_DOCT_CD IS NULL";
		sql += " OR SPG_DOCT_CD = '' THEN SPG_DOCT_CD ELSE '[' || SPG_DOCT_CD || ']' || B.IAU_PENL_NM END SPG_DOCT_NM, A.*";
		sql += " FROM ST_PANJUNG A LEFT OUTER JOIN IT_AUTH_USER B";
		sql += " ON A.SPG_DOCT_CD = B.IAU_EMP_NO";
		sql += " WHERE SPG_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND SPG_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SPG_EXAM_CHA = '" + EXAM_CHA + "'";
		sql += " ORDER BY SPG_MATT_CD, SPG_MATT_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_PAST_PANJ_UP_MATTGridDisplay_001 \n";
			G_INFO += "설명 : 과거판정 물질별판정정보 내역조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " EXAM_CHA : " + EXAM_CHA + " \n";
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
		<s:AttributeType name='SPG_SWING_NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ORGA_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_JILH_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM1_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM2_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM3_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_BUSI_NM' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_CYCLE_NM' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ORSU_NM' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_DOCT_NM' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='112'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_EXAM_DT' rs:number='12' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_EXAM_DT' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_EXAM_SQ' rs:number='13' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_EXAM_SQ' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_EXAM_CHA' rs:number='14' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_EXAM_CHA'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_MATT_CD' rs:number='15' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_MATT_CD' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_MATT_SQ' rs:number='16' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_MATT_SQ' rs:keycolumn='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ORGA_CD' rs:number='17' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_ORGA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SWING_CD' rs:number='18' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_SWING_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SLNS_KD' rs:number='19' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_SLNS_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SOKY_CD' rs:number='20' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_SOKY_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SOKY_NM' rs:number='21' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_SOKY_NM'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_CD' rs:number='22' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_PANJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_JOCHI_CD' rs:number='23' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_JOCHI_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_JOCHI_NM' rs:number='24' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_JOCHI_NM'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_JILH_CD' rs:number='25' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_JILH_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM1_CD' rs:number='26' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_POSM1_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM2_CD' rs:number='27' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_POSM2_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM3_CD' rs:number='28' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_POSM3_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM1_TX' rs:number='29' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_POSM1_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM2_TX' rs:number='30' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_POSM2_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM3_TX' rs:number='31' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_POSM3_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM1_DT' rs:number='32' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_POSM1_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM2_DT' rs:number='33' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_POSM2_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_POSM3_DT' rs:number='34' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_POSM3_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_BUSI_CD' rs:number='35' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_BUSI_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_REMARK' rs:number='36' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_REMARK'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ETC_TX' rs:number='37' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_ETC_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ORSU_CD' rs:number='38' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_ORSU_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_CYCLE_CD' rs:number='39' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_CYCLE_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_CYCLE_TX' rs:number='40' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_CYCLE_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_CYCLE_DT' rs:number='41' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_CYCLE_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_DT' rs:number='42' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_PANJ_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_DOCT_CD' rs:number='43' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_INPT_ID' rs:number='44' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_INPT_DTT' rs:number='45' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_MODI_ID' rs:number='46' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_MODI_DTT' rs:number='47' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SOKY_TX' rs:number='48' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_SOKY_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PAN_CHECK' rs:number='49' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_PAN_CHECK'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ORGA_ETC' rs:number='50' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_ORGA_ETC'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String SPG_SWING_NM_T = cRsList.getString("SPG_SWING_NM");
			String SPG_PANJ_NM_T = cRsList.getString("SPG_PANJ_NM");
			String SPG_ORGA_NM_T = cRsList.getString("SPG_ORGA_NM");
			String SPG_JILH_NM_T = cRsList.getString("SPG_JILH_NM");
			String SPG_POSM1_NM_T = cRsList.getString("SPG_POSM1_NM");
			String SPG_POSM2_NM_T = cRsList.getString("SPG_POSM2_NM");
			String SPG_POSM3_NM_T = cRsList.getString("SPG_POSM3_NM");
			String SPG_BUSI_NM_T = cRsList.getString("SPG_BUSI_NM");
			String SPG_CYCLE_NM_T = cRsList.getString("SPG_CYCLE_NM");
			String SPG_ORSU_NM_T = cRsList.getString("SPG_ORSU_NM");
			String SPG_DOCT_NM_T = cRsList.getString("SPG_DOCT_NM");
			String SPG_EXAM_DT_T = cRsList.getString("SPG_EXAM_DT");
			String SPG_EXAM_SQ_T = cRsList.getString("SPG_EXAM_SQ");
			String SPG_EXAM_CHA_T = cRsList.getString("SPG_EXAM_CHA");
			String SPG_MATT_CD_T = cRsList.getString("SPG_MATT_CD");
			String SPG_MATT_SQ_T = cRsList.getString("SPG_MATT_SQ");
			String SPG_ORGA_CD_T = cRsList.getString("SPG_ORGA_CD");
			String SPG_SWING_CD_T = cRsList.getString("SPG_SWING_CD");
			String SPG_SLNS_KD_T = cRsList.getString("SPG_SLNS_KD");
			String SPG_SOKY_CD_T = cRsList.getString("SPG_SOKY_CD");
			String SPG_SOKY_NM_T = cRsList.getString("SPG_SOKY_NM");
			String SPG_PANJ_CD_T = cRsList.getString("SPG_PANJ_CD");
			String SPG_JOCHI_CD_T = cRsList.getString("SPG_JOCHI_CD");
			String SPG_JOCHI_NM_T = cRsList.getString("SPG_JOCHI_NM");
			String SPG_JILH_CD_T = cRsList.getString("SPG_JILH_CD");
			String SPG_POSM1_CD_T = cRsList.getString("SPG_POSM1_CD");
			String SPG_POSM2_CD_T = cRsList.getString("SPG_POSM2_CD");
			String SPG_POSM3_CD_T = cRsList.getString("SPG_POSM3_CD");
			String SPG_POSM1_TX_T = cRsList.getString("SPG_POSM1_TX");
			String SPG_POSM2_TX_T = cRsList.getString("SPG_POSM2_TX");
			String SPG_POSM3_TX_T = cRsList.getString("SPG_POSM3_TX");
			String SPG_POSM1_DT_T = cRsList.getString("SPG_POSM1_DT");
			String SPG_POSM2_DT_T = cRsList.getString("SPG_POSM2_DT");
			String SPG_POSM3_DT_T = cRsList.getString("SPG_POSM3_DT");
			String SPG_BUSI_CD_T = cRsList.getString("SPG_BUSI_CD");
			String SPG_REMARK_T = cRsList.getString("SPG_REMARK");
			String SPG_ETC_TX_T = cRsList.getString("SPG_ETC_TX");
			String SPG_ORSU_CD_T = cRsList.getString("SPG_ORSU_CD");
			String SPG_CYCLE_CD_T = cRsList.getString("SPG_CYCLE_CD");
			String SPG_CYCLE_TX_T = cRsList.getString("SPG_CYCLE_TX");
			String SPG_CYCLE_DT_T = cRsList.getString("SPG_CYCLE_DT");
			String SPG_PANJ_DT_T = cRsList.getString("SPG_PANJ_DT");
			String SPG_DOCT_CD_T = cRsList.getString("SPG_DOCT_CD");
			String SPG_INPT_ID_T = cRsList.getString("SPG_INPT_ID");
			String SPG_INPT_DTT_T = cRsList.getDate2("SPG_INPT_DTT");
			String SPG_MODI_ID_T = cRsList.getString("SPG_MODI_ID");
			String SPG_MODI_DTT_T = cRsList.getDate2("SPG_MODI_DTT");
			String SPG_SOKY_TX_T = cRsList.getString("SPG_SOKY_TX");
			String SPG_PAN_CHECK_T = cRsList.getString("SPG_PAN_CHECK");
			String SPG_ORGA_ETC_T = cRsList.getString("SPG_ORGA_ETC");
%>
			<z:row
<%
			if(! SPG_SWING_NM_T.equals("")) {
%>
		 		SPG_SWING_NM='<%= SPG_SWING_NM_T%>'
<%
			}

			if(! SPG_PANJ_NM_T.equals("")) {
%>
		 		SPG_PANJ_NM='<%= SPG_PANJ_NM_T%>'
<%
			}

			if(! SPG_ORGA_NM_T.equals("")) {
%>
		 		SPG_ORGA_NM='<%= SPG_ORGA_NM_T%>'
<%
			}

			if(! SPG_JILH_NM_T.equals("")) {
%>
		 		SPG_JILH_NM='<%= SPG_JILH_NM_T%>'
<%
			}

			if(! SPG_POSM1_NM_T.equals("")) {
%>
		 		SPG_POSM1_NM='<%= SPG_POSM1_NM_T%>'
<%
			}

			if(! SPG_POSM2_NM_T.equals("")) {
%>
		 		SPG_POSM2_NM='<%= SPG_POSM2_NM_T%>'
<%
			}

			if(! SPG_POSM3_NM_T.equals("")) {
%>
		 		SPG_POSM3_NM='<%= SPG_POSM3_NM_T%>'
<%
			}

			if(! SPG_BUSI_NM_T.equals("")) {
%>
		 		SPG_BUSI_NM='<%= SPG_BUSI_NM_T%>'
<%
			}

			if(! SPG_CYCLE_NM_T.equals("")) {
%>
		 		SPG_CYCLE_NM='<%= SPG_CYCLE_NM_T%>'
<%
			}

			if(! SPG_ORSU_NM_T.equals("")) {
%>
		 		SPG_ORSU_NM='<%= SPG_ORSU_NM_T%>'
<%
			}

			if(! SPG_DOCT_NM_T.equals("")) {
%>
		 		SPG_DOCT_NM='<%= SPG_DOCT_NM_T%>'
<%
			}

			if(! SPG_EXAM_DT_T.equals("")) {
%>
		 		SPG_EXAM_DT='<%= SPG_EXAM_DT_T%>'
<%
			}

			if(! SPG_EXAM_SQ_T.equals("")) {
%>
		 		SPG_EXAM_SQ='<%= SPG_EXAM_SQ_T%>'
<%
			}

			if(! SPG_EXAM_CHA_T.equals("")) {
%>
		 		SPG_EXAM_CHA='<%= SPG_EXAM_CHA_T%>'
<%
			}

			if(! SPG_MATT_CD_T.equals("")) {
%>
		 		SPG_MATT_CD='<%= SPG_MATT_CD_T%>'
<%
			}

			if(! SPG_MATT_SQ_T.equals("")) {
%>
		 		SPG_MATT_SQ='<%= SPG_MATT_SQ_T%>'
<%
			}

			if(! SPG_ORGA_CD_T.equals("")) {
%>
		 		SPG_ORGA_CD='<%= SPG_ORGA_CD_T%>'
<%
			}

			if(! SPG_SWING_CD_T.equals("")) {
%>
		 		SPG_SWING_CD='<%= SPG_SWING_CD_T%>'
<%
			}

			if(! SPG_SLNS_KD_T.equals("")) {
%>
		 		SPG_SLNS_KD='<%= SPG_SLNS_KD_T%>'
<%
			}

			if(! SPG_SOKY_CD_T.equals("")) {
%>
		 		SPG_SOKY_CD='<%= SPG_SOKY_CD_T%>'
<%
			}

			if(! SPG_SOKY_NM_T.equals("")) {
%>
		 		SPG_SOKY_NM='<%= SPG_SOKY_NM_T%>'
<%
			}

			if(! SPG_PANJ_CD_T.equals("")) {
%>
		 		SPG_PANJ_CD='<%= SPG_PANJ_CD_T%>'
<%
			}

			if(! SPG_JOCHI_CD_T.equals("")) {
%>
		 		SPG_JOCHI_CD='<%= SPG_JOCHI_CD_T%>'
<%
			}

			if(! SPG_JOCHI_NM_T.equals("")) {
%>
		 		SPG_JOCHI_NM='<%= SPG_JOCHI_NM_T%>'
<%
			}

			if(! SPG_JILH_CD_T.equals("")) {
%>
		 		SPG_JILH_CD='<%= SPG_JILH_CD_T%>'
<%
			}

			if(! SPG_POSM1_CD_T.equals("")) {
%>
		 		SPG_POSM1_CD='<%= SPG_POSM1_CD_T%>'
<%
			}

			if(! SPG_POSM2_CD_T.equals("")) {
%>
		 		SPG_POSM2_CD='<%= SPG_POSM2_CD_T%>'
<%
			}

			if(! SPG_POSM3_CD_T.equals("")) {
%>
		 		SPG_POSM3_CD='<%= SPG_POSM3_CD_T%>'
<%
			}

			if(! SPG_POSM1_TX_T.equals("")) {
%>
		 		SPG_POSM1_TX='<%= SPG_POSM1_TX_T%>'
<%
			}

			if(! SPG_POSM2_TX_T.equals("")) {
%>
		 		SPG_POSM2_TX='<%= SPG_POSM2_TX_T%>'
<%
			}

			if(! SPG_POSM3_TX_T.equals("")) {
%>
		 		SPG_POSM3_TX='<%= SPG_POSM3_TX_T%>'
<%
			}

			if(! SPG_POSM1_DT_T.equals("")) {
%>
		 		SPG_POSM1_DT='<%= SPG_POSM1_DT_T%>'
<%
			}

			if(! SPG_POSM2_DT_T.equals("")) {
%>
		 		SPG_POSM2_DT='<%= SPG_POSM2_DT_T%>'
<%
			}

			if(! SPG_POSM3_DT_T.equals("")) {
%>
		 		SPG_POSM3_DT='<%= SPG_POSM3_DT_T%>'
<%
			}

			if(! SPG_BUSI_CD_T.equals("")) {
%>
		 		SPG_BUSI_CD='<%= SPG_BUSI_CD_T%>'
<%
			}

			if(! SPG_REMARK_T.equals("")) {
%>
		 		SPG_REMARK='<%= SPG_REMARK_T%>'
<%
			}

			if(! SPG_ETC_TX_T.equals("")) {
%>
		 		SPG_ETC_TX='<%= SPG_ETC_TX_T%>'
<%
			}

			if(! SPG_ORSU_CD_T.equals("")) {
%>
		 		SPG_ORSU_CD='<%= SPG_ORSU_CD_T%>'
<%
			}

			if(! SPG_CYCLE_CD_T.equals("")) {
%>
		 		SPG_CYCLE_CD='<%= SPG_CYCLE_CD_T%>'
<%
			}

			if(! SPG_CYCLE_TX_T.equals("")) {
%>
		 		SPG_CYCLE_TX='<%= SPG_CYCLE_TX_T%>'
<%
			}

			if(! SPG_CYCLE_DT_T.equals("")) {
%>
		 		SPG_CYCLE_DT='<%= SPG_CYCLE_DT_T%>'
<%
			}

			if(! SPG_PANJ_DT_T.equals("")) {
%>
		 		SPG_PANJ_DT='<%= SPG_PANJ_DT_T%>'
<%
			}

			if(! SPG_DOCT_CD_T.equals("")) {
%>
		 		SPG_DOCT_CD='<%= SPG_DOCT_CD_T%>'
<%
			}

			if(! SPG_INPT_ID_T.equals("")) {
%>
		 		SPG_INPT_ID='<%= SPG_INPT_ID_T%>'
<%
			}

			if(! SPG_INPT_DTT_T.equals("")) {
%>
		 		SPG_INPT_DTT='<%= SPG_INPT_DTT_T%>'
<%
			}

			if(! SPG_MODI_ID_T.equals("")) {
%>
		 		SPG_MODI_ID='<%= SPG_MODI_ID_T%>'
<%
			}

			if(! SPG_MODI_DTT_T.equals("")) {
%>
		 		SPG_MODI_DTT='<%= SPG_MODI_DTT_T%>'
<%
			}

			if(! SPG_SOKY_TX_T.equals("")) {
%>
		 		SPG_SOKY_TX='<%= SPG_SOKY_TX_T%>'
<%
			}

			if(! SPG_PAN_CHECK_T.equals("")) {
%>
		 		SPG_PAN_CHECK='<%= SPG_PAN_CHECK_T%>'
<%
			}

			if(! SPG_ORGA_ETC_T.equals("")) {
%>
		 		SPG_ORGA_ETC='<%= SPG_ORGA_ETC_T%>'
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
