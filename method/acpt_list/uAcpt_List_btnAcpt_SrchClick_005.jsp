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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String COMP_CD = htMethod.get("COMP_CD");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_CHART_NO, A.EEA_EXAM_DT, A.EEA_PSNL_NM,
       CASE A.EEA_SEX_CD WHEN '1' THEN 'M' WHEN '2' THEN 'F' ELSE A.EEA_SEX_CD END EEA_SEX_NM,
       B.ICR_PENL_ID, B.ICR_BIRH_DT,
       C.ERI_ITEM_CD, E.IIM_KNME_NM, C.ERI_RSLT_VL,
       A.EEA_EMAIL_AR, A.EEA_FAMY_CD, A.EEA_FAMY_NM, F_CODE_FIND('0919', A.EEA_FAMY_CD, '', '1') EEA_RLTN_NM,
       A.EEA_EMAIL_AR || CASE WHEN NVL(A.EEA_FAMY_CD, '00') <= '01' THEN ''
                              ELSE '/' || A.EEA_FAMY_NM || '의 ' || F_CODE_FIND('0919', A.EEA_FAMY_CD, '', '1') END EEA_EMAIL_TX,
       F_TEL_FORMAT(A.EEA_MOBL_NO) EEA_MOBL_NO,
       A.EEA_EXAM_LT, F_PACK_FIND(A.EEA_EXAM_LT, A.EEA_COMP_CD)  EEA_PACK_NM, ' ' EEA_TEMP_TX,
       A.EEA_COMP_CD, F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM
  FROM ET_EXAM_ACPT A, IT_CUSTOMER B, ET_RSLT_ITEM C, ET_PACK_MARK_ITEM D, IT_ITEM E
 WHERE A.EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT

if (:COMP_CD <> '') then
     AND A.EEA_COMP_CD = :COMP_CD

   AND NVL(A.EEA_ORDER_YN, 'N') <> 'C'
   AND B.ICR_CUST_NO = A.EEA_CUST_NO
   AND C.ERI_EXAM_DT = A.EEA_EXAM_DT
   AND C.ERI_EXAM_SQ = A.EEA_EXAM_SQ
   AND NVL(C.ERI_CNCL_YN, 'N') <> 'Y'
   AND D.EMI_MARK_KD = '3'
   AND D.EMI_MARK_CD = '03'
   AND D.EMI_MARK_SQ = '001'   
   AND D.EMI_ITEM_CD = C.ERI_ITEM_CD
   AND E.IIM_ITEM_CD = D.EMI_ITEM_CD

:PARAM_TX

		*/

		sql = " SELECT A.EEA_CHART_NO, A.EEA_EXAM_DT, A.EEA_PSNL_NM, CASE A.EEA_SEX_CD WHEN '1' THEN 'M' WHEN '2' THEN 'F' ELSE A.EEA_SEX_CD END EEA_SEX_NM, B.ICR_PENL_ID, B.ICR_BIRH_DT, C.ERI_ITEM_CD, E.IIM_KNME_NM, C.ERI_RSLT_VL, A.EEA_EMAIL_AR, A.EEA_FAMY_CD, A.EEA_FAMY_NM, F_CODE_FIND('0919', A.EEA_FAMY_CD, '', '1') EEA_RLTN_NM, A.EEA_EMAIL_AR || CASE WHEN NVL(A.EEA_FAMY_CD, '00') <= '01' THEN '' ELSE '/' || A.EEA_FAMY_NM || '의 ' || F_CODE_FIND('0919', A.EEA_FAMY_CD, '', '1') END EEA_EMAIL_TX, F_TEL_FORMAT(A.EEA_MOBL_NO) EEA_MOBL_NO, A.EEA_EXAM_LT, F_PACK_FIND(A.EEA_EXAM_LT, A.EEA_COMP_CD) EEA_PACK_NM, ' ' EEA_TEMP_TX, A.EEA_COMP_CD, F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM";
		sql += " FROM ET_EXAM_ACPT A, IT_CUSTOMER B, ET_RSLT_ITEM C, ET_PACK_MARK_ITEM D, IT_ITEM E";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";

		if(! COMP_CD.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		}

		sql += " AND NVL(A.EEA_ORDER_YN, 'N') <> 'C'";
		sql += " AND B.ICR_CUST_NO = A.EEA_CUST_NO";
		sql += " AND C.ERI_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND C.ERI_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " AND NVL(C.ERI_CNCL_YN, 'N') <> 'Y'";
		sql += " AND D.EMI_MARK_KD = '3'";
		sql += " AND D.EMI_MARK_CD = '03'";
		sql += " AND D.EMI_MARK_SQ = '001'";
		sql += " AND D.EMI_ITEM_CD = C.ERI_ITEM_CD";
		sql += " AND E.IIM_ITEM_CD = D.EMI_ITEM_CD";
		
		sql += PARAM_TX;
		
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_List_btnAcpt_SrchClick_005 \n";
			G_INFO += "설명 : 바이오에이지용 자료 추출 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " PARAM_TX : " + PARAM_TX + " \n";
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
		<s:AttributeType name='EEA_CHART_NO' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_CHART_NO'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='3' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='5'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ITEM_CD' rs:number='7' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ERI_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='8' rs:writeunknown='true' rs:basetable='IT_ITEM' rs:basecolumn='IIM_KNME_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_RSLT_ITEM'
			 rs:basecolumn='ERI_RSLT_VL'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMAIL_AR' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EMAIL_AR'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FAMY_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_NM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_FAMY_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_RLTN_NM' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMAIL_TX' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_MOBL_NO' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_LT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_EXAM_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PACK_NM' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEMP_TX' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT'
			 rs:basecolumn='EEA_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='21' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c21' rs:name='ROWID' rs:number='22' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c22' rs:name='ROWID' rs:number='23' rs:rowid='true' rs:basetable='ET_RSLT_ITEM' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c23' rs:name='ROWID' rs:number='24' rs:rowid='true' rs:basetable='ET_PACK_MARK_ITEM'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c24' rs:name='ROWID' rs:number='25' rs:rowid='true' rs:basetable='IT_ITEM' rs:basecolumn='ROWID'
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

			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String EEA_SEX_NM_T = cRsList.getString("EEA_SEX_NM");
			String ICR_PENL_ID_T = cRsList.getString("ICR_PENL_ID");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String IIM_KNME_NM_T = cRsList.getString("IIM_KNME_NM");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String EEA_EMAIL_AR_T = cRsList.getString("EEA_EMAIL_AR");
			String EEA_FAMY_CD_T = cRsList.getString("EEA_FAMY_CD");
			String EEA_FAMY_NM_T = cRsList.getString("EEA_FAMY_NM");
			String EEA_RLTN_NM_T = cRsList.getString("EEA_RLTN_NM");
			String EEA_EMAIL_TX_T = cRsList.getString("EEA_EMAIL_TX");
			String EEA_MOBL_NO_T = cRsList.getString("EEA_MOBL_NO");
			String EEA_EXAM_LT_T = cRsList.getString("EEA_EXAM_LT");
			String EEA_PACK_NM_T = cRsList.getString("EEA_PACK_NM");
			String EEA_TEMP_TX_T = cRsList.getString("EEA_TEMP_TX");
			String EEA_COMP_CD_T = cRsList.getString("EEA_COMP_CD");
			String EEA_COMP_NM_T = cRsList.getString("EEA_COMP_NM");
			String ROWID_T = cRsList.getString("ROWID");
			String c21_T = cRsList.getString("c21");
			String c22_T = cRsList.getString("c22");
			String c23_T = cRsList.getString("c23");
			String c24_T = cRsList.getString("c24");
