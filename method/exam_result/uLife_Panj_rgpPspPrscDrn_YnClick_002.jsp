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

SELECT
   MAX(DrinKd) DrinKd ,MAX(DrinKw) DrinKw
  ,MAX(A1) A1 ,MAX(A2) A2 ,MAX(A3) A3 ,MAX(A4) A4
  ,MAX(A5) A5 ,MAX(A6) A6 ,MAX(A7) A7 ,MAX(A8) A8
  ,MAX(A9) A9 ,MAX(A10) A10 ,MAX(A11) A11 ,MAX(A12) A12
  ,MAX(A13) A13 ,MAX(A14) A14 ,MAX(A15) A15 ,MAX(A16) A16
  ,MAX(A17) A17 ,MAX(A18) A18 ,MAX(A19) A19 ,MAX(A20) A20
  ,MAX(B1) B1 ,MAX(B2) B2 ,MAX(B3) B3 ,MAX(B4) B4
  ,MAX(B5) B5 ,MAX(B6) B6 ,MAX(B7) B7 ,MAX(B8) B8
  ,MAX(B9) B9 ,MAX(B10) B10 ,MAX(B11) B11 ,MAX(B12) B12
  ,MAX(B13) B13 ,MAX(B14) B14 ,MAX(B15) B15 ,MAX(B16) B16
  ,MAX(B17) B17 ,MAX(B18) B18 ,MAX(B19) B19 ,MAX(B20) B20
  FROM (
         SELECT CASE WHEN QQN_QSTN_CD = '867'  THEN NVL(QQN_RESULT, '0') else '0' end  DrinKd
              , CASE WHEN QQN_QSTN_CD = '868'  THEN NVL(QQN_RESULT, '0') else '0' end  DrinKw
              , CASE WHEN QQN_QSTN_CD = '869'  THEN NVL(QQN_RESULT, '0') else '0' end   A1
              , CASE WHEN QQN_QSTN_CD = '870'  THEN NVL(QQN_RESULT, '0') else '0' end   A2
              , CASE WHEN QQN_QSTN_CD = '871'  THEN NVL(QQN_RESULT, '0') else '0' end   A3
              , CASE WHEN QQN_QSTN_CD = '874'  THEN NVL(QQN_RESULT, '0') else '0' end   A4
              , CASE WHEN QQN_QSTN_CD = '872'  THEN NVL(QQN_RESULT, '0') else '0' end   A5
              , CASE WHEN QQN_QSTN_CD = '875'  THEN NVL(QQN_RESULT, '0') else '0' end   A6
              , CASE WHEN QQN_QSTN_CD = '876'  THEN NVL(QQN_RESULT, '0') else '0' end   A7
              , CASE WHEN QQN_QSTN_CD = '877'  THEN NVL(QQN_RESULT, '0') else '0' end   A8
              , CASE WHEN QQN_QSTN_CD = '878'  THEN NVL(QQN_RESULT, '0') else '0' end   A9
              , CASE WHEN QQN_QSTN_CD = '879'  THEN NVL(QQN_RESULT, '0') else '0' end   A10
              , CASE WHEN QQN_QSTN_CD = '880'  THEN NVL(QQN_RESULT, '0') else '0' end   A11
              , CASE WHEN QQN_QSTN_CD = '881'  THEN NVL(QQN_RESULT, '0') else '0' end   A12
              , CASE WHEN QQN_QSTN_CD = '882'  THEN NVL(QQN_RESULT, '0') else '0' end   A13
              , CASE WHEN QQN_QSTN_CD = '883'  THEN NVL(QQN_RESULT, '0') else '0' end   A14
              , CASE WHEN QQN_QSTN_CD = '884'  THEN NVL(QQN_RESULT, '0') else '0' end   A15
              , CASE WHEN QQN_QSTN_CD = '885'  THEN NVL(QQN_RESULT, '0') else '0' end   A16
              , CASE WHEN QQN_QSTN_CD = '887'  THEN NVL(QQN_RESULT, '0') else '0' end   A17
              , CASE WHEN QQN_QSTN_CD = '888'  THEN NVL(QQN_RESULT, '0') else '0' end   A18
              , CASE WHEN QQN_QSTN_CD = '889'  THEN NVL(QQN_RESULT, '0') else '0' end   A19
              , CASE WHEN QQN_QSTN_CD = '890'  THEN NVL(QQN_RESULT, '0') else '0' end   A20
              , CASE WHEN QQN_QSTN_CD = '891'  THEN NVL(QQN_RESULT, '0') else '0' end   B1
              , CASE WHEN QQN_QSTN_CD = '892'  THEN NVL(QQN_RESULT, '0') else '0' end   B2
              , CASE WHEN QQN_QSTN_CD = '893'  THEN NVL(QQN_RESULT, '0') else '0' end   B3
              , CASE WHEN QQN_QSTN_CD = '894'  THEN NVL(QQN_RESULT, '0') else '0' end   B4
              , CASE WHEN QQN_QSTN_CD = '895'  THEN NVL(QQN_RESULT, '0') else '0' end   B5
              , CASE WHEN QQN_QSTN_CD = '896'  THEN NVL(QQN_RESULT, '0') else '0' end   B6
              , CASE WHEN QQN_QSTN_CD = '897'  THEN NVL(QQN_RESULT, '0') else '0' end   B7
              , CASE WHEN QQN_QSTN_CD = '898'  THEN NVL(QQN_RESULT, '0') else '0' end   B8
              , CASE WHEN QQN_QSTN_CD = '899'  THEN NVL(QQN_RESULT, '0') else '0' end   B9
              , CASE WHEN QQN_QSTN_CD = '900'  THEN NVL(QQN_RESULT, '0') else '0' end   B10
              , CASE WHEN QQN_QSTN_CD = '902'  THEN NVL(QQN_RESULT, '0') else '0' end   B11
              , CASE WHEN QQN_QSTN_CD = '901'  THEN NVL(QQN_RESULT, '0') else '0' end   B12
              , CASE WHEN QQN_QSTN_CD = '903'  THEN NVL(QQN_RESULT, '0') else '0' end   B13
              , CASE WHEN QQN_QSTN_CD = '904'  THEN NVL(QQN_RESULT, '0') else '0' end   B14
              , CASE WHEN QQN_QSTN_CD = '905'  THEN NVL(QQN_RESULT, '0') else '0' end   B15
              , CASE WHEN QQN_QSTN_CD = '906'  THEN NVL(QQN_RESULT, '0') else '0' end   B16
              , CASE WHEN QQN_QSTN_CD = '908'  THEN NVL(QQN_RESULT, '0') else '0' end   B17
              , CASE WHEN QQN_QSTN_CD = '909'  THEN NVL(QQN_RESULT, '0') else '0' end   B18
              , CASE WHEN QQN_QSTN_CD = '910'  THEN NVL(QQN_RESULT, '0') else '0' end   B19
              , CASE WHEN QQN_QSTN_CD = '911'  THEN NVL(QQN_RESULT, '0') else '0' end   B20
           FROM QT_QUESTION A
           LEFT OUTER JOIN IT_ITEM_QUESTION B
             ON A.QQN_QSTN_CD = B.IIQ_QGTN_CD
            AND IIQ_ITEM_CD = 'M0018'
          WHERE QQN_EXAM_DT = :EXAM_DT
            AND QQN_EXAM_SQ = :EXAM_SQ
            AND IIQ_APLY_DT = GetITEM_QUESTION_ApplyDate('M0018',:EXAM_DT )
       ) DD

		*/

		sql = " SELECT MAX(DRINKD) DRINKD ,MAX(DRINKW) DRINKW ,MAX(A1) A1 ,MAX(A2) A2 ,MAX(A3) A3 ,MAX(A4) A4 ,MAX(A5) A5 ,MAX(A6) A6 ,MAX(A7) A7 ,MAX(A8) A8 ,MAX(A9) A9 ,MAX(A10) A10 ,MAX(A11) A11 ,MAX(A12) A12 ,MAX(A13) A13 ,MAX(A14) A14 ,MAX(A15) A15 ,MAX(A16) A16 ,MAX(A17) A17 ,MAX(A18) A18 ,MAX(A19) A19 ,MAX(A20) A20 ,MAX(B1) B1 ,MAX(B2) B2 ,MAX(B3) B3 ,MAX(B4) B4 ,MAX(B5) B5 ,MAX(B6) B6 ,MAX(B7) B7 ,MAX(B8) B8 ,MAX(B9) B9 ,MAX(B10) B10 ,MAX(B11) B11 ,MAX(B12) B12 ,MAX(B13) B13 ,MAX(B14) B14 ,MAX(B15) B15 ,MAX(B16) B16 ,MAX(B17) B17 ,MAX(B18) B18 ,MAX(B19) B19 ,MAX(B20) B20";
		sql += " FROM (";
		sql += "	SELECT CASE WHEN QQN_QSTN_CD = '867' THEN NVL(QQN_RESULT, '0') ELSE '0' END DRINKD";
		sql += "	, CASE WHEN QQN_QSTN_CD = '868' THEN NVL(QQN_RESULT, '0') ELSE '0' END DRINKW";
		sql += "	, CASE WHEN QQN_QSTN_CD = '869' THEN NVL(QQN_RESULT, '0') ELSE '0' END A1";
		sql += "	, CASE WHEN QQN_QSTN_CD = '870' THEN NVL(QQN_RESULT, '0') ELSE '0' END A2";
		sql += "	, CASE WHEN QQN_QSTN_CD = '871' THEN NVL(QQN_RESULT, '0') ELSE '0' END A3";
		sql += "	, CASE WHEN QQN_QSTN_CD = '874' THEN NVL(QQN_RESULT, '0') ELSE '0' END A4";
		sql += "	, CASE WHEN QQN_QSTN_CD = '872' THEN NVL(QQN_RESULT, '0') ELSE '0' END A5";
		sql += "	, CASE WHEN QQN_QSTN_CD = '875' THEN NVL(QQN_RESULT, '0') ELSE '0' END A6";
		sql += "	, CASE WHEN QQN_QSTN_CD = '876' THEN NVL(QQN_RESULT, '0') ELSE '0' END A7";
		sql += "	, CASE WHEN QQN_QSTN_CD = '877' THEN NVL(QQN_RESULT, '0') ELSE '0' END A8";
		sql += "	, CASE WHEN QQN_QSTN_CD = '878' THEN NVL(QQN_RESULT, '0') ELSE '0' END A9";
		sql += "	, CASE WHEN QQN_QSTN_CD = '879' THEN NVL(QQN_RESULT, '0') ELSE '0' END A10";
		sql += "	, CASE WHEN QQN_QSTN_CD = '880' THEN NVL(QQN_RESULT, '0') ELSE '0' END A11";
		sql += "	, CASE WHEN QQN_QSTN_CD = '881' THEN NVL(QQN_RESULT, '0') ELSE '0' END A12";
		sql += "	, CASE WHEN QQN_QSTN_CD = '882' THEN NVL(QQN_RESULT, '0') ELSE '0' END A13";
		sql += "	, CASE WHEN QQN_QSTN_CD = '883' THEN NVL(QQN_RESULT, '0') ELSE '0' END A14";
		sql += "	, CASE WHEN QQN_QSTN_CD = '884' THEN NVL(QQN_RESULT, '0') ELSE '0' END A15";
		sql += "	, CASE WHEN QQN_QSTN_CD = '885' THEN NVL(QQN_RESULT, '0') ELSE '0' END A16";
		sql += "	, CASE WHEN QQN_QSTN_CD = '887' THEN NVL(QQN_RESULT, '0') ELSE '0' END A17";
		sql += "	, CASE WHEN QQN_QSTN_CD = '888' THEN NVL(QQN_RESULT, '0') ELSE '0' END A18";
		sql += "	, CASE WHEN QQN_QSTN_CD = '889' THEN NVL(QQN_RESULT, '0') ELSE '0' END A19";
		sql += "	, CASE WHEN QQN_QSTN_CD = '890' THEN NVL(QQN_RESULT, '0') ELSE '0' END A20";
		sql += "	, CASE WHEN QQN_QSTN_CD = '891' THEN NVL(QQN_RESULT, '0') ELSE '0' END B1";
		sql += "	, CASE WHEN QQN_QSTN_CD = '892' THEN NVL(QQN_RESULT, '0') ELSE '0' END B2";
		sql += "	, CASE WHEN QQN_QSTN_CD = '893' THEN NVL(QQN_RESULT, '0') ELSE '0' END B3";
		sql += "	, CASE WHEN QQN_QSTN_CD = '894' THEN NVL(QQN_RESULT, '0') ELSE '0' END B4";
		sql += "	, CASE WHEN QQN_QSTN_CD = '895' THEN NVL(QQN_RESULT, '0') ELSE '0' END B5";
		sql += "	, CASE WHEN QQN_QSTN_CD = '896' THEN NVL(QQN_RESULT, '0') ELSE '0' END B6";
		sql += "	, CASE WHEN QQN_QSTN_CD = '897' THEN NVL(QQN_RESULT, '0') ELSE '0' END B7";
		sql += "	, CASE WHEN QQN_QSTN_CD = '898' THEN NVL(QQN_RESULT, '0') ELSE '0' END B8";
		sql += "	, CASE WHEN QQN_QSTN_CD = '899' THEN NVL(QQN_RESULT, '0') ELSE '0' END B9";
		sql += "	, CASE WHEN QQN_QSTN_CD = '900' THEN NVL(QQN_RESULT, '0') ELSE '0' END B10";
		sql += "	, CASE WHEN QQN_QSTN_CD = '902' THEN NVL(QQN_RESULT, '0') ELSE '0' END B11";
		sql += "	, CASE WHEN QQN_QSTN_CD = '901' THEN NVL(QQN_RESULT, '0') ELSE '0' END B12";
		sql += "	, CASE WHEN QQN_QSTN_CD = '903' THEN NVL(QQN_RESULT, '0') ELSE '0' END B13";
		sql += "	, CASE WHEN QQN_QSTN_CD = '904' THEN NVL(QQN_RESULT, '0') ELSE '0' END B14";
		sql += "	, CASE WHEN QQN_QSTN_CD = '905' THEN NVL(QQN_RESULT, '0') ELSE '0' END B15";
		sql += "	, CASE WHEN QQN_QSTN_CD = '906' THEN NVL(QQN_RESULT, '0') ELSE '0' END B16";
		sql += "	, CASE WHEN QQN_QSTN_CD = '908' THEN NVL(QQN_RESULT, '0') ELSE '0' END B17";
		sql += "	, CASE WHEN QQN_QSTN_CD = '909' THEN NVL(QQN_RESULT, '0') ELSE '0' END B18";
		sql += "	, CASE WHEN QQN_QSTN_CD = '910' THEN NVL(QQN_RESULT, '0') ELSE '0' END B19";
		sql += "	, CASE WHEN QQN_QSTN_CD = '911' THEN NVL(QQN_RESULT, '0') ELSE '0' END B20";
		sql += " 	FROM QT_QUESTION A LEFT OUTER JOIN IT_ITEM_QUESTION B";
		sql += " 	ON A.QQN_QSTN_CD = B.IIQ_QGTN_CD";
		sql += " 	AND IIQ_ITEM_CD = 'M0018'";
		sql += " 	WHERE QQN_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND QQN_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " 	AND IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE('M0018','" + EXAM_DT + "')";
		sql += ") DD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uLife_Panj_rgpPspPrscDrn_YnClick_002 \n";
			G_INFO += "설명 : 공통문진표 (음주관련) \n";
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
		<s:AttributeType name='DRINKD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='DRINKW' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A1' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A2' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A3' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A4' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A5' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A6' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A7' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A8' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A9' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A10' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A11' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A12' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A13' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A14' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A15' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A16' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A17' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A18' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A19' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='A20' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B1' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B2' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B3' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B4' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B5' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B6' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B7' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B8' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B9' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B10' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B11' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B12' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B13' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B14' rs:number='36' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B15' rs:number='37' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B16' rs:number='38' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B17' rs:number='39' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B18' rs:number='40' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B19' rs:number='41' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='B20' rs:number='42' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String DRINKD_T = cRsList.getString("DRINKD");
			String DRINKW_T = cRsList.getString("DRINKW");
			String A1_T = cRsList.getString("A1");
			String A2_T = cRsList.getString("A2");
			String A3_T = cRsList.getString("A3");
			String A4_T = cRsList.getString("A4");
			String A5_T = cRsList.getString("A5");
			String A6_T = cRsList.getString("A6");
			String A7_T = cRsList.getString("A7");
			String A8_T = cRsList.getString("A8");
			String A9_T = cRsList.getString("A9");
			String A10_T = cRsList.getString("A10");
			String A11_T = cRsList.getString("A11");
			String A12_T = cRsList.getString("A12");
			String A13_T = cRsList.getString("A13");
			String A14_T = cRsList.getString("A14");
			String A15_T = cRsList.getString("A15");
			String A16_T = cRsList.getString("A16");
			String A17_T = cRsList.getString("A17");
			String A18_T = cRsList.getString("A18");
			String A19_T = cRsList.getString("A19");
			String A20_T = cRsList.getString("A20");
			String B1_T = cRsList.getString("B1");
			String B2_T = cRsList.getString("B2");
			String B3_T = cRsList.getString("B3");
			String B4_T = cRsList.getString("B4");
			String B5_T = cRsList.getString("B5");
			String B6_T = cRsList.getString("B6");
			String B7_T = cRsList.getString("B7");
			String B8_T = cRsList.getString("B8");
			String B9_T = cRsList.getString("B9");
			String B10_T = cRsList.getString("B10");
			String B11_T = cRsList.getString("B11");
			String B12_T = cRsList.getString("B12");
			String B13_T = cRsList.getString("B13");
			String B14_T = cRsList.getString("B14");
			String B15_T = cRsList.getString("B15");
			String B16_T = cRsList.getString("B16");
			String B17_T = cRsList.getString("B17");
			String B18_T = cRsList.getString("B18");
			String B19_T = cRsList.getString("B19");
			String B20_T = cRsList.getString("B20");
