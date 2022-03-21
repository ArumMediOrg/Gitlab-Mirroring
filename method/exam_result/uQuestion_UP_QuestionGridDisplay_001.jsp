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
		String CUST_NO = htMethod.get("CUST_NO");
		String ITEM_CD = htMethod.get("ITEM_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT TOP 1 EEA_EXAM_DT, EEA_EXAM_SQ
  FROM ET_EXAM_ACPT A
 INNER JOIN ET_RSLT_ITEM B
    ON A.EEA_EXAM_DT = B.ERI_EXAM_DT
   AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ
 INNER JOIN IT_ITEM C
    ON B.ERI_ITEM_CD = C.IIM_ITEM_CD
   AND C.IIM_EXGN_CD = 'M'
 WHERE A.EEA_EXAM_DT < :EXAM_DT
   AND A.EEA_CUST_NO = :CUST_NO
   AND B.ERI_ITEM_CD = :ITEM_CD
 ORDER BY EEA_EXAM_DT DESC
		*/

		sql = " SELECT *";
		sql += " FROM (";
		sql += "	SELECT EEA_EXAM_DT, EEA_EXAM_SQ";
		sql += " 	FROM ET_EXAM_ACPT A INNER JOIN ET_RSLT_ITEM B";
		sql += " 	ON A.EEA_EXAM_DT = B.ERI_EXAM_DT";
		sql += " 	AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ INNER JOIN IT_ITEM C";
		sql += " 	ON B.ERI_ITEM_CD = C.IIM_ITEM_CD";
		sql += " 	AND C.IIM_EXGN_CD = 'M'";
		sql += " 	WHERE A.EEA_EXAM_DT < '" + EXAM_DT + "'";
		sql += " 	AND A.EEA_CUST_NO = '" + CUST_NO + "'";
		sql += " 	AND B.ERI_ITEM_CD = '" + ITEM_CD + "'";
		sql += " 	ORDER BY EEA_EXAM_DT DESC";
		sql += ")";
		sql += " WHERE ROWNUM = 1";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uQuestion_UP_QuestionGridDisplay_001 \n";
			G_INFO += "설명 : 과거문진가져오기(과거문진리스트) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
%>
			<z:row
<%
			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
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
