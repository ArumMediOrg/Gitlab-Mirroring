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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String COMP_CD = htMethod.get("COMP_CD");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String PARAM_TX = htMethod.get("PARAM_TX");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_EXAM_DT,  A.EEA_EXAM_SQ,  A.EEA_PSNL_NM,  A.EEA_CHART_NO,
       A.EEA_TOTAL_YN, A.EEA_ORAL_YN,  A.EEA_UTER_CD,  A.EEA_CANAD_YN,
       GetCOMMON_LvCdToNm('0411', A.EEA_SEX_CD ,'5',1) EEA_SEX_NM,
       A.EEA_PSNL_AGE, A.EEA_COMP_CD,  A.EEA_DEPT_NM,  A.EEA_HLTH_KD, 
       A.EEA_CNCR_DT,  B.ICR_BIRH_DT,  C.ICY_COMP_NM, 
       A.EEA_ZIP_CD,   A.EEA_ZIP_AR  || A.EEA_ROAD_AR  AS EEA_ADDR_NM,
       D.ESO_EPNJN_YN, D.ESO_OPNJN_YN, D.ESO_EIFRM_DT, D.ESO_OIFRM_DT, 
       E.ECV_RPT_DT,   E.ECV_CVCN_YN
  FROM ET_EXAM_ACPT A 
            INNER JOIN IT_CUSTOMER    B ON A.EEA_CUST_NO = B.ICR_CUST_NO
       LEFT OUTER JOIN IT_COMPANY     C ON A.EEA_COMP_CD = C.ICY_COMP_CD
       LEFT OUTER JOIN ET_STDT_PNJNO  D ON D.ESO_EXAM_DT = A.EEA_EXAM_DT AND D.ESO_EXAM_SQ = A.EEA_EXAM_SQ 
       LEFT OUTER JOIN ET_CANCER_CRVC E ON E.ECV_EXAM_DT = A.EEA_EXAM_DT AND E.ECV_EXAM_SQ = A.EEA_EXAM_SQ 
 WHERE A.EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
   AND A.EEA_EXAM_CD = '31006' 
   AND A.EEA_ORDER_YN <> 'C' 

