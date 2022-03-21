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

SELECT SUM(RRM_CHARGE_PR) CHARGE_PR, 
       SUM(RRM_SALE_PR) SALE_PR, 
       SUM(RRM_RECE_PR) RECE_PR, 
       SUM(RRM_OVERPAY_PR) OVER_PR, 
       SUM(RRM_RETURN_PR) RETURN_PR,
       MAX(F_CODE_FIND('0921', RRM_SALE_KD, '','1')) SALE_NM 
  FROM RT_RECE_MEDICHK 
 WHERE RRM_RECE_NO = :RECE_NO
   AND RRM_OCCU_KD IN ('20', '70') 
 GROUP BY RRM_RECE_NO

		*/

		sql = " SELECT SUM(RRM_CHARGE_PR) CHARGE_PR, SUM(RRM_SALE_PR) SALE_PR, SUM(RRM_RECE_PR) RECE_PR, SUM(RRM_OVERPAY_PR) OVER_PR, SUM(RRM_RETURN_PR) RETURN_PR, MAX(F_CODE_FIND('0921', RRM_SALE_KD, '','1')) SALE_NM";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_NO = '" + RECE_NO + "'";
		sql += " AND RRM_OCCU_KD IN ('20', '70')";
		sql += " GROUP BY RRM_RECE_NO";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Acpt_AlvAcptDblClick_005 \n";
			G_INFO += "설명 : 개인 수납 내역 조회 \n";
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
		<s:AttributeType name='CHARGE_PR' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SALE_PR' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RECE_PR' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='OVER_PR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RETURN_PR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SALE_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CHARGE_PR_T = cRsList.getString("CHARGE_PR");
			String SALE_PR_T = cRsList.getString("SALE_PR");
			String RECE_PR_T = cRsList.getString("RECE_PR");
			String OVER_PR_T = cRsList.getString("OVER_PR");
			String RETURN_PR_T = cRsList.getString("RETURN_PR");
			String SALE_NM_T = cRsList.getString("SALE_NM");
%>
			<z:row
<%
			if(! CHARGE_PR_T.equals("")) {
%>
		 		CHARGE_PR='<%= CHARGE_PR_T%>'
<%
			}

			if(! SALE_PR_T.equals("")) {
%>
		 		SALE_PR='<%= SALE_PR_T%>'
<%
			}

			if(! RECE_PR_T.equals("")) {
%>
		 		RECE_PR='<%= RECE_PR_T%>'
<%
			}

			if(! OVER_PR_T.equals("")) {
%>
		 		OVER_PR='<%= OVER_PR_T%>'
<%
			}

			if(! RETURN_PR_T.equals("")) {
%>
		 		RETURN_PR='<%= RETURN_PR_T%>'
<%
			}

			if(! SALE_NM_T.equals("")) {
%>
		 		SALE_NM='<%= SALE_NM_T%>'
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
