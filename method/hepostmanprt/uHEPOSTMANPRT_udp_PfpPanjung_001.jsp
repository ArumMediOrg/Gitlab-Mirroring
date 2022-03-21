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

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select pfp_rview, pfp_bview, pfp_opin1, pfp_opin2, pfp_opin3, pfp_opin4 
from pt_fir_panjung 
where pfp_exam_dt = :exam_dt
   and pfp_exam_sq = :exam_sq

		*/

		sql = " SELECT PFP_RVIEW, PFP_BVIEW, PFP_OPIN1, PFP_OPIN2, PFP_OPIN3, PFP_OPIN4";
		sql += " FROM PT_FIR_PANJUNG";
		sql += " WHERE PFP_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND PFP_EXAM_SQ = '" + EXAM_SQ + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uHEPOSTMANPRT_udp_PfpPanjung_001 \n";
			G_INFO += "설명 : 1차 판정정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='PFP_RVIEW' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_RVIEW'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_BVIEW' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_BVIEW'>
			<s:datatype dt:type='string' dt:maxLength='1200'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_OPIN1' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_OPIN1'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_OPIN2' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_OPIN2'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_OPIN3' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_OPIN3'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_OPIN4' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='PT_FIR_PANJUNG'
			 rs:basecolumn='PFP_OPIN4'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='7' rs:rowid='true' rs:basetable='PT_FIR_PANJUNG' rs:basecolumn='ROWID'
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

			String PFP_RVIEW_T = cRsList.getString("PFP_RVIEW");
			String PFP_BVIEW_T = cRsList.getString("PFP_BVIEW");
			String PFP_OPIN1_T = cRsList.getString("PFP_OPIN1");
			String PFP_OPIN2_T = cRsList.getString("PFP_OPIN2");
			String PFP_OPIN3_T = cRsList.getString("PFP_OPIN3");
			String PFP_OPIN4_T = cRsList.getString("PFP_OPIN4");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! PFP_RVIEW_T.equals("")) {
%>
		 		PFP_RVIEW='<%= PFP_RVIEW_T%>'
<%
			}

			if(! PFP_BVIEW_T.equals("")) {
%>
		 		PFP_BVIEW='<%= PFP_BVIEW_T%>'
<%
			}

			if(! PFP_OPIN1_T.equals("")) {
%>
		 		PFP_OPIN1='<%= PFP_OPIN1_T%>'
<%
			}

			if(! PFP_OPIN2_T.equals("")) {
%>
		 		PFP_OPIN2='<%= PFP_OPIN2_T%>'
<%
			}

			if(! PFP_OPIN3_T.equals("")) {
%>
		 		PFP_OPIN3='<%= PFP_OPIN3_T%>'
<%
			}

			if(! PFP_OPIN4_T.equals("")) {
%>
		 		PFP_OPIN4='<%= PFP_OPIN4_T%>'
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
