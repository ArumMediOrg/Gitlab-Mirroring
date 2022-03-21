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

		String CUST_NO = htMethod.get("CUST_NO");
		String EXAM_DT2 = htMethod.get("EXAM_DT2");
		String EXAM_SQ2 = htMethod.get("EXAM_SQ2");

		//
		if(CUST_NO == null) { CUST_NO = ""; }
		if(EXAM_DT2 == null) { EXAM_DT2 = ""; }
		if(EXAM_SQ2 == null) { EXAM_SQ2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT B.CSM_MATT_NM,B.CSM_INJA_CD,GetSP_COMMON_cdToNm('HM06B',B.CSM_INJA_CD) SIR_INJA_NM, A.*
 FROM ST_ITEM_RECHECK A LEFT OUTER JOIN CT_SP_MATTER B ON A.SIR_MATT_CD = B.CSM_MATT_CD
 WHERE A.SIR_CUST_NO  = :CUST_NO 
   AND A.SIR_EXAM_DT2 = :EXAM_DT2
   AND A.SIR_EXAM_SQ2 = :EXAM_SQ2

		*/

		sql = " SELECT B.CSM_MATT_NM,B.CSM_INJA_CD,GETSP_COMMON_CDTONM('HM06B',B.CSM_INJA_CD) SIR_INJA_NM, A.*";
		sql += " FROM ST_ITEM_RECHECK A LEFT OUTER JOIN CT_SP_MATTER B";
		sql += " ON A.SIR_MATT_CD = B.CSM_MATT_CD";
		sql += " WHERE A.SIR_CUST_NO = '" + CUST_NO + "'";
		sql += " AND A.SIR_EXAM_DT2 = '" + EXAM_DT2 + "'";
		sql += " AND A.SIR_EXAM_SQ2 = '" + EXAM_SQ2 + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_HEALTH_PRINT_UP_MATTGridDisplay_2cha_001 \n";
			G_INFO += "설명 : 재검사항목정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CUST_NO : " + CUST_NO + " \n";
			G_INFO += " EXAM_DT2 : " + EXAM_DT2 + " \n";
			G_INFO += " EXAM_SQ2 : " + EXAM_SQ2 + " \n";
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
		<s:AttributeType name='CSM_MATT_NM' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_MATT_NM'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='CSM_INJA_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_SP_MATTER'
			 rs:basecolumn='CSM_INJA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_INJA_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_DT' rs:number='4' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_SQ' rs:number='5' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_CHA' rs:number='6' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_EXAM_CHA'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_MATT_CD' rs:number='7' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_MATT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_ORGA_CD' rs:number='8' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_ORGA_CD'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_MKJJ_CD' rs:number='9' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_MKJJ_CD'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_SWING_CD' rs:number='10' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_SWING_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_CUST_NO' rs:number='11' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='SIR_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EITEM_LT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_EITEM_LT'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_SITEM_LT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_SITEM_LT'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_DT2' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_EXAM_DT2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_EXAM_SQ2' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_EXAM_SQ2'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_INPT_ID' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_INPT_DTT' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_MODI_ID' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_MODI_DTT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_ETITEM_LT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_ETITEM_LT'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_CBC_CD' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_CBC_CD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_URIN_CD' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_URIN_CD'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_ADD_LT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_ADD_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='SIR_ZERO_LT' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='ST_ITEM_RECHECK'
			 rs:basecolumn='SIR_ZERO_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='25' rs:rowid='true' rs:basetable='ST_ITEM_RECHECK' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c25' rs:name='ROWID' rs:number='26' rs:rowid='true' rs:basetable='CT_SP_MATTER' rs:basecolumn='ROWID'
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

			String CSM_MATT_NM_T = cRsList.getString("CSM_MATT_NM");
			String CSM_INJA_CD_T = cRsList.getString("CSM_INJA_CD");
			String SIR_INJA_NM_T = cRsList.getString("SIR_INJA_NM");
			String SIR_EXAM_DT_T = cRsList.getString("SIR_EXAM_DT");
			String SIR_EXAM_SQ_T = cRsList.getString("SIR_EXAM_SQ");
			String SIR_EXAM_CHA_T = cRsList.getString("SIR_EXAM_CHA");
			String SIR_MATT_CD_T = cRsList.getString("SIR_MATT_CD");
			String SIR_ORGA_CD_T = cRsList.getString("SIR_ORGA_CD");
			String SIR_MKJJ_CD_T = cRsList.getString("SIR_MKJJ_CD");
			String SIR_SWING_CD_T = cRsList.getString("SIR_SWING_CD");
			String SIR_CUST_NO_T = cRsList.getString("SIR_CUST_NO");
			String SIR_EITEM_LT_T = cRsList.getString("SIR_EITEM_LT");
			String SIR_SITEM_LT_T = cRsList.getString("SIR_SITEM_LT");
			String SIR_EXAM_DT2_T = cRsList.getString("SIR_EXAM_DT2");
			String SIR_EXAM_SQ2_T = cRsList.getString("SIR_EXAM_SQ2");
			String SIR_INPT_ID_T = cRsList.getString("SIR_INPT_ID");
			String SIR_INPT_DTT_T = cRsList.getDate2("SIR_INPT_DTT");
			String SIR_MODI_ID_T = cRsList.getString("SIR_MODI_ID");
			String SIR_MODI_DTT_T = cRsList.getDate2("SIR_MODI_DTT");
			String SIR_ETITEM_LT_T = cRsList.getString("SIR_ETITEM_LT");
			String SIR_CBC_CD_T = cRsList.getString("SIR_CBC_CD");
			String SIR_URIN_CD_T = cRsList.getString("SIR_URIN_CD");
			String SIR_ADD_LT_T = cRsList.getString("SIR_ADD_LT");
			String SIR_ZERO_LT_T = cRsList.getString("SIR_ZERO_LT");
			String ROWID_T = cRsList.getString("ROWID");
			String c25_T = cRsList.getString("c25");
%>
			<z:row
<%
			if(! CSM_MATT_NM_T.equals("")) {
%>
		 		CSM_MATT_NM='<%= CSM_MATT_NM_T%>'
<%
			}

			if(! CSM_INJA_CD_T.equals("")) {
%>
		 		CSM_INJA_CD='<%= CSM_INJA_CD_T%>'
<%
			}

			if(! SIR_INJA_NM_T.equals("")) {
%>
		 		SIR_INJA_NM='<%= SIR_INJA_NM_T%>'
<%
			}

			if(! SIR_EXAM_DT_T.equals("")) {
%>
		 		SIR_EXAM_DT='<%= SIR_EXAM_DT_T%>'
<%
			}

			if(! SIR_EXAM_SQ_T.equals("")) {
%>
		 		SIR_EXAM_SQ='<%= SIR_EXAM_SQ_T%>'
<%
			}

			if(! SIR_EXAM_CHA_T.equals("")) {
%>
		 		SIR_EXAM_CHA='<%= SIR_EXAM_CHA_T%>'
<%
			}

			if(! SIR_MATT_CD_T.equals("")) {
%>
		 		SIR_MATT_CD='<%= SIR_MATT_CD_T%>'
<%
			}

			if(! SIR_ORGA_CD_T.equals("")) {
%>
		 		SIR_ORGA_CD='<%= SIR_ORGA_CD_T%>'
<%
			}

			if(! SIR_MKJJ_CD_T.equals("")) {
%>
		 		SIR_MKJJ_CD='<%= SIR_MKJJ_CD_T%>'
<%
			}

			if(! SIR_SWING_CD_T.equals("")) {
%>
		 		SIR_SWING_CD='<%= SIR_SWING_CD_T%>'
<%
			}

			if(! SIR_CUST_NO_T.equals("")) {
%>
		 		SIR_CUST_NO='<%= SIR_CUST_NO_T%>'
<%
			}

			if(! SIR_EITEM_LT_T.equals("")) {
%>
		 		SIR_EITEM_LT='<%= SIR_EITEM_LT_T%>'
<%
			}

			if(! SIR_SITEM_LT_T.equals("")) {
%>
		 		SIR_SITEM_LT='<%= SIR_SITEM_LT_T%>'
<%
			}

			if(! SIR_EXAM_DT2_T.equals("")) {
%>
		 		SIR_EXAM_DT2='<%= SIR_EXAM_DT2_T%>'
<%
			}

			if(! SIR_EXAM_SQ2_T.equals("")) {
%>
		 		SIR_EXAM_SQ2='<%= SIR_EXAM_SQ2_T%>'
<%
			}

			if(! SIR_INPT_ID_T.equals("")) {
%>
		 		SIR_INPT_ID='<%= SIR_INPT_ID_T%>'
<%
			}

			if(! SIR_INPT_DTT_T.equals("")) {
%>
		 		SIR_INPT_DTT='<%= SIR_INPT_DTT_T%>'
<%
			}

			if(! SIR_MODI_ID_T.equals("")) {
%>
		 		SIR_MODI_ID='<%= SIR_MODI_ID_T%>'
<%
			}

			if(! SIR_MODI_DTT_T.equals("")) {
%>
		 		SIR_MODI_DTT='<%= SIR_MODI_DTT_T%>'
<%
			}

			if(! SIR_ETITEM_LT_T.equals("")) {
%>
		 		SIR_ETITEM_LT='<%= SIR_ETITEM_LT_T%>'
<%
			}

			if(! SIR_CBC_CD_T.equals("")) {
%>
		 		SIR_CBC_CD='<%= SIR_CBC_CD_T%>'
<%
			}

			if(! SIR_URIN_CD_T.equals("")) {
%>
		 		SIR_URIN_CD='<%= SIR_URIN_CD_T%>'
<%
			}

			if(! SIR_ADD_LT_T.equals("")) {
%>
		 		SIR_ADD_LT='<%= SIR_ADD_LT_T%>'
<%
			}

			if(! SIR_ZERO_LT_T.equals("")) {
%>
		 		SIR_ZERO_LT='<%= SIR_ZERO_LT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
				c25='<%= cnt%>'
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
