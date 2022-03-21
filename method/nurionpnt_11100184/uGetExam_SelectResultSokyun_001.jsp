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

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 SELECT B.IAU_EMP_NO, B.IAU_PENL_NM, B.IAU_EPENL_NM, B.IAU_LICEN1_CD, B.IAU_LICEN1_NO, B.IAU_LICEN2_CD, B.IAU_LICEN2_NO, B.IAU_SIGN_IM, A.*  
                   FROM ST_SYTH_VIEW A LEFT OUTER JOIN IT_AUTH_USER B ON A.SSV_DOCTOR = B.IAU_EMP_NO                                                           
              WHERE A.SSV_EXAM_DT = :EXAM_DT
                AND A.SSV_EXAM_SQ = :EXAM_SQ                                                 
                   ORDER BY A.SSV_PACK_CD                                                                                                                      
		*/

		sql = " SELECT B.IAU_EMP_NO, B.IAU_PENL_NM, B.IAU_EPENL_NM, B.IAU_LICEN1_CD, B.IAU_LICEN1_NO, B.IAU_LICEN2_CD, B.IAU_LICEN2_NO, B.IAU_SIGN_IM, A.*";
		sql += " FROM ST_SYTH_VIEW A LEFT OUTER JOIN IT_AUTH_USER B";
		sql += " ON A.SSV_DOCTOR = B.IAU_EMP_NO";
		sql += " WHERE A.SSV_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.SSV_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " ORDER BY A.SSV_PACK_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGetExam_SelectResultSokyun_001 \n";
			G_INFO += "설명 : 소견 결과 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='IAU_EMP_NO' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_EPENL_NM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EPENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_SIGN_IM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_SIGN_IM'>
			<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_EXAM_DT' rs:number='9' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW' rs:basecolumn='SSV_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_EXAM_SQ' rs:number='10' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW' rs:basecolumn='SSV_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_PACK_CD' rs:number='11' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW' rs:basecolumn='SSV_PACK_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_CFRM_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_CLIC_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_CLIC_CD'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_CLIC_SQ' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_CLIC_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_EQUI_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_EQUI_CD'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_VIEW_EX' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_VIEW_EX'>
			<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_FINDING' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_FINDING'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_COMMT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_COMMT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_CLIC_FT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_CLIC_FT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_EQUI_FT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_EQUI_FT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_VIEW_FT' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_VIEW_FT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_MON_FT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_MON_FT'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_VIEWFIN_DT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_VIEWFIN_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_DOCTOR' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_DOCTOR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_EMAIL_DT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_EMAIL_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_SMS_DT' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_SMS_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_MON_VIEW' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_MON_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_INPT_ID' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_INPT_DTT' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_MODI_ID' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_MODI_DTT' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_RPT_DT' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_PRNT_DT' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_PRNT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_VIEW_RTF' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_VIEW_RTF'>
			<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_PANRET' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_PANRET'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_VIEW_EX2' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_VIEW_EX2'>
			<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_RSLT_INPUT' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_RSLT_INPUT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='38' rs:rowid='true' rs:basetable='ST_SYTH_VIEW' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c38' rs:name='ROWID' rs:number='39' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String IAU_EMP_NO_T = cRsList.getString("IAU_EMP_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_EPENL_NM_T = cRsList.getString("IAU_EPENL_NM");
			String IAU_LICEN1_CD_T = cRsList.getString("IAU_LICEN1_CD");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_LICEN2_CD_T = cRsList.getString("IAU_LICEN2_CD");
			String IAU_LICEN2_NO_T = cRsList.getString("IAU_LICEN2_NO");
			String IAU_SIGN_IM_T = cRsList.getString("IAU_SIGN_IM");
			String SSV_EXAM_DT_T = cRsList.getString("SSV_EXAM_DT");
			String SSV_EXAM_SQ_T = cRsList.getString("SSV_EXAM_SQ");
			String SSV_PACK_CD_T = cRsList.getString("SSV_PACK_CD");
			String SSV_CFRM_CD_T = cRsList.getString("SSV_CFRM_CD");
			String SSV_CLIC_CD_T = cRsList.getString("SSV_CLIC_CD");
			String SSV_CLIC_SQ_T = cRsList.getString("SSV_CLIC_SQ");
			String SSV_EQUI_CD_T = cRsList.getString("SSV_EQUI_CD");
			String SSV_VIEW_EX_T = cRsList.getString("SSV_VIEW_EX");
			String SSV_FINDING_T = cRsList.getString("SSV_FINDING");
			String SSV_COMMT_T = cRsList.getString("SSV_COMMT");
			String SSV_CLIC_FT_T = cRsList.getString("SSV_CLIC_FT");
			String SSV_EQUI_FT_T = cRsList.getString("SSV_EQUI_FT");
			String SSV_VIEW_FT_T = cRsList.getString("SSV_VIEW_FT");
			String SSV_MON_FT_T = cRsList.getString("SSV_MON_FT");
			String SSV_VIEWFIN_DT_T = cRsList.getString("SSV_VIEWFIN_DT");
			String SSV_DOCTOR_T = cRsList.getString("SSV_DOCTOR");
			String SSV_EMAIL_DT_T = cRsList.getString("SSV_EMAIL_DT");
			String SSV_SMS_DT_T = cRsList.getString("SSV_SMS_DT");
			String SSV_MON_VIEW_T = cRsList.getString("SSV_MON_VIEW");
			String SSV_INPT_ID_T = cRsList.getString("SSV_INPT_ID");
			String SSV_INPT_DTT_T = cRsList.getDate2("SSV_INPT_DTT");
			String SSV_MODI_ID_T = cRsList.getString("SSV_MODI_ID");
			String SSV_MODI_DTT_T = cRsList.getDate2("SSV_MODI_DTT");
			String SSV_RPT_DT_T = cRsList.getString("SSV_RPT_DT");
			String SSV_PRNT_DT_T = cRsList.getString("SSV_PRNT_DT");
			String SSV_VIEW_RTF_T = cRsList.getString("SSV_VIEW_RTF");
			String SSV_PANRET_T = cRsList.getString("SSV_PANRET");
			String SSV_VIEW_EX2_T = cRsList.getString("SSV_VIEW_EX2");
			String SSV_RSLT_INPUT_T = cRsList.getString("SSV_RSLT_INPUT");
			String ROWID_T = cRsList.getString("ROWID");
			String c38_T = cRsList.getString("c38");
%>
			<z:row
<%
			if(! IAU_EMP_NO_T.equals("")) {
%>
		 		IAU_EMP_NO='<%= IAU_EMP_NO_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! IAU_EPENL_NM_T.equals("")) {
%>
		 		IAU_EPENL_NM='<%= IAU_EPENL_NM_T%>'
<%
			}

			if(! IAU_LICEN1_CD_T.equals("")) {
%>
		 		IAU_LICEN1_CD='<%= IAU_LICEN1_CD_T%>'
<%
			}

			if(! IAU_LICEN1_NO_T.equals("")) {
%>
		 		IAU_LICEN1_NO='<%= IAU_LICEN1_NO_T%>'
<%
			}

			if(! IAU_LICEN2_CD_T.equals("")) {
%>
		 		IAU_LICEN2_CD='<%= IAU_LICEN2_CD_T%>'
<%
			}

			if(! IAU_LICEN2_NO_T.equals("")) {
%>
		 		IAU_LICEN2_NO='<%= IAU_LICEN2_NO_T%>'
<%
			}

			if(! IAU_SIGN_IM_T.equals("")) {
%>
		 		IAU_SIGN_IM='<%= IAU_SIGN_IM_T%>'
<%
			}

			if(! SSV_EXAM_DT_T.equals("")) {
%>
		 		SSV_EXAM_DT='<%= SSV_EXAM_DT_T%>'
<%
			}

			if(! SSV_EXAM_SQ_T.equals("")) {
%>
		 		SSV_EXAM_SQ='<%= SSV_EXAM_SQ_T%>'
<%
			}

			if(! SSV_PACK_CD_T.equals("")) {
%>
		 		SSV_PACK_CD='<%= SSV_PACK_CD_T%>'
<%
			}

			if(! SSV_CFRM_CD_T.equals("")) {
%>
		 		SSV_CFRM_CD='<%= SSV_CFRM_CD_T%>'
<%
			}

			if(! SSV_CLIC_CD_T.equals("")) {
%>
		 		SSV_CLIC_CD='<%= SSV_CLIC_CD_T%>'
<%
			}

			if(! SSV_CLIC_SQ_T.equals("")) {
%>
		 		SSV_CLIC_SQ='<%= SSV_CLIC_SQ_T%>'
<%
			}

			if(! SSV_EQUI_CD_T.equals("")) {
%>
		 		SSV_EQUI_CD='<%= SSV_EQUI_CD_T%>'
<%
			}

			if(! SSV_VIEW_EX_T.equals("")) {
%>
		 		SSV_VIEW_EX='<%= SSV_VIEW_EX_T%>'
<%
			}

			if(! SSV_FINDING_T.equals("")) {
%>
		 		SSV_FINDING='<%= SSV_FINDING_T%>'
<%
			}

			if(! SSV_COMMT_T.equals("")) {
%>
		 		SSV_COMMT='<%= SSV_COMMT_T%>'
<%
			}

			if(! SSV_CLIC_FT_T.equals("")) {
%>
		 		SSV_CLIC_FT='<%= SSV_CLIC_FT_T%>'
<%
			}

			if(! SSV_EQUI_FT_T.equals("")) {
%>
		 		SSV_EQUI_FT='<%= SSV_EQUI_FT_T%>'
<%
			}

			if(! SSV_VIEW_FT_T.equals("")) {
%>
		 		SSV_VIEW_FT='<%= SSV_VIEW_FT_T%>'
<%
			}

			if(! SSV_MON_FT_T.equals("")) {
%>
		 		SSV_MON_FT='<%= SSV_MON_FT_T%>'
<%
			}

			if(! SSV_VIEWFIN_DT_T.equals("")) {
%>
		 		SSV_VIEWFIN_DT='<%= SSV_VIEWFIN_DT_T%>'
<%
			}

			if(! SSV_DOCTOR_T.equals("")) {
%>
		 		SSV_DOCTOR='<%= SSV_DOCTOR_T%>'
<%
			}

			if(! SSV_EMAIL_DT_T.equals("")) {
%>
		 		SSV_EMAIL_DT='<%= SSV_EMAIL_DT_T%>'
<%
			}

			if(! SSV_SMS_DT_T.equals("")) {
%>
		 		SSV_SMS_DT='<%= SSV_SMS_DT_T%>'
<%
			}

			if(! SSV_MON_VIEW_T.equals("")) {
%>
		 		SSV_MON_VIEW='<%= SSV_MON_VIEW_T%>'
<%
			}

			if(! SSV_INPT_ID_T.equals("")) {
%>
		 		SSV_INPT_ID='<%= SSV_INPT_ID_T%>'
<%
			}

			if(! SSV_INPT_DTT_T.equals("")) {
%>
		 		SSV_INPT_DTT='<%= SSV_INPT_DTT_T%>'
<%
			}

			if(! SSV_MODI_ID_T.equals("")) {
%>
		 		SSV_MODI_ID='<%= SSV_MODI_ID_T%>'
<%
			}

			if(! SSV_MODI_DTT_T.equals("")) {
%>
		 		SSV_MODI_DTT='<%= SSV_MODI_DTT_T%>'
<%
			}

			if(! SSV_RPT_DT_T.equals("")) {
%>
		 		SSV_RPT_DT='<%= SSV_RPT_DT_T%>'
<%
			}

			if(! SSV_PRNT_DT_T.equals("")) {
%>
		 		SSV_PRNT_DT='<%= SSV_PRNT_DT_T%>'
<%
			}

			if(! SSV_VIEW_RTF_T.equals("")) {
%>
		 		SSV_VIEW_RTF='<%= SSV_VIEW_RTF_T%>'
<%
			}

			if(! SSV_PANRET_T.equals("")) {
%>
		 		SSV_PANRET='<%= SSV_PANRET_T%>'
<%
			}

			if(! SSV_VIEW_EX2_T.equals("")) {
%>
		 		SSV_VIEW_EX2='<%= SSV_VIEW_EX2_T%>'
<%
			}

			if(! SSV_RSLT_INPUT_T.equals("")) {
%>
		 		SSV_RSLT_INPUT='<%= SSV_RSLT_INPUT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c38_T.equals("")) {
%>
		 		c38='<%= c38_T%>'
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
