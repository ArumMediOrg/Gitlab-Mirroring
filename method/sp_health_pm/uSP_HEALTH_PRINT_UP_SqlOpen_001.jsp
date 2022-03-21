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

SELECT (SUBSTR(B.ICR_PENL_ID,1,6) || '-' || SUBSTR(B.ICR_PENL_ID,7,1) || '******') AS EEA_JUMIN_NO,
        A.EEA_PSNL_NM, A.eea_comp_cd,A.eea_exam_lt,A.EEA_PSNL_AGE, A.EEA_CUST_NO, C.SBE_RECHK_DT, A.EEA_2ND_YN, A.EEA_SPCL_CD,
        A.EEA_DIVI_NO, (A.EEA_ZIP_AR || ' ' || A.EEA_ROAD_AR) AS EEA_ADDR_NM, A.EEA_ZIP_CD,
        B.ICR_SEX_KD, A.EEA_EXAM_DT, A.EEA_EXAM_SQ, F_doclicne(C.SBE_XDOC_CD,'전문의') SBE_XDOC_NO,
        D.IAU_PENL_NM,
        CASE WHEN A.EEA_EXAM_CD = '41001' OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END ICR_SPCH_KD,
        F_DOCTOR_FIND('1',C.SBE_DDOC_CD) SBE_DDOC_NM, C.SBE_DDOC_CD,
        CASE WHEN A.EEA_MOBL_NO IS NULL OR A.EEA_MOBL_NO  = '' THEN A.EEA_TEL_NO
             else A.EEA_MOBL_NO END EEA_PHONE_NO, NVL(C.SBE_RECHK_DT,'') AS SBE_RECHECK_DT,
        A.EEA_DEPT_NM, A.EEA_ENTRY_DT, C.SBE_NCPN_LT, C.SBE_NCHR_HH, C.SBE_JUIP_DT, A.EEA_SPCL_LT,
        C.SBE_TPAN_NM, C.SBE_TBUS_NM, C.SBE_PANJ_YN, NVL(C.SBE_TOBO_DT,'') AS SBE_TONGBO_DT,
        CASE WHEN C.SBE_GOJU_CD  IS NULL OR C.SBE_GOJU_CD  = '' THEN C.SBE_GOJU_CD
        else GetCOMMON_LvCdToNm('0808',C.SBE_GOJU_CD ,'5',5) END SBE_GOJU_NM, C.SBE_ETC_TX
FROM ET_EXAM_ACPT A
     INNER JOIN IT_CUSTOMER  B ON A.EEA_CUST_NO = B.ICR_CUST_NO
     LEFT OUTER JOIN ST_BASE C ON A.EEA_EXAM_DT = C.SBE_EXAM_DT AND A.EEA_EXAM_SQ = C.SBE_EXAM_SQ
     Left Join IT_AUTH_USER D On D.IAU_EMP_NO = C.SBE_XDOC_CD And D.IAU_DEPT_CD = '0206'
                                    AND (D.IAU_LICEN1_CD IN ('11','12') OR D.IAU_LICEN2_CD IN ('11','12'))