IF (:COMP_CD <> ') THEN
   AND A.EEA_COMP_CD = :COMP_CD
   
IF (:PSNL_NM <> ') THEN
   AND A.EEA_PSNL_NM LIKE '%' || :PSNL_NM || '%'

:PARAM_TX

:ORDER_BY
      

		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, A.EEA_CHART_NO, A.EEA_TOTAL_YN, A.EEA_ORAL_YN, A.EEA_UTER_CD, A.EEA_CANAD_YN, GETCOMMON_LVCDTONM('0411', A.EEA_SEX_CD ,'5',1) EEA_SEX_NM, A.EEA_PSNL_AGE, A.EEA_COMP_CD, A.EEA_DEPT_NM, A.EEA_HLTH_KD, A.EEA_CNCR_DT, B.ICR_BIRH_DT, C.ICY_COMP_NM, A.EEA_ZIP_CD, A.EEA_ZIP_AR || A.EEA_ROAD_AR AS EEA_ADDR_NM, D.ESO_EPNJN_YN, D.ESO_OPNJN_YN, D.ESO_EIFRM_DT, D.ESO_OIFRM_DT, E.ECV_RPT_DT, E.ECV_CVCN_YN";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN ET_STDT_PNJNO D";
		sql += " ON D.ESO_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND D.ESO_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_CRVC E";
		sql += " ON E.ECV_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND E.ECV_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND A.EEA_EXAM_CD = '31006'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(! COMP_CD.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		}
		if(! PSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%" + PSNL_NM + "%'";
		}
		
		sql += PARAM_TX;
		sql += ORDER_BY;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uOutSchool_PM_UF_SqlSet_001 \n";
			G_INFO += "설명 : 학교밖청소년 결과통보서 인쇄 대상 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
			G_INFO += " ORDER_BY : " + ORDER_BY + " \n";
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
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TOTAL_YN' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_TOTAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_YN' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_UTER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANAD_YN' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CANAD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_NM' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTH_KD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNCR_DT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNCR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADDR_NM' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EPNJN_YN' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EPNJN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_OPNJN_YN' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_OPNJN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EIFRM_DT' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_EIFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_OIFRM_DT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ESO_OIFRM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_RPT_DT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_RPT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_CVCN_YN' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ECV_CVCN_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
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
		<s:AttributeType name='c27' rs:name='ROWID' rs:number='28' rs:rowid='true' rs:basetable='ET_STDT_PNJNO' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c28' rs:name='ROWID' rs:number='29' rs:rowid='true' rs:basetable='ET_CANCER_CRVC' rs:basecolumn='ROWID'
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
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_TOTAL_YN_T = cRsList.getString("EEA_TOTAL_YN");
			String EEA_ORAL_YN_T = cRsList.getString("EEA_ORAL_YN");
			String EEA_UTER_CD_T = cRsList.getString("EEA_UTER_CD");
			String EEA_CANAD_YN_T = cRsList.getString("EEA_CANAD_YN");
			String EEA_SEX_NM_T = cRsList.getString("EEA_SEX_NM");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_HLTH_KD_T = cRsList.getString("EEA_HLTH_KD");
			String EEA_CNCR_DT_T = cRsList.getString("EEA_CNCR_DT");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_ZIP_CD_T = cRsList.getString("EEA_ZIP_CD");
			String EEA_ADDR_NM_T = cRsList.getString("EEA_ADDR_NM");
			String ESO_EPNJN_YN_T = cRsList.getString("ESO_EPNJN_YN");
			String ESO_OPNJN_YN_T = cRsList.getString("ESO_OPNJN_YN");
			String ESO_EIFRM_DT_T = cRsList.getString("ESO_EIFRM_DT");
			String ESO_OIFRM_DT_T = cRsList.getString("ESO_OIFRM_DT");
			String ECV_RPT_DT_T = cRsList.getString("ECV_RPT_DT");
			String ECV_CVCN_YN_T = cRsList.getString("ECV_CVCN_YN");
			String ROWID_T = cRsList.getString("ROWID");
			String c25_T = cRsList.getString("c25");
			String c26_T = cRsList.getString("c26");
			String c27_T = cRsList.getString("c27");
			String c28_T = cRsList.getString("c28");
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

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_TOTAL_YN_T.equals("")) {
%>
		 		EEA_TOTAL_YN='<%= EEA_TOTAL_YN_T%>'
<%
			}

			if(! EEA_ORAL_YN_T.equals("")) {
%>
		 		EEA_ORAL_YN='<%= EEA_ORAL_YN_T%>'
<%
			}

			if(! EEA_UTER_CD_T.equals("")) {
%>
		 		EEA_UTER_CD='<%= EEA_UTER_CD_T%>'
<%
			}

			if(! EEA_CANAD_YN_T.equals("")) {
%>
		 		EEA_CANAD_YN='<%= EEA_CANAD_YN_T%>'
<%
			}

			if(! EEA_SEX_NM_T.equals("")) {
%>
		 		EEA_SEX_NM='<%= EEA_SEX_NM_T%>'
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

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! EEA_HLTH_KD_T.equals("")) {
%>
		 		EEA_HLTH_KD='<%= EEA_HLTH_KD_T%>'
<%
			}

			if(! EEA_CNCR_DT_T.equals("")) {
%>
		 		EEA_CNCR_DT='<%= EEA_CNCR_DT_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! EEA_ZIP_CD_T.equals("")) {
%>
		 		EEA_ZIP_CD='<%= EEA_ZIP_CD_T%>'
<%
			}

			if(! EEA_ADDR_NM_T.equals("")) {
%>
		 		EEA_ADDR_NM='<%= EEA_ADDR_NM_T%>'
<%
			}

			if(! ESO_EPNJN_YN_T.equals("")) {
%>
		 		ESO_EPNJN_YN='<%= ESO_EPNJN_YN_T%>'
<%
			}

			if(! ESO_OPNJN_YN_T.equals("")) {
%>
		 		ESO_OPNJN_YN='<%= ESO_OPNJN_YN_T%>'
<%
			}

			if(! ESO_EIFRM_DT_T.equals("")) {
%>
		 		ESO_EIFRM_DT='<%= ESO_EIFRM_DT_T%>'
<%
			}

			if(! ESO_OIFRM_DT_T.equals("")) {
%>
		 		ESO_OIFRM_DT='<%= ESO_OIFRM_DT_T%>'
<%
			}

			if(! ECV_RPT_DT_T.equals("")) {
%>
		 		ECV_RPT_DT='<%= ECV_RPT_DT_T%>'
<%
			}

			if(! ECV_CVCN_YN_T.equals("")) {
%>
		 		ECV_CVCN_YN='<%= ECV_CVCN_YN_T%>'
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
