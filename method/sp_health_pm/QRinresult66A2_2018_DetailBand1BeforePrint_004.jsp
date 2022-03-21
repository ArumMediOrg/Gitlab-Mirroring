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

SELECT NVL(B.QQN_RESULT,'0') QQN_RESULT, C.CQN_QSTN_CD
  FROM IT_ITEM_QUESTION A                                  
 INNER JOIN QT_QUESTION B ON A.IIQ_QGTN_CD = B.QQN_QSTN_CD 
                         AND B.QQN_EXAM_DT = :EXAM_DT
                         AND B.QQN_EXAM_SQ = :EXAM_SQ
  LEFT OUTER JOIN CT_QUESTION C ON A.IIQ_QGTN_CD = C.CQN_QSTN_CD
 WHERE A.IIQ_ITEM_CD = 'M0019'
   AND A.IIQ_APLY_DT = GetITEM_QUESTION_ApplyDate('M0019',:EXAM_DT)
   AND A.IIQ_USE_YN = 'Y'
 ORDER BY A.IIQ_SORT_NO

		*/

		sql = " SELECT NVL(B.QQN_RESULT,'0') QQN_RESULT, C.CQN_QSTN_CD";
		sql += " FROM IT_ITEM_QUESTION A";
		
		sql += " INNER JOIN QT_QUESTION B";
		sql += " ON A.IIQ_QGTN_CD = B.QQN_QSTN_CD";
		sql += " AND B.QQN_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND B.QQN_EXAM_SQ = '" + EXAM_SQ + "'";
		
		sql += " LEFT OUTER JOIN CT_QUESTION C";
		sql += " ON A.IIQ_QGTN_CD = C.CQN_QSTN_CD";

		sql += " WHERE A.IIQ_ITEM_CD = 'M0019'";
		sql += " AND A.IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE('M0019','" + EXAM_DT + "')";
		sql += " AND A.IIQ_USE_YN = 'Y'";
		sql += " ORDER BY A.IIQ_SORT_NO";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : QRinresult66A2_2018_DetailBand1BeforePrint_004 \n";
			G_INFO += "설명 : 문진정보 로딩 \n";
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
		<s:AttributeType name='QQN_RESULT' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_QSTN_CD'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c3' rs:name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='QT_QUESTION' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c4' rs:name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='CT_QUESTION' rs:basecolumn='ROWID'
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

			String QQN_RESULT_T = cRsList.getString("QQN_RESULT");
			String CQN_QSTN_CD_T = cRsList.getString("CQN_QSTN_CD");
			String ROWID_T = cRsList.getString("ROWID");
			String c3_T = cRsList.getString("c3");
			String c4_T = cRsList.getString("c4");
%>
			<z:row
<%
			if(! QQN_RESULT_T.equals("")) {
%>
		 		QQN_RESULT='<%= QQN_RESULT_T%>'
<%
			}

			if(! CQN_QSTN_CD_T.equals("")) {
%>
		 		CQN_QSTN_CD='<%= CQN_QSTN_CD_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c3='<%= cnt%>'
				c4='<%= cnt%>'
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
