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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, B.ICR_PENL_ID, B.ICR_BIRH_DT, A.EEA_PSNL_AGE, A.EEA_RFID_NO, A.EEA_RSLT_CD, ";
		sql += " A.EEA_BLRT_CD, A.EEA_EXAM_CD, A.EEA_HTSB_CD, A.EEA_ORAL_YN, A.EEA_STOMA_CD, A.EEA_COLON_CD, A.EEA_LIVER_CD, A.EEA_BAST_CD, ";
		sql += " A.EEA_UTER_CD, NVL(A.EEA_LUNG_CD, '0') EEA_LUNG_CD, A.EEA_CNCR_DT, A.EEA_HCV_YN, NVL(A.EEA_LIFE_YN, 'N') EEA_LIFE_YN, A.EEA_MNGT_HTYR, ";
		sql += " A.EEA_EXAM_LT, C.ICY_COMP_NM, D.PFP_DOCTORFIR, D.PFP_RESULT_DATE, D.PFP_FIX_YN, D.PFP_TRANC_DATE, S.PSP_DOCTORSED, S.PSP_RESULT_DATE, ";
		sql += " S.PSP_FIX_YN, S.PSP_TRANC_DATE, J.EDP_PANJ_DT, J.EDP_PANJ_YN, J.EDP_TOBO_DT, ET_CANCER_HEADER.ECH_CFRM_CD, F.IAU_PENL_NM DOCTORFIR_NM, ";
		sql += " D.PFP_DOCTORQQN, M.IAU_PENL_NM DOCTORQQN_NM, ECS_CFRM_DT, ECC_CFRM_DT, ECL_CFRM_DT, ECB_CFRM_DT, ECV_CFRM_DT, ECG_CFRM_DT, A.EEA_DIVI_NO, ";
		sql += " ECS_RSLT_KD, ECC_RSLT_KD, ECL_RSLT_KD, ECB_RSLT_KD, ECV_RSLT_KD, ECG_RSLT_KD ";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON A.EEA_CUST_NO = B.ICR_CUST_NO LEFT OUTER JOIN PT_FIR_PANJUNG D";
		sql += " ON A.EEA_EXAM_DT = D.PFP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.PFP_EXAM_SQ LEFT OUTER JOIN PT_SED_PANJUNG S";
		sql += " ON A.EEA_EXAM_DT = S.PSP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = S.PSP_EXAM_SQ LEFT OUTER JOIN ET_DENTAL_PANJ J";
		sql += " ON A.EEA_EXAM_DT = J.EDP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = J.EDP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD LEFT OUTER JOIN ET_CANCER_HEADER";
		sql += " ON ECH_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECH_EXAM_SQ = EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_STMC";
		sql += " ON ECS_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECS_EXAM_SQ = EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_COLO";
		sql += " ON ECC_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECC_EXAM_SQ = EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LIVER";
		sql += " ON ECL_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECL_EXAM_SQ = EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_BRST";
		sql += " ON ECB_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECB_EXAM_SQ = EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_CRVC";
		sql += " ON ECV_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECV_EXAM_SQ = EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_LUNG";
		sql += " ON ECG_EXAM_DT = EEA_EXAM_DT";
		sql += " AND ECG_EXAM_SQ = EEA_EXAM_SQ LEFT OUTER JOIN IT_AUTH_USER M";
		sql += " ON M.IAU_EMP_NO = PFP_DOCTORQQN LEFT OUTER JOIN IT_AUTH_USER F";
		sql += " ON F.IAU_EMP_NO = PFP_DOCTORFIR";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uInsuranceReport_UF_SqlSet_001 \n";
			G_INFO += "설명 : 건강검진통보서출력 내역조회 메인 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
