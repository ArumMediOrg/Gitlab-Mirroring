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

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.RRT_RSVN_NO, A.RRT_EXAM_DT,
       CASE WHEN NVL(A.RRT_STOMA_YN, 'N') = 'Y' THEN 'Y'
            ELSE CASE WHEN INSTR(A.RRT_EXAM_LT, 'E0001$') > 0 OR INSTR(A.RRT_EXAM_LT, 'E0002$') > 0  THEN 'Y'
                      ELSE CASE WHEN B.EPI_ITEM_CD = 'E0001' OR B.EPI_ITEM_CD = 'E0002' THEN 'Y' 
                                     ELSE CASE WHEN C.ECI_ITEM_CD = 'E0001' OR C.ECI_ITEM_CD = 'E0002' THEN 'Y' ELSE 'N' END END END 
       END STOMA_YN, 
       CASE WHEN NVL(A.RRT_COLON_YN, 'N') = 'Y' THEN 'Y' 
            ELSE CASE WHEN INSTR(A.RRT_EXAM_LT, 'E0007$') > 0 OR INSTR(A.RRT_EXAM_LT, 'E0008$') > 0 THEN 'Y' 
                      ELSE CASE WHEN B.EPI_ITEM_CD = 'E0007' OR B.EPI_ITEM_CD = 'E0008' THEN 'Y' 
                                ELSE CASE WHEN C.ECI_ITEM_CD = 'E0007' OR C.ECI_ITEM_CD = 'E0008' THEN 'Y' ELSE 'N' END END END 
       END COLON_YN
  FROM RT_RSVT A 
       LEFT OUTER JOIN ET_PACK_ITEM B
         ON B.EPI_EXAM_CD = SUBSTR(A.RRT_EXAM_LT,  9, 5) 
        AND B.EPI_PACK_SQ = SUBSTR(A.RRT_EXAM_LT, 14, 5) 
        AND B.EPI_ITEM_CD IN ('E0001','E0002','E0007','E0008') 
       LEFT OUTER JOIN ET_COMP_CNRT_PROF_ITEM C
         ON C.ECI_COMP_CD = A.RRT_COMP_CD 
        AND C.ECI_MNGT_YR = SUBSTR(A.RRT_EXAM_LT, 5, 4) 
        AND C.ECI_CNRT_SQ = SUBSTR(A.RRT_EXAM_LT, 14, 2) 
        AND C.ECI_PROF_SQ = SUBSTR(A.RRT_EXAM_LT, 16, 2) 
        AND C.ECI_ITEM_CD IN ('E0001','E0002','E0007','E0008')        
 WHERE A.RRT_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
   AND SUBSTR(A.RRT_EXAM_CD, 1, 2) <> '31'
   AND NVL(A.RRT_CNCL_YN, 'N') <> 'Y' 
		*/

		sql = " SELECT A.RRT_RSVN_NO, A.RRT_EXAM_DT";

		sql += ", CASE WHEN NVL(A.RRT_STOMA_YN, 'N') = 'Y' THEN 'Y' ELSE";
		sql += "	CASE WHEN INSTR(A.RRT_EXAM_LT, 'E0001$') > 0 OR INSTR(A.RRT_EXAM_LT, 'E0002$') > 0 THEN 'Y' ELSE";
		sql += "		CASE WHEN B.EPI_ITEM_CD = 'E0001' OR B.EPI_ITEM_CD = 'E0002' THEN 'Y' ELSE";
		sql += "			CASE WHEN C.ECI_ITEM_CD = 'E0001' OR C.ECI_ITEM_CD = 'E0002' THEN 'Y' ELSE 'N' END";
		sql += "		END";
		sql += "	END";
		sql += " END STOMA_YN";
		
		sql += ", CASE WHEN NVL(A.RRT_COLON_YN, 'N') = 'Y' THEN 'Y' ELSE";
		sql += "	CASE WHEN INSTR(A.RRT_EXAM_LT, 'E0007$') > 0 OR INSTR(A.RRT_EXAM_LT, 'E0008$') > 0 THEN 'Y' ELSE";
		sql += "		CASE WHEN B.EPI_ITEM_CD = 'E0007' OR B.EPI_ITEM_CD = 'E0008' THEN 'Y' ELSE";
		sql += "			CASE WHEN C.ECI_ITEM_CD = 'E0007' OR C.ECI_ITEM_CD = 'E0008' THEN 'Y' ELSE 'N' END";
		sql += "		END";
		sql += "	END";
		sql += " END COLON_YN";

		sql += " FROM RT_RSVT A LEFT OUTER JOIN ET_PACK_ITEM B";
		sql += " ON B.EPI_EXAM_CD = SUBSTR(A.RRT_EXAM_LT, 9, 5)";
		sql += " AND B.EPI_PACK_SQ = SUBSTR(A.RRT_EXAM_LT, 14, 5)";
		sql += " AND B.EPI_ITEM_CD IN ('E0001','E0002','E0007','E0008') LEFT OUTER JOIN ET_COMP_CNRT_PROF_ITEM C";
		sql += " ON C.ECI_COMP_CD = A.RRT_COMP_CD";
		sql += " AND C.ECI_MNGT_YR = SUBSTR(A.RRT_EXAM_LT, 5, 4)";
		sql += " AND C.ECI_CNRT_SQ = SUBSTR(A.RRT_EXAM_LT, 14, 2)";
		sql += " AND C.ECI_PROF_SQ = SUBSTR(A.RRT_EXAM_LT, 16, 2)";
		sql += " AND C.ECI_ITEM_CD IN ('E0001','E0002','E0007','E0008')";
		sql += " WHERE A.RRT_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";
		sql += " AND SUBSTR(A.RRT_EXAM_CD, 1, 2) <> '31'";
		sql += " AND NVL(A.RRT_CNCL_YN, 'N') <> 'Y'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_btnRsvn_SrchClick_002 \n";
			G_INFO += "설명 : 예약 내역중 내시경 여부 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
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
		<s:AttributeType name='RRT_RSVN_NO' rs:number='1' rs:basetable='RT_RSVT' rs:basecolumn='RRT_RSVN_NO' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='14' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_DT' rs:number='2' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='STOMA_YN' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='COLON_YN' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1004' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String RRT_RSVN_NO_T = cRsList.getString("RRT_RSVN_NO");
			String RRT_EXAM_DT_T = cRsList.getString("RRT_EXAM_DT");
			String STOMA_YN_T = cRsList.getString("STOMA_YN");
			String COLON_YN_T = cRsList.getString("COLON_YN");
%>
			<z:row
<%
			if(! RRT_RSVN_NO_T.equals("")) {
%>
		 		RRT_RSVN_NO='<%= RRT_RSVN_NO_T%>'
<%
			}

			if(! RRT_EXAM_DT_T.equals("")) {
%>
		 		RRT_EXAM_DT='<%= RRT_EXAM_DT_T%>'
<%
			}

			if(! STOMA_YN_T.equals("")) {
%>
		 		STOMA_YN='<%= STOMA_YN_T%>'
<%
			}

			if(! COLON_YN_T.equals("")) {
%>
		 		COLON_YN='<%= COLON_YN_T%>'
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
