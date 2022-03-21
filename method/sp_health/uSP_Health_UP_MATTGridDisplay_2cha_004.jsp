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
		String SEX_CD = htMethod.get("SEX_CD");
		String PSNL_AGE = htMethod.get("PSNL_AGE");
		String EPK_EXAM_CD = htMethod.get("EPK_EXAM_CD");
		String PACK_SQ = htMethod.get("PACK_SQ");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(SEX_CD == null) { SEX_CD = ""; }
		if(PSNL_AGE == null) { PSNL_AGE = ""; }
		if(EPK_EXAM_CD == null) { EPK_EXAM_CD = ""; }
		if(PACK_SQ == null) { PACK_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select A.EPK_EXAM_CD, A.EPK_PACK_SQ, A.EPK_PACK_NM, B.EPI_ITEM_CD, C.IIM_KNME_NM, D.ERI_RSLT_VL, D.ERI_SPSB_PANJ,
       C.IIM_TRTP_CD, GetSP_COMMON_cdToNm('HM06D',C.IIM_TRLT_CD||C.IIM_TRNM_CD) IIM_TRNM_NM, E.*
  From ET_PACK A
       Inner Join ET_PACK_ITEM B On B.EPI_EXAM_CD = A.EPK_EXAM_CD
                                And B.EPI_PACK_SQ = A.EPK_PACK_SQ
       Inner Join IT_ITEM      C On C.IIM_ITEM_CD = B.EPI_ITEM_CD
       Inner Join ET_RSLT_ITEM D On D.ERI_EXAM_DT = :EXAM_DT
                                And D.ERI_EXAM_SQ = :EXAM_SQ
                                And D.ERI_ITEM_CD = B.EPI_ITEM_CD
                                And D.ERI_CNCL_YN <> 'Y'
       LEFT OUTER JOIN IT_ITEM_VLDT E ON C.IIM_ITEM_CD = E.IIV_ITEM_CD
                                AND E.IIV_APLY_DT = GetITEM_VLDT_ApplyDate(C.IIM_ITEM_CD,:EXAM_DT,'ITEM_CD','4')
                                AND E.IIV_EXAM_CD = '4'
                                AND E.IIV_PANJ_CD = 'A'
                                AND E.IIV_SEX_CD  = :SEX_CD
                                AND E.IIV_AGE_FR <= :PSNL_AGE
                                AND E.IIV_AGE_TO >= :PSNL_AGE
                                AND E.IIV_USE_YN  = 'Y'
 Where A.EPK_EXAM_CD = :EPK_EXAM_CD
   And A.EPK_PACK_SQ = :PACK_SQ
 Order By B.EPI_SORT_SQ
		*/

		sql = " SELECT A.EPK_EXAM_CD, A.EPK_PACK_SQ, A.EPK_PACK_NM, B.EPI_ITEM_CD, C.IIM_KNME_NM, D.ERI_RSLT_VL, D.ERI_SPSB_PANJ, C.IIM_TRTP_CD, GETSP_COMMON_CDTONM('HM06D',C.IIM_TRLT_CD||C.IIM_TRNM_CD) IIM_TRNM_NM, E.*";
		sql += " FROM ET_PACK A INNER JOIN ET_PACK_ITEM B";
		sql += " ON B.EPI_EXAM_CD = A.EPK_EXAM_CD";
		sql += " AND B.EPI_PACK_SQ = A.EPK_PACK_SQ INNER JOIN IT_ITEM C";
		sql += " ON C.IIM_ITEM_CD = B.EPI_ITEM_CD INNER JOIN ET_RSLT_ITEM D";
		sql += " ON D.ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND D.ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " AND D.ERI_ITEM_CD = B.EPI_ITEM_CD";
		sql += " AND D.ERI_CNCL_YN <> 'Y' LEFT OUTER JOIN IT_ITEM_VLDT E";
		sql += " ON C.IIM_ITEM_CD = E.IIV_ITEM_CD";
		sql += " AND E.IIV_APLY_DT = GETITEM_VLDT_APPLYDATE(C.IIM_ITEM_CD,'" + EXAM_DT + "','ITEM_CD','4')";
		sql += " AND E.IIV_EXAM_CD = '4'";
		sql += " AND E.IIV_PANJ_CD = 'A'";
		sql += " AND E.IIV_SEX_CD = '" + SEX_CD + "'";
		sql += " AND E.IIV_AGE_FR <= '" + PSNL_AGE + "'";
		sql += " AND E.IIV_AGE_TO >= '" + PSNL_AGE + "'";
		sql += " AND E.IIV_USE_YN = 'Y'";
		sql += " WHERE A.EPK_EXAM_CD = '" + EPK_EXAM_CD + "'";
		sql += " AND A.EPK_PACK_SQ = '" + PACK_SQ + "'";
		sql += " ORDER BY B.EPI_SORT_SQ";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_UP_MATTGridDisplay_2cha_004 \n";
			G_INFO += "설명 : 2차-추가검사 묶음 검사항목 결과 리스트 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " SEX_CD : " + SEX_CD + " \n";
			G_INFO += " PSNL_AGE : " + PSNL_AGE + " \n";
			G_INFO += " EPK_EXAM_CD : " + EPK_EXAM_CD + " \n";
			G_INFO += " PACK_SQ : " + PACK_SQ + " \n";
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
		<s:AttributeType name='EPK_EXAM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPK_PACK_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_PACK' rs:basecolumn='EPK_PACK_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EPI_ITEM_CD' rs:number='4' rs:writeunknown='true' rs:basetable='ET_PACK_ITEM' rs:basecolumn='EPI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='5' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_SPSB_PANJ' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_SPSB_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRTP_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM'
			 rs:basecolumn='IIM_TRTP_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_TRNM_NM' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_APLY_DT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_APLY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_ITEM_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_SEX_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_SEX_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_AGE_FR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_AGE_FR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_AGE_TO' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_AGE_TO'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_EXAM_CD' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_DOCT_ID' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_DOCT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_PANJ_CD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_PANJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_CHAR_VAL' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_CHAR_VAL'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_SPCV_CD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_SPCV_CD'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_LOW_KD' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_LOW_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_LOW' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_HIGH_KD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_HIGH_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_HIGH' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_TREF_CD' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_TREF_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSLT_UNIT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSLT_UNIT'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSPT_CNT' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSPT_CNT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_RSZR_KD' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_RSZR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_USE_YN' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_NUSE_ID' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_NUSE_DTT' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_INPT_ID' rs:number='31' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_INPT_DTT' rs:number='32' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_MODI_ID' rs:number='33' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IIV_MODI_DTT' rs:number='34' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='IIV_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TRNS_ID' rs:number='35' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='ICD_TRNS_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ICD_TRNS_DTT' rs:number='36' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_ITEM_VLDT'
			 rs:basecolumn='ICD_TRNS_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='37' rs:rowid='true' rs:basetable='ET_PACK' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c37' rs:name='ROWID' rs:number='38' rs:rowid='true' rs:basetable='ET_PACK_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c38' rs:name='ROWID' rs:number='39' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c39' rs:name='ROWID' rs:number='40' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c40' rs:name='ROWID' rs:number='41' rs:rowid='true' rs:basetable='IT_ITEM_VLDT' rs:basecolumn='ROWID'
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

			String EPK_EXAM_CD_T = cRsList.getString("EPK_EXAM_CD");
			String EPK_PACK_SQ_T = cRsList.getString("EPK_PACK_SQ");
			String EPK_PACK_NM_T = cRsList.getString("EPK_PACK_NM");
			String EPI_ITEM_CD_T = cRsList.getString("EPI_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String ERI_SPSB_PANJ_T = cRsList.getString("ERI_SPSB_PANJ");
			String IIM_TRTP_CD_T = cRsList.getString("IIM_TRTP_CD");
			String IIM_TRNM_NM_T = cRsList.getString("IIM_TRNM_NM");
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
			String c37_T = cRsList.getString("c37");
			String c38_T = cRsList.getString("c38");
			String c39_T = cRsList.getString("c39");
			String c40_T = cRsList.getString("c40");
%>
			<z:row
<%
			if(! EPK_EXAM_CD_T.equals("")) {
%>
		 		EPK_EXAM_CD='<%= EPK_EXAM_CD_T%>'
<%
			}

			if(! EPK_PACK_SQ_T.equals("")) {
%>
		 		EPK_PACK_SQ='<%= EPK_PACK_SQ_T%>'
<%
			}

			if(! EPK_PACK_NM_T.equals("")) {
%>
		 		EPK_PACK_NM='<%= EPK_PACK_NM_T%>'
<%
			}

			if(! EPI_ITEM_CD_T.equals("")) {
%>
		 		EPI_ITEM_CD='<%= EPI_ITEM_CD_T%>'
<%
			}

			if(! IIM_KNME_NM_T.equals("")) {
%>
		 		IIM_KNME_NM='<%= IIM_KNME_NM_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! ERI_SPSB_PANJ_T.equals("")) {
%>
		 		ERI_SPSB_PANJ='<%= ERI_SPSB_PANJ_T%>'
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
				c37='<%= cnt%>'
				c38='<%= cnt%>'
				c39='<%= cnt%>'
				c40='<%= cnt%>'
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
