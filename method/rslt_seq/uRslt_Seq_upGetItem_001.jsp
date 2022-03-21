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

		String EDTSEARCH = htMethod.get("EDTSEARCH");
		String CMBSRCHEXGN = htMethod.get("CMBSRCHEXGN");

		//
		if(EDTSEARCH == null) { EDTSEARCH = ""; }
		if(CMBSRCHEXGN == null) { CMBSRCHEXGN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IIM_ITEM_CD, IIM_KNME_NM
FROM IT_ITEM
WHERE IIM_USE_YN = 'Y' 

if :edtSearch <> '' then
begin
      AND (UPPER(IIM_ITEM_CD) LIKE '%' || :edtSearch || '%'
       OR  UPPER(IIM_KNME_NM) LIKE '%' || :edtSearch || '%'
       OR  UPPER(IIM_ENME_NM) LIKE '%' || :edtSearch || '%'
       OR  UPPER(IIM_SNME_NM) LIKE '%' || :edtSearch || '%' )
end;

if :cmbSrchExgn <> '00' then
      AND IIM_EXGN_CD = :cmbSrchExgn

ORDER BY IIM_EXGN_CD, IIM_SORT_SQ

		*/

		sql = " SELECT IIM_ITEM_CD, IIM_KNME_NM";
		sql += " FROM IT_ITEM";
		sql += " WHERE IIM_USE_YN = 'Y'";

		if(!EDTSEARCH.equals("")) {
			sql += " AND (";
			sql += "	UPPER(IIM_ITEM_CD) LIKE '%" + EDTSEARCH + "%'";
			sql += " 	OR UPPER(IIM_KNME_NM) LIKE '%" + EDTSEARCH + "%'";
			sql += " 	OR UPPER(IIM_ENME_NM) LIKE '%" + EDTSEARCH + "%'";
			sql += " 	OR UPPER(IIM_SNME_NM) LIKE '%" + EDTSEARCH + "%'";
			sql += " )";
		}
		
		if(!CMBSRCHEXGN.equals("00")) {
			sql += " AND IIM_EXGN_CD = '" + CMBSRCHEXGN + "'";
		}

		sql += " ORDER BY IIM_EXGN_CD, IIM_SORT_SQ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRslt_Seq_upGetItem_001 \n";
			G_INFO += "설명 : 검사항목정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EDTSEARCH : " + EDTSEARCH + " \n";
			G_INFO += " CMBSRCHEXGN : " + CMBSRCHEXGN + " \n";
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
		<s:AttributeType name='IIM_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IIM_ITEM_CD_T.equals("")) {
%>
		 		IIM_ITEM_CD='<%= IIM_ITEM_CD_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
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
