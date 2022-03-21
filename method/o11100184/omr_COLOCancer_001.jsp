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

		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String EXAM_DT = htMethod.get("EXAM_DT");

		//
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * 
FROM ET_CANCER_COLO 
WHERE ECC_EXAM_SQ = :EXAM_SQ
AND ECC_EXAM_DT = :EXAM_DT
		*/

		sql = " SELECT *";
		sql += " FROM ET_CANCER_COLO";
		sql += " WHERE ECC_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND ECC_EXAM_DT = '" + EXAM_DT + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : omr_COLOCancer_001 \n";
			G_INFO += "설명 : OMR 대장암 기록지 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
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
		<s:AttributeType name='ECC_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO' rs:basecolumn='ECC_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO' rs:basecolumn='ECC_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CFRM_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_OBEX_DT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_OBEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_OBTP_KD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_OBTP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_OBRT_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_OBRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_OBRT_VL' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_OBRT_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_OBVL_VL' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_OBVL_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIEX_DT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIEX_KD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT1_KD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT1S_KD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT1S_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT2_KD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT2S_KD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT2S_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT3_KD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT3S_KD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT3S_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIPL_VL' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIPL_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIETC_KD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_GIRT_EX' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_GIRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENEX_DT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT1_KD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT1S_KD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT1S_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT2_KD' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT2S_KD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT2S_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT3_KD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT3S_KD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT3S_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENPL_VL' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENPL_VL'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENPL_CT' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENPL_CT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENETC_KD' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENRT_EX' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BIEX_YN' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BIEX_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_FOCP_KD' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_FOCP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BIBF_KD' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BIBF_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BICT_KD' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BICT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BIRT_KD' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BIRT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BICNCR_KD' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BICNCR_KD'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BICNCR_EX' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BICNCR_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BIETC_KD' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BIETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_BIETC_EX' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_BIETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_RSLT_KD' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ETC_EX' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_STCN_YN' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_STCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_RSLT_EX' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_RPT_DT' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CFRM_DT' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_LICEN_CD' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_INPUT_DTT' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_INPUT_ID' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_MODI_DTT' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_MODI_ID' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENCE_KD' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENCE_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_ENJJ_KD' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_ENJJ_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_DECI_LICEN_CD' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_DECI_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_CKUP_LICEN_CD' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_CKUP_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_PATH_LICEN_CD' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_PATH_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECC_FOCP_ADD_KD' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
			 rs:basecolumn='ECC_FOCP_ADD_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='57' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_CANCER_COLO'
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

			String ECC_EXAM_DT_T = cRsList.getString("ECC_EXAM_DT");
			String ECC_EXAM_SQ_T = cRsList.getString("ECC_EXAM_SQ");
			String ECC_CFRM_CD_T = cRsList.getString("ECC_CFRM_CD");
			String ECC_OBEX_DT_T = cRsList.getString("ECC_OBEX_DT");
			String ECC_OBTP_KD_T = cRsList.getString("ECC_OBTP_KD");
			String ECC_OBRT_CD_T = cRsList.getString("ECC_OBRT_CD");
			String ECC_OBRT_VL_T = cRsList.getString("ECC_OBRT_VL");
			String ECC_OBVL_VL_T = cRsList.getString("ECC_OBVL_VL");
			String ECC_GIEX_DT_T = cRsList.getString("ECC_GIEX_DT");
			String ECC_GIEX_KD_T = cRsList.getString("ECC_GIEX_KD");
			String ECC_GIRT1_KD_T = cRsList.getString("ECC_GIRT1_KD");
			String ECC_GIRT1S_KD_T = cRsList.getString("ECC_GIRT1S_KD");
			String ECC_GIRT2_KD_T = cRsList.getString("ECC_GIRT2_KD");
			String ECC_GIRT2S_KD_T = cRsList.getString("ECC_GIRT2S_KD");
			String ECC_GIRT3_KD_T = cRsList.getString("ECC_GIRT3_KD");
			String ECC_GIRT3S_KD_T = cRsList.getString("ECC_GIRT3S_KD");
			String ECC_GIPL_VL_T = cRsList.getString("ECC_GIPL_VL");
			String ECC_GIETC_KD_T = cRsList.getString("ECC_GIETC_KD");
			String ECC_GIRT_EX_T = cRsList.getString("ECC_GIRT_EX");
			String ECC_ENEX_DT_T = cRsList.getString("ECC_ENEX_DT");
			String ECC_ENRT1_KD_T = cRsList.getString("ECC_ENRT1_KD");
			String ECC_ENRT1S_KD_T = cRsList.getString("ECC_ENRT1S_KD");
			String ECC_ENRT2_KD_T = cRsList.getString("ECC_ENRT2_KD");
			String ECC_ENRT2S_KD_T = cRsList.getString("ECC_ENRT2S_KD");
			String ECC_ENRT3_KD_T = cRsList.getString("ECC_ENRT3_KD");
			String ECC_ENRT3S_KD_T = cRsList.getString("ECC_ENRT3S_KD");
			String ECC_ENPL_VL_T = cRsList.getString("ECC_ENPL_VL");
			String ECC_ENPL_CT_T = cRsList.getString("ECC_ENPL_CT");
			String ECC_ENETC_KD_T = cRsList.getString("ECC_ENETC_KD");
			String ECC_ENRT_EX_T = cRsList.getString("ECC_ENRT_EX");
			String ECC_BIEX_YN_T = cRsList.getString("ECC_BIEX_YN");
			String ECC_FOCP_KD_T = cRsList.getString("ECC_FOCP_KD");
			String ECC_BIBF_KD_T = cRsList.getString("ECC_BIBF_KD");
			String ECC_BICT_KD_T = cRsList.getString("ECC_BICT_KD");
			String ECC_BIRT_KD_T = cRsList.getString("ECC_BIRT_KD");
			String ECC_BICNCR_KD_T = cRsList.getString("ECC_BICNCR_KD");
			String ECC_BICNCR_EX_T = cRsList.getString("ECC_BICNCR_EX");
			String ECC_BIETC_KD_T = cRsList.getString("ECC_BIETC_KD");
			String ECC_BIETC_EX_T = cRsList.getString("ECC_BIETC_EX");
			String ECC_RSLT_KD_T = cRsList.getString("ECC_RSLT_KD");
			String ECC_ETC_EX_T = cRsList.getString("ECC_ETC_EX");
			String ECC_STCN_YN_T = cRsList.getString("ECC_STCN_YN");
			String ECC_RSLT_EX_T = cRsList.getString("ECC_RSLT_EX");
			String ECC_RPT_DT_T = cRsList.getString("ECC_RPT_DT");
			String ECC_CFRM_DT_T = cRsList.getString("ECC_CFRM_DT");
			String ECC_LICEN_CD_T = cRsList.getString("ECC_LICEN_CD");
			String ECC_INPUT_DTT_T = cRsList.getDate2("ECC_INPUT_DTT");
			String ECC_INPUT_ID_T = cRsList.getString("ECC_INPUT_ID");
			String ECC_MODI_DTT_T = cRsList.getDate2("ECC_MODI_DTT");
			String ECC_MODI_ID_T = cRsList.getString("ECC_MODI_ID");
			String ECC_ENCE_KD_T = cRsList.getString("ECC_ENCE_KD");
			String ECC_ENJJ_KD_T = cRsList.getString("ECC_ENJJ_KD");
			String ECC_DECI_LICEN_CD_T = cRsList.getString("ECC_DECI_LICEN_CD");
			String ECC_CKUP_LICEN_CD_T = cRsList.getString("ECC_CKUP_LICEN_CD");
			String ECC_PATH_LICEN_CD_T = cRsList.getString("ECC_PATH_LICEN_CD");
			String ECC_FOCP_ADD_KD_T = cRsList.getString("ECC_FOCP_ADD_KD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECC_EXAM_DT_T.equals("")) {
%>
		 		ECC_EXAM_DT='<%= ECC_EXAM_DT_T%>'
<%
			}

			if(! ECC_EXAM_SQ_T.equals("")) {
%>
		 		ECC_EXAM_SQ='<%= ECC_EXAM_SQ_T%>'
<%
			}

			if(! ECC_CFRM_CD_T.equals("")) {
%>
		 		ECC_CFRM_CD='<%= ECC_CFRM_CD_T%>'
<%
			}

			if(! ECC_OBEX_DT_T.equals("")) {
%>
		 		ECC_OBEX_DT='<%= ECC_OBEX_DT_T%>'
<%
			}

			if(! ECC_OBTP_KD_T.equals("")) {
%>
		 		ECC_OBTP_KD='<%= ECC_OBTP_KD_T%>'
<%
			}

			if(! ECC_OBRT_CD_T.equals("")) {
%>
		 		ECC_OBRT_CD='<%= ECC_OBRT_CD_T%>'
<%
			}

			if(! ECC_OBRT_VL_T.equals("")) {
%>
		 		ECC_OBRT_VL='<%= ECC_OBRT_VL_T%>'
<%
			}

			if(! ECC_OBVL_VL_T.equals("")) {
%>
		 		ECC_OBVL_VL='<%= ECC_OBVL_VL_T%>'
<%
			}

			if(! ECC_GIEX_DT_T.equals("")) {
%>
		 		ECC_GIEX_DT='<%= ECC_GIEX_DT_T%>'
<%
			}

			if(! ECC_GIEX_KD_T.equals("")) {
%>
		 		ECC_GIEX_KD='<%= ECC_GIEX_KD_T%>'
<%
			}

			if(! ECC_GIRT1_KD_T.equals("")) {
%>
		 		ECC_GIRT1_KD='<%= ECC_GIRT1_KD_T%>'
<%
			}

			if(! ECC_GIRT1S_KD_T.equals("")) {
%>
		 		ECC_GIRT1S_KD='<%= ECC_GIRT1S_KD_T%>'
<%
			}

			if(! ECC_GIRT2_KD_T.equals("")) {
%>
		 		ECC_GIRT2_KD='<%= ECC_GIRT2_KD_T%>'
<%
			}

			if(! ECC_GIRT2S_KD_T.equals("")) {
%>
		 		ECC_GIRT2S_KD='<%= ECC_GIRT2S_KD_T%>'
<%
			}

			if(! ECC_GIRT3_KD_T.equals("")) {
%>
		 		ECC_GIRT3_KD='<%= ECC_GIRT3_KD_T%>'
<%
			}

			if(! ECC_GIRT3S_KD_T.equals("")) {
%>
		 		ECC_GIRT3S_KD='<%= ECC_GIRT3S_KD_T%>'
<%
			}

			if(! ECC_GIPL_VL_T.equals("")) {
%>
		 		ECC_GIPL_VL='<%= ECC_GIPL_VL_T%>'
<%
			}

			if(! ECC_GIETC_KD_T.equals("")) {
%>
		 		ECC_GIETC_KD='<%= ECC_GIETC_KD_T%>'
<%
			}

			if(! ECC_GIRT_EX_T.equals("")) {
%>
		 		ECC_GIRT_EX='<%= ECC_GIRT_EX_T%>'
<%
			}

			if(! ECC_ENEX_DT_T.equals("")) {
%>
		 		ECC_ENEX_DT='<%= ECC_ENEX_DT_T%>'
<%
			}

			if(! ECC_ENRT1_KD_T.equals("")) {
%>
		 		ECC_ENRT1_KD='<%= ECC_ENRT1_KD_T%>'
<%
			}

			if(! ECC_ENRT1S_KD_T.equals("")) {
%>
		 		ECC_ENRT1S_KD='<%= ECC_ENRT1S_KD_T%>'
<%
			}

			if(! ECC_ENRT2_KD_T.equals("")) {
%>
		 		ECC_ENRT2_KD='<%= ECC_ENRT2_KD_T%>'
<%
			}

			if(! ECC_ENRT2S_KD_T.equals("")) {
%>
		 		ECC_ENRT2S_KD='<%= ECC_ENRT2S_KD_T%>'
<%
			}

			if(! ECC_ENRT3_KD_T.equals("")) {
%>
		 		ECC_ENRT3_KD='<%= ECC_ENRT3_KD_T%>'
<%
			}

			if(! ECC_ENRT3S_KD_T.equals("")) {
%>
		 		ECC_ENRT3S_KD='<%= ECC_ENRT3S_KD_T%>'
<%
			}

			if(! ECC_ENPL_VL_T.equals("")) {
%>
		 		ECC_ENPL_VL='<%= ECC_ENPL_VL_T%>'
<%
			}

			if(! ECC_ENPL_CT_T.equals("")) {
%>
		 		ECC_ENPL_CT='<%= ECC_ENPL_CT_T%>'
<%
			}

			if(! ECC_ENETC_KD_T.equals("")) {
%>
		 		ECC_ENETC_KD='<%= ECC_ENETC_KD_T%>'
<%
			}

			if(! ECC_ENRT_EX_T.equals("")) {
%>
		 		ECC_ENRT_EX='<%= ECC_ENRT_EX_T%>'
<%
			}

			if(! ECC_BIEX_YN_T.equals("")) {
%>
		 		ECC_BIEX_YN='<%= ECC_BIEX_YN_T%>'
<%
			}

			if(! ECC_FOCP_KD_T.equals("")) {
%>
		 		ECC_FOCP_KD='<%= ECC_FOCP_KD_T%>'
<%
			}

			if(! ECC_BIBF_KD_T.equals("")) {
%>
		 		ECC_BIBF_KD='<%= ECC_BIBF_KD_T%>'
<%
			}

			if(! ECC_BICT_KD_T.equals("")) {
%>
		 		ECC_BICT_KD='<%= ECC_BICT_KD_T%>'
<%
			}

			if(! ECC_BIRT_KD_T.equals("")) {
%>
		 		ECC_BIRT_KD='<%= ECC_BIRT_KD_T%>'
<%
			}

			if(! ECC_BICNCR_KD_T.equals("")) {
%>
		 		ECC_BICNCR_KD='<%= ECC_BICNCR_KD_T%>'
<%
			}

			if(! ECC_BICNCR_EX_T.equals("")) {
%>
		 		ECC_BICNCR_EX='<%= ECC_BICNCR_EX_T%>'
<%
			}

			if(! ECC_BIETC_KD_T.equals("")) {
%>
		 		ECC_BIETC_KD='<%= ECC_BIETC_KD_T%>'
<%
			}

			if(! ECC_BIETC_EX_T.equals("")) {
%>
		 		ECC_BIETC_EX='<%= ECC_BIETC_EX_T%>'
<%
			}

			if(! ECC_RSLT_KD_T.equals("")) {
%>
		 		ECC_RSLT_KD='<%= ECC_RSLT_KD_T%>'
<%
			}

			if(! ECC_ETC_EX_T.equals("")) {
%>
		 		ECC_ETC_EX='<%= ECC_ETC_EX_T%>'
<%
			}

			if(! ECC_STCN_YN_T.equals("")) {
%>
		 		ECC_STCN_YN='<%= ECC_STCN_YN_T%>'
<%
			}

			if(! ECC_RSLT_EX_T.equals("")) {
%>
		 		ECC_RSLT_EX='<%= ECC_RSLT_EX_T%>'
<%
			}

			if(! ECC_RPT_DT_T.equals("")) {
%>
		 		ECC_RPT_DT='<%= ECC_RPT_DT_T%>'
<%
			}

			if(! ECC_CFRM_DT_T.equals("")) {
%>
		 		ECC_CFRM_DT='<%= ECC_CFRM_DT_T%>'
<%
			}

			if(! ECC_LICEN_CD_T.equals("")) {
%>
		 		ECC_LICEN_CD='<%= ECC_LICEN_CD_T%>'
<%
			}

			if(! ECC_INPUT_DTT_T.equals("")) {
%>
		 		ECC_INPUT_DTT='<%= ECC_INPUT_DTT_T%>'
<%
			}

			if(! ECC_INPUT_ID_T.equals("")) {
%>
		 		ECC_INPUT_ID='<%= ECC_INPUT_ID_T%>'
<%
			}

			if(! ECC_MODI_DTT_T.equals("")) {
%>
		 		ECC_MODI_DTT='<%= ECC_MODI_DTT_T%>'
<%
			}

			if(! ECC_MODI_ID_T.equals("")) {
%>
		 		ECC_MODI_ID='<%= ECC_MODI_ID_T%>'
<%
			}

			if(! ECC_ENCE_KD_T.equals("")) {
%>
		 		ECC_ENCE_KD='<%= ECC_ENCE_KD_T%>'
<%
			}

			if(! ECC_ENJJ_KD_T.equals("")) {
%>
		 		ECC_ENJJ_KD='<%= ECC_ENJJ_KD_T%>'
<%
			}

			if(! ECC_DECI_LICEN_CD_T.equals("")) {
%>
		 		ECC_DECI_LICEN_CD='<%= ECC_DECI_LICEN_CD_T%>'
<%
			}

			if(! ECC_CKUP_LICEN_CD_T.equals("")) {
%>
		 		ECC_CKUP_LICEN_CD='<%= ECC_CKUP_LICEN_CD_T%>'
<%
			}

			if(! ECC_PATH_LICEN_CD_T.equals("")) {
%>
		 		ECC_PATH_LICEN_CD='<%= ECC_PATH_LICEN_CD_T%>'
<%
			}

			if(! ECC_FOCP_ADD_KD_T.equals("")) {
%>
		 		ECC_FOCP_ADD_KD='<%= ECC_FOCP_ADD_KD_T%>'
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
