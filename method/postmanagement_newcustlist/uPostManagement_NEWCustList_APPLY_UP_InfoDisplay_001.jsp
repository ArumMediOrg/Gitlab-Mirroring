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

SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_PSNL_NM,   A.EEA_EXAM_CD,    
       A.EEA_SPCL_CD, A.EEA_CUST_NO, B.ICR_PENL_ID,  A.EEA_MNGT_SPYM, A.EEA_CUST_NO,    
       CASE WHEN A.EEA_SEX_CD  IS NULL OR A.EEA_SEX_CD  = '' THEN A.EEA_SEX_CD        
            ELSE GetCOMMON_LvCdToNm('0411',A.EEA_SEX_CD ,'5',1) END EEA_SEX_NM, 
       CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD       
            ELSE GetCOMMON_LvCdToNm('0910',A.EEA_SPCL_CD,'5',2) END EEA_SPCL_NM,
       A.EEA_DIVI_NO, A.EEA_ZIP_CD,  A.EEA_ZIP_AR,  A.EEA_ROAD_AR, A.EEA_COMP_CD,       
             C.ICY_COMP_NM, A.EEA_DEPT_NM, A.EEA_EXAM_CD, A.EEA_TEL_NO,  A.EEA_MOBL_NO,       
       A.EEA_PLCE_CD, A.EEA_PSNL_AGE                                                    
  FROM ET_EXAM_ACPT A                                                                   
 INNER JOIN IT_CUSTOMER B ON A.EEA_CUST_NO = B.ICR_CUST_NO                              
  LEFT OUTER JOIN IT_COMPANY C ON A.EEA_COMP_CD = C.ICY_COMP_CD                         
 WHERE A.EEA_EXAM_DT = :EXAM_DT
   AND A.EEA_EXAM_SQ = :EXAM_SQ

		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_EXAM_CD, A.EEA_SPCL_CD, A.EEA_CUST_NO, B.ICR_PENL_ID, A.EEA_MNGT_SPYM, A.EEA_CUST_NO";
		sql += ", CASE WHEN A.EEA_SEX_CD IS NULL OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) END EEA_SEX_NM";
		sql += ", CASE WHEN A.EEA_SPCL_CD IS NULL OR A.EEA_SPCL_CD = '' THEN A.EEA_SPCL_CD ELSE GETCOMMON_LVCDTONM('0910',A.EEA_SPCL_CD,'5',2) END EEA_SPCL_NM";
		sql += ", A.EEA_DIVI_NO, A.EEA_ZIP_CD, A.EEA_ZIP_AR, A.EEA_ROAD_AR, A.EEA_COMP_CD, C.ICY_COMP_NM, A.EEA_DEPT_NM, A.EEA_EXAM_CD, A.EEA_TEL_NO, A.EEA_MOBL_NO, A.EEA_PLCE_CD, A.EEA_PSNL_AGE";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD";
		sql += " WHERE A.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPostManagement_NEWCustList_APPLY_UP_InfoDisplay_001 \n";
			G_INFO += "설명 : 상담관리정보 로딩 \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='5' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='7' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='8' rs:writeunknown='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_SPYM' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MNGT_SPYM'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='c9' rs:name='EEA_CUST_NO' rs:number='10' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_NM' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_NM' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_CD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_AR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ROAD_AR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='c19' rs:name='EEA_EXAM_CD' rs:number='20' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEL_NO' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='23' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='25' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c25' rs:name='ROWID' rs:number='26' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c26' rs:name='ROWID' rs:number='27' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
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
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String EEA_MNGT_SPYM_T = cRsList.getString("EEA_MNGT_SPYM");
			String c9_T = cRsList.getString("c9");
			String EEA_SEX_NM_T = cRsList.getString("EEA_SEX_NM");
			String EEA_SPCL_NM_T = cRsList.getString("EEA_SPCL_NM");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_ZIP_CD_T = cRsList.getString("EEA_ZIP_CD");
			String EEA_ZIP_AR_T = cRsList.getString("EEA_ZIP_AR");
			String EEA_ROAD_AR_T = cRsList.getString("EEA_ROAD_AR");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String c19_T = cRsList.getString("c19");
			String EEA_TEL_NO_T = cRsList.getString("EEA_TEL_NO");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String ROWID_T = cRsList.getString("ROWID");
			String c25_T = cRsList.getString("c25");
			String c26_T = cRsList.getString("c26");
%>
			<z:row
<%
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

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! EEA_SPCL_CD_T.equals("")) {
%>
		 		EEA_SPCL_CD='<%= EEA_SPCL_CD_T%>'
<%
			}

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! EEA_MNGT_SPYM_T.equals("")) {
%>
		 		EEA_MNGT_SPYM='<%= EEA_MNGT_SPYM_T%>'
<%
			}

			if(! c9_T.equals("")) {
%>
		 		c9='<%= c9_T%>'
<%
			}

			if(! EEA_SEX_NM_T.equals("")) {
%>
		 		EEA_SEX_NM='<%= EEA_SEX_NM_T%>'
<%
			}

			if(! EEA_SPCL_NM_T.equals("")) {
%>
		 		EEA_SPCL_NM='<%= EEA_SPCL_NM_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! EEA_ZIP_CD_T.equals("")) {
%>
		 		EEA_ZIP_CD='<%= EEA_ZIP_CD_T%>'
<%
			}

			if(! EEA_ZIP_AR_T.equals("")) {
%>
		 		EEA_ZIP_AR='<%= EEA_ZIP_AR_T%>'
<%
			}

			if(! EEA_ROAD_AR_T.equals("")) {
%>
		 		EEA_ROAD_AR='<%= EEA_ROAD_AR_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! c19_T.equals("")) {
%>
		 		c19='<%= c19_T%>'
<%
			}

			if(! EEA_TEL_NO_T.equals("")) {
%>
		 		EEA_TEL_NO='<%= EEA_TEL_NO_T%>'
<%
			}

			if(! EEA_MOBL_NO_T.equals("")) {
%>
		 		EEA_MOBL_NO='<%= EEA_MOBL_NO_T%>'
<%
			}

			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c25_T.equals("")) {
%>
		 		c25='<%= c25_T%>'
<%
			}

			if(! c26_T.equals("")) {
%>
		 		c26='<%= c26_T%>'
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
