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

		String PENCRT_KD = htMethod.get("PENCRT_KD");
		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String PSNL_NM = htMethod.get("PSNL_NM");
		String PARAM_TX1 = htMethod.get("PARAM_TX1");
		String PARAM_TX2 = htMethod.get("PARAM_TX2");

		//
		if(PENCRT_KD == null) { PENCRT_KD = ""; }
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(PSNL_NM == null) { PSNL_NM = ""; }
		if(PARAM_TX1 == null) { PARAM_TX1 = ""; }
		if(PARAM_TX2 == null) { PARAM_TX2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CASE :PENCRT_KD WHEN '1' THEN F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '1')
                       WHEN '2' THEN ECHELONDB.ECL_DECRYPT(F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '1')) 
                                ELSE F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '0') END ICR_PENL_ID,                                      
       A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, B.SBE_EXAM_DT, B.SBE_EXAM_CHA,
       CASE WHEN SUBSTR(A.EEA_PLCE_CD, 1, 1) = '1' THEN '2' ELSE '1' END SLNS_PLACE,
       A.EEA_HOLIDAY_YN, K.SIR_EXAM_DT2, K.SIR_EXAM_SQ2, 
       A.EEA_CHART_NO,   B.SBE_XRAY_NO,  B.SBE_XRAY_CD, B.SBE_MEDI_CNT, 
       F_DOCTOR_FIND('1', B.SBE_XDOC_CD) SBE_XDOC_CD, 
       F_DOCLICNE(B.SBE_XDOC_CD, '의사') POTOGRFNO_DOCTRLCN, 
       F_DOCTOR_FIND('1', B.SBE_DDOC_CD) SBE_DDOC_CD, 
       F_DOCLICNE(B.SBE_DDOC_CD, '의사') DSGR_DOCTRLCN, 
       (SELECT CASE WHEN COUNT(1) = 0 THEN 'N' ELSE 'Y' END 
          FROM ET_RSLT_ITEM 
         WHERE ERI_EXAM_DT = A.EEA_EXAM_DT 
           AND ERI_EXAM_SQ = A.EEA_EXAM_SQ 
           AND ERI_ITEM_CD = 'S0020') S0020_YN, 
       (SELECT MAX (IAU_PENL_NM) 
          FROM ST_PANJUNG LEFT OUTER JOIN IT_AUTH_USER ON IAU_DEPT_CD = '0207' AND IAU_EMP_NO = SPG_DOCT_CD
         WHERE SPG_EXAM_DT = A.EEA_EXAM_DT 
           AND SPG_EXAM_SQ = A.EEA_EXAM_SQ) TCNXPRT_NM, 
       F_DOCLICNE((SELECT MAX(SPG_DOCT_CD) 
                     FROM ST_PANJUNG 
                    WHERE SPG_EXAM_DT = A.EEA_EXAM_DT 
                      AND SPG_EXAM_SQ = A.EEA_EXAM_SQ), '의사') TCNXPRT_LCN, 
       B.SBE_XRFM_CD, SBE_MEDI_YN 
  FROM ET_EXAM_ACPT A 
       LEFT OUTER JOIN ST_BASE B    ON A.EEA_EXAM_DT = B.SBE_EXAM_DT AND A.EEA_EXAM_SQ = B.SBE_EXAM_SQ 
       LEFT OUTER JOIN IT_COMPANY I ON A.EEA_COMP_CD = I.ICY_COMP_CD 
       LEFT OUTER JOIN (SELECT SIR_EXAM_DT2, SIR_EXAM_SQ2, SIR_EXAM_DT, SIR_EXAM_SQ 
                          FROM ST_ITEM_RECHECK 
                         GROUP BY SIR_EXAM_DT,SIR_EXAM_SQ, SIR_EXAM_DT2, SIR_EXAM_SQ2) K ON A.EEA_EXAM_DT = K.SIR_EXAM_DT AND A.EEA_EXAM_SQ = K.SIR_EXAM_SQ
 WHERE A.EEA_EXAM_DT >= :EXAM_SDT 
   AND A.EEA_EXAM_DT <= :EXAM_EDT                                                                                            
   AND A.EEA_COMP_CD  = :COMP_CD              
   AND SUBSTR(EEA_MNGT_SPYM, 1, 4) = :MNGT_YR  
   AND A.EEA_ORDER_YN <> 'C'
   AND B.SBE_PANJ_YN  = 'Y' 
   AND B.SBE_EXAM_CHA = '1'    

IF (:PSNL_NM <> '') THEN 
  AND A.EEA_PSNL_NM = :PSNL_NM
  
