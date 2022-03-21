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

		String RSVN_NO = htMethod.get("RSVN_NO");

		//
		if(RSVN_NO == null) { RSVN_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select NVL(SUM(RRT_PSNL_PR),0) || NVL(SUM(RRT_COMP_PR),0) RRT_PSNL_PR
  from RT_RSVT
 where RRT_RSVN_NO = :RSVN_NO
		*/

		sql = " SELECT NVL(SUM(RRT_PSNL_PR),0) || NVL(SUM(RRT_COMP_PR),0) RRT_PSNL_PR";
		sql += " FROM RT_RSVT";
		sql += " WHERE RRT_RSVN_NO = '" + RSVN_NO + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ReturnSave_FormShow_001 \n";
			G_INFO += "설명 : 현재 예약대상금액 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
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
		<s:AttributeType name='RRT_PSNL_PR' rs:number='1' rs:nullable='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_PSNL_PR'>
			<s:datatype dt:type='string' dt:maxLength='80'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String RRT_PSNL_PR_T = cRsList.getString("RRT_PSNL_PR");
%>
			<z:row
<%
			if(! RRT_PSNL_PR_T.equals("")) {
%>
		 		RRT_PSNL_PR='<%= RRT_PSNL_PR_T%>'
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
