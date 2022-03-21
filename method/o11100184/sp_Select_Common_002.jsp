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

		String ISBATCH = htMethod.get("ISBATCH");
		String SMATTERCUT = htMethod.get("SMATTERCUT");

		//
		if(ISBATCH == null) { ISBATCH = ""; }
		if(SMATTERCUT == null) { SMATTERCUT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT DISTINCT                                        
B.IIM_ITEM_CD, A.CSP_SBCD_CD, B.IIM_SNME_NM CSP_SBCD_NM
FROM CT_SP_PROF A                                      
INNER JOIN IT_ITEM B ON A.CSP_SBCD_CD = B.IIM_SBCD_CD  
WHERE A.CSP_USE_YN = 'Y'     
AND B.IIM_TBIO_YN = 'Y' 

if :isBatch <> ''  then
   AND (A.CSP_CHOC_KD = '1' or A.CSP_CHOC_KD = '3')    
else
  AND A.CSP_CHOC_KD = '1'

And ( || :sMatterCut  ||) 
Order By B.IIM_ITEM_CD 

		*/

		sql = " SELECT DISTINCT B.IIM_ITEM_CD, A.CSP_SBCD_CD, B.IIM_SNME_NM CSP_SBCD_NM";
		sql += " FROM CT_SP_PROF A INNER JOIN IT_ITEM B";
		sql += " ON A.CSP_SBCD_CD = B.IIM_SBCD_CD";
		sql += " WHERE A.CSP_USE_YN = 'Y'";
		sql += "AND B.IIM_TBIO_YN = 'Y'";

		if(! ISBATCH.equals("")) {
			sql += " AND (A.CSP_CHOC_KD = '1'";
			sql += " OR A.CSP_CHOC_KD = '3')";
		} else {
			sql += " AND A.CSP_CHOC_KD = '1'";
		}

		sql += " AND (" + SMATTERCUT + ")";
		sql += " ORDER BY B.IIM_ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : sp_Select_Common_002 \n";
			G_INFO += "설명 : 특검 검사항목 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ISBATCH : " + ISBATCH + " \n";
			G_INFO += " SMATTERCUT : " + SMATTERCUT + " \n";
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
		<s:AttributeType name='IIM_ITEM_CD' rs:number='1' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_SBCD_CD' rs:number='2' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_SBCD_NM' rs:number='3' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_SNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String CSP_SBCD_CD_T = cRsList.getString("CSP_SBCD_CD");
			String CSP_SBCD_NM_T = cRsList.getString("CSP_SBCD_NM");
%>
			<z:row
<%
			if(! IIM_ITEM_CD_T.equals("")) {
%>
		 		IIM_ITEM_CD='<%= IIM_ITEM_CD_T%>'
<%
			}

			if(! CSP_SBCD_CD_T.equals("")) {
%>
		 		CSP_SBCD_CD='<%= CSP_SBCD_CD_T%>'
<%
			}

			if(! CSP_SBCD_NM_T.equals("")) {
%>
		 		CSP_SBCD_NM='<%= CSP_SBCD_NM_T%>'
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
