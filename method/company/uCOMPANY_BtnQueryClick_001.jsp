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

		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 select GetCOMMON_LvCdToNm('0801',SUBSTR(ICY_COKD_CD,1,2),'1',2) ICY_COKD_NM1,
       GetCOMMON_LvCdToNm('0801',ICY_COKD_CD,'5',3) ICY_COKD_NM2,
       CASE WHEN ICY_COTK_CD  IS NULL OR ICY_COTK_CD  = '' THEN ICY_COTK_CD  else '[' || ICY_COTK_CD  || ']' || GetCOMMON_LvCdToNm('0802',ICY_COTK_CD,'5',1) END ICY_COTK_NM,
              CASE WHEN ICY_DEPT_CD  IS NULL OR ICY_DEPT_CD  = '' THEN ICY_DEPT_CD  else '[' || ICY_DEPT_CD  || ']' || GetCOMMON_LvCdToNm('0803',ICY_DEPT_CD,'5',1) END ICY_DEPT_NM,
              GetCOMMON_LvCdToNm('0805',ICY_TKGJ_CD,'5',5) ICY_TKGJ_NM,
       GetCOMMON_LvCdToNm('0806',ICY_TKJJ_CD,'5',5) ICY_TKJJ_NM,
              GetCOMMON_LvCdToNm('0822',ICY_LABO_CD,'5',4) ICY_LABO_NM,
       GetCOMMON_LvCdToNm('0812',ICY_JIDO_CD,'5',2) ICY_JIDO_NM,
              CASE WHEN ICY_ZIPKD_CD IS NULL OR ICY_ZIPKD_CD = '' THEN ICY_ZIPKD_CD else '[' || ICY_ZIPKD_CD || ']' || GetCOMMON_LvCdToNm('0706',ICY_ZIPKD_CD,'5',1) END ICY_ZIPKD_NM,
              CASE WHEN ICY_PYER_CD  IS NULL OR ICY_PYER_CD  = '' THEN ICY_PYER_CD  else '[' || ICY_PYER_CD  || ']' || GetCOMMON_LvCdToNm('0409',ICY_PYER_CD,'5',1) END ICY_PYER_NM,
              CASE WHEN ICY_CMPY_CD  IS NULL OR ICY_CMPY_CD  = '' THEN ICY_CMPY_CD  else '[' || ICY_CMPY_CD  || ']' || GetCOMMON_LvCdToNm('0913',ICY_CMPY_CD,'5',1) END ICY_CMPY_NM,
              CASE WHEN ICY_PRPY_CD  IS NULL OR ICY_PRPY_CD  = '' THEN ICY_PRPY_CD  else '[' || ICY_PRPY_CD  || ']' || GetCOMMON_LvCdToNm('0914',ICY_PRPY_CD,'5',1) END ICY_PRPY_NM,
              CASE WHEN ICY_TKCG_CD  IS NULL OR ICY_TKCG_CD  = '' THEN ICY_TKCG_CD  else '[' || ICY_TKCG_CD  || ']' || GetCOMMON_LvCdToNm('0804',ICY_TKCG_CD,'5',1) END ICY_TKCG_NM,
              CASE WHEN ICY_TKDE_CD  IS NULL OR ICY_TKDE_CD  = '' THEN ICY_TKDE_CD  else '[' || ICY_TKDE_CD  || ']' || GetCOMMON_LvCdToNm('0814',ICY_TKDE_CD,'5',1) END ICY_TKDE_NM,
              CASE WHEN ICY_CLAS_CD  IS NULL OR ICY_CLAS_CD  = '' THEN ICY_CLAS_CD  else '[' || ICY_CLAS_CD  || ']' || GetCOMMON_LvCdToNm('0809',ICY_CLAS_CD,'5',1) END ICY_CLAS_NM,
              CASE WHEN ICY_FAMI_CD  IS NULL OR ICY_FAMI_CD  = '' THEN ICY_FAMI_CD  else '[' || ICY_FAMI_CD  || ']' || GetCOMMON_LvCdToNm('0813',ICY_FAMI_CD,'5',1) END ICY_FAMI_NM,
              CASE WHEN ICY_TBAS_CD  IS NULL OR ICY_TBAS_CD  = '' THEN ICY_TBAS_CD  else '[' || ICY_TBAS_CD  || ']' || GetCOMMON_LvCdToNm('0815',ICY_TBAS_CD,'5',1) END ICY_TBAS_NM,
              CASE WHEN ICY_SALE_ID  IS NULL OR ICY_SALE_ID  = '' THEN ICY_SALE_ID  else '[' || ICY_SALE_ID  || ']' || GetSale_idToNm(ICY_SALE_ID) END ICY_SALE_NM,
              CASE WHEN ICY_SSUB_ID  IS NULL OR ICY_SSUB_ID  = '' THEN ICY_SSUB_ID  else '[' || ICY_SSUB_ID  || ']' || GetSale_idToNm(ICY_SSUB_ID) END ICY_SSUB_NM, A.*
