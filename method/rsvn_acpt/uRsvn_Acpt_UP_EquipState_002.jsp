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

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

<java>
String vCOMM_SQL = 
       "MAX(EQUIP_RMK) EQUIP_RMK, MAX(RRL_HOLI_CD) RRL_HOLI_CD,
        SUM(EQUIP_R00) R00, SUM(EQUIP_T00) T00,
        SUM(EQUIP_R01) R01, SUM(EQUIP_T01) T01, SUM(EQUIP_R02) R02, SUM(EQUIP_T02) T02,
        SUM(EQUIP_R03) R03, SUM(EQUIP_T03) T03, SUM(EQUIP_R04) R04, SUM(EQUIP_T04) T04,
        SUM(EQUIP_R05) R05, SUM(EQUIP_T05) T05, SUM(EQUIP_R06) R06, SUM(EQUIP_T06) T06,
        SUM(EQUIP_R07) R07, SUM(EQUIP_T07) T07, SUM(EQUIP_R08) R08, SUM(EQUIP_T08) T08,
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
        F_LPAD(TO_CHAR(SUM(EQUIP_T08)), 3, ' ') DIS_CNT08 
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
                CASE WHEN RRL_EQUI_CD = '08' THEN RRL_TOT_CNT  ELSE 0 END EQUIP_T08
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
		vCOMM_SQL += " MAX(EQUIP_RMK) EQUIP_RMK, MAX(RRL_HOLI_CD) RRL_HOLI_CD, SUM(EQUIP_R00) R00, SUM(EQUIP_T00) T00, SUM(EQUIP_R01) R01, SUM(EQUIP_T01) T01, SUM(EQUIP_R02) R02, SUM(EQUIP_T02) T02, SUM(EQUIP_R03) R03, SUM(EQUIP_T03) T03, SUM(EQUIP_R04) R04, SUM(EQUIP_T04) T04, SUM(EQUIP_R05) R05, SUM(EQUIP_T05) T05, SUM(EQUIP_R06) R06, SUM(EQUIP_T06) T06, SUM(EQUIP_R07) R07, SUM(EQUIP_T07) T07, SUM(EQUIP_R08) R08, SUM(EQUIP_T08) T08, F_LPAD(TO_CHAR(SUM(EQUIP_R00)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T00)), 3, ' ') DIS_CNT00, F_LPAD(TO_CHAR(SUM(EQUIP_R01)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T01)), 3, ' ') DIS_CNT01, F_LPAD(TO_CHAR(SUM(EQUIP_R02)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T02)), 3, ' ') DIS_CNT02, F_LPAD(TO_CHAR(SUM(EQUIP_R03)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T03)), 3, ' ') DIS_CNT03, F_LPAD(TO_CHAR(SUM(EQUIP_R04)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T04)), 3, ' ') DIS_CNT04, F_LPAD(TO_CHAR(SUM(EQUIP_R05)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T05)), 3, ' ') DIS_CNT05, F_LPAD(TO_CHAR(SUM(EQUIP_R06)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T06)), 3, ' ') DIS_CNT06, F_LPAD(TO_CHAR(SUM(EQUIP_R07)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T07)), 3, ' ') DIS_CNT07, F_LPAD(TO_CHAR(SUM(EQUIP_R08)), 3, ' ') || ' / ' || F_LPAD(TO_CHAR(SUM(EQUIP_T08)), 3, ' ') DIS_CNT08";
		vCOMM_SQL += " FROM (SELECT RRL_EQUI_CD, RRL_TIME_SQ, RRL_TIME_CD, CASE WHEN RRL_EQUI_CD = '00' THEN RRL_HOLI_CD ELSE '0' END RRL_HOLI_CD, RRL_TIME_STM||' ~ '||RRL_TIME_ETM TIME_TERM, CASE WHEN LTRIM(RRL_TIME_STM) = '' THEN 'X' ELSE RRL_TIME_STM END AS RRL_TIME_STM, RRL_TIME_ETM, CASE WHEN RRL_EQUI_CD = '00' THEN RRL_ITEM_LT ELSE ' ' END EQUIP_RMK, CASE WHEN RRL_EQUI_CD = '00' THEN NVL(RRL_RSVN_CNT,0) ELSE 0 END EQUIP_R00, CASE WHEN RRL_EQUI_CD = '00' THEN NVL(RRL_TOT_CNT, 0) ELSE 0 END EQUIP_T00, CASE WHEN RRL_EQUI_CD = '01' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R01, CASE WHEN RRL_EQUI_CD = '01' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T01, CASE WHEN RRL_EQUI_CD = '02' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R02, CASE WHEN RRL_EQUI_CD = '02' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T02, CASE WHEN RRL_EQUI_CD = '03' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R03, CASE WHEN RRL_EQUI_CD = '03' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T03, CASE WHEN RRL_EQUI_CD = '04' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R04, CASE WHEN RRL_EQUI_CD = '04' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T04, CASE WHEN RRL_EQUI_CD = '05' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R05, CASE WHEN RRL_EQUI_CD = '05' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T05, CASE WHEN RRL_EQUI_CD = '06' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R06, CASE WHEN RRL_EQUI_CD = '06' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T06, CASE WHEN RRL_EQUI_CD = '07' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R07, CASE WHEN RRL_EQUI_CD = '07' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T07, CASE WHEN RRL_EQUI_CD = '08' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_R08, CASE WHEN RRL_EQUI_CD = '08' THEN RRL_TOT_CNT ELSE 0 END EQUIP_T08";
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
		<s:AttributeType name='ORDER_BY' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='11' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='TIME_TERM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='EQUIP_RMK' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='RRL_HOLI_CD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='R00' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='T00' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R01' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='T01' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R02' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='T02' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R03' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='T03' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R04' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='T04' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R05' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='T05' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R06' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='T06' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R07' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='T07' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R08' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='T08' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_CNT00' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_CNT01' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_CNT02' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_CNT03' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_CNT04' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_CNT05' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_CNT06' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_CNT07' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_CNT08' rs:number='31' rs:nullable='true'>
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

			String ORDER_BY_T = cRsList.getString("ORDER_BY");
			String TIME_TERM_T = cRsList.getString("TIME_TERM");
			String EQUIP_RMK_T = cRsList.getString("EQUIP_RMK");
			String RRL_HOLI_CD_T = cRsList.getString("RRL_HOLI_CD");
			String R00_T = cRsList.getString("R00");
			String T00_T = cRsList.getString("T00");
			String R01_T = cRsList.getString("R01");
			String T01_T = cRsList.getString("T01");
			String R02_T = cRsList.getString("R02");
			String T02_T = cRsList.getString("T02");
			String R03_T = cRsList.getString("R03");
			String T03_T = cRsList.getString("T03");
			String R04_T = cRsList.getString("R04");
			String T04_T = cRsList.getString("T04");
			String R05_T = cRsList.getString("R05");
			String T05_T = cRsList.getString("T05");
			String R06_T = cRsList.getString("R06");
			String T06_T = cRsList.getString("T06");
			String R07_T = cRsList.getString("R07");
			String T07_T = cRsList.getString("T07");
			String R08_T = cRsList.getString("R08");
			String T08_T = cRsList.getString("T08");
			String DIS_CNT00_T = cRsList.getString("DIS_CNT00");
			String DIS_CNT01_T = cRsList.getString("DIS_CNT01");
			String DIS_CNT02_T = cRsList.getString("DIS_CNT02");
			String DIS_CNT03_T = cRsList.getString("DIS_CNT03");
			String DIS_CNT04_T = cRsList.getString("DIS_CNT04");
			String DIS_CNT05_T = cRsList.getString("DIS_CNT05");
			String DIS_CNT06_T = cRsList.getString("DIS_CNT06");
			String DIS_CNT07_T = cRsList.getString("DIS_CNT07");
			String DIS_CNT08_T = cRsList.getString("DIS_CNT08");
