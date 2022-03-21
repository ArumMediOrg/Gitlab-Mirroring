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

		String MATT_CD = htMethod.get("MATT_CD");

		//
		if(MATT_CD == null) { MATT_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.CSC_ETC1_CD, B.CSC_ETC2_CD 
  FROM (SELECT CSM_COMM_CD 
          FROM CT_SP_MATTER 
         WHERE CSM_MATT_CD IN (:MATT_CD) 
           AND UPPER(CSM_USE_YN) = 'Y'
         GROUP BY CSM_COMM_CD 
       ) A, CT_SP_COMMON B 
 WHERE UPPER(B.CSC_LARGE) = 'HM99A'
   AND B.CSC_SMALL = A.CSM_COMM_CD 
   AND UPPER(B.CSC_USE_YN) = 'Y'
 ORDER BY B.CSC_SMALL
		*/

		sql = " SELECT B.CSC_ETC1_CD, B.CSC_ETC2_CD";
		sql += " FROM (SELECT CSM_COMM_CD";
		sql += " FROM CT_SP_MATTER";
		sql += " WHERE CSM_MATT_CD IN ('" + MATT_CD + "')";
		sql += " AND UPPER(CSM_USE_YN) = 'Y'";
		sql += " GROUP BY CSM_COMM_CD ) A, CT_SP_COMMON B";
		sql += " WHERE UPPER(B.CSC_LARGE) = 'HM99A'";
		sql += " AND B.CSC_SMALL = A.CSM_COMM_CD";
		sql += " AND UPPER(B.CSC_USE_YN) = 'Y'";
		sql += " ORDER BY B.CSC_SMALL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ItemList_012 \n";
			G_INFO += "설명 : 유해물질별 표적장기 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MATT_CD : " + MATT_CD + " \n";
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
		<s:AttributeType name='CSC_ETC1_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CSC_ETC2_CD' rs:number='2' rs:nullable='true'>
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

			String CSC_ETC1_CD_T = cRsList.getString("CSC_ETC1_CD");
			String CSC_ETC2_CD_T = cRsList.getString("CSC_ETC2_CD");
%>
			<z:row
<%
			if(! CSC_ETC1_CD_T.equals("")) {
%>
		 		CSC_ETC1_CD='<%= CSC_ETC1_CD_T%>'
<%
			}

			if(! CSC_ETC2_CD_T.equals("")) {
%>
		 		CSC_ETC2_CD='<%= CSC_ETC2_CD_T%>'
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
