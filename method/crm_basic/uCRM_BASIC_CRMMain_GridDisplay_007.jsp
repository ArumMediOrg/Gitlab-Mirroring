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

		String SRSVN_NO = htMethod.get("SRSVN_NO");

		//
		if(SRSVN_NO == null) { SRSVN_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select A.RRT_CHART_NO AS CHART_NO, A.RRT_PSNL_NM AS PSNL_NM,                      
       dbo.F_COMP_FIND(a.RRT_COMP_CD) AS COMP_NM ,                                
       A.RRT_DEPT_NM  AS DEPT_NM,  B.ICR_BIRH_DT AS BIRH_DT ,                     
       CASE B.ICR_SEX_KD WHEN '1' THEN '남' WHEN '2' THEN '여' END SEX_KD,
       dbo.f_tel_format(A.RRT_TEL_NO) AS TEL_NO,                                  
       dbo.f_tel_format(A.RRT_MOBL_NO) AS MOBL_NO,                                
       A.RRT_EMAIL_AR AS EMAIL_AR, A.RRT_PSNL_AGE AS PSNL_AGE,                    
       A.RRT_ZIP_CD AS ZIP_CD, A.RRT_ZIP_AR AS ZIP_AR,                            
       A.RRT_ROAD_AR AS ROAD_AR,                                                  
       dbo.F_CODE_FIND('0711', A.RRT_MMBR_CD, '', '1') AS MMBR_NM,          
       dbo.F_CODE_FIND('0703', B.ICR_NTNA_CD, '', '1') AS NATI_NM,          
       dbo.F_CODE_FIND('0401', A.RRT_EXAM_CD, '', '1') AS EXAM_NM,          
       A.RRT_PSNL_PR AS PSNL_PR, A.RRT_COMP_PR AS COMP_PR,                        
       A.RRT_HLTH_PR AS HLTH_PR, A.RRT_SPCL_PR AS SPCL_PR,                        
       A.RRT_CUST_NO AS CUST_NO                                                   
From RT_RSVT A                                                                    
Left Outer Join IT_CUSTOMER B on A.RRT_CUST_NO = B.ICR_CUST_NO                    
Where A.RRT_RSVN_NO = :sRSVN_NO
		*/

		sql = " SELECT A.RRT_CHART_NO AS CHART_NO, A.RRT_PSNL_NM AS PSNL_NM, F_COMP_FIND(A.RRT_COMP_CD) AS COMP_NM , A.RRT_DEPT_NM AS DEPT_NM, B.ICR_BIRH_DT AS BIRH_DT , CASE B.ICR_SEX_KD WHEN '1' THEN '남' WHEN '2' THEN '여' END SEX_KD, F_TEL_FORMAT(A.RRT_TEL_NO) AS TEL_NO, F_TEL_FORMAT(A.RRT_MOBL_NO) AS MOBL_NO, A.RRT_EMAIL_AR AS EMAIL_AR, A.RRT_PSNL_AGE AS PSNL_AGE, A.RRT_ZIP_CD AS ZIP_CD, A.RRT_ZIP_AR AS ZIP_AR, A.RRT_ROAD_AR AS ROAD_AR, F_CODE_FIND('0711', A.RRT_MMBR_CD, '', '1') AS MMBR_NM, F_CODE_FIND('0703', B.ICR_NTNA_CD, '', '1') AS NATI_NM, F_CODE_FIND('0401', A.RRT_EXAM_CD, '', '1') AS EXAM_NM, A.RRT_PSNL_PR AS PSNL_PR, A.RRT_COMP_PR AS COMP_PR, A.RRT_HLTH_PR AS HLTH_PR, A.RRT_SPCL_PR AS SPCL_PR, A.RRT_CUST_NO AS CUST_NO";
		sql += " FROM RT_RSVT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON A.RRT_CUST_NO = B.ICR_CUST_NO";
		sql += " WHERE A.RRT_RSVN_NO = '" + SRSVN_NO + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_CRMMain_GridDisplay_007 \n";
			G_INFO += "설명 : 상담관리-환자정보 Select \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SRSVN_NO : " + SRSVN_NO + " \n";
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
		<s:AttributeType name='CHART_NO' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_NM' rs:number='2' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='COMP_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DEPT_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='BIRH_DT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SEX_KD' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='TEL_NO' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='MOBL_NO' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EMAIL_AR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_AGE' rs:number='10' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ZIP_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ZIP_AR' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROAD_AR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='MMBR_NM' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='NATI_NM' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NM' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_PR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_PSNL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='COMP_PR' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_COMP_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='HLTH_PR' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_HLTH_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SPCL_PR' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SPCL_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CUST_NO' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='22' rs:rowid='true' rs:basetable='RT_RSVT' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c22' rs:name='ROWID' rs:number='23' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
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
			String ROWID_T = cRsList.getString("ROWID");
			String c22_T = cRsList.getString("c22");
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
<%
			if(! c22_T.equals("")) {
%>
		 		c22='<%= c22_T%>'
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
