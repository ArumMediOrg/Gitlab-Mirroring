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

SELECT  PDP_EXAM_DT
       ,SUBSTR(EEA_HLTH_KD, 5, 1) AS HABIT_05
       ,SUBSTR(EEA_HLTH_KD, 6, 1) AS HABIT_06
       ,SUBSTR(EEA_HLTH_KD, 7, 1) AS HABIT_07
       ,SUBSTR(EEA_HLTH_KD, 8, 1) AS HABIT_08
             ,PSP_PRSCR_SM_YN, PSP_PRSCR_DRN_YN, PSP_PRSCR_SPT_YN, PSP_PRSCR_NUT_YN, PSP_PRSCR_PYC_YN
             ,PSP_CESD_INFO_YN
             ,QQN_RESULT  QQN_RESULT_53
             ,PSP_KDSQC
 FROM ET_EXAM_ACPT A
      LEFT OUTER JOIN (SELECT PDP_EXAM_DT, PDP_EXAM_SQ FROM PT_DANR_PANJUNG WHERE PDP_EXAM_DT = :EXAM_DT AND PDP_EXAM_SQ = :EXAM_SQ GROUP BY PDP_EXAM_DT, PDP_EXAM_SQ) B
                 ON A.EEA_EXAM_DT = B.PDP_EXAM_DT AND A.EEA_EXAM_SQ = B.PDP_EXAM_SQ
          LEFT OUTER JOIN PT_SED_PANJUNG C ON A.EEA_EXAM_DT = C.PSP_EXAM_DT AND A.EEA_EXAM_SQ = C.PSP_EXAM_SQ
          LEFT OUTER JOIN  QT_QUESTION D ON A.EEA_EXAM_DT = D.QQN_EXAM_DT AND A.EEA_EXAM_SQ = D.QQN_EXAM_SQ AND QQN_QSTN_CD = '53'
 WHERE EEA_EXAM_DT = :EXAM_DT AND EEA_EXAM_SQ = :EXAM_SQ
		*/

		sql = " SELECT PDP_EXAM_DT ,SUBSTR(EEA_HLTH_KD, 5, 1) AS HABIT_05 ,SUBSTR(EEA_HLTH_KD, 6, 1) AS HABIT_06 ,SUBSTR(EEA_HLTH_KD, 7, 1) AS HABIT_07 ,SUBSTR(EEA_HLTH_KD, 8, 1) AS HABIT_08 ,PSP_PRSCR_SM_YN, PSP_PRSCR_DRN_YN, PSP_PRSCR_SPT_YN, PSP_PRSCR_NUT_YN, PSP_PRSCR_PYC_YN ,PSP_CESD_INFO_YN ,QQN_RESULT QQN_RESULT_53 ,PSP_KDSQC";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN (";
		sql += "	SELECT PDP_EXAM_DT, PDP_EXAM_SQ";
		sql += " 	FROM PT_DANR_PANJUNG";
		sql += " 	WHERE PDP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND PDP_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " 	GROUP BY PDP_EXAM_DT, PDP_EXAM_SQ";
		sql += " ) B";
		sql += " ON A.EEA_EXAM_DT = B.PDP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.PDP_EXAM_SQ LEFT OUTER JOIN PT_SED_PANJUNG C";
		sql += " ON A.EEA_EXAM_DT = C.PSP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = C.PSP_EXAM_SQ LEFT OUTER JOIN QT_QUESTION D";
		sql += " ON A.EEA_EXAM_DT = D.QQN_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.QQN_EXAM_SQ";
		sql += " AND QQN_QSTN_CD = '53'";
		sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uInsuranceReport_UP_SetReportform_001 \n";
			G_INFO += "설명 : 일검검진 출력물 대상 조건 조회 \n";
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
		<s:AttributeType name='PDP_EXAM_DT' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='HABIT_05' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='HABIT_06' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='HABIT_07' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='HABIT_08' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_SM_YN' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_DRN_YN' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_SPT_YN' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_NUT_YN' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_PRSCR_PYC_YN' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_CESD_INFO_YN' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_RESULT_53' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='PSP_KDSQC' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String PDP_EXAM_DT_T = cRsList.getString("PDP_EXAM_DT");
			String HABIT_05_T = cRsList.getString("HABIT_05");
			String HABIT_06_T = cRsList.getString("HABIT_06");
			String HABIT_07_T = cRsList.getString("HABIT_07");
			String HABIT_08_T = cRsList.getString("HABIT_08");
			String PSP_PRSCR_SM_YN_T = cRsList.getString("PSP_PRSCR_SM_YN");
			String PSP_PRSCR_DRN_YN_T = cRsList.getString("PSP_PRSCR_DRN_YN");
			String PSP_PRSCR_SPT_YN_T = cRsList.getString("PSP_PRSCR_SPT_YN");
			String PSP_PRSCR_NUT_YN_T = cRsList.getString("PSP_PRSCR_NUT_YN");
			String PSP_PRSCR_PYC_YN_T = cRsList.getString("PSP_PRSCR_PYC_YN");
			String PSP_CESD_INFO_YN_T = cRsList.getString("PSP_CESD_INFO_YN");
			String QQN_RESULT_53_T = cRsList.getString("QQN_RESULT_53");
			String PSP_KDSQC_T = cRsList.getString("PSP_KDSQC");
%>
			<z:row
<%
			if(! PDP_EXAM_DT_T.equals("")) {
%>
		 		PDP_EXAM_DT='<%= PDP_EXAM_DT_T%>'
<%
			}

			if(! HABIT_05_T.equals("")) {
%>
		 		HABIT_05='<%= HABIT_05_T%>'
<%
			}

			if(! HABIT_06_T.equals("")) {
%>
		 		HABIT_06='<%= HABIT_06_T%>'
<%
			}

			if(! HABIT_07_T.equals("")) {
%>
		 		HABIT_07='<%= HABIT_07_T%>'
<%
			}

			if(! HABIT_08_T.equals("")) {
%>
		 		HABIT_08='<%= HABIT_08_T%>'
<%
			}

			if(! PSP_PRSCR_SM_YN_T.equals("")) {
%>
		 		PSP_PRSCR_SM_YN='<%= PSP_PRSCR_SM_YN_T%>'
<%
			}

			if(! PSP_PRSCR_DRN_YN_T.equals("")) {
%>
		 		PSP_PRSCR_DRN_YN='<%= PSP_PRSCR_DRN_YN_T%>'
<%
			}

			if(! PSP_PRSCR_SPT_YN_T.equals("")) {
%>
		 		PSP_PRSCR_SPT_YN='<%= PSP_PRSCR_SPT_YN_T%>'
<%
			}

			if(! PSP_PRSCR_NUT_YN_T.equals("")) {
%>
		 		PSP_PRSCR_NUT_YN='<%= PSP_PRSCR_NUT_YN_T%>'
<%
			}

			if(! PSP_PRSCR_PYC_YN_T.equals("")) {
%>
		 		PSP_PRSCR_PYC_YN='<%= PSP_PRSCR_PYC_YN_T%>'
<%
			}

			if(! PSP_CESD_INFO_YN_T.equals("")) {
%>
		 		PSP_CESD_INFO_YN='<%= PSP_CESD_INFO_YN_T%>'
<%
			}

			if(! QQN_RESULT_53_T.equals("")) {
%>
		 		QQN_RESULT_53='<%= QQN_RESULT_53_T%>'
<%
			}

			if(! PSP_KDSQC_T.equals("")) {
%>
		 		PSP_KDSQC='<%= PSP_KDSQC_T%>'
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
