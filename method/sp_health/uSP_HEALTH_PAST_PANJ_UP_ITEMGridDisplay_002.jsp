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

		String ITEM_CD = htMethod.get("ITEM_CD");
		String SEX_CD = htMethod.get("SEX_CD");
		String AGE = htMethod.get("AGE");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_CD = htMethod.get("EXAM_CD");

		//
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(AGE == null) { AGE = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select * from TABLE(GetItemVldtTable_PKG.GetItemVldtTable(:ITEM_CD, :SEX_CD, :AGE, :EXAM_DT, :EXAM_CD))
		*/

		sql = " SELECT *";
		sql += " FROM TABLE(GETITEMVLDTTABLE_PKG.GETITEMVLDTTABLE('" + ITEM_CD + "', '" + SEX_CD + "', '" + AGE + "', '" + EXAM_DT + "', '" + EXAM_CD + "'))";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_PAST_PANJ_UP_ITEMGridDisplay_002 \n";
			G_INFO += "설명 : 과거판정 검사항목 참고치 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " AGE : " + AGE + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
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
		<s:AttributeType name='ITEM_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RLOW' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RHIGH' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CHRVAL' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='RUNIT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='RSPT' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='LOWKD' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='HIGHKD' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RSZR_KD' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String RLOW_T = cRsList.getString("RLOW");
			String RHIGH_T = cRsList.getString("RHIGH");
			String CHRVAL_T = cRsList.getString("CHRVAL");
			String RUNIT_T = cRsList.getString("RUNIT");
			String RSPT_T = cRsList.getString("RSPT");
			String LOWKD_T = cRsList.getString("LOWKD");
			String HIGHKD_T = cRsList.getString("HIGHKD");
			String RSZR_KD_T = cRsList.getString("RSZR_KD");
%>
			<z:row
<%
			if(! ITEM_CD_T.equals("")) {
%>
		 		ITEM_CD='<%= ITEM_CD_T%>'
<%
			}

			if(! RLOW_T.equals("")) {
%>
		 		RLOW='<%= RLOW_T%>'
<%
			}

			if(! RHIGH_T.equals("")) {
%>
		 		RHIGH='<%= RHIGH_T%>'
<%
			}

			if(! CHRVAL_T.equals("")) {
%>
		 		CHRVAL='<%= CHRVAL_T%>'
<%
			}

			if(! RUNIT_T.equals("")) {
%>
		 		RUNIT='<%= RUNIT_T%>'
<%
			}

			if(! RSPT_T.equals("")) {
%>
		 		RSPT='<%= RSPT_T%>'
<%
			}

			if(! LOWKD_T.equals("")) {
%>
		 		LOWKD='<%= LOWKD_T%>'
<%
			}

			if(! HIGHKD_T.equals("")) {
%>
		 		HIGHKD='<%= HIGHKD_T%>'
<%
			}

			if(! RSZR_KD_T.equals("")) {
%>
		 		RSZR_KD='<%= RSZR_KD_T%>'
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
