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

		String ORGA_CD = htMethod.get("ORGA_CD");

		//
		if(ORGA_CD == null) { ORGA_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select DISTINCT A.SPA_ORGA_CD, B.IIM_ITEM_CD, A.SPA_SBCD_CD, 
                B.IIM_SNME_NM, A.SPA_USE_YN,  B.IIM_TRTP_CD  
  From SP_AUTO_ITEM A                                        
 Inner Join IT_ITEM B On B.IIM_SBCD_CD = A.SPA_SBCD_CD       
 Where A.SPA_USE_YN = 'Y'                                  
   And A.SPA_ORGA_CD = :ORGA_CD
 Order By B.IIM_ITEM_CD                                      

		*/

		sql = " SELECT DISTINCT A.SPA_ORGA_CD, B.IIM_ITEM_CD, A.SPA_SBCD_CD, B.IIM_SNME_NM, A.SPA_USE_YN, B.IIM_TRTP_CD";
		sql += " FROM SP_AUTO_ITEM A INNER JOIN IT_ITEM B";
		sql += " ON B.IIM_SBCD_CD = A.SPA_SBCD_CD";
		sql += " WHERE A.SPA_USE_YN = 'Y'";
		sql += " AND A.SPA_ORGA_CD = '" + ORGA_CD + "'";
		sql += " ORDER BY B.IIM_ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSp_Health_Autopan_Set_BtnAddClick_001 \n";
			G_INFO += "설명 : 특검 자동판정 검사정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ORGA_CD : " + ORGA_CD + " \n";
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
		<s:AttributeType name='SPA_ORGA_CD' rs:number='1' rs:basetable='SP_AUTO_ITEM' rs:basecolumn='SPA_ORGA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ITEM_CD' rs:number='2' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_SBCD_CD' rs:number='3' rs:basetable='SP_AUTO_ITEM' rs:basecolumn='SPA_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SNME_NM' rs:number='4' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_SNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='SPA_USE_YN' rs:number='5' rs:basetable='SP_AUTO_ITEM' rs:basecolumn='SPA_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='6' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_TRTP_CD'>
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

			String SPA_ORGA_CD_T = cRsList.getString("SPA_ORGA_CD");
			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String SPA_SBCD_CD_T = cRsList.getString("SPA_SBCD_CD");
			String IIM_SNME_NM_T = cRsList.getString("IIM_SNME_NM");
			String SPA_USE_YN_T = cRsList.getString("SPA_USE_YN");
			String IIM_TRTP_CD_T = cRsList.getString("IIM_TRTP_CD");
%>
			<z:row
<%
			if(! SPA_ORGA_CD_T.equals("")) {
%>
		 		SPA_ORGA_CD='<%= SPA_ORGA_CD_T%>'
<%
			}

			if(! IIM_ITEM_CD_T.equals("")) {
%>
		 		IIM_ITEM_CD='<%= IIM_ITEM_CD_T%>'
<%
			}

			if(! SPA_SBCD_CD_T.equals("")) {
%>
		 		SPA_SBCD_CD='<%= SPA_SBCD_CD_T%>'
<%
			}

			if(! IIM_SNME_NM_T.equals("")) {
%>
		 		IIM_SNME_NM='<%= IIM_SNME_NM_T%>'
<%
			}

			if(! SPA_USE_YN_T.equals("")) {
%>
		 		SPA_USE_YN='<%= SPA_USE_YN_T%>'
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
