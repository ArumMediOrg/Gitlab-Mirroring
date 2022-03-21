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
                   CASE when SUBSTR(C.ECS_GIRT1_KD, 1,1) = '1' Then '이상소견없음'
                        when SUBSTR(C.ECS_GIRT1_KD, 1,1) = '2' Then '위염'
                                    when SUBSTR(C.ECS_GIRT1_KD, 1,1) = '3' Then '위암의심'
                                    when SUBSTR(C.ECS_GIRT1_KD, 1,1) = '4' Then '조기위암'
                                    when SUBSTR(C.ECS_GIRT1_KD, 1,1) = '5' Then '진행위암'
                                    when SUBSTR(C.ECS_GIRT1_KD, 1,1) = '6' Then '양성 의궤양'
                                    when SUBSTR(C.ECS_GIRT1_KD, 1,1) = '7' Then '위용종'
                                    when SUBSTR(C.ECS_GIRT1_KD, 1,1) = '8' Then '위 점막하종양'
                                    when SUBSTR(C.ECS_GIRT1_KD, 1,1) = '9' Then '기타'
                   End as ECS_GIRT1_KD,
                   C.ECS_GIRT1S_KD As ECS_GIRT1S_KD_1,
                   CASE when SUBSTR(C.ECS_GIRT2_KD, 1,1) = '1' Then '이상소견없음'
                        when SUBSTR(C.ECS_GIRT2_KD, 1,1) = '2' Then '위염'
                                    when SUBSTR(C.ECS_GIRT2_KD, 1,1) = '3' Then '위암의심'
                                    when SUBSTR(C.ECS_GIRT2_KD, 1,1) = '4' Then '조기위암'
                                    when SUBSTR(C.ECS_GIRT2_KD, 1,1) = '5' Then '진행위암'
                                    when SUBSTR(C.ECS_GIRT2_KD, 1,1) = '6' Then '양성 의궤양'
                                    when SUBSTR(C.ECS_GIRT2_KD, 1,1) = '7' Then '위용종'
                                    when SUBSTR(C.ECS_GIRT2_KD, 1,1) = '8' Then '위 점막하종양'
                                    when SUBSTR(C.ECS_GIRT2_KD, 1,1) = '9' Then '기타'
                   End as ECS_GIRT2_KD,
                   C.ECS_GIRT2S_KD As ECS_GIRT2S_KD_2,
                   CASE when SUBSTR(C.ECS_GIRT3_KD, 1,1) = '1' Then '이상소견없음'
                        when SUBSTR(C.ECS_GIRT3_KD, 1,1) = '2' Then '위염'
                                     when SUBSTR(C.ECS_GIRT3_KD, 1,1) = '3' Then '위암의심'
                                     when SUBSTR(C.ECS_GIRT3_KD, 1,1) = '4' Then '조기위암'
                                     when SUBSTR(C.ECS_GIRT3_KD, 1,1) = '5' Then '진행위암'
                                     when SUBSTR(C.ECS_GIRT3_KD, 1,1) = '6' Then '양성 의궤양'
                                     when SUBSTR(C.ECS_GIRT3_KD, 1,1) = '7' Then '위용종'
                                     when SUBSTR(C.ECS_GIRT3_KD, 1,1) = '8' Then '위 점막하종양'
                                     when SUBSTR(C.ECS_GIRT3_KD, 1,1) = '9' Then '기타'
                   End as ECS_GIRT3_KD,
                   C.ECS_GIRT3S_KD As ECS_GIRT3S_KD_3,
                   CASE when SUBSTR(C.ECS_GIETC_KD, 1,1) = '1' Then '식도/위 정맥류'
                        when SUBSTR(C.ECS_GIETC_KD, 2,1) = '1' Then '식도염'
                                     when SUBSTR(C.ECS_GIETC_KD, 3,1) = '1' Then '식도 점막하종양'
                                     when SUBSTR(C.ECS_GIETC_KD, 4,1) = '1' Then '식도암'
                                     when SUBSTR(C.ECS_GIETC_KD, 5,1) = '1' Then '십이지장궤양'
                                     when SUBSTR(C.ECS_GIETC_KD, 6,1) = '1' Then '십이지장악성종양'
                                     when SUBSTR(C.ECS_GIETC_KD, 7,1) = '1' Then '십이지장점막하종양'
                                     when SUBSTR(C.ECS_GIETC_KD, 8,1) = '1' Then '직접기입'
                   End as ECS_GIETC_KD,
      C.ECS_GIRT_EX,
                           CASE when SUBSTR(C.ECS_RSLT_KD, 1,1) = '1' Then '이상소견없음'
                                when SUBSTR(C.ECS_RSLT_KD, 1,1) = '2' Then '양성질환'
                                             when SUBSTR(C.ECS_RSLT_KD, 1,1) = '3' Then '위암의심'
                                             when SUBSTR(C.ECS_RSLT_KD, 1,1) = '4' Then '위암'
                                             when SUBSTR(C.ECS_RSLT_KD, 1,1) = '5' Then '기타'
                                End as ECS_RSLT_KD
