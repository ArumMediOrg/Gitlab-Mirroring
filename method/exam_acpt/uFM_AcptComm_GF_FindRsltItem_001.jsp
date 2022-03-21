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
		String ITEM_CD = htMethod.get("ITEM_CD");
		String VLDT_LH = htMethod.get("VLDT_LH");
		String RSLT_KD = htMethod.get("RSLT_KD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(VLDT_LH == null) { VLDT_LH = ""; }
		if(RSLT_KD == null) { RSLT_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.ERI_ITEM_CD, A.ERI_RSLT_VL, A.ERI_VLDT_LH, A.ERI_RSLT_EX, 
       A.ERI_CNCL_YN, B.IIM_KNME_NM, B.IIM_SNME_NM, B.IIM_RSLT_KD
  FROM ET_RSLT_ITEM A, IT_ITEM B 
 WHERE A.ERI_EXAM_DT = :EXAM_DT
   AND A.ERI_EXAM_SQ = :EXAM_SQ;

if (:ITEM_CD <> '') then
   AND A.ERI_ITEM_CD IN (:ITEM_CD);

if (:VLDT_LH = 'Y') then
   AND NVL(A.ERI_VLDT_LH, ' ') <> ' ';

   AND B.IIM_ITEM_CD = A.ERI_ITEM_CD 

if (:RSLT_KD = 'Y') then
   AND B.IIM_RSLT_KD <> '9';

 ORDER BY B.IIM_EXGN_CD, B.IIM_SORT_SQ, B.IIM_ITEM_CD 
		*/

		sql = " SELECT A.ERI_ITEM_CD, A.ERI_RSLT_VL, A.ERI_VLDT_LH, A.ERI_RSLT_EX, A.ERI_CNCL_YN, B.IIM_KNME_NM, B.IIM_SNME_NM, B.IIM_RSLT_KD";
		sql += " FROM ET_RSLT_ITEM A, IT_ITEM B";
		sql += " WHERE A.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.ERI_EXAM_SQ = '" + EXAM_SQ + "'";

		if(! ITEM_CD.equals("")) {
			sql += " AND A.ERI_ITEM_CD IN ('" + ITEM_CD + "')";
		}

		if(VLDT_LH.equals("Y")) {
			sql += " AND NVL(A.ERI_VLDT_LH, ' ') <> ' '";
		}

		sql += " AND B.IIM_ITEM_CD = A.ERI_ITEM_CD";


		if(RSLT_KD.equals("Y")) {
			sql += " AND B.IIM_RSLT_KD <> '9'";
		}

		sql += " ORDER BY B.IIM_EXGN_CD, B.IIM_SORT_SQ, B.IIM_ITEM_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_FindRsltItem_001 \n";
			G_INFO += "설명 : 결과 항목 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " VLDT_LH : " + VLDT_LH + " \n";
			G_INFO += " RSLT_KD : " + RSLT_KD + " \n";
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
		<s:AttributeType name='ERI_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VLDT_LH' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_VLDT_LH'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_EX' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_CNCL_YN' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_CNCL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='6' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SNME_NM' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_SNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RSLT_KD' rs:number='8' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c9' rs:name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
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

			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String ERI_VLDT_LH_T = cRsList.getString("ERI_VLDT_LH");
			String ERI_RSLT_EX_T = cRsList.getString("ERI_RSLT_EX");
			String ERI_CNCL_YN_T = cRsList.getString("ERI_CNCL_YN");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String IIM_SNME_NM_T = cRsList.getString("IIM_SNME_NM");
			String IIM_RSLT_KD_T = cRsList.getString("IIM_RSLT_KD");
			String ROWID_T = cRsList.getString("ROWID");
			String c9_T = cRsList.getString("c9");
%>
			<z:row
<%
			if(! ERI_ITEM_CD_T.equals("")) {
%>
		 		ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! ERI_VLDT_LH_T.equals("")) {
%>
		 		ERI_VLDT_LH='<%= ERI_VLDT_LH_T%>'
<%
			}

			if(! ERI_RSLT_EX_T.equals("")) {
%>
		 		ERI_RSLT_EX='<%= ERI_RSLT_EX_T%>'
<%
			}

			if(! ERI_CNCL_YN_T.equals("")) {
%>
		 		ERI_CNCL_YN='<%= ERI_CNCL_YN_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
<%
			}

			if(! IIM_SNME_NM_T.equals("")) {
%>
		 		IIM_SNME_NM='<%= IIM_SNME_NM_T%>'
<%
			}

			if(! IIM_RSLT_KD_T.equals("")) {
%>
		 		IIM_RSLT_KD='<%= IIM_RSLT_KD_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c9_T.equals("")) {
%>
		 		c9='<%= c9_T%>'
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
