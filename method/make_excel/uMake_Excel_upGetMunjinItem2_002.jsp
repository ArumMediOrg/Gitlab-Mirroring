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
		String ITEM_CD = htMethod.get("ITEM_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select
 A.IIQ_SORT_NO, A.IIQ_QGTN_CD, A.IIQ_ITQU_LV1, A.IIQ_ITQU_LV2, A.IIQ_ITQU_SQ,
 A.IIQ_ITQU_TX, B.CQN_ANSR_CD, B.CQN_ANSE_EX,  C.QQN_RESULT
From IT_ITEM_QUESTION A
Inner Join CT_QUESTION B On B.CQN_QSTN_CD = A.IIQ_QGTN_CD
Left Outer JOIN QT_QUESTION C On C.QQN_EXAM_DT = :EXAM_DT
                             And C.QQN_EXAM_SQ = :EXAM_SQ
                             And C.QQN_USE_YN = 'Y'
                             And C.QQN_QSTN_CD = A.IIQ_QGTN_CD
 Where A.IIQ_ITEM_CD = :ITEM_CD
  And A.IIQ_APLY_DT = GetITEM_QUESTION_ApplyDate(:ITEM_CD, :EXAM_DT)
  And A.IIQ_USE_YN = 'Y'
ORDER BY A.IIQ_SORT_NO

		*/

		sql = " SELECT A.IIQ_SORT_NO, A.IIQ_QGTN_CD, A.IIQ_ITQU_LV1, A.IIQ_ITQU_LV2, A.IIQ_ITQU_SQ, A.IIQ_ITQU_TX, B.CQN_ANSR_CD, B.CQN_ANSE_EX, C.QQN_RESULT";
		sql += " FROM IT_ITEM_QUESTION A INNER JOIN CT_QUESTION B";
		sql += " ON B.CQN_QSTN_CD = A.IIQ_QGTN_CD LEFT OUTER JOIN QT_QUESTION C";
		sql += " ON C.QQN_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND C.QQN_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND C.QQN_USE_YN = 'Y'";
		sql += " AND C.QQN_QSTN_CD = A.IIQ_QGTN_CD";
		sql += " WHERE A.IIQ_ITEM_CD = '" + ITEM_CD + "'";
		sql += " AND A.IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE('" + ITEM_CD + "', '" + EXAM_DT + "')";
		sql += " AND A.IIQ_USE_YN = 'Y'";
		sql += " ORDER BY A.IIQ_SORT_NO";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMake_Excel_upGetMunjinItem2_002 \n";
			G_INFO += "설명 : 문진정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
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
		<s:AttributeType name='IIQ_SORT_NO' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_SORT_NO'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_QGTN_CD' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_QGTN_CD'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_LV1' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_LV1'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_LV2' rs:number='4' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_LV2'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_SQ' rs:number='5' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_TX' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='IIQ_ITQU_TX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_ANSR_CD' rs:number='7' rs:writeunknown='true' rs:basetable='CT_QUESTION' rs:basecolumn='CQN_ANSR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_ANSE_EX' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_ANSE_EX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_RESULT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_RESULT'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c10' rs:name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='CT_QUESTION' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c11' rs:name='ROWID' rs:number='12' rs:rowid='true' rs:basetable='QT_QUESTION' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String IIQ_SORT_NO_T = cRsList.getString("IIQ_SORT_NO");
			String IIQ_QGTN_CD_T = cRsList.getString("IIQ_QGTN_CD");
			String IIQ_ITQU_LV1_T = cRsList.getString("IIQ_ITQU_LV1");
			String IIQ_ITQU_LV2_T = cRsList.getString("IIQ_ITQU_LV2");
			String IIQ_ITQU_SQ_T = cRsList.getString("IIQ_ITQU_SQ");
			String IIQ_ITQU_TX_T = cRsList.getString("IIQ_ITQU_TX");
			String CQN_ANSR_CD_T = cRsList.getString("CQN_ANSR_CD");
			String CQN_ANSE_EX_T = cRsList.getString("CQN_ANSE_EX");
			String QQN_RESULT_T = cRsList.getString("QQN_RESULT");
			String ROWID_T = cRsList.getString("ROWID");
			String c10_T = cRsList.getString("c10");
			String c11_T = cRsList.getString("c11");
%>
			<z:row
<%
			if(! IIQ_SORT_NO_T.equals("")) {
%>
		 		IIQ_SORT_NO='<%= IIQ_SORT_NO_T%>'
<%
			}

			if(! IIQ_QGTN_CD_T.equals("")) {
%>
		 		IIQ_QGTN_CD='<%= IIQ_QGTN_CD_T%>'
<%
			}

			if(! IIQ_ITQU_LV1_T.equals("")) {
%>
		 		IIQ_ITQU_LV1='<%= IIQ_ITQU_LV1_T%>'
<%
			}

			if(! IIQ_ITQU_LV2_T.equals("")) {
%>
		 		IIQ_ITQU_LV2='<%= IIQ_ITQU_LV2_T%>'
<%
			}

			if(! IIQ_ITQU_SQ_T.equals("")) {
%>
		 		IIQ_ITQU_SQ='<%= IIQ_ITQU_SQ_T%>'
<%
			}

			if(! IIQ_ITQU_TX_T.equals("")) {
%>
		 		IIQ_ITQU_TX='<%= IIQ_ITQU_TX_T%>'
<%
			}

			if(! CQN_ANSR_CD_T.equals("")) {
%>
		 		CQN_ANSR_CD='<%= CQN_ANSR_CD_T%>'
<%
			}

			if(! CQN_ANSE_EX_T.equals("")) {
%>
		 		CQN_ANSE_EX='<%= CQN_ANSE_EX_T%>'
<%
			}

			if(! QQN_RESULT_T.equals("")) {
%>
		 		QQN_RESULT='<%= QQN_RESULT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c10='<%= cnt%>'
				c11='<%= cnt%>'
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
