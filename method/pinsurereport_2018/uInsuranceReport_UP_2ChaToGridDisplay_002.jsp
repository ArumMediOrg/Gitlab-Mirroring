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
		String CUST_NO = htMethod.get("CUST_NO");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_CUST_NO,
       CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD else '[' || A.EEA_SPCL_CD || ']' || GetCOMMON_LvCdToNm('0910',A.EEA_SPCL_CD,'5',2) END ICR_SPCL_NM,
       CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END ICR_SPCH_KD,
              A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, E.SBE_TOBO_DT, E.SBE_PANJ_YN, E.SBE_TPAN_NM, E.SBE_TBUS_NM
FROM ET_EXAM_ACPT A LEFT OUTER JOIN ST_BASE E ON A.EEA_EXAM_DT = E.SBE_EXAM_DT AND A.EEA_EXAM_SQ = E.SBE_EXAM_SQ
WHERE 0=0
  AND A.EEA_EXAM_DT = :EXAM_DT
  AND A.EEA_EXAM_SQ = :EXAM_SQ
  AND A.EEA_CUST_NO = :CUST_NO
		*/

		sql = " SELECT A.EEA_CUST_NO";
		sql += ", CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE '[' || A.EEA_SPCL_CD || ']' || GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END ICR_SPCL_NM";
		sql += ", CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END ICR_SPCH_KD, A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, E.SBE_TOBO_DT, E.SBE_PANJ_YN, E.SBE_TPAN_NM, E.SBE_TBUS_NM";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ST_BASE E";
		sql += " ON A.EEA_EXAM_DT = E.SBE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = E.SBE_EXAM_SQ";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND A.EEA_CUST_NO = '" + CUST_NO + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uInsuranceReport_UP_2ChaToGridDisplay_002 \n";
			G_INFO += "설명 : 특수검진(2차) 검진정보조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
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
		<s:AttributeType name='EEA_CUST_NO' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SPCL_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SPCH_KD' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='4'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='5' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TOBO_DT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_TOBO_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_PANJ_YN' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_PANJ_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TPAN_NM' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_TPAN_NM'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TBUS_NM' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_TBUS_NM'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c11' rs:name='ROWID' rs:number='12' rs:rowid='true' rs:basetable='ST_BASE' rs:basecolumn='ROWID'
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

			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String ICR_SPCL_NM_T = cRsList.getString("ICR_SPCL_NM");
			String ICR_SPCH_KD_T = cRsList.getString("ICR_SPCH_KD");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String SBE_TOBO_DT_T = cRsList.getString("SBE_TOBO_DT");
			String SBE_PANJ_YN_T = cRsList.getString("SBE_PANJ_YN");
			String SBE_TPAN_NM_T = cRsList.getString("SBE_TPAN_NM");
			String SBE_TBUS_NM_T = cRsList.getString("SBE_TBUS_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c11_T = cRsList.getString("c11");
%>
			<z:row
<%
			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! ICR_SPCL_NM_T.equals("")) {
%>
		 		ICR_SPCL_NM='<%= ICR_SPCL_NM_T%>'
<%
			}

			if(! ICR_SPCH_KD_T.equals("")) {
%>
		 		ICR_SPCH_KD='<%= ICR_SPCH_KD_T%>'
<%
			}

			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! SBE_TOBO_DT_T.equals("")) {
%>
		 		SBE_TOBO_DT='<%= SBE_TOBO_DT_T%>'
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
%>
				ROWID='<%= cnt%>'
				c11='<%= cnt%>'
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
