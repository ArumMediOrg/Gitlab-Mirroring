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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM ET_COMP_CNRT_CUST WHERE 0 = 1
		*/

		sql = " SELECT *";
		sql += " FROM ET_COMP_CNRT_CUST";
		sql += " WHERE 0 = 1";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_CUST_APPLY_UP_ExcelExport_001 \n";
			G_INFO += "설명 : 명단컬럼확인 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='ECT_COMP_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST' rs:basecolumn='ECT_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_MNGT_YR' rs:number='2' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST' rs:basecolumn='ECT_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_CNRT_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST' rs:basecolumn='ECT_CNRT_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_CUST_SQ' rs:number='4' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST' rs:basecolumn='ECT_CUST_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_CUST_NM' rs:number='5' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST' rs:basecolumn='ECT_CUST_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_SEX_CD' rs:number='6' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST' rs:basecolumn='ECT_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_BITH_DT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_BITH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_PENL_ID' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_MOBL_NO' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_TEL_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_EMAIL_AR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_ZIP_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_ZIP_SQ' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_ZIP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_ZIP_AR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_ROAD_AR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_BLDG_NO' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_BLDG_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_NHIS_YN' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_NHIS_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_NHIC_TX' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_NHIC_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_DEPT_NM' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_HALF_CD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_HALF_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_DEPT_CD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_EMPL_CD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_EMPL_CD'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_PROF_SQ' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_PROF_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_COTK_YN' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_COTK_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_PID_EN' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_PID_EN'>
			<s:datatype dt:type='string' dt:maxLength='1024'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_ADD_YN' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_ADD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_ENTRY_DT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_ENTRY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_JUIP_DT' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_JUIP_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_NCHR_HH' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_NCHR_HH'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_DIVI_CD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_DIVI_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_WORK_LT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_WORK_LT'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_GOJU_CD' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_GOJU_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_1GOJU_CD' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_1GOJU_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_1FROM_DT' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_1FROM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_1TO_DT' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_1TO_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_2GOJU_CD' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_2GOJU_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_2FROM_DT' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_2FROM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_2TO_DT' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_2TO_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_EXAM_DT' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_EXAM_SQ' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_CUST_NO' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_USE_YN' rs:number='42' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST' rs:basecolumn='ECT_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_NUSE_ID' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_NUSE_DTT' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_INPT_ID' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_INPT_DTT' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_MODI_ID' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_MODI_DTT' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_MEMO_TX' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_MEMO_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_RSVT_DT' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_RSVT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_RSVT_NO' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_RSVT_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_HLTH_KD' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECT_JIJO_CD' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
			 rs:basecolumn='ECT_JIJO_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='54' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_CUST'
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

			String ECT_COMP_CD_T = cRsList.getString("ECT_COMP_CD");
			String ECT_MNGT_YR_T = cRsList.getString("ECT_MNGT_YR");
			String ECT_CNRT_SQ_T = cRsList.getString("ECT_CNRT_SQ");
			String ECT_CUST_SQ_T = cRsList.getString("ECT_CUST_SQ");
			String ECT_CUST_NM_T = cRsList.getString("ECT_CUST_NM");
			String ECT_SEX_CD_T = cRsList.getString("ECT_SEX_CD");
			String ECT_BITH_DT_T = cRsList.getString("ECT_BITH_DT");
			String ECT_PENL_ID_T = cRsList.getString("ECT_PENL_ID");
			String ECT_MOBL_NO_T = cRsList.getString("ECT_MOBL_NO");
			String ECT_TEL_NO_T = cRsList.getString("ECT_TEL_NO");
			String ECT_EMAIL_AR_T = cRsList.getString("ECT_EMAIL_AR");
			String ECT_ZIP_CD_T = cRsList.getString("ECT_ZIP_CD");
			String ECT_ZIP_SQ_T = cRsList.getString("ECT_ZIP_SQ");
			String ECT_ZIP_AR_T = cRsList.getString("ECT_ZIP_AR");
			String ECT_ROAD_AR_T = cRsList.getString("ECT_ROAD_AR");
			String ECT_BLDG_NO_T = cRsList.getString("ECT_BLDG_NO");
			String ECT_NHIS_YN_T = cRsList.getString("ECT_NHIS_YN");
			String ECT_NHIC_TX_T = cRsList.getString("ECT_NHIC_TX");
			String ECT_DEPT_NM_T = cRsList.getString("ECT_DEPT_NM");
			String ECT_HALF_CD_T = cRsList.getString("ECT_HALF_CD");
			String ECT_DEPT_CD_T = cRsList.getString("ECT_DEPT_CD");
			String ECT_EMPL_CD_T = cRsList.getString("ECT_EMPL_CD");
			String ECT_PROF_SQ_T = cRsList.getString("ECT_PROF_SQ");
			String ECT_COTK_YN_T = cRsList.getString("ECT_COTK_YN");
			String ECT_PID_EN_T = cRsList.getString("ECT_PID_EN");
			String ECT_ADD_YN_T = cRsList.getString("ECT_ADD_YN");
			String ECT_ENTRY_DT_T = cRsList.getString("ECT_ENTRY_DT");
			String ECT_JUIP_DT_T = cRsList.getString("ECT_JUIP_DT");
			String ECT_NCHR_HH_T = cRsList.getString("ECT_NCHR_HH");
			String ECT_DIVI_CD_T = cRsList.getString("ECT_DIVI_CD");
			String ECT_WORK_LT_T = cRsList.getString("ECT_WORK_LT");
			String ECT_GOJU_CD_T = cRsList.getString("ECT_GOJU_CD");
			String ECT_1GOJU_CD_T = cRsList.getString("ECT_1GOJU_CD");
			String ECT_1FROM_DT_T = cRsList.getString("ECT_1FROM_DT");
			String ECT_1TO_DT_T = cRsList.getString("ECT_1TO_DT");
			String ECT_2GOJU_CD_T = cRsList.getString("ECT_2GOJU_CD");
			String ECT_2FROM_DT_T = cRsList.getString("ECT_2FROM_DT");
			String ECT_2TO_DT_T = cRsList.getString("ECT_2TO_DT");
			String ECT_EXAM_DT_T = cRsList.getString("ECT_EXAM_DT");
			String ECT_EXAM_SQ_T = cRsList.getString("ECT_EXAM_SQ");
			String ECT_CUST_NO_T = cRsList.getString("ECT_CUST_NO");
			String ECT_USE_YN_T = cRsList.getString("ECT_USE_YN");
			String ECT_NUSE_ID_T = cRsList.getString("ECT_NUSE_ID");
			String ECT_NUSE_DTT_T = cRsList.getDate2("ECT_NUSE_DTT");
			String ECT_INPT_ID_T = cRsList.getString("ECT_INPT_ID");
			String ECT_INPT_DTT_T = cRsList.getDate2("ECT_INPT_DTT");
			String ECT_MODI_ID_T = cRsList.getString("ECT_MODI_ID");
			String ECT_MODI_DTT_T = cRsList.getDate2("ECT_MODI_DTT");
			String ECT_MEMO_TX_T = cRsList.getString("ECT_MEMO_TX");
			String ECT_RSVT_DT_T = cRsList.getString("ECT_RSVT_DT");
			String ECT_RSVT_NO_T = cRsList.getString("ECT_RSVT_NO");
			String ECT_HLTH_KD_T = cRsList.getString("ECT_HLTH_KD");
			String ECT_JIJO_CD_T = cRsList.getString("ECT_JIJO_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECT_COMP_CD_T.equals("")) {
%>
		 		ECT_COMP_CD='<%= ECT_COMP_CD_T%>'
<%
			}

			if(! ECT_MNGT_YR_T.equals("")) {
%>
		 		ECT_MNGT_YR='<%= ECT_MNGT_YR_T%>'
<%
			}

			if(! ECT_CNRT_SQ_T.equals("")) {
%>
		 		ECT_CNRT_SQ='<%= ECT_CNRT_SQ_T%>'
<%
			}

			if(! ECT_CUST_SQ_T.equals("")) {
%>
		 		ECT_CUST_SQ='<%= ECT_CUST_SQ_T%>'
<%
			}

			if(! ECT_CUST_NM_T.equals("")) {
%>
		 		ECT_CUST_NM='<%= ECT_CUST_NM_T%>'
<%
			}

			if(! ECT_SEX_CD_T.equals("")) {
%>
		 		ECT_SEX_CD='<%= ECT_SEX_CD_T%>'
<%
			}

			if(! ECT_BITH_DT_T.equals("")) {
%>
		 		ECT_BITH_DT='<%= ECT_BITH_DT_T%>'
<%
			}

			if(! ECT_PENL_ID_T.equals("")) {
%>
		 		ECT_PENL_ID='<%= ECT_PENL_ID_T%>'
<%
			}

			if(! ECT_MOBL_NO_T.equals("")) {
%>
		 		ECT_MOBL_NO='<%= ECT_MOBL_NO_T%>'
<%
			}

			if(! ECT_TEL_NO_T.equals("")) {
%>
		 		ECT_TEL_NO='<%= ECT_TEL_NO_T%>'
<%
			}

			if(! ECT_EMAIL_AR_T.equals("")) {
%>
		 		ECT_EMAIL_AR='<%= ECT_EMAIL_AR_T%>'
<%
			}

			if(! ECT_ZIP_CD_T.equals("")) {
%>
		 		ECT_ZIP_CD='<%= ECT_ZIP_CD_T%>'
<%
			}

			if(! ECT_ZIP_SQ_T.equals("")) {
%>
		 		ECT_ZIP_SQ='<%= ECT_ZIP_SQ_T%>'
<%
			}

			if(! ECT_ZIP_AR_T.equals("")) {
%>
		 		ECT_ZIP_AR='<%= ECT_ZIP_AR_T%>'
<%
			}

			if(! ECT_ROAD_AR_T.equals("")) {
%>
		 		ECT_ROAD_AR='<%= ECT_ROAD_AR_T%>'
<%
			}

			if(! ECT_BLDG_NO_T.equals("")) {
%>
		 		ECT_BLDG_NO='<%= ECT_BLDG_NO_T%>'
<%
			}

			if(! ECT_NHIS_YN_T.equals("")) {
%>
		 		ECT_NHIS_YN='<%= ECT_NHIS_YN_T%>'
<%
			}

			if(! ECT_NHIC_TX_T.equals("")) {
%>
		 		ECT_NHIC_TX='<%= ECT_NHIC_TX_T%>'
<%
			}

			if(! ECT_DEPT_NM_T.equals("")) {
%>
		 		ECT_DEPT_NM='<%= ECT_DEPT_NM_T%>'
<%
			}

			if(! ECT_HALF_CD_T.equals("")) {
%>
		 		ECT_HALF_CD='<%= ECT_HALF_CD_T%>'
<%
			}

			if(! ECT_DEPT_CD_T.equals("")) {
%>
		 		ECT_DEPT_CD='<%= ECT_DEPT_CD_T%>'
<%
			}

			if(! ECT_EMPL_CD_T.equals("")) {
%>
		 		ECT_EMPL_CD='<%= ECT_EMPL_CD_T%>'
<%
			}

			if(! ECT_PROF_SQ_T.equals("")) {
%>
		 		ECT_PROF_SQ='<%= ECT_PROF_SQ_T%>'
<%
			}

			if(! ECT_COTK_YN_T.equals("")) {
%>
		 		ECT_COTK_YN='<%= ECT_COTK_YN_T%>'
<%
			}

			if(! ECT_PID_EN_T.equals("")) {
%>
		 		ECT_PID_EN='<%= ECT_PID_EN_T%>'
<%
			}

			if(! ECT_ADD_YN_T.equals("")) {
%>
		 		ECT_ADD_YN='<%= ECT_ADD_YN_T%>'
<%
			}

			if(! ECT_ENTRY_DT_T.equals("")) {
%>
		 		ECT_ENTRY_DT='<%= ECT_ENTRY_DT_T%>'
<%
			}

			if(! ECT_JUIP_DT_T.equals("")) {
%>
		 		ECT_JUIP_DT='<%= ECT_JUIP_DT_T%>'
<%
			}

			if(! ECT_NCHR_HH_T.equals("")) {
%>
		 		ECT_NCHR_HH='<%= ECT_NCHR_HH_T%>'
<%
			}

			if(! ECT_DIVI_CD_T.equals("")) {
%>
		 		ECT_DIVI_CD='<%= ECT_DIVI_CD_T%>'
<%
			}

			if(! ECT_WORK_LT_T.equals("")) {
%>
		 		ECT_WORK_LT='<%= ECT_WORK_LT_T%>'
<%
			}

			if(! ECT_GOJU_CD_T.equals("")) {
%>
		 		ECT_GOJU_CD='<%= ECT_GOJU_CD_T%>'
<%
			}

			if(! ECT_1GOJU_CD_T.equals("")) {
%>
		 		ECT_1GOJU_CD='<%= ECT_1GOJU_CD_T%>'
<%
			}

			if(! ECT_1FROM_DT_T.equals("")) {
%>
		 		ECT_1FROM_DT='<%= ECT_1FROM_DT_T%>'
<%
			}

			if(! ECT_1TO_DT_T.equals("")) {
%>
		 		ECT_1TO_DT='<%= ECT_1TO_DT_T%>'
<%
			}

			if(! ECT_2GOJU_CD_T.equals("")) {
%>
		 		ECT_2GOJU_CD='<%= ECT_2GOJU_CD_T%>'
<%
			}

			if(! ECT_2FROM_DT_T.equals("")) {
%>
		 		ECT_2FROM_DT='<%= ECT_2FROM_DT_T%>'
<%
			}

			if(! ECT_2TO_DT_T.equals("")) {
%>
		 		ECT_2TO_DT='<%= ECT_2TO_DT_T%>'
<%
			}

			if(! ECT_EXAM_DT_T.equals("")) {
%>
		 		ECT_EXAM_DT='<%= ECT_EXAM_DT_T%>'
<%
			}

			if(! ECT_EXAM_SQ_T.equals("")) {
%>
		 		ECT_EXAM_SQ='<%= ECT_EXAM_SQ_T%>'
<%
			}

			if(! ECT_CUST_NO_T.equals("")) {
%>
		 		ECT_CUST_NO='<%= ECT_CUST_NO_T%>'
<%
			}

			if(! ECT_USE_YN_T.equals("")) {
%>
		 		ECT_USE_YN='<%= ECT_USE_YN_T%>'
<%
			}

			if(! ECT_NUSE_ID_T.equals("")) {
%>
		 		ECT_NUSE_ID='<%= ECT_NUSE_ID_T%>'
<%
			}

			if(! ECT_NUSE_DTT_T.equals("")) {
%>
		 		ECT_NUSE_DTT='<%= ECT_NUSE_DTT_T%>'
<%
			}

			if(! ECT_INPT_ID_T.equals("")) {
%>
		 		ECT_INPT_ID='<%= ECT_INPT_ID_T%>'
<%
			}

			if(! ECT_INPT_DTT_T.equals("")) {
%>
		 		ECT_INPT_DTT='<%= ECT_INPT_DTT_T%>'
<%
			}

			if(! ECT_MODI_ID_T.equals("")) {
%>
		 		ECT_MODI_ID='<%= ECT_MODI_ID_T%>'
<%
			}

			if(! ECT_MODI_DTT_T.equals("")) {
%>
		 		ECT_MODI_DTT='<%= ECT_MODI_DTT_T%>'
<%
			}

			if(! ECT_MEMO_TX_T.equals("")) {
%>
		 		ECT_MEMO_TX='<%= ECT_MEMO_TX_T%>'
<%
			}

			if(! ECT_RSVT_DT_T.equals("")) {
%>
		 		ECT_RSVT_DT='<%= ECT_RSVT_DT_T%>'
<%
			}

			if(! ECT_RSVT_NO_T.equals("")) {
%>
		 		ECT_RSVT_NO='<%= ECT_RSVT_NO_T%>'
<%
			}

			if(! ECT_HLTH_KD_T.equals("")) {
%>
		 		ECT_HLTH_KD='<%= ECT_HLTH_KD_T%>'
<%
			}

			if(! ECT_JIJO_CD_T.equals("")) {
%>
		 		ECT_JIJO_CD='<%= ECT_JIJO_CD_T%>'
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
