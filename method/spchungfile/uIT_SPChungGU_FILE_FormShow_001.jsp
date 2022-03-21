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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT MAX(S0240) S0240, MAX(S0241) S0241, MAX(S0242) S0242, MAX(S0243) S0243
  FROM (SELECT MAX(IIP_APLY_DT) IIP_APLY_DT, IIP_ITEM_CD,
               CASE WHEN IIP_ITEM_CD = 'S0240' THEN MAX(IIP_SBSG_PR) END S0240,
               CASE WHEN IIP_ITEM_CD = 'S0241' THEN MAX(IIP_SBSG_PR) END S0241,
               CASE WHEN IIP_ITEM_CD = 'S0242' THEN MAX(IIP_SBSG_PR) END S0242,
               CASE WHEN IIP_ITEM_CD = 'S0243' THEN MAX(IIP_SBSG_PR) END S0243
          FROM IT_ITEM_PRICE
         WHERE IIP_ITEM_CD IN ('S0240','S0241','S0242','S0243')
         GROUP BY IIP_ITEM_CD
       ) DD
		*/

		sql = " SELECT MAX(S0240) S0240, MAX(S0241) S0241, MAX(S0242) S0242, MAX(S0243) S0243";
		sql += " FROM (SELECT MAX(IIP_APLY_DT) IIP_APLY_DT, IIP_ITEM_CD, CASE WHEN IIP_ITEM_CD = 'S0240' THEN MAX(IIP_SBSG_PR) END S0240, CASE WHEN IIP_ITEM_CD = 'S0241' THEN MAX(IIP_SBSG_PR) END S0241, CASE WHEN IIP_ITEM_CD = 'S0242' THEN MAX(IIP_SBSG_PR) END S0242, CASE WHEN IIP_ITEM_CD = 'S0243' THEN MAX(IIP_SBSG_PR) END S0243";
		sql += " FROM IT_ITEM_PRICE";
		sql += " WHERE IIP_ITEM_CD IN ('S0240','S0241','S0242','S0243')";
		sql += " GROUP BY IIP_ITEM_CD ) DD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_SPChungGU_FILE_FormShow_001 \n";
			G_INFO += "설명 : Xray 재료대 금액 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='S0240' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='S0241' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='S0242' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='S0243' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String S0240_T = cRsList.getString("S0240");
			String S0241_T = cRsList.getString("S0241");
			String S0242_T = cRsList.getString("S0242");
			String S0243_T = cRsList.getString("S0243");
%>
			<z:row
<%
			if(! S0240_T.equals("")) {
%>
		 		S0240='<%= S0240_T%>'
<%
			}

			if(! S0241_T.equals("")) {
%>
		 		S0241='<%= S0241_T%>'
<%
			}

			if(! S0242_T.equals("")) {
%>
		 		S0242='<%= S0242_T%>'
<%
			}

			if(! S0243_T.equals("")) {
%>
		 		S0243='<%= S0243_T%>'
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
