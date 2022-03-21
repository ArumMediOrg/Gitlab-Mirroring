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
		String MNGT_YR = htMethod.get("MNGT_YR");
		String DEPT_CD = htMethod.get("DEPT_CD");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT ICD_DEPT_NM||'-'||ICD_SUBD_NM||'('||F_CODE_FIND('0910', ICD_SPCL_CD, '', '1')||')' EXAM_NM, 
       ICD_MATT_LT ITEM_LT, 
       CASE WHEN ICD_TBAS_CD = '1' THEN '4'
            ELSE CASE WHEN ICD_TBAS_CD = '2' THEN '5'
            ELSE F_PRICE_KIND('4') END END AS CALC_CD, 
       NVL(ICD_JCAS_PR, 0) AS SALE_PR,
       NVL(ICD_JSBS_PR, 0) AS COUP_PR,
       NVL(ICD_DCAS_PR, 0) AS FAMY_PR,
       NVL(ICD_BCAS_PR, 0) AS GRUP_PR,
       NVL(ICD_BSBS_PR, 0) AS CUPN_PR,
       NVL(ICD_DSBS_PR, 0) AS MMBR_PR
  FROM IT_COMP_DEPT 
 WHERE ICD_COMP_CD = :COMP_CD
   AND ICD_MNGT_YR = :MNGT_YR
   AND ICD_HALF_CD || ICD_DEPT_CD = :DEPT_CD
		*/

		sql = " SELECT ICD_DEPT_NM||'-'||ICD_SUBD_NM||'('||F_CODE_FIND('0910', ICD_SPCL_CD, '', '1')||')' EXAM_NM, ICD_MATT_LT ITEM_LT, CASE WHEN ICD_TBAS_CD = '1' THEN '4' ELSE CASE WHEN ICD_TBAS_CD = '2' THEN '5' ELSE F_PRICE_KIND('4') END END AS CALC_CD, NVL(ICD_JCAS_PR, 0) AS SALE_PR, NVL(ICD_JSBS_PR, 0) AS COUP_PR, NVL(ICD_DCAS_PR, 0) AS FAMY_PR, NVL(ICD_BCAS_PR, 0) AS GRUP_PR, NVL(ICD_BSBS_PR, 0) AS CUPN_PR, NVL(ICD_DSBS_PR, 0) AS MMBR_PR";
		sql += " FROM IT_COMP_DEPT";
		sql += " WHERE ICD_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ICD_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND ICD_HALF_CD || ICD_DEPT_CD = '" + DEPT_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_ExamList_003 \n";
			G_INFO += "설명 : 부서묶음 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='EXAM_NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_LT' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ICD_MATT_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='CALC_CD' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SALE_PR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='COUP_PR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='FAMY_PR' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='GRUP_PR' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CUPN_PR' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='MMBR_PR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMP_DEPT'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='IT_COMP_DEPT' rs:basecolumn='ROWID'
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

			String EXAM_NM_T = cRsList.getString("EXAM_NM");
			String ITEM_LT_T = cRsList.getString("ITEM_LT");
			String CALC_CD_T = cRsList.getString("CALC_CD");
			String SALE_PR_T = cRsList.getString("SALE_PR");
			String COUP_PR_T = cRsList.getString("COUP_PR");
			String FAMY_PR_T = cRsList.getString("FAMY_PR");
			String GRUP_PR_T = cRsList.getString("GRUP_PR");
			String CUPN_PR_T = cRsList.getString("CUPN_PR");
			String MMBR_PR_T = cRsList.getString("MMBR_PR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! EXAM_NM_T.equals("")) {
%>
		 		EXAM_NM='<%= EXAM_NM_T%>'
<%
			}

			if(! ITEM_LT_T.equals("")) {
%>
		 		ITEM_LT='<%= ITEM_LT_T%>'
<%
			}

			if(! CALC_CD_T.equals("")) {
%>
		 		CALC_CD='<%= CALC_CD_T%>'
<%
			}

			if(! SALE_PR_T.equals("")) {
%>
		 		SALE_PR='<%= SALE_PR_T%>'
<%
			}

			if(! COUP_PR_T.equals("")) {
%>
		 		COUP_PR='<%= COUP_PR_T%>'
<%
			}

			if(! FAMY_PR_T.equals("")) {
%>
		 		FAMY_PR='<%= FAMY_PR_T%>'
<%
			}

			if(! GRUP_PR_T.equals("")) {
%>
		 		GRUP_PR='<%= GRUP_PR_T%>'
<%
			}

			if(! CUPN_PR_T.equals("")) {
%>
		 		CUPN_PR='<%= CUPN_PR_T%>'
<%
			}

			if(! MMBR_PR_T.equals("")) {
%>
		 		MMBR_PR='<%= MMBR_PR_T%>'
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
