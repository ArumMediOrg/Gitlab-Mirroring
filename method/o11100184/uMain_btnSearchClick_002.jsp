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

		String SFROMDATE = htMethod.get("SFROMDATE");
		String STODATE = htMethod.get("STODATE");
		String CMBSRCHTEST = htMethod.get("CMBSRCHTEST");
		String RZCOMBOBOX1 = htMethod.get("RZCOMBOBOX1");
		String PLCE_CD = htMethod.get("PLCE_CD");
		String COMP_CD = htMethod.get("COMP_CD");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String CHART_NO = htMethod.get("CHART_NO");
		String RSVN_NO = htMethod.get("RSVN_NO");
		String SEX_CD = htMethod.get("SEX_CD");

		//
		if(SFROMDATE == null) { SFROMDATE = ""; }
		if(STODATE == null) { STODATE = ""; }
		if(CMBSRCHTEST == null) { CMBSRCHTEST = ""; }
		if(RZCOMBOBOX1 == null) { RZCOMBOBOX1 = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(CHART_NO == null) { CHART_NO = ""; }
		if(RSVN_NO == null) { RSVN_NO = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT RT_RSVT.*, IT_CUSTOMER.*";
		sql += " FROM RT_RSVT JOIN IT_CUSTOMER";
		sql += " ON ICR_CUST_NO = RRT_CUST_NO";
		sql += " AND NVL(ICR_PENL_ID, ' ') <> ' '";
		sql += " WHERE RRT_EXAM_DT BETWEEN '" + SFROMDATE + "' AND '" + STODATE + "'";
		sql += " AND (RRT_EXAM_SQ IS NULL OR RRT_EXAM_SQ = ' ')";

		if(! CMBSRCHTEST.equals("전체")) {

			if(CMBSRCHTEST.equals("10000")) {
				sql += " AND (SUBSTR(RRT_EXAM_CD,1,1) = '1' OR SUBSTR(RRT_HTSB_CD,1,1) = '1')";
			} else if(CMBSRCHTEST.equals("11001")) {
				sql += " AND (RRT_EXAM_CD IN ('11001', '12001', '12003') OR RRT_HTSB_CD IN ('11001', '12001', '12003'))";
			} else if(CMBSRCHTEST.equals("11002")) {
				sql += " AND (RRT_EXAM_CD IN ('11002', '12002', '12004') OR RRT_HTSB_CD IN ('11002', '12002', '12004'))";
			} else if(CMBSRCHTEST.equals("13000")) {
				sql += " AND (RRT_STOMA_CD > 0 OR RRT_COLON_CD > 0 OR RRT_LIVER_CD > 0 OR RRT_BAST_CD > 0 OR RRT_UTER_CD > 0 OR (RRT_LUNG_CD > 0 AND RRT_LUNG_CD IS NOT NULL) )";
			} else if(CMBSRCHTEST.equals("20000")) {
				sql += " AND SUBSTR(RRT_EXAM_CD,1,1) = '2'";
			} else if(CMBSRCHTEST.equals("31000")) {
				sql += " AND SUBSTR(RRT_EXAM_CD,1,2) = '31'";
			} else if(CMBSRCHTEST.equals("32000")) {
				sql += " AND (SUBSTR(RRT_EXAM_CD,1,2) = '32' OR SUBSTR(RRT_EMSB_CD,1,2) = '32')";
			} else if(CMBSRCHTEST.equals("40000")) {
				sql += " AND (SUBSTR(RRT_EXAM_CD,1,1) = '4' OR SUBSTR(RRT_SPSB_CD,1,1) = '4')";
			} else if(CMBSRCHTEST.equals("50000")) {
				sql += " AND SUBSTR(RRT_EXAM_CD,1,1) = '5'";
			} else if(CMBSRCHTEST.equals("60000")) {
				sql += " AND SUBSTR(RRT_EXAM_CD,1,1) = '6'";
			} else if(CMBSRCHTEST.equals("70000")) {
				sql += " AND SUBSTR(RRT_EXAM_CD,1,1) = '7'";
			} else if(CMBSRCHTEST.equals("80000")) {
				sql += " AND SUBSTR(RRT_EXAM_CD,1,1) = '8'";
			} else if(CMBSRCHTEST.equals("90000")) {
				sql += " AND SUBSTR(RRT_EXAM_CD,1,1) = '9'";
			}
		}

		if(! RZCOMBOBOX1.equals("전체")) {
			sql += " AND RRT_PLCE_CD = '" + PLCE_CD + "'";
		}

		if(! COMP_CD.equals("")) {
			sql += " AND RRT_COMP_CD = '" + COMP_CD + "'";
		}
		if(! PSNL_NM.equals("")) {
			sql += " AND RRT_PSNL_NM LIKE '%" + PSNL_NM + "%'";
		}
		if(! CHART_NO.equals("")) {
			sql += " AND RRT_CHART_NO LIKE '%" + CHART_NO + "%'";
		}
		if(! RSVN_NO.equals("")) {
			sql += " AND RRT_RSVN_NO = '" + RSVN_NO + "' ";
		}
		if(! SEX_CD.equals("0") && ! SEX_CD.equals("")){
			sql += " AND RRT_SEX_CD = '" + SEX_CD + "' ";
		}



			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMain_btnSearchClick_002 \n";
			G_INFO += "설명 : 예약인원 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SFROMDATE : " + SFROMDATE + " \n";
			G_INFO += " STODATE : " + STODATE + " \n";
			G_INFO += " CMBSRCHTEST : " + CMBSRCHTEST + " \n";
			G_INFO += " RZCOMBOBOX1 : " + RZCOMBOBOX1 + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " CHART_NO : " + CHART_NO + " \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
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
		<s:AttributeType name='ICR_CUST_NO' rs:number='103' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='104' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_SQ' rs:number='105' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_NM' rs:number='106' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MANA_KD' rs:number='107' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MANA_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CUST_KD' rs:number='108' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CUST_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NTNA_CD' rs:number='109' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_NTNA_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CHART_NO' rs:number='110' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_KD' rs:number='111' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_SEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_COMP_CD' rs:number='112' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ENTR_DT' rs:number='113' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ENTR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_KD' rs:number='114' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='115' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MARY_KD' rs:number='116' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MARY_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MARY_DT' rs:number='117' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MARY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_TEL_NO' rs:number='118' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO' rs:number='119' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_EMAI_AR' rs:number='120' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_EMAI_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ADDR_KD' rs:number='121' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ADDR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_CD' rs:number='122' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_SQ' rs:number='123' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ZIP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_AR' rs:number='124' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_LOTT_AR' rs:number='125' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_LOTT_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ROAD_AR' rs:number='126' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BLDG_NO' rs:number='127' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BLDG_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PARE_NM' rs:number='128' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PARE_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PARE_NO' rs:number='129' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PARE_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INFO_YN' rs:number='130' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_INFO_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_RECV_YN' rs:number='131' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_RECV_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CUST_TX' rs:number='132' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CUST_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_NM' rs:number='133' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_DIVI_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_CS' rs:number='134' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_DIVI_CS'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_KD' rs:number='135' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_DIVI_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CLSS_KD' rs:number='136' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CLSS_KD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_NO' rs:number='137' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PID_EN' rs:number='138' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PID_EN'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_USE_YN' rs:number='139' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NUSE_ID' rs:number='140' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NUSE_DTT' rs:number='141' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INPT_ID' rs:number='142' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INPT_DTT' rs:number='143' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MODI_ID' rs:number='144' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MODI_DTT' rs:number='145' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NOTE_YN' rs:number='146' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_NOTE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CPENL_NM' rs:number='147' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CPENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INFORE_YN' rs:number='148' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_INFORE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_REGION_CD' rs:number='149' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_REGION_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_IMPAIR_DT' rs:number='150' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_IMPAIR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_IMPAIR_KD' rs:number='151' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_IMPAIR_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_IMPAIR_GD' rs:number='152' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_IMPAIR_GD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='153' rs:rowid='true' rs:basetable='RT_RSVT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c153' rs:name='ROWID' rs:number='154' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
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
			String ICR_CUST_NO_T = cRsList.getString("ICR_CUST_NO");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String ICR_PENL_SQ_T = cRsList.getString("ICR_PENL_SQ");
			String ICR_PENL_NM_T = cRsList.getString("ICR_PENL_NM");
			String ICR_MANA_KD_T = cRsList.getString("ICR_MANA_KD");
			String ICR_CUST_KD_T = cRsList.getString("ICR_CUST_KD");
			String ICR_NTNA_CD_T = cRsList.getString("ICR_NTNA_CD");
			String ICR_CHART_NO_T = cRsList.getString("ICR_CHART_NO");
			String ICR_SEX_KD_T = cRsList.getString("ICR_SEX_KD");
			String ICR_COMP_CD_T = cRsList.getString("ICR_COMP_CD");
			String ICR_ENTR_DT_T = cRsList.getString("ICR_ENTR_DT");
			String ICR_BIRH_KD_T = cRsList.getString("ICR_BIRH_KD");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String ICR_MARY_KD_T = cRsList.getString("ICR_MARY_KD");
			String ICR_MARY_DT_T = cRsList.getString("ICR_MARY_DT");
			String ICR_TEL_NO_T = cRsList.getString("ICR_TEL_NO");
			String ICR_MOBL_NO_T = cRsList.getString("ICR_MOBL_NO");
			String ICR_EMAI_AR_T = cRsList.getString("ICR_EMAI_AR");
			String ICR_ADDR_KD_T = cRsList.getString("ICR_ADDR_KD");
			String ICR_ZIP_CD_T = cRsList.getString("ICR_ZIP_CD");
			String ICR_ZIP_SQ_T = cRsList.getString("ICR_ZIP_SQ");
			String ICR_ZIP_AR_T = cRsList.getString("ICR_ZIP_AR");
			String ICR_LOTT_AR_T = cRsList.getString("ICR_LOTT_AR");
			String ICR_ROAD_AR_T = cRsList.getString("ICR_ROAD_AR");
			String ICR_BLDG_NO_T = cRsList.getString("ICR_BLDG_NO");
			String ICR_PARE_NM_T = cRsList.getString("ICR_PARE_NM");
			String ICR_PARE_NO_T = cRsList.getString("ICR_PARE_NO");
			String ICR_INFO_YN_T = cRsList.getString("ICR_INFO_YN");
			String ICR_RECV_YN_T = cRsList.getString("ICR_RECV_YN");
			String ICR_CUST_TX_T = cRsList.getString("ICR_CUST_TX");
			String ICR_DIVI_NM_T = cRsList.getString("ICR_DIVI_NM");
			String ICR_DIVI_CS_T = cRsList.getString("ICR_DIVI_CS");
			String ICR_DIVI_KD_T = cRsList.getString("ICR_DIVI_KD");
			String ICR_CLSS_KD_T = cRsList.getString("ICR_CLSS_KD");
			String ICR_DIVI_NO_T = cRsList.getString("ICR_DIVI_NO");
			String ICR_PID_EN_T = cRsList.getString("ICR_PID_EN");
			String ICR_USE_YN_T = cRsList.getString("ICR_USE_YN");
			String ICR_NUSE_ID_T = cRsList.getString("ICR_NUSE_ID");
			String ICR_NUSE_DTT_T = cRsList.getDate2("ICR_NUSE_DTT");
			String ICR_INPT_ID_T = cRsList.getString("ICR_INPT_ID");
			String ICR_INPT_DTT_T = cRsList.getDate2("ICR_INPT_DTT");
			String ICR_MODI_ID_T = cRsList.getString("ICR_MODI_ID");
			String ICR_MODI_DTT_T = cRsList.getDate2("ICR_MODI_DTT");
			String ICR_NOTE_YN_T = cRsList.getString("ICR_NOTE_YN");
			String ICR_CPENL_NM_T = cRsList.getString("ICR_CPENL_NM");
			String ICR_INFORE_YN_T = cRsList.getString("ICR_INFORE_YN");
			String ICR_REGION_CD_T = cRsList.getString("ICR_REGION_CD");
			String ICR_IMPAIR_DT_T = cRsList.getString("ICR_IMPAIR_DT");
			String ICR_IMPAIR_KD_T = cRsList.getString("ICR_IMPAIR_KD");
			String ICR_IMPAIR_GD_T = cRsList.getString("ICR_IMPAIR_GD");
			String ROWID_T = cRsList.getString("ROWID");
			String c153_T = cRsList.getString("c153");
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

			if(! ICR_CUST_NO_T.equals("")) {
%>
		 		ICR_CUST_NO='<%= ICR_CUST_NO_T%>'
<%
			}

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! ICR_PENL_SQ_T.equals("")) {
%>
		 		ICR_PENL_SQ='<%= ICR_PENL_SQ_T%>'
<%
			}

			if(! ICR_PENL_NM_T.equals("")) {
%>
		 		ICR_PENL_NM='<%= ICR_PENL_NM_T%>'
<%
			}

			if(! ICR_MANA_KD_T.equals("")) {
%>
		 		ICR_MANA_KD='<%= ICR_MANA_KD_T%>'
<%
			}

			if(! ICR_CUST_KD_T.equals("")) {
%>
		 		ICR_CUST_KD='<%= ICR_CUST_KD_T%>'
<%
			}

			if(! ICR_NTNA_CD_T.equals("")) {
%>
		 		ICR_NTNA_CD='<%= ICR_NTNA_CD_T%>'
<%
			}

			if(! ICR_CHART_NO_T.equals("")) {
%>
		 		ICR_CHART_NO='<%= ICR_CHART_NO_T%>'
<%
			}

			if(! ICR_SEX_KD_T.equals("")) {
%>
		 		ICR_SEX_KD='<%= ICR_SEX_KD_T%>'
<%
			}

			if(! ICR_COMP_CD_T.equals("")) {
%>
		 		ICR_COMP_CD='<%= ICR_COMP_CD_T%>'
<%
			}

			if(! ICR_ENTR_DT_T.equals("")) {
%>
		 		ICR_ENTR_DT='<%= ICR_ENTR_DT_T%>'
<%
			}

			if(! ICR_BIRH_KD_T.equals("")) {
%>
		 		ICR_BIRH_KD='<%= ICR_BIRH_KD_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! ICR_MARY_KD_T.equals("")) {
%>
		 		ICR_MARY_KD='<%= ICR_MARY_KD_T%>'
<%
			}

			if(! ICR_MARY_DT_T.equals("")) {
%>
		 		ICR_MARY_DT='<%= ICR_MARY_DT_T%>'
<%
			}

			if(! ICR_TEL_NO_T.equals("")) {
%>
		 		ICR_TEL_NO='<%= ICR_TEL_NO_T%>'
<%
			}

			if(! ICR_MOBL_NO_T.equals("")) {
%>
		 		ICR_MOBL_NO='<%= ICR_MOBL_NO_T%>'
<%
			}

			if(! ICR_EMAI_AR_T.equals("")) {
%>
		 		ICR_EMAI_AR='<%= ICR_EMAI_AR_T%>'
<%
			}

			if(! ICR_ADDR_KD_T.equals("")) {
%>
		 		ICR_ADDR_KD='<%= ICR_ADDR_KD_T%>'
<%
			}

			if(! ICR_ZIP_CD_T.equals("")) {
%>
		 		ICR_ZIP_CD='<%= ICR_ZIP_CD_T%>'
<%
			}

			if(! ICR_ZIP_SQ_T.equals("")) {
%>
		 		ICR_ZIP_SQ='<%= ICR_ZIP_SQ_T%>'
<%
			}

			if(! ICR_ZIP_AR_T.equals("")) {
%>
		 		ICR_ZIP_AR='<%= ICR_ZIP_AR_T%>'
<%
			}

			if(! ICR_LOTT_AR_T.equals("")) {
%>
		 		ICR_LOTT_AR='<%= ICR_LOTT_AR_T%>'
<%
			}

			if(! ICR_ROAD_AR_T.equals("")) {
%>
		 		ICR_ROAD_AR='<%= ICR_ROAD_AR_T%>'
<%
			}

			if(! ICR_BLDG_NO_T.equals("")) {
%>
		 		ICR_BLDG_NO='<%= ICR_BLDG_NO_T%>'
<%
			}

			if(! ICR_PARE_NM_T.equals("")) {
%>
		 		ICR_PARE_NM='<%= ICR_PARE_NM_T%>'
<%
			}

			if(! ICR_PARE_NO_T.equals("")) {
%>
		 		ICR_PARE_NO='<%= ICR_PARE_NO_T%>'
<%
			}

			if(! ICR_INFO_YN_T.equals("")) {
%>
		 		ICR_INFO_YN='<%= ICR_INFO_YN_T%>'
<%
			}

			if(! ICR_RECV_YN_T.equals("")) {
%>
		 		ICR_RECV_YN='<%= ICR_RECV_YN_T%>'
<%
			}

			if(! ICR_CUST_TX_T.equals("")) {
%>
		 		ICR_CUST_TX='<%= ICR_CUST_TX_T%>'
<%
			}

			if(! ICR_DIVI_NM_T.equals("")) {
%>
		 		ICR_DIVI_NM='<%= ICR_DIVI_NM_T%>'
<%
			}

			if(! ICR_DIVI_CS_T.equals("")) {
%>
		 		ICR_DIVI_CS='<%= ICR_DIVI_CS_T%>'
<%
			}

			if(! ICR_DIVI_KD_T.equals("")) {
%>
		 		ICR_DIVI_KD='<%= ICR_DIVI_KD_T%>'
<%
			}

			if(! ICR_CLSS_KD_T.equals("")) {
%>
		 		ICR_CLSS_KD='<%= ICR_CLSS_KD_T%>'
<%
			}

			if(! ICR_DIVI_NO_T.equals("")) {
%>
		 		ICR_DIVI_NO='<%= ICR_DIVI_NO_T%>'
<%
			}

			if(! ICR_PID_EN_T.equals("")) {
%>
		 		ICR_PID_EN='<%= ICR_PID_EN_T%>'
<%
			}

			if(! ICR_USE_YN_T.equals("")) {
%>
		 		ICR_USE_YN='<%= ICR_USE_YN_T%>'
<%
			}

			if(! ICR_NUSE_ID_T.equals("")) {
%>
		 		ICR_NUSE_ID='<%= ICR_NUSE_ID_T%>'
<%
			}

			if(! ICR_NUSE_DTT_T.equals("")) {
%>
		 		ICR_NUSE_DTT='<%= ICR_NUSE_DTT_T%>'
<%
			}

			if(! ICR_INPT_ID_T.equals("")) {
%>
		 		ICR_INPT_ID='<%= ICR_INPT_ID_T%>'
<%
			}

			if(! ICR_INPT_DTT_T.equals("")) {
%>
		 		ICR_INPT_DTT='<%= ICR_INPT_DTT_T%>'
<%
			}

			if(! ICR_MODI_ID_T.equals("")) {
%>
		 		ICR_MODI_ID='<%= ICR_MODI_ID_T%>'
<%
			}

			if(! ICR_MODI_DTT_T.equals("")) {
%>
		 		ICR_MODI_DTT='<%= ICR_MODI_DTT_T%>'
<%
			}

			if(! ICR_NOTE_YN_T.equals("")) {
%>
		 		ICR_NOTE_YN='<%= ICR_NOTE_YN_T%>'
<%
			}

			if(! ICR_CPENL_NM_T.equals("")) {
%>
		 		ICR_CPENL_NM='<%= ICR_CPENL_NM_T%>'
<%
			}

			if(! ICR_INFORE_YN_T.equals("")) {
%>
		 		ICR_INFORE_YN='<%= ICR_INFORE_YN_T%>'
<%
			}

			if(! ICR_REGION_CD_T.equals("")) {
%>
		 		ICR_REGION_CD='<%= ICR_REGION_CD_T%>'
<%
			}

			if(! ICR_IMPAIR_DT_T.equals("")) {
%>
		 		ICR_IMPAIR_DT='<%= ICR_IMPAIR_DT_T%>'
<%
			}

			if(! ICR_IMPAIR_KD_T.equals("")) {
%>
		 		ICR_IMPAIR_KD='<%= ICR_IMPAIR_KD_T%>'
<%
			}

			if(! ICR_IMPAIR_GD_T.equals("")) {
%>
		 		ICR_IMPAIR_GD='<%= ICR_IMPAIR_GD_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c153_T.equals("")) {
%>
		 		c153='<%= c153_T%>'
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
