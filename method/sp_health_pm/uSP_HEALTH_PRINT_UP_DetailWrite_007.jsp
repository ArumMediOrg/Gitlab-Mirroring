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
		String SYMP_CD = htMethod.get("SYMP_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(SYMP_CD == null) { SYMP_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM ST_SYMPTOM WHERE 0=0
 AND SSM_EXAM_DT  = :EXAM_DT 
 AND SSM_EXAM_SQ  = :EXAM_SQ
 AND SSM_SYMP_CD  = :SYMP_CD

		*/

		sql = " SELECT *";
		sql += " FROM ST_SYMPTOM";
		sql += " WHERE 0=0";
		sql += " AND SSM_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND SSM_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SSM_SYMP_CD = '" + SYMP_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_PRINT_UP_DetailWrite_007 \n";
			G_INFO += "설명 : 과거병력정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " SYMP_CD : " + SYMP_CD + " \n";
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
		<s:AttributeType name='SSM_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ST_SYMPTOM' rs:basecolumn='SSM_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SSM_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ST_SYMPTOM' rs:basecolumn='SSM_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SSM_EXAM_CHA' rs:number='3' rs:writeunknown='true' rs:basetable='ST_SYMPTOM' rs:basecolumn='SSM_EXAM_CHA'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SSM_SYMP_CD' rs:number='4' rs:writeunknown='true' rs:basetable='ST_SYMPTOM' rs:basecolumn='SSM_SYMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SSM_SYMP_SQ' rs:number='5' rs:writeunknown='true' rs:basetable='ST_SYMPTOM' rs:basecolumn='SSM_SYMP_SQ'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SSM_SYSQ_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYMPTOM'
			 rs:basecolumn='SSM_SYSQ_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='SSM_SYSQ_NM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYMPTOM'
			 rs:basecolumn='SSM_SYSQ_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SSM_ETC_TX' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYMPTOM'
			 rs:basecolumn='SSM_ETC_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SSM_INPT_ID' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYMPTOM'
			 rs:basecolumn='SSM_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SSM_INPT_DTT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYMPTOM'
			 rs:basecolumn='SSM_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='11' rs:rowid='true' rs:writeunknown='true' rs:basetable='ST_SYMPTOM'
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

			String SSM_EXAM_DT_T = cRsList.getString("SSM_EXAM_DT");
			String SSM_EXAM_SQ_T = cRsList.getString("SSM_EXAM_SQ");
			String SSM_EXAM_CHA_T = cRsList.getString("SSM_EXAM_CHA");
			String SSM_SYMP_CD_T = cRsList.getString("SSM_SYMP_CD");
			String SSM_SYMP_SQ_T = cRsList.getString("SSM_SYMP_SQ");
			String SSM_SYSQ_CD_T = cRsList.getString("SSM_SYSQ_CD");
			String SSM_SYSQ_NM_T = cRsList.getString("SSM_SYSQ_NM");
			String SSM_ETC_TX_T = cRsList.getString("SSM_ETC_TX");
			String SSM_INPT_ID_T = cRsList.getString("SSM_INPT_ID");
			String SSM_INPT_DTT_T = cRsList.getDate2("SSM_INPT_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! SSM_EXAM_DT_T.equals("")) {
%>
		 		SSM_EXAM_DT='<%= SSM_EXAM_DT_T%>'
<%
			}

			if(! SSM_EXAM_SQ_T.equals("")) {
%>
		 		SSM_EXAM_SQ='<%= SSM_EXAM_SQ_T%>'
<%
			}

			if(! SSM_EXAM_CHA_T.equals("")) {
%>
		 		SSM_EXAM_CHA='<%= SSM_EXAM_CHA_T%>'
<%
			}

			if(! SSM_SYMP_CD_T.equals("")) {
%>
		 		SSM_SYMP_CD='<%= SSM_SYMP_CD_T%>'
<%
			}

			if(! SSM_SYMP_SQ_T.equals("")) {
%>
		 		SSM_SYMP_SQ='<%= SSM_SYMP_SQ_T%>'
<%
			}

			if(! SSM_SYSQ_CD_T.equals("")) {
%>
		 		SSM_SYSQ_CD='<%= SSM_SYSQ_CD_T%>'
<%
			}

			if(! SSM_SYSQ_NM_T.equals("")) {
%>
		 		SSM_SYSQ_NM='<%= SSM_SYSQ_NM_T%>'
<%
			}

			if(! SSM_ETC_TX_T.equals("")) {
%>
		 		SSM_ETC_TX='<%= SSM_ETC_TX_T%>'
<%
			}

			if(! SSM_INPT_ID_T.equals("")) {
%>
		 		SSM_INPT_ID='<%= SSM_INPT_ID_T%>'
<%
			}

			if(! SSM_INPT_DTT_T.equals("")) {
%>
		 		SSM_INPT_DTT='<%= SSM_INPT_DTT_T%>'
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
