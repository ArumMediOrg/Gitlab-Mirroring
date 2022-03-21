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

		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_COMP_CD, B.ICY_COMP_NM, B.ICY_ZIP_AR + B.ICY_ROAD_AR AS ICR_ADRESS, B.ICY_TEL_NO, B.ICY_PRES_NM,
       F_CODE_FIND('0833', B.ICY_LABO_CD, '5', 1) ICY_LABO_NM,
       GetCOMMON_LvCdToNm('0805', B.ICY_TKGJ_CD, '5', 1) ICY_TKGJ_NM,
       MIN(A.EEA_EXAM_DT) AS EEA_MIN_DT, MAX(A.EEA_EXAM_DT) AS EEA_MAX_DT
  FROM ET_EXAM_ACPT A
       LEFT OUTER JOIN IT_COMPANY B  ON A.EEA_COMP_CD = B.ICY_COMP_CD
 WHERE 0 = 0
   AND A.EEA_ORDER_YN <> 'C'   
    
:PARAM_TX1
:PARAM_TX2

:ORDER_BY

		*/

		sql = " SELECT A.EEA_COMP_CD, B.ICY_COMP_NM, B.ICY_ZIP_AR || B.ICY_ROAD_AR AS ICR_ADRESS, B.ICY_TEL_NO, B.ICY_PRES_NM, F_CODE_FIND('0833', B.ICY_LABO_CD, '5', 1) ICY_LABO_NM, GETCOMMON_LVCDTONM('0805', B.ICY_TKGJ_CD, '5', 1) ICY_TKGJ_NM, MIN(A.EEA_EXAM_DT) AS EEA_MIN_DT, MAX(A.EEA_EXAM_DT) AS EEA_MAX_DT";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN IT_COMPANY B";
		sql += " ON A.EEA_COMP_CD = B.ICY_COMP_CD";
		sql += " WHERE 0 = 0";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		
		sql += PARAM_TX1;
		sql += PARAM_TX2;
		sql += ORDER_BY;


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_COMPLIST_UF_SqlSet_002 \n";
			G_INFO += "설명 : 02-특수검진실시사업장(검진인원/유질환건수) 대상자 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
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
		<s:AttributeType name='ICR_ADRESS' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TEL_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_PRES_NM' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_PRES_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_LABO_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKGJ_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MIN_DT' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MAX_DT' rs:number='9' rs:nullable='true'>
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

			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ICR_ADRESS_T = cRsList.getString("ICR_ADRESS");
			String ICY_TEL_NO_T = cRsList.getString("ICY_TEL_NO");
			String ICY_PRES_NM_T = cRsList.getString("ICY_PRES_NM");
			String ICY_LABO_NM_T = cRsList.getString("ICY_LABO_NM");
			String ICY_TKGJ_NM_T = cRsList.getString("ICY_TKGJ_NM");
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

			if(! ICR_ADRESS_T.equals("")) {
%>
		 		ICR_ADRESS='<%= ICR_ADRESS_T%>'
<%
			}

			if(! ICY_TEL_NO_T.equals("")) {
%>
		 		ICY_TEL_NO='<%= ICY_TEL_NO_T%>'
<%
			}

			if(! ICY_PRES_NM_T.equals("")) {
%>
		 		ICY_PRES_NM='<%= ICY_PRES_NM_T%>'
<%
			}

			if(! ICY_LABO_NM_T.equals("")) {
%>
		 		ICY_LABO_NM='<%= ICY_LABO_NM_T%>'
<%
			}

			if(! ICY_TKGJ_NM_T.equals("")) {
%>
		 		ICY_TKGJ_NM='<%= ICY_TKGJ_NM_T%>'
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
