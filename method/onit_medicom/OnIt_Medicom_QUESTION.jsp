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
		String CHART_NO = htMethod.get("CHART_NO");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(CHART_NO == null) { CHART_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IIQ_ITEM_CD, CQN_QSTN_CD, CQN_QSTN_NM, RTRIM(QQN_RESULT) QQN_RESULT, CQN_ANSR_CD, CQN_ANSE_EX 
FROM ( 
  select * from
    (select IIQ_ITEM_CD, CQN_QSTN_CD, IIQ_ITQU_LV1, IIQ_ITQU_LV2, IIQ_ITQU_SQ, CQN_QSTN_NM, CQN_ANSR_CD, CQN_ANSE_EX 
     FROM IT_ITEM_QUESTION A, CT_QUESTION C 
     where A.IIQ_ITEM_CD = 'M0017' 
       and A.IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE('M0017',:EXAM_DT) 
       and A.IIQ_QGTN_CD = C.CQN_QSTN_CD(+) 
     ) a,
    (select QQN_QSTN_CD, QQN_RESULT from QT_QUESTION 
     where
           QQN_EXAM_DT = :EXAM_DT 
       and QQN_EXAM_SQ = (SELECT MAX(EEA_EXAM_SQ)  FROM ET_EXAM_ACPT  WHERE EEA_EXAM_DT = :EXAM_DT AND EEA_CHART_NO = :CHART_NO AND EEA_ORDER_YN <> 'C')
     ) b 
  where 
    a.CQN_QSTN_CD = b.QQN_QSTN_CD(+) 
  union all 
  select * from
    (select IIQ_ITEM_CD, CQN_QSTN_CD, IIQ_ITQU_LV1, IIQ_ITQU_LV2, IIQ_ITQU_SQ, CQN_QSTN_NM, CQN_ANSR_CD, CQN_ANSE_EX 
     FROM IT_ITEM_QUESTION A, CT_QUESTION C 
     where A.IIQ_ITEM_CD = 'M0018' 
       and A.IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE('M0018',:EXAM_DT) 
       and A.IIQ_QGTN_CD = C.CQN_QSTN_CD(+) 
     ) a,
    (select QQN_QSTN_CD, QQN_RESULT from QT_QUESTION 
     where
           QQN_EXAM_DT = :EXAM_DT 
       and QQN_EXAM_SQ = (SELECT MAX(EEA_EXAM_SQ)  FROM ET_EXAM_ACPT  WHERE EEA_EXAM_DT = :EXAM_DT AND EEA_CHART_NO = :CHART_NO AND EEA_ORDER_YN <> 'C')
     ) b 
  where 
    a.CQN_QSTN_CD = b.QQN_QSTN_CD(+) 
) A ORDER BY IIQ_ITEM_CD, TO_NUMBER(nvl(IIQ_ITQU_LV1,0)), TO_NUMBER(nvl(IIQ_ITQU_LV2,0)),  TO_NUMBER(nvl(IIQ_ITQU_SQ,0))

		*/

		sql = " SELECT IIQ_ITEM_CD, CQN_QSTN_CD, CQN_QSTN_NM, RTRIM(QQN_RESULT) QQN_RESULT, CQN_ANSR_CD, CQN_ANSE_EX";
		sql += " FROM ( SELECT *";
		sql += " FROM (SELECT IIQ_ITEM_CD, CQN_QSTN_CD, IIQ_ITQU_LV1, IIQ_ITQU_LV2, IIQ_ITQU_SQ, CQN_QSTN_NM, CQN_ANSR_CD, CQN_ANSE_EX";
		sql += " FROM IT_ITEM_QUESTION A, CT_QUESTION C";
		sql += " WHERE A.IIQ_ITEM_CD = 'M0017'";
		sql += " AND A.IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE('M0017','" + EXAM_DT + "')";
		sql += " AND A.IIQ_QGTN_CD = C.CQN_QSTN_CD(+) ) A, (SELECT QQN_QSTN_CD, QQN_RESULT";
		sql += " FROM QT_QUESTION";
		sql += " WHERE QQN_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND QQN_EXAM_SQ = (SELECT MAX(EEA_EXAM_SQ)";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEA_CHART_NO = '" + CHART_NO + "'";
		sql += " AND EEA_ORDER_YN <> 'C') ) B";
		sql += " WHERE A.CQN_QSTN_CD = B.QQN_QSTN_CD(+)";
		sql += " UNION";
		sql += " ALL SELECT *";
		sql += " FROM (SELECT IIQ_ITEM_CD, CQN_QSTN_CD, IIQ_ITQU_LV1, IIQ_ITQU_LV2, IIQ_ITQU_SQ, CQN_QSTN_NM, CQN_ANSR_CD, CQN_ANSE_EX";
		sql += " FROM IT_ITEM_QUESTION A, CT_QUESTION C";
		sql += " WHERE A.IIQ_ITEM_CD = 'M0018'";
		sql += " AND A.IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE('M0018','" + EXAM_DT + "')";
		sql += " AND A.IIQ_QGTN_CD = C.CQN_QSTN_CD(+) ) A, (SELECT QQN_QSTN_CD, QQN_RESULT";
		sql += " FROM QT_QUESTION";
		sql += " WHERE QQN_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND QQN_EXAM_SQ = (SELECT MAX(EEA_EXAM_SQ)";
		sql += " FROM ET_EXAM_ACPT";
		sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEA_CHART_NO = '" + CHART_NO + "'";
		sql += " AND EEA_ORDER_YN <> 'C') ) B";
		sql += " WHERE A.CQN_QSTN_CD = B.QQN_QSTN_CD(+) ) A";
		sql += " ORDER BY IIQ_ITEM_CD, TO_NUMBER(NVL(IIQ_ITQU_LV1,0)), TO_NUMBER(NVL(IIQ_ITQU_LV2,0)), TO_NUMBER(NVL(IIQ_ITQU_SQ,0))";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : OnIt_Medicom_QUESTION \n";
			G_INFO += "설명 : 온아이티 문진정보 제공 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " CHART_NO : " + CHART_NO + " \n";
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
		<s:AttributeType name='IIQ_ITEM_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_CD' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_RESULT' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_ANSR_CD' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_ANSE_EX' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String IIQ_ITEM_CD_T = cRsList.getString("IIQ_ITEM_CD");
			String CQN_QSTN_CD_T = cRsList.getString("CQN_QSTN_CD");
			String CQN_QSTN_NM_T = cRsList.getString("CQN_QSTN_NM");
			String QQN_RESULT_T = cRsList.getString("QQN_RESULT");
			String CQN_ANSR_CD_T = cRsList.getString("CQN_ANSR_CD");
			String CQN_ANSE_EX_T = cRsList.getString("CQN_ANSE_EX");
%>
			<z:row
<%
			if(! IIQ_ITEM_CD_T.equals("")) {
%>
		 		IIQ_ITEM_CD='<%= IIQ_ITEM_CD_T%>'
<%
			}

			if(! CQN_QSTN_CD_T.equals("")) {
%>
		 		CQN_QSTN_CD='<%= CQN_QSTN_CD_T%>'
<%
			}

			if(! CQN_QSTN_NM_T.equals("")) {
%>
		 		CQN_QSTN_NM='<%= CQN_QSTN_NM_T%>'
<%
			}

			if(! QQN_RESULT_T.equals("")) {
%>
		 		QQN_RESULT='<%= QQN_RESULT_T%>'
<%
			}

			if(! CQN_ANSR_CD_T.equals("")) {
%>
		 		CQN_ANSR_CD='<%= CQN_ANSR_CD_T%>'
<%
			}

			if(! CQN_ANSE_EX_T.equals("")) {
%>
		 		CQN_ANSE_EX='<%= CQN_ANSE_EX_T%>'
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
