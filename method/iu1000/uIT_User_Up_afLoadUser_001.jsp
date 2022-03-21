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

	ResultSetMetaData rsmd = null;
	int colCnt = 0;

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String ED_NAME = htMethod.get("ED_NAME");
		String ED_USERNO = htMethod.get("ED_USERNO");
		String RBNURSE = htMethod.get("RBNURSE");
		String RBDOCTOR = htMethod.get("RBDOCTOR");
		String DP_ENTERDT = htMethod.get("DP_ENTERDT");
		String CHK_RETIRE = htMethod.get("CHK_RETIRE");
		String G_PLACE_GUBUN = htMethod.get("G_PLACE_GUBUN");
		String SZSQL_ADD = htMethod.get("SZSQL_ADD");

		//
		if(ED_NAME == null) { ED_NAME = ""; }
		if(ED_USERNO == null) { ED_USERNO = ""; }
		if(RBNURSE == null) { RBNURSE = ""; }
		if(RBDOCTOR == null) { RBDOCTOR = ""; }
		if(DP_ENTERDT == null) { DP_ENTERDT = ""; }
		if(CHK_RETIRE == null) { CHK_RETIRE = ""; }
		if(G_PLACE_GUBUN == null) { G_PLACE_GUBUN = ""; }
		if(SZSQL_ADD == null) { SZSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();



		sql = " SELECT A.IAU_EMP_NO, A.IAU_PASS_WD, A.IAU_MANA_KD, (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE A.IAU_MANA_KD = CCN_SMALL";
		sql += " AND CCN_LARGE='0702' ) JUMINGBNM, A.IAU_PENL_ID, A.IAU_PENL_NM, A.IAU_DEPT_CD, A.IAU_LICEN1_KD, A.IAU_LICEN1_CD, A.IAU_LICEN1_NO, A.IAU_LICEN2_CD, A.IAU_LICEN2_NO, A.IAU_MOBL_NO, A.IAU_EMAI_AR, A.IAU_BIRH_DT, A.IAU_ENTR_DT, A.IAU_RETIR_DT, IAU_DEPT_CD, (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE A.IAU_DEPT_CD=CCN_SMALL";
		sql += " AND CCN_LARGE='0501' ) ICR_DIVINM, IAU_POSI_CD , (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE A.IAU_POSI_CD=CCN_SMALL";
		sql += " AND CCN_LARGE='0502' ) IAU_POSINM, (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE A.IAU_LICEN1_CD=CCN_SMALL";
		sql += " AND CCN_LARGE='0504' ) IAU_LICENNM1, (SELECT CCN_FULL_NM";
		sql += " FROM CT_COMMON";
		sql += " WHERE A.IAU_LICEN2_CD=CCN_SMALL";
		sql += " AND CCN_LARGE='0504' ) IAU_LICENNM2, CASE WHEN A.IAU_ACCP_KD='0' THEN '위임' ELSE '위임안함' END IAU_ACCPKD_NM, IAU_ACCP_KD , A.IAU_ACCP1_ID, (SELECT IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO=A.IAU_ACCP1_ID) IAU_ACCP1_NM, A.IAU_ACCP2_ID, (SELECT IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO=A.IAU_ACCP2_ID) IAU_ACCP2_NM, A.IAU_ADDR_KD, A.IAU_STOMA_DR, (SELECT IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO = A.IAU_STOMA_DR) IAU_STOMA_DRNM, A.IAU_COLON_DR, (SELECT IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO = A.IAU_COLON_DR) IAU_COLON_DRNM, A.IAU_LIVER_DR, (SELECT IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO = A.IAU_LIVER_DR) IAU_LIVER_DRNM, A.IAU_BAST_DR, (SELECT IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO = A.IAU_BAST_DR) IAU_BAST_DRNM, A.IAU_UTER_DR, (SELECT IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO = A.IAU_UTER_DR) IAU_UTER_DRNM, A.IAU_LUNG_DR, (SELECT IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO = A.IAU_LUNG_DR) IAU_LUNG_DRNM, A.IAU_CKUP_DR, (SELECT IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO = A.IAU_CKUP_DR) IAU_CKUP_DRNM, A.IAU_PATH_DR, (SELECT IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO = A.IAU_PATH_DR) IAU_PATH_DRNM, A.IAU_DECI_DR, (SELECT IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO = A.IAU_DECI_DR) IAU_DECI_DRNM, A.IAU_DPAN_DR, (SELECT IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO = A.IAU_DPAN_DR) IAU_DPAN_DRNM, A.IAU_COLL_DR, (SELECT IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE IAU_EMP_NO = A.IAU_COLL_DR) IAU_COLL_DRNM, A.IAU_ZIP_CD, A.IAU_ZIP_AR, A.IAU_ROAD_AR, A.IAU_MARY_DT, A.IAU_USER_TX, A.IAU_AUTH_GP, A.IAU_INPT_ID, A.IAU_INPT_DTT, A.IAU_MODI_ID, A.IAU_MODI_DTT, A.IAU_ENTR_ID, A.IAU_SEND_CD , A.IAU_PLCE_CD , A.IAU_DIVI_CD , RTRIM(RTRIM(A.IAU_ZIP_AR) || ' ' || RTRIM(A.IAU_ROAD_AR)) ADDR";
		sql += " FROM IT_AUTH_USER A";
		sql += " WHERE 0=0";

		if(!ED_NAME.equals("")) {
			sql += " AND IAU_PENL_NM LIKE '%'||'" + ED_NAME + "'||'%'";
		}

		if(!ED_USERNO.equals("")) {
			sql += " AND IAU_EMP_NO LIKE '" + ED_USERNO + "'||'%'";
		}

		if(RBNURSE.equals("Y")) {
			sql += " AND NVL(IAU_LICEN1_CD, '00') NOT IN ('11', '12')";
			sql += " AND NVL(IAU_LICEN2_CD, '00') NOT IN ('11', '12')";
		}
		else if(RBDOCTOR.equals("Y")) {
			sql += " AND (NVL(IAU_LICEN1_CD, '00') IN ('11', '12')";
			sql += " OR NVL(IAU_LICEN2_CD, '00') IN ('11', '12'))";
		}

		if(!DP_ENTERDT.equals("")) {
			sql += " AND IAU_ENTR_DT = '" + DP_ENTERDT + "'";
		}

		if(CHK_RETIRE.equals("Y")) {
			sql += " AND IAU_USE_YN = 'N'";
		}
		else {
			sql += " AND IAU_USE_YN = 'Y'";
		}

		if(G_PLACE_GUBUN.equals("1")) {
			sql += " AND IAU_ANOTHER_NO = '1'";
		}
		else if(G_PLACE_GUBUN.equals("2")) {
			sql += " AND IAU_ANOTHER_NO = '2'";
		}

		sql += SZSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_User_Up_afLoadUser_001 \n";
			G_INFO += "설명 : 사용자 정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ED_NAME : " + ED_NAME + " \n";
			G_INFO += " ED_USERNO : " + ED_USERNO + " \n";
			G_INFO += " RBNURSE : " + RBNURSE + " \n";
			G_INFO += " RBDOCTOR : " + RBDOCTOR + " \n";
			G_INFO += " DP_ENTERDT : " + DP_ENTERDT + " \n";
			G_INFO += " CHK_RETIRE : " + CHK_RETIRE + " \n";
			G_INFO += " G_PLACE_GUBUN : " + G_PLACE_GUBUN + " \n";
			G_INFO += " SZSQL_ADD : " + SZSQL_ADD + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		rsmd = rsList.getMetaData();  //Select 결과의 Metadata 가져오기.

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
		<s:AttributeType name='IAU_EMP_NO' rs:number='1' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_EMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PASS_WD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PASS_WD'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_MANA_KD' rs:number='3' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_MANA_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='JUMINGBNM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_ID' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='6' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DEPT_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_KD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_NO' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_MOBL_NO' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_EMAI_AR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EMAI_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_BIRH_DT' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ENTR_DT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ENTR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_RETIR_DT' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_RETIR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='c17' rs:name='IAU_DEPT_CD' rs:number='18' rs:nullable='true' rs:writeunknown='true'
			 rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_DIVINM' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_POSI_CD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_POSI_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_POSINM' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICENNM1' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICENNM2' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ACCPKD_NM' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ACCPKD_NM'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ACCP_KD' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ACCP1_ID' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ACCP1_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ACCP1_NM' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ACCP2_ID' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ACCP2_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ACCP2_NM' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ADDR_KD' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ADDR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_STOMA_DR' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_STOMA_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_STOMA_DRNM' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_COLON_DR' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_COLON_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_COLON_DRNM' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LIVER_DR' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LIVER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LIVER_DRNM' rs:number='36' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_BAST_DR' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_BAST_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_BAST_DRNM' rs:number='38' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_UTER_DR' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_UTER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_UTER_DRNM' rs:number='40' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LUNG_DR' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LUNG_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LUNG_DRNM' rs:number='42' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_CKUP_DR' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_CKUP_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_CKUP_DRNM' rs:number='44' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PATH_DR' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PATH_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PATH_DRNM' rs:number='46' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DECI_DR' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_DECI_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DECI_DRNM' rs:number='48' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DPAN_DR' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_DPAN_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DPAN_DRNM' rs:number='50' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_COLL_DR' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_COLL_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_COLL_DRNM' rs:number='52' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ZIP_CD' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ZIP_AR' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ROAD_AR' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_MARY_DT' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_MARY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_USER_TX' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_USER_TX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_AUTH_GP' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_AUTH_GP'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_INPT_ID' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_INPT_DTT' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_MODI_ID' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_MODI_DTT' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ENTR_ID' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ENTR_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_SEND_CD' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_SEND_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PLCE_CD' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DIVI_CD' rs:number='66' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_DIVI_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ADDR' rs:number='67' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='401'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='68' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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
			String IAU_EMP_NO_T = cRsList.getString("IAU_EMP_NO");
			String IAU_PASS_WD_T = cRsList.getString("IAU_PASS_WD");
			String IAU_MANA_KD_T = cRsList.getString("IAU_MANA_KD");
			String JUMINGBNM_T = cRsList.getString("JUMINGBNM");
			String IAU_PENL_ID_T = cRsList.getString("IAU_PENL_ID");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_DEPT_CD_T = cRsList.getString("IAU_DEPT_CD");
			String IAU_LICEN1_KD_T = cRsList.getString("IAU_LICEN1_KD");
			String IAU_LICEN1_CD_T = cRsList.getString("IAU_LICEN1_CD");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_LICEN2_CD_T = cRsList.getString("IAU_LICEN2_CD");
			String IAU_LICEN2_NO_T = cRsList.getString("IAU_LICEN2_NO");
			String IAU_MOBL_NO_T = cRsList.getString("IAU_MOBL_NO");
			String IAU_EMAI_AR_T = cRsList.getString("IAU_EMAI_AR");
			String IAU_BIRH_DT_T = cRsList.getString("IAU_BIRH_DT");
			String IAU_ENTR_DT_T = cRsList.getString("IAU_ENTR_DT");
			String IAU_RETIR_DT_T = cRsList.getString("IAU_RETIR_DT");
			String c17_T = cRsList.getString("c17");
			String ICR_DIVINM_T = cRsList.getString("ICR_DIVINM");
			String IAU_POSI_CD_T = cRsList.getString("IAU_POSI_CD");
			String IAU_POSINM_T = cRsList.getString("IAU_POSINM");
			String IAU_LICENNM1_T = cRsList.getString("IAU_LICENNM1");
			String IAU_LICENNM2_T = cRsList.getString("IAU_LICENNM2");
			String IAU_ACCPKD_NM_T = cRsList.getString("IAU_ACCPKD_NM");
			String IAU_ACCP_KD_T = cRsList.getString("IAU_ACCP_KD");
			String IAU_ACCP1_ID_T = cRsList.getString("IAU_ACCP1_ID");
			String IAU_ACCP1_NM_T = cRsList.getString("IAU_ACCP1_NM");
			String IAU_ACCP2_ID_T = cRsList.getString("IAU_ACCP2_ID");
			String IAU_ACCP2_NM_T = cRsList.getString("IAU_ACCP2_NM");
			String IAU_ADDR_KD_T = cRsList.getString("IAU_ADDR_KD");
			String IAU_STOMA_DR_T = cRsList.getString("IAU_STOMA_DR");
			String IAU_STOMA_DRNM_T = cRsList.getString("IAU_STOMA_DRNM");
			String IAU_COLON_DR_T = cRsList.getString("IAU_COLON_DR");
			String IAU_COLON_DRNM_T = cRsList.getString("IAU_COLON_DRNM");
			String IAU_LIVER_DR_T = cRsList.getString("IAU_LIVER_DR");
			String IAU_LIVER_DRNM_T = cRsList.getString("IAU_LIVER_DRNM");
			String IAU_BAST_DR_T = cRsList.getString("IAU_BAST_DR");
			String IAU_BAST_DRNM_T = cRsList.getString("IAU_BAST_DRNM");
			String IAU_UTER_DR_T = cRsList.getString("IAU_UTER_DR");
			String IAU_UTER_DRNM_T = cRsList.getString("IAU_UTER_DRNM");
			String IAU_LUNG_DR_T = cRsList.getString("IAU_LUNG_DR");
			String IAU_LUNG_DRNM_T = cRsList.getString("IAU_LUNG_DRNM");
			String IAU_CKUP_DR_T = cRsList.getString("IAU_CKUP_DR");
			String IAU_CKUP_DRNM_T = cRsList.getString("IAU_CKUP_DRNM");
			String IAU_PATH_DR_T = cRsList.getString("IAU_PATH_DR");
			String IAU_PATH_DRNM_T = cRsList.getString("IAU_PATH_DRNM");
			String IAU_DECI_DR_T = cRsList.getString("IAU_DECI_DR");
			String IAU_DECI_DRNM_T = cRsList.getString("IAU_DECI_DRNM");
			String IAU_DPAN_DR_T = cRsList.getString("IAU_DPAN_DR");
			String IAU_DPAN_DRNM_T = cRsList.getString("IAU_DPAN_DRNM");
			String IAU_COLL_DR_T = cRsList.getString("IAU_COLL_DR");
			String IAU_COLL_DRNM_T = cRsList.getString("IAU_COLL_DRNM");
			String IAU_ZIP_CD_T = cRsList.getString("IAU_ZIP_CD");
			String IAU_ZIP_AR_T = cRsList.getString("IAU_ZIP_AR");
			String IAU_ROAD_AR_T = cRsList.getString("IAU_ROAD_AR");
			String IAU_MARY_DT_T = cRsList.getString("IAU_MARY_DT");
			String IAU_USER_TX_T = cRsList.getString("IAU_USER_TX");
			String IAU_AUTH_GP_T = cRsList.getString("IAU_AUTH_GP");
			String IAU_INPT_ID_T = cRsList.getString("IAU_INPT_ID");
			String IAU_INPT_DTT_T = cRsList.getDate2("IAU_INPT_DTT");
			String IAU_MODI_ID_T = cRsList.getString("IAU_MODI_ID");
			String IAU_MODI_DTT_T = cRsList.getDate2("IAU_MODI_DTT");
			String IAU_ENTR_ID_T = cRsList.getString("IAU_ENTR_ID");
			String IAU_SEND_CD_T = cRsList.getString("IAU_SEND_CD");
			String IAU_PLCE_CD_T = cRsList.getString("IAU_PLCE_CD");
			String IAU_DIVI_CD_T = cRsList.getString("IAU_DIVI_CD");
			String ADDR_T = cRsList.getString("ADDR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IAU_EMP_NO_T.equals("")) {
%>
		 		IAU_EMP_NO='<%= IAU_EMP_NO_T%>'
<%
			}
			if(! IAU_PASS_WD_T.equals("")) {
%>
		 		IAU_PASS_WD='<%= IAU_PASS_WD_T%>'
<%
			}
			if(! IAU_MANA_KD_T.equals("")) {
%>
		 		IAU_MANA_KD='<%= IAU_MANA_KD_T%>'
<%
			}
			if(! JUMINGBNM_T.equals("")) {
%>
		 		JUMINGBNM='<%= JUMINGBNM_T%>'
<%
			}
			if(! IAU_PENL_ID_T.equals("")) {
%>
		 		IAU_PENL_ID='<%= IAU_PENL_ID_T%>'
<%
			}
			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}
			if(! IAU_DEPT_CD_T.equals("")) {
%>
		 		IAU_DEPT_CD='<%= IAU_DEPT_CD_T%>'
<%
			}
			if(! IAU_LICEN1_KD_T.equals("")) {
%>
		 		IAU_LICEN1_KD='<%= IAU_LICEN1_KD_T%>'
<%
			}
			if(! IAU_LICEN1_CD_T.equals("")) {
%>
		 		IAU_LICEN1_CD='<%= IAU_LICEN1_CD_T%>'
<%
			}
			if(! IAU_LICEN1_NO_T.equals("")) {
%>
		 		IAU_LICEN1_NO='<%= IAU_LICEN1_NO_T%>'
<%
			}
			if(! IAU_LICEN2_CD_T.equals("")) {
%>
		 		IAU_LICEN2_CD='<%= IAU_LICEN2_CD_T%>'
<%
			}
			if(! IAU_LICEN2_NO_T.equals("")) {
%>
		 		IAU_LICEN2_NO='<%= IAU_LICEN2_NO_T%>'
<%
			}
			if(! IAU_MOBL_NO_T.equals("")) {
%>
		 		IAU_MOBL_NO='<%= IAU_MOBL_NO_T%>'
<%
			}
			if(! IAU_EMAI_AR_T.equals("")) {
%>
		 		IAU_EMAI_AR='<%= IAU_EMAI_AR_T%>'
<%
			}
			if(! IAU_BIRH_DT_T.equals("")) {
%>
		 		IAU_BIRH_DT='<%= IAU_BIRH_DT_T%>'
<%
			}
			if(! IAU_ENTR_DT_T.equals("")) {
%>
		 		IAU_ENTR_DT='<%= IAU_ENTR_DT_T%>'
<%
			}
			if(! IAU_RETIR_DT_T.equals("")) {
%>
		 		IAU_RETIR_DT='<%= IAU_RETIR_DT_T%>'
<%
			}
			if(! c17_T.equals("")) {
%>
		 		c17='<%= c17_T%>'
<%
			}
			if(! ICR_DIVINM_T.equals("")) {
%>
		 		ICR_DIVINM='<%= ICR_DIVINM_T%>'
<%
			}
			if(! IAU_POSI_CD_T.equals("")) {
%>
		 		IAU_POSI_CD='<%= IAU_POSI_CD_T%>'
<%
			}
			if(! IAU_POSINM_T.equals("")) {
%>
		 		IAU_POSINM='<%= IAU_POSINM_T%>'
<%
			}
			if(! IAU_LICENNM1_T.equals("")) {
%>
		 		IAU_LICENNM1='<%= IAU_LICENNM1_T%>'
<%
			}
			if(! IAU_LICENNM2_T.equals("")) {
%>
		 		IAU_LICENNM2='<%= IAU_LICENNM2_T%>'
<%
			}
			if(! IAU_ACCPKD_NM_T.equals("")) {
%>
		 		IAU_ACCPKD_NM='<%= IAU_ACCPKD_NM_T%>'
<%
			}
			if(! IAU_ACCP_KD_T.equals("")) {
%>
		 		IAU_ACCP_KD='<%= IAU_ACCP_KD_T%>'
<%
			}
			if(! IAU_ACCP1_ID_T.equals("")) {
%>
		 		IAU_ACCP1_ID='<%= IAU_ACCP1_ID_T%>'
<%
			}
			if(! IAU_ACCP1_NM_T.equals("")) {
%>
		 		IAU_ACCP1_NM='<%= IAU_ACCP1_NM_T%>'
<%
			}
			if(! IAU_ACCP2_ID_T.equals("")) {
%>
		 		IAU_ACCP2_ID='<%= IAU_ACCP2_ID_T%>'
<%
			}
			if(! IAU_ACCP2_NM_T.equals("")) {
%>
		 		IAU_ACCP2_NM='<%= IAU_ACCP2_NM_T%>'
<%
			}
			if(! IAU_ADDR_KD_T.equals("")) {
%>
		 		IAU_ADDR_KD='<%= IAU_ADDR_KD_T%>'
<%
			}
			if(! IAU_STOMA_DR_T.equals("")) {
%>
		 		IAU_STOMA_DR='<%= IAU_STOMA_DR_T%>'
<%
			}
			if(! IAU_STOMA_DRNM_T.equals("")) {
%>
		 		IAU_STOMA_DRNM='<%= IAU_STOMA_DRNM_T%>'
<%
			}
			if(! IAU_COLON_DR_T.equals("")) {
%>
		 		IAU_COLON_DR='<%= IAU_COLON_DR_T%>'
<%
			}
			if(! IAU_COLON_DRNM_T.equals("")) {
%>
		 		IAU_COLON_DRNM='<%= IAU_COLON_DRNM_T%>'
<%
			}
			if(! IAU_LIVER_DR_T.equals("")) {
%>
		 		IAU_LIVER_DR='<%= IAU_LIVER_DR_T%>'
<%
			}
			if(! IAU_LIVER_DRNM_T.equals("")) {
%>
		 		IAU_LIVER_DRNM='<%= IAU_LIVER_DRNM_T%>'
<%
			}
			if(! IAU_BAST_DR_T.equals("")) {
%>
		 		IAU_BAST_DR='<%= IAU_BAST_DR_T%>'
<%
			}
			if(! IAU_BAST_DRNM_T.equals("")) {
%>
		 		IAU_BAST_DRNM='<%= IAU_BAST_DRNM_T%>'
<%
			}
			if(! IAU_UTER_DR_T.equals("")) {
%>
		 		IAU_UTER_DR='<%= IAU_UTER_DR_T%>'
<%
			}
			if(! IAU_UTER_DRNM_T.equals("")) {
%>
		 		IAU_UTER_DRNM='<%= IAU_UTER_DRNM_T%>'
<%
			}
			if(! IAU_LUNG_DR_T.equals("")) {
%>
		 		IAU_LUNG_DR='<%= IAU_LUNG_DR_T%>'
<%
			}
			if(! IAU_LUNG_DRNM_T.equals("")) {
%>
		 		IAU_LUNG_DRNM='<%= IAU_LUNG_DRNM_T%>'
<%
			}
			if(! IAU_CKUP_DR_T.equals("")) {
%>
		 		IAU_CKUP_DR='<%= IAU_CKUP_DR_T%>'
<%
			}
			if(! IAU_CKUP_DRNM_T.equals("")) {
%>
		 		IAU_CKUP_DRNM='<%= IAU_CKUP_DRNM_T%>'
<%
			}
			if(! IAU_PATH_DR_T.equals("")) {
%>
		 		IAU_PATH_DR='<%= IAU_PATH_DR_T%>'
<%
			}
			if(! IAU_PATH_DRNM_T.equals("")) {
%>
		 		IAU_PATH_DRNM='<%= IAU_PATH_DRNM_T%>'
<%
			}
			if(! IAU_DECI_DR_T.equals("")) {
%>
		 		IAU_DECI_DR='<%= IAU_DECI_DR_T%>'
<%
			}
			if(! IAU_DECI_DRNM_T.equals("")) {
%>
		 		IAU_DECI_DRNM='<%= IAU_DECI_DRNM_T%>'
<%
			}
			if(! IAU_DPAN_DR_T.equals("")) {
%>
		 		IAU_DPAN_DR='<%= IAU_DPAN_DR_T%>'
<%
			}
			if(! IAU_DPAN_DRNM_T.equals("")) {
%>
		 		IAU_DPAN_DRNM='<%= IAU_DPAN_DRNM_T%>'
<%
			}
			if(! IAU_COLL_DR_T.equals("")) {
%>
		 		IAU_COLL_DR='<%= IAU_COLL_DR_T%>'
<%
			}
			if(! IAU_COLL_DRNM_T.equals("")) {
%>
		 		IAU_COLL_DRNM='<%= IAU_COLL_DRNM_T%>'
<%
			}
			if(! IAU_ZIP_CD_T.equals("")) {
%>
		 		IAU_ZIP_CD='<%= IAU_ZIP_CD_T%>'
<%
			}
			if(! IAU_ZIP_AR_T.equals("")) {
%>
		 		IAU_ZIP_AR='<%= IAU_ZIP_AR_T%>'
<%
			}
			if(! IAU_ROAD_AR_T.equals("")) {
%>
		 		IAU_ROAD_AR='<%= IAU_ROAD_AR_T%>'
<%
			}
			if(! IAU_MARY_DT_T.equals("")) {
%>
		 		IAU_MARY_DT='<%= IAU_MARY_DT_T%>'
<%
			}
			if(! IAU_USER_TX_T.equals("")) {
%>
		 		IAU_USER_TX='<%= IAU_USER_TX_T%>'
<%
			}
			if(! IAU_AUTH_GP_T.equals("")) {
%>
		 		IAU_AUTH_GP='<%= IAU_AUTH_GP_T%>'
<%
			}
			if(! IAU_INPT_ID_T.equals("")) {
%>
		 		IAU_INPT_ID='<%= IAU_INPT_ID_T%>'
<%
			}
			if(! IAU_INPT_DTT_T.equals("")) {
%>
		 		IAU_INPT_DTT='<%= IAU_INPT_DTT_T%>'
<%
			}
			if(! IAU_MODI_ID_T.equals("")) {
%>
		 		IAU_MODI_ID='<%= IAU_MODI_ID_T%>'
<%
			}
			if(! IAU_MODI_DTT_T.equals("")) {
%>
		 		IAU_MODI_DTT='<%= IAU_MODI_DTT_T%>'
<%
			}
			if(! IAU_ENTR_ID_T.equals("")) {
%>
		 		IAU_ENTR_ID='<%= IAU_ENTR_ID_T%>'
<%
			}
			if(! IAU_SEND_CD_T.equals("")) {
%>
		 		IAU_SEND_CD='<%= IAU_SEND_CD_T%>'
<%
			}
			if(! IAU_PLCE_CD_T.equals("")) {
%>
		 		IAU_PLCE_CD='<%= IAU_PLCE_CD_T%>'
<%
			}
			if(! IAU_DIVI_CD_T.equals("")) {
%>
		 		IAU_DIVI_CD='<%= IAU_DIVI_CD_T%>'
<%
			}
			if(! ADDR_T.equals("")) {
%>
		 		ADDR='<%= ADDR_T%>'
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
