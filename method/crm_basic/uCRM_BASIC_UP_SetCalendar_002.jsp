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

		String sEXAM_DT = htMethod.get("sEXAM_DT");
		String eEXAM_DT = htMethod.get("eEXAM_DT");

		//
		if(sEXAM_DT == null) { sEXAM_DT = ""; }
		if(eEXAM_DT == null) { eEXAM_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = "SELECT A.*, B.EEA_PSNL_NM           ";
		sql += "FROM CR_ADVICE_PLAN A               ";
		sql += "INNER JOIN ET_EXAM_ACPT B          ";
		sql += "ON A.CAP_EXAM_DT = B.EEA_EXAM_DT  ";
		sql += "AND A.CAP_EXAM_SQ = B.EEA_EXAM_SQ ";
		sql += "WHERE CAP_RSVN_DT >= '" + sEXAM_DT + "'";
		sql += "AND CAP_RSVN_DT <= '" + eEXAM_DT + "'";
		sql += "ORDER BY CAP_RSVN_DT, CAP_RSVN_TM ";

		//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uCRM_BASIC_UP_SetCalendar_002 \n";
		G_INFO += "설명 : 일자 Display \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " sEXAM_DT : " + sEXAM_DT + " \n";
		G_INFO += " eEXAM_DT : " + eEXAM_DT + " \n";
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
		<s:AttributeType name='CAP_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_RSVN_DT' rs:number='3' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_RSVN_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_RSVN_TM' rs:number='4' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_RSVN_TM'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_SCHED_STEP' rs:number='5' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_SCHED_STEP'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_DOCTOR' rs:number='6' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_DOCTOR'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_PLAN_TX' rs:number='7' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_PLAN_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_DLVY_KD' rs:number='8' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_DLVY_KD'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_DLVY_DT' rs:number='9' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_DLVY_DT'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_DLVY_STEP' rs:number='10' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_DLVY_STEP'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_ZIP_CD' rs:number='11' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_ZIP_AR' rs:number='12' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_ROAD_AR' rs:number='13' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_INPT_ID' rs:number='14' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_INPT_DTT' rs:number='15' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_INPT_DTT'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_MODI_ID' rs:number='16' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_MODI_DTT' rs:number='17' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_MODI_DTT'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_MODI_ID2' rs:number='18' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_MODI_ID2'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='CAP_MODI_DTT2' rs:number='19' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN' rs:basecolumn='CAP_MODI_DTT2'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='EEA_PSNL_NM' rs:number='20' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000' rs:maybenull='false'/>
		</s:AttributeType>
		
		<s:AttributeType name='ROWID' rs:number='21' rs:rowid='true' rs:writeunknown='true' rs:basetable='CR_ADVICE_PLAN'
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

			String CAP_EXAM_DT = cRsList.getString("CAP_EXAM_DT");
			String CAP_EXAM_SQ = cRsList.getString("CAP_EXAM_SQ");
			String CAP_RSVN_DT = cRsList.getString("CAP_RSVN_DT");
			String CAP_RSVN_TM = cRsList.getString("CAP_RSVN_TM");
			String CAP_SCHED_STEP = cRsList.getString("CAP_SCHED_STEP");

			String CAP_DOCTOR = cRsList.getString("CAP_DOCTOR");
			String CAP_PLAN_TX = cRsList.getString("CAP_PLAN_TX");
			String CAP_DLVY_KD = cRsList.getString("CAP_DLVY_KD");
			String CAP_DLVY_DT = cRsList.getString("CAP_DLVY_DT");
			String CAP_DLVY_STEP = cRsList.getString("CAP_DLVY_STEP");

			String CAP_ZIP_CD = cRsList.getString("CAP_ZIP_CD");
			String CAP_ZIP_AR = cRsList.getString("CAP_ZIP_AR");
			String CAP_ROAD_AR = cRsList.getString("CAP_ROAD_AR");
			String CAP_INPT_ID = cRsList.getString("CAP_INPT_ID");
			String CAP_INPT_DTT = cRsList.getString("CAP_INPT_DTT");

			String CAP_MODI_ID = cRsList.getString("CAP_MODI_ID");
			String CAP_MODI_DTT = cRsList.getString("CAP_MODI_DTT");
			String CAP_MODI_ID2 = cRsList.getString("CAP_MODI_ID2");
			String CAP_MODI_DTT2 = cRsList.getString("CAP_MODI_DTT2");
			String EEA_PSNL_NM = cRsList.getString("EEA_PSNL_NM");
			
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CAP_EXAM_DT.equals("")) {
%>
		 		CAP_EXAM_DT='<%= CAP_EXAM_DT%>'
<%
			}

			if(! CAP_EXAM_SQ.equals("")) {
%>
		 		CAP_EXAM_SQ='<%= CAP_EXAM_SQ%>'
<%
			}

			if(! CAP_RSVN_DT.equals("")) {
%>
		 		CAP_RSVN_DT='<%= CAP_RSVN_DT%>'
<%
			}

			if(! CAP_RSVN_TM.equals("")) {
%>
		 		CAP_RSVN_TM='<%= CAP_RSVN_TM%>'
<%
			}

			if(! CAP_SCHED_STEP.equals("")) {
%>
		 		CAP_SCHED_STEP='<%= CAP_SCHED_STEP%>'
<%
			}

			if(! CAP_DOCTOR.equals("")) {
%>
		 		CAP_DOCTOR='<%= CAP_DOCTOR%>'
<%
			}

			if(! CAP_PLAN_TX.equals("")) {  
%>
		 		CAP_PLAN_TX='<%= CAP_PLAN_TX%>'
<%
			}

			if(! CAP_DLVY_KD.equals("")) {
%>
		 		CAP_DLVY_KD='<%= CAP_DLVY_KD%>'
<%
			}

			if(! CAP_DLVY_DT.equals("")) {
%>
		 		CAP_DLVY_DT='<%= CAP_DLVY_DT%>'
<%
			}

			if(! CAP_DLVY_STEP.equals("")) {
%>
		 		CAP_DLVY_STEP='<%= CAP_DLVY_STEP%>'
<%
			}

			if(! CAP_ZIP_CD.equals("")) {
%>
		 		CAP_ZIP_CD='<%= CAP_ZIP_CD%>'
<%
			}

			if(! CAP_ZIP_AR.equals("")) {
%>
		 		CAP_ZIP_AR='<%= CAP_ZIP_AR%>'
<%
			}

			if(! CAP_ROAD_AR.equals("")) {
%>
		 		CAP_ROAD_AR='<%= CAP_ROAD_AR%>'
<%
			}

			if(! CAP_INPT_ID.equals("")) {
%>
		 		CAP_INPT_ID='<%= CAP_INPT_ID%>'
<%
			}

			if(! CAP_INPT_DTT.equals("")) {
%>
		 		CAP_INPT_DTT='<%= CAP_INPT_DTT%>'
<%
			}

			if(! CAP_MODI_ID.equals("")) {
%>
		 		CAP_MODI_ID='<%= CAP_MODI_ID%>'
<%
			}

			if(! CAP_MODI_DTT.equals("")) {
%>
		 		CAP_MODI_DTT='<%= CAP_MODI_DTT%>'
<%
			}

			if(! CAP_MODI_ID2.equals("")) {
%>
		 		CAP_MODI_ID2='<%= CAP_MODI_ID2%>'
<%
			}

			if(! CAP_MODI_DTT2.equals("")) {
%>
				CAP_MODI_DTT2='<%= CAP_MODI_DTT2%>'
<%
			}

			if(! EEA_PSNL_NM.equals("")) {
%>
				EEA_PSNL_NM='<%= EEA_PSNL_NM%>'
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
