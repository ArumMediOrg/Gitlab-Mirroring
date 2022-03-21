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
		String CUST_NO = htMethod.get("CUST_NO");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(CUST_NO == null) { CUST_NO = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_CUST_NO, A.EEA_PSNL_NM, A.EEA_EXAM_SQ, A.EEA_PSNL_AGE, A.EEA_COMP_CD, A.EEA_HTSB_CD, A.EEA_EXAM_CD, A.EEA_HDMD_YN, A.EEA_SDMD_YN, A.EEA_SPCL_LT, A.EEA_SPCL_CD, A.EEA_SPHT_CD, A.EEA_CHART_NO, CASE WHEN A.EEA_EXAM_CD = '41001'";
		sql += " OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END EEA_SPCH_KD, CASE WHEN A.EEA_SPCL_CD IS NULL";
		sql += " OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE '[' || A.EEA_SPCL_CD || ']' || GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END EEA_SPCL_NM, CASE WHEN A.EEA_SPHT_CD IS NULL";
		sql += " OR A.EEA_SPHT_CD = '' THEN A.EEA_SPHT_CD ELSE '[' || A.EEA_SPHT_CD || ']' || GETCOMMON_LVCDTONM('0911',A.EEA_SPHT_CD,'5',1) END EEA_SPHT_MN, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, B.ICR_BIRH_KD, B.ICR_TEL_NO, B.ICR_MOBL_NO, B.ICR_SEX_KD";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_DT + "' ";
		sql += " AND A.EEA_CUST_NO = '" + CUST_NO + "' ";
		sql += " AND (A.EEA_EXAM_CD = '41001' OR A.EEA_EXAM_CD = '42001' OR A.EEA_SPSB_YN = 'Y') ";
		sql += " ORDER BY A.EEA_EXAM_DT DESC, A.EEA_EXAM_SQ DESC ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_BtnPast_PanjungClick_001 \n";
			G_INFO += "설명 : 과거판정 (접수정보) 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HTSB_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HTSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='8' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HDMD_YN' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SDMD_YN' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SDMD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPHT_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPHT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCH_KD' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_NM' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPHT_MN' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BIRTH_DT' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_KD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_TEL_NO' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_KD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_SEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='23' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c23' rs:name='ROWID' rs:number='24' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
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

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_HTSB_CD_T = cRsList.getString("EEA_HTSB_CD");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_HDMD_YN_T = cRsList.getString("EEA_HDMD_YN");
			String EEA_SDMD_YN_T = cRsList.getString("EEA_SDMD_YN");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_SPHT_CD_T = cRsList.getString("EEA_SPHT_CD");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_SPCH_KD_T = cRsList.getString("EEA_SPCH_KD");
			String EEA_SPCL_NM_T = cRsList.getString("EEA_SPCL_NM");
			String EEA_SPHT_MN_T = cRsList.getString("EEA_SPHT_MN");
			String EEA_BIRTH_DT_T = cRsList.getString("EEA_BIRTH_DT");
			String ICR_BIRH_KD_T = cRsList.getString("ICR_BIRH_KD");
			String ICR_TEL_NO_T = cRsList.getString("ICR_TEL_NO");
			String ICR_MOBL_NO_T = cRsList.getString("ICR_MOBL_NO");
			String ICR_SEX_KD_T = cRsList.getString("ICR_SEX_KD");
			String ROWID_T = cRsList.getString("ROWID");
			String c23_T = cRsList.getString("c23");
%>
			<z:row
<%
			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! EEA_HTSB_CD_T.equals("")) {
%>
		 		EEA_HTSB_CD='<%= EEA_HTSB_CD_T%>'
<%
			}

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! EEA_HDMD_YN_T.equals("")) {
%>
		 		EEA_HDMD_YN='<%= EEA_HDMD_YN_T%>'
<%
			}

			if(! EEA_SDMD_YN_T.equals("")) {
%>
		 		EEA_SDMD_YN='<%= EEA_SDMD_YN_T%>'
<%
			}

			if(! EEA_SPCL_LT_T.equals("")) {
%>
		 		EEA_SPCL_LT='<%= EEA_SPCL_LT_T%>'
<%
			}

			if(! EEA_SPCL_CD_T.equals("")) {
%>
		 		EEA_SPCL_CD='<%= EEA_SPCL_CD_T%>'
<%
			}

			if(! EEA_SPHT_CD_T.equals("")) {
%>
		 		EEA_SPHT_CD='<%= EEA_SPHT_CD_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_SPCH_KD_T.equals("")) {
%>
		 		EEA_SPCH_KD='<%= EEA_SPCH_KD_T%>'
<%
			}

			if(! EEA_SPCL_NM_T.equals("")) {
%>
		 		EEA_SPCL_NM='<%= EEA_SPCL_NM_T%>'
<%
			}

			if(! EEA_SPHT_MN_T.equals("")) {
%>
		 		EEA_SPHT_MN='<%= EEA_SPHT_MN_T%>'
<%
			}

			if(! EEA_BIRTH_DT_T.equals("")) {
%>
		 		EEA_BIRTH_DT='<%= EEA_BIRTH_DT_T%>'
<%
			}

			if(! ICR_BIRH_KD_T.equals("")) {
%>
		 		ICR_BIRH_KD='<%= ICR_BIRH_KD_T%>'
<%
			}

			if(! ICR_TEL_NO_T.equals("")) {
%>
		 		ICR_TEL_NO='<%= ICR_TEL_NO_T%>'
<%
			}

			if(! ICR_MOBL_NO_T.equals("")) {
%>
		 		ICR_MOBL_NO='<%= ICR_MOBL_NO_T%>'
<%
			}

			if(! ICR_SEX_KD_T.equals("")) {
%>
		 		ICR_SEX_KD='<%= ICR_SEX_KD_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c23='<%= cnt%>'
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