:PARAM_TX1
:PARAM_TX2

 ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ

		*/

		sql = " SELECT CASE '" + PENCRT_KD + "' WHEN '1' THEN F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '1') WHEN '2' THEN ECL_DECRYPT(F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '1')) ELSE F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '0') END ICR_PENL_ID, A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, B.SBE_EXAM_DT, B.SBE_EXAM_CHA";
		sql += ", CASE WHEN SUBSTR(A.EEA_PLCE_CD, 1, 1) = '1' THEN '2' ELSE '1' END SLNS_PLACE";
		sql += ", A.EEA_HOLIDAY_YN, K.SIR_EXAM_DT2, K.SIR_EXAM_SQ2, A.EEA_CHART_NO, B.SBE_XRAY_NO, B.SBE_XRAY_CD, B.SBE_MEDI_CNT, F_DOCTOR_FIND('1', B.SBE_XDOC_CD) SBE_XDOC_CD, F_DOCLICNE(B.SBE_XDOC_CD, '의사') POTOGRFNO_DOCTRLCN, F_DOCTOR_FIND('1', B.SBE_DDOC_CD) SBE_DDOC_CD, F_DOCLICNE(B.SBE_DDOC_CD, '의사') DSGR_DOCTRLCN";

		sql += ", (";
		sql += "	SELECT CASE WHEN COUNT(1) = 0 THEN 'N' ELSE 'Y' END ";
		sql += " 	FROM ET_RSLT_ITEM";
		sql += " 	WHERE ERI_EXAM_DT = A.EEA_EXAM_DT";
		sql += " 	AND ERI_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " 	AND ERI_ITEM_CD = 'S0020'";
		sql += " ) S0020_YN";
		
		sql += ", (";
		sql += "	SELECT MAX (IAU_PENL_NM)";
		sql += " 	FROM ST_PANJUNG LEFT OUTER JOIN IT_AUTH_USER";
		sql += " 	ON IAU_DEPT_CD = '0207'";
		sql += " 	AND IAU_EMP_NO = SPG_DOCT_CD";
		sql += " 	WHERE SPG_EXAM_DT = A.EEA_EXAM_DT";
		sql += " 	AND SPG_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " ) TCNXPRT_NM";
		
		sql += ", F_DOCLICNE(";
		sql += "	(";
		sql += "		SELECT MAX(SPG_DOCT_CD)";
		sql += " 		FROM ST_PANJUNG";
		sql += " 		WHERE SPG_EXAM_DT = A.EEA_EXAM_DT";
		sql += " 		AND SPG_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += "	), '의사') TCNXPRT_LCN";
		
		sql += ", B.SBE_XRFM_CD, SBE_MEDI_YN";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ST_BASE B";
		sql += " ON A.EEA_EXAM_DT = B.SBE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.SBE_EXAM_SQ LEFT OUTER JOIN IT_COMPANY I";
		sql += " ON A.EEA_COMP_CD = I.ICY_COMP_CD LEFT OUTER JOIN";
		
		sql += " (";
		sql += "	SELECT SIR_EXAM_DT2, SIR_EXAM_SQ2, SIR_EXAM_DT, SIR_EXAM_SQ";
		sql += " 	FROM ST_ITEM_RECHECK";
		sql += " 	GROUP BY SIR_EXAM_DT,SIR_EXAM_SQ, SIR_EXAM_DT2, SIR_EXAM_SQ2";
		sql += " ) K";

		sql += " ON A.EEA_EXAM_DT = K.SIR_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = K.SIR_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND SUBSTR(EEA_MNGT_SPYM, 1, 4) = '" + MNGT_YR + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND B.SBE_PANJ_YN = 'Y'";
		sql += " AND B.SBE_EXAM_CHA = '1'";

		if(! PSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM = '" + PSNL_NM + "'";
		}
		
		sql += PARAM_TX1;
		sql += PARAM_TX2;

		sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_SPChungGU_Chk_UDP_SLNSERR_001 \n";
			G_INFO += "설명 : 판정의사 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " PENCRT_KD : " + PENCRT_KD + " \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " PSNL_NM : " + PSNL_NM + " \n";
			G_INFO += " PARAM_TX1 : " + PARAM_TX1 + " \n";
			G_INFO += " PARAM_TX2 : " + PARAM_TX2 + " \n";
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
		<s:AttributeType name='ICR_PENL_ID' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='3'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='4'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_EXAM_DT' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_EXAM_CHA' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SLNS_PLACE' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_HOLIDAY_YN' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_DT2' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_SQ2' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_XRAY_NO' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='40'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_XRAY_CD' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_MEDI_CNT' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_XDOC_CD' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='POTOGRFNO_DOCTRLCN' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_DDOC_CD' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='DSGR_DOCTRLCN' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='S0020_YN' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='TCNXPRT_NM' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='TCNXPRT_LCN' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_XRFM_CD' rs:number='22' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SBE_MEDI_YN' rs:number='23' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String SBE_EXAM_DT_T = cRsList.getString("SBE_EXAM_DT");
			String SBE_EXAM_CHA_T = cRsList.getString("SBE_EXAM_CHA");
			String SLNS_PLACE_T = cRsList.getString("SLNS_PLACE");
			String EEA_HOLIDAY_YN_T = cRsList.getString("EEA_HOLIDAY_YN");
			String SIR_EXAM_DT2_T = cRsList.getString("SIR_EXAM_DT2");
			String SIR_EXAM_SQ2_T = cRsList.getString("SIR_EXAM_SQ2");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String SBE_XRAY_NO_T = cRsList.getString("SBE_XRAY_NO");
			String SBE_XRAY_CD_T = cRsList.getString("SBE_XRAY_CD");
			String SBE_MEDI_CNT_T = cRsList.getString("SBE_MEDI_CNT");
			String SBE_XDOC_CD_T = cRsList.getString("SBE_XDOC_CD");
			String POTOGRFNO_DOCTRLCN_T = cRsList.getString("POTOGRFNO_DOCTRLCN");
			String SBE_DDOC_CD_T = cRsList.getString("SBE_DDOC_CD");
			String DSGR_DOCTRLCN_T = cRsList.getString("DSGR_DOCTRLCN");
			String S0020_YN_T = cRsList.getString("S0020_YN");
			String TCNXPRT_NM_T = cRsList.getString("TCNXPRT_NM");
			String TCNXPRT_LCN_T = cRsList.getString("TCNXPRT_LCN");
			String SBE_XRFM_CD_T = cRsList.getString("SBE_XRFM_CD");
			String SBE_MEDI_YN_T = cRsList.getString("SBE_MEDI_YN");
