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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IHL_HOSP_NO, IHL_HOSP_NM, IHL_BUSI_NO, IHL_BUCO_NO, IHL_BUCA_NO, IHL_PRES_NM, IHL_ZIP_CD, IHL_ZIP_AR, IHL_ROAD_AR,
       IHL_ASSO_NO, IHL_ASSO_NM, IHL_STAN_CD, IHL_HECK_CD, IHL_SYCK_CD, IHL_SUCK_CD, IHL_EOCK_CD, IHL_EBCK_CD, IHL_SACK_CD,
       IHL_GUCK_CD, IHL_HYCK_CD, IHL_SPCK_CD, IHL_MACK_CD, IHL_BLCK_CD, IHL_SECK_CD, IHL_BUSI_CD, IHL_CHAR_YN, IHL_SUBO_CD,
       IHL_JTEL_NO, IHL_GTEL_NO, IHL_STEL_NO, IHL_DOSI_NO, IHL_ACNU1_NO, IHL_ACNU2_NO, IHL_ACNU3_NO, IHL_CXRY_CD,
       IHL_NXRY_CD, IHL_INPT_ID, IHL_INPT_DTT, IHL_MODI_ID, IHL_MODI_DTT, IHL_HCAR_CD, IHL_HBSAG_KD, IHL_HBS_KD, IHL_XRAY_KD, IHL_EGRF_KD,
       IHL_BONE_KD, IHL_UGI_KD, IHL_BOENT_KD, IHL_ENEMA_KD, IHL_EIA_KD, IHL_HCVAB_KD, IHL_AFTP_KD, IHL_MMGP_KD, IHL_STDAG_NO, IHL_STDAB_NO,
       IHL_ACPT_KD, IHL_ORAL_KD, IHL_ATCNR_KD, IHL_BLOODCK_KD, IHL_ENCRT_KD, IHL_BOENT_AGN, IHL_SIDO_CD, IHL_PRCARE_EMAT,
       IHL_DOWN_URL, IHL_SIGN_YN, IHL_SBPR_CD, IHL_MGPR_KD, IHL_COMPORT, IHL_TELSPD, IHL_VAN_NM, IHL_DANNO, IHL_TRUNC_KD, IHL_RECE_KD,
       IHL_OCS_KD, IHL_DBUPDATE, IHL_MUUPDATE, IHL_HIV_KD, IHL_SVP_KD, IHL_HEPA_NO, IHL_HIV_NO, IHL_SVP_NO, IHL_ATCF_YN,
       IHL_QSTN_KD, IHL_OCSAUTO_KD, IHL_FOCP_KD, IHL_LAST_CD, IHL_GUSE_YN, IHL_SUSE_YN, IHL_CUSE_YN, IHL_JUSE_YN, IHL_STUSE_YN, IHL_SOUSE_YN,
       IHL_SPUSE_YN, IHL_HOSP_NM2, IHL_HOSP_NO2, IHL_DTTEL_NO, IHL_ZIP_CD2, IHL_ZIP_AR2, IHL_ROAD_AR2,
       IHL_SPNIGHT_LDL, IHL_SPNIGHT_LDL1, IHL_DIS1_PO, IHL_HOSP_CD, IHL_DRUG_KD,
       IHL_LOGO_IM, IHL_HOSP_IMG, IHL_HOSP_IMG2, IHL_AUTO_CD,
       (select ccn_full_nm from CT_COMMON where A.ihl_buco_no= ccn_small and ccn_large=''0806'') buconm,
       (select ccn_full_nm from CT_COMMON where A.ihl_buca_no= ccn_small and ccn_large=''0805'') bucanm
  FROM it_hospital A

		*/

		sql = " SELECT IHL_HOSP_NO, IHL_HOSP_NM, IHL_BUSI_NO, IHL_BUCO_NO, IHL_BUCA_NO, IHL_PRES_NM, IHL_ZIP_CD, IHL_ZIP_AR, IHL_ROAD_AR, IHL_ASSO_NO, IHL_ASSO_NM, IHL_STAN_CD, IHL_HECK_CD, IHL_SYCK_CD, IHL_SUCK_CD, IHL_EOCK_CD, IHL_EBCK_CD, IHL_SACK_CD, IHL_GUCK_CD, IHL_HYCK_CD, IHL_SPCK_CD, IHL_MACK_CD, IHL_BLCK_CD, IHL_SECK_CD, IHL_BUSI_CD, IHL_CHAR_YN, IHL_SUBO_CD, IHL_JTEL_NO, IHL_GTEL_NO, IHL_STEL_NO, IHL_DOSI_NO, IHL_ACNU1_NO, IHL_ACNU2_NO, IHL_ACNU3_NO, IHL_CXRY_CD, IHL_NXRY_CD, IHL_INPT_ID, IHL_INPT_DTT, IHL_MODI_ID, IHL_MODI_DTT, IHL_HCAR_CD, IHL_HBSAG_KD, IHL_HBS_KD, IHL_XRAY_KD, IHL_EGRF_KD, IHL_BONE_KD, IHL_UGI_KD, IHL_BOENT_KD, IHL_ENEMA_KD, IHL_EIA_KD, IHL_HCVAB_KD, IHL_AFTP_KD, IHL_MMGP_KD, IHL_STDAG_NO, IHL_STDAB_NO, IHL_ACPT_KD, IHL_ORAL_KD, IHL_ATCNR_KD, IHL_BLOODCK_KD, IHL_ENCRT_KD, IHL_BOENT_AGN, IHL_SIDO_CD, IHL_PRCARE_EMAT, IHL_DOWN_URL, IHL_SIGN_YN, IHL_SBPR_CD, IHL_MGPR_KD, IHL_COMPORT, IHL_TELSPD, IHL_VAN_NM, IHL_DANNO, IHL_TRUNC_KD, IHL_RECE_KD, IHL_OCS_KD, IHL_DBUPDATE, IHL_MUUPDATE, IHL_HIV_KD, IHL_SVP_KD, IHL_HEPA_NO, IHL_HIV_NO, IHL_SVP_NO, IHL_ATCF_YN, IHL_QSTN_KD, IHL_OCSAUTO_KD, IHL_FOCP_KD, IHL_LAST_CD, IHL_GUSE_YN, IHL_SUSE_YN, IHL_CUSE_YN, IHL_JUSE_YN, IHL_STUSE_YN, IHL_SOUSE_YN, IHL_SPUSE_YN, IHL_HOSP_NM2, IHL_HOSP_NO2, IHL_DTTEL_NO, IHL_ZIP_CD2, IHL_ZIP_AR2, IHL_ROAD_AR2, IHL_SPNIGHT_LDL, IHL_SPNIGHT_LDL1, IHL_DIS1_PO, IHL_HOSP_CD, IHL_DRUG_KD, IHL_LOGO_IM, IHL_HOSP_IMG, IHL_HOSP_IMG2, IHL_AUTO_CD, IHL_NETDOWN_PATH";
		sql += ", (";
		sql += "	SELECT ccn_full_nm";
		sql += "	FROM CT_COMMON";
		sql += "	WHERE A.ihl_buco_no= ccn_small";
		sql += "	AND ccn_large='0806'";
		sql += ") buconm";
		sql += ", (";
		sql += "	SELECT ccn_full_nm";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE A.ihl_buca_no= ccn_small";
		sql += " 	AND ccn_large='0805'";
		sql += ") bucanm";
		sql += " FROM it_hospital A";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_Hospital_FormShow_001 \n";
			G_INFO += "설명 : 병원정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
<%
		for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
			String dataType = "string";
			String maxLength = "4000";

			if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
				dataType = "bin.hex";
				maxLength = "2147483647";
				//<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
			} else if (rsmd.getColumnTypeName(colCnt).equals("CLOB")){
				maxLength = "1073741823";
				//<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
			}
%>
		<s:AttributeType name='<%= rsmd.getColumnName(colCnt)%>' rs:number='<%= Integer.toString(colCnt)%>' rs:writeunknown='true' rs:basetable='DUAL' rs:basecolumn='<%= rsmd.getColumnName(colCnt)%>'>
			<s:datatype dt:type='<%= dataType%>' dt:maxLength='<%= maxLength%>' <% if (! maxLength.equals("4000")) { %> rs:long='true' <% } %>/>
		</s:AttributeType>
<%
		}
%>
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
				String tempData = cRsList.getString(rsmd.getColumnName(colCnt));
				if(! tempData.equals("")) {
%>
		 			<%= rsmd.getColumnName(colCnt)%>='<%= tempData%>'
<%
				}
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
<<<<<<< HEAD
=======

>>>>>>> 971182ec1481e3bd4a70526cc60d0164939d2b34
