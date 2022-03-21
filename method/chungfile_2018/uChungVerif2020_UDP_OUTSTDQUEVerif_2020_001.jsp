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

SELECT QQN_EXAM_DT,QQN_EXAM_SQ,QQN_QSTN_CD,QQN_RESULT,IIQ_ITEM_CD ,IIQ_SORT_NO,IIQ_ITQU_TX,ICR_BIRH_DT,EEA_SEX_CD
FROM QT_QUESTION A
     LEFT OUTER JOIN ET_EXAM_ACPT B ON A.QQN_EXAM_DT=B.EEA_EXAM_DT AND A.QQN_EXAM_SQ=B.EEA_EXAM_SQ
     LEFT OUTER JOIN IT_ITEM_QUESTION C ON A.QQN_QSTN_CD=C.IIQ_QGTN_CD
     LEFT OUTER JOIN IT_CUSTOMER D ON B.EEA_CUST_NO=D.ICR_CUST_NO
 where A.QQN_EXAM_DT= :EXAM_DT
   AND A.QQN_EXAM_SQ= :EXAM_SQ
   AND IIQ_ITEM_CD IN('M0054')
   AND EEA_EXAM_CD in('31006')
   order by IIQ_SORT_NO
		*/

		sql = " SELECT QQN_EXAM_DT,QQN_EXAM_SQ,QQN_QSTN_CD,QQN_RESULT,IIQ_ITEM_CD ,IIQ_SORT_NO,IIQ_ITQU_TX,ICR_BIRH_DT,EEA_SEX_CD";
		sql += " FROM QT_QUESTION A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " ON A.QQN_EXAM_DT=B.EEA_EXAM_DT";
		sql += " AND A.QQN_EXAM_SQ=B.EEA_EXAM_SQ LEFT OUTER JOIN IT_ITEM_QUESTION C";
		sql += " ON A.QQN_QSTN_CD=C.IIQ_QGTN_CD LEFT OUTER JOIN IT_CUSTOMER D";
		sql += " ON B.EEA_CUST_NO=D.ICR_CUST_NO";
		sql += " WHERE A.QQN_EXAM_DT= '" + EXAM_DT + "'";
		sql += " AND A.QQN_EXAM_SQ= '" + EXAM_SQ + "'";
		sql += " AND IIQ_ITEM_CD IN('M0054')";
		sql += " AND EEA_EXAM_CD IN('31006')";
		sql += " ORDER BY IIQ_SORT_NO";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChungVerif2020_UDP_OUTSTDQUEVerif_2020_001 \n";
			G_INFO += "설명 : 학교밖 문진 성적확인 \n";
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
		<s:AttributeType name='QQN_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='QT_QUESTION' rs:basecolumn='QQN_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='QT_QUESTION' rs:basecolumn='QQN_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_QSTN_CD' rs:number='3' rs:writeunknown='true' rs:basetable='QT_QUESTION' rs:basecolumn='QQN_QSTN_CD'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_RESULT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_RESULT'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITEM_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='IIQ_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_SORT_NO' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='IIQ_SORT_NO'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_TX' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='IIQ_ITQU_TX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='QT_QUESTION' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c10' rs:name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c11' rs:name='ROWID' rs:number='12' rs:rowid='true' rs:basetable='IT_ITEM_QUESTION'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c12' rs:name='ROWID' rs:number='13' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
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
			String QQN_QSTN_CD_T = cRsList.getString("QQN_QSTN_CD");
			String QQN_RESULT_T = cRsList.getString("QQN_RESULT");
			String IIQ_ITEM_CD_T = cRsList.getString("IIQ_ITEM_CD");
			String IIQ_SORT_NO_T = cRsList.getString("IIQ_SORT_NO");
			String IIQ_ITQU_TX_T = cRsList.getString("IIQ_ITQU_TX");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String ROWID_T = cRsList.getString("ROWID");
			String c10_T = cRsList.getString("c10");
			String c11_T = cRsList.getString("c11");
			String c12_T = cRsList.getString("c12");
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

			if(! QQN_QSTN_CD_T.equals("")) {
%>
		 		QQN_QSTN_CD='<%= QQN_QSTN_CD_T%>'
<%
			}

			if(! QQN_RESULT_T.equals("")) {
%>
		 		QQN_RESULT='<%= QQN_RESULT_T%>'
<%
			}

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

			if(! IIQ_ITQU_TX_T.equals("")) {
%>
		 		IIQ_ITQU_TX='<%= IIQ_ITQU_TX_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c10='<%= cnt%>'
				c11='<%= cnt%>'
				c12='<%= cnt%>'
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