WHERE 0=0
      AND A.EEA_EXAM_DT = :EXAM_DT
      AND A.EEA_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT (SUBSTR(B.ICR_PENL_ID,1,6) || '-' || SUBSTR(B.ICR_PENL_ID,7,1) || '******') AS EEA_JUMIN_NO, A.EEA_PSNL_NM, A.EEA_COMP_CD,A.EEA_EXAM_LT,A.EEA_PSNL_AGE, A.EEA_CUST_NO, C.SBE_RECHK_DT, A.EEA_2ND_YN, A.EEA_SPCL_CD, A.EEA_DIVI_NO, (A.EEA_ZIP_AR || ' ' || A.EEA_ROAD_AR) AS EEA_ADDR_NM, A.EEA_ZIP_CD, B.ICR_SEX_KD, A.EEA_EXAM_DT, A.EEA_EXAM_SQ, F_DOCLICNE(C.SBE_XDOC_CD,'전문의') SBE_XDOC_NO, D.IAU_PENL_NM, CASE WHEN A.EEA_EXAM_CD = '41001'";
		sql += " OR A.EEA_SPSB_YN = 'Y' THEN '1' ELSE '2' END ICR_SPCH_KD, F_DOCTOR_FIND('1',C.SBE_DDOC_CD) SBE_DDOC_NM, C.SBE_DDOC_CD, CASE WHEN A.EEA_MOBL_NO IS NULL";
		sql += " OR A.EEA_MOBL_NO = '' THEN A.EEA_TEL_NO ELSE A.EEA_MOBL_NO END EEA_PHONE_NO, NVL(C.SBE_RECHK_DT,'') AS SBE_RECHECK_DT, A.EEA_DEPT_NM, A.EEA_ENTRY_DT, C.SBE_NCPN_LT, C.SBE_NCHR_HH, C.SBE_JUIP_DT, A.EEA_SPCL_LT, C.SBE_TPAN_NM, C.SBE_TBUS_NM, C.SBE_PANJ_YN, NVL(C.SBE_TOBO_DT,'') AS SBE_TONGBO_DT, CASE WHEN C.SBE_GOJU_CD IS NULL";
		sql += " OR C.SBE_GOJU_CD = '' THEN C.SBE_GOJU_CD ELSE GETCOMMON_LVCDTONM('0808',C.SBE_GOJU_CD ,'5',5) END SBE_GOJU_NM, C.SBE_ETC_TX";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN ST_BASE C";
		sql += " ON A.EEA_EXAM_DT = C.SBE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = C.SBE_EXAM_SQ LEFT JOIN IT_AUTH_USER D";
		sql += " ON D.IAU_EMP_NO = C.SBE_XDOC_CD";
		sql += " AND D.IAU_DEPT_CD = '0206'";
		sql += " AND (D.IAU_LICEN1_CD IN ('11','12')";
		sql += " OR D.IAU_LICEN2_CD IN ('11','12'))";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_PRINT_UP_SqlOpen_001 \n";
			G_INFO += "설명 : 접수정보 로딩 \n";
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
		<s:AttributeType name='EEA_JUMIN_NO' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='21'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_LT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EXAM_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='6' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_RECHK_DT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_RECHK_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_2ND_YN' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_2ND_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DIVI_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ADDR_NM' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='401'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ZIP_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_KD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_SEX_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='14' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='15' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_XDOC_NO' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SPCH_KD' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_DDOC_NM' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_DDOC_CD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_DDOC_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PHONE_NO' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_RECHECK_DT' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENTRY_DT' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ENTRY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_NCPN_LT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_NCPN_LT'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_NCHR_HH' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_NCHR_HH'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_JUIP_DT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_JUIP_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TPAN_NM' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_TPAN_NM'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TBUS_NM' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_TBUS_NM'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_PANJ_YN' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_PANJ_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_TONGBO_DT' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_GOJU_NM' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_ETC_TX' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='35' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c35' rs:name='ROWID' rs:number='36' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c36' rs:name='ROWID' rs:number='37' rs:rowid='true' rs:basetable='ST_BASE' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c37' rs:name='ROWID' rs:number='38' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String EEA_JUMIN_NO_T = cRsList.getString("EEA_JUMIN_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_EXAM_LT_T = cRsList.getString("EEA_EXAM_LT");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String SBE_RECHK_DT_T = cRsList.getString("SBE_RECHK_DT");
			String EEA_2ND_YN_T = cRsList.getString("EEA_2ND_YN");
			String EEA_SPCL_CD_T = cRsList.getString("EEA_SPCL_CD");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_ADDR_NM_T = cRsList.getString("EEA_ADDR_NM");
			String EEA_ZIP_CD_T = cRsList.getString("EEA_ZIP_CD");
			String ICR_SEX_KD_T = cRsList.getString("ICR_SEX_KD");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String SBE_XDOC_NO_T = cRsList.getString("SBE_XDOC_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String ICR_SPCH_KD_T = cRsList.getString("ICR_SPCH_KD");
			String SBE_DDOC_NM_T = cRsList.getString("SBE_DDOC_NM");
			String SBE_DDOC_CD_T = cRsList.getString("SBE_DDOC_CD");
			String EEA_PHONE_NO_T = cRsList.getString("EEA_PHONE_NO");
			String SBE_RECHECK_DT_T = cRsList.getString("SBE_RECHECK_DT");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String EEA_ENTRY_DT_T = cRsList.getString("EEA_ENTRY_DT");
			String SBE_NCPN_LT_T = cRsList.getString("SBE_NCPN_LT");
			String SBE_NCHR_HH_T = cRsList.getString("SBE_NCHR_HH");
			String SBE_JUIP_DT_T = cRsList.getString("SBE_JUIP_DT");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String SBE_TPAN_NM_T = cRsList.getString("SBE_TPAN_NM");
			String SBE_TBUS_NM_T = cRsList.getString("SBE_TBUS_NM");
			String SBE_PANJ_YN_T = cRsList.getString("SBE_PANJ_YN");
			String SBE_TONGBO_DT_T = cRsList.getString("SBE_TONGBO_DT");
			String SBE_GOJU_NM_T = cRsList.getString("SBE_GOJU_NM");
			String SBE_ETC_TX_T = cRsList.getString("SBE_ETC_TX");
			String ROWID_T = cRsList.getString("ROWID");
			String c35_T = cRsList.getString("c35");
			String c36_T = cRsList.getString("c36");
			String c37_T = cRsList.getString("c37");
%>
			<z:row
<%
			if(! EEA_JUMIN_NO_T.equals("")) {
%>
		 		EEA_JUMIN_NO='<%= EEA_JUMIN_NO_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! EEA_EXAM_LT_T.equals("")) {
%>
		 		EEA_EXAM_LT='<%= EEA_EXAM_LT_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! SBE_RECHK_DT_T.equals("")) {
%>
		 		SBE_RECHK_DT='<%= SBE_RECHK_DT_T%>'
<%
			}

			if(! EEA_2ND_YN_T.equals("")) {
%>
		 		EEA_2ND_YN='<%= EEA_2ND_YN_T%>'
<%
			}

			if(! EEA_SPCL_CD_T.equals("")) {
%>
		 		EEA_SPCL_CD='<%= EEA_SPCL_CD_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
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

			if(! ICR_SEX_KD_T.equals("")) {
%>
		 		ICR_SEX_KD='<%= ICR_SEX_KD_T%>'
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

			if(! SBE_XDOC_NO_T.equals("")) {
%>
		 		SBE_XDOC_NO='<%= SBE_XDOC_NO_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! ICR_SPCH_KD_T.equals("")) {
%>
		 		ICR_SPCH_KD='<%= ICR_SPCH_KD_T%>'
<%
			}

			if(! SBE_DDOC_NM_T.equals("")) {
%>
		 		SBE_DDOC_NM='<%= SBE_DDOC_NM_T%>'
<%
			}

			if(! SBE_DDOC_CD_T.equals("")) {
%>
		 		SBE_DDOC_CD='<%= SBE_DDOC_CD_T%>'
<%
			}

			if(! EEA_PHONE_NO_T.equals("")) {
%>
		 		EEA_PHONE_NO='<%= EEA_PHONE_NO_T%>'
<%
			}

			if(! SBE_RECHECK_DT_T.equals("")) {
%>
		 		SBE_RECHECK_DT='<%= SBE_RECHECK_DT_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! EEA_ENTRY_DT_T.equals("")) {
%>
		 		EEA_ENTRY_DT='<%= EEA_ENTRY_DT_T%>'
<%
			}

			if(! SBE_NCPN_LT_T.equals("")) {
%>
		 		SBE_NCPN_LT='<%= SBE_NCPN_LT_T%>'
<%
			}

			if(! SBE_NCHR_HH_T.equals("")) {
%>
		 		SBE_NCHR_HH='<%= SBE_NCHR_HH_T%>'
<%
			}

			if(! SBE_JUIP_DT_T.equals("")) {
%>
		 		SBE_JUIP_DT='<%= SBE_JUIP_DT_T%>'
<%
			}

			if(! EEA_SPCL_LT_T.equals("")) {
%>
		 		EEA_SPCL_LT='<%= EEA_SPCL_LT_T%>'
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

			if(! SBE_PANJ_YN_T.equals("")) {
%>
		 		SBE_PANJ_YN='<%= SBE_PANJ_YN_T%>'
<%
			}

			if(! SBE_TONGBO_DT_T.equals("")) {
%>
		 		SBE_TONGBO_DT='<%= SBE_TONGBO_DT_T%>'
<%
			}

			if(! SBE_GOJU_NM_T.equals("")) {
%>
		 		SBE_GOJU_NM='<%= SBE_GOJU_NM_T%>'
<%
			}

			if(! SBE_ETC_TX_T.equals("")) {
%>
		 		SBE_ETC_TX='<%= SBE_ETC_TX_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c35_T.equals("")) {
%>
		 		c35='<%= c35_T%>'
<%
			}

			if(! c36_T.equals("")) {
%>
		 		c36='<%= c36_T%>'
<%
			}

			if(! c37_T.equals("")) {
%>
		 		c37='<%= c37_T%>'
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