%>
			<z:row
<%
			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
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

			if(! SBE_EXAM_DT_T.equals("")) {
%>
		 		SBE_EXAM_DT='<%= SBE_EXAM_DT_T%>'
<%
			}

			if(! SBE_EXAM_CHA_T.equals("")) {
%>
		 		SBE_EXAM_CHA='<%= SBE_EXAM_CHA_T%>'
<%
			}

			if(! SLNS_PLACE_T.equals("")) {
%>
		 		SLNS_PLACE='<%= SLNS_PLACE_T%>'
<%
			}

			if(! EEA_HOLIDAY_YN_T.equals("")) {
%>
		 		EEA_HOLIDAY_YN='<%= EEA_HOLIDAY_YN_T%>'
<%
			}

			if(! SIR_EXAM_DT2_T.equals("")) {
%>
		 		SIR_EXAM_DT2='<%= SIR_EXAM_DT2_T%>'
<%
			}

			if(! SIR_EXAM_SQ2_T.equals("")) {
%>
		 		SIR_EXAM_SQ2='<%= SIR_EXAM_SQ2_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! SBE_XRAY_NO_T.equals("")) {
%>
		 		SBE_XRAY_NO='<%= SBE_XRAY_NO_T%>'
<%
			}

			if(! SBE_XRAY_CD_T.equals("")) {
%>
		 		SBE_XRAY_CD='<%= SBE_XRAY_CD_T%>'
<%
			}

			if(! SBE_MEDI_CNT_T.equals("")) {
%>
		 		SBE_MEDI_CNT='<%= SBE_MEDI_CNT_T%>'
<%
			}

			if(! SBE_XDOC_CD_T.equals("")) {
%>
		 		SBE_XDOC_CD='<%= SBE_XDOC_CD_T%>'
<%
			}

			if(! POTOGRFNO_DOCTRLCN_T.equals("")) {
%>
		 		POTOGRFNO_DOCTRLCN='<%= POTOGRFNO_DOCTRLCN_T%>'
<%
			}

			if(! SBE_DDOC_CD_T.equals("")) {
%>
		 		SBE_DDOC_CD='<%= SBE_DDOC_CD_T%>'
<%
			}

			if(! DSGR_DOCTRLCN_T.equals("")) {
%>
		 		DSGR_DOCTRLCN='<%= DSGR_DOCTRLCN_T%>'
<%
			}

			if(! S0020_YN_T.equals("")) {
%>
		 		S0020_YN='<%= S0020_YN_T%>'
<%
			}

			if(! TCNXPRT_NM_T.equals("")) {
%>
		 		TCNXPRT_NM='<%= TCNXPRT_NM_T%>'
<%
			}

			if(! TCNXPRT_LCN_T.equals("")) {
%>
		 		TCNXPRT_LCN='<%= TCNXPRT_LCN_T%>'
<%
			}

			if(! SBE_XRFM_CD_T.equals("")) {
%>
		 		SBE_XRFM_CD='<%= SBE_XRFM_CD_T%>'
<%
			}

			if(! SBE_MEDI_YN_T.equals("")) {
%>
		 		SBE_MEDI_YN='<%= SBE_MEDI_YN_T%>'
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