---------------------------------------------------
        From ET_EXAM_ACPT A
       Left Join IT_COMPANY B On A.EEA_COMP_CD = B.ICY_COMP_CD
       Inner Join ET_CANCER_header D On A.EEA_EXAM_DT = D.ECH_EXAM_DT And A.EEA_EXAM_SQ = D.ECH_EXAM_SQ
                                    And ECH_CFRM_CD = '2'
       LEFT OUTER JOIN IT_COMPANY   E ON A.EEA_COMP_CD = E.ICY_COMP_CD
       Inner Join ET_CANCER_STMC C On A.EEA_EXAM_DT = C.ECS_EXAM_DT And A.EEA_EXAM_SQ = C.ECS_EXAM_SQ
         WHERE 0=0
           AND A.EEA_EXAM_DT >= :EXAM_DT
           AND A.EEA_EXAM_DT <= :EXAM_DT
           AND A.EEA_ORDER_YN <> 'C'
|| :sSQL_ADD

		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_CUST_NO, A.EEA_CHART_NO, A.EEA_PSNL_NM, A.EEA_PSNL_AGE";
		sql += ", CASE WHEN A.EEA_SEX_CD IS NULL OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD ,'5',1) END ICR_SEX_NM";
		sql += ", (E.ICY_ZIP_AR || E.ICY_ROAD_AR) AS ICR_ADDR_NM, E.ICY_ZIP_CD, GETCOMMON_LVCDTONM('0805',B.ICY_TKGJ_CD,'5',LENGTH(B.ICY_TKGJ_CD)) ICY_TKGJ_NM1, GETCOMMON_LVCDTONM('0823',B.ICY_TKGJ_CD,'5',LENGTH(B.ICY_TKGJ_CD)) ICY_TKGJ_NM2, B.ICY_TKGJ_YR, A.EEA_COMP_CD, B.ICY_COMP_NM, GETFILMNO_FIND(A.EEA_EXAM_DT,A.EEA_EXAM_SQ) ERI_FILM_NO";
		sql += ", CASE WHEN SUBSTR(C.ECS_GIRT1_KD, 1,1) = '1' THEN '이상소견없음' WHEN SUBSTR(C.ECS_GIRT1_KD, 1,1) = '2' THEN '위염' WHEN SUBSTR(C.ECS_GIRT1_KD, 1,1) = '3' THEN '위암의심' WHEN SUBSTR(C.ECS_GIRT1_KD, 1,1) = '4' THEN '조기위암' WHEN SUBSTR(C.ECS_GIRT1_KD, 1,1) = '5' THEN '진행위암' WHEN SUBSTR(C.ECS_GIRT1_KD, 1,1) = '6' THEN '양성 의궤양' WHEN SUBSTR(C.ECS_GIRT1_KD, 1,1) = '7' THEN '위용종' WHEN SUBSTR(C.ECS_GIRT1_KD, 1,1) = '8' THEN '위 점막하종양' WHEN SUBSTR(C.ECS_GIRT1_KD, 1,1) = '9' THEN '기타' END AS ECS_GIRT1_KD";
		sql += ", C.ECS_GIRT1S_KD AS ECS_GIRT1S_KD_1";
		sql += ", CASE WHEN SUBSTR(C.ECS_GIRT2_KD, 1,1) = '1' THEN '이상소견없음' WHEN SUBSTR(C.ECS_GIRT2_KD, 1,1) = '2' THEN '위염' WHEN SUBSTR(C.ECS_GIRT2_KD, 1,1) = '3' THEN '위암의심' WHEN SUBSTR(C.ECS_GIRT2_KD, 1,1) = '4' THEN '조기위암' WHEN SUBSTR(C.ECS_GIRT2_KD, 1,1) = '5' THEN '진행위암' WHEN SUBSTR(C.ECS_GIRT2_KD, 1,1) = '6' THEN '양성 의궤양' WHEN SUBSTR(C.ECS_GIRT2_KD, 1,1) = '7' THEN '위용종' WHEN SUBSTR(C.ECS_GIRT2_KD, 1,1) = '8' THEN '위 점막하종양' WHEN SUBSTR(C.ECS_GIRT2_KD, 1,1) = '9' THEN '기타' END AS ECS_GIRT2_KD";
		sql += ", C.ECS_GIRT2S_KD AS ECS_GIRT2S_KD_2";
		sql += ", CASE WHEN SUBSTR(C.ECS_GIRT3_KD, 1,1) = '1' THEN '이상소견없음' WHEN SUBSTR(C.ECS_GIRT3_KD, 1,1) = '2' THEN '위염' WHEN SUBSTR(C.ECS_GIRT3_KD, 1,1) = '3' THEN '위암의심' WHEN SUBSTR(C.ECS_GIRT3_KD, 1,1) = '4' THEN '조기위암' WHEN SUBSTR(C.ECS_GIRT3_KD, 1,1) = '5' THEN '진행위암' WHEN SUBSTR(C.ECS_GIRT3_KD, 1,1) = '6' THEN '양성 의궤양' WHEN SUBSTR(C.ECS_GIRT3_KD, 1,1) = '7' THEN '위용종' WHEN SUBSTR(C.ECS_GIRT3_KD, 1,1) = '8' THEN '위 점막하종양' WHEN SUBSTR(C.ECS_GIRT3_KD, 1,1) = '9' THEN '기타' END AS ECS_GIRT3_KD";
		sql += ", C.ECS_GIRT3S_KD AS ECS_GIRT3S_KD_3";
		sql += ", CASE WHEN SUBSTR(C.ECS_GIETC_KD, 1,1) = '1' THEN '식도/위 정맥류' WHEN SUBSTR(C.ECS_GIETC_KD, 2,1) = '1' THEN '식도염' WHEN SUBSTR(C.ECS_GIETC_KD, 3,1) = '1' THEN '식도 점막하종양' WHEN SUBSTR(C.ECS_GIETC_KD, 4,1) = '1' THEN '식도암' WHEN SUBSTR(C.ECS_GIETC_KD, 5,1) = '1' THEN '십이지장궤양' WHEN SUBSTR(C.ECS_GIETC_KD, 6,1) = '1' THEN '십이지장악성종양' WHEN SUBSTR(C.ECS_GIETC_KD, 7,1) = '1' THEN '십이지장점막하종양' WHEN SUBSTR(C.ECS_GIETC_KD, 8,1) = '1' THEN '직접기입' END AS ECS_GIETC_KD";
		sql += ", C.ECS_GIRT_EX";
		sql += ", CASE WHEN SUBSTR(C.ECS_RSLT_KD, 1,1) = '1' THEN '이상소견없음' WHEN SUBSTR(C.ECS_RSLT_KD, 1,1) = '2' THEN '양성질환' WHEN SUBSTR(C.ECS_RSLT_KD, 1,1) = '3' THEN '위암의심' WHEN SUBSTR(C.ECS_RSLT_KD, 1,1) = '4' THEN '위암' WHEN SUBSTR(C.ECS_RSLT_KD, 1,1) = '5' THEN '기타' END AS ECS_RSLT_KD";
		
		sql += " FROM ET_EXAM_ACPT A LEFT JOIN IT_COMPANY B";
		sql += " ON A.EEA_COMP_CD = B.ICY_COMP_CD";
		
		sql += " INNER JOIN ET_CANCER_HEADER D";
		sql += " ON A.EEA_EXAM_DT = D.ECH_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.ECH_EXAM_SQ";
		sql += " AND ECH_CFRM_CD = '2'";
		
		sql += " LEFT OUTER JOIN IT_COMPANY E";
		sql += " ON A.EEA_COMP_CD = E.ICY_COMP_CD";
		
		sql += " INNER JOIN ET_CANCER_STMC C";
		sql += " ON A.EEA_EXAM_DT = C.ECS_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = C.ECS_EXAM_SQ";

		sql += " WHERE 0=0";
		sql += " AND A.EEA_EXAM_DT >= '" + EXAM_DT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_DT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += SSQL_ADD;

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uChest_FilmDecipher_UF_SqlSetCancer_001 \n";
			G_INFO += "설명 : 위 조영 영상판독 소견서 \n";
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
		<s:AttributeType name='ECS_GIRT1_KD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT1S_KD'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT1S_KD_1' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT2S_KD'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT2_KD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT3S_KD'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT2S_KD_2' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ECS_GIRT_EX'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT3_KD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT3S_KD_3' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='8'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIETC_KD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_HEADER'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='18'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_GIRT_EX' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_COMPANY'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='ECS_RSLT_KD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_CANCER_STMC'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='25' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c25' rs:name='ROWID' rs:number='26' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c26' rs:name='ROWID' rs:number='27' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c27' rs:name='ROWID' rs:number='28' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c28' rs:name='ROWID' rs:number='29' rs:rowid='true' rs:hidden='true'>
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
			String ECS_GIRT1_KD_T = cRsList.getString("ECS_GIRT1_KD");
			String ECS_GIRT1S_KD_1_T = cRsList.getString("ECS_GIRT1S_KD_1");
			String ECS_GIRT2_KD_T = cRsList.getString("ECS_GIRT2_KD");
			String ECS_GIRT2S_KD_2_T = cRsList.getString("ECS_GIRT2S_KD_2");
			String ECS_GIRT3_KD_T = cRsList.getString("ECS_GIRT3_KD");
			String ECS_GIRT3S_KD_3_T = cRsList.getString("ECS_GIRT3S_KD_3");
			String ECS_GIETC_KD_T = cRsList.getString("ECS_GIETC_KD");
			String ECS_GIRT_EX_T = cRsList.getString("ECS_GIRT_EX");
			String ECS_RSLT_KD_T = cRsList.getString("ECS_RSLT_KD");
			String ROWID_T = cRsList.getString("ROWID");
			String c25_T = cRsList.getString("c25");
			String c26_T = cRsList.getString("c26");
			String c27_T = cRsList.getString("c27");
			String c28_T = cRsList.getString("c28");
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

			if(! ECS_GIRT1_KD_T.equals("")) {
%>
		 		ECS_GIRT1_KD='<%= ECS_GIRT1_KD_T%>'
<%
			}

			if(! ECS_GIRT1S_KD_1_T.equals("")) {
%>
		 		ECS_GIRT1S_KD_1='<%= ECS_GIRT1S_KD_1_T%>'
<%
			}

			if(! ECS_GIRT2_KD_T.equals("")) {
%>
		 		ECS_GIRT2_KD='<%= ECS_GIRT2_KD_T%>'
<%
			}

			if(! ECS_GIRT2S_KD_2_T.equals("")) {
%>
		 		ECS_GIRT2S_KD_2='<%= ECS_GIRT2S_KD_2_T%>'
<%
			}
%>
				ECS_GIRT3_KD='<%= cnt%>'
				ECS_GIRT3S_KD_3='<%= cnt%>'
				ECS_GIETC_KD='<%= cnt%>'
				ECS_GIRT_EX='<%= cnt%>'
				ECS_RSLT_KD='<%= cnt%>'
<%
			if(! ROWID_T.equals("")) {
%>
		 		ROWID='<%= ROWID_T%>'
<%
			}

			if(! c25_T.equals("")) {
%>
		 		c25='<%= c25_T%>'
<%
			}

			if(! c26_T.equals("")) {
%>
		 		c26='<%= c26_T%>'
<%
			}

			if(! c27_T.equals("")) {
%>
		 		c27='<%= c27_T%>'
<%
			}

			if(! c28_T.equals("")) {
%>
		 		c28='<%= c28_T%>'
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
