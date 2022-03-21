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

		String EXAM_DT = htMethod.get("EXAM_DT");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select IIP_GBSG_PR from IT_ITEM_PRICE
 where iip_item_cd = 'M0020'
   and iip_aply_dt = GetITEM_PRICE_ApplyDate('M0020', :EXAM_DT, 'ITEM_CD')
   and iip_use_yn = 'Y'
		*/

		sql = " SELECT IIP_GBSG_PR";
		sql += " FROM IT_ITEM_PRICE";
		sql += " WHERE IIP_ITEM_CD = 'M0020'";
		sql += " AND IIP_APLY_DT = GETITEM_PRICE_APPLYDATE('M0020', '" + EXAM_DT + "', 'ITEM_CD')";
		sql += " AND IIP_USE_YN = 'Y'";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : Uspchungfile2020_UDP_RESULT_004 \n";
			G_INFO += "설명 : 검진결과 구강검진관련 수가조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
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
		<s:AttributeType name='IIP_GBSG_PR' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='IIP_GBSG_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='2' rs:rowid='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='ROWID'
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

			String IIP_GBSG_PR_T = cRsList.getString("IIP_GBSG_PR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IIP_GBSG_PR_T.equals("")) {
%>
		 		IIP_GBSG_PR='<%= IIP_GBSG_PR_T%>'
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
