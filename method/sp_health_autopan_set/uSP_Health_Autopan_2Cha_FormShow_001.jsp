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

		String JANGGI_CD = htMethod.get("JANGGI_CD");

		//
		if(JANGGI_CD == null) { JANGGI_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select DISTINCT A.CSP_SBCD_CD, B.IIM_KNME_NM, A.CSP_CHOC_KD 
  From CT_SP_PROF A                                         
       Inner Join IT_ITEM B On B.IIM_SBCD_CD = A.CSP_SBCD_CD
 Where A.CSP_JANGGI_CD = :JANGGI_CD
   And A.CSP_CHASU = '2'                                  
   And A.CSP_USE_YN = 'Y'                                 
   And A.CSP_CHOC_KD = '2' 

		*/

		sql = " SELECT DISTINCT A.CSP_SBCD_CD, B.IIM_KNME_NM, A.CSP_CHOC_KD";
		sql += " FROM CT_SP_PROF A INNER JOIN IT_ITEM B";
		sql += " ON B.IIM_SBCD_CD = A.CSP_SBCD_CD";
		sql += " WHERE A.CSP_JANGGI_CD = '" + JANGGI_CD + "'";
		sql += " AND A.CSP_CHASU = '2'";
		sql += " AND A.CSP_USE_YN = 'Y'";
		sql += " AND A.CSP_CHOC_KD = '2'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_Autopan_2Cha_FormShow_001 \n";
			G_INFO += "설명 : 특검 선택검사정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " JANGGI_CD : " + JANGGI_CD + " \n";
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
		<s:AttributeType name='CSP_SBCD_CD' rs:number='1' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='2' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_CHOC_KD' rs:number='3' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_CHOC_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CSP_SBCD_CD_T = cRsList.getString("CSP_SBCD_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String CSP_CHOC_KD_T = cRsList.getString("CSP_CHOC_KD");
%>
			<z:row
<%
			if(! CSP_SBCD_CD_T.equals("")) {
%>
		 		CSP_SBCD_CD='<%= CSP_SBCD_CD_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
<%
			}

			if(! CSP_CHOC_KD_T.equals("")) {
%>
		 		CSP_CHOC_KD='<%= CSP_CHOC_KD_T%>'
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
