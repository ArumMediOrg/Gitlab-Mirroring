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

		String OPTN_DP = htMethod.get("OPTN_DP");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String OPTN_SQ = htMethod.get("OPTN_SQ");
		String PRCE_CD = htMethod.get("PRCE_CD");
		String CALC_CD = htMethod.get("CALC_CD");
		String OPTN_PR = htMethod.get("OPTN_PR");
		String OPTN_CNT = htMethod.get("OPTN_CNT");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String SEX_CD = htMethod.get("SEX_CD");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(OPTN_DP == null) { OPTN_DP = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(OPTN_SQ == null) { OPTN_SQ = ""; }
		if(PRCE_CD == null) { PRCE_CD = ""; }
		if(CALC_CD == null) { CALC_CD = ""; }
		if(OPTN_PR == null) { OPTN_PR = ""; }
		if(OPTN_CNT == null) { OPTN_CNT = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IIM_ITEM_CD ITEM_CD, IIM_KNME_NM ITEM_NM, 
       IIM_OSCD_CD OSCD_CD,  IIM_USE_YN USE_YN, 
       :OPTN_DP OPTN_DP, :EXAM_SQ EXAM_SQ, :OPTN_SQ OPTN_SQ, 
       :PRCE_CD PRCE_DT, :CALC_CD  CALC_CD, :OPTN_PR OPTN_PR, :OPTN_CNT OPTN_CNT 
  FROM IT_ITEM 
 WHERE IIM_ITEM_CD IN (:ITEM_CD) 
   AND UPPER(IIM_USE_YN) = 'Y' 
 UNION ALL 
SELECT EPK_EXAM_CD || EPK_PACK_SQ ITEM_CD, EPK_PACK_NM || CASE WHEN EPK_USE_YN = 'N' THEN '-미사용' ELSE '' END AS ITEM_NM, 
       '' OSCD_CD,  EPK_USE_YN USE_YN,
       :OPTN_DP OPTN_DP, :EXAM_SQ EXAM_SQ, :OPTN_SQ OPTN_SQ, 
       :PRCE_CD PRCE_DT, :CALC_CD CALC_CD, :OPTN_PR OPTN_PR, :OPTN_CNT OPTN_CNT      
  FROM ET_PACK 
 WHERE EPK_EXAM_CD || EPK_PACK_SQ IN (:ITEM_CD) 
   AND EPK_SEX_CD IN (:SEX_CD) 
   AND UPPER(EPK_USE_YN) = 'Y' 
  :PARAM_TX
		*/

		sql = " SELECT IIM_ITEM_CD ITEM_CD, IIM_KNME_NM ITEM_NM, IIM_OSCD_CD OSCD_CD, IIM_USE_YN USE_YN, '" + OPTN_DP + "' OPTN_DP, '" + EXAM_SQ + "' EXAM_SQ, '" + OPTN_SQ + "' OPTN_SQ, '" + PRCE_CD + "' PRCE_DT, '" + CALC_CD + "' CALC_CD, '" + OPTN_PR + "' OPTN_PR, '" + OPTN_CNT + "' OPTN_CNT";
		sql += " FROM IT_ITEM";
		sql += " WHERE IIM_ITEM_CD IN ('" + ITEM_CD + "')";
		sql += " AND UPPER(IIM_USE_YN) = 'Y'";

		sql += " UNION ALL";

		sql += " SELECT EPK_EXAM_CD || EPK_PACK_SQ ITEM_CD, EPK_PACK_NM || CASE WHEN EPK_USE_YN = 'N' THEN '-미사용' ELSE '' END AS ITEM_NM, '' OSCD_CD, EPK_USE_YN USE_YN, '" + OPTN_DP + "' OPTN_DP, '" + EXAM_SQ + "' EXAM_SQ, '" + OPTN_SQ + "' OPTN_SQ, '" + PRCE_CD + "' PRCE_DT, '" + CALC_CD + "' CALC_CD, '" + OPTN_PR + "' OPTN_PR, '" + OPTN_CNT + "' OPTN_CNT";
		sql += " FROM ET_PACK";
		sql += " WHERE EPK_EXAM_CD || EPK_PACK_SQ IN ('" + ITEM_CD + "')";
		sql += " AND EPK_SEX_CD IN ('" + SEX_CD + "')";
		sql += " AND UPPER(EPK_USE_YN) = 'Y'";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamSetting_016 \n";
			G_INFO += "설명 : 종검옵션별 검사항목 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " OPTN_DP : " + OPTN_DP + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " OPTN_SQ : " + OPTN_SQ + " \n";
			G_INFO += " PRCE_CD : " + PRCE_CD + " \n";
			G_INFO += " CALC_CD : " + CALC_CD + " \n";
			G_INFO += " OPTN_PR : " + OPTN_PR + " \n";
			G_INFO += " OPTN_CNT : " + OPTN_CNT + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
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
		<s:AttributeType name='ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='OSCD_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='USE_YN' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_DP' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_SQ' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_SQ' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='PRCE_DT' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CALC_CD' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_PR' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='OPTN_CNT' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='12' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
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

			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String ITEM_NM_T = cRsList.getString("ITEM_NM");
			String OSCD_CD_T = cRsList.getString("OSCD_CD");
			String USE_YN_T = cRsList.getString("USE_YN");
			String OPTN_DP_T = cRsList.getString("OPTN_DP");
			String EXAM_SQ_T = cRsList.getString("EXAM_SQ");
			String OPTN_SQ_T = cRsList.getString("OPTN_SQ");
			String PRCE_DT_T = cRsList.getString("PRCE_DT");
			String CALC_CD_T = cRsList.getString("CALC_CD");
			String OPTN_PR_T = cRsList.getString("OPTN_PR");
			String OPTN_CNT_T = cRsList.getString("OPTN_CNT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ITEM_CD_T.equals("")) {
%>
		 		ITEM_CD='<%= ITEM_CD_T%>'
<%
			}

			if(! ITEM_NM_T.equals("")) {
%>
		 		ITEM_NM='<%= ITEM_NM_T%>'
<%
			}

			if(! OSCD_CD_T.equals("")) {
%>
		 		OSCD_CD='<%= OSCD_CD_T%>'
<%
			}

			if(! USE_YN_T.equals("")) {
%>
		 		USE_YN='<%= USE_YN_T%>'
<%
			}

			if(! OPTN_DP_T.equals("")) {
%>
		 		OPTN_DP='<%= OPTN_DP_T%>'
<%
			}

			if(! EXAM_SQ_T.equals("")) {
%>
		 		EXAM_SQ='<%= EXAM_SQ_T%>'
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
