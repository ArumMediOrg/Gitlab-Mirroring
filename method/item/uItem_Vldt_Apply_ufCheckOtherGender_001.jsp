<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtTmp = null;
	ResultSet rsTmp = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%

		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String IIV_APLY_DT = htMethod.get("IIV_APLY_DT");
		String IIV_ITEM_CD = htMethod.get("IIV_ITEM_CD");
		String IIV_SEX_CD = htMethod.get("IIV_SEX_CD");
		String IIV_AGE_FR = htMethod.get("IIV_AGE_FR");
		String IIV_AGE_TO = htMethod.get("IIV_AGE_TO");
		String IIV_EXAM_CD = htMethod.get("IIV_EXAM_CD");

		//
		if(IIV_APLY_DT == null) { IIV_APLY_DT = ""; }
		if(IIV_ITEM_CD == null) { IIV_ITEM_CD = ""; }
		if(IIV_SEX_CD == null) { IIV_SEX_CD = ""; }
		if(IIV_AGE_FR == null) { IIV_AGE_FR = ""; }
		if(IIV_AGE_TO == null) { IIV_AGE_TO = ""; }
		if(IIV_EXAM_CD == null) { IIV_EXAM_CD = ""; }

		// DB객체
		stmtTmp = connect.createStatement();

		/*

SELECT COUNT(*)
  FROM IT_ITEM_VLDT
 WHERE IIV_APLY_DT = :IIV_APLY_DT
   AND IIV_ITEM_CD = :IIV_ITEM_CD
   AND IIV_SEX_CD  = :IIV_SEX_CD
   AND IIV_AGE_FR  = :IIV_AGE_FR
   AND IIV_AGE_TO  = :IIV_AGE_TO
   AND IIV_EXAM_CD = :IIV_EXAM_CD
   AND IIV_PANJ_CD IN (''A'', ''R1'')
		*/

		sql = " SELECT COUNT(*)";
		sql += " FROM IT_ITEM_VLDT";
		sql += " WHERE IIV_APLY_DT = '" + IIV_APLY_DT + "'";
		sql += " AND IIV_ITEM_CD = '" + IIV_ITEM_CD + "'";
		sql += " AND IIV_SEX_CD = '" + IIV_SEX_CD + "'";
		sql += " AND IIV_AGE_FR = '" + IIV_AGE_FR + "'";
		sql += " AND IIV_AGE_TO = '" + IIV_AGE_TO + "'";
		sql += " AND IIV_EXAM_CD = '" + IIV_EXAM_CD + "'";
		sql += " AND IIV_PANJ_CD IN ('A', 'R1')";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Vldt_Apply_ufCheckOtherGender_001 \n";
			G_INFO += "설명 : 해당 참고치 건수 확인 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IIV_APLY_DT : " + IIV_APLY_DT + " \n";
			G_INFO += " IIV_ITEM_CD : " + IIV_ITEM_CD + " \n";
			G_INFO += " IIV_SEX_CD : " + IIV_SEX_CD + " \n";
			G_INFO += " IIV_AGE_FR : " + IIV_AGE_FR + " \n";
			G_INFO += " IIV_AGE_TO : " + IIV_AGE_TO + " \n";
			G_INFO += " IIV_EXAM_CD : " + IIV_EXAM_CD + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsTmp = stmtTmp.executeQuery(sql);
		rsTmp.next();

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
				<s:AttributeType name='c0' rs:name='COUNT(*)' rs:number='1' rs:nullable='true'>
					<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
				</s:AttributeType>
				<s:extends type='rs:rowbase'/>
			</s:ElementType>
		</s:Schema>
		<rs:data>
			<z:row c0='<%= rsTmp.getString(1)%>'/><!-- 00 : 숫자 앞에 0을 붙여야 하는지? -->
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

		if(rsTmp != null) {
			rsTmp.close();
			rsTmp = null;
		}

		if(stmtTmp != null) {
			stmtTmp.close();
			stmtTmp = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>