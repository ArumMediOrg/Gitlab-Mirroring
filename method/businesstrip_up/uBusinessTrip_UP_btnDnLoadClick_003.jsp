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

select a.*
from et_exam_acpt b join et_exam_price a
  on a.eep_exam_dt = b.eea_exam_dt
 and a.eep_exam_sq = b.eea_exam_sq
where b.eea_exam_dt = :exam_dt
  and b.eea_order_yn <> 'C'

if (:cbPlce_Cd1 = '0') then
  and b.eea_plce_cd like cbPlce_Cd2||'%'
else
  and b.eea_plce_cd    = cbPlce_Cd2

order by a.eep_exam_dt, a.eep_exam_sq, a.eep_order_sq

		*/

		sql = " SELECT A.*";
		sql += " FROM ET_EXAM_ACPT B JOIN ET_EXAM_PRICE A";
		sql += " ON A.EEP_EXAM_DT = B.EEA_EXAM_DT";
		sql += " AND A.EEP_EXAM_SQ = B.EEA_EXAM_SQ";
		sql += " WHERE B.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND B.EEA_ORDER_YN <> 'C'";

		if(CBPLCE_CD1.equals("0")) {
			sql += " AND B.EEA_PLCE_CD LIKE '" + CBPLCE_CD2 + "%'";
		}
		else {
			sql += " AND B.EEA_PLCE_CD = '" + CBPLCE_CD2 + "'";
		}

		sql += " ORDER BY A.EEP_EXAM_DT, A.EEP_EXAM_SQ, A.EEP_ORDER_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBusinessTrip_UP_btnDnLoadClick_003 \n";
			G_INFO += "설명 : 수가정보 로딩 \n";
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
		<s:AttributeType name='EEP_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE' rs:basecolumn='EEP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE' rs:basecolumn='EEP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_ORDER_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE' rs:basecolumn='EEP_ORDER_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_ORDER_DT' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE' rs:basecolumn='EEP_ORDER_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_ORDER_CD' rs:number='5' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE' rs:basecolumn='EEP_ORDER_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_CUST_NO' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_COMP_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_FST_PR' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_FST_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_ADD_PR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_ADD_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_PRGS_PR' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_PRGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_HTSB_PR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_HTSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_CAN_PR' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_CAN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_SPSB_PR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_SPSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_CVSB_PR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_CVSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_EMSB_PR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_EMSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_ETSB_PR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_ETSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_EXAM_PR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_EXAM_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_HDMD_PR' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_HDMD_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_SDMD_PR' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_SDMD_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_COMP_PR' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_COMP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_COMPS_PR' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_COMPS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_PSNL_PR' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_PSNL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_PSNLP_PR' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_PSNLP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_DMD_PR' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_DMD_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_HDMD_DT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_HDMD_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_SDMD_DT' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_SDMD_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_CDMD_DT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_CDMD_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_CDMDS_DT' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_CDMDS_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_PSNLP_DT' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_PSNLP_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_INPT_ID' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_INPT_DTT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_PRICE'
			 rs:basecolumn='EEP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='32' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c32' rs:name='ROWID' rs:number='33' rs:rowid='true' rs:basetable='ET_EXAM_PRICE' rs:basecolumn='ROWID'
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

			String EEP_EXAM_DT_T = cRsList.getString("EEP_EXAM_DT");
			String EEP_EXAM_SQ_T = cRsList.getString("EEP_EXAM_SQ");
			String EEP_ORDER_SQ_T = cRsList.getString("EEP_ORDER_SQ");
			String EEP_ORDER_DT_T = cRsList.getString("EEP_ORDER_DT");
			String EEP_ORDER_CD_T = cRsList.getString("EEP_ORDER_CD");
			String EEP_CUST_NO_T = cRsList.getString("EEP_CUST_NO");
			String EEP_COMP_CD_T = cRsList.getString("EEP_COMP_CD");
			String EEP_FST_PR_T = cRsList.getString("EEP_FST_PR");
			String EEP_ADD_PR_T = cRsList.getString("EEP_ADD_PR");
			String EEP_PRGS_PR_T = cRsList.getString("EEP_PRGS_PR");
			String EEP_HTSB_PR_T = cRsList.getString("EEP_HTSB_PR");
			String EEP_CAN_PR_T = cRsList.getString("EEP_CAN_PR");
			String EEP_SPSB_PR_T = cRsList.getString("EEP_SPSB_PR");
			String EEP_CVSB_PR_T = cRsList.getString("EEP_CVSB_PR");
			String EEP_EMSB_PR_T = cRsList.getString("EEP_EMSB_PR");
			String EEP_ETSB_PR_T = cRsList.getString("EEP_ETSB_PR");
			String EEP_EXAM_PR_T = cRsList.getString("EEP_EXAM_PR");
			String EEP_HDMD_PR_T = cRsList.getString("EEP_HDMD_PR");
			String EEP_SDMD_PR_T = cRsList.getString("EEP_SDMD_PR");
			String EEP_COMP_PR_T = cRsList.getString("EEP_COMP_PR");
			String EEP_COMPS_PR_T = cRsList.getString("EEP_COMPS_PR");
			String EEP_PSNL_PR_T = cRsList.getString("EEP_PSNL_PR");
			String EEP_PSNLP_PR_T = cRsList.getString("EEP_PSNLP_PR");
			String EEP_DMD_PR_T = cRsList.getString("EEP_DMD_PR");
			String EEP_HDMD_DT_T = cRsList.getString("EEP_HDMD_DT");
			String EEP_SDMD_DT_T = cRsList.getString("EEP_SDMD_DT");
			String EEP_CDMD_DT_T = cRsList.getString("EEP_CDMD_DT");
			String EEP_CDMDS_DT_T = cRsList.getString("EEP_CDMDS_DT");
			String EEP_PSNLP_DT_T = cRsList.getString("EEP_PSNLP_DT");
			String EEP_INPT_ID_T = cRsList.getString("EEP_INPT_ID");
			String EEP_INPT_DTT_T = cRsList.getDate2("EEP_INPT_DTT");
			String ROWID_T = cRsList.getString("ROWID");
			String c32_T = cRsList.getString("c32");
