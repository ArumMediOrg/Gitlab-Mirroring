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

SELECT BBP_CHUNG_KD, BBP_CHUNG_NO
  FROM BT_BILLHN_PR
 WHERE BBP_RETURN_KD = '0'
   AND BBP_EXAM_DT = :EXAM_DT
   AND BBP_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT BBP_CHUNG_KD, BBP_CHUNG_NO";
		sql += " FROM BT_BILLHN_PR";
		sql += " WHERE BBP_RETURN_KD = '0'";
		sql += " AND BBP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND BBP_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Result_upGetClaimNo_001 \n";
			G_INFO += "설명 : 청구번호 조회 \n";
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
		<s:AttributeType name='BBP_CHUNG_KD' rs:number='1' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='BBP_CHUNG_KD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BBP_CHUNG_NO' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_BILLHN_PR'
			 rs:basecolumn='BBP_CHUNG_NO'>
			<s:datatype dt:type='string' dt:maxLength='14'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='BT_BILLHN_PR' rs:basecolumn='ROWID'
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

			String BBP_CHUNG_KD_T = cRsList.getString("BBP_CHUNG_KD");
			String BBP_CHUNG_NO_T = cRsList.getString("BBP_CHUNG_NO");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! BBP_CHUNG_KD_T.equals("")) {
%>
		 		BBP_CHUNG_KD='<%= BBP_CHUNG_KD_T%>'
<%
			}

			if(! BBP_CHUNG_NO_T.equals("")) {
%>
		 		BBP_CHUNG_NO='<%= BBP_CHUNG_NO_T%>'
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
