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
		String EXAM_CHA = htMethod.get("EXAM_CHA");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(EXAM_CHA == null) { EXAM_CHA = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select * From ST_PASTJOB
 Where SPB_EXAM_DT  = :EXAM_DT
   And SPB_EXAM_SQ  = :EXAM_SQ
   And SPB_EXAM_CHA = :EXAM_CHA
		*/

		sql = " SELECT *";
		sql += " FROM ST_PASTJOB";
		sql += " WHERE SPB_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND SPB_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SPB_EXAM_CHA = '" + EXAM_CHA + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_GrdEXAM_ACPTSelectionChanged_013 \n";
			G_INFO += "설명 : 특검 과거직력 조회(1차) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " EXAM_CHA : " + EXAM_CHA + " \n";
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
		<s:AttributeType name='SPB_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ST_PASTJOB' rs:basecolumn='SPB_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ST_PASTJOB' rs:basecolumn='SPB_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_EXAM_CHA' rs:number='3' rs:writeunknown='true' rs:basetable='ST_PASTJOB' rs:basecolumn='SPB_EXAM_CHA'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_GOJU_SQ' rs:number='4' rs:writeunknown='true' rs:basetable='ST_PASTJOB' rs:basecolumn='SPB_GOJU_SQ'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_GOJU_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_GOJU_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_YEAR_VAL' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_YEAR_VAL'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_FROM_DT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_FROM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_TO_DT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_TO_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_ETC_TX' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_ETC_TX'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_INPT_ID' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_INPT_DTT' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='12' rs:rowid='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
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

			String SPB_EXAM_DT_T = cRsList.getString("SPB_EXAM_DT");
			String SPB_EXAM_SQ_T = cRsList.getString("SPB_EXAM_SQ");
			String SPB_EXAM_CHA_T = cRsList.getString("SPB_EXAM_CHA");
			String SPB_GOJU_SQ_T = cRsList.getString("SPB_GOJU_SQ");
			String SPB_GOJU_CD_T = cRsList.getString("SPB_GOJU_CD");
			String SPB_YEAR_VAL_T = cRsList.getString("SPB_YEAR_VAL");
			String SPB_FROM_DT_T = cRsList.getString("SPB_FROM_DT");
			String SPB_TO_DT_T = cRsList.getString("SPB_TO_DT");
			String SPB_ETC_TX_T = cRsList.getString("SPB_ETC_TX");
			String SPB_INPT_ID_T = cRsList.getString("SPB_INPT_ID");
			String SPB_INPT_DTT_T = cRsList.getDate2("SPB_INPT_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! SPB_EXAM_DT_T.equals("")) {
%>
		 		SPB_EXAM_DT='<%= SPB_EXAM_DT_T%>'
<%
			}

			if(! SPB_EXAM_SQ_T.equals("")) {
%>
		 		SPB_EXAM_SQ='<%= SPB_EXAM_SQ_T%>'
<%
			}

			if(! SPB_EXAM_CHA_T.equals("")) {
%>
		 		SPB_EXAM_CHA='<%= SPB_EXAM_CHA_T%>'
<%
			}

			if(! SPB_GOJU_SQ_T.equals("")) {
%>
		 		SPB_GOJU_SQ='<%= SPB_GOJU_SQ_T%>'
<%
			}

			if(! SPB_GOJU_CD_T.equals("")) {
%>
		 		SPB_GOJU_CD='<%= SPB_GOJU_CD_T%>'
<%
			}

			if(! SPB_YEAR_VAL_T.equals("")) {
%>
		 		SPB_YEAR_VAL='<%= SPB_YEAR_VAL_T%>'
<%
			}

			if(! SPB_FROM_DT_T.equals("")) {
%>
		 		SPB_FROM_DT='<%= SPB_FROM_DT_T%>'
<%
			}

			if(! SPB_TO_DT_T.equals("")) {
%>
		 		SPB_TO_DT='<%= SPB_TO_DT_T%>'
<%
			}

			if(! SPB_ETC_TX_T.equals("")) {
%>
		 		SPB_ETC_TX='<%= SPB_ETC_TX_T%>'
<%
			}

			if(! SPB_INPT_ID_T.equals("")) {
%>
		 		SPB_INPT_ID='<%= SPB_INPT_ID_T%>'
<%
			}

			if(! SPB_INPT_DTT_T.equals("")) {
%>
		 		SPB_INPT_DTT='<%= SPB_INPT_DTT_T%>'
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