%>
			<z:row
<%
			if(! EEP_EXAM_DT_T.equals("")) {
%>
		 		EEP_EXAM_DT='<%= EEP_EXAM_DT_T%>'
<%
			}

			if(! EEP_EXAM_SQ_T.equals("")) {
%>
		 		EEP_EXAM_SQ='<%= EEP_EXAM_SQ_T%>'
<%
			}

			if(! EEP_ORDER_SQ_T.equals("")) {
%>
		 		EEP_ORDER_SQ='<%= EEP_ORDER_SQ_T%>'
<%
			}

			if(! EEP_ORDER_DT_T.equals("")) {
%>
		 		EEP_ORDER_DT='<%= EEP_ORDER_DT_T%>'
<%
			}

			if(! EEP_ORDER_CD_T.equals("")) {
%>
		 		EEP_ORDER_CD='<%= EEP_ORDER_CD_T%>'
<%
			}

			if(! EEP_CUST_NO_T.equals("")) {
%>
		 		EEP_CUST_NO='<%= EEP_CUST_NO_T%>'
<%
			}

			if(! EEP_COMP_CD_T.equals("")) {
%>
		 		EEP_COMP_CD='<%= EEP_COMP_CD_T%>'
<%
			}

			if(! EEP_FST_PR_T.equals("")) {
%>
		 		EEP_FST_PR='<%= EEP_FST_PR_T%>'
<%
			}

			if(! EEP_ADD_PR_T.equals("")) {
%>
		 		EEP_ADD_PR='<%= EEP_ADD_PR_T%>'
<%
			}

			if(! EEP_PRGS_PR_T.equals("")) {
%>
		 		EEP_PRGS_PR='<%= EEP_PRGS_PR_T%>'
<%
			}

			if(! EEP_HTSB_PR_T.equals("")) {
%>
		 		EEP_HTSB_PR='<%= EEP_HTSB_PR_T%>'
<%
			}

			if(! EEP_CAN_PR_T.equals("")) {
%>
		 		EEP_CAN_PR='<%= EEP_CAN_PR_T%>'
<%
			}

			if(! EEP_SPSB_PR_T.equals("")) {
%>
		 		EEP_SPSB_PR='<%= EEP_SPSB_PR_T%>'
<%
			}

			if(! EEP_CVSB_PR_T.equals("")) {
%>
		 		EEP_CVSB_PR='<%= EEP_CVSB_PR_T%>'
<%
			}

			if(! EEP_EMSB_PR_T.equals("")) {
%>
		 		EEP_EMSB_PR='<%= EEP_EMSB_PR_T%>'
<%
			}

			if(! EEP_ETSB_PR_T.equals("")) {
%>
		 		EEP_ETSB_PR='<%= EEP_ETSB_PR_T%>'
<%
			}

			if(! EEP_EXAM_PR_T.equals("")) {
%>
		 		EEP_EXAM_PR='<%= EEP_EXAM_PR_T%>'
<%
			}

			if(! EEP_HDMD_PR_T.equals("")) {
%>
		 		EEP_HDMD_PR='<%= EEP_HDMD_PR_T%>'
<%
			}

			if(! EEP_SDMD_PR_T.equals("")) {
%>
		 		EEP_SDMD_PR='<%= EEP_SDMD_PR_T%>'
<%
			}

			if(! EEP_COMP_PR_T.equals("")) {
%>
		 		EEP_COMP_PR='<%= EEP_COMP_PR_T%>'
<%
			}

			if(! EEP_COMPS_PR_T.equals("")) {
%>
		 		EEP_COMPS_PR='<%= EEP_COMPS_PR_T%>'
<%
			}

			if(! EEP_PSNL_PR_T.equals("")) {
%>
		 		EEP_PSNL_PR='<%= EEP_PSNL_PR_T%>'
<%
			}

			if(! EEP_PSNLP_PR_T.equals("")) {
%>
		 		EEP_PSNLP_PR='<%= EEP_PSNLP_PR_T%>'
<%
			}

			if(! EEP_DMD_PR_T.equals("")) {
%>
		 		EEP_DMD_PR='<%= EEP_DMD_PR_T%>'
<%
			}

			if(! EEP_HDMD_DT_T.equals("")) {
%>
		 		EEP_HDMD_DT='<%= EEP_HDMD_DT_T%>'
<%
			}

			if(! EEP_SDMD_DT_T.equals("")) {
%>
		 		EEP_SDMD_DT='<%= EEP_SDMD_DT_T%>'
<%
			}

			if(! EEP_CDMD_DT_T.equals("")) {
%>
		 		EEP_CDMD_DT='<%= EEP_CDMD_DT_T%>'
<%
			}

			if(! EEP_CDMDS_DT_T.equals("")) {
%>
		 		EEP_CDMDS_DT='<%= EEP_CDMDS_DT_T%>'
<%
			}

			if(! EEP_PSNLP_DT_T.equals("")) {
%>
		 		EEP_PSNLP_DT='<%= EEP_PSNLP_DT_T%>'
<%
			}

			if(! EEP_INPT_ID_T.equals("")) {
%>
		 		EEP_INPT_ID='<%= EEP_INPT_ID_T%>'
<%
			}

			if(! EEP_INPT_DTT_T.equals("")) {
%>
		 		EEP_INPT_DTT='<%= EEP_INPT_DTT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c32='<%= cnt%>'
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
