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

SELECT A.*, 
       F_USER_FIND(A.ESP_EXAM_DR) AS ESP_EXAM_NM, 
       F_USER_FIND(A.ESP_ORAL_DR) AS ESP_ORAL_NM 
  FROM ET_STDT_PNJN A 
 WHERE A.ESP_EXAM_DT = :EXAM_DT
   AND A.ESP_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT A.*, F_USER_FIND(A.ESP_EXAM_DR) AS ESP_EXAM_NM, F_USER_FIND(A.ESP_ORAL_DR) AS ESP_ORAL_NM";
		sql += " FROM ET_STDT_PNJN A";
		sql += " WHERE A.ESP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.ESP_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Pnjn_Up_PnjnDisplay_001 \n";
			G_INFO += "설명 : 학생검진 판정 조회 \n";
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
		<s:AttributeType name='ESP_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN' rs:basecolumn='ESP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN' rs:basecolumn='ESP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_TT' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_TT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_01' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_01'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_02' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_02'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_03' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_03'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_04' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_04'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_05' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_05'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_06' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_06'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_07' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_07'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_08' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_08'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_09' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_09'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_10' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_10'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_11' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_11'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_12' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_12'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_13' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_13'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_14' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_14'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_15' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_15'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_16' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_16'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_17' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_17'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_18' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_18'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_19' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_19'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_20' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_PNJN_20'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_QST_01' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_QST_01'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_QST_02' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_QST_02'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_QST_03' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_QST_03'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_QST_04' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_QST_04'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_QST_05' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_QST_05'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EXAM_VIEW' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_EXAM_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EXAM_ACT' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_EXAM_ACT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_ORAL_VIEW' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_ORAL_VIEW'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_ORAL_ACT' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_ORAL_ACT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EIFRM_DT' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_EIFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_OIFRM_DT' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_OIFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EXAM_DR' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_EXAM_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_ORAL_DR' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_ORAL_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EPNJN_YN' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_EPNJN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_OPNJN_YN' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_OPNJN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_INPT_ID' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_INPT_DTT' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_MODI_ID' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_MODI_DTT' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_CHUNG_YN' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJN'
			 rs:basecolumn='ESP_CHUNG_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EXAM_NM' rs:number='44' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_ORAL_NM' rs:number='45' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='46' rs:rowid='true' rs:basetable='ET_STDT_PNJN' rs:basecolumn='ROWID'
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

			String ESP_EXAM_DT_T = cRsList.getString("ESP_EXAM_DT");
			String ESP_EXAM_SQ_T = cRsList.getString("ESP_EXAM_SQ");
			String ESP_PNJN_TT_T = cRsList.getString("ESP_PNJN_TT");
			String ESP_PNJN_01_T = cRsList.getString("ESP_PNJN_01");
			String ESP_PNJN_02_T = cRsList.getString("ESP_PNJN_02");
			String ESP_PNJN_03_T = cRsList.getString("ESP_PNJN_03");
			String ESP_PNJN_04_T = cRsList.getString("ESP_PNJN_04");
			String ESP_PNJN_05_T = cRsList.getString("ESP_PNJN_05");
			String ESP_PNJN_06_T = cRsList.getString("ESP_PNJN_06");
			String ESP_PNJN_07_T = cRsList.getString("ESP_PNJN_07");
			String ESP_PNJN_08_T = cRsList.getString("ESP_PNJN_08");
			String ESP_PNJN_09_T = cRsList.getString("ESP_PNJN_09");
			String ESP_PNJN_10_T = cRsList.getString("ESP_PNJN_10");
			String ESP_PNJN_11_T = cRsList.getString("ESP_PNJN_11");
			String ESP_PNJN_12_T = cRsList.getString("ESP_PNJN_12");
			String ESP_PNJN_13_T = cRsList.getString("ESP_PNJN_13");
			String ESP_PNJN_14_T = cRsList.getString("ESP_PNJN_14");
			String ESP_PNJN_15_T = cRsList.getString("ESP_PNJN_15");
			String ESP_PNJN_16_T = cRsList.getString("ESP_PNJN_16");
			String ESP_PNJN_17_T = cRsList.getString("ESP_PNJN_17");
			String ESP_PNJN_18_T = cRsList.getString("ESP_PNJN_18");
			String ESP_PNJN_19_T = cRsList.getString("ESP_PNJN_19");
			String ESP_PNJN_20_T = cRsList.getString("ESP_PNJN_20");
			String ESP_QST_01_T = cRsList.getString("ESP_QST_01");
			String ESP_QST_02_T = cRsList.getString("ESP_QST_02");
			String ESP_QST_03_T = cRsList.getString("ESP_QST_03");
			String ESP_QST_04_T = cRsList.getString("ESP_QST_04");
			String ESP_QST_05_T = cRsList.getString("ESP_QST_05");
			String ESP_EXAM_VIEW_T = cRsList.getString("ESP_EXAM_VIEW");
			String ESP_EXAM_ACT_T = cRsList.getString("ESP_EXAM_ACT");
			String ESP_ORAL_VIEW_T = cRsList.getString("ESP_ORAL_VIEW");
			String ESP_ORAL_ACT_T = cRsList.getString("ESP_ORAL_ACT");
			String ESP_EIFRM_DT_T = cRsList.getString("ESP_EIFRM_DT");
			String ESP_OIFRM_DT_T = cRsList.getString("ESP_OIFRM_DT");
			String ESP_EXAM_DR_T = cRsList.getString("ESP_EXAM_DR");
			String ESP_ORAL_DR_T = cRsList.getString("ESP_ORAL_DR");
			String ESP_EPNJN_YN_T = cRsList.getString("ESP_EPNJN_YN");
			String ESP_OPNJN_YN_T = cRsList.getString("ESP_OPNJN_YN");
			String ESP_INPT_ID_T = cRsList.getString("ESP_INPT_ID");
			String ESP_INPT_DTT_T = cRsList.getDate2("ESP_INPT_DTT");
			String ESP_MODI_ID_T = cRsList.getString("ESP_MODI_ID");
			String ESP_MODI_DTT_T = cRsList.getDate2("ESP_MODI_DTT");
			String ESP_CHUNG_YN_T = cRsList.getString("ESP_CHUNG_YN");
			String ESP_EXAM_NM_T = cRsList.getString("ESP_EXAM_NM");
			String ESP_ORAL_NM_T = cRsList.getString("ESP_ORAL_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ESP_EXAM_DT_T.equals("")) {
%>
		 		ESP_EXAM_DT='<%= ESP_EXAM_DT_T%>'
<%
			}

			if(! ESP_EXAM_SQ_T.equals("")) {
%>
		 		ESP_EXAM_SQ='<%= ESP_EXAM_SQ_T%>'
<%
			}

			if(! ESP_PNJN_TT_T.equals("")) {
%>
		 		ESP_PNJN_TT='<%= ESP_PNJN_TT_T%>'
<%
			}

			if(! ESP_PNJN_01_T.equals("")) {
%>
		 		ESP_PNJN_01='<%= ESP_PNJN_01_T%>'
<%
			}

			if(! ESP_PNJN_02_T.equals("")) {
%>
		 		ESP_PNJN_02='<%= ESP_PNJN_02_T%>'
<%
			}

			if(! ESP_PNJN_03_T.equals("")) {
%>
		 		ESP_PNJN_03='<%= ESP_PNJN_03_T%>'
<%
			}

			if(! ESP_PNJN_04_T.equals("")) {
%>
		 		ESP_PNJN_04='<%= ESP_PNJN_04_T%>'
<%
			}

			if(! ESP_PNJN_05_T.equals("")) {
%>
		 		ESP_PNJN_05='<%= ESP_PNJN_05_T%>'
<%
			}

			if(! ESP_PNJN_06_T.equals("")) {
%>
		 		ESP_PNJN_06='<%= ESP_PNJN_06_T%>'
<%
			}

			if(! ESP_PNJN_07_T.equals("")) {
%>
		 		ESP_PNJN_07='<%= ESP_PNJN_07_T%>'
<%
			}

			if(! ESP_PNJN_08_T.equals("")) {
%>
		 		ESP_PNJN_08='<%= ESP_PNJN_08_T%>'
<%
			}

			if(! ESP_PNJN_09_T.equals("")) {
%>
		 		ESP_PNJN_09='<%= ESP_PNJN_09_T%>'
<%
			}

			if(! ESP_PNJN_10_T.equals("")) {
%>
		 		ESP_PNJN_10='<%= ESP_PNJN_10_T%>'
<%
			}

			if(! ESP_PNJN_11_T.equals("")) {
%>
		 		ESP_PNJN_11='<%= ESP_PNJN_11_T%>'
<%
			}

			if(! ESP_PNJN_12_T.equals("")) {
%>
		 		ESP_PNJN_12='<%= ESP_PNJN_12_T%>'
<%
			}

			if(! ESP_PNJN_13_T.equals("")) {
%>
		 		ESP_PNJN_13='<%= ESP_PNJN_13_T%>'
<%
			}

			if(! ESP_PNJN_14_T.equals("")) {
%>
		 		ESP_PNJN_14='<%= ESP_PNJN_14_T%>'
<%
			}

			if(! ESP_PNJN_15_T.equals("")) {
%>
		 		ESP_PNJN_15='<%= ESP_PNJN_15_T%>'
<%
			}

			if(! ESP_PNJN_16_T.equals("")) {
%>
		 		ESP_PNJN_16='<%= ESP_PNJN_16_T%>'
<%
			}

			if(! ESP_PNJN_17_T.equals("")) {
%>
		 		ESP_PNJN_17='<%= ESP_PNJN_17_T%>'
<%
			}

			if(! ESP_PNJN_18_T.equals("")) {
%>
		 		ESP_PNJN_18='<%= ESP_PNJN_18_T%>'
<%
			}

			if(! ESP_PNJN_19_T.equals("")) {
%>
		 		ESP_PNJN_19='<%= ESP_PNJN_19_T%>'
<%
			}

			if(! ESP_PNJN_20_T.equals("")) {
%>
		 		ESP_PNJN_20='<%= ESP_PNJN_20_T%>'
<%
			}

			if(! ESP_QST_01_T.equals("")) {
%>
		 		ESP_QST_01='<%= ESP_QST_01_T%>'
<%
			}

			if(! ESP_QST_02_T.equals("")) {
%>
		 		ESP_QST_02='<%= ESP_QST_02_T%>'
<%
			}

			if(! ESP_QST_03_T.equals("")) {
%>
		 		ESP_QST_03='<%= ESP_QST_03_T%>'
<%
			}

			if(! ESP_QST_04_T.equals("")) {
%>
		 		ESP_QST_04='<%= ESP_QST_04_T%>'
<%
			}

			if(! ESP_QST_05_T.equals("")) {
%>
		 		ESP_QST_05='<%= ESP_QST_05_T%>'
<%
			}

			if(! ESP_EXAM_VIEW_T.equals("")) {
%>
		 		ESP_EXAM_VIEW='<%= ESP_EXAM_VIEW_T%>'
<%
			}

			if(! ESP_EXAM_ACT_T.equals("")) {
%>
		 		ESP_EXAM_ACT='<%= ESP_EXAM_ACT_T%>'
<%
			}

			if(! ESP_ORAL_VIEW_T.equals("")) {
%>
		 		ESP_ORAL_VIEW='<%= ESP_ORAL_VIEW_T%>'
<%
			}

			if(! ESP_ORAL_ACT_T.equals("")) {
%>
		 		ESP_ORAL_ACT='<%= ESP_ORAL_ACT_T%>'
<%
			}

			if(! ESP_EIFRM_DT_T.equals("")) {
%>
		 		ESP_EIFRM_DT='<%= ESP_EIFRM_DT_T%>'
<%
			}

			if(! ESP_OIFRM_DT_T.equals("")) {
%>
		 		ESP_OIFRM_DT='<%= ESP_OIFRM_DT_T%>'
<%
			}

			if(! ESP_EXAM_DR_T.equals("")) {
%>
		 		ESP_EXAM_DR='<%= ESP_EXAM_DR_T%>'
<%
			}

			if(! ESP_ORAL_DR_T.equals("")) {
%>
		 		ESP_ORAL_DR='<%= ESP_ORAL_DR_T%>'
<%
			}

			if(! ESP_EPNJN_YN_T.equals("")) {
%>
		 		ESP_EPNJN_YN='<%= ESP_EPNJN_YN_T%>'
<%
			}

			if(! ESP_OPNJN_YN_T.equals("")) {
%>
		 		ESP_OPNJN_YN='<%= ESP_OPNJN_YN_T%>'
<%
			}

			if(! ESP_INPT_ID_T.equals("")) {
%>
		 		ESP_INPT_ID='<%= ESP_INPT_ID_T%>'
<%
			}

			if(! ESP_INPT_DTT_T.equals("")) {
%>
		 		ESP_INPT_DTT='<%= ESP_INPT_DTT_T%>'
<%
			}

			if(! ESP_MODI_ID_T.equals("")) {
%>
		 		ESP_MODI_ID='<%= ESP_MODI_ID_T%>'
<%
			}

			if(! ESP_MODI_DTT_T.equals("")) {
%>
		 		ESP_MODI_DTT='<%= ESP_MODI_DTT_T%>'
<%
			}

			if(! ESP_CHUNG_YN_T.equals("")) {
%>
		 		ESP_CHUNG_YN='<%= ESP_CHUNG_YN_T%>'
<%
			}

			if(! ESP_EXAM_NM_T.equals("")) {
%>
		 		ESP_EXAM_NM='<%= ESP_EXAM_NM_T%>'
<%
			}

			if(! ESP_ORAL_NM_T.equals("")) {
%>
		 		ESP_ORAL_NM='<%= ESP_ORAL_NM_T%>'
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