%>
			<z:row
<%
			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! EEA_SEX_NM_T.equals("")) {
%>
		 		EEA_SEX_NM='<%= EEA_SEX_NM_T%>'
<%
			}

			if(! ICR_PENL_ID_T.equals("")) {
%>
		 		ICR_PENL_ID='<%= ICR_PENL_ID_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! ERI_ITEM_CD_T.equals("")) {
%>
		 		ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
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

			if(! EEA_EMAIL_AR_T.equals("")) {
%>
		 		EEA_EMAIL_AR='<%= EEA_EMAIL_AR_T%>'
<%
			}

			if(! EEA_FAMY_CD_T.equals("")) {
%>
		 		EEA_FAMY_CD='<%= EEA_FAMY_CD_T%>'
<%
			}

			if(! EEA_FAMY_NM_T.equals("")) {
%>
		 		EEA_FAMY_NM='<%= EEA_FAMY_NM_T%>'
<%
			}

			if(! EEA_RLTN_NM_T.equals("")) {
%>
		 		EEA_RLTN_NM='<%= EEA_RLTN_NM_T%>'
<%
			}

			if(! EEA_EMAIL_TX_T.equals("")) {
%>
		 		EEA_EMAIL_TX='<%= EEA_EMAIL_TX_T%>'
<%
			}

			if(! EEA_MOBL_NO_T.equals("")) {
%>
		 		EEA_MOBL_NO='<%= EEA_MOBL_NO_T%>'
<%
			}

			if(! EEA_EXAM_LT_T.equals("")) {
%>
		 		EEA_EXAM_LT='<%= EEA_EXAM_LT_T%>'
<%
			}

			if(! EEA_PACK_NM_T.equals("")) {
%>
		 		EEA_PACK_NM='<%= EEA_PACK_NM_T%>'
<%
			}

			if(! EEA_TEMP_TX_T.equals("")) {
%>
		 		EEA_TEMP_TX='<%= EEA_TEMP_TX_T%>'
<%
			}

			if(! EEA_COMP_CD_T.equals("")) {
%>
		 		EEA_COMP_CD='<%= EEA_COMP_CD_T%>'
<%
			}

			if(! EEA_COMP_NM_T.equals("")) {
%>
		 		EEA_COMP_NM='<%= EEA_COMP_NM_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c21_T.equals("")) {
%>
		 		c21='<%= c21_T%>'
<%
			}

			if(! c22_T.equals("")) {
%>
		 		c22='<%= c22_T%>'
<%
			}

			if(! c23_T.equals("")) {
%>
		 		c23='<%= c23_T%>'
<%
			}

			if(! c24_T.equals("")) {
%>
		 		c24='<%= c24_T%>'
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
