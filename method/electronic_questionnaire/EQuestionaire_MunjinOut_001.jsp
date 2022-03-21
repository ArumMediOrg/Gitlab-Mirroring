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

		String SRVNO = htMethod.get("SRVNO");

		//
		if(SRVNO == null) { SRVNO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select a.*, b.ICR_BIRH_DT From RT_RSVT a      
Inner Join IT_CUSTOMER b                      
On b.ICR_CUST_NO = a.RRT_CUST_NO              
 Where RRT_RSVN_NO = :SRVNO
		*/

		sql = " SELECT A.*, B.ICR_BIRH_DT";
		sql += " FROM RT_RSVT A INNER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.RRT_CUST_NO";
		sql += " WHERE RRT_RSVN_NO = '" + SRVNO + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : EQuestionaire_MunjinOut_001 \n";
			G_INFO += "설명 : 예약정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SRVNO : " + SRVNO + " \n";
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
		<s:AttributeType name='RRT_RSVN_NO' rs:number='1' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_RSVN_NO'>
			<s:datatype dt:type='string' dt:maxLength='14' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_RSVN_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_RSVN_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_WEB_ID' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_WEB_ID'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_DT' rs:number='4' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_SQ' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_TM' rs:number='6' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_TM'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ACPT_CD' rs:number='7' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_ACPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ACPT_KD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ACPT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_PLCE_CD' rs:number='9' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_CUST_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_MMBR_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_MMBR_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_CHART_NO' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_PSNL_ID' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_PSNL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_PSNL_NM' rs:number='14' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SEX_CD' rs:number='15' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_PSNL_AGE' rs:number='16' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ZIP_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ZIP_SQ' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ZIP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ZIP_AR' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ROAD_AR' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_BLDG_NO' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_BLDG_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_TEL_NO' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_MOBL_NO' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EMAIL_AR' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SEND_CD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SEND_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SMS_YN' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SMS_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_COMP_CD' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_DEPT_CD' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_DEPT_NM' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_DIVI_CD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_DIVI_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ENTRY_DT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ENTRY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_DIVI_NO' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_FAMY_CD' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_FAMY_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_FAMY_NM' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_FAMY_NM'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_DRUG_YN' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_DRUG_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SALES_ID' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SALES_ID'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_CD' rs:number='37' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_HTSB_CD' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_HTSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_HTSB_YN' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_HTSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_HTPR_CD' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_HTPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_LT' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EXAM_LT'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EQUIP_TM' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EQUIP_TM'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EQUIP_LT' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EQUIP_LT'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_INSU_NO' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_INSU_NO'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_INSU_CD' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_INSU_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ENTY_CD' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ENTY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ASSO_CD' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ASSO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_CNTR_CD' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CNTR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_HEPA_YN' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_HEPA_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ORAL_YN' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ORAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_STOMA_CD' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_STOMA_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_COLON_CD' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_COLON_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_LIVER_CD' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_LIVER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_BAST_CD' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_BAST_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_UTER_CD' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_UTER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_STOMA_DR' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_STOMA_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_COLON_DR' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_COLON_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_LIVER_DR' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_LIVER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_BAST_DR' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_BAST_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_UTER_DR' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_UTER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_HDMD_YN' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_HDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SPRT_PR' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SPRT_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_COMP_PR' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_COMP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_PSNL_PR' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_PSNL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_HLTH_PR' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_HLTH_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_PYER_CD' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_PYER_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_CMPY_CD' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CMPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_PRPY_CD' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_PRPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_RECE_NO' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_RECE_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_RECE_KD' rs:number='70' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_RECE_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_NHIC_TX' rs:number='71' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_NHIC_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_RSVN_TX' rs:number='72' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_RSVN_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_INPT_ID' rs:number='73' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_INPT_DTT' rs:number='74' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_HCV_YN' rs:number='75' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_HCV_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_BLOOD_YN' rs:number='76' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_BLOOD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ASPL_YN' rs:number='77' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ASPL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_STOOL_YN' rs:number='78' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_STOOL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SPSB_CD' rs:number='79' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SPSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_CVSB_CD' rs:number='80' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CVSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EMSB_CD' rs:number='81' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EMSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ETSB_CD' rs:number='82' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ETSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SPSB_YN' rs:number='83' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SPSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_CVSB_YN' rs:number='84' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CVSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EMSB_YN' rs:number='85' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EMSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ETSB_YN' rs:number='86' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ETSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SPCL_CD' rs:number='87' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SPHT_CD' rs:number='88' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SPHT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SDMD_YN' rs:number='89' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SPCL_PR' rs:number='90' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SPCL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_CNCL_YN' rs:number='91' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CNCL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SMPL_YN' rs:number='92' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SMPL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_STOMA_YN' rs:number='93' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_STOMA_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_COLON_YN' rs:number='94' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_COLON_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_HLTH_KD' rs:number='95' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SAFE_YN' rs:number='96' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SAFE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_LUNG_CD' rs:number='97' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_LUNG_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_LUNG_DR' rs:number='98' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_LUNG_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_UBEH_YN' rs:number='99' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_UBEH_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_QUEST_KD' rs:number='100' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_QUEST_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_DRUG_DT' rs:number='101' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_DRUG_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_LOTT_AR' rs:number='102' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_LOTT_AR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_OCS_NO' rs:number='103' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_OCS_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_OCS_DR' rs:number='104' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_OCS_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_OCS_DV' rs:number='105' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_OCS_DV'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='106' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='107' rs:rowid='true' rs:basetable='RT_RSVT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c107' rs:name='ROWID' rs:number='108' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
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

			String RRT_RSVN_NO_T = cRsList.getString("RRT_RSVN_NO");
			String RRT_RSVN_CD_T = cRsList.getString("RRT_RSVN_CD");
			String RRT_WEB_ID_T = cRsList.getString("RRT_WEB_ID");
			String RRT_EXAM_DT_T = cRsList.getString("RRT_EXAM_DT");
			String RRT_EXAM_SQ_T = cRsList.getString("RRT_EXAM_SQ");
			String RRT_EXAM_TM_T = cRsList.getString("RRT_EXAM_TM");
			String RRT_ACPT_CD_T = cRsList.getString("RRT_ACPT_CD");
			String RRT_ACPT_KD_T = cRsList.getString("RRT_ACPT_KD");
			String RRT_PLCE_CD_T = cRsList.getString("RRT_PLCE_CD");
			String RRT_CUST_NO_T = cRsList.getString("RRT_CUST_NO");
			String RRT_MMBR_CD_T = cRsList.getString("RRT_MMBR_CD");
			String RRT_CHART_NO_T = cRsList.getString("RRT_CHART_NO");
			String RRT_PSNL_ID_T = cRsList.getString("RRT_PSNL_ID");
			String RRT_PSNL_NM_T = cRsList.getString("RRT_PSNL_NM");
			String RRT_SEX_CD_T = cRsList.getString("RRT_SEX_CD");
			String RRT_PSNL_AGE_T = cRsList.getString("RRT_PSNL_AGE");
			String RRT_ZIP_CD_T = cRsList.getString("RRT_ZIP_CD");
			String RRT_ZIP_SQ_T = cRsList.getString("RRT_ZIP_SQ");
			String RRT_ZIP_AR_T = cRsList.getString("RRT_ZIP_AR");
			String RRT_ROAD_AR_T = cRsList.getString("RRT_ROAD_AR");
			String RRT_BLDG_NO_T = cRsList.getString("RRT_BLDG_NO");
			String RRT_TEL_NO_T = cRsList.getString("RRT_TEL_NO");
			String RRT_MOBL_NO_T = cRsList.getString("RRT_MOBL_NO");
			String RRT_EMAIL_AR_T = cRsList.getString("RRT_EMAIL_AR");
			String RRT_SEND_CD_T = cRsList.getString("RRT_SEND_CD");
			String RRT_SMS_YN_T = cRsList.getString("RRT_SMS_YN");
			String RRT_COMP_CD_T = cRsList.getString("RRT_COMP_CD");
			String RRT_DEPT_CD_T = cRsList.getString("RRT_DEPT_CD");
			String RRT_DEPT_NM_T = cRsList.getString("RRT_DEPT_NM");
			String RRT_DIVI_CD_T = cRsList.getString("RRT_DIVI_CD");
			String RRT_ENTRY_DT_T = cRsList.getString("RRT_ENTRY_DT");
			String RRT_DIVI_NO_T = cRsList.getString("RRT_DIVI_NO");
			String RRT_FAMY_CD_T = cRsList.getString("RRT_FAMY_CD");
			String RRT_FAMY_NM_T = cRsList.getString("RRT_FAMY_NM");
			String RRT_DRUG_YN_T = cRsList.getString("RRT_DRUG_YN");
			String RRT_SALES_ID_T = cRsList.getString("RRT_SALES_ID");
			String RRT_EXAM_CD_T = cRsList.getString("RRT_EXAM_CD");
			String RRT_HTSB_CD_T = cRsList.getString("RRT_HTSB_CD");
			String RRT_HTSB_YN_T = cRsList.getString("RRT_HTSB_YN");
			String RRT_HTPR_CD_T = cRsList.getString("RRT_HTPR_CD");
			String RRT_EXAM_LT_T = cRsList.getString("RRT_EXAM_LT");
			String RRT_EQUIP_TM_T = cRsList.getString("RRT_EQUIP_TM");
			String RRT_EQUIP_LT_T = cRsList.getString("RRT_EQUIP_LT");
			String RRT_INSU_NO_T = cRsList.getString("RRT_INSU_NO");
			String RRT_INSU_CD_T = cRsList.getString("RRT_INSU_CD");
			String RRT_ENTY_CD_T = cRsList.getString("RRT_ENTY_CD");
			String RRT_ASSO_CD_T = cRsList.getString("RRT_ASSO_CD");
			String RRT_CNTR_CD_T = cRsList.getString("RRT_CNTR_CD");
			String RRT_HEPA_YN_T = cRsList.getString("RRT_HEPA_YN");
			String RRT_ORAL_YN_T = cRsList.getString("RRT_ORAL_YN");
			String RRT_STOMA_CD_T = cRsList.getString("RRT_STOMA_CD");
			String RRT_COLON_CD_T = cRsList.getString("RRT_COLON_CD");
			String RRT_LIVER_CD_T = cRsList.getString("RRT_LIVER_CD");
			String RRT_BAST_CD_T = cRsList.getString("RRT_BAST_CD");
			String RRT_UTER_CD_T = cRsList.getString("RRT_UTER_CD");
			String RRT_STOMA_DR_T = cRsList.getString("RRT_STOMA_DR");
			String RRT_COLON_DR_T = cRsList.getString("RRT_COLON_DR");
			String RRT_LIVER_DR_T = cRsList.getString("RRT_LIVER_DR");
			String RRT_BAST_DR_T = cRsList.getString("RRT_BAST_DR");
			String RRT_UTER_DR_T = cRsList.getString("RRT_UTER_DR");
			String RRT_HDMD_YN_T = cRsList.getString("RRT_HDMD_YN");
			String RRT_SPRT_PR_T = cRsList.getString("RRT_SPRT_PR");
			String RRT_COMP_PR_T = cRsList.getString("RRT_COMP_PR");
			String RRT_PSNL_PR_T = cRsList.getString("RRT_PSNL_PR");
			String RRT_HLTH_PR_T = cRsList.getString("RRT_HLTH_PR");
			String RRT_PYER_CD_T = cRsList.getString("RRT_PYER_CD");
			String RRT_CMPY_CD_T = cRsList.getString("RRT_CMPY_CD");
			String RRT_PRPY_CD_T = cRsList.getString("RRT_PRPY_CD");
			String RRT_RECE_NO_T = cRsList.getString("RRT_RECE_NO");
			String RRT_RECE_KD_T = cRsList.getString("RRT_RECE_KD");
			String RRT_NHIC_TX_T = cRsList.getString("RRT_NHIC_TX");
			String RRT_RSVN_TX_T = cRsList.getString("RRT_RSVN_TX");
			String RRT_INPT_ID_T = cRsList.getString("RRT_INPT_ID");
			String RRT_INPT_DTT_T = cRsList.getDate2("RRT_INPT_DTT");
			String RRT_HCV_YN_T = cRsList.getString("RRT_HCV_YN");
			String RRT_BLOOD_YN_T = cRsList.getString("RRT_BLOOD_YN");
			String RRT_ASPL_YN_T = cRsList.getString("RRT_ASPL_YN");
			String RRT_STOOL_YN_T = cRsList.getString("RRT_STOOL_YN");
			String RRT_SPSB_CD_T = cRsList.getString("RRT_SPSB_CD");
			String RRT_CVSB_CD_T = cRsList.getString("RRT_CVSB_CD");
			String RRT_EMSB_CD_T = cRsList.getString("RRT_EMSB_CD");
			String RRT_ETSB_CD_T = cRsList.getString("RRT_ETSB_CD");
			String RRT_SPSB_YN_T = cRsList.getString("RRT_SPSB_YN");
			String RRT_CVSB_YN_T = cRsList.getString("RRT_CVSB_YN");
			String RRT_EMSB_YN_T = cRsList.getString("RRT_EMSB_YN");
			String RRT_ETSB_YN_T = cRsList.getString("RRT_ETSB_YN");
			String RRT_SPCL_CD_T = cRsList.getString("RRT_SPCL_CD");
			String RRT_SPHT_CD_T = cRsList.getString("RRT_SPHT_CD");
			String RRT_SDMD_YN_T = cRsList.getString("RRT_SDMD_YN");
			String RRT_SPCL_PR_T = cRsList.getString("RRT_SPCL_PR");
			String RRT_CNCL_YN_T = cRsList.getString("RRT_CNCL_YN");
			String RRT_SMPL_YN_T = cRsList.getString("RRT_SMPL_YN");
			String RRT_STOMA_YN_T = cRsList.getString("RRT_STOMA_YN");
			String RRT_COLON_YN_T = cRsList.getString("RRT_COLON_YN");
			String RRT_HLTH_KD_T = cRsList.getString("RRT_HLTH_KD");
			String RRT_SAFE_YN_T = cRsList.getString("RRT_SAFE_YN");
			String RRT_LUNG_CD_T = cRsList.getString("RRT_LUNG_CD");
			String RRT_LUNG_DR_T = cRsList.getString("RRT_LUNG_DR");
			String RRT_UBEH_YN_T = cRsList.getString("RRT_UBEH_YN");
			String RRT_QUEST_KD_T = cRsList.getString("RRT_QUEST_KD");
			String RRT_DRUG_DT_T = cRsList.getString("RRT_DRUG_DT");
			String RRT_LOTT_AR_T = cRsList.getString("RRT_LOTT_AR");
			String RRT_OCS_NO_T = cRsList.getString("RRT_OCS_NO");
			String RRT_OCS_DR_T = cRsList.getString("RRT_OCS_DR");
			String RRT_OCS_DV_T = cRsList.getString("RRT_OCS_DV");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String ROWID_T = cRsList.getString("ROWID");
			String c107_T = cRsList.getString("c107");
%>
			<z:row
<%
			if(! RRT_RSVN_NO_T.equals("")) {
%>
		 		RRT_RSVN_NO='<%= RRT_RSVN_NO_T%>'
<%
			}

			if(! RRT_RSVN_CD_T.equals("")) {
%>
		 		RRT_RSVN_CD='<%= RRT_RSVN_CD_T%>'
<%
			}

			if(! RRT_WEB_ID_T.equals("")) {
%>
		 		RRT_WEB_ID='<%= RRT_WEB_ID_T%>'
<%
			}

			if(! RRT_EXAM_DT_T.equals("")) {
%>
		 		RRT_EXAM_DT='<%= RRT_EXAM_DT_T%>'
<%
			}

			if(! RRT_EXAM_SQ_T.equals("")) {
%>
		 		RRT_EXAM_SQ='<%= RRT_EXAM_SQ_T%>'
<%
			}

			if(! RRT_EXAM_TM_T.equals("")) {
%>
		 		RRT_EXAM_TM='<%= RRT_EXAM_TM_T%>'
<%
			}

			if(! RRT_ACPT_CD_T.equals("")) {
%>
		 		RRT_ACPT_CD='<%= RRT_ACPT_CD_T%>'
<%
			}

			if(! RRT_ACPT_KD_T.equals("")) {
%>
		 		RRT_ACPT_KD='<%= RRT_ACPT_KD_T%>'
<%
			}

			if(! RRT_PLCE_CD_T.equals("")) {
%>
		 		RRT_PLCE_CD='<%= RRT_PLCE_CD_T%>'
<%
			}

			if(! RRT_CUST_NO_T.equals("")) {
%>
		 		RRT_CUST_NO='<%= RRT_CUST_NO_T%>'
<%
			}

			if(! RRT_MMBR_CD_T.equals("")) {
%>
		 		RRT_MMBR_CD='<%= RRT_MMBR_CD_T%>'
<%
			}

			if(! RRT_CHART_NO_T.equals("")) {
%>
		 		RRT_CHART_NO='<%= RRT_CHART_NO_T%>'
<%
			}

			if(! RRT_PSNL_ID_T.equals("")) {
%>
		 		RRT_PSNL_ID='<%= RRT_PSNL_ID_T%>'
<%
			}

			if(! RRT_PSNL_NM_T.equals("")) {
%>
		 		RRT_PSNL_NM='<%= RRT_PSNL_NM_T%>'
<%
			}

			if(! RRT_SEX_CD_T.equals("")) {
%>
		 		RRT_SEX_CD='<%= RRT_SEX_CD_T%>'
<%
			}

			if(! RRT_PSNL_AGE_T.equals("")) {
%>
		 		RRT_PSNL_AGE='<%= RRT_PSNL_AGE_T%>'
<%
			}

			if(! RRT_ZIP_CD_T.equals("")) {
%>
		 		RRT_ZIP_CD='<%= RRT_ZIP_CD_T%>'
<%
			}

			if(! RRT_ZIP_SQ_T.equals("")) {
%>
		 		RRT_ZIP_SQ='<%= RRT_ZIP_SQ_T%>'
<%
			}

			if(! RRT_ZIP_AR_T.equals("")) {
%>
		 		RRT_ZIP_AR='<%= RRT_ZIP_AR_T%>'
<%
			}

			if(! RRT_ROAD_AR_T.equals("")) {
%>
		 		RRT_ROAD_AR='<%= RRT_ROAD_AR_T%>'
<%
			}

			if(! RRT_BLDG_NO_T.equals("")) {
%>
		 		RRT_BLDG_NO='<%= RRT_BLDG_NO_T%>'
<%
			}

			if(! RRT_TEL_NO_T.equals("")) {
%>
		 		RRT_TEL_NO='<%= RRT_TEL_NO_T%>'
<%
			}

			if(! RRT_MOBL_NO_T.equals("")) {
%>
		 		RRT_MOBL_NO='<%= RRT_MOBL_NO_T%>'
<%
			}

			if(! RRT_EMAIL_AR_T.equals("")) {
%>
		 		RRT_EMAIL_AR='<%= RRT_EMAIL_AR_T%>'
<%
			}

			if(! RRT_SEND_CD_T.equals("")) {
%>
		 		RRT_SEND_CD='<%= RRT_SEND_CD_T%>'
<%
			}

			if(! RRT_SMS_YN_T.equals("")) {
%>
		 		RRT_SMS_YN='<%= RRT_SMS_YN_T%>'
<%
			}

			if(! RRT_COMP_CD_T.equals("")) {
%>
		 		RRT_COMP_CD='<%= RRT_COMP_CD_T%>'
<%
			}

			if(! RRT_DEPT_CD_T.equals("")) {
%>
		 		RRT_DEPT_CD='<%= RRT_DEPT_CD_T%>'
<%
			}

			if(! RRT_DEPT_NM_T.equals("")) {
%>
		 		RRT_DEPT_NM='<%= RRT_DEPT_NM_T%>'
<%
			}

			if(! RRT_DIVI_CD_T.equals("")) {
%>
		 		RRT_DIVI_CD='<%= RRT_DIVI_CD_T%>'
<%
			}

			if(! RRT_ENTRY_DT_T.equals("")) {
%>
		 		RRT_ENTRY_DT='<%= RRT_ENTRY_DT_T%>'
<%
			}

			if(! RRT_DIVI_NO_T.equals("")) {
%>
		 		RRT_DIVI_NO='<%= RRT_DIVI_NO_T%>'
<%
			}

			if(! RRT_FAMY_CD_T.equals("")) {
%>
		 		RRT_FAMY_CD='<%= RRT_FAMY_CD_T%>'
<%
			}

			if(! RRT_FAMY_NM_T.equals("")) {
%>
		 		RRT_FAMY_NM='<%= RRT_FAMY_NM_T%>'
<%
			}

			if(! RRT_DRUG_YN_T.equals("")) {
%>
		 		RRT_DRUG_YN='<%= RRT_DRUG_YN_T%>'
<%
			}

			if(! RRT_SALES_ID_T.equals("")) {
%>
		 		RRT_SALES_ID='<%= RRT_SALES_ID_T%>'
<%
			}

			if(! RRT_EXAM_CD_T.equals("")) {
%>
		 		RRT_EXAM_CD='<%= RRT_EXAM_CD_T%>'
<%
			}

			if(! RRT_HTSB_CD_T.equals("")) {
%>
		 		RRT_HTSB_CD='<%= RRT_HTSB_CD_T%>'
<%
			}

			if(! RRT_HTSB_YN_T.equals("")) {
%>
		 		RRT_HTSB_YN='<%= RRT_HTSB_YN_T%>'
<%
			}

			if(! RRT_HTPR_CD_T.equals("")) {
%>
		 		RRT_HTPR_CD='<%= RRT_HTPR_CD_T%>'
<%
			}

			if(! RRT_EXAM_LT_T.equals("")) {
%>
		 		RRT_EXAM_LT='<%= RRT_EXAM_LT_T%>'
<%
			}

			if(! RRT_EQUIP_TM_T.equals("")) {
%>
		 		RRT_EQUIP_TM='<%= RRT_EQUIP_TM_T%>'
<%
			}

			if(! RRT_EQUIP_LT_T.equals("")) {
%>
		 		RRT_EQUIP_LT='<%= RRT_EQUIP_LT_T%>'
<%
			}

			if(! RRT_INSU_NO_T.equals("")) {
%>
		 		RRT_INSU_NO='<%= RRT_INSU_NO_T%>'
<%
			}

			if(! RRT_INSU_CD_T.equals("")) {
%>
		 		RRT_INSU_CD='<%= RRT_INSU_CD_T%>'
<%
			}

			if(! RRT_ENTY_CD_T.equals("")) {
%>
		 		RRT_ENTY_CD='<%= RRT_ENTY_CD_T%>'
<%
			}

			if(! RRT_ASSO_CD_T.equals("")) {
%>
		 		RRT_ASSO_CD='<%= RRT_ASSO_CD_T%>'
<%
			}

			if(! RRT_CNTR_CD_T.equals("")) {
%>
		 		RRT_CNTR_CD='<%= RRT_CNTR_CD_T%>'
<%
			}

			if(! RRT_HEPA_YN_T.equals("")) {
%>
		 		RRT_HEPA_YN='<%= RRT_HEPA_YN_T%>'
<%
			}

			if(! RRT_ORAL_YN_T.equals("")) {
%>
		 		RRT_ORAL_YN='<%= RRT_ORAL_YN_T%>'
<%
			}

			if(! RRT_STOMA_CD_T.equals("")) {
%>
		 		RRT_STOMA_CD='<%= RRT_STOMA_CD_T%>'
<%
			}

			if(! RRT_COLON_CD_T.equals("")) {
%>
		 		RRT_COLON_CD='<%= RRT_COLON_CD_T%>'
<%
			}

			if(! RRT_LIVER_CD_T.equals("")) {
%>
		 		RRT_LIVER_CD='<%= RRT_LIVER_CD_T%>'
<%
			}

			if(! RRT_BAST_CD_T.equals("")) {
%>
		 		RRT_BAST_CD='<%= RRT_BAST_CD_T%>'
<%
			}

			if(! RRT_UTER_CD_T.equals("")) {
%>
		 		RRT_UTER_CD='<%= RRT_UTER_CD_T%>'
<%
			}

			if(! RRT_STOMA_DR_T.equals("")) {
%>
		 		RRT_STOMA_DR='<%= RRT_STOMA_DR_T%>'
<%
			}

			if(! RRT_COLON_DR_T.equals("")) {
%>
		 		RRT_COLON_DR='<%= RRT_COLON_DR_T%>'
<%
			}

			if(! RRT_LIVER_DR_T.equals("")) {
%>
		 		RRT_LIVER_DR='<%= RRT_LIVER_DR_T%>'
<%
			}

			if(! RRT_BAST_DR_T.equals("")) {
%>
		 		RRT_BAST_DR='<%= RRT_BAST_DR_T%>'
<%
			}

			if(! RRT_UTER_DR_T.equals("")) {
%>
		 		RRT_UTER_DR='<%= RRT_UTER_DR_T%>'
<%
			}

			if(! RRT_HDMD_YN_T.equals("")) {
%>
		 		RRT_HDMD_YN='<%= RRT_HDMD_YN_T%>'
<%
			}

			if(! RRT_SPRT_PR_T.equals("")) {
%>
		 		RRT_SPRT_PR='<%= RRT_SPRT_PR_T%>'
<%
			}

			if(! RRT_COMP_PR_T.equals("")) {
%>
		 		RRT_COMP_PR='<%= RRT_COMP_PR_T%>'
<%
			}

			if(! RRT_PSNL_PR_T.equals("")) {
%>
		 		RRT_PSNL_PR='<%= RRT_PSNL_PR_T%>'
<%
			}

			if(! RRT_HLTH_PR_T.equals("")) {
%>
		 		RRT_HLTH_PR='<%= RRT_HLTH_PR_T%>'
<%
			}

			if(! RRT_PYER_CD_T.equals("")) {
%>
		 		RRT_PYER_CD='<%= RRT_PYER_CD_T%>'
<%
			}

			if(! RRT_CMPY_CD_T.equals("")) {
%>
		 		RRT_CMPY_CD='<%= RRT_CMPY_CD_T%>'
<%
			}

			if(! RRT_PRPY_CD_T.equals("")) {
%>
		 		RRT_PRPY_CD='<%= RRT_PRPY_CD_T%>'
<%
			}

			if(! RRT_RECE_NO_T.equals("")) {
%>
		 		RRT_RECE_NO='<%= RRT_RECE_NO_T%>'
<%
			}

			if(! RRT_RECE_KD_T.equals("")) {
%>
		 		RRT_RECE_KD='<%= RRT_RECE_KD_T%>'
<%
			}

			if(! RRT_NHIC_TX_T.equals("")) {
%>
		 		RRT_NHIC_TX='<%= RRT_NHIC_TX_T%>'
<%
			}

			if(! RRT_RSVN_TX_T.equals("")) {
%>
		 		RRT_RSVN_TX='<%= RRT_RSVN_TX_T%>'
<%
			}

			if(! RRT_INPT_ID_T.equals("")) {
%>
		 		RRT_INPT_ID='<%= RRT_INPT_ID_T%>'
<%
			}

			if(! RRT_INPT_DTT_T.equals("")) {
%>
		 		RRT_INPT_DTT='<%= RRT_INPT_DTT_T%>'
<%
			}

			if(! RRT_HCV_YN_T.equals("")) {
%>
		 		RRT_HCV_YN='<%= RRT_HCV_YN_T%>'
<%
			}

			if(! RRT_BLOOD_YN_T.equals("")) {
%>
		 		RRT_BLOOD_YN='<%= RRT_BLOOD_YN_T%>'
<%
			}

			if(! RRT_ASPL_YN_T.equals("")) {
%>
		 		RRT_ASPL_YN='<%= RRT_ASPL_YN_T%>'
<%
			}

			if(! RRT_STOOL_YN_T.equals("")) {
%>
		 		RRT_STOOL_YN='<%= RRT_STOOL_YN_T%>'
<%
			}

			if(! RRT_SPSB_CD_T.equals("")) {
%>
		 		RRT_SPSB_CD='<%= RRT_SPSB_CD_T%>'
<%
			}

			if(! RRT_CVSB_CD_T.equals("")) {
%>
		 		RRT_CVSB_CD='<%= RRT_CVSB_CD_T%>'
<%
			}

			if(! RRT_EMSB_CD_T.equals("")) {
%>
		 		RRT_EMSB_CD='<%= RRT_EMSB_CD_T%>'
<%
			}

			if(! RRT_ETSB_CD_T.equals("")) {
%>
		 		RRT_ETSB_CD='<%= RRT_ETSB_CD_T%>'
<%
			}

			if(! RRT_SPSB_YN_T.equals("")) {
%>
		 		RRT_SPSB_YN='<%= RRT_SPSB_YN_T%>'
<%
			}

			if(! RRT_CVSB_YN_T.equals("")) {
%>
		 		RRT_CVSB_YN='<%= RRT_CVSB_YN_T%>'
<%
			}

			if(! RRT_EMSB_YN_T.equals("")) {
%>
		 		RRT_EMSB_YN='<%= RRT_EMSB_YN_T%>'
<%
			}

			if(! RRT_ETSB_YN_T.equals("")) {
%>
		 		RRT_ETSB_YN='<%= RRT_ETSB_YN_T%>'
<%
			}

			if(! RRT_SPCL_CD_T.equals("")) {
%>
		 		RRT_SPCL_CD='<%= RRT_SPCL_CD_T%>'
<%
			}

			if(! RRT_SPHT_CD_T.equals("")) {
%>
		 		RRT_SPHT_CD='<%= RRT_SPHT_CD_T%>'
<%
			}

			if(! RRT_SDMD_YN_T.equals("")) {
%>
		 		RRT_SDMD_YN='<%= RRT_SDMD_YN_T%>'
<%
			}

			if(! RRT_SPCL_PR_T.equals("")) {
%>
		 		RRT_SPCL_PR='<%= RRT_SPCL_PR_T%>'
<%
			}

			if(! RRT_CNCL_YN_T.equals("")) {
%>
		 		RRT_CNCL_YN='<%= RRT_CNCL_YN_T%>'
<%
			}

			if(! RRT_SMPL_YN_T.equals("")) {
%>
		 		RRT_SMPL_YN='<%= RRT_SMPL_YN_T%>'
<%
			}

			if(! RRT_STOMA_YN_T.equals("")) {
%>
		 		RRT_STOMA_YN='<%= RRT_STOMA_YN_T%>'
<%
			}

			if(! RRT_COLON_YN_T.equals("")) {
%>
		 		RRT_COLON_YN='<%= RRT_COLON_YN_T%>'
<%
			}

			if(! RRT_HLTH_KD_T.equals("")) {
%>
		 		RRT_HLTH_KD='<%= RRT_HLTH_KD_T%>'
<%
			}

			if(! RRT_SAFE_YN_T.equals("")) {
%>
		 		RRT_SAFE_YN='<%= RRT_SAFE_YN_T%>'
<%
			}

			if(! RRT_LUNG_CD_T.equals("")) {
%>
		 		RRT_LUNG_CD='<%= RRT_LUNG_CD_T%>'
<%
			}

			if(! RRT_LUNG_DR_T.equals("")) {
%>
		 		RRT_LUNG_DR='<%= RRT_LUNG_DR_T%>'
<%
			}

			if(! RRT_UBEH_YN_T.equals("")) {
%>
		 		RRT_UBEH_YN='<%= RRT_UBEH_YN_T%>'
<%
			}

			if(! RRT_QUEST_KD_T.equals("")) {
%>
		 		RRT_QUEST_KD='<%= RRT_QUEST_KD_T%>'
<%
			}

			if(! RRT_DRUG_DT_T.equals("")) {
%>
		 		RRT_DRUG_DT='<%= RRT_DRUG_DT_T%>'
<%
			}

			if(! RRT_LOTT_AR_T.equals("")) {
%>
		 		RRT_LOTT_AR='<%= RRT_LOTT_AR_T%>'
<%
			}

			if(! RRT_OCS_NO_T.equals("")) {
%>
		 		RRT_OCS_NO='<%= RRT_OCS_NO_T%>'
<%
			}

			if(! RRT_OCS_DR_T.equals("")) {
%>
		 		RRT_OCS_DR='<%= RRT_OCS_DR_T%>'
<%
			}

			if(! RRT_OCS_DV_T.equals("")) {
%>
		 		RRT_OCS_DV='<%= RRT_OCS_DV_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c107_T.equals("")) {
%>
		 		c107='<%= c107_T%>'
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
