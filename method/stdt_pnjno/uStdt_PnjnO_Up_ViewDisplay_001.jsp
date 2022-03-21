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
		String MARK_SQ = htMethod.get("MARK_SQ");
		String SPNJN_KD = htMethod.get("SPNJN_KD");
		String PNJN_KD = htMethod.get("PNJN_KD");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String USE_YN = htMethod.get("USE_YN");

		//
		if(MARK_CD == null) { MARK_CD = ""; }
		if(MARK_SQ == null) { MARK_SQ = ""; }
		if(SPNJN_KD == null) { SPNJN_KD = ""; }
		if(PNJN_KD == null) { PNJN_KD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(USE_YN == null) { USE_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT ESW_MARK_CD,   ESW_MARK_SQ,   ESW_MARK_CD || '-' || ESW_MARK_SQ ESW_MARK_NO,  ESW_PNJN_KD, ESW_ITEM_CD, 
       ESW_CHAR_REF1, ESW_CHAR_REF2, ESW_CHAR_REF3, ESW_CHAR_REF4, ESW_CHAR_REF5, 
       ESW_CHAR_REF6, ESW_CHAR_REF7, ESW_CHAR_REF8, ESW_CHAR_REF9, ESW_CHAR_REF10, 
       ESW_APLY_KD,   ESW_RSLT_KD,   ESW_VIEW_TXT,  ESW_ACT_TXT, 
       F_ITEM_FIND('', ESW_ITEM_CD, 'K') ESW_ITEM_NM, 
       F_CODE_FIND('0515', ESW_MARK_CD, '', '1') ESW_MARK_NM 
  FROM ET_STDT_VIEWO 
 WHERE 1 = 1

IF (:MARK_CD <> '') THEN
   AND ESW_MARK_CD  = :MARK_CD

IF (:MARK_SQ <> '') THEN
   AND ESW_MARK_SQ  = :MARK_SQ

IF (:SPNJN_KD <> '') THEN
   AND ESW_PNJN_KD  = :PNJN_KD

IF (:ITEM_CD <> '') THEN
   AND ESW_ITEM_CD  = :ITEM_CD

IF (:USE_YN <> '') THEN
   AND  ESW_USE_YN  = :USE_YN

 ORDER BY ESW_MARK_CD, ESW_ITEM_CD, ESW_PNJN_KD
		*/

		sql = " SELECT ESW_MARK_CD, ESW_MARK_SQ, ESW_MARK_CD || '-' || ESW_MARK_SQ ESW_MARK_NO, ESW_PNJN_KD, ESW_ITEM_CD, ESW_CHAR_REF1, ESW_CHAR_REF2, ESW_CHAR_REF3, ESW_CHAR_REF4, ESW_CHAR_REF5, ESW_CHAR_REF6, ESW_CHAR_REF7, ESW_CHAR_REF8, ESW_CHAR_REF9, ESW_CHAR_REF10, ESW_APLY_KD, ESW_RSLT_KD, ESW_VIEW_TXT, ESW_ACT_TXT, F_ITEM_FIND('', ESW_ITEM_CD, 'K') ESW_ITEM_NM, F_CODE_FIND('0515', ESW_MARK_CD, '', '1') ESW_MARK_NM";
		sql += " FROM ET_STDT_VIEWO";
		sql += " WHERE 1 = 1";

		if(! MARK_CD.equals("")) {
			sql += " AND ESW_MARK_CD = '" + MARK_CD + "'";
		}
		if(! MARK_SQ.equals("")) {
			sql += " AND ESW_MARK_SQ = '" + MARK_SQ + "'";
		}
		if(! SPNJN_KD.equals("")) {
			sql += " AND ESW_PNJN_KD = '" + PNJN_KD + "'";
		}
		if(! ITEM_CD.equals("")) {
			sql += " AND ESW_ITEM_CD = '" + ITEM_CD + "'";
		}
		if(! USE_YN.equals("")) {
			sql += " AND ESW_USE_YN = '" + USE_YN + "'";
		}

		sql += " ORDER BY ESW_MARK_CD, ESW_ITEM_CD, ESW_PNJN_KD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_PnjnO_Up_ViewDisplay_001 \n";
			G_INFO += "설명 : 학교밖청소년 소견코드 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MARK_CD : " + MARK_CD + " \n";
			G_INFO += " MARK_SQ : " + MARK_SQ + " \n";
			G_INFO += " SPNJN_KD : " + SPNJN_KD + " \n";
			G_INFO += " PNJN_KD : " + PNJN_KD + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
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
		<s:AttributeType name='ESW_MARK_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO' rs:basecolumn='ESW_MARK_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_MARK_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO' rs:basecolumn='ESW_MARK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_MARK_NO' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_PNJN_KD' rs:number='4' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO' rs:basecolumn='ESW_PNJN_KD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_ITEM_CD' rs:number='5' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO' rs:basecolumn='ESW_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_CHAR_REF1' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_CHAR_REF1'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_CHAR_REF2' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_CHAR_REF2'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_CHAR_REF3' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_CHAR_REF3'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_CHAR_REF4' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_CHAR_REF4'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_CHAR_REF5' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_CHAR_REF5'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_CHAR_REF6' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_CHAR_REF6'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_CHAR_REF7' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_CHAR_REF7'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_CHAR_REF8' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_CHAR_REF8'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_CHAR_REF9' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_CHAR_REF9'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_CHAR_REF10' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_CHAR_REF10'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_APLY_KD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_APLY_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_RSLT_KD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_VIEW_TXT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_VIEW_TXT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_ACT_TXT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEWO'
			 rs:basecolumn='ESW_ACT_TXT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_ITEM_NM' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ESW_MARK_NM' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='22' rs:rowid='true' rs:basetable='ET_STDT_VIEWO' rs:basecolumn='ROWID'
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

			String ESW_MARK_CD_T = cRsList.getString("ESW_MARK_CD");
			String ESW_MARK_SQ_T = cRsList.getString("ESW_MARK_SQ");
			String ESW_MARK_NO_T = cRsList.getString("ESW_MARK_NO");
			String ESW_PNJN_KD_T = cRsList.getString("ESW_PNJN_KD");
			String ESW_ITEM_CD_T = cRsList.getString("ESW_ITEM_CD");
			String ESW_CHAR_REF1_T = cRsList.getString("ESW_CHAR_REF1");
			String ESW_CHAR_REF2_T = cRsList.getString("ESW_CHAR_REF2");
			String ESW_CHAR_REF3_T = cRsList.getString("ESW_CHAR_REF3");
			String ESW_CHAR_REF4_T = cRsList.getString("ESW_CHAR_REF4");
			String ESW_CHAR_REF5_T = cRsList.getString("ESW_CHAR_REF5");
			String ESW_CHAR_REF6_T = cRsList.getString("ESW_CHAR_REF6");
			String ESW_CHAR_REF7_T = cRsList.getString("ESW_CHAR_REF7");
			String ESW_CHAR_REF8_T = cRsList.getString("ESW_CHAR_REF8");
			String ESW_CHAR_REF9_T = cRsList.getString("ESW_CHAR_REF9");
			String ESW_CHAR_REF10_T = cRsList.getString("ESW_CHAR_REF10");
			String ESW_APLY_KD_T = cRsList.getString("ESW_APLY_KD");
			String ESW_RSLT_KD_T = cRsList.getString("ESW_RSLT_KD");
			String ESW_VIEW_TXT_T = cRsList.getString("ESW_VIEW_TXT");
			String ESW_ACT_TXT_T = cRsList.getString("ESW_ACT_TXT");
			String ESW_ITEM_NM_T = cRsList.getString("ESW_ITEM_NM");
			String ESW_MARK_NM_T = cRsList.getString("ESW_MARK_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ESW_MARK_CD_T.equals("")) {
%>
		 		ESW_MARK_CD='<%= ESW_MARK_CD_T%>'
<%
			}

			if(! ESW_MARK_SQ_T.equals("")) {
%>
		 		ESW_MARK_SQ='<%= ESW_MARK_SQ_T%>'
<%
			}

			if(! ESW_MARK_NO_T.equals("")) {
%>
		 		ESW_MARK_NO='<%= ESW_MARK_NO_T%>'
<%
			}

			if(! ESW_PNJN_KD_T.equals("")) {
%>
		 		ESW_PNJN_KD='<%= ESW_PNJN_KD_T%>'
<%
			}

			if(! ESW_ITEM_CD_T.equals("")) {
%>
		 		ESW_ITEM_CD='<%= ESW_ITEM_CD_T%>'
<%
			}

			if(! ESW_CHAR_REF1_T.equals("")) {
%>
		 		ESW_CHAR_REF1='<%= ESW_CHAR_REF1_T%>'
<%
			}

			if(! ESW_CHAR_REF2_T.equals("")) {
%>
		 		ESW_CHAR_REF2='<%= ESW_CHAR_REF2_T%>'
<%
			}

			if(! ESW_CHAR_REF3_T.equals("")) {
%>
		 		ESW_CHAR_REF3='<%= ESW_CHAR_REF3_T%>'
<%
			}

			if(! ESW_CHAR_REF4_T.equals("")) {
%>
		 		ESW_CHAR_REF4='<%= ESW_CHAR_REF4_T%>'
<%
			}

			if(! ESW_CHAR_REF5_T.equals("")) {
%>
		 		ESW_CHAR_REF5='<%= ESW_CHAR_REF5_T%>'
<%
			}

			if(! ESW_CHAR_REF6_T.equals("")) {
%>
		 		ESW_CHAR_REF6='<%= ESW_CHAR_REF6_T%>'
<%
			}

			if(! ESW_CHAR_REF7_T.equals("")) {
%>
		 		ESW_CHAR_REF7='<%= ESW_CHAR_REF7_T%>'
<%
			}

			if(! ESW_CHAR_REF8_T.equals("")) {
%>
		 		ESW_CHAR_REF8='<%= ESW_CHAR_REF8_T%>'
<%
			}

			if(! ESW_CHAR_REF9_T.equals("")) {
%>
		 		ESW_CHAR_REF9='<%= ESW_CHAR_REF9_T%>'
<%
			}

			if(! ESW_CHAR_REF10_T.equals("")) {
%>
		 		ESW_CHAR_REF10='<%= ESW_CHAR_REF10_T%>'
<%
			}

			if(! ESW_APLY_KD_T.equals("")) {
%>
		 		ESW_APLY_KD='<%= ESW_APLY_KD_T%>'
<%
			}

			if(! ESW_RSLT_KD_T.equals("")) {
%>
		 		ESW_RSLT_KD='<%= ESW_RSLT_KD_T%>'
<%
			}

			if(! ESW_VIEW_TXT_T.equals("")) {
%>
		 		ESW_VIEW_TXT='<%= ESW_VIEW_TXT_T%>'
<%
			}

			if(! ESW_ACT_TXT_T.equals("")) {
%>
		 		ESW_ACT_TXT='<%= ESW_ACT_TXT_T%>'
<%
			}

			if(! ESW_ITEM_NM_T.equals("")) {
%>
		 		ESW_ITEM_NM='<%= ESW_ITEM_NM_T%>'
<%
			}

			if(! ESW_MARK_NM_T.equals("")) {
%>
		 		ESW_MARK_NM='<%= ESW_MARK_NM_T%>'
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
