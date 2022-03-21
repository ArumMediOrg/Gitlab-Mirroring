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

		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select
         HTI_APLT_DT           ,HTI_SOCK_SQ             ,HTI_SEX_CD            ,HTI_PROF_CD          ,HTI_ITEM_CD           ,HTI_SOCK_CD , IIM_KNME_NM
  ,CASE WHEN HTI_SEX_CD = '1' THEN '남자'
        WHEN HTI_SEX_CD = '2' THEN '여자'
   ELSE                              '공통' END HTI_SEX_NM
  ,HTI_TITLE_NM          ,HTI_ETITLE_NM    ,HTI_CTITLE_NM         ,HTI_RTITLE_NM  ,HTI_JTITLE_NM
  ,HTI_SOCK_TX           ,HTI_ESOCK_TX     ,HTI_CSOCK_TX          ,HTI_RSOCK_TX   ,HTI_JSOCK_TX
  ,HTI_RSLT_LOW          ,HTI_RSLT_HIGH    ,HTI_CHAR_VAL          ,HTI_PANJ_CD    ,HTI_USE_YN            ,HTI_INPT_ID
        ,HTI_INPT_DTT          ,HTI_MODI_ID             ,HTI_MODI_DTT          ,HTI_RSOCK_TX          ,HTI_RTITLE_NM
from  HEALTH_TOTALSCREENING_ITEM a
   left outer join IT_ITEM b on HTI_ITEM_CD = IIM_ITEM_CD
