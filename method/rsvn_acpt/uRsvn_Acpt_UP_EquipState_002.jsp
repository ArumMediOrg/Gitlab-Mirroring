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

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

<java>
String vCOMM_SQL =
       "MAX(EQUIP_RMK) EQUIP_RMK, MAX(RRL_HOLI_CD) RRL_HOLI_CD,
        SUM(EQUIP_R00) R00, SUM(EQUIP_T00) T00, SUM(EQUIP_R01) R01, SUM(EQUIP_T01) T01,
        SUM(EQUIP_R02) R02, SUM(EQUIP_T02) T02, SUM(EQUIP_R03) R03, SUM(EQUIP_T03) T03,
        SUM(EQUIP_R04) R04, SUM(EQUIP_T04) T04, SUM(EQUIP_R05) R05, SUM(EQUIP_T05) T05,
        SUM(EQUIP_R06) R06, SUM(EQUIP_T06) T06, SUM(EQUIP_R07) R07, SUM(EQUIP_T07) T07,
        SUM(EQUIP_R08) R08, SUM(EQUIP_T08) T08, SUM(EQUIP_R09) R09, SUM(EQUIP_T09) T09,
        SUM(EQUIP_R10) R10, SUM(EQUIP_T10) T10, SUM(EQUIP_R11) R11, SUM(EQUIP_T11) T11,
        F_LPAD(TO_CHAR(SUM(EQUIP_R00)), 3, ' ') || ' / ' ||
        F_LPAD(TO_CHAR(SUM(EQUIP_T00)), 3, ' ') DIS_CNT00,
        F_LPAD(TO_CHAR(SUM(EQUIP_R01)), 3, ' ') || ' / ' ||
        F_LPAD(TO_CHAR(SUM(EQUIP_T01)), 3, ' ') DIS_CNT01,
        F_LPAD(TO_CHAR(SUM(EQUIP_R02)), 3, ' ') || ' / ' ||
        F_LPAD(TO_CHAR(SUM(EQUIP_T02)), 3, ' ') DIS_CNT02,
        F_LPAD(TO_CHAR(SUM(EQUIP_R03)), 3, ' ') || ' / ' ||
        F_LPAD(TO_CHAR(SUM(EQUIP_T03)), 3, ' ') DIS_CNT03,
        F_LPAD(TO_CHAR(SUM(EQUIP_R04)), 3, ' ') || ' / ' ||
        F_LPAD(TO_CHAR(SUM(EQUIP_T04)), 3, ' ') DIS_CNT04,
        F_LPAD(TO_CHAR(SUM(EQUIP_R05)), 3, ' ') || ' / ' ||
        F_LPAD(TO_CHAR(SUM(EQUIP_T05)), 3, ' ') DIS_CNT05,
        F_LPAD(TO_CHAR(SUM(EQUIP_R06)), 3, ' ') || ' / ' ||
        F_LPAD(TO_CHAR(SUM(EQUIP_T06)), 3, ' ') DIS_CNT06,
        F_LPAD(TO_CHAR(SUM(EQUIP_R07)), 3, ' ') || ' / ' ||
        F_LPAD(TO_CHAR(SUM(EQUIP_T07)), 3, ' ') DIS_CNT07,
        F_LPAD(TO_CHAR(SUM(EQUIP_R08)), 3, ' ') || ' / ' ||
        F_LPAD(TO_CHAR(SUM(EQUIP_T08)), 3, ' ') DIS_CNT08,
        F_LPAD(TO_CHAR(SUM(EQUIP_R09)), 3, ' ') || ' / ' ||
        F_LPAD(TO_CHAR(SUM(EQUIP_T09)), 3, ' ') DIS_CNT09,
        F_LPAD(TO_CHAR(SUM(EQUIP_R10)), 3, ' ') || ' / ' ||
        F_LPAD(TO_CHAR(SUM(EQUIP_T10)), 3, ' ') DIS_CNT10,
        F_LPAD(TO_CHAR(SUM(EQUIP_R11)), 3, ' ') || ' / ' ||
        F_LPAD(TO_CHAR(SUM(EQUIP_T11)), 3, ' ') DIS_CNT11
   FROM (SELECT RRL_EQUI_CD, RRL_TIME_SQ, RRL_TIME_CD,
                CASE WHEN RRL_EQUI_CD = '00' THEN RRL_HOLI_CD ELSE '0' END RRL_HOLI_CD,
                RRL_TIME_STM||' ~ '||RRL_TIME_ETM TIME_TERM,
                CASE WHEN LTRIM(RRL_TIME_STM) = '' THEN 'X' ELSE RRL_TIME_STM END AS RRL_TIME_STM, RRL_TIME_ETM,
                CASE WHEN RRL_EQUI_CD = '00' THEN RRL_ITEM_LT  ELSE ' ' END EQUIP_RMK,
                CASE WHEN RRL_EQUI_CD = '00' THEN NVL(RRL_RSVN_CNT,0) ELSE 0 END EQUIP_R00,
                CASE WHEN RRL_EQUI_CD = '00' THEN NVL(RRL_TOT_CNT, 0) ELSE 0 END EQUIP_T00,
                CASE WHEN RRL_EQUI_CD = '01' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R01,
                CASE WHEN RRL_EQUI_CD = '01' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T01,
                CASE WHEN RRL_EQUI_CD = '02' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R02,
                CASE WHEN RRL_EQUI_CD = '02' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T02,
                CASE WHEN RRL_EQUI_CD = '03' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R03,
                CASE WHEN RRL_EQUI_CD = '03' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T03,
                CASE WHEN RRL_EQUI_CD = '04' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R04,
                CASE WHEN RRL_EQUI_CD = '04' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T04,
                CASE WHEN RRL_EQUI_CD = '05' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R05,
                CASE WHEN RRL_EQUI_CD = '05' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T05,
                CASE WHEN RRL_EQUI_CD = '06' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R06,
                CASE WHEN RRL_EQUI_CD = '06' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T06,
                CASE WHEN RRL_EQUI_CD = '07' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R07,
                CASE WHEN RRL_EQUI_CD = '07' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T07,
                CASE WHEN RRL_EQUI_CD = '08' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R08,
                CASE WHEN RRL_EQUI_CD = '08' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T08,
                CASE WHEN RRL_EQUI_CD = '09' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R09,
                CASE WHEN RRL_EQUI_CD = '09' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T09,
                CASE WHEN RRL_EQUI_CD = '10' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R10,
                CASE WHEN RRL_EQUI_CD = '10' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T10,
                CASE WHEN RRL_EQUI_CD = '11' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R11,
                CASE WHEN RRL_EQUI_CD = '11' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T11
           FROM RT_RSVT_EQUIP_LIMIT C, RT_RSVT_EQUIP B
          WHERE RRL_EXAM_DT = " + @EXAM_DT + "
            AND RRE_EQUI_CD = RRL_EQUI_CD
            AND RRE_USE_YN  = 'Y' "
</java>

SELECT '0' ORDER_BY,
        MIN(RRL_TIME_STM) || ' ~ ' || MAX(RRL_TIME_ETM) TIME_TERM,
        vCOMM_SQL
      ) A
