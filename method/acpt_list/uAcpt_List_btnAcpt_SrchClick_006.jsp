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
		String ITEM_CD = htMethod.get("ITEM_CD");
		String PARAM_TX = htMethod.get("PARAM_TX");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(COMP_CD == null) { COMP_CD = ""; }
		if(ITEM_CD == null) { ITEM_CD = ""; }
		if(PARAM_TX == null) { PARAM_TX = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT D.EEA_CHART_NO, D.EEA_EXAM_DT, D.EEA_PSNL_NM, 
       CASE D.EEA_SEX_CD WHEN '1' THEN 'M' WHEN '2' THEN 'F' ELSE D.EEA_SEX_CD END EEA_SEX_NM, 
       D.ICR_PENL_ID, D.ICR_BIRH_DT, E.ERI_ITEM_CD, G.IIM_KNME_NM, E.ERI_RSLT_VL, 
       D.EEA_EMAIL_AR, D.EEA_FAMY_CD, D.EEA_FAMY_NM, F_CODE_FIND('0919', D.EEA_FAMY_CD, '', '1') EEA_RLTN_NM, 
       D.EEA_EMAIL_AR || CASE WHEN NVL(D.EEA_FAMY_CD, '00') <= '01' THEN '' 
                              ELSE '/' || D.EEA_FAMY_NM || '의 ' || F_CODE_FIND('0919', D.EEA_FAMY_CD, '', '1') END EEA_EMAIL_TX,
       F_TEL_FORMAT(D.EEA_MOBL_NO) EEA_MOBL_NO, D.EEA_EXAM_LT, F_PACK_FIND(D.EEA_EXAM_LT, D.EEA_COMP_CD) EEA_PACK_NM, 
       ' ' EEA_TEMP_TX, D.EEA_COMP_CD, F_COMP_FIND(D.EEA_COMP_CD) EEA_COMP_NM 
  FROM (SELECT A.*, B.ICR_PENL_ID, B.ICR_BIRH_DT 
          FROM ET_EXAM_ACPT A, IT_CUSTOMER B, ET_RSLT_ITEM C
         WHERE A.EEA_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT 

if (:COMP_CD <> '') then
       AND A.EEA_COMP_CD = :COMP_CD

           AND NVL(A.EEA_ORDER_YN, 'N') <> 'C' 
           AND B.ICR_CUST_NO = A.EEA_CUST_NO 
           AND C.ERI_EXAM_DT = A.EEA_EXAM_DT 
           AND C.ERI_EXAM_SQ = A.EEA_EXAM_SQ 
           AND UPPER(C.ERI_ITEM_CD) = :ITEM_CD 
           AND NVL(C.ERI_CNCL_YN, 'N') <> 'Y'
       ) D, ET_RSLT_ITEM E, ET_PACK_MARK_ITEM F, IT_ITEM G 
 WHERE E.ERI_EXAM_DT = D.EEA_EXAM_DT 
   AND E.ERI_EXAM_SQ = D.EEA_EXAM_SQ 
   AND NVL(E.ERI_CNCL_YN, 'N') <> 'Y' 
   AND F.EMI_MARK_KD = '3' 
   AND F.EMI_MARK_CD = '03' 
   AND F.EMI_MARK_SQ = '001' 
   AND F.EMI_ITEM_CD = E.ERI_ITEM_CD
   AND G.IIM_ITEM_CD = F.EMI_ITEM_CD      

:PARAM_TX 
		*/

		sql = " SELECT D.EEA_CHART_NO, D.EEA_EXAM_DT, D.EEA_PSNL_NM, CASE D.EEA_SEX_CD WHEN '1' THEN 'M' WHEN '2' THEN 'F' ELSE D.EEA_SEX_CD END EEA_SEX_NM, D.ICR_PENL_ID, D.ICR_BIRH_DT, E.ERI_ITEM_CD, G.IIM_KNME_NM, E.ERI_RSLT_VL, D.EEA_EMAIL_AR, D.EEA_FAMY_CD, D.EEA_FAMY_NM, F_CODE_FIND('0919', D.EEA_FAMY_CD, '', '1') EEA_RLTN_NM, D.EEA_EMAIL_AR || CASE WHEN NVL(D.EEA_FAMY_CD, '00') <= '01' THEN '' ELSE '/' || D.EEA_FAMY_NM || '의 ' || F_CODE_FIND('0919', D.EEA_FAMY_CD, '', '1') END EEA_EMAIL_TX, F_TEL_FORMAT(D.EEA_MOBL_NO) EEA_MOBL_NO, D.EEA_EXAM_LT, F_PACK_FIND(D.EEA_EXAM_LT, D.EEA_COMP_CD) EEA_PACK_NM, ' ' EEA_TEMP_TX, D.EEA_COMP_CD, F_COMP_FIND(D.EEA_COMP_CD) EEA_COMP_NM";
		sql += " FROM (SELECT A.*, B.ICR_PENL_ID, B.ICR_BIRH_DT";
		sql += " FROM ET_EXAM_ACPT A, IT_CUSTOMER B, ET_RSLT_ITEM C";
		sql += " WHERE A.EEA_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";

		if(! COMP_CD.equals("")) {
			sql += " AND A.EEA_COMP_CD = '" + COMP_CD + "'";
		}

		sql += " AND NVL(A.EEA_ORDER_YN, 'N') <> 'C'";
		sql += " AND B.ICR_CUST_NO = A.EEA_CUST_NO";
		sql += " AND C.ERI_EXAM_DT = A.EEA_EXAM_DT";
		sql += " AND C.ERI_EXAM_SQ = A.EEA_EXAM_SQ";
		sql += " AND UPPER(C.ERI_ITEM_CD) = '" + ITEM_CD + "'";
		sql += " AND NVL(C.ERI_CNCL_YN, 'N') <> 'Y' ) D, ET_RSLT_ITEM E, ET_PACK_MARK_ITEM F, IT_ITEM G";
		sql += " WHERE E.ERI_EXAM_DT = D.EEA_EXAM_DT";
		sql += " AND E.ERI_EXAM_SQ = D.EEA_EXAM_SQ";
		sql += " AND NVL(E.ERI_CNCL_YN, 'N') <> 'Y'";
		sql += " AND F.EMI_MARK_KD = '3'";
		sql += " AND F.EMI_MARK_CD = '03'";
		sql += " AND F.EMI_MARK_SQ = '001'";
		sql += " AND F.EMI_ITEM_CD = E.ERI_ITEM_CD";
		sql += " AND G.IIM_ITEM_CD = F.EMI_ITEM_CD";
		
		sql += PARAM_TX;
		
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uAcpt_List_btnAcpt_SrchClick_006 \n";
			G_INFO += "설명 : 바이오에이지용 자료 추출-2 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " ITEM_CD : " + ITEM_CD + " \n";
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
		<s:AttributeType name='EEA_CHART_NO' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='3'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_SEX_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_PENL_ID' rs:number='5'>
			<s:datatype dt:type='string' dt:maxLength='13' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ITEM_CD' rs:number='7'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_KNME_NM' rs:number='8'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EMAIL_AR' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_CD' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_FAMY_NM' rs:number='12' rs:nullable='true'>
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
		<s:AttributeType name='EEA_EXAM_LT' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PACK_NM' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_TEMP_TX' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_CD' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
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
