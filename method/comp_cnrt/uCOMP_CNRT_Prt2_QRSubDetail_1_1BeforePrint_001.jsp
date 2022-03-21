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

		String COMP_CD = htMethod.get("COMP_CD");
		String MNGT_YR = htMethod.get("MNGT_YR");
		String CNRT_SQ = htMethod.get("CNRT_SQ");
		String PROF_SQ = htMethod.get("PROF_SQ");

		//
		if(COMP_CD == null) { COMP_CD = ""; }
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(CNRT_SQ == null) { CNRT_SQ = ""; }
		if(PROF_SQ == null) { PROF_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT * FROM ET_COMP_CNRT_OPTN
WHERE ECO_COMP_CD = :COMP_CD
  AND ECO_MNGT_YR = :MNGT_YR
  AND ECO_CNRT_SQ = :CNRT_SQ
  AND ECO_PROF_SQ = :PROF_SQ
ORDER BY ECO_OPTN_SQ
		*/

		sql = " SELECT *";
		sql += " FROM ET_COMP_CNRT_OPTN";
		sql += " WHERE ECO_COMP_CD = '" + COMP_CD + "'";
		sql += " AND ECO_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND ECO_CNRT_SQ = '" + CNRT_SQ + "'";
		sql += " AND ECO_PROF_SQ = '" + PROF_SQ + "'";
		sql += " ORDER BY ECO_OPTN_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCOMP_CNRT_Prt2_QRSubDetail_1_1BeforePrint_001 \n";
			G_INFO += "설명 : 검진유형 옵션항목 내역 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " COMP_CD : " + COMP_CD + " \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " CNRT_SQ : " + CNRT_SQ + " \n";
			G_INFO += " PROF_SQ : " + PROF_SQ + " \n";
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
		<s:AttributeType name='ECO_COMP_CD' rs:number='1' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_MNGT_YR' rs:number='2' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_CNRT_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_CNRT_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_PROF_SQ' rs:number='4' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_PROF_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_OPTN_SQ' rs:number='5' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_OPTN_NM' rs:number='6' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_NM'>
			<s:datatype dt:type='string' dt:maxLength='200' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_OPTN_CNT' rs:number='7' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN'
			 rs:basecolumn='ECO_OPTN_CNT'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_OPTN_PR' rs:number='8' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_OPTN_LT' rs:number='9' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_OPTN_LT'>
			<s:datatype dt:type='string' dt:maxLength='400' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_USE_YN' rs:number='10' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN' rs:basecolumn='ECO_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_NUSE_ID' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN'
			 rs:basecolumn='ECO_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_NUSE_DTT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN'
			 rs:basecolumn='ECO_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_INPT_ID' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN'
			 rs:basecolumn='ECO_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_INPT_DTT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN'
			 rs:basecolumn='ECO_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_MODI_ID' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN'
			 rs:basecolumn='ECO_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_MODI_DTT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN'
			 rs:basecolumn='ECO_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_TRNS_ID' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN'
			 rs:basecolumn='ECO_TRNS_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ECO_TRNS_DTT' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN'
			 rs:basecolumn='ECO_TRNS_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='19' rs:rowid='true' rs:writeunknown='true' rs:basetable='ET_COMP_CNRT_OPTN'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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

			String ECO_COMP_CD_T = cRsList.getString("ECO_COMP_CD");
			String ECO_MNGT_YR_T = cRsList.getString("ECO_MNGT_YR");
			String ECO_CNRT_SQ_T = cRsList.getString("ECO_CNRT_SQ");
			String ECO_PROF_SQ_T = cRsList.getString("ECO_PROF_SQ");
			String ECO_OPTN_SQ_T = cRsList.getString("ECO_OPTN_SQ");
			String ECO_OPTN_NM_T = cRsList.getString("ECO_OPTN_NM");
			String ECO_OPTN_CNT_T = cRsList.getString("ECO_OPTN_CNT");
			String ECO_OPTN_PR_T = cRsList.getString("ECO_OPTN_PR");
			String ECO_OPTN_LT_T = cRsList.getString("ECO_OPTN_LT");
			String ECO_USE_YN_T = cRsList.getString("ECO_USE_YN");
			String ECO_NUSE_ID_T = cRsList.getString("ECO_NUSE_ID");
			String ECO_NUSE_DTT_T = cRsList.getDate2("ECO_NUSE_DTT");
			String ECO_INPT_ID_T = cRsList.getString("ECO_INPT_ID");
			String ECO_INPT_DTT_T = cRsList.getDate2("ECO_INPT_DTT");
			String ECO_MODI_ID_T = cRsList.getString("ECO_MODI_ID");
			String ECO_MODI_DTT_T = cRsList.getDate2("ECO_MODI_DTT");
			String ECO_TRNS_ID_T = cRsList.getString("ECO_TRNS_ID");
			String ECO_TRNS_DTT_T = cRsList.getDate2("ECO_TRNS_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! ECO_COMP_CD_T.equals("")) {
%>
		 		ECO_COMP_CD='<%= ECO_COMP_CD_T%>'
<%
			}

			if(! ECO_MNGT_YR_T.equals("")) {
%>
		 		ECO_MNGT_YR='<%= ECO_MNGT_YR_T%>'
<%
			}

			if(! ECO_CNRT_SQ_T.equals("")) {
%>
		 		ECO_CNRT_SQ='<%= ECO_CNRT_SQ_T%>'
<%
			}

			if(! ECO_PROF_SQ_T.equals("")) {
%>
		 		ECO_PROF_SQ='<%= ECO_PROF_SQ_T%>'
<%
			}

			if(! ECO_OPTN_SQ_T.equals("")) {
%>
		 		ECO_OPTN_SQ='<%= ECO_OPTN_SQ_T%>'
<%
			}

			if(! ECO_OPTN_NM_T.equals("")) {
%>
		 		ECO_OPTN_NM='<%= ECO_OPTN_NM_T%>'
<%
			}

			if(! ECO_OPTN_CNT_T.equals("")) {
%>
		 		ECO_OPTN_CNT='<%= ECO_OPTN_CNT_T%>'
<%
			}

			if(! ECO_OPTN_PR_T.equals("")) {
%>
		 		ECO_OPTN_PR='<%= ECO_OPTN_PR_T%>'
<%
			}

			if(! ECO_OPTN_LT_T.equals("")) {
%>
		 		ECO_OPTN_LT='<%= ECO_OPTN_LT_T%>'
<%
			}

			if(! ECO_USE_YN_T.equals("")) {
%>
		 		ECO_USE_YN='<%= ECO_USE_YN_T%>'
<%
			}

			if(! ECO_NUSE_ID_T.equals("")) {
%>
		 		ECO_NUSE_ID='<%= ECO_NUSE_ID_T%>'
<%
			}

			if(! ECO_NUSE_DTT_T.equals("")) {
%>
		 		ECO_NUSE_DTT='<%= ECO_NUSE_DTT_T%>'
<%
			}

			if(! ECO_INPT_ID_T.equals("")) {
%>
		 		ECO_INPT_ID='<%= ECO_INPT_ID_T%>'
<%
			}

			if(! ECO_INPT_DTT_T.equals("")) {
%>
		 		ECO_INPT_DTT='<%= ECO_INPT_DTT_T%>'
<%
			}

			if(! ECO_MODI_ID_T.equals("")) {
%>
		 		ECO_MODI_ID='<%= ECO_MODI_ID_T%>'
<%
			}

			if(! ECO_MODI_DTT_T.equals("")) {
%>
		 		ECO_MODI_DTT='<%= ECO_MODI_DTT_T%>'
<%
			}

			if(! ECO_TRNS_ID_T.equals("")) {
%>
		 		ECO_TRNS_ID='<%= ECO_TRNS_ID_T%>'
<%
			}

			if(! ECO_TRNS_DTT_T.equals("")) {
%>
		 		ECO_TRNS_DTT='<%= ECO_TRNS_DTT_T%>'
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
