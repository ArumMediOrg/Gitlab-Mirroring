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
		String GUID_KD = htMethod.get("GUID_KD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(GUID_KD == null) { GUID_KD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.* 
  FROM (SELECT CSA_GUID_KD, CSA_SEND_KD, CSA_TMPL_CD, CSA_SEND_MSG, CSA_SEND_TEL, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')||'.000' CSA_CHK_DT, 
               CASE WHEN CSA_SEND_KD = '1' THEN 
                         TO_CHAR(SYSDATE + ((CASE WHEN NVL(CSA_STAND_HH, ' ') <> ' ' THEN TO_NUMBER(CSA_STAND_HH)*60 ELSE 0 END + 
                                             CASE WHEN NVL(CSA_STAND_MM, ' ') <> ' ' THEN TO_NUMBER(CSA_STAND_MM)    ELSE 0 END)/1440), 'YYYY-MM-DD HH24:MI:SS')||'.000' 
                    WHEN CSA_SEND_KD = '2' OR CSA_SEND_KD = '3' THEN 
                         CASE WHEN NVL(CSA_BEFOR_DT, ' ') =  ' ' AND NVL(CSA_BEFOR_HH, ' ') = ' '  THEN NULL 
                              WHEN NVL(CSA_BEFOR_DT, ' ') <> ' ' THEN 
                                   TO_CHAR(TO_DATE(:EXAM_DT, 'YYYY-MM-DD') + (TO_NUMBER(NVL(CSA_BEFOR_DT,'0'))*-1), 'YYYY-MM-DD') || ' ' || NVL(CSA_BEFOR_HH, '09') || ':00:00.000' 
                              ELSE :EXAM_DT || ' ' || NVL(CSA_BEFOR_HH, '09') || ':00:00.000' END 
               ELSE NULL END CSA_SEND_DT 
          FROM CR_SMS_AUTO_SET
         WHERE CSA_GUID_KD IN (:GUID_KD) 
           AND CSA_USE_YN = 'Y'
       ) A
 WHERE A.CSA_CHK_DT <= A.CSA_SEND_DT
 ORDER BY CSA_GUID_KD
		*/

		sql = " SELECT A.*";
		sql += " FROM (SELECT CSA_GUID_KD, CSA_SEND_KD, CSA_TMPL_CD, CSA_SEND_MSG, CSA_SEND_TEL, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')||'.000' CSA_CHK_DT, CASE WHEN CSA_SEND_KD = '1' THEN TO_CHAR(SYSDATE + ((CASE WHEN NVL(CSA_STAND_HH, ' ') <> ' ' THEN TO_NUMBER(CSA_STAND_HH)*60 ELSE 0 END + CASE WHEN NVL(CSA_STAND_MM, ' ') <> ' ' THEN TO_NUMBER(CSA_STAND_MM) ELSE 0 END)/1440), 'YYYY-MM-DD HH24:MI:SS')||'.000' WHEN CSA_SEND_KD = '2' OR CSA_SEND_KD = '3' THEN CASE WHEN NVL(CSA_BEFOR_DT, ' ') = ' '";
		sql += " AND NVL(CSA_BEFOR_HH, ' ') = ' ' THEN NULL WHEN NVL(CSA_BEFOR_DT, ' ') <> ' ' THEN TO_CHAR(TO_DATE('" + EXAM_DT + "', 'YYYY-MM-DD') + (TO_NUMBER(NVL(CSA_BEFOR_DT,'0'))*-1), 'YYYY-MM-DD') || ' ' || NVL(CSA_BEFOR_HH, '09') || ':00:00.000' ELSE '" + EXAM_DT + "' || ' ' || NVL(CSA_BEFOR_HH, '09') || ':00:00.000' END ELSE NULL END CSA_SEND_DT";
		sql += " FROM CR_SMS_AUTO_SET";
		sql += " WHERE CSA_GUID_KD IN ('" + GUID_KD + "')";
		sql += " AND CSA_USE_YN = 'Y' ) A";
		sql += " WHERE A.CSA_CHK_DT <= A.CSA_SEND_DT";
		sql += " ORDER BY CSA_GUID_KD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_SMS_Send_002 \n";
			G_INFO += "설명 : SMS 발송 메세지 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " GUID_KD : " + GUID_KD + " \n";
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
		<s:AttributeType name='CSA_GUID_KD' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSA_SEND_KD' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CSA_TMPL_CD' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSA_SEND_MSG' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CSA_SEND_TEL' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CSA_CHK_DT' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='23'/>
		</s:AttributeType>
		<s:AttributeType name='CSA_SEND_DT' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='23'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CSA_GUID_KD_T = cRsList.getString("CSA_GUID_KD");
			String CSA_SEND_KD_T = cRsList.getString("CSA_SEND_KD");
			String CSA_TMPL_CD_T = cRsList.getString("CSA_TMPL_CD");
			String CSA_SEND_MSG_T = cRsList.getString("CSA_SEND_MSG");
			String CSA_SEND_TEL_T = cRsList.getString("CSA_SEND_TEL");
			String CSA_CHK_DT_T = cRsList.getString("CSA_CHK_DT");
			String CSA_SEND_DT_T = cRsList.getString("CSA_SEND_DT");
%>
			<z:row
<%
			if(! CSA_GUID_KD_T.equals("")) {
%>
		 		CSA_GUID_KD='<%= CSA_GUID_KD_T%>'
<%
			}

			if(! CSA_SEND_KD_T.equals("")) {
%>
		 		CSA_SEND_KD='<%= CSA_SEND_KD_T%>'
<%
			}

			if(! CSA_TMPL_CD_T.equals("")) {
%>
		 		CSA_TMPL_CD='<%= CSA_TMPL_CD_T%>'
<%
			}

			if(! CSA_SEND_MSG_T.equals("")) {
%>
		 		CSA_SEND_MSG='<%= CSA_SEND_MSG_T%>'
<%
			}

			if(! CSA_SEND_TEL_T.equals("")) {
%>
		 		CSA_SEND_TEL='<%= CSA_SEND_TEL_T%>'
<%
			}

			if(! CSA_CHK_DT_T.equals("")) {
%>
		 		CSA_CHK_DT='<%= CSA_CHK_DT_T%>'
<%
			}

			if(! CSA_SEND_DT_T.equals("")) {
%>
		 		CSA_SEND_DT='<%= CSA_SEND_DT_T%>'
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
