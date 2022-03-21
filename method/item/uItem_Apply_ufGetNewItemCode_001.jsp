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

		String IIM_EXGN_CD = htMethod.get("IIM_EXGN_CD");
		String IIM_BLPT_CD = htMethod.get("IIM_BLPT_CD");

		//
		if(IIM_EXGN_CD == null) { IIM_EXGN_CD = ""; }
		if(IIM_BLPT_CD == null) { IIM_BLPT_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT ISNULL(SUBSTRING(MAX(IIM_ITEM_CD),3,3) + 1, 1) iim_cd,
       ISNULL(MAX(IIM_SORT_SQ) + 1, 1) iim_sq
  FROM IT_ITEM
 WHERE IIM_EXGN_CD = :IIM_EXGN_CD
   AND IIM_ITEM_CD LIKE :IIM_EXGN_CD||:IIM_BLPT_CD||'%'

  if IIM_EXGN_CD = 'B' then
       AND IIM_BLPT_CD = :IIM_BLPT_CD
		*/

		sql  = "SELECT NVL(SUBSTR(MAX(IIM_ITEM_CD),3,3) + 1, 1) iim_cd";
		sql += ", NVL(MAX(IIM_SORT_SQ) + 1, 1) iim_sq";
		sql += " FROM IT_ITEM";
		sql += " WHERE IIM_ITEM_CD LIKE '" + IIM_EXGN_CD + IIM_BLPT_CD + "%'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Apply_ufGetNewItemCode_001 \n";
			G_INFO += "설명 : 검사항목 신규 순번 따기 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IIM_EXGN_CD : " + IIM_EXGN_CD + " \n";
			G_INFO += " IIM_BLPT_CD : " + IIM_BLPT_CD + " \n";
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
		<s:AttributeType name='IIM_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SQ' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String IIM_CD_T = cRsList.getString("IIM_CD");
			String IIM_SQ_T = cRsList.getString("IIM_SQ");
%>
			<z:row
<%
			if(! IIM_CD_T.equals("")) {
%>
		 		IIM_CD='<%= IIM_CD_T%>'
<%
			}

			if(! IIM_SQ_T.equals("")) {
%>
		 		IIM_SQ='<%= IIM_SQ_T%>'
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
