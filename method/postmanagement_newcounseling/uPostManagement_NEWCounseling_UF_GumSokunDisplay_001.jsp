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

		String SEX_CD = htMethod.get("SEX_CD");
		String AGE_FR = htMethod.get("AGE_FR");
		String AGE_TO = htMethod.get("AGE_TO");
		String JJ_CD = htMethod.get("JJ_CD");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String SND_YN = htMethod.get("SND_YN");
		String SPCL_CD = htMethod.get("SPCL_CD");

		//
		if(SEX_CD == null) { SEX_CD = ""; }
		if(AGE_FR == null) { AGE_FR = ""; }
		if(AGE_TO == null) { AGE_TO = ""; }
		if(JJ_CD == null) { JJ_CD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(SND_YN == null) { SND_YN = ""; }
		if(SPCL_CD == null) { SPCL_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.CSP_JJ_CD, A.CSP_SBCD_CD,
       B.IIM_ITEM_CD, B.IIM_KNME_NM, B.IIM_TRTP_CD, GetSP_COMMON_cdToNm('HM06D',B.IIM_TRLT_CD||B.IIM_TRNM_CD) IIM_TRNM_NM,
              C.ERI_RSLT_VL,
       D.IIV_CHAR_VAL, D.IIV_RSLT_UNIT, GetSP_COMMON_cdToNm('HM06F',D.IIV_TREF_CD) IIV_TREF_NM,
       D.IIV_RSLT_LOW, D.IIV_LOW_KD, D.IIV_RSLT_HIGH,  D.IIV_HIGH_KD
FROM CT_SP_PROF A INNER JOIN IT_ITEM B ON A.CSP_SBCD_CD = B.IIM_SBCD_CD
                  INNER JOIN ET_RSLT_ITEM C ON B.IIM_ITEM_CD = C.ERI_ITEM_CD AND C.ERI_CNCL_YN <> 'Y'
                  LEFT OUTER JOIN IT_ITEM_VLDT D ON B.IIM_ITEM_CD = D.IIV_ITEM_CD
                                                  AND D.IIV_SEX_CD  = :SEX_CD
                                                  AND D.IIV_AGE_FR <= :AGE_FR
                                                  AND D.IIV_AGE_TO >= :AGE_TO
                                                  AND D.IIV_EXAM_CD = '4' AND D.IIV_PANJ_CD = 'A'
WHERE A.CSP_JJ_CD    = :JJ_CD
   AND C.ERI_EXAM_DT = :EXAM_DT
   AND C.ERI_EXAM_SQ = :EXAM_SQ

if (:SND_YN = 'Y' ) and
   (:SPCL_CD = '07') then
begin
   AND A.CSP_CHOC_KD IN ('1','2','3','4')
end else if :SND_YN = 'Y'  then
begin
   AND A.CSP_CHOC_KD IN ('1','2','4')
end else if :SPCL_CD = '07' then
begin
   AND A.CSP_JANGGI_CD <> '13'
   AND A.CSP_CHOC_KD IN ('1','2','3')
end else
begin
   AND A.CSP_CHOC_KD IN ('1','2')
end;
		*/

		sql = " SELECT A.CSP_JJ_CD, A.CSP_SBCD_CD, B.IIM_ITEM_CD, B.IIM_KNME_NM, B.IIM_TRTP_CD, GETSP_COMMON_CDTONM('HM06D',B.IIM_TRLT_CD||B.IIM_TRNM_CD) IIM_TRNM_NM, C.ERI_RSLT_VL, D.IIV_CHAR_VAL, D.IIV_RSLT_UNIT, GETSP_COMMON_CDTONM('HM06F',D.IIV_TREF_CD) IIV_TREF_NM, D.IIV_RSLT_LOW, D.IIV_LOW_KD, D.IIV_RSLT_HIGH, D.IIV_HIGH_KD";
		sql += " FROM CT_SP_PROF A INNER JOIN IT_ITEM B";
		sql += " ON A.CSP_SBCD_CD = B.IIM_SBCD_CD INNER JOIN ET_RSLT_ITEM C";
		sql += " ON B.IIM_ITEM_CD = C.ERI_ITEM_CD";
		sql += " AND C.ERI_CNCL_YN <> 'Y' LEFT OUTER JOIN IT_ITEM_VLDT D";
		sql += " ON B.IIM_ITEM_CD = D.IIV_ITEM_CD";
		sql += " AND D.IIV_SEX_CD = '" + SEX_CD + "'";
		sql += " AND D.IIV_AGE_FR <= '" + AGE_FR + "'";
		sql += " AND D.IIV_AGE_TO >= '" + AGE_TO + "'";
		sql += " AND D.IIV_EXAM_CD = '4'";
		sql += " AND D.IIV_PANJ_CD = 'A'";
		sql += " WHERE A.CSP_JJ_CD = '" + JJ_CD + "'";
		sql += " AND C.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND C.ERI_EXAM_SQ = '" + EXAM_SQ + "'";

		if(SND_YN.equals("Y") && SPCL_CD.equals("07")) {
			sql += " AND A.CSP_CHOC_KD IN ('1','2','3','4')";
		}
		else if(SND_YN.equals("Y")) {
			sql += " AND A.CSP_CHOC_KD IN ('1','2','4')";
		}
		else if(SPCL_CD.equals("07")) {
			sql += " AND A.CSP_JANGGI_CD <> '13'";
			sql += " AND A.CSP_CHOC_KD IN ('1','2','3')";
		}
		else {
			sql += " AND A.CSP_CHOC_KD IN ('1','2')";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPostManagement_NEWCounseling_UF_GumSokunDisplay_001 \n";
			G_INFO += "설명 : 특검 검사항목정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " AGE_FR : " + AGE_FR + " \n";
			G_INFO += " AGE_TO : " + AGE_TO + " \n";
			G_INFO += " JJ_CD : " + JJ_CD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " SND_YN : " + SND_YN + " \n";
			G_INFO += " SPCL_CD : " + SPCL_CD + " \n";
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
		<s:AttributeType name='CSP_JJ_CD' rs:number='1' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_JJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CSP_SBCD_CD' rs:number='2' rs:writeunknown='true' rs:basetable='CT_SP_PROF' rs:basecolumn='CSP_SBCD_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_ITEM_CD' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='4' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRTP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRNM_NM' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_CHAR_VAL' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_CHAR_VAL'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_UNIT' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_TREF_NM' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_LOW' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_LOW_KD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_LOW_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_HIGH' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_HIGH_KD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_HIGH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='15' rs:rowid='true' rs:basetable='CT_SP_PROF' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c15' rs:name='ROWID' rs:number='16' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c16' rs:name='ROWID' rs:number='17' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c17' rs:name='ROWID' rs:number='18' rs:rowid='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CSP_JJ_CD_T = cRsList.getString("CSP_JJ_CD");
			String CSP_SBCD_CD_T = cRsList.getString("CSP_SBCD_CD");
			String IIM_ITEM_CD_T = cRsList.getString("IIM_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String IIM_TRTP_CD_T = cRsList.getString("IIM_TRTP_CD");
			String IIM_TRNM_NM_T = cRsList.getString("IIM_TRNM_NM");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String IIV_CHAR_VAL_T = cRsList.getString("IIV_CHAR_VAL");
			String IIV_RSLT_UNIT_T = cRsList.getString("IIV_RSLT_UNIT");
			String IIV_TREF_NM_T = cRsList.getString("IIV_TREF_NM");
			String IIV_RSLT_LOW_T = cRsList.getString("IIV_RSLT_LOW");
			String IIV_LOW_KD_T = cRsList.getString("IIV_LOW_KD");
			String IIV_RSLT_HIGH_T = cRsList.getString("IIV_RSLT_HIGH");
			String IIV_HIGH_KD_T = cRsList.getString("IIV_HIGH_KD");
			String ROWID_T = cRsList.getString("ROWID");
			String c15_T = cRsList.getString("c15");
			String c16_T = cRsList.getString("c16");
			String c17_T = cRsList.getString("c17");
%>
			<z:row
<%
			if(! CSP_JJ_CD_T.equals("")) {
%>
		 		CSP_JJ_CD='<%= CSP_JJ_CD_T%>'
<%
			}

			if(! CSP_SBCD_CD_T.equals("")) {
%>
		 		CSP_SBCD_CD='<%= CSP_SBCD_CD_T%>'
<%
			}

			if(! IIM_ITEM_CD_T.equals("")) {
%>
		 		IIM_ITEM_CD='<%= IIM_ITEM_CD_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
<%
			}

			if(! IIM_TRTP_CD_T.equals("")) {
%>
		 		IIM_TRTP_CD='<%= IIM_TRTP_CD_T%>'
<%
			}

			if(! IIM_TRNM_NM_T.equals("")) {
%>
		 		IIM_TRNM_NM='<%= IIM_TRNM_NM_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! IIV_CHAR_VAL_T.equals("")) {
%>
		 		IIV_CHAR_VAL='<%= IIV_CHAR_VAL_T%>'
<%
			}

			if(! IIV_RSLT_UNIT_T.equals("")) {
%>
		 		IIV_RSLT_UNIT='<%= IIV_RSLT_UNIT_T%>'
<%
			}

			if(! IIV_TREF_NM_T.equals("")) {
%>
		 		IIV_TREF_NM='<%= IIV_TREF_NM_T%>'
<%
			}

			if(! IIV_RSLT_LOW_T.equals("")) {
%>
		 		IIV_RSLT_LOW='<%= IIV_RSLT_LOW_T%>'
<%
			}

			if(! IIV_LOW_KD_T.equals("")) {
%>
		 		IIV_LOW_KD='<%= IIV_LOW_KD_T%>'
<%
			}

			if(! IIV_RSLT_HIGH_T.equals("")) {
%>
		 		IIV_RSLT_HIGH='<%= IIV_RSLT_HIGH_T%>'
<%
			}

			if(! IIV_HIGH_KD_T.equals("")) {
%>
		 		IIV_HIGH_KD='<%= IIV_HIGH_KD_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c15='<%= cnt%>'
				c16='<%= cnt%>'
				c17='<%= cnt%>'
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
