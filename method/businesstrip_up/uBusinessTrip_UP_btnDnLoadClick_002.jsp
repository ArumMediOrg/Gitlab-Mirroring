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
from et_exam_acpt b join et_exam_item a
  on a.eei_exam_dt = b.eea_exam_dt
 and a.eei_exam_sq = b.eea_exam_sq
where b.eea_exam_dt = :exam_dt
  and b.eea_order_yn <> 'C'

if (:cbPlce_Cd1 = '0') then
  and b.eea_plce_cd like :cbPlce_Cd2||'%'
else
  and b.eea_plce_cd    = :cbPlce_Cd2

order by a.eei_exam_dt, a.eei_exam_sq, a.eei_order_dtt, a.eei_order_cd, a.eei_item_cd, a.eei_link_no
		*/

		sql = " SELECT A.*";
		sql += " FROM ET_EXAM_ACPT B JOIN ET_EXAM_ITEM A";
		sql += " ON A.EEI_EXAM_DT = B.EEA_EXAM_DT";
		sql += " AND A.EEI_EXAM_SQ = B.EEA_EXAM_SQ";
		sql += " WHERE B.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND B.EEA_ORDER_YN <> 'C'";

		if(CBPLCE_CD1.equals("0")) {
			sql += " AND B.EEA_PLCE_CD LIKE '" + CBPLCE_CD2 + "%'";
		}
		else {
			sql += " AND B.EEA_PLCE_CD = '" + CBPLCE_CD2 + "'";
		}

		sql += " ORDER BY A.EEI_EXAM_DT, A.EEI_EXAM_SQ, A.EEI_ORDER_DTT, A.EEI_ORDER_CD, A.EEI_ITEM_CD, A.EEI_LINK_NO";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBusinessTrip_UP_btnDnLoadClick_002 \n";
			G_INFO += "설명 : 검사항목정보 로딩 \n";
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
		<s:AttributeType name='EEI_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM' rs:basecolumn='EEI_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM' rs:basecolumn='EEI_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ORDER_DTT' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM' rs:basecolumn='EEI_ORDER_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ORDER_CD' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM' rs:basecolumn='EEI_ORDER_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ITEM_CD' rs:number='5' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM' rs:basecolumn='EEI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_LINK_NO' rs:number='6' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM' rs:basecolumn='EEI_LINK_NO'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_FST_KD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_FST_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_OPTN_KD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_OPTN_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ADD_KD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_ADD_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_PRGS_KD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_PRGS_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_HTSB_KD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_HTSB_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_CAN_KD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_CAN_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_SPSB_KD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_SPSB_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_CVSB_KD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_CVSB_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_EMSB_KD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_EMSB_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ETSB_KD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_ETSB_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ORG_PR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_ORG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_FST_PR' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_FST_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ADD_PR' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_ADD_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_PRGS_PR' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_PRGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_HTSB_PR' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_HTSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_CAN_PR' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_CAN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_SPSB_PR' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_SPSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_SPHT_PR' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_SPHT_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_SPFS_PR' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_SPFS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_CVSB_PR' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_CVSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_CVFS_PR' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_CVFS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_EMSB_PR' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_EMSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_EMFS_PR' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_EMFS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ETSB_PR' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_ETSB_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_ETFS_PR' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_ETFS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_INPT_ID' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_INPT_DTT' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_MODI_ID' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEI_MODI_DTT' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ITEM'
			 rs:basecolumn='EEI_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='36' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c36' rs:name='ROWID' rs:number='37' rs:rowid='true' rs:basetable='ET_EXAM_ITEM' rs:basecolumn='ROWID'
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

			String EEI_EXAM_DT_T = cRsList.getString("EEI_EXAM_DT");
			String EEI_EXAM_SQ_T = cRsList.getString("EEI_EXAM_SQ");
			String EEI_ORDER_DTT_T = cRsList.getDate2("EEI_ORDER_DTT");
			String EEI_ORDER_CD_T = cRsList.getString("EEI_ORDER_CD");
			String EEI_ITEM_CD_T = cRsList.getString("EEI_ITEM_CD");
			String EEI_LINK_NO_T = cRsList.getString("EEI_LINK_NO");
			String EEI_FST_KD_T = cRsList.getString("EEI_FST_KD");
			String EEI_OPTN_KD_T = cRsList.getString("EEI_OPTN_KD");
			String EEI_ADD_KD_T = cRsList.getString("EEI_ADD_KD");
			String EEI_PRGS_KD_T = cRsList.getString("EEI_PRGS_KD");
			String EEI_HTSB_KD_T = cRsList.getString("EEI_HTSB_KD");
			String EEI_CAN_KD_T = cRsList.getString("EEI_CAN_KD");
			String EEI_SPSB_KD_T = cRsList.getString("EEI_SPSB_KD");
			String EEI_CVSB_KD_T = cRsList.getString("EEI_CVSB_KD");
			String EEI_EMSB_KD_T = cRsList.getString("EEI_EMSB_KD");
			String EEI_ETSB_KD_T = cRsList.getString("EEI_ETSB_KD");
			String EEI_ORG_PR_T = cRsList.getString("EEI_ORG_PR");
			String EEI_FST_PR_T = cRsList.getString("EEI_FST_PR");
			String EEI_ADD_PR_T = cRsList.getString("EEI_ADD_PR");
			String EEI_PRGS_PR_T = cRsList.getString("EEI_PRGS_PR");
			String EEI_HTSB_PR_T = cRsList.getString("EEI_HTSB_PR");
			String EEI_CAN_PR_T = cRsList.getString("EEI_CAN_PR");
			String EEI_SPSB_PR_T = cRsList.getString("EEI_SPSB_PR");
			String EEI_SPHT_PR_T = cRsList.getString("EEI_SPHT_PR");
			String EEI_SPFS_PR_T = cRsList.getString("EEI_SPFS_PR");
			String EEI_CVSB_PR_T = cRsList.getString("EEI_CVSB_PR");
			String EEI_CVFS_PR_T = cRsList.getString("EEI_CVFS_PR");
			String EEI_EMSB_PR_T = cRsList.getString("EEI_EMSB_PR");
			String EEI_EMFS_PR_T = cRsList.getString("EEI_EMFS_PR");
			String EEI_ETSB_PR_T = cRsList.getString("EEI_ETSB_PR");
			String EEI_ETFS_PR_T = cRsList.getString("EEI_ETFS_PR");
			String EEI_INPT_ID_T = cRsList.getString("EEI_INPT_ID");
			String EEI_INPT_DTT_T = cRsList.getDate2("EEI_INPT_DTT");
			String EEI_MODI_ID_T = cRsList.getString("EEI_MODI_ID");
			String EEI_MODI_DTT_T = cRsList.getDate2("EEI_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
			String c36_T = cRsList.getString("c36");
%>
			<z:row
<%
			if(! EEI_EXAM_DT_T.equals("")) {
%>
		 		EEI_EXAM_DT='<%= EEI_EXAM_DT_T%>'
<%
			}

			if(! EEI_EXAM_SQ_T.equals("")) {
%>
		 		EEI_EXAM_SQ='<%= EEI_EXAM_SQ_T%>'
<%
			}

			if(! EEI_ORDER_DTT_T.equals("")) {
%>
		 		EEI_ORDER_DTT='<%= EEI_ORDER_DTT_T%>'
<%
			}

			if(! EEI_ORDER_CD_T.equals("")) {
%>
		 		EEI_ORDER_CD='<%= EEI_ORDER_CD_T%>'
<%
			}

			if(! EEI_ITEM_CD_T.equals("")) {
%>
		 		EEI_ITEM_CD='<%= EEI_ITEM_CD_T%>'
<%
			}

			if(! EEI_LINK_NO_T.equals("")) {
%>
		 		EEI_LINK_NO='<%= EEI_LINK_NO_T%>'
<%
			}

			if(! EEI_FST_KD_T.equals("")) {
%>
		 		EEI_FST_KD='<%= EEI_FST_KD_T%>'
<%
			}

			if(! EEI_OPTN_KD_T.equals("")) {
%>
		 		EEI_OPTN_KD='<%= EEI_OPTN_KD_T%>'
<%
			}

			if(! EEI_ADD_KD_T.equals("")) {
%>
		 		EEI_ADD_KD='<%= EEI_ADD_KD_T%>'
<%
			}

			if(! EEI_PRGS_KD_T.equals("")) {
%>
		 		EEI_PRGS_KD='<%= EEI_PRGS_KD_T%>'
<%
			}

			if(! EEI_HTSB_KD_T.equals("")) {
%>
		 		EEI_HTSB_KD='<%= EEI_HTSB_KD_T%>'
<%
			}

			if(! EEI_CAN_KD_T.equals("")) {
%>
		 		EEI_CAN_KD='<%= EEI_CAN_KD_T%>'
<%
			}

			if(! EEI_SPSB_KD_T.equals("")) {
%>
		 		EEI_SPSB_KD='<%= EEI_SPSB_KD_T%>'
<%
			}

			if(! EEI_CVSB_KD_T.equals("")) {
%>
		 		EEI_CVSB_KD='<%= EEI_CVSB_KD_T%>'
<%
			}

			if(! EEI_EMSB_KD_T.equals("")) {
%>
		 		EEI_EMSB_KD='<%= EEI_EMSB_KD_T%>'
<%
			}

			if(! EEI_ETSB_KD_T.equals("")) {
%>
		 		EEI_ETSB_KD='<%= EEI_ETSB_KD_T%>'
<%
			}

			if(! EEI_ORG_PR_T.equals("")) {
%>
		 		EEI_ORG_PR='<%= EEI_ORG_PR_T%>'
<%
			}

			if(! EEI_FST_PR_T.equals("")) {
%>
		 		EEI_FST_PR='<%= EEI_FST_PR_T%>'
<%
			}

			if(! EEI_ADD_PR_T.equals("")) {
%>
		 		EEI_ADD_PR='<%= EEI_ADD_PR_T%>'
<%
			}

			if(! EEI_PRGS_PR_T.equals("")) {
%>
		 		EEI_PRGS_PR='<%= EEI_PRGS_PR_T%>'
<%
			}

			if(! EEI_HTSB_PR_T.equals("")) {
%>
		 		EEI_HTSB_PR='<%= EEI_HTSB_PR_T%>'
<%
			}

			if(! EEI_CAN_PR_T.equals("")) {
%>
		 		EEI_CAN_PR='<%= EEI_CAN_PR_T%>'
<%
			}

			if(! EEI_SPSB_PR_T.equals("")) {
%>
		 		EEI_SPSB_PR='<%= EEI_SPSB_PR_T%>'
<%
			}

			if(! EEI_SPHT_PR_T.equals("")) {
%>
		 		EEI_SPHT_PR='<%= EEI_SPHT_PR_T%>'
<%
			}

			if(! EEI_SPFS_PR_T.equals("")) {
%>
		 		EEI_SPFS_PR='<%= EEI_SPFS_PR_T%>'
<%
			}

			if(! EEI_CVSB_PR_T.equals("")) {
%>
		 		EEI_CVSB_PR='<%= EEI_CVSB_PR_T%>'
<%
			}

			if(! EEI_CVFS_PR_T.equals("")) {
%>
		 		EEI_CVFS_PR='<%= EEI_CVFS_PR_T%>'
<%
			}

			if(! EEI_EMSB_PR_T.equals("")) {
%>
		 		EEI_EMSB_PR='<%= EEI_EMSB_PR_T%>'
<%
			}

			if(! EEI_EMFS_PR_T.equals("")) {
%>
		 		EEI_EMFS_PR='<%= EEI_EMFS_PR_T%>'
<%
			}

			if(! EEI_ETSB_PR_T.equals("")) {
%>
		 		EEI_ETSB_PR='<%= EEI_ETSB_PR_T%>'
<%
			}

			if(! EEI_ETFS_PR_T.equals("")) {
%>
		 		EEI_ETFS_PR='<%= EEI_ETFS_PR_T%>'
<%
			}

			if(! EEI_INPT_ID_T.equals("")) {
%>
		 		EEI_INPT_ID='<%= EEI_INPT_ID_T%>'
<%
			}

			if(! EEI_INPT_DTT_T.equals("")) {
%>
		 		EEI_INPT_DTT='<%= EEI_INPT_DTT_T%>'
<%
			}

			if(! EEI_MODI_ID_T.equals("")) {
%>
		 		EEI_MODI_ID='<%= EEI_MODI_ID_T%>'
<%
			}

			if(! EEI_MODI_DTT_T.equals("")) {
%>
		 		EEI_MODI_DTT='<%= EEI_MODI_DTT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c36='<%= cnt%>'
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
