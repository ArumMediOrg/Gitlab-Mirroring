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

		String PRO_CD = htMethod.get("PRO_CD");

		//
		if(PRO_CD == null) { PRO_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT NVL(RTRIM(ARUM_CHOICE1_NO), '0') CHOICE1_CNT, 
       NVL(RTRIM(ARUM_CHOICE2_NO), '0') CHOICE2_CNT, 
       NVL(RTRIM(ARUM_CHOICE3_NO), '0') CHOICE3_CNT, 
       NVL(RTRIM(ARUM_CHOICE4_NO), '0') CHOICE4_CNT, 
       NVL(RTRIM(ARUM_CHOICE5_NO), '0') CHOICE5_CNT, 
       ARUM_ADD_CD
  FROM ARUM_PACKAGE
 WHERE ARUM_PRO_CD = :PRO_CD
   AND UPPER(ARUM_USE_YN) = 'Y'
   AND UPPER(UB_USE_YN)   = 'Y'

		*/

		sql = " SELECT NVL(RTRIM(ARUM_CHOICE1_NO), '0') CHOICE1_CNT, NVL(RTRIM(ARUM_CHOICE2_NO), '0') CHOICE2_CNT, NVL(RTRIM(ARUM_CHOICE3_NO), '0') CHOICE3_CNT, NVL(RTRIM(ARUM_CHOICE4_NO), '0') CHOICE4_CNT, NVL(RTRIM(ARUM_CHOICE5_NO), '0') CHOICE5_CNT, ARUM_ADD_CD";
		sql += " FROM ARUM_PACKAGE";
		sql += " WHERE ARUM_PRO_CD = '" + PRO_CD + "'";
		sql += " AND UPPER(ARUM_USE_YN) = 'Y'";
		sql += " AND UPPER(UB_USE_YN) = 'Y'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_FindUBOptn_001 \n";
			G_INFO += "설명 : 에버헬스 종검옵션 세팅 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PRO_CD : " + PRO_CD + " \n";
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
		<s:AttributeType name='CHOICE1_CNT' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='CHOICE2_CNT' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='CHOICE3_CNT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='CHOICE4_CNT' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='CHOICE5_CNT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ARUM_ADD_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ARUM_ADD_CD'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='ARUM_PACKAGE' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CHOICE1_CNT_T = cRsList.getString("CHOICE1_CNT");
			String CHOICE2_CNT_T = cRsList.getString("CHOICE2_CNT");
			String CHOICE3_CNT_T = cRsList.getString("CHOICE3_CNT");
			String CHOICE4_CNT_T = cRsList.getString("CHOICE4_CNT");
			String CHOICE5_CNT_T = cRsList.getString("CHOICE5_CNT");
			String ARUM_ADD_CD_T = cRsList.getString("ARUM_ADD_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CHOICE1_CNT_T.equals("")) {
%>
		 		CHOICE1_CNT='<%= CHOICE1_CNT_T%>'
<%
			}

			if(! CHOICE2_CNT_T.equals("")) {
%>
		 		CHOICE2_CNT='<%= CHOICE2_CNT_T%>'
<%
			}

			if(! CHOICE3_CNT_T.equals("")) {
%>
		 		CHOICE3_CNT='<%= CHOICE3_CNT_T%>'
<%
			}

			if(! CHOICE4_CNT_T.equals("")) {
%>
		 		CHOICE4_CNT='<%= CHOICE4_CNT_T%>'
<%
			}

			if(! CHOICE5_CNT_T.equals("")) {
%>
		 		CHOICE5_CNT='<%= CHOICE5_CNT_T%>'
<%
			}

			if(! ARUM_ADD_CD_T.equals("")) {
%>
		 		ARUM_ADD_CD='<%= ARUM_ADD_CD_T%>'
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
