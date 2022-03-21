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

SELECT *
  FROM PT_LABOR_PANJUNG
 WHERE PLP_EXAM_DT = :EXAM_DT
   AND PLP_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT *";
		sql += " FROM PT_LABOR_PANJUNG";
		sql += " WHERE PLP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND PLP_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGen_Frst_Panj_upSelLabor_001 \n";
			G_INFO += "설명 : 노동부판정 select \n";
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
		<s:AttributeType name='PLP_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG' rs:basecolumn='PLP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG' rs:basecolumn='PLP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_DSCD' rs:number='3' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_DSCD'>
			<s:datatype dt:type='string' dt:maxLength='3' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_PNCD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_PNCD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_SH01' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_SH01'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_SH02' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_SH02'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_SH03' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_SH03'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_SHDS' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_SHDS'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_DOCV' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_DOCV'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_TTPN' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_TTPN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_WORK' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_WORK'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_SFLG' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_SFLG'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_INDT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_INDT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_INID' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_INID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_LTDT' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_LTDT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_JLPN_LTID' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_JLPN_LTID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_ETC_EX' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
			 rs:basecolumn='PLP_ETC_EX'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='18' rs:rowid='true' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG'
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

			String PLP_EXAM_DT_T = cRsList.getString("PLP_EXAM_DT");
			String PLP_EXAM_SQ_T = cRsList.getString("PLP_EXAM_SQ");
			String PLP_JLPN_DSCD_T = cRsList.getString("PLP_JLPN_DSCD");
			String PLP_JLPN_PNCD_T = cRsList.getString("PLP_JLPN_PNCD");
			String PLP_JLPN_SH01_T = cRsList.getString("PLP_JLPN_SH01");
			String PLP_JLPN_SH02_T = cRsList.getString("PLP_JLPN_SH02");
			String PLP_JLPN_SH03_T = cRsList.getString("PLP_JLPN_SH03");
			String PLP_JLPN_SHDS_T = cRsList.getString("PLP_JLPN_SHDS");
			String PLP_JLPN_DOCV_T = cRsList.getString("PLP_JLPN_DOCV");
			String PLP_JLPN_TTPN_T = cRsList.getString("PLP_JLPN_TTPN");
			String PLP_JLPN_WORK_T = cRsList.getString("PLP_JLPN_WORK");
			String PLP_JLPN_SFLG_T = cRsList.getString("PLP_JLPN_SFLG");
			String PLP_JLPN_INDT_T = cRsList.getDate2("PLP_JLPN_INDT");
			String PLP_JLPN_INID_T = cRsList.getString("PLP_JLPN_INID");
			String PLP_JLPN_LTDT_T = cRsList.getDate2("PLP_JLPN_LTDT");
			String PLP_JLPN_LTID_T = cRsList.getString("PLP_JLPN_LTID");
			String PLP_ETC_EX_T = cRsList.getString("PLP_ETC_EX");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! PLP_EXAM_DT_T.equals("")) {
%>
		 		PLP_EXAM_DT='<%= PLP_EXAM_DT_T%>'
<%
			}

			if(! PLP_EXAM_SQ_T.equals("")) {
%>
		 		PLP_EXAM_SQ='<%= PLP_EXAM_SQ_T%>'
<%
			}

			if(! PLP_JLPN_DSCD_T.equals("")) {
%>
		 		PLP_JLPN_DSCD='<%= PLP_JLPN_DSCD_T%>'
<%
			}

			if(! PLP_JLPN_PNCD_T.equals("")) {
%>
		 		PLP_JLPN_PNCD='<%= PLP_JLPN_PNCD_T%>'
<%
			}

			if(! PLP_JLPN_SH01_T.equals("")) {
%>
		 		PLP_JLPN_SH01='<%= PLP_JLPN_SH01_T%>'
<%
			}

			if(! PLP_JLPN_SH02_T.equals("")) {
%>
		 		PLP_JLPN_SH02='<%= PLP_JLPN_SH02_T%>'
<%
			}

			if(! PLP_JLPN_SH03_T.equals("")) {
%>
		 		PLP_JLPN_SH03='<%= PLP_JLPN_SH03_T%>'
<%
			}

			if(! PLP_JLPN_SHDS_T.equals("")) {
%>
		 		PLP_JLPN_SHDS='<%= PLP_JLPN_SHDS_T%>'
<%
			}

			if(! PLP_JLPN_DOCV_T.equals("")) {
%>
		 		PLP_JLPN_DOCV='<%= PLP_JLPN_DOCV_T%>'
<%
			}

			if(! PLP_JLPN_TTPN_T.equals("")) {
%>
		 		PLP_JLPN_TTPN='<%= PLP_JLPN_TTPN_T%>'
<%
			}

			if(! PLP_JLPN_WORK_T.equals("")) {
%>
		 		PLP_JLPN_WORK='<%= PLP_JLPN_WORK_T%>'
<%
			}

			if(! PLP_JLPN_SFLG_T.equals("")) {
%>
		 		PLP_JLPN_SFLG='<%= PLP_JLPN_SFLG_T%>'
<%
			}

			if(! PLP_JLPN_INDT_T.equals("")) {
%>
		 		PLP_JLPN_INDT='<%= PLP_JLPN_INDT_T%>'
<%
			}

			if(! PLP_JLPN_INID_T.equals("")) {
%>
		 		PLP_JLPN_INID='<%= PLP_JLPN_INID_T%>'
<%
			}

			if(! PLP_JLPN_LTDT_T.equals("")) {
%>
		 		PLP_JLPN_LTDT='<%= PLP_JLPN_LTDT_T%>'
<%
			}

			if(! PLP_JLPN_LTID_T.equals("")) {
%>
		 		PLP_JLPN_LTID='<%= PLP_JLPN_LTID_T%>'
<%
			}

			if(! PLP_ETC_EX_T.equals("")) {
%>
		 		PLP_ETC_EX='<%= PLP_ETC_EX_T%>'
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
