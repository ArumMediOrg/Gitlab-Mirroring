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

		String ORGA_CD = htMethod.get("ORGA_CD");
		String EDTSPG_PANJ_CD = htMethod.get("EDTSPG_PANJ_CD");
		String AUTO_CD = htMethod.get("AUTO_CD");

		//
		if(ORGA_CD == null) { ORGA_CD = ""; }
		if(EDTSPG_PANJ_CD == null) { EDTSPG_PANJ_CD = ""; }
		if(AUTO_CD == null) { AUTO_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select Max(SPA_AUTO_CD) As Max From SP_AUTO_PAN 
  Where SPA_ORGA_CD = :ORGA_CD 

if :EdtSPG_PANJ_CD = 'A' then
begin
  And SPA_AUTO_CD <= :AUTO_CD||'100'
  And SPA_PANJ_CD = :EdtSPG_PANJ_CD
end else
if :EdtSPG_PANJ_CD = 'C1' then
begin
  And SPA_AUTO_CD > :AUTO_CD||'100' 
  And SPA_AUTO_CD <= :AUTO_CD||'259'
  And SPA_PANJ_CD = :EdtSPG_PANJ_CD
end else
if (:EdtSPG_PANJ_CD = 'C2') or
   (:EdtSPG_PANJ_CD = 'CN') then
begin
  And SPA_AUTO_CD > :AUTO_CD||'259'  
  And SPA_AUTO_CD <= :AUTO_CD||'459' 
end else
if :EdtSPG_PANJ_CD = 'D1' then
begin
  And SPA_AUTO_CD > :AUTO_CD||'459'  
  And SPA_AUTO_CD <= :AUTO_CD||'609' 
  And SPA_PANJ_CD = :EdtSPG_PANJ_CD
end else
if (:EdtSPG_PANJ_CD = 'D2') or
   (:EdtSPG_PANJ_CD = 'DN') then
begin
  And SPA_AUTO_CD > :AUTO_CD||'609'  
  And SPA_AUTO_CD <= :AUTO_CD||'809' 
end else
if :EdtSPG_PANJ_CD = 'R' then
begin
  And SPA_AUTO_CD > :AUTO_CD||'810'
  And SPA_PANJ_CD = :EdtSPG_PANJ_CD
end;

		*/

		sql = " SELECT MAX(SPA_AUTO_CD) AS MAX";
		sql += " FROM SP_AUTO_PAN";
		sql += " WHERE SPA_ORGA_CD = '" + ORGA_CD + "'";

		if(EDTSPG_PANJ_CD.equals("A")) {
			sql += " AND SPA_AUTO_CD <= '" + AUTO_CD + "'||'100'";
			sql += " AND SPA_PANJ_CD = '" + EDTSPG_PANJ_CD + "'";
		}
		else if(EDTSPG_PANJ_CD.equals("C1")) {
			sql += " AND SPA_AUTO_CD > '" + AUTO_CD + "'||'100'";
			sql += " AND SPA_AUTO_CD <= '" + AUTO_CD + "'||'259'";
			sql += " AND SPA_PANJ_CD = '" + EDTSPG_PANJ_CD + "'";
		}
		else if(EDTSPG_PANJ_CD.equals("C2") || EDTSPG_PANJ_CD.equals("CN")) {
			sql += " AND SPA_AUTO_CD > '" + AUTO_CD + "'||'259'";
			sql += " AND SPA_AUTO_CD <= '" + AUTO_CD + "'||'459'";
		}
		else if(EDTSPG_PANJ_CD.equals("D1")) {
			sql += " AND SPA_AUTO_CD > '" + AUTO_CD + "'||'459'";
			sql += " AND SPA_AUTO_CD <= '" + AUTO_CD + "'||'609'";
			sql += " AND SPA_PANJ_CD = '" + EDTSPG_PANJ_CD + "'";
		}
		else if(EDTSPG_PANJ_CD.equals("D2") || EDTSPG_PANJ_CD.equals("DN")) {
			sql += " AND SPA_AUTO_CD > '" + AUTO_CD + "'||'609'";
			sql += " AND SPA_AUTO_CD <= '" + AUTO_CD + "'||'809'";
		}
		else if(EDTSPG_PANJ_CD.equals("R")) {
			sql += " AND SPA_AUTO_CD > '" + AUTO_CD + "'||'810'";
			sql += " AND SPA_PANJ_CD = '" + EDTSPG_PANJ_CD + "'";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSp_Health_Autopan_Set_BtnSaveClick_001 \n";
			G_INFO += "설명 : 특검 판정정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ORGA_CD : " + ORGA_CD + " \n";
			G_INFO += " EDTSPG_PANJ_CD : " + EDTSPG_PANJ_CD + " \n";
			G_INFO += " AUTO_CD : " + AUTO_CD + " \n";
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
		<s:AttributeType name='MAX' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String MAX_T = cRsList.getString("MAX");
%>
			<z:row
<%
			if(! MAX_T.equals("")) {
%>
		 		MAX='<%= MAX_T%>'
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