FROM IT_COMPANY A
 WHERE 0 = 0

 || :sSQL_ADD                                               //조건절 추가

		*/

		sql = " SELECT GETCOMMON_LVCDTONM('0801',SUBSTR(ICY_COKD_CD,1,2),'1',2) ICY_COKD_NM1, GETCOMMON_LVCDTONM('0801',ICY_COKD_CD,'5',3) ICY_COKD_NM2";
		sql += ", CASE WHEN ICY_COTK_CD IS NULL OR ICY_COTK_CD = '' THEN ICY_COTK_CD ELSE '[' || ICY_COTK_CD || ']' || GETCOMMON_LVCDTONM('0802',ICY_COTK_CD,'5',1) END ICY_COTK_NM";
		sql += ", CASE WHEN ICY_DEPT_CD IS NULL OR ICY_DEPT_CD = '' THEN ICY_DEPT_CD ELSE '[' || ICY_DEPT_CD || ']' || GETCOMMON_LVCDTONM('0803',ICY_DEPT_CD,'5',1) END ICY_DEPT_NM";
		sql += ", GETCOMMON_LVCDTONM('0805',ICY_TKGJ_CD,'5',5) ICY_TKGJ_NM, GETCOMMON_LVCDTONM('0806',ICY_TKJJ_CD,'5',5) ICY_TKJJ_NM, GETCOMMON_LVCDTONM('0822',ICY_LABO_CD,'5',4) ICY_LABO_NM, GETCOMMON_LVCDTONM('0812',ICY_JIDO_CD,'5',2) ICY_JIDO_NM";
		sql += ", CASE WHEN ICY_ZIPKD_CD IS NULL OR ICY_ZIPKD_CD = '' THEN ICY_ZIPKD_CD ELSE '[' || ICY_ZIPKD_CD || ']' || GETCOMMON_LVCDTONM('0706',ICY_ZIPKD_CD,'5',1) END ICY_ZIPKD_NM";
		sql += ", CASE WHEN ICY_PYER_CD IS NULL OR ICY_PYER_CD = '' THEN ICY_PYER_CD ELSE '[' || ICY_PYER_CD || ']' || GETCOMMON_LVCDTONM('0409',ICY_PYER_CD,'5',1) END ICY_PYER_NM";
		sql += ", CASE WHEN ICY_CMPY_CD IS NULL OR ICY_CMPY_CD = '' THEN ICY_CMPY_CD ELSE '[' || ICY_CMPY_CD || ']' || GETCOMMON_LVCDTONM('0913',ICY_CMPY_CD,'5',1) END ICY_CMPY_NM";
		sql += ", CASE WHEN ICY_PRPY_CD IS NULL OR ICY_PRPY_CD = '' THEN ICY_PRPY_CD ELSE '[' || ICY_PRPY_CD || ']' || GETCOMMON_LVCDTONM('0914',ICY_PRPY_CD,'5',1) END ICY_PRPY_NM";
		sql += ", CASE WHEN ICY_TKCG_CD IS NULL OR ICY_TKCG_CD = '' THEN ICY_TKCG_CD ELSE '[' || ICY_TKCG_CD || ']' || GETCOMMON_LVCDTONM('0804',ICY_TKCG_CD,'5',1) END ICY_TKCG_NM";
		sql += ", CASE WHEN ICY_TKDE_CD IS NULL OR ICY_TKDE_CD = '' THEN ICY_TKDE_CD ELSE '[' || ICY_TKDE_CD || ']' || GETCOMMON_LVCDTONM('0814',ICY_TKDE_CD,'5',1) END ICY_TKDE_NM";
		sql += ", CASE WHEN ICY_CLAS_CD IS NULL OR ICY_CLAS_CD = '' THEN ICY_CLAS_CD ELSE '[' || ICY_CLAS_CD || ']' || GETCOMMON_LVCDTONM('0809',ICY_CLAS_CD,'5',1) END ICY_CLAS_NM";
		sql += ", CASE WHEN ICY_FAMI_CD IS NULL OR ICY_FAMI_CD = '' THEN ICY_FAMI_CD ELSE '[' || ICY_FAMI_CD || ']' || GETCOMMON_LVCDTONM('0813',ICY_FAMI_CD,'5',1) END ICY_FAMI_NM";
		sql += ", CASE WHEN ICY_TBAS_CD IS NULL OR ICY_TBAS_CD = '' THEN ICY_TBAS_CD ELSE '[' || ICY_TBAS_CD || ']' || GETCOMMON_LVCDTONM('0815',ICY_TBAS_CD,'5',1) END ICY_TBAS_NM";
		sql += ", CASE WHEN ICY_SALE_ID IS NULL OR ICY_SALE_ID = '' THEN ICY_SALE_ID ELSE '[' || ICY_SALE_ID || ']' || GETSALE_IDTONM(ICY_SALE_ID) END ICY_SALE_NM";
		sql += ", CASE WHEN ICY_SSUB_ID IS NULL OR ICY_SSUB_ID = '' THEN ICY_SSUB_ID ELSE '[' || ICY_SSUB_ID || ']' || GETSALE_IDTONM(ICY_SSUB_ID) END ICY_SSUB_NM";
		sql += ", A.*";
		sql += " FROM IT_COMPANY A";
		sql += " WHERE 0 = 0 ";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMPANY_BtnQueryClick_001 \n";
			G_INFO += "설명 : 사업장내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='ICY_COKD_NM1' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COKD_NM2' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COTK_NM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COTK_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_DEPT_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKGJ_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKJJ_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_LABO_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_JIDO_NM' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_ZIPKD_NM' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_ZIPKD_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_PYER_NM' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_PYER_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_CMPY_NM' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_CMPY_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_PRPY_NM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_PRPY_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKCG_NM' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TKCG_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKDE_NM' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TKDE_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_CLAS_NM' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_CLAS_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_FAMI_NM' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_FAMI_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TBAS_NM' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TBAS_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_SALE_NM' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_SALE_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_SSUB_NM' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_SSUB_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_CD' rs:number='20' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_APLY_DT' rs:number='21' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_APLY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NO' rs:number='22' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_SQ' rs:number='23' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COKD_CD' rs:number='24' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COKD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='25' rs:writeunknown='true' rs:basetable='IT_COMPANY' rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_INDO_NO' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_INDO_NO'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_INDD_NO' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_INDD_NO'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_INDD_SQ' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_INDD_SQ'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_CORE_NO' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_CORE_NO'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COTK_CD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COTK_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_SUTK_YN' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_SUTK_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_DEPT_CD' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKGJ_CD' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TKGJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKJJ_CD' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TKJJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_PRES_NM' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_PRES_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_LABO_CD' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_LABO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_JIDO_CD' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_JIDO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_ZIPKD_CD' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_ZIPKD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_ZIP_CD' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_ZIP_SQ' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_ZIP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_ZIP_AR' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_ROAD_AR' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_BLDG_NO' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_BLDG_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TEL_NO' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_FAX_NO' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_FAX_NO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_JMOB_NO' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_JMOB_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_JEMAIL' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_JEMAIL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_JTEL_NO' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_JTEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_J_NM' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_J_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TMOB_NO' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TMOB_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TEMAIL' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TEMAIL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TTEL_NO' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TTEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_T_NM' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_T_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_CBIR_DT' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_CBIR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_LUNR_KD' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_LUNR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_SALE_ID' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_SALE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_SSUB_ID' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_SSUB_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_PYER_CD' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_PYER_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_SPRT_RT' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_SPRT_RT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_SPRT_PR' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_SPRT_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_CMPY_CD' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_CMPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_PRPY_CD' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_PRPY_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKCG_CD' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TKCG_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKDE_CD' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TKDE_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TBAS_CD' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TBAS_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_DISC_RT' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_DISC_RT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_CLAS_CD' rs:number='67' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_CLAS_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_FAMI_CD' rs:number='68' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_FAMI_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_TX' rs:number='69' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_PAST_CD' rs:number='70' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_PAST_CD'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_STRT_YR' rs:number='71' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_STRT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_PROD_NM' rs:number='72' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_PROD_NM'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_SMPL_YN' rs:number='73' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_SMPL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_USE_YN' rs:number='74' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_NUSE_ID' rs:number='75' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_NUSE_DTT' rs:number='76' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_NUSE_TX' rs:number='77' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_NUSE_TX'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_INPT_ID' rs:number='78' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_INPT_DTT' rs:number='79' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_MODI_ID' rs:number='80' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_MODI_DTT' rs:number='81' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKGJ_YR' rs:number='82' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TKGJ_YR'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_OCS_CD' rs:number='83' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_OCS_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='84' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
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

			String ICY_COKD_NM1_T = cRsList.getString("ICY_COKD_NM1");
			String ICY_COKD_NM2_T = cRsList.getString("ICY_COKD_NM2");
			String ICY_COTK_NM_T = cRsList.getString("ICY_COTK_NM");
			String ICY_DEPT_NM_T = cRsList.getString("ICY_DEPT_NM");
			String ICY_TKGJ_NM_T = cRsList.getString("ICY_TKGJ_NM");
			String ICY_TKJJ_NM_T = cRsList.getString("ICY_TKJJ_NM");
			String ICY_LABO_NM_T = cRsList.getString("ICY_LABO_NM");
			String ICY_JIDO_NM_T = cRsList.getString("ICY_JIDO_NM");
			String ICY_ZIPKD_NM_T = cRsList.getString("ICY_ZIPKD_NM");
			String ICY_PYER_NM_T = cRsList.getString("ICY_PYER_NM");
			String ICY_CMPY_NM_T = cRsList.getString("ICY_CMPY_NM");
			String ICY_PRPY_NM_T = cRsList.getString("ICY_PRPY_NM");
			String ICY_TKCG_NM_T = cRsList.getString("ICY_TKCG_NM");
			String ICY_TKDE_NM_T = cRsList.getString("ICY_TKDE_NM");
			String ICY_CLAS_NM_T = cRsList.getString("ICY_CLAS_NM");
			String ICY_FAMI_NM_T = cRsList.getString("ICY_FAMI_NM");
			String ICY_TBAS_NM_T = cRsList.getString("ICY_TBAS_NM");
			String ICY_SALE_NM_T = cRsList.getString("ICY_SALE_NM");
			String ICY_SSUB_NM_T = cRsList.getString("ICY_SSUB_NM");
			String ICY_COMP_CD_T = cRsList.getString("ICY_COMP_CD");
			String ICY_APLY_DT_T = cRsList.getString("ICY_APLY_DT");
			String ICY_COMP_NO_T = cRsList.getString("ICY_COMP_NO");
			String ICY_COMP_SQ_T = cRsList.getString("ICY_COMP_SQ");
			String ICY_COKD_CD_T = cRsList.getString("ICY_COKD_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ICY_INDO_NO_T = cRsList.getString("ICY_INDO_NO");
			String ICY_INDD_NO_T = cRsList.getString("ICY_INDD_NO");
			String ICY_INDD_SQ_T = cRsList.getString("ICY_INDD_SQ");
			String ICY_CORE_NO_T = cRsList.getString("ICY_CORE_NO");
			String ICY_COTK_CD_T = cRsList.getString("ICY_COTK_CD");
			String ICY_SUTK_YN_T = cRsList.getString("ICY_SUTK_YN");
			String ICY_DEPT_CD_T = cRsList.getString("ICY_DEPT_CD");
			String ICY_TKGJ_CD_T = cRsList.getString("ICY_TKGJ_CD");
			String ICY_TKJJ_CD_T = cRsList.getString("ICY_TKJJ_CD");
			String ICY_PRES_NM_T = cRsList.getString("ICY_PRES_NM");
			String ICY_LABO_CD_T = cRsList.getString("ICY_LABO_CD");
			String ICY_JIDO_CD_T = cRsList.getString("ICY_JIDO_CD");
			String ICY_ZIPKD_CD_T = cRsList.getString("ICY_ZIPKD_CD");
			String ICY_ZIP_CD_T = cRsList.getString("ICY_ZIP_CD");
			String ICY_ZIP_SQ_T = cRsList.getString("ICY_ZIP_SQ");
			String ICY_ZIP_AR_T = cRsList.getString("ICY_ZIP_AR");
			String ICY_ROAD_AR_T = cRsList.getString("ICY_ROAD_AR");
			String ICY_BLDG_NO_T = cRsList.getString("ICY_BLDG_NO");
			String ICY_TEL_NO_T = cRsList.getString("ICY_TEL_NO");
			String ICY_FAX_NO_T = cRsList.getString("ICY_FAX_NO");
			String ICY_JMOB_NO_T = cRsList.getString("ICY_JMOB_NO");
			String ICY_JEMAIL_T = cRsList.getString("ICY_JEMAIL");
			String ICY_JTEL_NO_T = cRsList.getString("ICY_JTEL_NO");
			String ICY_J_NM_T = cRsList.getString("ICY_J_NM");
			String ICY_TMOB_NO_T = cRsList.getString("ICY_TMOB_NO");
			String ICY_TEMAIL_T = cRsList.getString("ICY_TEMAIL");
			String ICY_TTEL_NO_T = cRsList.getString("ICY_TTEL_NO");
			String ICY_T_NM_T = cRsList.getString("ICY_T_NM");
			String ICY_CBIR_DT_T = cRsList.getString("ICY_CBIR_DT");
			String ICY_LUNR_KD_T = cRsList.getString("ICY_LUNR_KD");
			String ICY_SALE_ID_T = cRsList.getString("ICY_SALE_ID");
			String ICY_SSUB_ID_T = cRsList.getString("ICY_SSUB_ID");
			String ICY_PYER_CD_T = cRsList.getString("ICY_PYER_CD");
			String ICY_SPRT_RT_T = cRsList.getString("ICY_SPRT_RT");
			String ICY_SPRT_PR_T = cRsList.getString("ICY_SPRT_PR");
			String ICY_CMPY_CD_T = cRsList.getString("ICY_CMPY_CD");
			String ICY_PRPY_CD_T = cRsList.getString("ICY_PRPY_CD");
			String ICY_TKCG_CD_T = cRsList.getString("ICY_TKCG_CD");
			String ICY_TKDE_CD_T = cRsList.getString("ICY_TKDE_CD");
			String ICY_TBAS_CD_T = cRsList.getString("ICY_TBAS_CD");
			String ICY_DISC_RT_T = cRsList.getString("ICY_DISC_RT");
			String ICY_CLAS_CD_T = cRsList.getString("ICY_CLAS_CD");
			String ICY_FAMI_CD_T = cRsList.getString("ICY_FAMI_CD");
			String ICY_COMP_TX_T = cRsList.getString("ICY_COMP_TX");
			String ICY_PAST_CD_T = cRsList.getString("ICY_PAST_CD");
			String ICY_STRT_YR_T = cRsList.getString("ICY_STRT_YR");
			String ICY_PROD_NM_T = cRsList.getString("ICY_PROD_NM");
			String ICY_SMPL_YN_T = cRsList.getString("ICY_SMPL_YN");
			String ICY_USE_YN_T = cRsList.getString("ICY_USE_YN");
			String ICY_NUSE_ID_T = cRsList.getString("ICY_NUSE_ID");
			String ICY_NUSE_DTT_T = cRsList.getDate2("ICY_NUSE_DTT");
			String ICY_NUSE_TX_T = cRsList.getString("ICY_NUSE_TX");
			String ICY_INPT_ID_T = cRsList.getString("ICY_INPT_ID");
			String ICY_INPT_DTT_T = cRsList.getDate2("ICY_INPT_DTT");
			String ICY_MODI_ID_T = cRsList.getString("ICY_MODI_ID");
			String ICY_MODI_DTT_T = cRsList.getDate2("ICY_MODI_DTT");
			String ICY_TKGJ_YR_T = cRsList.getString("ICY_TKGJ_YR");
			String ICY_OCS_CD_T = cRsList.getString("ICY_OCS_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ICY_COKD_NM1_T.equals("")) {
%>
		 		ICY_COKD_NM1='<%= ICY_COKD_NM1_T%>'
<%
			}

			if(! ICY_COKD_NM2_T.equals("")) {
%>
		 		ICY_COKD_NM2='<%= ICY_COKD_NM2_T%>'
<%
			}

			if(! ICY_COTK_NM_T.equals("")) {
%>
		 		ICY_COTK_NM='<%= ICY_COTK_NM_T%>'
<%
			}

			if(! ICY_DEPT_NM_T.equals("")) {
%>
		 		ICY_DEPT_NM='<%= ICY_DEPT_NM_T%>'
<%
			}

			if(! ICY_TKGJ_NM_T.equals("")) {
%>
		 		ICY_TKGJ_NM='<%= ICY_TKGJ_NM_T%>'
<%
			}

			if(! ICY_TKJJ_NM_T.equals("")) {
%>
		 		ICY_TKJJ_NM='<%= ICY_TKJJ_NM_T%>'
<%
			}

			if(! ICY_LABO_NM_T.equals("")) {
%>
		 		ICY_LABO_NM='<%= ICY_LABO_NM_T%>'
<%
			}

			if(! ICY_JIDO_NM_T.equals("")) {
%>
		 		ICY_JIDO_NM='<%= ICY_JIDO_NM_T%>'
<%
			}

			if(! ICY_ZIPKD_NM_T.equals("")) {
%>
		 		ICY_ZIPKD_NM='<%= ICY_ZIPKD_NM_T%>'
<%
			}

			if(! ICY_PYER_NM_T.equals("")) {
%>
		 		ICY_PYER_NM='<%= ICY_PYER_NM_T%>'
<%
			}

			if(! ICY_CMPY_NM_T.equals("")) {
%>
		 		ICY_CMPY_NM='<%= ICY_CMPY_NM_T%>'
<%
			}

			if(! ICY_PRPY_NM_T.equals("")) {
%>
		 		ICY_PRPY_NM='<%= ICY_PRPY_NM_T%>'
<%
			}

			if(! ICY_TKCG_NM_T.equals("")) {
%>
		 		ICY_TKCG_NM='<%= ICY_TKCG_NM_T%>'
<%
			}

			if(! ICY_TKDE_NM_T.equals("")) {
%>
		 		ICY_TKDE_NM='<%= ICY_TKDE_NM_T%>'
<%
			}

			if(! ICY_CLAS_NM_T.equals("")) {
%>
		 		ICY_CLAS_NM='<%= ICY_CLAS_NM_T%>'
<%
			}

			if(! ICY_FAMI_NM_T.equals("")) {
%>
		 		ICY_FAMI_NM='<%= ICY_FAMI_NM_T%>'
<%
			}

			if(! ICY_TBAS_NM_T.equals("")) {
%>
		 		ICY_TBAS_NM='<%= ICY_TBAS_NM_T%>'
<%
			}

			if(! ICY_SALE_NM_T.equals("")) {
%>
		 		ICY_SALE_NM='<%= ICY_SALE_NM_T%>'
<%
			}

			if(! ICY_SSUB_NM_T.equals("")) {
%>
		 		ICY_SSUB_NM='<%= ICY_SSUB_NM_T%>'
<%
			}

			if(! ICY_COMP_CD_T.equals("")) {
%>
		 		ICY_COMP_CD='<%= ICY_COMP_CD_T%>'
<%
			}

			if(! ICY_APLY_DT_T.equals("")) {
%>
		 		ICY_APLY_DT='<%= ICY_APLY_DT_T%>'
<%
			}

			if(! ICY_COMP_NO_T.equals("")) {
%>
		 		ICY_COMP_NO='<%= ICY_COMP_NO_T%>'
<%
			}

			if(! ICY_COMP_SQ_T.equals("")) {
%>
		 		ICY_COMP_SQ='<%= ICY_COMP_SQ_T%>'
<%
			}

			if(! ICY_COKD_CD_T.equals("")) {
%>
		 		ICY_COKD_CD='<%= ICY_COKD_CD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! ICY_INDO_NO_T.equals("")) {
%>
		 		ICY_INDO_NO='<%= ICY_INDO_NO_T%>'
<%
			}

			if(! ICY_INDD_NO_T.equals("")) {
%>
		 		ICY_INDD_NO='<%= ICY_INDD_NO_T%>'
<%
			}

			if(! ICY_INDD_SQ_T.equals("")) {
%>
		 		ICY_INDD_SQ='<%= ICY_INDD_SQ_T%>'
<%
			}

			if(! ICY_CORE_NO_T.equals("")) {
%>
		 		ICY_CORE_NO='<%= ICY_CORE_NO_T%>'
<%
			}

			if(! ICY_COTK_CD_T.equals("")) {
%>
		 		ICY_COTK_CD='<%= ICY_COTK_CD_T%>'
<%
			}

			if(! ICY_SUTK_YN_T.equals("")) {
%>
		 		ICY_SUTK_YN='<%= ICY_SUTK_YN_T%>'
<%
			}

			if(! ICY_DEPT_CD_T.equals("")) {
%>
		 		ICY_DEPT_CD='<%= ICY_DEPT_CD_T%>'
<%
			}

			if(! ICY_TKGJ_CD_T.equals("")) {
%>
		 		ICY_TKGJ_CD='<%= ICY_TKGJ_CD_T%>'
<%
			}

			if(! ICY_TKJJ_CD_T.equals("")) {
%>
		 		ICY_TKJJ_CD='<%= ICY_TKJJ_CD_T%>'
<%
			}

			if(! ICY_PRES_NM_T.equals("")) {
%>
		 		ICY_PRES_NM='<%= ICY_PRES_NM_T%>'
<%
			}

			if(! ICY_LABO_CD_T.equals("")) {
%>
		 		ICY_LABO_CD='<%= ICY_LABO_CD_T%>'
<%
			}

			if(! ICY_JIDO_CD_T.equals("")) {
%>
		 		ICY_JIDO_CD='<%= ICY_JIDO_CD_T%>'
<%
			}

			if(! ICY_ZIPKD_CD_T.equals("")) {
%>
		 		ICY_ZIPKD_CD='<%= ICY_ZIPKD_CD_T%>'
<%
			}

			if(! ICY_ZIP_CD_T.equals("")) {
%>
		 		ICY_ZIP_CD='<%= ICY_ZIP_CD_T%>'
<%
			}

			if(! ICY_ZIP_SQ_T.equals("")) {
%>
		 		ICY_ZIP_SQ='<%= ICY_ZIP_SQ_T%>'
<%
			}

			if(! ICY_ZIP_AR_T.equals("")) {
%>
		 		ICY_ZIP_AR='<%= ICY_ZIP_AR_T%>'
<%
			}

			if(! ICY_ROAD_AR_T.equals("")) {
%>
		 		ICY_ROAD_AR='<%= ICY_ROAD_AR_T%>'
<%
			}

			if(! ICY_BLDG_NO_T.equals("")) {
%>
		 		ICY_BLDG_NO='<%= ICY_BLDG_NO_T%>'
<%
			}

			if(! ICY_TEL_NO_T.equals("")) {
%>
		 		ICY_TEL_NO='<%= ICY_TEL_NO_T%>'
<%
			}

			if(! ICY_FAX_NO_T.equals("")) {
%>
		 		ICY_FAX_NO='<%= ICY_FAX_NO_T%>'
<%
			}

			if(! ICY_JMOB_NO_T.equals("")) {
%>
		 		ICY_JMOB_NO='<%= ICY_JMOB_NO_T%>'
<%
			}

			if(! ICY_JEMAIL_T.equals("")) {
%>
		 		ICY_JEMAIL='<%= ICY_JEMAIL_T%>'
<%
			}

			if(! ICY_JTEL_NO_T.equals("")) {
%>
		 		ICY_JTEL_NO='<%= ICY_JTEL_NO_T%>'
<%
			}

			if(! ICY_J_NM_T.equals("")) {
%>
		 		ICY_J_NM='<%= ICY_J_NM_T%>'
<%
			}

			if(! ICY_TMOB_NO_T.equals("")) {
%>
		 		ICY_TMOB_NO='<%= ICY_TMOB_NO_T%>'
<%
			}

			if(! ICY_TEMAIL_T.equals("")) {
%>
		 		ICY_TEMAIL='<%= ICY_TEMAIL_T%>'
<%
			}

			if(! ICY_TTEL_NO_T.equals("")) {
%>
		 		ICY_TTEL_NO='<%= ICY_TTEL_NO_T%>'
<%
			}

			if(! ICY_T_NM_T.equals("")) {
%>
		 		ICY_T_NM='<%= ICY_T_NM_T%>'
<%
			}

			if(! ICY_CBIR_DT_T.equals("")) {
%>
		 		ICY_CBIR_DT='<%= ICY_CBIR_DT_T%>'
<%
			}

			if(! ICY_LUNR_KD_T.equals("")) {
%>
		 		ICY_LUNR_KD='<%= ICY_LUNR_KD_T%>'
<%
			}

			if(! ICY_SALE_ID_T.equals("")) {
%>
		 		ICY_SALE_ID='<%= ICY_SALE_ID_T%>'
<%
			}

			if(! ICY_SSUB_ID_T.equals("")) {
%>
		 		ICY_SSUB_ID='<%= ICY_SSUB_ID_T%>'
<%
			}

			if(! ICY_PYER_CD_T.equals("")) {
%>
		 		ICY_PYER_CD='<%= ICY_PYER_CD_T%>'
<%
			}

			if(! ICY_SPRT_RT_T.equals("")) {
%>
		 		ICY_SPRT_RT='<%= ICY_SPRT_RT_T%>'
<%
			}

			if(! ICY_SPRT_PR_T.equals("")) {
%>
		 		ICY_SPRT_PR='<%= ICY_SPRT_PR_T%>'
<%
			}

			if(! ICY_CMPY_CD_T.equals("")) {
%>
		 		ICY_CMPY_CD='<%= ICY_CMPY_CD_T%>'
<%
			}

			if(! ICY_PRPY_CD_T.equals("")) {
%>
		 		ICY_PRPY_CD='<%= ICY_PRPY_CD_T%>'
<%
			}

			if(! ICY_TKCG_CD_T.equals("")) {
%>
		 		ICY_TKCG_CD='<%= ICY_TKCG_CD_T%>'
<%
			}

			if(! ICY_TKDE_CD_T.equals("")) {
%>
		 		ICY_TKDE_CD='<%= ICY_TKDE_CD_T%>'
<%
			}

			if(! ICY_TBAS_CD_T.equals("")) {
%>
		 		ICY_TBAS_CD='<%= ICY_TBAS_CD_T%>'
<%
			}

			if(! ICY_DISC_RT_T.equals("")) {
%>
		 		ICY_DISC_RT='<%= ICY_DISC_RT_T%>'
<%
			}

			if(! ICY_CLAS_CD_T.equals("")) {
%>
		 		ICY_CLAS_CD='<%= ICY_CLAS_CD_T%>'
<%
			}

			if(! ICY_FAMI_CD_T.equals("")) {
%>
		 		ICY_FAMI_CD='<%= ICY_FAMI_CD_T%>'
<%
			}

			if(! ICY_COMP_TX_T.equals("")) {
%>
		 		ICY_COMP_TX='<%= ICY_COMP_TX_T%>'
<%
			}

			if(! ICY_PAST_CD_T.equals("")) {
%>
		 		ICY_PAST_CD='<%= ICY_PAST_CD_T%>'
<%
			}

			if(! ICY_STRT_YR_T.equals("")) {
%>
		 		ICY_STRT_YR='<%= ICY_STRT_YR_T%>'
<%
			}

			if(! ICY_PROD_NM_T.equals("")) {
%>
		 		ICY_PROD_NM='<%= ICY_PROD_NM_T%>'
<%
			}

			if(! ICY_SMPL_YN_T.equals("")) {
%>
		 		ICY_SMPL_YN='<%= ICY_SMPL_YN_T%>'
<%
			}

			if(! ICY_USE_YN_T.equals("")) {
%>
		 		ICY_USE_YN='<%= ICY_USE_YN_T%>'
<%
			}

			if(! ICY_NUSE_ID_T.equals("")) {
%>
		 		ICY_NUSE_ID='<%= ICY_NUSE_ID_T%>'
<%
			}

			if(! ICY_NUSE_DTT_T.equals("")) {
%>
		 		ICY_NUSE_DTT='<%= ICY_NUSE_DTT_T%>'
<%
			}

			if(! ICY_NUSE_TX_T.equals("")) {
%>
		 		ICY_NUSE_TX='<%= ICY_NUSE_TX_T%>'
<%
			}

			if(! ICY_INPT_ID_T.equals("")) {
%>
		 		ICY_INPT_ID='<%= ICY_INPT_ID_T%>'
<%
			}

			if(! ICY_INPT_DTT_T.equals("")) {
%>
		 		ICY_INPT_DTT='<%= ICY_INPT_DTT_T%>'
<%
			}

			if(! ICY_MODI_ID_T.equals("")) {
%>
		 		ICY_MODI_ID='<%= ICY_MODI_ID_T%>'
<%
			}

			if(! ICY_MODI_DTT_T.equals("")) {
%>
		 		ICY_MODI_DTT='<%= ICY_MODI_DTT_T%>'
<%
			}

			if(! ICY_TKGJ_YR_T.equals("")) {
%>
		 		ICY_TKGJ_YR='<%= ICY_TKGJ_YR_T%>'
<%
			}

			if(! ICY_OCS_CD_T.equals("")) {
%>
		 		ICY_OCS_CD='<%= ICY_OCS_CD_T%>'
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
