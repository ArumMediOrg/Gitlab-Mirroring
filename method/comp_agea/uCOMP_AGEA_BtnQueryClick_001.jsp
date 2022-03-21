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

		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 SELECT ECA.ECA_COMP_CD, ECA.ECA_COMP_NM, ECA.ECA_MNGT_YR,
        SUM(ECA.ECA_USE_CNT) ECA_USE_CNT,     SUM(ECA.ECA_NUSE_CNT) ECA_NUSE_CNT,
              SUM(ECA.ECA_TOT_CNT) ECA_TOT_CNT
 FROM(
 SELECT A.ECA_COMP_CD, B.ICY_COMP_NM AS ECA_COMP_NM, A.ECA_MNGT_YR,
        NVL(CASE WHEN A.ECA_USE_YN = 'Y' THEN 1 END,0) AS ECA_USE_CNT,
        NVL(CASE WHEN A.ECA_USE_YN = 'N' THEN 1 END,0) AS ECA_NUSE_CNT,
        1 AS ECA_TOT_CNT
 FROM ET_COMP_AGEA A INNER JOIN IT_COMPANY B ON A.ECA_COMP_CD = B.ICY_COMP_CD AND B.ICY_USE_YN = 'Y'
 WHERE 0 = 0

||:sSQL_ADD                       //조회조건추가

		*/

		sql = " SELECT ECA.ECA_COMP_CD, ECA.ECA_COMP_NM, ECA.ECA_MNGT_YR, SUM(ECA.ECA_USE_CNT) ECA_USE_CNT, SUM(ECA.ECA_NUSE_CNT) ECA_NUSE_CNT, SUM(ECA.ECA_TOT_CNT) ECA_TOT_CNT FROM( SELECT A.ECA_COMP_CD, B.ICY_COMP_NM AS ECA_COMP_NM, A.ECA_MNGT_YR, NVL(CASE WHEN A.ECA_USE_YN = 'Y' THEN 1 END,0) AS ECA_USE_CNT, NVL(CASE WHEN A.ECA_USE_YN = 'N' THEN 1 END,0) AS ECA_NUSE_CNT, 1 AS ECA_TOT_CNT";
		sql += " FROM ET_COMP_AGEA A INNER JOIN IT_COMPANY B";
		sql += " ON A.ECA_COMP_CD = B.ICY_COMP_CD";
		sql += " AND B.ICY_USE_YN = 'Y'";
		sql += " WHERE 0 = 0";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_AGEA_BtnQueryClick_001 \n";
			G_INFO += "설명 : 계약단가 사업장 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
		<s:AttributeType name='ECA_COMP_CD' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_COMP_NM' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_MNGT_YR' rs:number='3'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_USE_CNT' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_NUSE_CNT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ECA_TOT_CNT' rs:number='6' rs:nullable='true'>
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

			String ECA_COMP_CD_T = cRsList.getString("ECA_COMP_CD");
			String ECA_COMP_NM_T = cRsList.getString("ECA_COMP_NM");
			String ECA_MNGT_YR_T = cRsList.getString("ECA_MNGT_YR");
			String ECA_USE_CNT_T = cRsList.getString("ECA_USE_CNT");
			String ECA_NUSE_CNT_T = cRsList.getString("ECA_NUSE_CNT");
			String ECA_TOT_CNT_T = cRsList.getString("ECA_TOT_CNT");
%>
			<z:row
<%
			if(! ECA_COMP_CD_T.equals("")) {
%>
		 		ECA_COMP_CD='<%= ECA_COMP_CD_T%>'
<%
			}

			if(! ECA_COMP_NM_T.equals("")) {
%>
		 		ECA_COMP_NM='<%= ECA_COMP_NM_T%>'
<%
			}

			if(! ECA_MNGT_YR_T.equals("")) {
%>
		 		ECA_MNGT_YR='<%= ECA_MNGT_YR_T%>'
<%
			}

			if(! ECA_USE_CNT_T.equals("")) {
%>
		 		ECA_USE_CNT='<%= ECA_USE_CNT_T%>'
<%
			}

			if(! ECA_NUSE_CNT_T.equals("")) {
%>
		 		ECA_NUSE_CNT='<%= ECA_NUSE_CNT_T%>'
<%
			}

			if(! ECA_TOT_CNT_T.equals("")) {
%>
		 		ECA_TOT_CNT='<%= ECA_TOT_CNT_T%>'
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
