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
		String CBPLCE_CD1 = htMethod.get("CBPLCE_CD1");
		String CBPLCE_CD2 = htMethod.get("CBPLCE_CD2");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(CBPLCE_CD1 == null) { CBPLCE_CD1 = ""; }
		if(CBPLCE_CD2 == null) { CBPLCE_CD2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select distinct a.*
from et_exam_acpt b join it_customer a
  on a.icr_cust_no = b.eea_cust_no
where b.eea_exam_dt = :exam_dt
  and b.eea_order_yn <> 'C'

if (:cbPlce_Cd1 = '0') then
  and b.eea_plce_cd like :cbPlce_Cd2||'%'
else
  and b.eea_plce_cd    = :cbPlce_Cd2

order by a.icr_cust_no

		*/

		sql = " SELECT DISTINCT A.*";
		sql += " FROM ET_EXAM_ACPT B JOIN IT_CUSTOMER A";
		sql += " ON A.ICR_CUST_NO = B.EEA_CUST_NO";
		sql += " WHERE B.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND B.EEA_ORDER_YN <> 'C'";

		if(CBPLCE_CD1.equals("0")) {
			sql += " AND B.EEA_PLCE_CD LIKE '" + CBPLCE_CD2 + "%'";
		}
		else {
			sql += " AND B.EEA_PLCE_CD = '" + CBPLCE_CD2 + "'";
		}

		sql += " ORDER BY A.ICR_CUST_NO";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBusinessTrip_UP_btnDnLoadClick_005 \n";
			G_INFO += "설명 : 고객정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " CBPLCE_CD1 : " + CBPLCE_CD1 + " \n";
			G_INFO += " CBPLCE_CD2 : " + CBPLCE_CD2 + " \n";
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
		<s:AttributeType name='ICR_CUST_NO' rs:number='1' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_CUST_NO' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='2' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_SQ' rs:number='3' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_NM' rs:number='4' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MANA_KD' rs:number='5' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_MANA_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CUST_KD' rs:number='6' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_CUST_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NTNA_CD' rs:number='7' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_NTNA_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CHART_NO' rs:number='8' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_KD' rs:number='9' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_SEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_COMP_CD' rs:number='10' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ENTR_DT' rs:number='11' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_ENTR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_KD' rs:number='12' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_BIRH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='13' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MARY_KD' rs:number='14' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_MARY_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MARY_DT' rs:number='15' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_MARY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_TEL_NO' rs:number='16' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO' rs:number='17' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_EMAI_AR' rs:number='18' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_EMAI_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ADDR_KD' rs:number='19' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_ADDR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_CD' rs:number='20' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_SQ' rs:number='21' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_ZIP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_AR' rs:number='22' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_LOTT_AR' rs:number='23' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_LOTT_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ROAD_AR' rs:number='24' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BLDG_NO' rs:number='25' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_BLDG_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PARE_NM' rs:number='26' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PARE_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PARE_NO' rs:number='27' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PARE_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INFO_YN' rs:number='28' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_INFO_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_RECV_YN' rs:number='29' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_RECV_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CUST_TX' rs:number='30' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_CUST_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_NM' rs:number='31' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_DIVI_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_CS' rs:number='32' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_DIVI_CS'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_KD' rs:number='33' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_DIVI_KD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CLSS_KD' rs:number='34' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_CLSS_KD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVI_NO' rs:number='35' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PID_EN' rs:number='36' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PID_EN'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_USE_YN' rs:number='37' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NUSE_ID' rs:number='38' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NUSE_DTT' rs:number='39' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INPT_ID' rs:number='40' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INPT_DTT' rs:number='41' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MODI_ID' rs:number='42' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MODI_DTT' rs:number='43' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_NOTE_YN' rs:number='44' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_NOTE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_CPENL_NM' rs:number='45' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_CPENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_INFORE_YN' rs:number='46' rs:nullable='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_INFORE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

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
%>
			<z:row
<%
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
