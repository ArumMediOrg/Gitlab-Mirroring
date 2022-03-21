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

		String SAPPLYDATE = htMethod.get("SAPPLYDATE");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String CNRT_SQ = htMethod.get("CNRT_SQ");
		String PROF_SQ = htMethod.get("PROF_SQ");

		//
		if(SAPPLYDATE == null) { SAPPLYDATE = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.ECI_ITEM_CD, A.ECI_SORT_SQ,
       C.IIM_KNME_NM AS ECI_ITEM_NM,
       C.IIM_OSCD_CD AS ECI_OSCD_CD,
       B.IIP_APLY_DT APLY_DT,
       NVL(B.IIP_JCSG_PR, 0) ITEM_JC,
       NVL(B.IIP_GBSG_PR, 0) ITEM_GB,
       NVL(B.IIP_HESG_PR, 0) ITEM_HE,
       NVL(B.IIP_SBSG_PR, 0) ITEM_SB,
       NVL(B.IIP_TGSG_PR, 0) ITEM_TG
FROM ET_COMP_CNRT_PROF_ITEM A INNER JOIN IT_ITEM_PRICE  B ON A.ECI_ITEM_CD = B.IIP_ITEM_CD
                                AND B.IIP_APLY_DT = GetITEM_PRICE_ApplyDate(B.IIP_ITEM_CD, :sApplyDate,'ITEM_CD')
                              INNER JOIN IT_ITEM        C ON A.ECI_ITEM_CD = C.IIM_ITEM_CD
WHERE A.ECI_COMP_CD = :COMP_CD
  AND A.ECI_MNGT_YR = :MNGT_YR
  AND A.ECI_CNRT_SQ = :CNRT_SQ
  AND A.ECI_PROF_SQ = :PROF_SQ
		*/

		sql = " SELECT A.ECI_ITEM_CD, A.ECI_SORT_SQ, C.IIM_KNME_NM AS ECI_ITEM_NM, C.IIM_OSCD_CD AS ECI_OSCD_CD, B.IIP_APLY_DT APLY_DT, NVL(B.IIP_JCSG_PR, 0) ITEM_JC, NVL(B.IIP_GBSG_PR, 0) ITEM_GB, NVL(B.IIP_HESG_PR, 0) ITEM_HE, NVL(B.IIP_SBSG_PR, 0) ITEM_SB, NVL(B.IIP_TGSG_PR, 0) ITEM_TG";
		sql += " FROM ET_COMP_CNRT_PROF_ITEM A INNER JOIN IT_ITEM_PRICE B";
		sql += " ON A.ECI_ITEM_CD = B.IIP_ITEM_CD";
		sql += " AND B.IIP_APLY_DT = GETITEM_PRICE_APPLYDATE(B.IIP_ITEM_CD, '" + SAPPLYDATE + "','ITEM_CD') INNER JOIN IT_ITEM C";
		sql += " ON A.ECI_ITEM_CD = C.IIM_ITEM_CD";
		sql += " WHERE A.ECI_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.ECI_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND A.ECI_CNRT_SQ = '" + CNRT_SQ + "'";
		sql += " AND A.ECI_PROF_SQ = '" + PROF_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_PROF_SEARCH_UP_Prof_Item_Display_001 \n";
			G_INFO += "설명 : 검진유형 검사항목리스트 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SAPPLYDATE : " + SAPPLYDATE + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
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
		<s:AttributeType name='ECI_ITEM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_SORT_SQ' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM'
			 rs:basecolumn='ECI_SORT_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_ITEM_NM' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECI_OSCD_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_OSCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='APLY_DT' rs:number='5' rs:writeunknown='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='IIP_APLY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_JC' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_GB' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_HE' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_SB' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_TG' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='ET_COMP_CNRT_PROF_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c11' rs:name='ROWID' rs:number='12' rs:rowid='true' rs:basetable='IT_ITEM_PRICE' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c12' rs:name='ROWID' rs:number='13' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ECI_ITEM_CD_T = cRsList.getString("ECI_ITEM_CD");
			String ECI_SORT_SQ_T = cRsList.getString("ECI_SORT_SQ");
			String ECI_ITEM_NM_T = cRsList.getString("ECI_ITEM_NM");
			String ECI_OSCD_CD_T = cRsList.getString("ECI_OSCD_CD");
			String APLY_DT_T = cRsList.getString("APLY_DT");
			String ITEM_JC_T = cRsList.getString("ITEM_JC");
			String ITEM_GB_T = cRsList.getString("ITEM_GB");
			String ITEM_HE_T = cRsList.getString("ITEM_HE");
			String ITEM_SB_T = cRsList.getString("ITEM_SB");
			String ITEM_TG_T = cRsList.getString("ITEM_TG");
			String ROWID_T = cRsList.getString("ROWID");
			String c11_T = cRsList.getString("c11");
			String c12_T = cRsList.getString("c12");
%>
			<z:row
<%
			if(! ECI_ITEM_CD_T.equals("")) {
%>
		 		ECI_ITEM_CD='<%= ECI_ITEM_CD_T%>'
<%
			}

			if(! ECI_SORT_SQ_T.equals("")) {
%>
		 		ECI_SORT_SQ='<%= ECI_SORT_SQ_T%>'
<%
			}

			if(! ECI_ITEM_NM_T.equals("")) {
%>
		 		ECI_ITEM_NM='<%= ECI_ITEM_NM_T%>'
<%
			}

			if(! ECI_OSCD_CD_T.equals("")) {
%>
		 		ECI_OSCD_CD='<%= ECI_OSCD_CD_T%>'
<%
			}

			if(! APLY_DT_T.equals("")) {
%>
		 		APLY_DT='<%= APLY_DT_T%>'
<%
			}

			if(! ITEM_JC_T.equals("")) {
%>
		 		ITEM_JC='<%= ITEM_JC_T%>'
<%
			}

			if(! ITEM_GB_T.equals("")) {
%>
		 		ITEM_GB='<%= ITEM_GB_T%>'
<%
			}

			if(! ITEM_HE_T.equals("")) {
%>
		 		ITEM_HE='<%= ITEM_HE_T%>'
<%
			}

			if(! ITEM_SB_T.equals("")) {
%>
		 		ITEM_SB='<%= ITEM_SB_T%>'
<%
			}

			if(! ITEM_TG_T.equals("")) {
%>
		 		ITEM_TG='<%= ITEM_TG_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c11='<%= cnt%>'
				c12='<%= cnt%>'
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