%>
			<z:row
<%
			if(! DRINKD_T.equals("")) {
%>
		 		DRINKD='<%= DRINKD_T%>'
<%
			}

			if(! DRINKW_T.equals("")) {
%>
		 		DRINKW='<%= DRINKW_T%>'
<%
			}

			if(! A1_T.equals("")) {
%>
		 		A1='<%= A1_T%>'
<%
			}

			if(! A2_T.equals("")) {
%>
		 		A2='<%= A2_T%>'
<%
			}

			if(! A3_T.equals("")) {
%>
		 		A3='<%= A3_T%>'
<%
			}

			if(! A4_T.equals("")) {
%>
		 		A4='<%= A4_T%>'
<%
			}

			if(! A5_T.equals("")) {
%>
		 		A5='<%= A5_T%>'
<%
			}

			if(! A6_T.equals("")) {
%>
		 		A6='<%= A6_T%>'
<%
			}

			if(! A7_T.equals("")) {
%>
		 		A7='<%= A7_T%>'
<%
			}

			if(! A8_T.equals("")) {
%>
		 		A8='<%= A8_T%>'
<%
			}

			if(! A9_T.equals("")) {
%>
		 		A9='<%= A9_T%>'
<%
			}

			if(! A10_T.equals("")) {
%>
		 		A10='<%= A10_T%>'
<%
			}

			if(! A11_T.equals("")) {
%>
		 		A11='<%= A11_T%>'
<%
			}

			if(! A12_T.equals("")) {
%>
		 		A12='<%= A12_T%>'
<%
			}

			if(! A13_T.equals("")) {
%>
		 		A13='<%= A13_T%>'
<%
			}

			if(! A14_T.equals("")) {
%>
		 		A14='<%= A14_T%>'
<%
			}

			if(! A15_T.equals("")) {
%>
		 		A15='<%= A15_T%>'
<%
			}

			if(! A16_T.equals("")) {
%>
		 		A16='<%= A16_T%>'
<%
			}

			if(! A17_T.equals("")) {
%>
		 		A17='<%= A17_T%>'
<%
			}

			if(! A18_T.equals("")) {
%>
		 		A18='<%= A18_T%>'
<%
			}

			if(! A19_T.equals("")) {
%>
		 		A19='<%= A19_T%>'
<%
			}

			if(! A20_T.equals("")) {
%>
		 		A20='<%= A20_T%>'
<%
			}

			if(! B1_T.equals("")) {
%>
		 		B1='<%= B1_T%>'
<%
			}

			if(! B2_T.equals("")) {
%>
		 		B2='<%= B2_T%>'
<%
			}

			if(! B3_T.equals("")) {
%>
		 		B3='<%= B3_T%>'
<%
			}

			if(! B4_T.equals("")) {
%>
		 		B4='<%= B4_T%>'
<%
			}

			if(! B5_T.equals("")) {
%>
		 		B5='<%= B5_T%>'
<%
			}

			if(! B6_T.equals("")) {
%>
		 		B6='<%= B6_T%>'
<%
			}

			if(! B7_T.equals("")) {
%>
		 		B7='<%= B7_T%>'
<%
			}

			if(! B8_T.equals("")) {
%>
		 		B8='<%= B8_T%>'
<%
			}

			if(! B9_T.equals("")) {
%>
		 		B9='<%= B9_T%>'
<%
			}

			if(! B10_T.equals("")) {
%>
		 		B10='<%= B10_T%>'
<%
			}

			if(! B11_T.equals("")) {
%>
		 		B11='<%= B11_T%>'
<%
			}

			if(! B12_T.equals("")) {
%>
		 		B12='<%= B12_T%>'
<%
			}

			if(! B13_T.equals("")) {
%>
		 		B13='<%= B13_T%>'
<%
			}

			if(! B14_T.equals("")) {
%>
		 		B14='<%= B14_T%>'
<%
			}

			if(! B15_T.equals("")) {
%>
		 		B15='<%= B15_T%>'
<%
			}

			if(! B16_T.equals("")) {
%>
		 		B16='<%= B16_T%>'
<%
			}

			if(! B17_T.equals("")) {
%>
		 		B17='<%= B17_T%>'
<%
			}

			if(! B18_T.equals("")) {
%>
		 		B18='<%= B18_T%>'
<%
			}

			if(! B19_T.equals("")) {
%>
		 		B19='<%= B19_T%>'
<%
			}

			if(! B20_T.equals("")) {
%>
		 		B20='<%= B20_T%>'
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
