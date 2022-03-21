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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*
SELECT A.IIM_ITEM_CD, A.IIM_OSCD_CD, A.IIM_OSSB_CD, A.IIM_OSRL_CD, A.IIM_RSLT_KD,
       CASE WHEN B.EMI_ITEM_CD IS NULL OR B.EMI_ITEM_CD = '' THEN 'N' ELSE 'Y' END IIM_OCS_YN 
  FROM IT_ITEM A LEFT OUTER JOIN ET_PACK_MARK_ITEM B 
    ON B.EMI_ITEM_CD = A.IIM_ITEM_CD 
   AND B.EMI_MARK_KD = '3'
   AND B.EMI_MARK_CD = '01'
   AND B.EMI_MARK_SQ = '000'
		*/

		sql = " SELECT A.IIM_ITEM_CD, A.IIM_OSCD_CD, A.IIM_OSSB_CD, A.IIM_OSRL_CD, A.IIM_RSLT_KD, ";
		sql += "	CASE WHEN B.EMI_ITEM_CD IS NULL OR B.EMI_ITEM_CD = '' THEN 'N' ELSE 'Y' END IIM_OCS_YN ";
		sql += " FROM IT_ITEM A LEFT OUTER JOIN ET_PACK_MARK_ITEM B ";
		sql += " 	ON B.EMI_ITEM_CD = A.IIM_ITEM_CD ";
		sql += " AND B.EMI_MARK_KD = '3' ";
		sql += " AND B.EMI_MARK_CD = '01' ";
		sql += " AND B.EMI_MARK_SQ = '000' ";
		

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_FindOcsCode_002 \n";
			G_INFO += "설명 : 예약 항목 OCS코드 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='IIM_OSCD_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_OSSB_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_OSRL_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSRL_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RSLT_KD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_OCS_YN' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OCS_YN'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID' rs:keycolumn='true'
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

			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String IIM_OSCD_CD_T = cRsList.getString("IIM_OSCD_CD");
			String IIM_OSSB_CD_T = cRsList.getString("IIM_OSSB_CD");
			String IIM_OSRL_CD_T = cRsList.getString("IIM_OSRL_CD");
			String IIM_RSLT_KD_T = cRsList.getString("IIM_RSLT_KD");
			String IIM_OCS_YN_T = cRsList.getString("IIM_OCS_YN");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IIM_ITEM_CD_T.equals("")) {
%>
		 		IIM_ITEM_CD='<%= IIM_ITEM_CD_T%>'
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

			if(! IIM_RSLT_KD_T.equals("")) {
%>
				IIM_RSLT_KD='<%= IIM_RSLT_KD_T%>'
<%
			}
			
			if(! IIM_OCS_YN_T.equals("")) {
%>
				IIM_OCS_YN='<%= IIM_OCS_YN_T%>'
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
