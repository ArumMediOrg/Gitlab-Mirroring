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

SELECT A.SSV_VIEW_EX, A.SSV_DOCTOR, B.IAU_PENL_NM, A.SSV_RPT_DT, A.*             
FROM ST_SYTH_VIEW A                                                            
       LEFT OUTER JOIN IT_AUTH_USER B ON B.IAU_EMP_NO = A.SSV_DOCTOR             
WHERE A.SSV_EXAM_DT = :EXAM_DT
   AND A.SSV_EXAM_SQ = :EXAM_SQ
   AND A.SSV_VIEW_EX IS NOT NULL    
		*/

		sql = " SELECT A.SSV_VIEW_EX, A.SSV_DOCTOR, B.IAU_PENL_NM, A.SSV_RPT_DT, A.*";
		sql += " FROM ST_SYTH_VIEW A LEFT OUTER JOIN IT_AUTH_USER B";
		sql += " ON B.IAU_EMP_NO = A.SSV_DOCTOR";
		sql += " WHERE A.SSV_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.SSV_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND A.SSV_VIEW_EX IS NOT NULL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPostManagement_NEWCounseling_UP_SYTH_VIEW_Display_001 \n";
			G_INFO += "설명 : 검사결과정보 로딩 \n";
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
		<s:AttributeType name='SSV_VIEW_EX' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_VIEW_EX'>
			<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_DOCTOR' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_DOCTOR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_RPT_DT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_EXAM_DT' rs:number='5' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW' rs:basecolumn='SSV_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_EXAM_SQ' rs:number='6' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW' rs:basecolumn='SSV_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_PACK_CD' rs:number='7' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW' rs:basecolumn='SSV_PACK_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_CFRM_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_CFRM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_CLIC_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_CLIC_CD'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_CLIC_SQ' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_CLIC_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_EQUI_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_EQUI_CD'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='c11' rs:name='SSV_VIEW_EX' rs:number='12' rs:nullable='true' rs:writeunknown='true'
			 rs:basetable='ST_SYTH_VIEW' rs:basecolumn='SSV_VIEW_EX'>
			<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_FINDING' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_FINDING'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_COMMT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_COMMT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_CLIC_FT' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_CLIC_FT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_EQUI_FT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_EQUI_FT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_VIEW_FT' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_VIEW_FT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_MON_FT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_MON_FT'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_VIEWFIN_DT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_VIEWFIN_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='c19' rs:name='SSV_DOCTOR' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_DOCTOR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_EMAIL_DT' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_EMAIL_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_SMS_DT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_SMS_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_MON_VIEW' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_MON_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_INPT_ID' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_INPT_DTT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_MODI_ID' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_MODI_DTT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c27' rs:name='SSV_RPT_DT' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_PRNT_DT' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_PRNT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSV_VIEW_RTF' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYTH_VIEW'
			 rs:basecolumn='SSV_VIEW_RTF'>
			<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='31' rs:rowid='true' rs:basetable='ST_SYTH_VIEW' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c31' rs:name='ROWID' rs:number='32' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String SSV_VIEW_EX_T = cRsList.getString("SSV_VIEW_EX");
			String SSV_DOCTOR_T = cRsList.getString("SSV_DOCTOR");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String SSV_RPT_DT_T = cRsList.getString("SSV_RPT_DT");
			String SSV_EXAM_DT_T = cRsList.getString("SSV_EXAM_DT");
			String SSV_EXAM_SQ_T = cRsList.getString("SSV_EXAM_SQ");
			String SSV_PACK_CD_T = cRsList.getString("SSV_PACK_CD");
			String SSV_CFRM_CD_T = cRsList.getString("SSV_CFRM_CD");
			String SSV_CLIC_CD_T = cRsList.getString("SSV_CLIC_CD");
			String SSV_CLIC_SQ_T = cRsList.getString("SSV_CLIC_SQ");
			String SSV_EQUI_CD_T = cRsList.getString("SSV_EQUI_CD");
			String c11_T = cRsList.getString("c11");
			String SSV_FINDING_T = cRsList.getString("SSV_FINDING");
			String SSV_COMMT_T = cRsList.getString("SSV_COMMT");
			String SSV_CLIC_FT_T = cRsList.getString("SSV_CLIC_FT");
			String SSV_EQUI_FT_T = cRsList.getString("SSV_EQUI_FT");
			String SSV_VIEW_FT_T = cRsList.getString("SSV_VIEW_FT");
			String SSV_MON_FT_T = cRsList.getString("SSV_MON_FT");
			String SSV_VIEWFIN_DT_T = cRsList.getString("SSV_VIEWFIN_DT");
			String c19_T = cRsList.getString("c19");
			String SSV_EMAIL_DT_T = cRsList.getString("SSV_EMAIL_DT");
			String SSV_SMS_DT_T = cRsList.getString("SSV_SMS_DT");
			String SSV_MON_VIEW_T = cRsList.getString("SSV_MON_VIEW");
			String SSV_INPT_ID_T = cRsList.getString("SSV_INPT_ID");
			String SSV_INPT_DTT_T = cRsList.getDate2("SSV_INPT_DTT");
			String SSV_MODI_ID_T = cRsList.getString("SSV_MODI_ID");
			String SSV_MODI_DTT_T = cRsList.getDate2("SSV_MODI_DTT");
			String c27_T = cRsList.getString("c27");
			String SSV_PRNT_DT_T = cRsList.getString("SSV_PRNT_DT");
			String SSV_VIEW_RTF_T = cRsList.getString("SSV_VIEW_RTF");
			String ROWID_T = cRsList.getString("ROWID");
			String c31_T = cRsList.getString("c31");
%>
			<z:row
<%
			if(! SSV_VIEW_EX_T.equals("")) {
%>
		 		SSV_VIEW_EX='<%= SSV_VIEW_EX_T%>'
<%
			}

			if(! SSV_DOCTOR_T.equals("")) {
%>
		 		SSV_DOCTOR='<%= SSV_DOCTOR_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! SSV_RPT_DT_T.equals("")) {
%>
		 		SSV_RPT_DT='<%= SSV_RPT_DT_T%>'
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

			if(! c11_T.equals("")) {
%>
		 		c11='<%= c11_T%>'
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

			if(! c19_T.equals("")) {
%>
		 		c19='<%= c19_T%>'
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

			if(! c27_T.equals("")) {
%>
		 		c27='<%= c27_T%>'
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
%>
				ROWID='<%= cnt%>'
				c31='<%= cnt%>'
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
