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

		String GUSER = htMethod.get("GUSER");
		String HOS_SPNEWAUTOPAN_YN = htMethod.get("HOS_SPNEWAUTOPAN_YN");
		String G_HOSP_NO = htMethod.get("G_HOSP_NO");
		String HOS_SMS_YN = htMethod.get("HOS_SMS_YN");
		String HOS_SP_YN = htMethod.get("HOS_SP_YN");
		String HOS_SPN_YN = htMethod.get("HOS_SPN_YN");
		String HOS_STDT_YN = htMethod.get("HOS_STDT_YN");
		String HOS_STDTO_YN = htMethod.get("HOS_STDTO_YN");
		String HOS_FILE_YN = htMethod.get("HOS_FILE_YN");
		String HOS_REPO_YN = htMethod.get("HOS_REPO_YN");
		String HOS_EMAIL_YN = htMethod.get("HOS_EMAIL_YN");
		String HOS_SPJ_YN = htMethod.get("HOS_SPJ_YN");

		//
		if(GUSER == null) { GUSER = ""; }
		if(HOS_SPNEWAUTOPAN_YN == null) { HOS_SPNEWAUTOPAN_YN = ""; }
		if(G_HOSP_NO == null) { G_HOSP_NO = ""; }
		if(HOS_SMS_YN == null) { HOS_SMS_YN = ""; }
		if(HOS_SP_YN == null) { HOS_SP_YN = ""; }
		if(HOS_SPN_YN == null) { HOS_SPN_YN = ""; }
		if(HOS_STDT_YN == null) { HOS_STDT_YN = ""; }
		if(HOS_STDTO_YN == null) { HOS_STDTO_YN = ""; }
		if(HOS_FILE_YN == null) { HOS_FILE_YN = ""; }
		if(HOS_REPO_YN == null) { HOS_REPO_YN = ""; }
		if(HOS_EMAIL_YN == null) { HOS_EMAIL_YN = ""; }
		if(HOS_SPJ_YN == null) { HOS_SPJ_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT IAP_PRGM_ID,IAP_PRGM_NM,IAP_MENU_ID,IAP_LIBR_NM";
		sql += " FROM IT_AUTH_PRGM";
		sql += " WHERE IAP_MENU_RU <> 0";
		sql += " AND iap_use_yn = 'Y'";


		if(GUSER != null && ! GUSER.equals("admin")) {

			sql += " AND IAP_PRGM_ID <> 'PM0001'";
			sql += " AND IAP_PRGM_ID <> 'PM0003'";
			sql += " AND IAP_PRGM_ID <> 'PGG313'";
			sql += " AND IAP_PRGM_ID <> 'PGF114'";
			sql += " AND IAP_PRGM_ID <> 'PGF115'";
			sql += " AND IAP_PRGM_ID <> 'PGF117'";

			if(HOS_SPNEWAUTOPAN_YN != null && ! HOS_SPNEWAUTOPAN_YN.equals("Y")) {
				sql += " AND IAP_PRGM_ID <> 'PGG314'";
			}
		}

		if(G_HOSP_NO != null && ! G_HOSP_NO.equals("38100487")) {
			sql += " AND IAP_PARE_ID <> '97'";
			sql += " AND IAP_PRGM_ID <> 'PG8214'";
		}

		if(G_HOSP_NO != null && ! G_HOSP_NO.equals("36333506") && ! G_HOSP_NO.equals("36343285")) {

			if(HOS_SMS_YN != null && HOS_SMS_YN.equals("N")) {

				sql += " AND IAP_PRGM_ID <> 'PGI120'";
				sql += " AND IAP_PRGM_ID <> 'PGI123'";
			}
		}

		if(HOS_SP_YN != null && HOS_SP_YN.equals("N") && HOS_SPN_YN != null && HOS_SPN_YN.equals("N") && HOS_SPJ_YN != null && HOS_SPJ_YN.equals("N")) {

			sql += " And IAP_PARE_ID <> '9'  And IAP_PRGM_ID <> 'PGB112' And IAP_PRGM_ID <> 'PGG314' ";
			sql += " And (IAP_PRGM_ID <> 'PGA117' And IAP_PRGM_ID <> 'PGA118' And ";
			sql += " 		IAP_PRGM_ID <> 'PGA119' And ";
			sql += " 		IAP_PRGM_ID <> 'PGD112' And ";
			sql += " 		IAP_PRGM_ID <> 'PGF112' And IAP_PRGM_ID <> 'PGG216' And ";
			sql += " 		IAP_PRGM_ID <> 'PGG312' And IAP_PRGM_ID <> 'PGG313' And ";
			sql += " 		IAP_PRGM_ID <> 'PGB112' And IAP_PRGM_ID <> 'PGG314' And ";
			sql += " 		IAP_PRGM_ID <> 'PGB115') ";
		}

		if(HOS_STDT_YN != null && HOS_STDT_YN.equals("N") && HOS_STDTO_YN != null && HOS_STDTO_YN.equals("N")) {

			sql += " AND (";
			sql += "		IAP_PRGM_ID <> 'PG2113'";
			sql += "	AND IAP_PRGM_ID <> 'PG7111'";
			sql += "	AND IAP_PRGM_ID <> 'PG7211'";
			sql += "	AND IAP_PRGM_ID <> 'PG7311'";
			sql += "	AND IAP_PRGM_ID <> 'PG7312'";
			sql += "	AND IAP_PRGM_ID <> 'PG7313'";
			sql += "	AND IAP_PRGM_ID <> 'PG7314'";
			sql += "	AND IAP_PRGM_ID <> 'PG7315'";
			sql += "	AND IAP_PRGM_ID <> 'PG7316'";
			sql += "	AND IAP_PRGM_ID <> 'PG7317'";
			sql += "	AND IAP_PRGM_ID <> 'PG7318'";
			sql += "	AND IAP_PRGM_ID <> 'PG7319'";
			sql += "	AND IAP_PRGM_ID <> 'PG7320'";
			sql += "	AND IAP_PRGM_ID <> 'PG7321'";
			sql += "	AND IAP_PRGM_ID <> 'PG7322'";
			sql += "	AND IAP_PRGM_ID <> 'PG7323'";
			sql += "	AND IAP_PRGM_ID <> 'PG7324'";
			sql += "	AND IAP_PRGM_ID <> 'PG7000'";
			sql += "	AND IAP_PRGM_ID <> 'PG2114'";
			sql += "	AND IAP_PRGM_ID <> 'PG7911'";
			sql += "	AND IAP_PRGM_ID <> 'PG7912'";
			sql += ")";
		} else {

			if(HOS_STDT_YN != null && HOS_STDT_YN.equals("N")) {

				sql += " AND (";
				sql += "		IAP_PRGM_ID <> 'PG2113'";
				sql += "	AND IAP_PRGM_ID <> 'PG7111'";
				sql += "	AND IAP_PRGM_ID <> 'PG7211'";
				sql += "	AND IAP_PRGM_ID <> 'PG7311'";
				sql += "	AND IAP_PRGM_ID <> 'PG7312'";
				sql += "	AND IAP_PRGM_ID <> 'PG7313'";
				sql += "	AND IAP_PRGM_ID <> 'PG7314'";
				sql += "	AND IAP_PRGM_ID <> 'PG7315'";
				sql += "	AND IAP_PRGM_ID <> 'PG7316'";
				sql += "	AND IAP_PRGM_ID <> 'PG7317'";
				sql += "	AND IAP_PRGM_ID <> 'PG7318'";
				sql += "	AND IAP_PRGM_ID <> 'PG7319'";
				sql += "	AND IAP_PRGM_ID <> 'PG7320'";
				sql += "	AND IAP_PRGM_ID <> 'PG7321'";
				sql += "	AND IAP_PRGM_ID <> 'PG7322'";
				sql += "	AND IAP_PRGM_ID <> 'PG7323'";
				sql += "	AND IAP_PRGM_ID <> 'PG7324'";
				sql += ")";
			}

			if(HOS_STDTO_YN != null && HOS_STDTO_YN.equals("N")) {

				sql += " AND (";
				sql += "	    IAP_PRGM_ID <> 'PG2114'";
				sql += "	AND IAP_PRGM_ID <> 'PG7911'";
				sql += "	AND IAP_PRGM_ID <> 'PG7912'";
				sql += ")";
			}
 		}

		if(HOS_FILE_YN != null && HOS_FILE_YN.equals("N")) {

			sql += " AND (";
			sql += "	    IAP_PRGM_ID <> 'PGA120'";
			sql += "	AND IAP_PRGM_ID <> 'PGA117'";
			sql += "	AND IAP_PRGM_ID <> 'PGA119'";
			sql += ")";
		}

		if(HOS_REPO_YN != null && HOS_REPO_YN.equals("N")) {

			sql += " AND (";
			sql += " 		IAP_PRGM_ID <> 'PG6118'";
			sql += "	AND IAP_PRGM_ID <> 'PG9114'";
			sql += ")";
		}

		if(HOS_EMAIL_YN != null && HOS_EMAIL_YN.equals("N")) {
			sql += " AND IAP_PRGM_ID <> 'PGE106'";
		}

		sql += " ORDER BY iap_pare_id ,IAP_PRGM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UConfig_comboStartMenuTypeMouseEnter_001 \n";
			G_INFO += "설명 : 프로그램 정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " GUSER : " + GUSER + " \n";
			G_INFO += " HOS_SPNEWAUTOPAN_YN : " + HOS_SPNEWAUTOPAN_YN + " \n";
			G_INFO += " G_HOSP_NO : " + G_HOSP_NO + " \n";
			G_INFO += " HOS_SMS_YN : " + HOS_SMS_YN + " \n";
			G_INFO += " HOS_SP_YN : " + HOS_SP_YN + " \n";
			G_INFO += " HOS_SPN_YN : " + HOS_SPN_YN + " \n";
			G_INFO += " HOS_STDT_YN : " + HOS_STDT_YN + " \n";
			G_INFO += " HOS_STDTO_YN : " + HOS_STDTO_YN + " \n";
			G_INFO += " HOS_FILE_YN : " + HOS_FILE_YN + " \n";
			G_INFO += " HOS_REPO_YN : " + HOS_REPO_YN + " \n";
			G_INFO += " HOS_EMAIL_YN : " + HOS_EMAIL_YN + " \n";
			G_INFO += " HOS_SPJ_YN : " + HOS_SPJ_YN + " \n";
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
		<s:AttributeType name='IAP_PRGM_ID' rs:number='1' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM' rs:basecolumn='IAP_PRGM_ID'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_PRGM_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM' rs:basecolumn='IAP_PRGM_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_MENU_ID' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM'
			 rs:basecolumn='IAP_MENU_ID'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IAP_LIBR_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_PRGM'
			 rs:basecolumn='IAP_LIBR_NM'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='5' rs:rowid='true' rs:basetable='IT_AUTH_PRGM' rs:basecolumn='ROWID'
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

			String IAP_PRGM_ID_T = cRsList.getString("IAP_PRGM_ID");
			String IAP_PRGM_NM_T = cRsList.getString("IAP_PRGM_NM");
			String IAP_MENU_ID_T = cRsList.getString("IAP_MENU_ID");
			String IAP_LIBR_NM_T = cRsList.getString("IAP_LIBR_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IAP_PRGM_ID_T.equals("")) {
%>
		 		IAP_PRGM_ID='<%= IAP_PRGM_ID_T%>'
<%
			}

			if(! IAP_PRGM_NM_T.equals("")) {
%>
		 		IAP_PRGM_NM='<%= IAP_PRGM_NM_T%>'
<%
			}

			if(! IAP_MENU_ID_T.equals("")) {
%>
		 		IAP_MENU_ID='<%= IAP_MENU_ID_T%>'
<%
			}

			if(! IAP_LIBR_NM_T.equals("")) {
%>
		 		IAP_LIBR_NM='<%= IAP_LIBR_NM_T%>'
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
