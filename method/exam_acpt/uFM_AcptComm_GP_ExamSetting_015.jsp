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

		String OPTN_SQ = htMethod.get("OPTN_SQ");
		String PRO_CD = htMethod.get("PRO_CD");
		String EXAM_CD = htMethod.get("EXAM_CD");
		String PACK_SQ = htMethod.get("PACK_SQ");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(OPTN_SQ == null) { OPTN_SQ = ""; }
		if(PRO_CD == null) { PRO_CD = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }
		if(PACK_SQ == null) { PACK_SQ = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.EPK_EXAM_CD || '-' || B.EPK_PACK_SQ EXAM_DP, B.EPK_PACK_SQ EXAM_SQ, B.EPK_CALC_CD CALC_CD, 
       CASE :OPTN_SQ WHEN '01' THEN A.ARUM_CHOICE1_NO 
                         WHEN '02' THEN A.ARUM_CHOICE2_NO 
                         WHEN '03' THEN A.ARUM_CHOICE3_NO 
                         WHEN '04' THEN A.ARUM_CHOICE4_NO 
                         WHEN '05' THEN A.ARUM_CHOICE5_NO 
                         WHEN '09' THEN '99'            
                         ELSE '0' END 
       AS OPTN_CNT,                              
       CASE :OPTN_SQ WHEN '01' THEN A.ARUM_CHOICE1_CD 
                         WHEN '02' THEN A.ARUM_CHOICE2_CD 
                         WHEN '03' THEN A.ARUM_CHOICE3_CD 
                         WHEN '04' THEN A.ARUM_CHOICE4_CD 
                         WHEN '05' THEN A.ARUM_CHOICE5_CD 
                         WHEN '09' THEN A.ARUM_ADD_CD     
                         ELSE '' END 
       AS OPTN_LT                                 
  FROM ARUM_PACKAGE A, ET_PACK B 
 WHERE A.ARUM_PRO_CD = :PRO_CD 
   AND B.EPK_EXAM_CD = :EXAM_CD 
   AND B.EPK_PACK_SQ = :PACK_SQ
  :PARAM_TX
		*/

		sql = " SELECT B.EPK_EXAM_CD || '-' || B.EPK_PACK_SQ EXAM_DP, B.EPK_PACK_SQ EXAM_SQ, B.EPK_CALC_CD CALC_CD";
		sql += ", CASE '" + OPTN_SQ + "' WHEN '01' THEN A.ARUM_CHOICE1_NO WHEN '02' THEN A.ARUM_CHOICE2_NO WHEN '03' THEN A.ARUM_CHOICE3_NO WHEN '04' THEN A.ARUM_CHOICE4_NO WHEN '05' THEN A.ARUM_CHOICE5_NO WHEN '09' THEN '99' ELSE '0' END AS OPTN_CNT";
		sql += ", CASE '" + OPTN_SQ + "' WHEN '01' THEN A.ARUM_CHOICE1_CD WHEN '02' THEN A.ARUM_CHOICE2_CD WHEN '03' THEN A.ARUM_CHOICE3_CD WHEN '04' THEN A.ARUM_CHOICE4_CD WHEN '05' THEN A.ARUM_CHOICE5_CD WHEN '09' THEN A.ARUM_ADD_CD ELSE '' END AS OPTN_LT";
		sql += " FROM ARUM_PACKAGE A, ET_PACK B";
		sql += " WHERE A.ARUM_PRO_CD = '" + PRO_CD + "'";
		sql += " AND B.EPK_EXAM_CD = '" + EXAM_CD + "'";
		sql += " AND B.EPK_PACK_SQ = '" + PACK_SQ + "'";
		sql += PARAM_TX;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamSetting_015 \n";
			G_INFO += "설명 : 에버헬스 종검옵션 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " OPTN_SQ : " + OPTN_SQ + " \n";
			G_INFO += " PRO_CD : " + PRO_CD + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
			G_INFO += " PACK_SQ : " + PACK_SQ + " \n";
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
			<s:datatype dt:type='string' dt:maxLength='16'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CALC_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='EPK_CALC_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_CNT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ARUM_PACKAGE'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_LT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_PACK'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='6' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c6' rs:name='ROWID' rs:number='7' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EXAM_DP_T = cRsList.getString("EXAM_DP");
			String EXAM_SQ_T = cRsList.getString("EXAM_SQ");
			String CALC_CD_T = cRsList.getString("CALC_CD");
			String OPTN_CNT_T = cRsList.getString("OPTN_CNT");
			String OPTN_LT_T = cRsList.getString("OPTN_LT");
			String ROWID_T = cRsList.getString("ROWID");
			String c6_T = cRsList.getString("c6");
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

			if(! CALC_CD_T.equals("")) {
%>
		 		CALC_CD='<%= CALC_CD_T%>'
<%
			}
%>
				OPTN_CNT='<%= cnt%>'
				OPTN_LT='<%= cnt%>'
<%
			if(! ROWID_T.equals("")) {
%>
		 		ROWID='<%= ROWID_T%>'
<%
			}

			if(! c6_T.equals("")) {
%>
		 		c6='<%= c6_T%>'
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
