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
		String MNGT_YR = htMethod.get("MNGT_YR");
		String PARAM_TX = htMethod.get("PARAM_TX");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_COMP_CD, B.ICY_COMP_NM, B.ICY_LABO_CD, 
       MIN(A.EEA_EXAM_DT) AS EEA_MIN_DT, MAX(A.EEA_EXAM_DT) AS EEA_MAX_DT 
  FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_COMPANY B ON A.EEA_COMP_CD = B.ICY_COMP_CD
 WHERE A.EEA_EXAM_DT >= :EXAM_SDT
   AND A.EEA_EXAM_DT <= :EXAM_EDT
   AND A.EEA_ORDER_YN <> 'C'   
   AND SUBSTR(A.EEA_MNGT_SPYM,1,4) = :MNGT_YR
    
:PARAM_TX
:ORDER_BY
		*/

		sql = " SELECT A.EEA_COMP_CD, B.ICY_COMP_NM, B.ICY_LABO_CD, MIN(A.EEA_EXAM_DT) AS EEA_MIN_DT, MAX(A.EEA_EXAM_DT) AS EEA_MAX_DT";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_COMPANY B";
		sql += " ON A.EEA_COMP_CD = B.ICY_COMP_CD";
		sql += " WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND SUBSTR(A.EEA_MNGT_SPYM,1,4) = '" + MNGT_YR + "'";
		sql += PARAM_TX;
		sql += ORDER_BY;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_HOSPLIST_UF_SqlSet_001 \n";
			G_INFO += "설명 : 01-근로자 건강진단 실시현황 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
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
		<s:AttributeType name='EEA_COMP_CD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_LABO_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_LABO_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MIN_DT' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MAX_DT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ICY_LABO_CD_T = cRsList.getString("ICY_LABO_CD");
			String EEA_MIN_DT_T = cRsList.getString("EEA_MIN_DT");
			String EEA_MAX_DT_T = cRsList.getString("EEA_MAX_DT");
%>
			<z:row
<%
			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! ICY_LABO_CD_T.equals("")) {
%>
		 		ICY_LABO_CD='<%= ICY_LABO_CD_T%>'
<%
			}

			if(! EEA_MIN_DT_T.equals("")) {
%>
		 		EEA_MIN_DT='<%= EEA_MIN_DT_T%>'
<%
			}

			if(! EEA_MAX_DT_T.equals("")) {
%>
		 		EEA_MAX_DT='<%= EEA_MAX_DT_T%>'
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
