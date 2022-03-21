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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*
		sql = " SELECT RRT_EXAM_DT, SUM(STOMA_CNT) RRT_STOMA_CNT, SUM(COLON_CNT) RRT_COLON_CNT, ";
		sql += "	COUNT(*) RRT_RSVN_CNT, SUM(MAN_CNT) MAN_CNT, SUM(WOMAN_CNT) WOMAN_CNT, ";
		sql += " 	SUM(END_CNT) END_CNT,  SUM(END_MCNT) END_MCNT, SUM(END_WCNT) END_WCNT, ";
		sql += " 	F_LPAD(TO_CHAR(SUM(MAN_CNT)),   3, ' ') || '/' || ";
		sql += " 	F_LPAD(TO_CHAR(SUM(WOMAN_CNT)), 3, ' ') || '/' || ";
		sql += " 	F_LPAD(TO_CHAR(SUM(END_CNT)),   3, ' ') RSVN_CNT ";
		sql += " FROM (SELECT RRT_EXAM_DT, MAX(STOMA_CNT) STOMA_CNT, MAX(COLON_CNT) COLON_CNT, ";
		sql += " 			MAX(CASE WHEN RRT_SMPL_YN = 'Y' THEN 1 ELSE 0 END) AS END_CNT, ";
		sql += " 			MAX(CASE WHEN RRT_SMPL_YN = 'Y' AND RRT_SEX_CD = '1' THEN 1 ELSE 0 END) AS END_MCNT, ";
		sql += " 			MAX(CASE WHEN RRT_SMPL_YN = 'Y' AND RRT_SEX_CD = '2' THEN 1 ELSE 0 END) AS END_WCNT, ";
		sql += " 			MAX(CASE WHEN RRT_SMPL_YN = 'N' AND RRT_SEX_CD = '1' THEN 1 ELSE 0 END) AS MAN_CNT, ";
		sql += " 			MAX(CASE WHEN RRT_SMPL_YN = 'N' AND RRT_SEX_CD = '2' THEN 1 ELSE 0 END) AS WOMAN_CNT ";
		sql += " 		FROM (SELECT A.RRT_RSVN_NO, A.RRT_EXAM_DT, A.RRT_SMPL_YN, A.RRT_SEX_CD, ";
		sql += " 					CASE WHEN NVL(A.RRT_STOMA_YN, 'N') = 'Y' THEN 1 ";
		sql += " 							ELSE CASE WHEN INSTR(UPPER(A.RRT_EXAM_LT), 'E0001$') > 0 OR INSTR(UPPER(A.RRT_EXAM_LT), 'E0002$') > 0  THEN 1 ";
		sql += " 									ELSE CASE WHEN UPPER(B.EPI_ITEM_CD) = 'E0001' OR UPPER(B.EPI_ITEM_CD) = 'E0002' THEN 1 ";
		sql += " 												ELSE CASE WHEN UPPER(C.ECI_ITEM_CD) = 'E0001' OR UPPER(C.ECI_ITEM_CD) = 'E0002' THEN 1 ELSE 0 END END END ";
		sql += " 					END STOMA_CNT, ";
		sql += " 					CASE WHEN NVL(A.RRT_COLON_YN, 'N') = 'Y' THEN 1 ";
		sql += " 							ELSE CASE WHEN INSTR(UPPER(A.RRT_EXAM_LT), 'E0007$') > 0 OR INSTR(UPPER(A.RRT_EXAM_LT), 'E0008$') > 0 THEN 1 ";
		sql += " 									ELSE CASE WHEN UPPER(B.EPI_ITEM_CD) = 'E0007' OR UPPER(B.EPI_ITEM_CD) = 'E0008' THEN 1 ";
		sql += " 												ELSE CASE WHEN UPPER(C.ECI_ITEM_CD) = 'E0007' OR UPPER(C.ECI_ITEM_CD) = 'E0008' THEN 1 ELSE 0 END END END ";
		sql += " 					END COLON_CNT,                        ";
		sql += " 					EPI_ITEM_CD, ECI_ITEM_CD ";
		sql += " 				FROM RT_RSVT A ";
		sql += " 					LEFT OUTER JOIN ET_PACK_ITEM B ";
		sql += " 						ON B.EPI_EXAM_CD = SUBSTR(A.RRT_EXAM_LT, 9, 5) ";
		sql += " 						AND B.EPI_PACK_SQ = SUBSTR(A.RRT_EXAM_LT, 14, 5) ";
		sql += " 						AND UPPER(B.EPI_ITEM_CD) IN ('E0001','E0002','E0007','E0008') ";
		sql += " 					LEFT OUTER JOIN ET_COMP_CNRT_PROF_ITEM C ";
		sql += " 						ON C.ECI_COMP_CD = A.RRT_COMP_CD ";
		sql += " 						AND C.ECI_MNGT_YR = SUBSTR(A.RRT_EXAM_LT, 5, 4) ";
		sql += " 						AND C.ECI_CNRT_SQ = SUBSTR(A.RRT_EXAM_LT, 14, 2) ";
		sql += " 						AND C.ECI_PROF_SQ = SUBSTR(A.RRT_EXAM_LT, 16, 2) ";
		sql += " 						AND UPPER(C.ECI_ITEM_CD) IN ('E0001','E0002','E0007','E0008') ";
		sql += " 				WHERE A.RRT_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT ";
		sql += " 				AND NVL(A.RRT_EXAM_SQ, ' ') = ' ' ";
		sql += " 				AND NVL(A.RRT_CNCL_YN, 'N') <> 'Y' ";
		sql += " 				AND SUBSTR(A.RRT_EXAM_CD, 1, 2) <> '31' ";
		sql += " 			) D ";
		sql += " 		GROUP BY RRT_EXAM_DT, RRT_RSVN_NO ";
		sql += " 	) E ";
		sql += " GROUP BY RRT_EXAM_DT ";

		IF (:ORDER_BY = '1') THEN
		ORDER BY RRT_EXAM_DT
		ELSE
		ORDER BY RRT_EXAM_DT DESC

		*/

		sql = " SELECT RRT_EXAM_DT, SUM(STOMA_CNT) RRT_STOMA_CNT, SUM(COLON_CNT) RRT_COLON_CNT, ";
		sql += "	COUNT(*) RRT_RSVN_CNT, SUM(MAN_CNT) MAN_CNT, SUM(WOMAN_CNT) WOMAN_CNT, ";
		sql += " 	SUM(END_CNT) END_CNT,  SUM(END_MCNT) END_MCNT, SUM(END_WCNT) END_WCNT, ";
		sql += " 	F_LPAD(TO_CHAR(SUM(MAN_CNT)),   3, ' ') || '/' || ";
		sql += " 	F_LPAD(TO_CHAR(SUM(WOMAN_CNT)), 3, ' ') || '/' || ";
		sql += " 	F_LPAD(TO_CHAR(SUM(END_CNT)),   3, ' ') RSVN_CNT ";
		sql += " FROM (SELECT RRT_EXAM_DT, MAX(STOMA_CNT) STOMA_CNT, MAX(COLON_CNT) COLON_CNT, ";
		sql += " 			MAX(CASE WHEN RRT_SMPL_YN = 'Y' THEN 1 ELSE 0 END) AS END_CNT, ";
		sql += " 			MAX(CASE WHEN RRT_SMPL_YN = 'Y' AND RRT_SEX_CD = '1' THEN 1 ELSE 0 END) AS END_MCNT, ";
		sql += " 			MAX(CASE WHEN RRT_SMPL_YN = 'Y' AND RRT_SEX_CD = '2' THEN 1 ELSE 0 END) AS END_WCNT, ";
		sql += " 			MAX(CASE WHEN RRT_SMPL_YN = 'N' AND RRT_SEX_CD = '1' THEN 1 ELSE 0 END) AS MAN_CNT, ";
		sql += " 			MAX(CASE WHEN RRT_SMPL_YN = 'N' AND RRT_SEX_CD = '2' THEN 1 ELSE 0 END) AS WOMAN_CNT ";
		sql += " 		FROM (SELECT A.RRT_RSVN_NO, A.RRT_EXAM_DT, A.RRT_SMPL_YN, A.RRT_SEX_CD, ";
		sql += " 					CASE WHEN NVL(A.RRT_STOMA_YN, 'N') = 'Y' THEN 1 ";
		sql += " 							ELSE CASE WHEN INSTR(UPPER(A.RRT_EXAM_LT), 'E0001$') > 0 OR INSTR(UPPER(A.RRT_EXAM_LT), 'E0002$') > 0  THEN 1 ";
		sql += " 									ELSE CASE WHEN UPPER(B.EPI_ITEM_CD) = 'E0001' OR UPPER(B.EPI_ITEM_CD) = 'E0002' THEN 1 ";
		sql += " 												ELSE CASE WHEN UPPER(C.ECI_ITEM_CD) = 'E0001' OR UPPER(C.ECI_ITEM_CD) = 'E0002' THEN 1 ELSE 0 END END END ";
		sql += " 					END STOMA_CNT, ";
		sql += " 					CASE WHEN NVL(A.RRT_COLON_YN, 'N') = 'Y' THEN 1 ";
		sql += " 							ELSE CASE WHEN INSTR(UPPER(A.RRT_EXAM_LT), 'E0007$') > 0 OR INSTR(UPPER(A.RRT_EXAM_LT), 'E0008$') > 0 THEN 1 ";
		sql += " 									ELSE CASE WHEN UPPER(B.EPI_ITEM_CD) = 'E0007' OR UPPER(B.EPI_ITEM_CD) = 'E0008' THEN 1 ";
		sql += " 												ELSE CASE WHEN UPPER(C.ECI_ITEM_CD) = 'E0007' OR UPPER(C.ECI_ITEM_CD) = 'E0008' THEN 1 ELSE 0 END END END ";
		sql += " 					END COLON_CNT,                        ";
		sql += " 					EPI_ITEM_CD, ECI_ITEM_CD ";
		sql += " 				FROM RT_RSVT A ";
		sql += " 					LEFT OUTER JOIN ET_PACK_ITEM B ";
		sql += " 						ON B.EPI_EXAM_CD = SUBSTR(A.RRT_EXAM_LT, 9, 5) ";
		sql += " 						AND B.EPI_PACK_SQ = SUBSTR(A.RRT_EXAM_LT, 14, 5) ";
		sql += " 						AND UPPER(B.EPI_ITEM_CD) IN ('E0001','E0002','E0007','E0008') ";
		sql += " 					LEFT OUTER JOIN ET_COMP_CNRT_PROF_ITEM C ";
		sql += " 						ON C.ECI_COMP_CD = A.RRT_COMP_CD ";
		sql += " 						AND C.ECI_MNGT_YR = SUBSTR(A.RRT_EXAM_LT, 5, 4) ";
		sql += " 						AND C.ECI_CNRT_SQ = SUBSTR(A.RRT_EXAM_LT, 14, 2) ";
		sql += " 						AND C.ECI_PROF_SQ = SUBSTR(A.RRT_EXAM_LT, 16, 2) ";
		sql += " 						AND UPPER(C.ECI_ITEM_CD) IN ('E0001','E0002','E0007','E0008') ";
		sql += " 				WHERE A.RRT_EXAM_DT BETWEEN '"+ EXAM_SDT + "' AND '" + EXAM_EDT + "' ";
		sql += " 				AND NVL(A.RRT_EXAM_SQ, ' ') = ' ' ";
		sql += " 				AND NVL(A.RRT_CNCL_YN, 'N') <> 'Y' ";
		sql += " 				AND SUBSTR(A.RRT_EXAM_CD, 1, 2) <> '31' ";
		sql += " 			) D ";
		sql += " 		GROUP BY RRT_EXAM_DT, RRT_RSVN_NO ";
		sql += " 	) E ";
		sql += " GROUP BY RRT_EXAM_DT ";

		if(ORDER_BY.equals("1")) {
			sql += " ORDER BY RRT_EXAM_DT";
		} else {
			sql += " ORDER BY RRT_EXAM_DT DESC";
		}

		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uRsvn_Acpt_UP_RsvnSum_001 \n";
		G_INFO += "설명 : 예약일자별 내시경 예약건수 조회 \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
		G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
		G_INFO += " ORDER_BY : " + ORDER_BY + " \n";
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
		<s:AttributeType name='RRT_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_RSVN_CNT' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_STOMA_CNT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_COLON_CNT' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='MAN_CNT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='WOMAN_CNT' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='END_CNT' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='END_MCNT' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='END_WCNT' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RSVN_CNT' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String RRT_EXAM_DT_T = cRsList.getString("RRT_EXAM_DT");
			String RRT_RSVN_CNT_T = cRsList.getString("RRT_RSVN_CNT");
			String RRT_STOMA_CNT_T = cRsList.getString("RRT_STOMA_CNT");
			String RRT_COLON_CNT_T = cRsList.getString("RRT_COLON_CNT");
			String MAN_CNT_T = cRsList.getString("MAN_CNT");
			String WOMAN_CNT_T = cRsList.getString("WOMAN_CNT");
			String END_CNT_T = cRsList.getString("END_CNT");
			String END_MCNT_T = cRsList.getString("END_MCNT");
			String END_WCNT_T = cRsList.getString("END_WCNT");
			String RSVN_CNT_T = cRsList.getString("RSVN_CNT");
%>
			<z:row
<%
			if(! RRT_EXAM_DT_T.equals("")) {
%>
		 		RRT_EXAM_DT='<%= RRT_EXAM_DT_T%>'
<%
			}

			if(! RRT_RSVN_CNT_T.equals("")) {
%>
		 		RRT_RSVN_CNT='<%= RRT_RSVN_CNT_T%>'
<%
			}

			if(! RRT_STOMA_CNT_T.equals("")) {
%>
		 		RRT_STOMA_CNT='<%= RRT_STOMA_CNT_T%>'
<%
			}

			if(! RRT_COLON_CNT_T.equals("")) {
%>
		 		RRT_COLON_CNT='<%= RRT_COLON_CNT_T%>'
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

			if(! END_CNT_T.equals("")) {
%>
		 		END_CNT='<%= END_CNT_T%>'
<%
			}

			if(! END_MCNT_T.equals("")) {
%>
				END_MCNT='<%= END_MCNT_T%>'
<%
			}

			if(! END_WCNT_T.equals("")) {
%>
				END_WCNT='<%= END_WCNT_T%>'
<%
			}

			if(! RSVN_CNT_T.equals("")) {
%>
		 		RSVN_CNT='<%= RSVN_CNT_T%>'
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
