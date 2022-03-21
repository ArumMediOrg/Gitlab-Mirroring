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

		String ORDER_DT = htMethod.get("ORDER_DT");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(ORDER_DT == null) { ORDER_DT = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select sum(EEP_PSNLTD_PR) EEP_PSNLTD_PR, sum(EEP_PSNLAF_PR) EEP_PSNLAF_PR from
(
  select case when EEP_ORDER_DT = :ORDER_DT then EEP_PSNL_PR else 0 end EEP_PSNLTD_PR ,
         case when EEP_ORDER_DT = :ORDER_DT then 0 else EEP_PSNL_PR end EEP_PSNLAF_PR
  from ET_EXAM_PRICE
  where EEP_EXAM_DT = :EXAM_DT  and EEP_EXAM_SQ = :EXAM_SQ and EEP_ORDER_DT = :ORDER_DT
) a
		*/

		sql = " SELECT SUM(EEP_PSNLTD_PR) EEP_PSNLTD_PR, SUM(EEP_PSNLAF_PR) EEP_PSNLAF_PR";
		sql += " FROM (";
		sql += "	SELECT CASE WHEN EEP_ORDER_DT = '" + ORDER_DT + "' THEN EEP_PSNL_PR ELSE 0 END EEP_PSNLTD_PR";
		sql += "	, CASE WHEN EEP_ORDER_DT = '" + ORDER_DT + "' THEN 0 ELSE EEP_PSNL_PR END EEP_PSNLAF_PR";
		sql += " 	FROM ET_EXAM_PRICE";
		sql += " 	WHERE EEP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND EEP_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " 	AND EEP_ORDER_DT = '" + ORDER_DT + "'";
		sql += " ) A";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBt_RaceSugi_Subdiv_rzrecedtChange_001 \n";
			G_INFO += "설명 : 당일수납/미수금(회수) 수납 대상금액 select \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ORDER_DT : " + ORDER_DT + " \n";
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
		<s:AttributeType name='EEP_PSNLTD_PR' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EEP_PSNLAF_PR' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEP_PSNLTD_PR_T = cRsList.getString("EEP_PSNLTD_PR");
			String EEP_PSNLAF_PR_T = cRsList.getString("EEP_PSNLAF_PR");
%>
			<z:row
<%
			if(! EEP_PSNLTD_PR_T.equals("")) {
%>
		 		EEP_PSNLTD_PR='<%= EEP_PSNLTD_PR_T%>'
<%
			}

			if(! EEP_PSNLAF_PR_T.equals("")) {
%>
		 		EEP_PSNLAF_PR='<%= EEP_PSNLAF_PR_T%>'
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
