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

Select * From ST_BILLHN_PR
 Where SBP_EXAM_DT = :EXAM_DT
   And SBP_EXAM_SQ = :EXAM_SQ
   And SBP_CHUNG_NO <> ''
   And SBP_RETURN_KD = '0'
		*/

		sql = " SELECT *";
		sql += " FROM ST_BILLHN_PR";
		sql += " WHERE SBP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND SBP_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SBP_CHUNG_NO <> ''";
		sql += " AND SBP_RETURN_KD = '0'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_GrdEXAM_ACPTSelectionChanged_023 \n";
			G_INFO += "설명 : 특검청구파일 조회(1차) \n";
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
		<s:AttributeType name='SBP_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR' rs:basecolumn='SBP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR' rs:basecolumn='SBP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_CHUNG_KD' rs:number='3' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR' rs:basecolumn='SBP_CHUNG_KD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_COMP_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SPB_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_CHUNG_YY' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_CHUNG_YY'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_CHUNG_DT' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_CHUNG_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_CHUNG_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_CHUNG_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_RETURN_KD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_RETURN_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_BILL_FL' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_BILL_FL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_BILL_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_BILL_NO'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_BIAD_KD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_BIAD_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_BILL_PR' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_BILL_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_BILLE_DT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_BILLE_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_BILBE_NO' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_BILBE_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_INPUT_ID' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_INPUT_DTT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_MODI_DTT' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_MODI_ID' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='19' rs:rowid='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
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

			String SBP_EXAM_DT_T = cRsList.getString("SBP_EXAM_DT");
			String SBP_EXAM_SQ_T = cRsList.getString("SBP_EXAM_SQ");
			String SBP_CHUNG_KD_T = cRsList.getString("SBP_CHUNG_KD");
			String SPB_COMP_CD_T = cRsList.getString("SPB_COMP_CD");
			String SBP_CHUNG_YY_T = cRsList.getString("SBP_CHUNG_YY");
			String SBP_CHUNG_DT_T = cRsList.getString("SBP_CHUNG_DT");
			String SBP_CHUNG_NO_T = cRsList.getString("SBP_CHUNG_NO");
			String SBP_RETURN_KD_T = cRsList.getString("SBP_RETURN_KD");
			String SBP_BILL_FL_T = cRsList.getString("SBP_BILL_FL");
			String SBP_BILL_NO_T = cRsList.getString("SBP_BILL_NO");
			String SBP_BIAD_KD_T = cRsList.getString("SBP_BIAD_KD");
			String SBP_BILL_PR_T = cRsList.getString("SBP_BILL_PR");
			String SBP_BILLE_DT_T = cRsList.getString("SBP_BILLE_DT");
			String SBP_BILBE_NO_T = cRsList.getString("SBP_BILBE_NO");
			String SBP_INPUT_ID_T = cRsList.getString("SBP_INPUT_ID");
			String SBP_INPUT_DTT_T = cRsList.getDate2("SBP_INPUT_DTT");
			String SBP_MODI_DTT_T = cRsList.getDate2("SBP_MODI_DTT");
			String SBP_MODI_ID_T = cRsList.getString("SBP_MODI_ID");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! SBP_EXAM_DT_T.equals("")) {
%>
		 		SBP_EXAM_DT='<%= SBP_EXAM_DT_T%>'
<%
			}

			if(! SBP_EXAM_SQ_T.equals("")) {
%>
		 		SBP_EXAM_SQ='<%= SBP_EXAM_SQ_T%>'
<%
			}

			if(! SBP_CHUNG_KD_T.equals("")) {
%>
		 		SBP_CHUNG_KD='<%= SBP_CHUNG_KD_T%>'
<%
			}

			if(! SPB_COMP_CD_T.equals("")) {
%>
		 		SPB_COMP_CD='<%= SPB_COMP_CD_T%>'
<%
			}

			if(! SBP_CHUNG_YY_T.equals("")) {
%>
		 		SBP_CHUNG_YY='<%= SBP_CHUNG_YY_T%>'
<%
			}

			if(! SBP_CHUNG_DT_T.equals("")) {
%>
		 		SBP_CHUNG_DT='<%= SBP_CHUNG_DT_T%>'
<%
			}

			if(! SBP_CHUNG_NO_T.equals("")) {
%>
		 		SBP_CHUNG_NO='<%= SBP_CHUNG_NO_T%>'
<%
			}

			if(! SBP_RETURN_KD_T.equals("")) {
%>
		 		SBP_RETURN_KD='<%= SBP_RETURN_KD_T%>'
<%
			}

			if(! SBP_BILL_FL_T.equals("")) {
%>
		 		SBP_BILL_FL='<%= SBP_BILL_FL_T%>'
<%
			}

			if(! SBP_BILL_NO_T.equals("")) {
%>
		 		SBP_BILL_NO='<%= SBP_BILL_NO_T%>'
<%
			}

			if(! SBP_BIAD_KD_T.equals("")) {
%>
		 		SBP_BIAD_KD='<%= SBP_BIAD_KD_T%>'
<%
			}

			if(! SBP_BILL_PR_T.equals("")) {
%>
		 		SBP_BILL_PR='<%= SBP_BILL_PR_T%>'
<%
			}

			if(! SBP_BILLE_DT_T.equals("")) {
%>
		 		SBP_BILLE_DT='<%= SBP_BILLE_DT_T%>'
<%
			}

			if(! SBP_BILBE_NO_T.equals("")) {
%>
		 		SBP_BILBE_NO='<%= SBP_BILBE_NO_T%>'
<%
			}

			if(! SBP_INPUT_ID_T.equals("")) {
%>
		 		SBP_INPUT_ID='<%= SBP_INPUT_ID_T%>'
<%
			}

			if(! SBP_INPUT_DTT_T.equals("")) {
%>
		 		SBP_INPUT_DTT='<%= SBP_INPUT_DTT_T%>'
<%
			}

			if(! SBP_MODI_DTT_T.equals("")) {
%>
		 		SBP_MODI_DTT='<%= SBP_MODI_DTT_T%>'
<%
			}

			if(! SBP_MODI_ID_T.equals("")) {
%>
		 		SBP_MODI_ID='<%= SBP_MODI_ID_T%>'
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
