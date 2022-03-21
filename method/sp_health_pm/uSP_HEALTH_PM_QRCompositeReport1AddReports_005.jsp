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
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT PSP_PRSCR_SM_YN, PSP_PRSCR_DRN_YN, PSP_PRSCR_SPT_YN, PSP_PRSCR_NUT_YN, PSP_PRSCR_PYC_YN
  FROM PT_SED_PANJUNG
 WHERE PSP_EXAM_DT = :EXAM_DT
   and PSP_EXAM_SQ = :EXAM_SQ

		*/

		sql = " SELECT PSP_PRSCR_SM_YN, PSP_PRSCR_DRN_YN, PSP_PRSCR_SPT_YN, PSP_PRSCR_NUT_YN, PSP_PRSCR_PYC_YN";
		sql += " FROM PT_SED_PANJUNG";
		sql += " WHERE PSP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND PSP_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_PM_QRCompositeReport1AddReports_005 \n";
			G_INFO += "설명 : 2차 판정정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='PSP_PRSCR_SM_YN' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_SM_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_DRN_YN' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_DRN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_SPT_YN' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_SPT_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_NUT_YN' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_NUT_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_PYC_YN' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_PRSCR_PYC_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='PT_SED_PANJUNG' rs:basecolumn='ROWID'
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

			String PSP_PRSCR_SM_YN_T = cRsList.getString("PSP_PRSCR_SM_YN");
			String PSP_PRSCR_DRN_YN_T = cRsList.getString("PSP_PRSCR_DRN_YN");
			String PSP_PRSCR_SPT_YN_T = cRsList.getString("PSP_PRSCR_SPT_YN");
			String PSP_PRSCR_NUT_YN_T = cRsList.getString("PSP_PRSCR_NUT_YN");
			String PSP_PRSCR_PYC_YN_T = cRsList.getString("PSP_PRSCR_PYC_YN");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! PSP_PRSCR_SM_YN_T.equals("")) {
%>
		 		PSP_PRSCR_SM_YN='<%= PSP_PRSCR_SM_YN_T%>'
<%
			}

			if(! PSP_PRSCR_DRN_YN_T.equals("")) {
%>
		 		PSP_PRSCR_DRN_YN='<%= PSP_PRSCR_DRN_YN_T%>'
<%
			}

			if(! PSP_PRSCR_SPT_YN_T.equals("")) {
%>
		 		PSP_PRSCR_SPT_YN='<%= PSP_PRSCR_SPT_YN_T%>'
<%
			}

			if(! PSP_PRSCR_NUT_YN_T.equals("")) {
%>
		 		PSP_PRSCR_NUT_YN='<%= PSP_PRSCR_NUT_YN_T%>'
<%
			}

			if(! PSP_PRSCR_PYC_YN_T.equals("")) {
%>
		 		PSP_PRSCR_PYC_YN='<%= PSP_PRSCR_PYC_YN_T%>'
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
