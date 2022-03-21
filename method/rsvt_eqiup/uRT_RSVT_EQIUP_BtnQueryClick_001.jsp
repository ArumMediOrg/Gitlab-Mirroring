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

		String EQUI_CD = htMethod.get("EQUI_CD");
		String USE_YN = htMethod.get("USE_YN");

		//
		if(EQUI_CD == null) { EQUI_CD = ""; }
		if(USE_YN == null) { USE_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CASE WHEN RRE_PART_CD IS NULL OR RRE_PART_CD = '' THEN RRE_PART_CD ELSE '[' || RRE_PART_CD || ']' || GETCOMMON_LVCDTONM('0501',RRE_PART_CD,'5',4) END RRE_PART_NM,
       CASE WHEN RRE_TIME_CD IS NULL OR RRE_TIME_CD = '' THEN RRE_TIME_CD ELSE '[' || RRE_TIME_CD || ']' || GETCOMMON_LVCDTONM('0816',RRE_TIME_CD,'5',1) END RRE_TIME_NM,
       CASE WHEN RRE_SCHE_CD IS NULL OR RRE_SCHE_CD = '' THEN RRE_SCHE_CD ELSE '[' || RRE_SCHE_CD || ']' || GETCOMMON_LVCDTONM('0818',RRE_SCHE_CD,'5',1) END RRE_SCHE_NM,
       CASE WHEN RRE_WORK_CD IS NULL OR RRE_WORK_CD = '' THEN RRE_WORK_CD ELSE '[' || RRE_WORK_CD || ']' || GETCOMMON_LVCDTONM('0819',RRE_WORK_CD,'5',1) END RRE_WORK_NM,
       A.*
  FROM RT_RSVT_EQUIP A
 WHERE 0 = 0

IF (:EQUI_CD <> '') THEN
   AND RRE_EQUI_CD = :EQUI_CD

IF (:USE_YN <> '') THEN
   AND RRE_USE_YN = :USE_YN

 ORDER BY RRE_EQUI_CD                                                                                  
		*/

		sql = " SELECT CASE WHEN RRE_PART_CD IS NULL OR RRE_PART_CD = '' THEN RRE_PART_CD ELSE '[' || RRE_PART_CD || ']' || GETCOMMON_LVCDTONM('0501',RRE_PART_CD,'5',4) END RRE_PART_NM";
		sql += ", CASE WHEN RRE_TIME_CD IS NULL OR RRE_TIME_CD = '' THEN RRE_TIME_CD ELSE '[' || RRE_TIME_CD || ']' || GETCOMMON_LVCDTONM('0816',RRE_TIME_CD,'5',1) END RRE_TIME_NM";
		sql += ", CASE WHEN RRE_SCHE_CD IS NULL OR RRE_SCHE_CD = '' THEN RRE_SCHE_CD ELSE '[' || RRE_SCHE_CD || ']' || GETCOMMON_LVCDTONM('0818',RRE_SCHE_CD,'5',1) END RRE_SCHE_NM";
		sql += ", CASE WHEN RRE_WORK_CD IS NULL OR RRE_WORK_CD = '' THEN RRE_WORK_CD ELSE '[' || RRE_WORK_CD || ']' || GETCOMMON_LVCDTONM('0819',RRE_WORK_CD,'5',1) END RRE_WORK_NM";
		sql += ", A.*";
		sql += " FROM RT_RSVT_EQUIP A";
		sql += " WHERE 0 = 0";

		if(!EQUI_CD.equals("")) {
			sql += " AND RRE_EQUI_CD = '" + EQUI_CD + "'";
		}
		if(!USE_YN.equals("")) {
			sql += " AND RRE_USE_YN = '" + USE_YN + "'";
		}
		sql += " ORDER BY RRE_EQUI_CD";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_RSVT_EQIUP_BtnQueryClick_001 \n";
			G_INFO += "설명 : 예약 장비 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EQUI_CD : " + EQUI_CD + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
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
		<s:AttributeType name='RRE_PART_NM' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_PART_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_TIME_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_TIME_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_SCHE_NM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_SCHE_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WORK_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WORK_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_EQUI_CD' rs:number='5' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP' rs:basecolumn='RRE_EQUI_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_EQUI_NM' rs:number='6' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP' rs:basecolumn='RRE_EQUI_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_ITEM_LT' rs:number='7' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP' rs:basecolumn='RRE_ITEM_LT'>
			<s:datatype dt:type='string' dt:maxLength='400' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_PART_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_PART_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WKSU_YN' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WKSU_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WKMO_YN' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WKMO_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WKTU_YN' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WKTU_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WKWE_YN' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WKWE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WKTH_YN' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WKTH_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WKFR_YN' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WKFR_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WKSA_YN' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WKSA_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_TIME_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_TIME_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WDAM_STM' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WDAM_STM'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WDAM_ETM' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WDAM_ETM'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WDPM_STM' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WDPM_STM'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WDPM_ETM' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WDPM_ETM'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WKAM_STM' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WKAM_STM'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WKAM_ETM' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WKAM_ETM'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_SCHE_CD' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_SCHE_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_SCHE_MM' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_SCHE_MM'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_SCHE_CNT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_SCHE_CNT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_WORK_CD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_WORK_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_USE_YN' rs:number='27' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP' rs:basecolumn='RRE_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_NUSE_ID' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_NUSE_DTT' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_INPT_ID' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_INPT_DTT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_MODI_ID' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRE_MODI_DTT' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP'
			 rs:basecolumn='RRE_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='34' rs:rowid='true' rs:basetable='RT_RSVT_EQUIP' rs:basecolumn='ROWID'
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

			String RRE_PART_NM_T = cRsList.getString("RRE_PART_NM");
			String RRE_TIME_NM_T = cRsList.getString("RRE_TIME_NM");
			String RRE_SCHE_NM_T = cRsList.getString("RRE_SCHE_NM");
			String RRE_WORK_NM_T = cRsList.getString("RRE_WORK_NM");
			String RRE_EQUI_CD_T = cRsList.getString("RRE_EQUI_CD");
			String RRE_EQUI_NM_T = cRsList.getString("RRE_EQUI_NM");
			String RRE_ITEM_LT_T = cRsList.getString("RRE_ITEM_LT");
			String RRE_PART_CD_T = cRsList.getString("RRE_PART_CD");
			String RRE_WKSU_YN_T = cRsList.getString("RRE_WKSU_YN");
			String RRE_WKMO_YN_T = cRsList.getString("RRE_WKMO_YN");
			String RRE_WKTU_YN_T = cRsList.getString("RRE_WKTU_YN");
			String RRE_WKWE_YN_T = cRsList.getString("RRE_WKWE_YN");
			String RRE_WKTH_YN_T = cRsList.getString("RRE_WKTH_YN");
			String RRE_WKFR_YN_T = cRsList.getString("RRE_WKFR_YN");
			String RRE_WKSA_YN_T = cRsList.getString("RRE_WKSA_YN");
			String RRE_TIME_CD_T = cRsList.getString("RRE_TIME_CD");
			String RRE_WDAM_STM_T = cRsList.getString("RRE_WDAM_STM");
			String RRE_WDAM_ETM_T = cRsList.getString("RRE_WDAM_ETM");
			String RRE_WDPM_STM_T = cRsList.getString("RRE_WDPM_STM");
			String RRE_WDPM_ETM_T = cRsList.getString("RRE_WDPM_ETM");
			String RRE_WKAM_STM_T = cRsList.getString("RRE_WKAM_STM");
			String RRE_WKAM_ETM_T = cRsList.getString("RRE_WKAM_ETM");
			String RRE_SCHE_CD_T = cRsList.getString("RRE_SCHE_CD");
			String RRE_SCHE_MM_T = cRsList.getString("RRE_SCHE_MM");
			String RRE_SCHE_CNT_T = cRsList.getString("RRE_SCHE_CNT");
			String RRE_WORK_CD_T = cRsList.getString("RRE_WORK_CD");
			String RRE_USE_YN_T = cRsList.getString("RRE_USE_YN");
			String RRE_NUSE_ID_T = cRsList.getString("RRE_NUSE_ID");
			String RRE_NUSE_DTT_T = cRsList.getDate2("RRE_NUSE_DTT");
			String RRE_INPT_ID_T = cRsList.getString("RRE_INPT_ID");
			String RRE_INPT_DTT_T = cRsList.getDate2("RRE_INPT_DTT");
			String RRE_MODI_ID_T = cRsList.getString("RRE_MODI_ID");
			String RRE_MODI_DTT_T = cRsList.getDate2("RRE_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! RRE_PART_NM_T.equals("")) {
%>
		 		RRE_PART_NM='<%= RRE_PART_NM_T%>'
<%
			}

			if(! RRE_TIME_NM_T.equals("")) {
%>
		 		RRE_TIME_NM='<%= RRE_TIME_NM_T%>'
<%
			}

			if(! RRE_SCHE_NM_T.equals("")) {
%>
		 		RRE_SCHE_NM='<%= RRE_SCHE_NM_T%>'
<%
			}

			if(! RRE_WORK_NM_T.equals("")) {
%>
		 		RRE_WORK_NM='<%= RRE_WORK_NM_T%>'
<%
			}

			if(! RRE_EQUI_CD_T.equals("")) {
%>
		 		RRE_EQUI_CD='<%= RRE_EQUI_CD_T%>'
<%
			}

			if(! RRE_EQUI_NM_T.equals("")) {
%>
		 		RRE_EQUI_NM='<%= RRE_EQUI_NM_T%>'
<%
			}

			if(! RRE_ITEM_LT_T.equals("")) {
%>
		 		RRE_ITEM_LT='<%= RRE_ITEM_LT_T%>'
<%
			}

			if(! RRE_PART_CD_T.equals("")) {
%>
		 		RRE_PART_CD='<%= RRE_PART_CD_T%>'
<%
			}

			if(! RRE_WKSU_YN_T.equals("")) {
%>
		 		RRE_WKSU_YN='<%= RRE_WKSU_YN_T%>'
<%
			}

			if(! RRE_WKMO_YN_T.equals("")) {
%>
		 		RRE_WKMO_YN='<%= RRE_WKMO_YN_T%>'
<%
			}

			if(! RRE_WKTU_YN_T.equals("")) {
%>
		 		RRE_WKTU_YN='<%= RRE_WKTU_YN_T%>'
<%
			}

			if(! RRE_WKWE_YN_T.equals("")) {
%>
		 		RRE_WKWE_YN='<%= RRE_WKWE_YN_T%>'
<%
			}

			if(! RRE_WKTH_YN_T.equals("")) {
%>
		 		RRE_WKTH_YN='<%= RRE_WKTH_YN_T%>'
<%
			}

			if(! RRE_WKFR_YN_T.equals("")) {
%>
		 		RRE_WKFR_YN='<%= RRE_WKFR_YN_T%>'
<%
			}

			if(! RRE_WKSA_YN_T.equals("")) {
%>
		 		RRE_WKSA_YN='<%= RRE_WKSA_YN_T%>'
<%
			}

			if(! RRE_TIME_CD_T.equals("")) {
%>
		 		RRE_TIME_CD='<%= RRE_TIME_CD_T%>'
<%
			}

			if(! RRE_WDAM_STM_T.equals("")) {
%>
		 		RRE_WDAM_STM='<%= RRE_WDAM_STM_T%>'
<%
			}

			if(! RRE_WDAM_ETM_T.equals("")) {
%>
		 		RRE_WDAM_ETM='<%= RRE_WDAM_ETM_T%>'
<%
			}

			if(! RRE_WDPM_STM_T.equals("")) {
%>
		 		RRE_WDPM_STM='<%= RRE_WDPM_STM_T%>'
<%
			}

			if(! RRE_WDPM_ETM_T.equals("")) {
%>
		 		RRE_WDPM_ETM='<%= RRE_WDPM_ETM_T%>'
<%
			}

			if(! RRE_WKAM_STM_T.equals("")) {
%>
		 		RRE_WKAM_STM='<%= RRE_WKAM_STM_T%>'
<%
			}

			if(! RRE_WKAM_ETM_T.equals("")) {
%>
		 		RRE_WKAM_ETM='<%= RRE_WKAM_ETM_T%>'
<%
			}

			if(! RRE_SCHE_CD_T.equals("")) {
%>
		 		RRE_SCHE_CD='<%= RRE_SCHE_CD_T%>'
<%
			}

			if(! RRE_SCHE_MM_T.equals("")) {
%>
		 		RRE_SCHE_MM='<%= RRE_SCHE_MM_T%>'
<%
			}

			if(! RRE_SCHE_CNT_T.equals("")) {
%>
		 		RRE_SCHE_CNT='<%= RRE_SCHE_CNT_T%>'
<%
			}

			if(! RRE_WORK_CD_T.equals("")) {
%>
		 		RRE_WORK_CD='<%= RRE_WORK_CD_T%>'
<%
			}

			if(! RRE_USE_YN_T.equals("")) {
%>
		 		RRE_USE_YN='<%= RRE_USE_YN_T%>'
<%
			}

			if(! RRE_NUSE_ID_T.equals("")) {
%>
		 		RRE_NUSE_ID='<%= RRE_NUSE_ID_T%>'
<%
			}

			if(! RRE_NUSE_DTT_T.equals("")) {
%>
		 		RRE_NUSE_DTT='<%= RRE_NUSE_DTT_T%>'
<%
			}

			if(! RRE_INPT_ID_T.equals("")) {
%>
		 		RRE_INPT_ID='<%= RRE_INPT_ID_T%>'
<%
			}

			if(! RRE_INPT_DTT_T.equals("")) {
%>
		 		RRE_INPT_DTT='<%= RRE_INPT_DTT_T%>'
<%
			}

			if(! RRE_MODI_ID_T.equals("")) {
%>
		 		RRE_MODI_ID='<%= RRE_MODI_ID_T%>'
<%
			}

			if(! RRE_MODI_DTT_T.equals("")) {
%>
		 		RRE_MODI_DTT='<%= RRE_MODI_DTT_T%>'
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
