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

		String IIV_ITEM_CD = htMethod.get("IIV_ITEM_CD");
		String IIV_EXAM_CD = htMethod.get("IIV_EXAM_CD");

		//
		if(IIV_ITEM_CD == null) { IIV_ITEM_CD = ""; }
		if(IIV_EXAM_CD == null) { IIV_EXAM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT CASE WHEN IIV_SEX_CD = ''1'' THEN ''남''
            WHEN IIV_SEX_CD = ''2'' THEN ''여'' END AS SEX_CD
     , (SELECT CCN_FULL_NM FROM CT_COMMON WHERE CCN_LARGE = ''0512'' AND CCN_LEVEL = ''5'' AND CCN_SMALL = IIV_LOW_KD) AS LOW_KD
     , (SELECT CCN_FULL_NM FROM CT_COMMON WHERE CCN_LARGE = ''0512'' AND CCN_LEVEL = ''5'' AND CCN_SMALL = IIV_HIGH_KD) AS HIGH_KD
     , (SELECT CCN_FULL_NM FROM CT_COMMON WHERE CCN_LARGE = ''0511'' AND CCN_LEVEL = ''5'' AND CCN_SMALL = IIV_EXAM_CD) AS EXAM_CD
     , (SELECT CSC_FULL_NM FROM CT_SP_COMMON WHERE CSC_LARGE = ''HM06F'' AND CSC_LEVEL = ''5'' AND CSC_SMALL = IIV_TREF_CD) AS TREF_CD
     , IT_ITEM_VLDT.*
     , IT_ITEM.IIM_KNME_NM
  FROM IT_ITEM_VLDT
  LEFT OUTER JOIN IT_ITEM ON
       IT_ITEM_VLDT.IIV_ITEM_CD = IT_ITEM.IIM_ITEM_CD
 WHERE IIV_ITEM_CD =  :IIV_ITEM_CD

if :IIV_EXAM_CD <> '' then
begin
     AND IIV_EXAM_CD =  :IIV_EXAM_CD
end

ORDER BY IIV_APLY_DT DESC, IIV_EXAM_CD, IIV_SEX_CD, IIV_AGE_FR ASC, IIV_PANJ_CD

		*/

		sql = " SELECT CASE WHEN IIV_SEX_CD = '1' THEN '남' WHEN IIV_SEX_CD = '2' THEN '여' END AS SEX_CD";
		sql += ", (SELECT CCN_FULL_NM";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE CCN_LARGE = '0512'";
		sql += " 	AND CCN_LEVEL = '5'";
		sql += " 	AND CCN_SMALL = IIV_LOW_KD) AS LOW_KD";
		sql += ", (SELECT CCN_FULL_NM";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE CCN_LARGE = '0512'";
		sql += " 	AND CCN_LEVEL = '5'";
		sql += " 	AND CCN_SMALL = IIV_HIGH_KD) AS HIGH_KD";
		sql += ", (SELECT CCN_FULL_NM";
		sql += "	FROM CT_COMMON";
		sql += "	WHERE CCN_LARGE = '0511'";
		sql += "	AND CCN_LEVEL = '5'";
		sql += "	AND CCN_SMALL = IIV_EXAM_CD) AS EXAM_CD";
		sql += ", (SELECT CSC_FULL_NM";
		sql += " 	FROM CT_SP_COMMON";
		sql += " 	WHERE CSC_LARGE = 'HM06F'";
		sql += " 	AND CSC_LEVEL = '5'";
		sql += " 	AND CSC_SMALL = IIV_TREF_CD) AS TREF_CD";
		sql += ", IT_ITEM_VLDT.* ";
		sql += ", IT_ITEM.IIM_KNME_NM";
		sql += " FROM IT_ITEM_VLDT LEFT OUTER JOIN IT_ITEM";
		sql += " ON IT_ITEM_VLDT.IIV_ITEM_CD = IT_ITEM.IIM_ITEM_CD";
		sql += " WHERE IIV_ITEM_CD = '" + IIV_ITEM_CD + "'";
		
		if(IIV_EXAM_CD != null && ! IIV_EXAM_CD.equals("")) {
			sql += " AND IIV_EXAM_CD = '" + IIV_EXAM_CD + "'";
		}

		sql += " ORDER BY IIV_APLY_DT DESC, IIV_EXAM_CD, IIV_SEX_CD, IIV_AGE_FR ASC, IIV_PANJ_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Vldt_gpGetItemValidation_001 \n";
			G_INFO += "설명 : 참고치 정보 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IIV_ITEM_CD : " + IIV_ITEM_CD + " \n";
			G_INFO += " IIV_EXAM_CD : " + IIV_EXAM_CD + " \n";
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
		<s:AttributeType name='SEX_CD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='LOW_KD' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='HIGH_KD' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_CD' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='TREF_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_APLY_DT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_APLY_DT' rs:number='6' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_ITEM_CD' rs:number='7' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_SEX_CD' rs:number='8' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_AGE_FR'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_AGE_FR' rs:number='9' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_AGE_TO'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_AGE_TO' rs:number='10' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_EXAM_CD'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_EXAM_CD' rs:number='11' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_DOCT_ID'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_DOCT_ID' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_PANJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_PANJ_CD' rs:number='13' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_CHAR_VAL'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_CHAR_VAL' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_SPCV_CD'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_SPCV_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_LOW_KD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_LOW_KD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_LOW' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_HIGH_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_HIGH_KD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_HIGH' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_TREF_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_TREF_CD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_UNIT' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSPT_CNT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSPT_CNT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSZR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSZR_KD' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_USE_YN' rs:number='24' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_NUSE_ID' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_NUSE_DTT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_NUSE_DTT' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_INPT_ID'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_INPT_ID' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_INPT_DTT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_INPT_DTT' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_MODI_ID'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_MODI_ID' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_MODI_DTT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_MODI_DTT' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='ICD_TRNS_ID'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TRNS_ID' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='ICD_TRNS_DTT'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TRNS_DTT' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='ROWID'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='34' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c34' rs:name='ROWID' rs:number='35' rs:rowid='true' rs:hidden='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String SEX_CD_T = cRsList.getString("SEX_CD");
			String LOW_KD_T = cRsList.getString("LOW_KD");
			String HIGH_KD_T = cRsList.getString("HIGH_KD");
			String EXAM_CD_T = cRsList.getString("EXAM_CD");
			String TREF_CD_T = cRsList.getString("TREF_CD");
			String IIV_APLY_DT_T = cRsList.getString("IIV_APLY_DT");
			String IIV_ITEM_CD_T = cRsList.getString("IIV_ITEM_CD");
			String IIV_SEX_CD_T = cRsList.getString("IIV_SEX_CD");
			String IIV_AGE_FR_T = cRsList.getString("IIV_AGE_FR");
			String IIV_AGE_TO_T = cRsList.getString("IIV_AGE_TO");
			String IIV_EXAM_CD_T = cRsList.getString("IIV_EXAM_CD");
			String IIV_DOCT_ID_T = cRsList.getString("IIV_DOCT_ID");
			String IIV_PANJ_CD_T = cRsList.getString("IIV_PANJ_CD");
			String IIV_CHAR_VAL_T = cRsList.getString("IIV_CHAR_VAL");
			String IIV_SPCV_CD_T = cRsList.getString("IIV_SPCV_CD");
			String IIV_LOW_KD_T = cRsList.getString("IIV_LOW_KD");
			String IIV_RSLT_LOW_T = cRsList.getString("IIV_RSLT_LOW");
			String IIV_HIGH_KD_T = cRsList.getString("IIV_HIGH_KD");
			String IIV_RSLT_HIGH_T = cRsList.getString("IIV_RSLT_HIGH");
			String IIV_TREF_CD_T = cRsList.getString("IIV_TREF_CD");
			String IIV_RSLT_UNIT_T = cRsList.getString("IIV_RSLT_UNIT");
			String IIV_RSPT_CNT_T = cRsList.getString("IIV_RSPT_CNT");
			String IIV_RSZR_KD_T = cRsList.getString("IIV_RSZR_KD");
			String IIV_USE_YN_T = cRsList.getString("IIV_USE_YN");
			String IIV_NUSE_ID_T = cRsList.getString("IIV_NUSE_ID");
			String IIV_NUSE_DTT_T = cRsList.getDate2("IIV_NUSE_DTT");
			String IIV_INPT_ID_T = cRsList.getString("IIV_INPT_ID");
			String IIV_INPT_DTT_T = cRsList.getDate2("IIV_INPT_DTT");
			String IIV_MODI_ID_T = cRsList.getString("IIV_MODI_ID");
			String IIV_MODI_DTT_T = cRsList.getDate2("IIV_MODI_DTT");
			String ICD_TRNS_ID_T = cRsList.getString("ICD_TRNS_ID");
			String ICD_TRNS_DTT_T = cRsList.getDate2("ICD_TRNS_DTT");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c34_T = cRsList.getString("c34");
%>
			<z:row
<%
			if(! SEX_CD_T.equals("")) {
%>
		 		SEX_CD='<%= SEX_CD_T%>'
<%
			}

			if(! LOW_KD_T.equals("")) {
%>
		 		LOW_KD='<%= LOW_KD_T%>'
<%
			}

			if(! HIGH_KD_T.equals("")) {
%>
		 		HIGH_KD='<%= HIGH_KD_T%>'
<%
			}

			if(! EXAM_CD_T.equals("")) {
%>
		 		EXAM_CD='<%= EXAM_CD_T%>'
<%
			}

			if(! TREF_CD_T.equals("")) {
%>
		 		TREF_CD='<%= TREF_CD_T%>'
<%
			}

			if(! IIV_APLY_DT_T.equals("")) {
%>
		 		IIV_APLY_DT='<%= IIV_APLY_DT_T%>'
<%
			}

			if(! IIV_ITEM_CD_T.equals("")) {
%>
		 		IIV_ITEM_CD='<%= IIV_ITEM_CD_T%>'
<%
			}

			if(! IIV_SEX_CD_T.equals("")) {
%>
		 		IIV_SEX_CD='<%= IIV_SEX_CD_T%>'
<%
			}

			if(! IIV_AGE_FR_T.equals("")) {
%>
		 		IIV_AGE_FR='<%= IIV_AGE_FR_T%>'
<%
			}

			if(! IIV_AGE_TO_T.equals("")) {
%>
		 		IIV_AGE_TO='<%= IIV_AGE_TO_T%>'
<%
			}

			if(! IIV_EXAM_CD_T.equals("")) {
%>
		 		IIV_EXAM_CD='<%= IIV_EXAM_CD_T%>'
<%
			}

			if(! IIV_DOCT_ID_T.equals("")) {
%>
		 		IIV_DOCT_ID='<%= IIV_DOCT_ID_T%>'
<%
			}

			if(! IIV_PANJ_CD_T.equals("")) {
%>
		 		IIV_PANJ_CD='<%= IIV_PANJ_CD_T%>'
<%
			}

			if(! IIV_CHAR_VAL_T.equals("")) {
%>
		 		IIV_CHAR_VAL='<%= IIV_CHAR_VAL_T%>'
<%
			}

			if(! IIV_SPCV_CD_T.equals("")) {
%>
		 		IIV_SPCV_CD='<%= IIV_SPCV_CD_T%>'
<%
			}

			if(! IIV_LOW_KD_T.equals("")) {
%>
		 		IIV_LOW_KD='<%= IIV_LOW_KD_T%>'
<%
			}

			if(! IIV_RSLT_LOW_T.equals("")) {
%>
		 		IIV_RSLT_LOW='<%= IIV_RSLT_LOW_T%>'
<%
			}

			if(! IIV_HIGH_KD_T.equals("")) {
%>
		 		IIV_HIGH_KD='<%= IIV_HIGH_KD_T%>'
<%
			}

			if(! IIV_RSLT_HIGH_T.equals("")) {
%>
		 		IIV_RSLT_HIGH='<%= IIV_RSLT_HIGH_T%>'
<%
			}

			if(! IIV_TREF_CD_T.equals("")) {
%>
		 		IIV_TREF_CD='<%= IIV_TREF_CD_T%>'
<%
			}

			if(! IIV_RSLT_UNIT_T.equals("")) {
%>
		 		IIV_RSLT_UNIT='<%= IIV_RSLT_UNIT_T%>'
<%
			}

			if(! IIV_RSPT_CNT_T.equals("")) {
%>
		 		IIV_RSPT_CNT='<%= IIV_RSPT_CNT_T%>'
<%
			}

			if(! IIV_RSZR_KD_T.equals("")) {
%>
		 		IIV_RSZR_KD='<%= IIV_RSZR_KD_T%>'
<%
			}

			if(! IIV_USE_YN_T.equals("")) {
%>
		 		IIV_USE_YN='<%= IIV_USE_YN_T%>'
<%
			}

			if(! IIV_NUSE_ID_T.equals("")) {
%>
		 		IIV_NUSE_ID='<%= IIV_NUSE_ID_T%>'
<%
			}

			if(! IIV_NUSE_DTT_T.equals("")) {
%>
		 		IIV_NUSE_DTT='<%= IIV_NUSE_DTT_T%>'
<%
			}

			if(! IIV_INPT_ID_T.equals("")) {
%>
		 		IIV_INPT_ID='<%= IIV_INPT_ID_T%>'
<%
			}

			if(! IIV_INPT_DTT_T.equals("")) {
%>
		 		IIV_INPT_DTT='<%= IIV_INPT_DTT_T%>'
<%
			}

			if(! IIV_MODI_ID_T.equals("")) {
%>
		 		IIV_MODI_ID='<%= IIV_MODI_ID_T%>'
<%
			}

			if(! IIV_MODI_DTT_T.equals("")) {
%>
		 		IIV_MODI_DTT='<%= IIV_MODI_DTT_T%>'
<%
			}

			if(! ICD_TRNS_ID_T.equals("")) {
%>
		 		ICD_TRNS_ID='<%= ICD_TRNS_ID_T%>'
<%
			}

			if(! ICD_TRNS_DTT_T.equals("")) {
%>
		 		ICD_TRNS_DTT='<%= ICD_TRNS_DTT_T%>'
<%
			}
%>
				IIM_KNME_NM='<%= cnt%>'
				ROWID='<%= cnt%>'
<%
			if(! c34_T.equals("")) {
%>
		 		c34='<%= c34_T%>'
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
