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

SELECT  MAX(AA) AA,MAX(BB) BB,MAX(CC) CC,MAX(DD) DD,MAX(EE) EE,MAX(FF) FF,MAX(GG) GG,MAX(RR) RR
        ,MAX(SD1) SD1,MAX(SD2) SD2,MAX(SD3) SD3,MAX(SC1) SC1,MAX(SC2) SC2,MAX(SC3) SC3
  FROM (
         SELECT CASE WHEN IIQ_QGTN_CD = '5'  THEN QQN_RESULT END AA
              , CASE WHEN IIQ_QGTN_CD = '6'  THEN QQN_RESULT END BB
              , CASE WHEN IIQ_QGTN_CD = '7'  THEN QQN_RESULT END CC
              , CASE WHEN IIQ_QGTN_CD = '8'  THEN QQN_RESULT END DD
              , CASE WHEN IIQ_QGTN_CD = '12' THEN QQN_RESULT END EE
              , CASE WHEN IIQ_QGTN_CD = '13' THEN QQN_RESULT END FF
              , CASE WHEN IIQ_QGTN_CD = '14' THEN QQN_RESULT END GG
              , CASE WHEN IIQ_QGTN_CD = '15' THEN QQN_RESULT END RR
              , CASE WHEN IIQ_QGTN_CD = '3'  THEN QQN_RESULT END SD1
              , CASE WHEN IIQ_QGTN_CD = '4'  THEN QQN_RESULT END SD2
              , CASE WHEN IIQ_QGTN_CD = '9'  THEN QQN_RESULT END SD3
              , CASE WHEN IIQ_QGTN_CD = '10' THEN QQN_RESULT END SC1
              , CASE WHEN IIQ_QGTN_CD = '11' THEN QQN_RESULT END SC2
              , CASE WHEN IIQ_QGTN_CD = '16' THEN QQN_RESULT END SC3
           FROM QT_QUESTION A
           LEFT OUTER JOIN IT_ITEM_QUESTION B
             ON A.QQN_QSTN_CD = B.IIQ_QGTN_CD
            AND IIQ_ITEM_CD = 'M0018'
          WHERE QQN_EXAM_DT = :EXAM_DT
            AND QQN_EXAM_SQ = :EXAM_SQ
            AND IIQ_APLY_DT = GetITEM_QUESTION_ApplyDate('M0018',:EXAM_DT )
            AND IIQ_ITQU_LV1 = '1'
       ) FF                 
		*/

		sql = " SELECT MAX(AA) AA,MAX(BB) BB,MAX(CC) CC,MAX(DD) DD,MAX(EE) EE,MAX(FF) FF,MAX(GG) GG,MAX(RR) RR ,MAX(SD1) SD1,MAX(SD2) SD2,MAX(SD3) SD3,MAX(SC1) SC1,MAX(SC2) SC2,MAX(SC3) SC3";
		sql += " FROM (";
		sql += "	SELECT CASE WHEN IIQ_QGTN_CD = '5' THEN QQN_RESULT END AA , CASE WHEN IIQ_QGTN_CD = '6' THEN QQN_RESULT END BB";
		sql += "	, CASE WHEN IIQ_QGTN_CD = '7' THEN QQN_RESULT END CC , CASE WHEN IIQ_QGTN_CD = '8' THEN QQN_RESULT END DD";
		sql += "	, CASE WHEN IIQ_QGTN_CD = '12' THEN QQN_RESULT END EE , CASE WHEN IIQ_QGTN_CD = '13' THEN QQN_RESULT END FF";
		sql += "	, CASE WHEN IIQ_QGTN_CD = '14' THEN QQN_RESULT END GG , CASE WHEN IIQ_QGTN_CD = '15' THEN QQN_RESULT END RR";
		sql += "	, CASE WHEN IIQ_QGTN_CD = '3' THEN QQN_RESULT END SD1 , CASE WHEN IIQ_QGTN_CD = '4' THEN QQN_RESULT END SD2";
		sql += "	, CASE WHEN IIQ_QGTN_CD = '9' THEN QQN_RESULT END SD3 , CASE WHEN IIQ_QGTN_CD = '10' THEN QQN_RESULT END SC1";
		sql += "	, CASE WHEN IIQ_QGTN_CD = '11' THEN QQN_RESULT END SC2 , CASE WHEN IIQ_QGTN_CD = '16' THEN QQN_RESULT END SC3";
		sql += " 	FROM QT_QUESTION A LEFT OUTER JOIN IT_ITEM_QUESTION B";
		sql += " 	ON A.QQN_QSTN_CD = B.IIQ_QGTN_CD";
		sql += "	 AND IIQ_ITEM_CD = 'M0018'";
		sql += " 	WHERE QQN_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND QQN_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " 	AND IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE('M0018','" + EXAM_DT + "')";
		sql += " 	AND IIQ_ITQU_LV1 = '1'";
		sql += " ) FF";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGen_Frst_Panj_upSelMunjinRD_001 \n";
			G_INFO += "설명 : 문진조회 (RD확인) \n";
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
		<s:AttributeType name='AA' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='BB' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='CC' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='DD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='EE' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='FF' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='GG' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='RR' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SD1' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SD2' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SD3' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SC1' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SC2' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SC3' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String AA_T = cRsList.getString("AA");
			String BB_T = cRsList.getString("BB");
			String CC_T = cRsList.getString("CC");
			String DD_T = cRsList.getString("DD");
			String EE_T = cRsList.getString("EE");
			String FF_T = cRsList.getString("FF");
			String GG_T = cRsList.getString("GG");
			String RR_T = cRsList.getString("RR");
			String SD1_T = cRsList.getString("SD1");
			String SD2_T = cRsList.getString("SD2");
			String SD3_T = cRsList.getString("SD3");
			String SC1_T = cRsList.getString("SC1");
			String SC2_T = cRsList.getString("SC2");
			String SC3_T = cRsList.getString("SC3");
%>
			<z:row
<%
			if(! AA_T.equals("")) {
%>
		 		AA='<%= AA_T%>'
<%
			}

			if(! BB_T.equals("")) {
%>
		 		BB='<%= BB_T%>'
<%
			}

			if(! CC_T.equals("")) {
%>
		 		CC='<%= CC_T%>'
<%
			}

			if(! DD_T.equals("")) {
%>
		 		DD='<%= DD_T%>'
<%
			}

			if(! EE_T.equals("")) {
%>
		 		EE='<%= EE_T%>'
<%
			}

			if(! FF_T.equals("")) {
%>
		 		FF='<%= FF_T%>'
<%
			}

			if(! GG_T.equals("")) {
%>
		 		GG='<%= GG_T%>'
<%
			}

			if(! RR_T.equals("")) {
%>
		 		RR='<%= RR_T%>'
<%
			}

			if(! SD1_T.equals("")) {
%>
		 		SD1='<%= SD1_T%>'
<%
			}

			if(! SD2_T.equals("")) {
%>
		 		SD2='<%= SD2_T%>'
<%
			}

			if(! SD3_T.equals("")) {
%>
		 		SD3='<%= SD3_T%>'
<%
			}

			if(! SC1_T.equals("")) {
%>
		 		SC1='<%= SC1_T%>'
<%
			}

			if(! SC2_T.equals("")) {
%>
		 		SC2='<%= SC2_T%>'
<%
			}

			if(! SC3_T.equals("")) {
%>
		 		SC3='<%= SC3_T%>'
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
