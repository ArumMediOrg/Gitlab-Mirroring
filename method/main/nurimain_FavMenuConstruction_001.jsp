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

		String EMP_NO = htMethod.get("EMP_NO");

		//
		if(EMP_NO == null) { EMP_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT *
FROM ( SELECT BBK_EMP_NO, BBK_PRGM_ID, BBK_MENU_ID, BBK_PARE_ID 
            , BBK_MENU_LV, BBK_PRGM_NM, BBK_PRGM_SQ, BBK_LIBR_NM
            , NVL(IAP_USE_YN, 'Y') AS IAP_USE_YN
           FROM BT_BOOKMARK                       
           LEFT OUTER JOIN IT_AUTH_PRGM           
             ON IAP_PRGM_ID = BBK_PRGM_ID         
            AND IAP_MENU_ID <> ' '              
         WHERE BBK_EMP_NO = :EMP_NO
      ) GRP1
WHERE IAP_USE_YN = 'Y'
ORDER BY BBK_PRGM_SQ    

		*/

		sql = " SELECT *";
		sql += " FROM (";
		sql += "	SELECT BBK_EMP_NO, BBK_PRGM_ID, BBK_MENU_ID, BBK_PARE_ID , BBK_MENU_LV, BBK_PRGM_NM, BBK_PRGM_SQ, BBK_LIBR_NM , NVL(IAP_USE_YN, 'Y') AS IAP_USE_YN";
		sql += "	FROM BT_BOOKMARK LEFT OUTER JOIN IT_AUTH_PRGM";
		sql += "	ON IAP_PRGM_ID = BBK_PRGM_ID";
		sql += "	AND IAP_MENU_ID <> ' '";
		sql += "	WHERE BBK_EMP_NO = '" + EMP_NO + "'";
		sql += ") GRP1";
		sql += " WHERE IAP_USE_YN = 'Y'";
		sql += " ORDER BY BBK_PRGM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : nurimain_FavMenuConstruction_001 \n";
			G_INFO += "설명 : 마이메뉴 정보 호출 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EMP_NO : " + EMP_NO + " \n";
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
		<s:AttributeType name='BBK_EMP_NO' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BBK_PRGM_ID' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BBK_MENU_ID' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='BBK_PARE_ID' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='BBK_MENU_LV' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='BBK_PRGM_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='BBK_PRGM_SQ' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BBK_LIBR_NM' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_USE_YN' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String BBK_EMP_NO_T = cRsList.getString("BBK_EMP_NO");
			String BBK_PRGM_ID_T = cRsList.getString("BBK_PRGM_ID");
			String BBK_MENU_ID_T = cRsList.getString("BBK_MENU_ID");
			String BBK_PARE_ID_T = cRsList.getString("BBK_PARE_ID");
			String BBK_MENU_LV_T = cRsList.getString("BBK_MENU_LV");
			String BBK_PRGM_NM_T = cRsList.getString("BBK_PRGM_NM");
			String BBK_PRGM_SQ_T = cRsList.getString("BBK_PRGM_SQ");
			String BBK_LIBR_NM_T = cRsList.getString("BBK_LIBR_NM");
			String IAP_USE_YN_T = cRsList.getString("IAP_USE_YN");
%>
			<z:row
<%
			if(! BBK_EMP_NO_T.equals("")) {
%>
		 		BBK_EMP_NO='<%= BBK_EMP_NO_T%>'
<%
			}

			if(! BBK_PRGM_ID_T.equals("")) {
%>
		 		BBK_PRGM_ID='<%= BBK_PRGM_ID_T%>'
<%
			}

			if(! BBK_MENU_ID_T.equals("")) {
%>
		 		BBK_MENU_ID='<%= BBK_MENU_ID_T%>'
<%
			}

			if(! BBK_PARE_ID_T.equals("")) {
%>
		 		BBK_PARE_ID='<%= BBK_PARE_ID_T%>'
<%
			}

			if(! BBK_MENU_LV_T.equals("")) {
%>
		 		BBK_MENU_LV='<%= BBK_MENU_LV_T%>'
<%
			}

			if(! BBK_PRGM_NM_T.equals("")) {
%>
		 		BBK_PRGM_NM='<%= BBK_PRGM_NM_T%>'
<%
			}

			if(! BBK_PRGM_SQ_T.equals("")) {
%>
		 		BBK_PRGM_SQ='<%= BBK_PRGM_SQ_T%>'
<%
			}

			if(! BBK_LIBR_NM_T.equals("")) {
%>
		 		BBK_LIBR_NM='<%= BBK_LIBR_NM_T%>'
<%
			}

			if(! IAP_USE_YN_T.equals("")) {
%>
		 		IAP_USE_YN='<%= IAP_USE_YN_T%>'
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
