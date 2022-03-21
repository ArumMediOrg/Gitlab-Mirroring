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
		String EXAM_CHA = htMethod.get("EXAM_CHA");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(EXAM_CHA == null) { EXAM_CHA = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select * From ST_BASE                                                                       
Where SBE_EXAM_DT = :EXAM_DT
  And SBE_EXAM_SQ = :EXAM_SQ
  And SBE_EXAM_CHA = :EXAM_CHA
		*/

		sql = " SELECT *";
		sql += " FROM ST_BASE";
		sql += " WHERE SBE_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND SBE_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SBE_EXAM_CHA = '" + EXAM_CHA + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_PM_UP_Old_001 \n";
			G_INFO += "설명 : 기초정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " EXAM_CHA : " + EXAM_CHA + " \n";
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
		<s:AttributeType name='SBE_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ST_BASE' rs:basecolumn='SBE_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ST_BASE' rs:basecolumn='SBE_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_EXAM_CHA' rs:number='3' rs:writeunknown='true' rs:basetable='ST_BASE' rs:basecolumn='SBE_EXAM_CHA'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_ISSU_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_ISSU_NO'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_JIJO_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_JIJO_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_GOJU_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_GOJU_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_NCPN_LT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_NCPN_LT'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_NCHR_HH' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_NCHR_HH'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_WORK_LT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_WORK_LT'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_JUIP_DT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_JUIP_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_SAHU_YN' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_SAHU_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_XRAY_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_XRAY_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_XRAY_NO' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_XRAY_NO'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_XRFM_CD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_XRFM_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_XDOC_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_XDOC_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_MEDI_YN' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_MEDI_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_MEDI_CNT' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_MEDI_CNT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_DDOC_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_DDOC_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_PANJ_YN' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_PANJ_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TPAN_NM' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_TPAN_NM'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TBUS_NM' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_TBUS_NM'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TOBO_DT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_TOBO_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_RECHK_DT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_RECHK_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_SEND_YN' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_SEND_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_SEND_NM' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_SEND_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_INPT_ID' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_INPT_DTT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_MODI_ID' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_MODI_DTT' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_ETC_TX' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_ETC_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_REMARK_TX' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_REMARK_TX'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_SMTM_CD' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_SMTM_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_BUILD_CD' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_BUILD_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='34' rs:rowid='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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

			String SBE_EXAM_DT_T = cRsList.getString("SBE_EXAM_DT");
			String SBE_EXAM_SQ_T = cRsList.getString("SBE_EXAM_SQ");
			String SBE_EXAM_CHA_T = cRsList.getString("SBE_EXAM_CHA");
			String SBE_ISSU_NO_T = cRsList.getString("SBE_ISSU_NO");
			String SBE_JIJO_CD_T = cRsList.getString("SBE_JIJO_CD");
			String SBE_GOJU_CD_T = cRsList.getString("SBE_GOJU_CD");
			String SBE_NCPN_LT_T = cRsList.getString("SBE_NCPN_LT");
			String SBE_NCHR_HH_T = cRsList.getString("SBE_NCHR_HH");
			String SBE_WORK_LT_T = cRsList.getString("SBE_WORK_LT");
			String SBE_JUIP_DT_T = cRsList.getString("SBE_JUIP_DT");
			String SBE_SAHU_YN_T = cRsList.getString("SBE_SAHU_YN");
			String SBE_XRAY_CD_T = cRsList.getString("SBE_XRAY_CD");
			String SBE_XRAY_NO_T = cRsList.getString("SBE_XRAY_NO");
			String SBE_XRFM_CD_T = cRsList.getString("SBE_XRFM_CD");
			String SBE_XDOC_CD_T = cRsList.getString("SBE_XDOC_CD");
			String SBE_MEDI_YN_T = cRsList.getString("SBE_MEDI_YN");
			String SBE_MEDI_CNT_T = cRsList.getString("SBE_MEDI_CNT");
			String SBE_DDOC_CD_T = cRsList.getString("SBE_DDOC_CD");
			String SBE_PANJ_YN_T = cRsList.getString("SBE_PANJ_YN");
			String SBE_TPAN_NM_T = cRsList.getString("SBE_TPAN_NM");
			String SBE_TBUS_NM_T = cRsList.getString("SBE_TBUS_NM");
			String SBE_TOBO_DT_T = cRsList.getString("SBE_TOBO_DT");
			String SBE_RECHK_DT_T = cRsList.getString("SBE_RECHK_DT");
			String SBE_SEND_YN_T = cRsList.getString("SBE_SEND_YN");
			String SBE_SEND_NM_T = cRsList.getString("SBE_SEND_NM");
			String SBE_INPT_ID_T = cRsList.getString("SBE_INPT_ID");
			String SBE_INPT_DTT_T = cRsList.getDate2("SBE_INPT_DTT");
			String SBE_MODI_ID_T = cRsList.getString("SBE_MODI_ID");
			String SBE_MODI_DTT_T = cRsList.getDate2("SBE_MODI_DTT");
			String SBE_ETC_TX_T = cRsList.getString("SBE_ETC_TX");
			String SBE_REMARK_TX_T = cRsList.getString("SBE_REMARK_TX");
			String SBE_SMTM_CD_T = cRsList.getString("SBE_SMTM_CD");
			String SBE_BUILD_CD_T = cRsList.getString("SBE_BUILD_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! SBE_EXAM_DT_T.equals("")) {
%>
		 		SBE_EXAM_DT='<%= SBE_EXAM_DT_T%>'
<%
			}

			if(! SBE_EXAM_SQ_T.equals("")) {
%>
		 		SBE_EXAM_SQ='<%= SBE_EXAM_SQ_T%>'
<%
			}

			if(! SBE_EXAM_CHA_T.equals("")) {
%>
		 		SBE_EXAM_CHA='<%= SBE_EXAM_CHA_T%>'
<%
			}

			if(! SBE_ISSU_NO_T.equals("")) {
%>
		 		SBE_ISSU_NO='<%= SBE_ISSU_NO_T%>'
<%
			}

			if(! SBE_JIJO_CD_T.equals("")) {
%>
		 		SBE_JIJO_CD='<%= SBE_JIJO_CD_T%>'
<%
			}

			if(! SBE_GOJU_CD_T.equals("")) {
%>
		 		SBE_GOJU_CD='<%= SBE_GOJU_CD_T%>'
<%
			}

			if(! SBE_NCPN_LT_T.equals("")) {
%>
		 		SBE_NCPN_LT='<%= SBE_NCPN_LT_T%>'
<%
			}

			if(! SBE_NCHR_HH_T.equals("")) {
%>
		 		SBE_NCHR_HH='<%= SBE_NCHR_HH_T%>'
<%
			}

			if(! SBE_WORK_LT_T.equals("")) {
%>
		 		SBE_WORK_LT='<%= SBE_WORK_LT_T%>'
<%
			}

			if(! SBE_JUIP_DT_T.equals("")) {
%>
		 		SBE_JUIP_DT='<%= SBE_JUIP_DT_T%>'
<%
			}

			if(! SBE_SAHU_YN_T.equals("")) {
%>
		 		SBE_SAHU_YN='<%= SBE_SAHU_YN_T%>'
<%
			}

			if(! SBE_XRAY_CD_T.equals("")) {
%>
		 		SBE_XRAY_CD='<%= SBE_XRAY_CD_T%>'
<%
			}

			if(! SBE_XRAY_NO_T.equals("")) {
%>
		 		SBE_XRAY_NO='<%= SBE_XRAY_NO_T%>'
<%
			}

			if(! SBE_XRFM_CD_T.equals("")) {
%>
		 		SBE_XRFM_CD='<%= SBE_XRFM_CD_T%>'
<%
			}

			if(! SBE_XDOC_CD_T.equals("")) {
%>
		 		SBE_XDOC_CD='<%= SBE_XDOC_CD_T%>'
<%
			}

			if(! SBE_MEDI_YN_T.equals("")) {
%>
		 		SBE_MEDI_YN='<%= SBE_MEDI_YN_T%>'
<%
			}

			if(! SBE_MEDI_CNT_T.equals("")) {
%>
		 		SBE_MEDI_CNT='<%= SBE_MEDI_CNT_T%>'
<%
			}

			if(! SBE_DDOC_CD_T.equals("")) {
%>
		 		SBE_DDOC_CD='<%= SBE_DDOC_CD_T%>'
<%
			}

			if(! SBE_PANJ_YN_T.equals("")) {
%>
		 		SBE_PANJ_YN='<%= SBE_PANJ_YN_T%>'
<%
			}

			if(! SBE_TPAN_NM_T.equals("")) {
%>
		 		SBE_TPAN_NM='<%= SBE_TPAN_NM_T%>'
<%
			}

			if(! SBE_TBUS_NM_T.equals("")) {
%>
		 		SBE_TBUS_NM='<%= SBE_TBUS_NM_T%>'
<%
			}

			if(! SBE_TOBO_DT_T.equals("")) {
%>
		 		SBE_TOBO_DT='<%= SBE_TOBO_DT_T%>'
<%
			}

			if(! SBE_RECHK_DT_T.equals("")) {
%>
		 		SBE_RECHK_DT='<%= SBE_RECHK_DT_T%>'
<%
			}

			if(! SBE_SEND_YN_T.equals("")) {
%>
		 		SBE_SEND_YN='<%= SBE_SEND_YN_T%>'
<%
			}

			if(! SBE_SEND_NM_T.equals("")) {
%>
		 		SBE_SEND_NM='<%= SBE_SEND_NM_T%>'
<%
			}

			if(! SBE_INPT_ID_T.equals("")) {
%>
		 		SBE_INPT_ID='<%= SBE_INPT_ID_T%>'
<%
			}

			if(! SBE_INPT_DTT_T.equals("")) {
%>
		 		SBE_INPT_DTT='<%= SBE_INPT_DTT_T%>'
<%
			}

			if(! SBE_MODI_ID_T.equals("")) {
%>
		 		SBE_MODI_ID='<%= SBE_MODI_ID_T%>'
<%
			}

			if(! SBE_MODI_DTT_T.equals("")) {
%>
		 		SBE_MODI_DTT='<%= SBE_MODI_DTT_T%>'
<%
			}

			if(! SBE_ETC_TX_T.equals("")) {
%>
		 		SBE_ETC_TX='<%= SBE_ETC_TX_T%>'
<%
			}

			if(! SBE_REMARK_TX_T.equals("")) {
%>
		 		SBE_REMARK_TX='<%= SBE_REMARK_TX_T%>'
<%
			}

			if(! SBE_SMTM_CD_T.equals("")) {
%>
		 		SBE_SMTM_CD='<%= SBE_SMTM_CD_T%>'
<%
			}

			if(! SBE_BUILD_CD_T.equals("")) {
%>
		 		SBE_BUILD_CD='<%= SBE_BUILD_CD_T%>'
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
