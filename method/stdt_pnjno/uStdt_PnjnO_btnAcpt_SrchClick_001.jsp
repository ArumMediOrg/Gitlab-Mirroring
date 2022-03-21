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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String COMP_CD = htMethod.get("COMP_CD");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String PARAM_TX = htMethod.get("PARAM_TX");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_ORAL_YN, A.EEA_FOOD_YN, A.EEA_CHART_NO, 
       CASE WHEN A.EEA_TOTAL_YN = 'N' AND A.EEA_CANAD_YN = 'N' THEN 'X' 
            ELSE CASE WHEN C.ESO_PNJN_RD = '1' THEN 'RD' 
                      WHEN C.ESO_PNJN_R  = '1' THEN 'R' 
                      WHEN C.ESO_PNJN_B  = '1' THEN 'B' 
                      WHEN C.ESO_PNJN_A  = '1' THEN 'A' ELSE '' END END AS ESO_TOTAL_PJ, 
       CASE WHEN A.EEA_ORAL_YN = 'N' THEN 'X' 
            ELSE C.ESO_PNJN_ORAL END AS ESO_ORAL_PJ, 
       CASE WHEN A.EEA_UTER_CD <> '2' THEN 'X' 
            ELSE D.ECV_RSLT_KD END AS ECV_UTER_PJ, 
       NVL(C.ESO_EPNJN_YN, 'N') ESO_EPNJN_YN, NVL(C.ESO_OPNJN_YN, 'N') ESO_OPNJN_YN,
       A.EEA_PSNL_NM, B.ICR_BIRH_DT, A.EEA_CUST_NO, A.EEA_DIVI_CS, A.EEA_SEX_CD, 
       CASE WHEN A.EEA_RSLT_CD = '0' THEN '대기' 
            ELSE CASE WHEN A.EEA_RSLT_CD = '1' THEN '입력중' 
            ELSE '완료' END END AS EEA_RSLT_NM, 
       NVL((SELECT EPM_MEMO_SQ FROM ET_PSNL_MEMO WHERE EPM_CUST_NO = A.EEA_CUST_NO AND ROWNUM = 1), '0') EPM_MEMO_SQ, 
       F_PID(B.ICR_PENL_ID) EEA_PSNL_ID, 
       F_TEL_FORMAT(B.ICR_MOBL_NO) EEA_MOBL_NO, 
       F_COMP_FIND(A.EEA_COMP_CD)  EEA_COMP_NM 
  FROM ET_EXAM_ACPT A
            INNER JOIN IT_CUSTOMER B    ON B.ICR_CUST_NO = A.EEA_CUST_NO  
       LEFT OUTER JOIN ET_STDT_PNJNO C  ON C.ESO_EXAM_DT = A.EEA_EXAM_DT AND C.ESO_EXAM_SQ = A.EEA_EXAM_SQ 
       LEFT OUTER JOIN ET_CANCER_CRVC D ON D.ECV_EXAM_DT = A.EEA_EXAM_DT AND D.ECV_EXAM_SQ = A.EEA_EXAM_SQ 
 WHERE A.EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
   AND A.EEA_EXAM_CD = '31006' 
   AND A.EEA_ORDER_YN <> 'C' 

IF (:COMP_CD <> '') THEN
   AND A.EEA_COMP_CD = :COMP_CD
   
IF (:PSNL_NM <> '') THEN
   AND A.EEA_PSNL_NM LIKE '%' || :PSNL_NM || '%'

:PARAM_TX

