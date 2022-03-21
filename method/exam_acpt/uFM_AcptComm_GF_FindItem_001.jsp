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

SELECT IIM_PITEM_CD, IIM_ITEM_CD, 
       IIM_KNME_NM, IIM_SNME_NM, IIM_ENME_NM, IIM_JNME_NM, IIM_CNME_NM,
       IIM_CANCER_CD, IIM_CNIT_CD, IIM_OSCD_CD, IIM_OSSB_CD, IIM_OSRL_CD
  FROM IT_ITEM 
 WHERE IIM_ITEM_CD IN (:ITEM_CD)
   AND IIM_USE_YN = 'Y'
 ORDER BY IIM_EXGN_CD, IIM_SORT_SQ, IIM_ITEM_CD
		*/

		sql = " SELECT IIM_PITEM_CD, IIM_ITEM_CD, IIM_KNME_NM, IIM_SNME_NM, IIM_ENME_NM, IIM_JNME_NM, IIM_CNME_NM, IIM_CANCER_CD, IIM_CNIT_CD, IIM_OSCD_CD, IIM_OSSB_CD, IIM_OSRL_CD";
		sql += " FROM IT_ITEM";
		sql += " WHERE IIM_ITEM_CD IN ('" + ITEM_CD + "')";
		sql += " AND IIM_USE_YN = 'Y'";
		sql += " ORDER BY IIM_EXGN_CD, IIM_SORT_SQ, IIM_ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_FindItem_001 \n";
			G_INFO += "설명 : 검사 항목 조회 \n";
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
		<s:AttributeType name='IIM_PITEM_CD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_PITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ITEM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SNME_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ENME_NM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_ENME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_JNME_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_JNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_CNME_NM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_CNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_CANCER_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_CANCER_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_CNIT_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_CNIT_CD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_OSCD_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_OSSB_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_OSRL_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSRL_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='13' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
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

			String IIM_PITEM_CD_T = cRsList.getString("IIM_PITEM_CD");
			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String IIM_SNME_NM_T = cRsList.getString("IIM_SNME_NM");
			String IIM_ENME_NM_T = cRsList.getString("IIM_ENME_NM");
			String IIM_JNME_NM_T = cRsList.getString("IIM_JNME_NM");
			String IIM_CNME_NM_T = cRsList.getString("IIM_CNME_NM");
			String IIM_CANCER_CD_T = cRsList.getString("IIM_CANCER_CD");
			String IIM_CNIT_CD_T = cRsList.getString("IIM_CNIT_CD");
			String IIM_OSCD_CD_T = cRsList.getString("IIM_OSCD_CD");
			String IIM_OSSB_CD_T = cRsList.getString("IIM_OSSB_CD");
			String IIM_OSRL_CD_T = cRsList.getString("IIM_OSRL_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IIM_PITEM_CD_T.equals("")) {
%>
		 		IIM_PITEM_CD='<%= IIM_PITEM_CD_T%>'
<%
			}

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

			if(! IIM_SNME_NM_T.equals("")) {
%>
		 		IIM_SNME_NM='<%= IIM_SNME_NM_T%>'
<%
			}

			if(! IIM_ENME_NM_T.equals("")) {
%>
		 		IIM_ENME_NM='<%= IIM_ENME_NM_T%>'
<%
			}

			if(! IIM_JNME_NM_T.equals("")) {
%>
		 		IIM_JNME_NM='<%= IIM_JNME_NM_T%>'
<%
			}

			if(! IIM_CNME_NM_T.equals("")) {
%>
		 		IIM_CNME_NM='<%= IIM_CNME_NM_T%>'
<%
			}

			if(! IIM_CANCER_CD_T.equals("")) {
%>
		 		IIM_CANCER_CD='<%= IIM_CANCER_CD_T%>'
<%
			}

			if(! IIM_CNIT_CD_T.equals("")) {
%>
		 		IIM_CNIT_CD='<%= IIM_CNIT_CD_T%>'
<%
			}

			if(! IIM_OSCD_CD_T.equals("")) {
%>
		 		IIM_OSCD_CD='<%= IIM_OSCD_CD_T%>'
<%
			}

			if(! IIM_OSSB_CD_T.equals("")) {
%>
		 		IIM_OSSB_CD='<%= IIM_OSSB_CD_T%>'
<%
			}

			if(! IIM_OSRL_CD_T.equals("")) {
%>
		 		IIM_OSRL_CD='<%= IIM_OSRL_CD_T%>'
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
