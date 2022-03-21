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
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String EXAM_CHA = htMethod.get("EXAM_CHA");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(EXAM_CHA == null) { EXAM_CHA = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.SBE_DDOC_CD, A.*
  FROM ST_DENTAL A LEFT OUTER JOIN ST_BASE B
       ON A.SDP_EXAM_DT = B.SBE_EXAM_DT AND A.SDP_EXAM_SQ = B.SBE_EXAM_SQ AND A.SDP_EXAM_CHA = B.SBE_EXAM_CHA
 WHERE A.SDP_EXAM_DT  = :EXAM_DT
   AND A.SDP_EXAM_SQ  = :EXAM_SQ
   AND A.SDP_EXAM_CHA = :EXAM_CHA
		*/

		sql = " SELECT B.SBE_DDOC_CD, A.*";
		sql += " FROM ST_DENTAL A LEFT OUTER JOIN ST_BASE B";
		sql += " ON A.SDP_EXAM_DT = B.SBE_EXAM_DT";
		sql += " AND A.SDP_EXAM_SQ = B.SBE_EXAM_SQ";
		sql += " AND A.SDP_EXAM_CHA = B.SBE_EXAM_CHA";
		sql += " WHERE A.SDP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND A.SDP_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND A.SDP_EXAM_CHA = '" + EXAM_CHA + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_UP_DentalDisplay_001 \n";
			G_INFO += "설명 : 치아검사 결과 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " EXAM_CHA : " + EXAM_CHA + " \n";
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
		<s:AttributeType name='SBE_DDOC_CD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_BASE'
			 rs:basecolumn='SBE_DDOC_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_EXAM_DT' rs:number='2' rs:writeunknown='true' rs:basetable='ST_DENTAL' rs:basecolumn='SDP_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_EXAM_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ST_DENTAL' rs:basecolumn='SDP_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_EXAM_CHA' rs:number='4' rs:writeunknown='true' rs:basetable='ST_DENTAL' rs:basecolumn='SDP_EXAM_CHA'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL7_YN' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL7_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL6_YN' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL6_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL5_YN' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL4_YN' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL3_YN' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL2_YN' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUL1_YN' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUL1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR1_YN' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR2_YN' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR3_YN' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR4_YN' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR5_YN' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR6_YN' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR6_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR7_YN' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR7_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GUR8_YN' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GUR8_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL7_YN' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL7_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL6_YN' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL6_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL5_YN' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL4_YN' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL3_YN' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL2_YN' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDL1_YN' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDL1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR1_YN' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR2_YN' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR3_YN' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR4_YN' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR5_YN' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR6_YN' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR6_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR7_YN' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR7_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_GDR8_YN' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_GDR8_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BUL_YN' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BUL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BUF_YN' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BUF_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BUR_YN' rs:number='37' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BUR_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BDL_YN' rs:number='38' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BDL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BDF_YN' rs:number='39' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BDF_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BDR_YN' rs:number='40' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BDR_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_BRSLT_TX' rs:number='41' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_BRSLT_TX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DE0_YN' rs:number='42' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DE0_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DE1_YN' rs:number='43' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DE1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DE2_YN' rs:number='44' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DE2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DE3_YN' rs:number='45' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DE3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DE4_YN' rs:number='46' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DE4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DE5_YN' rs:number='47' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DE5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_PT0_YN' rs:number='48' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_PT0_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_PT1_YN' rs:number='49' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_PT1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_PT2_YN' rs:number='50' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_PT2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_PT3_YN' rs:number='51' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_PT3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_PT4_YN' rs:number='52' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_PT4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P0_YN' rs:number='53' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P0_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P1_YN' rs:number='54' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P1_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P2_YN' rs:number='55' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P2_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P3_YN' rs:number='56' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P3_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P4_YN' rs:number='57' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P4_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P5_YN' rs:number='58' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P5_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_P5_ETC' rs:number='59' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_P5_ETC'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_DENT_DT' rs:number='60' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_DENT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_HOSP_CD' rs:number='61' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_HOSP_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_INPT_ID' rs:number='62' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_INPT_DTT' rs:number='63' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_MODI_ID' rs:number='64' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SDP_MODI_DTT' rs:number='65' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_DENTAL'
			 rs:basecolumn='SDP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='66' rs:rowid='true' rs:basetable='ST_DENTAL' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c66' rs:name='ROWID' rs:number='67' rs:rowid='true' rs:basetable='ST_BASE' rs:basecolumn='ROWID'
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

			String SBE_DDOC_CD_T = cRsList.getString("SBE_DDOC_CD");
			String SDP_EXAM_DT_T = cRsList.getString("SDP_EXAM_DT");
			String SDP_EXAM_SQ_T = cRsList.getString("SDP_EXAM_SQ");
			String SDP_EXAM_CHA_T = cRsList.getString("SDP_EXAM_CHA");
			String SDP_GUL7_YN_T = cRsList.getString("SDP_GUL7_YN");
			String SDP_GUL6_YN_T = cRsList.getString("SDP_GUL6_YN");
			String SDP_GUL5_YN_T = cRsList.getString("SDP_GUL5_YN");
			String SDP_GUL4_YN_T = cRsList.getString("SDP_GUL4_YN");
			String SDP_GUL3_YN_T = cRsList.getString("SDP_GUL3_YN");
			String SDP_GUL2_YN_T = cRsList.getString("SDP_GUL2_YN");
			String SDP_GUL1_YN_T = cRsList.getString("SDP_GUL1_YN");
			String SDP_GUR1_YN_T = cRsList.getString("SDP_GUR1_YN");
			String SDP_GUR2_YN_T = cRsList.getString("SDP_GUR2_YN");
			String SDP_GUR3_YN_T = cRsList.getString("SDP_GUR3_YN");
			String SDP_GUR4_YN_T = cRsList.getString("SDP_GUR4_YN");
			String SDP_GUR5_YN_T = cRsList.getString("SDP_GUR5_YN");
			String SDP_GUR6_YN_T = cRsList.getString("SDP_GUR6_YN");
			String SDP_GUR7_YN_T = cRsList.getString("SDP_GUR7_YN");
			String SDP_GUR8_YN_T = cRsList.getString("SDP_GUR8_YN");
			String SDP_GDL7_YN_T = cRsList.getString("SDP_GDL7_YN");
			String SDP_GDL6_YN_T = cRsList.getString("SDP_GDL6_YN");
			String SDP_GDL5_YN_T = cRsList.getString("SDP_GDL5_YN");
			String SDP_GDL4_YN_T = cRsList.getString("SDP_GDL4_YN");
			String SDP_GDL3_YN_T = cRsList.getString("SDP_GDL3_YN");
			String SDP_GDL2_YN_T = cRsList.getString("SDP_GDL2_YN");
			String SDP_GDL1_YN_T = cRsList.getString("SDP_GDL1_YN");
			String SDP_GDR1_YN_T = cRsList.getString("SDP_GDR1_YN");
			String SDP_GDR2_YN_T = cRsList.getString("SDP_GDR2_YN");
			String SDP_GDR3_YN_T = cRsList.getString("SDP_GDR3_YN");
			String SDP_GDR4_YN_T = cRsList.getString("SDP_GDR4_YN");
			String SDP_GDR5_YN_T = cRsList.getString("SDP_GDR5_YN");
			String SDP_GDR6_YN_T = cRsList.getString("SDP_GDR6_YN");
			String SDP_GDR7_YN_T = cRsList.getString("SDP_GDR7_YN");
			String SDP_GDR8_YN_T = cRsList.getString("SDP_GDR8_YN");
			String SDP_BUL_YN_T = cRsList.getString("SDP_BUL_YN");
			String SDP_BUF_YN_T = cRsList.getString("SDP_BUF_YN");
			String SDP_BUR_YN_T = cRsList.getString("SDP_BUR_YN");
			String SDP_BDL_YN_T = cRsList.getString("SDP_BDL_YN");
			String SDP_BDF_YN_T = cRsList.getString("SDP_BDF_YN");
			String SDP_BDR_YN_T = cRsList.getString("SDP_BDR_YN");
			String SDP_BRSLT_TX_T = cRsList.getString("SDP_BRSLT_TX");
			String SDP_DE0_YN_T = cRsList.getString("SDP_DE0_YN");
			String SDP_DE1_YN_T = cRsList.getString("SDP_DE1_YN");
			String SDP_DE2_YN_T = cRsList.getString("SDP_DE2_YN");
			String SDP_DE3_YN_T = cRsList.getString("SDP_DE3_YN");
			String SDP_DE4_YN_T = cRsList.getString("SDP_DE4_YN");
			String SDP_DE5_YN_T = cRsList.getString("SDP_DE5_YN");
			String SDP_PT0_YN_T = cRsList.getString("SDP_PT0_YN");
			String SDP_PT1_YN_T = cRsList.getString("SDP_PT1_YN");
			String SDP_PT2_YN_T = cRsList.getString("SDP_PT2_YN");
			String SDP_PT3_YN_T = cRsList.getString("SDP_PT3_YN");
			String SDP_PT4_YN_T = cRsList.getString("SDP_PT4_YN");
			String SDP_P0_YN_T = cRsList.getString("SDP_P0_YN");
			String SDP_P1_YN_T = cRsList.getString("SDP_P1_YN");
			String SDP_P2_YN_T = cRsList.getString("SDP_P2_YN");
			String SDP_P3_YN_T = cRsList.getString("SDP_P3_YN");
			String SDP_P4_YN_T = cRsList.getString("SDP_P4_YN");
			String SDP_P5_YN_T = cRsList.getString("SDP_P5_YN");
			String SDP_P5_ETC_T = cRsList.getString("SDP_P5_ETC");
			String SDP_DENT_DT_T = cRsList.getString("SDP_DENT_DT");
			String SDP_HOSP_CD_T = cRsList.getString("SDP_HOSP_CD");
			String SDP_INPT_ID_T = cRsList.getString("SDP_INPT_ID");
			String SDP_INPT_DTT_T = cRsList.getDate2("SDP_INPT_DTT");
			String SDP_MODI_ID_T = cRsList.getString("SDP_MODI_ID");
			String SDP_MODI_DTT_T = cRsList.getDate2("SDP_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
			String c66_T = cRsList.getString("c66");
%>
			<z:row
<%
			if(! SBE_DDOC_CD_T.equals("")) {
%>
		 		SBE_DDOC_CD='<%= SBE_DDOC_CD_T%>'
<%
			}

			if(! SDP_EXAM_DT_T.equals("")) {
%>
		 		SDP_EXAM_DT='<%= SDP_EXAM_DT_T%>'
<%
			}

			if(! SDP_EXAM_SQ_T.equals("")) {
%>
		 		SDP_EXAM_SQ='<%= SDP_EXAM_SQ_T%>'
<%
			}

			if(! SDP_EXAM_CHA_T.equals("")) {
%>
		 		SDP_EXAM_CHA='<%= SDP_EXAM_CHA_T%>'
<%
			}

			if(! SDP_GUL7_YN_T.equals("")) {
%>
		 		SDP_GUL7_YN='<%= SDP_GUL7_YN_T%>'
<%
			}

			if(! SDP_GUL6_YN_T.equals("")) {
%>
		 		SDP_GUL6_YN='<%= SDP_GUL6_YN_T%>'
<%
			}

			if(! SDP_GUL5_YN_T.equals("")) {
%>
		 		SDP_GUL5_YN='<%= SDP_GUL5_YN_T%>'
<%
			}

			if(! SDP_GUL4_YN_T.equals("")) {
%>
		 		SDP_GUL4_YN='<%= SDP_GUL4_YN_T%>'
<%
			}

			if(! SDP_GUL3_YN_T.equals("")) {
%>
		 		SDP_GUL3_YN='<%= SDP_GUL3_YN_T%>'
<%
			}

			if(! SDP_GUL2_YN_T.equals("")) {
%>
		 		SDP_GUL2_YN='<%= SDP_GUL2_YN_T%>'
<%
			}

			if(! SDP_GUL1_YN_T.equals("")) {
%>
		 		SDP_GUL1_YN='<%= SDP_GUL1_YN_T%>'
<%
			}

			if(! SDP_GUR1_YN_T.equals("")) {
%>
		 		SDP_GUR1_YN='<%= SDP_GUR1_YN_T%>'
<%
			}

			if(! SDP_GUR2_YN_T.equals("")) {
%>
		 		SDP_GUR2_YN='<%= SDP_GUR2_YN_T%>'
<%
			}

			if(! SDP_GUR3_YN_T.equals("")) {
%>
		 		SDP_GUR3_YN='<%= SDP_GUR3_YN_T%>'
<%
			}

			if(! SDP_GUR4_YN_T.equals("")) {
%>
		 		SDP_GUR4_YN='<%= SDP_GUR4_YN_T%>'
<%
			}

			if(! SDP_GUR5_YN_T.equals("")) {
%>
		 		SDP_GUR5_YN='<%= SDP_GUR5_YN_T%>'
<%
			}

			if(! SDP_GUR6_YN_T.equals("")) {
%>
		 		SDP_GUR6_YN='<%= SDP_GUR6_YN_T%>'
<%
			}

			if(! SDP_GUR7_YN_T.equals("")) {
%>
		 		SDP_GUR7_YN='<%= SDP_GUR7_YN_T%>'
<%
			}

			if(! SDP_GUR8_YN_T.equals("")) {
%>
		 		SDP_GUR8_YN='<%= SDP_GUR8_YN_T%>'
<%
			}

			if(! SDP_GDL7_YN_T.equals("")) {
%>
		 		SDP_GDL7_YN='<%= SDP_GDL7_YN_T%>'
<%
			}

			if(! SDP_GDL6_YN_T.equals("")) {
%>
		 		SDP_GDL6_YN='<%= SDP_GDL6_YN_T%>'
<%
			}

			if(! SDP_GDL5_YN_T.equals("")) {
%>
		 		SDP_GDL5_YN='<%= SDP_GDL5_YN_T%>'
<%
			}

			if(! SDP_GDL4_YN_T.equals("")) {
%>
		 		SDP_GDL4_YN='<%= SDP_GDL4_YN_T%>'
<%
			}

			if(! SDP_GDL3_YN_T.equals("")) {
%>
		 		SDP_GDL3_YN='<%= SDP_GDL3_YN_T%>'
<%
			}

			if(! SDP_GDL2_YN_T.equals("")) {
%>
		 		SDP_GDL2_YN='<%= SDP_GDL2_YN_T%>'
<%
			}

			if(! SDP_GDL1_YN_T.equals("")) {
%>
		 		SDP_GDL1_YN='<%= SDP_GDL1_YN_T%>'
<%
			}

			if(! SDP_GDR1_YN_T.equals("")) {
%>
		 		SDP_GDR1_YN='<%= SDP_GDR1_YN_T%>'
<%
			}

			if(! SDP_GDR2_YN_T.equals("")) {
%>
		 		SDP_GDR2_YN='<%= SDP_GDR2_YN_T%>'
<%
			}

			if(! SDP_GDR3_YN_T.equals("")) {
%>
		 		SDP_GDR3_YN='<%= SDP_GDR3_YN_T%>'
<%
			}

			if(! SDP_GDR4_YN_T.equals("")) {
%>
		 		SDP_GDR4_YN='<%= SDP_GDR4_YN_T%>'
<%
			}

			if(! SDP_GDR5_YN_T.equals("")) {
%>
		 		SDP_GDR5_YN='<%= SDP_GDR5_YN_T%>'
<%
			}

			if(! SDP_GDR6_YN_T.equals("")) {
%>
		 		SDP_GDR6_YN='<%= SDP_GDR6_YN_T%>'
<%
			}

			if(! SDP_GDR7_YN_T.equals("")) {
%>
		 		SDP_GDR7_YN='<%= SDP_GDR7_YN_T%>'
<%
			}

			if(! SDP_GDR8_YN_T.equals("")) {
%>
		 		SDP_GDR8_YN='<%= SDP_GDR8_YN_T%>'
<%
			}

			if(! SDP_BUL_YN_T.equals("")) {
%>
		 		SDP_BUL_YN='<%= SDP_BUL_YN_T%>'
<%
			}

			if(! SDP_BUF_YN_T.equals("")) {
%>
		 		SDP_BUF_YN='<%= SDP_BUF_YN_T%>'
<%
			}

			if(! SDP_BUR_YN_T.equals("")) {
%>
		 		SDP_BUR_YN='<%= SDP_BUR_YN_T%>'
<%
			}

			if(! SDP_BDL_YN_T.equals("")) {
%>
		 		SDP_BDL_YN='<%= SDP_BDL_YN_T%>'
<%
			}

			if(! SDP_BDF_YN_T.equals("")) {
%>
		 		SDP_BDF_YN='<%= SDP_BDF_YN_T%>'
<%
			}

			if(! SDP_BDR_YN_T.equals("")) {
%>
		 		SDP_BDR_YN='<%= SDP_BDR_YN_T%>'
<%
			}

			if(! SDP_BRSLT_TX_T.equals("")) {
%>
		 		SDP_BRSLT_TX='<%= SDP_BRSLT_TX_T%>'
<%
			}

			if(! SDP_DE0_YN_T.equals("")) {
%>
		 		SDP_DE0_YN='<%= SDP_DE0_YN_T%>'
<%
			}

			if(! SDP_DE1_YN_T.equals("")) {
%>
		 		SDP_DE1_YN='<%= SDP_DE1_YN_T%>'
<%
			}

			if(! SDP_DE2_YN_T.equals("")) {
%>
		 		SDP_DE2_YN='<%= SDP_DE2_YN_T%>'
<%
			}

			if(! SDP_DE3_YN_T.equals("")) {
%>
		 		SDP_DE3_YN='<%= SDP_DE3_YN_T%>'
<%
			}

			if(! SDP_DE4_YN_T.equals("")) {
%>
		 		SDP_DE4_YN='<%= SDP_DE4_YN_T%>'
<%
			}

			if(! SDP_DE5_YN_T.equals("")) {
%>
		 		SDP_DE5_YN='<%= SDP_DE5_YN_T%>'
<%
			}

			if(! SDP_PT0_YN_T.equals("")) {
%>
		 		SDP_PT0_YN='<%= SDP_PT0_YN_T%>'
<%
			}

			if(! SDP_PT1_YN_T.equals("")) {
%>
		 		SDP_PT1_YN='<%= SDP_PT1_YN_T%>'
<%
			}

			if(! SDP_PT2_YN_T.equals("")) {
%>
		 		SDP_PT2_YN='<%= SDP_PT2_YN_T%>'
<%
			}

			if(! SDP_PT3_YN_T.equals("")) {
%>
		 		SDP_PT3_YN='<%= SDP_PT3_YN_T%>'
<%
			}

			if(! SDP_PT4_YN_T.equals("")) {
%>
		 		SDP_PT4_YN='<%= SDP_PT4_YN_T%>'
<%
			}

			if(! SDP_P0_YN_T.equals("")) {
%>
		 		SDP_P0_YN='<%= SDP_P0_YN_T%>'
<%
			}

			if(! SDP_P1_YN_T.equals("")) {
%>
		 		SDP_P1_YN='<%= SDP_P1_YN_T%>'
<%
			}

			if(! SDP_P2_YN_T.equals("")) {
%>
		 		SDP_P2_YN='<%= SDP_P2_YN_T%>'
<%
			}

			if(! SDP_P3_YN_T.equals("")) {
%>
		 		SDP_P3_YN='<%= SDP_P3_YN_T%>'
<%
			}

			if(! SDP_P4_YN_T.equals("")) {
%>
		 		SDP_P4_YN='<%= SDP_P4_YN_T%>'
<%
			}

			if(! SDP_P5_YN_T.equals("")) {
%>
		 		SDP_P5_YN='<%= SDP_P5_YN_T%>'
<%
			}

			if(! SDP_P5_ETC_T.equals("")) {
%>
		 		SDP_P5_ETC='<%= SDP_P5_ETC_T%>'
<%
			}

			if(! SDP_DENT_DT_T.equals("")) {
%>
		 		SDP_DENT_DT='<%= SDP_DENT_DT_T%>'
<%
			}

			if(! SDP_HOSP_CD_T.equals("")) {
%>
		 		SDP_HOSP_CD='<%= SDP_HOSP_CD_T%>'
<%
			}

			if(! SDP_INPT_ID_T.equals("")) {
%>
		 		SDP_INPT_ID='<%= SDP_INPT_ID_T%>'
<%
			}

			if(! SDP_INPT_DTT_T.equals("")) {
%>
		 		SDP_INPT_DTT='<%= SDP_INPT_DTT_T%>'
<%
			}

			if(! SDP_MODI_ID_T.equals("")) {
%>
		 		SDP_MODI_ID='<%= SDP_MODI_ID_T%>'
<%
			}

			if(! SDP_MODI_DTT_T.equals("")) {
%>
		 		SDP_MODI_DTT='<%= SDP_MODI_DTT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c66='<%= cnt%>'
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
