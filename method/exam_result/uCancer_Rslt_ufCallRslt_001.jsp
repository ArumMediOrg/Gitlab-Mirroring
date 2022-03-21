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

		String CANCER_CD = htMethod.get("CANCER_CD");
		String CNIT_CD = htMethod.get("CNIT_CD");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(CANCER_CD == null) { CANCER_CD = ""; }
		if(CNIT_CD == null) { CNIT_CD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT D.*, E.*";
		sql += " FROM (";
		sql += "	SELECT A.ERI_EXAM_DT, A.ERI_RSLT_VL, A.ERI_PRCH_VL, A.ERI_PRNM_VL, A.ERI_RSLT_LOW, A.ERI_HIGH_KD, A.ERI_RSLT_HIGH, A.ERI_RSLT_UNIT , A.ERI_HTSB_PANJ, A.ERI_RSLT_CD, A.ERI_ITEM_CD, B.EEA_SEX_CD, B.EEA_PSNL_AGE";
		sql += " 	FROM ET_RSLT_ITEM A JOIN ET_EXAM_ACPT B";
		sql += " 	ON A.ERI_EXAM_DT = B.EEA_EXAM_DT";

		sql += " 	AND A.ERI_EXAM_SQ = B.EEA_EXAM_SQ JOIN IT_ITEM C";
		sql += " 	ON A.ERI_ITEM_CD = C.IIM_ITEM_CD";
		sql += " 	AND C.IIM_CANCER_CD = '" + CANCER_CD + "'";
		sql += " 	AND C.IIM_CNIT_CD = '" + CNIT_CD + "'";

		sql += " 	WHERE A.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND A.ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += "    AND NVL(A.ERI_CNCL_YN,'N') <> 'Y' ";
		sql += " ) D LEFT OUTER JOIN TABLE(GETITEMVLDTTABLE_PKG.GETITEMVLDTTABLE(D.ERI_ITEM_CD, D.EEA_SEX_CD, D.EEA_PSNL_AGE, D.ERI_EXAM_DT, '2')) E";
		sql += " ON E.ITEM_CD = D.ERI_ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCancer_Rslt_ufCallRslt_001 \n";
			G_INFO += "설명 : 자동결과 쿼리문(6대암) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CANCER_CD : " + CANCER_CD + " \n";
			G_INFO += " CNIT_CD : " + CNIT_CD + " \n";
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
		<s:AttributeType name='ERI_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PRCH_VL' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_PRNM_VL' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_LOW' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HIGH_KD' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_HIGH' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_UNIT' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HTSB_PANJ' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_CD' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ITEM_CD' rs:number='11'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_CD' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RLOW' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RHIGH' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CHRVAL' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='RUNIT' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='RSPT' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='LOWKD' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='HIGHKD' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RSZR_KD' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ERI_EXAM_DT_T = cRsList.getString("ERI_EXAM_DT");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String ERI_PRCH_VL_T = cRsList.getString("ERI_PRCH_VL");
			String ERI_PRNM_VL_T = cRsList.getString("ERI_PRNM_VL");
			String ERI_RSLT_LOW_T = cRsList.getString("ERI_RSLT_LOW");
			String ERI_HIGH_KD_T = cRsList.getString("ERI_HIGH_KD");
			String ERI_RSLT_HIGH_T = cRsList.getString("ERI_RSLT_HIGH");
			String ERI_RSLT_UNIT_T = cRsList.getString("ERI_RSLT_UNIT");
			String ERI_HTSB_PANJ_T = cRsList.getString("ERI_HTSB_PANJ");
			String ERI_RSLT_CD_T = cRsList.getString("ERI_RSLT_CD");
			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String RLOW_T = cRsList.getString("RLOW");
			String RHIGH_T = cRsList.getString("RHIGH");
			String CHRVAL_T = cRsList.getString("CHRVAL");
			String RUNIT_T = cRsList.getString("RUNIT");
			String RSPT_T = cRsList.getString("RSPT");
			String LOWKD_T = cRsList.getString("LOWKD");
			String HIGHKD_T = cRsList.getString("HIGHKD");
			String RSZR_KD_T = cRsList.getString("RSZR_KD");
%>
			<z:row
<%
			if(! ERI_EXAM_DT_T.equals("")) {
%>
		 		ERI_EXAM_DT='<%= ERI_EXAM_DT_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! ERI_PRCH_VL_T.equals("")) {
%>
		 		ERI_PRCH_VL='<%= ERI_PRCH_VL_T%>'
<%
			}

			if(! ERI_PRNM_VL_T.equals("")) {
%>
		 		ERI_PRNM_VL='<%= ERI_PRNM_VL_T%>'
<%
			}

			if(! ERI_RSLT_LOW_T.equals("")) {
%>
		 		ERI_RSLT_LOW='<%= ERI_RSLT_LOW_T%>'
<%
			}

			if(! ERI_HIGH_KD_T.equals("")) {
%>
		 		ERI_HIGH_KD='<%= ERI_HIGH_KD_T%>'
<%
			}

			if(! ERI_RSLT_HIGH_T.equals("")) {
%>
		 		ERI_RSLT_HIGH='<%= ERI_RSLT_HIGH_T%>'
<%
			}

			if(! ERI_RSLT_UNIT_T.equals("")) {
%>
		 		ERI_RSLT_UNIT='<%= ERI_RSLT_UNIT_T%>'
<%
			}

			if(! ERI_HTSB_PANJ_T.equals("")) {
%>
		 		ERI_HTSB_PANJ='<%= ERI_HTSB_PANJ_T%>'
<%
			}

			if(! ERI_RSLT_CD_T.equals("")) {
%>
		 		ERI_RSLT_CD='<%= ERI_RSLT_CD_T%>'
<%
			}

			if(! ERI_ITEM_CD_T.equals("")) {
%>
		 		ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
<%
			}

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! ITEM_CD_T.equals("")) {
%>
		 		ITEM_CD='<%= ITEM_CD_T%>'
<%
			}

			if(! RLOW_T.equals("")) {
%>
		 		RLOW='<%= RLOW_T%>'
<%
			}

			if(! RHIGH_T.equals("")) {
%>
		 		RHIGH='<%= RHIGH_T%>'
<%
			}

			if(! CHRVAL_T.equals("")) {
%>
		 		CHRVAL='<%= CHRVAL_T%>'
<%
			}

			if(! RUNIT_T.equals("")) {
%>
		 		RUNIT='<%= RUNIT_T%>'
<%
			}

			if(! RSPT_T.equals("")) {
%>
		 		RSPT='<%= RSPT_T%>'
<%
			}

			if(! LOWKD_T.equals("")) {
%>
		 		LOWKD='<%= LOWKD_T%>'
<%
			}

			if(! HIGHKD_T.equals("")) {
%>
		 		HIGHKD='<%= HIGHKD_T%>'
<%
			}

			if(! RSZR_KD_T.equals("")) {
%>
		 		RSZR_KD='<%= RSZR_KD_T%>'
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
