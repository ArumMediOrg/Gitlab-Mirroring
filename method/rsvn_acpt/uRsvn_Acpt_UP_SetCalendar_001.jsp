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
		String AM_YN = htMethod.get("AM_YN");
		String PM_YN = htMethod.get("PM_YN");

		//
		if(EXAM_DTS == null) { EXAM_DTS = ""; }
		if(EXAM_DTE == null) { EXAM_DTE = ""; }
		if(AM_YN == null) { AM_YN = ""; }
		if(PM_YN == null) { PM_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT RRL_EXAM_DT,   MAX(ECM_RSVT_TX) ECM_RSVT_TX,
       MAX(RRL_HOLI_CD) RRL_HOLI_CD, MAX(RRL_HOLI_NM) RRL_HOLI_NM,
       SUM(EQUIP_R00) R00, SUM(EQUIP_R01) R01, SUM(EQUIP_R02) R02,
       SUM(EQUIP_R03) R03, SUM(EQUIP_R04) R04, SUM(EQUIP_R05) R05,
       SUM(EQUIP_R06) R06, SUM(EQUIP_R07) R07, SUM(EQUIP_R08) R08,
       F_LPAD(CASE WHEN SUM(EQUIP_R00) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R00)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R01) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R01)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R02) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R02)) END, 3, ' ') || ' ' DIS_CNT1,
       F_LPAD(CASE WHEN SUM(EQUIP_R03) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R03)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R04) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R04)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R05) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R05)) END, 3, ' ') || ' ' DIS_CNT2,
       F_LPAD(CASE WHEN SUM(EQUIP_R06) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R06)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R07) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R07)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_R08) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R08)) END, 3, ' ') || ' ' DIS_CNT3,
       SUM(EQUIP_P00) P00, SUM(EQUIP_P01) P01, SUM(EQUIP_P02) P02,
       SUM(EQUIP_P03) P03, SUM(EQUIP_P04) P04, SUM(EQUIP_P05) P05,
       SUM(EQUIP_P06) P06, SUM(EQUIP_P07) P07, SUM(EQUIP_P08) P08,
       F_LPAD(CASE WHEN SUM(EQUIP_P00) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P00)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P01) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P01)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P02) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P02)) END, 3, ' ') || ' ' DIS_PCNT1,
       F_LPAD(CASE WHEN SUM(EQUIP_P03) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P03)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P04) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P04)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P05) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P05)) END, 3, ' ') || ' ' DIS_PCNT2,
       F_LPAD(CASE WHEN SUM(EQUIP_P06) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P06)) END, 3, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P07) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P07)) END, 4, ' ') || ' | ' ||
       F_LPAD(CASE WHEN SUM(EQUIP_P08) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P08)) END, 3, ' ') || ' ' DIS_PCNT3
  FROM (SELECT RRL_EXAM_DT, 
               CASE WHEN ECM_RSVT_TX = '' OR ECM_RSVT_TX IS NULL THEN 'X' ELSE '★메모' END ECM_RSVT_TX,
               CASE WHEN RRL_EQUI_CD = '00' THEN RRL_HOLI_CD ELSE '0' END RRL_HOLI_CD,
               CASE WHEN RRL_EQUI_CD = '00' THEN RRL_HOLI_NM ELSE ''  END RRL_HOLI_NM,
               CASE WHEN RRL_EQUI_CD = '00' AND RRE_USE_YN = 'Y' THEN NVL(RRL_TOT_CNT, 0) - NVL(RRL_RSVN_CNT,0) ELSE 0 END EQUIP_R00,
               CASE WHEN RRL_EQUI_CD = '01' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R01,
               CASE WHEN RRL_EQUI_CD = '02' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R02,
               CASE WHEN RRL_EQUI_CD = '03' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R03,
               CASE WHEN RRL_EQUI_CD = '04' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R04,
               CASE WHEN RRL_EQUI_CD = '05' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R05,
               CASE WHEN RRL_EQUI_CD = '06' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R06,
               CASE WHEN RRL_EQUI_CD = '07' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R07,
               CASE WHEN RRL_EQUI_CD = '08' AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R08, 
               CASE WHEN RRL_EQUI_CD = '00' AND RRE_USE_YN = 'Y' THEN NVL(RRL_RSVN_CNT,0) ELSE 0 END EQUIP_P00,
               CASE WHEN RRL_EQUI_CD = '01' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P01,
               CASE WHEN RRL_EQUI_CD = '02' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P02,
               CASE WHEN RRL_EQUI_CD = '03' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P03,
               CASE WHEN RRL_EQUI_CD = '04' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P04,
               CASE WHEN RRL_EQUI_CD = '05' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P05,
               CASE WHEN RRL_EQUI_CD = '06' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P06,
               CASE WHEN RRL_EQUI_CD = '07' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P07,
               CASE WHEN RRL_EQUI_CD = '08' AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P08 
          FROM RT_RSVT_EQUIP B, RT_RSVT_EQUIP_LIMIT C
               LEFT OUTER JOIN ET_CLDR_MEMO D
            ON D.ECM_MEMO_DT = C.RRL_EXAM_DT
           AND D.ECM_MEMO_SQ = 0
         WHERE RRL_EXAM_DT BETWEEN :EXAM_DTS AND :EXAM_DTE
           AND RRL_EQUI_CD = RRE_EQUI_CD
           
        IF (:AM_YN = 'Y') THEN
           AND NVL(RRL_TIME_CD, ' ') IN (' ', '1', '2')
        ELSE IF (:PM_YN = 'Y') THEN
           AND NVL(RRL_TIME_CD, ' ') IN (' ', '1', '3')
           
       ) A
 GROUP BY RRL_EXAM_DT
		*/

		sql = " SELECT RRL_EXAM_DT, MAX(ECM_RSVT_TX) ECM_RSVT_TX, MAX(RRL_HOLI_CD) RRL_HOLI_CD, MAX(RRL_HOLI_NM) RRL_HOLI_NM, SUM(EQUIP_R00) R00, SUM(EQUIP_R01) R01, SUM(EQUIP_R02) R02, SUM(EQUIP_R03) R03, SUM(EQUIP_R04) R04, SUM(EQUIP_R05) R05, SUM(EQUIP_R06) R06, SUM(EQUIP_R07) R07, SUM(EQUIP_R08) R08, F_LPAD(CASE WHEN SUM(EQUIP_R00) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R00)) END, 3, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R01) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R01)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R02) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R02)) END, 3, ' ') || ' ' DIS_CNT1, F_LPAD(CASE WHEN SUM(EQUIP_R03) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R03)) END, 3, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R04) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R04)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R05) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R05)) END, 3, ' ') || ' ' DIS_CNT2, F_LPAD(CASE WHEN SUM(EQUIP_R06) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R06)) END, 3, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R07) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R07)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_R08) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_R08)) END, 3, ' ') || ' ' DIS_CNT3, SUM(EQUIP_P00) P00, SUM(EQUIP_P01) P01, SUM(EQUIP_P02) P02, SUM(EQUIP_P03) P03, SUM(EQUIP_P04) P04, SUM(EQUIP_P05) P05, SUM(EQUIP_P06) P06, SUM(EQUIP_P07) P07, SUM(EQUIP_P08) P08, F_LPAD(CASE WHEN SUM(EQUIP_P00) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P00)) END, 3, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_P01) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P01)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_P02) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P02)) END, 3, ' ') || ' ' DIS_PCNT1, F_LPAD(CASE WHEN SUM(EQUIP_P03) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P03)) END, 3, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_P04) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P04)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_P05) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P05)) END, 3, ' ') || ' ' DIS_PCNT2, F_LPAD(CASE WHEN SUM(EQUIP_P06) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P06)) END, 3, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_P07) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P07)) END, 4, ' ') || ' | ' || F_LPAD(CASE WHEN SUM(EQUIP_P08) = 0 THEN ' ' ELSE TO_CHAR(SUM(EQUIP_P08)) END, 3, ' ') || ' ' DIS_PCNT3";
		sql += " FROM (SELECT RRL_EXAM_DT, CASE WHEN ECM_RSVT_TX = ''";
		sql += " OR ECM_RSVT_TX IS NULL THEN 'X' ELSE '★메모' END ECM_RSVT_TX, CASE WHEN RRL_EQUI_CD = '00' THEN RRL_HOLI_CD ELSE '0' END RRL_HOLI_CD, CASE WHEN RRL_EQUI_CD = '00' THEN RRL_HOLI_NM ELSE '' END RRL_HOLI_NM, CASE WHEN RRL_EQUI_CD = '00'";
		sql += " AND RRE_USE_YN = 'Y' THEN NVL(RRL_TOT_CNT, 0) - NVL(RRL_RSVN_CNT,0) ELSE 0 END EQUIP_R00, CASE WHEN RRL_EQUI_CD = '01'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R01, CASE WHEN RRL_EQUI_CD = '02'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R02, CASE WHEN RRL_EQUI_CD = '03'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R03, CASE WHEN RRL_EQUI_CD = '04'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R04, CASE WHEN RRL_EQUI_CD = '05'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R05, CASE WHEN RRL_EQUI_CD = '06'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R06, CASE WHEN RRL_EQUI_CD = '07'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R07, CASE WHEN RRL_EQUI_CD = '08'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_TOT_CNT-RRL_RSVN_CNT ELSE 0 END EQUIP_R08, CASE WHEN RRL_EQUI_CD = '00'";
		sql += " AND RRE_USE_YN = 'Y' THEN NVL(RRL_RSVN_CNT,0) ELSE 0 END EQUIP_P00, CASE WHEN RRL_EQUI_CD = '01'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P01, CASE WHEN RRL_EQUI_CD = '02'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P02, CASE WHEN RRL_EQUI_CD = '03'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P03, CASE WHEN RRL_EQUI_CD = '04'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P04, CASE WHEN RRL_EQUI_CD = '05'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P05, CASE WHEN RRL_EQUI_CD = '06'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P06, CASE WHEN RRL_EQUI_CD = '07'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P07, CASE WHEN RRL_EQUI_CD = '08'";
		sql += " AND RRE_USE_YN = 'Y' THEN RRL_RSVN_CNT ELSE 0 END EQUIP_P08";
		sql += " FROM RT_RSVT_EQUIP B, RT_RSVT_EQUIP_LIMIT C LEFT OUTER JOIN ET_CLDR_MEMO D";
		sql += " ON D.ECM_MEMO_DT = C.RRL_EXAM_DT";
		sql += " AND D.ECM_MEMO_SQ = 0";
		sql += " WHERE RRL_EXAM_DT BETWEEN '" + EXAM_DTS + "'";
		sql += " AND '" + EXAM_DTE + "'";
		sql += " AND RRL_EQUI_CD = RRE_EQUI_CD";

		if(AM_YN.equals("Y")) {
			sql += " AND NVL(RRL_TIME_CD, ' ') IN (' ', '1', '2')";
		} else if(PM_YN.equals("Y")) {
			sql += " AND NVL(RRL_TIME_CD, ' ') IN (' ', '1', '3')";
		}

		sql += " ) A";

		sql += " GROUP BY RRL_EXAM_DT";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Acpt_UP_SetCalendar_001 \n";
			G_INFO += "설명 : 일별 예약장비 현황 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DTS : " + EXAM_DTS + " \n";
			G_INFO += " EXAM_DTE : " + EXAM_DTE + " \n";
			G_INFO += " AM_YN : " + AM_YN + " \n";
			G_INFO += " PM_YN : " + PM_YN + " \n";
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
		<s:AttributeType name='RRL_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECM_RSVT_TX' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='RRL_HOLI_CD' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRL_HOLI_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='R00' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R01' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R02' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R03' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R04' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R05' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R06' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R07' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='R08' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_CNT1' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_CNT2' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_CNT3' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='P00' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='P01' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='P02' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='P03' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='P04' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='P05' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='P06' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='P07' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='P08' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_PCNT1' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_PCNT2' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DIS_PCNT3' rs:number='28' rs:nullable='true'>
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

			String RRL_EXAM_DT_T = cRsList.getString("RRL_EXAM_DT");
			String ECM_RSVT_TX_T = cRsList.getString("ECM_RSVT_TX");
			String RRL_HOLI_CD_T = cRsList.getString("RRL_HOLI_CD");
			String RRL_HOLI_NM_T = cRsList.getString("RRL_HOLI_NM");
			String R00_T = cRsList.getString("R00");
			String R01_T = cRsList.getString("R01");
			String R02_T = cRsList.getString("R02");
			String R03_T = cRsList.getString("R03");
			String R04_T = cRsList.getString("R04");
			String R05_T = cRsList.getString("R05");
			String R06_T = cRsList.getString("R06");
			String R07_T = cRsList.getString("R07");
			String R08_T = cRsList.getString("R08");
			String DIS_CNT1_T = cRsList.getString("DIS_CNT1");
			String DIS_CNT2_T = cRsList.getString("DIS_CNT2");
			String DIS_CNT3_T = cRsList.getString("DIS_CNT3");
			String P00_T = cRsList.getString("P00");
			String P01_T = cRsList.getString("P01");
			String P02_T = cRsList.getString("P02");
			String P03_T = cRsList.getString("P03");
			String P04_T = cRsList.getString("P04");
			String P05_T = cRsList.getString("P05");
			String P06_T = cRsList.getString("P06");
			String P07_T = cRsList.getString("P07");
			String P08_T = cRsList.getString("P08");
			String DIS_PCNT1_T = cRsList.getString("DIS_PCNT1");
			String DIS_PCNT2_T = cRsList.getString("DIS_PCNT2");
			String DIS_PCNT3_T = cRsList.getString("DIS_PCNT3");
