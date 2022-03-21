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

Select * From QT_QUESTION_SCORE
Where QQS_EXAM_DT = :EXAM_DT
  And QQS_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT *";
		sql += " FROM QT_QUESTION_SCORE";
		sql += " WHERE QQS_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND QQS_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uQuestion_UP_QuestionSave_004 \n";
			G_INFO += "설명 : 야간문진 점수(확인) \n";
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
		<s:AttributeType name='QQS_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='QT_QUESTION_SCORE' rs:basecolumn='QQS_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='QQS_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='QT_QUESTION_SCORE' rs:basecolumn='QQS_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='QQS_M0047' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION_SCORE'
			 rs:basecolumn='QQS_M0047'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='QQS_M0048' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION_SCORE'
			 rs:basecolumn='QQS_M0048'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='QQS_M0050' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION_SCORE'
			 rs:basecolumn='QQS_M0050'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='QQS_M0051' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION_SCORE'
			 rs:basecolumn='QQS_M0051'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:writeunknown='true' rs:basetable='QT_QUESTION_SCORE'
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

			String QQS_EXAM_DT_T = cRsList.getString("QQS_EXAM_DT");
			String QQS_EXAM_SQ_T = cRsList.getString("QQS_EXAM_SQ");
			String QQS_M0047_T = cRsList.getString("QQS_M0047");
			String QQS_M0048_T = cRsList.getString("QQS_M0048");
			String QQS_M0050_T = cRsList.getString("QQS_M0050");
			String QQS_M0051_T = cRsList.getString("QQS_M0051");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! QQS_EXAM_DT_T.equals("")) {
%>
		 		QQS_EXAM_DT='<%= QQS_EXAM_DT_T%>'
<%
			}

			if(! QQS_EXAM_SQ_T.equals("")) {
%>
		 		QQS_EXAM_SQ='<%= QQS_EXAM_SQ_T%>'
<%
			}

			if(! QQS_M0047_T.equals("")) {
%>
		 		QQS_M0047='<%= QQS_M0047_T%>'
<%
			}

			if(! QQS_M0048_T.equals("")) {
%>
		 		QQS_M0048='<%= QQS_M0048_T%>'
<%
			}

			if(! QQS_M0050_T.equals("")) {
%>
		 		QQS_M0050='<%= QQS_M0050_T%>'
<%
			}

			if(! QQS_M0051_T.equals("")) {
%>
		 		QQS_M0051='<%= QQS_M0051_T%>'
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
