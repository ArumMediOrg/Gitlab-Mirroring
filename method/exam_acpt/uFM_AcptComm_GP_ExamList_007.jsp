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
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String MKJJ_CD = htMethod.get("MKJJ_CD");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(MKJJ_CD == null) { MKJJ_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT SIR_MATT_CD EXAM_CD, SIR_EXAM_SQ EXAM_SQ,
       SIR_MATT_CD||'-'||SIR_MKJJ_CD EXAM_DP, F_TBAS_CD(:COMP_CD) CALC_CD, 
       F_MKJJ_FIND(SIR_MKJJ_CD) ||'-'|| F_MATT_FIND(SUBSTR(SIR_EXAM_DT, 1, 4), SIR_MATT_CD) EXAM_NM,
       SIR_MATT_CD, SIR_EITEM_LT || SIR_SITEM_LT ITEM_LT, 
       SIR_EXAM_CHA||SIR_MATT_CD||SIR_ORGA_CD||SIR_MKJJ_CD SIR_PK, SIR_ZERO_LT ZERO_LT
  FROM ST_ITEM_RECHECK 
 WHERE SIR_EXAM_DT = TO_CHAR(TO_DATE(:EXAM_DT, 'YYYY-MM-DD'), 'YYYY-MM-DD') 
   AND SIR_EXAM_SQ = :EXAM_SQ
   AND SIR_MATT_CD || SIR_MKJJ_CD = :MKJJ_CD
		*/

		sql = " SELECT SIR_MATT_CD EXAM_CD, SIR_EXAM_SQ EXAM_SQ, SIR_MATT_CD||'-'||SIR_MKJJ_CD EXAM_DP, F_TBAS_CD('" + COMP_CD + "') CALC_CD, F_MKJJ_FIND(SIR_MKJJ_CD) ||'-'|| F_MATT_FIND(SUBSTR(SIR_EXAM_DT, 1, 4), SIR_MATT_CD) EXAM_NM, SIR_MATT_CD, SIR_EITEM_LT || SIR_SITEM_LT ITEM_LT, SIR_EXAM_CHA||SIR_MATT_CD||SIR_ORGA_CD||SIR_MKJJ_CD SIR_PK, SIR_ZERO_LT ZERO_LT";
		sql += " FROM ST_ITEM_RECHECK";
		sql += " WHERE SIR_EXAM_DT = TO_CHAR(TO_DATE('" + EXAM_DT + "', 'YYYY-MM-DD'), 'YYYY-MM-DD')";
		sql += " AND SIR_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND SIR_MATT_CD || SIR_MKJJ_CD = '" + MKJJ_CD + "'";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamList_007 \n";
			G_INFO += "설명 : 특검2차 대상 물질 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " MKJJ_CD : " + MKJJ_CD + " \n";
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
		<s:AttributeType name='EXAM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_DP' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='CALC_CD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_MATT_CD' rs:number='6' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_LT' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='800'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_PK' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='ZERO_LT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_ZERO_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='ROWID'
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

			String EXAM_CD_T = cRsList.getString("EXAM_CD");
			String EXAM_SQ_T = cRsList.getString("EXAM_SQ");
			String EXAM_DP_T = cRsList.getString("EXAM_DP");
			String CALC_CD_T = cRsList.getString("CALC_CD");
			String EXAM_NM_T = cRsList.getString("EXAM_NM");
			String SIR_MATT_CD_T = cRsList.getString("SIR_MATT_CD");
			String ITEM_LT_T = cRsList.getString("ITEM_LT");
			String SIR_PK_T = cRsList.getString("SIR_PK");
			String ZERO_LT_T = cRsList.getString("ZERO_LT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EXAM_CD_T.equals("")) {
%>
		 		EXAM_CD='<%= EXAM_CD_T%>'
<%
			}

			if(! EXAM_SQ_T.equals("")) {
%>
		 		EXAM_SQ='<%= EXAM_SQ_T%>'
<%
			}

			if(! EXAM_DP_T.equals("")) {
%>
		 		EXAM_DP='<%= EXAM_DP_T%>'
<%
			}

			if(! CALC_CD_T.equals("")) {
%>
		 		CALC_CD='<%= CALC_CD_T%>'
<%
			}

			if(! EXAM_NM_T.equals("")) {
%>
		 		EXAM_NM='<%= EXAM_NM_T%>'
<%
			}

			if(! SIR_MATT_CD_T.equals("")) {
%>
		 		SIR_MATT_CD='<%= SIR_MATT_CD_T%>'
<%
			}

			if(! ITEM_LT_T.equals("")) {
%>
		 		ITEM_LT='<%= ITEM_LT_T%>'
<%
			}

			if(! SIR_PK_T.equals("")) {
%>
		 		SIR_PK='<%= SIR_PK_T%>'
<%
			}

			if(! ZERO_LT_T.equals("")) {
%>
		 		ZERO_LT='<%= ZERO_LT_T%>'
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
