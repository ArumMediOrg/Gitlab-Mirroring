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

		String IIV_APLY_DT = htMethod.get("IIV_APLY_DT");
		String IIV_ITEM_CD = htMethod.get("IIV_ITEM_CD");
		String IIV_SEX_CD = htMethod.get("IIV_SEX_CD");
		String IIV_AGE_FR = htMethod.get("IIV_AGE_FR");
		String IIV_AGE_TO = htMethod.get("IIV_AGE_TO");
		String IIV_EXAM_CD = htMethod.get("IIV_EXAM_CD");
		String IIV_DOCT_ID = htMethod.get("IIV_DOCT_ID");
		String IIV_PANJ_CD = htMethod.get("IIV_PANJ_CD");

		//
		if(IIV_APLY_DT == null) { IIV_APLY_DT = ""; }
		if(IIV_ITEM_CD == null) { IIV_ITEM_CD = ""; }
		if(IIV_SEX_CD == null) { IIV_SEX_CD = ""; }
		if(IIV_AGE_FR == null) { IIV_AGE_FR = ""; }
		if(IIV_AGE_TO == null) { IIV_AGE_TO = ""; }
		if(IIV_EXAM_CD == null) { IIV_EXAM_CD = ""; }
		if(IIV_DOCT_ID == null) { IIV_DOCT_ID = ""; }
		if(IIV_PANJ_CD == null) { IIV_PANJ_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT *
  FROM IT_ITEM_VLDT
 WHERE IIV_APLY_DT = :IIV_APLY_DT
   AND IIV_ITEM_CD = :IIV_ITEM_CD
   AND IIV_SEX_CD  = :IIV_SEX_CD
   AND IIV_AGE_FR  = :IIV_AGE_FR
   AND IIV_AGE_TO  = :IIV_AGE_TO
   AND IIV_EXAM_CD = :IIV_EXAM_CD
   AND NVL(IIV_DOCT_ID, ''N'') = NVL(:IIV_DOCT_ID, ''N'')
   AND IIV_PANJ_CD = :IIV_PANJ_CD

		*/

		sql = " SELECT *";
		sql += " FROM IT_ITEM_VLDT";
		sql += " WHERE IIV_APLY_DT = '" + IIV_APLY_DT + "'";
		sql += " AND IIV_ITEM_CD = '" + IIV_ITEM_CD + "'";
		sql += " AND IIV_SEX_CD = '" + IIV_SEX_CD + "'";
		sql += " AND IIV_AGE_FR = '" + IIV_AGE_FR + "'";
		sql += " AND IIV_AGE_TO = '" + IIV_AGE_TO + "'";
		sql += " AND IIV_EXAM_CD = '" + IIV_EXAM_CD + "'";
		sql += " AND NVL(IIV_DOCT_ID, 'N') = NVL('" + IIV_DOCT_ID + "', 'N')";
		sql += " AND IIV_PANJ_CD = '" + IIV_PANJ_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Vldt_Apply_gpGetItemVldt_001 \n";
			G_INFO += "설명 : 참고치 정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " IIV_APLY_DT : " + IIV_APLY_DT + " \n";
			G_INFO += " IIV_ITEM_CD : " + IIV_ITEM_CD + " \n";
			G_INFO += " IIV_SEX_CD : " + IIV_SEX_CD + " \n";
			G_INFO += " IIV_AGE_FR : " + IIV_AGE_FR + " \n";
			G_INFO += " IIV_AGE_TO : " + IIV_AGE_TO + " \n";
			G_INFO += " IIV_EXAM_CD : " + IIV_EXAM_CD + " \n";
			G_INFO += " IIV_DOCT_ID : " + IIV_DOCT_ID + " \n";
			G_INFO += " IIV_PANJ_CD : " + IIV_PANJ_CD + " \n";
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
		<s:AttributeType name='IIV_APLY_DT' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_APLY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_ITEM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_SEX_CD' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_AGE_FR' rs:number='4' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_AGE_FR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_AGE_TO' rs:number='5' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_AGE_TO'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_EXAM_CD' rs:number='6' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_DOCT_ID' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_DOCT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_PANJ_CD' rs:number='8' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_PANJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_CHAR_VAL' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_CHAR_VAL'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_SPCV_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_SPCV_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_LOW_KD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_LOW_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_LOW' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_HIGH_KD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_HIGH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_HIGH' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_TREF_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_TREF_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_UNIT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSPT_CNT' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSPT_CNT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSZR_KD' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSZR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_USE_YN' rs:number='19' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='IIV_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_NUSE_ID' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_NUSE_DTT' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_INPT_ID' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_INPT_DTT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_MODI_ID' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_MODI_DTT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TRNS_ID' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='ICD_TRNS_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TRNS_DTT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='ICD_TRNS_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='28' rs:rowid='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

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
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
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
				ROWID='<%= cnt%>'
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
