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

		String RECE_NO = htMethod.get("RECE_NO");

		//
		if(RECE_NO == null) { RECE_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select NVL(sum(RRM_RETURN_PR_71),0) RRM_RETURN_PR_71
     ,NVL(sum(RRM_RETURN_PR_72),0) RRM_RETURN_PR_72, NVL(sum(RRM_RETURN_PR_73),0) RRM_RETURN_PR_73
 from (select case when RRM_OCCU_KD in ('70','71') then RRM_RETURN_PR end RRM_RETURN_PR_71,
              case when RRM_OCCU_KD in ('72') then RRM_RETURN_PR end RRM_RETURN_PR_72,
              case when RRM_OCCU_KD = '73' then RRM_RETURN_PR end RRM_RETURN_PR_73
         from RT_RECE_MEDICHK
        where RRM_RECE_NO = :RECE_NO
          and RRM_OCCU_KD in ('70','71','72','73')
      ) a
		*/

		sql = " SELECT NVL(SUM(RRM_RETURN_PR_71),0) RRM_RETURN_PR_71 ,NVL(SUM(RRM_RETURN_PR_72),0) RRM_RETURN_PR_72, NVL(SUM(RRM_RETURN_PR_73),0) RRM_RETURN_PR_73";
		sql += " FROM (";
		sql += "	SELECT CASE WHEN RRM_OCCU_KD IN ('70','71') THEN RRM_RETURN_PR END RRM_RETURN_PR_71";
		sql += "	, CASE WHEN RRM_OCCU_KD IN ('72') THEN RRM_RETURN_PR END RRM_RETURN_PR_72";
		sql += "	, CASE WHEN RRM_OCCU_KD = '73' THEN RRM_RETURN_PR END RRM_RETURN_PR_73";
		sql += " 	FROM RT_RECE_MEDICHK";
		sql += " 	WHERE RRM_RECE_NO = '" + RECE_NO + "'";
		sql += " 	AND RRM_OCCU_KD IN ('70','71','72','73')";
		sql += " ) A";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ReturnSave_FormShow_003 \n";
			G_INFO += "설명 : 환급금액 조회(일반,과오납,예약금) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RECE_NO : " + RECE_NO + " \n";
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
		<s:AttributeType name='RRM_RETURN_PR_71' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RETURN_PR_72' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RETURN_PR_73' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String RRM_RETURN_PR_71_T = cRsList.getString("RRM_RETURN_PR_71");
			String RRM_RETURN_PR_72_T = cRsList.getString("RRM_RETURN_PR_72");
			String RRM_RETURN_PR_73_T = cRsList.getString("RRM_RETURN_PR_73");
%>
			<z:row
<%
			if(! RRM_RETURN_PR_71_T.equals("")) {
%>
		 		RRM_RETURN_PR_71='<%= RRM_RETURN_PR_71_T%>'
<%
			}

			if(! RRM_RETURN_PR_72_T.equals("")) {
%>
		 		RRM_RETURN_PR_72='<%= RRM_RETURN_PR_72_T%>'
<%
			}

			if(! RRM_RETURN_PR_73_T.equals("")) {
%>
		 		RRM_RETURN_PR_73='<%= RRM_RETURN_PR_73_T%>'
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
