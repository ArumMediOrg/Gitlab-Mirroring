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

		String MMT_VIEW_CD1 = htMethod.get("MMT_VIEW_CD1");
		String MMT_VIEW_CD2 = htMethod.get("MMT_VIEW_CD2");
		String SEARCH_TEXT = htMethod.get("SEARCH_TEXT");

		//
		if(MMT_VIEW_CD1 == null) { MMT_VIEW_CD1 = ""; }
		if(MMT_VIEW_CD2 == null) { MMT_VIEW_CD2 = ""; }
		if(SEARCH_TEXT == null) { SEARCH_TEXT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM (
SELECT MMT_VIEW_CD || MMT_VIEW_SQ AS VIEW_CD, MMT_VIEW_NM, MMT_VIEW_TXT, MMT_VIEW_CD
  FROM MT_MEDI_EQUIP ) A
 WHERE 0 = 0
 if :MMT_VIEW_CD1 <> '' then
 begin
      AND MMT_VIEW_CD LIKE  :MMT_VIEW_CD1||'%'
 end
 else if :MMT_VIEW_CD2 <> '' then
 begin
   sSQL := sSQL
       AND MMT_VIEW_CD LIKE  :MMT_VIEW_CD2||'%'
 end;
 if SEARCH_TEXT <> '' then
 begin
       AND (VIEW_CD LIKE      '%'||:SERCH_TEXT||'%'
        OR  MMT_VIEW_NM LIKE  '%'||:SERCH_TEXT||'%'
        OR  MMT_VIEW_TXT LIKE '%'||:SERCH_TEXT||'%'
 end;
		*/

		sql = " SELECT *";
		sql += " FROM (";
		sql += "	SELECT MMT_VIEW_CD || MMT_VIEW_SQ AS VIEW_CD, MMT_VIEW_NM, MMT_VIEW_TXT, MMT_VIEW_CD";
		sql += " 	FROM MT_MEDI_EQUIP";
		sql += ") A";
		sql += " WHERE 0 = 0";
		
		if(MMT_VIEW_CD1 != null && ! MMT_VIEW_CD1.equals("")) {
			sql += " AND MMT_VIEW_CD LIKE '" + MMT_VIEW_CD1 + "%'";
		} else if(MMT_VIEW_CD2 != null && ! MMT_VIEW_CD2.equals("")) {
			sql += " AND MMT_VIEW_CD LIKE '" + MMT_VIEW_CD2 + "%'";
		}
		
		if(SEARCH_TEXT != null && ! SEARCH_TEXT.equals("")) {
			sql += " AND (";
			sql += "	   VIEW_CD LIKE LIKE '%" + SEARCH_TEXT + "%'";
			sql += "	OR MMT_VIEW_NM LIKE LIKE '%" + SEARCH_TEXT + "%'";
			sql += "	OR MMT_VIEW_TXT LIKE LIKE '%" + SEARCH_TEXT + "%'";
			sql += ")";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDev_Rslt_Apply_gpGetDev_Rslt_001 \n";
			G_INFO += "설명 : 검사항목 소견 리스트 조회(조회조건) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MMT_VIEW_CD1 : " + MMT_VIEW_CD1 + " \n";
			G_INFO += " MMT_VIEW_CD2 : " + MMT_VIEW_CD2 + " \n";
			G_INFO += " SEARCH_TEXT : " + SEARCH_TEXT + " \n";
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
		<s:AttributeType name='VIEW_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='21'/>
		</s:AttributeType>
		<s:AttributeType name='MMT_VIEW_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='MT_MEDI_EQUIP'
			 rs:basecolumn='MMT_VIEW_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='MMT_VIEW_TXT' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='MT_MEDI_EQUIP'
			 rs:basecolumn='MMT_VIEW_TXT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='MMT_VIEW_CD' rs:number='4' rs:writeunknown='true' rs:basetable='MT_MEDI_EQUIP' rs:basecolumn='MMT_VIEW_CD'>
			<s:datatype dt:type='string' dt:maxLength='11' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='MT_MEDI_EQUIP' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String VIEW_CD_T = cRsList.getString("VIEW_CD");
			String MMT_VIEW_NM_T = cRsList.getString("MMT_VIEW_NM");
			String MMT_VIEW_TXT_T = cRsList.getString("MMT_VIEW_TXT");
			String MMT_VIEW_CD_T = cRsList.getString("MMT_VIEW_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! VIEW_CD_T.equals("")) {
%>
		 		VIEW_CD='<%= VIEW_CD_T%>'
<%
			}

			if(! MMT_VIEW_NM_T.equals("")) {
%>
		 		MMT_VIEW_NM='<%= MMT_VIEW_NM_T%>'
<%
			}

			if(! MMT_VIEW_TXT_T.equals("")) {
%>
		 		MMT_VIEW_TXT='<%= MMT_VIEW_TXT_T%>'
<%
			}

			if(! MMT_VIEW_CD_T.equals("")) {
%>
		 		MMT_VIEW_CD='<%= MMT_VIEW_CD_T%>'
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