%>
			<z:row
<%
			if(! ORDER_BY_T.equals("")) {
%>
		 		ORDER_BY='<%= ORDER_BY_T%>'
<%
			}

			if(! TIME_TERM_T.equals("")) {
%>
		 		TIME_TERM='<%= TIME_TERM_T%>'
<%
			}

			if(! EQUIP_RMK_T.equals("")) {
%>
		 		EQUIP_RMK='<%= EQUIP_RMK_T%>'
<%
			}

			if(! RRL_HOLI_CD_T.equals("")) {
%>
		 		RRL_HOLI_CD='<%= RRL_HOLI_CD_T%>'
<%
			}

			if(! R00_T.equals("")) {
%>
		 		R00='<%= R00_T%>'
<%
			}

			if(! T00_T.equals("")) {
%>
		 		T00='<%= T00_T%>'
<%
			}

			if(! R01_T.equals("")) {
%>
		 		R01='<%= R01_T%>'
<%
			}

			if(! T01_T.equals("")) {
%>
		 		T01='<%= T01_T%>'
<%
			}

			if(! R02_T.equals("")) {
%>
		 		R02='<%= R02_T%>'
<%
			}

			if(! T02_T.equals("")) {
%>
		 		T02='<%= T02_T%>'
<%
			}

			if(! R03_T.equals("")) {
%>
		 		R03='<%= R03_T%>'
<%
			}

			if(! T03_T.equals("")) {
%>
		 		T03='<%= T03_T%>'
<%
			}

			if(! R04_T.equals("")) {
%>
		 		R04='<%= R04_T%>'
<%
			}

			if(! T04_T.equals("")) {
%>
		 		T04='<%= T04_T%>'
<%
			}

			if(! R05_T.equals("")) {
%>
		 		R05='<%= R05_T%>'
<%
			}

			if(! T05_T.equals("")) {
%>
		 		T05='<%= T05_T%>'
<%
			}

			if(! R06_T.equals("")) {
%>
		 		R06='<%= R06_T%>'
<%
			}

			if(! T06_T.equals("")) {
%>
		 		T06='<%= T06_T%>'
<%
			}

			if(! R07_T.equals("")) {
%>
		 		R07='<%= R07_T%>'
<%
			}

			if(! T07_T.equals("")) {
%>
		 		T07='<%= T07_T%>'
<%
			}

			if(! R08_T.equals("")) {
%>
		 		R08='<%= R08_T%>'
<%
			}

			if(! T08_T.equals("")) {
%>
		 		T08='<%= T08_T%>'
<%
			}

			if(! DIS_CNT00_T.equals("")) {
%>
		 		DIS_CNT00='<%= DIS_CNT00_T%>'
<%
			}

			if(! DIS_CNT01_T.equals("")) {
%>
		 		DIS_CNT01='<%= DIS_CNT01_T%>'
<%
			}

			if(! DIS_CNT02_T.equals("")) {
%>
		 		DIS_CNT02='<%= DIS_CNT02_T%>'
<%
			}

			if(! DIS_CNT03_T.equals("")) {
%>
		 		DIS_CNT03='<%= DIS_CNT03_T%>'
<%
			}

			if(! DIS_CNT04_T.equals("")) {
%>
		 		DIS_CNT04='<%= DIS_CNT04_T%>'
<%
			}

			if(! DIS_CNT05_T.equals("")) {
%>
		 		DIS_CNT05='<%= DIS_CNT05_T%>'
<%
			}

			if(! DIS_CNT06_T.equals("")) {
%>
		 		DIS_CNT06='<%= DIS_CNT06_T%>'
<%
			}

			if(! DIS_CNT07_T.equals("")) {
%>
		 		DIS_CNT07='<%= DIS_CNT07_T%>'
<%
			}

			if(! DIS_CNT08_T.equals("")) {
%>
		 		DIS_CNT08='<%= DIS_CNT08_T%>'
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
