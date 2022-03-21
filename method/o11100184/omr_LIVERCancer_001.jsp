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
FROM ET_CANCER_LIVER
WHERE ECL_EXAM_SQ = :EXAM_SQ
AND ECL_EXAM_DT = :EXAM_DT
		*/

		sql = " SELECT *";
		sql += " FROM ET_CANCER_LIVER";
		sql += " WHERE ECL_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND ECL_EXAM_DT = '" + EXAM_DT + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : omr_LIVERCancer_001 \n";
			G_INFO += "설명 : OMR 간암 기록지 조회 \n";
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
		<s:AttributeType name='ECL_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER' rs:basecolumn='ECL_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_CFRM_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_LVEX_DT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_LVEX_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_ALT_VL' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_ALT_VL'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBTP_KD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBTP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBRT_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBRT_VL' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBRT_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBVL_VL' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBVL_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HBPJ_KD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HBPJ_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCTP_KD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCTP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCRT_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCRT_VL' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCRT_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCVL_VL' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCVL_VL'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_HCPJ_KD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_HCPJ_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL1_KD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL2_KD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL3_KD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USPO_KD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USPO_KD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN1_KD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_KD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN3_KD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN3_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USETC_KD' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USETC_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USETC_EX' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPTP_KD' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPTP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPRT_CD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPRT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPRT_VL' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPRT_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPRT_UNIT' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPRT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_AFPVL_VL' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_AFPVL_VL'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_RSLT_KD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_ETC_EX' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_LICN_YN' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_LICN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_RSLT_EX' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_RPT_DT' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_CFRM_DT' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_CFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_LICEN_CD' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_INPUT_DTT' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_INPUT_ID' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_MODI_DTT' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_MODI_ID' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_1_KD' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_1_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_VL1' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_VL1'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_VL2' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_VL2'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USCN2_VL3' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USCN2_VL3'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USETC_EX2' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USETC_EX2'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_CKUP_LICEN_CD' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_CKUP_LICEN_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL4_KD' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL4_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL5_KD' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL5_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL6_KD' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL6_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECL_USRL7_KD' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
			 rs:basecolumn='ECL_USRL7_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='51' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_CANCER_LIVER'
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

			String ECL_EXAM_DT_T = cRsList.getString("ECL_EXAM_DT");
			String ECL_EXAM_SQ_T = cRsList.getString("ECL_EXAM_SQ");
			String ECL_CFRM_CD_T = cRsList.getString("ECL_CFRM_CD");
			String ECL_LVEX_DT_T = cRsList.getString("ECL_LVEX_DT");
			String ECL_ALT_VL_T = cRsList.getString("ECL_ALT_VL");
			String ECL_HBTP_KD_T = cRsList.getString("ECL_HBTP_KD");
			String ECL_HBRT_CD_T = cRsList.getString("ECL_HBRT_CD");
			String ECL_HBRT_VL_T = cRsList.getString("ECL_HBRT_VL");
			String ECL_HBVL_VL_T = cRsList.getString("ECL_HBVL_VL");
			String ECL_HBPJ_KD_T = cRsList.getString("ECL_HBPJ_KD");
			String ECL_HCTP_KD_T = cRsList.getString("ECL_HCTP_KD");
			String ECL_HCRT_CD_T = cRsList.getString("ECL_HCRT_CD");
			String ECL_HCRT_VL_T = cRsList.getString("ECL_HCRT_VL");
			String ECL_HCVL_VL_T = cRsList.getString("ECL_HCVL_VL");
			String ECL_HCPJ_KD_T = cRsList.getString("ECL_HCPJ_KD");
			String ECL_USRL1_KD_T = cRsList.getString("ECL_USRL1_KD");
			String ECL_USRL2_KD_T = cRsList.getString("ECL_USRL2_KD");
			String ECL_USRL3_KD_T = cRsList.getString("ECL_USRL3_KD");
			String ECL_USPO_KD_T = cRsList.getString("ECL_USPO_KD");
			String ECL_USCN1_KD_T = cRsList.getString("ECL_USCN1_KD");
			String ECL_USCN2_KD_T = cRsList.getString("ECL_USCN2_KD");
			String ECL_USCN3_KD_T = cRsList.getString("ECL_USCN3_KD");
			String ECL_USETC_KD_T = cRsList.getString("ECL_USETC_KD");
			String ECL_USETC_EX_T = cRsList.getString("ECL_USETC_EX");
			String ECL_AFPTP_KD_T = cRsList.getString("ECL_AFPTP_KD");
			String ECL_AFPRT_CD_T = cRsList.getString("ECL_AFPRT_CD");
			String ECL_AFPRT_VL_T = cRsList.getString("ECL_AFPRT_VL");
			String ECL_AFPRT_UNIT_T = cRsList.getString("ECL_AFPRT_UNIT");
			String ECL_AFPVL_VL_T = cRsList.getString("ECL_AFPVL_VL");
			String ECL_RSLT_KD_T = cRsList.getString("ECL_RSLT_KD");
			String ECL_ETC_EX_T = cRsList.getString("ECL_ETC_EX");
			String ECL_LICN_YN_T = cRsList.getString("ECL_LICN_YN");
			String ECL_RSLT_EX_T = cRsList.getString("ECL_RSLT_EX");
			String ECL_RPT_DT_T = cRsList.getString("ECL_RPT_DT");
			String ECL_CFRM_DT_T = cRsList.getString("ECL_CFRM_DT");
			String ECL_LICEN_CD_T = cRsList.getString("ECL_LICEN_CD");
			String ECL_INPUT_DTT_T = cRsList.getDate2("ECL_INPUT_DTT");
			String ECL_INPUT_ID_T = cRsList.getString("ECL_INPUT_ID");
			String ECL_MODI_DTT_T = cRsList.getDate2("ECL_MODI_DTT");
			String ECL_MODI_ID_T = cRsList.getString("ECL_MODI_ID");
			String ECL_USCN2_1_KD_T = cRsList.getString("ECL_USCN2_1_KD");
			String ECL_USCN2_VL1_T = cRsList.getString("ECL_USCN2_VL1");
			String ECL_USCN2_VL2_T = cRsList.getString("ECL_USCN2_VL2");
			String ECL_USCN2_VL3_T = cRsList.getString("ECL_USCN2_VL3");
			String ECL_USETC_EX2_T = cRsList.getString("ECL_USETC_EX2");
			String ECL_CKUP_LICEN_CD_T = cRsList.getString("ECL_CKUP_LICEN_CD");
			String ECL_USRL4_KD_T = cRsList.getString("ECL_USRL4_KD");
			String ECL_USRL5_KD_T = cRsList.getString("ECL_USRL5_KD");
			String ECL_USRL6_KD_T = cRsList.getString("ECL_USRL6_KD");
			String ECL_USRL7_KD_T = cRsList.getString("ECL_USRL7_KD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECL_EXAM_DT_T.equals("")) {
%>
		 		ECL_EXAM_DT='<%= ECL_EXAM_DT_T%>'
<%
			}

			if(! ECL_EXAM_SQ_T.equals("")) {
%>
		 		ECL_EXAM_SQ='<%= ECL_EXAM_SQ_T%>'
<%
			}

			if(! ECL_CFRM_CD_T.equals("")) {
%>
		 		ECL_CFRM_CD='<%= ECL_CFRM_CD_T%>'
<%
			}

			if(! ECL_LVEX_DT_T.equals("")) {
%>
		 		ECL_LVEX_DT='<%= ECL_LVEX_DT_T%>'
<%
			}

			if(! ECL_ALT_VL_T.equals("")) {
%>
		 		ECL_ALT_VL='<%= ECL_ALT_VL_T%>'
<%
			}

			if(! ECL_HBTP_KD_T.equals("")) {
%>
		 		ECL_HBTP_KD='<%= ECL_HBTP_KD_T%>'
<%
			}

			if(! ECL_HBRT_CD_T.equals("")) {
%>
		 		ECL_HBRT_CD='<%= ECL_HBRT_CD_T%>'
<%
			}

			if(! ECL_HBRT_VL_T.equals("")) {
%>
		 		ECL_HBRT_VL='<%= ECL_HBRT_VL_T%>'
<%
			}

			if(! ECL_HBVL_VL_T.equals("")) {
%>
		 		ECL_HBVL_VL='<%= ECL_HBVL_VL_T%>'
<%
			}

			if(! ECL_HBPJ_KD_T.equals("")) {
%>
		 		ECL_HBPJ_KD='<%= ECL_HBPJ_KD_T%>'
<%
			}

			if(! ECL_HCTP_KD_T.equals("")) {
%>
		 		ECL_HCTP_KD='<%= ECL_HCTP_KD_T%>'
<%
			}

			if(! ECL_HCRT_CD_T.equals("")) {
%>
		 		ECL_HCRT_CD='<%= ECL_HCRT_CD_T%>'
<%
			}

			if(! ECL_HCRT_VL_T.equals("")) {
%>
		 		ECL_HCRT_VL='<%= ECL_HCRT_VL_T%>'
<%
			}

			if(! ECL_HCVL_VL_T.equals("")) {
%>
		 		ECL_HCVL_VL='<%= ECL_HCVL_VL_T%>'
<%
			}

			if(! ECL_HCPJ_KD_T.equals("")) {
%>
		 		ECL_HCPJ_KD='<%= ECL_HCPJ_KD_T%>'
<%
			}

			if(! ECL_USRL1_KD_T.equals("")) {
%>
		 		ECL_USRL1_KD='<%= ECL_USRL1_KD_T%>'
<%
			}

			if(! ECL_USRL2_KD_T.equals("")) {
%>
		 		ECL_USRL2_KD='<%= ECL_USRL2_KD_T%>'
<%
			}

			if(! ECL_USRL3_KD_T.equals("")) {
%>
		 		ECL_USRL3_KD='<%= ECL_USRL3_KD_T%>'
<%
			}

			if(! ECL_USPO_KD_T.equals("")) {
%>
		 		ECL_USPO_KD='<%= ECL_USPO_KD_T%>'
<%
			}

			if(! ECL_USCN1_KD_T.equals("")) {
%>
		 		ECL_USCN1_KD='<%= ECL_USCN1_KD_T%>'
<%
			}

			if(! ECL_USCN2_KD_T.equals("")) {
%>
		 		ECL_USCN2_KD='<%= ECL_USCN2_KD_T%>'
<%
			}

			if(! ECL_USCN3_KD_T.equals("")) {
%>
		 		ECL_USCN3_KD='<%= ECL_USCN3_KD_T%>'
<%
			}

			if(! ECL_USETC_KD_T.equals("")) {
%>
		 		ECL_USETC_KD='<%= ECL_USETC_KD_T%>'
<%
			}

			if(! ECL_USETC_EX_T.equals("")) {
%>
		 		ECL_USETC_EX='<%= ECL_USETC_EX_T%>'
<%
			}

			if(! ECL_AFPTP_KD_T.equals("")) {
%>
		 		ECL_AFPTP_KD='<%= ECL_AFPTP_KD_T%>'
<%
			}

			if(! ECL_AFPRT_CD_T.equals("")) {
%>
		 		ECL_AFPRT_CD='<%= ECL_AFPRT_CD_T%>'
<%
			}

			if(! ECL_AFPRT_VL_T.equals("")) {
%>
		 		ECL_AFPRT_VL='<%= ECL_AFPRT_VL_T%>'
<%
			}

			if(! ECL_AFPRT_UNIT_T.equals("")) {
%>
		 		ECL_AFPRT_UNIT='<%= ECL_AFPRT_UNIT_T%>'
<%
			}

			if(! ECL_AFPVL_VL_T.equals("")) {
%>
		 		ECL_AFPVL_VL='<%= ECL_AFPVL_VL_T%>'
<%
			}

			if(! ECL_RSLT_KD_T.equals("")) {
%>
		 		ECL_RSLT_KD='<%= ECL_RSLT_KD_T%>'
<%
			}

			if(! ECL_ETC_EX_T.equals("")) {
%>
		 		ECL_ETC_EX='<%= ECL_ETC_EX_T%>'
<%
			}

			if(! ECL_LICN_YN_T.equals("")) {
%>
		 		ECL_LICN_YN='<%= ECL_LICN_YN_T%>'
<%
			}

			if(! ECL_RSLT_EX_T.equals("")) {
%>
		 		ECL_RSLT_EX='<%= ECL_RSLT_EX_T%>'
<%
			}

			if(! ECL_RPT_DT_T.equals("")) {
%>
		 		ECL_RPT_DT='<%= ECL_RPT_DT_T%>'
<%
			}

			if(! ECL_CFRM_DT_T.equals("")) {
%>
		 		ECL_CFRM_DT='<%= ECL_CFRM_DT_T%>'
<%
			}

			if(! ECL_LICEN_CD_T.equals("")) {
%>
		 		ECL_LICEN_CD='<%= ECL_LICEN_CD_T%>'
<%
			}

			if(! ECL_INPUT_DTT_T.equals("")) {
%>
		 		ECL_INPUT_DTT='<%= ECL_INPUT_DTT_T%>'
<%
			}

			if(! ECL_INPUT_ID_T.equals("")) {
%>
		 		ECL_INPUT_ID='<%= ECL_INPUT_ID_T%>'
<%
			}

			if(! ECL_MODI_DTT_T.equals("")) {
%>
		 		ECL_MODI_DTT='<%= ECL_MODI_DTT_T%>'
<%
			}

			if(! ECL_MODI_ID_T.equals("")) {
%>
		 		ECL_MODI_ID='<%= ECL_MODI_ID_T%>'
<%
			}

			if(! ECL_USCN2_1_KD_T.equals("")) {
%>
		 		ECL_USCN2_1_KD='<%= ECL_USCN2_1_KD_T%>'
<%
			}

			if(! ECL_USCN2_VL1_T.equals("")) {
%>
		 		ECL_USCN2_VL1='<%= ECL_USCN2_VL1_T%>'
<%
			}

			if(! ECL_USCN2_VL2_T.equals("")) {
%>
		 		ECL_USCN2_VL2='<%= ECL_USCN2_VL2_T%>'
<%
			}

			if(! ECL_USCN2_VL3_T.equals("")) {
%>
		 		ECL_USCN2_VL3='<%= ECL_USCN2_VL3_T%>'
<%
			}

			if(! ECL_USETC_EX2_T.equals("")) {
%>
		 		ECL_USETC_EX2='<%= ECL_USETC_EX2_T%>'
<%
			}

			if(! ECL_CKUP_LICEN_CD_T.equals("")) {
%>
		 		ECL_CKUP_LICEN_CD='<%= ECL_CKUP_LICEN_CD_T%>'
<%
			}

			if(! ECL_USRL4_KD_T.equals("")) {
%>
		 		ECL_USRL4_KD='<%= ECL_USRL4_KD_T%>'
<%
			}

			if(! ECL_USRL5_KD_T.equals("")) {
%>
		 		ECL_USRL5_KD='<%= ECL_USRL5_KD_T%>'
<%
			}

			if(! ECL_USRL6_KD_T.equals("")) {
%>
		 		ECL_USRL6_KD='<%= ECL_USRL6_KD_T%>'
<%
			}

			if(! ECL_USRL7_KD_T.equals("")) {
%>
		 		ECL_USRL7_KD='<%= ECL_USRL7_KD_T%>'
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
