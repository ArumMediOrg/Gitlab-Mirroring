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

SELECT PLP_EXAM_DT, PLP_EXAM_SQ,
       rtrim(ltrim(FN_splitValue(PLP_JLPN_SHDS, ',','1'))) COL1,
       FN_splitValue(PLP_JLPN_SHDS, ',', '2') COL2,
       FN_splitValue(PLP_JLPN_SHDS, ',', '3') COL3,
       FN_splitValue(PLP_JLPN_SHDS, ',', '4') COL4,
       FN_splitValue(PLP_JLPN_SHDS, ',', '5') COL5,
       EEA_SEX_CD, EEA_PSNL_AGE,
       (TRUNC((TO_DATE(EEA_EXAM_DT) - TO_DATE(case when NVL(EEA_ENTRY_DT,' ') = ' ' then EEA_EXAM_DT else EEA_ENTRY_DT end)) / 365)) WY
FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B ON A.PlP_EXAM_DT=B.EEA_EXAM_DT AND  A.PLP_EXAM_SQ=B.EEA_EXAM_SQ
                        INNER JOIN IT_CUSTOMER  C ON B.EEA_CUST_NO =C.ICR_CUST_NO
WHERE EEA_EXAM_DT = :EXAM_DT
   AND EEA_EXAM_SQ = :EXAM_SQ
   AND NVL(EEA_HTSB_CD,   ' ') <> ' '
   AND NVL(PLP_JLPN_SHDS, ' ') <> ' '
		*/

		sql = " SELECT PLP_EXAM_DT, PLP_EXAM_SQ, RTRIM(LTRIM(FN_SPLITVALUE(PLP_JLPN_SHDS, ',','1'))) COL1, ";
		sql += " FN_SPLITVALUE(PLP_JLPN_SHDS, ',', '2') COL2, FN_SPLITVALUE(PLP_JLPN_SHDS, ',', '3') COL3, ";
		sql += " FN_SPLITVALUE(PLP_JLPN_SHDS, ',', '4') COL4, FN_SPLITVALUE(PLP_JLPN_SHDS, ',', '5') COL5, ";
		sql += " EEA_SEX_CD, EEA_PSNL_AGE, (TRUNC((TO_DATE(EEA_EXAM_DT, 'YYYY-MM-DD') - TO_DATE(CASE WHEN NVL(EEA_ENTRY_DT,' ') = ' ' THEN EEA_EXAM_DT ELSE EEA_ENTRY_DT END, 'YYYY-MM-DD')) / 365)) WY";
		sql += " FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B";
		sql += " ON A.PLP_EXAM_DT=B.EEA_EXAM_DT";
		sql += " AND A.PLP_EXAM_SQ=B.EEA_EXAM_SQ INNER JOIN IT_CUSTOMER C";
		sql += " ON B.EEA_CUST_NO =C.ICR_CUST_NO";
		sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND NVL(EEA_HTSB_CD, ' ') <> ' '";
		sql += " AND NVL(PLP_JLPN_SHDS, ' ') <> ' '";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHEPOSTMANPRT_up_GetDisease_001 \n";
			G_INFO += "설명 : 질병정보 로딩 \n";
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
		<s:AttributeType name='PLP_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG' rs:basecolumn='PLP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PLP_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='PT_LABOR_PANJUNG' rs:basecolumn='PLP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='COL1' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8000'/>
		</s:AttributeType>
		<s:AttributeType name='COL2' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8000'/>
		</s:AttributeType>
		<s:AttributeType name='COL3' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8000'/>
		</s:AttributeType>
		<s:AttributeType name='COL4' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8000'/>
		</s:AttributeType>
		<s:AttributeType name='COL5' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='8000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='WY' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='PT_LABOR_PANJUNG' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c11' rs:name='ROWID' rs:number='12' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c12' rs:name='ROWID' rs:number='13' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
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

			String PLP_EXAM_DT_T = cRsList.getString("PLP_EXAM_DT");
			String PLP_EXAM_SQ_T = cRsList.getString("PLP_EXAM_SQ");
			String COL1_T = cRsList.getString("COL1");
			String COL2_T = cRsList.getString("COL2");
			String COL3_T = cRsList.getString("COL3");
			String COL4_T = cRsList.getString("COL4");
			String COL5_T = cRsList.getString("COL5");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String WY_T = cRsList.getString("WY");
			String ROWID_T = cRsList.getString("ROWID");
			String c11_T = cRsList.getString("c11");
			String c12_T = cRsList.getString("c12");
%>
			<z:row
<%
			if(! PLP_EXAM_DT_T.equals("")) {
%>
		 		PLP_EXAM_DT='<%= PLP_EXAM_DT_T%>'
<%
			}

			if(! PLP_EXAM_SQ_T.equals("")) {
%>
		 		PLP_EXAM_SQ='<%= PLP_EXAM_SQ_T%>'
<%
			}

			if(! COL1_T.equals("")) {
%>
		 		COL1='<%= COL1_T%>'
<%
			}

			if(! COL2_T.equals("")) {
%>
		 		COL2='<%= COL2_T%>'
<%
			}

			if(! COL3_T.equals("")) {
%>
		 		COL3='<%= COL3_T%>'
<%
			}

			if(! COL4_T.equals("")) {
%>
		 		COL4='<%= COL4_T%>'
<%
			}

			if(! COL5_T.equals("")) {
%>
		 		COL5='<%= COL5_T%>'
<%
			}

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! WY_T.equals("")) {
%>
		 		WY='<%= WY_T%>'
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
