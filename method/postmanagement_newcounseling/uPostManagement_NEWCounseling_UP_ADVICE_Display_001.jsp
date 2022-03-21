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
		String DTEDTADVI_DT = htMethod.get("DTEDTADVI_DT");
		String DTEDTNEXT_DT = htMethod.get("DTEDTNEXT_DT");
		String CMBADVICE_CD = htMethod.get("CMBADVICE_CD");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(DTEDTADVI_DT == null) { DTEDTADVI_DT = ""; }
		if(DTEDTNEXT_DT == null) { DTEDTNEXT_DT = ""; }
		if(CMBADVICE_CD == null) { CMBADVICE_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT GetCOMMON_LvCdToNm('0427',SAE_ADVI_CD,'5',1) SAE_ADVI_NM,
       F_USER_FIND(SAE_NURSE_ID) SAE_NURSE_NM, F_USER_FIND(SAE_DOCT_ID) SAE_DOCT_NM, A.*
FROM ST_ADVICE A
WHERE SAE_EXAM_DT = :EXAM_DT
   AND SAE_EXAM_SQ = :EXAM_SQ

//상담일자
if :DTEdtADVI_DT <> ' then 
  AND SAE_ADVI_DT = :DTEdtADVI_DT
  
//상담 예약일자
if :DTEdtNEXT_DT <> ' then 
  AND SAE_NEXT_DT = :DTEdtNEXT_DT

//상담구분
if :CmbADVICE_CD <> '0' then 
  AND SAE_ADVI_CD = :CmbADVICE_CD

		*/

		sql = " SELECT GETCOMMON_LVCDTONM('0427',SAE_ADVI_CD,'5',1) SAE_ADVI_NM, F_USER_FIND(SAE_NURSE_ID) SAE_NURSE_NM, F_USER_FIND(SAE_DOCT_ID) SAE_DOCT_NM, A.*";
		sql += " FROM ST_ADVICE A";
		sql += " WHERE SAE_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND SAE_EXAM_SQ = '" + EXAM_SQ + "'";

		if(! DTEDTADVI_DT.equals("")) {
			sql += " AND SAE_ADVI_DT = '" + DTEDTADVI_DT + "'";
		}
		if(! DTEDTNEXT_DT.equals("")) {
			sql += " AND SAE_NEXT_DT = '" + DTEDTNEXT_DT + "'";
		}
		if(! CMBADVICE_CD.equals("")) {
			sql += " AND SAE_ADVI_CD = '" + CMBADVICE_CD + "'";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPostManagement_NEWCounseling_UP_ADVICE_Display_001 \n";
			G_INFO += "설명 : 상담정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " DTEDTADVI_DT : " + DTEDTADVI_DT + " \n";
			G_INFO += " DTEDTNEXT_DT : " + DTEDTNEXT_DT + " \n";
			G_INFO += " CMBADVICE_CD : " + CMBADVICE_CD + " \n";
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
		<s:AttributeType name='SAE_ADVI_NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_NURSE_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_DOCT_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_ADVI_DT' rs:number='4' rs:writeunknown='true' rs:basetable='ST_ADVICE' rs:basecolumn='SAE_ADVI_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_CUST_NO' rs:number='5' rs:writeunknown='true' rs:basetable='ST_ADVICE' rs:basecolumn='SAE_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_ADVI_SQ' rs:number='6' rs:writeunknown='true' rs:basetable='ST_ADVICE' rs:basecolumn='SAE_ADVI_SQ'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_EXAM_DT' rs:number='7' rs:writeunknown='true' rs:basetable='ST_ADVICE' rs:basecolumn='SAE_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_EXAM_SQ' rs:number='8' rs:writeunknown='true' rs:basetable='ST_ADVICE' rs:basecolumn='SAE_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_EXAM_CHA' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ADVICE'
			 rs:basecolumn='SAE_EXAM_CHA'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_NEXT_DT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ADVICE'
			 rs:basecolumn='SAE_NEXT_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_ADVI_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ADVICE'
			 rs:basecolumn='SAE_ADVI_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_ADVI_TX' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ADVICE'
			 rs:basecolumn='SAE_ADVI_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_NURSE_ID' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ADVICE'
			 rs:basecolumn='SAE_NURSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_DOCT_ID' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ADVICE'
			 rs:basecolumn='SAE_DOCT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_INPT_ID' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ADVICE'
			 rs:basecolumn='SAE_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_INPT_DTT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ADVICE'
			 rs:basecolumn='SAE_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_MODI_ID' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ADVICE'
			 rs:basecolumn='SAE_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_MODI_DTT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ADVICE'
			 rs:basecolumn='SAE_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SAE_USE_YN' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ADVICE'
			 rs:basecolumn='SAE_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='20' rs:rowid='true' rs:basetable='ST_ADVICE' rs:basecolumn='ROWID'
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

			String SAE_ADVI_NM_T = cRsList.getString("SAE_ADVI_NM");
			String SAE_NURSE_NM_T = cRsList.getString("SAE_NURSE_NM");
			String SAE_DOCT_NM_T = cRsList.getString("SAE_DOCT_NM");
			String SAE_ADVI_DT_T = cRsList.getString("SAE_ADVI_DT");
			String SAE_CUST_NO_T = cRsList.getString("SAE_CUST_NO");
			String SAE_ADVI_SQ_T = cRsList.getString("SAE_ADVI_SQ");
			String SAE_EXAM_DT_T = cRsList.getString("SAE_EXAM_DT");
			String SAE_EXAM_SQ_T = cRsList.getString("SAE_EXAM_SQ");
			String SAE_EXAM_CHA_T = cRsList.getString("SAE_EXAM_CHA");
			String SAE_NEXT_DT_T = cRsList.getString("SAE_NEXT_DT");
			String SAE_ADVI_CD_T = cRsList.getString("SAE_ADVI_CD");
			String SAE_ADVI_TX_T = cRsList.getString("SAE_ADVI_TX");
			String SAE_NURSE_ID_T = cRsList.getString("SAE_NURSE_ID");
			String SAE_DOCT_ID_T = cRsList.getString("SAE_DOCT_ID");
			String SAE_INPT_ID_T = cRsList.getString("SAE_INPT_ID");
			String SAE_INPT_DTT_T = cRsList.getDate2("SAE_INPT_DTT");
			String SAE_MODI_ID_T = cRsList.getString("SAE_MODI_ID");
			String SAE_MODI_DTT_T = cRsList.getDate2("SAE_MODI_DTT");
			String SAE_USE_YN_T = cRsList.getString("SAE_USE_YN");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! SAE_ADVI_NM_T.equals("")) {
%>
		 		SAE_ADVI_NM='<%= SAE_ADVI_NM_T%>'
<%
			}

			if(! SAE_NURSE_NM_T.equals("")) {
%>
		 		SAE_NURSE_NM='<%= SAE_NURSE_NM_T%>'
<%
			}

			if(! SAE_DOCT_NM_T.equals("")) {
%>
		 		SAE_DOCT_NM='<%= SAE_DOCT_NM_T%>'
<%
			}

			if(! SAE_ADVI_DT_T.equals("")) {
%>
		 		SAE_ADVI_DT='<%= SAE_ADVI_DT_T%>'
<%
			}

			if(! SAE_CUST_NO_T.equals("")) {
%>
		 		SAE_CUST_NO='<%= SAE_CUST_NO_T%>'
<%
			}

			if(! SAE_ADVI_SQ_T.equals("")) {
%>
		 		SAE_ADVI_SQ='<%= SAE_ADVI_SQ_T%>'
<%
			}

			if(! SAE_EXAM_DT_T.equals("")) {
%>
		 		SAE_EXAM_DT='<%= SAE_EXAM_DT_T%>'
<%
			}

			if(! SAE_EXAM_SQ_T.equals("")) {
%>
		 		SAE_EXAM_SQ='<%= SAE_EXAM_SQ_T%>'
<%
			}

			if(! SAE_EXAM_CHA_T.equals("")) {
%>
		 		SAE_EXAM_CHA='<%= SAE_EXAM_CHA_T%>'
<%
			}

			if(! SAE_NEXT_DT_T.equals("")) {
%>
		 		SAE_NEXT_DT='<%= SAE_NEXT_DT_T%>'
<%
			}

			if(! SAE_ADVI_CD_T.equals("")) {
%>
		 		SAE_ADVI_CD='<%= SAE_ADVI_CD_T%>'
<%
			}

			if(! SAE_ADVI_TX_T.equals("")) {
%>
		 		SAE_ADVI_TX='<%= SAE_ADVI_TX_T%>'
<%
			}

			if(! SAE_NURSE_ID_T.equals("")) {
%>
		 		SAE_NURSE_ID='<%= SAE_NURSE_ID_T%>'
<%
			}

			if(! SAE_DOCT_ID_T.equals("")) {
%>
		 		SAE_DOCT_ID='<%= SAE_DOCT_ID_T%>'
<%
			}

			if(! SAE_INPT_ID_T.equals("")) {
%>
		 		SAE_INPT_ID='<%= SAE_INPT_ID_T%>'
<%
			}

			if(! SAE_INPT_DTT_T.equals("")) {
%>
		 		SAE_INPT_DTT='<%= SAE_INPT_DTT_T%>'
<%
			}

			if(! SAE_MODI_ID_T.equals("")) {
%>
		 		SAE_MODI_ID='<%= SAE_MODI_ID_T%>'
<%
			}

			if(! SAE_MODI_DTT_T.equals("")) {
%>
		 		SAE_MODI_DTT='<%= SAE_MODI_DTT_T%>'
<%
			}

			if(! SAE_USE_YN_T.equals("")) {
%>
		 		SAE_USE_YN='<%= SAE_USE_YN_T%>'
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
