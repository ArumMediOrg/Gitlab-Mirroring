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

		String EXAM_DTS = htMethod.get("EXAM_DTS");
		String EXAM_DTE = htMethod.get("EXAM_DTE");
		String EXAM_CD = htMethod.get("EXAM_CD");

		//
		if(EXAM_DTS == null) { EXAM_DTS = ""; }
		if(EXAM_DTE == null) { EXAM_DTE = ""; }
		if(EXAM_CD == null) { EXAM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();


		sql = " SELECT EXAM_DT, MAX(RSVT_TX) RSVT_TX, SUM(MAN_CNT) MAN_CNT, SUM(WOMAN_CNT) WOMAN_CNT, SUM(CONT_CNT) CONT_CNT, ";
		sql += " SUM(CONT_MCNT) CONT_MCNT, SUM(CONT_WCNT) CONT_WCNT ";
		sql += " FROM (SELECT RRT_EXAM_DT EXAM_DT, '' RSVT_TX, CASE WHEN RRT_SMPL_YN = 'N'";
		sql += " AND RRT_SEX_CD = '1' THEN 1 ELSE 0 END MAN_CNT, CASE WHEN RRT_SMPL_YN = 'N'";
		sql += " AND RRT_SEX_CD = '2' THEN 1 ELSE 0 END WOMAN_CNT, CASE WHEN RRT_SMPL_YN = 'Y' THEN 1 ELSE 0 END CONT_CNT,";
		sql += " CASE WHEN RRT_SMPL_YN = 'Y' AND RRT_SEX_CD = '1' THEN 1 ELSE 0 END CONT_MCNT, ";
        sql += " CASE WHEN RRT_SMPL_YN = 'Y' AND RRT_SEX_CD = '2' THEN 1 ELSE 0 END CONT_WCNT  ";
		sql += " FROM RT_RSVT A";
		sql += " WHERE A.RRT_EXAM_DT BETWEEN '" + EXAM_DTS + "'";
		sql += " AND '" + EXAM_DTE + "'";
		sql += " AND NVL(A.RRT_CNCL_YN, 'N') <> 'Y'";
		sql += " AND SUBSTR(A.RRT_EXAM_CD, 1, 2) <> '31'";

		if(EXAM_CD.equals("21")){
			sql += " AND SUBSTR(A.RRT_EXAM_CD, 1, 2) = '21' ";
		} else {
			sql += " AND SUBSTR(A.RRT_EXAM_CD, 1, 2) <> '31' ";
		}

		sql += " UNION";
		sql += " ALL SELECT ECM_MEMO_DT EXAM_DT, CASE WHEN ECM_RSVT_TX = ''";
		sql += " OR ECM_RSVT_TX IS NULL THEN '' ELSE '★메모' END RSVT_TX, ";
		sql += " 0 MAN_CNT, 0 WOMAN_CNT, 0 CONT_CNT, 0 CONT_MCNT, 0 CONT_WCNT ";
		sql += " FROM ET_CLDR_MEMO";
		sql += " WHERE ECM_MEMO_DT BETWEEN '" + EXAM_DTS + "'";
		sql += " AND '" + EXAM_DTE + "'";
		sql += " AND ECM_MEMO_SQ = 0 ) C";
		sql += " GROUP BY EXAM_DT";
		sql += " ORDER BY EXAM_DT";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_UP_SetCalendar_002 \n";
			G_INFO += "설명 : 일별 성별 예약 현황 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DTS : " + EXAM_DTS + " \n";
			G_INFO += " EXAM_DTE : " + EXAM_DTE + " \n";
			G_INFO += " EXAM_CD : " + EXAM_CD + " \n";
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
		<s:AttributeType name='EXAM_DT' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RSVT_TX' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='MAN_CNT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='WOMAN_CNT' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CONT_CNT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CONT_MCNT' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CONT_WCNT' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EXAM_DT_T = cRsList.getString("EXAM_DT");
			String RSVT_TX_T = cRsList.getString("RSVT_TX");
			String MAN_CNT_T = cRsList.getString("MAN_CNT");
			String WOMAN_CNT_T = cRsList.getString("WOMAN_CNT");
			String CONT_CNT_T = cRsList.getString("CONT_CNT");
			String CONT_MCNT_T = cRsList.getString("CONT_MCNT");
			String CONT_WCNT_T = cRsList.getString("CONT_WCNT");
%>
			<z:row
<%
			if(! EXAM_DT_T.equals("")) {
%>
		 		EXAM_DT='<%= EXAM_DT_T%>'
<%
			}

			if(! RSVT_TX_T.equals("")) {
%>
		 		RSVT_TX='<%= RSVT_TX_T%>'
<%
			}

			if(! MAN_CNT_T.equals("")) {
%>
		 		MAN_CNT='<%= MAN_CNT_T%>'
<%
			}

			if(! WOMAN_CNT_T.equals("")) {
%>
		 		WOMAN_CNT='<%= WOMAN_CNT_T%>'
<%
			}

			if(! CONT_CNT_T.equals("")) {
%>
		 		CONT_CNT='<%= CONT_CNT_T%>'
<%
			}

			if(! CONT_MCNT_T.equals("")) {
%>
				CONT_MCNT='<%= CONT_MCNT_T%>'
<%
			}

			if(! CONT_WCNT_T.equals("")) {
%>
				CONT_WCNT='<%= CONT_WCNT_T%>'
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
