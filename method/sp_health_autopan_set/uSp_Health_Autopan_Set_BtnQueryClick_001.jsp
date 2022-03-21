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

		String SNME_NM = htMethod.get("SNME_NM");

		//
		if(SNME_NM == null) { SNME_NM = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select DISTINCT IIM_SBCD_CD, IIM_SNME_NM, IIM_TRTP_CD
From IT_ITEM                                        
Where IIM_USE_YN  = 'Y'                           
  And NVL(IIM_SBCD_CD, ' ') <> ' '           
  And IIM_TUSE_YN = 'Y'                           
  And IIM_TSND_YN = 'Y'                           

if :SNME_NM <> ' then
begin
  And IIM_SNME_NM Like '%'||:SNME_NM||'%' 
end;

		*/

		sql = " SELECT DISTINCT IIM_SBCD_CD, IIM_SNME_NM, IIM_TRTP_CD";
		sql += " FROM IT_ITEM";
		sql += " WHERE IIM_USE_YN = 'Y'";
		sql += " AND NVL(IIM_SBCD_CD, ' ') <> ' '";
		sql += " AND IIM_TUSE_YN = 'Y'";
		sql += " AND IIM_TSND_YN = 'Y'";

		if(!SNME_NM.equals("")) {
			sql += " AND IIM_SNME_NM LIKE '%'||'" + SNME_NM + "'||'%'";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSp_Health_Autopan_Set_BtnQueryClick_001 \n";
			G_INFO += "설명 : 검사정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SNME_NM : " + SNME_NM + " \n";
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
		<s:AttributeType name='IIM_SBCD_CD' rs:number='1' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SNME_NM' rs:number='2' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_SNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='3' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_TRTP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String IIM_SBCD_CD_T = cRsList.getString("IIM_SBCD_CD");
			String IIM_SNME_NM_T = cRsList.getString("IIM_SNME_NM");
			String IIM_TRTP_CD_T = cRsList.getString("IIM_TRTP_CD");
%>
			<z:row
<%
			if(! IIM_SBCD_CD_T.equals("")) {
%>
		 		IIM_SBCD_CD='<%= IIM_SBCD_CD_T%>'
<%
			}

			if(! IIM_SNME_NM_T.equals("")) {
%>
		 		IIM_SNME_NM='<%= IIM_SNME_NM_T%>'
<%
			}

			if(! IIM_TRTP_CD_T.equals("")) {
%>
		 		IIM_TRTP_CD='<%= IIM_TRTP_CD_T%>'
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
