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

		String RECE_DT = htMethod.get("RECE_DT");
		String RECE_NO = htMethod.get("RECE_NO");

		//
		if(RECE_DT == null) { RECE_DT = ""; }
		if(RECE_NO == null) { RECE_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select sum(RRM_RECE_TD_PR)  RRM_RECE_TD_PR,  sum(RRM_SALE_TD_PR) RRM_SALE_TD_PR,
       sum(RRM_TRUNC_TD_PR) RRM_TRUNC_TD_PR, sum(RRM_RETURN_PR)  RRM_RETURN_PR
from
(
  select  NVL(RRM_RECE_TD_PR,0) RRM_RECE_TD_PR,
          NVL(RRM_SALE_TD_PR,0) RRM_SALE_TD_PR, NVL(RRM_TRUNC_TD_PR,0) RRM_TRUNC_TD_PR,
          case when RRM_OCCU_KD in('70','71') then NVL(RRM_RETURN_PR,0) else 0 end  RRM_RETURN_PR
  from RT_RECE_MEDICHK
  where RRM_RECE_DT = :RECE_DT
    and RRM_RECE_NO = :RECE_NO
) a
		*/

		sql = " SELECT SUM(RRM_RECE_TD_PR) RRM_RECE_TD_PR, SUM(RRM_SALE_TD_PR) RRM_SALE_TD_PR, SUM(RRM_TRUNC_TD_PR) RRM_TRUNC_TD_PR, SUM(RRM_RETURN_PR) RRM_RETURN_PR";
		sql += " FROM (";
		sql += "	SELECT NVL(RRM_RECE_TD_PR,0) RRM_RECE_TD_PR, NVL(RRM_SALE_TD_PR,0) RRM_SALE_TD_PR, NVL(RRM_TRUNC_TD_PR,0) RRM_TRUNC_TD_PR";
		sql += "	, CASE WHEN RRM_OCCU_KD IN('70','71') THEN NVL(RRM_RETURN_PR,0) ELSE 0 END RRM_RETURN_PR";
		sql += " 	FROM RT_RECE_MEDICHK";
		sql += " 	WHERE RRM_RECE_DT = '" + RECE_DT + "'";
		sql += " 	AND RRM_RECE_NO = '" + RECE_NO + "'";
		sql += " ) A";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBt_RaceSugi_Subdiv_rzrecedtChange_002 \n";
			G_INFO += "설명 : 당일 기 수납액(정상수납액) 등 select \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RECE_DT : " + RECE_DT + " \n";
			G_INFO += " RECE_NO : " + RECE_NO + " \n";
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
		<s:AttributeType name='RRM_RECE_TD_PR' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_SALE_TD_PR' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_TRUNC_TD_PR' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RETURN_PR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String RRM_RECE_TD_PR_T = cRsList.getString("RRM_RECE_TD_PR");
			String RRM_SALE_TD_PR_T = cRsList.getString("RRM_SALE_TD_PR");
			String RRM_TRUNC_TD_PR_T = cRsList.getString("RRM_TRUNC_TD_PR");
			String RRM_RETURN_PR_T = cRsList.getString("RRM_RETURN_PR");
%>
			<z:row
<%
			if(! RRM_RECE_TD_PR_T.equals("")) {
%>
		 		RRM_RECE_TD_PR='<%= RRM_RECE_TD_PR_T%>'
<%
			}

			if(! RRM_SALE_TD_PR_T.equals("")) {
%>
		 		RRM_SALE_TD_PR='<%= RRM_SALE_TD_PR_T%>'
<%
			}

			if(! RRM_TRUNC_TD_PR_T.equals("")) {
%>
		 		RRM_TRUNC_TD_PR='<%= RRM_TRUNC_TD_PR_T%>'
<%
			}

			if(! RRM_RETURN_PR_T.equals("")) {
%>
		 		RRM_RETURN_PR='<%= RRM_RETURN_PR_T%>'
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
