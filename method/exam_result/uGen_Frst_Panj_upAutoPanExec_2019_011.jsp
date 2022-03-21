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
        MAX(HRunDay) HRunDay ,MAX(HRunHm) HRunHm ,MAX(HRunMm) HRunMm
       ,MAX(BRunDay) BRunDay ,MAX(BRunHm) BRunHm ,MAX(BRunMm) BRunMm
       ,MAX(MusDay) MusDay
   FROM (
          SELECT CASE WHEN QQN_QSTN_CD = '912' THEN NVL(QQN_RESULT, '0') else '0' end  HRunDay
               , CASE WHEN QQN_QSTN_CD = '914' THEN NVL(QQN_RESULT, '0') else '0' end  HRunHm
               , CASE WHEN QQN_QSTN_CD = '915' THEN NVL(QQN_RESULT, '0') else '0' end  HRunMm
               , CASE WHEN QQN_QSTN_CD = '916' THEN NVL(QQN_RESULT, '0') else '0' end  BRunDay
               , CASE WHEN QQN_QSTN_CD = '918' THEN NVL(QQN_RESULT, '0') else '0' end  BRunHm
               , CASE WHEN QQN_QSTN_CD = '919' THEN NVL(QQN_RESULT, '0') else '0' end  BRunMm
               , CASE WHEN QQN_QSTN_CD = '920' THEN NVL(QQN_RESULT, '0') else '0' end  MusDay
            FROM QT_QUESTION A
            LEFT OUTER JOIN IT_ITEM_QUESTION B
              ON A.QQN_QSTN_CD = B.IIQ_QGTN_CD
             AND IIQ_ITEM_CD = 'M0018'
           WHERE QQN_EXAM_DT = :EXAM_DT
             AND QQN_EXAM_SQ = :EXAM_SQ
             AND IIQ_APLY_DT = GetITEM_QUESTION_ApplyDate('M0018',:EXAM_DT )
             AND IIQ_ITQU_LV1 in ('8','9','10')
        ) DD
		*/

		sql = " SELECT MAX(HRUNDAY) HRUNDAY ,MAX(HRUNHM) HRUNHM ,MAX(HRUNMM) HRUNMM ,MAX(BRUNDAY) BRUNDAY ,MAX(BRUNHM) BRUNHM ,MAX(BRUNMM) BRUNMM ,MAX(MUSDAY) MUSDAY";
		sql += " FROM (";
		sql += "	SELECT CASE WHEN QQN_QSTN_CD = '912' THEN NVL(QQN_RESULT, '0') ELSE '0' END HRUNDAY";
		sql += "	, CASE WHEN QQN_QSTN_CD = '914' THEN NVL(QQN_RESULT, '0') ELSE '0' END HRUNHM";
		sql += "	, CASE WHEN QQN_QSTN_CD = '915' THEN NVL(QQN_RESULT, '0') ELSE '0' END HRUNMM";
		sql += "	, CASE WHEN QQN_QSTN_CD = '916' THEN NVL(QQN_RESULT, '0') ELSE '0' END BRUNDAY";
		sql += "	, CASE WHEN QQN_QSTN_CD = '918' THEN NVL(QQN_RESULT, '0') ELSE '0' END BRUNHM";
		sql += "	, CASE WHEN QQN_QSTN_CD = '919' THEN NVL(QQN_RESULT, '0') ELSE '0' END BRUNMM";
		sql += "	, CASE WHEN QQN_QSTN_CD = '920' THEN NVL(QQN_RESULT, '0') ELSE '0' END MUSDAY";
		sql += " 	FROM QT_QUESTION A LEFT OUTER JOIN IT_ITEM_QUESTION B";
		sql += " 	ON A.QQN_QSTN_CD = B.IIQ_QGTN_CD";
		sql += " 	AND IIQ_ITEM_CD = 'M0018'";
		sql += " 	WHERE QQN_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND QQN_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " 	AND IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE('M0018','" + EXAM_DT + "')";
		sql += " 	AND IIQ_ITQU_LV1 IN ('8','9','10')";
		sql += " ) DD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGen_Frst_Panj_upAutoPanExec_2019_011 \n";
			G_INFO += "설명 : 일검자동판정(문진 운동) \n";
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
		<s:AttributeType name='HRUNDAY' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='HRUNHM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='HRUNMM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='BRUNDAY' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='BRUNHM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='BRUNMM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='MUSDAY' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String HRUNDAY_T = cRsList.getString("HRUNDAY");
			String HRUNHM_T = cRsList.getString("HRUNHM");
			String HRUNMM_T = cRsList.getString("HRUNMM");
			String BRUNDAY_T = cRsList.getString("BRUNDAY");
			String BRUNHM_T = cRsList.getString("BRUNHM");
			String BRUNMM_T = cRsList.getString("BRUNMM");
			String MUSDAY_T = cRsList.getString("MUSDAY");
%>
			<z:row
<%
			if(! HRUNDAY_T.equals("")) {
%>
		 		HRUNDAY='<%= HRUNDAY_T%>'
<%
			}

			if(! HRUNHM_T.equals("")) {
%>
		 		HRUNHM='<%= HRUNHM_T%>'
<%
			}

			if(! HRUNMM_T.equals("")) {
%>
		 		HRUNMM='<%= HRUNMM_T%>'
<%
			}

			if(! BRUNDAY_T.equals("")) {
%>
		 		BRUNDAY='<%= BRUNDAY_T%>'
<%
			}

			if(! BRUNHM_T.equals("")) {
%>
		 		BRUNHM='<%= BRUNHM_T%>'
<%
			}

			if(! BRUNMM_T.equals("")) {
%>
		 		BRUNMM='<%= BRUNMM_T%>'
<%
			}

			if(! MUSDAY_T.equals("")) {
%>
		 		MUSDAY='<%= MUSDAY_T%>'
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
