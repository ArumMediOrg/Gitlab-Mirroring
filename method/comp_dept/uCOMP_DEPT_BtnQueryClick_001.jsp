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

		String COMP_CD = htMethod.get("COMP_CD");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CAST(D.ROWID AS CHAR(18)) AS LOGID,
              CASE WHEN D.ICD_SPCL_CD IS NULL OR D.ICD_SPCL_CD = '' THEN D.ICD_SPCL_CD ELSE '[' || D.ICD_SPCL_CD || ']' ||
   (SELECT A.CCN_FULL_NM FROM CT_COMMON A, IT_COMP_DEPT B WHERE A.CCN_LARGE = '0910' AND SUBSTR(A.CCN_SMALL, 1, 2) = D.ICD_SPCL_CD AND A.CCN_LEVEL = '5' group by A.CCN_FULL_NM) END ICD_SPCL_NM,
       CASE WHEN D.ICD_HALF_CD IS NULL OR D.ICD_HALF_CD = '' THEN D.ICD_HALF_CD ELSE '[' || D.ICD_HALF_CD || ']' ||
   (SELECT CSC_FULL_NM FROM CT_SP_COMMON WHERE CSC_LARGE = 'HM99F' AND CSC_SMALL = D.ICD_HALF_CD AND CSC_LEVEL <> '1' group by CSC_FULL_NM) END ICD_HALF_NM,
       CASE WHEN D.ICD_TAGR_TM IS NULL OR D.ICD_TAGR_TM = '' THEN D.ICD_TAGR_TM ELSE '[' || D.ICD_TAGR_TM || ']' ||
   (SELECT CSC_FULL_NM FROM CT_SP_COMMON WHERE CSC_LARGE = 'HM99B' AND CSC_SMALL = D.ICD_TAGR_TM AND CSC_LEVEL <> '1' group by CSC_FULL_NM) END ICD_TAGR_NM,
              CASE WHEN C.ICY_TKCG_CD IS NULL OR C.ICY_TKCG_CD = '' THEN C.ICY_TKCG_CD ELSE '[' || C.ICY_TKCG_CD || ']' ||
   (SELECT A.CCN_FULL_NM FROM CT_COMMON A, IT_COMP_DEPT B WHERE A.CCN_LARGE = '0804' AND SUBSTR(A.CCN_SMALL, 1, 1) = C.ICY_TKCG_CD AND A.CCN_LEVEL = '5' group by A.CCN_FULL_NM) END ICD_TKCG_NM,
              CASE WHEN C.ICY_TBAS_CD IS NULL OR C.ICY_TBAS_CD = '' THEN C.ICY_TBAS_CD ELSE '[' || C.ICY_TBAS_CD || ']' ||
   (SELECT A.CCN_FULL_NM FROM CT_COMMON A, IT_COMP_DEPT B WHERE A.CCN_LARGE = '0804' AND SUBSTR(A.CCN_SMALL, 1, 1) = C.ICY_TBAS_CD AND A.CCN_LEVEL = '5' group by A.CCN_FULL_NM) END ICD_TBAS_NM,
              CASE WHEN C.ICY_TKDE_CD IS NULL OR C.ICY_TKDE_CD = '' THEN C.ICY_TKDE_CD ELSE '[' || C.ICY_TKDE_CD || ']' ||
   (SELECT A.CCN_FULL_NM FROM CT_COMMON A, IT_COMP_DEPT B WHERE A.CCN_LARGE = '0804' AND SUBSTR(A.CCN_SMALL, 1, 1) = C.ICY_TKDE_CD AND A.CCN_LEVEL = '5' group by A.CCN_FULL_NM) END ICD_TKDE_NM,
     D.ICD_COMP_CD, D.ICD_MNGT_YR,  D.ICD_HALF_CD, D.ICD_DEPT_CD, D.ICD_DEPT_NM, D.ICD_SUBD_NM,
     D.ICD_TCHK_YN, D.ICD_MATT_LT,  D.ICD_MTJG_LT, D.ICD_TBAS_CD, D.ICD_TAGR_TM, D.ICD_USE_YN,
     D.ICD_NUSE_ID, D.ICD_NUSE_DTT, D.ICD_INPT_ID, D.ICD_INPT_DTT,D.ICD_MODI_ID, D.ICD_MODI_DTT,
     D.ICD_TRNS_ID, D.ICD_TRNS_DTT, D.ICD_SPCL_CD,
     C.ICY_COMP_NM, C.ICY_SUTK_YN,  C.ICY_COTK_CD,
     D.ICD_BSBS_PR, D.ICD_BTGS_PR,  D.ICD_BCAS_PR, D.ICD_JSBS_PR,
     D.ICD_JTGS_PR,  D.ICD_JCAS_PR, D.ICD_BSBS_RT, D.ICD_BTGS_RT,
     D.ICD_BCAS_RT,  D.ICD_JSBS_RT, D.ICD_JTGS_RT, D.ICD_JCAS_RT,
     D.ICD_JBSBS_PR, D.ICD_JBTGS_PR,D.ICD_JBCAS_PR,D.ICD_JJSBS_PR,
     D.ICD_JJTGS_PR, D.ICD_JJCAS_PR,C.ICY_DISC_RT, '' ICD_MATT_NM
