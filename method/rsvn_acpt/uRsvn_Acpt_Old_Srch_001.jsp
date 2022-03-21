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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String ROW_ID = htMethod.get("ROW_ID");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(ROW_ID == null) { ROW_ID = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.*, B.ICY_COMP_CD, B.ICY_COMP_NM 
  FROM RT_RSVT_OLD A LEFT OUTER JOIN IT_COMPANY B
    ON B.ICY_PAST_CD = A.RRO_COMP_CD 
 WHERE A.RRO_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT

if (:PSNL_NM <> '') then
   AND A.RRO_PSNL_NM LIKE :PSNL_NM||'%'

if (:ROW_ID <> '') then
   AND A.RRO_ROW_ID = :ROW_ID

 :PARAM_TX  
		*/

		sql = " SELECT A.*, B.ICY_COMP_CD, B.ICY_COMP_NM";
		sql += " FROM RT_RSVT_OLD A LEFT OUTER JOIN IT_COMPANY B";
		sql += " ON B.ICY_PAST_CD = A.RRO_COMP_CD";
		sql += " WHERE A.RRO_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";

		if(! PSNL_NM.equals("")) {
			sql += " AND A.RRO_PSNL_NM LIKE '" + PSNL_NM + "%'";
		}

		if(! ROW_ID.equals("")) {
			sql += " AND A.RRO_ROW_ID = '" + ROW_ID + "'";
		}

		sql += PARAM_TX;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_Old_Srch_001 \n";
			G_INFO += "설명 : 구 예약자료 내역조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " ROW_ID : " + ROW_ID + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
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
		<s:AttributeType name='RRO_RSVN_DT' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_RSVN_DT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_RSVN_TM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_RSVN_TM'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_RSVN_ST' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_RSVN_ST'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_CHART_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_PSNL_NM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_PSNL_ID1' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_PSNL_ID1'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_PSNL_ID2' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_PSNL_ID2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_BIRTH_DT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_BIRTH_DT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_SEX_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_TEL_NO1' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_TEL_NO1'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_TEL_NO2' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_TEL_NO2'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_MOBL_NO' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_EMAIL_AR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_ZIP_CD1' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_ZIP_CD1'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_ZIP_CD2' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_ZIP_CD2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_ZIP_AR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_ROAD_AR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_ETC_AR' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_ETC_AR'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_EXAM_DT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_EXAM_TM' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_EXAM_TM'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_ACPT_CD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_ACPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_EXAM_LT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_EXAM_LT'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_EXAM_NM' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_EXAM_NM'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_COMP_CD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_COMP_NM' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_SEND_YN' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_SEND_YN'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_SEND_DT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_SEND_DT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_SALES_ID' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_SALES_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_SALES_NM' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_SALES_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_RSVN_TX' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_RSVN_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_CNCL_TX' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_CNCL_TX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_ETC_TX' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_ETC_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_WAIT_DT' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_WAIT_DT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_DRUG_DT' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_DRUG_DT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_DRUG_RDT' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_DRUG_RDT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_COLON_DT' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_COLON_DT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_FLEET_TX' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_FLEET_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_PSNL_ID' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_PSNL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_ZIP_CD' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_RSVN_NO' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_RSVN_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRO_ROW_ID' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT_OLD'
			 rs:basecolumn='RRO_ROW_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_CD' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='120'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='44' rs:rowid='true' rs:basetable='RT_RSVT_OLD' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c44' rs:name='ROWID' rs:number='45' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
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

			String RRO_RSVN_DT_T = cRsList.getString("RRO_RSVN_DT");
			String RRO_RSVN_TM_T = cRsList.getString("RRO_RSVN_TM");
			String RRO_RSVN_ST_T = cRsList.getString("RRO_RSVN_ST");
			String RRO_CHART_NO_T = cRsList.getString("RRO_CHART_NO");
			String RRO_PSNL_NM_T = cRsList.getString("RRO_PSNL_NM");
			String RRO_PSNL_ID1_T = cRsList.getString("RRO_PSNL_ID1");
			String RRO_PSNL_ID2_T = cRsList.getString("RRO_PSNL_ID2");
			String RRO_BIRTH_DT_T = cRsList.getString("RRO_BIRTH_DT");
			String RRO_SEX_CD_T = cRsList.getString("RRO_SEX_CD");
			String RRO_TEL_NO1_T = cRsList.getString("RRO_TEL_NO1");
			String RRO_TEL_NO2_T = cRsList.getString("RRO_TEL_NO2");
			String RRO_MOBL_NO_T = cRsList.getString("RRO_MOBL_NO");
			String RRO_EMAIL_AR_T = cRsList.getString("RRO_EMAIL_AR");
			String RRO_ZIP_CD1_T = cRsList.getString("RRO_ZIP_CD1");
			String RRO_ZIP_CD2_T = cRsList.getString("RRO_ZIP_CD2");
			String RRO_ZIP_AR_T = cRsList.getString("RRO_ZIP_AR");
			String RRO_ROAD_AR_T = cRsList.getString("RRO_ROAD_AR");
			String RRO_ETC_AR_T = cRsList.getString("RRO_ETC_AR");
			String RRO_EXAM_DT_T = cRsList.getString("RRO_EXAM_DT");
			String RRO_EXAM_TM_T = cRsList.getString("RRO_EXAM_TM");
			String RRO_ACPT_CD_T = cRsList.getString("RRO_ACPT_CD");
			String RRO_EXAM_LT_T = cRsList.getString("RRO_EXAM_LT");
			String RRO_EXAM_NM_T = cRsList.getString("RRO_EXAM_NM");
			String RRO_COMP_CD_T = cRsList.getString("RRO_COMP_CD");
			String RRO_COMP_NM_T = cRsList.getString("RRO_COMP_NM");
			String RRO_SEND_YN_T = cRsList.getString("RRO_SEND_YN");
			String RRO_SEND_DT_T = cRsList.getString("RRO_SEND_DT");
			String RRO_SALES_ID_T = cRsList.getString("RRO_SALES_ID");
			String RRO_SALES_NM_T = cRsList.getString("RRO_SALES_NM");
			String RRO_RSVN_TX_T = cRsList.getString("RRO_RSVN_TX");
			String RRO_CNCL_TX_T = cRsList.getString("RRO_CNCL_TX");
			String RRO_ETC_TX_T = cRsList.getString("RRO_ETC_TX");
			String RRO_WAIT_DT_T = cRsList.getString("RRO_WAIT_DT");
			String RRO_DRUG_DT_T = cRsList.getString("RRO_DRUG_DT");
			String RRO_DRUG_RDT_T = cRsList.getString("RRO_DRUG_RDT");
			String RRO_COLON_DT_T = cRsList.getString("RRO_COLON_DT");
			String RRO_FLEET_TX_T = cRsList.getString("RRO_FLEET_TX");
			String RRO_PSNL_ID_T = cRsList.getString("RRO_PSNL_ID");
			String RRO_ZIP_CD_T = cRsList.getString("RRO_ZIP_CD");
			String RRO_RSVN_NO_T = cRsList.getString("RRO_RSVN_NO");
			String RRO_ROW_ID_T = cRsList.getString("RRO_ROW_ID");
			String ICY_COMP_CD_T = cRsList.getString("ICY_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c44_T = cRsList.getString("c44");
%>
			<z:row
<%
			if(! RRO_RSVN_DT_T.equals("")) {
%>
		 		RRO_RSVN_DT='<%= RRO_RSVN_DT_T%>'
<%
			}

			if(! RRO_RSVN_TM_T.equals("")) {
%>
		 		RRO_RSVN_TM='<%= RRO_RSVN_TM_T%>'
<%
			}

			if(! RRO_RSVN_ST_T.equals("")) {
%>
		 		RRO_RSVN_ST='<%= RRO_RSVN_ST_T%>'
<%
			}

			if(! RRO_CHART_NO_T.equals("")) {
%>
		 		RRO_CHART_NO='<%= RRO_CHART_NO_T%>'
<%
			}

			if(! RRO_PSNL_NM_T.equals("")) {
%>
		 		RRO_PSNL_NM='<%= RRO_PSNL_NM_T%>'
<%
			}

			if(! RRO_PSNL_ID1_T.equals("")) {
%>
		 		RRO_PSNL_ID1='<%= RRO_PSNL_ID1_T%>'
<%
			}

			if(! RRO_PSNL_ID2_T.equals("")) {
%>
		 		RRO_PSNL_ID2='<%= RRO_PSNL_ID2_T%>'
<%
			}

			if(! RRO_BIRTH_DT_T.equals("")) {
%>
		 		RRO_BIRTH_DT='<%= RRO_BIRTH_DT_T%>'
<%
			}

			if(! RRO_SEX_CD_T.equals("")) {
%>
		 		RRO_SEX_CD='<%= RRO_SEX_CD_T%>'
<%
			}

			if(! RRO_TEL_NO1_T.equals("")) {
%>
		 		RRO_TEL_NO1='<%= RRO_TEL_NO1_T%>'
<%
			}

			if(! RRO_TEL_NO2_T.equals("")) {
%>
		 		RRO_TEL_NO2='<%= RRO_TEL_NO2_T%>'
<%
			}

			if(! RRO_MOBL_NO_T.equals("")) {
%>
		 		RRO_MOBL_NO='<%= RRO_MOBL_NO_T%>'
<%
			}

			if(! RRO_EMAIL_AR_T.equals("")) {
%>
		 		RRO_EMAIL_AR='<%= RRO_EMAIL_AR_T%>'
<%
			}

			if(! RRO_ZIP_CD1_T.equals("")) {
%>
		 		RRO_ZIP_CD1='<%= RRO_ZIP_CD1_T%>'
<%
			}

			if(! RRO_ZIP_CD2_T.equals("")) {
%>
		 		RRO_ZIP_CD2='<%= RRO_ZIP_CD2_T%>'
<%
			}

			if(! RRO_ZIP_AR_T.equals("")) {
%>
		 		RRO_ZIP_AR='<%= RRO_ZIP_AR_T%>'
<%
			}

			if(! RRO_ROAD_AR_T.equals("")) {
%>
		 		RRO_ROAD_AR='<%= RRO_ROAD_AR_T%>'
<%
			}

			if(! RRO_ETC_AR_T.equals("")) {
%>
		 		RRO_ETC_AR='<%= RRO_ETC_AR_T%>'
<%
			}

			if(! RRO_EXAM_DT_T.equals("")) {
%>
		 		RRO_EXAM_DT='<%= RRO_EXAM_DT_T%>'
<%
			}

			if(! RRO_EXAM_TM_T.equals("")) {
%>
		 		RRO_EXAM_TM='<%= RRO_EXAM_TM_T%>'
<%
			}

			if(! RRO_ACPT_CD_T.equals("")) {
%>
		 		RRO_ACPT_CD='<%= RRO_ACPT_CD_T%>'
<%
			}

			if(! RRO_EXAM_LT_T.equals("")) {
%>
		 		RRO_EXAM_LT='<%= RRO_EXAM_LT_T%>'
<%
			}

			if(! RRO_EXAM_NM_T.equals("")) {
%>
		 		RRO_EXAM_NM='<%= RRO_EXAM_NM_T%>'
<%
			}

			if(! RRO_COMP_CD_T.equals("")) {
%>
		 		RRO_COMP_CD='<%= RRO_COMP_CD_T%>'
<%
			}

			if(! RRO_COMP_NM_T.equals("")) {
%>
		 		RRO_COMP_NM='<%= RRO_COMP_NM_T%>'
<%
			}

			if(! RRO_SEND_YN_T.equals("")) {
%>
		 		RRO_SEND_YN='<%= RRO_SEND_YN_T%>'
<%
			}

			if(! RRO_SEND_DT_T.equals("")) {
%>
		 		RRO_SEND_DT='<%= RRO_SEND_DT_T%>'
<%
			}

			if(! RRO_SALES_ID_T.equals("")) {
%>
		 		RRO_SALES_ID='<%= RRO_SALES_ID_T%>'
<%
			}

			if(! RRO_SALES_NM_T.equals("")) {
%>
		 		RRO_SALES_NM='<%= RRO_SALES_NM_T%>'
<%
			}

			if(! RRO_RSVN_TX_T.equals("")) {
%>
		 		RRO_RSVN_TX='<%= RRO_RSVN_TX_T%>'
<%
			}

			if(! RRO_CNCL_TX_T.equals("")) {
%>
		 		RRO_CNCL_TX='<%= RRO_CNCL_TX_T%>'
<%
			}

			if(! RRO_ETC_TX_T.equals("")) {
%>
		 		RRO_ETC_TX='<%= RRO_ETC_TX_T%>'
<%
			}

			if(! RRO_WAIT_DT_T.equals("")) {
%>
		 		RRO_WAIT_DT='<%= RRO_WAIT_DT_T%>'
<%
			}

			if(! RRO_DRUG_DT_T.equals("")) {
%>
		 		RRO_DRUG_DT='<%= RRO_DRUG_DT_T%>'
<%
			}

			if(! RRO_DRUG_RDT_T.equals("")) {
%>
		 		RRO_DRUG_RDT='<%= RRO_DRUG_RDT_T%>'
<%
			}

			if(! RRO_COLON_DT_T.equals("")) {
%>
		 		RRO_COLON_DT='<%= RRO_COLON_DT_T%>'
<%
			}

			if(! RRO_FLEET_TX_T.equals("")) {
%>
		 		RRO_FLEET_TX='<%= RRO_FLEET_TX_T%>'
<%
			}

			if(! RRO_PSNL_ID_T.equals("")) {
%>
		 		RRO_PSNL_ID='<%= RRO_PSNL_ID_T%>'
<%
			}

			if(! RRO_ZIP_CD_T.equals("")) {
%>
		 		RRO_ZIP_CD='<%= RRO_ZIP_CD_T%>'
<%
			}

			if(! RRO_RSVN_NO_T.equals("")) {
%>
		 		RRO_RSVN_NO='<%= RRO_RSVN_NO_T%>'
<%
			}

			if(! RRO_ROW_ID_T.equals("")) {
%>
		 		RRO_ROW_ID='<%= RRO_ROW_ID_T%>'
<%
			}

			if(! ICY_COMP_CD_T.equals("")) {
%>
		 		ICY_COMP_CD='<%= ICY_COMP_CD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c44_T.equals("")) {
%>
		 		c44='<%= c44_T%>'
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
