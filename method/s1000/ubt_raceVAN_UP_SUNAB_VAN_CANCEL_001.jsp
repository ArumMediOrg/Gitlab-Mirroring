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

		String RECE_NO = htMethod.get("RECE_NO");
		String APPR_NO = htMethod.get("APPR_NO");
		String APPR_DT = htMethod.get("APPR_DT");

		//
		if(RECE_NO == null) { RECE_NO = ""; }
		if(APPR_NO == null) { APPR_NO = ""; }
		if(APPR_DT == null) { APPR_DT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select RRM_OCCU_KD, RRM_RECE_PR, RRM_RECE_SEQ
from RT_RECE_MEDICHK
where RRM_RECE_NO = :RECE_NO
  and RRM_APPR_NO = :APPR_NO
  and RRM_APPR_DT = :APPR_DT
		*/

		sql = " SELECT RRM_OCCU_KD, RRM_RECE_PR, RRM_RECE_SEQ";
		sql += " FROM RT_RECE_MEDICHK";
		sql += " WHERE RRM_RECE_NO = '" + RECE_NO + "'";
		sql += " AND RRM_APPR_NO = '" + APPR_NO + "'";
		sql += " AND RRM_APPR_DT = '" + APPR_DT + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : ubt_raceVAN_UP_SUNAB_VAN_CANCEL_001 \n";
			G_INFO += "설명 : 승인취소-수납유형별,금액조회(카드승인번호) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " RECE_NO : " + RECE_NO + " \n";
			G_INFO += " APPR_NO : " + APPR_NO + " \n";
			G_INFO += " APPR_DT : " + APPR_DT + " \n";
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
		<s:AttributeType name='RRM_OCCU_KD' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_OCCU_KD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RECE_PR' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK'
			 rs:basecolumn='RRM_RECE_PR'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RECE_SEQ' rs:number='3' rs:writeunknown='true' rs:basetable='RT_RECE_MEDICHK' rs:basecolumn='RRM_RECE_SEQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='RT_RECE_MEDICHK' rs:basecolumn='ROWID'
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

			String RRM_OCCU_KD_T = cRsList.getString("RRM_OCCU_KD");
			String RRM_RECE_PR_T = cRsList.getString("RRM_RECE_PR");
			String RRM_RECE_SEQ_T = cRsList.getString("RRM_RECE_SEQ");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! RRM_OCCU_KD_T.equals("")) {
%>
		 		RRM_OCCU_KD='<%= RRM_OCCU_KD_T%>'
<%
			}

			if(! RRM_RECE_PR_T.equals("")) {
%>
		 		RRM_RECE_PR='<%= RRM_RECE_PR_T%>'
<%
			}

			if(! RRM_RECE_SEQ_T.equals("")) {
%>
		 		RRM_RECE_SEQ='<%= RRM_RECE_SEQ_T%>'
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
