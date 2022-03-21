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

select NVL(SUM(EEP_PSNL_PR),0) EEP_PSNL_PR
 from ET_EXAM_ACPT a left outer join ET_EXAM_PRICE b on a.EEA_EXAM_DT = b.EEP_EXAM_DT and a.EEA_EXAM_SQ = b.EEP_EXAM_SQ
where EEA_RECE_NO = :RECE_NO
		*/

		sql = " SELECT NVL(SUM(EEP_PSNL_PR),0) EEP_PSNL_PR";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_EXAM_PRICE B";
		sql += " ON A.EEA_EXAM_DT = B.EEP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.EEP_EXAM_SQ";
		sql += " WHERE EEA_RECE_NO = '" + RECE_NO + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ReturnSave_FormShow_004 \n";
			G_INFO += "설명 : 현재 개인 청구금액 조회 \n";
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
		<s:AttributeType name='EEP_PSNL_PR' rs:number='1' rs:nullable='true' rs:basetable='ET_EXAM_PRICE' rs:basecolumn='EEP_PSNL_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEP_PSNL_PR_T = cRsList.getString("EEP_PSNL_PR");
%>
			<z:row
<%
			if(! EEP_PSNL_PR_T.equals("")) {
%>
		 		EEP_PSNL_PR='<%= EEP_PSNL_PR_T%>'
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
