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

		String IIR_ITEM_CD = htMethod.get("IIR_ITEM_CD");

		//
		if(IIR_ITEM_CD == null) { IIR_ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

			SELECT IIR_RSLT_CD, MMT_VIEW_NM, MMT_VIEW_TXT, IIR_USE_YN
			FROM IT_ITEM_RESULT
			JOIN MT_MEDI_EQUIP ON
			MMT_VIEW_CD = SUBSTRING(IIR_RSLT_CD,1,10) AND
			MMT_VIEW_SQ = SUBSTRING(IIR_RSLT_CD,11,10)
			WHERE IIR_ITEM_CD =  :IIR_ITEM_CD 
			AND IIR_RSLT_KD = '3'

		*/

		sql = " SELECT IIR_RSLT_CD, MMT_VIEW_NM, MMT_VIEW_TXT, IIR_USE_YN";
		sql += " FROM IT_ITEM_RESULT JOIN MT_MEDI_EQUIP";
		sql += " ON MMT_VIEW_CD = SUBSTR(IIR_RSLT_CD,1,10)";
		sql += " AND MMT_VIEW_SQ = SUBSTR(IIR_RSLT_CD,11,10)";
		sql += " WHERE IIR_ITEM_CD = '" + IIR_ITEM_CD + "'";
		sql += " AND IIR_RSLT_KD = '3'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_XML_COM_001 \n";
			G_INFO += "설명 : 검사항목 소견조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IIR_ITEM_CD : " + IIR_ITEM_CD + " \n";
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
				<s:AttributeType name='IIR_RSLT_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT' rs:basecolumn='IIR_RSLT_CD'>
					<s:datatype dt:type='string' dt:maxLength='50' rs:maybenull='false'/>
				</s:AttributeType>
				<s:AttributeType name='MMT_VIEW_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='MT_MEDI_EQUIP'
					 rs:basecolumn='MMT_VIEW_NM'>
					<s:datatype dt:type='string' dt:maxLength='100'/>
				</s:AttributeType>
				<s:AttributeType name='MMT_VIEW_TXT' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='MT_MEDI_EQUIP'
					 rs:basecolumn='MMT_VIEW_TXT'>
					<s:datatype dt:type='string' dt:maxLength='4000'/>
				</s:AttributeType>
				<s:AttributeType name='IIR_USE_YN' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
					 rs:basecolumn='IIR_USE_YN'>
					<s:datatype dt:type='string' dt:maxLength='1'/>
				</s:AttributeType>
				<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='IT_ITEM_RESULT' rs:basecolumn='ROWID'
					 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
					<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
				</s:AttributeType>
				<s:AttributeType name='c5' rs:name='ROWID' rs:number='6' rs:rowid='true' rs:basetable='MT_MEDI_EQUIP' rs:basecolumn='ROWID'
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

			String IIR_RSLT_CD_T = cRsList.getString("IIR_RSLT_CD");
			String MMT_VIEW_NM_T = cRsList.getString("MMT_VIEW_NM");
			String MMT_VIEW_TXT_T = cRsList.getString("MMT_VIEW_TXT");
			String IIR_USE_YN_T = cRsList.getString("IIR_USE_YN");
			String ROWID_T = cRsList.getString("ROWID");
			String c5_T = cRsList.getString("c5");
%>
			<z:row
<%
			if(! IIR_RSLT_CD_T.equals("")) {
%>
		 		IIR_RSLT_CD='<%= IIR_RSLT_CD_T%>'
<%
			}

			if(! MMT_VIEW_NM_T.equals("")) {
%>
		 		MMT_VIEW_NM='<%= MMT_VIEW_NM_T%>'
<%
			}

			if(! MMT_VIEW_TXT_T.equals("")) {
%>
		 		MMT_VIEW_TXT='<%= MMT_VIEW_TXT_T%>'
<%
			}

			if(! IIR_USE_YN_T.equals("")) {
%>
		 		IIR_USE_YN='<%= IIR_USE_YN_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c5='<%= cnt%>'
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
