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

SELECT EEA_EXAM_DT,
     EEA_EXAM_SQ,
     EEA_MNGT_HTYR,
     EEA_INSU_NO,
     EEA_SEND_CD,
     F_TEL_FORMAT_NUM(ICR_TEL_NO,'1') ICR_TEL_NO1,F_TEL_FORMAT_NUM(ICR_TEL_NO,'2') ICR_TEL_NO2,F_TEL_FORMAT_NUM(ICR_TEL_NO,'3') ICR_TEL_NO3,
     F_TEL_FORMAT_NUM(ICR_MOBL_NO,'1') ICR_MOBL_NO1,F_TEL_FORMAT_NUM(ICR_MOBL_NO,'2') ICR_MOBL_NO2,F_TEL_FORMAT_NUM(ICR_MOBL_NO,'3') ICR_MOBL_NO3 ,
     ICR_EMAI_AR,
     MAX(ICR_ZIP_CD) ICR_ZIP_CD, MAX(ICR_ZIP_AR) ICR_ZIP_AR, MAX(ICR_ROAD_AR) ICR_ROAD_AR,
     MAX(ICR_RECV_YN) ICR_RECV_YN,
     MAX(M55)  M55,
     MAX(M56)  M56,
     MAX(M57)  M57,
     MAX(M58)  M58,
     MAX(M59)  M59,
     MAX(M60)  M60,
     MAX(M61)  M61,
     MAX(M62)  M62,
     MAX(M63)  M63,
     MAX(M64)  M64,
     MAX(M65)  M65,
     MAX(M66)  M66,
     MAX(M67)  M67,
     MAX(M68)  M68,
     MAX(M69)  M69
FROM (SELECT EEA_EXAM_DT,
             EEA_EXAM_SQ,
             EEA_MNGT_HTYR,
             EEA_INSU_NO,
             EEA_SEND_CD,
             ICR_TEL_NO,
             ICR_MOBL_NO,
             ICR_EMAI_AR,
             ICR_ZIP_CD, ICR_ZIP_AR, ICR_ROAD_AR,
             CASE WHEN IIQ_QGTN_CD='1' THEN      QQN_RESULT END ICR_RECV_YN,
             CASE WHEN IIQ_QGTN_CD='55' THEN     QQN_RESULT END M55,
             CASE WHEN IIQ_QGTN_CD='56' THEN     QQN_RESULT END M56,
             CASE WHEN IIQ_QGTN_CD='57' THEN     QQN_RESULT END M57,
             CASE WHEN IIQ_QGTN_CD='58' THEN     QQN_RESULT END M58,
             CASE WHEN IIQ_QGTN_CD='59' THEN     QQN_RESULT END M59,
             CASE WHEN IIQ_QGTN_CD='60' THEN     QQN_RESULT END M60,
             CASE WHEN IIQ_QGTN_CD='61' THEN     QQN_RESULT END M61,
             CASE WHEN IIQ_QGTN_CD='62' THEN     QQN_RESULT END M62,
             CASE WHEN IIQ_QGTN_CD='63' THEN     QQN_RESULT END M63,
             CASE WHEN IIQ_QGTN_CD='64' THEN     QQN_RESULT END M64,
             CASE WHEN IIQ_QGTN_CD='65' THEN     QQN_RESULT END M65,
             CASE WHEN IIQ_QGTN_CD='66' THEN     QQN_RESULT END M66,
             CASE WHEN IIQ_QGTN_CD='67' THEN     QQN_RESULT END M67,
             CASE WHEN IIQ_QGTN_CD='68' THEN     QQN_RESULT END M68,
             CASE WHEN IIQ_QGTN_CD='69' THEN     QQN_RESULT END M69
        FROM QT_QUESTION A LEFT OUTER JOIN ET_EXAM_ACPT B ON A.QQN_EXAM_DT=B.EEA_EXAM_DT AND A.QQN_EXAM_SQ=B.EEA_EXAM_SQ
                           LEFT OUTER JOIN IT_CUSTOMER  C ON B.EEA_CUST_NO=C.ICR_CUST_NO
                           LEFT OUTER JOIN IT_ITEM_QUESTION D ON A.QQN_QSTN_CD=D.IIQ_QGTN_CD  AND IIQ_APLY_DT= GetITEM_QUESTION_ApplyDate( IIQ_ITEM_CD,EEA_EXAM_DT)
       WHERE EEA_EXAM_DT = :EXAM_DT
         AND EEA_EXAM_SQ = :EXAM_SQ
         AND IIQ_ITEM_CD IN('M0020')
         AND EEA_ORAL_YN ='Y'
         AND EEA_HTSB_CD LIKE'1%') FF
GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, EEA_MNGT_HTYR, EEA_INSU_NO, EEA_SEND_CD,
         ICR_TEL_NO,  ICR_MOBL_NO, ICR_EMAI_AR
		*/

		sql = " SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_MNGT_HTYR, EEA_INSU_NO, EEA_SEND_CD, F_TEL_FORMAT_NUM(ICR_TEL_NO,'1') ICR_TEL_NO1,F_TEL_FORMAT_NUM(ICR_TEL_NO,'2') ICR_TEL_NO2,F_TEL_FORMAT_NUM(ICR_TEL_NO,'3') ICR_TEL_NO3, F_TEL_FORMAT_NUM(ICR_MOBL_NO,'1') ICR_MOBL_NO1,F_TEL_FORMAT_NUM(ICR_MOBL_NO,'2') ICR_MOBL_NO2,F_TEL_FORMAT_NUM(ICR_MOBL_NO,'3') ICR_MOBL_NO3 , ICR_EMAI_AR, MAX(ICR_ZIP_CD) ICR_ZIP_CD, MAX(ICR_ZIP_AR) ICR_ZIP_AR, MAX(ICR_ROAD_AR) ICR_ROAD_AR, MAX(ICR_RECV_YN) ICR_RECV_YN, MAX(M55) M55, MAX(M56) M56, MAX(M57) M57, MAX(M58) M58, MAX(M59) M59, MAX(M60) M60, MAX(M61) M61, MAX(M62) M62, MAX(M63) M63, MAX(M64) M64, MAX(M65) M65, MAX(M66) M66, MAX(M67) M67, MAX(M68) M68, MAX(M69) M69";
		sql += " FROM (";
		sql += "	SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_MNGT_HTYR, EEA_INSU_NO, EEA_SEND_CD, ICR_TEL_NO, ICR_MOBL_NO, ICR_EMAI_AR, ICR_ZIP_CD, ICR_ZIP_AR, ICR_ROAD_AR";
		sql += "	, CASE WHEN IIQ_QGTN_CD='1' THEN QQN_RESULT END ICR_RECV_YN";
		sql += "	, CASE WHEN IIQ_QGTN_CD='55' THEN QQN_RESULT END M55";
		sql += "	, CASE WHEN IIQ_QGTN_CD='56' THEN QQN_RESULT END M56";
		sql += "	, CASE WHEN IIQ_QGTN_CD='57' THEN QQN_RESULT END M57";
		sql += "	, CASE WHEN IIQ_QGTN_CD='58' THEN QQN_RESULT END M58";
		sql += "	, CASE WHEN IIQ_QGTN_CD='59' THEN QQN_RESULT END M59";
		sql += "	, CASE WHEN IIQ_QGTN_CD='60' THEN QQN_RESULT END M60";
		sql += "	, CASE WHEN IIQ_QGTN_CD='61' THEN QQN_RESULT END M61";
		sql += "	, CASE WHEN IIQ_QGTN_CD='62' THEN QQN_RESULT END M62";
		sql += "	, CASE WHEN IIQ_QGTN_CD='63' THEN QQN_RESULT END M63";
		sql += "	, CASE WHEN IIQ_QGTN_CD='64' THEN QQN_RESULT END M64";
		sql += "	, CASE WHEN IIQ_QGTN_CD='65' THEN QQN_RESULT END M65";
		sql += "	, CASE WHEN IIQ_QGTN_CD='66' THEN QQN_RESULT END M66";
		sql += "	, CASE WHEN IIQ_QGTN_CD='67' THEN QQN_RESULT END M67";
		sql += "	, CASE WHEN IIQ_QGTN_CD='68' THEN QQN_RESULT END M68";
		sql += "	, CASE WHEN IIQ_QGTN_CD='69' THEN QQN_RESULT END M69";
		sql += " 	FROM QT_QUESTION A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " 	ON A.QQN_EXAM_DT=B.EEA_EXAM_DT";
		sql += " 	AND A.QQN_EXAM_SQ=B.EEA_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER C";
		sql += " 	ON B.EEA_CUST_NO=C.ICR_CUST_NO LEFT OUTER JOIN IT_ITEM_QUESTION D";
		sql += " 	ON A.QQN_QSTN_CD=D.IIQ_QGTN_CD";
		sql += " 	AND IIQ_APLY_DT= GETITEM_QUESTION_APPLYDATE( IIQ_ITEM_CD,EEA_EXAM_DT)";
		sql += " 	WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " 	AND IIQ_ITEM_CD IN('M0020')";
		sql += " 	AND EEA_ORAL_YN ='Y'";
		sql += " 	AND EEA_HTSB_CD LIKE '1%'";
		sql += " ) FF";
		sql += " GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, EEA_MNGT_HTYR, EEA_INSU_NO, EEA_SEND_CD, ICR_TEL_NO, ICR_MOBL_NO, ICR_EMAI_AR";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UChungfile2020_JSON_UDP_SELMUNJINORAL_001 \n";
			G_INFO += "설명 : 청구생성(구강문진) 조회 \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_HTYR' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_NO' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_CD' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_TEL_NO1' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_TEL_NO2' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_TEL_NO3' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO1' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO2' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_MOBL_NO3' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_EMAI_AR' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_CD' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_AR' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ROAD_AR' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_RECV_YN' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M55' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M56' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M57' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M58' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M59' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M60' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M61' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M62' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M63' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M64' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M65' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M66' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M67' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M68' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M69' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_MNGT_HTYR_T = cRsList.getString("EEA_MNGT_HTYR");
			String EEA_INSU_NO_T = cRsList.getString("EEA_INSU_NO");
			String EEA_SEND_CD_T = cRsList.getString("EEA_SEND_CD");
			String ICR_TEL_NO1_T = cRsList.getString("ICR_TEL_NO1");
			String ICR_TEL_NO2_T = cRsList.getString("ICR_TEL_NO2");
			String ICR_TEL_NO3_T = cRsList.getString("ICR_TEL_NO3");
			String ICR_MOBL_NO1_T = cRsList.getString("ICR_MOBL_NO1");
			String ICR_MOBL_NO2_T = cRsList.getString("ICR_MOBL_NO2");
			String ICR_MOBL_NO3_T = cRsList.getString("ICR_MOBL_NO3");
			String ICR_EMAI_AR_T = cRsList.getString("ICR_EMAI_AR");
			String ICR_ZIP_CD_T = cRsList.getString("ICR_ZIP_CD");
			String ICR_ZIP_AR_T = cRsList.getString("ICR_ZIP_AR");
			String ICR_ROAD_AR_T = cRsList.getString("ICR_ROAD_AR");
			String ICR_RECV_YN_T = cRsList.getString("ICR_RECV_YN");
			String M55_T = cRsList.getString("M55");
			String M56_T = cRsList.getString("M56");
			String M57_T = cRsList.getString("M57");
			String M58_T = cRsList.getString("M58");
			String M59_T = cRsList.getString("M59");
			String M60_T = cRsList.getString("M60");
			String M61_T = cRsList.getString("M61");
			String M62_T = cRsList.getString("M62");
			String M63_T = cRsList.getString("M63");
			String M64_T = cRsList.getString("M64");
			String M65_T = cRsList.getString("M65");
			String M66_T = cRsList.getString("M66");
			String M67_T = cRsList.getString("M67");
			String M68_T = cRsList.getString("M68");
			String M69_T = cRsList.getString("M69");
