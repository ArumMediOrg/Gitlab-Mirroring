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
		String PNJN_KD = htMethod.get("PNJN_KD");
		String ITEM_CD = htMethod.get("ITEM_CD");
		String USE_YN = htMethod.get("USE_YN");

		//
		if(MARK_CD == null) { MARK_CD = ""; }
		if(MARK_SQ == null) { MARK_SQ = ""; }
		if(PNJN_KD == null) { PNJN_KD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(USE_YN == null) { USE_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT ESV_MARK_CD,   ESV_MARK_SQ,   ESV_MARK_CD || '-' || ESV_MARK_SQ ESV_MARK_NO,  ESV_PNJN_KD, ESV_ITEM_CD, 
       ESV_CHAR_REF1, ESV_CHAR_REF2, ESV_CHAR_REF3, ESV_CHAR_REF4, ESV_CHAR_REF5, 
       ESV_CHAR_REF6, ESV_CHAR_REF7, ESV_CHAR_REF8, ESV_CHAR_REF9, ESV_CHAR_REF10, 
       ESV_APLY_KD,   ESV_RSLT_KD,   ESV_VIEW_TXT,  ESV_ACT_TXT, 
       F_ITEM_FIND('', ESV_ITEM_CD, 'K') ESV_ITEM_NM, 
       F_CODE_FIND('0515', ESV_MARK_CD, '', '1') ESV_MARK_NM 
  FROM ET_STDT_VIEW 
 WHERE 1 = 1

IF (:MARK_CD <> '') THEN
   AND ESV_MARK_CD  = :MARK_CD

IF (:MARK_SQ <> '') THEN
   AND ESV_MARK_SQ  = :MARK_SQ

IF (:PNJN_KD <> '') THEN
   AND ESV_PNJN_KD  = :PNJN_KD

IF (:ITEM_CD <> '') THEN
   AND ESV_ITEM_CD  = :ITEM_CD

IF (:USE_YN <> '') THEN
   AND  ESV_USE_YN  = :USE_YN

 ORDER BY ESV_MARK_CD, ESV_ITEM_CD, ESV_PNJN_KD
		*/

		sql = " SELECT ESV_MARK_CD, ESV_MARK_SQ, ESV_MARK_CD || '-' || ESV_MARK_SQ ESV_MARK_NO, ESV_PNJN_KD, ESV_ITEM_CD, ESV_CHAR_REF1, ESV_CHAR_REF2, ESV_CHAR_REF3, ESV_CHAR_REF4, ESV_CHAR_REF5, ESV_CHAR_REF6, ESV_CHAR_REF7, ESV_CHAR_REF8, ESV_CHAR_REF9, ESV_CHAR_REF10, ESV_APLY_KD, ESV_RSLT_KD, ESV_VIEW_TXT, ESV_ACT_TXT, F_ITEM_FIND('', ESV_ITEM_CD, 'K') ESV_ITEM_NM, F_CODE_FIND('0515', ESV_MARK_CD, '', '1') ESV_MARK_NM";
		sql += " FROM ET_STDT_VIEW";
		sql += " WHERE 1 = 1";

		if(! MARK_CD.equals("")) {
			sql += " AND ESV_MARK_CD = '" + MARK_CD + "'";
		}
		if(! MARK_SQ.equals("")) {
			sql += " AND ESV_MARK_SQ = '" + MARK_SQ + "'";
		}
		if(! PNJN_KD.equals("")) {
			sql += " AND ESV_PNJN_KD = '" + PNJN_KD + "'";
		}
		if(! ITEM_CD.equals("")) {
			sql += " AND ESV_ITEM_CD = '" + ITEM_CD + "'";
		}
		if(! USE_YN.equals("")) {
			sql += " AND ESV_USE_YN = '" + USE_YN + "'";
		}

		sql += " ORDER BY ESV_MARK_CD, ESV_ITEM_CD, ESV_PNJN_KD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uStdt_Pnjn_Up_ViewDisplay_001 \n";
			G_INFO += "설명 : 학생검진 소견코드 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MARK_CD : " + MARK_CD + " \n";
			G_INFO += " MARK_SQ : " + MARK_SQ + " \n";
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
		<s:AttributeType name='ESV_MARK_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW' rs:basecolumn='ESV_MARK_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_MARK_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW' rs:basecolumn='ESV_MARK_SQ'>
			<s:datatype dt:type='string' dt:maxLength='3' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_MARK_NO' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_PNJN_KD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_PNJN_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_ITEM_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_CHAR_REF1' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_CHAR_REF1'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_CHAR_REF2' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_CHAR_REF2'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_CHAR_REF3' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_CHAR_REF3'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_CHAR_REF4' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_CHAR_REF4'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_CHAR_REF5' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_CHAR_REF5'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_CHAR_REF6' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_CHAR_REF6'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_CHAR_REF7' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_CHAR_REF7'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_CHAR_REF8' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_CHAR_REF8'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_CHAR_REF9' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_CHAR_REF9'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_CHAR_REF10' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_CHAR_REF10'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_APLY_KD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_APLY_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_RSLT_KD' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_RSLT_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_VIEW_TXT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_VIEW_TXT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_ACT_TXT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_STDT_VIEW'
			 rs:basecolumn='ESV_ACT_TXT'>
			<s:datatype dt:type='string' dt:maxLength='500'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_ITEM_NM' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ESV_MARK_NM' rs:number='21' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='22' rs:rowid='true' rs:basetable='ET_STDT_VIEW' rs:basecolumn='ROWID'
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

			String ESV_MARK_CD_T = cRsList.getString("ESV_MARK_CD");
			String ESV_MARK_SQ_T = cRsList.getString("ESV_MARK_SQ");
			String ESV_MARK_NO_T = cRsList.getString("ESV_MARK_NO");
			String ESV_PNJN_KD_T = cRsList.getString("ESV_PNJN_KD");
			String ESV_ITEM_CD_T = cRsList.getString("ESV_ITEM_CD");
			String ESV_CHAR_REF1_T = cRsList.getString("ESV_CHAR_REF1");
			String ESV_CHAR_REF2_T = cRsList.getString("ESV_CHAR_REF2");
			String ESV_CHAR_REF3_T = cRsList.getString("ESV_CHAR_REF3");
			String ESV_CHAR_REF4_T = cRsList.getString("ESV_CHAR_REF4");
			String ESV_CHAR_REF5_T = cRsList.getString("ESV_CHAR_REF5");
			String ESV_CHAR_REF6_T = cRsList.getString("ESV_CHAR_REF6");
			String ESV_CHAR_REF7_T = cRsList.getString("ESV_CHAR_REF7");
			String ESV_CHAR_REF8_T = cRsList.getString("ESV_CHAR_REF8");
			String ESV_CHAR_REF9_T = cRsList.getString("ESV_CHAR_REF9");
			String ESV_CHAR_REF10_T = cRsList.getString("ESV_CHAR_REF10");
			String ESV_APLY_KD_T = cRsList.getString("ESV_APLY_KD");
			String ESV_RSLT_KD_T = cRsList.getString("ESV_RSLT_KD");
			String ESV_VIEW_TXT_T = cRsList.getString("ESV_VIEW_TXT");
			String ESV_ACT_TXT_T = cRsList.getString("ESV_ACT_TXT");
			String ESV_ITEM_NM_T = cRsList.getString("ESV_ITEM_NM");
			String ESV_MARK_NM_T = cRsList.getString("ESV_MARK_NM");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ESV_MARK_CD_T.equals("")) {
%>
		 		ESV_MARK_CD='<%= ESV_MARK_CD_T%>'
<%
			}

			if(! ESV_MARK_SQ_T.equals("")) {
%>
		 		ESV_MARK_SQ='<%= ESV_MARK_SQ_T%>'
<%
			}

			if(! ESV_MARK_NO_T.equals("")) {
%>
		 		ESV_MARK_NO='<%= ESV_MARK_NO_T%>'
<%
			}

			if(! ESV_PNJN_KD_T.equals("")) {
%>
		 		ESV_PNJN_KD='<%= ESV_PNJN_KD_T%>'
<%
			}

			if(! ESV_ITEM_CD_T.equals("")) {
%>
		 		ESV_ITEM_CD='<%= ESV_ITEM_CD_T%>'
<%
			}

			if(! ESV_CHAR_REF1_T.equals("")) {
%>
		 		ESV_CHAR_REF1='<%= ESV_CHAR_REF1_T%>'
<%
			}

			if(! ESV_CHAR_REF2_T.equals("")) {
%>
		 		ESV_CHAR_REF2='<%= ESV_CHAR_REF2_T%>'
<%
			}

			if(! ESV_CHAR_REF3_T.equals("")) {
%>
		 		ESV_CHAR_REF3='<%= ESV_CHAR_REF3_T%>'
<%
			}

			if(! ESV_CHAR_REF4_T.equals("")) {
%>
		 		ESV_CHAR_REF4='<%= ESV_CHAR_REF4_T%>'
<%
			}

			if(! ESV_CHAR_REF5_T.equals("")) {
%>
		 		ESV_CHAR_REF5='<%= ESV_CHAR_REF5_T%>'
<%
			}

			if(! ESV_CHAR_REF6_T.equals("")) {
%>
		 		ESV_CHAR_REF6='<%= ESV_CHAR_REF6_T%>'
<%
			}

			if(! ESV_CHAR_REF7_T.equals("")) {
%>
		 		ESV_CHAR_REF7='<%= ESV_CHAR_REF7_T%>'
<%
			}

			if(! ESV_CHAR_REF8_T.equals("")) {
%>
		 		ESV_CHAR_REF8='<%= ESV_CHAR_REF8_T%>'
<%
			}

			if(! ESV_CHAR_REF9_T.equals("")) {
%>
		 		ESV_CHAR_REF9='<%= ESV_CHAR_REF9_T%>'
<%
			}

			if(! ESV_CHAR_REF10_T.equals("")) {
%>
		 		ESV_CHAR_REF10='<%= ESV_CHAR_REF10_T%>'
<%
			}

			if(! ESV_APLY_KD_T.equals("")) {
%>
		 		ESV_APLY_KD='<%= ESV_APLY_KD_T%>'
<%
			}

			if(! ESV_RSLT_KD_T.equals("")) {
%>
		 		ESV_RSLT_KD='<%= ESV_RSLT_KD_T%>'
<%
			}

			if(! ESV_VIEW_TXT_T.equals("")) {
%>
		 		ESV_VIEW_TXT='<%= ESV_VIEW_TXT_T%>'
<%
			}

			if(! ESV_ACT_TXT_T.equals("")) {
%>
		 		ESV_ACT_TXT='<%= ESV_ACT_TXT_T%>'
<%
			}

			if(! ESV_ITEM_NM_T.equals("")) {
%>
		 		ESV_ITEM_NM='<%= ESV_ITEM_NM_T%>'
<%
			}

			if(! ESV_MARK_NM_T.equals("")) {
%>
		 		ESV_MARK_NM='<%= ESV_MARK_NM_T%>'
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
