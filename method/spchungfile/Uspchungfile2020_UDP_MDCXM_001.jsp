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

		String CHUNG_KD = htMethod.get("CHUNG_KD");
		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_SPYM = htMethod.get("MNGT_SPYM");
		String SSQL_ADD = htMethod.get("SSQL_ADD");

		//
		if(CHUNG_KD == null) { CHUNG_KD = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_SPYM == null) { MNGT_SPYM = ""; }
		if(SSQL_ADD == null) { SSQL_ADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT  EEA_EXAM_DT,EEA_EXAM_SQ,EEA_PSNL_NM, SSM_EXAM_DT,
       SSM_SYSQ_CD,SSM_SYSQ_NM
  FROM ET_EXAM_ACPT A LEFT OUTER JOIN ST_SYMPTOM B   ON A.EEA_EXAM_DT =B.SSM_EXAM_DT AND A.EEA_EXAM_SQ=B.SSM_EXAM_SQ and SSM_EXAM_CHA = '1'
                      LEFT OUTER JOIN ST_BILLHN_PR C ON A.EEA_EXAM_DT=C.SBP_EXAM_DT AND A.EEA_EXAM_SQ=C.SBP_EXAM_SQ  AND SBP_CHUNG_KD = :CHUNG_KD
                      LEFT OUTER JOIN ST_BASE D      ON D.SBE_EXAM_DT=A.EEA_EXAM_DT AND D.SBE_EXAM_SQ=A.EEA_EXAM_SQ
                      LEFT OUTER JOIN IT_COMPANY I   ON A.EEA_COMP_CD=I.ICY_COMP_CD
 WHERE 0=0
   AND A.EEA_COMP_CD = :COMP_CD  AND (A.EEA_EXAM_CD  IN ('41001','42001') OR  A.EEA_SPSB_CD IN ('41001','42001'))
   AND A.EEA_MNGT_SPYM  LIKE :MNGT_SPYM||'%' AND SSM_SYMP_CD='4' AND  SBE_PANJ_YN='Y'  AND SBE_EXAM_CHA='1'
   ||:sSQL_ADD
		*/

		sql = " SELECT EEA_EXAM_DT,EEA_EXAM_SQ,EEA_PSNL_NM, SSM_EXAM_DT, SSM_SYSQ_CD,SSM_SYSQ_NM";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ST_SYMPTOM B";
		sql += " ON A.EEA_EXAM_DT =B.SSM_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=B.SSM_EXAM_SQ";
		sql += " AND SSM_EXAM_CHA = '1' LEFT OUTER JOIN ST_BILLHN_PR C";
		sql += " ON A.EEA_EXAM_DT=C.SBP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=C.SBP_EXAM_SQ";
		sql += " AND SBP_CHUNG_KD = '" + CHUNG_KD + "' LEFT OUTER JOIN ST_BASE D";
		sql += " ON D.SBE_EXAM_DT=A.EEA_EXAM_DT";
		sql += " AND D.SBE_EXAM_SQ=A.EEA_EXAM_SQ LEFT OUTER JOIN IT_COMPANY I";
		sql += " ON A.EEA_COMP_CD=I.ICY_COMP_CD";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND (A.EEA_EXAM_CD IN ('41001','42001')";
		sql += " OR A.EEA_SPSB_CD IN ('41001','42001'))";
		sql += " AND A.EEA_MNGT_SPYM LIKE '" + MNGT_SPYM + "'||'%'";
		sql += " AND SSM_SYMP_CD='4'";
		sql += " AND SBE_PANJ_YN='Y'";
		sql += " AND SBE_EXAM_CHA='1'";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : Uspchungfile2020_UDP_MDCXM_001 \n";
			G_INFO += "설명 : 특검청구 진찰 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CHUNG_KD : " + CHUNG_KD + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_SPYM : " + MNGT_SPYM + " \n";
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
		<s:AttributeType name='EEA_PSNL_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SSM_EXAM_DT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYMPTOM'
			 rs:basecolumn='SSM_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SSM_SYSQ_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYMPTOM'
			 rs:basecolumn='SSM_SYSQ_CD'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='SSM_SYSQ_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_SYMPTOM'
			 rs:basecolumn='SSM_SYSQ_NM'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c7' rs:name='ROWID' rs:number='8' rs:rowid='true' rs:basetable='ST_SYMPTOM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c8' rs:name='ROWID' rs:number='9' rs:rowid='true' rs:basetable='ST_BILLHN_PR' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c9' rs:name='ROWID' rs:number='10' rs:rowid='true' rs:basetable='ST_BASE' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c10' rs:name='ROWID' rs:number='11' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
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

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String SSM_EXAM_DT_T = cRsList.getString("SSM_EXAM_DT");
			String SSM_SYSQ_CD_T = cRsList.getString("SSM_SYSQ_CD");
			String SSM_SYSQ_NM_T = cRsList.getString("SSM_SYSQ_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c7_T = cRsList.getString("c7");
			String c8_T = cRsList.getString("c8");
			String c9_T = cRsList.getString("c9");
			String c10_T = cRsList.getString("c10");
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

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! SSM_EXAM_DT_T.equals("")) {
%>
		 		SSM_EXAM_DT='<%= SSM_EXAM_DT_T%>'
<%
			}

			if(! SSM_SYSQ_CD_T.equals("")) {
%>
		 		SSM_SYSQ_CD='<%= SSM_SYSQ_CD_T%>'
<%
			}

			if(! SSM_SYSQ_NM_T.equals("")) {
%>
		 		SSM_SYSQ_NM='<%= SSM_SYSQ_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c7='<%= cnt%>'
				c8='<%= cnt%>'
				c9='<%= cnt%>'
				c10='<%= cnt%>'
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
