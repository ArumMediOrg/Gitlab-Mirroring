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

		String sEXAM_DT = htMethod.get("sEXAM_DT");
		String eEXAM_DT = htMethod.get("eEXAM_DT");

		//
		if(sEXAM_DT == null) { sEXAM_DT = ""; }
		if(eEXAM_DT == null) { eEXAM_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " SELECT RRL_EXAM_DT, RRL_HOLI_CD, RRL_HOLI_NM FROM RT_RSVT_EQUIP_LIMIT";
		sql += " where RRL_EXAM_DT >= '" + sEXAM_DT + "'";
		sql += " and   RRL_EXAM_DT <= '" + eEXAM_DT + "'";
		sql += " and   RRL_EQUI_CD = '0' ";
		sql += " and   RRL_HOLI_CD = '3' ";
		sql += " GROUP BY RRL_EXAM_DT, RRL_HOLI_CD, RRL_HOLI_NM  ";

			//
		G_INFO += "<!-- \n";
		G_INFO += "서비스명 : uCRM_BASIC_UP_SetCalendar_001 \n";
		G_INFO += "설명 : 일자 Display \n";
		G_INFO += "\n\n";

		G_INFO += "전달인자 : \n";
		G_INFO += " sEXAM_DT : " + sEXAM_DT + " \n";
		G_INFO += " eEXAM_DT : " + eEXAM_DT + " \n";
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
		<s:AttributeType name='RRL_EXAM_DT' rs:number='1' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP_LIMIT' rs:basecolumn='RRL_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='RRL_HOLI_CD' rs:number='2' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP_LIMIT' rs:basecolumn='RRL_HOLI_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>

		<s:AttributeType name='RRL_HOLI_NM' rs:number='3' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP_LIMIT' rs:basecolumn='RRL_HOLI_NM'>
			<s:datatype dt:type='string' dt:maxLength='400' rs:maybenull='false'/>
		</s:AttributeType>
		
		<s:AttributeType name='ROWID' rs:number='4' rs:rowid='true' rs:writeunknown='true' rs:basetable='RT_RSVT_EQUIP_LIMIT'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String RRL_EXAM_DT = cRsList.getString("RRL_EXAM_DT");
			String RRL_HOLI_CD = cRsList.getString("RRL_HOLI_CD");
			String RRL_HOLI_NM = cRsList.getString("RRL_HOLI_NM");
			
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! RRL_EXAM_DT.equals("")) {
%>
		 		RRL_EXAM_DT='<%= RRL_EXAM_DT%>'
<%
			}

			if(! RRL_HOLI_CD.equals("")) {
%>
		 		RRL_HOLI_CD='<%= RRL_HOLI_CD%>'
<%
			}

			if(! RRL_HOLI_NM.equals("")) {
%>
		 		RRL_HOLI_NM='<%= RRL_HOLI_NM%>'
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
