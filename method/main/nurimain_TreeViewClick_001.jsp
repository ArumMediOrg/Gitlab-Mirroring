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

		String GUSER = htMethod.get("GUSER");
		String G_HOSP_NO = htMethod.get("G_HOSP_NO");
		String HOS_SMS_YN = htMethod.get("HOS_SMS_YN");
		String HOS_SP_YN = htMethod.get("HOS_SP_YN");
		String HOS_SPN_YN = htMethod.get("HOS_SPN_YN");
		String HOS_STDT_YN = htMethod.get("HOS_STDT_YN");
		String HOS_STDTO_YN = htMethod.get("HOS_STDTO_YN");
		String HOS_FILE_YN = htMethod.get("HOS_FILE_YN");
		String HOS_REPO_YN = htMethod.get("HOS_REPO_YN");
		String HOS_EMAIL_YN = htMethod.get("HOS_EMAIL_YN");
		String HOS_SELVAS_YN = htMethod.get("HOS_SELVAS_YN");
		String AMENU = htMethod.get("AMENU");
		String HOS_SPNEWAUTOPAN_YN = htMethod.get("HOS_SPNEWAUTOPAN_YN");
		String HOS_SPJ_YN = htMethod.get("HOS_SPJ_YN");

		//
		if(GUSER == null) { GUSER = ""; }
		if(G_HOSP_NO == null) { G_HOSP_NO = ""; }
		if(HOS_SMS_YN == null) { HOS_SMS_YN = ""; }
		if(HOS_SP_YN == null) { HOS_SP_YN = ""; }
		if(HOS_SPN_YN == null) { HOS_SPN_YN = ""; }
		if(HOS_STDT_YN == null) { HOS_STDT_YN = ""; }
		if(HOS_STDTO_YN == null) { HOS_STDTO_YN = ""; }
		if(HOS_FILE_YN == null) { HOS_FILE_YN = ""; }
		if(HOS_REPO_YN == null) { HOS_REPO_YN = ""; }
		if(HOS_EMAIL_YN == null) { HOS_EMAIL_YN = ""; }
		if(HOS_SELVAS_YN == null) { HOS_SELVAS_YN = ""; }
		if(AMENU == null) { AMENU = ""; }
		if(HOS_SPNEWAUTOPAN_YN == null) { HOS_SPNEWAUTOPAN_YN = ""; }
		if(HOS_SPJ_YN == null) { HOS_SPJ_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT *";
		sql += " FROM IT_AUTH_PRGM";
		sql += " WHERE IAP_GRP1_KD In ('1', '2')";

		if(! GUSER.equals("admin")) {

			sql += " And IAP_PRGM_ID <> 'PM0001' ";
			sql += " And IAP_PRGM_ID <> 'PM0003' ";
			sql += " And IAP_PRGM_ID <> 'PGG313' ";
			sql += " And IAP_PRGM_ID <> 'PGF114' ";
			sql += " And IAP_PRGM_ID <> 'PGF115' ";
			sql += " And IAP_PRGM_ID <> 'PGF117' ";

			if(! HOS_SPNEWAUTOPAN_YN.equals("Y")){
				sql += " And IAP_PRGM_ID <> 'PGG314' ";
			}
		}

		if(! G_HOSP_NO.equals("38100487")) {
			sql += " AND IAP_PARE_ID <> '97'";
			sql += " AND IAP_PRGM_ID <> 'PG8214'";
		}

		if(! G_HOSP_NO.equals("36333506") && ! G_HOSP_NO.equals("36343285")) {
			if(HOS_SMS_YN != null && HOS_SMS_YN.equals("N")) {
				sql += " AND IAP_PRGM_ID <> 'PGI120'";
				sql += " AND IAP_PRGM_ID <> 'PGI123'";
      			sql += " AND IAP_PRGM_ID <> 'PGI000'";
      			sql += " AND IAP_PRGM_ID <> 'PGI122'";
			}
		}

		if (HOS_SP_YN.equals("N") && HOS_SPN_YN.equals("N") && HOS_SPJ_YN.equals("N")) {
			sql += " And IAP_PARE_ID <> '9'  And IAP_PRGM_ID <> 'PGB112' And IAP_PRGM_ID <> 'PGG314' ";
			sql += " And (IAP_PRGM_ID <> 'PGA117' And IAP_PRGM_ID <> 'PGA118' And ";
			sql += " 		IAP_PRGM_ID <> 'PGA119' And ";
			sql += " 		IAP_PRGM_ID <> 'PGD112' And ";
			sql += " 		IAP_PRGM_ID <> 'PGF112' And IAP_PRGM_ID <> 'PGG216' And ";
			sql += " 		IAP_PRGM_ID <> 'PGG312' And IAP_PRGM_ID <> 'PGG313' And ";
			sql += " 		IAP_PRGM_ID <> 'PGB112' And IAP_PRGM_ID <> 'PGG314' And ";
			sql += " 		IAP_PRGM_ID <> 'PGB115' And IAP_PRGM_ID <> 'PG9219' And IAP_PRGM_ID <> 'PG9220' ) ";
		}


		if(HOS_SP_YN.equals("N") && HOS_SPN_YN.equals("N") && HOS_SPJ_YN.equals("N")) {

			sql += " And IAP_PARE_ID <> '9'  And IAP_PRGM_ID <> 'PGB112' And IAP_PRGM_ID <> 'PGG314' ";
			sql += " And (IAP_PRGM_ID <> 'PGA117' And IAP_PRGM_ID <> 'PGA118' And ";
			sql += " 		IAP_PRGM_ID <> 'PGA119' And ";
			sql += " 		IAP_PRGM_ID <> 'PGD112' And ";
			sql += " 		IAP_PRGM_ID <> 'PGF112' And IAP_PRGM_ID <> 'PGG216' And ";
			sql += " 		IAP_PRGM_ID <> 'PGG312' And IAP_PRGM_ID <> 'PGG313' And ";
			sql += " 		IAP_PRGM_ID <> 'PGB112' And IAP_PRGM_ID <> 'PGG314' And ";
			sql += " 		IAP_PRGM_ID <> 'PGB115') ";
		}

		if(HOS_STDT_YN.equals("N") && HOS_STDTO_YN.equals("N")) {

			sql += " AND (";
			sql += " 	    IAP_PRGM_ID <> 'PG2113'";
			sql += " 	AND IAP_PRGM_ID <> 'PG7111'";
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

			if(HOS_STDT_YN.equals("N")) {

				sql += " AND (";
				sql += "	    IAP_PRGM_ID <> 'PG2113'";
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

			if(HOS_STDTO_YN.equals("N")) {

				sql += " AND (";
				sql += "	    IAP_PRGM_ID <> 'PG2114'";
				sql += " 	AND IAP_PRGM_ID <> 'PG7911'";
				sql += "	AND IAP_PRGM_ID <> 'PG7912'";
				sql += ")";
			}
    	}

		if(HOS_FILE_YN.equals("N")) {

			sql += " AND (";
			sql += "	    IAP_PRGM_ID <> 'PGA120'";
			sql += "	AND IAP_PRGM_ID <> 'PGA117'";
			sql += "	AND IAP_PRGM_ID <> 'PGA119'";
			sql += ")";
		}

		if(HOS_REPO_YN.equals("N")) {

			sql += " AND (";
			sql += "	    IAP_PRGM_ID <> 'PG6118'";
			sql += " 	AND IAP_PRGM_ID <> 'PG9114'";
			sql += ")";
		}

		if(HOS_EMAIL_YN.equals("N")) {
			sql += " AND IAP_PRGM_ID <> 'PGE106'";
		}

		if(HOS_SELVAS_YN.equals("N")) {
			sql += " AND IAP_PRGM_ID <> 'PG4212'";
		}

		if(! AMENU.equals("1")) {
			sql += " AND IAP_PRGM_NM LIKE '%" + AMENU + "%'";
		}

		sql += " AND IAP_USE_YN = 'Y'";
		sql += " ORDER BY iap_pare_id ,IAP_PRGM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : nurimain_TreeViewClick_001 \n";
			G_INFO += "설명 : 프로그램 목록 호출 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " GUSER : " + GUSER + " \n";
			G_INFO += " G_HOSP_NO : " + G_HOSP_NO + " \n";
			G_INFO += " HOS_SMS_YN : " + HOS_SMS_YN + " \n";
			G_INFO += " HOS_SP_YN : " + HOS_SP_YN + " \n";
			G_INFO += " HOS_SPN_YN : " + HOS_SPN_YN + " \n";
			G_INFO += " HOS_STDT_YN : " + HOS_STDT_YN + " \n";
			G_INFO += " HOS_STDTO_YN : " + HOS_STDTO_YN + " \n";
			G_INFO += " HOS_FILE_YN : " + HOS_FILE_YN + " \n";
			G_INFO += " HOS_REPO_YN : " + HOS_REPO_YN + " \n";
			G_INFO += " HOS_EMAIL_YN : " + HOS_EMAIL_YN + " \n";
			G_INFO += " HOS_SELVAS_YN : " + HOS_SELVAS_YN + " \n";
			G_INFO += " AMENU : " + AMENU + " \n";
			G_INFO += " HOS_SPNEWAUTOPAN_YN : " + HOS_SPNEWAUTOPAN_YN + " \n";
			G_INFO += " HOS_SPJ_YN : " + HOS_SPJ_YN + " \n";
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

				if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
					byte[] buf_BLOB = rsList.getBytes(rsmd.getColumnName(colCnt));
					if(buf_BLOB != null) {
						tempData = new String(buf_BLOB);
					}
				}

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
