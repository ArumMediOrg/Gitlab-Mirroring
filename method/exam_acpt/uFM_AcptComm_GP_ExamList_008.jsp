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

		String CALC_CD = htMethod.get("CALC_CD");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String DEPT_CD = htMethod.get("DEPT_CD");

		//
		if(CALC_CD == null) { CALC_CD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT LTRIM(RTRIM(A.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) ITEM_NM,
       CASE WHEN C.ICD_TBAS_CD = '1' THEN '4'
            WHEN C.ICD_TBAS_CD = '2' THEN '5'
            ELSE F_PRICE_KIND('4') END AS CALC_CD, 
       CASE WHEN :CALC_CD = '4' THEN B.ICI_BSBS_PR ELSE B.ICI_BCAS_PR END AS ITEM_PR, 
       B.ICI_BSBS_PR SBSG_PR, B.ICI_BCAS_PR BCAS_PR, B.ICI_JCAS_PR JCAS_PR, B.ICI_DCAS_PR DCAS_PR
  FROM IT_ITEM A, IT_COMP_DEPT_ITEM B, IT_COMP_DEPT C 
 WHERE A.IIM_ITEM_CD = :ITEM_CD
   AND C.ICD_COMP_CD = :COMP_CD
   AND C.ICD_MNGT_YR = :MNGT_YR
   AND C.ICD_HALF_CD||C.ICD_DEPT_CD = :DEPT_CD
   AND B.ICI_COMP_CD = C.ICD_COMP_CD 
   AND B.ICI_MNGT_YR = C.ICD_MNGT_YR 
   AND B.ICI_HALF_CD = C.ICD_HALF_CD 
   AND B.ICI_DEPT_CD = C.ICD_DEPT_CD 
   AND B.ICI_ITKD_CD = '2' 
   AND B.ICI_SBCD_CD = A.IIM_SBCD_CD
		*/

		sql = " SELECT LTRIM(RTRIM(A.IIM_ITEM_CD)) ITEM_CD, LTRIM(RTRIM(A.IIM_KNME_NM)) ITEM_NM, CASE WHEN C.ICD_TBAS_CD = '1' THEN '4' WHEN C.ICD_TBAS_CD = '2' THEN '5' ELSE F_PRICE_KIND('4') END AS CALC_CD, CASE WHEN '" + CALC_CD + "' = '4' THEN B.ICI_BSBS_PR ELSE B.ICI_BCAS_PR END AS ITEM_PR, B.ICI_BSBS_PR SBSG_PR, B.ICI_BCAS_PR BCAS_PR, B.ICI_JCAS_PR JCAS_PR, B.ICI_DCAS_PR DCAS_PR";
		sql += " FROM IT_ITEM A, IT_COMP_DEPT_ITEM B, IT_COMP_DEPT C";
		sql += " WHERE A.IIM_ITEM_CD = '" + ITEM_CD + "'";
		sql += " AND C.ICD_COMP_CD = '" + COMP_CD + "'";
		sql += " AND C.ICD_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND C.ICD_HALF_CD||C.ICD_DEPT_CD = '" + DEPT_CD + "'";
		sql += " AND B.ICI_COMP_CD = C.ICD_COMP_CD";
		sql += " AND B.ICI_MNGT_YR = C.ICD_MNGT_YR";
		sql += " AND B.ICI_HALF_CD = C.ICD_HALF_CD";
		sql += " AND B.ICI_DEPT_CD = C.ICD_DEPT_CD";
		sql += " AND B.ICI_ITKD_CD = '2'";
		sql += " AND B.ICI_SBCD_CD = A.IIM_SBCD_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamList_008 \n";
			G_INFO += "설명 : 사업장유해물질중 추가항목 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CALC_CD : " + CALC_CD + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
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
		<s:AttributeType name='ITEM_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='CALC_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT_ITEM'
			 rs:basecolumn='ICI_BSBS_PR'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_PR' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT_ITEM'
			 rs:basecolumn='ICI_BCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SBSG_PR' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT_ITEM'
			 rs:basecolumn='ICI_JCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BCAS_PR' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT_ITEM'
			 rs:basecolumn='ICI_DCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='JCAS_PR' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='DCAS_PR' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT_ITEM'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='7' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c9' rs:name='ROWID' rs:number='10' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c10' rs:name='ROWID' rs:number='11' rs:rowid='true' rs:hidden='true'>
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
			String CALC_CD_T = cRsList.getString("CALC_CD");
			String ITEM_PR_T = cRsList.getString("ITEM_PR");
			String SBSG_PR_T = cRsList.getString("SBSG_PR");
			String BCAS_PR_T = cRsList.getString("BCAS_PR");
			String JCAS_PR_T = cRsList.getString("JCAS_PR");
			String DCAS_PR_T = cRsList.getString("DCAS_PR");
			String ROWID_T = cRsList.getString("ROWID");
			String c9_T = cRsList.getString("c9");
			String c10_T = cRsList.getString("c10");
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

			if(! CALC_CD_T.equals("")) {
%>
		 		CALC_CD='<%= CALC_CD_T%>'
<%
			}

			if(! ITEM_PR_T.equals("")) {
%>
		 		ITEM_PR='<%= ITEM_PR_T%>'
<%
			}

			if(! SBSG_PR_T.equals("")) {
%>
		 		SBSG_PR='<%= SBSG_PR_T%>'
<%
			}

			if(! BCAS_PR_T.equals("")) {
%>
		 		BCAS_PR='<%= BCAS_PR_T%>'
<%
			}

			if(! JCAS_PR_T.equals("")) {
%>
		 		JCAS_PR='<%= JCAS_PR_T%>'
<%
			}

			if(! DCAS_PR_T.equals("")) {
%>
		 		DCAS_PR='<%= DCAS_PR_T%>'
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
