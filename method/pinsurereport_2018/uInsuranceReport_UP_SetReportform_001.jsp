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

	ResultSetMetaData rsmd = null;
	int colCnt = 0;

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

		sql = "  SELECT PDP_EXAM_DT ,SUBSTR(EEA_HLTH_KD, 5, 1) AS HABIT_05 ,SUBSTR(EEA_HLTH_KD, 6, 1) AS HABIT_06 ,SUBSTR(EEA_HLTH_KD, 7, 1) AS HABIT_07 ,SUBSTR(EEA_HLTH_KD, 8, 1) AS HABIT_08 ,PSP_PRSCR_SM_YN, PSP_PRSCR_DRN_YN, PSP_PRSCR_SPT_YN, PSP_PRSCR_NUT_YN, PSP_PRSCR_PYC_YN ,PSP_CESD_INFO_YN ,QQN_RESULT QQN_RESULT_53 ,PSP_KDSQC,";
		sql += " EEA_HCV_YN";
		sql += " ,(SELECT ERI_HERT_CD FROM ET_RSLT_ITEM WHERE ERI_EXAM_DT =  '" + EXAM_DT + "' AND ERI_EXAM_SQ =  '" + EXAM_SQ + "' AND ERI_ITEM_CD = 'R0023') ITEM_R0023";
		sql += " ,(SELECT ERI_RSLT_VL FROM ET_RSLT_ITEM WHERE ERI_EXAM_DT =  '" + EXAM_DT + "' AND ERI_EXAM_SQ =  '" + EXAM_SQ + "' AND ERI_ITEM_CD = 'R0024') ITEM_R0024";
		sql += " ,(SELECT ERI_HERT_CD FROM ET_RSLT_ITEM WHERE ERI_EXAM_DT =  '" + EXAM_DT + "' AND ERI_EXAM_SQ =  '" + EXAM_SQ + "' AND ERI_ITEM_CD = 'R0026') ITEM_R0026";
		sql += " ,(SELECT ERI_RSLT_VL FROM ET_RSLT_ITEM WHERE ERI_EXAM_DT =  '" + EXAM_DT + "' AND ERI_EXAM_SQ =  '" + EXAM_SQ + "' AND ERI_ITEM_CD = 'S0252') ITEM_S0252";
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

		rsmd = rsList.getMetaData();  //Select 결과의 Metadata 가져오기.

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
<%
		for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
			String dataType = "string";
			String maxLength = "4000";

			if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
				dataType = "bin.hex";
				maxLength = "2147483647";
				//<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
			} else if (rsmd.getColumnTypeName(colCnt).equals("CLOB")){
				maxLength = "1073741823";
				//<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
			}
%>
		<s:AttributeType name='<%= rsmd.getColumnName(colCnt)%>' rs:number='<%= Integer.toString(colCnt)%>' rs:writeunknown='true' rs:basetable='DUAL' rs:basecolumn='<%= rsmd.getColumnName(colCnt)%>'>
			<s:datatype dt:type='<%= dataType%>' dt:maxLength='<%= maxLength%>' <% if (! maxLength.equals("4000")) { %> rs:long='true' <% } %>/>
		</s:AttributeType>
<%
		}
%>
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:writeunknown='true' rs:basetable='DUAL'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
				String tempData = cRsList.getString(rsmd.getColumnName(colCnt));
				if(! tempData.equals("")) {
%>
		 			<%= rsmd.getColumnName(colCnt)%>='<%= tempData%>'
<%
				}
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
