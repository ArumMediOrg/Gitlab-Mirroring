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

		String G_ENCRT_KD = htMethod.get("G_ENCRT_KD");
		String MNGT_SPYM = htMethod.get("MNGT_SPYM");
		String SEXAM_DT = htMethod.get("SEXAM_DT");
		String EEXAM_DT = htMethod.get("EEXAM_DT");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
		if(MNGT_SPYM == null) { MNGT_SPYM = ""; }
		if(SEXAM_DT == null) { SEXAM_DT = ""; }
		if(EEXAM_DT == null) { EEXAM_DT = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

if (:g_Encrt_Kd = '1') then
  SELECT DISTINCT E.ICR_PID_EN ICR_PENL_DE,
else if (:g_Encrt_Kd = '2') then
  SELECT DISTINCT ECHELONDB.ecl_decrypt(E.ICR_PID_EN) ICR_PENL_DE,
else
  SELECT DISTINCT E.ICR_PENL_ID ICR_PENL_DE,

      A.SPG_EXAM_DT, A.SPG_EXAM_SQ, B.EEA_CUST_NO, B.EEA_CHART_NO, A.SPG_EXAM_CHA,
      B.EEA_PSNL_NM, A.SPG_MATT_CD, B.EEA_COMP_CD, C.ICY_COMP_NM,  B.EEA_SPCL_LT,
      D.CCN_FULL_NM, B.EEA_DEPT_NM
 From ST_PANJUNG A
   Inner Join ET_EXAM_ACPT B On B.EEA_EXAM_DT = A.SPG_EXAM_DT
                            And B.EEA_EXAM_SQ = A.SPG_EXAM_SQ
                            And SUBSTR(B.EEA_MNGT_SPYM,1,4) = :MNGT_SPYM
                            And B.EEA_ORDER_YN <> 'C'
   Inner Join IT_COMPANY   C On C.ICY_COMP_CD = B.EEA_COMP_CD
   Inner Join CT_COMMON    D On D.CCN_SMALL = B.EEA_PLCE_CD
                            And D.CCN_LARGE  = '0902'
                            And D.CCN_LEVEL  = '5'
                            And D.CCN_USE_YN = 'Y'
   Inner Join IT_CUSTOMER  E On E.ICR_CUST_NO = B.EEA_CUST_NO
Where A.SPG_EXAM_DT Between :sEXAM_DT And :eEXAM_DT
||:sSQL_ADD
		*/

		if(G_ENCRT_KD.equals("1")) {
			sql = " SELECT DISTINCT E.ICR_PID_EN ICR_PENL_DE,";
		}
		else if(G_ENCRT_KD.equals("2")) {
			sql = " SELECT DISTINCT ECL_DECRYPT(E.ICR_PID_EN) ICR_PENL_DE,";
		}
		else {
			sql = " SELECT DISTINCT E.ICR_PENL_ID ICR_PENL_DE,";
		}

		sql += " A.SPG_EXAM_DT, A.SPG_EXAM_SQ, B.EEA_CUST_NO, B.EEA_CHART_NO, A.SPG_EXAM_CHA, B.EEA_PSNL_NM, A.SPG_MATT_CD, B.EEA_COMP_CD, C.ICY_COMP_NM, B.EEA_SPCL_LT, D.CCN_FULL_NM, B.EEA_DEPT_NM";
		sql += " FROM ST_PANJUNG A INNER JOIN ET_EXAM_ACPT B";
		sql += " ON B.EEA_EXAM_DT = A.SPG_EXAM_DT";
		sql += " AND B.EEA_EXAM_SQ = A.SPG_EXAM_SQ";
		sql += " AND SUBSTR(B.EEA_MNGT_SPYM,1,4) = '" + MNGT_SPYM + "'";
		sql += " AND B.EEA_ORDER_YN <> 'C' INNER JOIN IT_COMPANY C";
		sql += " ON C.ICY_COMP_CD = B.EEA_COMP_CD INNER JOIN CT_COMMON D";
		sql += " ON D.CCN_SMALL = B.EEA_PLCE_CD";
		sql += " AND D.CCN_LARGE = '0902'";
		sql += " AND D.CCN_LEVEL = '5'";
		sql += " AND D.CCN_USE_YN = 'Y' INNER JOIN IT_CUSTOMER E";
		sql += " ON E.ICR_CUST_NO = B.EEA_CUST_NO";
		sql += " WHERE A.SPG_EXAM_DT BETWEEN '" + SEXAM_DT + "'";
		sql += " AND '" + EEXAM_DT + "'";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_NOISE_BtnQueryClick_002 \n";
			G_INFO += "설명 : 소음인원조회(개인별) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " G_ENCRT_KD : " + G_ENCRT_KD + " \n";
			G_INFO += " MNGT_SPYM : " + MNGT_SPYM + " \n";
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
		<s:AttributeType name='ICR_PENL_DE' rs:number='1' rs:basetable='IT_CUSTOMER' rs:basecolumn='ICR_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_EXAM_DT' rs:number='2' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_EXAM_SQ' rs:number='3' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='4' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='5' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_EXAM_CHA' rs:number='6' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_EXAM_CHA'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='7' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_MATT_CD' rs:number='8' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='9' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='10' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SPCL_LT' rs:number='11' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_SPCL_LT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_FULL_NM' rs:number='12' rs:basetable='CT_COMMON' rs:basecolumn='CCN_FULL_NM'>
			<s:datatype dt:type='string' dt:maxLength='300' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='13' rs:nullable='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ICR_PENL_DE_T = cRsList.getString("ICR_PENL_DE");
			String SPG_EXAM_DT_T = cRsList.getString("SPG_EXAM_DT");
			String SPG_EXAM_SQ_T = cRsList.getString("SPG_EXAM_SQ");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String SPG_EXAM_CHA_T = cRsList.getString("SPG_EXAM_CHA");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String SPG_MATT_CD_T = cRsList.getString("SPG_MATT_CD");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_SPCL_LT_T = cRsList.getString("EEA_SPCL_LT");
			String CCN_FULL_NM_T = cRsList.getString("CCN_FULL_NM");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
%>
			<z:row
<%
			if(! ICR_PENL_DE_T.equals("")) {
%>
		 		ICR_PENL_DE='<%= ICR_PENL_DE_T%>'
<%
			}

			if(! SPG_EXAM_DT_T.equals("")) {
%>
		 		SPG_EXAM_DT='<%= SPG_EXAM_DT_T%>'
<%
			}

			if(! SPG_EXAM_SQ_T.equals("")) {
%>
		 		SPG_EXAM_SQ='<%= SPG_EXAM_SQ_T%>'
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

			if(! SPG_EXAM_CHA_T.equals("")) {
%>
		 		SPG_EXAM_CHA='<%= SPG_EXAM_CHA_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! SPG_MATT_CD_T.equals("")) {
%>
		 		SPG_MATT_CD='<%= SPG_MATT_CD_T%>'
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

			if(! EEA_SPCL_LT_T.equals("")) {
%>
		 		EEA_SPCL_LT='<%= EEA_SPCL_LT_T%>'
<%
			}

			if(! CCN_FULL_NM_T.equals("")) {
%>
		 		CCN_FULL_NM='<%= CCN_FULL_NM_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
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
