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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String SSQL_ADD1 = htMethod.get("SSQL_ADD1");
		String JJ_CD = htMethod.get("JJ_CD");
		String SSQL_ADD2 = htMethod.get("SSQL_ADD2");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(SSQL_ADD1 == null) { SSQL_ADD1 = ""; }
		if(JJ_CD == null) { JJ_CD = ""; }
		if(SSQL_ADD2 == null) { SSQL_ADD2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT DISTINCT B.IIM_ITEM_CD, B.IIM_KNME_NM  CSP_SBCD_NM, C.ERI_RSLT_VL,
       B.IIM_TRTP_CD, GetSP_COMMON_cdToNm('HM05D',CSP_JANGGI_CD) CSP_JANGGI_NM
  FROM CT_SP_PROF A
  INNER JOIN IT_ITEM B      ON A.CSP_SBCD_CD = B.IIM_SBCD_CD
  Inner Join ET_RSLT_ITEM C ON C.ERI_EXAM_DT = :EXAM_DT
                           And C.ERI_EXAM_SQ = :EXAM_SQ
                           And C.ERI_ITEM_CD = B.IIM_ITEM_CD
                           And C.ERI_CNCL_YN <> 'Y'
  ||:sSQL_ADD1
WHERE CSP_USE_YN = 'Y'
  And CSP_CHOC_KD <> '9'
  And CSP_JJ_CD = :JJ_CD
  ||:sSQL_ADD2

		*/

		sql = " SELECT DISTINCT B.IIM_ITEM_CD, B.IIM_KNME_NM CSP_SBCD_NM, C.ERI_RSLT_VL, B.IIM_TRTP_CD, GETSP_COMMON_CDTONM('HM05D',CSP_JANGGI_CD) CSP_JANGGI_NM";
		sql += " FROM CT_SP_PROF A INNER JOIN IT_ITEM B";
		sql += " ON A.CSP_SBCD_CD = B.IIM_SBCD_CD INNER JOIN ET_RSLT_ITEM C";
		sql += " ON C.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND C.ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND C.ERI_ITEM_CD = B.IIM_ITEM_CD";
		sql += " AND C.ERI_CNCL_YN <> 'Y'";
		sql += SSQL_ADD1;
		sql += " WHERE CSP_USE_YN = 'Y'";
		sql += " AND CSP_CHOC_KD <> '9'";
		if (! JJ_CD.equals("")) {
			sql += " And CSP_JJ_CD = '" + JJ_CD + "' ";
		}
		//sql += " AND CSP_JJ_CD = '" + JJ_CD + "'";
		sql += SSQL_ADD2;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_NEWAutoPanjung_Detail_001 \n";
			G_INFO += "설명 : 특검자동판정-표적장기 검사항목 결과조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " SSQL_ADD1 : " + SSQL_ADD1 + " \n";
			G_INFO += " JJ_CD : " + JJ_CD + " \n";
			G_INFO += " SSQL_ADD2 : " + SSQL_ADD2 + " \n";
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
		<s:AttributeType name='IIM_ITEM_CD' rs:number='1' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_SBCD_NM' rs:number='2' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='3' rs:nullable='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='4' rs:nullable='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_TRTP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_JANGGI_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String CSP_SBCD_NM_T = cRsList.getString("CSP_SBCD_NM");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String IIM_TRTP_CD_T = cRsList.getString("IIM_TRTP_CD");
			String CSP_JANGGI_NM_T = cRsList.getString("CSP_JANGGI_NM");
%>
			<z:row
<%
			if(! IIM_ITEM_CD_T.equals("")) {
%>
		 		IIM_ITEM_CD='<%= IIM_ITEM_CD_T%>'
<%
			}

			if(! CSP_SBCD_NM_T.equals("")) {
%>
		 		CSP_SBCD_NM='<%= CSP_SBCD_NM_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! IIM_TRTP_CD_T.equals("")) {
%>
		 		IIM_TRTP_CD='<%= IIM_TRTP_CD_T%>'
<%
			}

			if(! CSP_JANGGI_NM_T.equals("")) {
%>
		 		CSP_JANGGI_NM='<%= CSP_JANGGI_NM_T%>'
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
