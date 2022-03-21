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

		String SEXAM_DT = htMethod.get("SEXAM_DT");
		String SEXAM_SQ = htMethod.get("SEXAM_SQ");

		//
		if(SEXAM_DT == null) { SEXAM_DT = ""; }
		if(SEXAM_SQ == null) { SEXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*
Select A.EEA_CHART_NO AS CHART_NO, A.EEA_PSNL_NM AS PSNL_NM,
       F_COMP_FIND(a.EEA_COMP_CD) AS COMP_NM ,
       A.EEA_DEPT_NM  AS DEPT_NM,  B.ICR_BIRH_DT AS BIRH_DT ,
       CASE B.ICR_SEX_KD WHEN '1' THEN '남' WHEN '2' THEN '여' END SEX_KD,
       f_tel_format(A.EEA_TEL_NO) AS TEL_NO,
       f_tel_format(A.EEA_MOBL_NO) AS MOBL_NO,
       A.EEA_EMAIL_AR AS EMAIL_AR, A.EEA_PSNL_AGE AS PSNL_AGE,
       A.EEA_ZIP_CD AS ZIP_CD, A.EEA_ZIP_AR AS ZIP_AR,
       A.EEA_ROAD_AR AS ROAD_AR,
       F_CODE_FIND('0711', A.EEA_MMBR_CD, ' ', '1') AS MMBR_NM,
       F_CODE_FIND('0703', B.ICR_NTNA_CD, ' ', '1') AS NATI_NM,
       F_CODE_FIND('0401', A.EEA_EXAM_CD, ' ', '1') AS EXAM_NM,
       A.EEA_PSNL_PR AS PSNL_PR, A.EEA_COMP_PR AS COMP_PR,
       A.EEA_HLTH_PR AS HLTH_PR, A.EEA_SPCL_PR AS SPCL_PR,
       A.EEA_CUST_NO AS CUST_NO
From ET_EXAM_ACPT A
Left Outer Join IT_CUSTOMER B on A.EEA_CUST_NO = B.ICR_CUST_NO
Where A.EEA_EXAM_DT = :sEXAM_DT
  And A.EEA_EXAM_SQ = :sEXAM_SQ



		*/

		sql += " Select A.EEA_CHART_NO AS CHART_NO, A.EEA_PSNL_NM AS PSNL_NM, ";
		sql += " 	F_COMP_FIND(a.EEA_COMP_CD) AS COMP_NM , ";
		sql += " 	A.EEA_DEPT_NM  AS DEPT_NM,  B.ICR_BIRH_DT AS BIRH_DT , ";
		sql += " 	CASE B.ICR_SEX_KD WHEN '1' THEN '남' WHEN '2' THEN '여' END SEX_KD, ";
		sql += " 	f_tel_format(A.EEA_TEL_NO) AS TEL_NO, ";
		sql += " 	f_tel_format(A.EEA_MOBL_NO) AS MOBL_NO, ";
		sql += " 	A.EEA_EMAIL_AR AS EMAIL_AR, A.EEA_PSNL_AGE AS PSNL_AGE, ";
		sql += " 	A.EEA_ZIP_CD AS ZIP_CD, A.EEA_ZIP_AR AS ZIP_AR, ";
		sql += " 	A.EEA_ROAD_AR AS ROAD_AR, ";
		sql += " 	F_CODE_FIND('0711', A.EEA_MMBR_CD, ' ', '1') AS MMBR_NM, ";
		sql += " 	F_CODE_FIND('0703', B.ICR_NTNA_CD, ' ', '1') AS NATI_NM, ";
		sql += " 	F_CODE_FIND('0401', A.EEA_EXAM_CD, ' ', '1') AS EXAM_NM, ";
		sql += " 	A.EEA_PSNL_PR AS PSNL_PR, A.EEA_COMP_PR AS COMP_PR, ";
		sql += " 	A.EEA_HLTH_PR AS HLTH_PR, A.EEA_SPCL_PR AS SPCL_PR, ";
		sql += " 	A.EEA_CUST_NO AS CUST_NO ";
		sql += " From ET_EXAM_ACPT A ";
		sql += " Left Outer Join IT_CUSTOMER B on A.EEA_CUST_NO = B.ICR_CUST_NO ";
		sql += " Where A.EEA_EXAM_DT = '" + SEXAM_DT + "' ";
		sql += " And A.EEA_EXAM_SQ = '" + SEXAM_SQ + "' ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_CRMMain_GridDisplay_018 \n";
			G_INFO += "설명 : 상담관리-환자정보 Select \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SEXAM_DT : " + SEXAM_DT + " \n";
			G_INFO += " SEXAM_SQ : " + SEXAM_SQ + " \n";
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

		<s:AttributeType name='CHART_NO' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='PSNL_NM' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='COMP_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='DEPT_NM' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='BIRH_DT' rs:number='5' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='SEX_KD' rs:number='6' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='SEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='TEL_NO' rs:number='7' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='MOBL_NO' rs:number='8' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='EMAIL_AR' rs:number='9' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='PSNL_AGE' rs:number='10' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='PSNL_AGE'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='ZIP_CD' rs:number='11' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='ZIP_AR' rs:number='12' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='ROAD_AR' rs:number='13' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='MMBR_NM' rs:number='14' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='MMBR_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='NATI_NM' rs:number='15' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='NATI_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='EXAM_NM' rs:number='16' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EXAM_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='PSNL_PR' rs:number='17' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='PSNL_PR'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='COMP_PR' rs:number='18' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='COMP_PR'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='HLTH_PR' rs:number='19' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='HLTH_PR'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='SPCL_PR' rs:number='20' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='SPCL_PR'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='CUST_NO' rs:number='21' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='4000' />
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
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

			String CHART_NO_T = cRsList.getString("CHART_NO");
			String PSNL_NM_T = cRsList.getString("PSNL_NM");
			String COMP_NM_T = cRsList.getString("COMP_NM");
			String DEPT_NM_T = cRsList.getString("DEPT_NM");
			String BIRH_DT_T = cRsList.getString("BIRH_DT");
			String SEX_KD_T = cRsList.getString("SEX_KD");
			String TEL_NO_T = cRsList.getString("TEL_NO");
			String MOBL_NO_T = cRsList.getString("MOBL_NO");
			String EMAIL_AR_T = cRsList.getString("EMAIL_AR");
			String PSNL_AGE_T = cRsList.getString("PSNL_AGE");
			String ZIP_CD_T = cRsList.getString("ZIP_CD");
			String ZIP_AR_T = cRsList.getString("ZIP_AR");
			String ROAD_AR_T = cRsList.getString("ROAD_AR");
			String MMBR_NM_T = cRsList.getString("MMBR_NM");
			String NATI_NM_T = cRsList.getString("NATI_NM");
			String EXAM_NM_T = cRsList.getString("EXAM_NM");
			String PSNL_PR_T = cRsList.getString("PSNL_PR");
			String COMP_PR_T = cRsList.getString("COMP_PR");
			String HLTH_PR_T = cRsList.getString("HLTH_PR");
			String SPCL_PR_T = cRsList.getString("SPCL_PR");
			String CUST_NO_T = cRsList.getString("CUST_NO");

%>
			<z:row
<%
			if(! CHART_NO_T.equals("")) {
%>
		 		CHART_NO='<%= CHART_NO_T%>'
<%
			}

			if(! PSNL_NM_T.equals("")) {
%>
		 		PSNL_NM='<%= PSNL_NM_T%>'
<%
			}

			if(! COMP_NM_T.equals("")) {
%>
		 		COMP_NM='<%= COMP_NM_T%>'
<%
			}

			if(! DEPT_NM_T.equals("")) {
%>
		 		DEPT_NM='<%= DEPT_NM_T%>'
<%
			}

			if(! BIRH_DT_T.equals("")) {
%>
		 		BIRH_DT='<%= BIRH_DT_T%>'
<%
			}

			if(! SEX_KD_T.equals("")) {
%>
		 		SEX_KD='<%= SEX_KD_T%>'
<%
			}

			if(! TEL_NO_T.equals("")) {
%>
		 		TEL_NO='<%= TEL_NO_T%>'
<%
			}

			if(! MOBL_NO_T.equals("")) {
%>
		 		MOBL_NO='<%= MOBL_NO_T%>'
<%
			}

			if(! EMAIL_AR_T.equals("")) {
%>
		 		EMAIL_AR='<%= EMAIL_AR_T%>'
<%
			}

			if(! PSNL_AGE_T.equals("")) {
%>
		 		PSNL_AGE='<%= PSNL_AGE_T%>'
<%
			}

			if(! ZIP_CD_T.equals("")) {
%>
		 		ZIP_CD='<%= ZIP_CD_T%>'
<%
			}

			if(! ZIP_AR_T.equals("")) {
%>
		 		ZIP_AR='<%= ZIP_AR_T%>'
<%
			}

			if(! ROAD_AR_T.equals("")) {
%>
		 		ROAD_AR='<%= ROAD_AR_T%>'
<%
			}

			if(! MMBR_NM_T.equals("")) {
%>
		 		MMBR_NM='<%= MMBR_NM_T%>'
<%
			}

			if(! NATI_NM_T.equals("")) {
%>
		 		NATI_NM='<%= NATI_NM_T%>'
<%
			}

			if(! EXAM_NM_T.equals("")) {
%>
		 		EXAM_NM='<%= EXAM_NM_T%>'
<%
			}

			if(! PSNL_PR_T.equals("")) {
%>
		 		PSNL_PR='<%= PSNL_PR_T%>'
<%
			}

			if(! COMP_PR_T.equals("")) {
%>
		 		COMP_PR='<%= COMP_PR_T%>'
<%
			}

			if(! HLTH_PR_T.equals("")) {
%>
		 		HLTH_PR='<%= HLTH_PR_T%>'
<%
			}

			if(! SPCL_PR_T.equals("")) {
%>
		 		SPCL_PR='<%= SPCL_PR_T%>'
<%
			}

			if(! CUST_NO_T.equals("")) {
%>
		 		CUST_NO='<%= CUST_NO_T%>'
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
