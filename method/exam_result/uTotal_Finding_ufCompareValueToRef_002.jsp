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

SELECT HTI_SOCK_CD, HTI_RSLT_LOW, HTI_RSLT_HIGH, HTI_CHAR_VAL, HTI_SOCK_SQ,
       CASE WHEN nvl(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_TITLE_NM FROM IT_FINDING
                                                          WHERE IFG_RSLT_CD = nvl(HTI_SOCK_CD,' '))
            ELSE                                          HTI_TITLE_NM END HTI_TITLE_NM,
       CASE WHEN nvl(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_ETITLE_NM FROM IT_FINDING
                                                          WHERE IFG_RSLT_CD = nvl(HTI_SOCK_CD,' '))
            ELSE                                          HTI_ETITLE_NM END HTI_ETITLE_NM,
       CASE WHEN nvl(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_CTITLE_NM FROM IT_FINDING
                                                          WHERE IFG_RSLT_CD = nvl(HTI_SOCK_CD,' '))
            ELSE                                          HTI_CTITLE_NM END HTI_CTITLE_NM,
       CASE WHEN nvl(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_JTITLE_NM FROM IT_FINDING
                                                          WHERE IFG_RSLT_CD = nvl(HTI_SOCK_CD,' '))
            ELSE                                          HTI_JTITLE_NM END HTI_JTITLE_NM,
       CASE WHEN nvl(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_RSLT_EX FROM IT_FINDING
                                                          WHERE IFG_RSLT_CD = nvl(HTI_SOCK_CD,' '))
            ELSE                                          HTI_SOCK_TX END HTI_SOCK_TX,
       CASE WHEN nvl(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_ERSLT_EX FROM IT_FINDING
                                                          WHERE IFG_RSLT_CD = nvl(HTI_SOCK_CD,' '))
            ELSE                                          HTI_ESOCK_TX END HTI_ESOCK_TX,
       CASE WHEN nvl(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_CRSLT_EX FROM IT_FINDING
                                                          WHERE IFG_RSLT_CD = nvl(HTI_SOCK_CD,' '))
            ELSE                                          HTI_CSOCK_TX END HTI_CSOCK_TX,
       CASE WHEN nvl(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_JRSLT_EX FROM IT_FINDING
                                                          WHERE IFG_RSLT_CD = nvl(HTI_SOCK_CD,' '))
            ELSE                                          HTI_JSOCK_TX END HTI_JSOCK_TX
 FROM HEALTH_TOTALSCREENING_ITEM
 WHERE HTI_ITEM_CD = :ITEM_CD 
 AND   HTI_APLT_DT = (SELECT MAX(HTI_APLT_DT) HTI_APLT_DT FROM HEALTH_TOTALSCREENING_ITEM
                      where HTI_ITEM_CD = :ITEM_CD )
		*/

		sql = " SELECT HTI_SOCK_CD, HTI_RSLT_LOW, HTI_RSLT_HIGH, HTI_CHAR_VAL, HTI_SOCK_SQ";
		sql += ", CASE WHEN NVL(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_TITLE_NM FROM IT_FINDING WHERE IFG_RSLT_CD = NVL(HTI_SOCK_CD,' ')) ELSE HTI_TITLE_NM END HTI_TITLE_NM";
		sql += ", CASE WHEN NVL(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_ETITLE_NM FROM IT_FINDING WHERE IFG_RSLT_CD = NVL(HTI_SOCK_CD,' ')) ELSE HTI_ETITLE_NM END HTI_ETITLE_NM";
		sql += ", CASE WHEN NVL(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_CTITLE_NM FROM IT_FINDING WHERE IFG_RSLT_CD = NVL(HTI_SOCK_CD,' ')) ELSE HTI_CTITLE_NM END HTI_CTITLE_NM";
		sql += ", CASE WHEN NVL(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_JTITLE_NM FROM IT_FINDING WHERE IFG_RSLT_CD = NVL(HTI_SOCK_CD,' ')) ELSE HTI_JTITLE_NM END HTI_JTITLE_NM";
		sql += ", CASE WHEN NVL(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_RSLT_EX FROM IT_FINDING WHERE IFG_RSLT_CD = NVL(HTI_SOCK_CD,' ')) ELSE HTI_SOCK_TX END HTI_SOCK_TX";
		sql += ", CASE WHEN NVL(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_ERSLT_EX FROM IT_FINDING WHERE IFG_RSLT_CD = NVL(HTI_SOCK_CD,' ')) ELSE HTI_ESOCK_TX END HTI_ESOCK_TX";
		sql += ", CASE WHEN NVL(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_CRSLT_EX FROM IT_FINDING WHERE IFG_RSLT_CD = NVL(HTI_SOCK_CD,' ')) ELSE HTI_CSOCK_TX END HTI_CSOCK_TX";
		sql += ", CASE WHEN NVL(HTI_SOCK_CD,' ') <> ' ' THEN (SELECT IFG_JRSLT_EX FROM IT_FINDING WHERE IFG_RSLT_CD = NVL(HTI_SOCK_CD,' ')) ELSE HTI_JSOCK_TX END HTI_JSOCK_TX";
		sql += " FROM HEALTH_TOTALSCREENING_ITEM";
		sql += " WHERE HTI_ITEM_CD = '" + ITEM_CD + "'";
		sql += " AND HTI_APLT_DT = (";
		sql += "	SELECT MAX(HTI_APLT_DT) HTI_APLT_DT";
		sql += "	FROM HEALTH_TOTALSCREENING_ITEM";
		sql += "	WHERE HTI_ITEM_CD = '" + ITEM_CD + "'";
		sql += ")";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uTotal_Finding_ufCompareValueToRef_002 \n";
			G_INFO += "설명 : 검사항목별 자동판정소견조회 \n";
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
		<s:AttributeType name='HTI_SOCK_CD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_SOCK_CD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_RSLT_LOW' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_RSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_RSLT_HIGH' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_RSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_CHAR_VAL' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_CHAR_VAL'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_SOCK_SQ' rs:number='5' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_SOCK_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_TITLE_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_TITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_ETITLE_NM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_ETITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_CTITLE_NM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_CTITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_JTITLE_NM' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_JTITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_SOCK_TX' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_SOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_ESOCK_TX' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_ESOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_CSOCK_TX' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_CSOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_JSOCK_TX' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_JSOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='14' rs:rowid='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM' rs:basecolumn='ROWID'
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

			String HTI_SOCK_CD_T = cRsList.getString("HTI_SOCK_CD");
			String HTI_RSLT_LOW_T = cRsList.getString("HTI_RSLT_LOW");
			String HTI_RSLT_HIGH_T = cRsList.getString("HTI_RSLT_HIGH");
			String HTI_CHAR_VAL_T = cRsList.getString("HTI_CHAR_VAL");
			String HTI_SOCK_SQ_T = cRsList.getString("HTI_SOCK_SQ");
			String HTI_TITLE_NM_T = cRsList.getString("HTI_TITLE_NM");
			String HTI_ETITLE_NM_T = cRsList.getString("HTI_ETITLE_NM");
			String HTI_CTITLE_NM_T = cRsList.getString("HTI_CTITLE_NM");
			String HTI_JTITLE_NM_T = cRsList.getString("HTI_JTITLE_NM");
			String HTI_SOCK_TX_T = cRsList.getString("HTI_SOCK_TX");
			String HTI_ESOCK_TX_T = cRsList.getString("HTI_ESOCK_TX");
			String HTI_CSOCK_TX_T = cRsList.getString("HTI_CSOCK_TX");
			String HTI_JSOCK_TX_T = cRsList.getString("HTI_JSOCK_TX");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! HTI_SOCK_CD_T.equals("")) {
%>
		 		HTI_SOCK_CD='<%= HTI_SOCK_CD_T%>'
<%
			}

			if(! HTI_RSLT_LOW_T.equals("")) {
%>
		 		HTI_RSLT_LOW='<%= HTI_RSLT_LOW_T%>'
<%
			}

			if(! HTI_RSLT_HIGH_T.equals("")) {
%>
		 		HTI_RSLT_HIGH='<%= HTI_RSLT_HIGH_T%>'
<%
			}

			if(! HTI_CHAR_VAL_T.equals("")) {
%>
		 		HTI_CHAR_VAL='<%= HTI_CHAR_VAL_T%>'
<%
			}

			if(! HTI_SOCK_SQ_T.equals("")) {
%>
		 		HTI_SOCK_SQ='<%= HTI_SOCK_SQ_T%>'
<%
			}

			if(! HTI_TITLE_NM_T.equals("")) {
%>
		 		HTI_TITLE_NM='<%= HTI_TITLE_NM_T%>'
<%
			}

			if(! HTI_ETITLE_NM_T.equals("")) {
%>
		 		HTI_ETITLE_NM='<%= HTI_ETITLE_NM_T%>'
<%
			}

			if(! HTI_CTITLE_NM_T.equals("")) {
%>
		 		HTI_CTITLE_NM='<%= HTI_CTITLE_NM_T%>'
<%
			}

			if(! HTI_JTITLE_NM_T.equals("")) {
%>
		 		HTI_JTITLE_NM='<%= HTI_JTITLE_NM_T%>'
<%
			}

			if(! HTI_SOCK_TX_T.equals("")) {
%>
		 		HTI_SOCK_TX='<%= HTI_SOCK_TX_T%>'
<%
			}

			if(! HTI_ESOCK_TX_T.equals("")) {
%>
		 		HTI_ESOCK_TX='<%= HTI_ESOCK_TX_T%>'
<%
			}

			if(! HTI_CSOCK_TX_T.equals("")) {
%>
		 		HTI_CSOCK_TX='<%= HTI_CSOCK_TX_T%>'
<%
			}

			if(! HTI_JSOCK_TX_T.equals("")) {
%>
		 		HTI_JSOCK_TX='<%= HTI_JSOCK_TX_T%>'
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
