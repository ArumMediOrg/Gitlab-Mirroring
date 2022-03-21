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

		//
		if(ITEM_CD == null) { ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.IIM_ITEM_CD, A.IIM_KNME_NM, A.IIM_TRTP_CD, A.IIM_TRLT_CD, A.IIM_TRNM_CD, A.IIM_RSLT_KD, B.IIR_RSLT_CD, B.IIR_SPEX_CD, B.IIR_RSLT_VL
  FROM IT_ITEM A LEFT OUTER JOIN IT_ITEM_RESULT B ON A.IIM_ITEM_CD = B.IIR_ITEM_CD AND B.IIR_RSLT_KD = '2'
 WHERE A.IIM_ITEM_CD = :ITEM_CD
		*/

		sql = " SELECT A.IIM_ITEM_CD, A.IIM_KNME_NM, A.IIM_TRTP_CD, A.IIM_TRLT_CD, A.IIM_TRNM_CD, A.IIM_RSLT_KD, B.IIR_RSLT_CD, B.IIR_SPEX_CD, B.IIR_RSLT_VL";
		sql += " FROM IT_ITEM A LEFT OUTER JOIN IT_ITEM_RESULT B";
		sql += " ON A.IIM_ITEM_CD = B.IIR_ITEM_CD";
		sql += " AND B.IIR_RSLT_KD = '2'";
		sql += " WHERE A.IIM_ITEM_CD = '" + ITEM_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_UP_Score_Set_001 \n";
			G_INFO += "설명 : 문진조회-문진판정관련조회(불면증 등) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='IIM_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRTP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRLT_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRNM_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRNM_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RSLT_KD' rs:number='6' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIR_RSLT_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
			 rs:basecolumn='IIR_RSLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IIR_SPEX_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
			 rs:basecolumn='IIR_SPEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIR_RSLT_VL' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_RESULT'
			 rs:basecolumn='IIR_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c10' rs:name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='IT_ITEM_RESULT' rs:basecolumn='ROWID'
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

			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String IIM_TRTP_CD_T = cRsList.getString("IIM_TRTP_CD");
			String IIM_TRLT_CD_T = cRsList.getString("IIM_TRLT_CD");
			String IIM_TRNM_CD_T = cRsList.getString("IIM_TRNM_CD");
			String IIM_RSLT_KD_T = cRsList.getString("IIM_RSLT_KD");
			String IIR_RSLT_CD_T = cRsList.getString("IIR_RSLT_CD");
			String IIR_SPEX_CD_T = cRsList.getString("IIR_SPEX_CD");
			String IIR_RSLT_VL_T = cRsList.getString("IIR_RSLT_VL");
			String ROWID_T = cRsList.getString("ROWID");
			String c10_T = cRsList.getString("c10");
%>
			<z:row
<%
			if(! IIM_ITEM_CD_T.equals("")) {
%>
		 		IIM_ITEM_CD='<%= IIM_ITEM_CD_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
<%
			}

			if(! IIM_TRTP_CD_T.equals("")) {
%>
		 		IIM_TRTP_CD='<%= IIM_TRTP_CD_T%>'
<%
			}

			if(! IIM_TRLT_CD_T.equals("")) {
%>
		 		IIM_TRLT_CD='<%= IIM_TRLT_CD_T%>'
<%
			}

			if(! IIM_TRNM_CD_T.equals("")) {
%>
		 		IIM_TRNM_CD='<%= IIM_TRNM_CD_T%>'
<%
			}

			if(! IIM_RSLT_KD_T.equals("")) {
%>
		 		IIM_RSLT_KD='<%= IIM_RSLT_KD_T%>'
<%
			}

			if(! IIR_RSLT_CD_T.equals("")) {
%>
		 		IIR_RSLT_CD='<%= IIR_RSLT_CD_T%>'
<%
			}

			if(! IIR_SPEX_CD_T.equals("")) {
%>
		 		IIR_SPEX_CD='<%= IIR_SPEX_CD_T%>'
<%
			}

			if(! IIR_RSLT_VL_T.equals("")) {
%>
		 		IIR_RSLT_VL='<%= IIR_RSLT_VL_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c10='<%= cnt%>'
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
