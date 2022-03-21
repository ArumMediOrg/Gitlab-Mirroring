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

		String CHUNG_NM = htMethod.get("CHUNG_NM");

		//
		if(CHUNG_NM == null) { CHUNG_NM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT 
SBP_EXAM_DT,SBP_EXAM_SQ,ICR_PENL_ID,ICR_PENL_NM, SBP_BILL_FL, SBP_BILL_PR AMT
FROM ST_BILLHN_PR A
LEFT OUTER JOIN ET_EXAM_ACPT B ON A.SBP_EXAM_DT = B.EEA_EXAM_DT
                              AND A.SBP_EXAM_SQ = B.EEA_EXAM_SQ
LEFT OUTER JOIN IT_CUSTOMER C  ON B.EEA_CUST_NO = C.ICR_CUST_NO
WHERE SBP_BILL_FL = :CHUNG_NM
 AND SBP_RETURN_KD = '0'                              

		*/

		sql = " SELECT SBP_EXAM_DT,SBP_EXAM_SQ,ICR_PENL_ID,ICR_PENL_NM, SBP_BILL_FL, SBP_BILL_PR AMT";
		sql += " FROM ST_BILLHN_PR A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " ON A.SBP_EXAM_DT = B.EEA_EXAM_DT";
		sql += " AND A.SBP_EXAM_SQ = B.EEA_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER C";
		sql += " ON B.EEA_CUST_NO = C.ICR_CUST_NO";
		sql += " WHERE SBP_BILL_FL = '" + CHUNG_NM + "'";
		sql += " AND SBP_RETURN_KD = '0'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubT_Rece_Up_afLoadSanbo_002 \n";
			G_INFO += "설명 : 산보청구 인원별 금액 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHUNG_NM : " + CHUNG_NM + " \n";
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
		<s:AttributeType name='ICR_PENL_ID' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='SBP_BILL_FL' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_BILL_FL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='AMT' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BILLHN_PR'
			 rs:basecolumn='SBP_BILL_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='ST_BILLHN_PR' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c7' rs:name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c8' rs:name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
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

			String SBP_EXAM_DT_T = cRsList.getString("SBP_EXAM_DT");
			String SBP_EXAM_SQ_T = cRsList.getString("SBP_EXAM_SQ");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String ICR_PENL_NM_T = cRsList.getString("ICR_PENL_NM");
			String SBP_BILL_FL_T = cRsList.getString("SBP_BILL_FL");
			String AMT_T = cRsList.getString("AMT");
			String ROWID_T = cRsList.getString("ROWID");
			String c7_T = cRsList.getString("c7");
			String c8_T = cRsList.getString("c8");
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

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! ICR_PENL_NM_T.equals("")) {
%>
		 		ICR_PENL_NM='<%= ICR_PENL_NM_T%>'
<%
			}

			if(! SBP_BILL_FL_T.equals("")) {
%>
		 		SBP_BILL_FL='<%= SBP_BILL_FL_T%>'
<%
			}

			if(! AMT_T.equals("")) {
%>
		 		AMT='<%= AMT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c7_T.equals("")) {
%>
		 		c7='<%= c7_T%>'
<%
			}

			if(! c8_T.equals("")) {
%>
		 		c8='<%= c8_T%>'
<%
			}
%>
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
