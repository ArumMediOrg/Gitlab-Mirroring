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
		String MNGT_YR = htMethod.get("MNGT_YR");
		String PROF_SQ = htMethod.get("PROF_SQ");
		String OPTN_SQ = htMethod.get("OPTN_SQ");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }
		if(OPTN_SQ == null) { OPTN_SQ = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.ECO_MNGT_YR || '-' || B.ECO_CNRT_SQ || B.ECO_PROF_SQ EXAM_DP, 
       B.ECO_CNRT_SQ || B.ECO_PROF_SQ EXAM_SQ, B.ECO_OPTN_NM, B.ECO_OPTN_LT OPTN_LT, 
       B.ECO_OPTN_PR OPTN_PR, B.ECO_OPTN_CNT OPTN_CNT, B.ECO_OPTN_SQ OPTN_SQ, 
       TO_CHAR(TO_DATE(A.ECP_INPT_DTT), 'YYYY-MM-DD') PRCE_DT, A.ECP_CALC_CD CALC_CD 
  FROM ET_COMP_CNRT_PROF A, ET_COMP_CNRT_OPTN B 
 WHERE A.ECP_COMP_CD = :COMP_CD 
   AND A.ECP_MNGT_YR = :MNGT_YR 
   AND A.ECP_CNRT_SQ || A.ECP_PROF_SQ = :PROF_SQ 
   AND B.ECO_COMP_CD = A.ECP_COMP_CD 
   AND B.ECO_MNGT_YR = A.ECP_MNGT_YR 
   AND B.ECO_CNRT_SQ = A.ECP_CNRT_SQ 
   AND B.ECO_PROF_SQ = A.ECP_PROF_SQ 
   AND B.ECO_OPTN_SQ = :OPTN_SQ
   AND B.ECO_OPTN_CNT > 0 
   AND NVL(B.ECO_OPTN_LT, ' ') <> ' ' 
   AND UPPER(B.ECO_USE_YN) = 'Y'
  :PARAM_TX
		*/

		sql = " SELECT B.ECO_MNGT_YR || '-' || B.ECO_CNRT_SQ || B.ECO_PROF_SQ EXAM_DP, B.ECO_CNRT_SQ || B.ECO_PROF_SQ EXAM_SQ, B.ECO_OPTN_NM, B.ECO_OPTN_LT OPTN_LT, B.ECO_OPTN_PR OPTN_PR, B.ECO_OPTN_CNT OPTN_CNT, B.ECO_OPTN_SQ OPTN_SQ, TO_CHAR(TO_DATE(A.ECP_INPT_DTT), 'YYYY-MM-DD') PRCE_DT, A.ECP_CALC_CD CALC_CD";
		sql += " FROM ET_COMP_CNRT_PROF A, ET_COMP_CNRT_OPTN B";
		sql += " WHERE A.ECP_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.ECP_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND A.ECP_CNRT_SQ || A.ECP_PROF_SQ = '" + PROF_SQ + "'";
		sql += " AND B.ECO_COMP_CD = A.ECP_COMP_CD";
		sql += " AND B.ECO_MNGT_YR = A.ECP_MNGT_YR";
		sql += " AND B.ECO_CNRT_SQ = A.ECP_CNRT_SQ";
		sql += " AND B.ECO_PROF_SQ = A.ECP_PROF_SQ";
		sql += " AND B.ECO_OPTN_SQ = '" + OPTN_SQ + "'";
		sql += " AND B.ECO_OPTN_CNT > 0";
		sql += " AND NVL(B.ECO_OPTN_LT, ' ') <> ' '";
		sql += " AND UPPER(B.ECO_USE_YN) = 'Y'";
		sql += PARAM_TX;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamSetting_014 \n";
			G_INFO += "설명 : 사업장묶음 종검옵션 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
			G_INFO += " OPTN_SQ : " + OPTN_SQ + " \n";
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
		<s:AttributeType name='EXAM_DP' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='9'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_SQ' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_OPTN_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_LT' rs:number='4' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_LT'>
			<s:datatype dt:type='string' dt:maxLength='400' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_PR' rs:number='5' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_CNT' rs:number='6' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_CNT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_SQ' rs:number='7' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PRCE_DT' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CALC_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_CALC_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c10' rs:name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='ET_COMP_CNRT_OPTN'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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

			String EXAM_DP_T = cRsList.getString("EXAM_DP");
			String EXAM_SQ_T = cRsList.getString("EXAM_SQ");
			String ECO_OPTN_NM_T = cRsList.getString("ECO_OPTN_NM");
			String OPTN_LT_T = cRsList.getString("OPTN_LT");
			String OPTN_PR_T = cRsList.getString("OPTN_PR");
			String OPTN_CNT_T = cRsList.getString("OPTN_CNT");
			String OPTN_SQ_T = cRsList.getString("OPTN_SQ");
			String PRCE_DT_T = cRsList.getString("PRCE_DT");
			String CALC_CD_T = cRsList.getString("CALC_CD");
			String ROWID_T = cRsList.getString("ROWID");
			String c10_T = cRsList.getString("c10");
%>
			<z:row
<%
			if(! EXAM_DP_T.equals("")) {
%>
		 		EXAM_DP='<%= EXAM_DP_T%>'
<%
			}

			if(! EXAM_SQ_T.equals("")) {
%>
		 		EXAM_SQ='<%= EXAM_SQ_T%>'
<%
			}

			if(! ECO_OPTN_NM_T.equals("")) {
%>
		 		ECO_OPTN_NM='<%= ECO_OPTN_NM_T%>'
<%
			}

			if(! OPTN_LT_T.equals("")) {
%>
		 		OPTN_LT='<%= OPTN_LT_T%>'
<%
			}

			if(! OPTN_PR_T.equals("")) {
%>
		 		OPTN_PR='<%= OPTN_PR_T%>'
<%
			}

			if(! OPTN_CNT_T.equals("")) {
%>
		 		OPTN_CNT='<%= OPTN_CNT_T%>'
<%
			}

			if(! OPTN_SQ_T.equals("")) {
%>
		 		OPTN_SQ='<%= OPTN_SQ_T%>'
<%
			}

			if(! PRCE_DT_T.equals("")) {
%>
		 		PRCE_DT='<%= PRCE_DT_T%>'
<%
			}

			if(! CALC_CD_T.equals("")) {
%>
		 		CALC_CD='<%= CALC_CD_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c10_T.equals("")) {
%>
		 		c10='<%= c10_T%>'
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
