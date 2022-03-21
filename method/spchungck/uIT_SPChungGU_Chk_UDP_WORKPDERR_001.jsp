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
       A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, B.SPB_EXAM_DT,  B.SPB_EXAM_CHA,
       B.SPB_GOJU_CD, B.SPB_FROM_DT, B.SPB_TO_DT,   B.SPB_YEAR_VAL, B.SPB_ETC_TX 
  FROM ET_EXAM_ACPT A 
       LEFT OUTER JOIN ST_PASTJOB B ON A.EEA_EXAM_DT = B.SPB_EXAM_DT AND A.EEA_EXAM_SQ = B.SPB_EXAM_SQ 
       LEFT OUTER JOIN ST_BASE C    ON A.EEA_EXAM_DT = C.SBE_EXAM_DT AND A.EEA_EXAM_SQ = C.SBE_EXAM_SQ
 WHERE A.EEA_EXAM_DT >= :EXAM_SDT 
   AND A.EEA_EXAM_DT <= :EXAM_EDT                                                                                            
   AND A.EEA_COMP_CD  = :COMP_CD              
   AND SUBSTR(EEA_MNGT_SPYM, 1, 4) = :MNGT_YR  
   AND A.EEA_ORDER_YN <> 'C'
   AND C.SBE_PANJ_YN  = 'Y' 
   AND C.SBE_EXAM_CHA = '1'

IF (:PSNL_NM <> '') THEN 
  AND A.EEA_PSNL_NM = :PSNL_NM
  
:PARAM_TX1
:PARAM_TX2

 ORDER BY A.EEA_EXAM_DT, A.EEA_EXAM_SQ

		*/

		sql = " SELECT CASE '" + PENCRT_KD + "' WHEN '1' THEN F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '1') WHEN '2' THEN ECL_DECRYPT(F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '1')) ELSE F_PERID_FIND1(A.EEA_EXAM_DT, A.EEA_EXAM_SQ, '0') END ICR_PENL_ID";
		sql += ", A.EEA_EXAM_DT, A.EEA_EXAM_SQ, A.EEA_PSNL_NM, B.SPB_EXAM_DT, B.SPB_EXAM_CHA, B.SPB_GOJU_CD, B.SPB_FROM_DT, B.SPB_TO_DT, B.SPB_YEAR_VAL, B.SPB_ETC_TX";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ST_PASTJOB B";
		sql += " ON A.EEA_EXAM_DT = B.SPB_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.SPB_EXAM_SQ LEFT OUTER JOIN ST_BASE C";
		sql += " ON A.EEA_EXAM_DT = C.SBE_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = C.SBE_EXAM_SQ";
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
			G_INFO += "서비스명 : uIT_SPChungGU_Chk_UDP_WORKPDERR_001 \n";
			G_INFO += "설명 : 과거직력 조회 \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='4' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_EXAM_DT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_EXAM_CHA' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_EXAM_CHA'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_GOJU_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_GOJU_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_FROM_DT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_FROM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_TO_DT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_TO_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_YEAR_VAL' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_YEAR_VAL'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_ETC_TX' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_ETC_TX'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='12' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c12' rs:name='ROWID' rs:number='13' rs:rowid='true' rs:basetable='ST_PASTJOB' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c13' rs:name='ROWID' rs:number='14' rs:rowid='true' rs:basetable='ST_BASE' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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

			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String SPB_EXAM_DT_T = cRsList.getString("SPB_EXAM_DT");
			String SPB_EXAM_CHA_T = cRsList.getString("SPB_EXAM_CHA");
			String SPB_GOJU_CD_T = cRsList.getString("SPB_GOJU_CD");
			String SPB_FROM_DT_T = cRsList.getString("SPB_FROM_DT");
			String SPB_TO_DT_T = cRsList.getString("SPB_TO_DT");
			String SPB_YEAR_VAL_T = cRsList.getString("SPB_YEAR_VAL");
			String SPB_ETC_TX_T = cRsList.getString("SPB_ETC_TX");
			String ROWID_T = cRsList.getString("ROWID");
			String c12_T = cRsList.getString("c12");
			String c13_T = cRsList.getString("c13");
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

			if(! SPB_EXAM_DT_T.equals("")) {
%>
		 		SPB_EXAM_DT='<%= SPB_EXAM_DT_T%>'
<%
			}

			if(! SPB_EXAM_CHA_T.equals("")) {
%>
		 		SPB_EXAM_CHA='<%= SPB_EXAM_CHA_T%>'
<%
			}

			if(! SPB_GOJU_CD_T.equals("")) {
%>
		 		SPB_GOJU_CD='<%= SPB_GOJU_CD_T%>'
<%
			}

			if(! SPB_FROM_DT_T.equals("")) {
%>
		 		SPB_FROM_DT='<%= SPB_FROM_DT_T%>'
<%
			}

			if(! SPB_TO_DT_T.equals("")) {
%>
		 		SPB_TO_DT='<%= SPB_TO_DT_T%>'
<%
			}

			if(! SPB_YEAR_VAL_T.equals("")) {
%>
		 		SPB_YEAR_VAL='<%= SPB_YEAR_VAL_T%>'
<%
			}

			if(! SPB_ETC_TX_T.equals("")) {
%>
		 		SPB_ETC_TX='<%= SPB_ETC_TX_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c12='<%= cnt%>'
				c13='<%= cnt%>'
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
