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

SELECT * FROM QT_QUESTION 
 WHERE QQN_EXAM_DT = :EXAM_DT
   AND QQN_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT *";
		sql += " FROM QT_QUESTION";
		sql += " WHERE QQN_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND QQN_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Pnjn_UP_MunjinSave_001 \n";
			G_INFO += "설명 : 학생/학교밖검진 문진 조회 \n";
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
		<s:AttributeType name='QQN_CUST_NO' rs:number='3' rs:writeunknown='true' rs:basetable='QT_QUESTION' rs:basecolumn='QQN_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_QSTN_CD' rs:number='4' rs:writeunknown='true' rs:basetable='QT_QUESTION' rs:basecolumn='QQN_QSTN_CD'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_ANSR_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_ANSR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_QSTN_CP' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_QSTN_CP'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_RESULT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_RESULT'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_SCORE' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_SCORE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_SCORE_YN' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_SCORE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_USE_YN' rs:number='10' rs:writeunknown='true' rs:basetable='QT_QUESTION' rs:basecolumn='QQN_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_INPT_ID' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_INPT_DTT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_MODI_ID' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_MODI_DTT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='15' rs:rowid='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String QQN_EXAM_DT_T = cRsList.getString("QQN_EXAM_DT");
			String QQN_EXAM_SQ_T = cRsList.getString("QQN_EXAM_SQ");
			String QQN_CUST_NO_T = cRsList.getString("QQN_CUST_NO");
			String QQN_QSTN_CD_T = cRsList.getString("QQN_QSTN_CD");
			String QQN_ANSR_CD_T = cRsList.getString("QQN_ANSR_CD");
			String QQN_QSTN_CP_T = cRsList.getString("QQN_QSTN_CP");
			String QQN_RESULT_T = cRsList.getString("QQN_RESULT");
			String QQN_SCORE_T = cRsList.getString("QQN_SCORE");
			String QQN_SCORE_YN_T = cRsList.getString("QQN_SCORE_YN");
			String QQN_USE_YN_T = cRsList.getString("QQN_USE_YN");
			String QQN_INPT_ID_T = cRsList.getString("QQN_INPT_ID");
			String QQN_INPT_DTT_T = cRsList.getDate2("QQN_INPT_DTT");
			String QQN_MODI_ID_T = cRsList.getString("QQN_MODI_ID");
			String QQN_MODI_DTT_T = cRsList.getDate2("QQN_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
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

			if(! QQN_CUST_NO_T.equals("")) {
%>
		 		QQN_CUST_NO='<%= QQN_CUST_NO_T%>'
<%
			}

			if(! QQN_QSTN_CD_T.equals("")) {
%>
		 		QQN_QSTN_CD='<%= QQN_QSTN_CD_T%>'
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

			if(! QQN_RESULT_T.equals("")) {
%>
		 		QQN_RESULT='<%= QQN_RESULT_T%>'
<%
			}

			if(! QQN_SCORE_T.equals("")) {
%>
		 		QQN_SCORE='<%= QQN_SCORE_T%>'
<%
			}

			if(! QQN_SCORE_YN_T.equals("")) {
%>
		 		QQN_SCORE_YN='<%= QQN_SCORE_YN_T%>'
<%
			}

			if(! QQN_USE_YN_T.equals("")) {
%>
		 		QQN_USE_YN='<%= QQN_USE_YN_T%>'
<%
			}

			if(! QQN_INPT_ID_T.equals("")) {
%>
		 		QQN_INPT_ID='<%= QQN_INPT_ID_T%>'
<%
			}

			if(! QQN_INPT_DTT_T.equals("")) {
%>
		 		QQN_INPT_DTT='<%= QQN_INPT_DTT_T%>'
<%
			}

			if(! QQN_MODI_ID_T.equals("")) {
%>
		 		QQN_MODI_ID='<%= QQN_MODI_ID_T%>'
<%
			}

			if(! QQN_MODI_DTT_T.equals("")) {
%>
		 		QQN_MODI_DTT='<%= QQN_MODI_DTT_T%>'
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