where 0 = 0
:sSQL_ADD


		*/

		sql = " SELECT HTI_APLT_DT ,HTI_SOCK_SQ ,HTI_SEX_CD ,HTI_PROF_CD ,HTI_ITEM_CD ,HTI_SOCK_CD , IIM_KNME_NM ,CASE WHEN HTI_SEX_CD = '1' THEN '남자' WHEN HTI_SEX_CD = '2' THEN '여자' ELSE '공통' END HTI_SEX_NM ,HTI_TITLE_NM ,HTI_ETITLE_NM ,HTI_CTITLE_NM ,HTI_RTITLE_NM ,HTI_JTITLE_NM ,HTI_SOCK_TX ,HTI_ESOCK_TX ,HTI_CSOCK_TX ,HTI_RSOCK_TX ,HTI_JSOCK_TX ,HTI_RSLT_LOW ,HTI_RSLT_HIGH ,HTI_CHAR_VAL ,HTI_PANJ_CD ,HTI_USE_YN ,HTI_INPT_ID ,HTI_INPT_DTT ,HTI_MODI_ID ,HTI_MODI_DTT ,HTI_RSOCK_TX ,HTI_RTITLE_NM";
		sql += " FROM HEALTH_TOTALSCREENING_ITEM A LEFT OUTER JOIN IT_ITEM B";
		sql += " ON HTI_ITEM_CD = IIM_ITEM_CD";
		sql += " WHERE 0 = 0";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHEALTH_TOTAL_SCREENING_SET_upGetFinding_001 \n";
			G_INFO += "설명 : 판정소견 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
		<s:AttributeType name='HTI_APLT_DT' rs:number='1' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_APLT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_SOCK_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_SOCK_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_SEX_CD' rs:number='3' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_PROF_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_PROF_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_ITEM_CD' rs:number='5' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_SOCK_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_SOCK_CD'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_SEX_NM' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_TITLE_NM' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_ETITLE_NM' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_ETITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_CTITLE_NM' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_CTITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_RTITLE_NM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_RTITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_JTITLE_NM' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_JTITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_SOCK_TX' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_SOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_ESOCK_TX' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_ESOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_CSOCK_TX' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_CSOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_RSOCK_TX' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_RSOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_JSOCK_TX' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_JSOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_RSLT_LOW' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_RSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_RSLT_HIGH' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_RSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_CHAR_VAL' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_CHAR_VAL'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_PANJ_CD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_PANJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_USE_YN' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_INPT_ID' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_INPT_DTT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_MODI_ID' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='HTI_MODI_DTT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM'
			 rs:basecolumn='HTI_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c27' rs:name='HTI_RSOCK_TX' rs:number='28' rs:nullable='true' rs:writeunknown='true'
			 rs:basetable='HEALTH_TOTALSCREENING_ITEM' rs:basecolumn='HTI_RSOCK_TX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='c28' rs:name='HTI_RTITLE_NM' rs:number='29' rs:nullable='true' rs:writeunknown='true'
			 rs:basetable='HEALTH_TOTALSCREENING_ITEM' rs:basecolumn='HTI_RTITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='30' rs:rowid='true' rs:basetable='HEALTH_TOTALSCREENING_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c30' rs:name='ROWID' rs:number='31' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
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

			String HTI_APLT_DT_T = cRsList.getString("HTI_APLT_DT");
			String HTI_SOCK_SQ_T = cRsList.getString("HTI_SOCK_SQ");
			String HTI_SEX_CD_T = cRsList.getString("HTI_SEX_CD");
			String HTI_PROF_CD_T = cRsList.getString("HTI_PROF_CD");
			String HTI_ITEM_CD_T = cRsList.getString("HTI_ITEM_CD");
			String HTI_SOCK_CD_T = cRsList.getString("HTI_SOCK_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String HTI_SEX_NM_T = cRsList.getString("HTI_SEX_NM");
			String HTI_TITLE_NM_T = cRsList.getString("HTI_TITLE_NM");
			String HTI_ETITLE_NM_T = cRsList.getString("HTI_ETITLE_NM");
			String HTI_CTITLE_NM_T = cRsList.getString("HTI_CTITLE_NM");
			String HTI_RTITLE_NM_T = cRsList.getString("HTI_RTITLE_NM");
			String HTI_JTITLE_NM_T = cRsList.getString("HTI_JTITLE_NM");
			String HTI_SOCK_TX_T = cRsList.getString("HTI_SOCK_TX");
			String HTI_ESOCK_TX_T = cRsList.getString("HTI_ESOCK_TX");
			String HTI_CSOCK_TX_T = cRsList.getString("HTI_CSOCK_TX");
			String HTI_RSOCK_TX_T = cRsList.getString("HTI_RSOCK_TX");
			String HTI_JSOCK_TX_T = cRsList.getString("HTI_JSOCK_TX");
			String HTI_RSLT_LOW_T = cRsList.getString("HTI_RSLT_LOW");
			String HTI_RSLT_HIGH_T = cRsList.getString("HTI_RSLT_HIGH");
			String HTI_CHAR_VAL_T = cRsList.getString("HTI_CHAR_VAL");
			String HTI_PANJ_CD_T = cRsList.getString("HTI_PANJ_CD");
			String HTI_USE_YN_T = cRsList.getString("HTI_USE_YN");
			String HTI_INPT_ID_T = cRsList.getString("HTI_INPT_ID");
			String HTI_INPT_DTT_T = cRsList.getDate2("HTI_INPT_DTT");
			String HTI_MODI_ID_T = cRsList.getString("HTI_MODI_ID");
			String HTI_MODI_DTT_T = cRsList.getDate2("HTI_MODI_DTT");
			String c27_T = cRsList.getString("c27");
			String c28_T = cRsList.getString("c28");
			String ROWID_T = cRsList.getString("ROWID");
			String c30_T = cRsList.getString("c30");
%>
			<z:row
<%
			if(! HTI_APLT_DT_T.equals("")) {
%>
		 		HTI_APLT_DT='<%= HTI_APLT_DT_T%>'
<%
			}

			if(! HTI_SOCK_SQ_T.equals("")) {
%>
		 		HTI_SOCK_SQ='<%= HTI_SOCK_SQ_T%>'
<%
			}

			if(! HTI_SEX_CD_T.equals("")) {
%>
		 		HTI_SEX_CD='<%= HTI_SEX_CD_T%>'
<%
			}

			if(! HTI_PROF_CD_T.equals("")) {
%>
		 		HTI_PROF_CD='<%= HTI_PROF_CD_T%>'
<%
			}

			if(! HTI_ITEM_CD_T.equals("")) {
%>
		 		HTI_ITEM_CD='<%= HTI_ITEM_CD_T%>'
<%
			}

			if(! HTI_SOCK_CD_T.equals("")) {
%>
		 		HTI_SOCK_CD='<%= HTI_SOCK_CD_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
<%
			}

			if(! HTI_SEX_NM_T.equals("")) {
%>
		 		HTI_SEX_NM='<%= HTI_SEX_NM_T%>'
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

			if(! HTI_RTITLE_NM_T.equals("")) {
%>
		 		HTI_RTITLE_NM='<%= HTI_RTITLE_NM_T%>'
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

			if(! HTI_RSOCK_TX_T.equals("")) {
%>
		 		HTI_RSOCK_TX='<%= HTI_RSOCK_TX_T%>'
<%
			}

			if(! HTI_JSOCK_TX_T.equals("")) {
%>
		 		HTI_JSOCK_TX='<%= HTI_JSOCK_TX_T%>'
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

			if(! HTI_PANJ_CD_T.equals("")) {
%>
		 		HTI_PANJ_CD='<%= HTI_PANJ_CD_T%>'
<%
			}

			if(! HTI_USE_YN_T.equals("")) {
%>
		 		HTI_USE_YN='<%= HTI_USE_YN_T%>'
<%
			}

			if(! HTI_INPT_ID_T.equals("")) {
%>
		 		HTI_INPT_ID='<%= HTI_INPT_ID_T%>'
<%
			}

			if(! HTI_INPT_DTT_T.equals("")) {
%>
		 		HTI_INPT_DTT='<%= HTI_INPT_DTT_T%>'
<%
			}

			if(! HTI_MODI_ID_T.equals("")) {
%>
		 		HTI_MODI_ID='<%= HTI_MODI_ID_T%>'
<%
			}

			if(! HTI_MODI_DTT_T.equals("")) {
%>
		 		HTI_MODI_DTT='<%= HTI_MODI_DTT_T%>'
<%
			}

			if(! c27_T.equals("")) {
%>
		 		c27='<%= c27_T%>'
<%
			}

			if(! c28_T.equals("")) {
%>
		 		c28='<%= c28_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c30_T.equals("")) {
%>
		 		c30='<%= c30_T%>'
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
