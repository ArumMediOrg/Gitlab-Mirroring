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
		String EEXAM_DT = htMethod.get("EEXAM_DT");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(SEXAM_DT == null) { SEXAM_DT = ""; }
		if(EEXAM_DT == null) { EEXAM_DT = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CUST_NO, A.EEA_CHART_NO, A.EEA_SEX_CD,
       A.EEA_PSNL_NM, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, A.EEA_PSNL_AGE, A.EEA_COMP_CD,
       CASE WHEN A.EEA_SEX_CD  IS NULL OR A.EEA_SEX_CD  = '' THEN A.EEA_SEX_CD
            else GetCOMMON_LvCdToNm('0411',A.EEA_SEX_CD ,'5',1) END ICR_SEX_NM,
       C.ICY_COMP_NM, C.ICY_COKD_CD, C.ICY_SMPL_YN, (C.ICY_ZIP_AR || C.ICY_ROAD_AR) AS ICR_ADDR_NM, C.ICY_ZIP_CD,
       GetCOMMON_LvCdToNm('0805',C.ICY_TKGJ_CD,'5',LENGTH(C.ICY_TKGJ_CD)) ICY_TKGJ_NM1,
       GetCOMMON_LvCdToNm('0823',C.ICY_TKGJ_CD,'5',LENGTH(C.ICY_TKGJ_CD)) ICY_TKGJ_NM2, ICY_TKGJ_YR,
       GetFILMNO_FIND(A.EEA_EXAM_DT,A.EEA_EXAM_SQ) ERI_FILM_NO, D.ERI_RSLT_VL, D.ERI_RSLT_CD, D.ERI_SPCL_KD
FROM ET_EXAM_ACPT A
INNER JOIN IT_CUSTOMER      B ON A.EEA_CUST_NO = B.ICR_CUST_NO
LEFT OUTER JOIN IT_COMPANY  C ON A.EEA_COMP_CD = C.ICY_COMP_CD
INNER JOIN ET_RSLT_ITEM D ON A.EEA_EXAM_DT = D.ERI_EXAM_DT AND A.EEA_EXAM_SQ = D.ERI_EXAM_SQ
                         AND (D.ERI_ITEM_CD = 'F0001' OR D.ERI_ITEM_CD = 'F0003' OR
                              D.ERI_ITEM_CD = 'F0007' OR D.ERI_ITEM_CD = 'F0014' OR
                              D.ERI_ITEM_CD = 'F0018' OR D.ERI_ITEM_CD = 'F0019' OR
                              D.ERI_ITEM_CD = 'F0020')
                         AND D.ERI_CNCL_YN = 'N'
 WHERE 0=0
 AND A.EEA_EXAM_DT >= :sEXAM_DT
 AND A.EEA_EXAM_DT <= :eEXAM_DT
 AND A.EEA_ORDER_YN <> 'C'
 || :sSQL_ADD
		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CUST_NO, A.EEA_CHART_NO, A.EEA_SEX_CD, A.EEA_PSNL_NM, SUBSTR(B.ICR_PENL_ID,1,6) EEA_BIRTH_DT, A.EEA_PSNL_AGE, A.EEA_COMP_CD";
		sql += ", CASE WHEN A.EEA_SEX_CD IS NULL OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) END ICR_SEX_NM";
		sql += ", C.ICY_COMP_NM, C.ICY_COKD_CD, C.ICY_SMPL_YN, (C.ICY_ZIP_AR || C.ICY_ROAD_AR) AS ICR_ADDR_NM, C.ICY_ZIP_CD, GETCOMMON_LVCDTONM('0805',C.ICY_TKGJ_CD,'5',LENGTH(C.ICY_TKGJ_CD)) ICY_TKGJ_NM1, GETCOMMON_LVCDTONM('0823',C.ICY_TKGJ_CD,'5',LENGTH(C.ICY_TKGJ_CD)) ICY_TKGJ_NM2, ICY_TKGJ_YR, GETFILMNO_FIND(A.EEA_EXAM_DT,A.EEA_EXAM_SQ) ERI_FILM_NO, D.ERI_RSLT_VL, D.ERI_RSLT_CD, D.ERI_SPCL_KD";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD INNER JOIN ET_RSLT_ITEM D";
		sql += " ON A.EEA_EXAM_DT = D.ERI_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.ERI_EXAM_SQ";
		sql += " AND (";
		sql += "	D.ERI_ITEM_CD = 'F0001'";
		sql += " 	OR D.ERI_ITEM_CD = 'F0003'";
		sql += " 	OR D.ERI_ITEM_CD = 'F0007'";
		sql += " 	OR D.ERI_ITEM_CD = 'F0014'";
		sql += " 	OR D.ERI_ITEM_CD = 'F0018'";
		sql += " 	OR D.ERI_ITEM_CD = 'F0019'";
		sql += " 	OR D.ERI_ITEM_CD = 'F0020'";
		sql += " )";
		sql += " AND D.ERI_CNCL_YN = 'N'";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_EXAM_DT >= '" + SEXAM_DT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EEXAM_DT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChest_FilmDecipher_UF_SqlSetChest_001 \n";
			G_INFO += "설명 : 흉부영상판독소견서 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SEXAM_DT : " + SEXAM_DT + " \n";
			G_INFO += " EEXAM_DT : " + EEXAM_DT + " \n";
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
		<s:AttributeType name='EEA_CUST_NO' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='6' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_BIRTH_DT' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_NM' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COKD_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COKD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_SMPL_YN' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_SMPL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ADDR_NM' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_ZIP_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKGJ_NM1' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKGJ_NM2' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKGJ_YR' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TKGJ_YR'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_FILM_NO' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_CD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPCL_KD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPCL_KD'>
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
		<s:AttributeType name='c24' rs:name='ROWID' rs:number='25' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c25' rs:name='ROWID' rs:number='26' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
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
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_BIRTH_DT_T = cRsList.getString("EEA_BIRTH_DT");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String ICR_SEX_NM_T = cRsList.getString("ICR_SEX_NM");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ICY_COKD_CD_T = cRsList.getString("ICY_COKD_CD");
			String ICY_SMPL_YN_T = cRsList.getString("ICY_SMPL_YN");
			String ICR_ADDR_NM_T = cRsList.getString("ICR_ADDR_NM");
			String ICY_ZIP_CD_T = cRsList.getString("ICY_ZIP_CD");
			String ICY_TKGJ_NM1_T = cRsList.getString("ICY_TKGJ_NM1");
			String ICY_TKGJ_NM2_T = cRsList.getString("ICY_TKGJ_NM2");
			String ICY_TKGJ_YR_T = cRsList.getString("ICY_TKGJ_YR");
			String ERI_FILM_NO_T = cRsList.getString("ERI_FILM_NO");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String ERI_RSLT_CD_T = cRsList.getString("ERI_RSLT_CD");
			String ERI_SPCL_KD_T = cRsList.getString("ERI_SPCL_KD");
			String ROWID_T = cRsList.getString("ROWID");
			String c23_T = cRsList.getString("c23");
			String c24_T = cRsList.getString("c24");
			String c25_T = cRsList.getString("c25");
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

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_BIRTH_DT_T.equals("")) {
%>
		 		EEA_BIRTH_DT='<%= EEA_BIRTH_DT_T%>'
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

			if(! ICR_SEX_NM_T.equals("")) {
%>
		 		ICR_SEX_NM='<%= ICR_SEX_NM_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! ICY_COKD_CD_T.equals("")) {
%>
		 		ICY_COKD_CD='<%= ICY_COKD_CD_T%>'
<%
			}

			if(! ICY_SMPL_YN_T.equals("")) {
%>
		 		ICY_SMPL_YN='<%= ICY_SMPL_YN_T%>'
<%
			}

			if(! ICR_ADDR_NM_T.equals("")) {
%>
		 		ICR_ADDR_NM='<%= ICR_ADDR_NM_T%>'
<%
			}

			if(! ICY_ZIP_CD_T.equals("")) {
%>
		 		ICY_ZIP_CD='<%= ICY_ZIP_CD_T%>'
<%
			}

			if(! ICY_TKGJ_NM1_T.equals("")) {
%>
		 		ICY_TKGJ_NM1='<%= ICY_TKGJ_NM1_T%>'
<%
			}

			if(! ICY_TKGJ_NM2_T.equals("")) {
%>
		 		ICY_TKGJ_NM2='<%= ICY_TKGJ_NM2_T%>'
<%
			}

			if(! ICY_TKGJ_YR_T.equals("")) {
%>
		 		ICY_TKGJ_YR='<%= ICY_TKGJ_YR_T%>'
<%
			}

			if(! ERI_FILM_NO_T.equals("")) {
%>
		 		ERI_FILM_NO='<%= ERI_FILM_NO_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! ERI_RSLT_CD_T.equals("")) {
%>
		 		ERI_RSLT_CD='<%= ERI_RSLT_CD_T%>'
<%
			}

			if(! ERI_SPCL_KD_T.equals("")) {
%>
		 		ERI_SPCL_KD='<%= ERI_SPCL_KD_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c23='<%= cnt%>'
				c24='<%= cnt%>'
				c25='<%= cnt%>'
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
