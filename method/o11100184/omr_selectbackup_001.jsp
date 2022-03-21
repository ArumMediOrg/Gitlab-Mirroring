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

		String FIRST_DATE = htMethod.get("FIRST_DATE");
		String SECOND_DATE = htMethod.get("SECOND_DATE");

		//
		if(FIRST_DATE == null) { FIRST_DATE = ""; }
		if(SECOND_DATE == null) { SECOND_DATE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * 
FROM ARUM_TOTAL
WHERE REQUEST_DATE BETWEEN :first_date AND :second_date
AND CDBURN = 'N'
ORDER BY REQUEST_DATE, FILENAME
		*/

		sql = " SELECT *";
		sql += " FROM ARUM_TOTAL";
		sql += " WHERE REQUEST_DATE BETWEEN '" + FIRST_DATE + "'";
		sql += " AND '" + SECOND_DATE + "'";
		sql += " AND CDBURN = 'N'";
		sql += " ORDER BY REQUEST_DATE, FILENAME";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : omr_selectbackup_001 \n";
			G_INFO += "설명 : OMR 백업조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " FIRST_DATE : " + FIRST_DATE + " \n";
			G_INFO += " SECOND_DATE : " + SECOND_DATE + " \n";
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
		<s:AttributeType name='REQUEST_DATE' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='REQUEST_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SCANDATE' rs:number='2' rs:writeunknown='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='SCANDATE'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='FORMNAME' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='FORMNAME'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='EXAM_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CUST_NO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CHART_NO' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NAME' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='EXAM_NAME'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='JUMIN1' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='JUMIN1'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='JUMIN2' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='JUMIN2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='AGE' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='AGE'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='GENDER' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='GENDER'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SERIAL' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='SERIAL'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='FILENAME' rs:number='13' rs:writeunknown='true' rs:basetable='ARUM_TOTAL' rs:basecolumn='FILENAME'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PERSONINFO' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='PERSONINFO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='OMRYN' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='OMRYN'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SENDYN' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='SENDYN'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='VALUYN' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='VALUYN'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='INDEXYN' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='INDEXYN'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='LOGINID' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='LOGINID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='VALUE1' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='VALUE1'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='VALUE2' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='VALUE2'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CDBURN' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='CDBURN'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CDNUMBER' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='CDNUMBER'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='URL_INFO' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
			 rs:basecolumn='URL_INFO'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='25' rs:rowid='true' rs:writeunknown='true' rs:basetable='ARUM_TOTAL'
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

			String REQUEST_DATE_T = cRsList.getString("REQUEST_DATE");
			String SCANDATE_T = cRsList.getString("SCANDATE");
			String FORMNAME_T = cRsList.getString("FORMNAME");
			String EXAM_NO_T = cRsList.getString("EXAM_NO");
			String CUST_NO_T = cRsList.getString("CUST_NO");
			String CHART_NO_T = cRsList.getString("CHART_NO");
			String EXAM_NAME_T = cRsList.getString("EXAM_NAME");
			String JUMIN1_T = cRsList.getString("JUMIN1");
			String JUMIN2_T = cRsList.getString("JUMIN2");
			String AGE_T = cRsList.getString("AGE");
			String GENDER_T = cRsList.getString("GENDER");
			String SERIAL_T = cRsList.getString("SERIAL");
			String FILENAME_T = cRsList.getString("FILENAME");
			String PERSONINFO_T = cRsList.getString("PERSONINFO");
			String OMRYN_T = cRsList.getString("OMRYN");
			String SENDYN_T = cRsList.getString("SENDYN");
			String VALUYN_T = cRsList.getString("VALUYN");
			String INDEXYN_T = cRsList.getString("INDEXYN");
			String LOGINID_T = cRsList.getString("LOGINID");
			String VALUE1_T = cRsList.getString("VALUE1");
			String VALUE2_T = cRsList.getString("VALUE2");
			String CDBURN_T = cRsList.getString("CDBURN");
			String CDNUMBER_T = cRsList.getString("CDNUMBER");
			String URL_INFO_T = cRsList.getString("URL_INFO");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! REQUEST_DATE_T.equals("")) {
%>
		 		REQUEST_DATE='<%= REQUEST_DATE_T%>'
<%
			}

			if(! SCANDATE_T.equals("")) {
%>
		 		SCANDATE='<%= SCANDATE_T%>'
<%
			}

			if(! FORMNAME_T.equals("")) {
%>
		 		FORMNAME='<%= FORMNAME_T%>'
<%
			}

			if(! EXAM_NO_T.equals("")) {
%>
		 		EXAM_NO='<%= EXAM_NO_T%>'
<%
			}

			if(! CUST_NO_T.equals("")) {
%>
		 		CUST_NO='<%= CUST_NO_T%>'
<%
			}

			if(! CHART_NO_T.equals("")) {
%>
		 		CHART_NO='<%= CHART_NO_T%>'
<%
			}

			if(! EXAM_NAME_T.equals("")) {
%>
		 		EXAM_NAME='<%= EXAM_NAME_T%>'
<%
			}

			if(! JUMIN1_T.equals("")) {
%>
		 		JUMIN1='<%= JUMIN1_T%>'
<%
			}

			if(! JUMIN2_T.equals("")) {
%>
		 		JUMIN2='<%= JUMIN2_T%>'
<%
			}

			if(! AGE_T.equals("")) {
%>
		 		AGE='<%= AGE_T%>'
<%
			}

			if(! GENDER_T.equals("")) {
%>
		 		GENDER='<%= GENDER_T%>'
<%
			}

			if(! SERIAL_T.equals("")) {
%>
		 		SERIAL='<%= SERIAL_T%>'
<%
			}

			if(! FILENAME_T.equals("")) {
%>
		 		FILENAME='<%= FILENAME_T%>'
<%
			}

			if(! PERSONINFO_T.equals("")) {
%>
		 		PERSONINFO='<%= PERSONINFO_T%>'
<%
			}

			if(! OMRYN_T.equals("")) {
%>
		 		OMRYN='<%= OMRYN_T%>'
<%
			}

			if(! SENDYN_T.equals("")) {
%>
		 		SENDYN='<%= SENDYN_T%>'
<%
			}

			if(! VALUYN_T.equals("")) {
%>
		 		VALUYN='<%= VALUYN_T%>'
<%
			}

			if(! INDEXYN_T.equals("")) {
%>
		 		INDEXYN='<%= INDEXYN_T%>'
<%
			}

			if(! LOGINID_T.equals("")) {
%>
		 		LOGINID='<%= LOGINID_T%>'
<%
			}

			if(! VALUE1_T.equals("")) {
%>
		 		VALUE1='<%= VALUE1_T%>'
<%
			}

			if(! VALUE2_T.equals("")) {
%>
		 		VALUE2='<%= VALUE2_T%>'
<%
			}

			if(! CDBURN_T.equals("")) {
%>
		 		CDBURN='<%= CDBURN_T%>'
<%
			}

			if(! CDNUMBER_T.equals("")) {
%>
		 		CDNUMBER='<%= CDNUMBER_T%>'
<%
			}

			if(! URL_INFO_T.equals("")) {
%>
		 		URL_INFO='<%= URL_INFO_T%>'
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
