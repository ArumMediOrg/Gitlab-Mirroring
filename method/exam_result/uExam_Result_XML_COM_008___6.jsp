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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtTmp = connect.createStatement();

		/*

    Select  count(*)   From ET_CANCER_LUNG
    Where  ECG_EXAM_DT = :EXAM_DT
      And  ECG_EXAM_SQ = :EXAM_SQ

		*/

		sql = " SELECT COUNT(*)";
		sql += " FROM ET_CANCER_LUNG";
		sql += " WHERE ECG_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND ECG_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uExam_Result_XML_COM_008___6 \n";
			G_INFO += "설명 : 암검진 결과판정 건수 조회(암검진별)___6 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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