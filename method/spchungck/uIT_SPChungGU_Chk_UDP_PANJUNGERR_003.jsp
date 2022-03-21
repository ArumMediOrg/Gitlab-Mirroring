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
       A.EEA_EXAM_DT, A.EEA_EXAM_SQ,  A.EEA_PSNL_NM,
       F.SIR_EXAM_DT2, F.SIR_EXAM_SQ2, 
       B.SPG_EXAM_DT, B.SPG_MATT_CD, B.SPG_ORGA_CD,  B.SPG_SWING_CD, B.SPG_SLNS_KD, B.SPG_PANJ_DT,
       CASE WHEN B.SPG_EXAM_CHA = '1' THEN B.SPG_SOKY_CD  ELSE '' END SPG_SOKY_CD1,   
       CASE WHEN B.SPG_EXAM_CHA = '1' THEN B.SPG_SOKY_NM  ELSE '' END SPG_SOKY_NM1,   
       CASE WHEN B.SPG_EXAM_CHA = '1' THEN B.SPG_PANJ_CD  ELSE '' END SPG_PANJ_CD1,   
       CASE WHEN B.SPG_EXAM_CHA = '1' THEN B.SPG_JOCHI_CD ELSE '' END SPG_JOCHI_CD1, 
       CASE WHEN B.SPG_EXAM_CHA = '1' THEN B.SPG_JOCHI_NM ELSE '' END SPG_JOCHI_NM1  
  FROM ET_EXAM_ACPT A 
       LEFT OUTER JOIN ST_PANJUNG      B ON B.SPG_EXAM_DT = A.EEA_EXAM_DT AND B.SPG_EXAM_SQ = A.EEA_EXAM_SQ 
       LEFT OUTER JOIN ST_BASE         C ON C.SBE_EXAM_DT = A.EEA_EXAM_DT AND C.SBE_EXAM_SQ = A.EEA_EXAM_SQ 
       LEFT OUTER JOIN ST_ITEM_RECHECK F ON F.SIR_EXAM_DT = A.EEA_EXAM_DT AND F.SIR_EXAM_SQ = A.EEA_EXAM_SQ
 WHERE A.EEA_EXAM_DT >= :EXAM_SDT 
   AND A.EEA_EXAM_DT <= :EXAM_EDT
   AND A.EEA_COMP_CD  = :COMP_CD
   AND SUBSTR(EEA_MNGT_SPYM, 1, 4) = :MNGT_YR  
   AND A.EEA_ORDER_YN <> 'C'
   AND C.SBE_PANJ_YN  = 'Y' 
   AND C.SBE_EXAM_CHA = '1' 

IF (:PSNL_NM <> '') THEN 
  AND  A.EEA_PSNL_NM = :PSNL_NM
  
