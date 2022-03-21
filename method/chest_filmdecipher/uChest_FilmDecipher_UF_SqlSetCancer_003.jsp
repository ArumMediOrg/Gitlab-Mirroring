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
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CUST_NO, A.EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_PSNL_AGE,
       CASE WHEN A.EEA_SEX_CD  IS NULL OR A.EEA_SEX_CD  = '' THEN A.EEA_SEX_CD
            Else GetCOMMON_LvCdToNm('0411',A.EEA_SEX_CD ,'5',1)
       END ICR_SEX_NM,
       (E.ICY_ZIP_AR || E.ICY_ROAD_AR) AS ICR_ADDR_NM, E.ICY_ZIP_CD,
       GetCOMMON_LvCdToNm('0805',B.ICY_TKGJ_CD,'5',LENGTH(B.ICY_TKGJ_CD)) ICY_TKGJ_NM1,
       GetCOMMON_LvCdToNm('0823',B.ICY_TKGJ_CD,'5',LENGTH(B.ICY_TKGJ_CD)) ICY_TKGJ_NM2, B.ICY_TKGJ_YR,
             A.EEA_COMP_CD, B.ICY_COMP_NM, GetFILMNO_FIND(A.EEA_EXAM_DT,A.EEA_EXAM_SQ) ERI_FILM_NO,
----------------------------------------------------
       CASE when SUBSTR(C.ECB_MGDS_KD, 1,1) = '1' Then '25%미만'
            when SUBSTR(C.ECB_MGDS_KD, 1,1) = '2' Then '25%~50%'
                         when SUBSTR(C.ECB_MGDS_KD, 1,1) = '3' Then '51%~75%'
                         when SUBSTR(C.ECB_MGDS_KD, 1,1) = '4' Then '76%~100%'
                         when SUBSTR(C.ECB_MGDS_KD, 1,1) = '5' Then '보형물삽입%'
       End as ECB_MGDS_KD,
       CASE when SUBSTR(C.ECB_MGRT1_KD, 1,2) = '01' Then '이상소견없음'
            when SUBSTR(C.ECB_MGRT1_KD, 1,2) = '02' Then '종괴'
                   when SUBSTR(C.ECB_MGRT1_KD, 1,2) = '03' Then '양성석회화'
                  when SUBSTR(C.ECB_MGRT1_KD, 1,2) = '04' Then '미세석회화'
                  when SUBSTR(C.ECB_MGRT1_KD, 1,2) = '05' Then '구조 왜곡'
                  when SUBSTR(C.ECB_MGRT1_KD, 1,2) = '06' Then '비대칭'
                  when SUBSTR(C.ECB_MGRT1_KD, 1,2) = '07' Then '피부 이상'
                  when SUBSTR(C.ECB_MGRT1_KD, 1,2) = '08' Then '임파선 비후'
                  when SUBSTR(C.ECB_MGRT1_KD, 1,2) = '09' Then '판정 곤란'
                  when SUBSTR(C.ECB_MGRT1_KD, 1,2) = '10' Then '직접 기입'
       End as ECB_MGRT1_KD,
       C.ECB_MGRT1SR_KD As ECB_MGRT1SR_KD_R1, C.ECB_MGRT1R_EX As ECB_MGRT1R_EX_R1,
       C.ECB_MGRT1SL_KD As ECB_MGRT1SL_KD_L1, C.ECB_MGRT1L_EX As ECB_MGRT1L_EX_L1,
       CASE when SUBSTR(C.ECB_MGRT2_KD, 1,2) = '01' Then '이상소견없음'
            when SUBSTR(C.ECB_MGRT2_KD, 1,2) = '02' Then '종괴'
                        when SUBSTR(C.ECB_MGRT2_KD, 1,2) = '03' Then '양성석회화'
                               when SUBSTR(C.ECB_MGRT2_KD, 1,2) = '04' Then '미세석회화'
                               when SUBSTR(C.ECB_MGRT2_KD, 1,2) = '05' Then '구조 왜곡'
                               when SUBSTR(C.ECB_MGRT2_KD, 1,2) = '06' Then '비대칭'
                               when SUBSTR(C.ECB_MGRT2_KD, 1,2) = '07' Then '피부 이상'
                               when SUBSTR(C.ECB_MGRT2_KD, 1,2) = '08' Then '임파선 비후'
                               when SUBSTR(C.ECB_MGRT2_KD, 1,2) = '09' Then '판정 곤란'
                               when SUBSTR(C.ECB_MGRT2_KD, 1,2) = '10' Then '직접 기입'
       End as ECB_MGRT2_KD,
       C.ECB_MGRT2SR_KD As ECB_MGRT2SR_KD_R2, C.ECB_MGRT2R_EX As ECB_MGRT2R_EX_R2,
       C.ECB_MGRT2SL_KD As ECB_MGRT2SL_KD_L2, C.ECB_MGRT2L_EX As ECB_MGRT2L_EX_L2,
       CASE when SUBSTR(C.ECB_MGRT3_KD, 1,2) = '01' Then '이상소견없음'
            when SUBSTR(C.ECB_MGRT3_KD, 1,2) = '02' Then '종괴'
                  when SUBSTR(C.ECB_MGRT3_KD, 1,2) = '03' Then '양성석회화'
                  when SUBSTR(C.ECB_MGRT3_KD, 1,2) = '04' Then '미세석회화'
                  when SUBSTR(C.ECB_MGRT3_KD, 1,2) = '05' Then '구조 왜곡'
                  when SUBSTR(C.ECB_MGRT3_KD, 1,2) = '06' Then '비대칭'
                  when SUBSTR(C.ECB_MGRT3_KD, 1,2) = '07' Then '피부 이상'
                  when SUBSTR(C.ECB_MGRT3_KD, 1,2) = '08' Then '임파선 비후'
                  when SUBSTR(C.ECB_MGRT3_KD, 1,2) = '09' Then '판정 곤란'
                  when SUBSTR(C.ECB_MGRT3_KD, 1,2) = '10' Then '직접 기입'
       End as ECB_MGRT3_KD,
       C.ECB_MGRT3SR_KD As ECB_MGRT3SR_KD_R3, C.ECB_MGRT3R_EX As ECB_MGRT3R_EX_R3,
       C.ECB_MGRT3SL_KD As ECB_MGRT3SL_KD_L3, C.ECB_MGRT3L_EX As ECB_MGRT3L_EX_L3,
       C.ECB_MGRT_EX,
       CASE when SUBSTR(C.ECB_RSLT_KD, 1,1) = '1' Then '이상소견없음'
            when SUBSTR(C.ECB_RSLT_KD, 1,1) = '2' Then '양성질환'
                   when SUBSTR(C.ECB_RSLT_KD, 1,1) = '3' Then '유방암 의심'
                   when SUBSTR(C.ECB_RSLT_KD, 1,1) = '4' Then '판정유보'
       End as ECB_RSLT_KD
