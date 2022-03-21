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

		String SDATE = htMethod.get("SDATE");
		String EDATE = htMethod.get("EDATE");

		//
		if(SDATE == null) { SDATE = ""; }
		if(EDATE == null) { EDATE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.ITK_PUB_COMP_CD, C.ITC_COMP_NM, NVL(TOTALCOUNT, 0) TOTALCOUNT, NVL(USECOUNT, 0) USECOUNT
FROM (SELECT ITK_PUB_COMP_CD, COUNT(*) TOTALCOUNT
      FROM IT_TICKET
      WHERE ITK_S_DT BETWEEN :sDate  AND :eDate
      GROUP BY ITK_PUB_COMP_CD) A
 LEFT OUTER JOIN (SELECT ITK_PUB_COMP_CD, Count(*) USECOUNT
                  FROM IT_TICKET
                  WHERE ITK_S_DT BETWEEN  :sDate  AND :eDate
                   AND ITK_USE_YN = 'Y'
                  GROUP BY ITK_PUB_COMP_CD) B
  ON A.ITK_PUB_COMP_CD = B.ITK_PUB_COMP_CD
   INNER JOIN IT_TICKET_COMP C
    ON A.ITK_PUB_COMP_CD = C.ITC_COMP_CD
		*/

		sql = " SELECT A.ITK_PUB_COMP_CD, C.ITC_COMP_NM, NVL(TOTALCOUNT, 0) TOTALCOUNT, NVL(USECOUNT, 0) USECOUNT";
		sql += " FROM (SELECT ITK_PUB_COMP_CD, COUNT(*) TOTALCOUNT";
		sql += " FROM IT_TICKET";
		sql += " WHERE ITK_S_DT BETWEEN '" + SDATE + "'";
		sql += " AND '" + EDATE + "'";
		sql += " GROUP BY ITK_PUB_COMP_CD) A LEFT OUTER JOIN (SELECT ITK_PUB_COMP_CD, COUNT(*) USECOUNT";
		sql += " FROM IT_TICKET";
		sql += " WHERE ITK_S_DT BETWEEN '" + SDATE + "'";
		sql += " AND '" + EDATE + "'";
		sql += " AND ITK_USE_YN = 'Y'";
		sql += " GROUP BY ITK_PUB_COMP_CD) B";
		sql += " ON A.ITK_PUB_COMP_CD = B.ITK_PUB_COMP_CD INNER JOIN IT_TICKET_COMP C";
		sql += " ON A.ITK_PUB_COMP_CD = C.ITC_COMP_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Ticket_btnS4_SearchClick_001 \n";
			G_INFO += "설명 : 업체별 검진권 통계 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SDATE : " + SDATE + " \n";
			G_INFO += " EDATE : " + EDATE + " \n";
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
		<s:AttributeType name='ITK_PUB_COMP_CD' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITC_COMP_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='TOTALCOUNT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='USECOUNT' rs:number='4' rs:nullable='true'>
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

			String ITK_PUB_COMP_CD_T = cRsList.getString("ITK_PUB_COMP_CD");
			String ITC_COMP_NM_T = cRsList.getString("ITC_COMP_NM");
			String TOTALCOUNT_T = cRsList.getString("TOTALCOUNT");
			String USECOUNT_T = cRsList.getString("USECOUNT");
%>
			<z:row
<%
			if(! ITK_PUB_COMP_CD_T.equals("")) {
%>
		 		ITK_PUB_COMP_CD='<%= ITK_PUB_COMP_CD_T%>'
<%
			}

			if(! ITC_COMP_NM_T.equals("")) {
%>
		 		ITC_COMP_NM='<%= ITC_COMP_NM_T%>'
<%
			}

			if(! TOTALCOUNT_T.equals("")) {
%>
		 		TOTALCOUNT='<%= TOTALCOUNT_T%>'
<%
			}

			if(! USECOUNT_T.equals("")) {
%>
		 		USECOUNT='<%= USECOUNT_T%>'
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
