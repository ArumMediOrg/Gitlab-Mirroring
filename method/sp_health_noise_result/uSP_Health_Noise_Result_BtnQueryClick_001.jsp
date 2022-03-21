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

		String MNGT_YR = htMethod.get("MNGT_YR");
		String COMP_CD = htMethod.get("COMP_CD");
		String SPCL_CD = htMethod.get("SPCL_CD");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(SPCL_CD == null) { SPCL_CD = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT DISTINCT EEA_PSNL_NM, EEA_CUST_NO 
  FROM ET_EXAM_ACPT
 WHERE SUBSTR(EEA_MNGT_SPYM, 1, 4) = :MNGT_YR               
   AND (SUBSTR(EEA_EXAM_CD, 1, 1) = '4' 
    OR  SUBSTR(EEA_SPSB_CD, 1, 1) = '4')              
    
IF (:COMP_CD <> '') THEN 
   AND EEA_COMP_CD = :COMP_CD     
   
IF (:SPCL_CD <> '00') THEN
BEGIN 
   IF (:SPCL_CD = '99') THEN
     AND EEA_SPCL_CD IN ('03', '04', '05', '07')
   ELSE 
     AND EEA_SPCL_CD = :SPCL_CD    
END                     

 :ORDER_BY
		*/

		sql = " SELECT DISTINCT EEA_PSNL_NM, EEA_CUST_NO";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE SUBSTR(EEA_MNGT_SPYM, 1, 4) = '" + MNGT_YR + "'";
		sql += " AND (SUBSTR(EEA_EXAM_CD, 1, 1) = '4' OR SUBSTR(EEA_SPSB_CD, 1, 1) = '4')";

		if(!COMP_CD.equals("")) {
			sql += " AND EEA_COMP_CD = '" + COMP_CD + "'";
		}
		
		if(!SPCL_CD.equals("00")) {
			if(SPCL_CD.equals("99")) {
				sql += " AND EEA_SPCL_CD IN ('03', '04', '05', '07')";
			}
			else {
				sql += " AND EEA_SPCL_CD = '" + SPCL_CD + "'";
			}
		}

		sql += ORDER_BY;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_Noise_Result_BtnQueryClick_001 \n";
			G_INFO += "설명 : 특검 접수 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " SPCL_CD : " + SPCL_CD + " \n";
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
		<s:AttributeType name='EEA_PSNL_NM' rs:number='1' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='2' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
%>
			<z:row
<%
			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
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
