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
		String HTSB_CD = htMethod.get("HTSB_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(HTSB_CD == null) { HTSB_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select A.*, B.*, C.*, F_COMP_FIND(EEA_COMP_CD) EEA_COMP_NM
  From ET_EXAM_ACPT A                                         
 inner join IT_CUSTOMER B on A.EEA_CUST_NO = B.ICR_CUST_NO    
 inner join PT_FIR_PANJUNG C on A.EEA_EXAM_DT = C.PFP_EXAM_DT 
                            and A.EEA_EXAM_SQ = C.PFP_EXAM_SQ 
 where A.EEA_EXAM_DT = :EXAM_DT
   and A.EEA_EXAM_SQ = :EXAM_SQ
   and A.EEA_HTSB_CD = :HTSB_CD                              

		*/

		sql = " SELECT A.*, B.*, C.*, F_COMP_FIND(EEA_COMP_CD) EEA_COMP_NM";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO INNER JOIN PT_FIR_PANJUNG C";
		sql += " ON A.EEA_EXAM_DT = C.PFP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = C.PFP_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND A.EEA_HTSB_CD = '" + HTSB_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : QRinresult66A1_2018_DetailBand1BeforePrint_001 \n";
			G_INFO += "설명 : 검사결과정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " HTSB_CD : " + HTSB_CD + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_TM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_TM'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSVN_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RSVN_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_CD' rs:number='5' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_ACPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='7' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='8' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MMBR_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MMBR_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='11' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_CD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_SQ' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_AR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ROAD_AR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BLDG_NO' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BLDG_NO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEL_NO' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMAIL_AR' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_CD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEND_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_DT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEND_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SMS_YN' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SMS_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COTK_CD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COTK_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_NOTE_YN' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_NOTE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_CD' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENTRY_DT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENTRY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CS' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_CS'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CLSS_KD' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CLSS_KD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_CD' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FAMY_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_NM' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FAMY_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RFID_NO' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RFID_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FOOD_YN' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FOOD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SALES_ID' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SALES_ID'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='40' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_CD' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_CD' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_CD' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_CD' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_CD' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_YN' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_YN' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_YN' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_YN' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_YN' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTPR_CD' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPPR_CD' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVPR_CD' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMPR_CD' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETPR_CD' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNCL_CD' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_YR' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_HTYR' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_HTYR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_SPYM' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_SPYM'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_LT' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EXAM_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_LT' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPSB_LT' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CVSB_LT' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CVSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMSB_LT' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ETSB_LT' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ETSB_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADD_LT' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ADD_LT'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORDER_LT' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORDER_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPHT_CD' rs:number='70' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPHT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_NO' rs:number='71' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INSU_NO'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_CD' rs:number='72' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INSU_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENTY_CD' rs:number='73' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENTY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ASSO_CD' rs:number='74' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ASSO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNTR_CD' rs:number='75' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNTR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ARMY_CD' rs:number='76' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ARMY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HEPA_YN' rs:number='77' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HEPA_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_YN' rs:number='78' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANAD_YN' rs:number='79' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANAD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HOLIDAY_YN' rs:number='80' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HOLIDAY_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_CD' rs:number='81' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_STOMA_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_CD' rs:number='82' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COLON_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_CD' rs:number='83' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIVER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_CD' rs:number='84' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BAST_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_CD' rs:number='85' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UTER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_STOMA_DR' rs:number='86' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_STOMA_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COLON_DR' rs:number='87' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COLON_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIVER_DR' rs:number='88' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIVER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BAST_DR' rs:number='89' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_BAST_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_DR' rs:number='90' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UTER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNCR_DT' rs:number='91' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNCR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HDMD_YN' rs:number='92' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SDMD_YN' rs:number='93' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPRT_PR' rs:number='94' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPRT_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_PR' rs:number='95' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_PR' rs:number='96' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTH_PR' rs:number='97' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTH_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_PR' rs:number='98' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CAN_PR' rs:number='99' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CAN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_PR' rs:number='100' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORAL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMPR_PR' rs:number='101' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMPR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNLR_PR' rs:number='102' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNLR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTHR_PR' rs:number='103' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTHR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCLR_PR' rs:number='104' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCLR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANR_PR' rs:number='105' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORALR_PR' rs:number='106' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORALR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PYER_CD' rs:number='107' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PYER_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CMPY_CD' rs:number='108' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CMPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PRPY_CD' rs:number='109' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PRPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RECE_NO' rs:number='110' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RECE_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RECE_KD' rs:number='111' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_RECE_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSLT_CD' rs:number='112' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_RSLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BLRT_CD' rs:number='113' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_BLRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEFER_KD' rs:number='114' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEFER_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORDER_YN' rs:number='115' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORDER_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_NHIC_TX' rs:number='116' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_NHIC_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_TX' rs:number='117' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INPT_ID' rs:number='118' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INPT_DTT' rs:number='119' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MODI_ID' rs:number='120' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MODI_DTT' rs:number='121' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANAD_KD' rs:number='122' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANAD_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_2ND_YN' rs:number='123' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_2ND_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD2' rs:number='124' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD2'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LIFE_YN' rs:number='125' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LIFE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TOTAL_YN' rs:number='126' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_TOTAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_OCS_DR' rs:number='127' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_OCS_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HCV_YN' rs:number='128' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HCV_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_OCS_DV' rs:number='129' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_OCS_DV'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_OCS_NO' rs:number='130' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_OCS_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LABEL_DT' rs:number='131' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LABEL_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXEC_ID' rs:number='132' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EXEC_ID'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SELF_KD' rs:number='133' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SELF_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANPR_KD' rs:number='134' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANPR_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTH_KD' rs:number='135' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SAFE_YN' rs:number='136' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SAFE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADD_DT' rs:number='137' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ADD_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENDO_DR' rs:number='138' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENDO_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PDF_KD' rs:number='139' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PDF_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_CD' rs:number='140' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LUNG_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_DR' rs:number='141' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LUNG_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LUNG_KD' rs:number='142' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_LUNG_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UBEH_YN' rs:number='143' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UBEH_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CUST_NO' rs:number='144' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='145' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_SQ' rs:number='146' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_NM' rs:number='147' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MANA_KD' rs:number='148' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MANA_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CUST_KD' rs:number='149' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CUST_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NTNA_CD' rs:number='150' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_NTNA_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CHART_NO' rs:number='151' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_KD' rs:number='152' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_SEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_COMP_CD' rs:number='153' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ENTR_DT' rs:number='154' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ENTR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_KD' rs:number='155' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='156' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MARY_KD' rs:number='157' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MARY_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MARY_DT' rs:number='158' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MARY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_TEL_NO' rs:number='159' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO' rs:number='160' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_EMAI_AR' rs:number='161' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_EMAI_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ADDR_KD' rs:number='162' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ADDR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_CD' rs:number='163' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_SQ' rs:number='164' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ZIP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_AR' rs:number='165' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_LOTT_AR' rs:number='166' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_LOTT_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ROAD_AR' rs:number='167' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BLDG_NO' rs:number='168' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BLDG_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PARE_NM' rs:number='169' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PARE_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PARE_NO' rs:number='170' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PARE_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INFO_YN' rs:number='171' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_INFO_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_RECV_YN' rs:number='172' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_RECV_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CUST_TX' rs:number='173' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CUST_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_NM' rs:number='174' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_DIVI_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_CS' rs:number='175' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_DIVI_CS'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_KD' rs:number='176' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_DIVI_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CLSS_KD' rs:number='177' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CLSS_KD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_NO' rs:number='178' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PID_EN' rs:number='179' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PID_EN'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_USE_YN' rs:number='180' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NUSE_ID' rs:number='181' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NUSE_DTT' rs:number='182' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INPT_ID' rs:number='183' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INPT_DTT' rs:number='184' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MODI_ID' rs:number='185' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MODI_DTT' rs:number='186' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NOTE_YN' rs:number='187' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_NOTE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CPENL_NM' rs:number='188' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_CPENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INFORE_YN' rs:number='189' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_INFORE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_EXAM_DT' rs:number='190' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG' rs:basecolumn='PFP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_EXAM_SQ' rs:number='191' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG' rs:basecolumn='PFP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_HISJIN' rs:number='192' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_HISJIN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_HISMED' rs:number='193' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_HISMED'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_LIVEGBN' rs:number='194' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_LIVEGBN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_LIVESMK' rs:number='195' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_LIVESMK'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_LIVEDRK' rs:number='196' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_LIVEDRK'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_LIVESPT' rs:number='197' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_LIVESPT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_LIVEWET' rs:number='198' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_LIVEWET'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_SEDPLIST' rs:number='199' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_SEDPLIST'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_EXINJUR' rs:number='200' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_EXINJUR'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_DEPRESS' rs:number='201' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_DEPRESS'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_CNDTION' rs:number='202' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_CNDTION'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_CGNTION' rs:number='203' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_CGNTION'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_1' rs:number='204' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_2' rs:number='205' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_3' rs:number='206' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_4' rs:number='207' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_5' rs:number='208' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_5'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_6' rs:number='209' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_6'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_7' rs:number='210' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_7'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_8' rs:number='211' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_8'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_9' rs:number='212' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_9'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_1' rs:number='213' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_2' rs:number='214' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_3' rs:number='215' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_4' rs:number='216' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_5' rs:number='217' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_5'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_6' rs:number='218' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_6'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_7' rs:number='219' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_7'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_8' rs:number='220' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_8'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR2_1' rs:number='221' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR2_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR2_2' rs:number='222' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR2_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_1' rs:number='223' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTRD_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_2' rs:number='224' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTRD_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_3' rs:number='225' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTRD_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_4' rs:number='226' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTRD_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_TRANC_DATE' rs:number='227' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_TRANC_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULT_DATE' rs:number='228' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULT_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_DOCTORFIR' rs:number='229' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_DOCTORFIR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_PANRETA' rs:number='230' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_PANRETA'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_PANRETB' rs:number='231' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_PANRETB'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_PANRETR1' rs:number='232' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_PANRETR1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_PANRETR2' rs:number='233' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_PANRETR2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_PANRETRD' rs:number='234' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_PANRETRD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RVIEW' rs:number='235' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RVIEW'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_BVIEW' rs:number='236' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_BVIEW'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_INPUT_ID' rs:number='237' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_INPUT_DTT' rs:number='238' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_MODI_DTT' rs:number='239' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_MODI_ID' rs:number='240' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULT8_ETC' rs:number='241' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULT8_ETC'>
			<s:datatype dt:type='string' dt:maxLength='80'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_10' rs:number='242' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_10'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_FIX_YN' rs:number='243' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_FIX_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_EXAM_DT2' rs:number='244' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_EXAM_DT2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_EXAM_SQ2' rs:number='245' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_EXAM_SQ2'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_FIR_INFO' rs:number='246' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_FIR_INFO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_SED_INFO' rs:number='247' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_SED_INFO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_OPIN1' rs:number='248' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_OPIN1'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_OPIN2' rs:number='249' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_OPIN2'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_OPIN3' rs:number='250' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_OPIN3'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_OPIN4' rs:number='251' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_OPIN4'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_5' rs:number='252' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTRD_5'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_ETC' rs:number='253' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTRD_ETC'>
			<s:datatype dt:type='string' dt:maxLength='80'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_DOCTORQQN' rs:number='254' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_DOCTORQQN'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTB_11' rs:number='255' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTB_11'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_9' rs:number='256' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_9'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTR1_10' rs:number='257' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RESULTR1_10'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='258' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='259' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c259' rs:name='ROWID' rs:number='260' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c260' rs:name='ROWID' rs:number='261' rs:rowid='true' rs:basetable='PT_FIR_PANJUNG'
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

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_ACPT_TM_T = cRsList.getString("EEA_ACPT_TM");
			String EEA_RSVN_NO_T = cRsList.getString("EEA_RSVN_NO");
			String EEA_ACPT_CD_T = cRsList.getString("EEA_ACPT_CD");
			String EEA_ACPT_KD_T = cRsList.getString("EEA_ACPT_KD");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_MMBR_CD_T = cRsList.getString("EEA_MMBR_CD");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_ZIP_CD_T = cRsList.getString("EEA_ZIP_CD");
			String EEA_ZIP_SQ_T = cRsList.getString("EEA_ZIP_SQ");
			String EEA_ZIP_AR_T = cRsList.getString("EEA_ZIP_AR");
			String EEA_ROAD_AR_T = cRsList.getString("EEA_ROAD_AR");
			String EEA_BLDG_NO_T = cRsList.getString("EEA_BLDG_NO");
			String EEA_TEL_NO_T = cRsList.getString("EEA_TEL_NO");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_EMAIL_AR_T = cRsList.getString("EEA_EMAIL_AR");
			String EEA_SEND_CD_T = cRsList.getString("EEA_SEND_CD");
			String EEA_SEND_DT_T = cRsList.getString("EEA_SEND_DT");
			String EEA_SMS_YN_T = cRsList.getString("EEA_SMS_YN");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_COTK_CD_T = cRsList.getString("EEA_COTK_CD");
			String EEA_NOTE_YN_T = cRsList.getString("EEA_NOTE_YN");
			String EEA_DEPT_CD_T = cRsList.getString("EEA_DEPT_CD");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_DIVI_CD_T = cRsList.getString("EEA_DIVI_CD");
			String EEA_ENTRY_DT_T = cRsList.getString("EEA_ENTRY_DT");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_DIVI_CS_T = cRsList.getString("EEA_DIVI_CS");
			String EEA_CLSS_KD_T = cRsList.getString("EEA_CLSS_KD");
			String EEA_FAMY_CD_T = cRsList.getString("EEA_FAMY_CD");
			String EEA_FAMY_NM_T = cRsList.getString("EEA_FAMY_NM");
			String EEA_RFID_NO_T = cRsList.getString("EEA_RFID_NO");
			String EEA_FOOD_YN_T = cRsList.getString("EEA_FOOD_YN");
			String EEA_SALES_ID_T = cRsList.getString("EEA_SALES_ID");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_HTSB_CD_T = cRsList.getString("EEA_HTSB_CD");
			String EEA_SPSB_CD_T = cRsList.getString("EEA_SPSB_CD");
			String EEA_CVSB_CD_T = cRsList.getString("EEA_CVSB_CD");
			String EEA_EMSB_CD_T = cRsList.getString("EEA_EMSB_CD");
			String EEA_ETSB_CD_T = cRsList.getString("EEA_ETSB_CD");
			String EEA_HTSB_YN_T = cRsList.getString("EEA_HTSB_YN");
			String EEA_SPSB_YN_T = cRsList.getString("EEA_SPSB_YN");
			String EEA_CVSB_YN_T = cRsList.getString("EEA_CVSB_YN");
			String EEA_EMSB_YN_T = cRsList.getString("EEA_EMSB_YN");
			String EEA_ETSB_YN_T = cRsList.getString("EEA_ETSB_YN");
			String EEA_HTPR_CD_T = cRsList.getString("EEA_HTPR_CD");
			String EEA_SPPR_CD_T = cRsList.getString("EEA_SPPR_CD");
			String EEA_CVPR_CD_T = cRsList.getString("EEA_CVPR_CD");
			String EEA_EMPR_CD_T = cRsList.getString("EEA_EMPR_CD");
			String EEA_ETPR_CD_T = cRsList.getString("EEA_ETPR_CD");
			String EEA_CNCL_CD_T = cRsList.getString("EEA_CNCL_CD");
			String EEA_MNGT_YR_T = cRsList.getString("EEA_MNGT_YR");
			String EEA_MNGT_HTYR_T = cRsList.getString("EEA_MNGT_HTYR");
			String EEA_MNGT_SPYM_T = cRsList.getString("EEA_MNGT_SPYM");
			String EEA_EXAM_LT_T = cRsList.getString("EEA_EXAM_LT");
			String EEA_HTSB_LT_T = cRsList.getString("EEA_HTSB_LT");
			String EEA_SPSB_LT_T = cRsList.getString("EEA_SPSB_LT");
			String EEA_CVSB_LT_T = cRsList.getString("EEA_CVSB_LT");
			String EEA_EMSB_LT_T = cRsList.getString("EEA_EMSB_LT");
			String EEA_ETSB_LT_T = cRsList.getString("EEA_ETSB_LT");
			String EEA_ADD_LT_T = cRsList.getString("EEA_ADD_LT");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String EEA_ORDER_LT_T = cRsList.getString("EEA_ORDER_LT");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_SPHT_CD_T = cRsList.getString("EEA_SPHT_CD");
			String EEA_INSU_NO_T = cRsList.getString("EEA_INSU_NO");
			String EEA_INSU_CD_T = cRsList.getString("EEA_INSU_CD");
			String EEA_ENTY_CD_T = cRsList.getString("EEA_ENTY_CD");
			String EEA_ASSO_CD_T = cRsList.getString("EEA_ASSO_CD");
			String EEA_CNTR_CD_T = cRsList.getString("EEA_CNTR_CD");
			String EEA_ARMY_CD_T = cRsList.getString("EEA_ARMY_CD");
			String EEA_HEPA_YN_T = cRsList.getString("EEA_HEPA_YN");
			String EEA_ORAL_YN_T = cRsList.getString("EEA_ORAL_YN");
			String EEA_CANAD_YN_T = cRsList.getString("EEA_CANAD_YN");
			String EEA_HOLIDAY_YN_T = cRsList.getString("EEA_HOLIDAY_YN");
			String EEA_STOMA_CD_T = cRsList.getString("EEA_STOMA_CD");
			String EEA_COLON_CD_T = cRsList.getString("EEA_COLON_CD");
			String EEA_LIVER_CD_T = cRsList.getString("EEA_LIVER_CD");
			String EEA_BAST_CD_T = cRsList.getString("EEA_BAST_CD");
			String EEA_UTER_CD_T = cRsList.getString("EEA_UTER_CD");
			String EEA_STOMA_DR_T = cRsList.getString("EEA_STOMA_DR");
			String EEA_COLON_DR_T = cRsList.getString("EEA_COLON_DR");
			String EEA_LIVER_DR_T = cRsList.getString("EEA_LIVER_DR");
			String EEA_BAST_DR_T = cRsList.getString("EEA_BAST_DR");
			String EEA_UTER_DR_T = cRsList.getString("EEA_UTER_DR");
			String EEA_CNCR_DT_T = cRsList.getString("EEA_CNCR_DT");
			String EEA_HDMD_YN_T = cRsList.getString("EEA_HDMD_YN");
			String EEA_SDMD_YN_T = cRsList.getString("EEA_SDMD_YN");
			String EEA_SPRT_PR_T = cRsList.getString("EEA_SPRT_PR");
			String EEA_COMP_PR_T = cRsList.getString("EEA_COMP_PR");
			String EEA_PSNL_PR_T = cRsList.getString("EEA_PSNL_PR");
			String EEA_HLTH_PR_T = cRsList.getString("EEA_HLTH_PR");
			String EEA_SPCL_PR_T = cRsList.getString("EEA_SPCL_PR");
			String EEA_CAN_PR_T = cRsList.getString("EEA_CAN_PR");
			String EEA_ORAL_PR_T = cRsList.getString("EEA_ORAL_PR");
			String EEA_COMPR_PR_T = cRsList.getString("EEA_COMPR_PR");
			String EEA_PSNLR_PR_T = cRsList.getString("EEA_PSNLR_PR");
			String EEA_HLTHR_PR_T = cRsList.getString("EEA_HLTHR_PR");
			String EEA_SPCLR_PR_T = cRsList.getString("EEA_SPCLR_PR");
			String EEA_CANR_PR_T = cRsList.getString("EEA_CANR_PR");
			String EEA_ORALR_PR_T = cRsList.getString("EEA_ORALR_PR");
			String EEA_PYER_CD_T = cRsList.getString("EEA_PYER_CD");
			String EEA_CMPY_CD_T = cRsList.getString("EEA_CMPY_CD");
			String EEA_PRPY_CD_T = cRsList.getString("EEA_PRPY_CD");
			String EEA_RECE_NO_T = cRsList.getString("EEA_RECE_NO");
			String EEA_RECE_KD_T = cRsList.getString("EEA_RECE_KD");
			String EEA_RSLT_CD_T = cRsList.getString("EEA_RSLT_CD");
			String EEA_BLRT_CD_T = cRsList.getString("EEA_BLRT_CD");
			String EEA_DEFER_KD_T = cRsList.getString("EEA_DEFER_KD");
			String EEA_ORDER_YN_T = cRsList.getString("EEA_ORDER_YN");
			String EEA_NHIC_TX_T = cRsList.getString("EEA_NHIC_TX");
			String EEA_ACPT_TX_T = cRsList.getString("EEA_ACPT_TX");
			String EEA_INPT_ID_T = cRsList.getString("EEA_INPT_ID");
			String EEA_INPT_DTT_T = cRsList.getDate2("EEA_INPT_DTT");
			String EEA_MODI_ID_T = cRsList.getString("EEA_MODI_ID");
			String EEA_MODI_DTT_T = cRsList.getDate2("EEA_MODI_DTT");
			String EEA_CANAD_KD_T = cRsList.getString("EEA_CANAD_KD");
			String EEA_2ND_YN_T = cRsList.getString("EEA_2ND_YN");
			String EEA_COMP_CD2_T = cRsList.getString("EEA_COMP_CD2");
			String EEA_LIFE_YN_T = cRsList.getString("EEA_LIFE_YN");
			String EEA_TOTAL_YN_T = cRsList.getString("EEA_TOTAL_YN");
			String EEA_OCS_DR_T = cRsList.getString("EEA_OCS_DR");
			String EEA_HCV_YN_T = cRsList.getString("EEA_HCV_YN");
			String EEA_OCS_DV_T = cRsList.getString("EEA_OCS_DV");
			String EEA_OCS_NO_T = cRsList.getString("EEA_OCS_NO");
			String EEA_LABEL_DT_T = cRsList.getString("EEA_LABEL_DT");
			String EEA_EXEC_ID_T = cRsList.getString("EEA_EXEC_ID");
			String EEA_SELF_KD_T = cRsList.getString("EEA_SELF_KD");
			String EEA_CANPR_KD_T = cRsList.getString("EEA_CANPR_KD");
			String EEA_HLTH_KD_T = cRsList.getString("EEA_HLTH_KD");
			String EEA_SAFE_YN_T = cRsList.getString("EEA_SAFE_YN");
			String EEA_ADD_DT_T = cRsList.getString("EEA_ADD_DT");
			String EEA_ENDO_DR_T = cRsList.getString("EEA_ENDO_DR");
			String EEA_PDF_KD_T = cRsList.getString("EEA_PDF_KD");
			String EEA_LUNG_CD_T = cRsList.getString("EEA_LUNG_CD");
			String EEA_LUNG_DR_T = cRsList.getString("EEA_LUNG_DR");
			String EEA_LUNG_KD_T = cRsList.getString("EEA_LUNG_KD");
			String EEA_UBEH_YN_T = cRsList.getString("EEA_UBEH_YN");
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
			String PFP_EXAM_DT_T = cRsList.getString("PFP_EXAM_DT");
			String PFP_EXAM_SQ_T = cRsList.getString("PFP_EXAM_SQ");
			String PFP_HISJIN_T = cRsList.getString("PFP_HISJIN");
			String PFP_HISMED_T = cRsList.getString("PFP_HISMED");
			String PFP_LIVEGBN_T = cRsList.getString("PFP_LIVEGBN");
			String PFP_LIVESMK_T = cRsList.getString("PFP_LIVESMK");
			String PFP_LIVEDRK_T = cRsList.getString("PFP_LIVEDRK");
			String PFP_LIVESPT_T = cRsList.getString("PFP_LIVESPT");
			String PFP_LIVEWET_T = cRsList.getString("PFP_LIVEWET");
			String PFP_SEDPLIST_T = cRsList.getString("PFP_SEDPLIST");
			String PFP_EXINJUR_T = cRsList.getString("PFP_EXINJUR");
			String PFP_DEPRESS_T = cRsList.getString("PFP_DEPRESS");
			String PFP_CNDTION_T = cRsList.getString("PFP_CNDTION");
			String PFP_CGNTION_T = cRsList.getString("PFP_CGNTION");
			String PFP_RESULTB_1_T = cRsList.getString("PFP_RESULTB_1");
			String PFP_RESULTB_2_T = cRsList.getString("PFP_RESULTB_2");
			String PFP_RESULTB_3_T = cRsList.getString("PFP_RESULTB_3");
			String PFP_RESULTB_4_T = cRsList.getString("PFP_RESULTB_4");
			String PFP_RESULTB_5_T = cRsList.getString("PFP_RESULTB_5");
			String PFP_RESULTB_6_T = cRsList.getString("PFP_RESULTB_6");
			String PFP_RESULTB_7_T = cRsList.getString("PFP_RESULTB_7");
			String PFP_RESULTB_8_T = cRsList.getString("PFP_RESULTB_8");
			String PFP_RESULTB_9_T = cRsList.getString("PFP_RESULTB_9");
			String PFP_RESULTR1_1_T = cRsList.getString("PFP_RESULTR1_1");
			String PFP_RESULTR1_2_T = cRsList.getString("PFP_RESULTR1_2");
			String PFP_RESULTR1_3_T = cRsList.getString("PFP_RESULTR1_3");
			String PFP_RESULTR1_4_T = cRsList.getString("PFP_RESULTR1_4");
			String PFP_RESULTR1_5_T = cRsList.getString("PFP_RESULTR1_5");
			String PFP_RESULTR1_6_T = cRsList.getString("PFP_RESULTR1_6");
			String PFP_RESULTR1_7_T = cRsList.getString("PFP_RESULTR1_7");
			String PFP_RESULTR1_8_T = cRsList.getString("PFP_RESULTR1_8");
			String PFP_RESULTR2_1_T = cRsList.getString("PFP_RESULTR2_1");
			String PFP_RESULTR2_2_T = cRsList.getString("PFP_RESULTR2_2");
			String PFP_RESULTRD_1_T = cRsList.getString("PFP_RESULTRD_1");
			String PFP_RESULTRD_2_T = cRsList.getString("PFP_RESULTRD_2");
			String PFP_RESULTRD_3_T = cRsList.getString("PFP_RESULTRD_3");
			String PFP_RESULTRD_4_T = cRsList.getString("PFP_RESULTRD_4");
			String PFP_TRANC_DATE_T = cRsList.getString("PFP_TRANC_DATE");
			String PFP_RESULT_DATE_T = cRsList.getString("PFP_RESULT_DATE");
			String PFP_DOCTORFIR_T = cRsList.getString("PFP_DOCTORFIR");
			String PFP_PANRETA_T = cRsList.getString("PFP_PANRETA");
			String PFP_PANRETB_T = cRsList.getString("PFP_PANRETB");
			String PFP_PANRETR1_T = cRsList.getString("PFP_PANRETR1");
			String PFP_PANRETR2_T = cRsList.getString("PFP_PANRETR2");
			String PFP_PANRETRD_T = cRsList.getString("PFP_PANRETRD");
			String PFP_RVIEW_T = cRsList.getString("PFP_RVIEW");
			String PFP_BVIEW_T = cRsList.getString("PFP_BVIEW");
			String PFP_INPUT_ID_T = cRsList.getString("PFP_INPUT_ID");
			String PFP_INPUT_DTT_T = cRsList.getDate2("PFP_INPUT_DTT");
			String PFP_MODI_DTT_T = cRsList.getDate2("PFP_MODI_DTT");
			String PFP_MODI_ID_T = cRsList.getString("PFP_MODI_ID");
			String PFP_RESULT8_ETC_T = cRsList.getString("PFP_RESULT8_ETC");
			String PFP_RESULTB_10_T = cRsList.getString("PFP_RESULTB_10");
			String PFP_FIX_YN_T = cRsList.getString("PFP_FIX_YN");
			String PFP_EXAM_DT2_T = cRsList.getString("PFP_EXAM_DT2");
			String PFP_EXAM_SQ2_T = cRsList.getString("PFP_EXAM_SQ2");
			String PFP_FIR_INFO_T = cRsList.getString("PFP_FIR_INFO");
			String PFP_SED_INFO_T = cRsList.getString("PFP_SED_INFO");
			String PFP_OPIN1_T = cRsList.getString("PFP_OPIN1");
			String PFP_OPIN2_T = cRsList.getString("PFP_OPIN2");
			String PFP_OPIN3_T = cRsList.getString("PFP_OPIN3");
			String PFP_OPIN4_T = cRsList.getString("PFP_OPIN4");
			String PFP_RESULTRD_5_T = cRsList.getString("PFP_RESULTRD_5");
			String PFP_RESULTRD_ETC_T = cRsList.getString("PFP_RESULTRD_ETC");
			String PFP_DOCTORQQN_T = cRsList.getString("PFP_DOCTORQQN");
			String PFP_RESULTB_11_T = cRsList.getString("PFP_RESULTB_11");
			String PFP_RESULTR1_9_T = cRsList.getString("PFP_RESULTR1_9");
			String PFP_RESULTR1_10_T = cRsList.getString("PFP_RESULTR1_10");
			String EEA_COMP_NM_T = cRsList.getString("EEA_COMP_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c259_T = cRsList.getString("c259");
			String c260_T = cRsList.getString("c260");
%>
			<z:row
<%
			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
<%
			}

			if(! EEA_ACPT_TM_T.equals("")) {
%>
		 		EEA_ACPT_TM='<%= EEA_ACPT_TM_T%>'
<%
			}

			if(! EEA_RSVN_NO_T.equals("")) {
%>
		 		EEA_RSVN_NO='<%= EEA_RSVN_NO_T%>'
<%
			}

			if(! EEA_ACPT_CD_T.equals("")) {
%>
		 		EEA_ACPT_CD='<%= EEA_ACPT_CD_T%>'
<%
			}

			if(! EEA_ACPT_KD_T.equals("")) {
%>
		 		EEA_ACPT_KD='<%= EEA_ACPT_KD_T%>'
<%
			}

			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
<%
			}

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! EEA_MMBR_CD_T.equals("")) {
%>
		 		EEA_MMBR_CD='<%= EEA_MMBR_CD_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
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

			if(! EEA_ZIP_CD_T.equals("")) {
%>
		 		EEA_ZIP_CD='<%= EEA_ZIP_CD_T%>'
<%
			}

			if(! EEA_ZIP_SQ_T.equals("")) {
%>
		 		EEA_ZIP_SQ='<%= EEA_ZIP_SQ_T%>'
<%
			}

			if(! EEA_ZIP_AR_T.equals("")) {
%>
		 		EEA_ZIP_AR='<%= EEA_ZIP_AR_T%>'
<%
			}

			if(! EEA_ROAD_AR_T.equals("")) {
%>
		 		EEA_ROAD_AR='<%= EEA_ROAD_AR_T%>'
<%
			}

			if(! EEA_BLDG_NO_T.equals("")) {
%>
		 		EEA_BLDG_NO='<%= EEA_BLDG_NO_T%>'
<%
			}

			if(! EEA_TEL_NO_T.equals("")) {
%>
		 		EEA_TEL_NO='<%= EEA_TEL_NO_T%>'
<%
			}

			if(! EEA_MOBL_NO_T.equals("")) {
%>
		 		EEA_MOBL_NO='<%= EEA_MOBL_NO_T%>'
<%
			}

			if(! EEA_EMAIL_AR_T.equals("")) {
%>
		 		EEA_EMAIL_AR='<%= EEA_EMAIL_AR_T%>'
<%
			}

			if(! EEA_SEND_CD_T.equals("")) {
%>
		 		EEA_SEND_CD='<%= EEA_SEND_CD_T%>'
<%
			}

			if(! EEA_SEND_DT_T.equals("")) {
%>
		 		EEA_SEND_DT='<%= EEA_SEND_DT_T%>'
<%
			}

			if(! EEA_SMS_YN_T.equals("")) {
%>
		 		EEA_SMS_YN='<%= EEA_SMS_YN_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! EEA_COTK_CD_T.equals("")) {
%>
		 		EEA_COTK_CD='<%= EEA_COTK_CD_T%>'
<%
			}

			if(! EEA_NOTE_YN_T.equals("")) {
%>
		 		EEA_NOTE_YN='<%= EEA_NOTE_YN_T%>'
<%
			}

			if(! EEA_DEPT_CD_T.equals("")) {
%>
		 		EEA_DEPT_CD='<%= EEA_DEPT_CD_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! EEA_DIVI_CD_T.equals("")) {
%>
		 		EEA_DIVI_CD='<%= EEA_DIVI_CD_T%>'
<%
			}

			if(! EEA_ENTRY_DT_T.equals("")) {
%>
		 		EEA_ENTRY_DT='<%= EEA_ENTRY_DT_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! EEA_DIVI_CS_T.equals("")) {
%>
		 		EEA_DIVI_CS='<%= EEA_DIVI_CS_T%>'
<%
			}

			if(! EEA_CLSS_KD_T.equals("")) {
%>
		 		EEA_CLSS_KD='<%= EEA_CLSS_KD_T%>'
<%
			}

			if(! EEA_FAMY_CD_T.equals("")) {
%>
		 		EEA_FAMY_CD='<%= EEA_FAMY_CD_T%>'
<%
			}

			if(! EEA_FAMY_NM_T.equals("")) {
%>
		 		EEA_FAMY_NM='<%= EEA_FAMY_NM_T%>'
<%
			}

			if(! EEA_RFID_NO_T.equals("")) {
%>
		 		EEA_RFID_NO='<%= EEA_RFID_NO_T%>'
<%
			}

			if(! EEA_FOOD_YN_T.equals("")) {
%>
		 		EEA_FOOD_YN='<%= EEA_FOOD_YN_T%>'
<%
			}

			if(! EEA_SALES_ID_T.equals("")) {
%>
		 		EEA_SALES_ID='<%= EEA_SALES_ID_T%>'
<%
			}

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! EEA_HTSB_CD_T.equals("")) {
%>
		 		EEA_HTSB_CD='<%= EEA_HTSB_CD_T%>'
<%
			}

			if(! EEA_SPSB_CD_T.equals("")) {
%>
		 		EEA_SPSB_CD='<%= EEA_SPSB_CD_T%>'
<%
			}

			if(! EEA_CVSB_CD_T.equals("")) {
%>
		 		EEA_CVSB_CD='<%= EEA_CVSB_CD_T%>'
<%
			}

			if(! EEA_EMSB_CD_T.equals("")) {
%>
		 		EEA_EMSB_CD='<%= EEA_EMSB_CD_T%>'
<%
			}

			if(! EEA_ETSB_CD_T.equals("")) {
%>
		 		EEA_ETSB_CD='<%= EEA_ETSB_CD_T%>'
<%
			}

			if(! EEA_HTSB_YN_T.equals("")) {
%>
		 		EEA_HTSB_YN='<%= EEA_HTSB_YN_T%>'
<%
			}

			if(! EEA_SPSB_YN_T.equals("")) {
%>
		 		EEA_SPSB_YN='<%= EEA_SPSB_YN_T%>'
<%
			}

			if(! EEA_CVSB_YN_T.equals("")) {
%>
		 		EEA_CVSB_YN='<%= EEA_CVSB_YN_T%>'
<%
			}

			if(! EEA_EMSB_YN_T.equals("")) {
%>
		 		EEA_EMSB_YN='<%= EEA_EMSB_YN_T%>'
<%
			}

			if(! EEA_ETSB_YN_T.equals("")) {
%>
		 		EEA_ETSB_YN='<%= EEA_ETSB_YN_T%>'
<%
			}

			if(! EEA_HTPR_CD_T.equals("")) {
%>
		 		EEA_HTPR_CD='<%= EEA_HTPR_CD_T%>'
<%
			}

			if(! EEA_SPPR_CD_T.equals("")) {
%>
		 		EEA_SPPR_CD='<%= EEA_SPPR_CD_T%>'
<%
			}

			if(! EEA_CVPR_CD_T.equals("")) {
%>
		 		EEA_CVPR_CD='<%= EEA_CVPR_CD_T%>'
<%
			}

			if(! EEA_EMPR_CD_T.equals("")) {
%>
		 		EEA_EMPR_CD='<%= EEA_EMPR_CD_T%>'
<%
			}

			if(! EEA_ETPR_CD_T.equals("")) {
%>
		 		EEA_ETPR_CD='<%= EEA_ETPR_CD_T%>'
<%
			}

			if(! EEA_CNCL_CD_T.equals("")) {
%>
		 		EEA_CNCL_CD='<%= EEA_CNCL_CD_T%>'
<%
			}

			if(! EEA_MNGT_YR_T.equals("")) {
%>
		 		EEA_MNGT_YR='<%= EEA_MNGT_YR_T%>'
<%
			}

			if(! EEA_MNGT_HTYR_T.equals("")) {
%>
		 		EEA_MNGT_HTYR='<%= EEA_MNGT_HTYR_T%>'
<%
			}

			if(! EEA_MNGT_SPYM_T.equals("")) {
%>
		 		EEA_MNGT_SPYM='<%= EEA_MNGT_SPYM_T%>'
<%
			}

			if(! EEA_EXAM_LT_T.equals("")) {
%>
		 		EEA_EXAM_LT='<%= EEA_EXAM_LT_T%>'
<%
			}

			if(! EEA_HTSB_LT_T.equals("")) {
%>
		 		EEA_HTSB_LT='<%= EEA_HTSB_LT_T%>'
<%
			}

			if(! EEA_SPSB_LT_T.equals("")) {
%>
		 		EEA_SPSB_LT='<%= EEA_SPSB_LT_T%>'
<%
			}

			if(! EEA_CVSB_LT_T.equals("")) {
%>
		 		EEA_CVSB_LT='<%= EEA_CVSB_LT_T%>'
<%
			}

			if(! EEA_EMSB_LT_T.equals("")) {
%>
		 		EEA_EMSB_LT='<%= EEA_EMSB_LT_T%>'
<%
			}

			if(! EEA_ETSB_LT_T.equals("")) {
%>
		 		EEA_ETSB_LT='<%= EEA_ETSB_LT_T%>'
<%
			}

			if(! EEA_ADD_LT_T.equals("")) {
%>
		 		EEA_ADD_LT='<%= EEA_ADD_LT_T%>'
<%
			}

			if(! EEA_SPCL_LT_T.equals("")) {
%>
		 		EEA_SPCL_LT='<%= EEA_SPCL_LT_T%>'
<%
			}

			if(! EEA_ORDER_LT_T.equals("")) {
%>
		 		EEA_ORDER_LT='<%= EEA_ORDER_LT_T%>'
<%
			}

			if(! EEA_SPCL_CD_T.equals("")) {
%>
		 		EEA_SPCL_CD='<%= EEA_SPCL_CD_T%>'
<%
			}

			if(! EEA_SPHT_CD_T.equals("")) {
%>
		 		EEA_SPHT_CD='<%= EEA_SPHT_CD_T%>'
<%
			}

			if(! EEA_INSU_NO_T.equals("")) {
%>
		 		EEA_INSU_NO='<%= EEA_INSU_NO_T%>'
<%
			}

			if(! EEA_INSU_CD_T.equals("")) {
%>
		 		EEA_INSU_CD='<%= EEA_INSU_CD_T%>'
<%
			}

			if(! EEA_ENTY_CD_T.equals("")) {
%>
		 		EEA_ENTY_CD='<%= EEA_ENTY_CD_T%>'
<%
			}

			if(! EEA_ASSO_CD_T.equals("")) {
%>
		 		EEA_ASSO_CD='<%= EEA_ASSO_CD_T%>'
<%
			}

			if(! EEA_CNTR_CD_T.equals("")) {
%>
		 		EEA_CNTR_CD='<%= EEA_CNTR_CD_T%>'
<%
			}

			if(! EEA_ARMY_CD_T.equals("")) {
%>
		 		EEA_ARMY_CD='<%= EEA_ARMY_CD_T%>'
<%
			}

			if(! EEA_HEPA_YN_T.equals("")) {
%>
		 		EEA_HEPA_YN='<%= EEA_HEPA_YN_T%>'
<%
			}

			if(! EEA_ORAL_YN_T.equals("")) {
%>
		 		EEA_ORAL_YN='<%= EEA_ORAL_YN_T%>'
<%
			}

			if(! EEA_CANAD_YN_T.equals("")) {
%>
		 		EEA_CANAD_YN='<%= EEA_CANAD_YN_T%>'
<%
			}

			if(! EEA_HOLIDAY_YN_T.equals("")) {
%>
		 		EEA_HOLIDAY_YN='<%= EEA_HOLIDAY_YN_T%>'
<%
			}

			if(! EEA_STOMA_CD_T.equals("")) {
%>
		 		EEA_STOMA_CD='<%= EEA_STOMA_CD_T%>'
<%
			}

			if(! EEA_COLON_CD_T.equals("")) {
%>
		 		EEA_COLON_CD='<%= EEA_COLON_CD_T%>'
<%
			}

			if(! EEA_LIVER_CD_T.equals("")) {
%>
		 		EEA_LIVER_CD='<%= EEA_LIVER_CD_T%>'
<%
			}

			if(! EEA_BAST_CD_T.equals("")) {
%>
		 		EEA_BAST_CD='<%= EEA_BAST_CD_T%>'
<%
			}

			if(! EEA_UTER_CD_T.equals("")) {
%>
		 		EEA_UTER_CD='<%= EEA_UTER_CD_T%>'
<%
			}

			if(! EEA_STOMA_DR_T.equals("")) {
%>
		 		EEA_STOMA_DR='<%= EEA_STOMA_DR_T%>'
<%
			}

			if(! EEA_COLON_DR_T.equals("")) {
%>
		 		EEA_COLON_DR='<%= EEA_COLON_DR_T%>'
<%
			}

			if(! EEA_LIVER_DR_T.equals("")) {
%>
		 		EEA_LIVER_DR='<%= EEA_LIVER_DR_T%>'
<%
			}

			if(! EEA_BAST_DR_T.equals("")) {
%>
		 		EEA_BAST_DR='<%= EEA_BAST_DR_T%>'
<%
			}

			if(! EEA_UTER_DR_T.equals("")) {
%>
		 		EEA_UTER_DR='<%= EEA_UTER_DR_T%>'
<%
			}

			if(! EEA_CNCR_DT_T.equals("")) {
%>
		 		EEA_CNCR_DT='<%= EEA_CNCR_DT_T%>'
<%
			}

			if(! EEA_HDMD_YN_T.equals("")) {
%>
		 		EEA_HDMD_YN='<%= EEA_HDMD_YN_T%>'
<%
			}

			if(! EEA_SDMD_YN_T.equals("")) {
%>
		 		EEA_SDMD_YN='<%= EEA_SDMD_YN_T%>'
<%
			}

			if(! EEA_SPRT_PR_T.equals("")) {
%>
		 		EEA_SPRT_PR='<%= EEA_SPRT_PR_T%>'
<%
			}

			if(! EEA_COMP_PR_T.equals("")) {
%>
		 		EEA_COMP_PR='<%= EEA_COMP_PR_T%>'
<%
			}

			if(! EEA_PSNL_PR_T.equals("")) {
%>
		 		EEA_PSNL_PR='<%= EEA_PSNL_PR_T%>'
<%
			}

			if(! EEA_HLTH_PR_T.equals("")) {
%>
		 		EEA_HLTH_PR='<%= EEA_HLTH_PR_T%>'
<%
			}

			if(! EEA_SPCL_PR_T.equals("")) {
%>
		 		EEA_SPCL_PR='<%= EEA_SPCL_PR_T%>'
<%
			}

			if(! EEA_CAN_PR_T.equals("")) {
%>
		 		EEA_CAN_PR='<%= EEA_CAN_PR_T%>'
<%
			}

			if(! EEA_ORAL_PR_T.equals("")) {
%>
		 		EEA_ORAL_PR='<%= EEA_ORAL_PR_T%>'
<%
			}

			if(! EEA_COMPR_PR_T.equals("")) {
%>
		 		EEA_COMPR_PR='<%= EEA_COMPR_PR_T%>'
<%
			}

			if(! EEA_PSNLR_PR_T.equals("")) {
%>
		 		EEA_PSNLR_PR='<%= EEA_PSNLR_PR_T%>'
<%
			}

			if(! EEA_HLTHR_PR_T.equals("")) {
%>
		 		EEA_HLTHR_PR='<%= EEA_HLTHR_PR_T%>'
<%
			}

			if(! EEA_SPCLR_PR_T.equals("")) {
%>
		 		EEA_SPCLR_PR='<%= EEA_SPCLR_PR_T%>'
<%
			}

			if(! EEA_CANR_PR_T.equals("")) {
%>
		 		EEA_CANR_PR='<%= EEA_CANR_PR_T%>'
<%
			}

			if(! EEA_ORALR_PR_T.equals("")) {
%>
		 		EEA_ORALR_PR='<%= EEA_ORALR_PR_T%>'
<%
			}

			if(! EEA_PYER_CD_T.equals("")) {
%>
		 		EEA_PYER_CD='<%= EEA_PYER_CD_T%>'
<%
			}

			if(! EEA_CMPY_CD_T.equals("")) {
%>
		 		EEA_CMPY_CD='<%= EEA_CMPY_CD_T%>'
<%
			}

			if(! EEA_PRPY_CD_T.equals("")) {
%>
		 		EEA_PRPY_CD='<%= EEA_PRPY_CD_T%>'
<%
			}

			if(! EEA_RECE_NO_T.equals("")) {
%>
		 		EEA_RECE_NO='<%= EEA_RECE_NO_T%>'
<%
			}

			if(! EEA_RECE_KD_T.equals("")) {
%>
		 		EEA_RECE_KD='<%= EEA_RECE_KD_T%>'
<%
			}

			if(! EEA_RSLT_CD_T.equals("")) {
%>
		 		EEA_RSLT_CD='<%= EEA_RSLT_CD_T%>'
<%
			}

			if(! EEA_BLRT_CD_T.equals("")) {
%>
		 		EEA_BLRT_CD='<%= EEA_BLRT_CD_T%>'
<%
			}

			if(! EEA_DEFER_KD_T.equals("")) {
%>
		 		EEA_DEFER_KD='<%= EEA_DEFER_KD_T%>'
<%
			}

			if(! EEA_ORDER_YN_T.equals("")) {
%>
		 		EEA_ORDER_YN='<%= EEA_ORDER_YN_T%>'
<%
			}

			if(! EEA_NHIC_TX_T.equals("")) {
%>
		 		EEA_NHIC_TX='<%= EEA_NHIC_TX_T%>'
<%
			}

			if(! EEA_ACPT_TX_T.equals("")) {
%>
		 		EEA_ACPT_TX='<%= EEA_ACPT_TX_T%>'
<%
			}

			if(! EEA_INPT_ID_T.equals("")) {
%>
		 		EEA_INPT_ID='<%= EEA_INPT_ID_T%>'
<%
			}

			if(! EEA_INPT_DTT_T.equals("")) {
%>
		 		EEA_INPT_DTT='<%= EEA_INPT_DTT_T%>'
<%
			}

			if(! EEA_MODI_ID_T.equals("")) {
%>
		 		EEA_MODI_ID='<%= EEA_MODI_ID_T%>'
<%
			}

			if(! EEA_MODI_DTT_T.equals("")) {
%>
		 		EEA_MODI_DTT='<%= EEA_MODI_DTT_T%>'
<%
			}

			if(! EEA_CANAD_KD_T.equals("")) {
%>
		 		EEA_CANAD_KD='<%= EEA_CANAD_KD_T%>'
<%
			}

			if(! EEA_2ND_YN_T.equals("")) {
%>
		 		EEA_2ND_YN='<%= EEA_2ND_YN_T%>'
<%
			}

			if(! EEA_COMP_CD2_T.equals("")) {
%>
		 		EEA_COMP_CD2='<%= EEA_COMP_CD2_T%>'
<%
			}

			if(! EEA_LIFE_YN_T.equals("")) {
%>
		 		EEA_LIFE_YN='<%= EEA_LIFE_YN_T%>'
<%
			}

			if(! EEA_TOTAL_YN_T.equals("")) {
%>
		 		EEA_TOTAL_YN='<%= EEA_TOTAL_YN_T%>'
<%
			}

			if(! EEA_OCS_DR_T.equals("")) {
%>
		 		EEA_OCS_DR='<%= EEA_OCS_DR_T%>'
<%
			}

			if(! EEA_HCV_YN_T.equals("")) {
%>
		 		EEA_HCV_YN='<%= EEA_HCV_YN_T%>'
<%
			}

			if(! EEA_OCS_DV_T.equals("")) {
%>
		 		EEA_OCS_DV='<%= EEA_OCS_DV_T%>'
<%
			}

			if(! EEA_OCS_NO_T.equals("")) {
%>
		 		EEA_OCS_NO='<%= EEA_OCS_NO_T%>'
<%
			}

			if(! EEA_LABEL_DT_T.equals("")) {
%>
		 		EEA_LABEL_DT='<%= EEA_LABEL_DT_T%>'
<%
			}

			if(! EEA_EXEC_ID_T.equals("")) {
%>
		 		EEA_EXEC_ID='<%= EEA_EXEC_ID_T%>'
<%
			}

			if(! EEA_SELF_KD_T.equals("")) {
%>
		 		EEA_SELF_KD='<%= EEA_SELF_KD_T%>'
<%
			}

			if(! EEA_CANPR_KD_T.equals("")) {
%>
		 		EEA_CANPR_KD='<%= EEA_CANPR_KD_T%>'
<%
			}

			if(! EEA_HLTH_KD_T.equals("")) {
%>
		 		EEA_HLTH_KD='<%= EEA_HLTH_KD_T%>'
<%
			}

			if(! EEA_SAFE_YN_T.equals("")) {
%>
		 		EEA_SAFE_YN='<%= EEA_SAFE_YN_T%>'
<%
			}

			if(! EEA_ADD_DT_T.equals("")) {
%>
		 		EEA_ADD_DT='<%= EEA_ADD_DT_T%>'
<%
			}

			if(! EEA_ENDO_DR_T.equals("")) {
%>
		 		EEA_ENDO_DR='<%= EEA_ENDO_DR_T%>'
<%
			}

			if(! EEA_PDF_KD_T.equals("")) {
%>
		 		EEA_PDF_KD='<%= EEA_PDF_KD_T%>'
<%
			}

			if(! EEA_LUNG_CD_T.equals("")) {
%>
		 		EEA_LUNG_CD='<%= EEA_LUNG_CD_T%>'
<%
			}

			if(! EEA_LUNG_DR_T.equals("")) {
%>
		 		EEA_LUNG_DR='<%= EEA_LUNG_DR_T%>'
<%
			}

			if(! EEA_LUNG_KD_T.equals("")) {
%>
		 		EEA_LUNG_KD='<%= EEA_LUNG_KD_T%>'
<%
			}

			if(! EEA_UBEH_YN_T.equals("")) {
%>
		 		EEA_UBEH_YN='<%= EEA_UBEH_YN_T%>'
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

			if(! PFP_EXAM_DT_T.equals("")) {
%>
		 		PFP_EXAM_DT='<%= PFP_EXAM_DT_T%>'
<%
			}

			if(! PFP_EXAM_SQ_T.equals("")) {
%>
		 		PFP_EXAM_SQ='<%= PFP_EXAM_SQ_T%>'
<%
			}

			if(! PFP_HISJIN_T.equals("")) {
%>
		 		PFP_HISJIN='<%= PFP_HISJIN_T%>'
<%
			}

			if(! PFP_HISMED_T.equals("")) {
%>
		 		PFP_HISMED='<%= PFP_HISMED_T%>'
<%
			}

			if(! PFP_LIVEGBN_T.equals("")) {
%>
		 		PFP_LIVEGBN='<%= PFP_LIVEGBN_T%>'
<%
			}

			if(! PFP_LIVESMK_T.equals("")) {
%>
		 		PFP_LIVESMK='<%= PFP_LIVESMK_T%>'
<%
			}

			if(! PFP_LIVEDRK_T.equals("")) {
%>
		 		PFP_LIVEDRK='<%= PFP_LIVEDRK_T%>'
<%
			}

			if(! PFP_LIVESPT_T.equals("")) {
%>
		 		PFP_LIVESPT='<%= PFP_LIVESPT_T%>'
<%
			}

			if(! PFP_LIVEWET_T.equals("")) {
%>
		 		PFP_LIVEWET='<%= PFP_LIVEWET_T%>'
<%
			}

			if(! PFP_SEDPLIST_T.equals("")) {
%>
		 		PFP_SEDPLIST='<%= PFP_SEDPLIST_T%>'
<%
			}

			if(! PFP_EXINJUR_T.equals("")) {
%>
		 		PFP_EXINJUR='<%= PFP_EXINJUR_T%>'
<%
			}

			if(! PFP_DEPRESS_T.equals("")) {
%>
		 		PFP_DEPRESS='<%= PFP_DEPRESS_T%>'
<%
			}

			if(! PFP_CNDTION_T.equals("")) {
%>
		 		PFP_CNDTION='<%= PFP_CNDTION_T%>'
<%
			}

			if(! PFP_CGNTION_T.equals("")) {
%>
		 		PFP_CGNTION='<%= PFP_CGNTION_T%>'
<%
			}

			if(! PFP_RESULTB_1_T.equals("")) {
%>
		 		PFP_RESULTB_1='<%= PFP_RESULTB_1_T%>'
<%
			}

			if(! PFP_RESULTB_2_T.equals("")) {
%>
		 		PFP_RESULTB_2='<%= PFP_RESULTB_2_T%>'
<%
			}

			if(! PFP_RESULTB_3_T.equals("")) {
%>
		 		PFP_RESULTB_3='<%= PFP_RESULTB_3_T%>'
<%
			}

			if(! PFP_RESULTB_4_T.equals("")) {
%>
		 		PFP_RESULTB_4='<%= PFP_RESULTB_4_T%>'
<%
			}

			if(! PFP_RESULTB_5_T.equals("")) {
%>
		 		PFP_RESULTB_5='<%= PFP_RESULTB_5_T%>'
<%
			}

			if(! PFP_RESULTB_6_T.equals("")) {
%>
		 		PFP_RESULTB_6='<%= PFP_RESULTB_6_T%>'
<%
			}

			if(! PFP_RESULTB_7_T.equals("")) {
%>
		 		PFP_RESULTB_7='<%= PFP_RESULTB_7_T%>'
<%
			}

			if(! PFP_RESULTB_8_T.equals("")) {
%>
		 		PFP_RESULTB_8='<%= PFP_RESULTB_8_T%>'
<%
			}

			if(! PFP_RESULTB_9_T.equals("")) {
%>
		 		PFP_RESULTB_9='<%= PFP_RESULTB_9_T%>'
<%
			}

			if(! PFP_RESULTR1_1_T.equals("")) {
%>
		 		PFP_RESULTR1_1='<%= PFP_RESULTR1_1_T%>'
<%
			}

			if(! PFP_RESULTR1_2_T.equals("")) {
%>
		 		PFP_RESULTR1_2='<%= PFP_RESULTR1_2_T%>'
<%
			}

			if(! PFP_RESULTR1_3_T.equals("")) {
%>
		 		PFP_RESULTR1_3='<%= PFP_RESULTR1_3_T%>'
<%
			}

			if(! PFP_RESULTR1_4_T.equals("")) {
%>
		 		PFP_RESULTR1_4='<%= PFP_RESULTR1_4_T%>'
<%
			}

			if(! PFP_RESULTR1_5_T.equals("")) {
%>
		 		PFP_RESULTR1_5='<%= PFP_RESULTR1_5_T%>'
<%
			}

			if(! PFP_RESULTR1_6_T.equals("")) {
%>
		 		PFP_RESULTR1_6='<%= PFP_RESULTR1_6_T%>'
<%
			}

			if(! PFP_RESULTR1_7_T.equals("")) {
%>
		 		PFP_RESULTR1_7='<%= PFP_RESULTR1_7_T%>'
<%
			}

			if(! PFP_RESULTR1_8_T.equals("")) {
%>
		 		PFP_RESULTR1_8='<%= PFP_RESULTR1_8_T%>'
<%
			}

			if(! PFP_RESULTR2_1_T.equals("")) {
%>
		 		PFP_RESULTR2_1='<%= PFP_RESULTR2_1_T%>'
<%
			}

			if(! PFP_RESULTR2_2_T.equals("")) {
%>
		 		PFP_RESULTR2_2='<%= PFP_RESULTR2_2_T%>'
<%
			}

			if(! PFP_RESULTRD_1_T.equals("")) {
%>
		 		PFP_RESULTRD_1='<%= PFP_RESULTRD_1_T%>'
<%
			}

			if(! PFP_RESULTRD_2_T.equals("")) {
%>
		 		PFP_RESULTRD_2='<%= PFP_RESULTRD_2_T%>'
<%
			}

			if(! PFP_RESULTRD_3_T.equals("")) {
%>
		 		PFP_RESULTRD_3='<%= PFP_RESULTRD_3_T%>'
<%
			}

			if(! PFP_RESULTRD_4_T.equals("")) {
%>
		 		PFP_RESULTRD_4='<%= PFP_RESULTRD_4_T%>'
<%
			}

			if(! PFP_TRANC_DATE_T.equals("")) {
%>
		 		PFP_TRANC_DATE='<%= PFP_TRANC_DATE_T%>'
<%
			}

			if(! PFP_RESULT_DATE_T.equals("")) {
%>
		 		PFP_RESULT_DATE='<%= PFP_RESULT_DATE_T%>'
<%
			}

			if(! PFP_DOCTORFIR_T.equals("")) {
%>
		 		PFP_DOCTORFIR='<%= PFP_DOCTORFIR_T%>'
<%
			}

			if(! PFP_PANRETA_T.equals("")) {
%>
		 		PFP_PANRETA='<%= PFP_PANRETA_T%>'
<%
			}

			if(! PFP_PANRETB_T.equals("")) {
%>
		 		PFP_PANRETB='<%= PFP_PANRETB_T%>'
<%
			}

			if(! PFP_PANRETR1_T.equals("")) {
%>
		 		PFP_PANRETR1='<%= PFP_PANRETR1_T%>'
<%
			}

			if(! PFP_PANRETR2_T.equals("")) {
%>
		 		PFP_PANRETR2='<%= PFP_PANRETR2_T%>'
<%
			}

			if(! PFP_PANRETRD_T.equals("")) {
%>
		 		PFP_PANRETRD='<%= PFP_PANRETRD_T%>'
<%
			}

			if(! PFP_RVIEW_T.equals("")) {
%>
		 		PFP_RVIEW='<%= PFP_RVIEW_T%>'
<%
			}

			if(! PFP_BVIEW_T.equals("")) {
%>
		 		PFP_BVIEW='<%= PFP_BVIEW_T%>'
<%
			}

			if(! PFP_INPUT_ID_T.equals("")) {
%>
		 		PFP_INPUT_ID='<%= PFP_INPUT_ID_T%>'
<%
			}

			if(! PFP_INPUT_DTT_T.equals("")) {
%>
		 		PFP_INPUT_DTT='<%= PFP_INPUT_DTT_T%>'
<%
			}

			if(! PFP_MODI_DTT_T.equals("")) {
%>
		 		PFP_MODI_DTT='<%= PFP_MODI_DTT_T%>'
<%
			}

			if(! PFP_MODI_ID_T.equals("")) {
%>
		 		PFP_MODI_ID='<%= PFP_MODI_ID_T%>'
<%
			}

			if(! PFP_RESULT8_ETC_T.equals("")) {
%>
		 		PFP_RESULT8_ETC='<%= PFP_RESULT8_ETC_T%>'
<%
			}

			if(! PFP_RESULTB_10_T.equals("")) {
%>
		 		PFP_RESULTB_10='<%= PFP_RESULTB_10_T%>'
<%
			}

			if(! PFP_FIX_YN_T.equals("")) {
%>
		 		PFP_FIX_YN='<%= PFP_FIX_YN_T%>'
<%
			}

			if(! PFP_EXAM_DT2_T.equals("")) {
%>
		 		PFP_EXAM_DT2='<%= PFP_EXAM_DT2_T%>'
<%
			}

			if(! PFP_EXAM_SQ2_T.equals("")) {
%>
		 		PFP_EXAM_SQ2='<%= PFP_EXAM_SQ2_T%>'
<%
			}

			if(! PFP_FIR_INFO_T.equals("")) {
%>
		 		PFP_FIR_INFO='<%= PFP_FIR_INFO_T%>'
<%
			}

			if(! PFP_SED_INFO_T.equals("")) {
%>
		 		PFP_SED_INFO='<%= PFP_SED_INFO_T%>'
<%
			}

			if(! PFP_OPIN1_T.equals("")) {
%>
		 		PFP_OPIN1='<%= PFP_OPIN1_T%>'
<%
			}

			if(! PFP_OPIN2_T.equals("")) {
%>
		 		PFP_OPIN2='<%= PFP_OPIN2_T%>'
<%
			}

			if(! PFP_OPIN3_T.equals("")) {
%>
		 		PFP_OPIN3='<%= PFP_OPIN3_T%>'
<%
			}

			if(! PFP_OPIN4_T.equals("")) {
%>
		 		PFP_OPIN4='<%= PFP_OPIN4_T%>'
<%
			}

			if(! PFP_RESULTRD_5_T.equals("")) {
%>
		 		PFP_RESULTRD_5='<%= PFP_RESULTRD_5_T%>'
<%
			}

			if(! PFP_RESULTRD_ETC_T.equals("")) {
%>
		 		PFP_RESULTRD_ETC='<%= PFP_RESULTRD_ETC_T%>'
<%
			}

			if(! PFP_DOCTORQQN_T.equals("")) {
%>
		 		PFP_DOCTORQQN='<%= PFP_DOCTORQQN_T%>'
<%
			}

			if(! PFP_RESULTB_11_T.equals("")) {
%>
		 		PFP_RESULTB_11='<%= PFP_RESULTB_11_T%>'
<%
			}

			if(! PFP_RESULTR1_9_T.equals("")) {
%>
		 		PFP_RESULTR1_9='<%= PFP_RESULTR1_9_T%>'
<%
			}

			if(! PFP_RESULTR1_10_T.equals("")) {
%>
		 		PFP_RESULTR1_10='<%= PFP_RESULTR1_10_T%>'
<%
			}

			if(! EEA_COMP_NM_T.equals("")) {
%>
		 		EEA_COMP_NM='<%= EEA_COMP_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c259='<%= cnt%>'
				c260='<%= cnt%>'
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
