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

SELECT * FROM PT_DANR_PANJUNG 
 WHERE PDP_EXAM_DT = :EXAM_DT
   AND PDP_EXAM_SQ = :EXAM_SQ

		*/

		sql = " SELECT *";
		sql += " FROM PT_DANR_PANJUNG";
		sql += " WHERE PDP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND PDP_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDT_CCDT_PANJ_UP_PANJUNG_Setting_2019_002 \n";
			G_INFO += "설명 : 판정정보 로딩 \n";
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
		<s:AttributeType name='PDP_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG' rs:basecolumn='PDP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PDP_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG' rs:basecolumn='PDP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PDP_EXAM_KD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG'
			 rs:basecolumn='PDP_EXAM_KD'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PDP_ETC_KD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG'
			 rs:basecolumn='PDP_ETC_KD'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PDP_ETC1_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG'
			 rs:basecolumn='PDP_ETC1_CD'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='PDP_ETC2_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG'
			 rs:basecolumn='PDP_ETC2_CD'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='PDP_ETC3_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG'
			 rs:basecolumn='PDP_ETC3_CD'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='PDP_ETC4_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG'
			 rs:basecolumn='PDP_ETC4_CD'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='PDP_PANJ_DT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG'
			 rs:basecolumn='PDP_PANJ_DT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PDP_DOCT_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG'
			 rs:basecolumn='PDP_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PDP_INPT_ID' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG'
			 rs:basecolumn='PDP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PDP_INPT_DTT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG'
			 rs:basecolumn='PDP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PDP_MODI_ID' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG'
			 rs:basecolumn='PDP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PDP_MODI_DTT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG'
			 rs:basecolumn='PDP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='15' rs:rowid='true' rs:writeunknown='true' rs:basetable='PT_DANR_PANJUNG'
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

			String PDP_EXAM_DT_T = cRsList.getString("PDP_EXAM_DT");
			String PDP_EXAM_SQ_T = cRsList.getString("PDP_EXAM_SQ");
			String PDP_EXAM_KD_T = cRsList.getString("PDP_EXAM_KD");
			String PDP_ETC_KD_T = cRsList.getString("PDP_ETC_KD");
			String PDP_ETC1_CD_T = cRsList.getString("PDP_ETC1_CD");
			String PDP_ETC2_CD_T = cRsList.getString("PDP_ETC2_CD");
			String PDP_ETC3_CD_T = cRsList.getString("PDP_ETC3_CD");
			String PDP_ETC4_CD_T = cRsList.getString("PDP_ETC4_CD");
			String PDP_PANJ_DT_T = cRsList.getDate2("PDP_PANJ_DT");
			String PDP_DOCT_CD_T = cRsList.getString("PDP_DOCT_CD");
			String PDP_INPT_ID_T = cRsList.getString("PDP_INPT_ID");
			String PDP_INPT_DTT_T = cRsList.getDate2("PDP_INPT_DTT");
			String PDP_MODI_ID_T = cRsList.getString("PDP_MODI_ID");
			String PDP_MODI_DTT_T = cRsList.getDate2("PDP_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! PDP_EXAM_DT_T.equals("")) {
%>
		 		PDP_EXAM_DT='<%= PDP_EXAM_DT_T%>'
<%
			}

			if(! PDP_EXAM_SQ_T.equals("")) {
%>
		 		PDP_EXAM_SQ='<%= PDP_EXAM_SQ_T%>'
<%
			}

			if(! PDP_EXAM_KD_T.equals("")) {
%>
		 		PDP_EXAM_KD='<%= PDP_EXAM_KD_T%>'
<%
			}

			if(! PDP_ETC_KD_T.equals("")) {
%>
		 		PDP_ETC_KD='<%= PDP_ETC_KD_T%>'
<%
			}

			if(! PDP_ETC1_CD_T.equals("")) {
%>
		 		PDP_ETC1_CD='<%= PDP_ETC1_CD_T%>'
<%
			}

			if(! PDP_ETC2_CD_T.equals("")) {
%>
		 		PDP_ETC2_CD='<%= PDP_ETC2_CD_T%>'
<%
			}

			if(! PDP_ETC3_CD_T.equals("")) {
%>
		 		PDP_ETC3_CD='<%= PDP_ETC3_CD_T%>'
<%
			}

			if(! PDP_ETC4_CD_T.equals("")) {
%>
		 		PDP_ETC4_CD='<%= PDP_ETC4_CD_T%>'
<%
			}

			if(! PDP_PANJ_DT_T.equals("")) {
%>
		 		PDP_PANJ_DT='<%= PDP_PANJ_DT_T%>'
<%
			}

			if(! PDP_DOCT_CD_T.equals("")) {
%>
		 		PDP_DOCT_CD='<%= PDP_DOCT_CD_T%>'
<%
			}

			if(! PDP_INPT_ID_T.equals("")) {
%>
		 		PDP_INPT_ID='<%= PDP_INPT_ID_T%>'
<%
			}

			if(! PDP_INPT_DTT_T.equals("")) {
%>
		 		PDP_INPT_DTT='<%= PDP_INPT_DTT_T%>'
<%
			}

			if(! PDP_MODI_ID_T.equals("")) {
%>
		 		PDP_MODI_ID='<%= PDP_MODI_ID_T%>'
<%
			}

			if(! PDP_MODI_DTT_T.equals("")) {
%>
		 		PDP_MODI_DTT='<%= PDP_MODI_DTT_T%>'
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
