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

		String G_ENCRT_KD = htMethod.get("G_ENCRT_KD");
		String ED_NAME = htMethod.get("ED_NAME");
		String ED_CUSTNO = htMethod.get("ED_CUSTNO");
		String NODASH_DP_BIRTDT = htMethod.get("NODASH_DP_BIRTDT");
		String DP_BIRTDT = htMethod.get("DP_BIRTDT");
		String NODASH_ED_HP = htMethod.get("NODASH_ED_HP");
		String ED_HP = htMethod.get("ED_HP");

		//
		if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
		if(ED_NAME == null) { ED_NAME = ""; }
		if(ED_CUSTNO == null) { ED_CUSTNO = ""; }
		if(NODASH_DP_BIRTDT == null) { NODASH_DP_BIRTDT = ""; }
		if(DP_BIRTDT == null) { DP_BIRTDT = ""; }
		if(NODASH_ED_HP == null) { NODASH_ED_HP = ""; }
		if(ED_HP == null) { ED_HP = ""; }

		// DB객체
		stmtList = connect.createStatement();


		if(G_ENCRT_KD.equals("!")) {
			sql = " SELECT ICR_PID_EN AS ICR_PENL_ID,";
		}
		else if(G_ENCRT_KD.equals("2")) {
			sql = " SELECT ECL_DECRYPT(ICR_PID_EN) AS ICR_PENL_ID,";
		}
		else {
			sql = " SELECT ICR_PENL_ID AS ICR_PENL_ID,";
		}

		sql += " ICR_CUST_NO , ICR_PENL_NM , ICR_MANA_KD";
		sql += ", (SELECT CCN_FULL_NM FROM CT_COMMON WHERE A.ICR_MANA_KD=CCN_SMALL AND CCN_LARGE='0702') JUMINGBNM";
		sql += ", ICR_CUST_KD";
		sql += ", (SELECT CCN_FULL_NM FROM CT_COMMON WHERE A.ICR_CUST_KD=CCN_SMALL AND CCN_LARGE='0701') CUSTNM";
		sql += ", ICR_NTNA_CD";
		sql += ", (SELECT CCN_FULL_NM FROM CT_COMMON WHERE A.ICR_NTNA_CD=CCN_SMALL AND CCN_LARGE='0703' ) NATNM";
		sql += " , ICR_COMP_CD";
		sql += ", (SELECT ICY_COMP_NM FROM IT_COMPANY WHERE A.ICR_COMP_CD=ICY_COMP_CD ) COMPANY_NM";
		sql += ", ICR_DIVI_NM";
		sql += ", (SELECT CCN_FULL_NM FROM CT_COMMON WHERE A.ICR_DIVI_NM=CCN_SMALL AND CCN_LARGE='0707' ) ICDIVINM";
		sql += ", ICR_DIVI_CS";
		sql += ", (SELECT CCN_FULL_NM FROM CT_COMMON WHERE A.ICR_DIVI_CS=CCN_SMALL AND CCN_LARGE='0709' ) ICRDIVICSNM";
		sql += ", ICR_DIVI_KD";
		sql += ", (SELECT CCN_FULL_NM FROM CT_COMMON WHERE A.ICR_DIVI_KD=CCN_SMALL AND CCN_LARGE='0810' ) ICRDIVIKDNM";
		sql += ", ICR_CHART_NO, ICR_SEX_KD";
		sql += ", CASE WHEN ICR_SEX_KD='1' THEN '남자' ELSE '여자' END ICSEXDNM";
		sql += ", TO_CHAR(TO_DATE(ICR_ENTR_DT, 'YYYY-MM-DD'), 'YYYY-MM-DD') ICR_ENTR_DT , ICR_BIRH_KD , ICR_BIRH_DT , ICR_MARY_KD";
		sql += ", CASE WHEN ICR_MARY_KD='0' THEN '미혼' ELSE '기혼' END ICMARYNM";
		sql += ", TO_CHAR(TO_DATE(ICR_MARY_DT, 'YYYY-MM-DD'), 'YYYY-MM-DD') ICR_MARY_DT, ICR_TEL_NO , ICR_MOBL_NO , ICR_EMAI_AR , ICR_ADDR_KD , ICR_ZIP_CD , ICR_ZIP_SQ, ICR_ZIP_AR, ICR_LOTT_AR , ICR_ROAD_AR , ICR_ZIP_AR||' '|| ICR_ROAD_AR AS ADDR, ICR_PARE_NM , ICR_PARE_NO , ICR_INFO_YN , ICR_RECV_YN , ICR_CUST_TX , ICR_CLSS_KD, ICR_DIVI_NO , ICR_INPT_ID , ICR_INPT_DTT , ICR_MODI_ID";
		sql += ", CASE WHEN ICR_INFO_YN='1' THEN '동의' ELSE '동의안함' END ICINFONM";
		sql += ", CASE WHEN ICR_RECV_YN='1' THEN '동의' ELSE '동의안함' END ICRECVNM";
		sql += ", ICR_MODI_DTT, ICR_MMBR_CD ";
		sql += " FROM IT_CUSTOMER A";
		sql += " WHERE ICR_USE_YN <>'N'";

		if(!ED_NAME.equals("")) {
			sql += " AND ICR_PENL_NM LIKE '%" + ED_NAME + "%'";
		}

		if(!ED_CUSTNO.equals("")) {
			sql += " AND ICR_CUST_NO LIKE '" + ED_CUSTNO + "%'";
		}

		if(!NODASH_DP_BIRTDT.equals("")) {
			sql += " AND ICR_BIRH_DT = '" + DP_BIRTDT + "'";
		}

		if(!NODASH_ED_HP.equals("")) {
			sql += " AND ICR_MOBL_NO LIKE '%" + ED_HP + "%'";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_Customer_Up_afLoadCust_001 \n";
			G_INFO += "설명 : 고객정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " G_ENCRT_KD : " + G_ENCRT_KD + " \n";
			G_INFO += " ED_NAME : " + ED_NAME + " \n";
			G_INFO += " ED_CUSTNO : " + ED_CUSTNO + " \n";
			G_INFO += " NODASH_DP_BIRTDT : " + NODASH_DP_BIRTDT + " \n";
			G_INFO += " DP_BIRTDT : " + DP_BIRTDT + " \n";
			G_INFO += " NODASH_ED_HP : " + NODASH_ED_HP + " \n";
			G_INFO += " ED_HP : " + ED_HP + " \n";
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
			} else if (rsmd.getColumnTypeName(colCnt).equals("DATE")){  //why doesn't working?
				//<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
				dataType = "dateTime";
				maxLength = "20";
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