UNION ALL
SELECT '00' ORDER_BY,
       MIN(RRL_TIME_STM) || ' ~ ' || MAX(RRL_TIME_ETM) TIME_TERM,
       vCOMM_SQL
   AND RRL_EQUI_CD <> '00'
   AND RRL_TIME_CD = '2'
     ) A
UNION ALL
SELECT '000' ORDER_BY,
       MIN(RRL_TIME_STM) || ' ~ ' || MAX(RRL_TIME_ETM) TIME_TERM,
       vCOMM_SQL
   AND RRL_EQUI_CD <> '00'
   AND RRL_TIME_CD = '3'
     ) A
UNION ALL
SELECT TIME_TERM ORDER_BY, TIME_TERM,
       vCOMM_SQL
   AND RRL_EQUI_CD <> '00'
     ) A
 GROUP BY TIME_TERM
 ORDER BY ORDER_BY
		*/

		String vCOMM_SQL = "";
		vCOMM_SQL += " MAX(EQUIP_RMK) EQUIP_RMK, MAX(RRL_HOLI_CD) RRL_HOLI_CD, SUM(EQUIP_R00) R00, SUM(EQUIP_T00) T00, SUM(EQUIP_R01) R01, SUM(EQUIP_T01) T01, SUM(EQUIP_R02) R02, SUM(EQUIP_T02) T02, SUM(EQUIP_R03) R03, SUM(EQUIP_T03) T03, SUM(EQUIP_R04) R04, SUM(EQUIP_T04) T04, SUM(EQUIP_R05) R05, SUM(EQUIP_T05) T05, SUM(EQUIP_R06) R06, SUM(EQUIP_T06) T06, SUM(EQUIP_R07) R07, SUM(EQUIP_T07) T07, SUM(EQUIP_R08) R08, SUM(EQUIP_T08) T08, SUM(EQUIP_R09) R09, SUM(EQUIP_T09) T09, SUM(EQUIP_R10) R10, SUM(EQUIP_T10) T10, SUM(EQUIP_R11) R11, SUM(EQUIP_T11) T11, F_LPAD(TO_CHAR(SUM(EQUIP_R00)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T00)), 3, ' ') DIS_CNT00, F_LPAD(TO_CHAR(SUM(EQUIP_R01)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T01)), 3, ' ') DIS_CNT01, F_LPAD(TO_CHAR(SUM(EQUIP_R02)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T02)), 3, ' ') DIS_CNT02, F_LPAD(TO_CHAR(SUM(EQUIP_R03)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T03)), 3, ' ') DIS_CNT03, F_LPAD(TO_CHAR(SUM(EQUIP_R04)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T04)), 3, ' ') DIS_CNT04, F_LPAD(TO_CHAR(SUM(EQUIP_R05)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T05)), 3, ' ') DIS_CNT05, F_LPAD(TO_CHAR(SUM(EQUIP_R06)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T06)), 3, ' ') DIS_CNT06, F_LPAD(TO_CHAR(SUM(EQUIP_R07)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T07)), 3, ' ') DIS_CNT07, F_LPAD(TO_CHAR(SUM(EQUIP_R08)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T08)), 3, ' ') DIS_CNT08, F_LPAD(TO_CHAR(SUM(EQUIP_R09)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T09)), 3, ' ') DIS_CNT09, F_LPAD(TO_CHAR(SUM(EQUIP_R10)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T10)), 3, ' ') DIS_CNT10, F_LPAD(TO_CHAR(SUM(EQUIP_R11)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T11)), 3, ' ') DIS_CNT11";
		vCOMM_SQL += " FROM (SELECT RRL_EQUI_CD, RRL_TIME_SQ, RRL_TIME_CD, CASE WHEN RRL_EQUI_CD = '00' THEN RRL_HOLI_CD ELSE '0' END RRL_HOLI_CD, RRL_TIME_STM||' ~ '||RRL_TIME_ETM TIME_TERM, CASE WHEN LTRIM(RRL_TIME_STM) = '' THEN 'X' ELSE RRL_TIME_STM END AS RRL_TIME_STM, RRL_TIME_ETM, CASE WHEN RRL_EQUI_CD = '00' THEN RRL_ITEM_LT ELSE ' ' END EQUIP_RMK, CASE WHEN RRL_EQUI_CD = '00' THEN NVL(RRL_RSVN_CNT,0) ELSE 0 END EQUIP_R00, CASE WHEN RRL_EQUI_CD = '00' THEN NVL(RRL_TOT_CNT, 0) ELSE 0 END EQUIP_T00, CASE WHEN RRL_EQUI_CD = '01' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R01, CASE WHEN RRL_EQUI_CD = '01' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T01, CASE WHEN RRL_EQUI_CD = '02' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R02, CASE WHEN RRL_EQUI_CD = '02' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T02, CASE WHEN RRL_EQUI_CD = '03' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R03, CASE WHEN RRL_EQUI_CD = '03' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T03, CASE WHEN RRL_EQUI_CD = '04' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R04, CASE WHEN RRL_EQUI_CD = '04' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T04, CASE WHEN RRL_EQUI_CD = '05' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R05, CASE WHEN RRL_EQUI_CD = '05' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T05, CASE WHEN RRL_EQUI_CD = '06' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R06, CASE WHEN RRL_EQUI_CD = '06' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T06, CASE WHEN RRL_EQUI_CD = '07' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R07, CASE WHEN RRL_EQUI_CD = '07' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T07, CASE WHEN RRL_EQUI_CD = '08' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R08, CASE WHEN RRL_EQUI_CD = '08' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T08, CASE WHEN RRL_EQUI_CD = '09' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R09,CASE WHEN RRL_EQUI_CD = '09' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T09,CASE WHEN RRL_EQUI_CD = '10' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R10,CASE WHEN RRL_EQUI_CD = '10' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T10,CASE WHEN RRL_EQUI_CD = '11' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R11,CASE WHEN RRL_EQUI_CD = '11' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T11";
		vCOMM_SQL += " FROM RT_RSVT_EQUIP_LIMIT C, RT_RSVT_EQUIP B";
		vCOMM_SQL += " WHERE RRL_EXAM_DT = '" + EXAM_DT + "'";
		vCOMM_SQL += " AND RRE_EQUI_CD = RRL_EQUI_CD";
		vCOMM_SQL += " AND RRE_USE_YN = 'Y'";

		sql = " SELECT '0' ORDER_BY, MIN(RRL_TIME_STM) || ' ~ ' || MAX(RRL_TIME_ETM) TIME_TERM, " + vCOMM_SQL + " ) A";
		sql += " UNION ALL";
		sql += " SELECT '00' ORDER_BY, MIN(RRL_TIME_STM) || ' ~ ' || MAX(RRL_TIME_ETM) TIME_TERM, " + vCOMM_SQL + " AND RRL_EQUI_CD <> '00' AND RRL_TIME_CD = '2' ) A";
		sql += " UNION ALL";
		sql += " SELECT '000' ORDER_BY, MIN(RRL_TIME_STM) || ' ~ ' || MAX(RRL_TIME_ETM) TIME_TERM, " + vCOMM_SQL + " AND RRL_EQUI_CD <> '00' AND RRL_TIME_CD = '3' ) A";
		sql += " UNION ALL";
		sql += " SELECT TIME_TERM ORDER_BY, TIME_TERM, " + vCOMM_SQL + " AND RRL_EQUI_CD <> '00' ) A";
		sql += " GROUP BY TIME_TERM";
		sql += " ORDER BY ORDER_BY";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_UP_EquipState_002 \n";
			G_INFO += "설명 : 예약일자별 장비 예약 현황 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
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

				if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
					byte[] buf_BLOB = rsList.getBytes(rsmd.getColumnName(colCnt));
					if(buf_BLOB != null) {
						tempData = new String(buf_BLOB);
					}
				}

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
