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
		String COMP_CD = htMethod.get("COMP_CD");
		String DIVI_CS = htMethod.get("DIVI_CS");
		String CLSS_KD = htMethod.get("CLSS_KD");
		String DIVI_NO = htMethod.get("DIVI_NO");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String SEX_CD = htMethod.get("SEX_CD");
		String CHUNG_YN = htMethod.get("CHUNG_YN");
		String PARAM_TX = htMethod.get("PARAM_TX");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(DIVI_CS == null) { DIVI_CS = ""; }
		if(CLSS_KD == null) { CLSS_KD = ""; }
		if(DIVI_NO == null) { DIVI_NO = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(CHUNG_YN == null) { CHUNG_YN = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * 
  FROM (SELECT EEA_EXAM_DT,  EEA_EXAM_SQ,  EEA_ORAL_YN,  EEA_DIVI_CS, EEA_CLSS_KD, EEA_DIVI_NO,
               EEA_PSNL_NM,  ESP_CHUNG_YN, ESP_EPNJN_YN, ESP_PNJN_TT, EEA_COMP_CD, EEA_DEPT_NM, 
               ESP_EIFRM_DT, ESP_OIFRM_DT, EEA_ENTRY_DT, ICY_COMP_NM, EEA_CHART_NO,
               CASE WHEN EEA_SEX_CD  = '1' THEN '남' ELSE '여' END EEA_SEX_CD, 
               CASE WHEN EEA_ORAL_YN = '1' THEN '건강,구강' 
                    WHEN EEA_ORAL_YN = '2' THEN '건강' 
                    WHEN EEA_ORAL_YN = '3' THEN '구강' END LIST 
          FROM ET_EXAM_ACPT A 
               LEFT OUTER JOIN ET_STDT_PNJN B 
                            ON A.EEA_EXAM_DT = B.ESP_EXAM_DT 
                           AND A.EEA_EXAM_SQ = B.ESP_EXAM_SQ 
               LEFT OUTER JOIN IT_COMPANY C 
                            ON A.EEA_COMP_CD = C.ICY_COMP_CD 
         WHERE 0=0 
           AND A.EEA_EXAM_DT  >= :EXAM_SDT 
           AND A.EEA_EXAM_DT  <= :EXAM_EDT
           AND A.EEA_EXAM_CD   = '31001'   
           AND A.EEA_COMP_CD   = :COMP_CD
           AND A.EEA_ORDER_YN <> 'C' 
           AND (NVL(ESP_EIFRM_DT, ' ') <> ' ' OR NVL(ESP_OIFRM_DT, ' ') <> ' ') 
       ) AA 
         LEFT OUTER JOIN (SELECT EEA_EXAM_DT,EEA_EXAM_SQ, 
                                 NVL(SUM(A0001), 0) A0001,
                                 NVL(SUM(J0011), 0) J0011,
                                 NVL(SUM(BF007), 0) BF007, 
                                 NVL(SUM(F0001), 0) F0001, 
                                 NVL(SUM(F0003), 0) F0003, 
                                 NVL(SUM(F0007), 0) F0007, 
                                 NVL(SUM(F0014), 0) F0014, 
                                 NVL(SUM(BD003), 0) BD003, 
                                 NVL(SUM(BB022), 0) BB022, 
                                 NVL(SUM(BB005), 0) BB005, 
                                 NVL(SUM(BA005), 0) BA005, 
                                 NVL(SUM(BA006), 0) BA006, 
                                 NVL(SUM(BA009), 0) BA009, 
                                 NVL(SUM(BA014), 0) BA014, 
                                 NVL(SUM(BA010), 0) BA010, 
                                 NVL(SUM(BA013), 0) BA013, 
                                 NVL(SUM(K_ALL)/4,0) K_ALL     
                            FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, 
                                         CASE WHEN ERI_ITEM_CD = 'A0001' THEN COUNT(*) END A0001, 
                                         CASE WHEN ERI_ITEM_CD = 'J0011' THEN COUNT(*) END J0011, 
                                         CASE WHEN ERI_ITEM_CD = 'BF007' THEN COUNT(*) END BF007, 
                                         CASE WHEN ERI_ITEM_CD = 'F0001' THEN COUNT(*) END F0001, 
                                         CASE WHEN ERI_ITEM_CD = 'F0003' THEN COUNT(*) END F0003, 
                                         CASE WHEN ERI_ITEM_CD = 'F0007' THEN COUNT(*) END F0007, 
                                         CASE WHEN ERI_ITEM_CD = 'F0014' THEN COUNT(*) END F0014, 
                                         CASE WHEN ERI_ITEM_CD = 'BD003' THEN COUNT(*) END BD003, 
                                         CASE WHEN ERI_ITEM_CD = 'BB022' THEN COUNT(*) END BB022, 
                                         CASE WHEN ERI_ITEM_CD = 'BB005' THEN COUNT(*) END BB005, 
                                         CASE WHEN ERI_ITEM_CD = 'BA005' THEN COUNT(*) END BA005, 
                                         CASE WHEN ERI_ITEM_CD = 'BA006' THEN COUNT(*) END BA006, 
                                         CASE WHEN ERI_ITEM_CD = 'BA009' THEN COUNT(*) END BA009, 
                                         CASE WHEN ERI_ITEM_CD = 'BA014' THEN COUNT(*) END BA014, 
                                         CASE WHEN ERI_ITEM_CD = 'BA010' THEN COUNT(*) END BA010, 
                                         CASE WHEN ERI_ITEM_CD = 'BA013' THEN COUNT(*) END BA013, 
                                         CASE WHEN ERI_ITEM_CD IN ('BA005','BA006','BA009','BA014','BA010','BA013') THEN COUNT(*)  END K_ALL 
                                    FROM ET_EXAM_ACPT A 
                                         LEFT OUTER JOIN ET_RSLT_ITEM B 
                                                      ON A.EEA_EXAM_DT = B.ERI_EXAM_DT 
                                                     AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ 
                                   WHERE A.EEA_EXAM_DT  >= :EXAM_SDT 
                                     AND A.EEA_EXAM_DT  <= :EXAM_EDT
                                     AND A.EEA_EXAM_CD   = '31001'   
                                     AND A.EEA_COMP_CD   = :COMP_CD
                                     AND A.EEA_ORDER_YN <> 'C'           
                                     AND B.ERI_CNCL_YN  <> 'Y' 
                                     AND NVL(ERI_RSLT_VL, ' ') <> ' ' 
                                   GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, ERI_ITEM_CD 
                                 ) FF 
                             GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ 
                         ) BB 
                      ON AA.EEA_EXAM_DT = BB.EEA_EXAM_DT 
                     AND AA.EEA_EXAM_SQ = BB.EEA_EXAM_SQ 
         LEFT OUTER JOIN (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, 
                                 NVL(SUM(A0001), 0) + NVL(SUM(J0011), 0) + 
                                 NVL(SUM(BF007), 0) + NVL(SUM(F0001), 0) + 
                                 NVL(SUM(F0003), 0) + NVL(SUM(F0007), 0) + 
                                 NVL(SUM(F0014), 0) + NVL(SUM(BD003), 0) + 
                                 NVL(SUM(BB022), 0) + NVL(SUM(BB005), 0) + 
                                 NVL(SUM(BA005), 0) + NVL(SUM(BA006), 0) + 
                                 NVL(SUM(BA009), 0) + NVL(SUM(BA014), 0) + 
                                 NVL(SUM(BA010), 0) + NVL(SUM(BA013), 0) NO_RSLT 
                            FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, 
                                         CASE WHEN ERI_ITEM_CD = 'A0001' THEN COUNT(*) END A0001, 
                                         CASE WHEN ERI_ITEM_CD = 'J0011' THEN COUNT(*) END J0011, 
                                         CASE WHEN ERI_ITEM_CD = 'BF007' THEN COUNT(*) END BF007, 
                                         CASE WHEN ERI_ITEM_CD = 'F0001' THEN COUNT(*) END F0001, 
                                         CASE WHEN ERI_ITEM_CD = 'F0003' THEN COUNT(*) END F0003, 
                                         CASE WHEN ERI_ITEM_CD = 'F0007' THEN COUNT(*) END F0007, 
                                         CASE WHEN ERI_ITEM_CD = 'F0014' THEN COUNT(*) END F0014, 
                                         CASE WHEN ERI_ITEM_CD = 'BD003' THEN COUNT(*) END BD003, 
                                         CASE WHEN ERI_ITEM_CD = 'BB022' THEN COUNT(*) END BB022, 
                                         CASE WHEN ERI_ITEM_CD = 'BB005' THEN COUNT(*) END BB005, 
                                         CASE WHEN ERI_ITEM_CD = 'BA005' THEN COUNT(*) END BA005, 
                                         CASE WHEN ERI_ITEM_CD = 'BA006' THEN COUNT(*) END BA006, 
                                         CASE WHEN ERI_ITEM_CD = 'BA009' THEN COUNT(*) END BA009, 
                                         CASE WHEN ERI_ITEM_CD = 'BA014' THEN COUNT(*) END BA014, 
                                         CASE WHEN ERI_ITEM_CD = 'BA010' THEN COUNT(*) END BA010, 
                                         CASE WHEN ERI_ITEM_CD = 'BA013' THEN COUNT(*) END BA013 
                                    FROM ET_EXAM_ACPT A 
                                         LEFT OUTER JOIN ET_RSLT_ITEM B 
                                                      ON A.EEA_EXAM_DT = B.ERI_EXAM_DT 
                                                     AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ
                                   WHERE A.EEA_EXAM_DT  >= :EXAM_SDT 
                                     AND A.EEA_EXAM_DT  <= :EXAM_EDT
                                     AND A.EEA_EXAM_CD   = '31001'   
                                     AND A.EEA_COMP_CD   = :COMP_CD
                                     AND A.EEA_ORDER_YN <> 'C'           
                                     AND B.ERI_CNCL_YN  <> 'Y'                                                      
                                     AND NVL(ERI_RSLT_VL, ' ') = ' ' 
                                   GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, ERI_ITEM_CD 
                                 ) GG 
                             GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ 
                         ) CC 
                      ON AA.EEA_EXAM_DT = CC.EEA_EXAM_DT 
                     AND AA.EEA_EXAM_SQ = CC.EEA_EXAM_SQ
 WHERE 0=0
 
