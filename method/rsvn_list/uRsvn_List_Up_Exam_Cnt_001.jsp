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

SELECT A.EXAM_CD, A.EXAM_KD, COUNT(*) T_CNT, SUM(A.M_CNT) M_CNT, SUM(A.W_CNT) W_CNT
  FROM (SELECT SUBSTR(RRT_EXAM_CD, 1, 2) EXAM_CD,
               CASE WHEN SUBSTR(RRT_EXAM_LT, 1, 3) IN ('E00', 'P00') THEN F_PACK_FIND(RRT_EXAM_LT, '')
                    WHEN SUBSTR(RRT_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(RRT_EXAM_LT, RRT_COMP_CD)
                    ELSE F_CODE_FIND('0401', SUBSTR(RRT_EXAM_CD||'001', 1, 5), '', '1') END EXAM_KD,
               CASE WHEN RRT_SEX_CD = '1' THEN 1 ELSE 0 END M_CNT,
               CASE WHEN RRT_SEX_CD = '1' THEN 0 ELSE 1 END W_CNT
          FROM RT_RSVT
         WHERE RRT_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
           AND SUBSTR(RRT_EXAM_CD, 1, 2) <> '31'
           AND NVL(RRT_CNCL_YN, 'N') <> 'Y') A
 GROUP BY A.EXAM_CD, A.EXAM_KD
 ORDER BY A.EXAM_CD, A.EXAM_KD

		*/

		sql = " SELECT A.EXAM_CD, A.EXAM_KD, COUNT(*) T_CNT, SUM(A.M_CNT) M_CNT, SUM(A.W_CNT) W_CNT";
		sql += " FROM (SELECT SUBSTR(RRT_EXAM_CD, 1, 2) EXAM_CD, CASE WHEN SUBSTR(RRT_EXAM_LT, 1, 3) IN ('E00', 'P00') THEN F_PACK_FIND(RRT_EXAM_LT, '') WHEN SUBSTR(RRT_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(RRT_EXAM_LT, RRT_COMP_CD) ELSE F_CODE_FIND('0401', SUBSTR(RRT_EXAM_CD||'001', 1, 5), '', '1') END EXAM_KD, CASE WHEN RRT_SEX_CD = '1' THEN 1 ELSE 0 END M_CNT, CASE WHEN RRT_SEX_CD = '1' THEN 0 ELSE 1 END W_CNT";
		sql += " FROM RT_RSVT";
		sql += " WHERE RRT_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND SUBSTR(RRT_EXAM_CD, 1, 2) <> '31'";
		sql += " AND NVL(RRT_CNCL_YN, 'N') <> 'Y') A";
		sql += " GROUP BY A.EXAM_CD, A.EXAM_KD";
		sql += " ORDER BY A.EXAM_CD, A.EXAM_KD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_List_Up_Exam_Cnt_001 \n";
			G_INFO += "설명 : 예약 검진종류별 남여 예약건수 \n";
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
		<s:AttributeType name='EXAM_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_KD' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='T_CNT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='M_CNT' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='W_CNT' rs:number='5' rs:nullable='true'>
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

			String EXAM_CD_T = cRsList.getString("EXAM_CD");
			String EXAM_KD_T = cRsList.getString("EXAM_KD");
			String T_CNT_T = cRsList.getString("T_CNT");
			String M_CNT_T = cRsList.getString("M_CNT");
			String W_CNT_T = cRsList.getString("W_CNT");
%>
			<z:row
<%
			if(! EXAM_CD_T.equals("")) {
%>
		 		EXAM_CD='<%= EXAM_CD_T%>'
<%
			}

			if(! EXAM_KD_T.equals("")) {
%>
		 		EXAM_KD='<%= EXAM_KD_T%>'
<%
			}

			if(! T_CNT_T.equals("")) {
%>
		 		T_CNT='<%= T_CNT_T%>'
<%
			}

			if(! M_CNT_T.equals("")) {
%>
		 		M_CNT='<%= M_CNT_T%>'
<%
			}

			if(! W_CNT_T.equals("")) {
%>
		 		W_CNT='<%= W_CNT_T%>'
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
