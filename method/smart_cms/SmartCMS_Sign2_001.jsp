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

		String SFRDT = htMethod.get("SFRDT");
		String STODT = htMethod.get("STODT");
		String GUBN1 = htMethod.get("GUBN1");
		String SDOC = htMethod.get("SDOC");

		//
		if(SFRDT == null) { SFRDT = ""; }
		if(STODT == null) { STODT = ""; }
		if(GUBN1 == null) { GUBN1 = ""; }
		if(SDOC == null) { SDOC = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select * From SL_SIGNLIST  
 Where SL_EXAM_DATE BetWeen :SFRDT and :STODT

if :GUBN1 <> 0 then
begin
And (SL_P1_CD = :SDOC  Or SL_P2_CD = :SDOC  Or
     SL_C1_CD = :SDOC  Or SL_C2_CD = :SDOC  Or
     SL_C3_CD = :SDOC  Or SL_C4_CD = :SDOC  Or
     SL_C5_CD = :SDOC  Or SL_C6_CD = :SDOC  Or
     SL_DT_CD = :SDOC  Or                                       
     SL_STP_CD = :SDOC Or SL_STD_CD = :SDOC Or
     SL_SP1_CD = :SDOC Or SL_SP2_CD = :SDOC)  
end;

Order By SL_EXAM_DATE, SL_EXAM_SQ
		*/

		sql = " SELECT *";
		sql += " FROM SL_SIGNLIST";
		sql += " WHERE SL_EXAM_DATE BETWEEN '" + SFRDT + "'";
		sql += " AND '" + STODT + "'";

		if(! GUBN1.equals("0")) {
			sql += " AND (";
			sql += "	SL_P1_CD = '" + SDOC + "'";
			sql += " OR SL_P2_CD = '" + SDOC + "'";
			sql += " OR SL_C1_CD = '" + SDOC + "'";
			sql += " OR SL_C2_CD = '" + SDOC + "'";
			sql += " OR SL_C3_CD = '" + SDOC + "'";
			sql += " OR SL_C4_CD = '" + SDOC + "'";
			sql += " OR SL_C5_CD = '" + SDOC + "'";
			sql += " OR SL_C6_CD = '" + SDOC + "'";
			sql += " OR SL_DT_CD = '" + SDOC + "'";
			sql += " OR SL_STP_CD = '" + SDOC + "'";
			sql += " OR SL_STD_CD = '" + SDOC + "'";
			sql += " OR SL_SP1_CD = '" + SDOC + "'";
			sql += " OR SL_SP2_CD = '" + SDOC + "'";
			sql += ")";
		}

		sql += " ORDER BY SL_EXAM_DATE, SL_EXAM_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : SmartCMS_Sign2_001 \n";
			G_INFO += "설명 : 검진의 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SFRDT : " + SFRDT + " \n";
			G_INFO += " STODT : " + STODT + " \n";
			G_INFO += " GUBN1 : " + GUBN1 + " \n";
			G_INFO += " SDOC : " + SDOC + " \n";
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
		<s:AttributeType name='SL_EXAM_DATE' rs:number='1' rs:writeunknown='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_EXAM_DATE'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SL_EXAM_SQ' rs:number='2' rs:writeunknown='true' rs:basetable='SL_SIGNLIST' rs:basecolumn='SL_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SL_P1_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='SL_SIGNLIST'
			 rs:basecolumn='SL_P1_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_P2_CD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='SL_SIGNLIST'
			 rs:basecolumn='SL_P2_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_C1_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='SL_SIGNLIST'
			 rs:basecolumn='SL_C1_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_C2_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='SL_SIGNLIST'
			 rs:basecolumn='SL_C2_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_C3_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='SL_SIGNLIST'
			 rs:basecolumn='SL_C3_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_C4_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='SL_SIGNLIST'
			 rs:basecolumn='SL_C4_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_C5_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='SL_SIGNLIST'
			 rs:basecolumn='SL_C5_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_DT_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='SL_SIGNLIST'
			 rs:basecolumn='SL_DT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_STP_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='SL_SIGNLIST'
			 rs:basecolumn='SL_STP_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_STD_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='SL_SIGNLIST'
			 rs:basecolumn='SL_STD_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_SP1_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='SL_SIGNLIST'
			 rs:basecolumn='SL_SP1_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='SL_SP2_CD' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='SL_SIGNLIST'
			 rs:basecolumn='SL_SP2_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='15' rs:rowid='true' rs:writeunknown='true' rs:basetable='SL_SIGNLIST'
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

			String SL_EXAM_DATE_T = cRsList.getString("SL_EXAM_DATE");
			String SL_EXAM_SQ_T = cRsList.getString("SL_EXAM_SQ");
			String SL_P1_CD_T = cRsList.getString("SL_P1_CD");
			String SL_P2_CD_T = cRsList.getString("SL_P2_CD");
			String SL_C1_CD_T = cRsList.getString("SL_C1_CD");
			String SL_C2_CD_T = cRsList.getString("SL_C2_CD");
			String SL_C3_CD_T = cRsList.getString("SL_C3_CD");
			String SL_C4_CD_T = cRsList.getString("SL_C4_CD");
			String SL_C5_CD_T = cRsList.getString("SL_C5_CD");
			String SL_DT_CD_T = cRsList.getString("SL_DT_CD");
			String SL_STP_CD_T = cRsList.getString("SL_STP_CD");
			String SL_STD_CD_T = cRsList.getString("SL_STD_CD");
			String SL_SP1_CD_T = cRsList.getString("SL_SP1_CD");
			String SL_SP2_CD_T = cRsList.getString("SL_SP2_CD");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! SL_EXAM_DATE_T.equals("")) {
%>
		 		SL_EXAM_DATE='<%= SL_EXAM_DATE_T%>'
<%
			}

			if(! SL_EXAM_SQ_T.equals("")) {
%>
		 		SL_EXAM_SQ='<%= SL_EXAM_SQ_T%>'
<%
			}

			if(! SL_P1_CD_T.equals("")) {
%>
		 		SL_P1_CD='<%= SL_P1_CD_T%>'
<%
			}

			if(! SL_P2_CD_T.equals("")) {
%>
		 		SL_P2_CD='<%= SL_P2_CD_T%>'
<%
			}

			if(! SL_C1_CD_T.equals("")) {
%>
		 		SL_C1_CD='<%= SL_C1_CD_T%>'
<%
			}

			if(! SL_C2_CD_T.equals("")) {
%>
		 		SL_C2_CD='<%= SL_C2_CD_T%>'
<%
			}

			if(! SL_C3_CD_T.equals("")) {
%>
		 		SL_C3_CD='<%= SL_C3_CD_T%>'
<%
			}

			if(! SL_C4_CD_T.equals("")) {
%>
		 		SL_C4_CD='<%= SL_C4_CD_T%>'
<%
			}

			if(! SL_C5_CD_T.equals("")) {
%>
		 		SL_C5_CD='<%= SL_C5_CD_T%>'
<%
			}

			if(! SL_DT_CD_T.equals("")) {
%>
		 		SL_DT_CD='<%= SL_DT_CD_T%>'
<%
			}

			if(! SL_STP_CD_T.equals("")) {
%>
		 		SL_STP_CD='<%= SL_STP_CD_T%>'
<%
			}

			if(! SL_STD_CD_T.equals("")) {
%>
		 		SL_STD_CD='<%= SL_STD_CD_T%>'
<%
			}

			if(! SL_SP1_CD_T.equals("")) {
%>
		 		SL_SP1_CD='<%= SL_SP1_CD_T%>'
<%
			}

			if(! SL_SP2_CD_T.equals("")) {
%>
		 		SL_SP2_CD='<%= SL_SP2_CD_T%>'
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
