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

		String RGPITEM_CALL = htMethod.get("RGPITEM_CALL");
		String CMBEXAM_YR = htMethod.get("CMBEXAM_YR");
		String ITEM_CD = htMethod.get("ITEM_CD");

		//
		if(RGPITEM_CALL == null) { RGPITEM_CALL = ""; }
		if(CMBEXAM_YR == null) { CMBEXAM_YR = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select case when :rgpItem_Call = '0' then iip_gbsg_pr
            when :rgpItem_Call = '1' then iip_gbsg_pr 
            when :rgpItem_Call = '2' then iip_stsg_pr 
            when :rgpItem_Call = '3' then iip_gbsg_pr end as item_pr, iip_gasn_pr gasn_pr 
  from it_item_price 
 where iip_aply_dt = GetITEM_PRICE_ApplyDate(iip_item_cd, :cmbExam_Yr||'-12-31', 'ITEM_CD') 
   and iip_item_cd = :item_cd
   and upper(iip_use_yn) = 'Y'

		*/

		sql = " SELECT CASE WHEN '" + RGPITEM_CALL + "' = '0' THEN IIP_GBSG_PR WHEN '" + RGPITEM_CALL + "' = '1' THEN IIP_GBSG_PR WHEN '" + RGPITEM_CALL + "' = '2' THEN IIP_STSG_PR WHEN '" + RGPITEM_CALL + "' = '3' THEN IIP_GBSG_PR END AS ITEM_PR";
		sql += ", IIP_GASN_PR GASN_PR";
		sql += " FROM IT_ITEM_PRICE";
		sql += " WHERE IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(IIP_ITEM_CD, '" + CMBEXAM_YR + "-12-31', 'ITEM_CD')";
		sql += " AND IIP_ITEM_CD = '" + ITEM_CD + "'";
		sql += " AND UPPER(IIP_USE_YN) = 'Y'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Call_btnItemAddClick_001 \n";
			G_INFO += "설명 : 검사 항목별 수가 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RGPITEM_CALL : " + RGPITEM_CALL + " \n";
			G_INFO += " CMBEXAM_YR : " + CMBEXAM_YR + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
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
		<s:AttributeType name='ITEM_PR' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='IIP_GASN_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='GASN_PR' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='ROWID'
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

			String ITEM_PR_T = cRsList.getString("ITEM_PR");
			String GASN_PR_T = cRsList.getString("GASN_PR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ITEM_PR_T.equals("")) {
%>
		 		ITEM_PR='<%= ITEM_PR_T%>'
<%
			}

			if(! GASN_PR_T.equals("")) {
%>
		 		GASN_PR='<%= GASN_PR_T%>'
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