:ORDER_BY
      

		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_ORAL_YN, A.EEA_FOOD_YN, A.EEA_CHART_NO";
		
		sql += ", CASE WHEN A.EEA_TOTAL_YN = 'N' AND A.EEA_CANAD_YN = 'N' THEN 'X' ELSE";
		sql += "	CASE WHEN C.ESO_PNJN_RD = '1' THEN 'RD' WHEN C.ESO_PNJN_R = '1' THEN 'R' WHEN C.ESO_PNJN_B = '1' THEN 'B' WHEN C.ESO_PNJN_A = '1' THEN 'A' ELSE '' END";
		sql += " END AS ESO_TOTAL_PJ";
		
		sql += ", CASE WHEN A.EEA_ORAL_YN = 'N' THEN 'X' ELSE C.ESO_PNJN_ORAL END AS ESO_ORAL_PJ";
		sql += ", CASE WHEN A.EEA_UTER_CD <> '2' THEN 'X' ELSE D.ECV_RSLT_KD END AS ECV_UTER_PJ";
		sql += ", NVL(C.ESO_EPNJN_YN, 'N') ESO_EPNJN_YN, NVL(C.ESO_OPNJN_YN, 'N') ESO_OPNJN_YN, A.EEA_PSNL_NM, B.ICR_BIRH_DT, A.EEA_CUST_NO, A.EEA_DIVI_CS, A.EEA_SEX_CD";

		sql += ", CASE WHEN A.EEA_RSLT_CD = '0' THEN '대기' ELSE";
		sql += "	CASE WHEN A.EEA_RSLT_CD = '1' THEN '입력중' ELSE '완료' END";
		sql += " END AS EEA_RSLT_NM";
		
		sql += ", NVL(";
		sql += "	(";
		sql += "		SELECT EPM_MEMO_SQ";
		sql += " 		FROM ET_PSNL_MEMO";
		sql += " 		WHERE EPM_CUST_NO = A.EEA_CUST_NO";
		sql += " 		AND ROWNUM = 1";
		sql += "	), '0') EPM_MEMO_SQ";
		
		sql += ", F_PID(B.ICR_PENL_ID) EEA_PSNL_ID, F_TEL_FORMAT(B.ICR_MOBL_NO) EEA_MOBL_NO, F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.EEA_CUST_NO LEFT OUTER JOIN ET_STDT_PNJNO C";
		sql += " ON C.ESO_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND C.ESO_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ET_CANCER_CRVC D";
		sql += " ON D.ECV_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND D.ECV_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";
		sql += " AND A.EEA_EXAM_CD = '31006'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(! COMP_CD.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		}

		if(! PSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM LIKE '%" + PSNL_NM + "%'";
		}
		
		sql += PARAM_TX;
		sql += ORDER_BY;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_PnjnO_btnAcpt_SrchClick_001 \n";
			G_INFO += "설명 : 학교밖청소년 검진 접수 조회(결과/판정) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
			G_INFO += " ORDER_BY : " + ORDER_BY + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_YN' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_ORAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FOOD_YN' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FOOD_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_TOTAL_PJ' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_ORAL_PJ' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ECV_UTER_PJ' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EPNJN_YN' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_OPNJN_YN' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='11' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_DIVI_CS'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='13'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CS' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RSLT_NM' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='EPM_MEMO_SQ' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_ID' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_PNJNO'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_CRVC'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='21' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c21' rs:name='ROWID' rs:number='22' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c22' rs:name='ROWID' rs:number='23' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c23' rs:name='ROWID' rs:number='24' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_ORAL_YN_T = cRsList.getString("EEA_ORAL_YN");
			String EEA_FOOD_YN_T = cRsList.getString("EEA_FOOD_YN");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String ESO_TOTAL_PJ_T = cRsList.getString("ESO_TOTAL_PJ");
			String ESO_ORAL_PJ_T = cRsList.getString("ESO_ORAL_PJ");
			String ECV_UTER_PJ_T = cRsList.getString("ECV_UTER_PJ");
			String ESO_EPNJN_YN_T = cRsList.getString("ESO_EPNJN_YN");
			String ESO_OPNJN_YN_T = cRsList.getString("ESO_OPNJN_YN");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_DIVI_CS_T = cRsList.getString("EEA_DIVI_CS");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_RSLT_NM_T = cRsList.getString("EEA_RSLT_NM");
			String EPM_MEMO_SQ_T = cRsList.getString("EPM_MEMO_SQ");
			String EEA_PSNL_ID_T = cRsList.getString("EEA_PSNL_ID");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_COMP_NM_T = cRsList.getString("EEA_COMP_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c21_T = cRsList.getString("c21");
			String c22_T = cRsList.getString("c22");
			String c23_T = cRsList.getString("c23");
%>
			<z:row
<%
			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
<%
			}

			if(! EEA_ORAL_YN_T.equals("")) {
%>
		 		EEA_ORAL_YN='<%= EEA_ORAL_YN_T%>'
<%
			}

			if(! EEA_FOOD_YN_T.equals("")) {
%>
		 		EEA_FOOD_YN='<%= EEA_FOOD_YN_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! ESO_TOTAL_PJ_T.equals("")) {
%>
		 		ESO_TOTAL_PJ='<%= ESO_TOTAL_PJ_T%>'
<%
			}

			if(! ESO_ORAL_PJ_T.equals("")) {
%>
		 		ESO_ORAL_PJ='<%= ESO_ORAL_PJ_T%>'
<%
			}

			if(! ECV_UTER_PJ_T.equals("")) {
%>
		 		ECV_UTER_PJ='<%= ECV_UTER_PJ_T%>'
<%
			}

			if(! ESO_EPNJN_YN_T.equals("")) {
%>
		 		ESO_EPNJN_YN='<%= ESO_EPNJN_YN_T%>'
<%
			}

			if(! ESO_OPNJN_YN_T.equals("")) {
%>
		 		ESO_OPNJN_YN='<%= ESO_OPNJN_YN_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! EEA_DIVI_CS_T.equals("")) {
%>
		 		EEA_DIVI_CS='<%= EEA_DIVI_CS_T%>'
<%
			}

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}

			if(! EEA_RSLT_NM_T.equals("")) {
%>
		 		EEA_RSLT_NM='<%= EEA_RSLT_NM_T%>'
<%
			}

			if(! EPM_MEMO_SQ_T.equals("")) {
%>
		 		EPM_MEMO_SQ='<%= EPM_MEMO_SQ_T%>'
<%
			}
%>
				EEA_PSNL_ID='<%= cnt%>'
				EEA_MOBL_NO='<%= cnt%>'
				EEA_COMP_NM='<%= cnt%>'
<%
			if(! ROWID_T.equals("")) {
%>
		 		ROWID='<%= ROWID_T%>'
<%
			}

			if(! c21_T.equals("")) {
%>
		 		c21='<%= c21_T%>'
<%
			}

			if(! c22_T.equals("")) {
%>
		 		c22='<%= c22_T%>'
<%
			}

			if(! c23_T.equals("")) {
%>
		 		c23='<%= c23_T%>'
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
