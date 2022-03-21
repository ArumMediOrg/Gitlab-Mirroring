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

		String MNGT_YR = htMethod.get("MNGT_YR");
		String ESTI_CD = htMethod.get("ESTI_CD");
		String PROF_SQ = htMethod.get("PROF_SQ");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ESTI_CD == null) { ESTI_CD = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM BT_ESTI_PROF 
 WHERE BEP_MNGT_YR = :MNGT_YR 
   AND BEP_ESTI_CD = :ESTI_CD 
   AND BEP_PROF_SQ = :PROF_SQ 

		*/

		sql = " SELECT *";
		sql += " FROM BT_ESTI_PROF";
		sql += " WHERE BEP_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND BEP_ESTI_CD = '" + ESTI_CD + "'";
		sql += " AND BEP_PROF_SQ = '" + PROF_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTI_PROF_APPLY_FormShow_003 \n";
			G_INFO += "설명 : 검진유형관리 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ESTI_CD : " + ESTI_CD + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
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
		<s:AttributeType name='BEP_MNGT_YR' rs:number='1' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF' rs:basecolumn='BEP_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_ESTI_CD' rs:number='2' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF' rs:basecolumn='BEP_ESTI_CD'>
			<s:datatype dt:type='string' dt:maxLength='8' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_PROF_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF' rs:basecolumn='BEP_PROF_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_EXAM_CD' rs:number='4' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF' rs:basecolumn='BEP_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_PROF_NM' rs:number='5' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF' rs:basecolumn='BEP_PROF_NM'>
			<s:datatype dt:type='string' dt:maxLength='50' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_PROF_TL' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_PROF_TL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_SEX_CD' rs:number='7' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF' rs:basecolumn='BEP_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_HTSB_YN' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_HTSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_SPSB_YN' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_SPSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_CVSB_YN' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_CVSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_EMSB_YN' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_EMSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_ETSB_YN' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_ETSB_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_HTPR_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_HTPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_SPPR_CD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_SPPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_CVPR_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_CVPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_EMPR_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_EMPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_ETPR_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_ETPR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_CNCL_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_CNCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_PYER_CD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_PYER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_COMP_PR' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_COMP_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_PERS_PR' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_PERS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_CMPY_CD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_CMPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_PRPY_CD' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_PRPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_OPTN_YN' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_OPTN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_OPTN_CNT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_OPTN_CNT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_TOTL_PR' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_TOTL_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_PROF_PR' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_PROF_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_BIND_PR' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_BIND_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_OPTN_PR' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_OPTN_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_PROF_RT' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_PROF_RT'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_CUST_CNT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_CUST_CNT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_SALE_PR' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_SALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_PROF_TX' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_PROF_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_USE_YN' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_NUSE_ID' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_NUSE_DTT' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_INPT_ID' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_INPT_DTT' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_MODI_ID' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_MODI_DTT' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_TRNS_ID' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_TRNS_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='BEP_TRNS_DTT' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='BEP_TRNS_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='43' rs:rowid='true' rs:writeunknown='true' rs:basetable='BT_ESTI_PROF'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String BEP_MNGT_YR_T = cRsList.getString("BEP_MNGT_YR");
			String BEP_ESTI_CD_T = cRsList.getString("BEP_ESTI_CD");
			String BEP_PROF_SQ_T = cRsList.getString("BEP_PROF_SQ");
			String BEP_EXAM_CD_T = cRsList.getString("BEP_EXAM_CD");
			String BEP_PROF_NM_T = cRsList.getString("BEP_PROF_NM");
			String BEP_PROF_TL_T = cRsList.getString("BEP_PROF_TL");
			String BEP_SEX_CD_T = cRsList.getString("BEP_SEX_CD");
			String BEP_HTSB_YN_T = cRsList.getString("BEP_HTSB_YN");
			String BEP_SPSB_YN_T = cRsList.getString("BEP_SPSB_YN");
			String BEP_CVSB_YN_T = cRsList.getString("BEP_CVSB_YN");
			String BEP_EMSB_YN_T = cRsList.getString("BEP_EMSB_YN");
			String BEP_ETSB_YN_T = cRsList.getString("BEP_ETSB_YN");
			String BEP_HTPR_CD_T = cRsList.getString("BEP_HTPR_CD");
			String BEP_SPPR_CD_T = cRsList.getString("BEP_SPPR_CD");
			String BEP_CVPR_CD_T = cRsList.getString("BEP_CVPR_CD");
			String BEP_EMPR_CD_T = cRsList.getString("BEP_EMPR_CD");
			String BEP_ETPR_CD_T = cRsList.getString("BEP_ETPR_CD");
			String BEP_CNCL_CD_T = cRsList.getString("BEP_CNCL_CD");
			String BEP_PYER_CD_T = cRsList.getString("BEP_PYER_CD");
			String BEP_COMP_PR_T = cRsList.getString("BEP_COMP_PR");
			String BEP_PERS_PR_T = cRsList.getString("BEP_PERS_PR");
			String BEP_CMPY_CD_T = cRsList.getString("BEP_CMPY_CD");
			String BEP_PRPY_CD_T = cRsList.getString("BEP_PRPY_CD");
			String BEP_OPTN_YN_T = cRsList.getString("BEP_OPTN_YN");
			String BEP_OPTN_CNT_T = cRsList.getString("BEP_OPTN_CNT");
			String BEP_TOTL_PR_T = cRsList.getString("BEP_TOTL_PR");
			String BEP_PROF_PR_T = cRsList.getString("BEP_PROF_PR");
			String BEP_BIND_PR_T = cRsList.getString("BEP_BIND_PR");
			String BEP_OPTN_PR_T = cRsList.getString("BEP_OPTN_PR");
			String BEP_PROF_RT_T = cRsList.getString("BEP_PROF_RT");
			String BEP_CUST_CNT_T = cRsList.getString("BEP_CUST_CNT");
			String BEP_SALE_PR_T = cRsList.getString("BEP_SALE_PR");
			String BEP_PROF_TX_T = cRsList.getString("BEP_PROF_TX");
			String BEP_USE_YN_T = cRsList.getString("BEP_USE_YN");
			String BEP_NUSE_ID_T = cRsList.getString("BEP_NUSE_ID");
			String BEP_NUSE_DTT_T = cRsList.getDate2("BEP_NUSE_DTT");
			String BEP_INPT_ID_T = cRsList.getString("BEP_INPT_ID");
			String BEP_INPT_DTT_T = cRsList.getDate2("BEP_INPT_DTT");
			String BEP_MODI_ID_T = cRsList.getString("BEP_MODI_ID");
			String BEP_MODI_DTT_T = cRsList.getDate2("BEP_MODI_DTT");
			String BEP_TRNS_ID_T = cRsList.getString("BEP_TRNS_ID");
			String BEP_TRNS_DTT_T = cRsList.getDate2("BEP_TRNS_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! BEP_MNGT_YR_T.equals("")) {
%>
		 		BEP_MNGT_YR='<%= BEP_MNGT_YR_T%>'
<%
			}

			if(! BEP_ESTI_CD_T.equals("")) {
%>
		 		BEP_ESTI_CD='<%= BEP_ESTI_CD_T%>'
<%
			}

			if(! BEP_PROF_SQ_T.equals("")) {
%>
		 		BEP_PROF_SQ='<%= BEP_PROF_SQ_T%>'
<%
			}

			if(! BEP_EXAM_CD_T.equals("")) {
%>
		 		BEP_EXAM_CD='<%= BEP_EXAM_CD_T%>'
<%
			}

			if(! BEP_PROF_NM_T.equals("")) {
%>
		 		BEP_PROF_NM='<%= BEP_PROF_NM_T%>'
<%
			}

			if(! BEP_PROF_TL_T.equals("")) {
%>
		 		BEP_PROF_TL='<%= BEP_PROF_TL_T%>'
<%
			}

			if(! BEP_SEX_CD_T.equals("")) {
%>
		 		BEP_SEX_CD='<%= BEP_SEX_CD_T%>'
<%
			}

			if(! BEP_HTSB_YN_T.equals("")) {
%>
		 		BEP_HTSB_YN='<%= BEP_HTSB_YN_T%>'
<%
			}

			if(! BEP_SPSB_YN_T.equals("")) {
%>
		 		BEP_SPSB_YN='<%= BEP_SPSB_YN_T%>'
<%
			}

			if(! BEP_CVSB_YN_T.equals("")) {
%>
		 		BEP_CVSB_YN='<%= BEP_CVSB_YN_T%>'
<%
			}

			if(! BEP_EMSB_YN_T.equals("")) {
%>
		 		BEP_EMSB_YN='<%= BEP_EMSB_YN_T%>'
<%
			}

			if(! BEP_ETSB_YN_T.equals("")) {
%>
		 		BEP_ETSB_YN='<%= BEP_ETSB_YN_T%>'
<%
			}

			if(! BEP_HTPR_CD_T.equals("")) {
%>
		 		BEP_HTPR_CD='<%= BEP_HTPR_CD_T%>'
<%
			}

			if(! BEP_SPPR_CD_T.equals("")) {
%>
		 		BEP_SPPR_CD='<%= BEP_SPPR_CD_T%>'
<%
			}

			if(! BEP_CVPR_CD_T.equals("")) {
%>
		 		BEP_CVPR_CD='<%= BEP_CVPR_CD_T%>'
<%
			}

			if(! BEP_EMPR_CD_T.equals("")) {
%>
		 		BEP_EMPR_CD='<%= BEP_EMPR_CD_T%>'
<%
			}

			if(! BEP_ETPR_CD_T.equals("")) {
%>
		 		BEP_ETPR_CD='<%= BEP_ETPR_CD_T%>'
<%
			}

			if(! BEP_CNCL_CD_T.equals("")) {
%>
		 		BEP_CNCL_CD='<%= BEP_CNCL_CD_T%>'
<%
			}

			if(! BEP_PYER_CD_T.equals("")) {
%>
		 		BEP_PYER_CD='<%= BEP_PYER_CD_T%>'
<%
			}

			if(! BEP_COMP_PR_T.equals("")) {
%>
		 		BEP_COMP_PR='<%= BEP_COMP_PR_T%>'
<%
			}

			if(! BEP_PERS_PR_T.equals("")) {
%>
		 		BEP_PERS_PR='<%= BEP_PERS_PR_T%>'
<%
			}

			if(! BEP_CMPY_CD_T.equals("")) {
%>
		 		BEP_CMPY_CD='<%= BEP_CMPY_CD_T%>'
<%
			}

			if(! BEP_PRPY_CD_T.equals("")) {
%>
		 		BEP_PRPY_CD='<%= BEP_PRPY_CD_T%>'
<%
			}

			if(! BEP_OPTN_YN_T.equals("")) {
%>
		 		BEP_OPTN_YN='<%= BEP_OPTN_YN_T%>'
<%
			}

			if(! BEP_OPTN_CNT_T.equals("")) {
%>
		 		BEP_OPTN_CNT='<%= BEP_OPTN_CNT_T%>'
<%
			}

			if(! BEP_TOTL_PR_T.equals("")) {
%>
		 		BEP_TOTL_PR='<%= BEP_TOTL_PR_T%>'
<%
			}

			if(! BEP_PROF_PR_T.equals("")) {
%>
		 		BEP_PROF_PR='<%= BEP_PROF_PR_T%>'
<%
			}

			if(! BEP_BIND_PR_T.equals("")) {
%>
		 		BEP_BIND_PR='<%= BEP_BIND_PR_T%>'
<%
			}

			if(! BEP_OPTN_PR_T.equals("")) {
%>
		 		BEP_OPTN_PR='<%= BEP_OPTN_PR_T%>'
<%
			}

			if(! BEP_PROF_RT_T.equals("")) {
%>
		 		BEP_PROF_RT='<%= BEP_PROF_RT_T%>'
<%
			}

			if(! BEP_CUST_CNT_T.equals("")) {
%>
		 		BEP_CUST_CNT='<%= BEP_CUST_CNT_T%>'
<%
			}

			if(! BEP_SALE_PR_T.equals("")) {
%>
		 		BEP_SALE_PR='<%= BEP_SALE_PR_T%>'
<%
			}

			if(! BEP_PROF_TX_T.equals("")) {
%>
		 		BEP_PROF_TX='<%= BEP_PROF_TX_T%>'
<%
			}

			if(! BEP_USE_YN_T.equals("")) {
%>
		 		BEP_USE_YN='<%= BEP_USE_YN_T%>'
<%
			}

			if(! BEP_NUSE_ID_T.equals("")) {
%>
		 		BEP_NUSE_ID='<%= BEP_NUSE_ID_T%>'
<%
			}

			if(! BEP_NUSE_DTT_T.equals("")) {
%>
		 		BEP_NUSE_DTT='<%= BEP_NUSE_DTT_T%>'
<%
			}

			if(! BEP_INPT_ID_T.equals("")) {
%>
		 		BEP_INPT_ID='<%= BEP_INPT_ID_T%>'
<%
			}

			if(! BEP_INPT_DTT_T.equals("")) {
%>
		 		BEP_INPT_DTT='<%= BEP_INPT_DTT_T%>'
<%
			}

			if(! BEP_MODI_ID_T.equals("")) {
%>
		 		BEP_MODI_ID='<%= BEP_MODI_ID_T%>'
<%
			}

			if(! BEP_MODI_DTT_T.equals("")) {
%>
		 		BEP_MODI_DTT='<%= BEP_MODI_DTT_T%>'
<%
			}

			if(! BEP_TRNS_ID_T.equals("")) {
%>
		 		BEP_TRNS_ID='<%= BEP_TRNS_ID_T%>'
<%
			}

			if(! BEP_TRNS_DTT_T.equals("")) {
%>
		 		BEP_TRNS_DTT='<%= BEP_TRNS_DTT_T%>'
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
