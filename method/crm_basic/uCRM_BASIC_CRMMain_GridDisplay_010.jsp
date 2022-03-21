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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

Select IAU_DPAN_DR As Dr, IAU_PENL_NM As Nm From IT_AUTH_USER
Where IAU_USE_YN = 'Y'                                     
And IAU_DPAN_DR <> ''                                      
Union                                                        
Select IAU_EMP_NO  As Dr, IAU_PENL_NM As Nm FROM IT_AUTH_USER
 WHERE IAU_DEPT_CD = '0207'                                
   AND (IAU_LICEN1_CD = '11' OR IAU_LICEN1_CD = '12')    
ORDER BY Dr                                                  
		*/

		sql = " SELECT IAU_DPAN_DR AS DR, IAU_PENL_NM AS NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_USE_YN = 'Y'";
		sql += " AND IAU_DPAN_DR <> ''";
		sql += " UNION";
		sql += " SELECT IAU_EMP_NO AS DR, IAU_PENL_NM AS NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_DEPT_CD = '0207'";
		sql += " AND (IAU_LICEN1_CD = '11'";
		sql += " OR IAU_LICEN1_CD = '12')";
		sql += " ORDER BY DR";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_CRMMain_GridDisplay_010 \n";
			G_INFO += "설명 : 상담관리-환자정보 상담의사 목록 Select \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='DR' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_DPAN_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String DR_T = cRsList.getString("DR");
			String NM_T = cRsList.getString("NM");
%>
			<z:row
<%
			if(! DR_T.equals("")) {
%>
		 		DR='<%= DR_T%>'
<%
			}

			if(! NM_T.equals("")) {
%>
		 		NM='<%= NM_T%>'
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
