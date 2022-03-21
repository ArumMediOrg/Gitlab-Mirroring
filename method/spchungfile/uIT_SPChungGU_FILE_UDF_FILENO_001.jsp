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

		String CHUNG_DT = htMethod.get("CHUNG_DT");
		String BILL_FL_11_2 = htMethod.get("BILL_FL_11_2");
		String CHUNG_KD = htMethod.get("CHUNG_KD");

		//
		if(CHUNG_DT == null) { CHUNG_DT = ""; }
		if(BILL_FL_11_2 == null) { BILL_FL_11_2 = ""; }
		if(CHUNG_KD == null) { CHUNG_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT NVL(MAX(SBP_BILL_NO),1) Max_no FROM ST_BILLHN_PR
 WHERE SBP_CHUNG_DT = :CHUNG_DT
   AND SUBSTR(SBP_BILL_FL,11,2) = :BILL_FL_11_2  AND SBP_CHUNG_KD = :CHUNG_KD
		*/

		sql = " SELECT NVL(MAX(SBP_BILL_NO),1) MAX_NO";
		sql += " FROM ST_BILLHN_PR";
		sql += " WHERE SBP_CHUNG_DT = '" + CHUNG_DT + "'";
		sql += " AND SUBSTR(SBP_BILL_FL,11,2) = '" + BILL_FL_11_2 + "'";
		sql += " AND SBP_CHUNG_KD = '" + CHUNG_KD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_SPChungGU_FILE_UDF_FILENO_001 \n";
			G_INFO += "설명 : 청구파일 최종순번확인 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHUNG_DT : " + CHUNG_DT + " \n";
			G_INFO += " BILL_FL_11_2 : " + BILL_FL_11_2 + " \n";
			G_INFO += " CHUNG_KD : " + CHUNG_KD + " \n";
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
		<s:AttributeType name='MAX_NO' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String MAX_NO_T = cRsList.getString("MAX_NO");
%>
			<z:row
<%
			if(! MAX_NO_T.equals("")) {
%>
		 		MAX_NO='<%= MAX_NO_T%>'
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
