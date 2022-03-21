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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

select * from IT_AUTH_USER where ((IAU_LICEN1_CD in ('11','12')) or (IAU_LICEN2_CD in ('11','12'))) 
		*/

		sql = " SELECT *";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE ((IAU_LICEN1_CD IN ('11','12'))";
		sql += " OR (IAU_LICEN2_CD IN ('11','12')))";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uMain_DoctorList_001 \n";
			G_INFO += "설명 : 의사정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='IAU_EMP_NO' rs:number='1' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_EMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PASS_WD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PASS_WD'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_MANA_KD' rs:number='3' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_MANA_KD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='4' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_EPENL_NM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EPENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_ID' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PENL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DEPT_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_POSI_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_POSI_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_KD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_KD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_NO' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_MOBL_NO' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_EMAI_AR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EMAI_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_BIRH_DT' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ENTR_DT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ENTR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_RETIR_DT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_RETIR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ACCP_KD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ACCP_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ACCP1_ID' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ACCP1_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ACCP2_ID' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ACCP2_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ENTR_ID' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ENTR_ID'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_MARY_KD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_MARY_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_MARY_DT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_MARY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ADDR_KD' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ADDR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ZIP_CD' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ZIP_SQ' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ZIP_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ZIP_AR' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ZIP_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ROAD_AR' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ROAD_AR'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_USER_TX' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_USER_TX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_AUTH_GP' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_AUTH_GP'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_USE_YN' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_NUSE_ID' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_NUSE_DTT' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_INPT_ID' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_INPT_DTT' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_MODI_ID' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_MODI_DTT' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_CENTR_ID' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_CENTR_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_CENTR_DTT' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_CENTR_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_SIGN_IM' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_SIGN_IM'>
			<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_STOMA_DR' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_STOMA_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_COLON_DR' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_COLON_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LIVER_DR' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LIVER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_BAST_DR' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_BAST_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_UTER_DR' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_UTER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_EMPIMG' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_EMPIMG'>
			<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='ENCRYPTEDPASSWORD' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='ENCRYPTEDPASSWORD'>
			<s:datatype dt:type='string' dt:maxLength='1024'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ENCRYP_GB' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ENCRYP_GB'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PLCE_CD' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_SEND_CD' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_SEND_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DIVI_CD' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_DIVI_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LUNG_DR' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LUNG_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_CKUP_DR' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_CKUP_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PATH_DR' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PATH_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DECI_DR' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_DECI_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DPAN_DR' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_DPAN_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_COLL_DR' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_COLL_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_ANOTHER_NO' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_ANOTHER_NO'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='61' rs:rowid='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_EPENL_NM_T = cRsList.getString("IAU_EPENL_NM");
			String IAU_PENL_ID_T = cRsList.getString("IAU_PENL_ID");
			String IAU_DEPT_CD_T = cRsList.getString("IAU_DEPT_CD");
			String IAU_POSI_CD_T = cRsList.getString("IAU_POSI_CD");
			String IAU_LICEN1_KD_T = cRsList.getString("IAU_LICEN1_KD");
			String IAU_LICEN1_CD_T = cRsList.getString("IAU_LICEN1_CD");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_LICEN2_KD_T = cRsList.getString("IAU_LICEN2_KD");
			String IAU_LICEN2_CD_T = cRsList.getString("IAU_LICEN2_CD");
			String IAU_LICEN2_NO_T = cRsList.getString("IAU_LICEN2_NO");
			String IAU_MOBL_NO_T = cRsList.getString("IAU_MOBL_NO");
			String IAU_EMAI_AR_T = cRsList.getString("IAU_EMAI_AR");
			String IAU_BIRH_DT_T = cRsList.getString("IAU_BIRH_DT");
			String IAU_ENTR_DT_T = cRsList.getString("IAU_ENTR_DT");
			String IAU_RETIR_DT_T = cRsList.getString("IAU_RETIR_DT");
			String IAU_ACCP_KD_T = cRsList.getString("IAU_ACCP_KD");
			String IAU_ACCP1_ID_T = cRsList.getString("IAU_ACCP1_ID");
			String IAU_ACCP2_ID_T = cRsList.getString("IAU_ACCP2_ID");
			String IAU_ENTR_ID_T = cRsList.getString("IAU_ENTR_ID");
			String IAU_MARY_KD_T = cRsList.getString("IAU_MARY_KD");
			String IAU_MARY_DT_T = cRsList.getString("IAU_MARY_DT");
			String IAU_ADDR_KD_T = cRsList.getString("IAU_ADDR_KD");
			String IAU_ZIP_CD_T = cRsList.getString("IAU_ZIP_CD");
			String IAU_ZIP_SQ_T = cRsList.getString("IAU_ZIP_SQ");
			String IAU_ZIP_AR_T = cRsList.getString("IAU_ZIP_AR");
			String IAU_ROAD_AR_T = cRsList.getString("IAU_ROAD_AR");
			String IAU_USER_TX_T = cRsList.getString("IAU_USER_TX");
			String IAU_AUTH_GP_T = cRsList.getString("IAU_AUTH_GP");
			String IAU_USE_YN_T = cRsList.getString("IAU_USE_YN");
			String IAU_NUSE_ID_T = cRsList.getString("IAU_NUSE_ID");
			String IAU_NUSE_DTT_T = cRsList.getDate2("IAU_NUSE_DTT");
			String IAU_INPT_ID_T = cRsList.getString("IAU_INPT_ID");
			String IAU_INPT_DTT_T = cRsList.getDate2("IAU_INPT_DTT");
			String IAU_MODI_ID_T = cRsList.getString("IAU_MODI_ID");
			String IAU_MODI_DTT_T = cRsList.getDate2("IAU_MODI_DTT");
			String IAU_CENTR_ID_T = cRsList.getString("IAU_CENTR_ID");
			String IAU_CENTR_DTT_T = cRsList.getDate2("IAU_CENTR_DTT");
			String IAU_SIGN_IM_T = cRsList.getString("IAU_SIGN_IM");
			String IAU_STOMA_DR_T = cRsList.getString("IAU_STOMA_DR");
			String IAU_COLON_DR_T = cRsList.getString("IAU_COLON_DR");
			String IAU_LIVER_DR_T = cRsList.getString("IAU_LIVER_DR");
			String IAU_BAST_DR_T = cRsList.getString("IAU_BAST_DR");
			String IAU_UTER_DR_T = cRsList.getString("IAU_UTER_DR");
			String IAU_EMPIMG_T = cRsList.getString("IAU_EMPIMG");
			String ENCRYPTEDPASSWORD_T = cRsList.getString("ENCRYPTEDPASSWORD");
			String IAU_ENCRYP_GB_T = cRsList.getString("IAU_ENCRYP_GB");
			String IAU_PLCE_CD_T = cRsList.getString("IAU_PLCE_CD");
			String IAU_SEND_CD_T = cRsList.getString("IAU_SEND_CD");
			String IAU_DIVI_CD_T = cRsList.getString("IAU_DIVI_CD");
			String IAU_LUNG_DR_T = cRsList.getString("IAU_LUNG_DR");
			String IAU_CKUP_DR_T = cRsList.getString("IAU_CKUP_DR");
			String IAU_PATH_DR_T = cRsList.getString("IAU_PATH_DR");
			String IAU_DECI_DR_T = cRsList.getString("IAU_DECI_DR");
			String IAU_DPAN_DR_T = cRsList.getString("IAU_DPAN_DR");
			String IAU_COLL_DR_T = cRsList.getString("IAU_COLL_DR");
			String IAU_ANOTHER_NO_T = cRsList.getString("IAU_ANOTHER_NO");
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

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! IAU_EPENL_NM_T.equals("")) {
%>
		 		IAU_EPENL_NM='<%= IAU_EPENL_NM_T%>'
<%
			}

			if(! IAU_PENL_ID_T.equals("")) {
%>
		 		IAU_PENL_ID='<%= IAU_PENL_ID_T%>'
<%
			}

			if(! IAU_DEPT_CD_T.equals("")) {
%>
		 		IAU_DEPT_CD='<%= IAU_DEPT_CD_T%>'
<%
			}

			if(! IAU_POSI_CD_T.equals("")) {
%>
		 		IAU_POSI_CD='<%= IAU_POSI_CD_T%>'
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

			if(! IAU_LICEN2_KD_T.equals("")) {
%>
		 		IAU_LICEN2_KD='<%= IAU_LICEN2_KD_T%>'
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

			if(! IAU_ACCP2_ID_T.equals("")) {
%>
		 		IAU_ACCP2_ID='<%= IAU_ACCP2_ID_T%>'
<%
			}

			if(! IAU_ENTR_ID_T.equals("")) {
%>
		 		IAU_ENTR_ID='<%= IAU_ENTR_ID_T%>'
<%
			}

			if(! IAU_MARY_KD_T.equals("")) {
%>
		 		IAU_MARY_KD='<%= IAU_MARY_KD_T%>'
<%
			}

			if(! IAU_MARY_DT_T.equals("")) {
%>
		 		IAU_MARY_DT='<%= IAU_MARY_DT_T%>'
<%
			}

			if(! IAU_ADDR_KD_T.equals("")) {
%>
		 		IAU_ADDR_KD='<%= IAU_ADDR_KD_T%>'
<%
			}

			if(! IAU_ZIP_CD_T.equals("")) {
%>
		 		IAU_ZIP_CD='<%= IAU_ZIP_CD_T%>'
<%
			}

			if(! IAU_ZIP_SQ_T.equals("")) {
%>
		 		IAU_ZIP_SQ='<%= IAU_ZIP_SQ_T%>'
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

			if(! IAU_USE_YN_T.equals("")) {
%>
		 		IAU_USE_YN='<%= IAU_USE_YN_T%>'
<%
			}

			if(! IAU_NUSE_ID_T.equals("")) {
%>
		 		IAU_NUSE_ID='<%= IAU_NUSE_ID_T%>'
<%
			}

			if(! IAU_NUSE_DTT_T.equals("")) {
%>
		 		IAU_NUSE_DTT='<%= IAU_NUSE_DTT_T%>'
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

			if(! IAU_CENTR_ID_T.equals("")) {
%>
		 		IAU_CENTR_ID='<%= IAU_CENTR_ID_T%>'
<%
			}

			if(! IAU_CENTR_DTT_T.equals("")) {
%>
		 		IAU_CENTR_DTT='<%= IAU_CENTR_DTT_T%>'
<%
			}

			if(! IAU_SIGN_IM_T.equals("")) {
%>
		 		IAU_SIGN_IM='<%= IAU_SIGN_IM_T%>'
<%
			}

			if(! IAU_STOMA_DR_T.equals("")) {
%>
		 		IAU_STOMA_DR='<%= IAU_STOMA_DR_T%>'
<%
			}

			if(! IAU_COLON_DR_T.equals("")) {
%>
		 		IAU_COLON_DR='<%= IAU_COLON_DR_T%>'
<%
			}

			if(! IAU_LIVER_DR_T.equals("")) {
%>
		 		IAU_LIVER_DR='<%= IAU_LIVER_DR_T%>'
<%
			}

			if(! IAU_BAST_DR_T.equals("")) {
%>
		 		IAU_BAST_DR='<%= IAU_BAST_DR_T%>'
<%
			}

			if(! IAU_UTER_DR_T.equals("")) {
%>
		 		IAU_UTER_DR='<%= IAU_UTER_DR_T%>'
<%
			}

			if(! IAU_EMPIMG_T.equals("")) {
%>
		 		IAU_EMPIMG='<%= IAU_EMPIMG_T%>'
<%
			}

			if(! ENCRYPTEDPASSWORD_T.equals("")) {
%>
		 		ENCRYPTEDPASSWORD='<%= ENCRYPTEDPASSWORD_T%>'
<%
			}

			if(! IAU_ENCRYP_GB_T.equals("")) {
%>
		 		IAU_ENCRYP_GB='<%= IAU_ENCRYP_GB_T%>'
<%
			}

			if(! IAU_PLCE_CD_T.equals("")) {
%>
		 		IAU_PLCE_CD='<%= IAU_PLCE_CD_T%>'
<%
			}

			if(! IAU_SEND_CD_T.equals("")) {
%>
		 		IAU_SEND_CD='<%= IAU_SEND_CD_T%>'
<%
			}

			if(! IAU_DIVI_CD_T.equals("")) {
%>
		 		IAU_DIVI_CD='<%= IAU_DIVI_CD_T%>'
<%
			}

			if(! IAU_LUNG_DR_T.equals("")) {
%>
		 		IAU_LUNG_DR='<%= IAU_LUNG_DR_T%>'
<%
			}

			if(! IAU_CKUP_DR_T.equals("")) {
%>
		 		IAU_CKUP_DR='<%= IAU_CKUP_DR_T%>'
<%
			}

			if(! IAU_PATH_DR_T.equals("")) {
%>
		 		IAU_PATH_DR='<%= IAU_PATH_DR_T%>'
<%
			}

			if(! IAU_DECI_DR_T.equals("")) {
%>
		 		IAU_DECI_DR='<%= IAU_DECI_DR_T%>'
<%
			}

			if(! IAU_DPAN_DR_T.equals("")) {
%>
		 		IAU_DPAN_DR='<%= IAU_DPAN_DR_T%>'
<%
			}

			if(! IAU_COLL_DR_T.equals("")) {
%>
		 		IAU_COLL_DR='<%= IAU_COLL_DR_T%>'
<%
			}

			if(! IAU_ANOTHER_NO_T.equals("")) {
%>
		 		IAU_ANOTHER_NO='<%= IAU_ANOTHER_NO_T%>'
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
