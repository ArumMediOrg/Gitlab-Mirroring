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

		String APLY_DT = htMethod.get("APLY_DT");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String CHKBOXUSE = htMethod.get("CHKBOXUSE");

		//
		if(APLY_DT == null) { APLY_DT = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(CHKBOXUSE == null) { CHKBOXUSE = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.IIQ_APLY_DT, A.IIQ_ITEM_CD, A.IIQ_SORT_NO, IIQ_QGTN_CD, IIQ_ITQU_LV1, IIQ_ITQU_LV2, IIQ_ITQU_SQ, IIQ_USE_YN, 
        CASE WHEN B.CQN_ANSR_CD IS NULL OR B.CQN_ANSR_CD = '' THEN B.CQN_ANSR_CD else '[' || B.CQN_ANSR_CD || ']' || GetCOMMON_LvCdToNm('0415',B.CQN_ANSR_CD,'5',1) END IIQ_ANSR_NM, 
        B.CQN_QSTN_NM, B.CQN_ANSE_EX, B.CQN_QSTN_CP, B.CQN_DEFULT 
FROM IT_ITEM_QUESTION A INNER JOIN CT_QUESTION  B ON A.IIQ_QGTN_CD = B.CQN_QSTN_CD 
WHERE 0 = 0 
  AND A.IIQ_APLY_DT = :APLY_DT
  AND A.IIQ_ITEM_CD = :ITEM_CD

if :ChkBoxUSE = 'N'  then  
  AND IIQ_USE_YN = 'Y'

ORDER BY IIQ_SORT_NO 
		*/

		sql = " SELECT A.IIQ_APLY_DT, A.IIQ_ITEM_CD, A.IIQ_SORT_NO, IIQ_QGTN_CD, IIQ_ITQU_LV1, IIQ_ITQU_LV2, IIQ_ITQU_SQ, IIQ_USE_YN";
		sql += ", CASE WHEN B.CQN_ANSR_CD IS NULL OR B.CQN_ANSR_CD = '' THEN B.CQN_ANSR_CD ELSE '[' || B.CQN_ANSR_CD || ']' || GETCOMMON_LVCDTONM('0415',B.CQN_ANSR_CD,'5',1) END IIQ_ANSR_NM";
		sql += ", B.CQN_QSTN_NM, B.CQN_ANSE_EX, B.CQN_QSTN_CP, B.CQN_DEFULT";
		sql += " FROM IT_ITEM_QUESTION A INNER JOIN CT_QUESTION B";
		sql += " ON A.IIQ_QGTN_CD = B.CQN_QSTN_CD";
		sql += " WHERE 0 = 0";
		sql += " AND A.IIQ_APLY_DT = '" + APLY_DT + "'";
		sql += " AND A.IIQ_ITEM_CD = '" + ITEM_CD + "'";

		if(CHKBOXUSE.equals("N")) {
			sql += " AND IIQ_USE_YN = 'Y'";
		}

		sql += " ORDER BY IIQ_SORT_NO";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_ITEM_QUESTION_CmbBoxIIQ_APLY_DTChange_001 \n";
			G_INFO += "설명 : 문진정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " APLY_DT : " + APLY_DT + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " CHKBOXUSE : " + CHKBOXUSE + " \n";
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
		<s:AttributeType name='IIQ_APLY_DT' rs:number='1' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_APLY_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITEM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_SORT_NO' rs:number='3' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_SORT_NO'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_QGTN_CD' rs:number='4' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_QGTN_CD'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_LV1' rs:number='5' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_LV1'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_LV2' rs:number='6' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_LV2'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ITQU_SQ' rs:number='7' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_ITQU_SQ'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_USE_YN' rs:number='8' rs:writeunknown='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='IIQ_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIQ_ANSR_NM' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_NM' rs:number='10'>
			<s:datatype dt:type='string' dt:maxLength='500' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_ANSE_EX' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_ANSE_EX'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_QSTN_CP' rs:number='12' rs:writeunknown='true' rs:basetable='CT_QUESTION' rs:basecolumn='CQN_QSTN_CP'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CQN_DEFULT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_QUESTION'
			 rs:basecolumn='CQN_DEFULT'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='14' rs:rowid='true' rs:basetable='IT_ITEM_QUESTION' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c14' rs:name='ROWID' rs:number='15' rs:rowid='true' rs:basetable='CT_QUESTION' rs:basecolumn='ROWID'
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

			String IIQ_APLY_DT_T = cRsList.getString("IIQ_APLY_DT");
			String IIQ_ITEM_CD_T = cRsList.getString("IIQ_ITEM_CD");
			String IIQ_SORT_NO_T = cRsList.getString("IIQ_SORT_NO");
			String IIQ_QGTN_CD_T = cRsList.getString("IIQ_QGTN_CD");
			String IIQ_ITQU_LV1_T = cRsList.getString("IIQ_ITQU_LV1");
			String IIQ_ITQU_LV2_T = cRsList.getString("IIQ_ITQU_LV2");
			String IIQ_ITQU_SQ_T = cRsList.getString("IIQ_ITQU_SQ");
			String IIQ_USE_YN_T = cRsList.getString("IIQ_USE_YN");
			String IIQ_ANSR_NM_T = cRsList.getString("IIQ_ANSR_NM");
			String CQN_QSTN_NM_T = cRsList.getString("CQN_QSTN_NM");
			String CQN_ANSE_EX_T = cRsList.getString("CQN_ANSE_EX");
			String CQN_QSTN_CP_T = cRsList.getString("CQN_QSTN_CP");
			String CQN_DEFULT_T = cRsList.getString("CQN_DEFULT");
			String ROWID_T = cRsList.getString("ROWID");
			String c14_T = cRsList.getString("c14");
%>
			<z:row
<%
			if(! IIQ_APLY_DT_T.equals("")) {
%>
		 		IIQ_APLY_DT='<%= IIQ_APLY_DT_T%>'
<%
			}

			if(! IIQ_ITEM_CD_T.equals("")) {
%>
		 		IIQ_ITEM_CD='<%= IIQ_ITEM_CD_T%>'
<%
			}

			if(! IIQ_SORT_NO_T.equals("")) {
%>
		 		IIQ_SORT_NO='<%= IIQ_SORT_NO_T%>'
<%
			}

			if(! IIQ_QGTN_CD_T.equals("")) {
%>
		 		IIQ_QGTN_CD='<%= IIQ_QGTN_CD_T%>'
<%
			}

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

			if(! IIQ_USE_YN_T.equals("")) {
%>
		 		IIQ_USE_YN='<%= IIQ_USE_YN_T%>'
<%
			}

			if(! IIQ_ANSR_NM_T.equals("")) {
%>
		 		IIQ_ANSR_NM='<%= IIQ_ANSR_NM_T%>'
<%
			}

			if(! CQN_QSTN_NM_T.equals("")) {
%>
		 		CQN_QSTN_NM='<%= CQN_QSTN_NM_T%>'
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
%>
				ROWID='<%= cnt%>'
				c14='<%= cnt%>'
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
