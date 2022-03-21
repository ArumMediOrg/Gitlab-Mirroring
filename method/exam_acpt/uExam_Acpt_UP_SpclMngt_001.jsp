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
		String EXAM_DT = htMethod.get("EXAM_DT");

		//
		if(CUST_NO == null) { CUST_NO = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT FST_DT
  FROM (SELECT REPLACE(SIR_EXAM_DT, '-', '') FST_DT 
          FROM ST_ITEM_RECHECK A, ET_EXAM_ACPT B
         WHERE SIR_CUST_NO = :CUST_NO
           AND SUBSTR(SIR_EXAM_DT, 1, 4) = :EXAM_DT
           AND EEA_EXAM_DT = SIR_EXAM_DT 
           AND EEA_EXAM_SQ = SIR_EXAM_SQ 
           AND EEA_ORDER_YN <> 'C'
         ORDER BY SIR_EXAM_DT DESC, SIR_EXAM_SQ DESC
       ) A
 WHERE ROWNUM = 1

		*/

		sql = " SELECT FST_DT";
		sql += " FROM (";
		sql += "	SELECT REPLACE(SIR_EXAM_DT, '-', '') FST_DT";
		sql += " 	FROM ST_ITEM_RECHECK A, ET_EXAM_ACPT B";
		sql += " 	WHERE SIR_CUST_NO = '" + CUST_NO + "'";
		sql += " 	AND SUBSTR(SIR_EXAM_DT, 1, 4) = '" + EXAM_DT + "'";
		sql += " 	AND EEA_EXAM_DT = SIR_EXAM_DT";
		sql += " 	AND EEA_EXAM_SQ = SIR_EXAM_SQ";
		sql += " 	AND EEA_ORDER_YN <> 'C'";
		sql += " 	ORDER BY SIR_EXAM_DT DESC, SIR_EXAM_SQ DESC";
		sql += ") A";
		sql += " WHERE ROWNUM = 1";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_UP_SpclMngt_001 \n";
			G_INFO += "설명 : 특검1차 접수일자 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
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
		<s:AttributeType name='FST_DT' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='2' rs:rowid='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c2' rs:name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
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

			String FST_DT_T = cRsList.getString("FST_DT");
			String ROWID_T = cRsList.getString("ROWID");
			String c2_T = cRsList.getString("c2");
%>
			<z:row
<%
			if(! FST_DT_T.equals("")) {
%>
		 		FST_DT='<%= FST_DT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c2_T.equals("")) {
%>
		 		c2='<%= c2_T%>'
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
