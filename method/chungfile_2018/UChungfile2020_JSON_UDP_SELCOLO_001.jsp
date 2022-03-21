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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String CANAD_KD = htMethod.get("CANAD_KD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(CANAD_KD == null) { CANAD_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT ECC_OBTP_KD, EEA_PLCE_CD, ECC_OBRT_CD, ECC_OBVL_VL, ECC_OBRT_VL, REPLACE(ECC_OBEX_DT,'-','') ECC_OBEX_DT";

		sql += ", CASE WHEN ECC_GIEX_KD='0' THEN '' ELSE ECC_GIEX_KD END ECC_GIEX_KD";
		sql += ", CASE WHEN ECC_GIRT1_KD='0' THEN '' ELSE ECC_GIRT1_KD END ECC_GIRT1_KD";
		sql += ", CASE WHEN NVL(ECC_GIRT1_KD, ' ') = ' ' THEN ' ' ELSE ECC_GIRT1S_KD END ECC_GIRT1S_KD";
		sql += ", CASE WHEN ECC_GIRT2_KD='0' THEN '' ELSE ECC_GIRT2_KD END ECC_GIRT2_KD";
		sql += ", CASE WHEN NVL(ECC_GIRT2_KD, ' ') = ' ' THEN ' ' ELSE ECC_GIRT2S_KD END ECC_GIRT2S_KD";
		sql += ", ECC_GIRT3_KD";
		sql += ", CASE WHEN NVL(ECC_GIRT3_KD, ' ') = ' ' THEN ' ' ELSE ECC_GIRT3S_KD END ECC_GIRT3S_KD";
		sql += ", CASE WHEN ECC_GIPL_VL='000' THEN '' ELSE ECC_GIPL_VL END ECC_GIPL_VL";
		sql += ", CASE WHEN ECC_RSLT_KD IN ('6','7') THEN '' ELSE ECC_GIETC_KD END ECC_GIETC_KD";

		sql += ", SUBSTR(ECC_GIRT_EX,1,10) ECC_GIRT_EX, REPLACE(ECC_GIEX_DT,'-','') ECC_GIEX_DT";

		sql += ", CASE WHEN ECC_ENCE_KD='0' THEN '' ELSE ECC_ENCE_KD END ECC_ENCE_KD";
		sql += ", CASE WHEN ECC_ENJJ_KD='0' THEN '' ELSE ECC_ENJJ_KD END ECC_ENJJ_KD";
		sql += ", ECC_ENRT1_KD";
		sql += ", CASE WHEN NVL(ECC_ENRT1_KD, ' ') = ' ' THEN ' ' ELSE ECC_ENRT1S_KD END ECC_ENRT1S_KD";
		sql += ", ECC_ENRT2_KD";
		sql += ", CASE WHEN NVL(ECC_ENRT2_KD, ' ') = ' ' THEN ' ' ELSE ECC_ENRT2S_KD END ECC_ENRT2S_KD";
		sql += ", ECC_ENRT3_KD";
		sql += ", CASE WHEN NVL(ECC_ENRT3_KD, ' ') = ' ' THEN ' ' ELSE ECC_ENRT3S_KD END ECC_ENRT3S_KD";
		sql += ", CASE WHEN ECC_ENPL_VL='000' THEN '' ELSE ECC_ENPL_VL END ECC_ENPL_VL";
		sql += ", CASE WHEN ECC_ENPL_CT='0' THEN '' ELSE ECC_ENPL_CT END ECC_ENPL_CT";
		sql += ", CASE WHEN ECC_BIBF_KD='0' THEN '' ELSE ECC_BIBF_KD END ECC_BIBF_KD";
		sql += ", CASE WHEN ECC_RSLT_KD IN ('6','7') THEN '' ELSE ECC_ENETC_KD END ECC_ENETC_KD";
		sql += ", SUBSTR(ECC_ENRT_EX,1,10) ECC_ENRT_EX";
		sql += ", CASE WHEN ECC_BIEX_YN='0' THEN '' ELSE ECC_BIEX_YN END ECC_BIEX_YN";
		sql += ", ECC_FOCP_ADD_KD";
		sql += ", CASE WHEN ECC_FOCP_KD='0' THEN '0' ELSE ECC_FOCP_KD END ECC_FOCP_KD";
		sql += ", CASE WHEN ECC_BIRT_KD='0' THEN ' ' ELSE ECC_BIRT_KD END ECC_BIRT_KD";
		sql += ", CASE WHEN ECC_BICT_KD='0' THEN ' ' ELSE ECC_BICT_KD END ECC_BICT_KD";
		sql += ", CASE WHEN ECC_BIRT_KD='6' THEN ECC_BICNCR_KD ELSE '' END ECC_BICNCR_KD";
		sql += ", ECC_BICNCR_EX";
		sql += ", CASE WHEN ECC_BIRT_KD='7' THEN ECC_BIETC_KD ELSE '' END ECC_BIETC_KD";

		sql += ", ECC_BIETC_EX, REPLACE(ECC_ENEX_DT,'-','') ECC_ENEX_DT, ECC_RSLT_KD, ECC_STCN_YN, ECC_ETC_EX, ECC_RSLT_EX, REPLACE(ECC_CFRM_DT,'-','') ECC_CFRM_DT, H.IAU_LICEN1_NO, H.IAU_PENL_NM, H.IAU_PENL_ID, H1.IAU_LICEN1_NO IAU_LICEN1_NO_DECI, H1.IAU_PENL_NM IAU_PENL_NM_DECI, H2.IAU_LICEN1_NO IAU_LICEN1_NO_CKUP, H2.IAU_PENL_NM IAU_PENL_NM_CKUP, H3.IAU_LICEN1_NO IAU_LICEN1_NO_PATH, H3.IAU_PENL_NM IAU_PENL_NM_PATH";

		sql += ", CASE WHEN F_CAN_PR(EEA_EXAM_DT,EEA_EXAM_SQ,'R0002') > 0 THEN'1' ELSE'0' END JINYN";
		sql += " FROM ET_CANCER_COLO A LEFT OUTER JOIN ET_EXAM_ACPT F";
		sql += " ON A.ECC_EXAM_DT=F.EEA_EXAM_DT";
		sql += " AND A.ECC_EXAM_SQ=F.EEA_EXAM_SQ";
		sql += " AND EEA_COLON_CD > '0' LEFT OUTER JOIN IT_CUSTOMER G";
		sql += " ON F.EEA_CUST_NO=G.ICR_CUST_NO LEFT OUTER JOIN IT_AUTH_USER H";
		sql += " ON A.ECC_LICEN_CD = H.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER H1";
		sql += " ON A.ECC_DECI_LICEN_CD = H1.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER H2";
		sql += " ON A.ECC_CKUP_LICEN_CD = H2.IAU_EMP_NO LEFT OUTER JOIN IT_AUTH_USER H3";
		sql += " ON A.ECC_PATH_LICEN_CD = H3.IAU_EMP_NO LEFT OUTER JOIN ET_CANCER_HEADER I";
		sql += " ON A.ECC_EXAM_DT = I.ECH_EXAM_DT";
		sql += " AND A.ECC_EXAM_SQ = I.ECH_EXAM_SQ";
		sql += " WHERE NVL(ECC_RSLT_KD, ' ') <> ' '";
		sql += " AND ECH_CFRM_CD = '2'";
		sql += " AND EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SUBSTR(EEA_CANAD_KD,2,1) = '" + CANAD_KD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UChungfile2020_JSON_UDP_SELCOLO_001 \n";
			G_INFO += "설명 : 청구생성(대장암) 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " CANAD_KD : " + CANAD_KD + " \n";
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
