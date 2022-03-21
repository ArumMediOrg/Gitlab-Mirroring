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
  FROM UB_EXAM_ACPT
 WHERE UB_EXAM_DT = :EXAM_DT
    AND UB_EXAM_SQ = :EXAM_SQ

		*/

		sql = " SELECT *";
		sql += " FROM UB_EXAM_ACPT";
		sql += " WHERE UB_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND UB_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_AlvAcptDblClick_001 \n";
			G_INFO += "설명 : 유비케어 개별 접수 조회 \n";
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
		<s:AttributeType name='UB_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT' rs:basecolumn='UB_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='8' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='UB_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT' rs:basecolumn='UB_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='UB_RVT_YN' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_RVT_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_RESULT_YN' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_RESULT_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_RESULT_DATE' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_RESULT_DATE'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='UB_COLLECT_YN' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_COLLECT_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_CHOICE_ITEM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_CHOICE_ITEM'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='UB_ADD_ITEM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_ADD_ITEM'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='UB_ADD_PRICE' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_ADD_PRICE'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='UB_COM_PR' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_COM_PR'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='UB_COMADD_PR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_COMADD_PR'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='UB_PDF_1' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_PDF_1'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_PDF_2' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_PDF_2'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_PDF_3' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_PDF_3'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_PDF_4' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_PDF_4'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_RESULT_PDF' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_RESULT_PDF'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_AGREE_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_AGREE_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_SEND_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_SEND_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_SERVICE_CD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_SERVICE_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_RECEIVE_YN' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_RECEIVE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='UB_GRADE_NM' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_GRADE_NM'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_STATUS' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='ARUM_STATUS'>
			<s:datatype dt:type='string' dt:maxLength='1500'/>
		</s:AttributeType>
		<s:AttributeType name='UB_START_DT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_START_DT'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='UB_END_DT' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_END_DT'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='UB_CHKST_DT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_CHKST_DT'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='UB_CHKEN_DT' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
			 rs:basecolumn='UB_CHKEN_DT'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='27' rs:rowid='true' rs:writeunknown='true' rs:basetable='UB_EXAM_ACPT'
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

			String UB_EXAM_DT_T = cRsList.getString("UB_EXAM_DT");
			String UB_EXAM_SQ_T = cRsList.getString("UB_EXAM_SQ");
			String UB_RVT_YN_T = cRsList.getString("UB_RVT_YN");
			String UB_RESULT_YN_T = cRsList.getString("UB_RESULT_YN");
			String UB_RESULT_DATE_T = cRsList.getString("UB_RESULT_DATE");
			String UB_COLLECT_YN_T = cRsList.getString("UB_COLLECT_YN");
			String UB_CHOICE_ITEM_T = cRsList.getString("UB_CHOICE_ITEM");
			String UB_ADD_ITEM_T = cRsList.getString("UB_ADD_ITEM");
			String UB_ADD_PRICE_T = cRsList.getString("UB_ADD_PRICE");
			String UB_COM_PR_T = cRsList.getString("UB_COM_PR");
			String UB_COMADD_PR_T = cRsList.getString("UB_COMADD_PR");
			String UB_PDF_1_T = cRsList.getString("UB_PDF_1");
			String UB_PDF_2_T = cRsList.getString("UB_PDF_2");
			String UB_PDF_3_T = cRsList.getString("UB_PDF_3");
			String UB_PDF_4_T = cRsList.getString("UB_PDF_4");
			String UB_RESULT_PDF_T = cRsList.getString("UB_RESULT_PDF");
			String UB_AGREE_CD_T = cRsList.getString("UB_AGREE_CD");
			String UB_SEND_CD_T = cRsList.getString("UB_SEND_CD");
			String UB_SERVICE_CD_T = cRsList.getString("UB_SERVICE_CD");
			String UB_RECEIVE_YN_T = cRsList.getString("UB_RECEIVE_YN");
			String UB_GRADE_NM_T = cRsList.getString("UB_GRADE_NM");
			String ARUM_STATUS_T = cRsList.getString("ARUM_STATUS");
			String UB_START_DT_T = cRsList.getString("UB_START_DT");
			String UB_END_DT_T = cRsList.getString("UB_END_DT");
			String UB_CHKST_DT_T = cRsList.getString("UB_CHKST_DT");
			String UB_CHKEN_DT_T = cRsList.getString("UB_CHKEN_DT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! UB_EXAM_DT_T.equals("")) {
%>
		 		UB_EXAM_DT='<%= UB_EXAM_DT_T%>'
<%
			}

			if(! UB_EXAM_SQ_T.equals("")) {
%>
		 		UB_EXAM_SQ='<%= UB_EXAM_SQ_T%>'
<%
			}

			if(! UB_RVT_YN_T.equals("")) {
%>
		 		UB_RVT_YN='<%= UB_RVT_YN_T%>'
<%
			}

			if(! UB_RESULT_YN_T.equals("")) {
%>
		 		UB_RESULT_YN='<%= UB_RESULT_YN_T%>'
<%
			}

			if(! UB_RESULT_DATE_T.equals("")) {
%>
		 		UB_RESULT_DATE='<%= UB_RESULT_DATE_T%>'
<%
			}

			if(! UB_COLLECT_YN_T.equals("")) {
%>
		 		UB_COLLECT_YN='<%= UB_COLLECT_YN_T%>'
<%
			}

			if(! UB_CHOICE_ITEM_T.equals("")) {
%>
		 		UB_CHOICE_ITEM='<%= UB_CHOICE_ITEM_T%>'
<%
			}

			if(! UB_ADD_ITEM_T.equals("")) {
%>
		 		UB_ADD_ITEM='<%= UB_ADD_ITEM_T%>'
<%
			}

			if(! UB_ADD_PRICE_T.equals("")) {
%>
		 		UB_ADD_PRICE='<%= UB_ADD_PRICE_T%>'
<%
			}

			if(! UB_COM_PR_T.equals("")) {
%>
		 		UB_COM_PR='<%= UB_COM_PR_T%>'
<%
			}

			if(! UB_COMADD_PR_T.equals("")) {
%>
		 		UB_COMADD_PR='<%= UB_COMADD_PR_T%>'
<%
			}

			if(! UB_PDF_1_T.equals("")) {
%>
		 		UB_PDF_1='<%= UB_PDF_1_T%>'
<%
			}

			if(! UB_PDF_2_T.equals("")) {
%>
		 		UB_PDF_2='<%= UB_PDF_2_T%>'
<%
			}

			if(! UB_PDF_3_T.equals("")) {
%>
		 		UB_PDF_3='<%= UB_PDF_3_T%>'
<%
			}

			if(! UB_PDF_4_T.equals("")) {
%>
		 		UB_PDF_4='<%= UB_PDF_4_T%>'
<%
			}

			if(! UB_RESULT_PDF_T.equals("")) {
%>
		 		UB_RESULT_PDF='<%= UB_RESULT_PDF_T%>'
<%
			}

			if(! UB_AGREE_CD_T.equals("")) {
%>
		 		UB_AGREE_CD='<%= UB_AGREE_CD_T%>'
<%
			}

			if(! UB_SEND_CD_T.equals("")) {
%>
		 		UB_SEND_CD='<%= UB_SEND_CD_T%>'
<%
			}

			if(! UB_SERVICE_CD_T.equals("")) {
%>
		 		UB_SERVICE_CD='<%= UB_SERVICE_CD_T%>'
<%
			}

			if(! UB_RECEIVE_YN_T.equals("")) {
%>
		 		UB_RECEIVE_YN='<%= UB_RECEIVE_YN_T%>'
<%
			}

			if(! UB_GRADE_NM_T.equals("")) {
%>
		 		UB_GRADE_NM='<%= UB_GRADE_NM_T%>'
<%
			}

			if(! ARUM_STATUS_T.equals("")) {
%>
		 		ARUM_STATUS='<%= ARUM_STATUS_T%>'
<%
			}

			if(! UB_START_DT_T.equals("")) {
%>
		 		UB_START_DT='<%= UB_START_DT_T%>'
<%
			}

			if(! UB_END_DT_T.equals("")) {
%>
		 		UB_END_DT='<%= UB_END_DT_T%>'
<%
			}

			if(! UB_CHKST_DT_T.equals("")) {
%>
		 		UB_CHKST_DT='<%= UB_CHKST_DT_T%>'
<%
			}

			if(! UB_CHKEN_DT_T.equals("")) {
%>
		 		UB_CHKEN_DT='<%= UB_CHKEN_DT_T%>'
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
