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

		String TBL_NAME = htMethod.get("TBL_NAME");
		String EDCODE_NM = htMethod.get("EDCODE_NM");
		String SMALL_CD = htMethod.get("SMALL_CD");

		//
		if(TBL_NAME == null) { TBL_NAME = ""; }
		if(EDCODE_NM == null) { EDCODE_NM = ""; }
		if(SMALL_CD == null) { SMALL_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CCP_GUBN_CD, CCP_MACH_NM ccn_small, CCP_SOKUN_TX CCN_NAME, '' CCN_VALUE 
  FROM :tbl_Name
 WHERE CCP_MACH_NM like '%' || :edCode_Nm || '%' 
   AND CCP_MACH_CD = :small_cd
   AND UPPER(NVL(CCP_USE_YN, 'Y')) = 'Y' 
 ORDER BY CCP_MACH_SQ 

		*/

		sql = " SELECT CCP_GUBN_CD, CCP_MACH_NM CCN_SMALL, CCP_SOKUN_TX CCN_NAME, '' CCN_VALUE";
		sql += " FROM " + TBL_NAME;
		sql += " WHERE CCP_MACH_NM LIKE '%' || '" + EDCODE_NM + "' || '%'";
		sql += " AND CCP_MACH_CD = '" + SMALL_CD + "'";
		sql += " AND UPPER(NVL(CCP_USE_YN, 'Y')) = 'Y'";
		sql += " ORDER BY CCP_MACH_SQ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDT_CCDT_PANJ_FIND_btnFindClick_001 \n";
			G_INFO += "설명 : 코드정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " TBL_NAME : " + TBL_NAME + " \n";
			G_INFO += " EDCODE_NM : " + EDCODE_NM + " \n";
			G_INFO += " SMALL_CD : " + SMALL_CD + " \n";
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
		<s:AttributeType name='CCP_GUBN_CD' rs:number='1' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ' rs:basecolumn='CCP_GUBN_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_SMALL' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_MACH_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_NAME' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_SOKUN_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_VALUE' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='CT_COMM_PANJ' rs:basecolumn='ROWID'
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

			String CCP_GUBN_CD_T = cRsList.getString("CCP_GUBN_CD");
			String CCN_SMALL_T = cRsList.getString("CCN_SMALL");
			String CCN_NAME_T = cRsList.getString("CCN_NAME");
			String CCN_VALUE_T = cRsList.getString("CCN_VALUE");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CCP_GUBN_CD_T.equals("")) {
%>
		 		CCP_GUBN_CD='<%= CCP_GUBN_CD_T%>'
<%
			}

			if(! CCN_SMALL_T.equals("")) {
%>
		 		CCN_SMALL='<%= CCN_SMALL_T%>'
<%
			}

			if(! CCN_NAME_T.equals("")) {
%>
		 		CCN_NAME='<%= CCN_NAME_T%>'
<%
			}

			if(! CCN_VALUE_T.equals("")) {
%>
		 		CCN_VALUE='<%= CCN_VALUE_T%>'
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
