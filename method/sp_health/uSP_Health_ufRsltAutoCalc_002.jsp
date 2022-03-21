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

		String APLY_DT = htMethod.get("APLY_DT");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String SEX_CD = htMethod.get("SEX_CD");
		String PSNL_AGE = htMethod.get("PSNL_AGE");

		//
		if(APLY_DT == null) { APLY_DT = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PSNL_AGE == null) { PSNL_AGE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IIA_PRE_CD1, IIA_PRE_CD2, IIA_PRE_CD3, IIA_PRE_CD4, IIA_PRE_CD5, IIA_PRE_CD6, IIA_ACAL_NM
  FROM IT_ITEM_ACAL
 WHERE IIA_APLY_DT <= :APLY_DT
   AND IIA_ITEM_CD =  :ITEM_CD
   AND IIA_SEX_CD  =  :SEX_CD
   AND IIA_AGE_FR <=  :PSNL_AGE
   AND IIA_AGE_TO >=  :PSNL_AGE
   AND IIA_USE_YN = 'Y'
   AND ROWNUM = 1
 ORDER BY IIA_APLY_DT DESC
		*/

		sql = " SELECT IIA_PRE_CD1, IIA_PRE_CD2, IIA_PRE_CD3, IIA_PRE_CD4, IIA_PRE_CD5, IIA_PRE_CD6, IIA_ACAL_NM";
		sql += " FROM IT_ITEM_ACAL";
		sql += " WHERE IIA_APLY_DT <= '" + APLY_DT + "'";
		sql += " AND IIA_ITEM_CD = '" + ITEM_CD + "'";
		sql += " AND IIA_SEX_CD = '" + SEX_CD + "'";
		sql += " AND IIA_AGE_FR <= '" + PSNL_AGE + "'";
		sql += " AND IIA_AGE_TO >= '" + PSNL_AGE + "'";
		sql += " AND IIA_USE_YN = 'Y'";
		sql += " AND ROWNUM = 1";
		sql += " ORDER BY IIA_APLY_DT DESC";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_ufRsltAutoCalc_002 \n";
			G_INFO += "설명 : 자동계산항목처리-대상항목 수식조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " APLY_DT : " + APLY_DT + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PSNL_AGE : " + PSNL_AGE + " \n";
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
		<s:AttributeType name='IIA_PRE_CD1' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_PRE_CD1'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_PRE_CD2' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_PRE_CD2'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_PRE_CD3' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_PRE_CD3'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_PRE_CD4' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_PRE_CD4'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_PRE_CD5' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_PRE_CD5'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_PRE_CD6' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_PRE_CD6'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIA_ACAL_NM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_ACAL'
			 rs:basecolumn='IIA_ACAL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='IT_ITEM_ACAL' rs:basecolumn='ROWID'
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

			String IIA_PRE_CD1_T = cRsList.getString("IIA_PRE_CD1");
			String IIA_PRE_CD2_T = cRsList.getString("IIA_PRE_CD2");
			String IIA_PRE_CD3_T = cRsList.getString("IIA_PRE_CD3");
			String IIA_PRE_CD4_T = cRsList.getString("IIA_PRE_CD4");
			String IIA_PRE_CD5_T = cRsList.getString("IIA_PRE_CD5");
			String IIA_PRE_CD6_T = cRsList.getString("IIA_PRE_CD6");
			String IIA_ACAL_NM_T = cRsList.getString("IIA_ACAL_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IIA_PRE_CD1_T.equals("")) {
%>
		 		IIA_PRE_CD1='<%= IIA_PRE_CD1_T%>'
<%
			}

			if(! IIA_PRE_CD2_T.equals("")) {
%>
		 		IIA_PRE_CD2='<%= IIA_PRE_CD2_T%>'
<%
			}

			if(! IIA_PRE_CD3_T.equals("")) {
%>
		 		IIA_PRE_CD3='<%= IIA_PRE_CD3_T%>'
<%
			}

			if(! IIA_PRE_CD4_T.equals("")) {
%>
		 		IIA_PRE_CD4='<%= IIA_PRE_CD4_T%>'
<%
			}

			if(! IIA_PRE_CD5_T.equals("")) {
%>
		 		IIA_PRE_CD5='<%= IIA_PRE_CD5_T%>'
<%
			}

			if(! IIA_PRE_CD6_T.equals("")) {
%>
		 		IIA_PRE_CD6='<%= IIA_PRE_CD6_T%>'
<%
			}

			if(! IIA_ACAL_NM_T.equals("")) {
%>
		 		IIA_ACAL_NM='<%= IIA_ACAL_NM_T%>'
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
