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

		String DP_FROMDT = htMethod.get("DP_FROMDT");
		String DP_TODT = htMethod.get("DP_TODT");
		String COMP_CD = htMethod.get("COMP_CD");
		String CBDEPT_CDTEXT = htMethod.get("CBDEPT_CDTEXT");
		String CBDEPT_CDVALUE = htMethod.get("CBDEPT_CDVALUE");
		String RZCMB_MEKD1 = htMethod.get("RZCMB_MEKD1");
		String RZCMB_MEKD2 = htMethod.get("RZCMB_MEKD2");
		String RZCMB_CHGBN = htMethod.get("RZCMB_CHGBN");
		String RZCMB_PLACE1_1 = htMethod.get("RZCMB_PLACE1_1");
		String RZCMB_PLACE1_2 = htMethod.get("RZCMB_PLACE1_2");
		String RZCMB_PLACE2_1 = htMethod.get("RZCMB_PLACE2_1");
		String RZCMB_PLACE2_2 = htMethod.get("RZCMB_PLACE2_2");

		//
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(CBDEPT_CDTEXT == null) { CBDEPT_CDTEXT = ""; }
		if(CBDEPT_CDVALUE == null) { CBDEPT_CDVALUE = ""; }
		if(RZCMB_MEKD1 == null) { RZCMB_MEKD1 = ""; }
		if(RZCMB_MEKD2 == null) { RZCMB_MEKD2 = ""; }
		if(RZCMB_CHGBN == null) { RZCMB_CHGBN = ""; }
		if(RZCMB_PLACE1_1 == null) { RZCMB_PLACE1_1 = ""; }
		if(RZCMB_PLACE1_2 == null) { RZCMB_PLACE1_2 = ""; }
		if(RZCMB_PLACE2_1 == null) { RZCMB_PLACE2_1 = ""; }
		if(RZCMB_PLACE2_2 == null) { RZCMB_PLACE2_2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT MAX(CNT) CNT, MAX(AA) AA, MAX(AB) AB, MAX(CNT1) CNT1, MAX(BA) BA, MAX(BB) BB";
		sql += " FROM (";
		sql += "	SELECT CASE WHEN GB='1' THEN CNT END CNT";
		sql += "	, CASE WHEN GB='1' THEN AA END AA";
		sql += "	, CASE WHEN GB='1' THEN BB END AB";
		sql += "	, CASE WHEN GB='2' THEN CNT END CNT1";
		sql += "	, CASE WHEN GB='2' THEN AA END BA";
		sql += "	, CASE WHEN GB='2' THEN BB END BB";
		sql += " 	FROM (";
		sql += "		SELECT MAX(GB) GB,SUM(CNT) CNT, MAX(AA) AA,MAX(BB) BB";
		sql += " 		FROM (";
		sql += "			SELECT '1' GB, 0 CNT, 0 AA, 0 BB";
		sql += " 			FROM DUAL";

		sql += " 			UNION ALL";

		sql += "			SELECT '1' GB";
		sql += "			, COUNT(*) CNT";
		sql += "			, CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END AA";
		sql += "			, CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END AB";
		sql += "			FROM (";
		sql += "				SELECT PLP_EXAM_DT,PLP_EXAM_SQ,PLP_JLPN_PNCD,EEA_SEX_CD";
		sql += " 				FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B";
		sql += " 				ON A.PLP_EXAM_DT=B.EEA_EXAM_DT";
		sql += " 				AND A.PLP_EXAM_SQ=B.EEA_EXAM_SQ";
		sql += " 				WHERE EEA_EXAM_DT>='" + DP_FROMDT + "'";
		sql += " 				AND EEA_EXAM_DT<='" + DP_TODT + "'";
		sql += " 				AND NVL(EEA_HTSB_CD, ' ') <> ' '";
		sql += " 				AND EEA_COMP_CD='" + COMP_CD + "'";

		if(!CBDEPT_CDTEXT.equals("")) {
			sql += " AND EEA_DEPT_CD = '" + CBDEPT_CDVALUE + "'";
		}

		if(!RZCMB_MEKD1.equals("")) {
			sql += " AND EEA_FAMY_CD ='" + RZCMB_MEKD2 + "'";
		}

		if(RZCMB_CHGBN.equals("1")) {
			sql += " AND EEA_HDMD_YN = 'Y'";
		}
		else if(RZCMB_CHGBN.equals("2")) {
			sql += " AND EEA_HDMD_YN = 'N'";
		}

		if(!RZCMB_PLACE1_1.equals("")) {
			sql += " AND SUBSTR(EEA_PLCE_CD, 1, 1) = '" + RZCMB_PLACE1_2 + "'";
		}

		if(!RZCMB_PLACE2_1.equals("")) {
			sql += " AND EEA_PLCE_CD = '" + RZCMB_PLACE2_1 + "'";
		}

		sql += " 				AND PLP_JLPN_PNCD ='C'";
		sql += " 				AND NVL(EEA_DIVI_CD,' ') = '1'";
		sql += " 				GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ,PLP_JLPN_PNCD,EEA_SEX_CD";
		sql += "			) FF";
		sql += " 			GROUP BY EEA_SEX_CD";
		sql += "		) DD";

		sql += " 		UNION ALL";

		sql += "		SELECT MAX(GB) GB,SUM(CNT) CNT, MAX(AA) AA,MAX(BB) BB";
		sql += " 		FROM (";
		sql += "			SELECT '2' GB, 0 CNT, 0 AA, 0 BB";
		sql += " 			FROM DUAL";

		sql += " 			UNION ALL";

		sql += "			SELECT '2' GB, COUNT(*) CNT";
		sql += "			, CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END AA";
		sql += "			, CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END AB";
		sql += " 			FROM (";
		sql += "				SELECT PLP_EXAM_DT,PLP_EXAM_SQ,PLP_JLPN_PNCD,EEA_SEX_CD";
		sql += " 				FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B";
		sql += " 				ON A.PLP_EXAM_DT=B.EEA_EXAM_DT";
		sql += " 				AND A.PLP_EXAM_SQ=B.EEA_EXAM_SQ";
		sql += " 				WHERE EEA_EXAM_DT>='" + DP_FROMDT + "'";
		sql += " 				AND EEA_EXAM_DT<='" + DP_TODT + "'";
		sql += " 				AND NVL(EEA_HTSB_CD, ' ') <> ' '";
		sql += " 				AND EEA_COMP_CD='" + COMP_CD + "'";

		if(!CBDEPT_CDTEXT.equals("")) {
			sql += " AND EEA_DEPT_CD = '" + CBDEPT_CDVALUE + "'";
		}

		if(!RZCMB_MEKD1.equals("")) {
			sql += " AND EEA_FAMY_CD ='" + RZCMB_MEKD2 + "'";
		}

		if(RZCMB_CHGBN.equals("1")) {
			sql += " AND EEA_HDMD_YN = 'Y'";
		}
		else if(RZCMB_CHGBN.equals("2")) {
			sql += " AND EEA_HDMD_YN = 'N'";
		}

		if(!RZCMB_PLACE1_1.equals("")) {
			sql += " AND SUBSTR(EEA_PLCE_CD, 1, 1) = '" + RZCMB_PLACE1_2 + "'";
		}

		if(!RZCMB_PLACE2_1.equals("")) {
			sql += " AND EEA_PLCE_CD = '" + RZCMB_PLACE2_2 + "'";
		}

		sql += " 				AND PLP_JLPN_PNCD ='C'";
		sql += " 				AND NVL(EEA_DIVI_CD,' ') <> '1'";
		sql += " 				GROUP BY PLP_EXAM_DT,PLP_EXAM_SQ,PLP_JLPN_PNCD,EEA_SEX_CD";
		sql += "			) FF";
		sql += " 			GROUP BY EEA_SEX_CD";
		sql += "		) DD";
		sql += "	) T1";
		sql += ") T2";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHERESULTPRT_UDP_SEL_YO_001 \n";
			G_INFO += "설명 : 요관찰자정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " CBDEPT_CDTEXT : " + CBDEPT_CDTEXT + " \n";
			G_INFO += " CBDEPT_CDVALUE : " + CBDEPT_CDVALUE + " \n";
			G_INFO += " RZCMB_MEKD1 : " + RZCMB_MEKD1 + " \n";
			G_INFO += " RZCMB_MEKD2 : " + RZCMB_MEKD2 + " \n";
			G_INFO += " RZCMB_CHGBN : " + RZCMB_CHGBN + " \n";
			G_INFO += " RZCMB_PLACE1_1 : " + RZCMB_PLACE1_1 + " \n";
			G_INFO += " RZCMB_PLACE1_2 : " + RZCMB_PLACE1_2 + " \n";
			G_INFO += " RZCMB_PLACE2_1 : " + RZCMB_PLACE2_1 + " \n";
			G_INFO += " RZCMB_PLACE2_2 : " + RZCMB_PLACE2_2 + " \n";
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
		<s:AttributeType name='CNT' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='AA' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='AB' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CNT1' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BA' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BB' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CNT_T = cRsList.getString("CNT");
			String AA_T = cRsList.getString("AA");
			String AB_T = cRsList.getString("AB");
			String CNT1_T = cRsList.getString("CNT1");
			String BA_T = cRsList.getString("BA");
			String BB_T = cRsList.getString("BB");
%>
			<z:row
<%
			if(! CNT_T.equals("")) {
%>
		 		CNT='<%= CNT_T%>'
<%
			}

			if(! AA_T.equals("")) {
%>
		 		AA='<%= AA_T%>'
<%
			}

			if(! AB_T.equals("")) {
%>
		 		AB='<%= AB_T%>'
<%
			}

			if(! CNT1_T.equals("")) {
%>
		 		CNT1='<%= CNT1_T%>'
<%
			}

			if(! BA_T.equals("")) {
%>
		 		BA='<%= BA_T%>'
<%
			}

			if(! BB_T.equals("")) {
%>
		 		BB='<%= BB_T%>'
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
