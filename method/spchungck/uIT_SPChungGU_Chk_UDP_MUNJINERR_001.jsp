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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");

		//

		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM, QQN_EXAM_DT, ID, EEA_SEX_CD, SBE_EXAM_CHA, ";
		sql += " 	MAX(M3)   M3,   MAX(M4)   M4,   MAX(M5)   M5 ,  MAX(M6)   M6,   MAX(M7)   M7, ";
		sql += " 	MAX(M8)   M8,   MAX(M9)   M9,   MAX(M10)  M10,  MAX(M11)  M11,  MAX(M12)  M12, ";
		sql += " 	MAX(M13)  M13,  MAX(M14)  M14,  MAX(M15)  M15,  MAX(M16)  M16,  MAX(M17)  M17, ";
		sql += " 	MAX(M18)  M18,  MAX(M19)  M19,  MAX(M20)  M20,  MAX(M21)  M21,  MAX(M22)  M22, ";
		sql += " 	MAX(M23)  M23,  MAX(M24)  M24,  MAX(M25)  M25,  MAX(M26)  M26,  MAX(M27)  M27,  MAX(M28)  M28, ";
		sql += " 	MAX(M873) M873, MAX(M865) M865, MAX(M867) M867, MAX(M868) M868, MAX(M869) M869, ";
		sql += " 	MAX(M870) M870, MAX(M871) M871, MAX(M874) M874, MAX(M872) M872, MAX(M875) M875, ";
		sql += " 	MAX(M876) M876, MAX(M877) M877, MAX(M878) M878, MAX(M879) M879, MAX(M880) M880, ";
		sql += " 	MAX(M881) M881, MAX(M882) M882, MAX(M883) M883, MAX(M884) M884, MAX(M885) M885, ";
		sql += " 	MAX(M887) M887, MAX(M888) M888, MAX(M889) M889, MAX(M890) M890, MAX(M891) M891, ";
		sql += " 	MAX(M892) M892, MAX(M893) M893, MAX(M894) M894, MAX(M895) M895, MAX(M896) M896, ";
		sql += " 	MAX(M897) M897, MAX(M898) M898, MAX(M899) M899, MAX(M900) M900, MAX(M902) M902, ";
		sql += " 	MAX(M901) M901, MAX(M903) M903, MAX(M904) M904, MAX(M905) M905, MAX(M906) M906, ";
		sql += " 	MAX(M908) M908, MAX(M909) M909, MAX(M910) M910, MAX(M911) M911, MAX(M912) M912, ";
		sql += " 	MAX(M914) M914, MAX(M915) M915, MAX(M916) M916, MAX(M918) M918, MAX(M919) M919, MAX(M920) M920, ";
		sql += " 	MAX(M268) M268, MAX(M269) M269, MAX(M270) M270, MAX(M271) M271, ";
		sql += " 	MAX(M272) M272, MAX(M273) M273, MAX(M274) M274, MAX(M275) M275, MAX(M276) M276, ";
		sql += " 	MAX(M277) M277, MAX(M278) M278, MAX(M279) M279, MAX(M280) M280, MAX(M281) M281, ";
		sql += " 	MAX(M282) M282, MAX(M283) M283, MAX(M284) M284, MAX(M285) M285, MAX(M286) M286, ";
		sql += " 	MAX(M287) M287, MAX(M288) M288, MAX(M289) M289, MAX(M290) M290, MAX(M291) M291, ";
		sql += " 	MAX(M292) M292, MAX(M293) M293, MAX(M294) M294, MAX(M295) M295, MAX(M296) M296, ";
		sql += " 	MAX(M297) M297, MAX(M298) M298, MAX(M299) M299, MAX(M300) M300, MAX(M301) M301, ";
		sql += " 	MAX(M302) M302, MAX(M303) M303, MAX(M304) M304, MAX(M305) M305, MAX(M306) M306, ";
		sql += " 	MAX(M307) M307, MAX(M308) M308, MAX(M309) M309, MAX(M312) M312, MAX(M315) M315 ";
		sql += " FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM, QQN_EXAM_DT, EEA_SEX_CD, SBE_EXAM_CHA, ";
		sql += " 			F_PERID_FIND1(EEA_EXAM_DT,EEA_EXAM_SQ, '0') ID, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '3'   THEN QQN_RESULT END M3, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '4'   THEN QQN_RESULT END M4, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '5'   THEN QQN_RESULT END M5, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '6'   THEN QQN_RESULT END M6, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '7'   THEN QQN_RESULT END M7, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '8'   THEN QQN_RESULT END M8, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '9'   THEN QQN_RESULT END M9, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '10'  THEN QQN_RESULT END M10, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '11'  THEN QQN_RESULT END M11, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '12'  THEN QQN_RESULT END M12, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '13'  THEN QQN_RESULT END M13, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '14'  THEN QQN_RESULT END M14, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '15'  THEN QQN_RESULT END M15, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '16'  THEN QQN_RESULT END M16, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '17'  THEN QQN_RESULT END M17, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '18'  THEN QQN_RESULT END M18, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '19'  THEN QQN_RESULT END M19, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '20'  THEN QQN_RESULT END M20, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '21'  THEN QQN_RESULT END M21, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '22'  THEN QQN_RESULT END M22, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '23'  THEN QQN_RESULT END M23, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '24'  THEN QQN_RESULT END M24, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '25'  THEN QQN_RESULT END M25, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '26'  THEN QQN_RESULT END M26, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '27'  THEN QQN_RESULT END M27, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '28'  THEN QQN_RESULT END M28, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '873' THEN QQN_RESULT END M873, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '865' THEN QQN_RESULT END M865, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '867' THEN QQN_RESULT END M867, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '868' THEN QQN_RESULT END M868, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '869' THEN QQN_RESULT END M869, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '870' THEN QQN_RESULT END M870, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '871' THEN QQN_RESULT END M871, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '874' THEN QQN_RESULT END M874, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '872' THEN QQN_RESULT END M872, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '875' THEN QQN_RESULT END M875, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '876' THEN QQN_RESULT END M876, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '877' THEN QQN_RESULT END M877, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '878' THEN QQN_RESULT END M878, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '879' THEN QQN_RESULT END M879, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '880' THEN QQN_RESULT END M880, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '881' THEN QQN_RESULT END M881, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '882' THEN QQN_RESULT END M882, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '883' THEN QQN_RESULT END M883, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '884' THEN QQN_RESULT END M884, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '885' THEN QQN_RESULT END M885, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '887' THEN QQN_RESULT END M887, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '888' THEN QQN_RESULT END M888, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '889' THEN QQN_RESULT END M889, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '890' THEN QQN_RESULT END M890, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '891' THEN QQN_RESULT END M891, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '892' THEN QQN_RESULT END M892, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '893' THEN QQN_RESULT END M893, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '894' THEN QQN_RESULT END M894, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '895' THEN QQN_RESULT END M895, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '896' THEN QQN_RESULT END M896, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '897' THEN QQN_RESULT END M897, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '898' THEN QQN_RESULT END M898, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '899' THEN QQN_RESULT END M899, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '900' THEN QQN_RESULT END M900, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '902' THEN QQN_RESULT END M902, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '901' THEN QQN_RESULT END M901, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '903' THEN QQN_RESULT END M903, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '904' THEN QQN_RESULT END M904, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '905' THEN QQN_RESULT END M905, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '906' THEN QQN_RESULT END M906, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '908' THEN QQN_RESULT END M908, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '909' THEN QQN_RESULT END M909, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '910' THEN QQN_RESULT END M910, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '911' THEN QQN_RESULT END M911, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '912' THEN QQN_RESULT END M912, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '914' THEN QQN_RESULT END M914, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '915' THEN QQN_RESULT END M915, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '916' THEN QQN_RESULT END M916, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '918' THEN QQN_RESULT END M918, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '919' THEN QQN_RESULT END M919, ";
		sql += " 			CASE WHEN IIQ_QGTN_CD = '920' THEN QQN_RESULT END M920, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '268' THEN QQN_RESULT END M268, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '269' THEN QQN_RESULT END M269, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '270' THEN QQN_RESULT END M270, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '271' THEN QQN_RESULT END M271, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '272' THEN QQN_RESULT END M272, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '273' THEN QQN_RESULT END M273, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '274' THEN QQN_RESULT END M274, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '275' THEN QQN_RESULT END M275, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '276' THEN QQN_RESULT END M276, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '277' THEN QQN_RESULT END M277, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '278' THEN QQN_RESULT END M278, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '279' THEN QQN_RESULT END M279, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '280' THEN QQN_RESULT END M280, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '281' THEN QQN_RESULT END M281, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '282' THEN QQN_RESULT END M282, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '283' THEN QQN_RESULT END M283, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '284' THEN QQN_RESULT END M284, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '285' THEN QQN_RESULT END M285, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '286' THEN QQN_RESULT END M286, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '287' THEN QQN_RESULT END M287, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '288' THEN QQN_RESULT END M288, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '289' THEN QQN_RESULT END M289, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '290' THEN QQN_RESULT END M290, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '291' THEN QQN_RESULT END M291, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '292' THEN QQN_RESULT END M292, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '293' THEN QQN_RESULT END M293, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '294' THEN QQN_RESULT END M294, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '295' THEN QQN_RESULT END M295, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '296' THEN QQN_RESULT END M296, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '297' THEN QQN_RESULT END M297, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '298' THEN QQN_RESULT END M298, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '299' THEN QQN_RESULT END M299, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '300' THEN QQN_RESULT END M300, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '301' THEN QQN_RESULT END M301, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '302' THEN QQN_RESULT END M302, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '303' THEN QQN_RESULT END M303, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '304' THEN QQN_RESULT END M304, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '305' THEN QQN_RESULT END M305, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '306' THEN QQN_RESULT END M306, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '307' THEN QQN_RESULT END M307, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '308' THEN QQN_RESULT END M308, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '309' THEN QQN_RESULT END M309, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '312' THEN QQN_RESULT END M312, ";
		sql += " 			CASE WHEN QQN_QSTN_CD = '315' THEN QQN_RESULT END M315 ";
		sql += " 		FROM ET_EXAM_ACPT A LEFT OUTER JOIN QT_QUESTION      B ON A.EEA_EXAM_DT = B.QQN_EXAM_DT AND A.EEA_EXAM_SQ = B.QQN_EXAM_SQ ";
		sql += " 							LEFT OUTER JOIN IT_ITEM_QUESTION C ON B.QQN_QSTN_CD = C.IIQ_QGTN_CD AND C.IIQ_ITEM_CD = 'M0045' ";
		sql += " 							LEFT OUTER JOIN ST_BASE          D ON D.SBE_EXAM_DT = A.EEA_EXAM_DT AND D.SBE_EXAM_SQ = A.EEA_EXAM_SQ ";
		sql += " 		WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "' ";
		sql += " 		AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "' ";
		sql += " 		AND A.EEA_COMP_CD  = '" + COMP_CD + "' ";
		sql += " 		AND SUBSTR(EEA_MNGT_SPYM, 1, 4) = '" + MNGT_YR + "' ";
		sql += " 		AND A.EEA_ORDER_YN <> 'C' ";
		sql += " 		AND D.SBE_PANJ_YN  = 'Y' ";
		sql += " 		AND D.SBE_EXAM_CHA = '1' ";

		if(! PSNL_NM.equals("")){
			sql += " AND  A.EEA_PSNL_NM = '" + PSNL_NM + "' ";
		}

		sql += PARAM_TX1;
		sql += PARAM_TX2;

		sql += " 	) G ";
		sql += " GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, EEA_PSNL_NM, QQN_EXAM_DT, ID, EEA_SEX_CD, SBE_EXAM_CHA ";
		sql += " ORDER BY EEA_EXAM_DT, EEA_EXAM_SQ ";



			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_SPChungGU_Chk_UDP_MUNJINERR_001 \n";
			G_INFO += "설명 : 문진자료 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
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
