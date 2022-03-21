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

		String DTEFROMDT = htMethod.get("DTEFROMDT");
		String DTETODT = htMethod.get("DTETODT");
		String CMBCHUNGYYYY = htMethod.get("CMBCHUNGYYYY");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(DTEFROMDT == null) { DTEFROMDT = ""; }
		if(DTETODT == null) { DTETODT = ""; }
		if(CMBCHUNGYYYY == null) { CMBCHUNGYYYY = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select EEA_EXAM_DT
      ,EEA_EXAM_SQ
      ,EEA_PSNL_NM
      ,EEA_CHART_NO
      ,EEA_CNTR_CD
      ,EEA_HLTHR_PR
      ,ICR_PENL_ID, ICR_PID_EN
      ,SUBSTR(EEA_HLTH_KD,7,1) EEA_HLTH_KD7
      ,PSP_EXAM_DT
      ,REPLACE(PSP_RESULT_DATE,'-','') PSP_RESULT_DATE
      ,REPLACE(PSP_TRANC_DATE,'-','') PSP_TRANC_DATE
  from ET_EXAM_ACPT A left outer join IT_CUSTOMER B on A.EEA_CUST_NO =B.ICR_CUST_NO
                      left outer join PT_SED_PANJUNG D on  A.EEA_EXAM_DT= D.PSP_EXAM_DT and A.EEA_EXAM_SQ= D.PSP_EXAM_SQ
 where EEA_EXAM_DT between :dteFromDt AND :dteToDt
   and EEA_MNGT_HTYR = :cmbChungYyyy
   and EEA_HTSB_CD in('11001','12003')
   and EEA_ORDER_YN <> 'C'
   and NVL(EEA_RECE_NO, ' ') <> 'R'
   and SUBSTR(EEA_HLTH_KD,7,1) = '1'
   and EEA_LIFE_YN = 'Y'
   || : sSQL_ADD
		*/

		sql = " SELECT EEA_EXAM_DT ,EEA_EXAM_SQ ,EEA_PSNL_NM ,EEA_CHART_NO ,EEA_CNTR_CD ,EEA_HLTHR_PR ,ICR_PENL_ID, ICR_PID_EN ,SUBSTR(EEA_HLTH_KD,7,1) EEA_HLTH_KD7 ,PSP_EXAM_DT ,REPLACE(PSP_RESULT_DATE,'-','') PSP_RESULT_DATE ,REPLACE(PSP_TRANC_DATE,'-','') PSP_TRANC_DATE";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO =B.ICR_CUST_NO LEFT OUTER JOIN PT_SED_PANJUNG D";
		sql += " ON A.EEA_EXAM_DT= D.PSP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ= D.PSP_EXAM_SQ";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + DTEFROMDT + "'";
		sql += " AND '" + DTETODT + "'";
		sql += " AND EEA_MNGT_HTYR = '" + CMBCHUNGYYYY + "'";
		sql += " AND EEA_HTSB_CD IN('11001','12003')";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";
		sql += " AND SUBSTR(EEA_HLTH_KD,7,1) = '1'";
		sql += " AND EEA_LIFE_YN = 'Y' || '" +  SSQL_ADD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChungVerif2020_uDP_HabitSelect_2020_001 \n";
			G_INFO += "설명 : 생활습관만 해당 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEFROMDT : " + DTEFROMDT + " \n";
			G_INFO += " DTETODT : " + DTETODT + " \n";
			G_INFO += " CMBCHUNGYYYY : " + CMBCHUNGYYYY + " \n";
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
		<s:AttributeType name='EEA_CNTR_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CNTR_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTHR_PR' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_HLTHR_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PID_EN' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_PID_EN'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTH_KD7' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_EXAM_DT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_SED_PANJUNG'
			 rs:basecolumn='PSP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_RESULT_DATE' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_TRANC_DATE' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='13' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c13' rs:name='ROWID' rs:number='14' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c14' rs:name='ROWID' rs:number='15' rs:rowid='true' rs:basetable='PT_SED_PANJUNG' rs:basecolumn='ROWID'
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

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_CNTR_CD_T = cRsList.getString("EEA_CNTR_CD");
			String EEA_HLTHR_PR_T = cRsList.getString("EEA_HLTHR_PR");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String ICR_PID_EN_T = cRsList.getString("ICR_PID_EN");
			String EEA_HLTH_KD7_T = cRsList.getString("EEA_HLTH_KD7");
			String PSP_EXAM_DT_T = cRsList.getString("PSP_EXAM_DT");
			String PSP_RESULT_DATE_T = cRsList.getString("PSP_RESULT_DATE");
			String PSP_TRANC_DATE_T = cRsList.getString("PSP_TRANC_DATE");
			String ROWID_T = cRsList.getString("ROWID");
			String c13_T = cRsList.getString("c13");
			String c14_T = cRsList.getString("c14");
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

			if(! EEA_CNTR_CD_T.equals("")) {
%>
		 		EEA_CNTR_CD='<%= EEA_CNTR_CD_T%>'
<%
			}

			if(! EEA_HLTHR_PR_T.equals("")) {
%>
		 		EEA_HLTHR_PR='<%= EEA_HLTHR_PR_T%>'
<%
			}

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! ICR_PID_EN_T.equals("")) {
%>
		 		ICR_PID_EN='<%= ICR_PID_EN_T%>'
<%
			}

			if(! EEA_HLTH_KD7_T.equals("")) {
%>
		 		EEA_HLTH_KD7='<%= EEA_HLTH_KD7_T%>'
<%
			}

			if(! PSP_EXAM_DT_T.equals("")) {
%>
		 		PSP_EXAM_DT='<%= PSP_EXAM_DT_T%>'
<%
			}

			if(! PSP_RESULT_DATE_T.equals("")) {
%>
		 		PSP_RESULT_DATE='<%= PSP_RESULT_DATE_T%>'
<%
			}

			if(! PSP_TRANC_DATE_T.equals("")) {
%>
		 		PSP_TRANC_DATE='<%= PSP_TRANC_DATE_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c13='<%= cnt%>'
				c14='<%= cnt%>'
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
