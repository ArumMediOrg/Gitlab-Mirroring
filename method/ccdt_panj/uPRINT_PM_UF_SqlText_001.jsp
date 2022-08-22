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

		String SMODE = htMethod.get("SMODE");
		String DTEDTEEA_EXAM_SDT = htMethod.get("DTEDTEEA_EXAM_SDT");
		String DTEDTEEA_EXAM_EDT = htMethod.get("DTEDTEEA_EXAM_EDT");
		String EDTEEA_EXAM_SSQ = htMethod.get("EDTEEA_EXAM_SSQ");
		String EDTEEA_EXAM_ESQ = htMethod.get("EDTEEA_EXAM_ESQ");
		String MSKEDTEEA_COMP_CD1 = htMethod.get("MSKEDTEEA_COMP_CD1");
		String CHKBOXMAIN = htMethod.get("CHKBOXMAIN");
		String MSKEDTEEA_COMP_CD2 = htMethod.get("MSKEDTEEA_COMP_CD2");
		String CMBFAMYCD = htMethod.get("CMBFAMYCD");
		String EDTEEA_CUST_NO = htMethod.get("EDTEEA_CUST_NO");
		String EDTEEA_PSNL_NM = htMethod.get("EDTEEA_PSNL_NM");
		String DTEDTBIRTH = htMethod.get("DTEDTBIRTH");
		String RZCMBBOXPANJ = htMethod.get("RZCMBBOXPANJ");
		String CMBBOXSORT = htMethod.get("CMBBOXSORT");
		String CBPLCE_CD = htMethod.get("CBPLCE_CD");

		//
		if(SMODE == null) { SMODE = ""; }
		if(DTEDTEEA_EXAM_SDT == null) { DTEDTEEA_EXAM_SDT = ""; }
		if(DTEDTEEA_EXAM_EDT == null) { DTEDTEEA_EXAM_EDT = ""; }
		if(EDTEEA_EXAM_SSQ == null) { EDTEEA_EXAM_SSQ = ""; }
		if(EDTEEA_EXAM_ESQ == null) { EDTEEA_EXAM_ESQ = ""; }
		if(MSKEDTEEA_COMP_CD1 == null) { MSKEDTEEA_COMP_CD1 = ""; }
		if(CHKBOXMAIN == null) { CHKBOXMAIN = ""; }
		if(MSKEDTEEA_COMP_CD2 == null) { MSKEDTEEA_COMP_CD2 = ""; }
		if(CMBFAMYCD == null) { CMBFAMYCD = ""; }
		if(EDTEEA_CUST_NO == null) { EDTEEA_CUST_NO = ""; }
		if(EDTEEA_PSNL_NM == null) { EDTEEA_PSNL_NM = ""; }
		if(DTEDTBIRTH == null) { DTEDTBIRTH = ""; }
		if(RZCMBBOXPANJ == null) { RZCMBBOXPANJ = ""; }
		if(CMBBOXSORT == null) { CMBBOXSORT = ""; }
		if(CBPLCE_CD == null) { CBPLCE_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_ACPT_CD, A.EEA_CUST_NO, A.EEA_PSNL_NM, A.EEA_EXAM_CD, A.EEA_CHART_NO, C.ICY_COMP_NM, A.EEA_DEPT_NM, A.EEA_PSNL_AGE, CASE WHEN B.ICR_SEX_KD IS NULL";
		sql += " OR B.ICR_SEX_KD = '' THEN B.ICR_SEX_KD ELSE GETCOMMON_LVCDTONM('0411',B.ICR_SEX_KD,'5',1) END ICR_SEX_NM, SUBSTR(B.ICR_PENL_ID,1,6) ICR_BIRH_DT, CASE WHEN A.EEA_COMP_CD IS NULL";
		sql += " OR A.EEA_COMP_CD = '' THEN '' ELSE '[' || A.EEA_COMP_CD || ']' || C.ICY_COMP_NM END EEA_COMP_NM, CASE WHEN A.EEA_EXAM_CD IS NULL";
		sql += " OR A.EEA_EXAM_CD = '' THEN A.EEA_EXAM_CD ELSE '[' || A.EEA_EXAM_CD || ']' || GETCOMMON_LVCDTONM('0401',A.EEA_EXAM_CD,'5',5) END ICR_EXAM_NM, D.DCP_COMP_YN, D.DCP_TRANC_DT";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO INNER JOIN DT_CCDT_PANJ D";
		sql += " ON A.EEA_EXAM_DT = D.DCP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.DCP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_EXAM_DT >= '" + DTEDTEEA_EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEEA_EXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(!EDTEEA_EXAM_SSQ.equals("") || !EDTEEA_EXAM_ESQ.equals("")) {
			if(!EDTEEA_EXAM_SSQ.equals("") && !EDTEEA_EXAM_SSQ.equals("")) {
				sql += " AND A.EEA_EXAM_SQ >= '" + EDTEEA_EXAM_SSQ + "'";
				sql += " AND A.EEA_EXAM_SQ <= '" + EDTEEA_EXAM_ESQ + "'";
			}
		}

		if(!MSKEDTEEA_COMP_CD1.equals("")) {
			if(CHKBOXMAIN.equals("1")) {
				sql += " AND A.EEA_COMP_CD IN '" + MSKEDTEEA_COMP_CD2 + "'";
			}
			else {
				sql += " AND A.EEA_COMP_CD = '" + MSKEDTEEA_COMP_CD2 + "'";
			}
		}

		if(!CBPLCE_CD.equals("00")) {
			sql += " AND A.EEA_PLCE_CD = '" + CBPLCE_CD + "'";
		}

		if(!CMBFAMYCD.equals("00")) {
			sql += " AND A.EEA_FAMY_CD = '" + CMBFAMYCD + "'";
		}

		if(!EDTEEA_CUST_NO.equals("")) {
			sql += " AND A.EEA_CUST_NO = '" + EDTEEA_CUST_NO + "'";
		}

		if(!EDTEEA_PSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%' || '" + EDTEEA_PSNL_NM + "' || '%'";
		}

		if(!DTEDTBIRTH.equals("")) {
			sql += " AND SUBSTR(B.ICR_PENL_ID,1,6) = '" + DTEDTBIRTH + "'";
		}

		if(RZCMBBOXPANJ.equals("1")) {
			sql += " AND D.DCP_COMP_YN = 'Y'";
		}
		else if(RZCMBBOXPANJ.equals("2")) {
			sql += " AND D.DCP_COMP_YN = 'N';";
		}

		if(CMBBOXSORT.equals("0")) {
			sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
		}
		else if(CMBBOXSORT.equals("1")) {
			sql += " ORDER BY A.EEA_DEPT_NM, A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("2")) {
			sql += " ORDER BY A.ICR_PENL_ID";
		}
		else if(CMBBOXSORT.equals("3")) {
			sql += " ORDER BY A.EEA_PSNL_NM";
		}
		else if(CMBBOXSORT.equals("4")) {
			sql += " ORDER BY C.ICY_COMP_NM, A.EEA_PSNL_NM ";
		}


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPRINT_PM_UF_SqlText_001 \n";
			G_INFO += "설명 : 결과지 필요정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SMODE : " + SMODE + " \n";
			G_INFO += " DTEDTEEA_EXAM_SDT : " + DTEDTEEA_EXAM_SDT + " \n";
			G_INFO += " DTEDTEEA_EXAM_EDT : " + DTEDTEEA_EXAM_EDT + " \n";
			G_INFO += " EDTEEA_EXAM_SSQ : " + EDTEEA_EXAM_SSQ + " \n";
			G_INFO += " EDTEEA_EXAM_ESQ : " + EDTEEA_EXAM_ESQ + " \n";
			G_INFO += " MSKEDTEEA_COMP_CD1 : " + MSKEDTEEA_COMP_CD1 + " \n";
			G_INFO += " CHKBOXMAIN : " + CHKBOXMAIN + " \n";
			G_INFO += " MSKEDTEEA_COMP_CD2 : " + MSKEDTEEA_COMP_CD2 + " \n";
			G_INFO += " CMBFAMYCD : " + CMBFAMYCD + " \n";
			G_INFO += " EDTEEA_CUST_NO : " + EDTEEA_CUST_NO + " \n";
			G_INFO += " EDTEEA_PSNL_NM : " + EDTEEA_PSNL_NM + " \n";
			G_INFO += " DTEDTBIRTH : " + DTEDTBIRTH + " \n";
			G_INFO += " RZCMBBOXPANJ : " + RZCMBBOXPANJ + " \n";
			G_INFO += " CMBBOXSORT : " + CMBBOXSORT + " \n";
			G_INFO += " CBPLCE_CD : " + CBPLCE_CD + " \n";
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
