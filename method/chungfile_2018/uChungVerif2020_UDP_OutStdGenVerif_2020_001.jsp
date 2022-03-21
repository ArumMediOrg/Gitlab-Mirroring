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


		sql = " SELECT  * ";
		sql += " FROM ";
		sql += " ( ";
		sql += " SELECT ERI_EXAM_DT, F_RPAD(NVL(EEA_CNTR_CD,' '),11,' ') EEA_CNTR_CD, ";
		sql += " 		ERI_EXAM_SQ, ";
		sql += " 		'2' ITEM0, ";
		sql += " 		EEA_MNGT_HTYR ITEM1, ";
		sql += " ICR_PID_EN, ICR_PENL_ID, ";
		sql += " 		EEA_INSU_NO  ITEM3, ";
		sql += " 		MAX(ITEM4)   ITEM4  , ";
		sql += " 		MAX(ITEM5)   ITEM5  , ";
		sql += " 		MAX(ITEM6)   ITEM6  , ";
		sql += " 		MAX(ITEM7)   ITEM7  , ";
		sql += " 		MAX(ITEM8)   ITEM8  , ";
		sql += " 		MAX(ITEM9)   ITEM9  , ";
		sql += " 		MAX(ITEM10)  ITEM10 , ";
		sql += " 		MAX(ITEM11)  ITEM11 , ";
		sql += " 		MAX(ITEM12)  ITEM12 , ";
		sql += " 		MAX(ITEM13)  ITEM13 , ";
		sql += " 		MAX(ITEM14)  ITEM14 , ";
		sql += " 		MAX(ITEM15)  ITEM15 , ";
		sql += " 		MAX(ITEM16)  ITEM16 , ";
		sql += " 		MAX(ITEM17)  ITEM17 , ";
		sql += " 		MAX(ITEM18)  ITEM18 , ";
		sql += " 		MAX(ITEM19)  ITEM19 , ";
		sql += " 		MAX(ITEM20)  ITEM20 , ";
		sql += " 		MAX(ITEM21)  ITEM21 , ";
		sql += " 		MAX(ITEM22)  ITEM22 , ";
		sql += " 		MAX(ITEM23)  ITEM23 , ";
		sql += " 		MAX(ITEM24)  ITEM24 , ";
		sql += " 		MAX(ITEM25)  ITEM25 , ";
		sql += " 		MAX(ITEM26)  ITEM26 , ";
		sql += " 		MAX(ITEM27)  ITEM27 , ";
		sql += " 		MAX(ITEM28)  ITEM28 , ";
		sql += " 		MAX(ITEM29)  ITEM29 , ";
		sql += " 		MAX(ITEM30)  ITEM30 , ";
		sql += " 		MAX(ITEM31)  ITEM31 , ";
		sql += " 		MAX(ITEM32)  ITEM32 , ";
		sql += " 		MAX(ITEM33)  ITEM33 , ";
		sql += " 		MAX(ITEM34)  ITEM34 , ";
		sql += " 		MAX(ITEM35)  ITEM35 , ";
		sql += " 		MAX(ITEM36)  ITEM36 , ";
		sql += " 		MAX(ITEM37)  ITEM37 , ";
		sql += " 		MAX(ITEM38)  ITEM38 , ";
		sql += " 		MAX(ITEM39)  ITEM39 , ";
		sql += " 		MAX(ITEM40)  ITEM40 , ";
		sql += " 		MAX(ITEM41)  ITEM41 , ";
		sql += " 		MAX(ITEM42)  ITEM42 , ";
		sql += " 		MAX(ITEM43)  ITEM43 , ";
		sql += " 		MAX(ITEM44)  ITEM44 , ";
		sql += " 		MAX(ITEM45)  ITEM45 , ";
		sql += " 		MAX(ITEM46)  ITEM46 , ";
		sql += " 		MAX(ITEM47)  ITEM47 , ";
		sql += " 		MAX(ITEM48)  ITEM48 , ";
		sql += " 		MAX(ITEM49)  ITEM49 , ";
		sql += " 		MAX(ITEM50)  ITEM50 , ";
		sql += " 		MAX(ITEM51)  ITEM51 , ";
		sql += " 		MAX(ITEM52)  ITEM52 , ";
		sql += " 		MAX(ITEM53)  ITEM53 , ";
		sql += " 		MAX(ITEM54)  ITEM54 , ";
		sql += " 		MAX(ITEM55)  ITEM55 , ";
		sql += " 		MAX(ITEM56)  ITEM56 , ";
		sql += " 		MAX(ITEM57)  ITEM57 , ";
		sql += " 		MAX(ITEM58)  ITEM58 , ";
		sql += " 		MAX(ITEM59)  ITEM59 ";
		sql += " FROM( ";
		sql += " 	SELECT ERI_EXAM_DT, ERI_EXAM_SQ, EEA_MNGT_HTYR, ICR_PID_EN, ICR_PENL_ID, ";
		sql += " 		EEA_INSU_NO,  EEA_CNTR_CD, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='A0001'   THEN  ERI_RSLT_VL  END ITEM4, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='A0002'   THEN ERI_RSLT_VL   END ITEM5, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='A0019'   THEN  ERI_RSLT_VL WHEN ERI_ITEM_CD='A0021' THEN ERI_RSLT_VL  END ITEM6, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='A0020'   THEN  ERI_RSLT_VL WHEN ERI_ITEM_CD='A0022' THEN ERI_RSLT_VL  END ITEM7, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='A0019'  and ERI_RSLT_VL<>' '  THEN '0' WHEN ERI_ITEM_CD='A0021' and ERI_RSLT_VL<>' ' THEN '1' END ITEM8, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='A0065' THEN  ERI_HERT_CD END ITEM9, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='A0066' THEN ERI_HERT_CD  END ITEM10, ";
		sql += " 		'' ITEM11, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='A0009' THEN ERI_RSLT_VL  END ITEM12, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='A0014' THEN  ERI_RSLT_VL END ITEM13, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='A0015' THEN  ERI_RSLT_VL END ITEM14, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='N0029' THEN ERI_HERT_CD  END ITEM15, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='N0022' THEN ERI_HERT_CD  END ITEM16, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='N0019' THEN ERI_HERT_CD  END ITEM17, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='N0020' THEN ERI_HERT_CD  END ITEM18, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='N0018' THEN ERI_HERT_CD  END ITEM19, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='N0023' THEN ERI_HERT_CD  END ITEM20, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='Z0017' THEN ERI_HERT_CD  END ITEM21, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='BF007' THEN ERI_HERT_CD  END ITEM22, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='BF012' THEN ERI_HERT_CD  END ITEM23, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='BB005' THEN ERI_RSLT_VL  END ITEM24, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='BA014' THEN ERI_RSLT_VL  END ITEM25, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='BA009' THEN ERI_RSLT_VL  END ITEM26, ";
		sql += " 		''  ITEM27, ";
		sql += " 		''  ITEM28, ";
		sql += " 		''  ITEM29, ";
		sql += " 		''  ITEM30, ";
		sql += " 		''  ITEM31, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='BA005' THEN ERI_RSLT_VL  END ITEM32, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='BA006' THEN ERI_RSLT_VL  END ITEM33, ";
		sql += " 		''  ITEM34, ";
		sql += " 		''  ITEM35, ";
		sql += " 		''  ITEM36, ";
		sql += " 		CASE WHEN  ERI_ITEM_CD='BD025' AND ERI_RSLT_VL<>' ' THEN  '2' ";
		sql += " 			WHEN  ERI_ITEM_CD='BD003' AND ERI_RSLT_VL<>' ' THEN  '1' ";
		sql += " 		END  ITEM37, ";
		sql += " 		CASE WHEN  ERI_ITEM_CD IN('BD025','BD003') THEN  ERI_HERT_CD END  ITEM38, ";
		sql += " 		CASE WHEN  ERI_ITEM_CD='BD025' THEN ERI_PRNM_VL  END   ITEM39, ";
		sql += " 		CASE WHEN  ERI_ITEM_CD='BD025' AND ERI_PRNM_VL<>' ' THEN  (SELECT IHL_STDAG_NO FROM IT_HOSPITAL   ) ";
		sql += " 		ELSE '' END  ITEM40, ";
		sql += " 		CASE  WHEN  ERI_ITEM_CD='BD026' AND ERI_RSLT_VL<>' ' THEN  '2' ";
		sql += " 			WHEN  ERI_ITEM_CD='BD004' AND ERI_RSLT_VL<>' ' THEN  '1' ";
		sql += " 		END ITEM41, ";
		sql += " 		CASE WHEN ERI_ITEM_CD IN('BD026','BD004') THEN ERI_HERT_CD  END  ITEM42, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='BD026' THEN ERI_PRNM_VL  END  ITEM43, ";
		sql += " 		CASE WHEN  ERI_ITEM_CD='BD026' AND ERI_PRNM_VL<>' ' THEN  (SELECT  IHL_STDAB_NO FROM IT_HOSPITAL ) ";
		sql += " 		ELSE '' END  ITEM44, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='BZ022' THEN  ERI_HERT_CD END  ITEM45, ";
		sql += " 		CASE  WHEN  ERI_ITEM_CD='BD035' AND ERI_RSLT_VL<>' ' THEN  '2' ";
		sql += " 			WHEN  ERI_ITEM_CD='BD016' AND ERI_RSLT_VL<>' ' THEN  '1' ";
		sql += " 		END ITEM46, ";
		sql += " 		CASE WHEN ERI_ITEM_CD IN('BD035','BD016') THEN ERI_HERT_CD  END  ITEM47, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='BD035' THEN ERI_PRNM_VL  END  ITEM48, ";
		sql += " 		CASE WHEN  ERI_ITEM_CD='BD035' AND ERI_PRNM_VL<>' ' THEN  (SELECT  IHL_HEPA_NO FROM IT_HOSPITAL ) ";
		sql += " 		ELSE '' END  ITEM49, ";
		sql += " 		''  ITEM50, ";
		sql += " 		''  ITEM51, ";
		sql += " 		''  ITEM52, ";
		sql += " 		''  ITEM53, ";
		sql += " 		''  ITEM54, ";
		sql += " 		''  ITEM55, ";
		sql += " 		''  ITEM56, ";
		sql += " 		''  ITEM57, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='F0001' AND ERI_RSLT_VL<>' ' and ERI_HERT_CD<>'11' THEN '1' ";
		sql += " 			WHEN ERI_ITEM_CD='F0003' AND ERI_RSLT_VL<>' ' and ERI_HERT_CD<>'11' THEN '2' ";
		sql += " 			WHEN ERI_ITEM_CD='F0007' AND ERI_RSLT_VL<>' ' and ERI_HERT_CD<>'11' THEN '3' ";
		sql += " 			WHEN ERI_ITEM_CD='F0014' AND ERI_RSLT_VL<>' ' and ERI_HERT_CD<>'11' THEN '4' ";
		sql += " 			WHEN ERI_ITEM_CD='F0001' AND ERI_RSLT_VL<>' ' and ERI_HERT_CD='11' then '5' ";
		sql += " 			WHEN ERI_ITEM_CD='F0003' AND ERI_RSLT_VL<>' ' and ERI_HERT_CD='11' then '5' ";
		sql += " 			WHEN ERI_ITEM_CD='F0007' AND ERI_RSLT_VL<>' ' and ERI_HERT_CD='11' then '5' ";
		sql += " 			WHEN ERI_ITEM_CD='F0014' AND ERI_RSLT_VL<>' ' and ERI_HERT_CD='11' then '5' ";
		sql += " 		ELSE '' END ITEM58, ";
		sql += " 		CASE WHEN ERI_ITEM_CD='F0001' THEN ERI_HERT_CD ";
		sql += " 			WHEN ERI_ITEM_CD='F0003' THEN ERI_HERT_CD ";
		sql += " 			WHEN ERI_ITEM_CD='F0007' THEN ERI_HERT_CD ";
		sql += " 			WHEN ERI_ITEM_CD='F0014' THEN ERI_HERT_CD ";
		sql += " 		END ITEM59 ";
		sql += " 	FROM    ET_RSLT_ITEM A ";
		sql += " 			LEFT OUTER JOIN ET_EXAM_ACPT B    ON A.ERI_EXAM_DT=B.EEA_EXAM_DT AND A.ERI_EXAM_SQ=B.EEA_EXAM_SQ ";
		sql += " 			LEFT OUTER JOIN IT_CUSTOMER  D    ON B.EEA_CUST_NO=D.ICR_CUST_NO ";
		sql += " 			LEFT OUTER JOIN BT_BILLHN_PR E    ON B.EEA_EXAM_DT=E.BBP_EXAM_DT AND B.EEA_EXAM_SQ=E.BBP_EXAM_SQ  AND  E.BBP_CHUNG_KD='51' ";
		sql += " 	WHERE B.EEA_EXAM_DT>= '" + DTEFROMDT + "' AND B.EEA_EXAM_DT<= '" + DTETODT + "' AND NVL(B.EEA_RECE_NO, ' ') <> 'R' ";
		sql += " 		AND EEA_MNGT_HTYR= '" + CMBCHUNGYYYY + "' AND  EEA_EXAM_CD in('31006')  and EEA_HDMD_YN = 'Y'   AND EEA_ORDER_YN <> 'C' and ERI_CNCL_YN <> 'Y' ";

		sql += SSQL_ADD1;

		sql += " 	) DDD ";
		sql += " 		GROUP BY ERI_EXAM_DT, ERI_EXAM_SQ,EEA_MNGT_HTYR,ICR_PENL_ID,EEA_INSU_NO,icr_pid_en ,EEA_CNTR_CD ";
		sql += " ) T1 ";
		sql += " 	right outer join ( ";
		sql += " SELECT EEA_EXAM_DT, EEA_EXAM_SQ,EEA_PSNL_NM,  EEA_SEND_CD, ";
		sql += " (EEA_HLTHR_PR - EEA_ORAL_PR - (select sum(eep_add_pr) eep_add_pr from et_exam_price where eep_exam_dt = EEA_EXAM_DT and eep_exam_sq = EEA_EXAM_SQ) )  EEA_HLTHR_PR, ";
		sql += " 			ESO_QST_DIAG     ITEM60, ";
		sql += " 			ESO_QST_DRUG     ITEM61, ";
		sql += " 			ESO_QST_SMOKE    ITEM62, ";
		sql += " 			ESO_QST_DRUNK    ITEM63, ";
		sql += " 			ESO_QST_SPORT    ITEM64, ";
		sql += " 			ESO_QST_WEIGHT   ITEM65, ";
		sql += " 			ESO_QST_INJURE   ITEM66, ";
		sql += " 			ESO_QST_STAT     ITEM67, ";
		sql += " 			ESO_PNJN_A       ITEM68, ";
		sql += " 			ESO_PNJN_B       ITEM69, ";
		sql += " 			ESO_PNJNB_1      ITEM70, ";
		sql += " 			ESO_PNJNB_2      ITEM71, ";
		sql += " 			ESO_PNJNB_3      ITEM72, ";
		sql += " 			ESO_PNJNB_4      ITEM73, ";
		sql += " 			ESO_PNJNB_5      ITEM74, ";
		sql += " 			ESO_PNJNB_6      ITEM75, ";
		sql += " 			ESO_PNJNB_7      ITEM76, ";
		sql += " 			ESO_PNJNB_8      ITEM77, ";
		sql += " 			ESO_PNJNB_ETC    ITEM78, ";
		sql += " 			ESO_PNJNB_ETC2   ITEM79, ";
		sql += " 			ESO_PNJN_R       ITEM80, ";
		sql += " 			ESO_PNJNR_1      ITEM81, ";
		sql += " 			ESO_PNJNR_2      ITEM82, ";
		sql += " 			ESO_PNJNR_3      ITEM83, ";
		sql += " 			ESO_PNJNR_4      ITEM84, ";
		sql += " 			ESO_PNJNR_5      ITEM85, ";
		sql += " 			ESO_PNJNR_6      ITEM86, ";
		sql += " 			ESO_PNJNR_7      ITEM87, ";
		sql += " 			ESO_PNJNR_8      ITEM88, ";
		sql += " 			ESO_PNJNR_9      ITEM89, ";
		sql += " 			ESO_PNJNR_etc    ITEM90, ";
		sql += " 			ESO_PNJNR_ETC2   ITEM91, ";
		sql += " 			ESO_PNJN_RD      ITEM92, ";
		sql += " 			ESO_PNJNRD_1     ITEM93, ";
		sql += " 			ESO_PNJNRD_2     ITEM94, ";
		sql += " 			ESO_PNJNRD_3     ITEM95, ";
		sql += " 			ESO_PNJNRD_4     ITEM96, ";
		sql += " 			''             ITEM97, ";
		sql += " 			ESO_EXAM_VIEW    ITEM98, ";
		sql += " 			REPLACE(ESO_EXAM_DT,'-','')    ITEM99, ";
		sql += " 			REPLACE(ESO_EPNJN_DT,'-','')   ITEM100, ";
		sql += " 			case when SUBSTR(EEA_PLCE_CD,1,1)='1' Then '2' else '1' end  ITEM101, ";
		sql += " 			'3' SENDGBN , eea_canad_yn,eea_uter_cd, ";
		sql += " 			REPLACE(ESO_EIFRM_DT,'-','')  ITEM103, ";
		sql += " 			ESO_EXAM_DR, ";
		sql += " 			IAU_LICEN1_NO ITEM104, ";
		sql += " 			IAU_PENL_NM   ITEM105, ";
		sql += " 			IAU_PENL_ID   ITEM106, ";
		sql += " 			ICR_INFO_YN   , ";
		sql += " 			CASE WHEN MUNYN ='1' THEN 'Y' ELSE 'N' END ITEM107, ";
		sql += " 			''   ITEM108, ";
		sql += " 			'0' ITEM109, ";
		sql += " 			''  ITEM110, ";
		sql += " 			'E' ITEM111 ";
		sql += " 		FROM ET_STDT_PNJNO A ";
		sql += " 		LEFT OUTER JOIN ET_EXAM_ACPT B  ON A.ESO_EXAM_DT=B.EEA_EXAM_DT  AND A.ESO_EXAM_SQ=B.EEA_EXAM_SQ ";
		sql += " 		LEFT OUTER JOIN IT_CUSTOMER C   ON B.EEA_CUST_NO=C.ICR_CUST_NO ";
		sql += " 		LEFT OUTER JOIN IT_AUTH_USER D  ON A.ESO_EXAM_DR =D.IAU_EMP_NO ";
		sql += " 		LEFT OUTER JOIN BT_BILLHN_PR E  ON B.EEA_EXAM_DT=E.BBP_EXAM_DT AND B.EEA_EXAM_SQ=E.BBP_EXAM_SQ  AND  E.BBP_CHUNG_KD='51' ";
		sql += " 		LEFT OUTER JOIN (SELECT  QQN_EXAM_DT, QQN_EXAM_SQ, '1' MUNYN  FROM  QT_QUESTION   group by QQN_EXAM_DT, QQN_EXAM_SQ) F ON A.ESO_EXAM_DT=F.QQN_EXAM_DT  AND A.ESO_EXAM_SQ=F.QQN_EXAM_SQ ";
		sql += " 		WHERE B.EEA_EXAM_DT>= '" + DTEFROMDT + "' AND B.EEA_EXAM_DT <= '" + DTETODT + "' AND NVL(B.EEA_RECE_NO, ' ') <> 'R' ";
		sql += " 		AND B.EEA_EXAM_CD in('31006')   AND B.EEA_HDMD_YN='Y'   AND  A.ESO_EPNJN_YN='Y'    AND B.eea_order_yn<>'C' AND NVL(B.EEA_RECE_NO, ' ') <> 'R' ";

		sql += SSQL_ADD2;


		sql += " ) T2 ";
		sql += " ON T1.ERI_EXAM_DT=T2.EEA_EXAM_DT   AND T1.ERI_EXAM_SQ =T2.EEA_EXAM_SQ ";


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChungVerif2020_UDP_OutStdGenVerif_2020_001 \n";
			G_INFO += "설명 : 학교밖(일반) 성적확인 내역 조회 \n";
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
