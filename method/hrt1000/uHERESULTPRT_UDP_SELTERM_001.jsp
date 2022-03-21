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

		String COMP_CD = htMethod.get("COMP_CD");
		String DP_FROMDT = htMethod.get("DP_FROMDT");
		String DP_TODT = htMethod.get("DP_TODT");
		String MNGT_HTYR = htMethod.get("MNGT_HTYR");
		String CBDEPT_CDTEXT = htMethod.get("CBDEPT_CDTEXT");
		String CBDEPT_CDVALUE = htMethod.get("CBDEPT_CDVALUE");
		String RZCMB_PLACE1_1 = htMethod.get("RZCMB_PLACE1_1");
		String RZCMB_PLACE1_2 = htMethod.get("RZCMB_PLACE1_2");
		String RZCMB_PLACE2_1 = htMethod.get("RZCMB_PLACE2_1");
		String RZCMB_PLACE2_2 = htMethod.get("RZCMB_PLACE2_2");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }
		if(MNGT_HTYR == null) { MNGT_HTYR = ""; }
		if(CBDEPT_CDTEXT == null) { CBDEPT_CDTEXT = ""; }
		if(CBDEPT_CDVALUE == null) { CBDEPT_CDVALUE = ""; }
		if(RZCMB_PLACE1_1 == null) { RZCMB_PLACE1_1 = ""; }
		if(RZCMB_PLACE1_2 == null) { RZCMB_PLACE1_2 = ""; }
		if(RZCMB_PLACE2_1 == null) { RZCMB_PLACE2_1 = ""; }
		if(RZCMB_PLACE2_2 == null) { RZCMB_PLACE2_2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select MIN(PFP_EXAM_DT) MINDT,MAX(PFP_EXAM_DT) MAXDT
from PT_FIR_PANJUNG A
  left outer join ET_EXAM_ACPT b
    on B.EEA_EXAM_DT = A.PFP_EXAM_DT AND B.EEA_EXAM_SQ = A.PFP_EXAM_SQ
WHERE EEA_COMP_CD  = :COMP_CD
   AND EEA_EXAM_DT >= :dp_fromdt
   AND EEA_EXAM_DT <= :dp_todt
   AND EEA_HTSB_CD in ('11001','12001','12003')
   AND EEA_MNGT_HTYR = :MNGT_HTYR
   AND PFP_FIX_YN = 'Y'
if :cbDept_CdText <> ' then
  AND EEA_DEPT_CD = :cbDept_CdValue

if :RzCmb_place1_1 <> ' then
  AND SUBSTR(EEA_PLCE_CD, 1, 1) = :RzCmb_place1_2

if :RzCmb_place2_1 <> ' then
  AND EEA_PLCE_CD = :RzCmb_place2_2

		*/

		sql = " SELECT MIN(PFP_EXAM_DT) MINDT,MAX(PFP_EXAM_DT) MAXDT";
		sql += " FROM PT_FIR_PANJUNG A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " ON B.EEA_EXAM_DT = A.PFP_EXAM_DT";
		sql += " AND B.EEA_EXAM_SQ = A.PFP_EXAM_SQ";
		sql += " WHERE EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND EEA_EXAM_DT >= '" + DP_FROMDT + "'";
		sql += " AND EEA_EXAM_DT <= '" + DP_TODT + "'";
		sql += " AND EEA_HTSB_CD IN ('11001','12001','12003')";
		sql += " AND EEA_MNGT_HTYR = '" + MNGT_HTYR + "'";
		sql += " AND PFP_FIX_YN = 'Y'";

		if(!CBDEPT_CDTEXT.equals("")) {
			sql += " AND EEA_DEPT_CD = '" + CBDEPT_CDVALUE + "'";

		}
		if(!RZCMB_PLACE1_1.equals("")) {
			sql += " AND SUBSTR(EEA_PLCE_CD, 1, 1) = '" + RZCMB_PLACE1_2 + "'";

		}
		if(!RZCMB_PLACE2_1.equals("")) {
			sql += " AND EEA_PLCE_CD = '" + RZCMB_PLACE2_2 + "'";

		}		
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHERESULTPRT_UDP_SELTERM_001 \n";
			G_INFO += "설명 : 1차판정 정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
			G_INFO += " MNGT_HTYR : " + MNGT_HTYR + " \n";
			G_INFO += " CBDEPT_CDTEXT : " + CBDEPT_CDTEXT + " \n";
			G_INFO += " CBDEPT_CDVALUE : " + CBDEPT_CDVALUE + " \n";
			G_INFO += " RZCMB_PLACE1_1 : " + RZCMB_PLACE1_1 + " \n";
			G_INFO += " RZCMB_PLACE1_2 : " + RZCMB_PLACE1_2 + " \n";
			G_INFO += " RZCMB_PLACE2_1 : " + RZCMB_PLACE2_1 + " \n";
			G_INFO += " RZCMB_PLACE2_2 : " + RZCMB_PLACE2_2 + " \n";
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
		<s:AttributeType name='MINDT' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='MAXDT' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String MINDT_T = cRsList.getString("MINDT");
			String MAXDT_T = cRsList.getString("MAXDT");
%>
			<z:row
<%
			if(! MINDT_T.equals("")) {
%>
		 		MINDT='<%= MINDT_T%>'
<%
			}

			if(! MAXDT_T.equals("")) {
%>
		 		MAXDT='<%= MAXDT_T%>'
<%
			}
%>
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
