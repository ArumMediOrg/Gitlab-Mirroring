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

		String MNGT_YR = htMethod.get("MNGT_YR");
		String ESTI_CD = htMethod.get("ESTI_CD");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ESTI_CD == null) { ESTI_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT BEE_MNGT_YR, BEE_ESTI_CD, BEE_COMP_CD, BEE_ESTI_NM, BEE_CALC_CD, BEE_ITKD_CD FROM BT_ESTIMATE
WHERE BEE_MNGT_YR = :MNGT_YR
   AND   BEE_ESTI_CD = :ESTI_CD

		*/

		sql = " SELECT BEE_MNGT_YR, BEE_ESTI_CD, BEE_COMP_CD, BEE_ESTI_NM, BEE_CALC_CD, BEE_ITKD_CD";
		sql += " FROM BT_ESTIMATE";
		sql += " WHERE BEE_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND BEE_ESTI_CD = '" + ESTI_CD + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTI_AGEA_APPLY_FormShow_001 \n";
			G_INFO += "설명 : 견적정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ESTI_CD : " + ESTI_CD + " \n";
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
		<s:AttributeType name='BEE_MNGT_YR' rs:number='1' rs:writeunknown='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='BEE_MNGT_YR'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEE_ESTI_CD' rs:number='2' rs:writeunknown='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='BEE_ESTI_CD'>
			<s:datatype dt:type='string' dt:maxLength='8' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEE_COMP_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTIMATE'
			 rs:basecolumn='BEE_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='BEE_ESTI_NM' rs:number='4' rs:writeunknown='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='BEE_ESTI_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEE_CALC_CD' rs:number='5' rs:writeunknown='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='BEE_CALC_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BEE_ITKD_CD' rs:number='6' rs:writeunknown='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='BEE_ITKD_CD'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='BT_ESTIMATE' rs:basecolumn='ROWID'
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

			String BEE_MNGT_YR_T = cRsList.getString("BEE_MNGT_YR");
			String BEE_ESTI_CD_T = cRsList.getString("BEE_ESTI_CD");
			String BEE_COMP_CD_T = cRsList.getString("BEE_COMP_CD");
			String BEE_ESTI_NM_T = cRsList.getString("BEE_ESTI_NM");
			String BEE_CALC_CD_T = cRsList.getString("BEE_CALC_CD");
			String BEE_ITKD_CD_T = cRsList.getString("BEE_ITKD_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! BEE_MNGT_YR_T.equals("")) {
%>
		 		BEE_MNGT_YR='<%= BEE_MNGT_YR_T%>'
<%
			}

			if(! BEE_ESTI_CD_T.equals("")) {
%>
		 		BEE_ESTI_CD='<%= BEE_ESTI_CD_T%>'
<%
			}

			if(! BEE_COMP_CD_T.equals("")) {
%>
		 		BEE_COMP_CD='<%= BEE_COMP_CD_T%>'
<%
			}

			if(! BEE_ESTI_NM_T.equals("")) {
%>
		 		BEE_ESTI_NM='<%= BEE_ESTI_NM_T%>'
<%
			}

			if(! BEE_CALC_CD_T.equals("")) {
%>
		 		BEE_CALC_CD='<%= BEE_CALC_CD_T%>'
<%
			}

			if(! BEE_ITKD_CD_T.equals("")) {
%>
		 		BEE_ITKD_CD='<%= BEE_ITKD_CD_T%>'
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
