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

Select Distinct IIQ.IIQ_ITQU_TX, QQ.QQN_RESULT From IT_ITEM_QUESTION IIQ
 Inner Join QT_QUESTION QQ ON IIQ.IIQ_QGTN_CD = QQ.QQN_QSTN_CD
                          AND QQ.QQN_EXAM_DT = :EXAM_DT
                          AND QQ.QQN_EXAM_SQ = :EXAM_SQ
                          And QQ.QQN_RESULT = '1'
 Where IIQ.IIQ_ITEM_CD = 'M0018'
   And (IIQ.IIQ_ITQU_TX Like '[진단여부]%' Or IIQ.IIQ_ITQU_TX Like '[약물치료여부]%')
   AND IIQ.IIQ_USE_YN = 'Y'
 ORDER BY IIQ.IIQ_ITQU_TX
		*/

		sql = " SELECT DISTINCT IIQ.IIQ_ITQU_TX, QQ.QQN_RESULT";
		sql += " FROM IT_ITEM_QUESTION IIQ INNER JOIN QT_QUESTION QQ";
		sql += " ON IIQ.IIQ_QGTN_CD = QQ.QQN_QSTN_CD";
		sql += " AND QQ.QQN_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND QQ.QQN_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND QQ.QQN_RESULT = '1'";
		sql += " WHERE IIQ.IIQ_ITEM_CD = 'M0018'";
		sql += " AND (IIQ.IIQ_ITQU_TX LIKE '[진단여부]%'";
		sql += " OR IIQ.IIQ_ITQU_TX LIKE '[약물치료여부]%')";
		sql += " AND IIQ.IIQ_USE_YN = 'Y'";
		sql += " ORDER BY IIQ.IIQ_ITQU_TX";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_GrdEXAM_ACPTSelectionChanged_003 \n";
			G_INFO += "설명 : 문진 약물치료여부 조회 \n";
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
		<s:AttributeType name='IIQ_ITQU_TX' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='IIQ_ITQU_TX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_RESULT' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_RESULT'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c3' rs:name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='QT_QUESTION' rs:basecolumn='ROWID'
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

			String IIQ_ITQU_TX_T = cRsList.getString("IIQ_ITQU_TX");
			String QQN_RESULT_T = cRsList.getString("QQN_RESULT");
			String ROWID_T = cRsList.getString("ROWID");
			String c3_T = cRsList.getString("c3");
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
				ROWID='<%= cnt%>'
<%
			if(! c3_T.equals("")) {
%>
		 		c3='<%= c3_T%>'
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
