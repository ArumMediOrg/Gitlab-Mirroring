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
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select  RRT_EXAM_DT EEA_EXAM_DT, RRT_EXAM_TM EEA_EXAM_SQ, RRT_ACPT_CD EEA_ACPT_CD, RRT_CUST_NO EEA_CUST_NO, RRT_PSNL_NM  EEA_PSNL_NM,
        RRT_EXAM_CD EEA_EXAM_CD,  RRT_CHART_NO EEA_CHART_NO,  ICY_COMP_NM,  RRT_DEPT_NM EEA_DEPT_NM, RRT_PSNL_AGE EEA_PSNL_AGE,
        CASE WHEN ICR_SEX_KD  IS NULL OR ICR_SEX_KD  = '' THEN ICR_SEX_KD 
        else GetCOMMON_LvCdToNm('0411',ICR_SEX_KD,'5',1) END ICR_SEX_NM,
        SUBSTR(ICR_PENL_ID,1,6)  ICR_BIRH_DT, RRT_COMP_CD EEA_COMP_CD, 
        (ICY_ZIP_AR || '  ' || ICY_ROAD_AR) ICY_COMP_AR, '' EEA_LABEL_DT,
         CASE WHEN RRT_COMP_CD IS NULL OR RRT_COMP_CD  = '' THEN ''
            else '[' || RRT_COMP_CD || ']' ||  ICY_COMP_NM  END EEA_COMP_NM,
        (RRT_ZIP_AR || '  ' || RRT_ROAD_AR) AS EEA_ADDR_NM, RRT_ZIP_CD EEA_ZIP_CD,
         ICY_ZIP_CD,  RRT_MOBL_NO  EEA_MOBL_NO,  RRT_FAMY_NM  EEA_FAMY_NM, ''  EEA_DIVI_CS, ''  EEA_CLSS_KD,
        RRT_DIVI_NO EEA_DIVI_NO, RRT_DEPT_NM   EEA_DEPT_NM  
 from rt_rsvt A
 left outer join IT_CUSTOMER B ON RRT_CUST_NO = B.ICR_CUST_NO 
 left outer join IT_COMPANY  C ON RRT_COMP_CD = C.ICY_COMP_CD 
 WHERE 0=0 
   AND RRT_EXAM_DT >= :EXAM_SDT
   AND RRT_EXAM_DT <= :EXAM_EDT
  :sSQL_ADD
		*/

  		sql = " SELECT RRT_EXAM_DT EEA_EXAM_DT, RRT_EXAM_TM EEA_EXAM_SQ, RRT_ACPT_CD EEA_ACPT_CD, RRT_CUST_NO EEA_CUST_NO, RRT_PSNL_NM EEA_PSNL_NM, RRT_EXAM_CD EEA_EXAM_CD, RRT_CHART_NO EEA_CHART_NO, ICY_COMP_NM, RRT_DEPT_NM EEA_DEPT_NM, RRT_PSNL_AGE EEA_PSNL_AGE, CASE WHEN ICR_SEX_KD IS NULL";
  		sql += " OR ICR_SEX_KD = '' THEN ICR_SEX_KD ELSE GETCOMMON_LVCDTONM('0411',ICR_SEX_KD,'5',1) END ICR_SEX_NM, SUBSTR(ICR_PENL_ID,1,6) ICR_BIRH_DT, RRT_COMP_CD EEA_COMP_CD, (ICY_ZIP_AR || ' ' || ICY_ROAD_AR) ICY_COMP_AR, '' EEA_LABEL_DT, CASE WHEN RRT_COMP_CD IS NULL";
  		sql += " OR RRT_COMP_CD = '' THEN '' ELSE '[' || RRT_COMP_CD || ']' || ICY_COMP_NM END EEA_COMP_NM, (RRT_ZIP_AR || ' ' || RRT_ROAD_AR) AS EEA_ADDR_NM, RRT_ZIP_CD EEA_ZIP_CD, ICY_ZIP_CD, RRT_MOBL_NO EEA_MOBL_NO, RRT_FAMY_NM EEA_FAMY_NM, '' EEA_DIVI_CS, '' EEA_CLSS_KD, RRT_DIVI_NO EEA_DIVI_NO, RRT_DEPT_NM EEA_DEPT_NM";
  		sql += " FROM RT_RSVT A LEFT OUTER JOIN IT_CUSTOMER B";
  		sql += " ON RRT_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
  		sql += " ON RRT_COMP_CD = C.ICY_COMP_CD";
  		sql += " WHERE 0=0";
  		sql += " AND RRT_EXAM_DT >= '" + EXAM_SDT + "'";
  		sql += " AND RRT_EXAM_DT <= '" + EXAM_EDT + "'";
  		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uLabel_PM_UF_SqlSet_Rsvt_001 \n";
			G_INFO += "설명 : 라벨 출력정보 로딩(예약기준) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_TM'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ACPT_CD' rs:number='3' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_ACPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='5' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='6' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='120'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='10' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_NM' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_AR' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='402'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_LABEL_DT' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='134'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADDR_NM' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='402'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_ZIP_CD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_NM' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_FAMY_NM'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CS' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CLSS_KD' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='c24' rs:name='EEA_DEPT_NM' rs:number='25' rs:nullable='true' rs:writeunknown='true'
			 rs:basetable='RT_RSVT' rs:basecolumn='RRT_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='26' rs:rowid='true' rs:basetable='RT_RSVT' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c26' rs:name='ROWID' rs:number='27' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c27' rs:name='ROWID' rs:number='28' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
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
			String EEA_ACPT_CD_T = cRsList.getString("EEA_ACPT_CD");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String ICR_SEX_NM_T = cRsList.getString("ICR_SEX_NM");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String ICY_COMP_AR_T = cRsList.getString("ICY_COMP_AR");
			String EEA_LABEL_DT_T = cRsList.getString("EEA_LABEL_DT");
			String EEA_COMP_NM_T = cRsList.getString("EEA_COMP_NM");
			String EEA_ADDR_NM_T = cRsList.getString("EEA_ADDR_NM");
			String EEA_ZIP_CD_T = cRsList.getString("EEA_ZIP_CD");
			String ICY_ZIP_CD_T = cRsList.getString("ICY_ZIP_CD");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_FAMY_NM_T = cRsList.getString("EEA_FAMY_NM");
			String EEA_DIVI_CS_T = cRsList.getString("EEA_DIVI_CS");
			String EEA_CLSS_KD_T = cRsList.getString("EEA_CLSS_KD");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String c24_T = cRsList.getString("c24");
			String ROWID_T = cRsList.getString("ROWID");
			String c26_T = cRsList.getString("c26");
			String c27_T = cRsList.getString("c27");
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

			if(! EEA_ACPT_CD_T.equals("")) {
%>
		 		EEA_ACPT_CD='<%= EEA_ACPT_CD_T%>'
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

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
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

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! ICR_SEX_NM_T.equals("")) {
%>
		 		ICR_SEX_NM='<%= ICR_SEX_NM_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! ICY_COMP_AR_T.equals("")) {
%>
		 		ICY_COMP_AR='<%= ICY_COMP_AR_T%>'
<%
			}

			if(! EEA_LABEL_DT_T.equals("")) {
%>
		 		EEA_LABEL_DT='<%= EEA_LABEL_DT_T%>'
<%
			}

			if(! EEA_COMP_NM_T.equals("")) {
%>
		 		EEA_COMP_NM='<%= EEA_COMP_NM_T%>'
<%
			}

			if(! EEA_ADDR_NM_T.equals("")) {
%>
		 		EEA_ADDR_NM='<%= EEA_ADDR_NM_T%>'
<%
			}

			if(! EEA_ZIP_CD_T.equals("")) {
%>
		 		EEA_ZIP_CD='<%= EEA_ZIP_CD_T%>'
<%
			}

			if(! ICY_ZIP_CD_T.equals("")) {
%>
		 		ICY_ZIP_CD='<%= ICY_ZIP_CD_T%>'
<%
			}

			if(! EEA_MOBL_NO_T.equals("")) {
%>
		 		EEA_MOBL_NO='<%= EEA_MOBL_NO_T%>'
<%
			}

			if(! EEA_FAMY_NM_T.equals("")) {
%>
		 		EEA_FAMY_NM='<%= EEA_FAMY_NM_T%>'
<%
			}

			if(! EEA_DIVI_CS_T.equals("")) {
%>
		 		EEA_DIVI_CS='<%= EEA_DIVI_CS_T%>'
<%
			}

			if(! EEA_CLSS_KD_T.equals("")) {
%>
		 		EEA_CLSS_KD='<%= EEA_CLSS_KD_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! c24_T.equals("")) {
%>
		 		c24='<%= c24_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
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