%>
			<z:row
<%
			if(! RRL_EXAM_DT_T.equals("")) {
%>
		 		RRL_EXAM_DT='<%= RRL_EXAM_DT_T%>'
<%
			}

			if(! ECM_RSVT_TX_T.equals("")) {
%>
		 		ECM_RSVT_TX='<%= ECM_RSVT_TX_T%>'
<%
			}

			if(! RRL_HOLI_CD_T.equals("")) {
%>
		 		RRL_HOLI_CD='<%= RRL_HOLI_CD_T%>'
<%
			}

			if(! RRL_HOLI_NM_T.equals("")) {
%>
		 		RRL_HOLI_NM='<%= RRL_HOLI_NM_T%>'
<%
			}

			if(! R00_T.equals("")) {
%>
		 		R00='<%= R00_T%>'
<%
			}

			if(! R01_T.equals("")) {
%>
		 		R01='<%= R01_T%>'
<%
			}

			if(! R02_T.equals("")) {
%>
		 		R02='<%= R02_T%>'
<%
			}

			if(! R03_T.equals("")) {
%>
		 		R03='<%= R03_T%>'
<%
			}

			if(! R04_T.equals("")) {
%>
		 		R04='<%= R04_T%>'
<%
			}

			if(! R05_T.equals("")) {
%>
		 		R05='<%= R05_T%>'
<%
			}

			if(! R06_T.equals("")) {
%>
		 		R06='<%= R06_T%>'
<%
			}

			if(! R07_T.equals("")) {
%>
		 		R07='<%= R07_T%>'
<%
			}

			if(! R08_T.equals("")) {
%>
		 		R08='<%= R08_T%>'
<%
			}

			if(! DIS_CNT1_T.equals("")) {
%>
		 		DIS_CNT1='<%= DIS_CNT1_T%>'
<%
			}

			if(! DIS_CNT2_T.equals("")) {
%>
		 		DIS_CNT2='<%= DIS_CNT2_T%>'
<%
			}

			if(! DIS_CNT3_T.equals("")) {
%>
		 		DIS_CNT3='<%= DIS_CNT3_T%>'
<%
			}

			if(! P00_T.equals("")) {
%>
		 		P00='<%= P00_T%>'
<%
			}

			if(! P01_T.equals("")) {
%>
		 		P01='<%= P01_T%>'
<%
			}

			if(! P02_T.equals("")) {
%>
		 		P02='<%= P02_T%>'
<%
			}

			if(! P03_T.equals("")) {
%>
		 		P03='<%= P03_T%>'
<%
			}

			if(! P04_T.equals("")) {
%>
		 		P04='<%= P04_T%>'
<%
			}

			if(! P05_T.equals("")) {
%>
		 		P05='<%= P05_T%>'
<%
			}

			if(! P06_T.equals("")) {
%>
		 		P06='<%= P06_T%>'
<%
			}

			if(! P07_T.equals("")) {
%>
		 		P07='<%= P07_T%>'
<%
			}

			if(! P08_T.equals("")) {
%>
		 		P08='<%= P08_T%>'
<%
			}

			if(! DIS_PCNT1_T.equals("")) {
%>
		 		DIS_PCNT1='<%= DIS_PCNT1_T%>'
<%
			}

			if(! DIS_PCNT2_T.equals("")) {
%>
		 		DIS_PCNT2='<%= DIS_PCNT2_T%>'
<%
			}

			if(! DIS_PCNT3_T.equals("")) {
%>
		 		DIS_PCNT3='<%= DIS_PCNT3_T%>'
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
