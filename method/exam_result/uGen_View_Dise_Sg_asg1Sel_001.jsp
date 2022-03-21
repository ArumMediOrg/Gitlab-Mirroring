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

SELECT IIQ_ITQU_TX,  CASE WHEN QQN_RESULT ='1' THEN '√' ELSE '' END  QQN_RESULT
  FROM QT_QUESTION A
  LEFT OUTER JOIN IT_ITEM_QUESTION B
    ON a.QQN_QSTN_CD = b.IIQ_QGTN_CD
   AND IIQ_ITEM_CD = 'M0018'
 WHERE QQN_EXAM_DT = :EXAM_DT
   and QQN_EXAM_SQ = :EXAM_SQ
   AND IIQ_APLY_DT = GetITEM_QUESTION_ApplyDate('M0018', :EXAM_DT )
   AND IIQ_ITQU_LV1 = '1'
		*/

		sql = " SELECT IIQ_ITQU_TX, CASE WHEN QQN_RESULT ='1' THEN '√' ELSE '' END QQN_RESULT";
		sql += " FROM QT_QUESTION A LEFT OUTER JOIN IT_ITEM_QUESTION B";
		sql += " ON A.QQN_QSTN_CD = B.IIQ_QGTN_CD";
		sql += " AND IIQ_ITEM_CD = 'M0018'";
		sql += " WHERE QQN_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND QQN_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE('M0018', '" + EXAM_DT + "')";
		sql += " AND IIQ_ITQU_LV1 = '1'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGen_View_Dise_Sg_asg1Sel_001 \n";
			G_INFO += "설명 : 일검1차 질환력보기 \n";
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
		<s:AttributeType name='IIQ_ITQU_TX' rs:number='1' rs:nullable='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_TX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_RESULT' rs:number='2' rs:nullable='true' rs:basetable='QT_QUESTION' rs:basecolumn='QQN_RESULT'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String IIQ_ITQU_TX_T = cRsList.getString("IIQ_ITQU_TX");
			String QQN_RESULT_T = cRsList.getString("QQN_RESULT");
%>
			<z:row
<%
			if(! IIQ_ITQU_TX_T.equals("")) {
%>
		 		IIQ_ITQU_TX='<%= IIQ_ITQU_TX_T%>'
<%
			}

			if(! QQN_RESULT_T.equals("")) {
%>
		 		QQN_RESULT='<%= QQN_RESULT_T%>'
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
