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

		String DEV_CD = htMethod.get("DEV_CD");
		String RZ_CHCK_M = htMethod.get("RZ_CHCK_M");

		//
		if(DEV_CD == null) { DEV_CD = ""; }
		if(RZ_CHCK_M == null) { RZ_CHCK_M = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IDR_DEV_CD,IDR_RSLT_CD,                                                                                                                                                             
(SELECT SUBSTR(CCN_SMALL,5,2)||'-'||CCN_FULL_NM FROM CT_COMMON WHERE CCN_LARGE = '0214' AND CCN_VALUE = IDR_DEV_CD AND CCN_REL = IDR_FIND_CD) IDR_FIND_CD,                            
(SELECT SUBSTR(CCN_SMALL,7,2) ||'-'|| CCN_FULL_NM FROM CT_COMMON WHERE CCN_LARGE = '0215' AND CCN_VALUE = IDR_DEV_CD AND CCN_REL = IDR_FIND_CD AND CCN_RMK = IDR_DISE_CD) IDR_DISE_CD,
IDR_ORDR_SQ,IDR_CONT_EX,IDR_TITL_NM,IDR_HERT_CD,IDR_HERT_CD2,                                                                                                                              
(select CCN_SMALL||'-'||CCN_FULL_NM from CT_COMMON where CCN_LARGE = '0216' and CCN_SMALL = IDR_POST_CD) IDR_POST_CD,                                                                    
(select SUBSTR(CCN_SMALL,3,2)||'-'||CCN_FULL_NM from CT_COMMON where CCN_LARGE = '0217' and CCN_SMALL = IDR_POST_CD||IDR_ACTN_CD) IDR_ACTN_CD,                                         
IDR_MARK_ADD_TX,IDR_DEV_ADD_TX,IDR_AFTE_MON,IDR_USE_YN                                                                                                                                     
FROM IT_DEV_RSLT 
WHERE IDR_DEV_CD = :DEV_CD
if :Rz_chck_M = '1' then
   AND IDR_USE_YN = 'Y'
else if :Rz_chck_M = '2' then
   AND IDR_USE_YN = 'N'
		*/

		sql = " SELECT IDR_DEV_CD,IDR_RSLT_CD, (SELECT SUBSTR(CCN_SMALL,5,2)||'-'||CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE CCN_LARGE = '0214'";
		sql += " AND CCN_VALUE = IDR_DEV_CD";
		sql += " AND CCN_REL = IDR_FIND_CD) IDR_FIND_CD";
		sql += ", (";
		sql += "	SELECT SUBSTR(CCN_SMALL,7,2) ||'-'|| CCN_FULL_NM";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE CCN_LARGE = '0215'";
		sql += " 	AND CCN_VALUE = IDR_DEV_CD";
		sql += " 	AND CCN_REL = IDR_FIND_CD";
		sql += " 	AND CCN_RMK = IDR_DISE_CD";
		sql += ") IDR_DISE_CD";
		sql += ", IDR_ORDR_SQ,IDR_CONT_EX,IDR_TITL_NM,IDR_HERT_CD,IDR_HERT_CD2";
		sql += ", (";
		sql += "	SELECT CCN_SMALL||'-'||CCN_FULL_NM";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE CCN_LARGE = '0216'";
		sql += " 	AND CCN_SMALL = IDR_POST_CD";
		sql += ") IDR_POST_CD";
		sql += ", (";
		sql += "	SELECT SUBSTR(CCN_SMALL,3,2) || '-' || CCN_FULL_NM";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE CCN_LARGE = '0217'";
		sql += " 	AND CCN_SMALL = IDR_POST_CD || IDR_ACTN_CD";
		sql += ") IDR_ACTN_CD";
		sql += ", IDR_MARK_ADD_TX,IDR_DEV_ADD_TX,IDR_AFTE_MON,IDR_USE_YN";
		sql += " FROM IT_DEV_RSLT";
		sql += " WHERE IDR_DEV_CD = '" + DEV_CD + "'";

		if(RZ_CHCK_M.equals("1")) {
			sql += " AND IDR_USE_YN = 'Y'";
		}
		else if(RZ_CHCK_M.equals("2")) {
			sql += " AND IDR_USE_YN = 'N'";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uVT1000_upGetDevFinding_001 \n";
			G_INFO += "설명 : 장비결과값 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DEV_CD : " + DEV_CD + " \n";
			G_INFO += " RZ_CHCK_M : " + RZ_CHCK_M + " \n";
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
		<s:AttributeType name='IDR_DEV_CD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_DEV_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_RSLT_CD' rs:number='2' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT' rs:basecolumn='IDR_RSLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_FIND_CD' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='305'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_DISE_CD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='305'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_ORDR_SQ' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_ORDR_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_CONT_EX' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_CONT_EX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_TITL_NM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_TITL_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_HERT_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_HERT_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_HERT_CD2' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_HERT_CD2'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_POST_CD' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='321'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_ACTN_CD' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='305'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_MARK_ADD_TX' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_MARK_ADD_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_DEV_ADD_TX' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_DEV_ADD_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_AFTE_MON' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_AFTE_MON'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='3' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IDR_USE_YN' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_DEV_RSLT'
			 rs:basecolumn='IDR_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='16' rs:rowid='true' rs:basetable='IT_DEV_RSLT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String IDR_DEV_CD_T = cRsList.getString("IDR_DEV_CD");
			String IDR_RSLT_CD_T = cRsList.getString("IDR_RSLT_CD");
			String IDR_FIND_CD_T = cRsList.getString("IDR_FIND_CD");
			String IDR_DISE_CD_T = cRsList.getString("IDR_DISE_CD");
			String IDR_ORDR_SQ_T = cRsList.getString("IDR_ORDR_SQ");
			String IDR_CONT_EX_T = cRsList.getString("IDR_CONT_EX");
			String IDR_TITL_NM_T = cRsList.getString("IDR_TITL_NM");
			String IDR_HERT_CD_T = cRsList.getString("IDR_HERT_CD");
			String IDR_HERT_CD2_T = cRsList.getString("IDR_HERT_CD2");
			String IDR_POST_CD_T = cRsList.getString("IDR_POST_CD");
			String IDR_ACTN_CD_T = cRsList.getString("IDR_ACTN_CD");
			String IDR_MARK_ADD_TX_T = cRsList.getString("IDR_MARK_ADD_TX");
			String IDR_DEV_ADD_TX_T = cRsList.getString("IDR_DEV_ADD_TX");
			String IDR_AFTE_MON_T = cRsList.getString("IDR_AFTE_MON");
			String IDR_USE_YN_T = cRsList.getString("IDR_USE_YN");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IDR_DEV_CD_T.equals("")) {
%>
		 		IDR_DEV_CD='<%= IDR_DEV_CD_T%>'
<%
			}

			if(! IDR_RSLT_CD_T.equals("")) {
%>
		 		IDR_RSLT_CD='<%= IDR_RSLT_CD_T%>'
<%
			}

			if(! IDR_FIND_CD_T.equals("")) {
%>
		 		IDR_FIND_CD='<%= IDR_FIND_CD_T%>'
<%
			}

			if(! IDR_DISE_CD_T.equals("")) {
%>
		 		IDR_DISE_CD='<%= IDR_DISE_CD_T%>'
<%
			}

			if(! IDR_ORDR_SQ_T.equals("")) {
%>
		 		IDR_ORDR_SQ='<%= IDR_ORDR_SQ_T%>'
<%
			}

			if(! IDR_CONT_EX_T.equals("")) {
%>
		 		IDR_CONT_EX='<%= IDR_CONT_EX_T%>'
<%
			}

			if(! IDR_TITL_NM_T.equals("")) {
%>
		 		IDR_TITL_NM='<%= IDR_TITL_NM_T%>'
<%
			}

			if(! IDR_HERT_CD_T.equals("")) {
%>
		 		IDR_HERT_CD='<%= IDR_HERT_CD_T%>'
<%
			}

			if(! IDR_HERT_CD2_T.equals("")) {
%>
		 		IDR_HERT_CD2='<%= IDR_HERT_CD2_T%>'
<%
			}

			if(! IDR_POST_CD_T.equals("")) {
%>
		 		IDR_POST_CD='<%= IDR_POST_CD_T%>'
<%
			}

			if(! IDR_ACTN_CD_T.equals("")) {
%>
		 		IDR_ACTN_CD='<%= IDR_ACTN_CD_T%>'
<%
			}

			if(! IDR_MARK_ADD_TX_T.equals("")) {
%>
		 		IDR_MARK_ADD_TX='<%= IDR_MARK_ADD_TX_T%>'
<%
			}

			if(! IDR_DEV_ADD_TX_T.equals("")) {
%>
		 		IDR_DEV_ADD_TX='<%= IDR_DEV_ADD_TX_T%>'
<%
			}

			if(! IDR_AFTE_MON_T.equals("")) {
%>
		 		IDR_AFTE_MON='<%= IDR_AFTE_MON_T%>'
<%
			}

			if(! IDR_USE_YN_T.equals("")) {
%>
		 		IDR_USE_YN='<%= IDR_USE_YN_T%>'
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
