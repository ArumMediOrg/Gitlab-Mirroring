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
		String ITEM_CD = htMethod.get("ITEM_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.IIQ_ITQU_LV1, A.IIQ_ITQU_LV2, A.IIQ_ITQU_SQ, C.CQN_QSTN_CD, C.CQN_QSKD_CD, C.CQN_QSTN_SQ,
       C.CQN_QSTN_LV, C.CQN_QSTN_NM, C.CQN_ANSR_CD, C.CQN_ANSE_EX, C.CQN_QSTN_CP, C.CQN_DEFULT,
       NVL(B.QQN_RESULT,'') QQN_RESULT,
       CASE WHEN C.CQN_ANSR_CD IS NULL OR C.CQN_ANSR_CD = ''
            THEN C.CQN_ANSR_CD
            else C.CQN_ANSR_CD || '-' || GetCOMMON_LvCdToNm('0415',C.CQN_ANSR_CD,'5',1) END CQN_ANSR_NM,
       C.CQN_SCOR_YN, C.CQN_SCOR_CNT, C.CQN_SCOR_NO, C.CQN_SCOR_SCR, B.QQN_SCORE_YN, B.QQN_SCORE
FROM IT_ITEM_QUESTION A
    LEFT OUTER JOIN QT_QUESTION B ON A.IIQ_QGTN_CD = B.QQN_QSTN_CD
         AND B.QQN_EXAM_DT = :EXAM_DT
         AND B.QQN_EXAM_SQ = :EXAM_SQ
    LEFT OUTER JOIN CT_QUESTION C      ON A.IIQ_QGTN_CD = C.CQN_QSTN_CD
WHERE A.IIQ_ITEM_CD = :ITEM_CD
  AND A.IIQ_APLY_DT = GetITEM_QUESTION_ApplyDate( :ITEM_CD, :EXAM_DT)
  AND A.IIQ_USE_YN = 'Y'
ORDER BY A.IIQ_SORT_NO
		*/

		sql = " SELECT A.IIQ_ITQU_LV1, A.IIQ_ITQU_LV2, A.IIQ_ITQU_SQ, C.CQN_QSTN_CD, C.CQN_QSKD_CD, C.CQN_QSTN_SQ, C.CQN_QSTN_LV, C.CQN_QSTN_NM, C.CQN_ANSR_CD, C.CQN_ANSE_EX, C.CQN_QSTN_CP, C.CQN_DEFULT, NVL(B.QQN_RESULT,'') QQN_RESULT";
		sql += ", CASE WHEN C.CQN_ANSR_CD IS NULL OR C.CQN_ANSR_CD = '' THEN C.CQN_ANSR_CD ELSE C.CQN_ANSR_CD || '-' || GETCOMMON_LVCDTONM('0415',C.CQN_ANSR_CD,'5',1) END CQN_ANSR_NM, C.CQN_SCOR_YN, C.CQN_SCOR_CNT, C.CQN_SCOR_NO, C.CQN_SCOR_SCR, B.QQN_SCORE_YN, B.QQN_SCORE";
		sql += " FROM IT_ITEM_QUESTION A LEFT OUTER JOIN QT_QUESTION B";
		sql += " ON A.IIQ_QGTN_CD = B.QQN_QSTN_CD";
		sql += " AND B.QQN_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND B.QQN_EXAM_SQ = '" + EXAM_SQ + "' LEFT OUTER JOIN CT_QUESTION C";
		sql += " ON A.IIQ_QGTN_CD = C.CQN_QSTN_CD";
		sql += " WHERE A.IIQ_ITEM_CD = '" + ITEM_CD + "'";
		sql += " AND A.IIQ_APLY_DT = GETITEM_QUESTION_APPLYDATE( '" + ITEM_CD + "', '" + EXAM_DT + "')";
		sql += " AND A.IIQ_USE_YN = 'Y'";
		sql += " ORDER BY A.IIQ_SORT_NO";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uQT_QUESTION_PAST_UP_GridDisplay_001 \n";
			G_INFO += "설명 : 현문진항목조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
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
		<s:AttributeType name='IIQ_ITQU_LV1' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_LV1'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_LV2' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_LV2'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_QSTN_CD'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSKD_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_QSKD_CD'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_SQ' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_QSTN_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_LV' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_QSTN_LV'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_NM' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_QSTN_NM'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_ANSR_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_ANSR_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_ANSE_EX' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_ANSE_EX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_CP' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_QSTN_CP'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_DEFULT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_DEFULT'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_RESULT' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_ANSR_NM' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_SCOR_YN' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_SCOR_CNT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_SCOR_CNT'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_SCOR_NO' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_SCOR_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_SCOR_SCR' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_SCOR_SCR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_SCORE_YN' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_SCORE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='QQN_SCORE' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='QT_QUESTION'
			 rs:basecolumn='QQN_SCORE'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='21' rs:rowid='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c21' rs:name='ROWID' rs:number='22' rs:rowid='true' rs:basetable='QT_QUESTION' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c22' rs:name='ROWID' rs:number='23' rs:rowid='true' rs:basetable='CT_QUESTION' rs:basecolumn='ROWID'
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

			String IIQ_ITQU_LV1_T = cRsList.getString("IIQ_ITQU_LV1");
			String IIQ_ITQU_LV2_T = cRsList.getString("IIQ_ITQU_LV2");
			String IIQ_ITQU_SQ_T = cRsList.getString("IIQ_ITQU_SQ");
			String CQN_QSTN_CD_T = cRsList.getString("CQN_QSTN_CD");
			String CQN_QSKD_CD_T = cRsList.getString("CQN_QSKD_CD");
			String CQN_QSTN_SQ_T = cRsList.getString("CQN_QSTN_SQ");
			String CQN_QSTN_LV_T = cRsList.getString("CQN_QSTN_LV");
			String CQN_QSTN_NM_T = cRsList.getString("CQN_QSTN_NM");
			String CQN_ANSR_CD_T = cRsList.getString("CQN_ANSR_CD");
			String CQN_ANSE_EX_T = cRsList.getString("CQN_ANSE_EX");
			String CQN_QSTN_CP_T = cRsList.getString("CQN_QSTN_CP");
			String CQN_DEFULT_T = cRsList.getString("CQN_DEFULT");
			String QQN_RESULT_T = cRsList.getString("QQN_RESULT");
			String CQN_ANSR_NM_T = cRsList.getString("CQN_ANSR_NM");
			String CQN_SCOR_YN_T = cRsList.getString("CQN_SCOR_YN");
			String CQN_SCOR_CNT_T = cRsList.getString("CQN_SCOR_CNT");
			String CQN_SCOR_NO_T = cRsList.getString("CQN_SCOR_NO");
			String CQN_SCOR_SCR_T = cRsList.getString("CQN_SCOR_SCR");
			String QQN_SCORE_YN_T = cRsList.getString("QQN_SCORE_YN");
			String QQN_SCORE_T = cRsList.getString("QQN_SCORE");
			String ROWID_T = cRsList.getString("ROWID");
			String c21_T = cRsList.getString("c21");
			String c22_T = cRsList.getString("c22");
%>
			<z:row
<%
			if(! IIQ_ITQU_LV1_T.equals("")) {
%>
		 		IIQ_ITQU_LV1='<%= IIQ_ITQU_LV1_T%>'
<%
			}

			if(! IIQ_ITQU_LV2_T.equals("")) {
%>
		 		IIQ_ITQU_LV2='<%= IIQ_ITQU_LV2_T%>'
<%
			}

			if(! IIQ_ITQU_SQ_T.equals("")) {
%>
		 		IIQ_ITQU_SQ='<%= IIQ_ITQU_SQ_T%>'
<%
			}

			if(! CQN_QSTN_CD_T.equals("")) {
%>
		 		CQN_QSTN_CD='<%= CQN_QSTN_CD_T%>'
<%
			}

			if(! CQN_QSKD_CD_T.equals("")) {
%>
		 		CQN_QSKD_CD='<%= CQN_QSKD_CD_T%>'
<%
			}

			if(! CQN_QSTN_SQ_T.equals("")) {
%>
		 		CQN_QSTN_SQ='<%= CQN_QSTN_SQ_T%>'
<%
			}

			if(! CQN_QSTN_LV_T.equals("")) {
%>
		 		CQN_QSTN_LV='<%= CQN_QSTN_LV_T%>'
<%
			}

			if(! CQN_QSTN_NM_T.equals("")) {
%>
		 		CQN_QSTN_NM='<%= CQN_QSTN_NM_T%>'
<%
			}

			if(! CQN_ANSR_CD_T.equals("")) {
%>
		 		CQN_ANSR_CD='<%= CQN_ANSR_CD_T%>'
<%
			}

			if(! CQN_ANSE_EX_T.equals("")) {
%>
		 		CQN_ANSE_EX='<%= CQN_ANSE_EX_T%>'
<%
			}

			if(! CQN_QSTN_CP_T.equals("")) {
%>
		 		CQN_QSTN_CP='<%= CQN_QSTN_CP_T%>'
<%
			}

			if(! CQN_DEFULT_T.equals("")) {
%>
		 		CQN_DEFULT='<%= CQN_DEFULT_T%>'
<%
			}

			if(! QQN_RESULT_T.equals("")) {
%>
		 		QQN_RESULT='<%= QQN_RESULT_T%>'
<%
			}

			if(! CQN_ANSR_NM_T.equals("")) {
%>
		 		CQN_ANSR_NM='<%= CQN_ANSR_NM_T%>'
<%
			}

			if(! CQN_SCOR_YN_T.equals("")) {
%>
		 		CQN_SCOR_YN='<%= CQN_SCOR_YN_T%>'
<%
			}

			if(! CQN_SCOR_CNT_T.equals("")) {
%>
		 		CQN_SCOR_CNT='<%= CQN_SCOR_CNT_T%>'
<%
			}

			if(! CQN_SCOR_NO_T.equals("")) {
%>
		 		CQN_SCOR_NO='<%= CQN_SCOR_NO_T%>'
<%
			}

			if(! CQN_SCOR_SCR_T.equals("")) {
%>
		 		CQN_SCOR_SCR='<%= CQN_SCOR_SCR_T%>'
<%
			}

			if(! QQN_SCORE_YN_T.equals("")) {
%>
		 		QQN_SCORE_YN='<%= QQN_SCORE_YN_T%>'
<%
			}

			if(! QQN_SCORE_T.equals("")) {
%>
		 		QQN_SCORE='<%= QQN_SCORE_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c21='<%= cnt%>'
				c22='<%= cnt%>'
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
