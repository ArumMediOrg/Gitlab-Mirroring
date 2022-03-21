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

		/*

select *
from (
      SELECT EVA ,SUM(NVL(AA,0)) aa,SUM(NVL(AB,0)) bb,SUM(NVL(BA,0)) cc,SUM(NVL(BB,0)) dd,
             SUM(NVL(CA,0)) ee,SUM(NVL(CB,0)) ff,SUM(NVL(DA,0)) gg,SUM(NVL(DB,0)) hh
      FROM(
           SELECT EVA,CASE WHEN WY < 1 THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END AA,
                  CASE WHEN WY < 1 THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END AB,
                  CASE  WHEN WY >= 1 AND WY <= 4  THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END BA,
                  CASE  WHEN WY >= 1 AND WY <= 4  THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END BB,
                  CASE  WHEN WY >= 5 AND WY <= 9  THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END CA,
                  CASE  WHEN WY >= 5 AND WY <= 9  THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END CB,
                  CASE  WHEN WY >= 10  THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END DA,
                  CASE  WHEN WY >= 10  THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END DB
           FROM (
                 SELECT *
                 FROM (
                       SELECT PlP_EXAM_DT,PLP_EXAM_SQ,rtrim(ltrim(FN_splitValue(PLP_JLPN_SHDS, ',','1'))) COL1,
                              FN_splitValue(PLP_JLPN_SHDS, ',','2') COL2,
                              FN_splitValue(PLP_JLPN_SHDS, ',','3') COL3,
                              FN_splitValue(PLP_JLPN_SHDS, ',', '4') COL4,
                              FN_splitValue(PLP_JLPN_SHDS, ',','5') COL5, EEA_SEX_CD,EEA_PSNL_AGE,
                              TRUNC((TO_DATE(EEA_EXAM_DT, 'YYYY-MM-DD') - TO_DATE(case when NVL(EEA_ENTRY_DT,' ') = ' ' then EEA_EXAM_DT else EEA_ENTRY_DT end, 'YYYY-MM-DD')) / 365) WY
                       FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B ON A.PlP_EXAM_DT=B.EEA_EXAM_DT AND  A.PLP_EXAM_SQ=B.EEA_EXAM_SQ
                                               INNER JOIN IT_CUSTOMER  C ON B.EEA_CUST_NO =C.ICR_CUST_NO
                       where EEA_EXAM_DT>=:dp_fromdt and EEA_EXAM_DT<=:dp_todt
                             AND NVL(EEA_HTSB_CD, ' ') <> ' '
                             AND  EEA_COMP_CD=:COMP_CD

if :cbDept_CdText <> '' then
                             AND EEA_DEPT_CD = :cbDept_CdValue

if :RzCmb_mekd1 <> '' then
                             AND  EEA_FAMY_CD = :RzCmb_mekd2

if :RzCmb_chgbn = '1' then
                             AND EEA_HDMD_YN = 'Y'
else if :RzCmb_chgbn = '2' then
                             AND EEA_HDMD_YN = 'N'

if :RzCmb_place1_1 <> '' then
                             AND SUBSTR(EEA_PLCE_CD, 1, 1) = :RzCmb_place.Text1_2

if :RzCmb_place2_1 <> '' then
                             AND EEA_PLCE_CD = :RzCmb_place2_2

                             AND  NVL(PLP_JLPN_SHDS, ' ') <> ' '
                      )  t
               UNPIVOT (EVA FOR NUM IN (COL1, COL2, COL3, COL4, COL5)) FF
                 WHERE NVL(EVA, ' ') <> ' '
                ) DD
           GROUP BY  EVA,EEA_SEX_CD,WY
          ) GG
      GROUP BY EVA
     ) a left outer join
     (
      SELECT EVA ,SUM(NVL(AA,0)) ii,SUM(NVL(AB,0)) jj,SUM(NVL(BA,0)) kk,
             SUM(NVL(BB,0)) ll,SUM(NVL(CA,0)) mm,SUM(NVL(CB,0)) nn,SUM(NVL(DA,0)) oo,SUM(NVL(DB,0)) pp
      FROM(
           SELECT EVA,CASE WHEN EEA_PSNL_AGE < 30 THEN
                  CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END AA,
                  CASE WHEN EEA_PSNL_AGE < 30 THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END AB,
                  CASE  WHEN EEA_PSNL_AGE >= 30 AND EEA_PSNL_AGE <= 39  THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END BA,
                  CASE  WHEN EEA_PSNL_AGE >= 30 AND EEA_PSNL_AGE <= 39  THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END BB,
                  CASE  WHEN EEA_PSNL_AGE >= 40 AND EEA_PSNL_AGE <= 49  THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END CA,
                  CASE  WHEN EEA_PSNL_AGE >= 40 AND EEA_PSNL_AGE <= 49  THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END CB,
                  CASE  WHEN EEA_PSNL_AGE >= 50 THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END DA,
                  CASE  WHEN EEA_PSNL_AGE >= 50  THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END DB
           FROM (
                 SELECT *
                 FROM (
                       SELECT PlP_EXAM_DT,PLP_EXAM_SQ,rtrim(ltrim(FN_splitValue(PLP_JLPN_SHDS, ',','1'))) COL1,
                              FN_splitValue(PLP_JLPN_SHDS, ',','2') COL2,
                              FN_splitValue(PLP_JLPN_SHDS, ',','3') COL3,
                              FN_splitValue(PLP_JLPN_SHDS, ',','4') COL4,
                              FN_splitValue(PLP_JLPN_SHDS, ',','5') COL5,  EEA_SEX_CD,EEA_PSNL_AGE,
                              TRUNC((TO_DATE(EEA_EXAM_DT, 'YYYY-MM-DD') - TO_DATE(case when NVL(EEA_ENTRY_DT,' ') = ' ' then EEA_EXAM_DT else EEA_ENTRY_DT end, 'YYYY-MM-DD')) / 365) WY
                       FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B ON A.PlP_EXAM_DT=B.EEA_EXAM_DT AND  A.PLP_EXAM_SQ=B.EEA_EXAM_SQ
                                               INNER JOIN IT_CUSTOMER  C ON B.EEA_CUST_NO =C.ICR_CUST_NO
                       where EEA_EXAM_DT>=:dp_fromdt and EEA_EXAM_DT<=:dp_todt AND NVL(EEA_HTSB_CD, ' ') <> ' '
                             AND EEA_COMP_CD=:COMP_CD

if :cbDept_CdText <> '' then
                             AND EEA_DEPT_CD = :cbDept_CdValue

if :RzCmb_mekd1 <> '' then
                             AND  EEA_FAMY_CD = :RzCmb_mekd2

if :RzCmb_chgbn = '1' then
                             AND EEA_HDMD_YN = 'Y'
else if :RzCmb_chgbn = '2' then
                             AND EEA_HDMD_YN = 'N'

if :RzCmb_place1_1 <> '' then
                             AND SUBSTR(EEA_PLCE_CD, 1, 1) = :RzCmb_place1_2

if :RzCmb_place2_1.Text <> '' then
                             AND EEA_PLCE_CD = :RzCmb_place2_2

                             AND  NVL(PLP_JLPN_SHDS, ' ') <> ' '
                      )  t
               UNPIVOT (EVA FOR NUM IN (COL1, COL2, COL3, COL4, COL5)) FF
                 WHERE NVL(EVA, ' ') <> ' '
                ) DD
           GROUP BY  EVA,EEA_SEX_CD,EEA_PSNL_AGE
          ) GG
      GROUP BY EVA
     ) b on a.eva=b.eva

		*/

		sql = " SELECT *";
		sql += " FROM (";
		sql += "	SELECT EVA ,SUM(NVL(AA,0)) AA,SUM(NVL(AB,0)) BB,SUM(NVL(BA,0)) CC,SUM(NVL(BB,0)) DD, SUM(NVL(CA,0)) EE,SUM(NVL(CB,0)) FF,SUM(NVL(DA,0)) GG,SUM(NVL(DB,0)) HH FROM(";
		sql += "		SELECT EVA";
		sql += "		, CASE WHEN WY < 1 THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END AA";
		sql += "		, CASE WHEN WY < 1 THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END AB";
		sql += "		, CASE WHEN WY >= 1 AND WY <= 4 THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END BA";
		sql += "		, CASE WHEN WY >= 1 AND WY <= 4 THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END BB";
		sql += "		, CASE WHEN WY >= 5 AND WY <= 9 THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END CA";
		sql += "		, CASE WHEN WY >= 5 AND WY <= 9 THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END CB";
		sql += "		, CASE WHEN WY >= 10 THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END DA";
		sql += "		, CASE WHEN WY >= 10 THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END DB";
		sql += " 		FROM (";
		sql += "			SELECT *";
		sql += " 			FROM (";
		sql += "				SELECT PLP_EXAM_DT,PLP_EXAM_SQ,RTRIM(LTRIM(FN_SPLITVALUE(PLP_JLPN_SHDS, ',','1'))) COL1, FN_SPLITVALUE(PLP_JLPN_SHDS, ',','2') COL2, FN_SPLITVALUE(PLP_JLPN_SHDS, ',','3') COL3, FN_SPLITVALUE(PLP_JLPN_SHDS, ',', '4') COL4, FN_SPLITVALUE(PLP_JLPN_SHDS, ',','5') COL5, EEA_SEX_CD,EEA_PSNL_AGE, TRUNC((TO_DATE(EEA_EXAM_DT, 'YYYY-MM-DD') - TO_DATE(CASE WHEN NVL(EEA_ENTRY_DT,' ') = ' ' THEN EEA_EXAM_DT ELSE EEA_ENTRY_DT END, 'YYYY-MM-DD')) / 365) WY";
		sql += " 				FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B";
		sql += " 				ON A.PLP_EXAM_DT=B.EEA_EXAM_DT";
		sql += " 				AND A.PLP_EXAM_SQ=B.EEA_EXAM_SQ";

		sql += "				INNER JOIN IT_CUSTOMER C";
		sql += " 				ON B.EEA_CUST_NO =C.ICR_CUST_NO";

		sql += " 				WHERE EEA_EXAM_DT>='" + DP_FROMDT + "'";
		sql += " 				AND EEA_EXAM_DT<='" + DP_TODT + "'";
		sql += " 				AND NVL(EEA_HTSB_CD, ' ') <> ' '";
		sql += " 				AND EEA_COMP_CD='" + COMP_CD + "'";

		if(!CBDEPT_CDTEXT.equals("")) {
			sql += " 			AND EEA_DEPT_CD = '" + CBDEPT_CDVALUE + "'";
		}

		if(!RZCMB_MEKD1.equals("")) {
			sql += " 			AND EEA_FAMY_CD = '" + RZCMB_MEKD2 + "'";
		}

		if(RZCMB_CHGBN.equals("1")) {
			sql += " 			AND EEA_HDMD_YN = 'Y'";
		}
		else if(RZCMB_CHGBN.equals("2")) {
			sql += " 			AND EEA_HDMD_YN = 'N'";
		}

		if(!RZCMB_PLACE1_1.equals("")) {
			sql += " 			AND SUBSTR(EEA_PLCE_CD, 1, 1) = '" + RZCMB_PLACE1_2 + "'";
		}

		if(!RZCMB_PLACE2_1.equals("")) {
			sql += " 			AND EEA_PLCE_CD = '" + RZCMB_PLACE2_2 + "'";
		}

		sql += " 				AND NVL(PLP_JLPN_SHDS, ' ') <> ' '";
		sql += "			) UNPIVOT (EVA FOR NUM IN (COL1, COL2, COL3, COL4, COL5)) FF";
		sql += " 			WHERE NVL(EVA, ' ') <> ' '";
		sql += "		) DD";
		sql += " 		GROUP BY EVA,EEA_SEX_CD,WY";
		sql += "	) GG";
		sql += " 	GROUP BY EVA";
		sql += " ) A LEFT OUTER JOIN (";
		sql += "	SELECT EVA ,SUM(NVL(AA,0)) II,SUM(NVL(AB,0)) JJ,SUM(NVL(BA,0)) KK, SUM(NVL(BB,0)) LL,SUM(NVL(CA,0)) MM,SUM(NVL(CB,0)) NN,SUM(NVL(DA,0)) OO,SUM(NVL(DB,0)) PP";
		sql += "	FROM (";
		sql += "		SELECT EVA,CASE WHEN EEA_PSNL_AGE < 30 THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END AA, CASE WHEN EEA_PSNL_AGE < 30 THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END AB, CASE WHEN EEA_PSNL_AGE >= 30";
		sql += " AND EEA_PSNL_AGE <= 39 THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END BA, CASE WHEN EEA_PSNL_AGE >= 30";
		sql += " AND EEA_PSNL_AGE <= 39 THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END BB, CASE WHEN EEA_PSNL_AGE >= 40";
		sql += " AND EEA_PSNL_AGE <= 49 THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END CA, CASE WHEN EEA_PSNL_AGE >= 40";
		sql += " AND EEA_PSNL_AGE <= 49 THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END CB, CASE WHEN EEA_PSNL_AGE >= 50 THEN CASE WHEN EEA_SEX_CD='1' THEN COUNT(*) END END DA, CASE WHEN EEA_PSNL_AGE >= 50 THEN CASE WHEN EEA_SEX_CD='2' THEN COUNT(*) END END DB";
		sql += " FROM ( SELECT *";
		sql += " FROM ( SELECT PLP_EXAM_DT,PLP_EXAM_SQ,RTRIM(LTRIM(FN_SPLITVALUE(PLP_JLPN_SHDS, ',','1'))) COL1, FN_SPLITVALUE(PLP_JLPN_SHDS, ',','2') COL2, FN_SPLITVALUE(PLP_JLPN_SHDS, ',','3') COL3, FN_SPLITVALUE(PLP_JLPN_SHDS, ',','4') COL4, FN_SPLITVALUE(PLP_JLPN_SHDS, ',','5') COL5, EEA_SEX_CD,EEA_PSNL_AGE, TRUNC((TO_DATE(EEA_EXAM_DT, 'YYYY-MM-DD') - TO_DATE(CASE WHEN NVL(EEA_ENTRY_DT,' ') = ' ' THEN EEA_EXAM_DT ELSE EEA_ENTRY_DT END, 'YYYY-MM-DD')) / 365) WY";
		sql += " FROM PT_LABOR_PANJUNG A INNER JOIN ET_EXAM_ACPT B";
		sql += " ON A.PLP_EXAM_DT=B.EEA_EXAM_DT";
		sql += " AND A.PLP_EXAM_SQ=B.EEA_EXAM_SQ INNER JOIN IT_CUSTOMER C";
		sql += " ON B.EEA_CUST_NO =C.ICR_CUST_NO";
		sql += " WHERE EEA_EXAM_DT>='" + DP_FROMDT + "'";
		sql += " AND EEA_EXAM_DT<='" + DP_TODT + "'";
		sql += " AND NVL(EEA_HTSB_CD, ' ') <> ' '";
		sql += " AND EEA_COMP_CD='" + COMP_CD + "'";

		if(!CBDEPT_CDTEXT.equals("")) {
			sql += " AND EEA_DEPT_CD = '" + CBDEPT_CDVALUE + "'";
		}

		if(!RZCMB_MEKD1.equals("")) {
			sql += " AND EEA_FAMY_CD = '" + RZCMB_MEKD2 + "'";
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

		sql += " AND NVL(PLP_JLPN_SHDS, ' ') <> ' ' ) UNPIVOT (EVA FOR NUM IN (COL1, COL2, COL3, COL4, COL5)) FF";
		sql += " WHERE NVL(EVA, ' ') <> ' ' ) DD";
		sql += " GROUP BY EVA,EEA_SEX_CD,EEA_PSNL_AGE ) GG";
		sql += " GROUP BY EVA ) B";
		sql += " ON A.EVA=B.EVA";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHERESULTPRT_UDP_SEL_JILVIEW_001 \n";
			G_INFO += "설명 : 질병정보 로딩 \n";
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
		<s:AttributeType name='EVA' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='AA' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BB' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CC' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DD' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='EE' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='FF' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='GG' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='HH' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='c9' rs:name='EVA' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='II' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='JJ' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='KK' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='LL' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='MM' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='NN' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='OO' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='PP' rs:number='18' rs:nullable='true'>
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

			String EVA_T = cRsList.getString("EVA");
			String AA_T = cRsList.getString("AA");
			String BB_T = cRsList.getString("BB");
			String CC_T = cRsList.getString("CC");
			String DD_T = cRsList.getString("DD");
			String EE_T = cRsList.getString("EE");
			String FF_T = cRsList.getString("FF");
			String GG_T = cRsList.getString("GG");
			String HH_T = cRsList.getString("HH");
			String c9_T = cRsList.getString("c9");
			String II_T = cRsList.getString("II");
			String JJ_T = cRsList.getString("JJ");
			String KK_T = cRsList.getString("KK");
			String LL_T = cRsList.getString("LL");
			String MM_T = cRsList.getString("MM");
			String NN_T = cRsList.getString("NN");
			String OO_T = cRsList.getString("OO");
			String PP_T = cRsList.getString("PP");
%>
			<z:row
<%
			if(! EVA_T.equals("")) {
%>
		 		EVA='<%= EVA_T%>'
<%
			}

			if(! AA_T.equals("")) {
%>
		 		AA='<%= AA_T%>'
<%
			}

			if(! BB_T.equals("")) {
%>
		 		BB='<%= BB_T%>'
<%
			}

			if(! CC_T.equals("")) {
%>
		 		CC='<%= CC_T%>'
<%
			}

			if(! DD_T.equals("")) {
%>
		 		DD='<%= DD_T%>'
<%
			}

			if(! EE_T.equals("")) {
%>
		 		EE='<%= EE_T%>'
<%
			}

			if(! FF_T.equals("")) {
%>
		 		FF='<%= FF_T%>'
<%
			}

			if(! GG_T.equals("")) {
%>
		 		GG='<%= GG_T%>'
<%
			}

			if(! HH_T.equals("")) {
%>
		 		HH='<%= HH_T%>'
<%
			}

			if(! c9_T.equals("")) {
%>
		 		c9='<%= c9_T%>'
<%
			}

			if(! II_T.equals("")) {
%>
		 		II='<%= II_T%>'
<%
			}

			if(! JJ_T.equals("")) {
%>
		 		JJ='<%= JJ_T%>'
<%
			}

			if(! KK_T.equals("")) {
%>
		 		KK='<%= KK_T%>'
<%
			}

			if(! LL_T.equals("")) {
%>
		 		LL='<%= LL_T%>'
<%
			}

			if(! MM_T.equals("")) {
%>
		 		MM='<%= MM_T%>'
<%
			}

			if(! NN_T.equals("")) {
%>
		 		NN='<%= NN_T%>'
<%
			}

			if(! OO_T.equals("")) {
%>
		 		OO='<%= OO_T%>'
<%
			}

			if(! PP_T.equals("")) {
%>
		 		PP='<%= PP_T%>'
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
