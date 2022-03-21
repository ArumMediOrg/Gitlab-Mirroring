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

		String MARK_CD = htMethod.get("MARK_CD");
		String PNJN_KD = htMethod.get("PNJN_KD");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String APLY_KD = htMethod.get("APLY_KD");
		String MARK_SQ = htMethod.get("MARK_SQ");

		//
		if(MARK_CD == null) { MARK_CD = ""; }
		if(PNJN_KD == null) { PNJN_KD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(APLY_KD == null) { APLY_KD = ""; }
		if(MARK_SQ == null) { MARK_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT ESW_MARK_CD || '-' || ESW_MARK_SQ ESW_MARK_NO, 
       REPLACE(ESW_CHAR_REF1 || ESW_CHAR_REF2 || ESW_CHAR_REF3 || ESW_CHAR_REF4 || ESW_CHAR_REF5 ||
               ESW_CHAR_REF6 || ESW_CHAR_REF7 || ESW_CHAR_REF8 || ESW_CHAR_REF9 || ESW_CHAR_REF10, ' ', '') ESW_CHAR_REF 
  FROM ET_STDT_VIEWO 
 WHERE ESW_MARK_CD = :MARK_CD
   AND ESW_PNJN_KD = :PNJN_KD
   AND ESW_ITEM_CD = :ITEM_CD
   AND ESW_APLY_KD = :APLY_KD
   AND ESW_USE_YN  = 'Y' 

IF (:MARK_SQ <> '') THEN
   AND ESW_MARK_SQ <> :MARK_SQ

		*/

		sql = " SELECT ESW_MARK_CD || '-' || ESW_MARK_SQ ESW_MARK_NO, REPLACE(ESW_CHAR_REF1 || ESW_CHAR_REF2 || ESW_CHAR_REF3 || ESW_CHAR_REF4 || ESW_CHAR_REF5 || ESW_CHAR_REF6 || ESW_CHAR_REF7 || ESW_CHAR_REF8 || ESW_CHAR_REF9 || ESW_CHAR_REF10, ' ', '') ESW_CHAR_REF";
		sql += " FROM ET_STDT_VIEWO";
		sql += " WHERE ESW_MARK_CD = '" + MARK_CD + "'";
		sql += " AND ESW_PNJN_KD = '" + PNJN_KD + "'";
		sql += " AND ESW_ITEM_CD = '" + ITEM_CD + "'";
		sql += " AND ESW_APLY_KD = '" + APLY_KD + "'";
		sql += " AND ESW_USE_YN = 'Y'";

		if(! MARK_SQ.equals("")) {
			sql += " AND ESW_MARK_SQ <> '" + MARK_SQ + "'";
		}
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_PnjnO_btnView_SaveClick_001 \n";
			G_INFO += "설명 : 학교밖청소년 검진 소견 저장(기 소견 조회) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MARK_CD : " + MARK_CD + " \n";
			G_INFO += " PNJN_KD : " + PNJN_KD + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " APLY_KD : " + APLY_KD + " \n";
			G_INFO += " MARK_SQ : " + MARK_SQ + " \n";
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
		<s:AttributeType name='ESW_MARK_NO' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_CHAR_REF' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='3' rs:rowid='true' rs:basetable='ET_STDT_VIEWO' rs:basecolumn='ROWID'
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

			String ESW_MARK_NO_T = cRsList.getString("ESW_MARK_NO");
			String ESW_CHAR_REF_T = cRsList.getString("ESW_CHAR_REF");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ESW_MARK_NO_T.equals("")) {
%>
		 		ESW_MARK_NO='<%= ESW_MARK_NO_T%>'
<%
			}

			if(! ESW_CHAR_REF_T.equals("")) {
%>
		 		ESW_CHAR_REF='<%= ESW_CHAR_REF_T%>'
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
