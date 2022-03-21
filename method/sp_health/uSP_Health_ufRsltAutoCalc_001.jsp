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

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 SELECT G1.*, RSPT AS RSPT_CNT
   FROM (
                      SELECT ERI_EXAM_DT, ERI_EXAM_SQ, IIM_ACAL_YN, EEA_SEX_CD, ERI_RSLT_VL
                                 , EEA_PSNL_AGE, ERI_ITEM_CD, IIM_KNME_NM, IIM_RSLT_KD
              , CASE WHEN ERI_TOTAL_KD > 0 THEN '1' WHEN ERI_HLTH_KD > 0 THEN '2' WHEN ERI_SPCL_KD > 0 THEN '4'
                     WHEN ERI_EMPY_KD > 0 THEN '5' WHEN ERI_STDT_KD > 0 THEN '6' ELSE  '1' END AS VLDT_KD
               FROM ET_RSLT_ITEM
               JOIN IT_ITEM
                              ON IIM_ITEM_CD = ERI_ITEM_CD
                AND IIM_ACAL_YN = 'Y'
               JOIN ET_EXAM_ACPT
                       ON EEA_EXAM_DT = ERI_EXAM_DT
                AND EEA_EXAM_SQ = ERI_EXAM_SQ
              WHERE ERI_EXAM_DT = :EXAM_DT
                AND ERI_EXAM_SQ = :EXAM_SQ
        ) G1
        left outer join TABLE(GetItemVldtTable_PKG.GetItemVldtTable(G1.ERI_ITEM_CD, G1.EEA_SEX_CD, G1.EEA_PSNL_AGE, G1.ERI_EXAM_DT, G1.VLDT_KD)) B
             on B.item_cd = G1.eri_item_cd
		*/

		sql = " SELECT G1.*, RSPT AS RSPT_CNT";
		sql += " FROM ( SELECT ERI_EXAM_DT, ERI_EXAM_SQ, IIM_ACAL_YN, EEA_SEX_CD, ERI_RSLT_VL , EEA_PSNL_AGE, ERI_ITEM_CD, IIM_KNME_NM, IIM_RSLT_KD , CASE WHEN ERI_TOTAL_KD > 0 THEN '1' WHEN ERI_HLTH_KD > 0 THEN '2' WHEN ERI_SPCL_KD > 0 THEN '4' WHEN ERI_EMPY_KD > 0 THEN '5' WHEN ERI_STDT_KD > 0 THEN '6' ELSE '1' END AS VLDT_KD";
		sql += " FROM ET_RSLT_ITEM JOIN IT_ITEM";
		sql += " ON IIM_ITEM_CD = ERI_ITEM_CD";
		sql += " AND IIM_ACAL_YN = 'Y' JOIN ET_EXAM_ACPT";
		sql += " ON EEA_EXAM_DT = ERI_EXAM_DT";
		sql += " AND EEA_EXAM_SQ = ERI_EXAM_SQ";
		sql += " WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND ERI_EXAM_SQ = '" + EXAM_SQ + "' ) G1 LEFT OUTER JOIN TABLE(GETITEMVLDTTABLE_PKG.GETITEMVLDTTABLE(G1.ERI_ITEM_CD, G1.EEA_SEX_CD, G1.EEA_PSNL_AGE, G1.ERI_EXAM_DT, G1.VLDT_KD)) B";
		sql += " ON B.ITEM_CD = G1.ERI_ITEM_CD";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_ufRsltAutoCalc_001 \n";
			G_INFO += "설명 : 자동계산항목처리-대상항목조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='ERI_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EXAM_SQ' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ACAL_YN' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ITEM_CD' rs:number='7'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='8'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_RSLT_KD' rs:number='9'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='VLDT_KD' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RSPT_CNT' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ERI_EXAM_DT_T = cRsList.getString("ERI_EXAM_DT");
			String ERI_EXAM_SQ_T = cRsList.getString("ERI_EXAM_SQ");
			String IIM_ACAL_YN_T = cRsList.getString("IIM_ACAL_YN");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String IIM_RSLT_KD_T = cRsList.getString("IIM_RSLT_KD");
			String VLDT_KD_T = cRsList.getString("VLDT_KD");
			String RSPT_CNT_T = cRsList.getString("RSPT_CNT");
%>
			<z:row
<%
			if(! ERI_EXAM_DT_T.equals("")) {
%>
		 		ERI_EXAM_DT='<%= ERI_EXAM_DT_T%>'
<%
			}

			if(! ERI_EXAM_SQ_T.equals("")) {
%>
		 		ERI_EXAM_SQ='<%= ERI_EXAM_SQ_T%>'
<%
			}

			if(! IIM_ACAL_YN_T.equals("")) {
%>
		 		IIM_ACAL_YN='<%= IIM_ACAL_YN_T%>'
<%
			}

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! ERI_ITEM_CD_T.equals("")) {
%>
		 		ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
<%
			}

			if(! IIM_RSLT_KD_T.equals("")) {
%>
		 		IIM_RSLT_KD='<%= IIM_RSLT_KD_T%>'
<%
			}

			if(! VLDT_KD_T.equals("")) {
%>
		 		VLDT_KD='<%= VLDT_KD_T%>'
<%
			}

			if(! RSPT_CNT_T.equals("")) {
%>
		 		RSPT_CNT='<%= RSPT_CNT_T%>'
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
