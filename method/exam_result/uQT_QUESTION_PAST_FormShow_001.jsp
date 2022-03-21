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

		String CUST_NO = htMethod.get("CUST_NO");

		//
		if(CUST_NO == null) { CUST_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT QQN_EXAM_DT, QQN_EXAM_SQ
  FROM QT_QUESTION, ET_EXAM_ACPT
 WHERE EEA_CUST_NO = :CUST_NO
   AND EEA_EXAM_DT = QQN_EXAM_DT
   AND EEA_EXAM_SQ = QQN_EXAM_SQ
 GROUP BY QQN_EXAM_DT, QQN_EXAM_SQ
 ORDER BY QQN_EXAM_DT DESC
		*/

		sql = " SELECT QQN_EXAM_DT, QQN_EXAM_SQ";
		sql += " FROM QT_QUESTION, ET_EXAM_ACPT";
		sql += " WHERE EEA_CUST_NO = '" + CUST_NO + "'";
		sql += " AND EEA_EXAM_DT = QQN_EXAM_DT";
		sql += " AND EEA_EXAM_SQ = QQN_EXAM_SQ";
		sql += " GROUP BY QQN_EXAM_DT, QQN_EXAM_SQ";
		sql += " ORDER BY QQN_EXAM_DT DESC";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uQT_QUESTION_PAST_FormShow_001 \n";
			G_INFO += "설명 : 과거문진리스트조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
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
		<s:AttributeType name='QQN_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='QT_QUESTION' rs:basecolumn='QQN_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='QT_QUESTION' rs:basecolumn='QQN_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='QT_QUESTION' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c3' rs:name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
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

			String QQN_EXAM_DT_T = cRsList.getString("QQN_EXAM_DT");
			String QQN_EXAM_SQ_T = cRsList.getString("QQN_EXAM_SQ");
			String ROWID_T = cRsList.getString("ROWID");
			String c3_T = cRsList.getString("c3");
%>
			<z:row
<%
			if(! QQN_EXAM_DT_T.equals("")) {
%>
		 		QQN_EXAM_DT='<%= QQN_EXAM_DT_T%>'
<%
			}

			if(! QQN_EXAM_SQ_T.equals("")) {
%>
		 		QQN_EXAM_SQ='<%= QQN_EXAM_SQ_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c3='<%= cnt%>'
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
