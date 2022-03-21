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

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 select F_PACK_FIND(A.EEA_EXAM_LT,A.EEA_COMP_CD) EXAM_NM,
(select icy_comp_nm from it_company where icy_comp_cd = A.EEA_COMP_CD) comp_nm
, SUBSTR(B.ICR_NTNA_CD,1,2) NA_CD, A.EEA_SEX_CD SEX_CD, A.EEA_PSNL_AGE PSNL_AGE, A.EEA_CUST_NO CUST_NO, 
 A.EEA_PSNL_NM PSNL_NM, A.EEA_EXAM_DT EXAM_DT, A.EEA_CHART_NO, A.EEA_ACPT_TX,A.EEA_MMBR_CD 
from et_exam_acpt A join it_customer B on A.eea_cust_no = B.icr_cust_no
where A.EEA_EXAM_DT = :EXAM_DT and A.EEA_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT F_PACK_FIND(A.EEA_EXAM_LT,A.EEA_COMP_CD) EXAM_NM, (SELECT ICY_COMP_NM";
		sql += " FROM IT_COMPANY";
		sql += " WHERE ICY_COMP_CD = A.EEA_COMP_CD) COMP_NM , SUBSTR(B.ICR_NTNA_CD,1,2) NA_CD, A.EEA_SEX_CD SEX_CD, A.EEA_PSNL_AGE PSNL_AGE, A.EEA_CUST_NO CUST_NO, A.EEA_PSNL_NM PSNL_NM, A.EEA_EXAM_DT EXAM_DT, A.EEA_CHART_NO, A.EEA_ACPT_TX,A.EEA_MMBR_CD";
		sql += " FROM ET_EXAM_ACPT A JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO";
		sql += " WHERE A.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : printInfo_setPersonInfo_001 \n";
			G_INFO += "설명 : 인적정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='EXAM_NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='COMP_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='120'/>
		</s:AttributeType>
		<s:AttributeType name='NA_CD' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='SEX_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_AGE' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CUST_NO' rs:number='6' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_NM' rs:number='7' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_DT' rs:number='8' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_TX' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ACPT_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MMBR_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MMBR_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='12' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c12' rs:name='ROWID' rs:number='13' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
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

			String EXAM_NM_T = cRsList.getString("EXAM_NM");
			String COMP_NM_T = cRsList.getString("COMP_NM");
			String NA_CD_T = cRsList.getString("NA_CD");
			String SEX_CD_T = cRsList.getString("SEX_CD");
			String PSNL_AGE_T = cRsList.getString("PSNL_AGE");
			String CUST_NO_T = cRsList.getString("CUST_NO");
			String PSNL_NM_T = cRsList.getString("PSNL_NM");
			String EXAM_DT_T = cRsList.getString("EXAM_DT");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_ACPT_TX_T = cRsList.getString("EEA_ACPT_TX");
			String EEA_MMBR_CD_T = cRsList.getString("EEA_MMBR_CD");
			String ROWID_T = cRsList.getString("ROWID");
			String c12_T = cRsList.getString("c12");
%>
			<z:row
<%
			if(! EXAM_NM_T.equals("")) {
%>
		 		EXAM_NM='<%= EXAM_NM_T%>'
<%
			}

			if(! COMP_NM_T.equals("")) {
%>
		 		COMP_NM='<%= COMP_NM_T%>'
<%
			}

			if(! NA_CD_T.equals("")) {
%>
		 		NA_CD='<%= NA_CD_T%>'
<%
			}

			if(! SEX_CD_T.equals("")) {
%>
		 		SEX_CD='<%= SEX_CD_T%>'
<%
			}

			if(! PSNL_AGE_T.equals("")) {
%>
		 		PSNL_AGE='<%= PSNL_AGE_T%>'
<%
			}

			if(! CUST_NO_T.equals("")) {
%>
		 		CUST_NO='<%= CUST_NO_T%>'
<%
			}

			if(! PSNL_NM_T.equals("")) {
%>
		 		PSNL_NM='<%= PSNL_NM_T%>'
<%
			}

			if(! EXAM_DT_T.equals("")) {
%>
		 		EXAM_DT='<%= EXAM_DT_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_ACPT_TX_T.equals("")) {
%>
		 		EEA_ACPT_TX='<%= EEA_ACPT_TX_T%>'
<%
			}

			if(! EEA_MMBR_CD_T.equals("")) {
%>
		 		EEA_MMBR_CD='<%= EEA_MMBR_CD_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c12_T.equals("")) {
%>
		 		c12='<%= c12_T%>'
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
