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

SELECT EEA_EXAM_DT,EEA_EXAM_SQ,EEA_PSNL_NM, SPB_EXAM_DT, F_PERID_FIND1(EEA_EXAM_DT,EEA_EXAM_SQ,'0') ID,SPB_EXAM_CHA,
       SPB_GOJU_SQ, SPB_GOJU_CD,SPB_FROM_DT,SPB_TO_DT,SPB_YEAR_VAL,SPB_ETC_TX
  FROM ET_EXAM_ACPT A LEFT OUTER JOIN ST_PASTJOB B   ON A.EEA_EXAM_DT =B.SPB_EXAM_DT AND A.EEA_EXAM_SQ = B.SPB_EXAM_SQ and SPB_EXAM_CHA = '1'
                      LEFT OUTER JOIN ST_BASE D      ON D.SBE_EXAM_DT=A.EEA_EXAM_DT AND D.SBE_EXAM_SQ=A.EEA_EXAM_SQ
                      LEFT OUTER JOIN ST_BILLHN_PR C ON A.EEA_EXAM_DT=C.SBP_EXAM_DT AND A.EEA_EXAM_SQ=C.SBP_EXAM_SQ  AND SBP_CHUNG_KD = :CHUNG_KD
                      LEFT OUTER JOIN IT_COMPANY E   ON A.EEA_COMP_CD=E.ICY_COMP_CD
 WHERE 0=0   AND  A.EEA_COMP_CD = :COMP_CD    AND SBE_PANJ_YN='Y' AND SBE_EXAM_CHA='1'
   AND A.EEA_MNGT_SPYM  LIKE :MNGT_SPYM||'%'  AND (A.EEA_EXAM_CD  IN ('41001','42001') OR  A.EEA_SPSB_CD IN ('41001','42001'))
   ||:sSQL_ADD
		*/

		sql = " SELECT EEA_EXAM_DT,EEA_EXAM_SQ,EEA_PSNL_NM, SPB_EXAM_DT, F_PERID_FIND1(EEA_EXAM_DT,EEA_EXAM_SQ,'0') ID,SPB_EXAM_CHA, SPB_GOJU_SQ, SPB_GOJU_CD,SPB_FROM_DT,SPB_TO_DT,SPB_YEAR_VAL,SPB_ETC_TX";
		sql += " FROM ET_EXAM_ACPT A LEFT OUTER JOIN ST_PASTJOB B";
		sql += " ON A.EEA_EXAM_DT =B.SPB_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = B.SPB_EXAM_SQ";
		sql += " AND SPB_EXAM_CHA = '1' LEFT OUTER JOIN ST_BASE D";
		sql += " ON D.SBE_EXAM_DT=A.EEA_EXAM_DT";
		sql += " AND D.SBE_EXAM_SQ=A.EEA_EXAM_SQ LEFT OUTER JOIN ST_BILLHN_PR C";
		sql += " ON A.EEA_EXAM_DT=C.SBP_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ=C.SBP_EXAM_SQ";
		sql += " AND SBP_CHUNG_KD = '" + CHUNG_KD + "' LEFT OUTER JOIN IT_COMPANY E";
		sql += " ON A.EEA_COMP_CD=E.ICY_COMP_CD";
		sql += " WHERE 0=0";
		sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		sql += " AND SBE_PANJ_YN='Y'";
		sql += " AND SBE_EXAM_CHA='1'";
		sql += " AND A.EEA_MNGT_SPYM LIKE '" + MNGT_SPYM + "'||'%'";
		sql += " AND (A.EEA_EXAM_CD IN ('41001','42001')";
		sql += " OR A.EEA_SPSB_CD IN ('41001','42001'))";
		sql += SSQL_ADD;
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : Uspchungfile2020_UDP_WORKPD_001 \n";
			G_INFO += "설명 : 특검청구 과거직력 조회 \n";
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
		<s:AttributeType name='SPB_EXAM_DT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ID' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_EXAM_CHA' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_EXAM_CHA'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_GOJU_SQ' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_GOJU_SQ'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_GOJU_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_GOJU_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_FROM_DT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_FROM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_TO_DT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_TO_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_YEAR_VAL' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_YEAR_VAL'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='SPB_ETC_TX' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_PASTJOB'
			 rs:basecolumn='SPB_ETC_TX'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='13' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c13' rs:name='ROWID' rs:number='14' rs:rowid='true' rs:basetable='ST_PASTJOB' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c14' rs:name='ROWID' rs:number='15' rs:rowid='true' rs:basetable='ST_BASE' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c15' rs:name='ROWID' rs:number='16' rs:rowid='true' rs:basetable='ST_BILLHN_PR' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c16' rs:name='ROWID' rs:number='17' rs:rowid='true' rs:basetable='IT_COMPANY' rs:basecolumn='ROWID'
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
			String SPB_EXAM_DT_T = cRsList.getString("SPB_EXAM_DT");
			String ID_T = cRsList.getString("ID");
			String SPB_EXAM_CHA_T = cRsList.getString("SPB_EXAM_CHA");
			String SPB_GOJU_SQ_T = cRsList.getString("SPB_GOJU_SQ");
			String SPB_GOJU_CD_T = cRsList.getString("SPB_GOJU_CD");
			String SPB_FROM_DT_T = cRsList.getString("SPB_FROM_DT");
			String SPB_TO_DT_T = cRsList.getString("SPB_TO_DT");
			String SPB_YEAR_VAL_T = cRsList.getString("SPB_YEAR_VAL");
			String SPB_ETC_TX_T = cRsList.getString("SPB_ETC_TX");
			String ROWID_T = cRsList.getString("ROWID");
			String c13_T = cRsList.getString("c13");
			String c14_T = cRsList.getString("c14");
			String c15_T = cRsList.getString("c15");
			String c16_T = cRsList.getString("c16");
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

			if(! SPB_EXAM_DT_T.equals("")) {
%>
		 		SPB_EXAM_DT='<%= SPB_EXAM_DT_T%>'
<%
			}

			if(! ID_T.equals("")) {
%>
		 		ID='<%= ID_T%>'
<%
			}

			if(! SPB_EXAM_CHA_T.equals("")) {
%>
		 		SPB_EXAM_CHA='<%= SPB_EXAM_CHA_T%>'
<%
			}

			if(! SPB_GOJU_SQ_T.equals("")) {
%>
		 		SPB_GOJU_SQ='<%= SPB_GOJU_SQ_T%>'
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
				c13='<%= cnt%>'
				c14='<%= cnt%>'
				c15='<%= cnt%>'
				c16='<%= cnt%>'
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
