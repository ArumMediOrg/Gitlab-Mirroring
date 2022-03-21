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
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IIQ_ITEM_CD, IIQ_SORT_NO, IIQ_QGTN_CD, IIQ_ITQU_LV1, IIQ_ITQU_LV2, IIQ_ITQU_SQ, IIQ_ITQU_TX, QQN_RESULT, CQN_ANSE_EX, QQN_ANSR_CD, QQN_QSTN_CP
  FROM QT_QUESTION A
       INNER JOIN IT_ITEM_QUESTION B ON A.QQN_QSTN_CD = B.IIQ_QGTN_CD
                                    AND B.IIQ_ITEM_CD = 'M0045'
                                    AND B.IIQ_APLY_DT = GetITEM_QUESTION_ApplyDate('M0045', :EXAM_DT)
                                    AND B.IIQ_USE_YN = 'Y'
       LEFT OUTER JOIN CT_QUESTION C ON A.QQN_QSTN_CD = C.CQN_QSTN_CD
WHERE QQN_EXAM_DT = :EXAM_DT
  AND QQN_EXAM_SQ = :EXAM_SQ
||:sSQL_ADD
		*/

		sql = " SELECT IIQ_ITEM_CD, IIQ_SORT_NO, IIQ_QGTN_CD, IIQ_ITQU_LV1, IIQ_ITQU_LV2, IIQ_ITQU_SQ, IIQ_ITQU_TX, QQN_RESULT, CQN_ANSE_EX, QQN_ANSR_CD, QQN_QSTN_CP";
		sql += " FROM QT_QUESTION A INNER JOIN IT_ITEM_QUESTION B";
		sql += " ON A.QQN_QSTN_CD = B.IIQ_QGTN_CD";
		sql += " AND B.IIQ_ITEM_CD = 'M0045'";
		sql += " AND B.IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE('M0045', '" + EXAM_DT + "')";
		sql += " AND B.IIQ_USE_YN = 'Y' LEFT OUTER JOIN CT_QUESTION C";
		sql += " ON A.QQN_QSTN_CD = C.CQN_QSTN_CD";
		sql += " WHERE QQN_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND QQN_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_Btn_MunjinClick_001 \n";
			G_INFO += "설명 : 특검문진조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
		<s:AttributeType name='IIQ_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_SORT_NO' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_SORT_NO'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_QGTN_CD' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_QGTN_CD'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_LV1' rs:number='4' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_LV1'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_LV2' rs:number='5' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_LV2'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_SQ' rs:number='6' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_TX' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='IIQ_ITQU_TX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_RESULT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_RESULT'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_ANSE_EX' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_ANSE_EX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_ANSR_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_ANSR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_QSTN_CP' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_QSTN_CP'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='12' rs:rowid='true' rs:basetable='QT_QUESTION' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c12' rs:name='ROWID' rs:number='13' rs:rowid='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c13' rs:name='ROWID' rs:number='14' rs:rowid='true' rs:basetable='CT_QUESTION' rs:basecolumn='ROWID'
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

			String IIQ_ITEM_CD_T = cRsList.getString("IIQ_ITEM_CD");
			String IIQ_SORT_NO_T = cRsList.getString("IIQ_SORT_NO");
			String IIQ_QGTN_CD_T = cRsList.getString("IIQ_QGTN_CD");
			String IIQ_ITQU_LV1_T = cRsList.getString("IIQ_ITQU_LV1");
			String IIQ_ITQU_LV2_T = cRsList.getString("IIQ_ITQU_LV2");
			String IIQ_ITQU_SQ_T = cRsList.getString("IIQ_ITQU_SQ");
			String IIQ_ITQU_TX_T = cRsList.getString("IIQ_ITQU_TX");
			String QQN_RESULT_T = cRsList.getString("QQN_RESULT");
			String CQN_ANSE_EX_T = cRsList.getString("CQN_ANSE_EX");
			String QQN_ANSR_CD_T = cRsList.getString("QQN_ANSR_CD");
			String QQN_QSTN_CP_T = cRsList.getString("QQN_QSTN_CP");
			String ROWID_T = cRsList.getString("ROWID");
			String c12_T = cRsList.getString("c12");
			String c13_T = cRsList.getString("c13");
%>
			<z:row
<%
			if(! IIQ_ITEM_CD_T.equals("")) {
%>
		 		IIQ_ITEM_CD='<%= IIQ_ITEM_CD_T%>'
<%
			}

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

			if(! QQN_RESULT_T.equals("")) {
%>
		 		QQN_RESULT='<%= QQN_RESULT_T%>'
<%
			}

			if(! CQN_ANSE_EX_T.equals("")) {
%>
		 		CQN_ANSE_EX='<%= CQN_ANSE_EX_T%>'
<%
			}

			if(! QQN_ANSR_CD_T.equals("")) {
%>
		 		QQN_ANSR_CD='<%= QQN_ANSR_CD_T%>'
<%
			}

			if(! QQN_QSTN_CP_T.equals("")) {
%>
		 		QQN_QSTN_CP='<%= QQN_QSTN_CP_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c12='<%= cnt%>'
				c13='<%= cnt%>'
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
