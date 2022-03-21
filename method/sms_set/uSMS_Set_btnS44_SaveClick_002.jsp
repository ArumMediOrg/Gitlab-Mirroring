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
	ResultSet rsDetail = null;

	CRs cRsList = null;
	CRs cRsDetail = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String PLCE_CD = htMethod.get("PLCE_CD");
		String BEFOR_DT = htMethod.get("BEFOR_DT");
		String PRIOR_SQ = htMethod.get("PRIOR_SQ");
		//
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(BEFOR_DT == null) { BEFOR_DT = ""; }
		if(PRIOR_SQ == null) { PRIOR_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*
Select CSA_PRIOR_SQ from CR_SMS_AUTO_SET
Where CSA_PLCE_CD = :PLCE_CD
  And CSA_BEFOR_DT = :BEFOR_DT
  And CSA_PRIOR_SQ = :PRIOR_SQ
		*/

		sql = " Select CSA_PRIOR_SQ from CR_SMS_AUTO_SET ";
		sql += " Where CSA_PLCE_CD = '" + PLCE_CD + "' ";
		sql += " And CSA_BEFOR_DT = '" + BEFOR_DT + "' ";
		sql += " And CSA_PRIOR_SQ = '" + PRIOR_SQ + "' ";

		//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uSMS_Set_btnS44_SaveClick_002 \n";
		G_INFO += "설명 : 우선순위 중복 체크 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
		G_INFO += " BEFOR_DT : " + BEFOR_DT + " \n";
		G_INFO += " PRIOR_SQ : " + PRIOR_SQ + " \n";
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
		<s:AttributeType name='CSA_PRIOR_SQ' rs:number='1' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET' rs:basecolumn='CSA_PRIOR_SQ'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='2' rs:rowid='true' rs:writeunknown='true' rs:basetable='CR_SMS_AUTO_SET'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CSA_PRIOR_SQ_T = cRsList.getString("CSA_PRIOR_SQ");
			
%>
			<z:row
<%
			if(! CSA_PRIOR_SQ_T.equals("")) {
%>
		 		CSA_PRIOR_SQ='<%= CSA_PRIOR_SQ_T%>'
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

		if(rsDetail != null) {
			rsDetail.close();
			rsDetail = null;
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
