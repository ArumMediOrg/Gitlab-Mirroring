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

SELECT CCN_FULL_NM, CCN_SMALL
  FROM CT_COMMON
 WHERE CCN_LARGE = ''0401''
   AND CCN_LEVEL = ''1''
   AND CCN_SMALL <> ''30000''
 UNION
SELECT CCN_FULL_NM, CCN_SMALL
  FROM CT_COMMON
 WHERE CCN_LARGE = ''0401''
   AND CCN_LEVEL = ''2''
   AND CCN_SMALL IN (''12000'', ''13000'', ''31000'', ''32000'')
 UNION
SELECT CCN_FULL_NM, CCN_SMALL
  FROM CT_COMMON
 WHERE CCN_LARGE = ''0401''
   AND CCN_LEVEL = ''5''
   AND CCN_SMALL IN (''11001'', ''11002'')
 UNION
SELECT CCN_FULL_NM, CCN_SMALL
  FROM CT_COMMON
 WHERE CCN_LARGE = ''0401''
   AND CCN_LEVEL = ''5''
   AND CCN_SMALL IN (''14001'')
 UNION
SELECT CCN_FULL_NM, CCN_SMALL
  FROM CT_COMMON
 WHERE CCN_LARGE = ''0401''
   AND CCN_LEVEL = ''5''
   AND CCN_SMALL IN (''41001'', ''42001'')
 UNION
SELECT ''배치전 검사'' AS CCN_FULL_NM, ''49001'' AS CCN_SMALL FROM DUAL
 UNION
SELECT ''2차검진(일+특)'' AS CCN_FULL_NM, ''43002'' AS CCN_SMALL FROM DUAL
 UNION
SELECT ''생활습관평가'' AS CCN_FULL_NM, ''12009'' AS CCN_SMALL FROM DUAL
ORDER BY CCN_SMALL
		*/

		sql = " SELECT CCN_FULL_NM, CCN_SMALL";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0401'";
		sql += " AND CCN_LEVEL = '1'";
		sql += " AND CCN_SMALL <> '30000'";

		sql += " UNION";

		sql += " SELECT CCN_FULL_NM, CCN_SMALL";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0401'";
		sql += " AND CCN_LEVEL = '2'";
		sql += " AND CCN_SMALL IN ('12000', '13000', '31000', '32000')";

		sql += " UNION";

		sql += " SELECT CCN_FULL_NM, CCN_SMALL";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0401'";
		sql += " AND CCN_LEVEL = '5'";
		sql += " AND CCN_SMALL IN ('11001', '11002')";

		sql += " UNION";

		sql += " SELECT CCN_FULL_NM, CCN_SMALL";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0401'";
		sql += " AND CCN_LEVEL = '5'";
		sql += " AND CCN_SMALL IN ('14001')";

		sql += " UNION";

		sql += " SELECT CCN_FULL_NM, CCN_SMALL";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0401'";
		sql += " AND CCN_LEVEL = '5'";
		sql += " AND CCN_SMALL IN ('41001', '42001')";

		sql += " UNION";

		sql += " SELECT '배치전 검사' AS CCN_FULL_NM, '49001' AS CCN_SMALL";
		sql += " FROM DUAL";

		sql += " UNION";

		sql += " SELECT '2차검진(일+특)' AS CCN_FULL_NM, '43002' AS CCN_SMALL";
		sql += " FROM DUAL";

		sql += " UNION";

		sql += " SELECT '생활습관평가' AS CCN_FULL_NM, '12009' AS CCN_SMALL";
		sql += " FROM DUAL";
		sql += " ORDER BY CCN_SMALL";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCommon_XML_CCN_003 \n";
			G_INFO += "설명 : 일반공통코드조회(검진분류조회-콤보박스셋팅용)  : 검진결과관리 셋팅 기준 \n";
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
		<s:AttributeType name='CCN_FULL_NM' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMMON'
			 rs:basecolumn='CCN_FULL_NM'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_SMALL' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMMON'
			 rs:basecolumn='CCN_SMALL'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CCN_FULL_NM_T = cRsList.getString("CCN_FULL_NM");
			String CCN_SMALL_T = cRsList.getString("CCN_SMALL");
%>
			<z:row
<%
			if(! CCN_FULL_NM_T.equals("")) {
%>
		 		CCN_FULL_NM='<%= CCN_FULL_NM_T%>'
<%
			}

			if(! CCN_SMALL_T.equals("")) {
%>
		 		CCN_SMALL='<%= CCN_SMALL_T%>'
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
