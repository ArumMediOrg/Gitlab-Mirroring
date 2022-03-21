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
		String MNGT_SYR = htMethod.get("MNGT_SYR");
		String MNGT_EYR = htMethod.get("MNGT_EYR");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_SYR == null) { MNGT_SYR = ""; }
		if(MNGT_EYR == null) { MNGT_EYR = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.ECP_MNGT_YR || B.ECP_EXAM_CD || B.ECP_CNRT_SQ || B.ECP_PROF_SQ EXAM_DP,
       B.ECP_PROF_NM ||'-'|| B.ECP_PROF_TL ||'('|| B.ECP_MNGT_YR ||')' EXAM_NM,
       B.ECP_MNGT_YR, B.ECP_EXAM_CD, B.ECP_CNRT_SQ, B.ECP_PROF_SQ,
       B.ECP_PROF_NM, B.ECP_PROF_TL, B.ECP_MNGT_YR 
  FROM ET_COMP_CNRT A, ET_COMP_CNRT_PROF B, IT_COMPANY C 
 WHERE C.ICY_COMP_CD = :COMP_CD
   AND A.ECC_COMP_CD = C.ICY_COMP_CD 
   AND A.ECC_MNGT_YR BETWEEN :MNGT_SYR AND :MNGT_EYR
   AND UPPER(A.ECC_USE_YN) = 'Y' 
   AND B.ECP_COMP_CD = A.ECC_COMP_CD 
   AND B.ECP_MNGT_YR = A.ECC_MNGT_YR 
   AND B.ECP_CNRT_SQ = A.ECC_CNRT_SQ 
   AND UPPER(B.ECP_USE_YN) = 'Y' 
 ORDER BY B.ECP_MNGT_YR, B.ECP_EXAM_CD, B.ECP_CNRT_SQ, , B.ECP_PROF_SQ 
		*/

		sql = " SELECT B.ECP_MNGT_YR || B.ECP_EXAM_CD || B.ECP_CNRT_SQ || B.ECP_PROF_SQ EXAM_DP, B.ECP_PROF_NM ||'-'|| B.ECP_PROF_TL ||'('|| B.ECP_MNGT_YR ||')' EXAM_NM, B.ECP_MNGT_YR, B.ECP_EXAM_CD, B.ECP_CNRT_SQ, B.ECP_PROF_SQ, B.ECP_PROF_NM, B.ECP_PROF_TL, B.ECP_MNGT_YR";
		sql += " FROM ET_COMP_CNRT A, ET_COMP_CNRT_PROF B, IT_COMPANY C";
		sql += " WHERE C.ICY_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.ECC_COMP_CD = C.ICY_COMP_CD";
		sql += " AND A.ECC_MNGT_YR BETWEEN '" + MNGT_SYR + "'";
		sql += " AND '" + MNGT_EYR + "'";
		sql += " AND UPPER(A.ECC_USE_YN) = 'Y'";
		sql += " AND B.ECP_COMP_CD = A.ECC_COMP_CD";
		sql += " AND B.ECP_MNGT_YR = A.ECC_MNGT_YR";
		sql += " AND B.ECP_CNRT_SQ = A.ECC_CNRT_SQ";
		sql += " AND UPPER(B.ECP_USE_YN) = 'Y'";
		sql += " ORDER BY B.ECP_MNGT_YR, B.ECP_EXAM_CD, B.ECP_CNRT_SQ, B.ECP_PROF_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_FindCompPack_001 \n";
			G_INFO += "설명 : 사업장별 전체 묶음 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_SYR : " + MNGT_SYR + " \n";
			G_INFO += " MNGT_EYR : " + MNGT_EYR + " \n";
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
			<s:datatype dt:type='string' dt:maxLength='18'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='207'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_MNGT_YR' rs:number='3' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_EXAM_CD' rs:number='4' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_CNRT_SQ' rs:number='5' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_CNRT_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PROF_SQ' rs:number='6' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_PROF_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PROF_NM' rs:number='7' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF' rs:basecolumn='ECP_PROF_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ECP_PROF_TL' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF'
			 rs:basecolumn='ECP_PROF_TL'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='ET_COMP_CNRT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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
			String EXAM_NM_T = cRsList.getString("EXAM_NM");
			String ECP_MNGT_YR_T = cRsList.getString("ECP_MNGT_YR");
			String ECP_EXAM_CD_T = cRsList.getString("ECP_EXAM_CD");
			String ECP_CNRT_SQ_T = cRsList.getString("ECP_CNRT_SQ");
			String ECP_PROF_SQ_T = cRsList.getString("ECP_PROF_SQ");
			String ECP_PROF_NM_T = cRsList.getString("ECP_PROF_NM");
			String ECP_PROF_TL_T = cRsList.getString("ECP_PROF_TL");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EXAM_DP_T.equals("")) {
%>
		 		EXAM_DP='<%= EXAM_DP_T%>'
<%
			}

			if(! EXAM_NM_T.equals("")) {
%>
		 		EXAM_NM='<%= EXAM_NM_T%>'
<%
			}

			if(! ECP_MNGT_YR_T.equals("")) {
%>
		 		ECP_MNGT_YR='<%= ECP_MNGT_YR_T%>'
<%
			}

			if(! ECP_EXAM_CD_T.equals("")) {
%>
		 		ECP_EXAM_CD='<%= ECP_EXAM_CD_T%>'
<%
			}

			if(! ECP_CNRT_SQ_T.equals("")) {
%>
		 		ECP_CNRT_SQ='<%= ECP_CNRT_SQ_T%>'
<%
			}

			if(! ECP_PROF_SQ_T.equals("")) {
%>
		 		ECP_PROF_SQ='<%= ECP_PROF_SQ_T%>'
<%
			}

			if(! ECP_PROF_NM_T.equals("")) {
%>
		 		ECP_PROF_NM='<%= ECP_PROF_NM_T%>'
<%
			}

			if(! ECP_PROF_TL_T.equals("")) {
%>
		 		ECP_PROF_TL='<%= ECP_PROF_TL_T%>'
<%
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
