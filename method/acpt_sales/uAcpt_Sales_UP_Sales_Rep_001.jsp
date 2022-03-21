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

		String USER_KD = htMethod.get("USER_KD");
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String SALES_ID = htMethod.get("SALES_ID");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(USER_KD == null) { USER_KD = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(SALES_ID == null) { SALES_ID = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CASE WHEN :USER_KD = '1' THEN NVL(EEA_SALES_ID, ' ') ELSE NVL(EEA_EXEC_ID, ' ') END SALES_REP , 
       COUNT(*) SALES_CNT, 
       SUM(CASE WHEN EEA_EXAM_CD = '31001' THEN 0 ELSE EEA_PSNLR_PR END) AS PSNL_PR, 
       SUM(CASE WHEN EEA_EXAM_CD = '31001' THEN EEA_COMPR_PR+EEA_PSNLR_PR ELSE EEA_COMPR_PR END) AS COMP_PR, 
       SUM(EEA_HLTHR_PR) HLTH_PR, SUM(EEA_SPCLR_PR) SPCL_PR, SUM(EEA_DISC_PR)  DISC_PR, SUM(EEA_DISC_CPR) DISC_CPR 
  FROM ET_EXAM_ACPT  
 WHERE EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
   AND EEA_ORDER_YN <> 'C'
   AND NVL(EEA_RECE_NO, ' ') <> 'R'
  
IF (:SALES_ID <> '') THEN
   AND CASE WHEN :USER_KD = '1' THEN SUBSTR(EEA_SALES_ID, 1, INSTR(NVL(EEA_SALES_ID, ' '), '-')
                                ELSE SUBSTR(EEA_EXEC_ID,  1, INSTR(NVL(EEA_EXEC_ID,  ' '), '-') END = :SALES_ID

 :PARAM_TX

 GROUP BY CASE WHEN :USER_KD = '1' THEN NVL(EEA_SALES_ID, ' ') ELSE NVL(EEA_EXEC_ID, ' ') END
 ORDER BY CASE WHEN :USER_KD = '1' THEN NVL(EEA_SALES_ID, ' ') ELSE NVL(EEA_EXEC_ID, ' ') END
		*/

		sql = " SELECT CASE WHEN '" + USER_KD + "' = '1' THEN NVL(EEA_SALES_ID, ' ') ELSE NVL(EEA_EXEC_ID, ' ') END SALES_REP";
		sql += ", COUNT(*) SALES_CNT";
		sql += ", SUM(CASE WHEN EEA_EXAM_CD = '31001' THEN 0 ELSE EEA_PSNLR_PR END) AS PSNL_PR";
		sql += ", SUM(CASE WHEN EEA_EXAM_CD = '31001' THEN EEA_COMPR_PR+EEA_PSNLR_PR ELSE EEA_COMPR_PR END) AS COMP_PR";
		sql += ", SUM(EEA_HLTHR_PR) HLTH_PR, SUM(EEA_SPCLR_PR) SPCL_PR, SUM(EEA_DISC_PR)  DISC_PR, SUM(EEA_DISC_CPR) DISC_CPR";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND EEA_ORDER_YN <> 'C'";
		sql += " AND NVL(EEA_RECE_NO, ' ') <> 'R'";

		if(!SALES_ID.equals("")){
			sql += " AND CASE WHEN '" + USER_KD + "' = '1' THEN SUBSTR(EEA_SALES_ID, 1, INSTR(NVL(EEA_SALES_ID, ' '), '-')) ELSE SUBSTR(EEA_EXEC_ID, 1, INSTR(NVL(EEA_EXEC_ID, ' '), '-')) END = '" + SALES_ID + "' ";
		}


		sql += PARAM_TX;
		sql += " GROUP BY CASE WHEN '" + USER_KD + "' = '1' THEN NVL(EEA_SALES_ID, ' ') ELSE NVL(EEA_EXEC_ID, ' ') END";
		sql += " ORDER BY CASE WHEN '" + USER_KD + "' = '1' THEN NVL(EEA_SALES_ID, ' ') ELSE NVL(EEA_EXEC_ID, ' ') END";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_Sales_UP_Sales_Rep_001 \n";
			G_INFO += "설명 : 영업/수행 담당자별 현황 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " USER_KD : " + USER_KD + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " SALES_ID : " + SALES_ID + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
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
		<s:AttributeType name='SALES_REP' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='SALES_REP'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='SALES_CNT' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PSNL_PR' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='COMP_PR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HLTH_PR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SPCL_PR' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DISC_PR' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DISC_CPR' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String SALES_REP_T = cRsList.getString("SALES_REP");
			String SALES_CNT_T = cRsList.getString("SALES_CNT");
			String PSNL_PR_T = cRsList.getString("PSNL_PR");
			String COMP_PR_T = cRsList.getString("COMP_PR");
			String HLTH_PR_T = cRsList.getString("HLTH_PR");
			String SPCL_PR_T = cRsList.getString("SPCL_PR");
			String DISC_PR_T = cRsList.getString("DISC_PR");
			String DISC_CPR_T = cRsList.getString("DISC_CPR");
%>
			<z:row
<%
			if(! SALES_REP_T.equals("")) {
%>
		 		SALES_REP='<%= SALES_REP_T%>'
<%
			}

			if(! SALES_CNT_T.equals("")) {
%>
		 		SALES_CNT='<%= SALES_CNT_T%>'
<%
			}

			if(! PSNL_PR_T.equals("")) {
%>
		 		PSNL_PR='<%= PSNL_PR_T%>'
<%
			}

			if(! COMP_PR_T.equals("")) {
%>
		 		COMP_PR='<%= COMP_PR_T%>'
<%
			}

			if(! HLTH_PR_T.equals("")) {
%>
		 		HLTH_PR='<%= HLTH_PR_T%>'
<%
			}

			if(! SPCL_PR_T.equals("")) {
%>
		 		SPCL_PR='<%= SPCL_PR_T%>'
<%
			}

			if(! DISC_PR_T.equals("")) {
%>
		 		DISC_PR='<%= DISC_PR_T%>'
<%
			}

			if(! DISC_CPR_T.equals("")) {
%>
		 		DISC_CPR='<%= DISC_CPR_T%>'
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
