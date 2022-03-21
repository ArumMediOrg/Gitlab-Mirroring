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
		String HTSB_CD = htMethod.get("HTSB_CD");

		//
		if(CUST_NO == null) { CUST_NO = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(HTSB_CD == null) { HTSB_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT EEA_EXAM_DT, EEA_EXAM_SQ
  FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ
          FROM ET_EXAM_ACPT
         WHERE EEA_CUST_NO = :CUST_NO
           AND EEA_EXAM_DT >= :EXAM_DT 
           AND EEA_HTSB_CD = :HTSB_CD
           AND EEA_ORDER_YN <> 'C'
         ORDER BY EEA_EXAM_DT DESC, EEA_EXAM_SQ DESC
       ) A
 WHERE ROWNUM = 1

		*/

		sql = " SELECT EEA_EXAM_DT, EEA_EXAM_SQ";
		sql += " FROM (";
		sql += "	SELECT EEA_EXAM_DT, EEA_EXAM_SQ";
		sql += " 	FROM ET_EXAM_ACPT";
		sql += " 	WHERE EEA_CUST_NO = '" + CUST_NO + "'";
		sql += " 	AND EEA_EXAM_DT >= '" + EXAM_DT + "'";
		sql += " 	AND EEA_HTSB_CD = '" + HTSB_CD + "'";
		sql += " 	AND EEA_ORDER_YN <> 'C'";
		sql += " 	ORDER BY EEA_EXAM_DT DESC, EEA_EXAM_SQ DESC";
		sql += ") A";
		sql += " WHERE ROWNUM = 1";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_UP_FindFstPnjn_003 \n";
			G_INFO += "설명 : 일검 1차 검진이후 2차 검진 여부 확인 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " HTSB_CD : " + HTSB_CD + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
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

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String ROWID_T = cRsList.getString("ROWID");
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
