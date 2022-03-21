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

		String ENCK_KD = htMethod.get("ENCK_KD");
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String COMP_CD = htMethod.get("COMP_CD");
		String CHART_NO = htMethod.get("CHART_NO");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String SEND_GB = htMethod.get("SEND_GB");

		//

		if(ENCK_KD == null) { ENCK_KD = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(CHART_NO == null) { CHART_NO = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(SEND_GB == null) { SEND_GB = ""; }

		// DB객체
		stmtList = connect.createStatement();

		if(ENCK_KD.equals("1")){
			sql = " SELECT B.ICR_PID_EN  AS EEA_PSNL_ID, ";
		}
		else if(ENCK_KD.equals("2")){
			sql = " select ECHELONDB.ECL_DECRYPT(B.ICR_PID_EN) AS EEA_PSNL_ID, ";
		}
		else {
			sql = " select B.ICR_PENL_ID AS EEA_PSNL_ID, ";
		}

		sql += " A.EEA_EXAM_DT, A.EEA_EXAM_SQ,  A.EEA_PSNL_NM,  A.EEA_PSNL_AGE, B.ICR_BIRH_DT,  A.EEA_DIVI_NO, ";
		sql += " A.EEA_ORAL_YN, A.EEA_STOMA_CD, A.EEA_COLON_CD, A.EEA_LIVER_CD, A.EEA_BAST_CD,  A.EEA_UTER_CD, NVL(A.EEA_LUNG_CD, '0') EEA_LUNG_CD, ";
		sql += " A.EEA_EXAM_CD, A.EEA_HTSB_CD,  A.EEA_SPSB_CD,  A.EEA_HDMD_YN,  A.EEA_CHART_NO, A.EEA_EMAIL_AR, PFP_FIX_YN,";
		sql += " f_tel_format(A.EEA_MOBL_NO) EEA_MOBL_NO, A.EEA_HTSB_YN, E.ECH_CFRM_CD, F.EDP_PANJ_YN, G.ERL_SUCC_YN FROM ET_EXAM_ACPT A ";
		sql += " INNER JOIN IT_CUSTOMER B ON A.EEA_CUST_NO = B.ICR_CUST_NO ";
		sql += " LEFT OUTER JOIN IT_COMPANY C ON A.EEA_COMP_CD = C.ICY_COMP_CD ";
		sql += " LEFT OUTER JOIN PT_FIR_PANJUNG D ON D.PFP_EXAM_DT = A.EEA_EXAM_DT AND D.PFP_EXAM_SQ = A.EEA_EXAM_SQ ";
		sql += " LEFT OUTER JOIN ET_CANCER_HEADER E ON A.EEA_EXAM_DT = E.ECH_EXAM_DT AND A.EEA_EXAM_SQ = E.ECH_EXAM_SQ ";
		sql += " LEFT OUTER JOIN ET_DENTAL_PANJ F ON A.EEA_EXAM_DT = F.EDP_EXAM_DT and A.EEA_EXAM_SQ = F.EDP_EXAM_SQ ";
		sql += " LEFT OUTER JOIN ET_RSLTWEB_LOG G ON A.EEA_EXAM_DT = G.ERL_EXAM_DT and A.EEA_EXAM_SQ = G.ERL_EXAM_SQ ";
		sql += " WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "' ";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "' ";

		if(!COMP_CD.equals("")){
			sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "' ";
		}
		if(!CHART_NO.equals("")){
			sql += " AND A.EEA_CHART_NO = '" + CHART_NO + "' ";
		}
		if(!PSNL_NM.equals("")){
			sql += " AND A.EEA_PSNL_NM LIKE '%" + PSNL_NM + "%' ";
		}

		if(!EXAM_CD.equals("00")){
			if(EXAM_CD.substring(1, 1).compareTo("1") == 0) {
				sql += " AND SUBSTR(A.EEA_HTSB_CD,1,1) = SUBSTR('" + EXAM_CD + "',1,1) ";
			}
			else if (EXAM_CD.equals("21")) {
				sql += " AND A.EEA_EXAM_CD = '21001' ";
			}
			else if (EXAM_CD.equals("31")) {
				sql += " AND A.EEA_EXAM_CD = '31001' ";
			}
			else if (EXAM_CD.equals("32")) {
				sql += " AND A.EEA_EXAM_CD = '32001' ";
			}
			else if (EXAM_CD.equals("36")) {
				sql += " AND A.EEA_EXAM_CD = '36001' ";
			}
			else if (EXAM_CD.equals("41")) {
				sql += " AND SUBSTR(A.EEA_SPSB_CD,1,2) = '" + EXAM_CD + "' ";
			}
			else if (EXAM_CD.equals("42")) {
				sql += " AND SUBSTR(A.EEA_SPSB_CD,1,2) = '" + EXAM_CD + "' ";
			}

		} else {
			sql += " AND (SUBSTR(A.EEA_EXAM_CD,1,2) IN ('11', '12', '13', '14', '21', '31', '32', '41', '42', '71', '91') ";
			sql += " OR (EEA_HTSB_YN = 'Y' AND SUBSTR(A.EEA_HTSB_CD,1,2) IN ('11', '12', '13', '14')) ";
			sql += " OR  EEA_STOMA_CD <> '0' OR EEA_COLON_CD <> '0' OR EEA_LIVER_CD <> '0' ";
			sql += " OR  EEA_BAST_CD  <> '0' OR EEA_UTER_CD  <> '0' OR NVL(EEA_LUNG_CD, '0') <> '0' ";
			sql += " OR  EEA_ETSB_YN = 'Y') ";
		}


		if(SEND_GB.equals("1")){
			sql += " AND NVL(G.ERL_SUCC_YN, 'N') <> 'Y' ";
		}
		else if(SEND_GB.equals("2")){
			sql += " AND NVL(G.ERL_SUCC_YN, 'N') = 'Y' ";
		}

		sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uEmail_Send_btnSearchClick_001 \n";
			G_INFO += "설명 : 결과전송대상 목록 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ENCK_KD : " + ENCK_KD + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " CHART_NO : " + CHART_NO + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " SEND_GB : " + SEND_GB + " \n";
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