,    D.ICD_DSBS_PR,  D.ICD_DTGS_PR,  D.ICD_DCAS_PR,  D.ICD_DSBS_RT,  D.ICD_DTGS_RT,
     D.ICD_DCAS_RT,  D.ICD_JDSBS_PR, D.ICD_JDTGS_PR, D.ICD_JDCAS_PR
  FROM IT_COMP_DEPT D, IT_COMPANY C
 WHERE D.ICD_COMP_CD = :COMP_CD
   AND C.ICY_COMP_CD = D.ICD_COMP_CD
   AND C.ICY_DEPT_CD = '1'
   AND C.ICY_USE_YN  = 'Y'
|| :sSQL_ADD

		*/

		sql = " SELECT CAST(D.ROWID AS CHAR(18)) AS LOGID";

		sql += ", CASE WHEN D.ICD_SPCL_CD IS NULL OR D.ICD_SPCL_CD = '' THEN D.ICD_SPCL_CD ELSE '[' || D.ICD_SPCL_CD || ']' || (";
		sql += "	SELECT A.CCN_FULL_NM";
		sql += " 	FROM CT_COMMON A, IT_COMP_DEPT B";
		sql += " 	WHERE A.CCN_LARGE = '0910'";
		sql += " 	AND SUBSTR(A.CCN_SMALL, 1, 2) = D.ICD_SPCL_CD";
		sql += " 	AND A.CCN_LEVEL = '5'";
		sql += " 	GROUP BY A.CCN_FULL_NM";
		sql += " ) END ICD_SPCL_NM";
		
		sql += ", CASE WHEN D.ICD_HALF_CD IS NULL OR D.ICD_HALF_CD = '' THEN D.ICD_HALF_CD ELSE '[' || D.ICD_HALF_CD || ']' || (";
		sql += "	SELECT CSC_FULL_NM";
		sql += " 	FROM CT_SP_COMMON";
		sql += " 	WHERE CSC_LARGE = 'HM99F'";
		sql += " 	AND CSC_SMALL = D.ICD_HALF_CD";
		sql += " 	AND CSC_LEVEL <> '1'";
		sql += " 	GROUP BY CSC_FULL_NM";
		sql += " ) END ICD_HALF_NM";
		
		sql += ", CASE WHEN D.ICD_TAGR_TM IS NULL OR D.ICD_TAGR_TM = '' THEN D.ICD_TAGR_TM ELSE '[' || D.ICD_TAGR_TM || ']' || (";
		sql += "	SELECT CSC_FULL_NM";
		sql += " 	FROM CT_SP_COMMON";
		sql += " 	WHERE CSC_LARGE = 'HM99B'";
		sql += " 	AND CSC_SMALL = D.ICD_TAGR_TM";
		sql += " 	AND CSC_LEVEL <> '1'";
		sql += " 	GROUP BY CSC_FULL_NM";
		sql += " ) END ICD_TAGR_NM";
		
		sql += ", CASE WHEN C.ICY_TKCG_CD IS NULL OR C.ICY_TKCG_CD = '' THEN C.ICY_TKCG_CD ELSE '[' || C.ICY_TKCG_CD || ']' || (";
		sql += "	SELECT A.CCN_FULL_NM";
		sql += " 	FROM CT_COMMON A, IT_COMP_DEPT B";
		sql += " 	WHERE A.CCN_LARGE = '0804'";
		sql += " 	AND SUBSTR(A.CCN_SMALL, 1, 1) = C.ICY_TKCG_CD";
		sql += " 	AND A.CCN_LEVEL = '5'";
		sql += " 	GROUP BY A.CCN_FULL_NM";
		sql += " ) END ICD_TKCG_NM";
		
		sql += ", CASE WHEN C.ICY_TBAS_CD IS NULL OR C.ICY_TBAS_CD = '' THEN C.ICY_TBAS_CD ELSE '[' || C.ICY_TBAS_CD || ']' || (";
		sql += "	SELECT A.CCN_FULL_NM";
		sql += " 	FROM CT_COMMON A, IT_COMP_DEPT B";
		sql += " 	WHERE A.CCN_LARGE = '0804'";
		sql += " 	AND SUBSTR(A.CCN_SMALL, 1, 1) = C.ICY_TBAS_CD";
		sql += " 	AND A.CCN_LEVEL = '5'";
		sql += " 	GROUP BY A.CCN_FULL_NM";
		sql += " ) END ICD_TBAS_NM";
		
		sql += ", CASE WHEN C.ICY_TKDE_CD IS NULL OR C.ICY_TKDE_CD = '' THEN C.ICY_TKDE_CD ELSE '[' || C.ICY_TKDE_CD || ']' || (";
		sql += "	SELECT A.CCN_FULL_NM";
		sql += " 	FROM CT_COMMON A, IT_COMP_DEPT B";
		sql += " 	WHERE A.CCN_LARGE = '0804'";
		sql += " 	AND SUBSTR(A.CCN_SMALL, 1, 1) = C.ICY_TKDE_CD";
		sql += " 	AND A.CCN_LEVEL = '5'";
		sql += " 	GROUP BY A.CCN_FULL_NM";
		sql += " ) END ICD_TKDE_NM";

		sql += ", D.ICD_COMP_CD, D.ICD_MNGT_YR, D.ICD_HALF_CD, D.ICD_DEPT_CD, D.ICD_DEPT_NM, D.ICD_SUBD_NM, D.ICD_TCHK_YN, D.ICD_MATT_LT, D.ICD_MTJG_LT, D.ICD_TBAS_CD, D.ICD_TAGR_TM, D.ICD_USE_YN, D.ICD_NUSE_ID, D.ICD_NUSE_DTT, D.ICD_INPT_ID, D.ICD_INPT_DTT,D.ICD_MODI_ID, D.ICD_MODI_DTT, D.ICD_TRNS_ID, D.ICD_TRNS_DTT, D.ICD_SPCL_CD, C.ICY_COMP_NM, C.ICY_SUTK_YN, C.ICY_COTK_CD, D.ICD_BSBS_PR, D.ICD_BTGS_PR, D.ICD_BCAS_PR, D.ICD_JSBS_PR, D.ICD_JTGS_PR, D.ICD_JCAS_PR, D.ICD_BSBS_RT, D.ICD_BTGS_RT, D.ICD_BCAS_RT, D.ICD_JSBS_RT, D.ICD_JTGS_RT, D.ICD_JCAS_RT, D.ICD_JBSBS_PR, D.ICD_JBTGS_PR,D.ICD_JBCAS_PR,D.ICD_JJSBS_PR, D.ICD_JJTGS_PR, D.ICD_JJCAS_PR,C.ICY_DISC_RT, '' ICD_MATT_NM";
		sql += ", D.ICD_DSBS_PR,  D.ICD_DTGS_PR,  D.ICD_DCAS_PR,  D.ICD_DSBS_RT,  D.ICD_DTGS_RT";
		sql += ", D.ICD_DCAS_RT,  D.ICD_JDSBS_PR, D.ICD_JDTGS_PR, D.ICD_JDCAS_PR";

		sql += " FROM IT_COMP_DEPT D, IT_COMPANY C";
		sql += " WHERE D.ICD_COMP_CD = '" + COMP_CD + "'";
		sql += " AND C.ICY_COMP_CD = D.ICD_COMP_CD";
		sql += " AND C.ICY_DEPT_CD = '1'";
		sql += " AND C.ICY_USE_YN = 'Y'";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_DEPT_BtnQueryClick_001 \n";
			G_INFO += "설명 : 사업장부서관리(특수) 리스트 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
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
		<s:AttributeType name='LOGID' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_SPCL_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='304'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_HALF_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='503'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TAGR_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='503'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TKCG_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='312'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TBAS_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='312'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TKDE_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='312'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_COMP_CD' rs:number='8'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_MNGT_YR' rs:number='9' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_HALF_CD' rs:number='10' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_HALF_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_DEPT_CD' rs:number='11' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_DEPT_NM' rs:number='12' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_SUBD_NM' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_SUBD_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TCHK_YN' rs:number='14' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_TCHK_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_MATT_LT' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_MATT_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_MTJG_LT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_MTJG_LT'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TBAS_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_TBAS_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TAGR_TM' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_TAGR_TM'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_USE_YN' rs:number='19' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ICD_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_NUSE_ID' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_NUSE_DTT' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_INPT_ID' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_INPT_DTT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_MODI_ID' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_MODI_DTT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TRNS_ID' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_TRNS_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TRNS_DTT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_TRNS_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_SPCL_CD' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_SPCL_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='29' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='120' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_SUTK_YN' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_SUTK_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COTK_CD' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COTK_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_BSBS_PR' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_BSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_BTGS_PR' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_BTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_BCAS_PR' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_BCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JSBS_PR' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JTGS_PR' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JCAS_PR' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_BSBS_RT' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_BSBS_RT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_BTGS_RT' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_BTGS_RT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_BCAS_RT' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_BCAS_RT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JSBS_RT' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JSBS_RT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JTGS_RT' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JTGS_RT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JCAS_RT' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JCAS_RT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JBSBS_PR' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JBSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JBTGS_PR' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JBTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JBCAS_PR' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JBCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JJSBS_PR' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JJSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JJTGS_PR' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JJTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JJCAS_PR' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JJCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_DISC_RT' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_DISC_RT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_MATT_NM' rs:number='51' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_DSBS_PR' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_DSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='7' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_DTGS_PR' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_DTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='7' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_DCAS_PR' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_DCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='7' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_DSBS_RT' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_DSBS_RT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='2' rs:precision='5' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_DTGS_RT' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_DTGS_RT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='2' rs:precision='5' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_DCAS_RT' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_DCAS_RT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='2' rs:precision='5' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JDSBS_PR' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JDSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='7' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JDTGS_PR' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JDTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='7' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_JDCAS_PR' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_JDCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='7' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='61' rs:rowid='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c61' rs:name='ROWID' rs:number='62' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
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

			String LOGID_T = cRsList.getString("LOGID");
			String ICD_SPCL_NM_T = cRsList.getString("ICD_SPCL_NM");
			String ICD_HALF_NM_T = cRsList.getString("ICD_HALF_NM");
			String ICD_TAGR_NM_T = cRsList.getString("ICD_TAGR_NM");
			String ICD_TKCG_NM_T = cRsList.getString("ICD_TKCG_NM");
			String ICD_TBAS_NM_T = cRsList.getString("ICD_TBAS_NM");
			String ICD_TKDE_NM_T = cRsList.getString("ICD_TKDE_NM");
			String ICD_COMP_CD_T = cRsList.getString("ICD_COMP_CD");
			String ICD_MNGT_YR_T = cRsList.getString("ICD_MNGT_YR");
			String ICD_HALF_CD_T = cRsList.getString("ICD_HALF_CD");
			String ICD_DEPT_CD_T = cRsList.getString("ICD_DEPT_CD");
			String ICD_DEPT_NM_T = cRsList.getString("ICD_DEPT_NM");
			String ICD_SUBD_NM_T = cRsList.getString("ICD_SUBD_NM");
			String ICD_TCHK_YN_T = cRsList.getString("ICD_TCHK_YN");
			String ICD_MATT_LT_T = cRsList.getString("ICD_MATT_LT");
			String ICD_MTJG_LT_T = cRsList.getString("ICD_MTJG_LT");
			String ICD_TBAS_CD_T = cRsList.getString("ICD_TBAS_CD");
			String ICD_TAGR_TM_T = cRsList.getString("ICD_TAGR_TM");
			String ICD_USE_YN_T = cRsList.getString("ICD_USE_YN");
			String ICD_NUSE_ID_T = cRsList.getString("ICD_NUSE_ID");
			String ICD_NUSE_DTT_T = cRsList.getDate2("ICD_NUSE_DTT");
			String ICD_INPT_ID_T = cRsList.getString("ICD_INPT_ID");
			String ICD_INPT_DTT_T = cRsList.getDate2("ICD_INPT_DTT");
			String ICD_MODI_ID_T = cRsList.getString("ICD_MODI_ID");
			String ICD_MODI_DTT_T = cRsList.getDate2("ICD_MODI_DTT");
			String ICD_TRNS_ID_T = cRsList.getString("ICD_TRNS_ID");
			String ICD_TRNS_DTT_T = cRsList.getDate2("ICD_TRNS_DTT");
			String ICD_SPCL_CD_T = cRsList.getString("ICD_SPCL_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ICY_SUTK_YN_T = cRsList.getString("ICY_SUTK_YN");
			String ICY_COTK_CD_T = cRsList.getString("ICY_COTK_CD");
			String ICD_BSBS_PR_T = cRsList.getString("ICD_BSBS_PR");
			String ICD_BTGS_PR_T = cRsList.getString("ICD_BTGS_PR");
			String ICD_BCAS_PR_T = cRsList.getString("ICD_BCAS_PR");
			String ICD_JSBS_PR_T = cRsList.getString("ICD_JSBS_PR");
			String ICD_JTGS_PR_T = cRsList.getString("ICD_JTGS_PR");
			String ICD_JCAS_PR_T = cRsList.getString("ICD_JCAS_PR");
			String ICD_BSBS_RT_T = cRsList.getString("ICD_BSBS_RT");
			String ICD_BTGS_RT_T = cRsList.getString("ICD_BTGS_RT");
			String ICD_BCAS_RT_T = cRsList.getString("ICD_BCAS_RT");
			String ICD_JSBS_RT_T = cRsList.getString("ICD_JSBS_RT");
			String ICD_JTGS_RT_T = cRsList.getString("ICD_JTGS_RT");
			String ICD_JCAS_RT_T = cRsList.getString("ICD_JCAS_RT");
			String ICD_JBSBS_PR_T = cRsList.getString("ICD_JBSBS_PR");
			String ICD_JBTGS_PR_T = cRsList.getString("ICD_JBTGS_PR");
			String ICD_JBCAS_PR_T = cRsList.getString("ICD_JBCAS_PR");
			String ICD_JJSBS_PR_T = cRsList.getString("ICD_JJSBS_PR");
			String ICD_JJTGS_PR_T = cRsList.getString("ICD_JJTGS_PR");
			String ICD_JJCAS_PR_T = cRsList.getString("ICD_JJCAS_PR");
			String ICY_DISC_RT_T = cRsList.getString("ICY_DISC_RT");
			String ICD_MATT_NM_T = cRsList.getString("ICD_MATT_NM");
			String ICD_DSBS_PR_T = cRsList.getString("ICD_DSBS_PR");
			String ICD_DTGS_PR_T = cRsList.getString("ICD_DTGS_PR");
			String ICD_DCAS_PR_T = cRsList.getString("ICD_DCAS_PR");
			String ICD_DSBS_RT_T = cRsList.getString("ICD_DSBS_RT");
			String ICD_DTGS_RT_T = cRsList.getString("ICD_DTGS_RT");
			String ICD_DCAS_RT_T = cRsList.getString("ICD_DCAS_RT");
			String ICD_JDSBS_PR_T = cRsList.getString("ICD_JDSBS_PR");
			String ICD_JDTGS_PR_T = cRsList.getString("ICD_JDTGS_PR");
			String ICD_JDCAS_PR_T = cRsList.getString("ICD_JDCAS_PR");
			String ROWID_T = cRsList.getString("ROWID");
			String c61_T = cRsList.getString("c61");
%>
			<z:row
<%
			if(! LOGID_T.equals("")) {
%>
		 		LOGID='<%= LOGID_T%>'
<%
			}

			if(! ICD_SPCL_NM_T.equals("")) {
%>
		 		ICD_SPCL_NM='<%= ICD_SPCL_NM_T%>'
<%
			}

			if(! ICD_HALF_NM_T.equals("")) {
%>
		 		ICD_HALF_NM='<%= ICD_HALF_NM_T%>'
<%
			}

			if(! ICD_TAGR_NM_T.equals("")) {
%>
		 		ICD_TAGR_NM='<%= ICD_TAGR_NM_T%>'
<%
			}

			if(! ICD_TKCG_NM_T.equals("")) {
%>
		 		ICD_TKCG_NM='<%= ICD_TKCG_NM_T%>'
<%
			}

			if(! ICD_TBAS_NM_T.equals("")) {
%>
		 		ICD_TBAS_NM='<%= ICD_TBAS_NM_T%>'
<%
			}

			if(! ICD_TKDE_NM_T.equals("")) {
%>
		 		ICD_TKDE_NM='<%= ICD_TKDE_NM_T%>'
<%
			}

			if(! ICD_COMP_CD_T.equals("")) {
%>
		 		ICD_COMP_CD='<%= ICD_COMP_CD_T%>'
<%
			}

			if(! ICD_MNGT_YR_T.equals("")) {
%>
		 		ICD_MNGT_YR='<%= ICD_MNGT_YR_T%>'
<%
			}

			if(! ICD_HALF_CD_T.equals("")) {
%>
		 		ICD_HALF_CD='<%= ICD_HALF_CD_T%>'
<%
			}

			if(! ICD_DEPT_CD_T.equals("")) {
%>
		 		ICD_DEPT_CD='<%= ICD_DEPT_CD_T%>'
<%
			}

			if(! ICD_DEPT_NM_T.equals("")) {
%>
		 		ICD_DEPT_NM='<%= ICD_DEPT_NM_T%>'
<%
			}

			if(! ICD_SUBD_NM_T.equals("")) {
%>
		 		ICD_SUBD_NM='<%= ICD_SUBD_NM_T%>'
<%
			}

			if(! ICD_TCHK_YN_T.equals("")) {
%>
		 		ICD_TCHK_YN='<%= ICD_TCHK_YN_T%>'
<%
			}

			if(! ICD_MATT_LT_T.equals("")) {
%>
		 		ICD_MATT_LT='<%= ICD_MATT_LT_T%>'
<%
			}

			if(! ICD_MTJG_LT_T.equals("")) {
%>
		 		ICD_MTJG_LT='<%= ICD_MTJG_LT_T%>'
<%
			}

			if(! ICD_TBAS_CD_T.equals("")) {
%>
		 		ICD_TBAS_CD='<%= ICD_TBAS_CD_T%>'
<%
			}

			if(! ICD_TAGR_TM_T.equals("")) {
%>
		 		ICD_TAGR_TM='<%= ICD_TAGR_TM_T%>'
<%
			}

			if(! ICD_USE_YN_T.equals("")) {
%>
		 		ICD_USE_YN='<%= ICD_USE_YN_T%>'
<%
			}

			if(! ICD_NUSE_ID_T.equals("")) {
%>
		 		ICD_NUSE_ID='<%= ICD_NUSE_ID_T%>'
<%
			}

			if(! ICD_NUSE_DTT_T.equals("")) {
%>
		 		ICD_NUSE_DTT='<%= ICD_NUSE_DTT_T%>'
<%
			}

			if(! ICD_INPT_ID_T.equals("")) {
%>
		 		ICD_INPT_ID='<%= ICD_INPT_ID_T%>'
<%
			}

			if(! ICD_INPT_DTT_T.equals("")) {
%>
		 		ICD_INPT_DTT='<%= ICD_INPT_DTT_T%>'
<%
			}

			if(! ICD_MODI_ID_T.equals("")) {
%>
		 		ICD_MODI_ID='<%= ICD_MODI_ID_T%>'
<%
			}

			if(! ICD_MODI_DTT_T.equals("")) {
%>
		 		ICD_MODI_DTT='<%= ICD_MODI_DTT_T%>'
<%
			}

			if(! ICD_TRNS_ID_T.equals("")) {
%>
		 		ICD_TRNS_ID='<%= ICD_TRNS_ID_T%>'
<%
			}

			if(! ICD_TRNS_DTT_T.equals("")) {
%>
		 		ICD_TRNS_DTT='<%= ICD_TRNS_DTT_T%>'
<%
			}

			if(! ICD_SPCL_CD_T.equals("")) {
%>
		 		ICD_SPCL_CD='<%= ICD_SPCL_CD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! ICY_SUTK_YN_T.equals("")) {
%>
		 		ICY_SUTK_YN='<%= ICY_SUTK_YN_T%>'
<%
			}

			if(! ICY_COTK_CD_T.equals("")) {
%>
		 		ICY_COTK_CD='<%= ICY_COTK_CD_T%>'
<%
			}

			if(! ICD_BSBS_PR_T.equals("")) {
%>
		 		ICD_BSBS_PR='<%= ICD_BSBS_PR_T%>'
<%
			}

			if(! ICD_BTGS_PR_T.equals("")) {
%>
		 		ICD_BTGS_PR='<%= ICD_BTGS_PR_T%>'
<%
			}

			if(! ICD_BCAS_PR_T.equals("")) {
%>
		 		ICD_BCAS_PR='<%= ICD_BCAS_PR_T%>'
<%
			}

			if(! ICD_JSBS_PR_T.equals("")) {
%>
		 		ICD_JSBS_PR='<%= ICD_JSBS_PR_T%>'
<%
			}

			if(! ICD_JTGS_PR_T.equals("")) {
%>
		 		ICD_JTGS_PR='<%= ICD_JTGS_PR_T%>'
<%
			}

			if(! ICD_JCAS_PR_T.equals("")) {
%>
		 		ICD_JCAS_PR='<%= ICD_JCAS_PR_T%>'
<%
			}

			if(! ICD_BSBS_RT_T.equals("")) {
%>
		 		ICD_BSBS_RT='<%= ICD_BSBS_RT_T%>'
<%
			}

			if(! ICD_BTGS_RT_T.equals("")) {
%>
		 		ICD_BTGS_RT='<%= ICD_BTGS_RT_T%>'
<%
			}

			if(! ICD_BCAS_RT_T.equals("")) {
%>
		 		ICD_BCAS_RT='<%= ICD_BCAS_RT_T%>'
<%
			}

			if(! ICD_JSBS_RT_T.equals("")) {
%>
		 		ICD_JSBS_RT='<%= ICD_JSBS_RT_T%>'
<%
			}

			if(! ICD_JTGS_RT_T.equals("")) {
%>
		 		ICD_JTGS_RT='<%= ICD_JTGS_RT_T%>'
<%
			}

			if(! ICD_JCAS_RT_T.equals("")) {
%>
		 		ICD_JCAS_RT='<%= ICD_JCAS_RT_T%>'
<%
			}

			if(! ICD_JBSBS_PR_T.equals("")) {
%>
		 		ICD_JBSBS_PR='<%= ICD_JBSBS_PR_T%>'
<%
			}

			if(! ICD_JBTGS_PR_T.equals("")) {
%>
		 		ICD_JBTGS_PR='<%= ICD_JBTGS_PR_T%>'
<%
			}

			if(! ICD_JBCAS_PR_T.equals("")) {
%>
		 		ICD_JBCAS_PR='<%= ICD_JBCAS_PR_T%>'
<%
			}

			if(! ICD_JJSBS_PR_T.equals("")) {
%>
		 		ICD_JJSBS_PR='<%= ICD_JJSBS_PR_T%>'
<%
			}

			if(! ICD_JJTGS_PR_T.equals("")) {
%>
		 		ICD_JJTGS_PR='<%= ICD_JJTGS_PR_T%>'
<%
			}

			if(! ICD_JJCAS_PR_T.equals("")) {
%>
		 		ICD_JJCAS_PR='<%= ICD_JJCAS_PR_T%>'
<%
			}

			if(! ICY_DISC_RT_T.equals("")) {
%>
		 		ICY_DISC_RT='<%= ICY_DISC_RT_T%>'
<%
			}

			if(! ICD_MATT_NM_T.equals("")) {
%>
		 		ICD_MATT_NM='<%= ICD_MATT_NM_T%>'
<%
			}

			if(! ICD_DSBS_PR_T.equals("")) {
%>
		 		ICD_DSBS_PR='<%= ICD_DSBS_PR_T%>'
<%
			}

			if(! ICD_DTGS_PR_T.equals("")) {
%>
		 		ICD_DTGS_PR='<%= ICD_DTGS_PR_T%>'
<%
			}

			if(! ICD_DCAS_PR_T.equals("")) {
%>
		 		ICD_DCAS_PR='<%= ICD_DCAS_PR_T%>'
<%
			}

			if(! ICD_DSBS_RT_T.equals("")) {
%>
		 		ICD_DSBS_RT='<%= ICD_DSBS_RT_T%>'
<%
			}

			if(! ICD_DTGS_RT_T.equals("")) {
%>
		 		ICD_DTGS_RT='<%= ICD_DTGS_RT_T%>'
<%
			}

			if(! ICD_DCAS_RT_T.equals("")) {
%>
		 		ICD_DCAS_RT='<%= ICD_DCAS_RT_T%>'
<%
			}

			if(! ICD_JDSBS_PR_T.equals("")) {
%>
		 		ICD_JDSBS_PR='<%= ICD_JDSBS_PR_T%>'
<%
			}

			if(! ICD_JDTGS_PR_T.equals("")) {
%>
		 		ICD_JDTGS_PR='<%= ICD_JDTGS_PR_T%>'
<%
			}

			if(! ICD_JDCAS_PR_T.equals("")) {
%>
		 		ICD_JDCAS_PR='<%= ICD_JDCAS_PR_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c61_T.equals("")) {
%>
		 		c61='<%= c61_T%>'
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