---------------------------------------------------
        From ET_EXAM_ACPT A
       Left Join IT_COMPANY B On A.EEA_COMP_CD = B.ICY_COMP_CD
       Inner Join ET_CANCER_header D On A.EEA_EXAM_DT = D.ECH_EXAM_DT And A.EEA_EXAM_SQ = D.ECH_EXAM_SQ
                                    And ECH_CFRM_CD = '2'
       LEFT OUTER JOIN IT_COMPANY   E ON A.EEA_COMP_CD = E.ICY_COMP_CD
       Inner Join ET_CANCER_BRST C On A.EEA_EXAM_DT = C.ECB_EXAM_DT And A.EEA_EXAM_SQ = C.ECB_EXAM_SQ

         WHERE 0=0
           AND A.EEA_EXAM_DT >= :EXAM_DT
           AND A.EEA_EXAM_DT <= :EXAM_DT
           AND A.EEA_ORDER_YN <> 'C'
|| :sSQL_ADD
		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CUST_NO, A.EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_PSNL_AGE";
		sql += ", CASE WHEN A.EEA_SEX_CD IS NULL OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) END ICR_SEX_NM";
		sql += ", (E.ICY_ZIP_AR || E.ICY_ROAD_AR) AS ICR_ADDR_NM, E.ICY_ZIP_CD, GETCOMMON_LVCDTONM('0805',B.ICY_TKGJ_CD,'5',LENGTH(B.ICY_TKGJ_CD)) ICY_TKGJ_NM1, GETCOMMON_LVCDTONM('0823',B.ICY_TKGJ_CD,'5',LENGTH(B.ICY_TKGJ_CD)) ICY_TKGJ_NM2, B.ICY_TKGJ_YR, A.EEA_COMP_CD, B.ICY_COMP_NM, GETFILMNO_FIND(A.EEA_EXAM_DT,A.EEA_EXAM_SQ) ERI_FILM_NO";
		sql += ", CASE WHEN SUBSTR(C.ECB_MGDS_KD, 1,1) = '1' THEN '25%미만' WHEN SUBSTR(C.ECB_MGDS_KD, 1,1) = '2' THEN '25%~50%' WHEN SUBSTR(C.ECB_MGDS_KD, 1,1) = '3' THEN '51%~75%' WHEN SUBSTR(C.ECB_MGDS_KD, 1,1) = '4' THEN '76%~100%' WHEN SUBSTR(C.ECB_MGDS_KD, 1,1) = '5' THEN '보형물삽입%' END AS ECB_MGDS_KD";
		sql += ", CASE WHEN SUBSTR(C.ECB_MGRT1_KD, 1,2) = '01' THEN '이상소견없음' WHEN SUBSTR(C.ECB_MGRT1_KD, 1,2) = '02' THEN '종괴' WHEN SUBSTR(C.ECB_MGRT1_KD, 1,2) = '03' THEN '양성석회화' WHEN SUBSTR(C.ECB_MGRT1_KD, 1,2) = '04' THEN '미세석회화' WHEN SUBSTR(C.ECB_MGRT1_KD, 1,2) = '05' THEN '구조 왜곡' WHEN SUBSTR(C.ECB_MGRT1_KD, 1,2) = '06' THEN '비대칭' WHEN SUBSTR(C.ECB_MGRT1_KD, 1,2) = '07' THEN '피부 이상' WHEN SUBSTR(C.ECB_MGRT1_KD, 1,2) = '08' THEN '임파선 비후' WHEN SUBSTR(C.ECB_MGRT1_KD, 1,2) = '09' THEN '판정 곤란' WHEN SUBSTR(C.ECB_MGRT1_KD, 1,2) = '10' THEN '직접 기입' END AS ECB_MGRT1_KD";
		sql += ", C.ECB_MGRT1SR_KD AS ECB_MGRT1SR_KD_R1, C.ECB_MGRT1R_EX AS ECB_MGRT1R_EX_R1, C.ECB_MGRT1SL_KD AS ECB_MGRT1SL_KD_L1, C.ECB_MGRT1L_EX AS ECB_MGRT1L_EX_L1";
		sql += ", CASE WHEN SUBSTR(C.ECB_MGRT2_KD, 1,2) = '01' THEN '이상소견없음' WHEN SUBSTR(C.ECB_MGRT2_KD, 1,2) = '02' THEN '종괴' WHEN SUBSTR(C.ECB_MGRT2_KD, 1,2) = '03' THEN '양성석회화' WHEN SUBSTR(C.ECB_MGRT2_KD, 1,2) = '04' THEN '미세석회화' WHEN SUBSTR(C.ECB_MGRT2_KD, 1,2) = '05' THEN '구조 왜곡' WHEN SUBSTR(C.ECB_MGRT2_KD, 1,2) = '06' THEN '비대칭' WHEN SUBSTR(C.ECB_MGRT2_KD, 1,2) = '07' THEN '피부 이상' WHEN SUBSTR(C.ECB_MGRT2_KD, 1,2) = '08' THEN '임파선 비후' WHEN SUBSTR(C.ECB_MGRT2_KD, 1,2) = '09' THEN '판정 곤란' WHEN SUBSTR(C.ECB_MGRT2_KD, 1,2) = '10' THEN '직접 기입' END AS ECB_MGRT2_KD";
		sql += ", C.ECB_MGRT2SR_KD AS ECB_MGRT2SR_KD_R2, C.ECB_MGRT2R_EX AS ECB_MGRT2R_EX_R2, C.ECB_MGRT2SL_KD AS ECB_MGRT2SL_KD_L2, C.ECB_MGRT2L_EX AS ECB_MGRT2L_EX_L2";
		sql += ", CASE WHEN SUBSTR(C.ECB_MGRT3_KD, 1,2) = '01' THEN '이상소견없음' WHEN SUBSTR(C.ECB_MGRT3_KD, 1,2) = '02' THEN '종괴' WHEN SUBSTR(C.ECB_MGRT3_KD, 1,2) = '03' THEN '양성석회화' WHEN SUBSTR(C.ECB_MGRT3_KD, 1,2) = '04' THEN '미세석회화' WHEN SUBSTR(C.ECB_MGRT3_KD, 1,2) = '05' THEN '구조 왜곡' WHEN SUBSTR(C.ECB_MGRT3_KD, 1,2) = '06' THEN '비대칭' WHEN SUBSTR(C.ECB_MGRT3_KD, 1,2) = '07' THEN '피부 이상' WHEN SUBSTR(C.ECB_MGRT3_KD, 1,2) = '08' THEN '임파선 비후' WHEN SUBSTR(C.ECB_MGRT3_KD, 1,2) = '09' THEN '판정 곤란' WHEN SUBSTR(C.ECB_MGRT3_KD, 1,2) = '10' THEN '직접 기입' END AS ECB_MGRT3_KD";
		sql += ", C.ECB_MGRT3SR_KD AS ECB_MGRT3SR_KD_R3, C.ECB_MGRT3R_EX AS ECB_MGRT3R_EX_R3, C.ECB_MGRT3SL_KD AS ECB_MGRT3SL_KD_L3, C.ECB_MGRT3L_EX AS ECB_MGRT3L_EX_L3, C.ECB_MGRT_EX";
		sql += ", CASE WHEN SUBSTR(C.ECB_RSLT_KD, 1,1) = '1' THEN '이상소견없음' WHEN SUBSTR(C.ECB_RSLT_KD, 1,1) = '2' THEN '양성질환' WHEN SUBSTR(C.ECB_RSLT_KD, 1,1) = '3' THEN '유방암 의심' WHEN SUBSTR(C.ECB_RSLT_KD, 1,1) = '4' THEN '판정유보' END AS ECB_RSLT_KD";

		sql += " FROM ET_EXAM_ACPT A LEFT JOIN IT_COMPANY B";
		sql += " ON A.EEA_COMP_CD = B.ICY_COMP_CD";
		
		sql += " INNER JOIN ET_CANCER_HEADER D";
		sql += " ON A.EEA_EXAM_DT = D.ECH_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.ECH_EXAM_SQ";
		sql += " AND ECH_CFRM_CD = '2'";
		
		sql += " LEFT OUTER JOIN IT_COMPANY E";
		sql += " ON A.EEA_COMP_CD = E.ICY_COMP_CD";
		
		sql += " INNER JOIN ET_CANCER_BRST C";
		sql += " ON A.EEA_EXAM_DT = C.ECB_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = C.ECB_EXAM_SQ";

		sql += " WHERE 0=0";
		sql += " AND A.EEA_EXAM_DT >= '" + EXAM_DT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_DT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChest_FilmDecipher_UF_SqlSetCancer_003 \n";
			G_INFO += "설명 : 유방 X선 영상판독 소견서 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " SSQL_ADD : " + SSQL_ADD + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CUST_NO' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='5' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_AGE' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_PSNL_AGE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='38' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ADDR_NM' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_ZIP_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_ZIP_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKGJ_NM1' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKGJ_NM2' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_TKGJ_YR' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_TKGJ_YR'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ICY_COMP_NM' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ICY_COMP_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_FILM_NO' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGDS_KD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1SR_KD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1_KD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1R_EX'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1SR_KD_R1' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1R_EX_R1' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT1L_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1SL_KD_L1' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2SR_KD'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT1L_EX_L1' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2R_EX'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2_KD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2SR_KD_R2' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT2L_EX'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2R_EX_R2' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3SR_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2SL_KD_L2' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3R_EX'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT2L_EX_L2' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3SL_KD'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3_KD' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT3L_EX'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3SR_KD_R3' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ECB_MGRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3R_EX_R3' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3SL_KD_L3' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='7'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT3L_EX_L3' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_HEADER'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_MGRT_EX' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECB_RSLT_KD' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_BRST'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='34' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c34' rs:name='ROWID' rs:number='35' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c35' rs:name='ROWID' rs:number='36' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c36' rs:name='ROWID' rs:number='37' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c37' rs:name='ROWID' rs:number='38' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
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
			String EEA_CUST_NO_T = cRsList.getString("EEA_CUST_NO");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_PSNL_AGE_T = cRsList.getString("EEA_PSNL_AGE");
			String ICR_SEX_NM_T = cRsList.getString("ICR_SEX_NM");
			String ICR_ADDR_NM_T = cRsList.getString("ICR_ADDR_NM");
			String ICY_ZIP_CD_T = cRsList.getString("ICY_ZIP_CD");
			String ICY_TKGJ_NM1_T = cRsList.getString("ICY_TKGJ_NM1");
			String ICY_TKGJ_NM2_T = cRsList.getString("ICY_TKGJ_NM2");
			String ICY_TKGJ_YR_T = cRsList.getString("ICY_TKGJ_YR");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String ICY_COMP_NM_T = cRsList.getString("ICY_COMP_NM");
			String ERI_FILM_NO_T = cRsList.getString("ERI_FILM_NO");
			String ECB_MGDS_KD_T = cRsList.getString("ECB_MGDS_KD");
			String ECB_MGRT1_KD_T = cRsList.getString("ECB_MGRT1_KD");
			String ECB_MGRT1SR_KD_R1_T = cRsList.getString("ECB_MGRT1SR_KD_R1");
			String ECB_MGRT1R_EX_R1_T = cRsList.getString("ECB_MGRT1R_EX_R1");
			String ECB_MGRT1SL_KD_L1_T = cRsList.getString("ECB_MGRT1SL_KD_L1");
			String ECB_MGRT1L_EX_L1_T = cRsList.getString("ECB_MGRT1L_EX_L1");
			String ECB_MGRT2_KD_T = cRsList.getString("ECB_MGRT2_KD");
			String ECB_MGRT2SR_KD_R2_T = cRsList.getString("ECB_MGRT2SR_KD_R2");
			String ECB_MGRT2R_EX_R2_T = cRsList.getString("ECB_MGRT2R_EX_R2");
			String ECB_MGRT2SL_KD_L2_T = cRsList.getString("ECB_MGRT2SL_KD_L2");
			String ECB_MGRT2L_EX_L2_T = cRsList.getString("ECB_MGRT2L_EX_L2");
			String ECB_MGRT3_KD_T = cRsList.getString("ECB_MGRT3_KD");
			String ECB_MGRT3SR_KD_R3_T = cRsList.getString("ECB_MGRT3SR_KD_R3");
			String ECB_MGRT3R_EX_R3_T = cRsList.getString("ECB_MGRT3R_EX_R3");
			String ECB_MGRT3SL_KD_L3_T = cRsList.getString("ECB_MGRT3SL_KD_L3");
			String ECB_MGRT3L_EX_L3_T = cRsList.getString("ECB_MGRT3L_EX_L3");
			String ECB_MGRT_EX_T = cRsList.getString("ECB_MGRT_EX");
			String ECB_RSLT_KD_T = cRsList.getString("ECB_RSLT_KD");
			String ROWID_T = cRsList.getString("ROWID");
			String c34_T = cRsList.getString("c34");
			String c35_T = cRsList.getString("c35");
			String c36_T = cRsList.getString("c36");
			String c37_T = cRsList.getString("c37");
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

			if(! EEA_CUST_NO_T.equals("")) {
%>
		 		EEA_CUST_NO='<%= EEA_CUST_NO_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_PSNL_AGE_T.equals("")) {
%>
		 		EEA_PSNL_AGE='<%= EEA_PSNL_AGE_T%>'
<%
			}

			if(! ICR_SEX_NM_T.equals("")) {
%>
		 		ICR_SEX_NM='<%= ICR_SEX_NM_T%>'
<%
			}

			if(! ICR_ADDR_NM_T.equals("")) {
%>
		 		ICR_ADDR_NM='<%= ICR_ADDR_NM_T%>'
<%
			}

			if(! ICY_ZIP_CD_T.equals("")) {
%>
		 		ICY_ZIP_CD='<%= ICY_ZIP_CD_T%>'
<%
			}

			if(! ICY_TKGJ_NM1_T.equals("")) {
%>
		 		ICY_TKGJ_NM1='<%= ICY_TKGJ_NM1_T%>'
<%
			}

			if(! ICY_TKGJ_NM2_T.equals("")) {
%>
		 		ICY_TKGJ_NM2='<%= ICY_TKGJ_NM2_T%>'
<%
			}

			if(! ICY_TKGJ_YR_T.equals("")) {
%>
		 		ICY_TKGJ_YR='<%= ICY_TKGJ_YR_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! ICY_COMP_NM_T.equals("")) {
%>
		 		ICY_COMP_NM='<%= ICY_COMP_NM_T%>'
<%
			}

			if(! ERI_FILM_NO_T.equals("")) {
%>
		 		ERI_FILM_NO='<%= ERI_FILM_NO_T%>'
<%
			}

			if(! ECB_MGDS_KD_T.equals("")) {
%>
		 		ECB_MGDS_KD='<%= ECB_MGDS_KD_T%>'
<%
			}

			if(! ECB_MGRT1_KD_T.equals("")) {
%>
		 		ECB_MGRT1_KD='<%= ECB_MGRT1_KD_T%>'
<%
			}

			if(! ECB_MGRT1SR_KD_R1_T.equals("")) {
%>
		 		ECB_MGRT1SR_KD_R1='<%= ECB_MGRT1SR_KD_R1_T%>'
<%
			}

			if(! ECB_MGRT1R_EX_R1_T.equals("")) {
%>
		 		ECB_MGRT1R_EX_R1='<%= ECB_MGRT1R_EX_R1_T%>'
<%
			}

			if(! ECB_MGRT1SL_KD_L1_T.equals("")) {
%>
		 		ECB_MGRT1SL_KD_L1='<%= ECB_MGRT1SL_KD_L1_T%>'
<%
			}

			if(! ECB_MGRT1L_EX_L1_T.equals("")) {
%>
		 		ECB_MGRT1L_EX_L1='<%= ECB_MGRT1L_EX_L1_T%>'
<%
			}

			if(! ECB_MGRT2_KD_T.equals("")) {
%>
		 		ECB_MGRT2_KD='<%= ECB_MGRT2_KD_T%>'
<%
			}

			if(! ECB_MGRT2SR_KD_R2_T.equals("")) {
%>
		 		ECB_MGRT2SR_KD_R2='<%= ECB_MGRT2SR_KD_R2_T%>'
<%
			}

			if(! ECB_MGRT2R_EX_R2_T.equals("")) {
%>
		 		ECB_MGRT2R_EX_R2='<%= ECB_MGRT2R_EX_R2_T%>'
<%
			}

			if(! ECB_MGRT2SL_KD_L2_T.equals("")) {
%>
		 		ECB_MGRT2SL_KD_L2='<%= ECB_MGRT2SL_KD_L2_T%>'
<%
			}

			if(! ECB_MGRT2L_EX_L2_T.equals("")) {
%>
		 		ECB_MGRT2L_EX_L2='<%= ECB_MGRT2L_EX_L2_T%>'
<%
			}

			if(! ECB_MGRT3_KD_T.equals("")) {
%>
		 		ECB_MGRT3_KD='<%= ECB_MGRT3_KD_T%>'
<%
			}

			if(! ECB_MGRT3SR_KD_R3_T.equals("")) {
%>
		 		ECB_MGRT3SR_KD_R3='<%= ECB_MGRT3SR_KD_R3_T%>'
<%
			}
%>
				ECB_MGRT3R_EX_R3='<%= cnt%>'
				ECB_MGRT3SL_KD_L3='<%= cnt%>'
				ECB_MGRT3L_EX_L3='<%= cnt%>'
				ECB_MGRT_EX='<%= cnt%>'
				ECB_RSLT_KD='<%= cnt%>'
<%
			if(! ROWID_T.equals("")) {
%>
		 		ROWID='<%= ROWID_T%>'
<%
			}

			if(! c34_T.equals("")) {
%>
		 		c34='<%= c34_T%>'
<%
			}

			if(! c35_T.equals("")) {
%>
		 		c35='<%= c35_T%>'
<%
			}

			if(! c36_T.equals("")) {
%>
		 		c36='<%= c36_T%>'
<%
			}

			if(! c37_T.equals("")) {
%>
		 		c37='<%= c37_T%>'
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