IF (:DIVI_CS <> '') THEN
   AND AA.EEA_DIVI_CS = :DIVI_CS
   
IF (:CLSS_KD <> '') THEN   
   AND AA.EEA_CLSS_KD = :CLSS_KD
   
IF (:DIVI_NO <> '') THEN   
   AND AA.EEA_DIVI_NO = :DIVI_NO
   
IF (:PSNL_NM <> '') THEN   
   AND AA.EEA_PSNL_NM LIKE '%'||:PSNL_NM||'%'
   
IF (:SEX_CD <> '') THEN   
   AND AA.EEA_SEX_CD = :SEX_CD
   
 IF (:CHUNG_YN <> '') THEN   
   AND AA.ESP_CHUNG_YN = :CHUNG_YN
   
:PARAM_TX
:ORDER_BY
		*/

		sql = " SELECT *";
		sql += " FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_ORAL_YN, EEA_DIVI_CS, EEA_CLSS_KD, EEA_DIVI_NO, EEA_PSNL_NM, ESP_CHUNG_YN, ESP_EPNJN_YN, ESP_PNJN_TT, EEA_COMP_CD, EEA_DEPT_NM, ESP_EIFRM_DT, ESP_OIFRM_DT, EEA_ENTRY_DT, ICY_COMP_NM, EEA_CHART_NO, CASE WHEN EEA_SEX_CD = '1' THEN '남' ELSE '여' END EEA_SEX_CD, CASE WHEN EEA_ORAL_YN = '1' THEN '건강,구강' WHEN EEA_ORAL_YN = '2' THEN '건강' WHEN EEA_ORAL_YN = '3' THEN '구강' END LIST";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_STDT_PNJN B";
		sql += " ON A.EEA_EXAM_DT = B.ESP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.ESP_EXAM_SQ LEFT OUTER JOIN IT_COMPANY C";
		sql += " ON A.EEA_COMP_CD = C.ICY_COMP_CD";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += " AND A.EEA_EXAM_CD = '31001'";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND (NVL(ESP_EIFRM_DT, ' ') <> ' '";
		sql += " OR NVL(ESP_OIFRM_DT, ' ') <> ' ') ) AA LEFT OUTER JOIN (SELECT EEA_EXAM_DT,EEA_EXAM_SQ, NVL(SUM(A0001), 0) A0001, NVL(SUM(J0011), 0) J0011, NVL(SUM(BF007), 0) BF007, NVL(SUM(F0001), 0) F0001, NVL(SUM(F0003), 0) F0003, NVL(SUM(F0007), 0) F0007, NVL(SUM(F0014), 0) F0014, NVL(SUM(BD003), 0) BD003, NVL(SUM(BB022), 0) BB022, NVL(SUM(BB005), 0) BB005, NVL(SUM(BA005), 0) BA005, NVL(SUM(BA006), 0) BA006, NVL(SUM(BA009), 0) BA009, NVL(SUM(BA014), 0) BA014, NVL(SUM(BA010), 0) BA010, NVL(SUM(BA013), 0) BA013, NVL(SUM(K_ALL)/4,0) K_ALL";
		sql += " FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, CASE WHEN ERI_ITEM_CD = 'A0001' THEN COUNT(*) END A0001, CASE WHEN ERI_ITEM_CD = 'J0011' THEN COUNT(*) END J0011, CASE WHEN ERI_ITEM_CD = 'BF007' THEN COUNT(*) END BF007, CASE WHEN ERI_ITEM_CD = 'F0001' THEN COUNT(*) END F0001, CASE WHEN ERI_ITEM_CD = 'F0003' THEN COUNT(*) END F0003, CASE WHEN ERI_ITEM_CD = 'F0007' THEN COUNT(*) END F0007, CASE WHEN ERI_ITEM_CD = 'F0014' THEN COUNT(*) END F0014, CASE WHEN ERI_ITEM_CD = 'BD003' THEN COUNT(*) END BD003, CASE WHEN ERI_ITEM_CD = 'BB022' THEN COUNT(*) END BB022, CASE WHEN ERI_ITEM_CD = 'BB005' THEN COUNT(*) END BB005, CASE WHEN ERI_ITEM_CD = 'BA005' THEN COUNT(*) END BA005, CASE WHEN ERI_ITEM_CD = 'BA006' THEN COUNT(*) END BA006, CASE WHEN ERI_ITEM_CD = 'BA009' THEN COUNT(*) END BA009, CASE WHEN ERI_ITEM_CD = 'BA014' THEN COUNT(*) END BA014, CASE WHEN ERI_ITEM_CD = 'BA010' THEN COUNT(*) END BA010, CASE WHEN ERI_ITEM_CD = 'BA013' THEN COUNT(*) END BA013, CASE WHEN ERI_ITEM_CD IN ('BA005','BA006','BA009','BA014','BA010','BA013') THEN COUNT(*) END K_ALL";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_RSLT_ITEM B";
		sql += " ON A.EEA_EXAM_DT = B.ERI_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += " AND A.EEA_EXAM_CD = '31001'";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND B.ERI_CNCL_YN <> 'Y'";
		sql += " AND NVL(ERI_RSLT_VL, ' ') <> ' '";
		sql += " GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, ERI_ITEM_CD ) FF";
		sql += " GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ ) BB";
		sql += " ON AA.EEA_EXAM_DT = BB.EEA_EXAM_DT";
		sql += " AND AA.EEA_EXAM_SQ = BB.EEA_EXAM_SQ LEFT OUTER JOIN (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, NVL(SUM(A0001), 0) + NVL(SUM(J0011), 0) + NVL(SUM(BF007), 0) + NVL(SUM(F0001), 0) + NVL(SUM(F0003), 0) + NVL(SUM(F0007), 0) + NVL(SUM(F0014), 0) + NVL(SUM(BD003), 0) + NVL(SUM(BB022), 0) + NVL(SUM(BB005), 0) + NVL(SUM(BA005), 0) + NVL(SUM(BA006), 0) + NVL(SUM(BA009), 0) + NVL(SUM(BA014), 0) + NVL(SUM(BA010), 0) + NVL(SUM(BA013), 0) NO_RSLT";
		sql += " FROM (SELECT EEA_EXAM_DT, EEA_EXAM_SQ, CASE WHEN ERI_ITEM_CD = 'A0001' THEN COUNT(*) END A0001, CASE WHEN ERI_ITEM_CD = 'J0011' THEN COUNT(*) END J0011, CASE WHEN ERI_ITEM_CD = 'BF007' THEN COUNT(*) END BF007, CASE WHEN ERI_ITEM_CD = 'F0001' THEN COUNT(*) END F0001, CASE WHEN ERI_ITEM_CD = 'F0003' THEN COUNT(*) END F0003, CASE WHEN ERI_ITEM_CD = 'F0007' THEN COUNT(*) END F0007, CASE WHEN ERI_ITEM_CD = 'F0014' THEN COUNT(*) END F0014, CASE WHEN ERI_ITEM_CD = 'BD003' THEN COUNT(*) END BD003, CASE WHEN ERI_ITEM_CD = 'BB022' THEN COUNT(*) END BB022, CASE WHEN ERI_ITEM_CD = 'BB005' THEN COUNT(*) END BB005, CASE WHEN ERI_ITEM_CD = 'BA005' THEN COUNT(*) END BA005, CASE WHEN ERI_ITEM_CD = 'BA006' THEN COUNT(*) END BA006, CASE WHEN ERI_ITEM_CD = 'BA009' THEN COUNT(*) END BA009, CASE WHEN ERI_ITEM_CD = 'BA014' THEN COUNT(*) END BA014, CASE WHEN ERI_ITEM_CD = 'BA010' THEN COUNT(*) END BA010, CASE WHEN ERI_ITEM_CD = 'BA013' THEN COUNT(*) END BA013";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ET_RSLT_ITEM B";
		sql += " ON A.EEA_EXAM_DT = B.ERI_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.ERI_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += " AND A.EEA_EXAM_CD = '31001'";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND B.ERI_CNCL_YN <> 'Y'";
		sql += " AND NVL(ERI_RSLT_VL, ' ') = ' '";
		sql += " GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, ERI_ITEM_CD ) GG";
		sql += " GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ ) CC";
		sql += " ON AA.EEA_EXAM_DT = CC.EEA_EXAM_DT";
		sql += " AND AA.EEA_EXAM_SQ = CC.EEA_EXAM_SQ";
		sql += " WHERE 0=0";
 
		if(! DIVI_CS.equals("")) {
			sql += " AND AA.EEA_DIVI_CS = '" + DIVI_CS + "'";
		}

		if(! CLSS_KD.equals("")) {
			sql += " AND AA.EEA_CLSS_KD = '" + CLSS_KD + "'";
		}
   
		if(! DIVI_NO.equals("")) {
			sql += " AND AA.EEA_DIVI_NO = '" + DIVI_NO + "'";
		}
  
		if(! PSNL_NM.equals("")) {
			sql += " AND AA.EEA_PSNL_NM LIKE '%" + PSNL_NM + "%'";
		}
   
		if(! SEX_CD.equals("")) {
			sql += " AND AA.EEA_SEX_CD = '" + SEX_CD + "'";
		}
   
		if(! CHUNG_YN.equals("")) {
			sql += " AND AA.ESP_CHUNG_YN = '" + CHUNG_YN + "'";
		}
   
		sql += PARAM_TX;
		sql += ORDER_BY;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRtStudChung_Up_afLoadstud_001 \n";
			G_INFO += "설명 : 학생비용청구 대상자 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " DIVI_CS : " + DIVI_CS + " \n";
			G_INFO += " CLSS_KD : " + CLSS_KD + " \n";
			G_INFO += " DIVI_NO : " + DIVI_NO + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " CHUNG_YN : " + CHUNG_YN + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ORAL_YN' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_CS' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CLSS_KD' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DIVI_NO' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='7'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_CHUNG_YN' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EPNJN_YN' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_PNJN_TT' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_DEPT_NM' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_EIFRM_DT' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ESP_OIFRM_DT' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_ENTRY_DT' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_CD' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='LIST' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='9'/>
		</s:AttributeType>
		<s:AttributeType name='c19' rs:name='EEA_EXAM_DT' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='c20' rs:name='EEA_EXAM_SQ' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='A0001' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='J0011' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BF007' rs:number='24' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='F0001' rs:number='25' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='F0003' rs:number='26' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='F0007' rs:number='27' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='F0014' rs:number='28' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BD003' rs:number='29' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BB022' rs:number='30' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BB005' rs:number='31' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BA005' rs:number='32' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BA006' rs:number='33' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BA009' rs:number='34' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BA014' rs:number='35' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BA010' rs:number='36' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BA013' rs:number='37' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='K_ALL' rs:number='38' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='c38' rs:name='EEA_EXAM_DT' rs:number='39' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='c39' rs:name='EEA_EXAM_SQ' rs:number='40' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='NO_RSLT' rs:number='41' rs:nullable='true'>
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

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_ORAL_YN_T = cRsList.getString("EEA_ORAL_YN");
			String EEA_DIVI_CS_T = cRsList.getString("EEA_DIVI_CS");
			String EEA_CLSS_KD_T = cRsList.getString("EEA_CLSS_KD");
			String EEA_DIVI_NO_T = cRsList.getString("EEA_DIVI_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String ESP_CHUNG_YN_T = cRsList.getString("ESP_CHUNG_YN");
			String ESP_EPNJN_YN_T = cRsList.getString("ESP_EPNJN_YN");
			String ESP_PNJN_TT_T = cRsList.getString("ESP_PNJN_TT");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_DEPT_NM_T = cRsList.getString("EEA_DEPT_NM");
			String ESP_EIFRM_DT_T = cRsList.getString("ESP_EIFRM_DT");
			String ESP_OIFRM_DT_T = cRsList.getString("ESP_OIFRM_DT");
			String EEA_ENTRY_DT_T = cRsList.getString("EEA_ENTRY_DT");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_SEX_CD_T = cRsList.getString("EEA_SEX_CD");
			String LIST_T = cRsList.getString("LIST");
			String c19_T = cRsList.getString("c19");
			String c20_T = cRsList.getString("c20");
			String A0001_T = cRsList.getString("A0001");
			String J0011_T = cRsList.getString("J0011");
			String BF007_T = cRsList.getString("BF007");
			String F0001_T = cRsList.getString("F0001");
			String F0003_T = cRsList.getString("F0003");
			String F0007_T = cRsList.getString("F0007");
			String F0014_T = cRsList.getString("F0014");
			String BD003_T = cRsList.getString("BD003");
			String BB022_T = cRsList.getString("BB022");
			String BB005_T = cRsList.getString("BB005");
			String BA005_T = cRsList.getString("BA005");
			String BA006_T = cRsList.getString("BA006");
			String BA009_T = cRsList.getString("BA009");
			String BA014_T = cRsList.getString("BA014");
			String BA010_T = cRsList.getString("BA010");
			String BA013_T = cRsList.getString("BA013");
			String K_ALL_T = cRsList.getString("K_ALL");
			String c38_T = cRsList.getString("c38");
			String c39_T = cRsList.getString("c39");
			String NO_RSLT_T = cRsList.getString("NO_RSLT");
%>
			<z:row
<%
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

			if(! EEA_ORAL_YN_T.equals("")) {
%>
		 		EEA_ORAL_YN='<%= EEA_ORAL_YN_T%>'
<%
			}

			if(! EEA_DIVI_CS_T.equals("")) {
%>
		 		EEA_DIVI_CS='<%= EEA_DIVI_CS_T%>'
<%
			}

			if(! EEA_CLSS_KD_T.equals("")) {
%>
		 		EEA_CLSS_KD='<%= EEA_CLSS_KD_T%>'
<%
			}

			if(! EEA_DIVI_NO_T.equals("")) {
%>
		 		EEA_DIVI_NO='<%= EEA_DIVI_NO_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! ESP_CHUNG_YN_T.equals("")) {
%>
		 		ESP_CHUNG_YN='<%= ESP_CHUNG_YN_T%>'
<%
			}

			if(! ESP_EPNJN_YN_T.equals("")) {
%>
		 		ESP_EPNJN_YN='<%= ESP_EPNJN_YN_T%>'
<%
			}

			if(! ESP_PNJN_TT_T.equals("")) {
%>
		 		ESP_PNJN_TT='<%= ESP_PNJN_TT_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! EEA_DEPT_NM_T.equals("")) {
%>
		 		EEA_DEPT_NM='<%= EEA_DEPT_NM_T%>'
<%
			}

			if(! ESP_EIFRM_DT_T.equals("")) {
%>
		 		ESP_EIFRM_DT='<%= ESP_EIFRM_DT_T%>'
<%
			}

			if(! ESP_OIFRM_DT_T.equals("")) {
%>
		 		ESP_OIFRM_DT='<%= ESP_OIFRM_DT_T%>'
<%
			}

			if(! EEA_ENTRY_DT_T.equals("")) {
%>
		 		EEA_ENTRY_DT='<%= EEA_ENTRY_DT_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_SEX_CD_T.equals("")) {
%>
		 		EEA_SEX_CD='<%= EEA_SEX_CD_T%>'
<%
			}

			if(! LIST_T.equals("")) {
%>
		 		LIST='<%= LIST_T%>'
<%
			}

			if(! c19_T.equals("")) {
%>
		 		c19='<%= c19_T%>'
<%
			}

			if(! c20_T.equals("")) {
%>
		 		c20='<%= c20_T%>'
<%
			}

			if(! A0001_T.equals("")) {
%>
		 		A0001='<%= A0001_T%>'
<%
			}

			if(! J0011_T.equals("")) {
%>
		 		J0011='<%= J0011_T%>'
<%
			}

			if(! BF007_T.equals("")) {
%>
		 		BF007='<%= BF007_T%>'
<%
			}

			if(! F0001_T.equals("")) {
%>
		 		F0001='<%= F0001_T%>'
<%
			}

			if(! F0003_T.equals("")) {
%>
		 		F0003='<%= F0003_T%>'
<%
			}

			if(! F0007_T.equals("")) {
%>
		 		F0007='<%= F0007_T%>'
<%
			}

			if(! F0014_T.equals("")) {
%>
		 		F0014='<%= F0014_T%>'
<%
			}

			if(! BD003_T.equals("")) {
%>
		 		BD003='<%= BD003_T%>'
<%
			}

			if(! BB022_T.equals("")) {
%>
		 		BB022='<%= BB022_T%>'
<%
			}

			if(! BB005_T.equals("")) {
%>
		 		BB005='<%= BB005_T%>'
<%
			}

			if(! BA005_T.equals("")) {
%>
		 		BA005='<%= BA005_T%>'
<%
			}

			if(! BA006_T.equals("")) {
%>
		 		BA006='<%= BA006_T%>'
<%
			}

			if(! BA009_T.equals("")) {
%>
		 		BA009='<%= BA009_T%>'
<%
			}

			if(! BA014_T.equals("")) {
%>
		 		BA014='<%= BA014_T%>'
<%
			}

			if(! BA010_T.equals("")) {
%>
		 		BA010='<%= BA010_T%>'
<%
			}

			if(! BA013_T.equals("")) {
%>
		 		BA013='<%= BA013_T%>'
<%
			}

			if(! K_ALL_T.equals("")) {
%>
		 		K_ALL='<%= K_ALL_T%>'
<%
			}

			if(! c38_T.equals("")) {
%>
		 		c38='<%= c38_T%>'
<%
			}

			if(! c39_T.equals("")) {
%>
		 		c39='<%= c39_T%>'
<%
			}

			if(! NO_RSLT_T.equals("")) {
%>
		 		NO_RSLT='<%= NO_RSLT_T%>'
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
