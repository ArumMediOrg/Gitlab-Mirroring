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

		String SFIELD = htMethod.get("SFIELD");
		String SCOUNT = htMethod.get("SCOUNT");
		String EXAM_YR = htMethod.get("EXAM_YR");

		//
		if(SFIELD == null) { SFIELD = ""; }
		if(SCOUNT == null) { SCOUNT = ""; }
		if(EXAM_YR == null) { EXAM_YR = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IIC_ITEM_CD, SUBSTR(:sField, :sCount, 1) AS HCGB, IIC_RSLT_GROUP 
FROM IT_ITEM_CALL 
WHERE IIC_EXAM_YR = :EXAM_YR AND SUBSTR(:sField, :sCount, 1) <> '0'
		*/

		sql = " SELECT IIC_ITEM_CD, SUBSTR(" + SFIELD + ", " + SCOUNT + ", 1) AS HCGB, IIC_RSLT_GROUP ";
		sql += " FROM IT_ITEM_CALL";
		sql += " WHERE IIC_EXAM_YR = '" + EXAM_YR + "'";
		sql += " AND SUBSTR(" + SFIELD + ", " + SCOUNT + ", 1) <> '0'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Call_upGetItem_Call_002 \n";
			G_INFO += "설명 : 항목정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SFIELD : " + SFIELD + " \n";
			G_INFO += " SCOUNT : " + SCOUNT + " \n";
			G_INFO += " EXAM_YR : " + EXAM_YR + " \n";
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
		<s:AttributeType name='IIC_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL' rs:basecolumn='IIC_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HCGB' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='3' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIC_RSLT_GROUP' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_CALL'
			 rs:basecolumn='IIC_RSLT_GROUP'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='IT_ITEM_CALL' rs:basecolumn='ROWID'
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

			String IIC_ITEM_CD_T = cRsList.getString("IIC_ITEM_CD");
			String HCGB_T = cRsList.getString("HCGB");
			String IIC_RSLT_GROUP_T = cRsList.getString("IIC_RSLT_GROUP");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IIC_ITEM_CD_T.equals("")) {
%>
		 		IIC_ITEM_CD='<%= IIC_ITEM_CD_T%>'
<%
			}

			if(! HCGB_T.equals("")) {
%>
		 		HCGB='<%= HCGB_T%>'
<%
			}

			if(! IIC_RSLT_GROUP_T.equals("")) {
%>
		 		IIC_RSLT_GROUP='<%= IIC_RSLT_GROUP_T%>'
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