%>
			<z:row
<%
			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
<%
			}

			if(! EEA_MNGT_HTYR_T.equals("")) {
%>
		 		EEA_MNGT_HTYR='<%= EEA_MNGT_HTYR_T%>'
<%
			}

			if(! EEA_INSU_NO_T.equals("")) {
%>
		 		EEA_INSU_NO='<%= EEA_INSU_NO_T%>'
<%
			}

			if(! EEA_SEND_CD_T.equals("")) {
%>
		 		EEA_SEND_CD='<%= EEA_SEND_CD_T%>'
<%
			}

			if(! ICR_TEL_NO1_T.equals("")) {
%>
		 		ICR_TEL_NO1='<%= ICR_TEL_NO1_T%>'
<%
			}

			if(! ICR_TEL_NO2_T.equals("")) {
%>
		 		ICR_TEL_NO2='<%= ICR_TEL_NO2_T%>'
<%
			}

			if(! ICR_TEL_NO3_T.equals("")) {
%>
		 		ICR_TEL_NO3='<%= ICR_TEL_NO3_T%>'
<%
			}

			if(! ICR_MOBL_NO1_T.equals("")) {
%>
		 		ICR_MOBL_NO1='<%= ICR_MOBL_NO1_T%>'
<%
			}

			if(! ICR_MOBL_NO2_T.equals("")) {
%>
		 		ICR_MOBL_NO2='<%= ICR_MOBL_NO2_T%>'
<%
			}

			if(! ICR_MOBL_NO3_T.equals("")) {
%>
		 		ICR_MOBL_NO3='<%= ICR_MOBL_NO3_T%>'
<%
			}

			if(! ICR_EMAI_AR_T.equals("")) {
%>
		 		ICR_EMAI_AR='<%= ICR_EMAI_AR_T%>'
<%
			}

			if(! ICR_ZIP_CD_T.equals("")) {
%>
		 		ICR_ZIP_CD='<%= ICR_ZIP_CD_T%>'
<%
			}

			if(! ICR_ZIP_AR_T.equals("")) {
%>
		 		ICR_ZIP_AR='<%= ICR_ZIP_AR_T%>'
<%
			}

			if(! ICR_ROAD_AR_T.equals("")) {
%>
		 		ICR_ROAD_AR='<%= ICR_ROAD_AR_T%>'
<%
			}

			if(! ICR_RECV_YN_T.equals("")) {
%>
		 		ICR_RECV_YN='<%= ICR_RECV_YN_T%>'
<%
			}

			if(! M55_T.equals("")) {
%>
		 		M55='<%= M55_T%>'
<%
			}

			if(! M56_T.equals("")) {
%>
		 		M56='<%= M56_T%>'
<%
			}

			if(! M57_T.equals("")) {
%>
		 		M57='<%= M57_T%>'
<%
			}

			if(! M58_T.equals("")) {
%>
		 		M58='<%= M58_T%>'
<%
			}

			if(! M59_T.equals("")) {
%>
		 		M59='<%= M59_T%>'
<%
			}

			if(! M60_T.equals("")) {
%>
		 		M60='<%= M60_T%>'
<%
			}

			if(! M61_T.equals("")) {
%>
		 		M61='<%= M61_T%>'
<%
			}

			if(! M62_T.equals("")) {
%>
		 		M62='<%= M62_T%>'
<%
			}

			if(! M63_T.equals("")) {
%>
		 		M63='<%= M63_T%>'
<%
			}

			if(! M64_T.equals("")) {
%>
		 		M64='<%= M64_T%>'
<%
			}

			if(! M65_T.equals("")) {
%>
		 		M65='<%= M65_T%>'
<%
			}

			if(! M66_T.equals("")) {
%>
		 		M66='<%= M66_T%>'
<%
			}

			if(! M67_T.equals("")) {
%>
		 		M67='<%= M67_T%>'
<%
			}

			if(! M68_T.equals("")) {
%>
		 		M68='<%= M68_T%>'
<%
			}

			if(! M69_T.equals("")) {
%>
		 		M69='<%= M69_T%>'
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
