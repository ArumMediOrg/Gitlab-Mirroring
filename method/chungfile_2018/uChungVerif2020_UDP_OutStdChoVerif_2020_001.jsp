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

		String DTEFROMDT = htMethod.get("DTEFROMDT");
		String DTETODT = htMethod.get("DTETODT");
		String CMBCHUNGYYYY = htMethod.get("CMBCHUNGYYYY");
		String SSQL_ADD1 = htMethod.get("SSQL_ADD1");
		String SSQL_ADD2 = htMethod.get("SSQL_ADD2");

		//
		if(DTEFROMDT == null) { DTEFROMDT = ""; }
		if(DTETODT == null) { DTETODT = ""; }
		if(CMBCHUNGYYYY == null) { CMBCHUNGYYYY = ""; }
		if(SSQL_ADD1 == null) { SSQL_ADD1 = ""; }
		if(SSQL_ADD2 == null) { SSQL_ADD2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT  *
FROM
  (
  SELECT ERI_EXAM_DT, F_RPAD(NVL(EEA_CNTR_CD,''),11,' ') EEA_CNTR_CD,
         ERI_EXAM_SQ,
        '2' ITEM0,
         EEA_MNGT_HTYR      ,
       ICR_PID_EN, ICR_PENL_ID ,
         EEA_INSU_NO        ,
         MAX(S8)      S8    ,
         MAX(BZ109)   BZ109 ,
         MAX(vdrl)    vdrl  ,
         MAX(S9)      S9    ,
         MAX(S10)     S10   ,
         MAX(BD038)   BD038 ,
         MAX(HIV)     HIV   ,
         MAX(S11)     S11   ,
         MAX(BD201)   BD201 ,
         MAX(BD202)   BD202
  FROM(
     SELECT ERI_EXAM_DT, ERI_EXAM_SQ, EEA_MNGT_HTYR, ICR_PID_EN, ICR_PENL_ID,
         EEA_INSU_NO, EEA_CNTR_CD,
         CASE  WHEN  ERI_ITEM_CD='BZ109' AND ERI_RSLT_VL<>'' THEN  '2'
                WHEN  ERI_ITEM_CD='BZ101' AND ERI_RSLT_VL<>'' THEN  '1'
         END S8, --매독검사유형'
         CASE WHEN ERI_ITEM_CD IN('BZ109','BZ101') THEN ERI_HERT_CD  END  BZ109,
         CASE WHEN ERI_ITEM_CD='BZ109' THEN ERI_PRNM_VL  END  vdrl,
         CASE WHEN  ERI_ITEM_CD='BZ109' AND ERI_PRNM_VL<>'' THEN  (SELECT  IHL_SVP_NO FROM IT_HOSPITAL )
         ELSE '' END  S9, -- '매독기준치'
         CASE  WHEN  ERI_ITEM_CD='BD038' AND ERI_RSLT_VL<>'' THEN  '2'
         END S10, --aids검사유형'
         CASE WHEN ERI_ITEM_CD IN('BD038') THEN ERI_HERT_CD  END  BD038,
         CASE WHEN ERI_ITEM_CD='BD038' THEN ERI_PRNM_VL  END  HIV,
         CASE WHEN  ERI_ITEM_CD='BD038' AND ERI_PRNM_VL<>'' THEN  (SELECT  IHL_HIV_NO FROM IT_HOSPITAL )
         ELSE '' END  S11, -- 'aids기준치'
         CASE WHEN ERI_ITEM_CD IN('BD201') THEN ERI_HERT_CD  END  BD201,     --클라미디아
         CASE WHEN ERI_ITEM_CD IN('BD202') THEN ERI_HERT_CD  END  BD202      --임질
     FROM    ET_RSLT_ITEM A
             LEFT OUTER JOIN ET_EXAM_ACPT B    ON A.ERI_EXAM_DT=B.EEA_EXAM_DT AND A.ERI_EXAM_SQ=B.EEA_EXAM_SQ
             LEFT OUTER JOIN IT_CUSTOMER  D    ON B.EEA_CUST_NO=D.ICR_CUST_NO
             LEFT OUTER JOIN BT_BILLHN_PR E    ON B.EEA_EXAM_DT=E.BBP_EXAM_DT AND B.EEA_EXAM_SQ=E.BBP_EXAM_SQ  AND  E.BBP_CHUNG_KD='53'
     WHERE B.EEA_EXAM_DT >= :dteFromDt AND B.EEA_EXAM_DT <= :dteToDt AND NVL(B.EEA_RECE_NO, '') <> 'R'
       AND EEA_MNGT_HTYR = :cmbChungYyyy AND  EEA_EXAM_CD in('31006') and EEA_HDMD_YN='Y'   AND EEA_ORDER_YN<>'C' and ERI_CNCL_YN <>'Y'
       AND eea_canad_yn ='Y'

       || :sSQL_ADD1

    )  DDD
       GROUP BY ERI_EXAM_DT, ERI_EXAM_SQ,EEA_MNGT_HTYR,ICR_PENL_ID,EEA_INSU_NO,icr_pid_en , EEA_CNTR_CD
  ) T1
        right outer join (
  SELECT EEA_EXAM_DT, EEA_EXAM_SQ,EEA_PSNL_NM,  EEA_SEND_CD,
        (select sum(eep_add_pr) eep_add_pr from et_exam_price where eep_exam_dt = EEA_EXAM_DT and eep_exam_sq = EEA_EXAM_SQ) EEA_HLTHR_PR,
         ESO_ADD_VIEW     ,
         REPLACE(ESO_EXAM_DT,'-','')    ESO_EXAM_DT,
         REPLACE(ESO_EPNJN_DT,'-','')   ESO_EPNJN_DT,
         case when SUBSTR(EEA_PLCE_CD,1,1)='1' Then '2' else '1' end  EEA_PLCE_CD,
         '3' SENDGBN , eea_canad_yn,eea_uter_cd,
         REPLACE(ESO_EIFRM_DT,'-','')  ESO_EIFRM_DT,
         ESO_EXAM_DR,
         IAU_LICEN1_NO ,
         IAU_PENL_NM   ,
         IAU_PENL_ID
   FROM ET_STDT_PNJNO A
     LEFT OUTER JOIN ET_EXAM_ACPT B  ON A.ESO_EXAM_DT=B.EEA_EXAM_DT  AND A.ESO_EXAM_SQ=B.EEA_EXAM_SQ
     LEFT OUTER JOIN IT_CUSTOMER C   ON B.EEA_CUST_NO=C.ICR_CUST_NO
     LEFT OUTER JOIN IT_AUTH_USER D  ON A.ESO_EXAM_DR =D.IAU_EMP_NO
     LEFT OUTER JOIN BT_BILLHN_PR E  ON B.EEA_EXAM_DT=E.BBP_EXAM_DT AND B.EEA_EXAM_SQ=E.BBP_EXAM_SQ  AND  E.BBP_CHUNG_KD='53'
     LEFT OUTER JOIN (SELECT  QQN_EXAM_DT, QQN_EXAM_SQ, '1' MUNYN  FROM  QT_QUESTION   group by QQN_EXAM_DT, QQN_EXAM_SQ) F ON A.ESO_EXAM_DT=F.QQN_EXAM_DT  AND A.ESO_EXAM_SQ=F.QQN_EXAM_SQ
  WHERE B.EEA_EXAM_DT >= :dteFromDt AND B.EEA_EXAM_DT <= :dteToDt AND NVL(B.EEA_RECE_NO, ' ') <> 'R'
     AND B.EEA_EXAM_CD in('31006')   AND B.EEA_HDMD_YN='Y'   AND  A.ESO_EPNJN_YN='Y'    AND B.eea_order_yn<>'C' AND NVL(B.EEA_RECE_NO, '') <> 'R'

     || :sSQL_ADD2

  ) T2
  ON T1.ERI_EXAM_DT=T2.EEA_EXAM_DT   AND T1.ERI_EXAM_SQ =T2.EEA_EXAM_SQ
		*/

		sql = " SELECT *";
		sql += " FROM (";
		sql += "	SELECT ERI_EXAM_DT, F_RPAD(NVL(EEA_CNTR_CD,''),11,' ') EEA_CNTR_CD, ERI_EXAM_SQ, '2' ITEM0, EEA_MNGT_HTYR , ICR_PID_EN, ICR_PENL_ID , EEA_INSU_NO , MAX(S8) S8 , MAX(BZ109) BZ109 , MAX(VDRL) VDRL , MAX(S9) S9 , MAX(S10) S10 , MAX(BD038) BD038 , MAX(HIV) HIV , MAX(S11) S11 , MAX(BD201) BD201 , MAX(BD202) BD202";
		sql += "	FROM (";
		sql += "		SELECT ERI_EXAM_DT, ERI_EXAM_SQ, EEA_MNGT_HTYR, ICR_PID_EN, ICR_PENL_ID, EEA_INSU_NO, EEA_CNTR_CD";
		sql += "		, CASE WHEN ERI_ITEM_CD='BZ109' AND ERI_RSLT_VL<>'' THEN '2' WHEN ERI_ITEM_CD='BZ101' AND ERI_RSLT_VL<>'' THEN '1' END S8";
		sql += "		, CASE WHEN ERI_ITEM_CD IN('BZ109','BZ101') THEN ERI_HERT_CD END BZ109";
		sql += "		, CASE WHEN ERI_ITEM_CD='BZ109' THEN ERI_PRNM_VL END VDRL";
		sql += "		, CASE WHEN ERI_ITEM_CD='BZ109' AND ERI_PRNM_VL <>'' THEN (SELECT IHL_SVP_NO FROM IT_HOSPITAL ) ELSE '' END S9";
		sql += "		, CASE WHEN ERI_ITEM_CD='BD038' AND ERI_RSLT_VL <>'' THEN '2' END S10";
		sql += "		, CASE WHEN ERI_ITEM_CD IN('BD038') THEN ERI_HERT_CD END BD038";
		sql += "		, CASE WHEN ERI_ITEM_CD='BD038' THEN ERI_PRNM_VL END HIV";
		sql += "		, CASE WHEN ERI_ITEM_CD='BD038' AND ERI_PRNM_VL <>'' THEN (SELECT IHL_HIV_NO FROM IT_HOSPITAL ) ELSE '' END S11";
		sql += "		, CASE WHEN ERI_ITEM_CD IN('BD201') THEN ERI_HERT_CD END BD201";
		sql += "		, CASE WHEN ERI_ITEM_CD IN('BD202') THEN ERI_HERT_CD END BD202";
		sql += " 		FROM ET_RSLT_ITEM A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " 		ON A.ERI_EXAM_DT=B.EEA_EXAM_DT";
		sql += " 		AND A.ERI_EXAM_SQ=B.EEA_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER D";
		sql += " 		ON B.EEA_CUST_NO=D.ICR_CUST_NO LEFT OUTER JOIN BT_BILLHN_PR E";
		sql += " 		ON B.EEA_EXAM_DT=E.BBP_EXAM_DT";
		sql += " 		AND B.EEA_EXAM_SQ=E.BBP_EXAM_SQ";
		sql += " 		AND E.BBP_CHUNG_KD='53'";
		sql += " 		WHERE B.EEA_EXAM_DT >= '" + DTEFROMDT + "'";
		sql += " 		AND B.EEA_EXAM_DT <= '" + DTETODT + "'";
		sql += " 		AND NVL(B.EEA_RECE_NO, '') <> 'R'";
		sql += " 		AND EEA_MNGT_HTYR = '" + CMBCHUNGYYYY + "'";
		sql += " 		AND EEA_EXAM_CD IN('31006')";
		sql += " 		AND EEA_HDMD_YN='Y'";
		sql += " 		AND EEA_ORDER_YN<>'C'";
		sql += " 		AND ERI_CNCL_YN <>'Y'";
		sql += " 		AND EEA_CANAD_YN ='Y' " + SSQL_ADD1;
		sql += "	) DDD";
		sql += "	GROUP BY ERI_EXAM_DT, ERI_EXAM_SQ,EEA_MNGT_HTYR,ICR_PENL_ID,EEA_INSU_NO,ICR_PID_EN , EEA_CNTR_CD";
		sql += ") T1 RIGHT OUTER JOIN (";
		sql += "	SELECT EEA_EXAM_DT, EEA_EXAM_SQ,EEA_PSNL_NM, EEA_SEND_CD";
		sql += "	, (";
		sql += "		SELECT SUM(EEP_ADD_PR) EEP_ADD_PR";
		sql += "		FROM ET_EXAM_PRICE";
		sql += "		WHERE EEP_EXAM_DT = EEA_EXAM_DT";
		sql += "		AND EEP_EXAM_SQ = EEA_EXAM_SQ";
		sql += "	) EEA_HLTHR_PR";
		sql += "	, ESO_ADD_VIEW , REPLACE(ESO_EXAM_DT,'-','') ESO_EXAM_DT, REPLACE(ESO_EPNJN_DT,'-','') ESO_EPNJN_DT";
		sql += "	, CASE WHEN SUBSTR(EEA_PLCE_CD,1,1)='1' THEN '2' ELSE '1' END EEA_PLCE_CD";
		sql += "	, '3' SENDGBN , EEA_CANAD_YN,EEA_UTER_CD, REPLACE(ESO_EIFRM_DT,'-','') ESO_EIFRM_DT, ESO_EXAM_DR, IAU_LICEN1_NO , IAU_PENL_NM , IAU_PENL_ID";
		sql += "	FROM ET_STDT_PNJNO A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += "	ON A.ESO_EXAM_DT=B.EEA_EXAM_DT";
		sql += "	AND A.ESO_EXAM_SQ=B.EEA_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER C";
		sql += "	ON B.EEA_CUST_NO=C.ICR_CUST_NO LEFT OUTER JOIN IT_AUTH_USER D";
		sql += "	ON A.ESO_EXAM_DR =D.IAU_EMP_NO LEFT OUTER JOIN BT_BILLHN_PR E";
		sql += "	ON B.EEA_EXAM_DT=E.BBP_EXAM_DT";
		sql += "	AND B.EEA_EXAM_SQ=E.BBP_EXAM_SQ";
		sql += "	AND E.BBP_CHUNG_KD='53'";
		sql += "	LEFT OUTER JOIN (";
		sql += "		SELECT QQN_EXAM_DT, QQN_EXAM_SQ, '1' MUNYN";
		sql += " 		FROM QT_QUESTION";
		sql += " 		GROUP BY QQN_EXAM_DT, QQN_EXAM_SQ";
		sql += "	) F";
		sql += " 	ON A.ESO_EXAM_DT=F.QQN_EXAM_DT";
		sql += " 	AND A.ESO_EXAM_SQ=F.QQN_EXAM_SQ";
		sql += " 	WHERE B.EEA_EXAM_DT >= '" + DTEFROMDT + "'";
		sql += " 	AND B.EEA_EXAM_DT <= '" + DTETODT + "'";
		sql += " 	AND NVL(B.EEA_RECE_NO, ' ') <> 'R'";
		sql += " 	AND B.EEA_EXAM_CD IN('31006')";
		sql += " 	AND B.EEA_HDMD_YN='Y'";
		sql += " 	AND A.ESO_EPNJN_YN='Y'";
		sql += " 	AND B.EEA_ORDER_YN<>'C'";
		sql += " 	AND NVL(B.EEA_RECE_NO, '') <> 'R'";
		sql += "	" + SSQL_ADD2;
		sql += ") T2";
		sql += " ON T1.ERI_EXAM_DT=T2.EEA_EXAM_DT";
		sql += " AND T1.ERI_EXAM_SQ =T2.EEA_EXAM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChungVerif2020_UDP_OutStdChoVerif_2020_001 \n";
			G_INFO += "설명 : 학교밖(선택) 성적확인 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEFROMDT : " + DTEFROMDT + " \n";
			G_INFO += " DTETODT : " + DTETODT + " \n";
			G_INFO += " CMBCHUNGYYYY : " + CMBCHUNGYYYY + " \n";
			G_INFO += " SSQL_ADD1 : " + SSQL_ADD1 + " \n";
			G_INFO += " SSQL_ADD2 : " + SSQL_ADD2 + " \n";
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
		<s:AttributeType name='ERI_EXAM_DT' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CNTR_CD' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EXAM_SQ' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM0' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MNGT_HTYR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PID_EN' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_NO' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='S8' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BZ109' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='VDRL' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='S9' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='S10' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BD038' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='HIV' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='S11' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='BD201' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='BD202' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='19'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='20'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='21'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEND_CD' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HLTHR_PR' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_ADD_VIEW' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EXAM_DT' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EPNJN_DT' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PLCE_CD' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SENDGBN' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CANAD_YN' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_UTER_CD' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EIFRM_DT' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESO_EXAM_DR' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_ID' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ERI_EXAM_DT_T = cRsList.getString("ERI_EXAM_DT");
			String EEA_CNTR_CD_T = cRsList.getString("EEA_CNTR_CD");
			String ERI_EXAM_SQ_T = cRsList.getString("ERI_EXAM_SQ");
			String ITEM0_T = cRsList.getString("ITEM0");
			String EEA_MNGT_HTYR_T = cRsList.getString("EEA_MNGT_HTYR");
			String ICR_PID_EN_T = cRsList.getString("ICR_PID_EN");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String EEA_INSU_NO_T = cRsList.getString("EEA_INSU_NO");
			String S8_T = cRsList.getString("S8");
			String BZ109_T = cRsList.getString("BZ109");
			String VDRL_T = cRsList.getString("VDRL");
			String S9_T = cRsList.getString("S9");
			String S10_T = cRsList.getString("S10");
			String BD038_T = cRsList.getString("BD038");
			String HIV_T = cRsList.getString("HIV");
			String S11_T = cRsList.getString("S11");
			String BD201_T = cRsList.getString("BD201");
			String BD202_T = cRsList.getString("BD202");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_SEND_CD_T = cRsList.getString("EEA_SEND_CD");
			String EEA_HLTHR_PR_T = cRsList.getString("EEA_HLTHR_PR");
			String ESO_ADD_VIEW_T = cRsList.getString("ESO_ADD_VIEW");
			String ESO_EXAM_DT_T = cRsList.getString("ESO_EXAM_DT");
			String ESO_EPNJN_DT_T = cRsList.getString("ESO_EPNJN_DT");
			String EEA_PLCE_CD_T = cRsList.getString("EEA_PLCE_CD");
			String SENDGBN_T = cRsList.getString("SENDGBN");
			String EEA_CANAD_YN_T = cRsList.getString("EEA_CANAD_YN");
			String EEA_UTER_CD_T = cRsList.getString("EEA_UTER_CD");
			String ESO_EIFRM_DT_T = cRsList.getString("ESO_EIFRM_DT");
			String ESO_EXAM_DR_T = cRsList.getString("ESO_EXAM_DR");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_PENL_ID_T = cRsList.getString("IAU_PENL_ID");
%>
			<z:row
<%
			if(! ERI_EXAM_DT_T.equals("")) {
%>
		 		ERI_EXAM_DT='<%= ERI_EXAM_DT_T%>'
<%
			}

			if(! EEA_CNTR_CD_T.equals("")) {
%>
		 		EEA_CNTR_CD='<%= EEA_CNTR_CD_T%>'
<%
			}

			if(! ERI_EXAM_SQ_T.equals("")) {
%>
		 		ERI_EXAM_SQ='<%= ERI_EXAM_SQ_T%>'
<%
			}

			if(! ITEM0_T.equals("")) {
%>
		 		ITEM0='<%= ITEM0_T%>'
<%
			}

			if(! EEA_MNGT_HTYR_T.equals("")) {
%>
		 		EEA_MNGT_HTYR='<%= EEA_MNGT_HTYR_T%>'
<%
			}

			if(! ICR_PID_EN_T.equals("")) {
%>
		 		ICR_PID_EN='<%= ICR_PID_EN_T%>'
<%
			}

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! EEA_INSU_NO_T.equals("")) {
%>
		 		EEA_INSU_NO='<%= EEA_INSU_NO_T%>'
<%
			}

			if(! S8_T.equals("")) {
%>
		 		S8='<%= S8_T%>'
<%
			}

			if(! BZ109_T.equals("")) {
%>
		 		BZ109='<%= BZ109_T%>'
<%
			}

			if(! VDRL_T.equals("")) {
%>
		 		VDRL='<%= VDRL_T%>'
<%
			}

			if(! S9_T.equals("")) {
%>
		 		S9='<%= S9_T%>'
<%
			}

			if(! S10_T.equals("")) {
%>
		 		S10='<%= S10_T%>'
<%
			}

			if(! BD038_T.equals("")) {
%>
		 		BD038='<%= BD038_T%>'
<%
			}

			if(! HIV_T.equals("")) {
%>
		 		HIV='<%= HIV_T%>'
<%
			}

			if(! S11_T.equals("")) {
%>
		 		S11='<%= S11_T%>'
<%
			}

			if(! BD201_T.equals("")) {
%>
		 		BD201='<%= BD201_T%>'
<%
			}

			if(! BD202_T.equals("")) {
%>
		 		BD202='<%= BD202_T%>'
<%
			}

			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_SEND_CD_T.equals("")) {
%>
		 		EEA_SEND_CD='<%= EEA_SEND_CD_T%>'
<%
			}

			if(! EEA_HLTHR_PR_T.equals("")) {
%>
		 		EEA_HLTHR_PR='<%= EEA_HLTHR_PR_T%>'
<%
			}

			if(! ESO_ADD_VIEW_T.equals("")) {
%>
		 		ESO_ADD_VIEW='<%= ESO_ADD_VIEW_T%>'
<%
			}

			if(! ESO_EXAM_DT_T.equals("")) {
%>
		 		ESO_EXAM_DT='<%= ESO_EXAM_DT_T%>'
<%
			}

			if(! ESO_EPNJN_DT_T.equals("")) {
%>
		 		ESO_EPNJN_DT='<%= ESO_EPNJN_DT_T%>'
<%
			}

			if(! EEA_PLCE_CD_T.equals("")) {
%>
		 		EEA_PLCE_CD='<%= EEA_PLCE_CD_T%>'
<%
			}

			if(! SENDGBN_T.equals("")) {
%>
		 		SENDGBN='<%= SENDGBN_T%>'
<%
			}

			if(! EEA_CANAD_YN_T.equals("")) {
%>
		 		EEA_CANAD_YN='<%= EEA_CANAD_YN_T%>'
<%
			}

			if(! EEA_UTER_CD_T.equals("")) {
%>
		 		EEA_UTER_CD='<%= EEA_UTER_CD_T%>'
<%
			}

			if(! ESO_EIFRM_DT_T.equals("")) {
%>
		 		ESO_EIFRM_DT='<%= ESO_EIFRM_DT_T%>'
<%
			}

			if(! ESO_EXAM_DR_T.equals("")) {
%>
		 		ESO_EXAM_DR='<%= ESO_EXAM_DR_T%>'
<%
			}

			if(! IAU_LICEN1_NO_T.equals("")) {
%>
		 		IAU_LICEN1_NO='<%= IAU_LICEN1_NO_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! IAU_PENL_ID_T.equals("")) {
%>
		 		IAU_PENL_ID='<%= IAU_PENL_ID_T%>'
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