:PARAM_TX1
:PARAM_TX2

 ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ
		*/

		sql = " SELECT CASE '" + PENCRT_KD + "' WHEN '1' THEN F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '1') WHEN '2' THEN ECL_DECRYPT(F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '1')) ELSE F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '0') END ICR_PENL_ID";
		sql += ", A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, F.SIR_EXAM_DT2, F.SIR_EXAM_SQ2, B.SPG_EXAM_DT, B.SPG_MATT_CD, B.SPG_ORGA_CD, B.SPG_SWING_CD, B.SPG_SLNS_KD, B.SPG_PANJ_DT";
		sql += ", CASE WHEN B.SPG_EXAM_CHA = '1' THEN B.SPG_SOKY_CD ELSE '' END SPG_SOKY_CD1";
		sql += ", CASE WHEN B.SPG_EXAM_CHA = '1' THEN B.SPG_SOKY_NM ELSE '' END SPG_SOKY_NM1";
		sql += ", CASE WHEN B.SPG_EXAM_CHA = '1' THEN B.SPG_PANJ_CD ELSE '' END SPG_PANJ_CD1";
		sql += ", CASE WHEN B.SPG_EXAM_CHA = '1' THEN B.SPG_JOCHI_CD ELSE '' END SPG_JOCHI_CD1";
		sql += ", CASE WHEN B.SPG_EXAM_CHA = '1' THEN B.SPG_JOCHI_NM ELSE '' END SPG_JOCHI_NM1";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ST_PANJUNG B";
		sql += " ON B.SPG_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND B.SPG_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ST_BASE C";
		sql += " ON C.SBE_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND C.SBE_EXAM_SQ = A.EEA_EXAM_SQ LEFT OUTER JOIN ST_ITEM_RECHECK F";
		sql += " ON F.SIR_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND F.SIR_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT >= '" + EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + EXAM_EDT + "'";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND SUBSTR(EEA_MNGT_SPYM, 1, 4) = '" + MNGT_YR + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";
		sql += " AND C.SBE_PANJ_YN = 'Y'";
		sql += " AND C.SBE_EXAM_CHA = '1'";

		if(! PSNL_NM.equals("")) {
			sql += " AND A.EEA_PSNL_NM = '" + PSNL_NM + "'";
		}
		sql += PARAM_TX1;
		sql += PARAM_TX2;

		sql += " ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_SPChungGU_Chk_UDP_PANJUNGERR_003 \n";
			G_INFO += "설명 : 2차 판정 조회 \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='2' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='3' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='4' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_DT2' rs:number='5' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EXAM_DT2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_SQ2' rs:number='6' rs:nullable='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EXAM_SQ2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_EXAM_DT' rs:number='7' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_MATT_CD' rs:number='8' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_ORGA_CD' rs:number='9' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_ORGA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SWING_CD' rs:number='10' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_SWING_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SLNS_KD' rs:number='11' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_SLNS_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_DT' rs:number='12' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_PANJ_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SOKY_CD1' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_SOKY_NM1' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_PANJ_CD1' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_JOCHI_CD1' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_JOCHI_NM1' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
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
			String SIR_EXAM_DT2_T = cRsList.getString("SIR_EXAM_DT2");
			String SIR_EXAM_SQ2_T = cRsList.getString("SIR_EXAM_SQ2");
			String SPG_EXAM_DT_T = cRsList.getString("SPG_EXAM_DT");
			String SPG_MATT_CD_T = cRsList.getString("SPG_MATT_CD");
			String SPG_ORGA_CD_T = cRsList.getString("SPG_ORGA_CD");
			String SPG_SWING_CD_T = cRsList.getString("SPG_SWING_CD");
			String SPG_SLNS_KD_T = cRsList.getString("SPG_SLNS_KD");
			String SPG_PANJ_DT_T = cRsList.getString("SPG_PANJ_DT");
			String SPG_SOKY_CD1_T = cRsList.getString("SPG_SOKY_CD1");
			String SPG_SOKY_NM1_T = cRsList.getString("SPG_SOKY_NM1");
			String SPG_PANJ_CD1_T = cRsList.getString("SPG_PANJ_CD1");
			String SPG_JOCHI_CD1_T = cRsList.getString("SPG_JOCHI_CD1");
			String SPG_JOCHI_NM1_T = cRsList.getString("SPG_JOCHI_NM1");
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

			if(! SPG_EXAM_DT_T.equals("")) {
%>
		 		SPG_EXAM_DT='<%= SPG_EXAM_DT_T%>'
<%
			}

			if(! SPG_MATT_CD_T.equals("")) {
%>
		 		SPG_MATT_CD='<%= SPG_MATT_CD_T%>'
<%
			}

			if(! SPG_ORGA_CD_T.equals("")) {
%>
		 		SPG_ORGA_CD='<%= SPG_ORGA_CD_T%>'
<%
			}

			if(! SPG_SWING_CD_T.equals("")) {
%>
		 		SPG_SWING_CD='<%= SPG_SWING_CD_T%>'
<%
			}

			if(! SPG_SLNS_KD_T.equals("")) {
%>
		 		SPG_SLNS_KD='<%= SPG_SLNS_KD_T%>'
<%
			}

			if(! SPG_PANJ_DT_T.equals("")) {
%>
		 		SPG_PANJ_DT='<%= SPG_PANJ_DT_T%>'
<%
			}

			if(! SPG_SOKY_CD1_T.equals("")) {
%>
		 		SPG_SOKY_CD1='<%= SPG_SOKY_CD1_T%>'
<%
			}

			if(! SPG_SOKY_NM1_T.equals("")) {
%>
		 		SPG_SOKY_NM1='<%= SPG_SOKY_NM1_T%>'
<%
			}

			if(! SPG_PANJ_CD1_T.equals("")) {
%>
		 		SPG_PANJ_CD1='<%= SPG_PANJ_CD1_T%>'
<%
			}

			if(! SPG_JOCHI_CD1_T.equals("")) {
%>
		 		SPG_JOCHI_CD1='<%= SPG_JOCHI_CD1_T%>'
<%
			}

			if(! SPG_JOCHI_NM1_T.equals("")) {
%>
		 		SPG_JOCHI_NM1='<%= SPG_JOCHI_NM1_T%>'
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
